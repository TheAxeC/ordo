#!/bin/sh
# Start a builder as a detached process of its own, by the claude -p or codex exec recipe of
# plan-orchestration, and return as soon as that process has written its pid to the pid file.
#
# Launch. The claude and codex modes check their options. They make every path option absolute from
# the caller's directory, before the claude recipe changes into --cwd. So a path names the same file
# for both harnesses. They take an exclusive lock (flock) on <pid file>.lock and write their pid
# into it. They refuse with exit 75 before anything starts. They do so while another live launch or
# run holds that lock. They also do so while the pid file names a live process. The lock is held by
# the launcher, the session leader, the builder's runner and the runner's guard, each for as long as
# it lives. The builder, the session scanner and the note calls do not hold it. The system releases
# the lock once all of its holders have ended. A lock file left by a run that has ended is then
# taken over, whatever pid it still names. So a launch is refused while a killed run's runner or
# guard lives. A killed run therefore never writes an exit file after a later launch removed it. The
# launch then removes an exit file and the temporary files an earlier run left. It starts this
# script again in the matching internal mode (_body_claude, _body_codex) as the leader of a new
# session. It does so through perl's POSIX::setsid, since macOS has no setsid command and perl ships
# on macOS and Linux alike. The session leader writes its own pid to the pid file, and the launch
# returns once it has.
#
# Body. The session leader runs the launch note's start with --pid set to its own pid, the builder,
# the note's end, then writes the exit file, and lives until all of that is done. Its own errors
# and the builder's go to the --stderr file. The builder runs in a process group of its own inside
# the session, under a runner. TERM, INT or HUP sent to the leader stops the builder: TERM to its
# process group, to every process descended from it and to every other process of the leader's
# session (found by session id with python3's os.getsid), KILL one second later to whatever is
# left. A signal that arrives while the builder or a note call is being started, before the
# leader has its pid, is acted on as soon as the pid is known. The runner sets its TERM, INT and
# HUP handlers before it forks the builder, so no builder outlives a signal that reaches the
# runner. The exit file then says exit 128 plus the signal number, or the builder's own code when
# it had already ended, and end is called.
#
# Exit file. Every stop once the builder's runner has started leaves an exit file. After a stop on
# TERM, INT or HUP, the runner writes it once it has stopped the builder. The leader then moves its
# own file, holding the same line, into place over the runner's. When the builder had already ended,
# the leader writes its code before it stops a running end. When the leader is killed while the
# builder runs, the runner sees its parent gone. It then stops the builder and the session within
# about 3 seconds at most and writes exit 137. When the builder had ended, it writes the builder's
# own code instead. When the builder ends while the leader lives, its runner leaves a guard process
# holding the builder's code, and exits. The leader calls end and then writes the exit file. The
# guard ignores TERM, INT and HUP. It waits for the leader however long the leader lives. The
# leader's pid is not reused while its process group lives, and the guard is in that group. The
# guard ends within about a tenth of a second of the leader. It then writes the builder's code if no
# exit file is present. It also removes a temporary file the leader left. So a KILL while end runs,
# or during the leader's write, still leaves the exit file. The runner and the guard never replace
# an exit file present. Only a KILL before the builder's runner has started leaves none, as a KILL
# while start runs does. A process that starts a session of its own (setsid) is no longer in the
# leader's session and is not reached by these stops. Each writer writes <exit file>.tmp.<its pid>
# and moves it into place. So a monitor never reads the file empty, and no two writers share a
# temporary file. A KILL during the leader's write after a stop on a signal leaves
# <exit file>.tmp.<leader pid>, which the next launch removes.
#
# Session id. A first claude launch generates a session id (a random version 4 UUID), passes it to
# claude -p --session-id, and writes it to the --session-file, when one is given, before the
# builder starts. With --resume the builder continues the session of that id, as a repair round
# does, and the --session-file receives that id. A resumed run is recorded by the note as a new
# record under the same label.
#
# Allow list. A claude launch takes --allow-file, a file of command prefixes, one per line (the
# lines allow_list.py beside this script prints). The builder runs under --permission-mode
# acceptEdits. That mode refuses a script or a test that no rule allows. A print-mode run cannot
# ask for approval. So each line that is not blank, stripped of surrounding blanks, reaches claude
# as --allowedTools "Bash(<line>:*)". The builder may then run that command with any further
# arguments. No rule can hold a quote, $, a backtick, a backslash, (, ), {, }, [, ], a comma, * or
# ?. Claude cuts such a rule apart or ignores it, so a line holding one is refused. A claude launch
# without --allow-file is a usage error before anything starts. So is a file that is missing,
# unreadable, has no line that is not blank, or has a refused line. The file is read again when the
# builder starts, a resumed run included. A codex builder takes no allow list: its sandbox confines
# it.
#
# Note. With no launch-note command, or an empty one, the recipe's command runs alone. Every call
# to the note (start, end, transcript) is a record only: a call that fails is ignored, and a call
# that has not returned after 3 seconds is stopped with its whole process group, so the builder,
# the exit file and the caller of transcript never wait on it longer. A stopped start counts as a
# failed one, and end and transcript are then not called. The transcript mode passes a transcript
# or rollout path to the note. The note command's interface is in launch-note.md beside this
# script.
#
# Needs perl and python3.
#
# Exit status: 0 launched, or the transcript passed on; 1 the lock, stderr, pid or session file
# cannot be written, or the detached process ended before it wrote the pid file (its errors are in
# the stderr file); 64 a usage error; 75 refused, since a launch or a run of the same pid file is
# live.

