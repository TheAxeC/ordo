#!/bin/sh
# Exercise check_prose.py on scratch files. A sample Markdown file and a sample LaTeX file hold one
# planted violation per check, and the test asserts, check by check, that the lines flagged are
# exactly the planted ones. A clean Markdown file and a clean LaTeX file hold each check's near
# miss and must print nothing. Further files cover the forms the checks name: each dash form in
# Markdown and LaTeX (dash), each history phrase (history), each throat-clearing phrase (throat),
# each listed word (words), each heading form and --limit form (sections), plain text read without
# headings (notes), the semicolon limit at its boundary and the lines it leaves out (semi),
# the equal-length band and the lines it leaves out (equal), both contrast forms and the
# continuation words (contrast), consecutive colon paragraphs (colon) and non-letter non-ASCII
# characters (nonascii). The usage errors each exit 64 with nothing on stdout, and no run writes
# to a file. Non-ASCII input is written with printf octal escapes so this file stays ASCII. Every
# assertion names its check, so a check turned off fails the test with its name.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/check-prose-test.XXXXXX") || fail "could not create scratch directory"
trap 'chmod -R u+rwx "$test_root" 2>/dev/null; rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
check=$script_dir/check_prose.py
files=$test_root/files
out=$test_root/out
err=$test_root/err
mkdir -p "$files/sub" || fail "could not create the files directory"
cd "$files" || fail "could not enter the files directory"

checks='non-ascii dash-aside history section-words semicolons throat-clearing filler vague flagged equal-length contrast colon-lists'
check_alt=$(printf '%s' "$checks" | tr ' ' '|')

emdash=$(printf '\342\200\224')
endash=$(printf '\342\200\223')
rsquo=$(printf '\342\200\231')
eacute=$(printf '\303\251')
iacute=$(printf '\303\255')
lambda=$(printf '\316\273')
times=$(printf '\303\227')
nbsp=$(printf '\302\240')
checkmark=$(printf '\342\234\205')
tab=$(printf '\t')
acute=$(printf '\314\201')
umlaut=$(printf '\314\210')

# mkfile <name>: write standard input to <name>, with each @NAME@ placeholder replaced by its
# non-ASCII character.
mkfile() {
    LC_ALL=C awk -v emdash="$emdash" -v endash="$endash" -v rsquo="$rsquo" -v eacute="$eacute" \
        -v iacute="$iacute" -v lambda="$lambda" -v times="$times" -v nbsp="$nbsp" -v checkmark="$checkmark" \
        -v acute="$acute" -v umlaut="$umlaut" -v tab="$tab" '{
        gsub(/@EMDASH@/, emdash); gsub(/@ENDASH@/, endash); gsub(/@RSQUO@/, rsquo)
        gsub(/@EACUTE@/, eacute); gsub(/@IACUTE@/, iacute); gsub(/@LAMBDA@/, lambda)
        gsub(/@TIMES@/, times); gsub(/@NBSP@/, nbsp); gsub(/@CHECK@/, checkmark); gsub(/@ACUTE@/, acute); gsub(/@UMLAUT@/, umlaut); gsub(/@TAB@/, tab)
        print
    }' >"$1" || fail "could not write $1"
}

# run <label> <expected status> <argument>...: run the script, stdout to $out and stderr to $err.
run() {
    run_label=$1
    run_want=$2
    shift 2
    python3 "$check" "$@" >"$out" 2>"$err"
    run_status=$?
    [ "$run_status" -eq "$run_want" ] || fail "$run_label: exit $run_status, expected $run_want [$(head -3 "$err")]"
    [ -s "$err" ] && fail "$run_label: stderr is not empty [$(head -3 "$err")]"
    bad=$(grep -Ev "^.+:[0-9]+: ($check_alt): \".*\": .+\$" "$out")
    [ -z "$bad" ] || fail "$run_label: a line not in the form <file>:<line>: <check>: \"<text>\": <message> [$bad]"
    LC_ALL=C sort -s -t: -k1,1 -k2,2n -c "$out" 2>/dev/null || fail "$run_label: output not sorted by file then line"
}

# lines <file> <check>: the line numbers flagged under <check> for <file>, space-separated.
lines() {
    awk -v p="$1:" -v c="$2: " 'index($0, p) == 1 {
        rest = substr($0, length(p) + 1)
        n = index(rest, ": ")
        if (index(substr(rest, n + 2), c) == 1) printf "%s%s", (k++ ? " " : ""), substr(rest, 1, n - 1)
    }' "$out"
}

# expect <label> <file> <check> <lines>: the lines flagged under <check> are exactly <lines>.
expect() {
    got=$(lines "$2" "$3")
    [ "$got" = "$4" ] || fail "$1 $3: flagged lines [$got], expected [$4]"
}

# expect_all <label> <file> <lines>...: one <lines> argument per check, in the order of $checks.
expect_all() {
    ea_label=$1
    ea_file=$2
    shift 2
    for name in $checks; do
        expect "$ea_label" "$ea_file" "$name" "$1"
        shift
    done
}

# expect_line <label> <check> <line>: $out holds <line> exactly.
expect_line() {
    grep -qxF -- "$3" "$out" || fail "$1 $2: no line [$3] in [$(cat "$out")]"
}

# usage <label> <argument>...: exit 64, nothing on stdout, a message on stderr.
usage() {
    usage_label=$1
    shift
    python3 "$check" "$@" >"$out" 2>"$err"
    usage_status=$?
    [ "$usage_status" -eq 64 ] || fail "usage $usage_label: exit $usage_status, expected 64"
    [ -s "$out" ] && fail "usage $usage_label: stdout is not empty [$(head -3 "$out")]"
    [ -s "$err" ] || fail "usage $usage_label: nothing on stderr"
}

# The twenty-word sentence that keeps the groups of equal.md apart.
s20='This sentence sits between the groups so that no run of equal length can reach across it from either side.'

mkfile sample.md <<'EOF'
# Methods

