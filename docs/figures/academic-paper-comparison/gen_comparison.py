"""Write the figures that set the paper skill beside academic-paper 3.2.0.

Imports the layout code of ../gen_figures.py, found from this file's own location. The import
writes a __pycache__ folder beside gen_figures.py, which git ignores.

Writes, beside this file, 25 figures:

- <mode>-simple.svg and <mode>-detailed.svg for each of the twelve modes full, revision,
  lit-review, outline-only, abstract-only, citation-check, disclosure, plan, format-convert,
  revision-coach, rebuttal-audit and response-letter: academic-paper 3.2.0 on the left, or for
  response-letter steps 3 and 4 of academic-pipeline's external review protocol, and paper on
  the right. The simple view draws the agent starts, the tasks of resumed agents, the stops and
  the cycles. The detailed view draws every step, script and stop, with grey boxes for scripts
  and indigo boxes tagged with the ruling that makes paper differ from academic-paper.
- academic-pipeline.svg: the stages of academic-pipeline and the skill each goes to.

Every box, arrow and label is written in this file, taken from the files of academic-paper
3.2.0 and academic-pipeline in research-hub and from skills/paper and its ADRs, which keep the
rulings of plan 5. The script reads none of them and no other input.

Run, from the repository root: python3 docs/figures/academic-paper-comparison/gen_comparison.py
The script finds its files from its own location, so it also runs from any other directory when
given the path to the script.

Every byte written is ASCII. Each figure carries its own light panel.

Errors, each printed to stderr as "error: <message>", with the figure, the box and the label
named the way gen_figures.py names them:

- a label that does not fit its box, a word longer than a line, a note, a caption or a legend
  line that does not fit, two boxes of one figure that share a key, an edge that names a box
  the figure does not hold, an edge whose style is none of flow, dotted, back and return, or
  edges that form a cycle not marked as a return;
- a body that holds a non-ASCII character;
- a file that cannot be written or read back, or whose text read back differs from the body.

The label and ASCII errors stop the run before any file is written.

Exit status: 0 every file written and verified, 1 an error above.
"""

import sys
from collections.abc import Sequence
from pathlib import Path
from typing import NamedTuple

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent))

import gen_figures as gf

N = gf.Node
E = gf.Edge
L = gf.Legend

NODE_WIDTH = 214
WIDE_WIDTH = 252
ROW_GAP = 26
PANEL_GAP = 40
STAGE_WIDTH = 200
TARGET_WIDTH = 232
STAGE_GAP = 16

APNOTE = (
    "Scripts and the session's own steps are left out. Not drawn because it is the same in "
    "every mode of paper: at every patch, a structural patch, a patch that does not apply or a "
    "failed script stops the run (a ruling of plan 5)."
)

DETAILED_LEGEND = (
    L("stop", "Orange box: the run stops for you"),
    L("dotted", "Dotted arrow: a cycle back, with its cap"),
    L("script", "Grey box: a script"),
    L("agent", "Plain box, no tag: as academic-paper does it"),
    L(
        "ruled",
        'Indigo box, with a tag such as "[5.Q (i)]": differs from academic-paper by the '
        "ruling of plan 5 that the tag names",
    ),
    L("choice", "Rounded box: a decision the run takes"),
)

RULED_MAYBE_LEGEND = L(
    "ruled_maybe",
    "Dashed indigo box: a ruled agent start, or a ruled task of a resumed agent, that runs only "
    "when needed",
)


def detailed_legend(panels: Sequence[gf.Panel]) -> tuple[gf.Legend, ...]:
    """The legend of a detailed figure, with the dashed indigo row when a box uses it."""
    kinds = {
        node.kind
        for panel in panels
        for node in (*panel.graph.nodes, *panel.graph.floating)
    }
    if "ruled_maybe" in kinds:
        return (*DETAILED_LEGEND, RULED_MAYBE_LEGEND)
    return DETAILED_LEGEND


PIPELINE_LEGEND = (
    L("ap", "Green: academic-paper"),
    L("rev", "Purple: academic-paper-reviewer"),
    L("pipe", "Grey: academic-pipeline itself"),
    L("dr", "Sand: deep-research"),
    L("paper", "Teal: paper"),
    L("todo", "Dashed box: not built yet, with its roadmap entry"),
    L("none", "Red dotted box: no skill takes it"),
    L(
        "dotted",
        "Dotted arrow: goes to a skill not built yet or to none; a solid arrow goes to paper",
    ),
)


def _g(
    nodes: Sequence[gf.Node],
    edges: Sequence[gf.Edge],
    floating: Sequence[gf.Node] = (),
    width: float = NODE_WIDTH,
) -> gf.Graph:
    return gf.Graph(tuple(nodes), tuple(edges), tuple(floating), width)


# ---------------------------------------------------------------------------------------
# academic-paper 3.2.0, simple view.


def ap_full_simple() -> gf.Graph:
    nodes = (
        N("I", "Intake agent: you confirm", "stop"),
        N("L", "Literature strategist, unless you give your own sources", "maybe"),
        N("LR", "You review the sources, optional", "stop"),
        N("A", "Structure architect"),
        N("OA", "Outline approval", "stop"),
        N("B", "Argument builder"),
        N("W", "Draft writer, 2 calls"),
        N("V", "Visualization, with data", "maybe"),
        N("C", "Citation compliance"),
        N("AB", "Abstract agent"),
        N("P", "Peer reviewer, 2 calls"),
        N("WR", "Draft writer: the whole draft again"),
        N("RA", "RAISE compliance agent"),
        N("SD", "You decide", "stop"),
        N("F", "Formatter"),
        N("G", "Output refused", "stop"),
    )
    edges = (
        E("I", "L"),
        E("L", "LR"),
        E("L", "L", "search rounds: end at any 3 of 5 conditions, or after 4 rounds when none holds", "back"),
        E("LR", "A"),
        E("A", "OA"),
        E("OA", "A", "restructuring, no cap", "back"),
        E("OA", "B"),
        E("B", "W"),
        E("B", "V"),
        E("V", "V", "checks the rendered figure, up to 2 fixes, optional", "back"),
        E("W", "C"),
        E("W", "AB"),
        E("C", "P"),
        E("AB", "P"),
        E("P", "WR", "Minor or Major: round 2, once", "dotted"),
        E("WR", "P", "", "back"),
        E("P", "RA"),
        E("P", "SD", "Reject in round 1, or after round 2 a score under 6.5 with a Critical issue open"),
        E("RA", "F"),
        E("V", "F"),
        E("F", "F", "a checklist item fails, no cap", "back"),
        E("F", "G", "a citation unverified"),
    )
    return _g(nodes, edges)


def ap_revision_simple() -> gf.Graph:
    nodes = (
        N("P", "Peer reviewer: the comments as a roadmap"),
        N("W", "Draft writer: a patch"),
        N("SD", "You decide", "stop"),
        N("C", "Citation compliance"),
        N("X", "Revised draft, the rest as limitations"),
    )
    edges = (
        E("P", "W"),
        E("W", "SD", "restructuring, or a patch rejected twice"),
        E("W", "C"),
        E("C", "P", "round 2, once", "back"),
        E("C", "X"),
    )
    return _g(nodes, edges)


def ap_lit_review_simple() -> gf.Graph:
    nodes = (
        N("I", "Intake agent: you confirm", "stop"),
        N("L", "Literature strategist"),
        N("LR", "You review the sources, optional", "stop"),
    )
    edges = (
        E("I", "L"),
        E("L", "LR"),
        E("L", "L", "search rounds: end at any 3 of 5 conditions, or after 4 rounds when none holds", "back"),
    )
    return _g(nodes, edges)


