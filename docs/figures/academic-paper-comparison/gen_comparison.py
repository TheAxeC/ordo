"""Write the SVG figures that set academic-paper 3.2.0 and academic-pipeline 3.13.0 beside the
skills of Ordo that take their work.

Writes, beside this file:

- full.svg, outline-only.svg, revision.svg, abstract-only.svg, lit-review.svg, citation-check.svg
  and disclosure.svg: one figure for each mode that academic-paper and paper both have. The left
  column holds academic-paper's agents in order and the right column holds paper's roles and
  session steps in order. In disclosure, academic-paper's agent 9 stands against paper's draft
  writer.
- academic-paper-only-modes.svg: the four modes of academic-paper that paper has no mode for
  (format-convert, plan, revision-coach and rebuttal-audit), each with its agents.
- academic-pipeline.svg: the stages of academic-pipeline in order, each beside the Ordo skills
  whose roadmap entry's goal names that work. A skill's box is solid when its folder stands under
  skills/ in this repository and dashed when it does not, read from the tree each time the script
  runs.

Stage to skill mapping of academic-pipeline.svg, by the goal of each entry of docs/roadmap.md:

- 1 RESEARCH: researcher (entry 13, the stages of a research project) and paper (entry 5, the
  lit-review mode).
- 2 WRITE: paper (entry 5).
- 2.5 INTEGRITY: researcher (entry 13, the integrity check on the finished draft).
- 3 REVIEW: paper-review (entry 6) and referee (entry 7.A).
- 4 REVISE: paper (entry 5, the revision mode) and rebuttal (entry 7, the response letter).
- 3' RE-REVIEW: paper-review (entry 6, the re-review mode).
- 4' RE-REVISE: paper (entry 5).
- 4.5 FINAL INTEGRITY: researcher (entry 13, the checks again after the revision).
- 5 FINALIZE: submit-manuscript (entry 14).
- 6 PROCESS SUMMARY: no skill, since no entry's goal names it.

Every box, arrow and label is written in this file, taken from the SKILL.md of academic-paper,
academic-pipeline and paper and from docs/roadmap.md; the script reads no skill file. The
drawing code and its checks are those of gen_figures.py, found from this file's own location. A
change to a skill's modes, steps or name is made in the labels below, and the script is run
again.

Run, from the repository root: python3 docs/figures/academic-paper-comparison/gen_comparison.py
The script finds its files from its own location, so it also runs from any other directory when
given the path to the script. It writes only into its own folder.

Every byte written is ASCII, on the light panel of gen_figures.py.

Errors, each printed to stderr as "error: <message>":

- a label that does not fit its box: the message names the figure, the box and the label;
- a title that does not fit one line of its box: the message names the figure, the box, the label
  and the width in pixels;
- a word longer than a line of its box: the message names the figure, the box, the word and the
  label;
- a caption or a note that does not fit one line: the message names the figure, "a caption" or "a
  note", the label and the width in pixels;
- gen_figures.py missing or not loadable: the message names the file;
- a body that holds a non-ASCII character: the message names the file;
- a file that cannot be written or read back: the message names the file and the cause;
- a file whose text read back differs from the body written: the message names the file.

The label and ASCII errors stop the run before any file is written.

Exit status: 0 all files written and verified, 1 an error above.
"""

import importlib.util
import sys
from dataclasses import replace
from pathlib import Path
from types import ModuleType

HERE = Path(__file__).resolve().parent
FIGURES_SCRIPT = HERE.parent / "gen_figures.py"

LEFT_X = 25
COLUMN_WIDTH = 485
RIGHT_X = 530
STACK_GAP = 22
SPAN = 990
CANVAS_WIDTH = 1040
TOP = 42


def load_figures() -> ModuleType:
    """Load gen_figures.py from the folder above this file."""
    spec = importlib.util.spec_from_file_location("gen_figures", FIGURES_SCRIPT)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"{FIGURES_SCRIPT.name} cannot be loaded")
    module = importlib.util.module_from_spec(spec)
    sys.modules["gen_figures"] = module
    try:
        spec.loader.exec_module(module)
    except OSError as error:
        raise RuntimeError(f"{FIGURES_SCRIPT.name}: {error}") from error
    return module


