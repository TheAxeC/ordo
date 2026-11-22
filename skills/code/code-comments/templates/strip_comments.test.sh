#!/bin/sh
# Exercise strip_comments.py on scratch files, each pair written under $TMPDIR and removed by a trap.
# Each case is kept because a wrong answer costs something: `equal` for a pair whose code differs keeps a rewrite that changed code, and `differ` for a pair whose comments differ refuses a rewrite that changed comments only.
# Every pair that must compare equal sits beside a near miss the same rule must report as different, so a script that prints one word for every pair fails.
# C and C++ cases: a `//` comment after code and after an include, a reworded, moved and deleted comment (the first line of a file included), a `///` block reflowed, an inline block comment, string, character and raw string literals that hold comment markers, whitespace inside a string literal, the space a removed comment leaves between two tokens, a digit separator, a `//` comment ending in a backslash (before a newline or before a carriage return and a newline), a string or character literal that does not close on its line, and a #define continued over lines or joined into one.
# CMake cases: a `#` comment line and one after an argument, a quoted argument and its whitespace, an escaped `#`, an escaped backslash before a `#` and a bracket argument holding a `#`, and bracket comments with and without `=`.
# An unterminated block comment runs to the end of the file; a file the script cannot read prints one line starting `strip_comments: ` on stderr and exits 2, since a skill that kept a rewrite it never compared would keep a change of code.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/strip-comments-test.XXXXXX") ||
    fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
test_root=$(CDPATH= cd "$test_root" && pwd -P) || fail "could not resolve the scratch directory"
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
strip=$script_dir/strip_comments.py
pair_count=0

# Two folders, a and b, each to hold a file of the given name: the pair a case compares.
new_pair() {
    case_name=$1
    pair_count=$((pair_count + 1))
    mkdir -p "$test_root/$pair_count/a" "$test_root/$pair_count/b" || fail "could not make a scratch folder"
    a=$test_root/$pair_count/a/$2
    b=$test_root/$pair_count/b/$2
}

a_is() {
    cat > "$a"
}

b_is() {
    cat > "$b"
}

# The pair compares as $1: `equal` with exit 0 or `differ` with exit 1.
expect() {
    out=$(python3 "$strip" --compare "$a" "$b" 2>&1)
    status=$?
    case $1 in
        equal) want=0 ;;
        *) want=1 ;;
    esac
    if [ "$out" != "$1" ] || [ "$status" -ne "$want" ]; then
        fail "$case_name: --compare printed '$out' with exit $status, expected '$1' with exit $want"
    fi
}

# The command given as the arguments prints nothing on stdout, one line starting `strip_comments: ` on stderr, and exits 2.
expect_refusal() {
    out=$("$@" 2>/dev/null)
    status=$?
    [ -z "$out" ] || fail "$case_name: printed '$out' on stdout"
    err=$("$@" 2>&1 >/dev/null)
    case $err in
        'strip_comments: '*) ;;
        *) fail "$case_name: stderr was '$err', expected a line starting 'strip_comments: '" ;;
    esac
    [ "$(printf '%s\n' "$err" | wc -l | tr -d ' ')" = 1 ] || fail "$case_name: stderr was more than one line"
    [ "$status" -eq 2 ] || fail "$case_name: exit $status, expected 2"
}

# Case 1: a trailing comment after code, reworded.
new_pair 'case 1, comment reworded' x.cpp
a_is <<'EOF'
void mount() {
    storage.mountPhysical("user", dir, 0, /*writable=*/true);   // the user mount the slot vpaths live under
}
EOF
b_is <<'EOF'
void mount() {
    storage.mountPhysical("user", dir, 0, /*writable=*/true);   // the mount under which the slot vpaths live
}
EOF
expect equal

# Case 2: the same pair with the code changed.
new_pair 'case 2, true changed to false' x.cpp
a_is <<'EOF'
void mount() {
    storage.mountPhysical("user", dir, 0, /*writable=*/true);   // the user mount the slot vpaths live under
}
EOF
b_is <<'EOF'
void mount() {
    storage.mountPhysical("user", dir, 0, /*writable=*/false);   // the user mount the slot vpaths live under
}
EOF
expect differ