def ap_outline_only_simple() -> gf.Graph:
    nodes = (
        N("I", "Intake agent: you confirm", "stop"),
        N("L", "Literature strategist"),
        N("LR", "You review the sources, optional", "stop"),
        N("A", "Structure architect"),
        N("OA", "Outline approval", "stop"),
    )
    edges = (
        E("I", "L"),
        E("L", "LR"),
        E("L", "L", "search rounds: end at any 3 of 5 conditions, or after 4 rounds when none holds", "back"),
        E("LR", "A"),
        E("A", "OA"),
        E("OA", "A", "restructuring, no cap", "back"),
    )
    return _g(nodes, edges)


def ap_abstract_only_simple() -> gf.Graph:
    nodes = (
        N("I", "Intake agent: you confirm", "stop"),
        N("AB", "Abstract agent"),
    )
    return _g(nodes, (E("I", "AB"),))


def ap_citation_check_simple() -> gf.Graph:
    nodes = (
        N("C", "Citation compliance"),
        N("SD", "You decide", "stop"),
        N("X", "Citation audit report"),
    )
    edges = (
        E("C", "SD", "a claim not in its source"),
        E("C", "X"),
    )
    return _g(nodes, edges)


def ap_disclosure_simple() -> gf.Graph:
    nodes = (
        N(
            "S",
            "You name the venue, and paste the policy of a venue it does not know",
            "stop",
        ),
        N("U", "You confirm each uncertain kind of AI use", "stop"),
        N("F", "Formatter", "maybe"),
    )
    return _g(nodes, (E("S", "U"), E("U", "F")))


def ap_plan_simple() -> gf.Graph:
    nodes = (
        N("I", "Intake agent: 3 questions, you confirm", "stop"),
        N("M", "Socratic mentor, chapter by chapter"),
        N("S", "Structure architect: the outline"),
        N("M2", "Socratic mentor and argument builder: the stress test"),
        N("X", "Chapter plan and INSIGHT collection"),
    )
    edges = (
        E("I", "M"),
        E(
            "M",
            "M",
            "offers after 8 rounds on a chapter, 30 in all",
            "back",
        ),
        E("M", "S"),
        E("S", "M2"),
        E("M2", "X"),
    )
    return _g(nodes, edges)


def ap_format_convert_simple() -> gf.Graph:
    nodes = (
        N("F", "Formatter: LaTeX, DOCX, PDF, Markdown, citation style"),
        N("G", "Output refused", "stop"),
        N("X", "Formatted document"),
    )
    edges = (
        E("F", "G", "a citation-provenance marker unresolved"),
        E("F", "F", "a checklist item fails, no cap", "back"),
        E("F", "X"),
    )
    return _g(nodes, edges)


# ---------------------------------------------------------------------------------------
# academic-paper 3.2.0, detailed view.


def ap_full_detailed() -> gf.Graph:
    nodes = (
        N(
            "I0",
            "Phase 0 Intake: configuration record, citation verification: mark only or strict",
            "stop",
        ),
        N("Q1", "you skip Phase 1, giving your own sources?", "choice"),
        N(
            "L1",
            "Phase 1 Literature strategist: screens your sources, searches for what they "
            "miss, unless you say your sources only",
        ),
        N("R1", "You review the sources: add or remove, optional", "stop"),
        N("O2", "Phase 2 Structure architect: outline and evidence map"),
        N("OA", "Outline approval", "stop"),
        N("A3", "Phase 3 Argument builder"),
        N("W4", "Phase 4 Draft writer: 4a pre-commitment, 4b draft and self-scores"),
        N(
            "V4",
            "Visualization, when there are quantitative results: figure code and LaTeX "
            "inclusion code",
        ),
        N("AB", "Phase aborted: you decide", "stop"),
        N(
            "C5",
            "Phase 5a Citation compliance: corrects format and DOIs, flags a wrong source, "
            "stops on a claim not in its source",
        ),
        N("B5", "Phase 5b Abstract agent, in parallel"),
        N(
            "P6",
            "Phase 6 Peer reviewer, round 1: 6a scoring plan, 6b scores and verdict",
        ),
        N("UD", "You decide", "stop"),
        N("W6", "Draft writer: revises, a full draft again"),
        N("P62", "Peer reviewer, round 2: the revised sections"),
        N("RA", "RAISE compliance check, warnings only"),
        N(
            "F7",
            "Phase 7 Formatter: adds the AI disclosure and limitations if missing, places "
            "the figures, converts, compiles with tectonic or xelatex",
        ),
        N(
            "K7",
            "Final checklist: content, format, required elements, DOIs; compile errors "
            "fixed, warnings accepted",
        ),
        N(
            "G7",
            "Hard gate: a citation unverified, fabricated or unsupported, or blocked under "
            "strict?",
            "choice",
        ),
        N("U7", "Output refused: you fix it", "stop"),
        N("X7", "Output package"),
    )
    edges = (
        E("I0", "Q1"),
        E("Q1", "L1", "no, the default"),
        E("Q1", "O2", "yes"),
        E("L1", "R1"),
        E("R1", "O2"),
        E("O2", "OA"),
        E("OA", "O2", "you ask for restructuring, no cap stated", "back"),
        E("OA", "A3"),
        E("A3", "W4"),
        E("A3", "V4"),
        E("W4", "AB", "format check fails twice"),
        E("W4", "C5"),
        E("W4", "B5"),
        E("C5", "P6"),
        E("B5", "P6"),
        E("P6", "UD", "Reject"),
        E("P6", "W6", "Minor or Major"),
        E("W6", "P62", "round 2, the last", "dotted"),
        E("P62", "UD", "below 6.5, a Critical issue unresolved"),
        E(
            "P62",
            "RA",
            "6.5 or more, or every Critical resolved: the rest become limitations",
        ),
        E("P6", "RA", "Accept"),
        E("RA", "F7"),
        E("V4", "F7"),
        E("F7", "K7"),
        E("K7", "F7", "an item fails: fix it and check it again, no cap", "back"),
        E("K7", "G7"),
        E("G7", "U7", "yes"),
        E("G7", "X7", "no"),
    )
    return _g(nodes, edges, width=WIDE_WIDTH)


LT_TAG = "[Paper's lit-review as academic-paper's]"
AP_NOTE = (
    "\"[Paper's lit-review as academic-paper's]\" is the ruling of plan 5 that makes the "
    "literature strategist academic-paper's page and leaves the structure of the search to "
    "the session, as academic-paper's text leaves it: one strategist, or several with a "
    "merge, each start briefed by the session. Its one change: the strategist writes "
    "review.md and refs.bib with its own edits, and no script assembles them."
)
SEARCH_ROUNDS = "search rounds: end at any 3 of 5 conditions, or after 4 rounds"
CONFIRMED = f"review.md and refs.bib written with its own edits, its own query scripts allowed {LT_TAG}"


def search_nodes(synthesis: bool = False) -> tuple[gf.Node, ...]:
    """The session's choice of one strategist or several, the several starts and their merge.

    With synthesis, the merge also writes the synthesis analysis of lit-review mode.
    """
    merge = "Literature strategist, the merge the session briefs: review.md and refs.bib"
    return (
        N(
            "THS",
            "Session: one literature strategist, or several with a merge, each start's "
            f"brief written by the session, the choice in config.md Decisions {LT_TAG}",
            "choice",
        ),
        N(
            "T2",
            f"Literature strategists, the starts the session briefs, at once {LT_TAG}",
            "ruled_maybe",
        ),
        N(
            "TM",
            f"{merge}, with the synthesis analysis {LT_TAG}" if synthesis else f"{merge} {LT_TAG}",
            "ruled_maybe",
        ),
    )


