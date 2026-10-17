#!/usr/bin/env python3
r"""Print a C, C++ or CMake file's code without its comments, in a form two files are compared by.

    strip_comments.py <file>              print the stripped form of the file
    strip_comments.py --compare <a> <b>   print `equal` or `differ`

Inputs: the one file, or the two files after `--compare`. Each is read as UTF-8 with its line ends as they are. The
language comes from the file's name: C and C++ for `.c`, `.cc`, `.cpp`, `.h` and `.hpp`; CMake for `CMakeLists.txt`
and for a name ending `.cmake`. Under `--compare` both files are of the same language.

The stripped form keeps the code and drops what a rewrite of comments may change:

  - Each comment becomes one space. A C or C++ `//` comment runs to the end of its line, and a `/* */` comment to
    its first `*/`. A CMake `#` comment runs to the end of its line, and a `#[[ ]]` comment, with any number of
    `=` between the brackets, to its matching close. A comment that is not closed runs to the end of the file.
  - Text inside a literal is never a comment. A C or C++ string or character literal is read with its backslash
    escapes, and a string or character literal that is not closed ends at the first newline, which is not part of
    it. A raw string literal with any encoding prefix (`R`, `u8R`, `uR`, `UR`, `LR`) runs to its `)delimiter"`, or to
    the end of the file when it is not closed; a delimiter longer than 16 characters, or one that holds whitespace,
    `(`, `)`, `\` or `"`, makes the text no raw string. A `'` inside a number token (after a digit or hex digit,
    before one, as in `1'000` and `0xFF'FF`) is a digit separator, so `u8'1'` is still a character literal. A CMake
    quoted argument is read with its backslash escapes and a bracket argument, with any number of `=`, to its
    matching close, or to the end of the file when it is not closed; a backslash outside both makes the next
    character plain, so `a\#b` holds no comment while `a\\#b` ends in one.
  - In C and C++ a backslash followed by a newline or by a carriage return and a newline, outside a literal, is
    deleted before anything else is read, as the compiler deletes it: a `//` comment ending in a backslash takes the
    next line, and a `#define` runs over its continuation lines.
  - Every run of whitespace outside a literal, comments in it included, becomes one space, except around a
    preprocessor directive. A directive keeps its own line: a run that holds the newline before a directive or the
    newline that ends one becomes one newline. So a comment line or a blank line removed between two `#define`
    lines leaves the form unchanged, and joining two `#define` lines into one changes it.
  - The form starts at its first item, so the whitespace and comments at the start of the file are dropped, and
    ends with one newline after its last item.

Output: the stripped form, or `equal` or `differ`, on standard output.

Errors: one line starting `strip_comments: ` on standard error, for a file whose name has no covered language, two
files of different languages under `--compare`, a file that cannot be read, and a file that is not UTF-8. A wrong
number of arguments or an unknown option prints the usage on standard error.

Exit status: 0 after printing a form or `equal`; 1 for `differ`; 2 for an error or the usage.
"""
import os
import sys

CPP_SUFFIXES = (".c", ".cc", ".cpp", ".h", ".hpp")
WHITESPACE = " \t\r\f\v\n"
RAW_PREFIXES = ("R", "u8R", "uR", "UR", "LR")
LITERAL_PREFIXES = ("u8", "u", "U", "L")
DIGITS = "0123456789"
HEX_DIGITS = "0123456789abcdefABCDEF"
USAGE = """usage: strip_comments.py <file>
       strip_comments.py --compare <a> <b>"""


class Refusal(Exception):
    """A file the script cannot strip; the message is the text after `strip_comments: `."""


class Form:
    """The stripped form being built: its pieces, and the separator owed before the next piece."""

    def __init__(self):
        self.pieces = []
        self.gap = None

    def space(self):
        """A whitespace run or a comment: one space is owed, unless a newline is already owed."""
        if self.gap is None:
            self.gap = " "

    def newline(self):
        """A run next to a preprocessor directive: one newline is owed."""
        self.gap = "\n"

    def add(self, text):
        """Append text, after the separator owed. Nothing is owed before the first piece."""
        if self.gap is not None and self.pieces:
            self.pieces.append(self.gap)
        self.gap = None
        self.pieces.append(text)

    def text(self):
        return "".join(self.pieces) + "\n"


def is_name_char(char):
    return char.isalnum() or char == "_"


def quoted_end(text, start, spans_lines):
    """The offset just past the literal whose opening quote is at `start`. A literal that is not closed ends at the
    end of the text when it may span lines, and otherwise just before the first newline."""
    quote = text[start]
    i = start + 1
    while i < len(text):
        if text[i] == "\\":
            i += 2
        elif text[i] == quote:
            return i + 1
        elif text[i] == "\n" and not spans_lines:
            return i
        else:
            i += 1
    return min(i, len(text))


def bracket_end(text, start):
    """The offset just past the bracket text `[=*[ ... ]=*]` that opens at `start`, or the end of the text when it
    is not closed. None when `start` does not open one."""
    if start >= len(text) or text[start] != "[":
        return None
    equals = 0
    while start + 1 + equals < len(text) and text[start + 1 + equals] == "=":
        equals += 1
    opener_end = start + 1 + equals + 1
    if opener_end > len(text) or text[opener_end - 1] != "[":
        return None
    close = "]" + "=" * equals + "]"
    found = text.find(close, opener_end)
    return len(text) if found < 0 else found + len(close)


def join_splices(text):
    """The text without its backslash-newlines, a carriage return before the newline included, and for each of its
    characters the offset it has in `text`."""
    chars, origin = [], []
    i = 0
    while i < len(text):
        if text.startswith("\\\n", i):
            i += 2
        elif text.startswith("\\\r\n", i):
            i += 3
        else:
            chars.append(text[i])
            origin.append(i)
            i += 1
    origin.append(len(text))
    return "".join(chars), origin


