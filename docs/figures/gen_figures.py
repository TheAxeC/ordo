"""Write the SVG figures of the skills under docs/figures/, one or more for each skill.

Writes these figures, each at its path under docs/figures/:

- orchestration/pipeline.svg: the commands of one roadmap entry in order, with the agents they
  start and the stops that wait on the user.
- orchestration/plan-loop.svg: the commands of one step, /spec, build it, /refute, close them,
  /refute over the round and /land, with the /plan-orchestration band.
- orchestration/land.svg, orchestration/plan.svg, orchestration/plan-retro.svg: the steps and
  stops of each skill.
- orchestration/plan-orchestration.svg: the loop of the plan-orchestration skill over the steps
  of every open plan, with its builder, its stops and the commands it invokes.
- orchestration/refute.svg: the reviewer and the steps of the first run of the refute skill,
  with the run over a repair round as its cycle.
- orchestration/roadmap.svg: the steps and stops of the add mode of the roadmap skill.
- orchestration/spec.svg: the steps, the diagnosis agent, the brief-check agent and the stops of
  the spec skill.
- orchestration/grill.svg, academic/writing.svg, code/code-comments.svg: the agents, stops and
  cycles of each skill.
- code/codebase-design.svg: the agents and stops of the standards mode and the review mode of
  the codebase-design skill.
- code/diagnose.svg: the steps, stops and cycles of the diagnose skill run by a person.
- code/wizard.svg, code/handbook.svg: the steps and stops of each skill.
- academic/paper-review-panel.svg: the agents and stops of the full mode of the
  paper-review-panel skill, with the roles the other five modes start in its note.
- academic/referee.svg: the agents and stops of the first round of the referee skill, with what
  the second round starts in its note.
- academic/researcher/manuscript.svg: the stages, agents, runs of other skills and stops of the
  manuscript mode of the researcher skill, with what the integrity mode runs alone, and what the
  novelty, idea and readme modes do with no agent started, in its note.
- academic/researcher/research.svg: the six stages of the research mode of the researcher skill,
  the builder and the reviewer of each piece of code, the jobs, the stops and each way back to
  an earlier stage, with what the adopt mode and the full mode run in its note.
- academic/researcher/revision.svg: the revision mode of the researcher skill: the split of the
  referee comments with its stop, the campaigns with their builder and reviewer, Compare and its
  stops, Consolidate, /paper revision, and the stages of the manuscript mode that follow it.
- academic/researcher/lifecycle.svg: the modes of the researcher skill in the order a project
  goes through them, the six stages of research with the ways back from Compare, the project's
  README with the modes that read and write it, and the readme mode beside them.
- academic/submit.svg: the agent and stops of the submit skill, from the submission sheet to the
  page of the final submit.
- academic/grant.svg: the agents and stops of the draft mode of the grant skill, with what the
  other four modes start in its note.
- academic/paper/full.svg, academic/paper/revision.svg, academic/paper/lit-review.svg,
  academic/paper/outline-only.svg, academic/paper/abstract-only.svg,
  academic/paper/citation-check.svg, academic/paper/disclosure.svg, academic/paper/plan.svg,
  academic/paper/format-convert.svg, academic/paper/revision-coach.svg,
  academic/paper/rebuttal-audit.svg, academic/paper/response-letter.svg: one figure per mode of
  the paper skill.
- academic/paper/lifecycle.svg: the path of a manuscript through the modes of the paper skill,
  from a plan to resubmission: full mode and revision mode each hold the parts one run does,
  each part with the mode or call that runs it alone.
- academic/paper/run-folder.svg: the agents of a full run in order, each arrow with the files the
  agent writes, and the path of a patch from an agent to the manuscript.
- explain/wait-what.svg: the one step of the wait-what skill, which never stops.
- explain/tutor.svg: the steps and stops of the teaching mode of the tutor skill.
- ordo/ordo-help.svg: the steps of the ordo-help skill for one plan, which never stops.
- ordo/ordo-init.svg: the steps, scripts and stops of the ordo-init skill in an existing
  repository with no plan.yaml.
- ordo/session-retro.svg: the steps, the reader script and the stops of the session-retro skill
  for one plan.

A figure stands in the folder of its group of skills/: docs/figures/<group>/<skill>.svg for a
skill with one figure, docs/figures/<group>/<skill>/<name>.svg for a skill with several, and
docs/figures/<group>/<name>.svg for a figure over several skills, in the group most of them
belong to.

Every figure but three shows the order of a run: academic/paper/lifecycle.svg,
academic/paper/run-folder.svg and academic/researcher/lifecycle.svg draw no run. A box is an
agent start or a task of a resumed agent, solid when it always runs and dashed when it runs only
when needed. A stop that waits on the user is an orange box, and a refusal is not drawn. A cycle
is a dotted arrow with its cap, and a check an agent repeats inside one start is a dotted loop
on that agent with its cap. Scripts and the session's own steps are left out, except where a
paper figure, academic/researcher/research.svg, academic/researcher/revision.svg or a figure of
a skill's steps draws them: a script the session runs, and in academic/researcher/research.svg
and academic/researcher/revision.svg the jobs the session submits, is a grey box, and a step
where the session reads and judges is a rounded box, each with its legend line. A figure listed
above with the steps of a skill draws a step, or a run of steps that make one move, as one box:
a rounded box for a step the session does itself, a grey box for a script the skill ships, a
solid or dashed box for an agent the step starts, and an orange box after the step a stop comes
from. Its note names the modes it leaves out. academic/paper/lifecycle.svg draws no run: a frame
is a mode or what you do outside the skill, and a box in it is a part of that mode.
academic/paper/run-folder.svg draws the agents of a full run with the files each writes on its
arrows, and stops and cycles are left out of it. In academic/researcher/lifecycle.svg a frame is
a mode, a stage of research or the project's README, and a box in it is a part of it. Each of
the three has its own legend.

Every box, arrow and label is written in this file, taken from each skill's SKILL.md and Stops
table, and for academic/paper/lifecycle.svg also from the paper skill's mode selection guide;
the script reads no skill file and no other input. A change to a Stops table, to a skill's
Steps, its agents, its cycles or its name is made in the labels below, and the script is run
again.

The drawing engine is skills/code/handbook/templates/figures.py, which this file imports, found
from its own location, with sys.dont_write_bytecode set so that no __pycache__ folder is
written. It imports the kind PAPER, a run of another skill, from docs/figures/ordo_kinds.py
beside it. It builds its mapping of kinds once with the engine's with_kinds, from the engine's
kinds, paper and three rounded kinds. The three are drawn in the style of the engine's rounded
box, and each has its own words for the text alternative. The kind step reads "a step of the
session", judge reads "the session reads and judges" and folder reads "a folder". The file
passes that mapping to each compose, lanes_figure and describe call.

Run, from the repository root: python3 docs/figures/gen_figures.py
The script finds its files from its own location, so it also runs from any other directory when
given the path to the script.

Every byte written is ASCII. Each figure carries its own light panel, so it reads the same on a
light or a dark page.

Errors, each printed to stderr as "error: <message>":

- the drawing engine not found, or a name this script imports missing from it: the message
  names the engine's path and the ImportError;
- docs/figures/ordo_kinds.py not found, or PAPER missing from it: the message names the file and
  the ImportError;
- a box or a legend row whose kind the mapping of kinds does not hold: the message names the
  figure, or the title of the figure, and the kind;
- a label that does not fit its box: the message names the figure, the box and the label;
- a word longer than a line of its box: the message names the figure, the box, the word and the
  label;
- an edge label that does not fit, or a caption, a note or the legend that does not fit one line:
  the message names the figure, the place, the label and the width in pixels;
- an edge label for which no place beside its arrow is free of the boxes, the other labels and
  the arrows, after the gap under its row has grown to its limit: the message names the figure
  and the label;
- two boxes of one figure that share a key: the message names the figure;
- an edge that names a box the figure does not hold, or an edge whose style is none of flow,
  dotted, back and return: the message names the figure, the two ends of the edge and, for the
  box, its key or, for the style, the style;
- edges that form a cycle not marked as a return: the message names the figure;
- a body that holds a non-ASCII character: the message names the file;
- a file that cannot be written or read back: the message names the file and the cause;
- a file whose text read back differs from the body written: the message names the file.

The label, kind and ASCII errors stop the run before any file is written.

Exit status: 0 every file written and verified, 1 an error above.
"""

import sys
from collections.abc import Sequence
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent.parent
ENGINE = Path("skills/code/handbook/templates/figures.py")

sys.dont_write_bytecode = True
sys.path.insert(0, str(ROOT / ENGINE.parent))
try:
    from figures import (
        KINDS,
        Edge,
        FigureError,
        Graph,
        Kind,
        Lane,
        Legend,
        Node,
        Panel,
        Row,
        compose,
        describe,
        flow_label,
        graph,
        lanes_figure,
        lanes_label,
        parts,
        with_kinds,
        write_figures,
    )
except ImportError as error:
    print(
        f"error: the drawing engine {ENGINE.as_posix()} cannot be imported: {error}",
        file=sys.stderr,
    )
    sys.exit(1)
try:
    from ordo_kinds import PAPER
except ImportError as error:
    print(
        f"error: docs/figures/ordo_kinds.py cannot be imported: {error}",
        file=sys.stderr,
    )
    sys.exit(1)

# ---------------------------------------------------------------------------------------
# The figures.

ROUNDED = next(kind.style for kind in KINDS.values() if kind.style.pill)
FIGURE_KINDS = with_kinds(
    {
        "paper": PAPER,
        "step": Kind(ROUNDED, "a step of the session"),
        "judge": Kind(ROUNDED, "the session reads and judges"),
        "folder": Kind(ROUNDED, "a folder"),
    }
)

SIMPLE_LEGEND = (
    Legend("agent", "Solid box: an agent start, or a task of a resumed agent, that always runs"),
    Legend(
        "maybe",
        "Dashed box: an agent start, or a task of a resumed agent, that runs only when needed",
    ),
    Legend("stop", "Orange box: the run stops for you"),
    Legend("dotted", "Dotted arrow: a cycle, with its cap"),
    Legend(
        "loop",
        "Dotted loop on one agent: a check it repeats inside its own start, with its cap",
    ),
)

PAPER_KIND_LEGEND = (
    Legend("script", "Grey box: a script the session runs, whose output is a fact"),
    Legend("judge", "Rounded box: the session reads and judges"),
)

MODEL = "A model other than the configured one"


def _single(
    name: str, title: str, flow: Graph, note: str = "", legend: Sequence[Legend] = ()
) -> str:
    panels = [Panel("", flow)]
    return compose(
        name,
        describe(title, panels, FIGURE_KINDS),
        panels,
        legend or SIMPLE_LEGEND,
        note,
        FIGURE_KINDS,
    )


STEP_LEGEND = Legend("step", "Rounded box: a step the session does itself")
SHIPPED_LEGEND = Legend("script", "Grey box: a script the skill ships, which the session runs")
STEP_LOOP_LEGEND = Legend("loop", "Dotted loop on one box: a step repeated, with its cap")


def _steps(name: str, title: str, flow: Graph, note: str) -> str:
    """A figure of a skill's own steps, with a legend of the kinds and arrows it draws."""
    kinds = {node.kind for node in (*flow.nodes, *flow.floating)}
    backs = [edge for edge in flow.edges if edge.style == "back"]
    rows = (
        (SIMPLE_LEGEND[0], "agent" in kinds),
        (SIMPLE_LEGEND[1], "maybe" in kinds),
        (STEP_LEGEND, "step" in kinds),
        (SHIPPED_LEGEND, "script" in kinds),
        (SIMPLE_LEGEND[2], "stop" in kinds),
        (SIMPLE_LEGEND[3], any(edge.src != edge.dst for edge in backs)),
        (STEP_LOOP_LEGEND, any(edge.src == edge.dst for edge in backs)),
    )
    legend = tuple(row for row, drawn in rows if drawn)
    return _single(name, title, flow, note, legend)


STOPS_NOT_DRAWN = (
    "Not drawn, since they hold in every mode: at every patch, a structural patch, a "
    "patch that does not apply or a failed script stops the run."
)


MODE_STOP = Node("MS", "The mode to run, for a plain request that fits two modes", "stop")
CLAIM_NOT_HELD = "the check stops at the first claim not held, and the stop is raised once the agent has ended"
CLAIM_CHECK = "Citation compliance: each claim against its source's full text, unless you said no"
STYLE_STOP = "The citation style to confirm"
STYLE_EDGE = "more than half the cited entries in another style than the Citation Format row"
STYLE_BACK = "your answer: resumed for the format work only"
RESULTS_FIX = "Draft writer, resumed: the statements the result files do not bear out, as a patch"
REFERENCE_STOP = "A reference that cannot be confirmed, only under strict"