set -u

self=$0

# The characters no line of the allow file may hold, as a bracket expression for grep.
unruly='[]["'"'"'$`\\(){},*?]'
# A carriage return, which a line of the allow file may hold only at its end.
cr=$(printf '\r')

usage() {
    cat >&2 <<EOF
Usage: $self claude --cwd <dir> --model <model> --prompt <file> --report <file> --stderr <file>
           --exit <file> --pid <file> [--session-file <file>] --allow-file <file>
           [--resume <session id>]
           [--note <command> --id <file> --label <entry>/<step> --parent <session id>]
       $self codex --cwd <dir> --model <model> --prompt <file> --report <file> --stderr <file>
           --exit <file> --pid <file> --events <file> --effort <effort> [--network]
           [--resume <session id>]
           [--note <command> --id <file> --label <entry>/<step> --parent <session id>]
       $self transcript --note <command> --id <file> <path>
EOF
    exit 64
}

fail_usage() {
    printf '%s: %s\n' "$self" "$1" >&2
    usage
}

[ "$#" -ge 1 ] || usage
mode=$1
shift

case "$mode" in
    claude | codex | _body_claude | _body_codex | transcript) ;;
    *) fail_usage "unknown mode $mode" ;;
esac

opt_cwd='' opt_model='' opt_prompt='' opt_report='' opt_stderr='' opt_exit='' opt_pid=''
opt_events='' opt_effort='' opt_network=0
opt_note='' opt_id='' opt_label='' opt_parent='' opt_resume=''
opt_session_file='' opt_session_id='' opt_allow_file=''
opt_path=''

while [ "$#" -gt 0 ]; do
    case "$1" in
        --network)
            opt_network=1
            shift
            ;;
        --cwd | --model | --prompt | --report | --stderr | --exit | --pid | --events | --effort | \
            --note | --id | --label | --parent | --resume | --session-file | --session-id | \
            --allow-file)
            [ "$#" -ge 2 ] || fail_usage "$1 needs a value"
            name=$1
            value=$2
            shift 2
            case "$name" in
                --cwd) opt_cwd=$value ;;
                --model) opt_model=$value ;;
                --prompt) opt_prompt=$value ;;
                --report) opt_report=$value ;;
                --stderr) opt_stderr=$value ;;
                --exit) opt_exit=$value ;;
                --pid) opt_pid=$value ;;
                --events) opt_events=$value ;;
                --effort) opt_effort=$value ;;
                --note) opt_note=$value ;;
                --id) opt_id=$value ;;
                --label) opt_label=$value ;;
                --parent) opt_parent=$value ;;
                --resume)
                    case "$value" in
                        '' | -*)
                            fail_usage "--resume needs a session id, not ${value:-an empty value}"
                            ;;
                    esac
                    opt_resume=$value
                    ;;
                --session-file)
                    [ -n "$value" ] || fail_usage "--session-file needs a file name, not an empty value"
                    opt_session_file=$value
                    ;;
                --allow-file)
                    [ -n "$value" ] ||
                        fail_usage "--allow-file needs a file name, not an empty value"
                    opt_allow_file=$value
                    ;;
                --session-id)
                    # Internal: the launch hands the generated id to the claude body.
                    [ "$mode" = _body_claude ] || fail_usage "unknown option $name"
                    opt_session_id=$value
                    ;;
            esac
            ;;
        --*)
            fail_usage "unknown option $1"
            ;;
        *)
            [ "$mode" = transcript ] || fail_usage "unexpected argument $1"
            [ -z "$opt_path" ] || fail_usage "unexpected argument $1"
            opt_path=$1
            shift
            ;;
    esac
