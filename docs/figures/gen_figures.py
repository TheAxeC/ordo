"""Write the six SVG figures of the README: the pipeline of one roadmap entry, the plan loop, and a
figure for each skill that launches agents outside the plan loop.

Writes, beside this file:

- pipeline.svg: /repo-setup or /ordo-init, /roadmap add, /grill, /plan, every step, the closing,
  with /plan-retro, /session-retro, /diagnose and /ordo-help beside them.
- plan-loop.svg: /spec, build it, /refute, close them, /refute over the round, /land, the return
  for a further round, the stops and refusals, and the /plan-orchestration band.
- paper.svg: one box for each of the seven modes of /paper, with its roles and session steps in
  order and its stops.
- grill.svg: the steps of /grill in order, its lookup agent and its refusals.
- writing.svg: the steps of /writing in order, its three finding agents and its checking agent.
- code-comments.svg: the steps of /code-comments in order, its finding agent, its checking agent
  and its rewrite agent.

Every box, arrow and label is written in this file, taken from each skill's Stops table and from
the sequence /ordo-help prints, and for paper, grill, writing and code-comments from the Steps and
Stops of that skill's SKILL.md; the script reads no skill file. A change to a Stops table, to the
sequence or to a skill name is made in the labels below, and the script is run again.

Run, from the repository root: python3 docs/figures/gen_figures.py
The script finds its files from its own location, so it also runs from any other directory when
given the path to the script.

Every byte written is ASCII. The figures carry their own light panel, so they read the same on a
light or a dark page. Each box shows where the user is asked with a mark that differs by shape and
by a word: a filled square "every run", an outlined square "only when", a dashed pill "optional".

Errors, each printed to stderr as "error: <message>":

- a label that does not fit its box: the message names the figure, the box and the label;
- a title that does not fit one line of its box: the message names the figure, the box, the label
  and the width in pixels;
- a word longer than a line of its box: the message names the figure, the box, the word and the
  label;
- a caption, a note or the legend that does not fit one line: the message names the figure, "a
  caption", "a note" or "the legend", the label and the width in pixels;
- a body that holds a non-ASCII character: the message names the file;
- a file that cannot be written or read back: the message names the file and the cause;
- a file whose text read back differs from the body written: the message names the file.

The label and ASCII errors stop the run before any file is written.

Exit status: 0 all six files written and verified, 1 an error above.
"""

import math
import sys
from dataclasses import dataclass, replace
from html import escape
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
SCRATCH_HEIGHT = 100000

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
        if baseline > self.box.area.y + self.box.area.h - 8:
            raise FigureError(
                f"{self.canvas.name}: box {self.box.title!r}: "
                f"the label {label!r} does not fit the box"
            )


def _draw_names(canvas: Canvas, box: Box, group: Group, cursor: float, put: _Put) -> float:
    """Draw the names of a group in the box's columns; return the baseline for the next line."""
    inner = box.area.w - 2 * PAD_X
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
                    box.area.x + PAD_X + column * column_width + indent,
                    cursor + line_index * NAME_LEADING,
                    line,
                    NAME_SIZE,
                )
        cursor += height * NAME_LEADING
    return cursor


def draw_box(canvas: Canvas, box: Box) -> float:
    """Draw a card: rule, title, body, the groups of stops with their marks, and the note.

    Return the baseline that the next line of the card would take.
    """
    figure = canvas.name
    put = _Put(canvas, box)
    inner = box.area.w - 2 * PAD_X
    canvas.rect(
        box.area.x,
        box.area.y,
        box.area.w,
        box.area.h,
        8,
        CARD,
        EDGE,
        1.5,
        "6 4" if box.dashed else "",
    )
    canvas.line(box.area.x + 8, box.area.y, box.area.x + box.area.w - 8, box.area.y, box.accent, 3)
    _check_line(figure, f"box {box.title!r}", box.title, inner, TITLE_SIZE, bold=True)
    cursor = box.area.y + 24
    put.check(cursor, box.title)
    canvas.text(box.area.x + PAD_X, cursor, box.title, TITLE_SIZE, INK, "700")
    cursor += 20
    for line in _wrap(figure, f"box {box.title!r}", box.body, inner, BODY_SIZE):
        put.check(cursor, box.body)
        canvas.text(box.area.x + PAD_X, cursor, line, BODY_SIZE)
        cursor += BODY_LEADING
    for group in box.groups:
        cursor += 6
        if group.mark:
            put.check(cursor + 4, group.mark)
            draw_badge(canvas, box.area.x + PAD_X, cursor, group.mark)
            cursor += 20
            cursor = _draw_names(canvas, box, group, cursor, put)
        else:
            for name in group.names:
                for line in _wrap(figure, f"box {box.title!r}", name, inner, NAME_SIZE):
                    put.check(cursor, name)
                    canvas.text(box.area.x + PAD_X, cursor, line, NAME_SIZE, MUTED)
                    cursor += NAME_LEADING
    if box.note:
        cursor += 6
        for line in _wrap(figure, f"box {box.title!r}", box.note, inner, NAME_SIZE):
            put.check(cursor, box.note)
            canvas.text(box.area.x + PAD_X, cursor, line, NAME_SIZE, MUTED)
            cursor += NAME_LEADING
    return cursor