try:
    gf = load_figures()
except (OSError, RuntimeError) as error:
    print(f"error: {error}", file=sys.stderr)
    sys.exit(1)


def card(title: str, body: str, accent: str, width: int = COLUMN_WIDTH, dashed: bool = False):
    """A card with a title and a body, placed later."""
    return gf.Box(gf.Rect(0, 0, width, 0), title, body, accent=accent, dashed=dashed)


def theirs(title: str, body: str):
    """A card of academic-paper or of academic-pipeline, drawn with a grey rule."""
    return card(title, body, gf.EDGE)


def ours(title: str, body: str):
    """A card of paper, drawn with the accent rule."""
    return card(title, body, gf.ACCENT)


def stack(figure: str, x: float, top: float, boxes) -> tuple:
    """Place cards one under the next, each as tall as it needs."""
    placed = []
    y = top
    for box in boxes:
        height = gf.box_height(figure, box)
        placed.append(replace(box, area=gf.Rect(x, y, box.area.w, height)))
        y += height + STACK_GAP
    return tuple(placed)


def column_bottom(column: tuple) -> float:
    last = column[-1].area
    return last.y + last.h


def titles(column: tuple) -> str:
    return "; ".join(box.title for box in column)


def two_columns(
    name: str, intro: str, left_caption: str, right_caption: str, left, right, note: str = ""
) -> str:
    """One figure: academic-paper's cards in the left column, paper's cards in the right one."""
    left_column = stack(name, LEFT_X, TOP, left)
    right_column = stack(name, RIGHT_X, TOP, right)
    bottom = max(column_bottom(left_column), column_bottom(right_column))
    height = int(bottom + (48 if note else 24))
    canvas = gf.Canvas(
        name,
        CANVAS_WIDTH,
        height,
        f"{intro}. Left, academic-paper 3.2.0 as boxes in order: {titles(left_column)}. Right, "
        f"paper 2.0.0 as boxes in order: {titles(right_column)}.",
    )
    gf.draw_caption(canvas, LEFT_X, 30, left_caption, COLUMN_WIDTH)
    gf.draw_caption(canvas, RIGHT_X, 30, right_caption, COLUMN_WIDTH)
    for column in (left_column, right_column):
        for box in column:
            gf.draw_box(canvas, box)
        gf.draw_column_arrows(canvas, column)
    if note:
        gf.draw_note(canvas, LEFT_X, bottom + 24, note, SPAN)
    return canvas.render()


LEFT_CAPTION = "ACADEMIC-PAPER 3.2.0, AGENTS IN ORDER"
RIGHT_CAPTION = "PAPER 2.0.0, ROLES AND SESSION STEPS IN ORDER"

PAPER_INTAKE = ours(
    "session: intake",
    "The session's interview writes config.md, with what the run may do; the user confirms it.",
)