def with_mode_stop(flow: Graph) -> Graph:
    """The graph with the stop every mode of paper lists, the mode to run, standing apart."""
    return Graph(
        flow.nodes, flow.edges, (*flow.floating, MODE_STOP), flow.node_width, flow.caption
    )


def _paper(name: str, mode: str, flow: Graph) -> str:
    flow = with_mode_stop(flow)
    kinds = {node.kind for node in (*flow.nodes, *flow.floating)}
    legend = (
        *SIMPLE_LEGEND,
        *(row for row in PAPER_KIND_LEGEND if row.sample in kinds),
    )
    return _single(
        f"academic/paper/{name}.svg",
        f"The {mode} mode of the paper skill",
        flow,
        STOPS_NOT_DRAWN,
        legend,
    )


STRUCTURE = "Session: one literature strategist, or several with a merge, written in config.md"
STARTS = "Literature strategists, the starts the session briefs, at once"
MERGE = "Literature strategist, the merge the session briefs: "
ONE = "one strategist"
SEVERAL = "several, with a merge"
SEARCH_LOOP = "search rounds: 3 of 5 stopping rules, or 4 rounds"
CONFIRMED = "review.md and refs.bib written with its own edits"


SEARCH_STOP = "search rounds: end at any 3 of 5 conditions, or after 4 rounds"
PATCHED = "Script: each patch applied, the compile, the reference checks"
WRITING = "/writing review, unless you said no"
REPLY_STOP = "The reply to the closing review"
FINDINGS = "Draft writer, resumed: the findings you pick, as a patch"
SESSION_STOP = "The session's questions, in one message"
RESTRUCTURE_STOP = "A revision item that needs restructuring"
REPLACE_STOP = "A converted file to replace"
LIMIT_CUT = "Draft writer, resumed: content cut once, when over a declared word or page limit"


def _search(after: str) -> tuple[tuple[Node, ...], tuple[Edge, ...]]:
    """The session's choice of one literature strategist or several with a merge."""
    nodes = (
        Node("S", STRUCTURE, "judge"),
        Node("L", "Literature strategist, unless you give your own sources", "maybe"),
        Node("T2", STARTS, "maybe"),
        Node("M", MERGE + "review.md and refs.bib", "maybe"),
        Node("LR", "You review the sources, optional", "stop"),
    )
    edges = (
        Edge("S", "L", ONE),
        Edge("S", "T2", SEVERAL),
        Edge("L", "L", SEARCH_STOP, "back"),
        Edge("T2", "T2", SEARCH_STOP, "back"),
        Edge("T2", "M"),
        Edge("L", "LR"),
        Edge("M", "LR"),
        Edge("LR", after),
    )
    return nodes, edges


def paper_full_graph() -> Graph:
    search_nodes, search_edges = _search("A")
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        *search_nodes,
        Node("A", "Structure architect"),
        Node("OA", "Outline approval", "stop"),
        Node("B", "Argument builder"),
        Node("W", "Draft writer, 2 calls: main.tex"),
        Node("GA", "A generator phase aborted", "stop"),
        Node("V", "Visualization, with data: the figures placed by patch", "maybe"),
        Node("C", CLAIM_CHECK),
        Node("SS", STYLE_STOP, "stop"),
        Node("AB", "Abstract agent: a patch"),
        Node("P", "Peer reviewer, 2 calls"),
        Node("RF", RESULTS_FIX, "maybe"),
        Node("WR", "Draft writer, resumed: the whole draft again, as one patch"),
        Node(
            "IC",
            "Citation compliance, resumed: the cited sentences of the patch, unless you said no",
            "maybe",
        ),
        Node("SD", "The draft review does not pass", "stop"),
        Node("SC", "A claim the run cannot support", "stop"),
        Node("SR", REFERENCE_STOP, "stop"),
        Node("CF", PATCHED, "script"),
        Node("F", "Formatter: targets, cover letter, AI disclosure, checklist"),
        Node("LC", LIMIT_CUT, "maybe"),
        Node("SO", REPLACE_STOP, "stop"),
        Node("WG", WRITING, "maybe"),
        Node("WS", REPLY_STOP, "stop"),
        Node("WA", FINDINGS, "maybe"),
    )
    edges = (
        Edge("I", "S"),
        *search_edges,
        Edge("A", "OA"),
        Edge("OA", "A", "restructuring, no cap", "back"),
        Edge("OA", "B"),
        Edge("B", "W"),
        Edge("B", "V"),
        Edge("V", "V", "checks the rendered figure, up to 2 fixes, optional", "back"),
        Edge("W", "GA", "a 4a lint fails twice, or a 4b lint fails"),
        Edge("W", "C"),
        Edge("W", "AB"),
        Edge("C", "SS", STYLE_EDGE),
        Edge("SS", "C", STYLE_BACK, "back"),
        Edge("C", "SC", CLAIM_NOT_HELD),
        Edge("C", "SR", "under strict, a DOI or arXiv ID provably fails lookup"),
        Edge("C", "RF"),
        Edge("RF", "P"),
        Edge("C", "P"),
        Edge("AB", "P"),
        Edge("V", "P"),
        Edge("P", "WR", "a revision: round 2, once", "dotted"),
        Edge("WR", "IC"),
        Edge("IC", "P", "", "back"),
        Edge("P", "GA", "a 6a lint fails twice, or a 6b lint fails"),
        Edge("P", "SD", "after round 2 a score under 6.5 with a Critical issue open"),
        Edge("P", "CF"),
        Edge("CF", "SR", "a failure left after the reference fix"),
        Edge("CF", "F"),
        Edge("F", "F", "a checklist item fails, no cap", "back"),
        Edge("F", "SO", "a converted output already stands"),
        Edge("F", "LC"),
        Edge("LC", "WG"),
        Edge("WG", "WS"),
        Edge("WS", "WA"),
    )
    return graph(nodes, edges)


def paper_revision_graph() -> Graph:
    nodes = (
        Node("SQ", SESSION_STOP, "stop"),
        Node("P", "Peer reviewer: the comments as a roadmap"),
        Node("W", "Draft writer: a patch per item"),
        Node("SX", RESTRUCTURE_STOP, "stop"),
        Node("C", CLAIM_CHECK),
        Node("SS", STYLE_STOP, "stop"),
        Node("SC", "A claim the run cannot support", "stop"),
        Node("SR", REFERENCE_STOP, "stop"),
        Node("RF", RESULTS_FIX, "maybe"),
        Node("R2", "Peer reviewer, resumed: the re-review"),
        Node("CF", PATCHED, "script"),
        Node("RL", "Draft writer, resumed: the response letter, for referee comments", "maybe"),
        Node("RC", "Peer reviewer, resumed: the letter checked, a verdict per point", "maybe"),
        Node("WG", WRITING, "maybe"),
        Node("WS", REPLY_STOP, "stop"),
        Node("WA", FINDINGS, "maybe"),
        Node("X", "Revised draft, the rest as limitations"),
    )
    edges = (
        Edge("SQ", "P"),
        Edge("P", "W"),
        Edge("W", "SX", "the writer's tag in place of a patch"),
        Edge("SX", "W", "a full re-emission, or narrowed items", "back"),
        Edge("W", "C"),
        Edge("C", "SS", STYLE_EDGE),
        Edge("SS", "C", STYLE_BACK, "back"),
        Edge("C", "SC", CLAIM_NOT_HELD),
        Edge("C", "SR", "under strict, a DOI or arXiv ID provably fails lookup"),
        Edge("C", "RF"),
        Edge("RF", "R2"),
        Edge("C", "R2", "round 2, once"),
        Edge("R2", "CF", "the items not resolved become limitations"),
        Edge("CF", "SR", "a failure left after the reference fix"),
        Edge("CF", "RL"),
        Edge("RL", "RC"),
        Edge("RC", "WG"),
        Edge("CF", "WG", "a /writing report as the comments"),
        Edge("WG", "WS"),
        Edge("WS", "WA"),
        Edge("WA", "X"),
    )
    return graph(nodes, edges)


def paper_lit_review_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        Node("S", STRUCTURE, "judge"),
        Node("L", "Literature strategist: the synthesis analysis too; " + CONFIRMED, "maybe"),
        Node("T2", STARTS, "maybe"),
        Node("M", MERGE + "the synthesis analysis too; " + CONFIRMED, "maybe"),
        Node("SJ", "Session: each start's report read", "judge"),
        Node("SC", "Script: every entry's DOI or arXiv ID resolved, one resolve over refs.bib", "script"),
        Node("L2", "Literature strategist that wrote refs.bib, resumed with the identifier check: titles resolved, strict: a failing identifier corrected or removed", "maybe"),
        Node("CK", "Script: every entry resolved again, one resolve over refs.bib", "script"),
        Node("LR", "You review the sources, optional", "stop"),
        Node("RC", "Script: each corrected or added entry's DOI or arXiv ID resolved again", "script"),
        Node("SR", "A reference that cannot be confirmed", "stop"),
    )
    edges = (
        Edge("I", "S"),
        Edge("S", "L", ONE),
        Edge("S", "T2", SEVERAL),
        Edge("L", "L", SEARCH_LOOP, "back"),
        Edge("T2", "T2", SEARCH_LOOP, "back"),
        Edge("T2", "M"),
        Edge("L", "SJ"),
        Edge("M", "SJ"),
        Edge("SJ", "SC"),
        Edge("SC", "L2"),
        Edge("L2", "CK"),
        Edge("CK", "SR", "strict: an identifier still fails"),
        Edge("CK", "LR"),
        Edge("LR", "RC"),
        Edge("RC", "SR", "strict: an identifier still fails"),
    )
    return graph(nodes, edges)


def paper_outline_only_graph() -> Graph:
    search_nodes, search_edges = _search("A")
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        *search_nodes,
        Node("A", "Structure architect"),
        Node("OA", "Outline approval", "stop"),
    )
    edges = (
        Edge("I", "S"),
        *search_edges,
        Edge("A", "OA"),
        Edge("OA", "A", "restructuring, no cap", "back"),
    )
    return graph(nodes, edges)


def paper_abstract_only_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: you confirm", "stop"),
        Node("AB", "Abstract agent: a patch"),
    )
    return graph(nodes, (Edge("I", "AB"),))


def paper_citation_check_graph() -> Graph:
    nodes = (
        Node("SQ", SESSION_STOP, "stop"),
        Node("C", "Citation compliance: each claim against its source's full text"),
        Node(
            "SS",
            "The citation style to confirm, when more than half the cited entries follow "
            "another style than the Citation Format row",
            "stop",
        ),
        Node("SC", "A claim the run cannot support", "stop"),
        Node("SR", REFERENCE_STOP, "stop"),
        Node("X", "Citation report"),
    )
    edges = (
        Edge("SQ", "C"),
        Edge("C", "SS"),
        Edge("SS", "C", STYLE_BACK, "back"),
        Edge("C", "SC", CLAIM_NOT_HELD),
        Edge("C", "SR", "under strict, a DOI or arXiv ID provably fails lookup"),
        Edge("C", "X"),
    )
    return graph(nodes, edges)


def paper_disclosure_graph() -> Graph:
    nodes = (
        Node("C", "The selector of the call: --venue=<v> or --policy-anchor=<a>", "judge"),
        Node("S", "The session's questions: the venue, for a call with no selector", "stop"),
        Node("V", "The venue's policy: you paste it, for a venue not in the database", "stop"),
        Node("F", "Formatter: each kind of AI use marked, the statement as a patch"),
        Node("U", "You confirm each uncertain kind of AI use", "stop"),
    )
    edges = (
        Edge("C", "S", "no selector"),
        Edge("C", "V", "a venue not in the database"),
        Edge("C", "F"),
        Edge("S", "V", "a venue not in the database"),
        Edge("S", "F"),
        Edge("V", "F"),
        Edge("F", "U", "a kind marked uncertain"),
        Edge("U", "F", "your answer", "back"),
    )
    return graph(nodes, edges)


def paper_plan_graph() -> Graph:
    nodes = (
        Node("I", "Intake agent: 3 questions, you confirm", "stop"),
        Node("M", "Socratic mentor, chapter by chapter, given each answer"),
        Node("Q", "The mentor's question", "stop"),
        Node("S", "Structure architect: the outline"),
        Node("M2", "Socratic mentor and argument builder: the stress test"),
        Node("X", "Chapter plan and INSIGHT collection"),
    )
    edges = (
        Edge("I", "M"),
        Edge("M", "Q"),
        Edge("Q", "M", "offers after 8 rounds on a chapter, suggests outline-only past 15 in all", "back"),
        Edge("M", "S"),
        Edge("S", "M2"),
        Edge("M2", "X"),
    )
    return graph(nodes, edges)