def box_height(figure: str, box: Box) -> int:
    """The height a card needs: draw_box run on a scratch canvas, so the layout has one source."""
    scratch = Canvas(figure, 1, 1, "")
    tall = replace(box, area=Rect(box.area.x, box.area.y, box.area.w, SCRATCH_HEIGHT))
    return math.ceil(draw_box(scratch, tall) - box.area.y) + 4


def fit_row(
    figure: str, left: float, top: float, gap: float, boxes: tuple[Box, ...]
) -> tuple[Box, ...]:
    """Place cards left to right, each as wide as it says, all as tall as the tallest needs."""
    height = max(box_height(figure, box) for box in boxes)
    placed: list[Box] = []
    x = left
    for box in boxes:
        placed.append(replace(box, area=Rect(x, top, box.area.w, height)))
        x += box.area.w + gap
    return tuple(placed)


def draw_caption(canvas: Canvas, x: float, y: float, label: str, width: float) -> None:
    _check_line(canvas.name, "a caption", label, width, CAPTION_SIZE, bold=True, caps=True)
    canvas.text(x, y, label, CAPTION_SIZE, MUTED, "700")


def draw_note(canvas: Canvas, x: float, y: float, label: str, width: float) -> None:
    _check_line(canvas.name, "a note", label, width, NAME_SIZE)
    canvas.text(x, y, label, NAME_SIZE, MUTED)


PLAN_LEGEND_NOTE = (
    'A stop marked "every run" waits each time, unless a quoted ruling states the change '
    "or, under self_rule: on, plan-orchestration closes it."
)
SKILL_LEGEND_NOTE = (
    'A stop marked "every run" waits each time the box runs. A box whose stop a flag changes '
    "or closes says so in its text."
)


def draw_legend(
    canvas: Canvas, x: float, y: float, width: float, note: str = PLAN_LEGEND_NOTE
) -> None:
    """The three marks and the dashed box with what each says, on one row, and a note under it."""
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
    draw_note(canvas, x, y + 48, note, width)


def draw_row_arrows(canvas: Canvas, boxes: tuple[Box, ...]) -> None:
    """Draw an arrow from each box of a row to the next, level with the titles."""
    for left, right in zip(boxes, boxes[1:]):
        y = left.area.y + 20
        canvas.line(left.area.x + left.area.w, y, right.area.x - 1, y, ACCENT, 2, arrow=True)


def draw_column_arrows(canvas: Canvas, boxes: tuple[Box, ...]) -> None:
    """Draw an arrow from the foot of each box of a column to the head of the next."""
    for upper, lower in zip(boxes, boxes[1:]):
        x = upper.area.x + upper.area.w / 2
        canvas.line(x, upper.area.y + upper.area.h, x, lower.area.y - 1, ACCENT, 2, arrow=True)