The parser reads each page from the top and counts the words it finds in each section below its heading.

```sh
printf 'it@RSQUO@s\n'
```

A run of the check stops at the first file that cannot be read - and prints the reason.

The limit was changed for the second page.

In order to count a section, the script first finds the heading of that section in the page.

Each page is simply read once.

The check reports the count, which often helps the reader decide what to cut from the page first.

A robust count needs a clear rule.

The script reads the page in one pass; it never writes to the file it reads or to any other file.

It is not a style guide, it is a check.

The limit is not a target but a ceiling.

Each flag is not a verdict, a reader decides.

The first file is read. The second file is read. The third file is read. The fourth file is read. The last file is read.

For each file it reads, the script prints one of two kinds of line to its output:

- a flag, with its line and check
- nothing, when the file is clean

For a usage error, it prints the reason to standard error and exits with a status of its own:

- 64 for a bad argument
- 64 for a file it cannot read
EOF

mkfile sample.tex <<'EOF'
\documentclass{article}
\begin{document}
\begin{abstract}
The parser reads each page from the top and counts the words it finds in each section below its heading.
\end{abstract}
% it@RSQUO@s a comment
\section{Methods}
A run of the check stops at the first file that cannot be read --- and prints the reason.
The limit was changed for the second page.
In order to count a section, the script first finds the heading of that section in the page.
Each page is simply read once.
The check reports the count, which often helps the reader decide what to cut from the page first.
A robust count needs a clear rule.
The script reads the page in one pass; it never writes to the file it reads or to any other file.
It is not a style guide, it is a check.
The limit is not a target but a ceiling.
Each flag is not a verdict, a reader decides.
The first file is read. The second file is read. The third file is read. The fourth file is read. The last file is read.

For each file it reads, the script prints one of two kinds of line to its output:
\begin{itemize}
\item a flag, with its line and check
\item nothing, when the file is clean
\end{itemize}
For a usage error, it prints the reason to standard error and exits with a status of its own:
\begin{itemize}
\item 64 for a bad argument
\item 64 for a file it cannot read
\end{itemize}
\end{document}
EOF

# The body that takes each clean file past 1000 words of running prose: five sentences of 3, 9,
# 15, 4 and 12 words, so that no five in a row lie within 2 words of each other.
cycle='The page loads. Each section holds a heading and text below it. The script counts the words of every section and compares the count with the limit. Code blocks are skipped. A table row holds cells and the count leaves its semicolons out.'

mkfile clean.md <<'EOF'
---
title: A page -- with a dash; simply a title, previously another
date: 2026-09-28
---

# A clean page; with a semicolon in its heading

The name Jos@EACUTE@ Garc@IACUTE@a is written as it is spelled in the source.

Pages 3-5 are well-formed.

- a list item that opens with a hyphen
* a list item that opens with a star
+ a list item that opens with a plus
1. a numbered item
2) a numbered item with a parenthesis

Inline code such as `--limit`, `a - b` and `simply` is left out of every check that reads prose.

```sh
printf '%s\n' "a -- b - c; simply previously"
```

~~~text
The limit was changed --- step 3, in order to test; very robust.
~~~

The page changed its layout in a stepwise build over steps 3 and 4 on 2026-9-28.

The following section lists the limits in order of size.

Simplest readings justify navigation of landscapes.

Of the requests, the most arrive near zero seconds apart, and the rest arrive later in the day.

It is not the page, and it is not the line either.

It is not one two three four five six seven eight nine ten eleven, twelve.

The pages below follow one rule:

- one flag per line
- one line per flag

A plain paragraph follows the list and opens no list of its own, so the two colons do not pair up.

| Check | Rule |
|---|---|
| semicolons | a; b; c; d; e |

The first file is read. The second file is read. The third file is read. The fourth file is read.

## Limits

one two three four five six seven eight nine ten eleven twelve

## Body

The limit allows two semicolons in a page of this size; here is the first.

The second one is here; the count stays under the limit.

It is not a style guide, it is a check.

The limit is not a target but a ceiling.
EOF

mkfile clean.tex <<'EOF'
\documentclass{article}
\usepackage{amsmath}
\begin{document}
\begin{abstract}
one two three four five six seven eight nine ten eleven twelve
\end{abstract}
\section{A clean page}
The name Jos\'e Garc@IACUTE@a is written as it is spelled in the source.
Pages 3--5 and 10--12 are well-formed, and Navier--Stokes holds no dash.
% a comment --- with a dash; simply previously in order to
Math such as $a - b$ and \(c - d\) is left out of every check that reads prose.
\begin{equation}
a - b --- c; d
\end{equation}
\begin{align*}
x &= y - z
\end{align*}
\begin{verbatim}
The limit was changed --- step 3; very robust.
\end{verbatim}
\begin{lstlisting}
a -- b
\end{lstlisting}
\begin{minted}{python}
x = a - b  # simply
\end{minted}
The page changed its layout in a stepwise build over steps 3 and 4 on 2026-9-28.
The following section lists the limits in order of size.
Simplest readings justify navigation of landscapes.
Of the requests, the most arrive near zero seconds apart, and the rest arrive later in the day.
It is not the page, and it is not the line either.

The pages below follow one rule:
\begin{itemize}
\item one flag per line
\item one line per flag
\end{itemize}
A plain paragraph follows the list and opens no list of its own, so the two colons do not pair up.

\begin{tabular}{ll}
semicolons & a; b; c; d \\
\end{tabular}

The first file is read. The second file is read. The third file is read. The fourth file is read.

\section{Body}
The limit allows two semicolons in a page of this size; here is the first.
The second one is here; the count stays under the limit.
It is not a style guide, it is a check.
The limit is not a target but a ceiling.
EOF

i=0
while [ "$i" -lt 25 ]; do
    printf '\n%s\n' "$cycle" >>clean.md
    printf '\n%s\n' "$cycle" >>clean.tex
    i=$((i + 1))
done
printf '\\end{document}\n' >>clean.tex