def paper_format_convert_graph() -> Graph:
    nodes = (
        Node("SQ", SESSION_STOP, "stop"),
        Node("ST", "The target to settle", "stop"),
        Node("F", "Formatter: LaTeX, DOCX, PDF, Markdown, citation style, as patches"),
        Node(
            "F2",
            "Formatter, resumed: the conversion patch, when the citation style changes",
            "maybe",
        ),
        Node("CF", "Script: patches applied, compile, pandoc, the counts", "script"),
        Node("SO", REPLACE_STOP, "stop"),
        Node("X", "Formatted document"),
    )
    edges = (
        Edge("SQ", "ST", "a target that is not supported"),
        Edge("ST", "F"),
        Edge("SQ", "F"),
        Edge("CF", "SO", "an output already stands"),
        Edge("SO", "CF", "you confirm", "back"),
        Edge("F", "F2"),
        Edge("F", "CF"),
        Edge("F2", "CF"),
        Edge("CF", "X"),
    )
    return graph(nodes, edges)


def paper_revision_coach_graph() -> Graph:
    nodes = (
        Node("R", "Revision coach: the comments parsed"),
        Node("Q", "You confirm the parsed comments", "stop"),
        Node("R2", "Revision coach, resumed: roadmap, tracking template, letter skeleton"),
    )
    edges = (
        Edge("R", "Q"),
        Edge("Q", "R", "a correction", "back"),
        Edge("Q", "R2"),
    )
    return graph(nodes, edges)


def paper_rebuttal_audit_graph() -> Graph:
    nodes = (
        Node("R", "Revision coach, parsing only: the comments and your response draft"),
        Node("X", "Coverage per comment, gaps, risk flags; advisory, nothing verified"),
    )
    return graph(nodes, (Edge("R", "X"),))


def paper_response_letter_graph() -> Graph:
    nodes = (
        Node("W", "Draft writer: response-letter.md beside the manuscript"),
        Node("P", "Peer reviewer: a verdict per point"),
        Node("X", "The letter and its check"),
    )
    return graph(nodes, (Edge("W", "P"), Edge("P", "X")))


PAPER_MODES = (
    ("full", paper_full_graph),
    ("revision", paper_revision_graph),
    ("lit-review", paper_lit_review_graph),
    ("outline-only", paper_outline_only_graph),
    ("abstract-only", paper_abstract_only_graph),
    ("citation-check", paper_citation_check_graph),
    ("disclosure", paper_disclosure_graph),
    ("plan", paper_plan_graph),
    ("format-convert", paper_format_convert_graph),
    ("revision-coach", paper_revision_coach_graph),
    ("rebuttal-audit", paper_rebuttal_audit_graph),
    ("response-letter", paper_response_letter_graph),
)


def paper_figures() -> tuple[tuple[str, str], ...]:
    """The figure of each mode of the paper skill, as its path under docs/figures and its body."""
    return tuple(
        (f"academic/paper/{mode}.svg", _paper(mode, mode, build()))
        for mode, build in PAPER_MODES
    )


LIFECYCLE_LEGEND = (
    Legend("agent", "Solid box: a part of the mode named above it, and the mode or call that runs that part alone"),
    Legend("maybe", "Dashed box: work the session does on request, with no mode behind it"),
)


def paper_lifecycle() -> str:
    plan = Lane(
        "/paper plan",
        parts("Help me plan my paper: a chapter plan, worked out in a dialogue"),
    )
    full = Lane(
        "/paper full: one run does every part, in this order",
        parts(
            "1. The literature search. Alone: /paper lit-review",
            "2. The outline. Alone: /paper outline-only",
            "3. The arguments and the draft. Only in full mode",
            "4. The figures. Alone: /paper figures, a call",
            "5. The citation check. Alone: /paper citation-check",
            "6. The abstract. Alone: /paper abstract-only",
            "7. The review of the draft. Alone: /paper draft-review, a call",
            "8. The format and the cover letter. Alone: /paper format-convert",
            "9. The AI disclosure statement. Alone: /paper disclosure",
        ),
        columns=3,
        node_width=218,
    )
    submit = Lane(
        "You submit: /submit",
        parts(
            "Write the highlights",
            "Describe a graphical abstract",
            kind="maybe",
        ),
    )
    revision = Lane(
        "/paper revision: one run does every part, in this order",
        parts(
            "1. The comments read into a list of items. Alone, as a roadmap: /paper revision-coach",
            "2. The manuscript revised, and the citations of the changes checked. Only in revision mode",
            "3. The response letter and its check, for referee comments. Alone: /paper response-letter",
        ),
        columns=3,
        node_width=218,
    )
    resubmit = Lane(
        "You resubmit: /submit",
        parts("A response you wrote yourself, checked before you send it: /paper rebuttal-audit"),
    )
    internal = Lane(
        "Internal documents",
        parts(
            "A record of every attempt, for my own reference: /paper full, outline-only or "
            "abstract-only, with the intake row Internal only set to yes",
            "An outline or a literature review to pass to my co-authors: /paper outline-only "
            "or /paper lit-review",
        ),
        columns=2,
        node_width=330,
    )
    rows = (
        Row("FROM A PLAN TO A SUBMITTED MANUSCRIPT", (plan, full, submit)),
        Row("WHEN THE JOURNAL'S COMMENTS COME BACK", (revision, resubmit)),
        Row("DOCUMENTS THAT ARE NOT SUBMITTED", (internal,), arrows=False),
    )
    note = (
        "Full mode's intake offers the latest plan run (chapter-plan.md, insights.md, "
        "dialogue.md) and the latest lit-review run (review.md, refs.bib), so work done alone "
        "is not done twice. An outline-only run also makes the literature search. Format-convert "
        "also formats a manuscript for another journal. A revision on an editor's comments "
        "writes no response letter."
    )
    label = lanes_label("The path of a manuscript through the modes of the paper skill", rows)
    return lanes_figure(
        "academic/paper/lifecycle.svg", label, rows, LIFECYCLE_LEGEND, note, FIGURE_KINDS
    )


RUN_FOLDER_LEGEND = (
    Legend("agent", "Solid box: an agent of the run"),
    Legend("script", "Grey box: a script the session runs"),
    Legend("folder", "Rounded box: a folder, with the files that end up in it"),
)


def paper_run_folder() -> str:
    run = (
        Node("I", "Intake agent"),
        Node("S", "Literature strategist"),
        Node("A", "Structure architect"),
        Node("B", "Argument builder"),
        Node("W", "Draft writer"),
        Node("V", "Visualization agent"),
        Node("C", "Citation compliance agent"),
        Node("AB", "Abstract agent"),
        Node("R", "Peer reviewer"),
        Node("F", "Formatter"),
        Node(
            "M",
            "The manuscript's folder: main.tex, refs.bib, figures/, the PDF and the other "
            "targets",
            "folder",
        ),
    )
    run_edges = (
        Edge("I", "S", "config.md"),
        Edge("S", "A", "review.md, refs.bib"),
        Edge("A", "B", "outline.md"),
        Edge("B", "W", "arguments.md"),
        Edge("B", "V", "arguments.md"),
        Edge("W", "C", "main.tex, intended-claims.md, draft-report.md"),
        Edge("W", "AB", "main.tex"),
        Edge("V", "R", "figures/, figures.md, a patch"),
        Edge("C", "R", "citation-report.md, patches"),
        Edge("AB", "R", "a patch"),
        Edge("R", "F", "review-<r>.md"),
        Edge("F", "M", "format-report.md, patches"),
    )
    patch = (
        Node("PA", "An agent"),
        Node("PS", "Script: the patch applied to the file by its block hashes", "script"),
        Node("PM", "The manuscript's folder: the changed file", "folder"),
        Node(
            "PP",
            "patches/ in the run folder: the manifest, the patch, the patched file and the "
            "apply report",
            "folder",
        ),
    )
    patch_edges = (
        Edge("PA", "PS", "<nn>-<file name>.patch.json"),
        Edge("PS", "PM", "the patched file"),
        Edge("PS", "PP", "the four files of the patch"),
    )
    panels = [
        Panel("A FULL RUN: EACH AGENT AND THE FILES IT HANDS ON", graph(run, run_edges)),
        Panel("EVERY CHANGE AFTER THE FIRST DRAFT IS A PATCH", graph(patch, patch_edges)),
    ]
    note = (
        "Every file named on an arrow stays in the run folder, paper-runs/<mode>-<date>/ "
        "beside the manuscript's folder, with config.md, checks.md and final.md; main.tex, "
        "refs.bib and figures/ stand in the manuscript's folder. The other modes run a part of "
        "this flow: outline-only ends at outline.md, lit-review at review.md and refs.bib, "
        "abstract-only, citation-check and format-convert start one agent on a manuscript given, "
        "and revision runs the peer reviewer, the draft writer and the citation compliance "
        "agent on the comments, leaving items.md, revision-log.md and review-2.md."
    )
    label = flow_label("The files of a full run of the paper skill, from agent to agent", panels)
    return compose(
        "academic/paper/run-folder.svg", label, panels, RUN_FOLDER_LEGEND, note, FIGURE_KINDS
    )


def grill() -> str:
    nodes = (
        Node("RF", "Another entry's rulings file", "stop"),
        Node(
            "LA",
            "Lookup agent, when a decision needs a fact a file read does not give",
            "maybe",
        ),
        Node("SM", "A lookup agent served another model", "stop"),
        Node("R", "A round", "stop"),
        Node("E", "The end", "stop"),
    )
    edges = (
        Edge("RF", "R", "the file put right, then /grill again"),
        Edge("LA", "SM", "served a model other than the configured one"),
        Edge("LA", "R", "the fact joins the next round"),
        Edge("R", "R", "until no decision is open", "back"),
        Edge("R", "E"),
    )
    note = (
        "Under --self-rule a round holds only the decisions of the six kinds and the end "
        "is not a stop."
    )
    return _single("orchestration/grill.svg", "The grill skill", graph(nodes, edges), note)


def writing() -> str:
    nodes = (
        Node("A", "Sentence agent"),
        Node("B", "Section agent"),
        Node("C", "Whole-draft agent"),
        Node("K", "Checking agent"),
        Node("RP", "The end: the numbered report"),
    )
    edges = (
        Edge("A", "K"),
        Edge("B", "K"),
        Edge("C", "K"),
        Edge("K", "RP"),
    )
    note = "The three finding agents start at once; the checking agent starts after they end."
    return _single("academic/writing.svg", "The writing skill", graph(nodes, edges), note)


def paper_review_panel() -> str:
    """The full mode of the paper-review-panel skill: its agents in order and its two stops."""
    reviewers = (
        Node("E", "EIC, 2 calls"),
        Node("M", "Methodology reviewer, 2 calls"),
        Node("D", "Domain reviewer, 2 calls"),
        Node("P", "Perspective reviewer, 2 calls"),
        Node("A", "Devil's Advocate reviewer, 2 calls"),
    )
    nodes = (
        Node("F", "Field analyst: the Reviewer Configuration Card"),
        Node("C", "You confirm the reviewer configuration", "stop"),
        *reviewers,
        Node("S", "Editorial synthesizer: the Editorial Decision and the Revision Roadmap"),
        Node("Q", "EIC, resumed: the coaching question, only for a revision decision", "stop"),
    )
    edges = (
        Edge("F", "C"),
        *(Edge("C", reviewer.key) for reviewer in reviewers),
        *(Edge(reviewer.key, "S") for reviewer in reviewers),
        Edge("S", "Q", "Minor or Major Revision"),
        Edge("Q", "Q", "until the dialogue ends or you say just fix it", "back"),
    )
    note = (
        "The five reviewers start at once, each in 2 calls under the sprint contract. The "
        "other modes start these roles. Re-review: the field analyst, the EIC and the "
        "editorial synthesizer. Quick: the field analyst and the EIC. Methodology-focus: the "
        "field analyst, the EIC and the methodology reviewer. Guided: the field analyst and "
        "the five reviewers, then the EIC's dialogue. Calibration: all seven, 5 times per "
        "gold paper."
    )
    return _single(
        "academic/paper-review-panel.svg",
        "The full mode of the paper-review-panel skill",
        graph(nodes, edges),
        note,
    )