def pipeline_svg() -> str:
    """The pipeline of one roadmap entry, from the repository's setup to the closing."""
    setup_top, setup_h = 42, 262
    join_y = setup_top + setup_h + 36
    top, height, width, gap = join_y + 34, 258, 178, 25
    side_top = top + height + 56
    side_h = 210
    canvas = Canvas(
        "pipeline.svg",
        1040,
        side_top + side_h + 90,
        "The pipeline of one roadmap entry as boxes in order: /repo-setup for a new repository or "
        "/ordo-init for an existing one, /roadmap add, the optional /grill, /plan, every step, and "
        "the closing, with the optional /plan-retro, /session-retro, /diagnose and /ordo-help "
        "beside them. Each box lists the stops where you are asked, marked every run, only when "
        "or optional.",
    )
    draw_caption(canvas, 25, 30, "SET THE REPOSITORY UP, ONCE: ONE OF THE TWO", 600)
    setup = Box(
        Rect(25, setup_top, 330, setup_h),
        "/repo-setup",
        "For a new repository: the tree, the shared rules, the standards, then /ordo-init.",
        (
            Group(EVERY_RUN, ("The questions", "The draft")),
            Group(ONLY_WHEN, ("No commit allowed",)),
        ),
        note="The stops of its sync form are left out: sync is not on this path.",
    )
    init = Box(
        Rect(395, setup_top, 330, setup_h),
        "/ordo-init",
        "For an existing repository: writes .agents/plan.yaml.",
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
        note="With .agents/plan.yaml present it checks the file instead and writes nothing; "
        "its only stop is then A fix in the check.",
    )
    draw_box(canvas, setup)
    draw_box(canvas, init)
    canvas.text(375, setup_top + 108, "or", 12, MUTED, "700", "middle")

    draw_caption(canvas, 140, join_y + 22, "FOR EACH ROADMAP ENTRY, IN ORDER", 600)
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
    draw_row_arrows(canvas, boxes)
    target_x = boxes[0].area.x + boxes[0].area.w / 2
    for source in (setup, init):
        centre = source.area.x + source.area.w / 2
        route = [(centre, source.area.y + source.area.h), (centre, join_y), (target_x, join_y)]
        canvas.path([*route, (target_x, top - 1)], ACCENT, 2, arrow=True)

    draw_caption(canvas, 25, side_top - 12, "AFTER PLANS HAVE RUN", 228)
    draw_caption(canvas, 279, side_top - 12, "AT ANY POINT", 736)
    retro = Box(
        Rect(25, side_top, 228, side_h),
        "/plan-retro",
        "The findings the reviews keep making, and the change that stops each.",
        (Group(OPTIONAL), Group(ONLY_WHEN, ("The proposals",))),
        dashed=True,
    )
    session_box = Box(
        Rect(279, side_top, 228, side_h),
        "/session-retro",
        "What went well and what went wrong in the Claude Code sessions, and the change for each.",
        (
            Group(OPTIONAL),
            Group(EVERY_RUN, ("The proposals",)),
            Group(ONLY_WHEN, ("A large output",)),
        ),
        dashed=True,
    )
    help_box = Box(
        Rect(533, side_top, 228, side_h),
        "/ordo-help",
        "Prints the sequence and, for a named plan, where it stands and the next command. "
        "/ordo-help skills prints every skill's Quick start.",
        (Group(OPTIONAL), Group("", ("No stop.",))),
        dashed=True,
    )
    diagnose_box = Box(
        Rect(787, side_top, 228, side_h),
        "/diagnose",
        "The cause of a defect, from a command red on it, before any fix.",
        (Group(OPTIONAL), Group(ONLY_WHEN, ("The hypotheses", "The cause not found"))),
        dashed=True,
    )
    draw_box(canvas, retro)
    draw_box(canvas, session_box)
    draw_box(canvas, help_box)
    draw_box(canvas, diagnose_box)
    draw_legend(canvas, 25, side_top + side_h + 26, 990)
    return canvas.render()