def full_svg() -> str:
    left = (
        theirs(
            "1 intake_agent",
            "The configuration interview: paper type, discipline, journal, citation format, output "
            "format, language and word count. The user confirms the record.",
        ),
        theirs(
            "2 literature_strategist_agent",
            "Search strategy, source screening, annotated bibliography and literature matrix.",
        ),
        theirs(
            "3 structure_architect_agent",
            "Paper structure, detailed outline, word count allocation and evidence mapping. The "
            "user approves the outline.",
        ),
        theirs(
            "4 argument_builder_agent",
            "Argument construction, claim-evidence chains, logical flow and counter-arguments.",
        ),
        theirs(
            "5 draft_writer_agent",
            "The full draft, section by section, in the discipline's register, with a word count.",
        ),
        theirs(
            "11 visualization_agent, if quantitative",
            "Figure code in Python or R with APA 7.0 formatting, when the paper has quantitative "
            "results.",
        ),
        theirs(
            "6 and 7, in parallel",
            "citation_compliance_agent: citation format, reference list completeness and DOI "
            "checking. abstract_bilingual_agent: the abstract in two languages and the keywords.",
        ),
        theirs(
            "8 peer_reviewer_agent",
            "A simulated double-blind review with five-dimension scoring, up to 2 revision loops.",
        ),
        theirs(
            "9 formatter_agent",
            "Converts to LaTeX, DOCX, PDF or Markdown, with journal formatting and a cover letter.",
        ),
    )
    right = (
        PAPER_INTAKE,
        ours(
            "role: literature strategist",
            "Only when no .bib is held. Writes review.md and refs.bib.",
        ),
        ours(
            "role: planner",
            "Writes outline.md with its evidence map and arguments.md with the argument map. The "
            "session raises the outline's approval.",
        ),
        ours(
            "role: draft writer",
            "Writes main.tex whole: the body, the abstract, the keywords and the six statements.",
        ),
        ours(
            "role: visualization",
            "Beside the draft writer when the materials hold data for a figure. The draft writer "
            "adds the figure environments as a patch.",
        ),
        ours(
            "session: lookup.py cite-keys and check-urls",
            "The citation scripts, run by the session, in place of a citation compliance agent.",
        ),
        ours(
            "role: peer reviewer",
            "Draft review rounds 1 and 2, given the closing checks and the two script outputs. The "
            "draft writer answers its issues.",
        ),
        ours(
            "session: references, compile, /writing",
            "The reference checks, a compile in a copy, then /writing with its one-line reply.",
        ),
    )
    return two_columns(
        "full.svg",
        "The full mode of academic-paper against the full mode of paper: nine agents against five "
        "roles, with the citation scripts as a session step",
        LEFT_CAPTION,
        RIGHT_CAPTION,
        left,
        right,
    )


def outline_only_svg() -> str:
    left = (
        theirs(
            "1 intake_agent",
            "The configuration interview. The user confirms the record.",
        ),
        theirs(
            "2 literature_strategist_agent",
            "Search strategy, source screening, annotated bibliography and literature matrix.",
        ),
        theirs(
            "3 structure_architect_agent",
            "Paper structure, detailed outline, word count allocation and evidence mapping.",
        ),
    )
    right = (
        PAPER_INTAKE,
        ours(
            "role: literature strategist",
            "Only when no .bib is held. Writes review.md and refs.bib.",
        ),
        ours(
            "role: planner",
            "Writes outline.md with its evidence map and arguments.md with the argument map.",
        ),
        ours(
            "session: the outline's approval",
            "Shows both files and the weak-argument signs; no manuscript file is written.",
        ),
    )
    return two_columns(
        "outline-only.svg",
        "The outline-only mode of academic-paper against the outline-only mode of paper, whose "
        "planner writes the outline and the argument map",
        LEFT_CAPTION,
        RIGHT_CAPTION,
        left,
        right,
    )


def revision_svg() -> str:
    left = (
        theirs(
            "8 peer_reviewer_agent",
            "A simulated review of the draft, with revision suggestions.",
        ),
        theirs(
            "5 draft_writer_agent",
            "Writes a patch document whose operations trace to roadmap items, applied "
            "deterministically.",
        ),
        theirs(
            "6 citation_compliance_agent",
            "Citation format, reference list completeness and DOI checking of the revised draft.",
        ),
    )
    right = (
        PAPER_INTAKE,
        ours(
            "role: peer reviewer, items",
            "Writes items.md from the comments file, one item for each comment, each with an id.",
        ),
        ours(
            "role: draft writer, patches",
            "Patches that name the ids of the items. The literature strategist and the "
            "visualization agent start for an item that calls for a new reference or a figure "
            "change, within what intake allowed.",
        ),
        ours(
            "session: lookup.py cite-keys and check-urls",
            "The citation scripts, run by the session on the revised manuscript.",
        ),
        ours(
            "role: peer reviewer, reading 1",
            "Reads the patched files, the apply reports and the two script outputs.",
        ),
        ours(
            "role: draft writer, one pass",
            "One pass on the items not resolved.",
        ),
        ours(
            "role: peer reviewer, reading 2",
            "The items not resolved after it go to the final message as acknowledged limitations.",
        ),
        ours(
            "session: references, compile, /writing",
            "The reference checks, a compile in a copy, then /writing with its one-line reply.",
        ),
    )
    return two_columns(
        "revision.svg",
        "The revision mode of academic-paper against the revision mode of paper: the peer "
        "reviewer, the draft writer and citation compliance against items, patches, the citation "
        "scripts, reading 1, one pass, reading 2 and /writing",
        LEFT_CAPTION,
        RIGHT_CAPTION,
        left,
        right,
    )