def referee() -> str:
    """The first round of the referee skill: its agents in order and its stops."""
    reviewers = (
        Node("E", "EIC, 2 calls"),
        Node("M", "Methodology reviewer, 2 calls"),
        Node("D", "Domain reviewer, 2 calls"),
        Node("P", "Perspective reviewer, 2 calls"),
        Node("A", "Devil's Advocate reviewer, 2 calls"),
    )
    nodes = (
        Node("I", "You answer the intake", "stop"),
        Node("F", "Field analyst: the Reviewer Configuration Card"),
        Node("C", "You confirm the reviewer configuration", "stop"),
        *reviewers,
        Node("R", "Referee: every point graded and ranked, and the left-out comments"),
        Node("K", "Rule check: the selection against the referee's rules"),
        Node("N", "Referee, resumed: the selected minor points in full", "maybe"),
        Node("J", "Rule check: the selected points in full", "maybe"),
        Node("S", "You confirm the selection or move comments", "stop"),
        Node("W", "Referee, resumed: the referee report"),
        Node("L", "Referee, resumed: the report shortened, only when over the length", "maybe"),
        Node("Q", "Rule check: the report against the referee's rules"),
        Node("B", "The breaks left in the report, only after 2 returns", "stop"),
    )
    edges = (
        Edge("I", "F"),
        Edge("F", "C"),
        *(Edge("C", reviewer.key) for reviewer in reviewers),
        *(Edge(reviewer.key, "R") for reviewer in reviewers),
        Edge("R", "K"),
        Edge("K", "R", "a break, at most 2 times", "back"),
        Edge("K", "N"),
        Edge("N", "J"),
        Edge("J", "N", "a break, at most 2 times", "back"),
        Edge("J", "S"),
        Edge("S", "W"),
        Edge("W", "L"),
        Edge("L", "Q"),
        Edge("Q", "W", "a break, at most 2 times", "back"),
        Edge("Q", "B", "a break still named"),
    )
    note = (
        "The five reviewers start at once from the pages of the paper-review-panel skill, "
        "each in 2 calls under its sprint contract. A panel shrunk at the intake starts only "
        "the reviewers you name. The session keeps the budget: it moves the points over it "
        "out of the referee's ranking and counts the words of the report, and no agent is "
        "given a number of it. A change you make at the selection that needs new text goes "
        "to the referee and its rule check again. The second round starts the field analyst, "
        "the five reviewers only when you ask for them at the intake, the EIC, which checks "
        "the revision against the authors' response, and a new-issue agent with a rule check "
        "of its own when the EIC wrote a new issue. Its selection, its stops and its report "
        "follow as in the first round. A plain request that does not say the round is asked "
        "which round it is."
    )
    floating = (Node("RD", "The round, for a plain request that does not say it", "stop"),)
    return _single(
        "academic/referee.svg",
        "The first round of the referee skill",
        graph(nodes, edges, floating),
        note,
    )


ENTRY_POINT = Node(
    "EP", "The entry point: the line of Quick start a call without a mode matches", "stop"
)
UNFINISHED_RUN = Node("UR", "An unfinished run: continue it or start a new one", "stop")
RUN_FAILS = Node("RF", "A run that fails: retry it or pause it", "stop")
INCOMPLETE_REVISION = "An incomplete revision: each item left, with its reason"


def _integrity_check(
    stage: str, depth: str, agent: str, done: str, fail: str
) -> tuple[
    tuple[Node, ...], tuple[Edge, ...]
]:
    """The boxes and arrows of one integrity check of the researcher skill, at one stage."""
    k = stage.replace(".", "")
    nodes = (
        Node(f"I{k}", f"{agent}, Stage {stage}: {depth}, the ethics check last"),
        Node(f"C{k}", f"Compliance agent, Stage {stage}"),
        Node(f"B{k}", "A failure-mode block, a compliance block, or a BLOCKED or CONDITIONAL ethics verdict", "stop"),
        Node(f"F{k}", "A FAIL: the correction list to confirm", "stop"),
        Node(f"V{k}", "/paper revision: the correction round", "paper"),
        Node(f"T{k}", "The third correction round failed: you decide", "stop"),
        Node(f"K{k}", f"The checkpoint after Stage {stage}", "stop"),
    )
    edges = (
        Edge(f"I{k}", f"C{k}"),
        Edge(f"C{k}", f"B{k}", "a stop of the check"),
        Edge(f"C{k}", f"F{k}", fail),
        Edge(f"C{k}", f"K{k}", done),
        Edge(f"B{k}", f"V{k}", "a fix, a backfill or an addendum"),
        Edge(f"F{k}", f"V{k}"),
        Edge(f"V{k}", f"I{k}", "the check again, at most 3 rounds", "back"),
        Edge(f"V{k}", f"T{k}", "not passed after 3 rounds"),
    )
    return nodes, edges


def researcher() -> str:
    """The manuscript mode of the researcher skill: its stages, agents, runs and stops."""
    first, first_edges = _integrity_check(
        "2.5", "the sampled depth", "Integrity agent", "PASS", "FAIL"
    )
    final, final_edges = _integrity_check(
        "4.5",
        "the full depth",
        "A fresh integrity agent",
        "PASS with zero issues",
        "FAIL, or PASS WITH NOTES",
    )
    nodes = (
        Node("X", "The record of the experiments, when the project holds none", "stop"),
        Node("G", "You confirm the run's configuration and its budget", "stop"),
        Node("W", "/paper full: the draft, Stage 2", "paper"),
        Node("K2", "The checkpoint after Stage 2", "stop"),
        *first,
        Node("P", "/paper-review-panel full: the review, Stage 3", "paper"),
        Node("D", "The review decision", "stop"),
        Node("R", "/paper revision: the revision, Stage 4", "paper"),
        Node("IR", INCOMPLETE_REVISION, "stop"),
        Node("K4", "The checkpoint after Stage 4", "stop"),
        Node("Q", "/paper-review-panel re-review: the re-review, Stage 3'", "paper"),
        Node("S", "A regression, or the early-stopping suggestion, from the score deltas", "stop"),
        Node("E", "The re-review decision", "stop"),
        Node("M", "/paper revision: the minor items of a Minor decision, once", "paper"),
        Node("Y", "/paper revision: the re-revision, Stage 4', once", "paper"),
        Node("K4b", "The checkpoint after Stage 4'", "stop"),
        *final,
    )
    edges = (
        Edge("X", "G"),
        Edge("G", "W"),
        Edge("W", "K2"),
        Edge("K2", "I25"),
        *first_edges,
        Edge("K25", "P"),
        Edge("P", "D"),
        Edge("D", "W", "Reject, your choice: Stage 2 again", "back"),
        Edge("D", "R", "Minor or Major Revision"),
        Edge("D", "I45", "Accept"),
        Edge("R", "IR", "items left unaddressed"),
        Edge("R", "K4"),
        Edge("K4", "Q"),
        Edge("Q", "S"),
        Edge("S", "E"),
        Edge("E", "Y", "Major"),
        Edge("E", "M", "Minor"),
        Edge("M", "I45"),
        Edge("E", "I45", "Accept"),
        Edge("Y", "K4b"),
        Edge("K4b", "I45"),
        *final_edges,
    )
    note = (
        "integrity runs one check alone: the integrity agent at the full depth, or with "
        "pre-review at the sampled depth, then the compliance agent, the same blocks and at "
        "most 3 correction rounds through /paper revision, and the run ends. A draft given "
        "to manuscript enters at Stage 2.5. With a comments file it goes from Stage 2.5 to "
        "Stage 4 with the comments, then to the session's completeness check in place of the "
        "re-review, a stop, and to Stage 4.5. Each run of paper and paper-review-panel is invoked "
        "through the Skill tool with its own stops, which are not drawn. The session holds "
        "every checkpoint and writes the run's state and the Material Passport. Each "
        "integrity record and each compliance report is a file of the run folder. "
        "novelty, idea and readme start no agent and are not drawn: novelty searches the "
        "closest prior work on each claim of an idea, confirms each work it cites with "
        "lookup.py resolve and writes a page with a verdict per claim, idea puts the choices "
        "of the idea to you in rounds of the interview, runs novelty between them and writes "
        "the research questions and claims into the README, and readme drafts the project's "
        "README and code README for a newcomer and writes them after you approve the drafts."
    )
    floating = (
        ENTRY_POINT,
        UNFINISHED_RUN,
        RUN_FAILS,
        Node("PC", "The parsed comments, with a comments file", "stop"),
        Node("SC", "The strategic coaching, with a comments file, at most 8 rounds", "stop"),
        Node(
            "KC",
            "The checkpoint after the completeness check, with a comments file",
            "stop",
        ),
    )
    return _single(
        "academic/researcher/manuscript.svg",
        "The manuscript mode of the researcher skill",
        graph(nodes, edges, floating),
        note,
        (
            *SIMPLE_LEGEND,
            Legend("paper", "Teal box: a run of the paper or paper-review-panel skill"),
        ),
    )


def researcher_research() -> str:
    """The research mode of the researcher skill: its stages, agents, jobs, stops and ways back."""
    nodes = (
        Node("FQ", "Frame: the research questions, the baseline, the metric, the limits, the cluster's facts and the setting", "stop"),
        Node("FD", "Frame: the dataset, from candidates with their size, licence and fit to the limits", "stop"),
        Node("B", "Builder: one piece of code from the session's brief, with its small local test"),
        Node("R", "Reviewer: the code against the brief, the test again, what makes a result false"),
        Node("RS", "A piece of code that does not pass its review", "stop"),
        Node("BA", "Baseline: its jobs through the scheduler, under the conditions of Frame", "script"),
        Node("EX", "Experiments: each campaign's jobs through the scheduler", "script"),
        Node(
            "C",
            "Compare: each result against the baseline, a diagnosis and a proposal for each "
            "that does not beat it",
            "judge",
        ),
        Node("M", "A result that does not beat the baseline, under the manual setting", "stop"),
        Node("MS", "A result short of what was set, in research: it beats the baseline, under the manual setting", "stop"),
        Node("I", "idea, reopened with the diagnosis: the rounds of the interview", "stop"),
        Node("CO", "Consolidate: run_all.sh once in a clean copy through the scheduler, each number compared, the record written", "script"),
        Node("N", "A number that does not reproduce", "stop"),
    )
    edges = (
        Edge("FQ", "FD"),
        Edge("FD", "FQ", "you change a limit or the dataset: Frame again", "back"),
        Edge("FD", "B"),
        Edge("B", "R"),
        Edge("B", "FQ", "the dataset does not fit the limits", "back"),
        Edge("R", "B", "a finding: a new brief, at most 2 times", "back"),
        Edge("R", "RS", "still a finding after the third review"),
        Edge("R", "BA", "no finding that makes a result false"),
        Edge("BA", "EX"),
        Edge("BA", "B", "a job that fails: a brief for the fault, on your word", "back"),
        Edge("BA", "FQ", "the baseline cannot run inside the limits, or a job that fails, on your word", "back"),
        Edge("EX", "B", "code every campaign shares, or a job that fails, on your word", "back"),
        Edge("EX", "FQ", "a job that fails, on your word", "back"),
        Edge("EX", "EX", "a campaign again from its start, at most 3 times", "back"),
        Edge("EX", "C"),
        Edge("C", "M", "manual setting: does not beat the baseline"),
        Edge("C", "MS", "manual setting: beats the baseline, short of what was set"),
        Edge("C", "EX", "a method cause: a new campaign", "back"),
        Edge("C", "B", "an implementation cause, at most 2 times", "back"),
        Edge("C", "FD", "a dataset cause", "back"),
        Edge("C", "I", "a research question cause"),
        Edge("I", "FQ", "the new research questions", "back"),
        Edge("C", "CO", "a result beats the baseline, one short of what was set named as such"),
        Edge("MS", "CO", "on your word, named as below what was set"),
        Edge("CO", "N", "a second run still differs"),
        Edge("CO", "BA", "a difference in a baseline number: back to Baseline, once", "back"),
        Edge("CO", "EX", "a difference in a campaign's number: back to Experiments, once", "back"),
    )
    floating = (
        Node("A", "A project underway: research adopt offered", "stop"),
        Node("O", "A README in the old layout: /researcher readme offered", "stop"),
        Node("J", "The jobs submitted: the job ids in the README, and the run stops", "stop"),
        Node("JF", "A job that fails: its log and its script", "stop"),
        Node("K", "The count of methods reached with no result that beats the baseline, under the automatic setting", "stop"),
        ENTRY_POINT,
        RUN_FAILS,
    )
    note = (
        "The session writes each brief, starts each builder and each reviewer, submits the jobs "
        "and writes the README before each stage ends, so that a new session resumes from the "
        "README alone. Every job on a cluster runs from a script in code/hpc/, the small local "
        "test as a short job, and the session polls only when you ask. research adopt reads a "
        "project underway against each stage, "
        "drafts its README in the layout by the readme mode's rewrite and writes it after you "
        "approve the draft, moves nothing and goes on from the first stage not done. full "
        "runs idea, shows the modes it will run "
        "and leaves out for you to confirm, then runs research or research adopt and manuscript, "
        "and goes on to manuscript on a partial result, or one below what was set, only on your "
        "word."
    )
    return _single(
        "academic/researcher/research.svg",
        "The research mode of the researcher skill",
        graph(nodes, edges, floating),
        note,
        (
            SIMPLE_LEGEND[0],
            SIMPLE_LEGEND[2],
            SIMPLE_LEGEND[3],
            Legend("loop", "Dotted loop on one box: a campaign again from its start, with its cap"),
            Legend("script", "Grey box: jobs the session submits through the scheduler"),
            Legend("judge", "Rounded box: the session reads and judges"),
        ),
    )