mkfile dash.md <<'EOF'
An em dash@EMDASH@here.
An en dash @ENDASH@ joins the two parts of this sentence.
A spaced hyphen - here.
A double hyphen -- joins the two halves of a longer sentence here.
A double hyphen--here.

## A heading -- with a dash

| Check | Rule |
|:---|---:|
| a cell -- with a dash | a cell - with a spaced hyphen |

- a list item - with a spaced hyphen
- a list item with only its marker
* a star item
+ a plus item
1. a numbered item
  - a nested item

A well-formed compound and the range 3-5 hold no dash.

Inline code `a -- b` and `c - d` holds none either.

---

* * *

___

<!-- a comment -- with an aside -->

<!--
a comment over lines -- with an aside
-->

The years 2023 - 2024 are a range, and so are the pages 3 -- 5 in this sentence of some length.

The year 2023 - then more text.

A word - 2024 closes the set here in a sentence that runs to a length of its own.

```x``` opens this prose line - with a code span.

```
a -- b - c @EMDASH@
```

~~~
a -- b - c @EMDASH@
~~~

````md
```
a -- b - c
````

   ```
a -- b indented fence
   ```

```
~~~
a -- b after a tilde line inside a backtick fence
```

> - a quoted list item
> a -- b in a quote

| - | a - b |

> > - a nested quoted list item

```
a -- b in a fence left open to the end of the file
EOF

mkfile dash.tex <<'EOF'
An em dash --- here.
A dash joined---to the two words beside it in this longer sentence.
A space before -- here.
A space after-- here, in a sentence that runs a little longer than the rest.
The range 3--5 and the pages 10--12 hold no dash.
The Navier--Stokes equations hold none either, in a sentence of some length here.
A spaced hyphen - here.
An em dash@EMDASH@here in a sentence long enough to break any run.
% a comment --- with a dash
An escaped \% sign --- is no comment.
Math such as $a - b$ and \(c - d\) holds no dash.
From 26 May 2023 -- 31 Dec 2023 and 2023 - 2024, the ranges pass in this sentence.
Neuro- and Psychophysiology -- postdoctoral researcher.
The year 2023 -- then more text follows in a sentence of some length here.
Display $$a - b$$ and then - outside, with $c$ after it.
Display \[a - b\] and then - outside, in a sentence long enough to break a run.
\begin{gather} a - b \end{gather} and then - outside.
\begin{gather*} a - b \end{gather*} and then - outside, in a sentence long enough to break any run of five.
\begin{multline} a - b \end{multline} and then - outside.
\begin{multline*} a - b \end{multline*} and then - outside, in a sentence long enough to break any run of five.
\begin{eqnarray} a - b \end{eqnarray} and then - outside.
\begin{eqnarray*} a - b \end{eqnarray*} and then - outside, in a sentence long enough to break any run of five.
\begin{displaymath} a - b \end{displaymath} and then - outside.
\begin{math} a - b \end{math} and then - outside, in a sentence long enough to break any run of five.
It costs \$5 - and then $x$ more, in a sentence long enough to break a run of five.
\begin{tabular}{lll}
a & - & b - c \\
\end{tabular}
\begin{equation}
a - b --- c
\end{equation}
\begin{equation*} a - b \end{equation*}
\begin{align}
a - b
\end{align}
\begin{align*}
a - b
\end{align*}
\begin{verbatim}
a -- b - c
\end{verbatim}
\begin{verbatim*}
a -- b - c
\end{verbatim*}
\begin{lstlisting}[language=sh]
a -- b - c
\end{lstlisting}
\begin{minted}{sh}
a -- b - c
\end{minted}
EOF

mkfile history.md <<'EOF'
Previously the page held two lists.
FORMERLY it held three of them, one for each kind of file.
The name was changed.
Both names were changed in the same pass over the whole page.
A key was added.
Support added in March covers the second kind of file and the third.
The file moved from the root.
The script, renamed from its old name, prints one line for each flag it finds.
The script used to print more.
The key no longer exists in the file that the page describes at its top.
As of today the key exists.
See step 3 for the details of the check and the reasons it runs at all.
The key exists since 2026-09-28.

The page changed its layout in a stepwise build over steps 3 and 4 on 2026-9-28 and 20260928.

A reused tool, an unmoved file, a price as offered and the words `previously` and `was changed` in code hold no history.

```
previously
```
EOF

mkfile throat.md <<'EOF'
In the realm of checks, this one reads prose.
IT'S IMPORTANT TO NOTE THAT the check reads every line of the page it is given.
It is worth mentioning that it writes nothing.
This serves as a testament to the design of the script and of the page it reads.
It goes without saying that the output is sorted.
The script runs in order to flag the lines a reader must check before the page goes out.
It should be noted that a flag is no verdict.
When it comes to tables, their rows count as prose for the word checks and the dash check.
At the end of the day the page is read by a person.
With that being said, the check stops here and prints its lines to the output in order.
This section explains the flags.
The following covers the exit status of the script and the messages it prints on error.
Now that we have the flags, the page turns to the limits.
With this setup complete, the reader can run the script on any page of the tree.

The following section lists the limits in order of size, and now that the list is here the page ends.

The script counts, and at the end
of the day a person reads the page.

The script stops at the end@TAB@of the day.
EOF

mkfile words.md <<'EOF'
- easy
- simple
- quick
- very
- really
- just
- simply
- significantly
- many
- often
- typically
- generally
- near-zero
- sub-second
- most requests
- delve
- tapestry
- landscape
- pivotal
- crucial
- foster
- showcase
- testament
- navigate
- leverage
- realm
- embark
- underscore
- multifaceted
- nuanced
- comprehensive
- robust
- intricate
- cornerstone
- paradigm
- synergy
- holistic
- streamline
- cutting-edge
- groundbreaking
- EASY and Simply and Most Requests
- easy-going, easily, simplest, justify, quickly, every, manyfold, oftentimes, navigation, robustness, landscapes
- most of the requests, near zero, sub second, cutting edge
- `simply` in code
```
very
```
EOF

