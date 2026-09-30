Everything in the brief is done.

## Open items of the state file, verbatim

- Approval stops under a ruling (2026-09-30, raised at step 9's landing): step 9 landed the one-ruling sentence for the approvals the orchestrator itself asks for (what a new script computes, a change to the configuration or the verification list). A skill the option runs still stops at its own approval (`/roadmap`'s diff, `/ordo-init`'s and `/repo-setup`'s drafts, `/plan`'s step list), and the option names that stop. A version that let those skills skip their stop under a ruling was built in the repair round and left out of main, since its review found five gaps: the mechanics sat only in the glossary, which no skill reads; the ruling was to be named in a commit that a repository's commit rule can forbid, and `/ordo-init` run alone takes its commit rule from the very stop it would skip; the question stops, `/ordo-init` inside `/repo-setup` and `sync`'s hunks were not covered; `ordo-init`'s rule that a change to an existing file waits for approval was left without the exception; `/plan`'s gate answers are drafted after the ruling. Options: (a) a new step 9a, "approved by a ruling": `plan-orchestration` quotes the ruling when it runs a skill; each of `plan`, `roadmap`, `ordo-init` and `repo-setup` reads the quoted ruling ("What it reads") and, at each approval stop, compares the draft with the ruled text and skips the stop only when they are the same change; the question stops of `repo-setup` and `ordo-init` are skipped when the ruling states the answers; `/ordo-init` inside `/repo-setup` takes the same ruling; `sync`'s hunks included; the ruling is named in the commit, or, where the commit rule forbids one, in the list of files written that the skill shows; `ordo-init`'s Rules 5 gains the exception; `/plan` still stops when a gate or a step's check could pass without the goal. Approving (a) also approves adding that step to `plan.md` as "9a ... (ruling Approval stops under a ruling)", and its text in those four skills; step 12 went ahead of this ruling overnight, so under (a) 9a runs after step 12 and also names `grill`'s roadmap-diff decision among the stops it covers. (b) Keep what landed: a skill's own approval stop stays, and the option names it, so the user sees each such change twice. Recommendation: (a), since unattended runs meet those stops and one decision should not be asked twice; (b) is the lazy option.
- Old rule 13 in game-engine and cathedra (2026-09-30, raised at step 8's landing): step 8 rewrote rule 13 of Ordo's change standard and its template, and `/spec`'s brief template and `/refute` now brief and review under it. game-engine's `docs/dev/change-standard.md:25` and cathedra's `docs/dev/standards/change-standard.md:25` still hold the old rule ("names the revert that turns it red"), and `repo-setup` does not sync the change standard. After the next pin, a brief in either repository would ask for a failure on the unchanged tree while its rules file, which a brief never overrides, asks for a named revert per test. Options: (a) step 15, which already edits those two repositories and leaves the edits for Axel to commit, also rewrites rule 13 there to Ordo's text, adapted to each page's numbering; (b) leave their pages, and accept that Ordo's skills and their rules files disagree on this rule. Recommendation: (a), since the mismatch reaches every step run there after the pin and the edit rides on a step that already touches both. (b) is the lazy option.
- The old skill name in other repositories (2026-09-30, raised at step 10's review): after the next pin `/plan-help` no longer exists, and these files still name it (`grep -rIl -i plan-help`, `.git` and `.scratch` left out): `game-engine/.agents/plan.yaml:1` and `cathedra/.agents/plan.yaml:1` (the comment listing the plan skills); `research-hub/.agents/plan.yaml:1`, `research-hub/CLAUDE.md:33` (read by every session there), `research-hub/docs/AGENT-APPROACH.md`, `research-hub/tools/figures/gen_figures.py` and `plan-loop.svg`. research-hub is read only, and changing another repository waits for Axel under ruling "Overnight work" 5. Options: (a) step 15, which already edits game-engine's and cathedra's `.agents/plan.yaml` and leaves the edit for Axel to commit, also changes their line 1 to `/ordo-help`; Axel changes research-hub's files himself, or rules that a step of a later plan does. Pros: the pin at 2.E's closing leaves no repository pointing at a missing skill; no extra commit in each repository. Cons: step 15 grows by one line per repository. Approving (a) also approves adding "and line 1's `/plan-help` becomes `/ordo-help`" to step 15's line in plan.md. (b) leave them: the lazy option, since a session in research-hub reads CLAUDE.md's list and types a skill that no longer exists. Recommendation: (a).
- Step 6 reading (2026-09-30): step 6 landed with its check, Axel's reading of `skills/repo-setup/templates/docs/dev/ui-standard.md`, pending (ruling "Overnight work" 2); it stays unticked until he approves. Points for his reading: the three rules beyond the plan's four (colour never the only carrier, styling a shared component, text from the catalog) and the added thresholds (the brief's decision 3); the AA criteria not cited (1.4.4, 1.4.10, 2.5.8, 4.1.2), bound by the opening; 2.4.7 stated for keyboard focus in every mode, stricter than the criterion's "a mode of operation"; large text without the CJK clause of WCAG's definition. Options: (a) approve as landed; (b) name the changes, made on top of what landed as a correction. Recommendation: (a), after reading the page, which is 11 lines.
- Step 12 reading (2026-09-30): step 12 landed with its check, Axel's reading of `skills/grill/SKILL.md` against `docs/dev/skill-layout.md`, pending (ruling "Overnight work" 2); it stays unticked until he approves. Points for his reading: the five rulings decided overnight for it (plan.md Rulings, "Step 12, ..."), the "Rule:" reference line for decisions about the repository's own pages, which narrows G2's "the bar sets what it cites" to design decisions; a lookup agent whose effort cannot apply leaves the lookups to the session instead of stopping; the resumed interview, which reads an answer only against the last round shown; the builder's dry run on roadmap entry 3 (`12-report.md`), which predates repair round 1 (its D5 to D7 would now carry "Rule:" and write Rulings bullets). Options: (a) approve as landed; (b) name the changes, made on top of what landed. Recommendation: (a) once read. The lazy option is approving unread.

## The cases, first run on the unchanged tree (base ef5d3a9, before any change)

- `ls docs/figures/gen_figures.py docs/figures/pipeline.svg docs/figures/plan-loop.svg`: "No such file or directory" for each of the three, exit 1. Fails, as the brief expects.
- `python3 docs/figures/gen_figures.py`: "can't open file ... [Errno 2] No such file or directory", exit 2.
- `LC_ALL=C grep -n '[^ -~]' docs/figures/*`: zsh "no matches found: docs/figures/*" (the folder does not exist), so nothing to scan.
- `git grep --untracked -n -i -E "plan-help|plan help" -- . ':!.scratch'`: prints nothing, exit 1.
- `ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 docs/figures/gen_figures.py`: "Found 1 error." (the file does not exist), exit 1.
- `python3 -c "import xml.dom.minidom,sys; [xml.dom.minidom.parse(f) for f in sys.argv[1:]]" docs/figures/*.svg`: "no matches found: docs/figures/*.svg", exit 1.
- The scratch-copy error case, the renders, the readings and the contrast readings have nothing to run on before the change.
- No case of the brief was wrong on this tree; no hand-back.

## DONE / NOT DONE

| Item | Command or reading that proves it | Result |
|---|---|---|
| 1 `docs/figures/gen_figures.py` | `wc -l docs/figures/gen_figures.py`; `python3 docs/figures/gen_figures.py` | DONE. 685 lines, standard library only; prints `wrote docs/figures/pipeline.svg (25245 bytes)` and `wrote docs/figures/plan-loop.svg (24252 bytes)`, exit 0 |
| 1 the two SVG files | `ls docs/figures` | DONE. `gen_figures.py pipeline.svg plan-loop.svg` |
| 2 `README.md`, both figures after line 46 | `git diff -U0 README.md` | DONE. 8 lines added after line 46 |
| 3 `docs/dev/building.md` line | `git diff -U0 docs/dev/building.md` | DONE, quoted below |
| 4 `docs/glossary.md` entry | `git diff -U0 docs/glossary.md` | DONE, quoted below |
| Case: files exist after | `ls docs/figures/gen_figures.py docs/figures/pipeline.svg docs/figures/plan-loop.svg` | DONE, exit 0 |
| Case: second run changes no byte | copies taken after run 1 and run 2, `git diff --no-index $TMPDIR/idem/a $TMPDIR/idem/b; echo "diffrc=$?"` | DONE. prints nothing, `diffrc=0`; each run printed two `wrote` lines |
| Case: runs the same from any directory | `cd / && python3 /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-12a/docs/figures/gen_figures.py` | DONE. exit 0, same two `wrote docs/figures/...` lines |
| Case: ASCII | `LC_ALL=C grep -n '[^ -~]' docs/figures/* README.md docs/dev/building.md docs/glossary.md; echo "asciirc=$?"` | DONE. prints nothing, `asciirc=1` (grep found no match) |
| Case: no plan-help | `git grep --untracked -n -i -E "plan-help|plan help" -- . ':!.scratch'` | DONE. prints nothing |
| Case: ruff | `ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 docs/figures/gen_figures.py` | DONE. `All checks passed!`; `ruff format --check --line-length 100` prints `1 file already formatted` |
| Case: too-long label | scratch copy under `$TMPDIR/err/docs/figures/` with the closing box's label repeated four times | DONE. exit 1, stderr `error: pipeline.svg: box 'the closing': the label 'The roadmap diff of the closing step, ...' does not fit the box`, and `ls $TMPDIR/err/docs/figures` lists only the copied `gen_figures.py`: nothing written. A second scratch copy with an accented letter in a label: `error: pipeline.svg: the body holds a character that is not ASCII`, rc=1 |
| Case: well-formed XML | `python3 -c "import xml.dom.minidom,sys; ..." docs/figures/*.svg; echo xmlrc=$?` | DONE. `xmlrc=0` |
| Case: renders read | `rsvg-convert -z 1.5 docs/figures/<name>.svg -o $TMPDIR/figs/<name>.png`, both images opened with Read | DONE, see "What was seen" |
| Case: each box against its Stops table | table "Boxes against the Stops tables" below | DONE |
| Case: contrast | table "Contrast" below | DONE |
| Case: README sentences and alt texts against the prose standard | reading, below | DONE |
| Verify 1: the verify list | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"` | DONE, lines quoted below |
| Verify 3: ASCII over changed and new files | `LC_ALL=C grep -n '[^ -~]'` over `docs/figures/*`, `README.md`, `docs/dev/building.md`, `docs/glossary.md` | DONE, prints nothing |
| Verify 4: no test added | ruling Open item A; `git status --short` lists only `README.md`, `docs/dev/building.md`, `docs/glossary.md`, `docs/figures/` | DONE. The step adds no test |

No item is NOT DONE.

## The verify list, verbatim (rc from the run, with the checks runner's own last line)

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0
```

## The script, whole (`docs/figures/gen_figures.py`, 685 lines)

```python
"""Write the two SVG figures of the README: the pipeline of one roadmap entry and the plan loop.

Writes, beside this file:

- pipeline.svg: /repo-setup or /ordo-init, /roadmap add, /grill, /plan, every step, the closing,
  with /plan-retro and /ordo-help beside them.
- plan-loop.svg: /spec, build it, /refute, close them, /refute over the round, /land, the return
  for a further round, the stops and refusals, and the /plan-orchestration band.

Every box, arrow and label is written in this file, taken from each skill's Stops table and from
the sequence /ordo-help prints; the script reads no skill file. A change to a Stops table, to the
sequence or to a skill name is made in the labels below, and the script is run again.

Run, from any directory: python3 docs/figures/gen_figures.py

Every byte written is ASCII. The figures carry their own light panel, so they read the same on a
light or a dark page. Each box shows where the user is asked with a mark that differs by shape and
by a word: a filled square "every run", an outlined square "only when", a dashed pill "optional".

Errors, each printed to stderr as "error: <message>":

- a label that does not fit its box or its line: the message names the figure,
  the box and the label;
- a word longer than a line of its box: the same message;
- a body that holds a non-ASCII character: the message names the file;
- a file that cannot be written or read back: the message names the file and the cause;
- a file whose text read back differs from the body written: the message names the file.

The label and ASCII errors stop the run before any file is written.

Exit status: 0 both files written and verified, 1 an error above.
"""

import sys
from dataclasses import dataclass
from html import escape
from itertools import pairwise
from pathlib import Path
from typing import NamedTuple

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent.parent

INK = "#0f172a"
MUTED = "#475569"
EDGE = "#64748b"
PANEL = "#f8fafc"
CARD = "#ffffff"
ACCENT = "#4f46e5"
STOP = "#b45309"
FONT = "ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif"

REGULAR_EM = 0.6
BOLD_EM = 0.68
CAPS_EM = 0.78
PAD_X = 10
TITLE_SIZE = 14
BODY_SIZE = 11.5
NAME_SIZE = 11
BADGE_SIZE = 10
CAPTION_SIZE = 10
BODY_LEADING = 15
NAME_LEADING = 14
BADGE_HEIGHT = 16

EVERY_RUN = "every run"
ONLY_WHEN = "only when"
OPTIONAL = "optional"


class FigureError(Exception):
    """A label that does not fit, or a file that is not what was asked."""


@dataclass(frozen=True)
class Group:
    """The stops a box carries under one mark; an empty mark is a plain note."""

    mark: str
    names: tuple[str, ...] = ()


class Rect(NamedTuple):
    """The position and size of a box, in pixels."""

    x: float
    y: float
    w: float
    h: float


@dataclass(frozen=True)
class Box:
    """A card with a title, a body, the groups of stops and an optional closing note."""

    area: Rect
    title: str
    body: str = ""
    groups: tuple[Group, ...] = ()
    note: str = ""
    dashed: bool = False
    columns: int = 1
    accent: str = ACCENT

    @property
    def x(self) -> float:
        return self.area.x

    @property
    def y(self) -> float:
        return self.area.y

    @property
    def w(self) -> float:
        return self.area.w

    @property
    def h(self) -> float:
        return self.area.h


def _num(value: float) -> str:
    return f"{value:.1f}".rstrip("0").rstrip(".")


def _em(bold: bool, caps: bool = False) -> float:
    if caps:
        return CAPS_EM
    return BOLD_EM if bold else REGULAR_EM


def _wrap(
    figure: str, where: str, label: str, width: float, size: float, bold: bool = False
) -> list[str]:
    """Wrap a label greedily to the character budget of a width, conservative per character."""
    budget = int(width / (size * _em(bold)))
    lines: list[str] = []
    current = ""
    for word in label.split():
        if len(word) > budget:
            raise FigureError(
                f"{figure}: {where}: the word {word!r} of the label {label!r} is longer than a line"
            )
        if current and len(current) + 1 + len(word) > budget:
            lines.append(current)
            current = word
        else:
            current = f"{current} {word}".strip()
    if current:
        lines.append(current)
    return lines


def _check_line(
    figure: str,
    where: str,
    label: str,
    width: float,
    size: float,
    bold: bool = False,
    caps: bool = False,
) -> None:
    """A label drawn on one line must fit the width."""
    if len(label) * size * _em(bold, caps) > width:
        raise FigureError(
            f"{figure}: {where}: the label {label!r} does not fit one line of {_num(width)} px"
        )


class Canvas:
    """The SVG fragments of one figure, written in order."""

    def __init__(self, name: str, width: int, height: int, label: str) -> None:
        self.name = name
        self.width = width
        self.height = height
        self.label = label
        self.parts: list[str] = []

    def text(
        self,
        x: float,
        y: float,
        label: str,
        size: float,
        fill: str = INK,
        weight: str = "400",
        anchor: str = "start",
    ) -> None:
        self.parts.append(
            f'<text x="{_num(x)}" y="{_num(y)}" font-family="{FONT}" font-size="{_num(size)}" '
            f'fill="{fill}" font-weight="{weight}" text-anchor="{anchor}">'
            f"{escape(label, quote=False)}</text>"
        )

    def line(
        self,
        x1: float,
        y1: float,
        x2: float,
        y2: float,
        colour: str,
        width: float,
        arrow: bool = False,
    ) -> None:
        marker_attr = ' marker-end="url(#arrow)"' if arrow else ""
        self.parts.append(
            f'<line x1="{_num(x1)}" y1="{_num(y1)}" x2="{_num(x2)}" y2="{_num(y2)}" '
            f'stroke="{colour}" stroke-width="{_num(width)}"{marker_attr}/>'
        )

    def path(
        self,
        points: list[tuple[float, float]],
        colour: str,
        width: float,
        dash: str = "",
        arrow: bool = False,
    ) -> None:
        d = "M" + " L".join(f"{_num(px)},{_num(py)}" for px, py in points)
        dash_attr = f' stroke-dasharray="{dash}"' if dash else ""
        marker_attr = ' marker-end="url(#arrow)"' if arrow else ""
        self.parts.append(
            f'<path d="{d}" fill="none" stroke="{colour}" stroke-width="{_num(width)}"'
            f'{dash_attr}{marker_attr} stroke-linejoin="round"/>'
        )

    def rect(
        self,
        x: float,
        y: float,
        w: float,
        h: float,
        radius: float,
        fill: str,
        stroke: str,
        stroke_width: float = 1.5,
        dash: str = "",
    ) -> None:
        dash_attr = f' stroke-dasharray="{dash}"' if dash else ""
        self.parts.append(
            f'<rect x="{_num(x)}" y="{_num(y)}" width="{_num(w)}" height="{_num(h)}" '
            f'rx="{_num(radius)}" fill="{fill}" stroke="{stroke}" '
            f'stroke-width="{_num(stroke_width)}"{dash_attr}/>'
        )

    def render(self) -> str:
        head = (
            f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {self.width} {self.height}" '
            f'width="{self.width}" height="{self.height}" role="img" '
            f'aria-label="{escape(self.label)}">'
        )
        marker = (
            '<marker id="arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" '
            'markerHeight="7" orient="auto">'
            f'<path d="M0,0 L10,5 L0,10 z" fill="{ACCENT}"/></marker>'
        )
        panel = (
            f'<rect x="0" y="0" width="{self.width}" height="{self.height}" rx="10" '
            f'fill="{PANEL}" stroke="{EDGE}"/>'
        )
        title = f"<title>{escape(self.label, quote=False)}</title>"
        return (
            "\n".join([head, title, f"<defs>{marker}</defs>", panel, *self.parts, "</svg>"]) + "\n"
        )


def _badge_width(mark: str) -> float:
    return len(mark) * BADGE_SIZE * BOLD_EM + 14


def draw_badge(canvas: Canvas, x: float, baseline: float, mark: str) -> float:
    """Draw a mark with its word and return its width."""
    width = _badge_width(mark)
    top = baseline - 12
    if mark == EVERY_RUN:
        canvas.rect(x, top, width, BADGE_HEIGHT, 2, ACCENT, ACCENT, 1.5)
        fill = CARD
    elif mark == ONLY_WHEN:
        canvas.rect(x, top, width, BADGE_HEIGHT, 2, CARD, ACCENT, 1.5)
        fill = INK
    else:
        canvas.rect(x, top, width, BADGE_HEIGHT, BADGE_HEIGHT / 2, CARD, ACCENT, 1.5, "3 2")
        fill = INK
    canvas.text(x + width / 2, baseline, mark, BADGE_SIZE, fill, "700", "middle")
    return width


class _Put:
    """Checks that a baseline stays inside a box, naming the label that would leave it."""

    def __init__(self, canvas: Canvas, box: Box) -> None:
        self.canvas = canvas
        self.box = box

    def check(self, baseline: float, label: str) -> None:
        if baseline > self.box.y + self.box.h - 8:
            raise FigureError(
                f"{self.canvas.name}: box {self.box.title!r}: "
                f"the label {label!r} does not fit the box"
            )


def _draw_names(canvas: Canvas, box: Box, group: Group, cursor: float, put: _Put) -> float:
    """Draw the names of a group in the box's columns; return the baseline for the next line."""
    inner = box.w - 2 * PAD_X
    column_width = inner / box.columns
    names = list(group.names)
    for start in range(0, len(names), box.columns):
        row = names[start : start + box.columns]
        wrapped = [
            _wrap(canvas.name, f"box {box.title!r}", "- " + name, column_width - 6, NAME_SIZE)
            for name in row
        ]
        height = max(len(lines) for lines in wrapped)
        for line_index in range(height):
            put.check(cursor + line_index * NAME_LEADING, ", ".join(row))
        for column, lines in enumerate(wrapped):
            for line_index, line in enumerate(lines):
                indent = 0 if line_index == 0 else 8
                canvas.text(
                    box.x + PAD_X + column * column_width + indent,
                    cursor + line_index * NAME_LEADING,
                    line,
                    NAME_SIZE,
                )
        cursor += height * NAME_LEADING
    return cursor


def draw_box(canvas: Canvas, box: Box) -> None:
    """Draw a card: rule, title, body, the groups of stops with their marks, and the note."""
    figure = canvas.name
    put = _Put(canvas, box)
    inner = box.w - 2 * PAD_X
    canvas.rect(box.x, box.y, box.w, box.h, 8, CARD, EDGE, 1.5, "6 4" if box.dashed else "")
    canvas.line(box.x + 8, box.y, box.x + box.w - 8, box.y, box.accent, 3)
    _check_line(figure, f"box {box.title!r}", box.title, inner, TITLE_SIZE, bold=True)
    cursor = box.y + 24
    put.check(cursor, box.title)
    canvas.text(box.x + PAD_X, cursor, box.title, TITLE_SIZE, INK, "700")
    cursor += 20
    for line in _wrap(figure, f"box {box.title!r}", box.body, inner, BODY_SIZE):
        put.check(cursor, line)
        canvas.text(box.x + PAD_X, cursor, line, BODY_SIZE)
        cursor += BODY_LEADING
    for group in box.groups:
        cursor += 6
        if group.mark:
            put.check(cursor + 4, group.mark)
            draw_badge(canvas, box.x + PAD_X, cursor, group.mark)
            cursor += 20
            cursor = _draw_names(canvas, box, group, cursor, put)
        else:
            for name in group.names:
                for line in _wrap(figure, f"box {box.title!r}", name, inner, NAME_SIZE):
                    put.check(cursor, line)
                    canvas.text(box.x + PAD_X, cursor, line, NAME_SIZE, MUTED)
                    cursor += NAME_LEADING
    if box.note:
        cursor += 6
        for line in _wrap(figure, f"box {box.title!r}", box.note, inner, NAME_SIZE):
            put.check(cursor, line)
            canvas.text(box.x + PAD_X, cursor, line, NAME_SIZE, MUTED)
            cursor += NAME_LEADING


def draw_caption(canvas: Canvas, x: float, y: float, label: str, width: float) -> None:
    _check_line(canvas.name, "a caption", label, width, CAPTION_SIZE, bold=True, caps=True)
    canvas.text(x, y, label, CAPTION_SIZE, MUTED, "700")


def draw_note(canvas: Canvas, x: float, y: float, label: str, width: float) -> None:
    _check_line(canvas.name, "a note", label, width, NAME_SIZE)
    canvas.text(x, y, label, NAME_SIZE, MUTED)


def draw_legend(canvas: Canvas, x: float, y: float, width: float) -> None:
    """The three marks and the dashed box, each with what it says, on one row."""
    draw_caption(canvas, x, y, "HOW TO READ THE MARKS", width)
    items = (
        (EVERY_RUN, "it waits on you each time it runs"),
        (ONLY_WHEN, "it waits on you in the named case"),
        (OPTIONAL, "you may skip it; the box is dashed"),
    )
    step = width / len(items)
    for index, (mark, meaning) in enumerate(items):
        left = x + index * step
        badge = draw_badge(canvas, left, y + 26, mark)
        _check_line(canvas.name, "the legend", meaning, step - badge - 22, NAME_SIZE)
        canvas.text(left + badge + 8, y + 26, meaning, NAME_SIZE)


def pipeline_svg() -> str:
    """The pipeline of one roadmap entry, from the repository's setup to the closing."""
    canvas = Canvas(
        "pipeline.svg",
        1040,
        860,
        "The pipeline of one roadmap entry: /repo-setup for a new repository or /ordo-init for an "
        "existing one, /roadmap add, the optional /grill, /plan, every step of the plan loop, and "
        "the closing; /plan-retro and /ordo-help are optional beside it. Each box marks where you "
        "are asked.",
    )
    draw_caption(canvas, 25, 30, "SET THE REPOSITORY UP, ONCE: ONE OF THE TWO", 600)
    setup = Box(
        Rect(25, 42, 330, 214),
        "/repo-setup",
        "For a new repository: the tree, the shared rules, the standards, then /ordo-init.",
        (
            Group(EVERY_RUN, ("The questions", "The draft")),
            Group(ONLY_WHEN, ("No commit allowed",)),
        ),
        note="The stops of its sync form are left out: sync is not on this path.",
    )
    init = Box(
        Rect(395, 42, 330, 214),
        "/ordo-init",
        "For an existing repository: writes .agents/plan.yaml, or checks the one there.",
        (
            Group(EVERY_RUN, ("The draft", "Worker, reviewer and libraries")),
            Group(
                ONLY_WHEN,
                (
                    "Several roadmaps",
                    "A failing command",
                    "A fix in the check",
                    "No commit allowed",
                ),
            ),
        ),
    )
    draw_box(canvas, setup)
    draw_box(canvas, init)
    canvas.text(375, 150, "or", 12, MUTED, "700", "middle")

    draw_caption(canvas, 140, 314, "FOR EACH ROADMAP ENTRY, IN ORDER", 600)
    top, height, width, gap = 326, 258, 178, 25
    columns = [Rect(25 + i * (width + gap), top, width, height) for i in range(5)]
    boxes = (
        Box(
            columns[0],
            "/roadmap add",
            "With <goal>: an entry with its goal, gate and place. "
            "With <entry>: an entry not yet specified gets its gate and place.",
            (
                Group(EVERY_RUN, ("The change",)),
                Group(
                    ONLY_WHEN,
                    ("No gate", "The level", "The insertion form", "A missing dependency"),
                ),
            ),
        ),
        Box(
            columns[1],
            "/grill <entry>",
            "An interview in rounds that settles the entry's design decisions.",
            (
                Group(OPTIONAL),
                Group(EVERY_RUN, ("A round", "The end")),
                Group(ONLY_WHEN, ("A lookup agent served another model",)),
            ),
            dashed=True,
        ),
        Box(
            columns[2],
            "/plan <entry>",
            "Once per entry: opens the plan and shows the step list for approval.",
            (Group(EVERY_RUN, ("The drafted step list",)),),
        ),
        Box(
            columns[3],
            "every step",
            "The plan loop of the next figure: /spec, build it, /refute, close them, /refute, "
            "/land. /plan-orchestration runs it unattended.",
            (Group("", ("Its stops are marked in the plan-loop figure.",)),),
        ),
        Box(
            columns[4],
            "the closing",
            "/roadmap done <entry> ticks the entry with the gate's output. "
            "The ledger folder moves to the archive.",
            (Group(EVERY_RUN, ("The roadmap diff",)),),
        ),
    )
    for box in boxes:
        draw_box(canvas, box)
    for left, right in pairwise(boxes):
        canvas.line(left.x + left.w, top + 20, right.x - 1, top + 20, ACCENT, 2, arrow=True)
    join_y, target_x = 292, boxes[0].x + boxes[0].w / 2
    for source in (setup, init):
        centre = source.x + source.w / 2
        route = [(centre, source.y + source.h), (centre, join_y), (target_x, join_y)]
        canvas.path([*route, (target_x, top - 1)], ACCENT, 2, arrow=True)

    draw_caption(canvas, 25, 630, "AFTER PLANS HAVE RUN", 300)
    draw_caption(canvas, 395, 630, "AT ANY POINT", 300)
    retro = Box(
        Rect(25, 642, 330, 150),
        "/plan-retro",
        "The findings the reviews keep making, and the change that stops each.",
        (Group(OPTIONAL), Group(ONLY_WHEN, ("The proposals",))),
        dashed=True,
    )
    help_box = Box(
        Rect(395, 642, 330, 150),
        "/ordo-help",
        "Prints the sequence and, for a named plan, where it stands and the next command.",
        (Group(OPTIONAL), Group("", ("No stop.",))),
        dashed=True,
    )
    draw_box(canvas, retro)
    draw_box(canvas, help_box)
    draw_legend(canvas, 25, 818, 990)
    return canvas.render()


def plan_loop_svg() -> str:
    """The loop of one step, and the /plan-orchestration band that runs the row unattended."""
    canvas = Canvas(
        "plan-loop.svg",
        1040,
        720,
        "The plan loop of one step: /spec, build it, /refute, close them, /refute over the round "
        "or the orchestrator reading the delta, and /land, with a return for a further round, the "
        "stops and refusals, and the /plan-orchestration band that runs the row unattended. Each "
        "box marks where you are asked.",
    )
    caption = "FOR EVERY STEP, IN ORDER; RUN BY HAND, YOU TYPE EACH COMMAND OF THE ROW"
    draw_caption(canvas, 25, 30, caption, 900)
    top, height, gap = 42, 262, 18
    widths = (190, 110, 140, 120, 165, 175)
    lefts = [25 + sum(widths[:i]) + i * gap for i in range(len(widths))]
    areas = [Rect(left, top, width, height) for left, width in zip(lefts, widths, strict=True)]
    model_stop = "A model other than the configured one"
    boxes = (
        Box(
            areas[0],
            "/spec",
            "Writes the brief, has a fresh agent check it against the tree, makes the worktree.",
            (
                Group(
                    ONLY_WHEN,
                    (
                        "A false premise the plan cannot absorb",
                        "A rule clash with an ADR",
                        "A user-visible choice",
                        "A brief check finding the brief cannot absorb",
                        model_stop,
                    ),
                ),
            ),
        ),
        Box(
            areas[1],
            "build it",
            "The step is built in the worktree, the checks run, the report written.",
            (Group("", ("No stop of its own.",)),),
        ),
        Box(
            areas[2],
            "/refute",
            "A fresh reviewer changes nothing, reruns the checks, writes findings.",
            (Group(ONLY_WHEN, (model_stop,)),),
        ),
        Box(
            areas[3],
            "close them",
            "A repair round: fix the findings, rerun, rewrite the report.",
            (Group("", ("No stop of its own.",)),),
        ),
        Box(
            areas[4],
            "/refute",
            "Over the round, when refute_after_repair: yes. "
            'When refute_after_repair: no, "read the delta", by the orchestrator.',
            (Group(ONLY_WHEN, (model_stop,)),),
        ),
        Box(
            areas[5],
            "/land",
            "Onto main, the checks there, the booking, the commit; the worktree is removed.",
            (
                Group(
                    ONLY_WHEN,
                    ("A red line for the user", "A lock held", "A worktree that cannot be removed"),
                ),
            ),
        ),
    )
    for box in boxes:
        draw_box(canvas, box)
    for left, right in pairwise(boxes):
        canvas.line(left.x + left.w, top + 20, right.x - 1, top + 20, ACCENT, 2, arrow=True)

    close, again = boxes[3], boxes[4]
    bottom = top + height
    loop_y = bottom + 24
    close_x, again_x = close.x + close.w / 2, again.x + again.w / 2
    route = [(again_x, bottom), (again_x, loop_y), (close_x, loop_y), (close_x, bottom + 1)]
    canvas.path(route, ACCENT, 2, "5 4", True)
    draw_note(canvas, close_x + 8, loop_y + 15, "a further round, within repair_rounds", 300)

    cards_y, cards_h = bottom + 60, 120
    stop_card = Box(
        Rect(25, cards_y, 470, cards_h),
        "when it stops",
        "The command waits on a decision or an action of yours, named in its Stops table. "
        "A decision leaves an open item with its options and one recommendation; you answer "
        "Ruled: <the choice> as plain text, or remove the lock or the path it names, and run "
        "the command again.",
        accent=STOP,
    )
    refusal_card = Box(
        Rect(525, cards_y, 490, cards_h),
        "when it refuses",
        "The command names its cause and changes nothing more, such as a required key missing, "
        "no ledger folder, the step not ready or main not clean. A refusal carries no mark: "
        "fix the cause and run the command again.",
        accent=STOP,
    )
    draw_box(canvas, stop_card)
    draw_box(canvas, refusal_card)
    draw_caption(canvas, 25, cards_y - 12, "WHEN ANY COMMAND OF THE ROW HALTS", 400)

    band_y = cards_y + cards_h + 24
    band = Box(
        Rect(25, band_y, 990, 128),
        "/plan-orchestration <entry>",
        "Runs the row above for every step, unattended, with the executor the plan names at "
        "build it and close them. Under /plan-orchestration only the stops marked here reach you.",
        (
            Group(
                ONLY_WHEN,
                (
                    "A shape nobody named",
                    "A wrong premise",
                    "A red check",
                    "A rule clash",
                    "A finding that is the user's",
                    model_stop,
                ),
            ),
        ),
        dashed=True,
        columns=3,
    )
    draw_box(canvas, band)
    draw_legend(canvas, 25, band_y + 152, 990)
    return canvas.render()


def write_figures(figures: tuple[tuple[str, str], ...]) -> list[str]:
    """Check every body, then write each file and read it back; return one line per file."""
    for name, body in figures:
        if not body.isascii():
            raise FigureError(f"{name}: the body holds a character that is not ASCII")
    lines: list[str] = []
    for name, body in figures:
        path = HERE / name
        try:
            path.write_text(body, encoding="utf-8", newline="\n")
            written = path.read_text(encoding="utf-8")
        except OSError as error:
            raise FigureError(f"{name}: {error}") from error
        if written != body:
            raise FigureError(f"{name}: the text read back differs from the body written")
        lines.append(f"wrote {path.relative_to(ROOT).as_posix()} ({len(body)} bytes)")
    return lines


def main() -> int:
    try:
        figures = (("pipeline.svg", pipeline_svg()), ("plan-loop.svg", plan_loop_svg()))
        lines = write_figures(figures)
    except FigureError as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    for line in lines:
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main())
```

## Changed lines of the other files

README.md, after line 46 ("`/ordo-help` prints the full sequence, including what to do when a command stops."); before: line 47 was blank and line 48 the heading "## Requirements". After, added lines 47-54:

```
The pipeline of one roadmap entry, marked where you are asked: "every run" for a stop each time the skill runs, "only when" for a stop in a named case, "optional" for a skill you may skip.

![The pipeline of one roadmap entry as boxes in order: /repo-setup for a new repository or /ordo-init for an existing one, /roadmap add, the optional /grill, /plan, every step, and the closing, with the optional /plan-retro and /ordo-help beside them. Each box lists the stops where you are asked, marked every run, only when or optional.](docs/figures/pipeline.svg)

The loop of one step and the /plan-orchestration band that runs it unattended, with the same marks: "only when" is a stop in a named case.

![The loop of one step as boxes in order: /spec, build it, /refute, close them, /refute over the round, and /land, with a return for a further round, a card for when a command stops, a card for when it refuses, and the /plan-orchestration band. Each box lists the stops where you are asked, marked only when.](docs/figures/plan-loop.svg)

```

docs/dev/building.md, before (line 28): "This page is the list of tests and checks; a new script under a skill's `templates/` or under `utils/` adds its test here and to the command block of `docs/dev/change-standard.md`." After, two lines (28 and 30):

```
The figures under `docs/figures/` are written by `python3 docs/figures/gen_figures.py` and committed. A change to a skill's Stops table, to the sequence or to a skill name changes the labels in that script, which is then run again; the script is not part of the verify list.
This page is the list of tests and checks, and says how the committed figures are made; a new script under a skill's `templates/` or under `utils/` adds its test here and to the command block of `docs/dev/change-standard.md`.
```

Line 3 reread after the change, unchanged and still true (the figures are committed files that no build step produces, and the script is outside the verify list):

```
Ordo has no build step. The green check is every command below passing, each run from the repository root. Each test builds scratch repositories or scratch files under `$TMPDIR` and removes them; none touches the installed skills.
```

Line 30 (was 28) as it ends up: it now says the page also says how the committed figures are made (quoted above).

docs/glossary.md, added in "Ordo's own terms", between "loop, in the README" and "pin":

```
- **mark, of a figure**: the label a box of the README's figures carries where the user is asked, each drawn with its own shape and word: "every run", a stop that waits on the user each time the skill runs; "only when", a stop that waits on the user only when its condition occurs; and "optional", a skill the user may run or skip, drawn as a dashed box. Stated in: `README.md`, the figures.
```

Grep for the changed names across `skills/`, `utils/`, `docs/`, `README.md` (`git grep -n -E "gen_figures|docs/figures" -- skills utils docs README.md`) is quoted in "Places that should name the figures".

## Boxes against the Stops tables

Marks: E = every run, O = only when, P = optional (dashed box).

| Box | Rows drawn (words of the table) | Table and what it says |
|---|---|---|
| `/repo-setup` (pipeline) | E: The questions, The draft. O: No commit allowed. Note: sync stops left out | `repo-setup` Stops: rows 1-6 are stops; "A hunk to rule on", "The drafted sync change", "A file sync cannot use" are `sync` only, left out with the note on the box; "Tracked files" is a refusal, no mark |
| `/ordo-init` | E: The draft, Worker, reviewer and libraries. O: Several roadmaps, A failing command, A fix in the check, No commit allowed | `ordo-init` Stops: all six rows are stops; "The draft" and "Worker, reviewer and libraries" say "Every setup" |
| `/roadmap add` | E: The change. O: No gate, The level, The insertion form, A missing dependency | `roadmap` Stops: first five rows are stops; the rest (No configuration, A required key missing, A place too early, Not yet specified, No gate output, An open plan) are refusals, unmarked; "A place too early", "Not yet specified", "No gate output" and "An open plan" belong to `move`, `done` and `drop`, not `add` |
| `/grill <entry>` | P. E: A round, The end. O: A lookup agent served another model | `grill` Stops: first three rows are stops; the last four are refusals |
| `/plan <entry>` | E: The drafted step list | `plan` Stops: one stop, "Every plan"; the rest are refusals |
| every step | plain note: stops are in the plan-loop figure | stands for the loop; no row of its own |
| the closing | E: The roadmap diff | `plan-orchestration` Stops: "The roadmap diff", "The closing step's `/roadmap done`"; the closing also runs `/roadmap` whose own stop "The change" is every run, and the box names the diff, as the brief lists |
| `/plan-retro` | P. O: The proposals | `plan-retro` Stops: "The proposals", "Every retro with a recurring kind" (so only when); the other two rows are refusals |
| `/ordo-help` | P. plain note: No stop. | `ordo-help` Stops: "No stop"; the rest are refusals |
| `/spec` (plan loop) | O: A false premise the plan cannot absorb, A rule clash with an ADR, A user-visible choice, A brief check finding the brief cannot absorb, A model other than the configured one | `spec` Stops: first five rows are stops; the other nine rows are refusals, unmarked (among them "A step without the user's authority") |
| `/refute` (both boxes) | O: A model other than the configured one | `refute` Stops: first row is the stop; the rest refusals |
| `/land` | O: A red line for the user, A lock held, A worktree that cannot be removed | `land` Stops: rows 1, 2 and the last are stops; the rows between are refusals |
| build it, close them | plain note: No stop of its own | not skills; no Stops table |
| `/plan-orchestration` band | O: A shape nobody named, A wrong premise, A red check, A rule clash, A finding that is the user's, A model other than the configured one | `plan-orchestration` Stops: seven kinds of stop and one refusal; "The roadmap diff" is on the closing box; "The configured effort cannot apply" is the refusal, unmarked |

Every stop row of the eleven tables is either marked on a box above or named here as left out (the three `sync` rows of `repo-setup`; "The roadmap diff" appears on the closing box rather than the band). The refusals appear only on the plan loop's "when it refuses" card, in general terms.

## Contrast (WCAG relative luminance, computed with the formula in a scratch Python snippet)

| Pair | Ratio | Required |
|---|---|---|
| text `#0f172a` on card `#ffffff` | 17.85:1 | 4.5 |
| text `#0f172a` on panel `#f8fafc` | 17.06:1 | 4.5 |
| captions `#475569` on panel | 7.24:1 | 4.5 |
| notes `#475569` on card | 7.58:1 | 4.5 |
| badge text `#ffffff` on the filled mark `#4f46e5` | 6.29:1 | 4.5 |
| badge text `#0f172a` on card (outlined and dashed marks) | 17.85:1 | 4.5 |
| mark `#4f46e5` on card | 6.29:1 | 3 |
| mark `#4f46e5` on panel | 6.01:1 | 3 |
| box edge `#64748b` on card | 4.76:1 | 3 |
| box edge `#64748b` on panel | 4.55:1 | 3 |
| arrows `#4f46e5` on panel | 6.01:1 | 3 |
| top rule `#b45309` on card / panel | 5.02:1 / 4.80:1 | 3 |

The marks differ by shape and word (a filled square "every run", an outlined square "only when", a dashed pill "optional") and the optional box is drawn dashed; colour is not the carrier.

## What was seen

Renderer: `/opt/homebrew/bin/rsvg-convert -z 1.5`. Images: `$TMPDIR/figs/pipeline.png` and `$TMPDIR/figs/plan-loop.png` (`$TMPDIR` is `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/`).

- pipeline: the two setup boxes side by side with "or" between them, both feeding one elbow arrow that meets the top of `/roadmap add`; the five boxes of the entry in a row, four arrows each meeting the next box; `/plan-retro` and `/ordo-help` dashed under their captions; the legend at the bottom. Every label legible, no text over another text, a box edge or an arrow.
- plan-loop: six boxes in a row with five arrows, the dashed return arrow from the second `/refute` up into "close them" with its label under it, the two halt cards, the dashed `/plan-orchestration` band with its six stops in three columns, the legend. Every label legible, no overlap.
- The renderer draws its own default sans-serif; the character budgets of the script are conservative, so lines end earlier than the box edge.

## Judgment calls the brief left open

- Layout: the figures are 1040 wide; the pipeline is two rows (setup alternatives above, the entry's boxes below) with the two side items and the legend under them; the plan loop is one row of six boxes of widths 190, 110, 140, 120, 165 and 175, then the halt cards, then the band. The brief leaves the layout to the builder.
- Marks: a filled square, an outlined square and a dashed pill, each with its word; the box of an optional skill is also dashed.
- The plan loop's sentence on who types what reads "RUN BY HAND, YOU TYPE EACH COMMAND OF THE ROW" in the caption and "Under /plan-orchestration only the stops marked here reach you." in the band. The brief says "only the marked stops reach the user"; I placed the marks of the six orchestration stops on the band, so "marked here" is that band's marks. The orchestrator may prefer other words.
- Text I added to boxes beyond the rows the brief lists, each from the sequence `/ordo-help` prints or the skills' descriptions: a one-line description under each title, "Its stops are marked in the plan-loop figure." on the "every step" box, "No stop of its own." on build it and close them, "No stop." on `/ordo-help`, the "when it stops" and "when it refuses" cards (the wording of the stop card follows the "Stops" tables' "What resumes it" column: a decision leaves an open item and is answered "Ruled: <the choice>", a lock or a path is removed), and the caption "WHEN ANY COMMAND OF THE ROW HALTS". The two halt cards carry no arrows from `/spec` and `/land`, since every command of the row can halt, and `/land` has stops as well as refusals.
- The "every step" box also names `/plan-orchestration` as running it unattended.
- Script structure: a `Rect`, `Group` and `Box` dataclass, a `Canvas` class that collects the fragments of one figure, and one function per figure; the fit check runs while drawing, so the error names the figure, the box and the label.

## Host- or user-visible changes

- `README.md`: before, no image and line 46 followed by "## Requirements"; after, two figures with an introducing sentence and alt text each (quoted above).
- `docs/dev/building.md`: before, the last line named tests and checks only; after, the figures line and the reworded last line (quoted above).
- `docs/glossary.md`: one added entry (quoted above).
- New files `docs/figures/gen_figures.py`, `docs/figures/pipeline.svg`, `docs/figures/plan-loop.svg`.

## Places that should name the figures

README.md:50:![The pipeline of one roadmap entry as boxes in order: /repo-setup for a new repository or /ordo-init for an existing one, /roadmap add, the option
README.md:54:![The loop of one step as boxes in order: /spec, build it, /refute, close them, /refute over the round, and /land, with a return for a further roun
docs/dev/building.md:28:The figures under `docs/figures/` are written by `python3 docs/figures/gen_figures.py` and committed. A change to a skill's Stops table,
docs/figures/gen_figures.py:14:Run, from any directory: python3 docs/figures/gen_figures.py

No other page found that should show or name the figures; none was changed. `skills/ordo-help/SKILL.md` prints the sequence in its own terms and holds the same sequence the figure draws; it is not changed, since a figure is not part of what the skill prints.

## In the brief that turned out wrong or open

- The sequence `/ordo-help` prints says of "close them" that "a contradiction of an ADR the brief asked for is raised to you as an open item instead", which is a point where the user is asked, while no skill's Stops table lists it and the brief gives "close them" no stop. The figure follows the brief and the tables ("No stop of its own."). The orchestrator may want either the sequence line or the figure's note to change.
- Nothing else in the brief was wrong or impossible.

## Reading of the README sentences and alt texts against the prose standard

Read against the standard's sections 0 and A to F: each introducing sentence is one sentence; no em dash, no aside, no arrow, no filler word from section A, no rule of three padded, the quoted marks are in straight quotes; the sentences are 37 and 26 words (`sed -n 48p README.md | wc -w`, `sed -n 52p README.md | wc -w`), longer than the roughly 20 of section E, kept because the first lists the three marks and the second names the band and the marks it reuses; the second sentence's colon defines the one mark it uses. Each alt text states what the figure shows and lists the boxes in order.