def researcher_revision() -> str:
    """The revision mode of the researcher skill: the split, the campaigns and the stages after."""
    first, first_edges = _integrity_check(
        "2.5", "the sampled depth", "Integrity agent", "PASS", "FAIL"
    )
    final, final_edges = _integrity_check(
        "4.5",
        "the full depth",
        "A fresh integrity agent",
        "PASS with zero issues",
        "FAIL, or PASS WITH NOTES",
    )
    nodes = (
        Node("X", "The record of the experiments, when the project holds none", "stop"),
        Node("G", "You confirm the run's configuration and its budget", "stop"),
        Node("RC", "/paper revision-coach: the parsed comments with their commitments", "paper"),
        Node("SP", "The split of the comments: results comments and text comments", "stop"),
        Node("FD", "The dataset, for a comment that needs one the project does not hold: candidates with their size, licence and fit to the limits", "stop"),
        Node("B", "Builder: one piece of code a results comment needs, from the session's brief"),
        Node("R", "Reviewer: the code against the brief, the test again, what makes a result false"),
        Node("RS", "A piece of code that does not pass its review", "stop"),
        Node("EX", "Experiments: one campaign per results comment, its jobs through the scheduler", "script"),
        Node(
            "C",
            "Compare: each result against the baseline, a diagnosis and a proposal for each "
            "that does not beat it",
            "judge",
        ),
        Node("M", "A result that does not beat the baseline, under the manual setting", "stop"),
        Node("MS", "A result short of what was set, in research: it beats the baseline, under the manual setting", "stop"),
        Node("CA", "A comment the results do not answer yet: what was tried, the cause and the next proposal", "stop"),
        Node("CO", "Consolidate, once: run_all.sh in a clean copy through the scheduler, each number compared, the record written again", "script"),
        Node("N", "A number that does not reproduce", "stop"),
        Node("BA", "Baseline: its jobs again through the scheduler, for a baseline number that differs", "script"),
        *first,
        Node("CH", "The strategic coaching, at most 8 rounds, unless you say just fix it", "stop"),
        Node("PR", "/paper revision: the revision, Stage 4, on revision-comments.md with the result files", "paper"),
        Node("K4", "The checkpoint after Stage 4", "stop"),
        Node("IR", INCOMPLETE_REVISION, "stop"),
        Node(
            "CC",
            "The completeness check of each comment's answer, Stage 3', in place of the "
            "re-review",
            "judge",
        ),
        Node("KC", "The checkpoint after the completeness check", "stop"),
        *final,
    )
    edges = (
        Edge("X", "G"),
        Edge("G", "RC"),
        Edge("RC", "SP"),
        Edge("SP", "B", "each results comment, one campaign"),
        Edge("SP", "FD", "a comment that needs another dataset"),
        Edge("FD", "B"),
        Edge("SP", "I25", "no results comment"),
        Edge("B", "R"),
        Edge("R", "B", "a finding: a new brief, at most 2 times", "back"),
        Edge("R", "RS", "still a finding after the third review"),
        Edge("R", "EX", "no finding that makes a result false"),
        Edge("EX", "EX", "a campaign again from its start, at most 3 times", "back"),
        Edge("EX", "C"),
        Edge("C", "M", "manual setting: does not beat the baseline"),
        Edge("C", "MS", "manual setting: beats the baseline, short of what was set"),
        Edge("C", "CA", "a dataset or a question cause, or the count of methods reached"),
        Edge("M", "CA", "you stop trying methods for the comment"),
        Edge("C", "EX", "a method cause: a new campaign", "back"),
        Edge("C", "B", "an implementation cause, at most 2 times", "back"),
        Edge("CA", "EX", "the next proposal: a new campaign", "back"),
        Edge("C", "CO", "every results comment answered"),
        Edge("MS", "CO", "on your word"),
        Edge("CA", "CO", "answered in text alone, no result named"),
        Edge("CO", "I25", "no difference"),
        Edge("CO", "N", "a second run still differs"),
        Edge("CO", "BA", "a difference in a baseline number: back to Baseline, once", "back"),
        Edge("BA", "C", "Compare and Consolidate again"),
        Edge("CO", "EX", "a difference in a campaign's number: back to Experiments, once", "back"),
        *first_edges,
        Edge("K25", "CH"),
        Edge("CH", "PR"),
        Edge("PR", "K4"),
        Edge("PR", "IR", "items left unaddressed"),
        Edge("K4", "CC"),
        Edge("CC", "IR", "a comment left unanswered"),
        Edge("CC", "KC"),
        Edge("KC", "I45"),
        *final_edges,
    )
    floating = (
        Node("O", "A README in the old layout: /researcher readme offered", "stop"),
        Node("J", "The jobs submitted: the job ids in the README, and the run stops", "stop"),
        Node("JF", "A job that fails: its log and its script", "stop"),
        ENTRY_POINT,
        UNFINISHED_RUN,
        RUN_FAILS,
    )
    note = (
        "revision answers one comments file on a paper of a project that research started or "
        "adopted. The split takes the commitment types the coach gave: add_experiment and "
        "add_analysis mark a results comment. Each results comment is one campaign of the "
        "project's Experiments stage, with Build first only for a new dataset or a new baseline, "
        "and of Frame only the choice of a dataset runs, for a comment that needs one the project "
        "does not hold. A result short of what was set goes on, on your word, named as below what "
        "was set. Only a result that beats the baseline reaches "
        "revision-comments.md and /paper revision; a result that does not is a dead end, named in "
        "no response and no manuscript text. The README names each campaign with the comment it "
        "answers, so that a new session resumes the revision from it. Each run of paper is "
        "invoked through the Skill tool with its own stops, which are not drawn. A second round "
        "of comments is a new run."
    )
    return _single(
        "academic/researcher/revision.svg",
        "The revision mode of the researcher skill",
        graph(nodes, edges, floating),
        note,
        (
            SIMPLE_LEGEND[0],
            SIMPLE_LEGEND[2],
            SIMPLE_LEGEND[3],
            Legend("loop", "Dotted loop on one box: a campaign again from its start, with its cap"),
            Legend("script", "Grey box: jobs the session submits through the scheduler"),
            Legend("judge", "Rounded box: the session reads and judges"),
            Legend("paper", "Teal box: a run of the paper skill"),
        ),
    )


RESEARCHER_LIFECYCLE_LEGEND = (
    Legend("agent", "Solid box: a part of the mode, the stage or the README named above it"),
    Legend("dotted", "Dotted arrow: Compare sends the work back to an earlier stage"),
)


def researcher_lifecycle() -> str:
    """The modes of the researcher skill in the order a project goes through them."""
    novelty = Lane(
        "/researcher novelty",
        parts("The closest prior work on each claim, a verdict per claim, a page in notes/"),
    )
    idea = Lane(
        "/researcher idea",
        parts(
            "The research questions and claims, in rounds of the interview",
            "novelty run between the rounds",
        ),
    )
    stages = tuple(
        Lane(stage, parts(part), node_width=210)
        for stage, part in (
            ("Frame", "The questions, the limits, the cluster's facts and the dataset"),
            ("Build", "Each piece of code by a builder, checked by a reviewer"),
            ("Baseline", "The baseline's jobs through the scheduler"),
            ("Experiments", "Each campaign's jobs through the scheduler"),
            ("Compare", "Each result against the baseline, with a diagnosis"),
            ("Consolidate", "run_all.sh in a clean copy, the record of the experiments"),
        )
    )
    manuscript = Lane(
        "/researcher manuscript",
        parts(
            "Stage 2: the writing, /paper full",
            "Stage 2.5: the first integrity check",
            "Stage 3: the review, /paper-review-panel",
            "Stage 4: the revision, /paper revision",
            "Stages 3' and 4': the re-review and the re-revision",
            "Stage 4.5: the final integrity check",
        ),
        columns=3,
    )
    revision = Lane(
        "/researcher revision",
        parts(
            "The referee comments split into results and text comments",
            "A campaign of the research stages for each results comment",
            "/paper revision with the new results, then the checks of manuscript",
        ),
        columns=3,
    )
    readme = Lane(
        "README.md: what each mode that reads or writes it keeps there",
        parts(
            "idea: the research questions and claims",
            "research and research adopt: the working state a new session resumes from, "
            "and the results",
            "full: the modes it runs, in order, in ## Next",
            "revision, and manuscript when the README holds ## Papers: each paper and the "
            "results it reports",
        ),
        columns=3,
        node_width=270,
    )
    readme_mode = Lane(
        "/researcher readme, beside them",
        parts(
            "The README and the code README drafted for a newcomer, written after you "
            "approve the drafts"
        ),
        node_width=280,
    )
    rows = (
        Row("FROM A SKETCH TO RESEARCH QUESTIONS AND CLAIMS", (novelty, idea)),
        Row(
            "FROM THE QUESTIONS TO RESULTS: /researcher research, SIX STAGES",
            stages,
            returns=(
                (4, 3, "a method cause"),
                (4, 1, "an implementation cause"),
                (4, 0, "a dataset cause"),
            ),
        ),
        Row("FROM RESULTS TO A PAPER, AND THE REFEREES' COMMENTS", (manuscript, revision)),
        Row("THE PROJECT'S README", (readme, readme_mode), arrows=False),
    )
    note = (
        "full runs idea, then research and manuscript, each with its own stops. research "
        "adopt continues a project underway from the first stage not done, and integrity "
        "runs one integrity check alone. A research question cause in Compare reopens idea. "
        "novelty reads no README and writes its page into notes/. The figure draws no run: a "
        "frame is a mode, a stage of research or the project's README, and a box in it is a "
        "part of it."
    )
    label = lanes_label("The modes of the researcher skill, in the order of a project", rows)
    return lanes_figure(
        "academic/researcher/lifecycle.svg",
        label,
        rows,
        RESEARCHER_LIFECYCLE_LEGEND,
        note,
        FIGURE_KINDS,
    )


def submit() -> str:
    """The submit skill: its agent and its stops, from the sheet to the page of the final submit."""
    nodes = (
        Node("S", "Sheet agent: the submission sheet from your folder and the public instructions"),
        Node("X", "Nothing from the folder in the sheet: the run ends with what was found", "stop"),
        Node("A", "You approve the sheet, correct it or answer its questions", "stop"),
        Node("E", "The extension not connected: the run ends with the sheet", "stop"),
        Node("L", "A field the sheet lacks, added to it as a question", "stop"),
        Node("C", "A sign-in, a licence, a copyright transfer, a consent or a payment that blocks a page", "stop"),
        Node("N", "A page that does not pass: the portal's message, with its row", "stop"),
        Node("P", "The page of the final submit: you press it", "stop"),
    )
    edges = (
        Edge("S", "X", "nothing from the folder"),
        Edge("S", "A"),
        Edge("A", "E", "no extension"),
        Edge("A", "L", "the walk, page by page"),
        Edge("L", "C"),
        Edge("C", "N"),
        Edge("N", "P"),
    )
    note = (
        "The session walks the portal's forms in the browser extension after your approval: "
        "it fills each field, uploads each file and answers each declaration as the sheet "
        "says, and reads each page back against it. A field the sheet lacks, a control left "
        "to you and a page that does not pass stop a page only when the page has one. The "
        "agent reads your folder, the portal's public pages it saves with curl, the journal "
        "guide of paper and the funder config of grant, and the sheet's first lines say how "
        "much of the portal's form it could read before a sign-in. Before the agent starts, "
        "the run stops when a run folder of the same date stands, and when the folder holds "
        "several funder configs. The session never types a password and never presses the "
        "final submit."
    )
    floating = (
        Node("RF", "A run folder that exists: a run folder of the same date stands", "stop"),
        Node("WC", "Which config, for a folder that holds several funder configs", "stop"),
    )
    return _single(
        "academic/submit.svg",
        "The submit skill",
        graph(nodes, edges, floating),
        note,
    )