def search_edges(single: str, after: str) -> tuple[gf.Edge, ...]:
    """The arrows from the session's choice to the one strategist, or to the several starts and their merge."""
    return (
        E("THS", single, f"one strategist {LT_TAG}"),
        E("THS", "T2", f"several, with a merge {LT_TAG}"),
        E("T2", "T2", SEARCH_ROUNDS, "back"),
        E("T2", "TM"),
        E("TM", after),
    )


def ap_revision_detailed() -> gf.Graph:
    nodes = (
        N("RP", "Peer reviewer: the comments as a revision roadmap"),
        N("AN", "Script: anchorize the draft", "script"),
        N("RW", "Draft writer: a patch, never a full draft"),
        N("AP", "Script: apply the patch to a new file", "script"),
        N("D1", "You decide: retry, full re-emission or abort", "stop"),
        N("D2", "You acknowledge it, or the patch is narrowed", "stop"),
        N("D3", "You confirm a full re-emission", "stop"),
        N("RC", "Citation compliance on the revised draft"),
        N("RX", "Revised draft, apply report, revision log"),
    )
    edges = (
        E("RP", "AN"),
        E("AN", "RW"),
        E("RW", "AP"),
        E("AP", "RW", "exit 2: the writer emits the patch once more", "back"),
        E("AP", "D1", "a second rejection"),
        E("AP", "D2", "exit 3, structural"),
        E("RW", "D3", "the round needs restructuring"),
        E("AP", "RC"),
        E("RC", "RP", "round 2: re-review, the last", "back"),
        E("RC", "RX", "after round 2: the rest become limitations"),
    )
    return _g(nodes, edges, width=WIDE_WIDTH)


def ap_lit_review_detailed() -> gf.Graph:
    nodes = (
        N("LI", "Intake, citation verification: mark only or strict", "stop"),
        N("LL", "Literature strategist"),
        N("LR", "You review the sources: add or remove, optional", "stop"),
        N("LX", "Annotated bibliography, literature matrix, synthesis"),
    )
    return _g(nodes, (E("LI", "LL"), E("LL", "LR"), E("LR", "LX")), width=WIDE_WIDTH)


def paper_lit_review_detailed() -> gf.Graph:
    nodes = (
        N(
            "I",
            "Intake agent: config.md, citation verification, the number of sources "
            "[5.Q item 6], the research question the run needs [AD11, AV15]",
            "stop",
        ),
        *search_nodes(synthesis=True),
        N(
            "LS",
            "Literature strategist: review.md with the synthesis analysis, refs.bib; a list "
            "over 50 entries shows its first 20 and last 5; it does not start without a "
            "research question [D2, AD11, AV15, AV16]",
            "ruled_maybe",
        ),
        N(
            "LC",
            f"The strategist, or the merge: {CONFIRMED}",
            "ruled",
        ),
        N(
            "SJ",
            "Session: the report of each start read as it ends",
            "choice",
        ),
        N(
            "SC",
            "Script, run by the session: lookup.py resolve once over every entry of "
            "refs.bib; a proceedings page for an entry with neither; checks.md",
            "script",
        ),
        N(
            "LV",
            "Literature strategist that wrote refs.bib, resumed with checks.md: the differing "
            "titles resolved; strict: a failing identifier corrected or removed, once [O]",
            "ruled",
        ),
        N(
            "CK",
            "Script, run by the session: lookup.py resolve once again over every entry "
            "of refs.bib, into checks.md",
            "script",
        ),
        N(
            "SR",
            "You review the sources: add or remove, optional [J]",
            "stop",
        ),
        N(
            "RC",
            "Script, run by the session: lookup.py resolve again on each corrected "
            "or added entry's DOI or arXiv ID, into checks.md [O]",
            "script",
        ),
        N("RS", "A reference that cannot be confirmed [O]", "stop"),
        N(
            "FM",
            "Formatter: each target other than Markdown, from review.md with refs.bib; "
            "the review's issues to the strategist that wrote review.md, then the targets "
            "again",
            "ruled_maybe",
        ),
        N("X", "End"),
    )
    floating = (
        N(
            "PS",
            "At every patch: a structural patch, a patch that does not apply (retry as "
            "often as you ask, write it again in full, or leave it [BR]), a script "
            "failed [C]",
            "stop",
        ),
    )
    edges = (
        E("I", "I", "you change it, until you confirm [R]", "back"),
        E("I", "THS"),
        *search_edges("LS", "LC"),
        E("LS", "LS", SEARCH_ROUNDS, "back"),
        E("LS", "LC"),
        E("LC", "SJ"),
        E("SJ", "SC"),
        E("SC", "LV"),
        E("LV", "CK"),
        E("CK", "RS", "strict: an identifier still fails"),
        E("CK", "SR"),
        E("SR", "RC"),
        E("RC", "RS", "strict: an identifier still fails"),
        E("RC", "X", "Markdown only"),
        E("RC", "FM", "a target other than Markdown"),
        E("FM", "X"),
    )
    return _g(nodes, edges, floating, WIDE_WIDTH)


def ap_outline_only_detailed() -> gf.Graph:
    nodes = (
        N("OI", "Intake, citation verification: mark only or strict", "stop"),
        N("OL", "Literature strategist"),
        N("OR", "You review the sources: add or remove, optional", "stop"),
        N("OS", "Structure architect: outline and evidence map"),
        N("OA", "Outline approval", "stop"),
        N("OX", "Outline, evidence map, word count per section"),
    )
    edges = (
        E("OI", "OL"),
        E("OL", "OR"),
        E("OR", "OS"),
        E("OS", "OA"),
        E("OA", "OS", "you ask for restructuring, no cap stated", "back"),
        E("OA", "OX"),
    )
    return _g(nodes, edges, width=WIDE_WIDTH)


def ap_abstract_only_detailed() -> gf.Graph:
    nodes = (
        N("AI", "Intake, citation verification: mark only or strict", "stop"),
        N("AB", "Abstract agent"),
        N("AX", "Abstract and keywords"),
    )
    return _g(nodes, (E("AI", "AB"), E("AB", "AX")), width=WIDE_WIDTH)


def ap_citation_check_detailed() -> gf.Graph:
    nodes = (
        N(
            "CC",
            "Citation compliance agent, one pass: cross-check, format, DOI, retractions",
        ),
        N("CD", "each issue", "choice"),
        N("CA", "Corrected, logged"),
        N("CH", "Flagged for your review"),
        N("CW", "Revised wording suggested"),
        N("CS", "STOP: possible fabrication", "stop"),
        N("CR", "Removed, or kept with a note"),
        N("CX", "Citation audit report"),
    )
    edges = (
        E("CC", "CD"),
        E("CD", "CA", "formatting only"),
        E("CD", "CH", "right claim, wrong source"),
        E("CD", "CW", "the claim drifts from its source"),
        E("CD", "CS", "the claim is not in its source"),
        E("CD", "CR", "a retracted source"),
        E("CA", "CX"),
        E("CH", "CX"),
        E("CW", "CX"),
        E("CR", "CX"),
    )
    return _g(nodes, edges, width=WIDE_WIDTH)


def ap_disclosure_detailed() -> gf.Graph:
    nodes = (
        N("SL", "a venue or a policy anchor given?", "choice"),
        N("SA", "You name one", "stop"),
        N("VL", "venue in the policy database?", "choice"),
        N("PA", "Anchor table lookup"),
        N("VP", "Halt: you paste the venue's policy", "stop"),
        N("CG", "Each kind of AI use marked used, not used or uncertain"),
        N("CU", "You confirm it", "stop"),
        N("MD", "Session metadata: the model of this run"),
        N(
            "DD",
            "Disclosure paragraph: Claude, the model's name, (Anthropic), in the venue's "
            "voice and phrasing",
        ),
        N("DX", "Paragraph and placement"),
    )
    edges = (
        E("SL", "SA", "neither"),
        E("SL", "VL", "a venue"),
        E("SL", "PA", "a policy anchor"),
        E("VL", "VP", "no"),
        E("VL", "CG", "yes"),
        E("VP", "CG"),
        E("SA", "SL", "", "return"),
        E("PA", "CG"),
        E("CG", "CU", "uncertain"),
        E("CG", "MD"),
        E("CU", "MD"),
        E("MD", "DD"),
        E("DD", "DX"),
    )
    return _g(nodes, edges, width=WIDE_WIDTH)