def abstract_only_svg() -> str:
    left = (
        theirs(
            "1 intake_agent",
            "The configuration interview. The user confirms the record.",
        ),
        theirs(
            "7 abstract_bilingual_agent",
            "The abstract in two languages, with five to seven keywords for each.",
        ),
    )
    right = (
        PAPER_INTAKE,
        ours(
            "session: find the abstract",
            "Finds the file that holds the abstract, or takes the main .tex.",
        ),
        ours(
            "role: draft writer",
            "Writes the abstract and the keywords as a patch, which the session applies.",
        ),
    )
    return two_columns(
        "abstract-only.svg",
        "The abstract mode of academic-paper against the abstract-only mode of paper, whose draft "
        "writer takes the work of academic-paper's agent 7",
        LEFT_CAPTION,
        RIGHT_CAPTION,
        left,
        right,
    )


def lit_review_svg() -> str:
    left = (
        theirs(
            "1 intake_agent",
            "The configuration interview. The user confirms the record.",
        ),
        theirs(
            "2 literature_strategist_agent",
            "Search strategy, source screening, an annotated bibliography and a synthesis.",
        ),
    )
    right = (
        PAPER_INTAKE,
        ours(
            "role: literature strategist",
            "One start. Writes review.md and refs.bib and, given a .tex, a patch of its .bib.",
        ),
        ours(
            "session: patch and references",
            "Given a .tex, applies the patch and runs the reference checks.",
        ),
    )
    return two_columns(
        "lit-review.svg",
        "The lit-review mode of academic-paper against the lit-review mode of paper",
        LEFT_CAPTION,
        RIGHT_CAPTION,
        left,
        right,
    )


def citation_check_svg() -> str:
    left = (
        theirs(
            "6 citation_compliance_agent",
            "Citation format verification, reference list completeness and DOI checking. It "
            "writes a citation error report.",
        ),
    )
    right = (
        PAPER_INTAKE,
        ours(
            "session: lookup.py cite-keys and check-urls",
            "The citation scripts, run by the session before the agent starts.",
        ),
        ours(
            "role: citation compliance",
            "Reads each source's full text, writes a passage line for each cited claim in "
            "citation-report.md, and writes the patches C<m>.",
        ),
        ours(
            "session: references and quote-check",
            "Applies the patches, runs the reference checks and quote-check on the report.",
        ),
    )
    return two_columns(
        "citation-check.svg",
        "The citation-check mode of academic-paper against the citation-check mode of paper, "
        "which adds the claim check against the passages read",
        LEFT_CAPTION,
        RIGHT_CAPTION,
        left,
        right,
    )


def disclosure_svg() -> str:
    left = (
        theirs(
            "9 formatter_agent",
            "Writes the venue-specific AI-usage disclosure paragraphs and says where they go.",
        ),
    )
    right = (
        PAPER_INTAKE,
        ours(
            "role: draft writer",
            "Writes the statements as a patch at the place the venue's policy gives, and "
            "disclosure.md. The disclosure names the model identifier the session gives.",
        ),
        ours(
            "session: apply the patch",
            "Applies the patch and ends the run.",
        ),
    )
    return two_columns(
        "disclosure.svg",
        "The disclosure mode of academic-paper, drawn with its agent 9, against the disclosure "
        "mode of paper, drawn with its draft writer",
        LEFT_CAPTION,
        RIGHT_CAPTION,
        left,
        right,
    )