def grant() -> str:
    """The draft mode of the grant skill: its agents in order and its stops."""
    nodes = (
        Node("I", "Intake agent: the questions of the grant intake"),
        Node("A", "You answer the intake", "stop"),
        Node("S", "Structure architect: the outline, in the funder's sections"),
        Node("O", "You confirm the outline", "stop"),
        Node("B", "Argument builder: each section's argument for the criteria"),
        Node("W", "Draft writer: the application's .tex, or a patch of a section"),
        Node("C", "Citation compliance: each cited claim, only with a .bib", "maybe"),
        Node("F", "Formatter: the layout of the funder config, only when it states one", "maybe"),
        Node("L", "Draft writer, resumed: content cut once, when the compile is over the page limit", "maybe"),
        Node("V", "You pick the writing findings to apply", "stop"),
        Node("P", "Draft writer, resumed: the picked findings as one patch", "maybe"),
    )
    edges = (
        Edge("I", "A"),
        Edge("A", "S"),
        Edge("S", "O"),
        Edge("O", "S", "a correction", "back"),
        Edge("O", "B"),
        Edge("B", "W"),
        Edge("W", "C"),
        Edge("C", "F"),
        Edge("F", "L"),
        Edge("L", "V"),
        Edge("V", "P"),
    )
    note = (
        "Each of the six roles runs from its page of the paper skill, given the funder "
        "config and the session's direction. The session counts the application's pages "
        "before the draft, applies each patch, compiles the application with the engine the "
        "application itself uses and runs check_sections.py and check_limits.py before the "
        "writing review and again after the cut and after the review's patch. A draft of one "
        "section is checked and "
        "reviewed on that section. The run asks which config when the "
        "application's folder holds several, asks the mode of a plain request that names "
        "none, and passes on a stop of the paper skill. A draft of a form field starts the "
        "intake agent and the draft writer only, which writes the field's text into "
        "grant-fields.md. The config mode starts the config "
        "drafter and shows you its draft to confirm; for a file of form-field texts you name "
        "it asks before it replaces a grant-fields.md that exists, starts the field texts "
        "agent when the file is in another format, and shows you the form fields to confirm. "
        "The revise mode starts the draft writer "
        "on a comments file and ends with the same cut and the same writing review. The "
        "review mode compiles "
        "the application and starts the criteria reviewer, which scores it per criterion "
        "and changes nothing. The check mode starts no agent: it compiles and runs the two scripts."
    )
    floating = (
        Node("MD", "The mode, for a plain request that fits no mode", "stop"),
        Node("WC", "Which config, for a folder that holds several funder configs", "stop"),
    )
    return _single(
        "academic/grant.svg",
        "The draft mode of the grant skill",
        graph(nodes, edges, floating),
        note,
    )


def code_comments() -> str:
    nodes = (
        Node("F", "Finding agent"),
        Node("K", "Checking agent"),
        Node("RP", "The end: the report of the comments that break a rule"),
        Node("RW", "Rewrite agent, when you type apply", "maybe"),
    )
    edges = (
        Edge("F", "K"),
        Edge("K", "RP"),
        Edge("RP", "RW", "apply <numbers> or apply all"),
    )
    note = "A rewrite is kept only when the code of the file compares equal to its code before."
    return _single(
        "code/code-comments.svg",
        "The code-comments skill",
        graph(nodes, edges),
        note,
    )


USER_INTERFACE = (
    "The user interface, unless a page holds a UI standard or the repository tracks a "
    ".svelte file"
)


def codebase_design() -> str:
    """The standards mode and the review mode of the codebase-design skill, side by side."""
    standards = (
        Node("U1", USER_INTERFACE, "stop"),
        Node("D", "The draft", "stop"),
        Node("W", "The end: the additions you approved, written"),
    )
    review = (
        Node("U2", USER_INTERFACE, "stop"),
        Node("S", "Scan agent: the code against the standards pages"),
        Node("C", "The candidates", "stop"),
        Node(
            "A",
            "Design agents, three or more at once, when you ask for other interfaces",
            "maybe",
        ),
        Node("E", "The end: /roadmap add and /grill write the picked candidate as a roadmap entry"),
        Node(
            "O",
            "The ADR offer, only for a candidate you reject for a reason a later review needs",
            "stop",
        ),
    )
    review_edges = (
        Edge("U2", "S"),
        Edge("S", "C", "the report of the candidates, opened"),
        Edge("C", "A", "you ask for other interfaces"),
        Edge("C", "E"),
        Edge("A", "E"),
        Edge("C", "O", "you reject a candidate"),
    )
    panels = [
        Panel("THE STANDARDS MODE", graph(standards, (Edge("U1", "D"), Edge("D", "W")))),
        Panel("THE REVIEW MODE", graph(review, review_edges)),
    ]
    note = (
        "The standards mode starts no agent. Either mode reads the repository's pages and then "
        "asks once whether the repository has a user interface, unless a page holds a UI "
        "standard or the repository tracks a .svelte file. In a repository with no plan "
        "configuration the review mode invokes /ordo-init before /roadmap add. The skills it "
        "invokes have their own stops. The call with no mode starts the design agents only "
        "when you ask for other interfaces."
    )
    return compose(
        "code/codebase-design.svg",
        describe("The codebase-design skill", panels, FIGURE_KINDS),
        panels,
        SIMPLE_LEGEND,
        note,
        FIGURE_KINDS,
    )


def diagnose() -> str:
    """The diagnose skill run by a person: its steps, its stops and its cycles."""
    nodes = (
        Node(
            "R",
            "The diagnosis record opened, the symptom quoted, the place of the probes named",
            "step",
        ),
        Node(
            "C",
            "The red command: red on the exact symptom, three runs in a row, then tightened",
            "step",
        ),
        Node("NR", "No red command", "stop"),
        Node("PD", "A red command a person drives", "stop"),
        Node("NE", "Not enough output after redaction", "stop"),
        Node("S", "The case shrunk until each remaining part is needed for the red", "step"),
        Node(
            "H",
            "Three to five ranked hypotheses, each with the result that would falsify it",
            "step",
        ),
        Node("SH", "The hypotheses", "stop"),
        Node(
            "P",
            "A probe: one change for one hypothesis, the red command run, the change undone",
            "step",
        ),
        Node(
            "CA",
            "The cause at its operation, every place of the defect and the other inputs",
            "step",
        ),
        Node("CN", "The cause not found", "stop"),
        Node(
            "T",
            "The test red without the fix, then the fix at every place and every run green",
            "step",
        ),
        Node(
            "E",
            "The record shown, the scratch copy removed, the cause in the commit message",
            "step",
        ),
    )
    edges = (
        Edge("R", "C"),
        Edge("C", "NR", "no way builds one"),
        Edge("NR", "C", "what you give: the red command again", "back"),
        Edge("C", "PD", "only a person can trigger the symptom"),
        Edge("C", "NE", "the redacted output cannot show the cause"),
        Edge("C", "S"),
        Edge("S", "H"),
        Edge("H", "SH"),
        Edge("SH", "P", "your reply"),
        Edge("P", "P", "one per hypothesis, in rank order", "back"),
        Edge("P", "H", "every hypothesis falsified: a second list, once", "back"),
        Edge("P", "CA"),
        Edge("CA", "CN", "the second list falsified too, or no probe separates them"),
        Edge("CA", "T"),
        Edge("T", "E"),
    )
    note = (
        "Inside a plan's loop, /diagnose <entry> <step> with a finding, red line, brief check "
        "<n> or premise runs in a diagnosis agent that probes on a scratch copy, shows no "
        "hypotheses, leaves the step's worktree unchanged and hands the fix over by where the "
        "defect was found; a cause not found is an open item. The refusals are not drawn."
    )
    return _steps(
        "code/diagnose.svg",
        "The diagnose skill run by a person: /diagnose <symptom>",
        graph(nodes, edges),
        note,
    )


def wizard() -> str:
    """The wizard skill: its steps from the procedure to the checked script, and its two stops."""
    nodes = (
        Node("S", "Scope the procedure: each action, command and value", "step"),
        Node("L", "The stage list", "stop"),
        Node("M", "Map each stage's journey", "step"),
        Node("U", "An action not known", "stop"),
        Node(
            "W",
            "The script from templates/template.sh, a stage function for each stage",
            "step",
        ),
        Node("K", "The script checked, not run", "step"),
        Node("H", "How to run it", "step"),
    )
    edges = (
        Edge("S", "L"),
        Edge("L", "M", "your confirmation"),
        Edge("M", "U", "a UI or a command not known, and not in the documentation"),
        Edge("U", "M", "your answer", "back"),
        Edge("M", "W"),
        Edge("W", "K"),
        Edge("K", "H"),
    )
    note = (
        "The skill has one mode, starts no agent and has no refusal. The session never runs "
        "the script it writes."
    )
    return _steps("code/wizard.svg", "The wizard skill", graph(nodes, edges), note)


def handbook() -> str:
    """The handbook skill: its steps from the repository to the commit, and its stops."""
    nodes = (
        Node(
            "R",
            "The repository read: its parts, surfaces and capabilities, the tools and the copies",
            "step",
        ),
        Node(
            "K",
            "The kinds chosen, each page with its path, each kind left out with its reason",
            "step",
        ),
        Node("SK", "The kinds", "stop"),
        Node(
            "D",
            "Each page drafted from the code and the documentation, each claim's source named",
            "step",
        ),
        Node(
            "G",
            "The diagrams drafted and drawn by templates/figures.py in a scratch folder",
            "script",
        ),
        Node(
            "CK",
            "The repository's format and lint commands run on a scratch copy holding the drafts",
            "step",
        ),
        Node("SD", "The drafts", "stop"),
        Node("W", "The approved drafts written, the diagrams and manual.html built", "step"),
        Node("SC", "A command that fails", "stop"),
        Node("C", "One commit of every file written", "step"),
        Node(
            "E",
            "The end: each file, the commit and the commands that rebuild them named",
            "step",
        ),
    )
    edges = (
        Edge("R", "K"),
        Edge("K", "SK"),
        Edge("SK", "D", "your confirmation and answers"),
        Edge("D", "G", "the diagrams kind confirmed"),
        Edge("G", "G", "a diagram refused: corrected, at most 3 times", "back"),
        Edge("D", "CK"),
        Edge("G", "CK"),
        Edge("CK", "CK", "a failure in a file of the run: corrected, at most 3 times", "back"),
        Edge("CK", "SD"),
        Edge("SD", "W", "your approval of each draft"),
        Edge("W", "SC", "a command exits non-zero"),
        Edge("W", "C"),
        Edge("C", "SC", "the commit exits non-zero"),
        Edge("C", "E"),
    )
    note = (
        "The skill has one mode, /handbook [<repository folder>], and starts no agent. The "
        "refusals are not drawn."
    )
    return _steps("code/handbook.svg", "The handbook skill", graph(nodes, edges), note)


