#!/bin/sh
# Offline proof of check_sections.py on scratch configs and .tex files: every required heading present and in order, a heading missing, two headings swapped, a heading on a commented line, a heading in a brought-in file, a heading that differs in case and spacing, a heading the config does not name, an absent heading that is not required, a subsection, an input without its extension, a commented input inside the file it names, paths that hold a space, a heading broken over two lines, a config with no Sections table, a brought-in file that does not exist, a Required cell that is neither yes nor no, a file that brings itself in and a Sections table that lacks a column. Each case is kept because a wrong line accepts an application that lacks a required section or has its sections in the wrong order. Prints a last line starting PASS: and exits 0, or prints a line starting FAIL: and exits 1.
set -u

here=$(cd "$(dirname "$0")" && pwd)

if [ ! -f "$here/check_sections.py" ]; then
    echo "FAIL: $here/check_sections.py does not exist"
    exit 1
fi

scratch=$(mktemp -d "${TMPDIR:-/tmp}/check-sections-test.XXXXXX") || {
    echo "FAIL: could not create a scratch folder"
    exit 1
}
trap 'rm -rf "$scratch"' 0 1 2 3 15

output=$(python3 -B -I - "$here" "$scratch" 2>&1 <<'PYTHON'
import os
import subprocess
import sys

script = os.path.join(sys.argv[1], "check_sections.py")
scratch = sys.argv[2]
failures = []

CONFIG = """# Funder config

## Call

- Funder: a funder

## Sections

| Heading | Required | Limit | Unit | Source |
|---|---|---|---|---|
| (whole document) | yes | 10 | pages | the call, p. 1 |
| Changes to the earlier proposal | no | | | the call, p. 2 |
| Rationale and positioning | yes | | | the call, p. 2 |
| Research objectives | yes | 100 | words | the call, p. 2 |
| Methodology and work plan | yes | | | the call, p. 3 |

## Form fields

| Field | Limit | Unit | Source |
|---|---|---|---|

## Layout

- Font: not stated in the documents given

## Criteria

| Criterion | Descriptors | Source |
|---|---|---|
"""


def check(name, condition, detail=""):
    if not condition:
        failures.append(f"{name} {detail}".strip())


def write(name, text):
    path = os.path.join(scratch, name)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8", newline="") as handle:
        handle.write(text)
    return path


def run(config, tex):
    """(exit status, the lines of standard output, the lines of standard error)."""
    done = subprocess.run([sys.executable, "-B", script, config, tex], capture_output=True, text=True)
    return done.returncode, done.stdout.splitlines(), done.stderr.splitlines()


def body(*parts):
    return "\\documentclass{article}\n\\begin{document}\n" + "\n".join(parts) + "\n\\end{document}\n"


config = write("config.md", CONFIG)
RATIONALE = "\\section{Rationale and positioning}\nText."
OBJECTIVES = "\\section{Research objectives}\nText."
METHOD = "\\section{Methodology and work plan}\nText."
CHANGES = "\\section{Changes to the earlier proposal}\nText."

# S1: every required heading in the config's order gives one ok line per heading and exit 0.
status, out, err = run(config, write("s1/main.tex", body(CHANGES, RATIONALE, OBJECTIVES, METHOD)))
check("S1 exit status", status == 0, repr((status, out, err)))
check("S1 the lines", out == ["ok: Changes to the earlier proposal", "ok: Rationale and positioning", "ok: Research objectives", "ok: Methodology and work plan"], repr(out))

# S2: a required heading the .tex lacks is missing, exit 1.
status, out, err = run(config, write("s2/main.tex", body(CHANGES, RATIONALE, METHOD)))
check("S2 exit status", status == 1, repr((status, out, err)))
check("S2 the missing line", "missing: Research objectives" in out and "ok: Research objectives" not in out, repr(out))

# S3: two required headings swapped give an out of order line, exit 1.
status, out, err = run(config, write("s3/main.tex", body(CHANGES, OBJECTIVES, RATIONALE, METHOD)))
check("S3 exit status", status == 1, repr((status, out, err)))
check("S3 the out of order line", out == ["ok: Changes to the earlier proposal", "ok: Rationale and positioning", "out of order: Research objectives", "ok: Methodology and work plan"], repr(out))

# S4: a required heading that stands only on a commented line is missing; the control is the same heading uncommented.
commented = "% \\section{Research objectives}\nText with 50\\% of it."
status, out, err = run(config, write("s4/main.tex", body(CHANGES, RATIONALE, commented, METHOD)))
check("S4 exit status", status == 1, repr((status, out, err)))
check("S4 the commented heading is missing", "missing: Research objectives" in out, repr(out))
escaped = "Half, 50\\% \\section{Research objectives}\nText."
status, out, err = run(config, write("s4/control.tex", body(CHANGES, RATIONALE, escaped, METHOD)))
check("S4 control exit status", status == 0, repr((status, out, err)))
check("S4 control: the heading after an escaped percent sign is ok", "ok: Research objectives" in out, repr(out))

# S5: a required heading in a file brought in with \input is ok.
write("s5/parts/objectives.tex", OBJECTIVES + "\n")
status, out, err = run(config, write("s5/main.tex", body(CHANGES, RATIONALE, "\\input{parts/objectives.tex}", METHOD)))
check("S5 exit status", status == 0, repr((status, out, err)))
check("S5 the brought-in heading, in its place", out[2:3] == ["ok: Research objectives"], repr(out))

# S6: a heading that differs from the config's only in case and in spacing is ok.
spaced = "\\section{RESEARCH    objectives}\nText."
status, out, err = run(config, write("s6/main.tex", body(CHANGES, RATIONALE, spaced, METHOD)))
check("S6 exit status", status == 0, repr((status, out, err)))
check("S6 the line", "ok: Research objectives" in out, repr(out))

# S7: a heading of the .tex the config does not name is reported and is no failure.
status, out, err = run(config, write("s7/main.tex", body(CHANGES, RATIONALE, OBJECTIVES, METHOD, "\\section*{References}\nText.")))
check("S7 exit status", status == 0, repr((status, out, err)))
check("S7 the line", out[-1:] == ["not in the config: References"], repr(out))

# S8: a heading the config marks not required that the .tex lacks is no failure.
status, out, err = run(config, write("s8/main.tex", body(RATIONALE, OBJECTIVES, METHOD)))
check("S8 exit status", status == 0, repr((status, out, err)))
check("S8 the line", out[:1] == ["absent, not required: Changes to the earlier proposal"], repr(out))

# S9: a \subsection heading prints no line, also when its title is a heading of the config.
sub = "\\subsection{Aims}\nText.\n\\subsection{Research objectives}\nText."
status, out, err = run(config, write("s9/main.tex", body(CHANGES, RATIONALE, sub, METHOD)))
check("S9 exit status", status == 1, repr((status, out, err)))
check("S9 no line for a subsection", not any("Aims" in line for line in out) and "missing: Research objectives" in out, repr(out))

# S10: \input{part} reads part.tex.
write("s10/part.tex", OBJECTIVES + "\n")
status, out, err = run(config, write("s10/main.tex", body(CHANGES, RATIONALE, "\\input{part}", METHOD)))
check("S10 exit status", status == 0, repr((status, out, err)))
check("S10 the line", "ok: Research objectives" in out, repr(out))

# S11: an \input on a commented line inside the file it names brings nothing in, and the run ends.
write("s11/part.tex", "% \\input{part}\n" + OBJECTIVES + "\n")
status, out, err = run(config, write("s11/main.tex", body(CHANGES, RATIONALE, "\\input{part}", METHOD)))
check("S11 exit status", status == 0, repr((status, out, err)))
check("S11 the heading is read once", out.count("ok: Research objectives") == 1 and len(out) == 4, repr(out))

# S12: a config path and a .tex path that hold a space are read as given.
spaced_config = write("s12 folder/funder config.md", CONFIG)
status, out, err = run(spaced_config, write("s12 folder/my main.tex", body(CHANGES, RATIONALE, OBJECTIVES, METHOD)))
check("S12 exit status", status == 0, repr((status, out, err)))
check("S12 the lines", len(out) == 4 and all(line.startswith("ok: ") for line in out), repr(out))

# S13: a heading with a line break inside its braces is printed on one line.
broken = "\\section{An extra\n  heading}\nText."
status, out, err = run(config, write("s13/main.tex", body(CHANGES, RATIONALE, OBJECTIVES, METHOD, broken)))
check("S13 exit status", status == 0, repr((status, out, err)))
check("S13 the heading on one line", out[-1:] == ["not in the config: An extra heading"], repr(out))
broken_required = "\\section{Research\nobjectives}\nText."
status, out, err = run(config, write("s13/required.tex", body(CHANGES, RATIONALE, broken_required, METHOD)))
check("S13 a required heading broken over two lines is ok", status == 0 and "ok: Research objectives" in out, repr((status, out, err)))

# S14: a config with no Sections table gives one error line and exit 2.
no_table = write("s14/config.md", "# Funder config\n\n## Call\n\n- Funder: a funder\n\n## Sections\n\nNo table here.\n\n## Layout\n")
status, out, err = run(no_table, write("s14/main.tex", body(RATIONALE)))
check("S14 exit status", status == 2, repr((status, out, err)))
check("S14 one error line and nothing else", out == [] and len(err) == 1 and err[0].startswith("error: "), repr((out, err)))

# S15: a .tex that brings in a file that does not exist gives one error line and exit 2.
status, out, err = run(config, write("s15/main.tex", body(CHANGES, RATIONALE, "\\input{absent}", METHOD)))
check("S15 exit status", status == 2, repr((status, out, err)))
check("S15 one error line and nothing else", out == [] and len(err) == 1 and err[0].startswith("error: ") and "absent.tex" in err[0], repr((out, err)))

# S16: a Required cell that is neither yes nor no gives one error line and exit 2.
bad_required = write("s16/config.md", CONFIG.replace("| Rationale and positioning | yes |", "| Rationale and positioning | y |"))
status, out, err = run(bad_required, write("s16/main.tex", body(CHANGES, RATIONALE, OBJECTIVES, METHOD)))
check("S16 exit status", status == 2, repr((status, out, err)))
check("S16 one error line and nothing else", out == [] and len(err) == 1 and err[0].startswith("error: ") and "Rationale and positioning" in err[0], repr((out, err)))

# S17: a file that brings itself in gives one error line and exit 2, and the run ends.
write("s17/loop.tex", RATIONALE + "\n\\input{loop}\n")
status, out, err = run(config, write("s17/main.tex", body(CHANGES, "\\input{loop}", OBJECTIVES, METHOD)))
check("S17 exit status", status == 2, repr((status, out, err)))
check("S17 one error line and nothing else", out == [] and len(err) == 1 and err[0].startswith("error: ") and "loop.tex" in err[0], repr((out, err)))

# S18: a Sections table that lacks one of its columns gives one error line and exit 2.
no_unit = CONFIG.replace("| Heading | Required | Limit | Unit | Source |\n|---|---|---|---|---|", "| Heading | Required | Limit | Source |\n|---|---|---|---|")
check("S18 the config is changed", no_unit != CONFIG)
status, out, err = run(write("s18/config.md", no_unit), write("s18/main.tex", body(CHANGES, RATIONALE, OBJECTIVES, METHOD)))
check("S18 exit status", status == 2, repr((status, out, err)))
check("S18 one error line and nothing else", out == [] and len(err) == 1 and err[0].startswith("error: ") and "Unit" in err[0], repr((out, err)))

for failure in failures:
    print(failure)
sys.exit(1 if failures else 0)
PYTHON
)
status=$?

if [ "$status" -ne 0 ]; then
    printf '%s\n' "$output"
    echo "FAIL: check_sections.py does not hold the behaviour above"
    exit 1
fi

echo "PASS: check_sections.py prints ok for each heading of the config that the .tex holds in the config's order, missing for a required heading the .tex lacks or holds only on a commented line, out of order for a heading moved, absent for a heading that is not required, and not in the config for a heading the config does not name; it reads the files the .tex brings in, a name without its extension among them, matches a heading whatever its case and spacing, prints no line for a subsection, reads paths that hold a space, and exits 2 with one error line for a config with no Sections table, for a brought-in file that does not exist, for a Required cell that is neither yes nor no, for a file that brings itself in and for a Sections table that lacks a column"