def only_modes_svg() -> str:
    name = "academic-paper-only-modes.svg"
    boxes = (
        gf.Box(
            gf.Rect(0, 0, 237, 0),
            "format-convert",
            "Agent 9 only, the formatter_agent. It converts the paper to LaTeX, DOCX, PDF or "
            "Markdown and converts the citation format.",
            accent=gf.EDGE,
        ),
        gf.Box(
            gf.Rect(0, 0, 237, 0),
            "plan",
            "Agents 1, 10, 3 and 4: the intake_agent, the socratic_mentor_agent, the "
            "structure_architect_agent and the argument_builder_agent. It gives a chapter plan "
            "and an insight collection.",
            accent=gf.EDGE,
        ),
        gf.Box(
            gf.Rect(0, 0, 237, 0),
            "revision-coach",
            "Agent 12 only, the revision_coach_agent. It parses reviewer comments into a "
            "revision roadmap, with a tracking template and a response letter skeleton.",
            accent=gf.EDGE,
        ),
        gf.Box(
            gf.Rect(0, 0, 237, 0),
            "rebuttal-audit",
            "Agent 12 only, parse-only. It checks a rebuttal draft against the reviewer comments "
            "and writes an advisory report, with no new response.",
            accent=gf.EDGE,
        ),
    )
    row = gf.fit_row(name, LEFT_X, TOP, 14, boxes)
    bottom = row[0].area.y + row[0].area.h
    canvas = gf.Canvas(
        name,
        CANVAS_WIDTH,
        int(bottom + 48),
        "The four modes of academic-paper 3.2.0 that paper 2.0.0 has no mode for, as boxes with "
        f"their agents: {titles(row)}.",
    )
    gf.draw_caption(canvas, LEFT_X, 30, "ACADEMIC-PAPER 3.2.0 MODES, AGENTS OF EACH", SPAN)
    for box in row:
        gf.draw_box(canvas, box)
    gf.draw_note(
        canvas,
        LEFT_X,
        bottom + 24,
        "paper 2.0.0 answers /paper plan with the line that plan mode is not among its modes.",
        SPAN,
    )
    return canvas.render()


STAGE_WIDTH = 380
SKILL_X = LEFT_X + STAGE_WIDTH + 30
SKILL_WIDTH = SPAN - STAGE_WIDTH - 30
SKILL_GAP = 10

STAGES = (
    (
        "Stage 1 RESEARCH",
        (
            "deep-research, the socratic, full or quick mode: a research question brief, a "
            "methodology, a bibliography and a synthesis."
        ),
        (
            ("researcher", "Entry 13: the stages of a research project, run over a named range."),
            (
                "paper",
                (
                    "Entry 5: the lit-review mode, a literature review with a BibTeX entry for "
                    "each included source."
                ),
            ),
        ),
    ),
    (
        "Stage 2 WRITE",
        "academic-paper, the plan or full mode: a paper draft.",
        (("paper", "Entry 5: the full mode, a first draft with the abstract and the statements."),),
    ),
    (
        "Stage 2.5 INTEGRITY",
        (
            "integrity_verification_agent, pre-review: a verification report and a corrected "
            "paper, up to 3 rounds."
        ),
        (
            (
                "researcher",
                (
                    "Entry 13: the integrity check of the references, the claims, the numbers and "
                    "the figures, and the ethics check, once on the finished draft."
                ),
            ),
        ),
    ),
    (
        "Stage 3 REVIEW",
        (
            "academic-paper-reviewer, full mode: five review reports, an editorial decision and "
            "a revision roadmap."
        ),
        (
            ("paper-review", "Entry 6: the reviewer roles and the editor's synthesis."),
            (
                "referee",
                (
                    "Entry 7.A: the report of one reviewer on someone else's paper, with no "
                    "panel synthesis."
                ),
            ),
        ),
    ),
    (
        "Stage 4 REVISE",
        "academic-paper, revision mode: a revised draft and the response to reviewers.",
        (
            ("paper", "Entry 5: the revision mode, patches that answer a comments file."),
            (
                "rebuttal",
                "Entry 7: the response letter, from the referee comments and the apply report.",
            ),
        ),
    ),
    (
        "Stage 3' RE-REVIEW",
        "academic-paper-reviewer, re-review mode: a verification review of the revision.",
        (("paper-review", "Entry 6: the re-review mode."),),
    ),
    (
        "Stage 4' RE-REVISE",
        "academic-paper, revision mode: a second revised draft, when it is needed.",
        (("paper", "Entry 5: the revision mode again."),),
    ),
    (
        "Stage 4.5 FINAL INTEGRITY",
        "integrity_verification_agent, final-check: no issue may be left to go on.",
        (
            (
                "researcher",
                "Entry 13: the integrity check and the ethics check once more, after the revision.",
            ),
        ),
    ),
    (
        "Stage 5 FINALIZE",
        "academic-paper, format-convert mode: the final paper in Markdown, DOCX or PDF.",
        (
            (
                "submit-manuscript",
                (
                    "Entry 14: fills a submission portal, never presses Submit, and writes the "
                    "cover letter."
                ),
            ),
        ),
    ),
    (
        "Stage 6 PROCESS SUMMARY",
        "The orchestrator: a record of how the paper was made, in two languages.",
        (),
    ),
)

