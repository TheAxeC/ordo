"""Write the two SVG figures of the README: the pipeline of one roadmap entry and the plan loop.

Writes, beside this file:

- pipeline.svg: /repo-setup or /ordo-init, /roadmap add, /grill, /plan, every step, the closing,
  with /plan-retro, /session-retro, /diagnose and /ordo-help beside them.
- plan-loop.svg: /spec, build it, /refute, close them, /refute over the round, /land, the return
  for a further round, the stops and refusals, and the /plan-orchestration band.

Every box, arrow and label is written in this file, taken from each skill's Stops table and from
the sequence /ordo-help prints; the script reads no skill file. A change to a Stops table, to the
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

Exit status: 0 both files written and verified, 1 an error above.
"""

import sys
from dataclasses import dataclass
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


def draw_box(canvas: Canvas, box: Box) -> None:
    """Draw a card: rule, title, body, the groups of stops with their marks, and the note."""
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


def draw_caption(canvas: Canvas, x: float, y: float, label: str, width: float) -> None:
    _check_line(canvas.name, "a caption", label, width, CAPTION_SIZE, bold=True, caps=True)
    canvas.text(x, y, label, CAPTION_SIZE, MUTED, "700")


def draw_note(canvas: Canvas, x: float, y: float, label: str, width: float) -> None:
    _check_line(canvas.name, "a note", label, width, NAME_SIZE)
    canvas.text(x, y, label, NAME_SIZE, MUTED)


def draw_legend(canvas: Canvas, x: float, y: float, width: float) -> None:
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
    draw_note(
        canvas,
        x,
        y + 48,
        'A stop marked "every run" waits each time, unless a quoted ruling states the change '
        "or, under self_rule: on, plan-orchestration closes it.",
        width,
    )


def draw_row_arrows(canvas: Canvas, boxes: tuple[Box, ...]) -> None:
    """Draw an arrow from each box of a row to the next, level with the titles."""
    for left, right in zip(boxes, boxes[1:]):
        y = left.area.y + 20
        canvas.line(left.area.x + left.area.w, y, right.area.x - 1, y, ACCENT, 2, arrow=True)


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
        "Prints the sequence and, for a named plan, where it stands and the next command.",
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
                    ("A red line for the user", "A lock held", "A worktree that cannot be removed"),
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
        "/plan-orchestration <entry>",
        "Runs the row above for every step, unattended, with the executor the plan names at "
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


def write_figures(figures: tuple[tuple[str, str], ...]) -> list[str]:
    """Check every body, then write each file and read it back; return one line per file."""
    for name, body in figures:
        if not body.isascii():
            raise FigureError(f"{name}: the body holds a character that is not ASCII")
    lines: list[str] = []
    for name, body in figures:
        path = HERE / name
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