mkfile sections.md <<'EOF'
# One
one two three four five
## Two
one two three four five six
### Three
one two
#### Four
one two three
##### Five
one two three four
###### Six
one two three four five six seven
####### Seven hashes make no heading
```
# Code
```
## Dup
one two three
## dup ##
one two three four
## A=B
one two
| three |
- four
EOF

mkfile sections.tex <<'EOF'
\begin{abstract}
one two three
\end{abstract}
outside the abstract and before any section
\section{Intro}
one two
\subsection*{Deep Part}
one two three
\subsubsection{Deeper}
one
\section*{Tail}
one two three four % five six
$x y z$ five
\section{The \emph{Nested} Part}
one two
\section[Short]{Methods}
one two
\subsubsection*[S]{Last}
one two
EOF

printf 'The notes open here.\n\n# Methods; Results\nThe notes close here.\n' >notes.txt
cp notes.txt notes.md

mkfile semitab.md <<'EOF'
---
title: a; b
---

# Methods; Results

The check reads the page and `a; b` stays in code.

| a; b | c; d |

```
a; b
```

- one; two
EOF

mkfile semitab.tex <<'EOF'
\section{Methods; Results}
The check reads the page.
\begin{tabular}{ll}
a; b & c; d \\
\end{tabular}
\begin{itemize}
\item one; two
\end{itemize}
\begin{tabular*}{\textwidth}{ll}
One; two. & Three; four. \\
\end{tabular*}
\begin{tabularx}{\textwidth}{lX}
One; two. & Three; four. \\
\end{tabularx}
\begin{longtable}{ll}
One; two. & Three; four. \\
\end{longtable}
EOF

# semi<n>.md: one sentence of <n> words holding one semicolon.
for n in 499 500; do
    line='alpha;'
    i=1
    while [ "$i" -lt "$n" ]; do
        line="$line alpha"
        i=$((i + 1))
    done
    printf '%s.\n' "$line" >"semi$n.md"
done

mkfile equal.md <<EOF
The first file is read now. The second file is read. The third file is read here now. The fourth one is read. The last file is read here.

$s20

The first file is read. The second file is read now. The third file is read here and now. The fourth file is read. The last one is read.

$s20

The first file is read. The second file is read. The third file is read. The fourth file is read.

$s20

- The first file is read.
- The second file is read.
- The third file is read.
- The fourth file is read.
- The last file is read.

## The first file is read
## The second file is read
## The third file is read
## The fourth file is read
## The last file is read

| The first file is read. |
| The second file is read. |
| The third file is read. |
| The fourth file is read. |
| The last file is read. |

