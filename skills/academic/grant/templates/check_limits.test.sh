#!/bin/sh
# Offline proof of check_limits.py on scratch configs, LaTeX logs, .tex files and grant-fields.md files: the page count of the log against a limit in pages, a log statement of one page and one broken over two lines, a section's words against its limit, what the count leaves out (a comment, a command's name, a citation, a label, a figure file) and what it keeps (the text inside a command's braces, the words after an escaped percent sign, a subsection's text, a brought-in file), the count of the whole document, a form field's characters and words under its heading in grant-fields.md (a line break as one character whatever the line endings, the empty lines at both ends left out, the count ended at the next heading, a deeper heading counted, a byte-order mark and a space after the heading read past), the rows it does not check, a run with - as the PDF, with and without a main .tex, the configs, the grant-fields.md files and the missing log it refuses, and paths that hold a space. Each case is kept because a wrong count accepts an application that is over a limit of the funder. Prints a last line starting PASS: and exits 0, or prints a line starting FAIL: and exits 1.
set -u

here=$(cd "$(dirname "$0")" && pwd)

if [ ! -f "$here/check_limits.py" ]; then
    echo "FAIL: $here/check_limits.py does not exist"
    exit 1
fi

scratch=$(mktemp -d "${TMPDIR:-/tmp}/check-limits-test.XXXXXX") || {
    echo "FAIL: could not create a scratch folder"
    exit 1
}
trap 'rm -rf "$scratch"' 0 1 2 3 15