def plan_loop() -> str:
    spec = Lane(
        "/spec",
        (
            Node("a", "Brief-check agent, for a full step", "maybe"),
            Node("b", "Diagnosis agent, for a part that asks for a cause", "maybe"),
            Node("c", "A false premise the plan cannot absorb", "stop"),
            Node("d", "A rule clash with an ADR", "stop"),
            Node("e", "A user-visible choice", "stop"),
            Node("f", "A brief check finding the brief cannot absorb", "stop"),
            Node("g", "A cause not found", "stop"),
            Node("h", MODEL, "stop"),
            Node("i", "A step that does not converge", "stop"),
        ),
        columns=2,
    )
    build = Lane(
        "build it",
        (
            Node(
                "a",
                "Builder agent, unless the executor is inline or academic-paper",
                "maybe",
            ),
        ),
    )
    refute = Lane(
        "/refute",
        (Node("a", "Reviewer agent"), Node("b", MODEL, "stop")),
    )
    close = Lane(
        "close them",
        (
            Node("a", "Builder agent: a repair round of a full step", "maybe"),
            Node(
                "b", "Diagnosis agent, for a finding whose cause is not known", "maybe"
            ),
        ),
    )
    again = Lane(
        "/refute over the round",
        (
            Node("a", "Reviewer agent, when refute_after_repair is yes", "maybe"),
            Node("b", MODEL, "stop"),
        ),
    )
    land = Lane(
        "/land",
        (
            Node("a", "A red line for the user", "stop"),
            Node("b", "A rule clash", "stop"),
            Node("c", "A lock held", "stop"),
            Node("d", "A worktree that cannot be removed", "stop"),
        ),
    )
    orchestration = Lane(
        "/plan-orchestration [<entry>]: runs the row above for every step, unattended",
        (
            Node("a", "A shape nobody named", "stop"),
            Node("b", "A wrong premise", "stop"),
            Node("c", "A red check", "stop"),
            Node("d", "A rule clash", "stop"),
            Node("e", "A finding that is the user's", "stop"),
            Node("f", "The roadmap diff", "stop"),
            Node("g", MODEL, "stop"),
        ),
        columns=4,
    )
    rows = (
        Row(
            "FOR EVERY STEP, IN ORDER; RUN BY HAND, YOU TYPE EACH COMMAND OF THE ROW",
            (spec, build, refute, close, again, land),
            returns=((4, 3, "a further round, within repair_rounds"),),
        ),
        Row("RUNNING THE ROW UNATTENDED, OPTIONAL", (orchestration,), arrows=False),
    )
    boxes = [n.label for row in rows for lane in row.lanes for n in lane.nodes]
    label = (
        "The loop of one step, lane by lane in order: "
        + "; ".join(f"{lane.caption}" for row in rows for lane in row.lanes)
        + ". Boxes: "
        + "; ".join(boxes)
        + "."
    )
    note = (
        "/ordo-help starts no agent and has no stop. /land starts no agent. A refusal names "
        "its cause and leaves nothing, so it is not drawn."
    )
    return lanes_figure(
        "orchestration/plan-loop.svg", label, rows, SIMPLE_LEGEND, note, FIGURE_KINDS
    )


def pipeline() -> str:
    init = Lane(
        "/ordo-init",
        (
            Node("a", "The questions", "stop"),
            Node("b", "The draft of the tree", "stop"),
            Node("c", "Several roadmaps", "stop"),
            Node("d", "Worker, reviewer and libraries", "stop"),
            Node("e", "A failing command", "stop"),
            Node("f", "The draft of the configuration", "stop"),
            Node("g", "Another utils/build.py", "stop"),
            Node("h", "The draft of the driver", "stop"),
            Node("i", "A command that does not read back", "stop"),
            Node("j", "A fix in the configuration check", "stop"),
            Node("k", "A hunk to rule on", "stop"),
            Node("l", "The drafted sync change", "stop"),
            Node("m", "A file sync cannot use", "stop"),
            Node("n", "The sync still fails", "stop"),
            Node("o", "No commit allowed", "stop"),
        ),
        columns=4,
    )
    roadmap = Lane(
        "/roadmap add",
        (
            Node("a", "The change", "stop"),
            Node("b", "No gate", "stop"),
            Node("c", "The level", "stop"),
            Node("d", "The insertion form", "stop"),
            Node("e", "A missing dependency", "stop"),
        ),
    )
    grill_lane = Lane(
        "/grill <entry>",
        (
            Node("a", "Lookup agent, when a fact needs it", "maybe"),
            Node("b", "A round", "stop"),
            Node("c", "The end", "stop"),
            Node("d", "A lookup agent served another model", "stop"),
            Node("e", "Another entry's rulings file", "stop"),
        ),
    )
    plan = Lane(
        "/plan <entry>",
        (
            Node("a", "A gate with no count", "stop"),
            Node("b", "The drafted step list", "stop"),
        ),
    )
    step = Lane(
        "every step",
        (
            Node(
                "a",
                "The loop of plan-loop.svg: /spec, build it, /refute, /land",
                "agent",
            ),
        ),
    )
    closing = Lane("/roadmap done <entry>", (Node("a", "The change", "stop"),))
    plan_retro = Lane("/plan-retro", (Node("a", "The proposals", "stop"),))
    session_retro = Lane(
        "/session-retro",
        (Node("a", "A large output", "stop"), Node("b", "The proposals", "stop")),
    )
    diagnose = Lane(
        "/diagnose",
        (
            Node("a", "Diagnosis agent, when run in a plan's loop", "maybe"),
            Node("b", "The hypotheses", "stop"),
            Node("c", "No red command", "stop"),
            Node("d", "A red command a person drives", "stop"),
            Node("e", "Not enough output after redaction", "stop"),
            Node("f", "The cause not found", "stop"),
        ),
    )
    rows = (
        Row(
            "SET THE REPOSITORY UP, ONCE",
            (init,),
            arrows=False,
        ),
        Row(
            "FOR EACH ROADMAP ENTRY, IN ORDER",
            (roadmap, grill_lane, plan, step, closing),
        ),
        Row(
            "AFTER PLANS HAVE RUN, AND AT ANY POINT",
            (plan_retro, session_retro, diagnose),
            arrows=False,
        ),
    )
    boxes = [n.label for row in rows for lane in row.lanes for n in lane.nodes]
    label = (
        "The pipeline of one roadmap entry, lane by lane: "
        + "; ".join(lane.caption for row in rows for lane in row.lanes)
        + ". Boxes: "
        + "; ".join(boxes)
        + "."
    )
    note = (
        "These start no agent: /ordo-init, /roadmap, /plan, /land, /plan-retro, "
        "/session-retro, /wizard, /tutor, and /wait-what and /ordo-help, which have no stop. A refusal names "
        "its cause and leaves nothing, so it is not drawn."
    )
    return lanes_figure(
        "orchestration/pipeline.svg", label, rows, SIMPLE_LEGEND, note, FIGURE_KINDS
    )


def land() -> str:
    """The land skill: its steps from the stopped agents to the removed worktree, and its stops."""
    nodes = (
        Node("A", "The step's agents stopped", "step"),
        Node("B", "landing: cherry-picking set, the verify list compared with the page", "step"),
        Node(
            "C",
            "land.sh: the wip commit, the cherry-pick, the ledger restored, the verify list "
            "on main",
            "script",
        ),
        Node("LH", "A lock held", "stop"),
        Node("RL", "A red line for the user", "stop"),
        Node("RC", "A rule clash", "stop"),
        Node("D", "The look and the A/B, where configured", "step"),
        Node("E", "The booking, the state file, the landing report", "step"),
        Node("F", "The commit by explicit path", "step"),
        Node("G", "The worktree and branches removed", "step"),
        Node("WR", "A worktree that cannot be removed", "stop"),
    )
    edges = (
        Edge("A", "B"),
        Edge("B", "C"),
        Edge("C", "LH", "an index.lock still there after 60 s"),
        Edge("C", "RL", "a red line no fix inside the brief closes"),
        Edge("C", "RC", "a clash between two of your rulings"),
        Edge("C", "D"),
        Edge("D", "E"),
        Edge("E", "F"),
        Edge("F", "G"),
        Edge("G", "WR", "a path outside the ledger root, or a removal that fails"),
    )
    note = (
        "The skill has one mode, /land <entry> <step>, and starts no agent. A red line that a "
        "fix inside the brief closes is fixed on main. The refusals are not drawn."
    )
    return _steps("orchestration/land.svg", "The land skill", graph(nodes, edges), note)


def plan() -> str:
    """The plan skill: its steps from the ledger folder to the opening commit, and its stops."""
    nodes = (
        Node("L", "The ledger folder named from the entry's slug", "step"),
        Node(
            "D",
            "plan.md drafted: the goal, the gate, the rulings and the step list, each check "
            "asked whether it could pass without the goal",
            "step",
        ),
        Node("G", "A gate with no count", "stop"),
        Node("S", "The drafted step list", "stop"),
        Node("W", "orchestrator-state.md written, its configuration block filled", "step"),
        Node("F", "agents/briefs/ and agents/reviews/ made, each with a .gitkeep", "step"),
        Node("C", "The opening commit, naming its paths", "step"),
    )
    edges = (
        Edge("L", "D"),
        Edge("D", "G", "a gate met only by fixing and checking again"),
        Edge("D", "S"),
        Edge("S", "W", "your approval or correction"),
        Edge("W", "F"),
        Edge("F", "C"),
    )
    note = (
        'Under --ruling <ledger file> "<name>" a step list that is the ruled one is written '
        "without the stop, and under --self-rule the stop is Open item A for the orchestrator. "
        "The other forms name a project or a folder. The refusals, The plan exists among "
        "them, are not drawn."
    )
    return _steps("orchestration/plan.svg", "The plan skill", graph(nodes, edges), note)


def plan_orchestration() -> str:
    """The plan-orchestration skill: the loop over the steps of every open plan."""
    nodes = (
        Node("P", "The next unblocked step of the earliest plan, for each free slot", "step"),
        Node("S", "/spec: the brief, the brief check of a full step, the worktree", "step"),
        Node("WP", "A wrong premise", "stop"),
        Node(
            "B",
            "Builder agent in the step's worktree, unless the executor is inline or "
            "academic-paper",
            "maybe",
        ),
        Node("MO", MODEL, "stop"),
        Node(
            "R",
            "The report saved and the whole diff read, then /refute when review: calls for it",
            "step",
        ),
        Node("F", "Builder, resumed: a repair round, each finding with its ruling", "maybe"),
        Node("FU", "A finding that is the user's", "stop"),
        Node("L", "/land: the step on main, booked", "step"),
        Node("RC", "A red check", "stop"),
        Node("RD", "The roadmap diff", "stop"),
    )
    edges = (
        Edge("P", "S"),
        Edge("S", "WP", "a premise the plan cannot absorb"),
        Edge("S", "B"),
        Edge("B", "MO", "served a model other than the configured one"),
        Edge("B", "R"),
        Edge("R", "F", "findings inside the step's part"),
        Edge("F", "R", "a further round, at most repair_rounds", "back"),
        Edge("R", "FU", "a finding that changes a public shape or a decision"),
        Edge("R", "L"),
        Edge("L", "RC", "a red check no fix within the plan covers"),
        Edge("L", "RD", "the closing step's /roadmap done"),
        Edge("L", "P", "the next step, until a pause or no unblocked step", "back"),
    )
    floating = (
        Node("SN", "A shape nobody named", "stop"),
        Node("CL", "A rule clash", "stop"),
    )
    note = (
        "/plan-orchestration <entry> runs one plan alone, <entry> inline has the session "
        "build every code step itself, and C<n> Agree or C<n> => <ruling> reviews a choice "
        "taken under self-rule. Under self_rule: on and next_entry: on the loop goes on to "
        "the next roadmap entry after a closing. The agents and stops of /spec, /refute and "
        "/land are in plan-loop.svg, and the refusals are not drawn."
    )
    return _steps(
        "orchestration/plan-orchestration.svg",
        "The plan-orchestration skill: every open plan, step by step",
        graph(nodes, edges, floating),
        note,
    )


def plan_retro() -> str:
    """The plan-retro skill: its steps from the refuter reports to the commit, and its stop."""
    nodes = (
        Node("R", "Each refuter report the previous retro did not list, read run by run", "step"),
        Node(
            "K",
            "Each finding given one kind, each kind counted over steps and plans and quoted",
            "step",
        ),
        Node("P", "The recurring kinds marked, a proposal drafted for each", "step"),
        Node("W", "The retro written from templates/retro.md and shown", "step"),
        Node("S", "The proposals", "stop"),
        Node("E", "Each decision written beside its proposal, the approved edits made", "step"),
        Node("C", "Each approved check's command run, its output shown", "step"),
        Node("M", "One commit of the retro and the edited files", "step"),
    )
    edges = (
        Edge("R", "K"),
        Edge("K", "P"),
        Edge("P", "W"),
        Edge("W", "S", "a recurring kind"),
        Edge("S", "E", "your decision on each: approved, corrected or declined"),
        Edge("W", "M", "no recurring kind"),
        Edge("E", "C"),
        Edge("C", "M"),
    )
    note = (
        "The other forms name a project or a folder. The skill starts no agent, and the "
        "refusals are not drawn."
    )
    return _steps(
        "orchestration/plan-retro.svg", "The plan-retro skill", graph(nodes, edges), note
    )


def refute() -> str:
    """The first run of the refute skill, with the run over a repair round as its cycle."""
    nodes = (
        Node(
            "A",
            "Reviewer: the diff against the brief, the checks and the quoted commands rerun",
        ),
        Node("MO", MODEL, "stop"),
        Node("S", "The report saved, its usage filled", "step"),
        Node("F", "Each finding closed or raised", "step"),
        Node("O", "Reviewer over a repair round: the delta", "maybe"),
    )
    edges = (
        Edge("A", "MO", "served a model other than the configured one"),
        Edge("A", "S"),
        Edge("S", "F"),
        Edge("F", "O", "refute_after_repair: yes, after a repair round"),
        Edge("O", "F", "its findings, at most repair_rounds", "back"),
    )
    note = (
        "/refute <folder>/<entry> <step> reads the plan.yaml in <folder>. A small text step "
        "gets the first run and no run over a repair round. The refusals are not drawn."
    )
    return _steps(
        "orchestration/refute.svg",
        "The refute skill: the first run and the run over a repair round",
        graph(nodes, edges),
        note,
    )