# Case 3: the text of an inline block comment.
new_pair 'case 3, inline block comment' x.cpp
a_is <<'EOF'
void mount() { storage.mountPhysical("user", dir, 0, /*writable=*/true); }
EOF
b_is <<'EOF'
void mount() { storage.mountPhysical("user", dir, 0, /*mutable=*/true); }
EOF
expect equal

new_pair 'case 3, control: the argument after the block comment changed' x.cpp
a_is <<'EOF'
void mount() { storage.mountPhysical("user", dir, 0, /*writable=*/true); }
EOF
b_is <<'EOF'
void mount() { storage.mountPhysical("user", dir, 0, /*writable=*/false); }
EOF
expect differ

# Case 4: a doc block of three lines reflowed to two, and the same with a word changed.
new_pair 'case 4, doc block reflowed' x.hpp
a_is <<'EOF'
/// Opens the slot and
/// returns its handle when
/// the slot exists.
Handle open(int slot);
EOF
b_is <<'EOF'
/// Opens the slot and returns its handle
/// when the slot exists.
Handle open(int slot);
EOF
expect equal
new_pair 'case 4, doc block with a word changed' x.hpp
a_is <<'EOF'
/// Opens the slot and
/// returns its handle when
/// the slot exists.
Handle open(int slot);
EOF
b_is <<'EOF'
/// Opens the slot and returns its handle
/// when the slot is present.
Handle open(int slot);
EOF
expect equal

new_pair 'case 4, control: the declaration under the doc block changed' x.hpp
a_is <<'EOF'
/// Opens the slot and
/// returns its handle when
/// the slot exists.
Handle open(int slot);
EOF
b_is <<'EOF'
/// Opens the slot and returns its handle
/// when the slot exists.
Handle open(int slots);
EOF
expect differ

# Case 5: a comment moved from the end of a code line to its own line above it, in the middle of a file and on the first line.
new_pair 'case 5, comment moved above a line' x.cpp
a_is <<'EOF'
int a = 0;
int x = 1;   // why
int b = 2;
EOF
b_is <<'EOF'
int a = 0;
// why
int x = 1;
int b = 2;
EOF
expect equal
new_pair 'case 5, comment moved above the first line' x.cpp
a_is <<'EOF'
int x = 1;   // why
int b = 2;
EOF
b_is <<'EOF'
// why
int x = 1;
int b = 2;
EOF
expect equal
new_pair 'case 5, control: the line moved as well' x.cpp
a_is <<'EOF'
int x = 1;   // why
int b = 2;
EOF
b_is <<'EOF'
// why
int b = 2;
int x = 1;
EOF
expect differ

# Case 6: a string literal that holds `//`, changed after the `//`, and a comment after it changed.
new_pair 'case 6, string literal changed after its //' x.cpp
a_is <<'EOF'
auto url = "http://127.0.0.1:";
EOF
b_is <<'EOF'
auto url = "http://127.0.0.2:";
EOF
expect differ
new_pair 'case 6, control: comment after the string changed' x.cpp
a_is <<'EOF'
auto url = "http://127.0.0.1:";   // local
EOF
b_is <<'EOF'
auto url = "http://127.0.0.1:";   // loopback
EOF
expect equal

new_pair 'case 6, whitespace inside a string literal' x.cpp
a_is <<'EOF'
auto s = "a  b";
EOF
b_is <<'EOF'
auto s = "a b";
EOF
expect differ

# Case 7: character literals holding a double quote and an escaped quote, then a comment, then code.
new_pair 'case 7, comment after character literals changed' x.cpp
a_is <<'EOF'
char q = '"'; char e = '\''; int n = 1; // one
EOF
b_is <<'EOF'
char q = '"'; char e = '\''; int n = 1; // two
EOF
expect equal
new_pair 'case 7, code after character literals changed' x.cpp
a_is <<'EOF'
char q = '"'; char e = '\''; int n = 1; // one
EOF
b_is <<'EOF'
char q = '"'; char e = '\''; int n = 2; // one
EOF
expect differ

