#!/bin/sh
# Run a plan's verify list: the verify: key of the first yaml or yml block of its state file (any
# case of the fence word), in order, each command from the directory the runner is started in (the
# root of the checkout it checks). Needs python3 with PyYAML, which reads the list and starts the
# commands, bash, which runs them, and ps, which finds a command's process groups on a signal.
#
# Each command, stripped of trailing whitespace, runs as written through bash -o pipefail -c, so a
# pipeline fails when any of its stages fails, and a test that exits non-zero in a pipeline into
# tail makes the pipeline fail however the pipe is spelled. The runner judges the status the whole
# command returns, so a command that consumes a pipeline's status itself (!, if, while, ||, or a
# pipeline sent to the background with &) passes or fails on what it returns. A command whose text
# after its last single pipe (not ||) is a tail stage (tail, or a path ending in /tail, then
# options with no ";" and no newline after them) prints a test's summary: it passes only when it
# exits 0 and its last output line starts with PASS:, and that line is printed.
# Any other command, one ending in "; true" included, passes when it exits 0, and its whole output
# is printed. The first red command prints RED: <command>, its exit status and its whole output,
# and stops the run.
#
# Each command runs in a session of its own with standard input from /dev/null and its standard
# output and error captured together. On INT, HUP, QUIT or TERM the runner sends TERM to every
# process group of the command's session (found with ps), then KILL two seconds later, removes its
# scratch folder and exits 128 plus the signal number. It behaves the same under sh, bash or dash,
# since the shell part only checks its argument and its tools and then hands over to python3.
#
# Usage: sh utils/verify.sh <state file>
#
# Exit status:
#   0    every command passed.
#   1    a command is red, or the scratch folder cannot be created under $TMPDIR (default /tmp).
#   64   no single argument; a state file that cannot be read or is not UTF-8; no yaml block, or a
#        first yaml block that is never closed or is not valid YAML; no verify: key, a verify: key
#        that is not a list, or an empty list; a command that is not a string, is empty or holds
#        a NUL character.
#   69   python3, its yaml module (PyYAML), bash or ps is missing.
#   128+n  signal n (INT, HUP, QUIT or TERM) stopped the run.

set -u

[ $# -eq 1 ] || {
    printf 'verify: usage: sh utils/verify.sh <state file>\n' >&2
    exit 64
}
command -v python3 >/dev/null 2>&1 || {
    printf 'verify: python3 is not on PATH\n' >&2
    exit 69
}
command -v bash >/dev/null 2>&1 || {
    printf 'verify: bash is not on PATH\n' >&2
    exit 69
}
command -v ps >/dev/null 2>&1 || {
    printf 'verify: ps is not on PATH\n' >&2
    exit 69
}

program='
import os, re, shutil, signal, subprocess, sys, tempfile, time

path = sys.argv[1]
out = sys.stdout.buffer
stopping = (signal.SIGINT, signal.SIGHUP, signal.SIGQUIT, signal.SIGTERM)
scratch = None
running = None

def say(data):
    out.write(data)
    out.flush()

def refuse(message):
    sys.stderr.write("verify: " + message + "\n")
    sys.exit(64)

# The process groups of the live processes in session sid. ps lists every process with its group
# and getsid keeps those of the session; getsid fails on a zombie, so zombies drop out.
def session_groups(sid):
    listing = subprocess.run(["ps", "-A", "-o", "pid=,pgid="], stdout=subprocess.PIPE,
                             stderr=subprocess.DEVNULL, text=True).stdout
    groups = set()
    for line in listing.splitlines():
        pid, group = (int(field) for field in line.split())
        try:
            if os.getsid(pid) == sid:
                groups.add(group)
        except OSError:
            pass
    return groups

# Sends signal number to every process group of session sid, first the group the leader
# heads. A group that is gone answers ESRCH; on macOS a group of zombies only answers EPERM.
def signal_session(sid, number):
    for group in [sid] + sorted(session_groups(sid) - {sid}):
        try:
            os.killpg(group, number)
        except (ProcessLookupError, PermissionError):
            pass

# Ends the session the command with this pid leads: TERM to each of its process groups, KILL to
# those left two seconds later, and the leader reaped.
def end_session(sid):
    signal_session(sid, signal.SIGTERM)
    deadline = time.monotonic() + 2
    while time.monotonic() < deadline:
        try:
            os.waitpid(sid, os.WNOHANG)
        except ChildProcessError:
            pass
        if not session_groups(sid):
            break
        time.sleep(0.05)
    signal_session(sid, signal.SIGKILL)
    try:
        os.waitpid(sid, 0)
    except ChildProcessError:
        pass