def ap_plan_detailed() -> gf.Graph:
    nodes = (
        N("PI", "Intake: the 3-question simplified interview", "stop"),
        N(
            "S0",
            "Step 0 readiness check: materials and the research question; a missing "
            "foundation is sent to deep-research first",
        ),
        N("S1", "Step 1 thesis: INSIGHT thesis_statement"),
        N(
            "S2",
            "Step 2 chapters, six in order, at least 2 rounds each; a chapter summary "
            "after each",
        ),
        N("SA", "Structure architect: the outline from all chapter summaries"),
        N(
            "S25",
            "Step 2.5 contribution sharpening, at least 1 round; INSIGHT contribution_claim",
        ),
        N(
            "S3",
            "Step 3 stress test: socratic mentor and argument builder probe each "
            "sub-argument",
        ),
        N("X", "Chapter plan and INSIGHT collection"),
    )
    edges = (
        E("PI", "S0"),
        E("S0", "S1"),
        E("S1", "S2"),
        E(
            "S2",
            "S2",
            "offers after 8 rounds on a chapter, 30 in all",
            "back",
        ),
        E("S2", "SA"),
        E("SA", "S25"),
        E("S25", "S3"),
        E("S3", "X"),
    )
    return _g(nodes, edges, width=WIDE_WIDTH)


def ap_format_convert_detailed() -> gf.Graph:
    nodes = (
        N(
            "F",
            "Phase 7 Formatter: LaTeX, DOCX through Pandoc, PDF or Markdown; journal "
            "formatting; citations between APA 7, Chicago, MLA, IEEE and Vancouver",
        ),
        N(
            "G",
            "Hard gate: an unresolved citation-provenance marker in the input?",
            "choice",
        ),
        N("U", "Output refused", "stop"),
        N(
            "K",
            "Final checklist: content, format, required elements; word count within 1 "
            "percent; compile errors fixed, warnings accepted",
        ),
        N("X", "Formatted document"),
    )
    edges = (
        E("F", "G"),
        E("G", "U", "yes"),
        E("G", "K", "no"),
        E("K", "K", "an item fails: fix it and check it again, no cap", "back"),
        E("K", "X"),
    )
    return _g(nodes, edges, width=WIDE_WIDTH)


# ---------------------------------------------------------------------------------------
# academic-pipeline and the skill each of its stages goes to.


def pipeline_flow() -> gf.Graph:
    nodes = (
        N("S1", "1 Research: deep-research", "dr"),
        N("S2", "2 Write: academic-paper, plan or full", "ap"),
        N("S25", "2.5 Integrity check", "pipe"),
        N("S3", "3 Review: academic-paper-reviewer", "rev"),
        N("RJ", "Back to stage 2, or end"),
        N("S4", "4 Revise: academic-paper revision", "ap"),
        N("S3b", "3' Re-review", "rev"),
        N("S4b", "4' Re-revise, no review after", "ap"),
        N("S45", "4.5 Final integrity check, zero issues to pass", "pipe"),
        N("S5", "5 Finalize: DOCX, LaTeX, PDF", "ap"),
        N("S6", "6 Process summary", "pipe"),
    )
    edges = (
        E("S1", "S2"),
        E("S2", "S25"),
        E("S25", "S25", "fail: fix and check again, up to 3 rounds", "back"),
        E("S25", "S3", "pass"),
        E("S3", "RJ", "Reject"),
        E("S3", "S4", "Minor or Major"),
        E("S4", "S3b"),
        E("S3b", "S4b", "Major"),
        E("S3b", "S45", "Accept or Minor"),
        E("S3", "S45", "Accept"),
        E("S4b", "S45"),
        E("S45", "S45", "fail: fix and check again", "back"),
        E("S45", "S5", "pass"),
        E("S5", "S6"),
    )
    return _g(nodes, edges)


class Stage(NamedTuple):
    """A stage of academic-pipeline, the skill it goes to, and whether the arrow is solid."""

    label: str
    kind: str
    target: str
    solid: bool


STAGES = (
    Stage("1 Research: deep-research", "dr", "RS", False),
    Stage("2 Write: academic-paper", "ap", "P1", True),
    Stage("2.5 Integrity check", "pipe", "RS", False),
    Stage("3 Review", "rev", "PRV", False),
    Stage("4, 3', 4' Revise and re-review", "ap", "P2", True),
    Stage("4.5 Final integrity check", "pipe", "RS", False),
    Stage("5 Finalize", "ap", "FC", True),
    Stage("6 Process summary", "pipe", "NO", False),
)

TARGETS = {
    "P1": ("paper plan and paper full", "paper"),
    "PRV": ("paper-review, entry 6", "todo"),
    "RS": ("researcher, entry 13: integrity and ethics checks, the stage loop", "todo"),
    "P2": ("paper revision", "paper"),
    "FC": ("paper format-convert", "paper"),
    "NO": ("none", "none"),
}

PIPELINE_NOTE = (
    "The pipeline stops for you after every stage. D42 and D56: the integrity and ethics "
    "checks run in researcher, once on paper's finished draft and once after its revision."
)


def _lines(figure: str, where: str, label: str, width: float) -> list[str]:
    lines = gf._wrap(figure, where, label, width - 2 * gf.PAD_X, gf.NODE_SIZE)
    if len(lines) > gf.MAX_NODE_LINES:
        raise gf.FigureError(
            f"{figure}: {where}: the label {label!r} does not fit the box"
        )
    return lines


class MapBox(NamedTuple):
    """A box of the mapping panel, with its wrapped lines."""

    area: gf.Rect
    kind: str
    lines: list[str]


def map_layout(figure: str) -> tuple[list[MapBox], list[MapBox], dict[str, int]]:
    """Place the stage boxes in one column and each target at the mean of its stages."""
    stages: list[MapBox] = []
    cursor = 0.0
    for stage in STAGES:
        lines = _lines(figure, f"box {stage.label!r}", stage.label, STAGE_WIDTH)
        height = gf._node_height(lines)
        stages.append(
            MapBox(gf.Rect(0, cursor, STAGE_WIDTH, height), stage.kind, lines)
        )
        cursor += height + STAGE_GAP
    order = sorted(
        TARGETS,
        key=lambda key: (
            sum(i for i, s in enumerate(STAGES) if s.target == key)
            / sum(1 for s in STAGES if s.target == key)
        ),
    )
    targets: list[MapBox] = []
    index: dict[str, int] = {}
    bottom = -STAGE_GAP
    for key in order:
        label, kind = TARGETS[key]
        lines = _lines(figure, f"box {label!r}", label, TARGET_WIDTH)
        height = gf._node_height(lines)
        mids = [
            stages[i].area.y + stages[i].area.h / 2
            for i, s in enumerate(STAGES)
            if s.target == key
        ]
        top = max(bottom + STAGE_GAP, sum(mids) / len(mids) - height / 2)
        targets.append(
            MapBox(
                gf.Rect(STAGE_WIDTH + 150, top, TARGET_WIDTH, height),
                kind,
                lines,
            )
        )
        index[key] = len(targets) - 1
        bottom = top + height
    return stages, targets, index


