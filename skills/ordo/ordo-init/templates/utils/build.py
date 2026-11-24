#!/usr/bin/env python3
r"""The build driver: runs the build, test and check commands of this repository, and the gate.

Usage: build.py build|test|check|gate

The lists BUILD, TEST and CHECK below hold the commands, one shell command per string.
A command is added to its list as a string in double quotes, followed by a comma.
In that string each backslash is written \\ and each double quote is written \".
A comment stands on the lines above its string.
A string too long for one line is written as adjacent literals inside parentheses.
ROOT is the repository root, as a path from the folder that holds this file.

build, test and check each run the commands of their list in order.
Each command is printed as "$ <command>" on standard output before it runs.
It runs as bash -o pipefail -c <command>, from ROOT, with standard input from /dev/null.
The first command that exits non-zero ends the run.
A command ended by signal n has status 128+n.
gate runs build, then test, then check, and stops at the first that fails.
gate skips a list that holds no command.

Lines on standard output, in order with the output of the commands:

- "build.py <subcommand>: failed with exit <status>: <command>", after a failing command;
- "build.py <subcommand>: <n> commands passed", when every command of the list passed;
- "build.py <subcommand>: no command is named, skipped", for an empty list under gate;
- "build.py gate: <n> commands passed", when gate passed.

Lines on standard error:

- "usage: build.py build|test|check|gate", for no subcommand, an unknown one or an extra argument;
- "build.py <subcommand>: no command is named", for build, test or check on an empty list;
- "build.py gate: no command is named for build, test or check", when all three are empty;
- "build.py <subcommand>: cannot run bash: <reason>", when bash or ROOT cannot be reached.

The driver imports no file of the repository and writes no file.

Exit status:

- 0: every command run passed;
- the failing command's status, when it is between 1 and 125;
- 1: any other failing status, an empty list, or bash that cannot be run;
- 2: the usage.
"""

import subprocess
import sys
from pathlib import Path

ROOT = ".."

BUILD: list[str] = []

TEST: list[str] = []

CHECK: list[str] = []

LISTS = {"build": BUILD, "test": TEST, "check": CHECK}
USAGE = "usage: build.py build|test|check|gate"


class FailedCommandError(Exception):
    """A command of a list exited non-zero; status is the driver's exit status."""

    def __init__(self, status: int) -> None:
        super().__init__(status)
        self.status = status


def _passed(name: str, count: int) -> str:
    noun = "command" if count == 1 else "commands"
    return f"build.py {name}: {count} {noun} passed"


def run_list(name: str, commands: list[str], root: Path) -> int:
    """Run the commands from root in order, stop at the first that fails, return how many passed."""
    for command in commands:
        print(f"$ {command}", flush=True)
        try:
            code = subprocess.run(
                ["bash", "-o", "pipefail", "-c", command],
                cwd=root,
                stdin=subprocess.DEVNULL,
                check=False,
            ).returncode
        except OSError as error:
            print(f"build.py {name}: cannot run bash: {error}", file=sys.stderr, flush=True)
            raise FailedCommandError(1) from error
        if code != 0:
            status = 128 - code if code < 0 else code
            print(f"build.py {name}: failed with exit {status}: {command}", flush=True)
            raise FailedCommandError(status if 1 <= status <= 125 else 1)
    print(_passed(name, len(commands)), flush=True)
    return len(commands)


def main(arguments: list[str]) -> int:
    if len(arguments) != 1 or arguments[0] not in (*LISTS, "gate"):
        print(USAGE, file=sys.stderr)
        return 2
    name = arguments[0]
    root = (Path(__file__).resolve().parent / ROOT).resolve()
    try:
        if name != "gate":
            if not LISTS[name]:
                print(f"build.py {name}: no command is named", file=sys.stderr)
                return 1
            run_list(name, LISTS[name], root)
            return 0
        if not any(LISTS.values()):
            print("build.py gate: no command is named for build, test or check", file=sys.stderr)
            return 1
        passed = 0
        for part, commands in LISTS.items():
            if not commands:
                print(f"build.py {part}: no command is named, skipped", flush=True)
                continue
            passed += run_list(part, commands, root)
        print(_passed("gate", passed), flush=True)
        return 0
    except FailedCommandError as failure:
        return failure.status


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