\`\`\`
The first file is read. The second file is read. The third file is read. The fourth file is read. The last file is read.
\`\`\`

$s20

The first file is read. The second file is read.

## Next

The third file is read. The fourth file is read. The last file is read.

$s20

The first file is read. The second file is read.

The third file is read. The fourth file is read. The last file is read.

$s20

The first file is read! The second file is read? The third file is read! The fourth file is read? The last file is read!

$s20

The well-read, well-kept, well-made, well-used file. It's the file's twin's owner's copy. The first file is read now. The second file is read here. The third file is read too.

$s20
EOF

mkfile contrast.md <<'EOF'
It is not a style guide, it is a check.
The limit is not a target but a ceiling, and it holds for each page of the tree.
- Each flag is not a verdict, a reader decides.
## Not the page, the section
It is not the page but the section, not the line, that the limit counts in this sentence.
It is not one two three four, five.

It is not the page, and it is not the line.
It is not the page, or the line either, in this long sentence of some length.
It is not the page, nor the line.
It is not the page, so the count stays where it is for the rest of this one.
It is not the page, because the count is per file.
It is not the page, which is fine for a check that counts the whole file at once.
It is not the page, as the count shows.
It is not the page, if the count is right about the file and the lines it reads here.
It is not the page, when the count is per file.
It is not one two three four five six seven eight nine ten eleven, twelve.
It is not one two three four five six seven eight nine ten eleven but twelve, in a sentence of some length.
Cannot stop, now.
The word `not a lint, a compiler` in code holds no contrast.
It is not a limitation to apologise for, it is the method.
It is not an offer to do machine learning for your group, it is a request.
The task is not done), a later step does it.
If it is not found in the cache, the script reads it from the disk.
It is not found in the cache, the script reads it from the disk again.
It is not the page but the line but the word.
It is not one two three four five six seven eight nine ten, eleven.
It is not, in the end, the page.
It is not the file's well-kept copy, it is a draft.
If the file is read, it is not the page, it is the line.
When it is not found, the script reads it.
Unless it is not found in the cache on the disk, the script waits here.
Whether it is not found or not, the script reads it.
Because it is not here, it stops.
Although it is not found on the disk, the script reads it from the page it was given here.
Since it is not there, stop.
While it is not found in the cache, the script reads the file from the disk once more.

| a | not guess | The open item, booked |
| It is not a style guide, it is a check. |
| If the \| sign is not the page, it is the line. |
EOF

mkfile colon.md <<'EOF'
The first list holds two items:

1) one
2. two
continued lazily

   continued after a blank line

Then the second list, which also holds two items, follows it:

- one
- two

A third list comes last:
* one
+ two

A plain paragraph ends the run of lists here, with a full stop at its end.

Four:

- one

A paragraph that sits between the two lists and breaks the pair apart.

The fifth list holds one item and follows a plain paragraph:
- one

This paragraph ends with a colon:

A plain paragraph with no colon at its end follows the one above it.

The last one ends with a colon too and opens a list:
- one

The eighth paragraph ends with a colon and a break follows it:

* * *

The ninth ends with a colon and opens a list after the break:
- one

## A heading

The tenth follows the heading and ends with a colon:
- one

A plain paragraph with no colon opens a list below it
- one

The twelfth ends with a colon and opens a list:
- one
EOF

mkfile colon.tex <<'EOF'
The first list holds two items:
\begin{enumerate}
\item one
\end{enumerate}

Then the second list, which also holds two items, follows it:
\begin{description}
\item[a] one
\end{description}
This paragraph ends with a colon:

A plain paragraph with no colon at its end follows the one above it.

The third list comes after a comment line and ends with a colon:
\begin{itemize}
\item one
\end{itemize}
% a comment line between the list and the next paragraph
The fourth ends with a colon and opens a list after the comment:
\begin{itemize}
\item one
\end{itemize}
\begin{equation}
a = b
\end{equation}
The fifth follows an equation and ends with a colon:
\begin{itemize}
\item one
\end{itemize}
EOF

printf -- '---\ntitle: a -- b\n...\n\nThe page.\n' >frontdots.md
printf -- '---\nA page - with an aside.\n' >frontopen.md

mkfile nonascii.md <<'EOF'
The name Jos@EACUTE@ stays.
The letter @LAMBDA@ stays too, in a sentence that runs on a while.
Two @TIMES@ three.
A no-break@NBSP@space sits here in a sentence of some length again.
A mark @CHECK@ here.
The code `x @TIMES@ y` holds one too, and so does the long sentence around it here.
The name Jose@ACUTE@ and Zoe@ACUTE@@UMLAUT@ stay in their decomposed form, in a sentence of some length.
A lone mark @ACUTE@ here.
EOF

printf 'The script used to print more.\n' >sub/nested.md
: >empty.md
printf 'caf\351\n' >latin1.md
printf 'The page.\n' >locked.md
chmod 000 locked.md

mkfile tabcells.tex <<'EOF'
It is not a style guide, it is a check.
The limit is not a target but a ceiling.
\begin{tabular}{lll}
a & not guess & The open item, booked \\
It is not a verdict, a reader decides. & b & c \\
a & not guess \\ The open item, booked & c \\
If R \& D is not the page, it is the line. & c \\
\end{tabular}
EOF

mkfile eq.md <<'EOF'
The first file is read. The second file is read.

# Results

```
code
```

The third file is read. The fourth file is read. The last file is read.
EOF

mkfile eq.tex <<'EOF'
The first file is read. The second file is read.
\section{B}
The third file is read. The fourth file is read. The last file is read.
EOF

mkfile eqpara.tex <<'EOF'
The first file is read. The second file is read.

The third file is read. The fourth file is read. The last file is read.
EOF

mkfile eqabs.tex <<'EOF'
\begin{abstract}
The first file is read. The second file is read.
\end{abstract}
The third file is read. The fourth file is read. The last file is read.
EOF

mkfile structure.tex <<'EOF'
\begin{abstract} The abstract opens here.
One line of the abstract. Its last sentence is simply here.\end{abstract} It was changed after.
\section{Intro} It is simply read here.
It is simply a list: \begin{itemize}
\item one
\end{itemize}
\begin{enumerate}\item It is simply the first.
\end{enumerate} It was changed simply.
EOF

mkfile onelinetable.tex <<'EOF'
\begin{tabular}{c} a \end{tabular}
The page holds one; two; three; and four semicolons in this one long sentence here.
The first file is read. The second file is read. The third file is read. The fourth file is read. The last file is read.
EOF

mkfile onelinelist.tex <<'EOF'
\begin{itemize}\item one\end{itemize}
The first file is read. The second file is read. The third file is read. The fourth file is read. The last file is read.
EOF

mkfile listfence.md <<'EOF'
- an item with a fence under it

    ```sh
    a -- b simply
    ```

After the list, a -- b is flagged.
EOF

mkfile code.tex <<'EOF'
\begin{itemize}
\item A \verb|a -- b| form here.
\item A \verb+c -- d+ form here too.
\item A \texttt{x -- y} form.
\item A \url{http://a.org/x---y} form.
\item A \href{http://a.org/x---y}{link} form.
\item See \label{sec:a---b} here.
\item See \ref{sec:a---b} here.
\item See \eqref{eq:a---b} here.
\item See \cref{sec:a---b} here.
\item See \autoref{sec:a---b} here.
\item See \cite{a---b} and \citep{a---b} and \citet{a---b} here.
\item See \parencite{a---b} and \textcite{a---b} here.
\item See \Cref{sec:a---b} and \pageref{sec:a---b} here.
\item A \lstinline|a -- b| and \lstinline{c -- d} form.
\item A \mintinline{sh}|a -- b| and \mintinline{sh}{c -- d} form.
\item Outside a command, x -- y is flagged.
\end{itemize}
EOF

mkfile semirow.md <<'EOF'
Keywords: a; b; c; d

The check reads one page; it writes none.

The list reads; one
page; two

The check reads (one; two.)
EOF

mkfile semirow.tex <<'EOF'
\keyoutput{a; b}{c; d.}

Keywords: a; b; c

The check reads 5\% of one page; it writes none.

\keyoutput{a; b \\ c}{d.}

\formfield{Key words}
alpha; beta; gamma

\keyoutput{1}{No}
{Journal article. Indicators: a; b.}
{Two; three.}

\formfield{Title}
The check reads one page; it writes none.

\formfield{Note}

{The check reads one page; it writes none.}
EOF

printf 'It is very just, z -- a.\n' >tie.md
printf '```\r\ncode\r\n```\r\nA page - here.\r\n' >crlf.md
printf -- '---   \ntitle: a -- b\n---\n\nThe page.\n' >frontspace.md
printf '| a | - \n| a - |\n' >cellend.md

mkfile tabsec.tex <<'EOF'
\section{T}
\begin{itemize}[noitemsep]
\item Jos\'e M\"{u}ller
\end{itemize}
\begin{tabularx}{\textwidth}{lX}
b \\[2pt]
c \\
\end{tabularx}
EOF

mkfile preamble.tex <<'EOF'
\section{P}
\documentclass[a4paper]{article}
\usepackage[utf8]{inputenc}
\newcommand{\foo}[1]{text #1 here}
\renewcommand{\bar}{\textbf{bold text}}
\setlength{\parindent}{0pt}
\input{chapter}
\include{part}
\includegraphics[width=3cm]{fig.png}
\vspace{1em}
\hspace*{2em}
\bibliographystyle{plain}
\bibliography{refs}
One\\[2pt] two.
EOF

mkfile latexspace.tex <<'EOF'
The first file is read. Dr.\ Smith reads the file. See Fig.~3 for the file. The fourth file is read. The last file is read.

The value is 5\;cm here in the text of this page.

It is not 5\,cm, it is 6.
It is not 6\:cm, it is 7 in the text.
It is not 7\!cm, it is 8.
It is not 8\ cm, it is 9 in the text of the page.
It is not a~style guide, it is a check.
EOF

mkfile eqmath.tex <<'EOF'
The first file is read. The second file
\[ x \]
is read. The third file is read. The fourth file is read. The last file is read.
EOF

mkfile mathitem.tex <<'EOF'
\begin{itemize}
\item It is not a style guide, it is a check.
\item The limit is not a target but a ceiling.
\item It is not the value
\[ x \]
but the name.
\end{itemize}
EOF

mkfile quotedclause.tex <<'EOF'
``If it is not found in the cache, the script reads it.''

(If it is not listed in the index, the script adds it.)

``When it is not named on the line, the script stops.''
EOF
mkfile quotedcontrol.tex <<'EOF'
``It is not found in the cache, the script reads it.''

(It is not listed in the index, the script adds it.)

``It is not named on the line, the script stops.''
EOF
mkfile leadin.md <<'EOF'
The script reads one page; it writes nothing; it prints flags; it exits:

- first
- second
EOF
mkfile leadincontrol.md <<'EOF'
Keywords: prose; checks; flags; exits

- first
- second
EOF
before=$(find . -type f -exec cksum {} + 2>/dev/null | sort)

# The samples: each check flags exactly its planted lines.
run sample.md 1 --limit 'Methods=100' sample.md
expect_all sample.md sample.md 6 9 11 1 21 13 15 17 19 29 '23 25 27' 36
expect_line sample.md non-ascii "sample.md:6: non-ascii: \"$rsquo\": U+2019 is not ASCII and not a letter"
expect_line sample.md dash-aside 'sample.md:9: dash-aside: "read - and": a dash used as an aside'
expect_line sample.md history 'sample.md:11: history: "was changed": a word of history, to be checked'
expect_line sample.md section-words 'sample.md:1: section-words: "Methods": 230 words, over the limit of 100'
expect_line sample.md semicolons 'sample.md:21: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 230 words of running prose, more than 2 per 1000 words'
expect_line sample.md throat-clearing 'sample.md:13: throat-clearing: "In order to": a throat-clearing opener, to be cut'
expect_line sample.md filler 'sample.md:15: filler: "simply": a filler word, to be checked against section A of the prose standard'
expect_line sample.md vague 'sample.md:17: vague: "often": a vague qualifier, to be checked against section A of the prose standard'
expect_line sample.md flagged 'sample.md:19: flagged: "robust": a flagged word, to be checked against section A of the prose standard'
expect_line sample.md equal-length 'sample.md:29: equal-length: "The first file is read.": 5 consecutive sentences of 5, 5, 5, 5, 5 words'
expect_line sample.md contrast 'sample.md:23: contrast: "not a style guide, it": a binary contrast, 3 in this file, more than 2'
expect_line sample.md contrast 'sample.md:25: contrast: "not a target but a": a binary contrast, 3 in this file, more than 2'
expect_line sample.md colon-lists 'sample.md:36: colon-lists: "For a usage error, it prints the reason to standard error an": a second consecutive paragraph that ends with a colon and opens a list'
[ "$(wc -l <"$out")" -eq 14 ] || fail "sample.md: $(wc -l <"$out") lines, expected 14 [$(cat "$out")]"

run sample.tex 1 --limit 'Abstract=10' sample.tex
expect_all sample.tex sample.tex 6 8 9 3 14 10 11 12 13 18 '15 16 17' 25
expect_line sample.tex dash-aside 'sample.tex:8: dash-aside: "read --- and": a dash used as an aside'
expect_line sample.tex section-words 'sample.tex:3: section-words: "Abstract": 20 words, over the limit of 10'
expect_line sample.tex semicolons 'sample.tex:14: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 230 words of running prose, more than 2 per 1000 words'
[ "$(wc -l <"$out")" -eq 14 ] || fail "sample.tex: $(wc -l <"$out") lines, expected 14 [$(cat "$out")]"

# An absolute path is printed as given, and two files are sorted by file then line.
run sample.md-absolute 1 --limit 'Methods=100' "$files/sample.md"
sed "s|^$files/||" "$out" >"$test_root/absolute"
python3 "$check" --limit 'Methods=100' sample.md >"$test_root/relative" 2>/dev/null
cmp -s "$test_root/absolute" "$test_root/relative" || fail "sample.md-absolute: output differs from the relative run"
run two-files 1 --limit 'Methods=100' --limit 'Abstract=10' sample.tex sample.md
[ "$(head -1 "$out" | cut -d: -f1)" = sample.md ] || fail "two-files: first line not from sample.md [$(head -1 "$out")]"
[ "$(wc -l <"$out")" -eq 30 ] || fail "two-files: $(wc -l <"$out") lines, expected 30 (the 14 of each file, plus the Methods section of sample.tex and the unmatched Abstract limit of sample.md)"

# The clean files: each check's near miss stays silent.
run clean.md 0 --limit ' limits =12' clean.md
expect_all clean.md clean.md '' '' '' '' '' '' '' '' '' '' '' ''
run clean.tex 0 --limit 'abstract=12' clean.tex
expect_all clean.tex clean.tex '' '' '' '' '' '' '' '' '' '' '' ''
run empty.md 0 empty.md
[ -s "$out" ] && fail "empty.md: output is not empty"

# The forms each check names.
run dash.md 1 dash.md
expect_all dash.md dash.md '1 2 45 49' '1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69' '' '' '' '' '' '' '' '' '' ''
run dash.tex 1 dash.tex
expect_all dash.tex dash.tex 8 '1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27' '' '' '' '' '' '' '' '' '' ''
expect_line dash.tex dash-aside 'dash.tex:13: dash-aside: "Psychophysiology -- postdoctoral": a dash used as an aside'

run history.md 1 history.md
expect_all history.md history.md '' '' '1 2 3 4 5 6 7 8 9 10 11 12 13' '' '' '' '' '' '' '' '' ''
run sub/nested.md 1 sub/nested.md
expect sub/nested.md sub/nested.md history 1

run throat.md 1 throat.md
expect_all throat.md throat.md '' '' '' '' '' '1 2 3 4 5 6 7 8 9 10 11 12 13 14 18 21' '' '' '1 4' '' '' ''

expect_line throat.md throat-clearing 'throat.md:18: throat-clearing: "at the end of the day": a throat-clearing opener, to be cut'
expect_line throat.md throat-clearing 'throat.md:21: throat-clearing: "at the end of the day": a throat-clearing opener, to be cut'

run words.md 1 words.md
expect_all words.md words.md '' '' '' '' '' '' '1 2 3 4 5 6 7 41 41' '8 9 10 11 12 13 14 15 41' \
    '16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40' '' '' ''

run sections.md 1 --limit 'one=4' --limit 'TWO=6' --limit '  three  =1' --limit 'four=3' --limit 'Five=3' \
    --limit 'six=11' --limit 'code=1' --limit 'dup=3' --limit 'Dup=2' --limit 'A=B=1' sections.md
expect_all sections.md sections.md '' '' '' '1 1 5 9 11 17 19 19 21' '' '' '' '' '' '' '' ''
expect_line sections.md section-words 'sections.md:1: section-words: "One": 5 words, over the limit of 4'
expect_line sections.md section-words 'sections.md:1: section-words: "code": no heading matches this limit'
expect_line sections.md section-words 'sections.md:5: section-words: "Three": 2 words, over the limit of 1'
expect_line sections.md section-words 'sections.md:11: section-words: "Six": 12 words, over the limit of 11'
expect_line sections.md section-words 'sections.md:19: section-words: "dup": 4 words, over the limit of 2'
expect_line sections.md section-words 'sections.md:21: section-words: "A=B": 4 words, over the limit of 1'
run sections.tex 1 --limit 'abstract=2' --limit 'intro=1' --limit 'deep part=2' --limit 'deeper=1' --limit 'tail=4' --limit 'the nested part=1' \
    --limit 'Methods=1' --limit 'last=1' sections.tex
expect_all sections.tex sections.tex '' '' '' '1 5 7 11 14 16 18' '' '' '' '' '' '' '' ''
expect_line sections.tex section-words 'sections.tex:1: section-words: "Abstract": 3 words, over the limit of 2'
expect_line sections.tex section-words 'sections.tex:11: section-words: "Tail": 5 words, over the limit of 4'
expect_line sections.tex section-words 'sections.tex:14: section-words: "The Nested Part": 2 words, over the limit of 1'

run notes.txt 1 --limit 'Methods; Results=10' notes.txt
expect_all notes.txt notes.txt '' '' '' 1 3 '' '' '' '' '' '' ''
run notes.md 0 --limit 'Methods; Results=10' notes.md

run semitab.md 1 semitab.md
expect_all semitab.md semitab.md '' '' '' '' 15 '' '' '' '' '' '' ''
run semitab.tex 1 semitab.tex
expect_all semitab.tex semitab.tex '' '' '' '' 7 '' '' '' '' '' '' ''
run semi499.md 1 semi499.md
expect_all semi499.md semi499.md '' '' '' '' 1 '' '' '' '' '' '' ''
expect_line semi499.md semicolons 'semi499.md:1: semicolons: "alpha; alpha alpha alpha alpha alpha alpha alpha alpha alpha": 1 semicolon in 499 words of running prose, more than 2 per 1000 words'
run semi500.md 0 semi500.md

run equal.md 1 equal.md
expect_all equal.md equal.md '' '' '' '' '' '' '' '' '' '1 45 51 55' '' ''
expect_line equal.md equal-length 'equal.md:1: equal-length: "The first file is read now.": 5 consecutive sentences of 6, 5, 7, 5, 6 words'

run contrast.md 1 contrast.md
expect_all contrast.md contrast.md '' '' '' '' '' '' '' '' '' '' '1 2 3 4 5 6 21 22 25 26 27 29 30 40' ''
expect_line contrast.md contrast 'contrast.md:4: contrast: "Not the page, the": a binary contrast, 14 in this file, more than 2'
expect_line contrast.md contrast 'contrast.md:22: contrast: "not an offer to do machine learning for your group, it": a binary contrast, 14 in this file, more than 2'
expect_line contrast.md contrast 'contrast.md:26: contrast: "not the page but the": a binary contrast, 14 in this file, more than 2'
expect_line contrast.md contrast 'contrast.md:29: contrast: "not the file'"'"'s well-kept copy, it": a binary contrast, 14 in this file, more than 2'
run tabcells.tex 1 tabcells.tex
expect_all tabcells.tex tabcells.tex '' '' '' '' '' '' '' '' '' '' '1 2 5' ''

run colon.md 1 colon.md
expect_all colon.md colon.md '' '' '' '' '' '' '' '' '' '' '' '9 14'
run colon.tex 1 colon.tex
expect_all colon.tex colon.tex '' '' '' '' '' '' '' '' '' '' '' '6 19'
run frontdots.md 0 frontdots.md
run frontopen.md 1 frontopen.md
expect_all frontopen.md frontopen.md '' 2 '' '' '' '' '' '' '' '' '' ''

run nonascii.md 1 nonascii.md
expect_all nonascii.md nonascii.md '3 4 5 6 8' '' '' '' '' '' '' '' '' '' '' ''
expect_line nonascii.md non-ascii "nonascii.md:3: non-ascii: \"$times\": U+00D7 is not ASCII and not a letter"
expect_line nonascii.md non-ascii "nonascii.md:4: non-ascii: \"$nbsp\": U+00A0 is not ASCII and not a letter"
expect_line nonascii.md non-ascii "nonascii.md:5: non-ascii: \"$checkmark\": U+2705 is not ASCII and not a letter"
expect_line nonascii.md non-ascii "nonascii.md:8: non-ascii: \"$acute\": U+0301 is not ASCII and not a letter"

# Runs stop at headings, text beside a LaTeX
# structure command, begin and end on one line, fences under list items, LaTeX code and
# references, one-line data rows, the order of two flags on one line, CR line ends and a
# frontmatter opener with trailing spaces.
run eq.md 0 eq.md
run eq.tex 0 eq.tex
run eqabs.tex 0 eqabs.tex
run eqpara.tex 1 eqpara.tex
expect_all eqpara.tex eqpara.tex '' '' '' '' '' '' '' '' '' 1 '' ''
run structure.tex 1 --limit 'Intro=4' --limit 'abstract=5' structure.tex
expect_all structure.tex structure.tex '' '' '2 8' '1 3' '' '' '2 3 4 7 8' '' '' '' '' ''
expect_line structure.tex section-words 'structure.tex:1: section-words: "Abstract": 15 words, over the limit of 5'
expect_line structure.tex section-words 'structure.tex:3: section-words: "Intro": 20 words, over the limit of 4'
run onelinetable.tex 1 onelinetable.tex
expect_all onelinetable.tex onelinetable.tex '' '' '' '' 2 '' '' '' '' 3 '' ''
run onelinelist.tex 1 onelinelist.tex
expect_all onelinelist.tex onelinelist.tex '' '' '' '' '' '' '' '' '' 2 '' ''
run listfence.md 1 listfence.md
expect_all listfence.md listfence.md '' 7 '' '' '' '' '' '' '' '' '' ''
run code.tex 1 code.tex
expect_all code.tex code.tex '' 17 '' '' '' '' '' '' '' '' '' ''
run semirow.md 1 semirow.md
expect_all semirow.md semirow.md '' '' '' '' '3 5 6 8' '' '' '' '' '' '' ''
run semirow.tex 1 semirow.tex
expect_all semirow.tex semirow.tex '' '' '' '' '5 17 21' '' '' '' '' '' '' ''
expect_line semirow.tex semicolons 'semirow.tex:5: semicolons: "The check reads 5% of one page; it writes none.": 3 semicolons in 26 words of running prose, more than 2 per 1000 words'
run tie.md 1 tie.md
[ "$(cut -d'"' -f2 "$out" | tr '\n' '/')" = "z -- a./just/very/" ] || fail "tie.md: order [$(cat "$out")], expected dash-aside, then filler just, then filler very"
run crlf.md 1 crlf.md
expect_all crlf.md crlf.md '' 4 '' '' '' '' '' '' '' '' '' ''
run frontspace.md 0 frontspace.md
run cellend.md 1 cellend.md
expect_all cellend.md cellend.md '' 2 '' '' '' '' '' '' '' '' '' ''
run tabsec.tex 0 --limit 'T=4' tabsec.tex
run preamble.tex 0 --limit 'P=2' preamble.tex
run latexspace.tex 1 latexspace.tex
expect_all latexspace.tex latexspace.tex '' '' '' '' '' '' '' '' '' 1 '5 6 7 8 9' ''
run eqmath.tex 1 eqmath.tex
expect_all eqmath.tex eqmath.tex '' '' '' '' '' '' '' '' '' 1 '' ''
run mathitem.tex 1 mathitem.tex
expect_all mathitem.tex mathitem.tex '' '' '' '' '' '' '' '' '' '' '2 3 4' ''

# A subordinate clause after an opening quote or bracket is skipped; the control is flagged.
run quotedclause.tex 0 quotedclause.tex
run quotedcontrol.tex 1 quotedcontrol.tex
expect_all quotedcontrol.tex quotedcontrol.tex '' '' '' '' '' '' '' '' '' '' '1 3 5' ''

# A one-line paragraph that ends with a colon is running prose; a keywords line is a data row.
run leadin.md 1 leadin.md
expect_all leadin.md leadin.md '' '' '' '' 1 '' '' '' '' '' '' ''
run leadincontrol.md 0 leadincontrol.md

# The usage errors.
usage "no file"
usage "only a limit" --limit 'Methods=3'
usage "limit without =" --limit Abstract sample.md
grep -q "Abstract" "$err" || fail "usage limit without =: stderr does not name the limit [$(cat "$err")]"
usage "limit of 0" --limit 'Abstract=0' sample.md
usage "negative limit" --limit 'Abstract=-2' sample.md
usage "fractional limit" --limit 'Abstract=1.5' sample.md
usage "limit that is a word" --limit 'Abstract=ten' sample.md
usage "empty limit value" --limit 'Abstract=' sample.md
usage "empty heading" --limit '=5' sample.md
usage "blank heading" --limit ' =5' sample.md
usage "limit with no value" sample.md --limit
usage "missing file" missing.md
grep -q 'missing.md' "$err" || fail "usage missing file: stderr does not name missing.md [$(cat "$err")]"
usage "missing file after a good one" sample.md missing.md
usage "directory" sub
usage "non-UTF-8 file" latin1.md
grep -q 'latin1.md' "$err" || fail "usage non-UTF-8 file: stderr does not name latin1.md [$(cat "$err")]"
if [ ! -r locked.md ]; then
    usage "unreadable file" locked.md
fi

after=$(find . -type f -exec cksum {} + 2>/dev/null | sort)
[ "$before" = "$after" ] || fail "a run wrote to a file"

printf 'PASS: check_prose.py scratch tests\n'