def pipeline_figure() -> str:
    name = "academic-pipeline.svg"
    flow = gf.FlowLayout(name, pipeline_flow())
    stages, targets, index = map_layout(name)
    map_width = STAGE_WIDTH + 150 + TARGET_WIDTH
    map_height = max(
        [box.area.y + box.area.h for box in (*stages, *targets)], default=0
    )
    top = gf.MARGIN + 24
    width = flow.width + PANEL_GAP + map_width + 2 * gf.MARGIN
    note_room = gf.note_height(name, PIPELINE_NOTE, width - 2 * gf.MARGIN)
    body = max(flow.height, map_height)
    height = (
        top + body + 20 + note_room + gf.legend_height(PIPELINE_LEGEND) + 3 * gf.MARGIN
    )
    boxes = (
        [(n.label, n.kind) for n in flow.graph.nodes]
        + [(s.label, s.kind) for s in STAGES]
        + [TARGETS[key] for key in TARGETS]
    )
    label = (
        "academic-pipeline: the 10 stages, and where each stage goes now. Boxes: "
        + "; ".join(text for text, _ in boxes)
        + "."
    )
    canvas = gf.Canvas(name, width, height, label)
    gf.draw_caption(
        canvas, gf.MARGIN, gf.MARGIN + 6, "academic-pipeline: the 10 stages", flow.width
    )
    flow.draw(canvas, gf.MARGIN, top)
    left = gf.MARGIN + flow.width + PANEL_GAP
    gf.draw_caption(canvas, left, gf.MARGIN + 6, "where each stage goes now", map_width)
    for number, stage in enumerate(STAGES):
        source = stages[number].area
        target = targets[index[stage.target]].area
        canvas.path(
            [
                (left + source.x + source.w, top + source.y + source.h / 2),
                (left + target.x - 1, top + target.y + target.h / 2),
            ],
            gf.ACCENT,
            1.8,
            "" if stage.solid else gf.DOTTED,
            arrow=True,
        )
    for box in (*stages, *targets):
        area = gf.Rect(left + box.area.x, top + box.area.y, box.area.w, box.area.h)
        gf.draw_node(canvas, area, box.kind, box.lines)
    below = top + body + 20
    gf.draw_note(canvas, gf.MARGIN, below + 4, PIPELINE_NOTE, width - 2 * gf.MARGIN)
    gf.draw_legend(canvas, gf.MARGIN, below + note_room + gf.MARGIN, PIPELINE_LEGEND)
    return canvas.render()


# ---------------------------------------------------------------------------------------
# paper, detailed view, and the three modes of revision comments on both sides.

GOAL = "[5.Q (i)]"
LETTER = "[5.Q item 5]"
SOURCES = "[5.Q item 6]"
PATCH_STOPS = (
    N(
        "PS",
        f"At every patch: a structural patch, a patch that does not apply, a script failed {GOAL}",
        "stop",
    ),
)
CHECKS = (
    f"Script, run by the session: lookup.py cite-keys and check-urls; latexmk compile "
    f"with the engine of the class {GOAL}"
)
FIXES = (
    f"Draft writer, resumed: the reference fix for a missing entry, the compile fix for a "
    f"failed compile or a box over 10pt {GOAL}"
)
CLAIMS = (
    f"Citation compliance: format, DOI, retractions, and each claim against the passage "
    f"read in its source's full text, unless you said no at intake {GOAL}"
)
CLAIM_STOP = (
    f"A claim the run cannot support: the check stops at the first claim not held, and the "
    f"stop is raised once the agent has ended {GOAL}"
)
REFERENCE_STOP = f"A reference that cannot be confirmed, only under strict {GOAL}"
STYLE_STOP = (
    "The citation style to confirm, when more than half the cited entries follow another "
    "style than the Citation Format row"
)
STYLE_EDGE = "a format error in most entries, in another style"
STYLE_BACK = "resumed, format only"
RESULTS = (
    f"Draft writer, resumed: the statements the result files do not bear out, as a patch "
    f"{GOAL}"
)
INCREMENTAL = (
    f"Citation compliance, resumed: the cited sentences of the patch, unless you said no "
    f"at intake {GOAL}"
)
CLOSING = f"/writing review, unless you said no at intake {GOAL}"
REPLY_STOP = "The reply to the closing review"
REPLACE_STOP = "A converted file to replace, when a converted output already stands"
FINDINGS = f"Draft writer: the findings you pick, or the autonomous pass, as a patch {GOAL}"


def paper_full_detailed() -> gf.Graph:
    nodes = (
        N(
            "I0",
            f"Phase 0 Intake agent: config.md; citation verification, the number of sources "
            f"{SOURCES}, the closing review, the claim check, the incremental checks {GOAL}",
            "stop",
        ),
        N("Q1", "you skip Phase 1, giving your own sources?", "choice"),
        *search_nodes(),
        N(
            "L1",
            "Phase 1 Literature strategist: screens your sources, searches for what they "
            "miss, unless you say your sources only",
        ),
        N("R1", "You review the sources: add or remove, optional", "stop"),
        N("O2", "Phase 2 Structure architect: outline and evidence map"),
        N("OA", "Outline approval", "stop"),
        N("A3", "Phase 3 Argument builder"),
        N(
            "W4",
            f"Phase 4 Draft writer: 4a pre-commitment, 4b main.tex whole and self-scores {GOAL}",
            "ruled",
        ),
        N(
            "V4",
            f"Visualization, when there are quantitative results: the figures, placed by "
            f"patch {GOAL}",
            "ruled_maybe",
        ),
        N("AB", "A generator phase aborted", "stop"),
        N("C5", f"Phase 5a {CLAIMS}", "ruled"),
        N("SS", STYLE_STOP, "stop"),
        N("CS", CLAIM_STOP, "stop"),
        N("SR", REFERENCE_STOP, "stop"),
        N("B5", f"Phase 5b Abstract agent, in parallel: one patch {GOAL}", "ruled"),
        N(
            "P6",
            "Phase 6 Peer reviewer, round 1: 6a scoring plan, 6b scores and verdict",
        ),
        N("UD", "The draft review does not pass", "stop"),
        N(
            "W6",
            f"Draft writer, resumed: revises, the whole draft as one patch over every block {GOAL}",
            "ruled",
        ),
        N("RS", RESULTS, "ruled_maybe"),
        N("IC", INCREMENTAL, "ruled_maybe"),
        N("P62", "Peer reviewer, resumed, round 2: the revised sections"),
        N("CK", CHECKS, "script"),
        N("FX", FIXES, "ruled_maybe"),
        N(
            "F7",
            f"Phase 7 Formatter: targets, journal formatting, cover letter, AI disclosure, "
            f"as patches {GOAL}",
            "ruled",
        ),
        N(
            "K7",
            "Final checklist: content, format, required elements, DOIs; compile errors "
            "fixed, warnings accepted",
        ),
        N("SO", REPLACE_STOP, "stop"),
        N("WG", CLOSING, "ruled_maybe"),
        N("WR", REPLY_STOP, "stop"),
        N("WA", FINDINGS, "ruled_maybe"),
        N("X7", "Output package"),
    )
    edges = (
        E("I0", "Q1"),
        E("Q1", "THS", "no, the default"),
        E("Q1", "O2", "yes"),
        *search_edges("L1", "R1"),
        E("L1", "L1", SEARCH_ROUNDS, "back"),
        E("L1", "R1"),
        E("R1", "O2"),
        E("O2", "OA"),
        E("OA", "O2", "you ask for restructuring, no cap stated", "back"),
        E("OA", "A3"),
        E("A3", "W4"),
        E("A3", "V4"),
        E("W4", "AB", "a 4a lint fails twice, or a 4b lint fails"),
        E("W4", "C5"),
        E("W4", "B5"),
        E("C5", "SS", STYLE_EDGE),
        E("SS", "C5", STYLE_BACK, "back"),
        E("C5", "CS"),
        E("C5", "SR", "under strict, a DOI or arXiv ID provably fails lookup"),
        E("C5", "RS"),
        E("RS", "P6"),
        E("C5", "P6"),
        E("B5", "P6"),
        E("V4", "P6"),
        E("P6", "AB", "a 6a lint fails twice, or a 6b lint fails"),
        E("P6", "UD", "flagged for the reviewer stage"),
        E("P6", "W6", "a revision"),
        E("W6", "IC"),
        E("IC", "P62", "round 2, the last", "dotted"),
        E("P62", "UD", "below 6.5, a Critical issue unresolved"),
        E(
            "P62",
            "CK",
            "6.5 or more, or every Critical resolved: the rest become limitations",
        ),
        E("P6", "CK", "Accept"),
        E("CK", "FX"),
        E("FX", "SR", "a failure left after the reference fix"),
        E("FX", "F7"),
        E("CK", "F7"),
        E("F7", "K7"),
        E("K7", "F7", "an item fails: fix it and check it again, no cap", "back"),
        E("F7", "SO"),
        E("K7", "WG"),
        E("WG", "WR"),
        E("WR", "WA", "the findings you name"),
        E("K7", "X7", "no /writing review"),
        E("WR", "X7", "none, or no reply"),
        E("WA", "X7"),
    )
    return _g(nodes, edges, PATCH_STOPS, WIDE_WIDTH)