def raw_string_end(code, quote):
    """The offset just past the raw string literal whose opening quote is at `quote`, or None when the text after
    the quote holds no valid delimiter and parenthesis."""
    paren = code.find("(", quote + 1)
    if paren < 0:
        return None
    delimiter = code[quote + 1:paren]
    if len(delimiter) > 16 or any(char in WHITESPACE + '()\\"' for char in delimiter):
        return None
    close = code.find(")" + delimiter + '"', paren + 1)
    return len(code) if close < 0 else close + len(delimiter) + 2


def prefixed_literal_end(code, name, start):
    """The offset just past the literal that the name `name` prefixes, the name ending at `start`, or None when it
    prefixes none."""
    if start >= len(code) or code[start] not in "\"'":
        return None
    if name in RAW_PREFIXES and code[start] == '"':
        return raw_string_end(code, start)
    if name in LITERAL_PREFIXES:
        return quoted_end(code, start, False)
    return None


def number_end(code, start):
    """The offset just past the number token that starts at `start`."""
    i = start + 1
    while i < len(code):
        char = code[i]
        if char in "+-" and code[i - 1] in "eEpP":
            i += 1
        elif char == "'" and code[i - 1] in HEX_DIGITS and code[i + 1:i + 2] != "" and code[i + 1] in HEX_DIGITS:
            i += 1
        elif is_name_char(char) or char == ".":
            i += 1
        else:
            break
    return i


def strip_cpp(text):
    """The stripped form of C or C++ source text."""
    code, origin = join_splices(text)
    form = Form()
    i = 0
    line_start = True
    in_directive = False
    while i < len(code):
        char = code[i]
        if char == "\n":
            if in_directive:
                form.newline()
                in_directive = False
            else:
                form.space()
            line_start = True
            i += 1
        elif char in WHITESPACE:
            form.space()
            i += 1
        elif code.startswith("//", i):
            end = code.find("\n", i)
            form.space()
            i = len(code) if end < 0 else end
        elif code.startswith("/*", i):
            end = code.find("*/", i + 2)
            form.space()
            i = len(code) if end < 0 else end + 2
        elif char in "\"'":
            end = quoted_end(code, i, False)
            form.add(text[origin[i]:origin[end - 1] + 1])
            line_start = False
            i = end
        elif is_name_char(char) and char not in DIGITS:
            end = i
            while end < len(code) and is_name_char(code[end]):
                end += 1
            literal_end = prefixed_literal_end(code, code[i:end], end)
            if literal_end is None:
                form.add(code[i:end])
                i = end
            else:
                form.add(text[origin[i]:origin[literal_end - 1] + 1])
                i = literal_end
            line_start = False
        elif char in DIGITS or (char == "." and code[i + 1:i + 2] != "" and code[i + 1] in DIGITS):
            end = number_end(code, i)
            form.add(code[i:end])
            line_start = False
            i = end
        elif char == "#" and line_start:
            form.newline()
            form.add(char)
            in_directive = True
            line_start = False
            i += 1
        else:
            form.add(char)
            line_start = False
            i += 1
    return form.text()


def strip_cmake(text):
    """The stripped form of CMake source text."""
    form = Form()
    i = 0
    while i < len(text):
        char = text[i]
        if char in WHITESPACE:
            form.space()
            i += 1
        elif char == "#":
            end = bracket_end(text, i + 1)
            if end is None:
                end = text.find("\n", i)
                end = len(text) if end < 0 else end
            form.space()
            i = end
        elif char == '"':
            end = quoted_end(text, i, True)
            form.add(text[i:end])
            i = end
        elif char == "[" and bracket_end(text, i) is not None:
            end = bracket_end(text, i)
            form.add(text[i:end])
            i = end
        elif char == "\\":
            form.add(text[i:i + 2])
            i += 2
        else:
            form.add(char)
            i += 1
    return form.text()


STRIPPERS = {"cpp": strip_cpp, "cmake": strip_cmake}


def language(path):
    """The language a file's name gives it, "cpp" or "cmake", or None."""
    name = os.path.basename(path)
    if name.endswith(CPP_SUFFIXES):
        return "cpp"
    if name == "CMakeLists.txt" or name.endswith(".cmake"):
        return "cmake"
    return None


def read_text(path):
    """The file's text, or a Refusal."""
    try:
        with open(path, "rb") as handle:
            data = handle.read()
    except OSError as error:
        raise Refusal("%s: %s" % (path, error.strerror or error))
    try:
        return data.decode("utf-8")
    except UnicodeDecodeError:
        raise Refusal("%s: not UTF-8" % path)


def check_language(path):
    """The language of the file's name, or a Refusal."""
    found = language(path)
    if found is None:
        raise Refusal("%s: no covered language (C and C++: .c .cc .cpp .h .hpp; CMake: CMakeLists.txt, *.cmake)" % path)
    return found


def stripped(path):
    return STRIPPERS[check_language(path)](read_text(path))


def compare(first, second):
    """True when the two files have the same stripped form."""
    if check_language(first) != check_language(second):
        raise Refusal("%s and %s are of different languages" % (first, second))
    return stripped(first) == stripped(second)


def main(argv):
    try:
        if len(argv) == 3 and argv[0] == "--compare":
            same = compare(argv[1], argv[2])
            print("equal" if same else "differ")
            return 0 if same else 1
        if len(argv) == 1 and not argv[0].startswith("-"):
            sys.stdout.buffer.write(stripped(argv[0]).encode("utf-8"))
            return 0
    except Refusal as refusal:
        print("strip_comments: %s" % refusal, file=sys.stderr)
        return 2
    print(USAGE, file=sys.stderr)
    return 2


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