# Case 8: raw strings with a delimiter, with and without an encoding prefix.
new_pair 'case 8, raw string changed after its //' x.cpp
a_is <<'EOF'
auto s = R"x(a "b" // c */ d)x";
EOF
b_is <<'EOF'
auto s = R"x(a "b" // z */ d)x";
EOF
expect differ
new_pair 'case 8, comment after a raw string changed' x.cpp
a_is <<'EOF'
auto s = R"x(a "b" // c */ d)x"; // e
EOF
b_is <<'EOF'
auto s = R"x(a "b" // c */ d)x"; // f
EOF
expect equal
new_pair 'case 8, prefixed raw string changed after its //' x.cpp
a_is <<'EOF'
auto s = u8R"(a " // c)"; int q;
EOF
b_is <<'EOF'
auto s = u8R"(a " // d)"; int q;
EOF
expect differ

new_pair 'case 8, plain R raw string changed after its //' x.cpp
a_is <<'EOF'
auto s = R"(a " // b)"; int n = 1;
EOF
b_is <<'EOF'
auto s = R"(a " // b)"; int n = 2;
EOF
expect differ

# Case 9: a digit separator leaves an odd number of apostrophes on the line.
new_pair 'case 9, comment after a digit separator changed' x.cpp
a_is <<'EOF'
int n = 1'000;   // c
EOF
b_is <<'EOF'
int n = 1'000;   // d
EOF
expect equal
new_pair 'case 9, number with a digit separator changed' x.cpp
a_is <<'EOF'
int n = 1'000;   // c
EOF
b_is <<'EOF'
int n = 1'001;   // c
EOF
expect differ
new_pair 'case 9, hexadecimal digit separator' x.cpp
a_is <<'EOF'
int m = 0xFF'FF;   // c
EOF
b_is <<'EOF'
int m = 0xFF'FF;   // d
EOF
expect equal
new_pair 'case 9, prefixed character literal after a digit' x.cpp
a_is <<'EOF'
auto c = u8'1'; // c
EOF
b_is <<'EOF'
auto c = u8'1'; // d
EOF
expect equal
new_pair 'case 9, prefixed character literal changed' x.cpp
a_is <<'EOF'
auto c = u8'1'; // c
EOF
b_is <<'EOF'
auto c = u8'2'; // c
EOF
expect differ

# Case 10: a comment ending in a backslash takes the next line.
new_pair 'case 10, line after a backslash-ended comment changed' x.cpp
a_is <<'EOF'
int a; // note \
int b;
int c;
EOF
b_is <<'EOF'
int a; // note \
int z;
int c;
EOF
expect equal
new_pair 'case 10, control: line after a comment changed' x.cpp
a_is <<'EOF'
int a; // note
int b;
EOF
b_is <<'EOF'
int a; // note
int z;
EOF
expect differ

# Case 10, continued: a backslash followed by a carriage return and a newline also joins the lines.
new_pair 'case 10, backslash before a CRLF line end' x.cpp
printf 'int a; // note \\\r\nint b;\r\n' > "$a"
printf 'int a; // note\r\nint b;\r\n' > "$b"
expect differ

# Case 11: a comment removed between two #define lines, a blank line removed, and two #define lines joined into one.
new_pair 'case 11, comment removed between defines' x.cpp
a_is <<'EOF'
#define A 1
// why B
#define B 2
EOF
b_is <<'EOF'
#define A 1
#define B 2
EOF
expect equal
new_pair 'case 11, blank line removed between defines' x.cpp
a_is <<'EOF'
#define A 1

#define B 2
EOF
b_is <<'EOF'
#define A 1
#define B 2
EOF
expect equal
new_pair 'case 11, defines joined' x.cpp
a_is <<'EOF'
#define A 1
#define B 2
EOF
b_is <<'EOF'
#define A 1 #define B 2
EOF
expect differ

# Case 12: a #define continued over three lines.
new_pair 'case 12, code on a continuation line changed' x.cpp
a_is <<'EOF'
#define M(a) \
    foo(a) \
    bar(a)
EOF
b_is <<'EOF'
#define M(a) \
    fox(a) \
    bar(a)
EOF
expect differ
new_pair 'case 12, comment on the last line changed' x.cpp
a_is <<'EOF'
#define M(a) \
    foo(a) \
    bar(a) // one
EOF
b_is <<'EOF'
#define M(a) \
    foo(a) \
    bar(a) // two
