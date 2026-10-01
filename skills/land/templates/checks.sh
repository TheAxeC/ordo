#!/bin/sh
# Runs a plan's verify list and says whether every command in it exited 0.
#
# Input: sh <the land skill's folder>/templates/checks.sh <state file>, started from the root of
# the checkout it checks. The list is the verify: key of the state file's first fenced block whose
# info word is yaml or yml (any case). Needs python3 with PyYAML, and bash.
#
# Output: each command runs in order through bash -o pipefail -c '<command>', from the directory
# checks.sh was started in, with standard input from /dev/null. Every command runs, whatever the
# exit status of the one before. Before each command it prints "$ <command>" on a line of its own,
# then the command's standard output and error together.
#
# After the output of a command that exits non-zero, it prints "checks: failed with exit
# <status>: <command>". A command ended by signal n has status 128+n. When the command's output
# does not end with a newline, that line continues the output's last line.
#
# After the last command it prints "checks: <n> commands passed" when none failed, and "checks:
# <k> of <n> commands failed" when k did. A refusal is printed on standard error as a line
# starting "checks: ".
#
# A signal that ends checks.sh itself ends the run with no count line, and its exit status is 128
# plus the signal's number. An interrupt (SIGINT, as Ctrl-C sends) also prints Python's
# KeyboardInterrupt traceback on standard error, and its exit status is 130.
#
# Exit status:
#   0  every command exited 0.
#   1  one or more commands exited non-zero.
#   2  refused before running anything: no argument or more than one; python3, its yaml module or
#      bash missing; a state file that is missing, unreadable or not UTF-8; no yaml block, or a
#      first yaml block that is not closed or not valid YAML; no verify: key, a verify: that is not
#      a list, an empty list, or an item that is not a non-empty string or that holds a NUL
#      character.
#   128+n  a signal n ended checks.sh itself; no count line is printed.

set -u

[ "$#" -eq 1 ] || {
    printf 'checks: usage: sh <the land skill folder>/templates/checks.sh <state file>\n' >&2
    exit 2
}
command -v python3 >/dev/null 2>&1 || {
    printf 'checks: python3 is not on PATH\n' >&2
    exit 2
}
command -v bash >/dev/null 2>&1 || {
    printf 'checks: bash is not on PATH\n' >&2
    exit 2
}

program='
import re, subprocess, sys

path = sys.argv[1]

def refuse(message):
    sys.stderr.write("checks: " + message + "\n")
    sys.exit(2)

try:
    import yaml
except ImportError:
    refuse("python3 cannot import yaml; install PyYAML")

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

if not isinstance(data, dict) or "verify" not in data:
    refuse("the first yaml block of " + path + " has no verify: key")
commands = data["verify"]
if not isinstance(commands, list):
    refuse("the verify: key of " + path + " is not a list")
if not commands:
    refuse("the verify: list of " + path + " is empty")
for number, command in enumerate(commands, 1):
    where = "item " + str(number) + " of the verify: list of " + path
    if not isinstance(command, str) or not command.strip():
        refuse(where + " is not a non-empty string")
    if "\0" in command:
        refuse(where + " holds a NUL character")

failures = 0
for command in commands:
    sys.stdout.write("$ " + command + "\n")
    sys.stdout.flush()
    code = subprocess.call(["bash", "-o", "pipefail", "-c", command],
                           stdin=subprocess.DEVNULL, stdout=sys.stdout.fileno(),
                           stderr=subprocess.STDOUT)
    if code != 0:
        status = 128 - code if code < 0 else code
        sys.stdout.write("checks: failed with exit " + str(status) + ": " + command + "\n")
        failures += 1

if failures:
    sys.stdout.write("checks: " + str(failures) + " of " + str(len(commands))
                     + " commands failed\n")
    sys.exit(1)
sys.stdout.write("checks: " + str(len(commands)) + " commands passed\n")
'

exec python3 -c "$program" "$1"