def plan_loop_svg() -> str:
    """The loop of one step, and the /plan-orchestration band that runs the row unattended."""
    top, height, gap = 42, 304, 18
    bottom = top + height
    cards_y, cards_h = bottom + 76, 160
    band_y, band_h = cards_y + cards_h + 24, 221
    canvas = Canvas(
        "plan-loop.svg",
        1040,
        band_y + band_h + 103,
        "The loop of one step as boxes in order: /spec, build it, /refute, close them, which sends "
        "a finding whose cause is not known through /diagnose, /refute over the round, and /land, "
        "with a return for a further round, a card for when a command stops, a card for when it "
        "refuses, the optional /ordo-help card, and the optional /plan-orchestration band. Each "
        "box lists the stops where you are asked, marked every run, only when or optional.",
    )
    caption = "FOR EVERY STEP, IN ORDER; RUN BY HAND, YOU TYPE EACH COMMAND OF THE ROW"
    draw_caption(canvas, 25, 30, caption, 900)
    widths = (190, 110, 130, 140, 165, 165)
    lefts = [25 + sum(widths[:i]) + i * gap for i in range(len(widths))]
    areas = [Rect(left, top, width, height) for left, width in zip(lefts, widths)]
    model_stop = "A model other than the configured one"
    boxes = (
        Box(
            areas[0],
            "/spec",
            "Writes the brief, has a fresh agent check a full step's brief, makes the worktree.",
            (
                Group(
                    ONLY_WHEN,
                    (
                        "A false premise the plan cannot absorb",
                        "A rule clash with an ADR",
                        "A user-visible choice",
                        "A brief check finding the brief cannot absorb",
                        "A cause not found",
                        model_stop,
                        "A step that does not converge",
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
            "A full step's repair round: fix the findings, rerun, rewrite the report. A finding whose "
            "cause is not known goes through /diagnose first.",
            (
                Group(
                    ONLY_WHEN,
                    (
                        "A contradiction of an ADR the brief asked for",
                        "A cause not found, from /diagnose",
                    ),
                ),
            ),
        ),
        Box(
            areas[4],
            "/refute",
            "Over the round, when refute_after_repair: yes. "
            'When refute_after_repair: no, "read the delta", by the orchestrator.',
            (Group(ONLY_WHEN, (model_stop, "A finding left after the last round")),),
        ),
        Box(
            areas[5],
            "/land",
            "Onto main, the checks there, the booking, the commit; the worktree is removed.",
            (
                Group(
                    ONLY_WHEN,
                    (
                        "A red line for the user",
                        "A rule clash",
                        "A lock held",
                        "A worktree that cannot be removed",
                    ),
                ),
            ),
        ),
    )
    for box in boxes:
        draw_box(canvas, box)
    draw_row_arrows(canvas, boxes)

    close, again = boxes[3], boxes[4]
    loop_y = bottom + 24
    close_x = close.area.x + close.area.w / 2
    again_x = again.area.x + again.area.w / 2
    route = [(again_x, bottom), (again_x, loop_y), (close_x, loop_y), (close_x, bottom + 1)]
    canvas.path(route, ACCENT, 2, "5 4", True)
    draw_note(canvas, close_x + 8, loop_y + 15, "a further round, within repair_rounds", 300)

    draw_caption(canvas, 25, cards_y - 12, "WHEN ANY COMMAND OF THE ROW HALTS", 340)
    draw_caption(canvas, 725, cards_y - 12, "AT ANY POINT", 290)
    stop_card = Box(
        Rect(25, cards_y, 340, cards_h),
        "when it stops",
        "The command waits on a decision or an action of yours, named in its Stops table. "
        "A decision leaves an open item with its options and one recommendation; you answer "
        "Ruled: <the choice> as plain text, or remove the lock or the path it names, and run "
        "the command again.",
        accent=STOP,
    )
    refusal_card = Box(
        Rect(375, cards_y, 340, cards_h),
        "when it refuses",
        "The command names its cause and changes nothing more, such as a required key missing, "
        "no ledger folder, the step not ready or main not clean. A refusal carries no mark: "
        "fix the cause and run the command again.",
        accent=STOP,
    )
    help_card = Box(
        Rect(725, cards_y, 290, cards_h),
        "/ordo-help <entry>",
        "Prints where the plan stands and the next command to type.",
        (Group(OPTIONAL), Group("", ("No stop.",))),
        dashed=True,
    )
    draw_box(canvas, stop_card)
    draw_box(canvas, refusal_card)
    draw_box(canvas, help_card)

    band = Box(
        Rect(25, band_y, 990, band_h),
        "/plan-orchestration [<entry>]",
        "Runs the row above for every step of the named plan, or of every open plan with no "
        "entry, unattended, with the executor the plan names at "
        "build it and close them; you may run the row by hand instead. Only the stops marked "
        "in these two figures, and the proposals of its recurring-findings pass, reach you; the "
        "rest of the row runs without asking. Under self_rule: on, the orchestrator closes every "
        "stop outside six kinds itself and writes it to choices.md for your review.",
        (
            Group(OPTIONAL),
            Group(EVERY_RUN, ("The roadmap diff, at the closing",)),
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
    draw_legend(canvas, 25, band_y + band_h + 24, 990)
    return canvas.render()


SKILL_FIGURE_WIDTH = 1040
SKILL_LEFT = 25
SKILL_SPAN = 990
LEGEND_TO_EDGE = 79
MODEL_STOP = "A model other than the configured one"


def row_bottom(row: tuple[Box, ...]) -> float:
    """The lower edge of a row placed by fit_row, whose cards share one height."""
    return row[0].area.y + row[0].area.h


def box_list(*rows: tuple[Box, ...]) -> str:
    """The titles of the cards in drawing order, for the alt text of a figure."""
    return "; ".join(box.title for row in rows for box in row)


def draw_rows(canvas: Canvas, *rows: tuple[Box, ...]) -> None:
    for row in rows:
        for box in row:
            draw_box(canvas, box)


def paper_svg() -> str:
    """The seven modes of /paper, each with its roles and session steps in order and its stops."""
    name = "paper.svg"
    outline = "The outline's approval"
    patch_stops = (
        "A structural patch",
        "A patch that does not apply",
        "A script failed",
        MODEL_STOP,
    )
    full = Box(
        Rect(0, 0, 485, 0),
        "full",
        "Intake, then a first draft, two draft review rounds, the reference checks and a compile.",
        (
            Group(
                "",
                (
                    "1. role: literature strategist, only when no .bib is held",
                    "2. session: put the .bib in the manuscript folder",
                    "3. role: planner writes outline.md and arguments.md",
                    "4. session: the outline's approval",
                    (
                        "5. role: draft writer writes main.tex whole; role: visualization beside "
                        "it when the materials hold data for a figure"
                    ),
                    (
                        "6. role: draft writer adds the figure environments as a patch, when a "
                        "figure was drawn"
                    ),
                    "7. session: lookup.py cite-keys and check-urls",
                    (
                        "8. role: peer reviewer, draft review round 1; role: draft writer on its "
                        "issues; role: peer reviewer, round 2; role: draft writer once more when "
                        "the score is under 6.5"
                    ),
                    "9. session: check the references; role: draft writer for a reference-fix pass",
                    "10. session: compile in a copy",
                    "11. session: /writing, then the end of the run",
                ),
            ),
            Group(EVERY_RUN, ("The intake confirmation", outline)),
            Group(ONLY_WHEN, ("The draft review does not pass",) + patch_stops),
        ),
        "A one-line reply to the /writing report starts the draft writer for the findings picked, "
        "then the patches are applied and the compile runs again.",
    )
    revision = Box(
        Rect(0, 0, 485, 0),
        "revision",
        "Intake, which asks what the run may do, then the answers to a comments file.",
        (
            Group(
                "",
                (
                    "1. role: peer reviewer writes items.md from the comments file",
                    (
                        "2. role: literature strategist, when an item calls for a new reference "
                        "and intake allowed it"
                    ),
                    (
                        "3. role: visualization, when an item calls for a figure change and "
                        "intake allowed it"
                    ),
                    "4. role: draft writer, patches that name the ids of the items",
                    "5. session: lookup.py cite-keys and check-urls",
                    (
                        "6. role: peer reviewer, reading 1; role: draft writer once on the items "
                        "not resolved; role: peer reviewer, reading 2"
                    ),
                    "7. session: check the references",
                    "8. session: compile in a copy",
                    "9. session: /writing, then the end of the run",
                ),
            ),
            Group(EVERY_RUN, ("The intake confirmation",)),
            Group(ONLY_WHEN, patch_stops),
        ),
        "A one-line reply to the /writing report starts the draft writer for the findings picked, "
        "then the patches are applied and the compile runs again.",
    )
    lit_review = Box(
        Rect(0, 0, 318, 0),
        "lit-review",
        "A literature review of a topic, with the entries for a .bib.",
        (
            Group(
                "",
                (
                    (
                        "1. role: literature strategist, one start; writes review.md and refs.bib "
                        "and, given a .tex, a .bib patch"
                    ),
                    "2. session: apply the patch, given a .tex",
                    "3. session: check the references, given a .tex",
                    "4. session: end the run",
                ),
            ),
            Group(EVERY_RUN, ("The intake confirmation",)),
            Group(ONLY_WHEN, patch_stops),
        ),
    )
    citation_check = Box(
        Rect(0, 0, 318, 0),
        "citation-check",
        "Each reference confirmed, each cited claim checked against a passage read in the run.",
        (
            Group(
                "",
                (
                    "1. session: lookup.py cite-keys and check-urls",
                    (
                        "2. role: citation compliance agent reads the sources; writes "
                        "citation-report.md and the patches C<m>"
                    ),
                    "3. session: check the references, with quote-check on citation-report.md",
                    "4. session: end the run",
                ),
            ),
            Group(EVERY_RUN, ("The intake confirmation",)),
            Group(
                ONLY_WHEN,
                (
                    "A reference that cannot be confirmed",
                    "A claim the run cannot support",
                )
                + patch_stops,
            ),
        ),
    )
    disclosure = Box(
        Rect(0, 0, 318, 0),
        "disclosure",
        "The statements of a manuscript, with the AI disclosure.",
        (
            Group(
                "",
                (
                    (
                        "1. role: draft writer writes the statements as a patch and disclosure.md; "
                        "the disclosure names the model identifier the session gives"
                    ),
                    "2. session: apply the patch",
                    "3. session: end the run",
                ),
            ),
            Group(EVERY_RUN, ("The intake confirmation",)),
            Group(ONLY_WHEN, patch_stops),
        ),
    )
    outline_only = Box(
        Rect(0, 0, 485, 0),
        "outline-only",
        "The outline and the argument map, with no manuscript file written.",
        (
            Group(
                "",
                (
                    "1. role: literature strategist, only when no .bib is held",
                    "2. role: planner writes outline.md and arguments.md",
                    "3. session: the outline's approval",
                    "4. session: end the run",
                ),
            ),
            Group(EVERY_RUN, ("The intake confirmation", outline)),
            Group(ONLY_WHEN, (MODEL_STOP, "A script failed")),
        ),
    )
    abstract_only = Box(
        Rect(0, 0, 485, 0),
        "abstract-only",
        "The abstract and the keywords of a manuscript.",
        (
            Group(
                "",
                (
                    "1. session: find the file that holds the abstract",
                    "2. role: draft writer writes the abstract and the keywords as a patch",
                    "3. session: apply the patch",
                    "4. session: end the run",
                ),
            ),
            Group(EVERY_RUN, ("The intake confirmation",)),
            Group(ONLY_WHEN, patch_stops),
        ),
    )
    top = 42
    row_gap = 18
    first = fit_row(name, SKILL_LEFT, top, 20, (full, revision))
    second = fit_row(
        name, SKILL_LEFT, row_bottom(first) + row_gap, 18, (lit_review, citation_check, disclosure)
    )
    third = fit_row(
        name, SKILL_LEFT, row_bottom(second) + row_gap, 20, (outline_only, abstract_only)
    )
    legend_y = row_bottom(third) + 24
    canvas = Canvas(
        name,
        SKILL_FIGURE_WIDTH,
        int(legend_y + LEGEND_TO_EDGE),
        "The seven modes of /paper as boxes: "
        + box_list(first, second, third)
        + ". Each box lists its steps in order, the roles that are fresh agents and the session "
        "steps, and the stops where you are asked, marked every run or only when.",
    )
    draw_caption(
        canvas,
        SKILL_LEFT,
        30,
        "EACH BOX LISTS ITS STEPS IN ORDER; ROLE IS A FRESH AGENT, SESSION IS THE SESSION",
        SKILL_SPAN,
    )
    draw_rows(canvas, first, second, third)
    draw_legend(canvas, SKILL_LEFT, legend_y, SKILL_SPAN, SKILL_LEGEND_NOTE)
    return canvas.render()


def grill_svg() -> str:
    """The steps of /grill in order, its lookup agent and its refusals."""
    name = "grill.svg"
    steps = fit_row(
        name,
        SKILL_LEFT,
        42,
        18,
        (
            Box(
                Rect(0, 0, 150, 0),
                "resolve",
                "Reads plan.yaml, sets the design bar and finds the entry.",
            ),
            Box(
                Rect(0, 0, 150, 0),
                "design tree",
                "Reads the rules, the ADRs, the glossary and the rulings, then lists the decisions "
                "the goal and gate need and marks the settled ones.",
            ),
            Box(
                Rect(0, 0, 150, 0),
                "a round",
                "Asks, in one message, every decision whose prerequisites are settled, each with "
                "its options and one recommendation. Under --self-rule only the decisions of the "
                "six kinds left open are sent as a round.",
                (Group(EVERY_RUN, ("A round",)),),
            ),
            Box(
                Rect(0, 0, 150, 0),
                "the answers",
                "Reads each answer against the round shown, and checks its terms, its claims and "
                "its contradictions.",
            ),
            Box(
                Rect(0, 0, 150, 0),
                "write down",
                "Writes each settled answer as a Rulings line, a glossary term, a roadmap change "
                "and, when recorded, an ADR.",
            ),
            Box(
                Rect(0, 0, 150, 0),
                "close",
                "Lists the decisions settled with where each was written, then asks to confirm "
                "and to commit.",
                (Group(EVERY_RUN, ("The end",)),),
                "Under --self-rule nothing is asked and the commit is made.",
            ),
        ),
    )
    bottom = row_bottom(steps)
    loop_y = bottom + 24
    cards_y = loop_y + 62
    lookup = Box(
        Rect(0, 0, 485, 0),
        "lookup agent",
        "Started for a fact the session cannot read in a few lines. It is read-only, runs as "
        "ordo-<reviewer_effort> on the model reviewer names, and returns each fact with its "
        "source. Its id and served model are written to the Agents section of the rulings file.",
        (Group(ONLY_WHEN, ("A lookup agent served another model",)),),
    )
    refusals = Box(
        Rect(0, 0, 485, 0),
        "when it refuses",
        "The command names its cause and changes nothing more: no configuration, no such entry, a "
        "required key missing, --self-rule without the keys, --self-rule for an entry under Not "
        "yet specified, an unknown bar. A refusal carries no mark: fix the cause and run the "
        "command again.",
        accent=STOP,
    )
    cards = fit_row(name, SKILL_LEFT, cards_y, 20, (lookup, refusals))
    canvas = Canvas(
        name,
        SKILL_FIGURE_WIDTH,
        int(row_bottom(cards) + 24 + LEGEND_TO_EDGE),
        "The steps of /grill as boxes in order: "
        + box_list(steps)
        + ", with a return from write down to design tree until no decision is open, then a card "
        "for the lookup agent and a card for when it refuses: "
        + box_list(cards)
        + ". Each box lists the stops where you are asked, marked every run or only when.",
    )
    draw_caption(canvas, SKILL_LEFT, 30, "FOR EVERY ENTRY, IN ORDER", SKILL_SPAN)
    draw_rows(canvas, steps)
    draw_row_arrows(canvas, steps)
    write_down, tree = steps[4], steps[1]
    start_x = write_down.area.x + write_down.area.w / 2
    end_x = tree.area.x + tree.area.w / 2
    canvas.path(
        [(start_x, bottom), (start_x, loop_y), (end_x, loop_y), (end_x, bottom + 1)],
        ACCENT,
        2,
        "5 4",
        True,
    )
    draw_note(canvas, end_x + 8, loop_y + 15, "until no decision is open", 300)
    draw_caption(canvas, SKILL_LEFT, cards_y - 12, "WHEN A FACT IS NEEDED", 485)
    draw_caption(canvas, SKILL_LEFT + 505, cards_y - 12, "AT ANY POINT", 485)
    draw_rows(canvas, cards)
    legend_y = row_bottom(cards) + 24
    draw_legend(canvas, SKILL_LEFT, legend_y, SKILL_SPAN, SKILL_LEGEND_NOTE)
    return canvas.render()


def writing_svg() -> str:
    """The steps of /writing in order, its four agents and its refusals."""
    name = "writing.svg"
    steps = fit_row(
        name,
        SKILL_LEFT,
        42,
        20,
        (
            Box(
                Rect(0, 0, 182, 0),
                "read the call",
                "Reads the call and plan.yaml, finds the prose standard, lists the draft's files "
                "and checks the effort agent.",
            ),
            Box(
                Rect(0, 0, 182, 0),
                "the scripts",
                "Runs prose_facts.py on the draft and the prose standard and, for a .docx, "
                "docx_paragraphs.py: the counts and word lists.",
            ),
            Box(
                Rect(0, 0, 182, 0),
                "three agents",
                "Started at once in the background: the sentence agent, the section agent and the "
                "whole-draft agent, each checking its own rules.",
                (Group(ONLY_WHEN, (MODEL_STOP,)),),
            ),
            Box(
                Rect(0, 0, 182, 0),
                "checking agent",
                "Started after the three, since its prompt carries their findings. It keeps the "
                "findings the rules support and groups them.",
                (Group(ONLY_WHEN, (MODEL_STOP,)),),
            ),
            Box(
                Rect(0, 0, 182, 0),
                "the report",
                "Shows the report whole as the message that ends the turn, then the tokens of the "
                "four agents on one line.",
            ),
        ),
    )
    cards_y = row_bottom(steps) + 52
    refusals = Box(
        Rect(0, 0, SKILL_SPAN, 0),
        "when it refuses",
        "The command names its cause and changes nothing more: no plan configuration, an unknown "
        "project, no prose standard, a draft refused, the configured effort cannot apply, no facts "
        "when a script exits non-zero. A refusal carries no mark: fix the cause and run the "
        "command again.",
        accent=STOP,
    )
    cards = fit_row(name, SKILL_LEFT, cards_y, 20, (refusals,))
    canvas = Canvas(
        name,
        SKILL_FIGURE_WIDTH,
        int(row_bottom(cards) + 24 + LEGEND_TO_EDGE),
        "The steps of /writing as boxes in order: "
        + box_list(steps)
        + ", then a card for when it refuses: "
        + box_list(cards)
        + ". Each box lists the stops where you are asked, marked every run or only when.",
    )
    draw_caption(canvas, SKILL_LEFT, 30, "FOR EVERY DRAFT, IN ORDER", SKILL_SPAN)
    draw_rows(canvas, steps)
    draw_row_arrows(canvas, steps)
    draw_caption(canvas, SKILL_LEFT, cards_y - 12, "AT ANY POINT", SKILL_SPAN)
    draw_rows(canvas, cards)
    draw_legend(canvas, SKILL_LEFT, row_bottom(cards) + 24, SKILL_SPAN, SKILL_LEGEND_NOTE)
    return canvas.render()


def code_comments_svg() -> str:
    """The steps of /code-comments in order, its two review agents, its rewrite and its refusals."""
    name = "code-comments.svg"
    review = fit_row(
        name,
        SKILL_LEFT,
        42,
        20,
        (
            Box(
                Rect(0, 0, 182, 0),
                "resolve the diff",
                "Reads the call and plan.yaml, finds the prose standard, resolves the diff and "
                "lists the files to review with their sizes.",
            ),
            Box(
                Rect(0, 0, 182, 0),
                "prompt file",
                "Makes the prompt folder and writes finding.md with shell commands: the rules, the "
                "diff and each file whole, or as hunks over 256 KB.",
            ),
            Box(
                Rect(0, 0, 182, 0),
                "finding agent",
                "Judges the comments the diff adds or changes, each against the code around it. "
                "It changes nothing.",
                (Group(ONLY_WHEN, (MODEL_STOP,)),),
            ),
            Box(
                Rect(0, 0, 182, 0),
                "checking agent",
                "Keeps a finding only when the rule's words describe the break, and puts the false "
                "comments first.",
                (Group(ONLY_WHEN, (MODEL_STOP,)),),
            ),
            Box(
                Rect(0, 0, 182, 0),
                "the report",
                "Removes the prompt folder, shows the report whole, then the tokens of both agents "
                "on one line.",
            ),
        ),
    )
    rewrite_y = row_bottom(review) + 52
    rewrite = fit_row(
        name,
        SKILL_LEFT,
        rewrite_y,
        21,
        (
            Box(
                Rect(0, 0, 316, 0),
                "pick findings",
                "Takes the numbers named, or every number for all, and copies each file they name "
                "to a scratch folder.",
            ),
            Box(
                Rect(0, 0, 316, 0),
                "rewrite agent",
                "Rewrites only the comments of the picked findings, and changes no code.",
                (Group(ONLY_WHEN, (MODEL_STOP,)),),
            ),
            Box(
                Rect(0, 0, 316, 0),
                "compare",
                "strip_comments.py --compare keeps a rewrite only when the file's code equals its "
                "code before; otherwise the copy is put back. Nothing is committed.",
            ),
        ),
    )
    cards_y = row_bottom(rewrite) + 52
    refusals = Box(
        Rect(0, 0, SKILL_SPAN, 0),
        "when it refuses",
        "The command names its cause and changes nothing more: no plan configuration, an unknown "
        "project, no prose standard, not a range, a range that does not resolve, nothing to "
        "review, the configured effort cannot apply, no report to apply, a number the report does "
        "not hold. A refusal carries no mark: fix the cause and run the command again.",
        accent=STOP,
    )
    cards = fit_row(name, SKILL_LEFT, cards_y, 20, (refusals,))
    canvas = Canvas(
        name,
        SKILL_FIGURE_WIDTH,
        int(row_bottom(cards) + 24 + LEGEND_TO_EDGE),
        "The steps of /code-comments as boxes in order: "
        + box_list(review)
        + ", then the steps of a reply of apply numbers or apply all: "
        + box_list(rewrite)
        + ", then a card for when it refuses: "
        + box_list(cards)
        + ". Each box lists the stops where you are asked, marked every run or only when.",
    )
    draw_caption(canvas, SKILL_LEFT, 30, "FOR EVERY REVIEW, IN ORDER", SKILL_SPAN)
    draw_rows(canvas, review)
    draw_row_arrows(canvas, review)
    draw_caption(
        canvas,
        SKILL_LEFT,
        rewrite_y - 12,
        "AFTER THE REPORT, ON THE REPLY apply <numbers> OR apply all",
        SKILL_SPAN,
    )
    draw_rows(canvas, rewrite)
    draw_row_arrows(canvas, rewrite)
    draw_caption(canvas, SKILL_LEFT, cards_y - 12, "AT ANY POINT", SKILL_SPAN)
    draw_rows(canvas, cards)
    draw_legend(canvas, SKILL_LEFT, row_bottom(cards) + 24, SKILL_SPAN, SKILL_LEGEND_NOTE)
    return canvas.render()


def write_figures(figures: tuple[tuple[str, str], ...], folder: Path = HERE) -> list[str]:
    """Check every body, then write each file into a folder of the repository and read it back.

    Return one line per file. The folder is this file's own folder unless the caller gives one.
    """
    for name, body in figures:
        if not body.isascii():
            raise FigureError(f"{name}: the body holds a character that is not ASCII")
    lines: list[str] = []
    for name, body in figures:
        path = folder / name
        try:
            with path.open("w", encoding="utf-8", newline="\n") as handle:
                handle.write(body)
            written = path.read_text(encoding="utf-8")
        except OSError as error:
            raise FigureError(f"{name}: {error}") from error
        if written != body:
            raise FigureError(f"{name}: the text read back differs from the body written")
        lines.append(f"wrote {path.relative_to(ROOT).as_posix()} ({len(body)} bytes)")
    return lines


def main() -> int:
    try:
        figures = (
            ("pipeline.svg", pipeline_svg()),
            ("plan-loop.svg", plan_loop_svg()),
            ("paper.svg", paper_svg()),
            ("grill.svg", grill_svg()),
            ("writing.svg", writing_svg()),
            ("code-comments.svg", code_comments_svg()),
        )
        lines = write_figures(figures)
    except FigureError as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    for line in lines:
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main())