def roadmap() -> str:
    """The add mode of the roadmap skill: its steps and its stops."""
    nodes = (
        Node("F", "The file's format read", "step"),
        Node(
            "D",
            "The draft: title, goal, gate and its answer, what it waits on, its place",
            "step",
        ),
        Node("NG", "No gate", "stop"),
        Node("LV", "The level", "stop"),
        Node("IF", "The insertion form", "stop"),
        Node("MD", "A missing dependency", "stop"),
        Node("C", "The change", "stop"),
        Node("W", "Written and committed", "step"),
    )
    edges = (
        Edge("F", "D"),
        Edge("D", "NG", "the gate cannot be named"),
        Edge("D", "LV", "entries at two levels"),
        Edge("D", "IF", "no insertion form yet"),
        Edge("D", "MD", "a dependency the roadmap does not hold"),
        Edge("D", "C", "the diff"),
        Edge("C", "W", "your approval or correction"),
    )
    note = (
        "/roadmap shows the open entries in order, then those not yet specified. move, done "
        "and drop draft their change and stop at The change too, and --ruling writes a "
        "ruled change without it. The refusals are not drawn."
    )
    return _steps(
        "orchestration/roadmap.svg",
        "The add mode of the roadmap skill: /roadmap add <goal>",
        graph(nodes, edges),
        note,
    )


def spec() -> str:
    """The spec skill: its steps from the preflight to the dispatch entry, its agents and stops."""
    nodes = (
        Node(
            "P",
            "The preflight on main, then each premise of the step's text checked against "
            "the tree",
            "step",
        ),
        Node("DA", "Diagnosis agent, for a part that asks for a cause", "maybe"),
        Node("FP", "A false premise the plan cannot absorb", "stop"),
        Node("AD", "A rule clash with an ADR", "stop"),
        Node("CN", "A cause not found", "stop"),
        Node("L", "Libraries looked for, as libraries: says", "step"),
        Node("UC", "A user-visible choice", "stop"),
        Node(
            "B",
            "The brief from templates/brief.md, its paths compared with the steps in flight",
            "step",
        ),
        Node("BC", "Brief-check agent, for a full step", "maybe"),
        Node("BF", "A brief check finding the brief cannot absorb", "stop"),
        Node("MO", MODEL, "stop"),
        Node(
            "W",
            "The preparation commit, the worktree at main's head, the base binaries staged, "
            "the dispatch entry filled",
            "step",
        ),
    )
    edges = (
        Edge("P", "DA", "a part that asks for a cause"),
        Edge("P", "FP"),
        Edge("P", "AD", "the step contradicts an ADR in force"),
        Edge("DA", "CN"),
        Edge("DA", "MO"),
        Edge("P", "L"),
        Edge("DA", "L"),
        Edge("L", "UC", "a public shape to choose, or a library in place of new code"),
        Edge("L", "B"),
        Edge("B", "BC"),
        Edge("BC", "BF"),
        Edge("BC", "MO"),
        Edge("BC", "W", "each finding closed by a change to the brief"),
        Edge("B", "W", "a small text step"),
    )
    floating = (Node("NC", "A step that does not converge", "stop"),)
    note = (
        "Ruled: <the choice> books a ruling and /spec runs again. A step taken back out of "
        "main is first saved as a patch, and a /spec taken over goes on where it was left. "
        "The refusals are not drawn."
    )
    return _steps(
        "orchestration/spec.svg", "The spec skill", graph(nodes, edges, floating), note
    )


def wait_what() -> str:
    """The wait-what skill: its one step."""
    nodes = (
        Node(
            "A",
            "The last message explained again: a little context, ASD-STE100 Simplified "
            "Technical English, the terms of the glossary",
            "step",
        ),
    )
    note = (
        "The skill has one mode, writes no file, starts no agent and asks you nothing. Its "
        "Stops row is No stop, so no box is orange, and it has no refusal."
    )
    return _steps("explain/wait-what.svg", "The wait-what skill", graph(nodes, ()), note)


def tutor() -> str:
    """The teaching mode of the tutor skill: its steps and its two stops."""
    nodes = (
        Node("M", "MISSION.md read, when it exists", "step"),
        Node("I", "The mission interview", "stop"),
        Node("C", "The confirmation before the mission is changed", "stop"),
        Node(
            "R",
            "Resources found and recorded in RESOURCES.md, while it is not well populated",
            "step",
        ),
        Node("T", "What the lesson teaches: one tightly scoped thing", "step"),
        Node(
            "D",
            "The lesson designed around a skill: its knowledge, its task and the task's "
            "feedback",
            "step",
        ),
        Node(
            "W",
            "The lesson written from the components of assets/, with its reference documents",
            "step",
        ),
        Node("O", "The lesson opened", "step"),
    )
    edges = (
        Edge("M", "I", "missing, not populated, or the mission unclear"),
        Edge("M", "C", "the mission to be changed"),
        Edge("M", "R"),
        Edge("I", "R"),
        Edge("C", "R"),
        Edge("R", "T"),
        Edge("T", "D"),
        Edge("D", "W"),
        Edge("W", "O"),
    )
    note = (
        "/tutor explain <concept> explains one concept in the conversation from sources "
        "fetched in the run, with the stops No concept and The offer of a learning record, "
        "and with --page also writes it as one HTML page, with the stop The page's path. "
        "The refusal is not drawn."
    )
    return _steps(
        "explain/tutor.svg",
        "The teaching mode of the tutor skill: /tutor <topic>",
        graph(nodes, edges),
        note,
    )


def ordo_help() -> str:
    """The ordo-help skill for one plan: its four steps."""
    nodes = (
        Node("S", "The sequence, printed", "step"),
        Node("C", "The choices awaiting review", "step"),
        Node("P", "The plan's position and open items", "step"),
        Node("N", "The command that comes next", "step"),
    )
    edges = (Edge("S", "C"), Edge("C", "P"), Edge("P", "N"))
    note = (
        "/ordo-help skills prints every skill with its Quick start, and a sentence on what "
        "you want to do gets the skills that fit, each with its command. The skill never "
        "stops: its Stops row is No stop, and its refusal is not drawn."
    )
    return _steps(
        "ordo/ordo-help.svg",
        "The ordo-help skill for one plan: /ordo-help <entry>",
        graph(nodes, edges),
        note,
    )


def ordo_init() -> str:
    """The ordo-init skill in an existing repository with no plan.yaml: its steps and stops."""
    nodes = (
        Node("F", "The form and the roadmap file drafted", "step"),
        Node("SR", "Several roadmaps", "stop"),
        Node(
            "V",
            "The verification page, the rules page and the roots drafted, each command run "
            "once",
            "step",
        ),
        Node("FC", "A failing command", "stop"),
        Node("K", "Worker, reviewer and libraries", "stop"),
        Node("Q", "The questions", "stop"),
        Node(
            "G",
            "The glossary, the optional keys, the ignore rules and the shared rules drafted",
            "step",
        ),
        Node("DC", "The draft of the configuration", "stop"),
        Node("W", "The approved files written", "step"),
        Node(
            "X",
            "templates/check_config.py, then templates/sync_rules.py over the two blocks",
            "script",
        ),
        Node("FX", "A fix in the configuration check", "stop"),
        Node("HR", "A hunk to rule on", "stop"),
        Node("DS", "The drafted sync change", "stop"),
        Node("FS", "A file sync cannot use", "stop"),
        Node("SF", "The sync still fails", "stop"),
        Node("C", "One commit of the files written", "step"),
        Node("NC", "No commit allowed", "stop"),
    )
    edges = (
        Edge("F", "SR", "more than one candidate"),
        Edge("F", "V"),
        Edge("V", "FC", "a command fails its one run"),
        Edge("V", "K"),
        Edge("V", "Q", "no CLAUDE.md"),
        Edge("K", "G"),
        Edge("Q", "G"),
        Edge("G", "DC"),
        Edge("DC", "W", "your approval"),
        Edge("W", "X"),
        Edge("X", "FX", "an error in the configuration"),
        Edge("X", "HR", "a block differs"),
        Edge("X", "DS", "no single block"),
        Edge("X", "FS", "a file it cannot use"),
        Edge("X", "SF", "not 0 on its second run"),
        Edge("X", "C"),
        Edge("C", "NC", "the commit rule does not allow it"),
    )
    note = (
        "In an empty folder the skill sets up a new repository from the questions and the "
        "draft of the tree; with a plan.yaml it checks the configuration and syncs the two "
        "blocks; build writes utils/build.py from the verification page. --ruling writes a "
        "ruled draft without its stop. The skill starts no agent, and the refusals are not "
        "drawn."
    )
    return _steps(
        "ordo/ordo-init.svg",
        "The ordo-init skill in an existing repository with no plan.yaml",
        graph(nodes, edges),
        note,
    )


def session_retro() -> str:
    """The session-retro skill for one plan: its steps, its script and its two stops."""
    nodes = (
        Node(
            "W",
            "The window: from the commit that added the plan's plan.md to its last commit",
            "step",
        ),
        Node("T", "The transcript folders found", "step"),
        Node(
            "R",
            "The reader, transcript_window.py: what was said and done, each secret redacted",
            "script",
        ),
        Node("LO", "A large output", "stop"),
        Node("O", "Each output read whole, in parts, into the sessions report", "step"),
        Node(
            "P",
            "Each point's places and its proposal written, a point decided before left out",
            "step",
        ),
        Node("PR", "The proposals", "stop"),
        Node("C", "The report committed, the working folder removed", "step"),
    )
    edges = (
        Edge("W", "T"),
        Edge("T", "R"),
        Edge("R", "LO", "more than 1,000,000 bytes"),
        Edge("R", "O"),
        Edge("LO", "O", "your word to read it all"),
        Edge("O", "P"),
        Edge("P", "PR"),
        Edge("PR", "C", "your decision on each"),
    )
    note = (
        "/session-retro session <session id> reviews one session with its subagents, and "
        "/session-retro <start> <end> any window; the folder forms read the plan.yaml in "
        "<folder>. The skill starts no agent, and the refusals are not drawn."
    )
    return _steps(
        "ordo/session-retro.svg",
        "The session-retro skill for one plan: /session-retro <entry>",
        graph(nodes, edges),
        note,
    )


def figures() -> tuple[tuple[str, str], ...]:
    """Every figure of this script, as its path under docs/figures and its body."""
    return (
        ("orchestration/pipeline.svg", pipeline()),
        ("orchestration/plan-loop.svg", plan_loop()),
        ("orchestration/grill.svg", grill()),
        ("orchestration/land.svg", land()),
        ("orchestration/plan.svg", plan()),
        ("orchestration/plan-orchestration.svg", plan_orchestration()),
        ("orchestration/plan-retro.svg", plan_retro()),
        ("orchestration/refute.svg", refute()),
        ("orchestration/roadmap.svg", roadmap()),
        ("orchestration/spec.svg", spec()),
        ("academic/writing.svg", writing()),
        ("academic/paper-review-panel.svg", paper_review_panel()),
        ("academic/referee.svg", referee()),
        ("academic/submit.svg", submit()),
        ("academic/grant.svg", grant()),
        ("code/code-comments.svg", code_comments()),
        ("code/codebase-design.svg", codebase_design()),
        ("code/diagnose.svg", diagnose()),
        ("code/wizard.svg", wizard()),
        ("code/handbook.svg", handbook()),
        ("academic/researcher/manuscript.svg", researcher()),
        ("academic/researcher/research.svg", researcher_research()),
        ("academic/researcher/revision.svg", researcher_revision()),
        ("academic/researcher/lifecycle.svg", researcher_lifecycle()),
        *paper_figures(),
        ("academic/paper/lifecycle.svg", paper_lifecycle()),
        ("academic/paper/run-folder.svg", paper_run_folder()),
        ("explain/wait-what.svg", wait_what()),
        ("explain/tutor.svg", tutor()),
        ("ordo/ordo-help.svg", ordo_help()),
        ("ordo/ordo-init.svg", ordo_init()),
        ("ordo/session-retro.svg", session_retro()),
    )


def main() -> int:
    try:
        lines = write_figures(HERE, figures(), ROOT)
    except FigureError as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    for line in lines:
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main())