output=$(python3 -B -I - "$here" "$scratch" 2>&1 <<'PYTHON'
import os
import subprocess
import sys

script = os.path.join(sys.argv[1], "check_limits.py")
scratch = sys.argv[2]
failures = []


def check(name, condition, detail=""):
    if not condition:
        failures.append(f"{name} {detail}".strip())


def write(name, text):
    path = os.path.join(scratch, name)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8", newline="") as handle:
        handle.write(text)
    return path


def config(name, sections, fields=()):
    """A funder config whose Sections and Form fields tables hold the rows given."""
    lines = ["# Funder config", "", "## Call", "", "- Funder: a funder", "", "## Sections", ""]
    lines += ["| Heading | Required | Limit | Unit | Source |", "|---|---|---|---|---|"]
    lines += [f"| {heading} | {required} | {limit} | {unit} | the call, p. 1 |" for heading, required, limit, unit in sections]
    lines += ["", "## Form fields", "", "| Field | Limit | Unit | Source |", "|---|---|---|---|"]
    lines += [f"| {field} | {limit} | {unit} | the form, p. 1 |" for field, limit, unit in fields]
    lines += ["", "## Layout", "", "- Font: not stated in the documents given", "", "## Criteria", ""]
    return write(name, "\n".join(lines) + "\n")


def run(config_path, pdf, tex):
    """(exit status, the lines of standard output, the lines of standard error)."""
    done = subprocess.run([sys.executable, "-B", script, config_path, pdf, tex], capture_output=True, text=True)
    return done.returncode, done.stdout.splitlines(), done.stderr.splitlines()


def body(*parts):
    return "\\documentclass{article}\n\\title{A title}\n\\begin{document}\n" + "\n".join(parts) + "\n\\end{document}\n"


def log(name, statement):
    """A LaTeX log with the statement given, and the path of the PDF it stands beside."""
    write(name + ".log", "This is pdfTeX\n(./main.tex\n" + statement + "\nTranscript written on main.log.\n")
    return os.path.join(scratch, name + ".pdf")


def one_error(out, err):
    return out == [] and len(err) == 1 and err[0].startswith("error: ")


OBJECTIVES = ("Research objectives", "yes")
SECTION = "\\section{Research objectives}\n"
NEXT = "\\section{Methodology and work plan}\nSix seven eight nine.\n"
no_pdf = os.path.join(scratch, "none.pdf")

# L1: a log of 10 pages against a limit of 10 pages is ok; 11 pages is over.
pages = config("l1/config.md", [("(whole document)", "yes", "10", "pages")])
tex = write("l1/main.tex", body(SECTION + "Text."))
status, out, err = run(pages, log("l1/ten/main", "Output written on main.pdf (10 pages, 123456 bytes)."), tex)
check("L1 ten pages", status == 0 and out == ["ok: (whole document): 10 pages of 10"], repr((status, out, err)))
status, out, err = run(pages, log("l1/eleven/main", "Output written on main.pdf (11 pages, 123456 bytes)."), tex)
check("L1 eleven pages", status == 1 and out == ["over: (whole document): 11 pages of 10"], repr((status, out, err)))

# L2: a section of 120 words against a limit of 100 words is over; the control is a limit of 150.
words = " ".join(f"word{n}" for n in range(120))
tex = write("l2/main.tex", body(SECTION + words + ".", NEXT))
status, out, err = run(config("l2/over.md", [OBJECTIVES + ("100", "words")]), no_pdf, tex)
check("L2 over", status == 1 and out == ["over: Research objectives: 120 words of 100"], repr((status, out, err)))
status, out, err = run(config("l2/ok.md", [OBJECTIVES + ("150", "words")]), no_pdf, tex)
check("L2 control", status == 0 and out == ["ok: Research objectives: 120 words of 150"], repr((status, out, err)))

# L3: the words of a comment and the name of a command are not counted, and the words inside its braces are.
limit = config("l3/config.md", [OBJECTIVES + ("100", "words")])
tex = write("l3/main.tex", body(SECTION + "Alpha beta % gamma delta\n\\emph{epsilon zeta} eta."))
status, out, err = run(limit, no_pdf, tex)
check("L3 the count", status == 0 and out == ["ok: Research objectives: 5 words of 100"], repr((status, out, err)))

# L4: the words after an escaped percent sign are counted, and the sign is a character of the text.
tex = write("l4/main.tex", body(SECTION + "In 50\\% of the\n   cases it holds."))
status, out, err = run(limit, no_pdf, tex)
check("L4 the words", status == 0 and out == ["ok: Research objectives: 7 words of 100"], repr((status, out, err)))
status, out, err = run(config("l4/characters.md", [OBJECTIVES + ("100", "characters")]), no_pdf, tex)
check("L4 the characters", status == 0 and out == ["ok: Research objectives: 29 characters of 100"], repr((status, out, err)))

# L5: a citation, a label and a figure file add no word.
cited = "One \\cite{key} two \\citep[p.~4]{other} \\label{x} three.\n\\includegraphics[width=1cm]{figs/a}\n\\begin{tikzpicture}\n\\node {drawn words here};\n\\end{tikzpicture}"
tex = write("l5/main.tex", body(SECTION + cited))
status, out, err = run(limit, no_pdf, tex)
check("L5 the count", status == 0 and out == ["ok: Research objectives: 3 words of 100"], repr((status, out, err)))

# L6: the text after a \subsection counts in the section, and the count ends at the next \section.
tex = write("l6/main.tex", body(SECTION + "One two.\n\\subsection{Aims}\nThree four five.", NEXT))
both = config("l6/config.md", [OBJECTIVES + ("100", "words"), ("Methodology and work plan", "yes", "3", "words")])
status, out, err = run(both, no_pdf, tex)
check("L6 the counts", status == 1 and out == ["ok: Research objectives: 6 words of 100", "over: Methodology and work plan: 4 words of 3"], repr((status, out, err)))

# L7: the text of a brought-in file is counted where it is brought in.
write("l7/more.tex", "Three four five. % six\n")
tex = write("l7/main.tex", body(SECTION + "One two.\n\\input{more}", NEXT))
status, out, err = run(limit, no_pdf, tex)
check("L7 the count", status == 0 and out == ["ok: Research objectives: 5 words of 100"], repr((status, out, err)))

# L8: the row (whole document) with a limit in words takes the count of the document body.
tex = write("l8/main.tex", body(SECTION + "One two three."))
status, out, err = run(config("l8/over.md", [("(whole document)", "yes", "4", "words")]), no_pdf, tex)
check("L8 over", status == 1 and out == ["over: (whole document): 5 words of 4"], repr((status, out, err)))
status, out, err = run(config("l8/ok.md", [("(whole document)", "yes", "5", "words")]), no_pdf, tex)
check("L8 ok", status == 0 and out == ["ok: (whole document): 5 words of 5"], repr((status, out, err)))

# L9: a required section with a word limit that the .tex lacks is not checked, and is no failure.
tex = write("l9/main.tex", body(NEXT))
status, out, err = run(limit, no_pdf, tex)
check("L9 not checked", status == 0 and len(out) == 1 and out[0].startswith("not checked: Research objectives: "), repr((status, out, err)))

# L10: a form field with no heading in grant-fields.md is not checked, and is no failure. A heading that differs from the Field in case alone is no heading for it.
field = config("l10/config.md", [], [("Abstract", "240", "characters")])
tex = write("l10/main.tex", body(SECTION + "Text."))
write("l10/grant-fields.md", "## Title\nA title\n\n## abstract\nA text.\n")
status, out, err = run(field, no_pdf, tex)
check("L10 not checked", status == 0 and out == ["not checked: Abstract: grant-fields.md has no heading for it"], repr((status, out, err)))

# L11: a log statement of one page, and one broken across two lines, are read.
tex = write("l11/main.tex", body(SECTION + "Text."))
status, out, err = run(pages, log("l11/one/main", "Output written on main.pdf (1 page, 2345 bytes)."), tex)
check("L11 one page", status == 0 and out == ["ok: (whole document): 1 pages of 10"], repr((status, out, err)))
status, out, err = run(pages, log("l11/broken/main", "Output written on a/long/folder/name/main.pdf (12 pag\nes, 2345 bytes)."), tex)
check("L11 a broken statement", status == 1 and out == ["over: (whole document): 12 pages of 10"], repr((status, out, err)))

# L12: a form field of 126 characters under its heading is ok against 240 and over against 100. The text has two lines, so its line break counts as one character, and the line before the first heading belongs to no field.
text = "a" * 60 + "\n" + "b" * 65
tex = write("l12/main.tex", body(SECTION + "Text."))
write("l12/grant-fields.md", "The texts of the form.\n\n## Title\n" + text + "\n")
status, out, err = run(config("l12/ok.md", [], [("Title", "240", "characters")]), no_pdf, tex)
check("L12 ok", status == 0 and out == ["ok: Title: 126 characters of 240"], repr((status, out, err)))
status, out, err = run(config("l12/over.md", [], [("Title", "100", "characters")]), no_pdf, tex)
check("L12 over", status == 1 and out == ["over: Title: 126 characters of 100"], repr((status, out, err)))

# L13: a form field with no grant-fields.md is not checked, the reason names the path looked for, and it is no failure.
tex = write("l13/main.tex", body(SECTION + "Text."))
status, out, err = run(field, no_pdf, tex)
looked_for = os.path.join(os.path.abspath(scratch), "l13", "grant-fields.md")
check("L13 not checked", status == 0 and out == [f"not checked: Abstract: no file {looked_for} exists"], repr((status, out, err)))

# L14: a section's limit given in pages is not checked, and is no failure.
status, out, err = run(config("l14/config.md", [OBJECTIVES + ("2", "pages")]), no_pdf, tex)
check("L14 not checked", status == 0 and len(out) == 1 and out[0].startswith("not checked: Research objectives: "), repr((status, out, err)))

# L15: a Unit that is none of the three, and a Limit that is no whole number, each give one error line and exit 2.
status, out, err = run(config("l15/unit.md", [OBJECTIVES + ("100", "lines")]), no_pdf, tex)
check("L15 the unit", status == 2 and one_error(out, err), repr((status, out, err)))
status, out, err = run(config("l15/limit.md", [OBJECTIVES + ("ten", "words")]), no_pdf, tex)
check("L15 the limit", status == 2 and one_error(out, err), repr((status, out, err)))

# L16: a limit in pages of the whole document with no log beside the PDF, or no page count in the log, gives one error line and exit 2.
status, out, err = run(pages, no_pdf, tex)
check("L16 no log", status == 2 and one_error(out, err), repr((status, out, err)))
status, out, err = run(pages, log("l16/main", "No pages of output."), tex)
check("L16 no page count", status == 2 and one_error(out, err), repr((status, out, err)))

# L17: a config path, a PDF path and a .tex path that hold a space are read as given.
spaced = config("l17 folder/funder config.md", [("(whole document)", "yes", "10", "pages"), OBJECTIVES + ("100", "words")])
tex = write("l17 folder/my main.tex", body(SECTION + "One two three."))
status, out, err = run(spaced, log("l17 folder/out put/my main", "Output written on \"my main.pdf\" (3 pages, 2345 bytes)."), tex)
check("L17 the lines", status == 0 and out == ["ok: (whole document): 3 pages of 10", "ok: Research objectives: 3 words of 100"], repr((status, out, err)))

TITLE = [("Title", "240", "characters")]


def fields_case(folder, fields_text, fields=TITLE, sections=(), pdf=no_pdf):
    """The run of a config with the form fields given on a grant-fields.md with the text given, written as bytes when it is bytes."""
    tex = write(folder + "/main.tex", body(SECTION + "One two three."))
    if isinstance(fields_text, bytes):
        with open(os.path.join(scratch, folder, "grant-fields.md"), "wb") as handle:
            handle.write(fields_text)
    else:
        write(folder + "/grant-fields.md", fields_text)
    return run(config(folder + "/config.md", list(sections), list(fields)), pdf, tex)


# L18: empty lines at both ends of a field's text count as no character.
status, out, err = fields_case("l18", "## Title\n\n\n" + text + "\n\n\n")
check("L18 empty lines at both ends", status == 0 and out == ["ok: Title: 126 characters of 240"], repr((status, out, err)))

# L19: a field's count ends before the next heading, and a heading that is no Field of the config gives no line.
status, out, err = fields_case("l19", "## Title\n" + text + "\n\n## Keywords\n" + "c" * 200 + "\n")
check("L19 the next heading", status == 0 and out == ["ok: Title: 126 characters of 240"], repr((status, out, err)))

# L20: a line that starts with three hash signs inside a field is text of the field.
status, out, err = fields_case("l20", "## Title\nOne two\n### Three\nfour\n")
check("L20 a deeper heading", status == 0 and out == ["ok: Title: 22 characters of 240"], repr((status, out, err)))

# L21: with Windows line endings a line break inside a field counts as one character.
status, out, err = fields_case("l21", "## Title\r\n" + "a" * 60 + "\r\n" + "b" * 65 + "\r\n")
check("L21 Windows line endings", status == 0 and out == ["ok: Title: 126 characters of 240"], repr((status, out, err)))

# L22: the first heading of a file that starts with a byte-order mark is read.
status, out, err = fields_case("l22", "\ufeff## Title\n" + text + "\n")
check("L22 a byte-order mark", status == 0 and out == ["ok: Title: 126 characters of 240"], repr((status, out, err)))

# L23: a heading with no text under it is not checked, and is no failure.
status, out, err = fields_case("l23", "## Title\n\n## Keywords\nOne.\n")
check("L23 no text", status == 0 and out == ["not checked: Title: grant-fields.md has no text under its heading"], repr((status, out, err)))

# L24: a grant-fields.md that is not valid UTF-8 gives one error line and exit 2.
status, out, err = fields_case("l24", b"## Title\nA caf\xe9 title\n")
check("L24 not UTF-8", status == 2 and one_error(out, err), repr((status, out, err)))

# L25: the same heading twice gives one error line and exit 2.
status, out, err = fields_case("l25", "## Title\nOne.\n\n## Title\nTwo.\n")
check("L25 a heading twice", status == 2 and one_error(out, err), repr((status, out, err)))

# L26: with - as the PDF, a page limit of the whole document is not checked, and a form field is counted.
PAGES_ROW = ("(whole document)", "yes", "10", "pages")
status, out, err = fields_case("l26", "## Title\n" + text + "\n", sections=[PAGES_ROW], pdf="-")
check("L26 no compile", status == 0 and out == ["not checked: (whole document): no compile was made", "ok: Title: 126 characters of 240"], repr((status, out, err)))

# L27: with - as the PDF, a section over its limit in words is over, and the exit status is 1.
status, out, err = fields_case("l27", "## Title\nA title\n", sections=[PAGES_ROW, OBJECTIVES + ("2", "words")], pdf="-")
check("L27 no compile, a section over", status == 1 and out == ["not checked: (whole document): no compile was made", "over: Research objectives: 3 words of 2", "ok: Title: 7 characters of 240"], repr((status, out, err)))

# L28: a heading line that ends with a space matches its Field.
status, out, err = fields_case("l28", "## Title \n" + text + "\n")
check("L28 a trailing space", status == 0 and out == ["ok: Title: 126 characters of 240"], repr((status, out, err)))

# L29: a form field with a limit in words is counted in words.
status, out, err = fields_case("l29", "## Title\nOne two\nthree four five\n", fields=[("Title", "4", "words")])
check("L29 words", status == 1 and out == ["over: Title: 5 words of 4"], repr((status, out, err)))

# L30: with - as the PDF and a main .tex that does not exist, each Sections row with a limit is not checked and a form field is counted from the grant-fields.md in the folder of that path. With a PDF path the missing .tex stays an error.
write("l30/grant-fields.md", "## Title\n" + text + "\n")
absent = os.path.join(scratch, "l30", "main.tex")
both_rows = config("l30/config.md", [PAGES_ROW, OBJECTIVES + ("100", "words")], TITLE)
status, out, err = run(both_rows, "-", absent)
check("L30 no main .tex", status == 0 and out == ["not checked: (whole document): no main .tex exists", "not checked: Research objectives: no main .tex exists", "ok: Title: 126 characters of 240"], repr((status, out, err)))
status, out, err = run(both_rows, no_pdf, absent)
check("L30 no main .tex, a PDF path", status == 2 and one_error(out, err), repr((status, out, err)))

for failure in failures:
    print(failure)
sys.exit(1 if failures else 0)
PYTHON
)
status=$?

if [ "$status" -ne 0 ]; then
    printf '%s\n' "$output"
    echo "FAIL: check_limits.py does not hold the behaviour above"
    exit 1
fi

echo "PASS: check_limits.py reads the page count of the log beside the PDF, a statement of one page and a broken one included, counts a section's words and characters without its comments, command names, citations, labels and figure files and with the text inside braces, after an escaped percent sign, under a subsection and in a brought-in file, counts the whole document and a form field under its heading in grant-fields.md, with a line break as one character under either line ending, without the empty lines at both ends, up to the next heading, with a deeper heading, after a byte-order mark and with a space after the heading, prints over and exits 1 past a limit, prints not checked for a section's limit in pages, a section the .tex lacks, a form field with no file, no heading or no text, a page limit with - as the PDF and every section's limit with - as the PDF and no main .tex, and exits 2 with one error line for a unit or a limit it cannot read, for a page limit with no log or no page count, for a main .tex that does not exist beside a PDF path and for a grant-fields.md that is not UTF-8 or holds a heading twice"