def stop(number, frame):
    if running is not None:
        end_session(running)
    if scratch is not None:
        shutil.rmtree(scratch, ignore_errors=True)
    os._exit(128 + number)

for number in stopping:
    signal.signal(number, stop)

try:
    import yaml
except ImportError:
    sys.stderr.write("verify: python3 cannot import yaml; install PyYAML\n")
    sys.exit(69)

try:
    with open(path, encoding="utf-8") as handle:
        lines = handle.read().split("\n")
except UnicodeDecodeError:
    refuse("the state file " + path + " is not UTF-8")
except OSError as error:
    refuse("cannot read the state file " + path + ": " + (error.strerror or str(error)))

fence_open = re.compile(r"^ {0,3}(`{3,}|~{3,})\s*([^`\s]*)[^`]*$")
fence = None
block = None
for line in lines:
    if fence is None:
        match = fence_open.match(line)
        if match:
            fence = match.group(1)
            if match.group(2).lower() in ("yaml", "yml"):
                block = []
        continue
    if re.match(r"^ {0,3}" + fence[0] + "{" + str(len(fence)) + r",}\s*$", line):
        if block is not None:
            break
        fence = None
        continue
    if block is not None:
        block.append(line)
else:
    if block is None:
        refuse(path + " has no yaml block")
    refuse("the first yaml block of " + path + " is not closed")

try:
    data = yaml.safe_load("\n".join(block))
except yaml.YAMLError as error:
    refuse("the first yaml block of " + path + " is not valid YAML: "
           + str(error).replace("\n", " "))

if not isinstance(data, dict) or "verify" not in data or data["verify"] is None:
    refuse("the first yaml block of " + path + " has no verify: list")
commands = data["verify"]
if not isinstance(commands, list):
    refuse("the verify: key of " + path + " is not a list of commands")
if not commands:
    refuse("the verify: list of " + path + " is empty")
for number, command in enumerate(commands, 1):
    where = "command " + str(number) + " of the verify: list of " + path
    if not isinstance(command, str):
        refuse(where + " is not a string")
    if "\0" in command:
        refuse(where + " holds a NUL character")
    commands[number - 1] = command = command.rstrip()
    if not command:
        refuse(where + " is empty")

# A command prints a test summary when the text after its last single pipe, past any whitespace
# and backslash-newlines, is tail or a path ending in /tail, then options with no ; or newline.
tail_stage = re.compile(r"(?:\S*/)?tail(?:[ \t][^;|\n]*)?\Z")
def prints_summary(command):
    head, pipe, rest = command.rpartition("|")
    if not pipe or head.endswith("|"):
        return False
    return tail_stage.match(re.sub(r"\A(?:\s|\\\n)*", "", rest)) is not None

folder = os.environ.get("TMPDIR") or "/tmp"
try:
    scratch = tempfile.mkdtemp(prefix="verify.", dir=folder)
except OSError as error:
    sys.stderr.write("verify: cannot create a scratch folder in " + folder + ": "
                     + (error.strerror or str(error)) + "\n")
    sys.exit(1)
output = os.path.join(scratch, "output")

def unblock():
    signal.pthread_sigmask(signal.SIG_UNBLOCK, stopping)

status = 0
for command in commands:
    with open(output, "wb") as capture:
        signal.pthread_sigmask(signal.SIG_BLOCK, stopping)
        process = subprocess.Popen(["bash", "-o", "pipefail", "-c", command],
                                   stdin=subprocess.DEVNULL, stdout=capture,
                                   stderr=subprocess.STDOUT, start_new_session=True,
                                   preexec_fn=unblock)
        running = process.pid
        unblock()
        code = process.wait()
        running = None
    status = 128 - code if code < 0 else code
    with open(output, "rb") as capture:
        text = capture.read()
    body = text[:-1] if text.endswith(b"\n") else text
    last = body.rsplit(b"\n", 1)[-1]
    summary = prints_summary(command)
    reason = None
    if status == 0 and summary and not last.startswith(b"PASS:"):
        reason = b"last line does not start with PASS:\n"
    if status != 0 or reason:
        say(b"RED: " + command.encode("utf-8") + b"\n")
        say(b"exit status: " + str(status).encode() + b"\n")
        if reason:
            say(reason)
        say(text)
        status = 1
        break
    say(last + b"\n" if summary else text)

shutil.rmtree(scratch, ignore_errors=True)
if status == 0:
    say(b"verify: " + str(len(commands)).encode() + b" commands passed\n")
sys.exit(status)
'

exec python3 -c "$program" "$1"