EOF
expect equal

new_pair 'case 12, continuation line joined to a define' x.cpp
a_is <<'EOF'
#define F(x) \
    (x + 1)
int a;
EOF
b_is <<'EOF'
#define F(x) (x + 1)
int a;
EOF
expect equal

# Case 13: an include with a trailing comment.
new_pair 'case 13, comment after an include changed' x.cpp
a_is <<'EOF'
#include "save/save_store.h"   // why it is included
EOF
b_is <<'EOF'
#include "save/save_store.h"   // what it provides
EOF
expect equal
new_pair 'case 13, header name changed' x.cpp
a_is <<'EOF'
#include "save/save_store.h"   // why it is included
EOF
b_is <<'EOF'
#include "save/save_other.h"   // why it is included
EOF
expect differ

# Case 14: a trailing comment, a whole-line comment and a comment on the first line of the file deleted.
new_pair 'case 14, trailing comment deleted' x.cpp
a_is <<'EOF'
int a = 0;   // zero
int b = 1;
EOF
b_is <<'EOF'
int a = 0;
int b = 1;
EOF
expect equal
new_pair 'case 14, whole-line comment deleted' x.cpp
a_is <<'EOF'
int a = 0;
// one
int b = 1;
EOF
b_is <<'EOF'
int a = 0;
int b = 1;
EOF
expect equal
new_pair 'case 14, doc comment on the first line deleted' x.cpp
a_is <<'EOF'
/// doc
int f();
EOF
b_is <<'EOF'
int f();
EOF
expect equal
new_pair 'case 14, comment and blank line before an include deleted' x.cpp
a_is <<'EOF'
// The save runtime: implementation.

#include "save/save_runtime.h"
EOF
b_is <<'EOF'
#include "save/save_runtime.h"
EOF
expect equal
new_pair 'case 14, trailing comment on the last line deleted' x.cpp
a_is <<'EOF'
int a = 0;
int b = 1; // one
EOF
b_is <<'EOF'
int a = 0;
int b = 1;
EOF
expect equal

new_pair 'case 14, control: comment deleted together with its code line' x.cpp
a_is <<'EOF'
/// doc
int f();
EOF
b_is <<'EOF'
int g();
EOF
expect differ
new_pair 'case 14, comment between two tokens removed with its spaces' x.cpp
a_is <<'EOF'
int x = a /*c*/ b;
EOF
b_is <<'EOF'
int x = ab;
EOF
expect differ

# Case 15: a comment reworded to hold an apostrophe and a double quote.
new_pair 'case 15, comment with an apostrophe and a double quote' x.cpp
a_is <<'EOF'
int slot = 0; // the slot name stays
EOF
b_is <<'EOF'
int slot = 0; // the slot's "name" stays
EOF
expect equal

new_pair 'case 15, control: code changed beside the comment' x.cpp
a_is <<'EOF'
int slot = 0; // the slot name stays
EOF
b_is <<'EOF'
int slot = 1; // the slot's "name" stays
EOF
expect differ

# Case 16: a CMake comment line reworded.
new_pair 'case 16, comment line reworded' CMakeLists.txt
a_is <<'EOF'
target_link_libraries(save
    # PRIVATE: only the .cpp reaches Storage + DocFormats concretely.
    PRIVATE storage)
EOF
b_is <<'EOF'
target_link_libraries(save
    # PRIVATE: the .cpp alone reaches Storage and DocFormats.
    PRIVATE storage)
EOF
expect equal

new_pair 'case 16, control: argument changed beside the comment line' CMakeLists.txt
a_is <<'EOF'
target_link_libraries(save
    # PRIVATE: only the .cpp reaches Storage + DocFormats concretely.
    PRIVATE storage)
EOF
b_is <<'EOF'
target_link_libraries(save
    # PRIVATE: the .cpp alone reaches Storage and DocFormats.
    PRIVATE storages)
EOF
expect differ

# Case 17: a CMake comment after an argument.
new_pair 'case 17, comment after an argument changed' CMakeLists.txt
a_is <<'EOF'
target_link_libraries(app PRIVATE engine)   # why
EOF
b_is <<'EOF'
target_link_libraries(app PRIVATE engine)   # because
EOF
expect equal
new_pair 'case 17, argument changed' CMakeLists.txt
a_is <<'EOF'
target_link_libraries(app PRIVATE engine)   # why
EOF
b_is <<'EOF'
target_link_libraries(app PRIVATE engines)   # why
EOF
expect differ