done

# A launch-note command is an absolute path, so it resolves the same before and after the claude
# recipe changes directory.
[ -z "$opt_note" ] || case "$opt_note" in
    /*) ;;
    *) fail_usage "--note must be an absolute path" ;;
esac

# runner <seconds> <watch pid> <what> <exit file> <command...>: run the command in a process group
# of its own and pass on its exit code (128 plus the signal number when a signal ended it). With
# seconds above 0 (a note call), the command's standard error goes to /dev/null, and when it has not
# returned by then its group and every process descended from it are killed, a line naming <what>
# goes to standard error, and the exit code is 124. With seconds 0 (the builder), the processes
# stopped also include every process of the runner's session when <watch pid> leads that session,
# found by their session ids (python3's os.getsid, since ps prints no session id on macOS) through
# one python3 process the runner starts with the builder and asks over a pipe, so a stop starts no
# interpreter; the leader, the runner and that process are left out, and a session <watch pid> does
# not lead is never swept. That process runs the interpreter LAUNCH_PYTHON names. The launch sets it
# to the interpreter python3 resolves to. A version manager's python3 on PATH is a wrapper, which
# can take seconds to start on a loaded machine. The command does not see LAUNCH_PYTHON. TERM, INT
# or HUP to the runner, from the moment it starts, sends TERM to all of these. One second later, or
# as soon as they have all ended, the runner looks for them once more, sends KILL to what is left,
# and exits 128 plus the signal number. When <watch pid> is no longer the runner's parent (the
# leader or the caller has gone), the runner stops the command the same way, so a leader killed with
# KILL leaves no builder process behind. A stop waits at most two seconds for the scanner's answers.
# Past that, the runner stops the scanner and goes on with the processes descended from the command.
# The builder's runner is given the <exit file>, and a note call passes an empty one. After a stop
# on a signal, the runner writes exit 128 plus the signal number. After a stop on its parent gone,
# it writes exit 137. When the command ends on its own after its parent has gone, it writes the
# command's code. When the command ends while its parent lives, the builder's runner forks a guard
# and exits. The guard ignores HUP, INT and TERM. It checks every tenth of a second whether
# <watch pid> lives. Once that pid is gone, it writes the command's code and removes
# <exit file>.tmp.<watch pid>. The guard first checks that its process group is <watch pid>. When it
# is not, it says so on standard error and exits without writing. Its wait would then rest on a pid
# that can be reused. No write replaces a file present. The launch's lock descriptor, named by
# LAUNCH_LOCK_FD, is held by the builder's runner and its guard. The handle perl opens on it is
# closed on exec, so the builder and the scanner do not inherit it. When that handle cannot be
# opened, the runner closes the descriptor, says so on standard error and goes on without the lock.
# A note call's runner closes the descriptor before anything else.
runner='
use strict;
use warnings;
use POSIX ();
use Time::HiRes ();
use IPC::Open2 ();
use IO::Select ();
my ($limit, $watch, $what, $exit_file) = splice @ARGV, 0, 4;
my $lock_fd = delete $ENV{LAUNCH_LOCK_FD};
my $lock;
if (defined $lock_fd && $lock_fd =~ /^\d+$/) {
    if ($limit > 0) {
        POSIX::close($lock_fd);
    } elsif (!open $lock, "+<&=", $lock_fd) {
        print STDERR "launch.sh: cannot hold the lock on descriptor $lock_fd: $!\n";
        POSIX::close($lock_fd);
    }
}
my $session_py = q{
import os, subprocess, sys
sid = os.getsid(0)
lead = sid == int(sys.argv[1])
skip = set(int(a) for a in sys.argv[2:])
skip.add(os.getpid())
skip.add(sid)
for request in sys.stdin:
    if lead:
        out = subprocess.run(["ps", "-ax", "-o", "pid="], stdout=subprocess.PIPE,
                             universal_newlines=True)
        for word in out.stdout.split():
            p = int(word)
            if p in skip:
                continue
            try:
                if os.getsid(p) == sid:
                    print(p)
            except OSError:
                pass
    print("end", flush=True)
};
my $got = 0;
$SIG{HUP} = sub { $got ||= 1 };
$SIG{INT} = sub { $got ||= 2 };
$SIG{TERM} = sub { $got ||= 15 };
my $pid = fork;
defined $pid or die "launch.sh: cannot start $what: $!\n";
if (!$pid) {
    setpgrp(0, 0);
    $SIG{$_} = "DEFAULT" for qw(HUP INT QUIT TERM);
    delete $ENV{LAUNCH_PYTHON};
    open STDERR, ">", "/dev/null" if $limit > 0;
    exec { $ARGV[0] } @ARGV or do {
        print STDERR "launch.sh: cannot run $ARGV[0]: $!\n";
        POSIX::_exit(127);
    };
}
setpgrp($pid, $pid);
my ($scan_out, $scan_in, $scanner);
if ($limit == 0) {
    $scanner = eval {
        my $python = $ENV{LAUNCH_PYTHON} || "python3";
        IPC::Open2::open2($scan_out, $scan_in, $python, "-B", "-c", $session_py, $watch, "$$");
    };
}
sub descendants {
    my ($root) = @_;
    my %kids;
    open my $ps, "-|", "ps", "-A", "-o", "pid=", "-o", "ppid=" or return ();
    while (<$ps>) {
        my ($p, $pp) = split;
        push @{ $kids{$pp} }, $p if defined $pp;
    }
    close $ps;
    my (@out, @todo);
    @todo = ($root);
    while (@todo) {
        for my $k (@{ $kids{ shift @todo } || [] }) {
            push @out, $k;
            push @todo, $k;
        }
    }
    return @out;
}
sub drop_scanner {
    kill "KILL", $scanner;
    close $scan_in;
    close $scan_out;
    waitpid($scanner, 0);
    $scanner = undef;
}
sub session_members {
    my ($until) = @_;
    return () unless $scanner;
    local $SIG{PIPE} = "IGNORE";
    print {$scan_in} "scan\n" or return ();
    $scan_in->flush or return ();
    my $ready = IO::Select->new($scan_out);
    my $answer = "";
    while ($answer !~ /^end\n/m) {
        my $left = $until - Time::HiRes::time();
        if ($left <= 0) {
            print STDERR "launch.sh: the session scanner did not answer within 2 seconds\n";
            drop_scanner();
            return ();
        }
        next unless $ready->can_read($left);
        my $got_bytes = sysread $scan_out, $answer, 4096, length $answer;
        next if !defined $got_bytes && $!{EINTR};
        last unless $got_bytes;
    }
    return $answer =~ /^(\d+)$/mg;
}
sub members {
    my ($until) = @_;
    return (descendants($pid), session_members($until));
}
sub stop {
    my ($grace) = @_;
    my $until = Time::HiRes::time() + 2;
    my %seen = map { $_ => 1 } members($until);
    if ($grace) {
        kill "-TERM", $pid;
        kill "TERM", keys %seen;
        my $end_of_grace = Time::HiRes::time() + 1;
        while (Time::HiRes::time() < $end_of_grace) {
            waitpid($pid, POSIX::WNOHANG());
            last unless kill(0, -$pid) || grep { kill 0, $_ } keys %seen;
            Time::HiRes::sleep(0.05);
        }
    }
    $seen{$_} = 1 for members($until);
    kill "-KILL", $pid;
    kill "KILL", keys %seen;
    waitpid($pid, 0);
}
sub publish {
    my ($code) = @_;
    return if $exit_file eq "" || -e $exit_file;
    my $tmp = "$exit_file.tmp.$$";
    my $f;
    if (!open($f, ">", $tmp) || !print({$f} "exit $code\n") || !close($f)) {
        print STDERR "launch.sh: cannot write $tmp: $!\n";
        unlink $tmp;
        return;
    }
    link($tmp, $exit_file) or -e $exit_file or rename($tmp, $exit_file);
    unlink $tmp;
}
sub guard {
    my ($code) = @_;
    my $guard = fork;
    if (!defined $guard) {
        print STDERR "launch.sh: cannot start the guard of the exit file: $!\n";
        return;
    }
    return if $guard;
    $SIG{$_} = "IGNORE" for qw(HUP INT TERM);
    if (getpgrp() != $watch) {
        print STDERR "launch.sh: the guard is not in process group $watch; ",
            "it writes no exit file\n";
        POSIX::_exit(0);
    }
    if ($scanner) {
        close $scan_in;
        close $scan_out;
    }
    open STDIN, "<", "/dev/null";
    open STDOUT, ">", "/dev/null";
    Time::HiRes::sleep(0.1) while kill 0, $watch;
    publish($code);
    unlink "$exit_file.tmp.$watch";
    POSIX::_exit(0);
}
sub code_of {
    my ($s) = @_;
    return $s & 127 ? 128 + ($s & 127) : $s >> 8;
}
my $start = Time::HiRes::time();
while (1) {
    if (waitpid($pid, POSIX::WNOHANG()) == $pid) {
        my $code = code_of($?);
        if (getppid() == $watch) {
            guard($code) if $exit_file ne "";
        } else {
            publish($code);
        }
        exit $code;
    }
    if ($got) {
        stop(1);
        publish(128 + $got);
        exit 128 + $got;
    }
    if (getppid() != $watch) {
        stop(1);
        publish(137);
        exit 129;
    }
    if ($limit > 0 && Time::HiRes::time() - $start >= $limit) {
        stop(0);
        print STDERR "launch.sh: $what did not return within $limit seconds and was stopped\n";
        exit 124;
    }
    Time::HiRes::sleep(0.05);
}
'

# detach <pid file> <command...>: start the command as the leader of a new session, with HUP, INT,
# QUIT and TERM at their defaults whatever the caller left ignored, so the body can trap them, and
# return once the pid file holds its pid: exit 0 then, exit 1 when it ends before writing it. The
# pid file is read after the check for an ended process, so one that writes it and ends at once
# is a launch. The session leader keeps the lock's descriptor open, so it holds the lock while it
# lives, and passes its number on in LAUNCH_LOCK_FD.
detach='
use strict;
use warnings;
use POSIX ();
use Time::HiRes ();
my $pid_file = shift @ARGV;
my $pid = fork;
defined $pid or die "launch.sh: cannot start $ARGV[0]: $!\n";
if (!$pid) {
    defined POSIX::setsid() or do {
        print STDERR "launch.sh: cannot start a new session: $!\n";
        POSIX::_exit(126);
    };
    delete $ENV{LAUNCH_LOCK};
    $SIG{$_} = "DEFAULT" for qw(HUP INT QUIT TERM);
    exec { $ARGV[0] } @ARGV or do {
        print STDERR "launch.sh: cannot run $ARGV[0]: $!\n";
        POSIX::_exit(127);
    };
}
while (1) {
    my $ended = waitpid($pid, POSIX::WNOHANG()) == $pid;
    if (open my $f, "<", $pid_file) {
        my $line = <$f>;
        exit 0 if defined $line && $line =~ /^(\d+)$/ && $1 == $pid;
    }
    exit 1 if $ended;
    Time::HiRes::sleep(0.02);
}
'

# take_lock <lock file> <command...>: hold an exclusive lock (flock) on the lock file, write this
# process's pid into it, and run the command with the lock's descriptor still open, its path in
# LAUNCH_LOCK and its number in LAUNCH_LOCK_FD. The system releases the lock when the last holder
# of the descriptor ends, so a lock left by a run that has ended is free, whatever pid the file
# still names. A lock held by a live launch or run refuses with exit 75, naming the pid in the file,
# the launcher's.
take_lock='
use strict;
use warnings;
use Fcntl qw(:flock);
my $lock = shift @ARGV;
$^F = 1023;
open my $fh, "+>>", $lock or do {
    print STDERR "launch.sh: cannot open $lock: $!\n";
    exit 1;
};
if (!flock($fh, LOCK_EX | LOCK_NB)) {
    seek $fh, 0, 0;
    my $holder = <$fh>;
    $holder = "unknown" unless defined $holder && $holder =~ /^(\d+)$/;
    chomp $holder;
    print STDERR "launch.sh: another launch (pid $holder) holds $lock; not launched\n";
    exit 75;
}
truncate $fh, 0;
seek $fh, 0, 0;
print $fh "$$\n";
$fh->flush;
$ENV{LAUNCH_LOCK} = $lock;
$ENV{LAUNCH_LOCK_FD} = fileno $fh;
exec { $ARGV[0] } @ARGV or die "launch.sh: cannot run $ARGV[0]: $!\n";
'

# A random version 4 UUID, in lower case.
new_uuid='
open my $r, "<", "/dev/urandom" or die "launch.sh: cannot read /dev/urandom: $!\n";
read($r, my $b, 16) == 16 or die "launch.sh: short read from /dev/urandom\n";
my @x = unpack "C16", $b;
$x[6] = $x[6] & 0x0f | 0x40;
$x[8] = $x[8] & 0x3f | 0x80;
printf "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x\n", @x;
'

# note_call <call> <arguments...>: one bounded call to the launch-note command. note_exec is the
# same call replacing the shell that runs it, for a call started with &, so that its pid is the
# runner's and a signal sent to it reaches the runner.
note_call() {
    perl -e "$runner" 3 "$$" "the launch note's $1 call" '' "$opt_note" "$@"
}

note_exec() {
    exec perl -e "$runner" 3 "$$" "the launch note's $1 call" '' "$opt_note" "$@"
}

# The id the note's start wrote, first line only, or a failure when there is none.
read_id() {
    [ -n "$opt_note" ] && [ -n "$opt_id" ] && [ -s "$opt_id" ] || return 1
    note_id=$(head -n 1 "$opt_id")
    [ -n "$note_id" ]
}

here=$(pwd -P)

# abs_path <path>: sets abs to the path made absolute from the caller's directory.
abs_path() {
    case "$1" in
        /* | '') abs=$1 ;;
        *) abs=$here/$1 ;;
    esac
}

require_launch_options() {
    for pair in "cwd:$opt_cwd" "model:$opt_model" "prompt:$opt_prompt" "report:$opt_report" \
        "stderr:$opt_stderr" "exit:$opt_exit" "pid:$opt_pid"; do
        [ -n "${pair#*:}" ] || fail_usage "--${pair%%:*} is required"
    done
    case "$mode" in
        codex | _body_codex)
            [ -n "$opt_events" ] || fail_usage "--events is required for codex"
            [ -n "$opt_effort" ] || fail_usage "--effort is required for codex"
            [ -z "$opt_session_file" ] || fail_usage "--session-file is for claude only"
            [ -z "$opt_allow_file" ] || fail_usage "--allow-file is for claude only"
            ;;
        *)
            [ -z "$opt_events" ] || fail_usage "--events is for codex only"
            [ -z "$opt_effort" ] || fail_usage "--effort is for codex only"
            [ "$opt_network" -eq 0 ] || fail_usage "--network is for codex only"
            [ -n "$opt_allow_file" ] || fail_usage "--allow-file is required for claude"
            ;;
    esac
    if [ -n "$opt_note" ]; then
        [ -n "$opt_id" ] || fail_usage "--id is required with --note"
        [ -n "$opt_label" ] || fail_usage "--label is required with --note"
        [ -n "$opt_parent" ] || fail_usage "--parent is required with --note"
    fi
    abs_path "$opt_cwd"
    opt_cwd=$abs
    abs_path "$opt_prompt"
    opt_prompt=$abs
    abs_path "$opt_report"
    opt_report=$abs
    abs_path "$opt_stderr"
    opt_stderr=$abs
    abs_path "$opt_exit"
    opt_exit=$abs
    abs_path "$opt_pid"
    opt_pid=$abs
    abs_path "$opt_events"
    opt_events=$abs
    abs_path "$opt_id"
    opt_id=$abs
    abs_path "$opt_session_file"
    opt_session_file=$abs
    abs_path "$opt_allow_file"
    opt_allow_file=$abs
    if [ -n "$opt_allow_file" ]; then
        [ -f "$opt_allow_file" ] && [ -r "$opt_allow_file" ] ||
            fail_usage "--allow-file names no readable file: $opt_allow_file"
        grep -q '[^[:space:]]' "$opt_allow_file" ||
            fail_usage "--allow-file names a file with no command: $opt_allow_file"
        refused=$(grep -m 1 -e "$unruly" "$opt_allow_file")
        [ -z "$refused" ] ||
            fail_usage "--allow-file holds a line with a character no rule can hold: $refused"
        refused=$(grep -n -m 1 -e "$cr[[:space:]]*[^[:space:]]" "$opt_allow_file" | cut -d: -f1)
        [ -z "$refused" ] ||
            fail_usage "--allow-file holds a carriage return inside line $refused"
    fi
}

# The builders run in a subshell started with &, so the claude recipe's change of directory stays
# inside it, and through the runner, so each builder has a process group of its own. Their
# standard error is the body's, the --stderr file. The claude builder gets one --allowedTools
# argument per line of the allow file that is not blank, stripped of surrounding blanks, the last
# line read even without a newline.
run_claude() {
    set -- -p
    if [ -n "$opt_resume" ]; then
        set -- "$@" --resume "$opt_resume"
    else
        set -- "$@" --session-id "$opt_session_id"
    fi
    set -- "$@" --model "$opt_model" --permission-mode acceptEdits --output-format json
    while IFS= read -r line || [ -n "$line" ]; do
        line=${line#"${line%%[![:space:]]*}"}
        line=${line%"${line##*[![:space:]]}"}
        [ -z "$line" ] || set -- "$@" --allowedTools "Bash($line:*)"
    done <"$opt_allow_file" || exit
    cd "$opt_cwd" || exit
    exec perl -e "$runner" 0 "$$" 'the builder' "$opt_exit" claude "$@" \
        <"$opt_prompt" >"$opt_report"
}

# codex exec resume takes no -C and no -s, so a resumed codex builder runs in --cwd with the sandbox
# set through -c.
run_codex() {
    if [ -n "$opt_resume" ]; then
        set -- exec resume -c 'sandbox_mode="workspace-write"'
    else
        set -- exec -C "$opt_cwd" -s workspace-write
    fi
    [ "$opt_network" -eq 0 ] || set -- "$@" -c "sandbox_workspace_write.network_access=true"
    set -- "$@" -c "model_reasoning_effort=\"$opt_effort\"" -m "$opt_model" -o "$opt_report" --json
    if [ -n "$opt_resume" ]; then
        cd "$opt_cwd" || exit
        set -- "$@" "$opt_resume"
    fi
    exec perl -e "$runner" 0 "$$" 'the builder' "$opt_exit" codex "$@" - \
        <"$opt_prompt" >"$opt_events"
}

write_exit() {
    printf 'exit %s\n' "$1" >"$opt_exit.tmp.$$" && mv -f "$opt_exit.tmp.$$" "$opt_exit"
}

# The signal path of the body: stop what runs (the builder, or a note call), write the exit file,
# then close the note's record when start made one and end has not been called. The signal goes
# on to the running process as it came, so the builder's runner, which writes the exit file itself
# once it has stopped the builder, writes the code the leader writes. When the builder has already
# ended (a signal during end), its code is written first, and end is stopped after. A signal that
# arrives while a process is being started, before its pid is in running, is kept in pending and
# acted on as soon as the pid is known.
on_signal() {
    if [ -n "$spawning" ]; then
        pending=$1
        return
    fi
    trap '' HUP INT TERM
    [ -z "$status" ] || write_exit "$status"
    if [ -n "$running" ]; then
        kill -"$1" "$running" 2>/dev/null
        wait "$running"
    fi
    [ "$note_state" != starting ] || true >"$opt_id"
    code=${status:-$((128 + $1))}
    [ -n "$status" ] || write_exit "$code"
    if [ "$note_state" = open ] && read_id; then
        note_state=closed
        note_call end "$note_id" >/dev/null
    fi
    exit "$code"
}

# spawned <pid>: record the pid of the process just started with &, then act on a signal that
# arrived while it was being started.
spawned() {
    running=$1
    spawning=''
    [ -z "$pending" ] || on_signal "$pending"
}

run_body() {
    harness=$1
    status='' running='' note_state='' spawning='' pending=''
    trap 'on_signal 1' HUP
    trap 'on_signal 2' INT
    trap 'on_signal 15' TERM
    { printf '%s\n' "$$" >"$opt_pid.tmp" && mv -f "$opt_pid.tmp" "$opt_pid"; } || exit 1
    if [ -n "$opt_note" ]; then
        note_state=starting
        spawning=1
        note_exec start --launcher plan-orchestration --label "$opt_label" --harness "$harness" \
            --model "$opt_model" --parent "$opt_parent" --cwd "$opt_cwd" --pid "$$" >"$opt_id" &
        spawned "$!"
        if wait "$running" && read_id; then
            note_state=open
        else
            true >"$opt_id"
            note_state=''
        fi
        running=''
    fi
    spawning=1
    "run_$harness" &
    spawned "$!"
    wait "$running"
    status=$?
    running=''
    if [ "$note_state" = open ]; then
        note_state=closed
        note_exec end "$note_id" >/dev/null &
        running=$!
        wait "$running"
        running=''
    fi
    write_exit "$status"
}

case "$mode" in
    claude | codex)
        require_launch_options
        lock=$opt_pid.lock
        if [ "${LAUNCH_LOCK:-}" != "$lock" ]; then
            set -- "$mode" --cwd "$opt_cwd" --model "$opt_model" --prompt "$opt_prompt" \
                --report "$opt_report" --stderr "$opt_stderr" --exit "$opt_exit" --pid "$opt_pid"
            [ "$mode" = claude ] || set -- "$@" --events "$opt_events" --effort "$opt_effort"
            [ "$opt_network" -eq 0 ] || set -- "$@" --network
            [ -z "$opt_resume" ] || set -- "$@" --resume "$opt_resume"
            [ -z "$opt_session_file" ] || set -- "$@" --session-file "$opt_session_file"
            [ -z "$opt_allow_file" ] || set -- "$@" --allow-file "$opt_allow_file"
            [ -z "$opt_note" ] ||
                set -- "$@" --note "$opt_note" --id "$opt_id" --label "$opt_label" --parent "$opt_parent"
            exec perl -e "$take_lock" "$lock" sh "$self" "$@"
        fi
        unset LAUNCH_LOCK
        if [ -s "$opt_pid" ]; then
            old_pid=$(head -n 1 "$opt_pid")
            case "$old_pid" in
                '' | *[!0-9]* | 0) ;;
                *)
                    if kill -0 "$old_pid" 2>/dev/null; then
                        printf '%s: %s names pid %s, which is still running; not launched\n' \
                            "$self" "$opt_pid" "$old_pid" >&2
                        exit 75
                    fi
                    ;;
            esac
        fi
        true >"$opt_stderr" || exit 1
        true >"$opt_pid" || exit 1
        rm -f "$opt_exit" "$opt_exit".tmp.*
        LAUNCH_PYTHON=$(python3 -B -c 'import sys; print(sys.executable)' 2>/dev/null) ||
            LAUNCH_PYTHON=''
        export LAUNCH_PYTHON
        set -- "_body_$mode" --cwd "$opt_cwd" --model "$opt_model" --prompt "$opt_prompt" \
            --report "$opt_report" --stderr "$opt_stderr" --exit "$opt_exit" --pid "$opt_pid"
        [ "$mode" = claude ] || set -- "$@" --events "$opt_events" --effort "$opt_effort"
        [ "$opt_network" -eq 0 ] || set -- "$@" --network
        [ -z "$opt_allow_file" ] || set -- "$@" --allow-file "$opt_allow_file"
        [ -z "$opt_note" ] ||
            set -- "$@" --note "$opt_note" --id "$opt_id" --label "$opt_label" --parent "$opt_parent"
        if [ -n "$opt_resume" ]; then
            set -- "$@" --resume "$opt_resume"
            session=$opt_resume
        elif [ "$mode" = claude ]; then
            session=$(perl -e "$new_uuid") || exit 1
            set -- "$@" --session-id "$session"
        fi
        if [ -n "$opt_session_file" ]; then
            printf '%s\n' "$session" >"$opt_session_file" || exit 1
            [ "$(cat "$opt_session_file")" = "$session" ] || {
                printf '%s: %s does not hold the session id written to it\n' "$self" \
                    "$opt_session_file" >&2
                exit 1
            }
        fi
        if ! perl -e "$detach" "$opt_pid" sh "$self" "$@" </dev/null >/dev/null 2>"$opt_stderr"; then
            printf '%s: the detached process ended before it wrote %s; its errors are in %s\n' \
                "$self" "$opt_pid" "$opt_stderr" >&2
            exit 1
        fi
        ;;
    _body_claude | _body_codex)
        require_launch_options
        [ "$mode" = _body_codex ] || [ -n "$opt_resume" ] || [ -n "$opt_session_id" ] ||
            fail_usage "--session-id is required for a first claude run"
        run_body "${mode#_body_}"
        ;;
    transcript)
        for pair in "cwd:$opt_cwd" "model:$opt_model" "prompt:$opt_prompt" "report:$opt_report" \
            "stderr:$opt_stderr" "exit:$opt_exit" "pid:$opt_pid" "events:$opt_events" \
            "effort:$opt_effort" "label:$opt_label" "parent:$opt_parent" "resume:$opt_resume" \
            "session-file:$opt_session_file" "allow-file:$opt_allow_file"; do
            [ -z "${pair#*:}" ] || fail_usage "--${pair%%:*} is not a transcript option"
        done
        [ "$opt_network" -eq 0 ] || fail_usage "--network is not a transcript option"
        [ -z "$opt_note" ] || [ -n "$opt_id" ] || fail_usage "--id is required with --note"
        [ -n "$opt_path" ] || fail_usage "the transcript path is required"
        if read_id; then
            note_call transcript "$note_id" "$opt_path" >/dev/null || :
        fi
        ;;
esac