def paper_revision_detailed() -> gf.Graph:
    nodes = (
        N(
            "SQ",
            f"Session asks: the closing review, the claim check, the incremental checks, the "
            f"claims not to make, the earlier papers, the result files {GOAL}",
            "stop",
        ),
        N("RP", "Peer reviewer: the comments as a revision roadmap"),
        N("AN", "Script: anchorize the draft", "script"),
        N("RW", "Draft writer: a patch per item, never a full draft"),
        N("AP", "Script: apply the patch to a new file", "script"),
        N("D1", "You decide: retry, full re-emission or abort", "stop"),
        N(
            "D2",
            "You acknowledge it, or the patch is narrowed once; structural again, you "
            "acknowledge it or end the change",
            "stop",
        ),
        N(
            "DX",
            "A revision item that needs restructuring: you choose a full re-emission or "
            "narrowed items",
            "stop",
        ),
        N("RC", f"{CLAIMS}, new references among them", "ruled"),
        N("SS", STYLE_STOP, "stop"),
        N("CS", CLAIM_STOP, "stop"),
        N("SR", REFERENCE_STOP, "stop"),
        N("RS", RESULTS, "ruled_maybe"),
        N("R2", "Peer reviewer, resumed, round 2: the re-review"),
        N("IC", INCREMENTAL, "ruled_maybe"),
        N("CK", CHECKS, "script"),
        N("FX", FIXES, "ruled_maybe"),
        N(
            "RL",
            f"Draft writer, resumed: response-letter.md beside the manuscript, when the "
            f"comments are referee comments {LETTER}",
            "ruled_maybe",
        ),
        N(
            "LC",
            f"Peer reviewer, resumed: response-letter-check.md, a verdict per point {LETTER}",
            "ruled_maybe",
        ),
        N("WG", CLOSING, "ruled_maybe"),
        N("WR", REPLY_STOP, "stop"),
        N("WA", FINDINGS, "ruled_maybe"),
        N("RX", "Revised draft, apply reports, revision log, the rest as limitations"),
    )
    edges = (
        E("SQ", "RP"),
        E("RP", "AN"),
        E("AN", "RW"),
        E("RW", "DX", "the writer's tag in place of a patch"),
        E("DX", "RW", "your choice", "back"),
        E("RW", "AP"),
        E("AP", "RW", "exit 2: the writer emits the patch once more", "back"),
        E("AP", "D1", "a second rejection"),
        E("AP", "D2", "exit 3, structural"),
        E("AP", "RC"),
        E("RC", "SS", STYLE_EDGE),
        E("SS", "RC", STYLE_BACK, "back"),
        E("RC", "CS"),
        E("RC", "SR", "under strict, a DOI or arXiv ID provably fails lookup"),
        E("RC", "RS"),
        E("RS", "R2"),
        E("RC", "R2", "round 2, the last", "dotted"),
        E("R2", "CK", "the items not resolved become limitations"),
        E("CK", "FX"),
        E("FX", "SR", "a failure left after the reference fix"),
        E("FX", "IC"),
        E("IC", "RL"),
        E("CK", "RL"),
        E("RL", "LC"),
        E("LC", "WG"),
        E("CK", "WG", "a /writing report as the comments"),
        E("WG", "WR"),
        E("WR", "WA", "the findings you name"),
        E("WR", "RX", "none, or no reply"),
        E("WA", "RX"),
    )
    return _g(nodes, edges, width=WIDE_WIDTH)


def paper_outline_only_detailed() -> gf.Graph:
    nodes = (
        N(
            "OI",
            f"Intake: citation verification, the number of sources {SOURCES}",
            "stop",
        ),
        *search_nodes(),
        N("OL", "Literature strategist"),
        N("OR", "You review the sources: add or remove, optional", "stop"),
        N("OS", "Structure architect: outline and evidence map"),
        N("OA", "Outline approval", "stop"),
        N("OX", "Outline, evidence map, word count per section"),
    )
    edges = (
        E("OI", "THS"),
        *search_edges("OL", "OR"),
        E("OL", "OL", SEARCH_ROUNDS, "back"),
        E("OL", "OR"),
        E("OR", "OS"),
        E("OS", "OA"),
        E("OA", "OS", "you ask for restructuring, no cap stated", "back"),
        E("OA", "OX"),
    )
    return _g(nodes, edges, width=WIDE_WIDTH)


def paper_abstract_only_detailed() -> gf.Graph:
    nodes = (
        N("AI", "Intake, citation verification: mark only or strict", "stop"),
        N(
            "FD",
            f"Session: grep for the file that holds the abstract, which the patch names "
            f"{GOAL}",
            "script",
        ),
        N("AB", f"Abstract agent: the abstract and keywords as one patch {GOAL}", "ruled"),
        N("AX", "Abstract and keywords"),
    )
    edges = (E("AI", "FD"), E("FD", "AB"), E("AB", "AX"))
    return _g(nodes, edges, PATCH_STOPS, WIDE_WIDTH)


def paper_citation_check_detailed() -> gf.Graph:
    nodes = (
        N(
            "CQ",
            f"Session asks: the claims not to make, the earlier papers, the result files {GOAL}",
            "stop",
        ),
        N("CK", f"Script, run by the session: lookup.py cite-keys and check-urls {GOAL}", "script"),
        N(
            "CC",
            f"Citation compliance agent, one pass: cross-check, format, DOI, retractions, "
            f"each claim against the passage read in its source's full text, and the study's "
            f"own results against the result files {GOAL}",
            "ruled",
        ),
        N("SS", STYLE_STOP, "stop"),
        N("CD", "each issue", "choice"),
        N("CA", "Corrected by patch, logged"),
        N("CH", "Flagged for your review"),
        N("CW", "Revised wording suggested"),
        N("CS", CLAIM_STOP, "stop"),
        N("SR", REFERENCE_STOP, "stop"),
        N("CR", "Removed, or kept with a note"),
        N("QC", f"Script, run by the session: quote-check of each passage {GOAL}", "script"),
        N("CX", "Citation audit report"),
    )
    edges = (
        E("CQ", "CK"),
        E("CK", "CC"),
        E("CC", "SS", STYLE_EDGE),
        E("SS", "CC", STYLE_BACK, "back"),
        E("CC", "CD"),
        E("CD", "CA", "formatting only"),
        E("CD", "CH", "right claim, wrong source"),
        E("CD", "CW", "the claim drifts from its source"),
        E("CD", "CS", "the claim is not in its source"),
        E("CD", "SR", "under strict, a DOI or arXiv ID provably fails lookup"),
        E("CD", "CR", "a retracted source"),
        E("CA", "QC"),
        E("CH", "QC"),
        E("CW", "QC"),
        E("CR", "QC"),
        E("QC", "CX"),
    )
    return _g(nodes, edges, PATCH_STOPS, WIDE_WIDTH)