# Case 18: a quoted argument holding a `#`.
new_pair 'case 18, quoted argument changed after its #' CMakeLists.txt
a_is <<'EOF'
set(x "a # b")
EOF
b_is <<'EOF'
set(x "a # c")
EOF
expect differ
new_pair 'case 18, escaped # in an argument' CMakeLists.txt
a_is <<'EOF'
set(x a\#b c)
EOF
b_is <<'EOF'
set(x a\#b d)
EOF
expect differ

new_pair 'case 18, whitespace inside a quoted argument' CMakeLists.txt
a_is <<'EOF'
set(x "a  b")
EOF
b_is <<'EOF'
set(x "a b")
EOF
expect differ
new_pair 'case 18, escaped backslash before a #' CMakeLists.txt
a_is <<'EOF'
set(x a\\#b c)
EOF
b_is <<'EOF'
set(x a\\#b d)
EOF
expect equal

# Case 19: bracket comments, with and without `=`, and a bracket argument holding a `#`.
new_pair 'case 19, bracket comment changed on its third line' x.cmake
a_is <<'EOF'
f()
#[[ first
second
third ]]
g()
EOF
b_is <<'EOF'
f()
#[[ first
second
third, reworded ]]
g()
EOF
expect equal
new_pair 'case 19, bracket comment with = changed' x.cmake
a_is <<'EOF'
f()
#[=[ first ]] still the comment
second ]=]
g()
EOF
b_is <<'EOF'
f()
#[=[ first ]] still the comment
second, reworded ]=]
g()
EOF
expect equal
new_pair 'case 19, bracket argument changed after its #' x.cmake
a_is <<'EOF'
set(x [[ a # b ]])
EOF
b_is <<'EOF'
set(x [[ a # c ]])
EOF
expect differ

# Case 20: an unterminated comment runs to the end of the file.
new_pair 'case 20, code before an unterminated comment changed' x.cpp
a_is <<'EOF'
int a;
/* open
EOF
b_is <<'EOF'
int c;
/* open
EOF
expect differ
new_pair 'case 20, control: text of an unterminated comment changed' x.cpp
a_is <<'EOF'
int a;
/* open one
EOF
b_is <<'EOF'
int a;
/* open two
EOF
expect equal

# Case 20, continued: a string or character literal that does not close ends at its line, so the code after it is still compared.
new_pair 'case 20, code after an unclosed literal changed' x.cpp
a_is <<'EOF'
#if 0
don't
#endif
// it's "quoted
const char* u = "http://x"; int n = 1;
EOF
b_is <<'EOF'
#if 0
don't
#endif
// it's "quoted
const char* u = "http://x"; int n = 2;
EOF
expect differ

# Case 21: a file of no covered language.
new_pair 'case 21, a Markdown file' notes.md
a_is <<'EOF'
notes
EOF
expect_refusal python3 "$strip" "$a"

# Case 22: two files of different languages under --compare.
new_pair 'case 22, C++ against CMake' x.cpp
a_is <<'EOF'
int a;
EOF
mkdir -p "$test_root/cmake" || fail "could not make a scratch folder"
printf 'set(a 1)\n' > "$test_root/cmake/CMakeLists.txt"
case_name='case 22, C++ against CMake'
expect_refusal python3 "$strip" --compare "$a" "$test_root/cmake/CMakeLists.txt"

# Case 23: a path that does not exist, and a file that is not UTF-8.
case_name='case 23, a path that does not exist'
expect_refusal python3 "$strip" "$test_root/nosuch.cpp"
new_pair 'case 23, a file that is not UTF-8' bad.cpp
printf 'int a; // \377\376\n' > "$a"
printf 'int a;\n' > "$b"
expect_refusal python3 "$strip" "$a"
case_name='case 23, a file that is not UTF-8 under --compare'
expect_refusal python3 "$strip" --compare "$b" "$a"

printf 'PASS: strip_comments.py scratch tests\n'