NO_SKILL_NOTE = "No entry of the roadmap names this work, so no skill stands beside it."


def skill_built(skill: str) -> bool:
    """A skill is built when its folder stands under skills/ in this repository."""
    return (gf.ROOT / "skills" / skill).is_dir()


def pipeline_svg() -> str:
    name = "academic-pipeline.svg"
    stage_boxes = []
    skill_boxes = []
    y = TOP
    for title, body, skills in STAGES:
        cards = [
            card(skill, text, gf.ACCENT, SKILL_WIDTH, dashed=not skill_built(skill))
            for skill, text in skills
        ]
        heights = [gf.box_height(name, one) for one in cards]
        stage = theirs(title, body if skills else body + " " + NO_SKILL_NOTE)
        stage = replace(stage, area=gf.Rect(LEFT_X, y, STAGE_WIDTH, 0))
        stage_height = max(
            [gf.box_height(name, stage), sum(heights) + SKILL_GAP * max(len(cards) - 1, 0)]
        )
        stage_boxes.append(replace(stage, area=gf.Rect(LEFT_X, y, STAGE_WIDTH, stage_height)))
        card_y = y
        for one, height in zip(cards, heights):
            skill_boxes.append(replace(one, area=gf.Rect(SKILL_X, card_y, SKILL_WIDTH, height)))
            card_y += height + SKILL_GAP
        y += stage_height + STACK_GAP
    bottom = y - STACK_GAP
    label = (
        "The ten stages of academic-pipeline 3.13.0 as boxes in order, each beside the Ordo skills "
    )
    label += "whose roadmap entry names that work, a dashed box being a skill not yet built: "
    label += "; ".join(
        title
        + (" beside " + ", ".join(skill for skill, _ in skills) if skills else " beside no skill")
        for title, _, skills in STAGES
    )
    canvas = gf.Canvas(name, CANVAS_WIDTH, int(bottom + 48), label + ".")
    gf.draw_caption(canvas, LEFT_X, 30, "ACADEMIC-PIPELINE 3.13.0, STAGES IN ORDER", STAGE_WIDTH)
    gf.draw_caption(canvas, SKILL_X, 30, "SKILLS OF ORDO THAT TAKE THE WORK", SKILL_WIDTH)
    for box in stage_boxes + skill_boxes:
        gf.draw_box(canvas, box)
    gf.draw_column_arrows(canvas, tuple(stage_boxes))
    for box in skill_boxes:
        arrow_y = box.area.y + 20
        canvas.line(
            LEFT_X + STAGE_WIDTH, arrow_y, box.area.x - 1, arrow_y, gf.ACCENT, 2, arrow=True
        )
    gf.draw_note(
        canvas,
        LEFT_X,
        bottom + 24,
        "A dashed box is a skill whose folder does not yet stand under skills/.",
        SPAN,
    )
    return canvas.render()


def main() -> int:
    try:
        figures = (
            ("full.svg", full_svg()),
            ("outline-only.svg", outline_only_svg()),
            ("revision.svg", revision_svg()),
            ("abstract-only.svg", abstract_only_svg()),
            ("lit-review.svg", lit_review_svg()),
            ("citation-check.svg", citation_check_svg()),
            ("disclosure.svg", disclosure_svg()),
            ("academic-paper-only-modes.svg", only_modes_svg()),
            ("academic-pipeline.svg", pipeline_svg()),
        )
        lines = gf.write_figures(figures, HERE)
    except gf.FigureError as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    for line in lines:
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main())