def paper_disclosure_detailed() -> gf.Graph:
    nodes = (
        N("SL", "a venue or a policy anchor given?", "choice"),
        N("SA", "You name one", "stop"),
        N("VL", "venue in the policy database?", "choice"),
        N("PA", "Anchor table lookup"),
        N("VP", "Halt: you paste the venue's policy", "stop"),
        N(
            "CG",
            "Formatter: each kind of AI use marked used, not used or uncertain, from the "
            "run folders",
        ),
        N("CU", "You confirm it", "stop"),
        N("MD", "Session: the model identifier from the runner's model list"),
        N(
            "DD",
            f"Formatter: the disclosure paragraph as one patch, at the place the policy "
            f"gives {GOAL}",
            "ruled",
        ),
        N("DX", "Paragraph and placement"),
    )
    edges = (
        E("SL", "SA", "neither"),
        E("SL", "VL", "a venue"),
        E("SL", "PA", "a policy anchor"),
        E("VL", "VP", "no"),
        E("VL", "CG", "yes"),
        E("VP", "CG"),
        E("SA", "SL", "", "return"),
        E("PA", "CG"),
        E("CG", "CU", "uncertain"),
        E("CG", "MD"),
        E("CU", "MD"),
        E("MD", "DD"),
        E("DD", "DX"),
    )
    return _g(nodes, edges, PATCH_STOPS, WIDE_WIDTH)


def paper_plan_detailed() -> gf.Graph:
    nodes = (
        N("PI", "Intake: the 3-question simplified interview", "stop"),
        N(
            "S0",
            "Step 0 readiness check: materials and the research question",
        ),
        N("S1", "Step 1 thesis: INSIGHT thesis_statement"),
        N(
            "S2",
            "Step 2 chapters, six in order, at least 2 rounds each; a chapter summary "
            "after each",
        ),
        N("MQ", "The mentor's question: each answer goes to the mentor, resumed", "stop"),
        N("SA", "Structure architect: the outline from all chapter summaries"),
        N(
            "S25",
            "Step 2.5 contribution sharpening, at least 1 round; INSIGHT contribution_claim",
        ),
        N(
            "S3",
            "Step 3 stress test: socratic mentor and argument builder probe each "
            "sub-argument",
        ),
        N("X", "Chapter plan and INSIGHT collection"),
    )
    edges = (
        E("PI", "S0"),
        E("S0", "S1"),
        E("S1", "S2"),
        E("S2", "MQ"),
        E("MQ", "S2", "offers after 8 rounds on a chapter, suggests outline-only past 15 in all", "back"),
        E("S2", "SA"),
        E("SA", "S25"),
        E("S25", "S3"),
        E("S3", "X"),
    )
    return _g(nodes, edges, width=WIDE_WIDTH)


def paper_format_convert_detailed() -> gf.Graph:
    nodes = (
        N("Q", "Session asks: the targets, the format profile, the materials", "stop"),
        N("ST", "The target to settle, with the supported targets listed", "stop"),
        N(
            "PD",
            f"Script, run by the session: pandoc, a .md or a .docx to the .tex every "
            f"target is converted from {GOAL}",
            "script",
        ),
        N(
            "F",
            f"Phase 7 Formatter: citation style, venue template, format profile, as "
            f"patches; the report {GOAL}",
            "ruled",
        ),
        N(
            "F2",
            f"Formatter, resumed: the conversion patch, when the citation style changes "
            f"{GOAL}",
            "ruled_maybe",
        ),
        N(
            "CV",
            f"Script, run by the session: the patches applied, latexmk for the PDF, pandoc "
            f"for DOCX and Markdown {GOAL}",
            "script",
        ),
        N(
            "K",
            f"Script, run by the session: the headings, figures, tables and abstract "
            f"counted in each output {GOAL}",
            "script",
        ),
        N("SO", REPLACE_STOP, "stop"),
        N("X", "Formatted document"),
    )
    edges = (
        E("Q", "ST", "a target that is not supported"),
        E("ST", "F"),
        E("CV", "SO"),
        E("SO", "CV", "you confirm", "back"),
        E("Q", "PD", "a .md or a .docx"),
        E("Q", "F"),
        E("PD", "F"),
        E("F", "F2"),
        E("F", "CV"),
        E("F2", "CV"),
        E("CV", "K"),
        E("K", "X"),
    )
    return _g(nodes, edges, PATCH_STOPS, WIDE_WIDTH)


def ap_revision_coach_simple() -> gf.Graph:
    nodes = (
        N("R", "Revision coach: the referee comments"),
        N("X", "Revision roadmap, tracking template, response letter skeleton"),
    )
    return _g(nodes, (E("R", "X"),))


def ap_rebuttal_audit_simple() -> gf.Graph:
    nodes = (
        N("R", "Revision coach, parsing only: the comments and your response draft"),
        N("X", "Coverage per comment, gaps, risk flags"),
    )
    return _g(nodes, (E("R", "X"),))


def ap_response_letter_simple() -> gf.Graph:
    nodes = (
        N("W", "Step 3: the response letter, each point with its change and place"),
        N("C", "Step 4: the re-review, a verdict per point"),
    )
    return _g(nodes, (E("W", "C"),))


def ap_revision_coach_detailed() -> gf.Graph:
    nodes = (
        N("RC", "Revision coach: parse, classify, map, prioritize every comment"),
        N("RV", "You validate the parsed comments", "stop"),
        N("RM", "Revision roadmap"),
        N("RT", "Tracking template and response letter skeleton, when you ask"),
        N("RL", "Schema 11 commitment ledger, in the pipeline"),
    )
    edges = (
        E("RC", "RV"),
        E("RV", "RC", "a correction", "back"),
        E("RV", "RM"),
        E("RM", "RT"),
        E("RM", "RL"),
    )
    return _g(nodes, edges, width=WIDE_WIDTH)


def paper_revision_coach_detailed() -> gf.Graph:
    nodes = (
        N("RC", "Revision coach: parse, classify, map, prioritize every comment"),
        N("RV", "You validate the parsed comments", "stop"),
        N("RM", "Revision coach, resumed: revision roadmap"),
        N("RT", "Tracking template and response letter skeleton, when you ask"),
    )
    edges = (
        E("RC", "RV"),
        E("RV", "RC", "a correction", "back"),
        E("RV", "RM"),
        E("RM", "RT"),
    )
    return _g(nodes, edges, width=WIDE_WIDTH)


def ap_rebuttal_audit_detailed() -> gf.Graph:
    nodes = (
        N("G", "both the comments and a response draft given?", "choice"),
        N("RC", "Route to revision-coach"),
        N("RA", "Revision coach, parsing only"),
        N("X", "Coverage table, gap list, risk flags, suggestions; no Schema 11, no verified status"),
    )
    edges = (E("G", "RC", "the comments only"), E("G", "RA", "both"), E("RA", "X"))
    return _g(nodes, edges, width=WIDE_WIDTH)


def paper_rebuttal_audit_detailed() -> gf.Graph:
    nodes = (
        N("G", "both the comments and a response draft given?", "choice"),
        N("RC", "Route to revision-coach"),
        N("RA", "Revision coach, parsing only"),
        N(
            "X",
            f"rebuttal-audit.md: coverage table, gap list, risk flags, suggestions; "
            f"nothing marked verified {LETTER}",
            "ruled",
        ),
    )
    edges = (E("G", "RC", "the comments only"), E("G", "RA", "both"), E("RA", "X"))
    return _g(nodes, edges, width=WIDE_WIDTH)


def ap_response_letter_detailed() -> gf.Graph:
    nodes = (
        N("W", "Step 3: the author writes the response letter, point by point"),
        N(
            "C",
            "Step 4: re-review, completeness, consistency, truthfulness, a verdict per point",
        ),
        N("X", "Verdicts; no reassessment of the paper, no new requests"),
    )
    return _g(nodes, (E("W", "C"), E("C", "X")), width=WIDE_WIDTH)


def paper_response_letter_detailed() -> gf.Graph:
    nodes = (
        N(
            "W",
            f"Draft writer: response-letter.md beside the manuscript, in the response "
            f"template's form {LETTER}",
            "ruled",
        ),
        N(
            "C",
            f"Peer reviewer: completeness, consistency, truthfulness, a verdict per "
            f"point, response-letter-check.md {LETTER}",
            "ruled",
        ),
        N("X", "Verdicts in the final message; no manuscript file changed"),
    )
    return _g(nodes, (E("W", "C"), E("C", "X")), width=WIDE_WIDTH)


# ---------------------------------------------------------------------------------------
# The figures.

NOTE = (
    'A tag such as "[5.Q (i)]" names the part of item 3 (i) of step 5.Q\'s brief that the '
    'goal of plan 5 keeps, "[5.Q item 5]" the response letter and its check, and '
    '"[5.Q item 6]" the number of sources.'
)

SIMPLE = (
    (
        "full",
        "academic-paper 3.2.0",
        ap_full_simple,
        "Also stops for you: a draft that fails its format check twice. paper: no RAISE "
        "compliance agent and no hard gate; the claim check stops the run instead. " + APNOTE,
    ),
    ("revision", "academic-paper 3.2.0", ap_revision_simple, APNOTE),
    ("lit-review", "academic-paper 3.2.0", ap_lit_review_simple, APNOTE),
    ("outline-only", "academic-paper 3.2.0", ap_outline_only_simple, APNOTE),
    ("abstract-only", "academic-paper 3.2.0", ap_abstract_only_simple, APNOTE),
    ("citation-check", "academic-paper 3.2.0", ap_citation_check_simple, APNOTE),
    ("disclosure", "academic-paper 3.2.0", ap_disclosure_simple, APNOTE),
    (
        "plan",
        "academic-paper 3.2.0",
        ap_plan_simple,
        "academic-paper marks no stop in the dialogue rounds; paper shows each question of "
        "the mentor as a stop. " + APNOTE,
    ),
    ("format-convert", "academic-paper 3.2.0", ap_format_convert_simple, APNOTE),
    ("revision-coach", "academic-paper 3.2.0", ap_revision_coach_simple, APNOTE),
    ("rebuttal-audit", "academic-paper 3.2.0", ap_rebuttal_audit_simple, APNOTE),
    (
        "response-letter",
        "academic-pipeline",
        ap_response_letter_simple,
        "academic-paper has no such mode; its steps are steps 3 and 4 of academic-pipeline's "
        "external review protocol. " + APNOTE,
    ),
)

DETAILED = (
    (
        "full",
        "academic-paper 3.2.0",
        ap_full_detailed,
        paper_full_detailed,
        "No RAISE check and no hard gate: what the hard gate refuses is handled by the claim "
        "check and its stop. " + NOTE,
    ),
    (
        "revision",
        "academic-paper 3.2.0",
        ap_revision_detailed,
        paper_revision_detailed,
        "academic-paper: no compile and no formatter in this mode, and no intake agent. "
        + NOTE,
    ),
    (
        "lit-review",
        "academic-paper 3.2.0",
        ap_lit_review_detailed,
        paper_lit_review_detailed,
        "academic-paper: no cycle, no reference check, no manuscript changed. " + AP_NOTE,
    ),
    (
        "outline-only",
        "academic-paper 3.2.0",
        ap_outline_only_detailed,
        paper_outline_only_detailed,
        AP_NOTE + " " + NOTE,
    ),
    (
        "abstract-only",
        "academic-paper 3.2.0",
        ap_abstract_only_detailed,
        paper_abstract_only_detailed,
        "academic-paper: no cycle. " + NOTE,
    ),
    (
        "citation-check",
        "academic-paper 3.2.0",
        ap_citation_check_detailed,
        paper_citation_check_detailed,
        "academic-paper: one pass, no intake agent. " + NOTE,
    ),
    (
        "disclosure",
        "academic-paper 3.2.0",
        ap_disclosure_detailed,
        paper_disclosure_detailed,
        "The mode table lists agent 9, the formatter, which writes the statement in both. "
        + NOTE,
    ),
    (
        "plan",
        "academic-paper 3.2.0",
        ap_plan_detailed,
        paper_plan_detailed,
        "academic-paper: the dialogue rounds are no stops. paper: the session shows each "
        "question of the mentor and gives it your answer. " + NOTE,
    ),
    (
        "format-convert",
        "academic-paper 3.2.0",
        ap_format_convert_detailed,
        paper_format_convert_detailed,
        "academic-paper: the formatter converts and compiles itself, with a hard gate on "
        "provenance markers. paper: the formatter writes patches and a report, and the "
        "session converts and counts. " + NOTE,
    ),
    (
        "revision-coach",
        "academic-paper 3.2.0",
        ap_revision_coach_detailed,
        paper_revision_coach_detailed,
        NOTE,
    ),
    (
        "rebuttal-audit",
        "academic-paper 3.2.0",
        ap_rebuttal_audit_detailed,
        paper_rebuttal_audit_detailed,
        NOTE,
    ),
    (
        "response-letter",
        "academic-pipeline",
        ap_response_letter_detailed,
        paper_response_letter_detailed,
        "academic-paper has no such mode. " + NOTE,
    ),
)


def figures() -> tuple[tuple[str, str], ...]:
    """Every figure of this script, as the file name and its body."""
    paper_simple = dict(gf.PAPER_MODES)
    out: list[tuple[str, str]] = []
    for mode, caption, ap_build, note in SIMPLE:
        panels = [
            gf.Panel(caption, ap_build()),
            gf.Panel("paper", gf.with_mode_stop(paper_simple[mode]())),
        ]
        out.append(
            (
                f"{mode}-simple.svg",
                gf.compose(
                    f"{mode}-simple.svg",
                    gf.describe(f"The {mode} mode, simple view", panels),
                    panels,
                    gf.SIMPLE_LEGEND,
                    note,
                ),
            )
        )
    for mode, caption, ap_build, paper_build, note in DETAILED:
        panels = [
            gf.Panel(caption, ap_build()),
            gf.Panel("paper, as built", gf.with_mode_stop(paper_build())),
        ]
        out.append(
            (
                f"{mode}-detailed.svg",
                gf.compose(
                    f"{mode}-detailed.svg",
                    gf.describe(f"The {mode} mode, detailed view", panels),
                    panels,
                    detailed_legend(panels),
                    note,
                ),
            )
        )
    out.append(("academic-pipeline.svg", pipeline_figure()))
    return tuple(out)


def main() -> int:
    try:
        lines = gf.write_figures(HERE, figures())
    except gf.FigureError as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    for line in lines:
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main())
