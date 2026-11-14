"""Write the figures that set the paper skill beside academic-paper 3.2.0.

Imports the layout code of ../gen_figures.py, found from this file's own location. The import
writes a __pycache__ folder beside gen_figures.py, which git ignores.

Writes, beside this file, 20 figures:

- <mode>-simple.svg and <mode>-detailed.svg for each of the nine modes full, revision,
  lit-review, outline-only, abstract-only, citation-check, disclosure, plan and format-convert:
  academic-paper 3.2.0 on the left and paper on the right. The simple view draws the agent starts, the stops and the
  cycles. The detailed view draws every step, script and stop, with grey boxes for scripts and
  indigo boxes tagged with the ruling that makes paper differ from academic-paper.
- academic-paper-only-modes.svg: the two modes academic-paper has and paper does not, each
  with the box that takes its place, drawn dashed when it is not built yet.
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
    "Scripts and the session's own steps are left out. Not drawn because they are the same in "
    "every mode of paper: at every agent start, a model other than the configured one stops "
    "the run (D47); at every patch, a structural patch, a patch that does not apply or a "
    "failed script stops it (a ruling of plan 5)."
)

DETAILED_LEGEND = (
    L("stop", "Orange box: the run stops for you"),
    L("dotted", "Dotted arrow: a cycle back, with its cap"),
    L("script", "Grey box: a script"),
    L("agent", "Plain box, no tag: as academic-paper does it"),
    L(
        "ruled",
        'Indigo box, with a tag such as "[D44]" or "[K]": differs from academic-paper by the '
        "ruling of plan 5 that the tag names",
    ),
    L("choice", "Rounded box: a decision the run takes"),
)

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
        E("L", "L", "search passes, up to 4", "back"),
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
        E("P", "SD", "Reject, or a Critical issue after round 2"),
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
        E("L", "L", "search passes, up to 4", "back"),
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
        E("L", "L", "search passes, up to 4", "back"),
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


def paper_full_detailed() -> gf.Graph:
    nodes = (
        N(
            "I",
            "Intake: config.md, the interview [D24]; skip the search? DOI checking [O], "
            "venue policy [W], claims not to make [AI2], main.tex to replace [AD4], a "
            "file in words [AQ], research report, question, type [AV1, AV3, AV15]",
            "stop",
        ),
        N("Q", "you skip the search? [J]", "ruled"),
        N(
            "LS",
            "Literature strategist: screens your sources, searches for what they miss; a "
            "list over 50 entries shows its first 20 and last 5 [J, AV16]",
            "ruled",
        ),
        N("SR", "You review the sources: add or remove, optional [J]", "stop"),
        N(
            "PL",
            "Planner: outline and evidence map, argument map; one role for structure "
            "architect and argument builder [D43]; the structure checked against the "
            "question and the materials [AV18]",
            "ruled",
        ),
        N(
            "LG",
            "Literature strategist, resumed: the sections that need literature and have no "
            "source [AD1]",
            "ruled",
        ),
        N("PG", "Planner again: assigns what was found [AD1]", "ruled"),
        N("OA", "Outline approval", "stop"),
        N(
            "SO",
            "Planner: asks what is wrong with the structure, writes 2 alternatives; your "
            "own structure is followed as user-customized [AD2]",
            "ruled",
        ),
        N(
            "DW",
            "Draft writer: first draft, abstract, keywords, six statements, figure places "
            "[S], the disclosure names the model [N], claims list, cover letter [AV7, "
            "AV8], no self-scores [D43, D45], prose standard [AJ, AW]",
            "ruled",
        ),
        N(
            "DM",
            "Draft writer once more: the model identifier, when the list gave none [N]",
            "ruled",
        ),
        N(
            "VZ",
            "Visualization, when the materials hold data, beside the writer [D43]: figures "
            "and their LaTeX, placed as its own patch [S]",
            "ruled",
        ),
        N("SC", "Script: cite-keys, check-urls [AF]", "script"),
        N(
            "CA",
            "Citation compliance agent, after the draft and before round 1: reads each "
            "cited source, checks the claims not to make, lists the claims off the list of "
            "intended claims [AF, AI2, AV7]",
            "ruled",
        ),
        N("S2", "A claim the run cannot support [AF]", "stop"),
        N(
            "ST",
            "The citation style to confirm: more than half the entries fail the same "
            "check [AV14]",
            "stop",
        ),
        N("QC", "Script: cite-keys, check-urls, quote-check [AF]", "script"),
        N("CA2", "Citation compliance agent again, fresh, once [AF]", "ruled"),
        N(
            "R1",
            "Peer reviewer, round 1: fixed criteria, no scoring plan, reads the citation "
            "report [D45, AF]",
            "ruled",
        ),
        N(
            "NP",
            "The draft review does not pass: accept, an expanded revision by root cause, "
            "revise by hand and resubmit, lower the venue, or end [AD3, AV4]",
            "stop",
        ),
        N("W1", "Draft writer: round 1 issues, a patch [C]", "ruled"),
        N("R2", "Peer reviewer, round 2 [D45]", "ruled"),
        N("RC", "Script: reference checks", "script"),
        N("RF", "Draft writer: reference-fix, once [K]", "ruled"),
        N(
            "RC2",
            "Script: reference checks again, failures left named [K]",
            "script",
        ),
        N("SS", "A reference that cannot be confirmed [O]", "stop"),
        N(
            "CP",
            "Session: compile in a copy, no formatter; the engine is the first that "
            "applies of a % !TEX program line, the class table, the venue's template, "
            "XeLaTeX [M, AV11] [4.A R2-6]",
            "ruled",
        ),
        N("CF", "Draft writer: compile-fix, once [M]", "ruled"),
        N("CP2", "Session: compile once more, the rest named [M]", "ruled"),
        N("WR", "/writing review: 4 agents [D46]", "ruled"),
        N(
            "FM",
            "End: the final message with the numbered report, the sources only a preprint "
            "server or no index matched, and a verdict that was not Accept [D46, AG]",
            "ruled",
        ),
        N(
            "WA",
            "Draft writer: applies the findings, then the compile again [D46]",
            "ruled",
        ),
        N(
            "AC",
            "Draft writer: the anonymous copy, when the venue is double-blind [AV9]",
            "ruled",
        ),
    )
    floating = (
        N(
            "PS",
            "At every patch: a structural patch, a patch that does not apply, a script "
            "failed [C]",
            "stop",
        ),
        N(
            "MS",
            "At every agent start: a model other than the configured one [D47]",
            "stop",
        ),
    )
    edges = (
        E("I", "I", "you change it, until you confirm [R]", "back"),
        E("I", "Q"),
        E("Q", "LS", "no, the default"),
        E("Q", "PL", "yes"),
        E("LS", "SR"),
        E("SR", "PL"),
        E("PL", "LG", "a section has no source [AD1]"),
        E("PL", "OA"),
        E("LG", "PG"),
        E("PG", "OA"),
        E("OA", "PL", "you ask for changes, until you approve [R]", "back"),
        E("OA", "SO", "you disagree with the structure [AD2]"),
        E("SO", "OA", "your choice", "back"),
        E("OA", "DW"),
        E("OA", "VZ"),
        E("DW", "SC"),
        E("DW", "DM", "the list gave none [N]"),
        E("DM", "SC"),
        E("VZ", "SC"),
        E("SC", "CA"),
        E("CA", "S2", "a claim the source does not hold [AF]"),
        E(
            "CA",
            "SS",
            "no lookup confirms a reference, or under strict a DOI fails [O]",
        ),
        E("CA", "ST", "a systematic format error [AV14]"),
        E("ST", "CA", "a fresh start with the confirmed style, once", "back"),
        E("CA", "QC"),
        E("QC", "CA2", "a failure"),
        E("CA2", "R1"),
        E("QC", "R1"),
        E(
            "NP",
            "PL",
            "an expanded revision, back to the step the cause names, no cap [AD3]",
            "back",
        ),
        E("NP", "R1", "lower the venue: a new review, no cap [AV4]", "back"),
        E("R1", "NP", "Reject"),
        E("R1", "W1", "Minor or Major"),
        E("W1", "R2", "round 2, the last", "dotted"),
        E("R2", "NP", "a Critical issue unresolved"),
        E("R2", "RC", "otherwise: the rest become limitations [U]"),
        E("R1", "RC", "Accept"),
        E("RC", "RF", "a failure"),
        E("RF", "RC2"),
        E("RC2", "SS", "strict: a reference still fails [O]"),
        E("RC", "CP"),
        E("RC2", "CP"),
        E("CP", "CF", "fails, or a layout fault [M]"),
        E("CF", "CP2"),
        E("CP", "WR"),
        E("CP2", "WR"),
        E("WR", "FM"),
        E(
            "FM",
            "WA",
            "your one-line reply, up to 3 answers [R], or an autonomous pass [D46]",
        ),
        E("FM", "AC", "a double-blind venue [AV9]"),
        E("WA", "AC"),
    )
    return _g(nodes, edges, floating, WIDE_WIDTH)


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


def paper_revision_detailed() -> gf.Graph:
    nodes = (
        N(
            "I",
            "Intake: config.md, the run's permissions, DOI checking, the instructions "
            "[D24, Stops of paper, O, AA], the claims not to make [AI2], a file given in "
            "words [AQ], the evidence profile [AV2]",
            "stop",
        ),
        N("IT", "Peer reviewer: the instructions as items.md"),
        N(
            "RV",
            "Peer reviewer: reviews the manuscript with full mode's draft-review criteria, "
            "its issues as items.md [AA]",
            "ruled",
        ),
        N("IA", "You approve the items: drop or add, no patch before [AA]", "stop"),
        N("LS", "Literature strategist: a .bib patch [Stops of paper]", "ruled"),
        N(
            "VZ",
            "Visualization, within the permission; the script files it changes outside the "
            "run folder are hashed before and after [Stops of paper]",
            "ruled",
        ),
        N("AN", "Script: anchorize the files", "script"),
        N(
            "DW",
            "Draft writer: a patch per item, a revision log with its statuses [AD6]",
            "ruled",
        ),
        N("AP", "Script: apply the patch", "script"),
        N("D1", "A patch that does not apply", "stop"),
        N("D2", "A structural patch", "stop"),
        N(
            "CA",
            "Citation compliance agent, after the patches: reads each cited source, checks "
            "the claims not to make, lists the claims off the list of intended claims "
            "[AF, AI2, AV7]",
            "ruled",
        ),
        N("S2", "A claim the run cannot support [AF]", "stop"),
        N(
            "ST",
            "The citation style to confirm: more than half the entries fail the same "
            "check [AV14]",
            "stop",
        ),
        N(
            "SC",
            "Script: cite-keys, check-urls, quote-check, failures are items of reading 1 "
            "[D49, K, AF]",
            "ruled",
        ),
        N("CA2", "Citation compliance agent again, fresh, once [AF]", "ruled"),
        N(
            "RD1",
            "Peer reviewer: reading 1, reads the citation report [D49, AF]",
            "ruled",
        ),
        N("W2", "Draft writer: the one pass [D49]", "ruled"),
        N(
            "SC2",
            "Script: reference checks, failures are items of reading 2 [K]",
            "ruled",
        ),
        N("RD2", "Peer reviewer: reading 2 [D49]", "ruled"),
        N("RF", "Draft writer: reference-fix, once [K]", "ruled"),
        N(
            "RC3",
            "Script: reference checks again, failures left named [K]",
            "script",
        ),
        N("SS", "A reference that cannot be confirmed [O]", "stop"),
        N(
            "CP",
            "Session: compile in a copy; the engine is the first that applies of a "
            "% !TEX program line, the class table, the venue's template, XeLaTeX "
            "[D46, AV11] [4.A R2-6]",
            "ruled",
        ),
        N("CF", "Draft writer: compile-fix, once [M]", "ruled"),
        N("CP2", "Session: compile once more, the rest named [M]", "ruled"),
        N("WR", "/writing review: 4 agents [D46]", "ruled"),
        N(
            "FM",
            "End: the final message with the numbered report, the sources only a preprint "
            "server or no index matched, and the files the figure script changed [D46, AG]",
            "ruled",
        ),
        N(
            "WA",
            "Draft writer: applies the findings, then the compile again [D46]",
            "ruled",
        ),
        N(
            "AC",
            "Draft writer: the anonymous copy, when the venue is double-blind [AV9]",
            "ruled",
        ),
    )
    floating = (
        N("PS", "At every patch: a script failed", "stop"),
        N(
            "MS",
            "At every agent start: a model other than the configured one [D47]",
            "stop",
        ),
    )
    edges = (
        E("I", "I", "you change it, until you confirm [R]", "back"),
        E("I", "IT", "a comments file or text"),
        E("I", "RV", "no instructions [AA]"),
        E("RV", "IA"),
        E("IA", "AN"),
        E("IA", "LS", "an item needs a new reference, intake allows it"),
        E("IA", "VZ", "an item needs a figure change, intake allows it"),
        E("IT", "LS", "an item needs a new reference, intake allows it"),
        E("IT", "VZ", "an item needs a figure change, intake allows it"),
        E("IT", "AN"),
        E("LS", "AN"),
        E("VZ", "AN"),
        E("AN", "DW"),
        E("DW", "AP"),
        E("AP", "DW", "rejected: the writer emits the patch once more", "back"),
        E("AP", "D1", "a second rejection"),
        E("AP", "D2", "exit 3, structural"),
        E("AP", "CA"),
        E("CA", "S2", "a claim the source does not hold [AF]"),
        E(
            "CA",
            "SS",
            "no lookup confirms a reference, or under strict a DOI fails [O]",
        ),
        E("CA", "ST", "a systematic format error [AV14]"),
        E("ST", "CA", "a fresh start with the confirmed style, once", "back"),
        E("CA", "SC"),
        E("SC", "CA2", "a failure"),
        E("CA2", "RD1"),
        E("SC", "RD1"),
        E("RD1", "W2", "items not resolved"),
        E("W2", "SC2"),
        E("SC2", "RD2", "reading 2, the last", "dotted"),
        E("RD1", "CP", "all resolved"),
        E("RD2", "CP", "items left become limitations"),
        E("RD2", "RF", "a reference still failing"),
        E("RF", "RC3"),
        E("RC3", "SS", "strict: a reference still fails [O]"),
        E("RC3", "CP"),
        E("CP", "CF", "fails, or a layout fault [M]"),
        E("CF", "CP2"),
        E("CP", "WR"),
        E("CP2", "WR"),
        E("WR", "FM"),
        E(
            "FM",
            "WA",
            "your one-line reply, up to 3 answers [R], or an autonomous pass [D46]",
        ),
        E("FM", "AC", "a double-blind venue [AV9]"),
        E("WA", "AC"),
    )
    return _g(nodes, edges, floating, WIDE_WIDTH)


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
            "Intake: config.md, DOI checking, the research question the run needs [D24, O, "
            "AD11, AV15]; a research report and its bibliography [AV1]; the profile [AV2]; a "
            "file in words [AQ]",
            "stop",
        ),
        N(
            "LS",
            "Literature strategist, once: review.md, refs.bib, a .bib patch when a .tex is "
            "given; a list over 50 entries shows its first 20 and last 5; it does not start "
            "without a research question [D48, D2, AD11, AV15, AV16]",
            "ruled",
        ),
        N("SR", "You review the sources: add or remove, optional [J]", "stop"),
        N("AP", "Script: apply the .bib patch [D48]", "script"),
        N("RC", "Script: reference checks [D48]", "script"),
        N("RF", "Draft writer: reference-fix, once [K]", "ruled"),
        N(
            "RC2",
            "Script: reference checks again, failures left named [K]",
            "script",
        ),
        N("SS", "A reference that cannot be confirmed [O]", "stop"),
        N("X", "End"),
    )
    floating = (
        N(
            "PS",
            "At every patch: a structural patch, a patch that does not apply, a script "
            "failed [C]",
            "stop",
        ),
        N(
            "MS",
            "At every agent start: a model other than the configured one [D47]",
            "stop",
        ),
    )
    edges = (
        E("I", "I", "you change it, until you confirm [R]", "back"),
        E("I", "LS"),
        E("LS", "SR"),
        E("SR", "X", "no .tex"),
        E("SR", "AP", ".tex given"),
        E("AP", "RC"),
        E("RC", "RF", "a failure"),
        E("RF", "RC2"),
        E("RC2", "SS", "strict: a reference still fails [O]"),
        E("RC", "X"),
        E("RC2", "X"),
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


def paper_outline_only_detailed() -> gf.Graph:
    nodes = (
        N(
            "I",
            "Intake: config.md [D24]; the research question in full, a research report and "
            "its bibliography read [AV1, AV15], the type by the selection table [AV3]; a "
            "file given in words found by search [AQ]",
            "stop",
        ),
        N(
            "LS",
            "Literature strategist, always; it does not start without a research question "
            "[J, AV15]",
            "ruled",
        ),
        N("SR", "You review the sources: add or remove, optional [J]", "stop"),
        N(
            "PL",
            "Planner: outline and evidence map, argument map with its weak-argument signs "
            "[D43, T]; the structure checked against the question and the materials [AV18]",
            "ruled",
        ),
        N(
            "LG",
            "Literature strategist, resumed: the sections that need literature and have no "
            "source [AD1]",
            "ruled",
        ),
        N("PG", "Planner again: assigns what was found [AD1]", "ruled"),
        N("OA", "Outline approval", "stop"),
        N(
            "SO",
            "Planner: asks what is wrong with the structure, writes 2 alternatives; your "
            "own structure is followed as user-customized [AD2]",
            "ruled",
        ),
        N("X", "Outline, evidence map and argument map [T]", "ruled"),
    )
    floating = (
        N(
            "MS",
            "At every agent start: a model other than the configured one [D47]",
            "stop",
        ),
    )
    edges = (
        E("I", "I", "you change it, until you confirm [R]", "back"),
        E("I", "LS"),
        E("LS", "SR"),
        E("SR", "PL"),
        E("PL", "LG", "a section has no source [AD1]"),
        E("PL", "OA"),
        E("LG", "PG"),
        E("PG", "OA"),
        E("OA", "PL", "you ask for changes, until you approve [R]", "back"),
        E("OA", "SO", "you disagree with the structure [AD2]"),
        E("SO", "OA", "your choice", "back"),
        E("OA", "X"),
    )
    return _g(nodes, edges, floating, WIDE_WIDTH)


def ap_abstract_only_detailed() -> gf.Graph:
    nodes = (
        N("AI", "Intake, citation verification: mark only or strict", "stop"),
        N("AB", "Abstract agent"),
        N("AX", "Abstract and keywords"),
    )
    return _g(nodes, (E("AI", "AB"), E("AB", "AX")), width=WIDE_WIDTH)


def paper_abstract_only_detailed() -> gf.Graph:
    nodes = (
        N(
            "I",
            "Intake: config.md, the paper type, the language and the claims not to make "
            "[D24, AD12, AI2]; a file given in words found by search [AQ]",
            "stop",
        ),
        N(
            "FD",
            "Session: grep for the file that holds the abstract environment, since the "
            "patch must name that file [C]",
            "script",
        ),
        N(
            "DW",
            "Draft writer, in place of the abstract agent: abstract and keywords, one "
            "patch, its parts and lengths by paper type, its own text checked against the "
            "prose standard [T, AJ, AV18]",
            "ruled",
        ),
        N("X", "Abstract and keywords"),
    )
    floating = (
        N(
            "PS",
            "At every patch: a structural patch, a patch that does not apply, a script "
            "failed [C]",
            "stop",
        ),
        N(
            "MS",
            "At every agent start: a model other than the configured one [D47]",
            "stop",
        ),
    )
    edges = (
        E("I", "I", "you change it, until you confirm [R]", "back"),
        E("I", "FD"),
        E("FD", "DW"),
        E("DW", "X"),
    )
    return _g(nodes, edges, floating, WIDE_WIDTH)


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


def paper_citation_check_detailed() -> gf.Graph:
    nodes = (
        N(
            "I",
            "Intake: config.md, DOI checking strict or mark only [D24, O], the authors' "
            "earlier papers [AD8], the claims not to make [AI2]; a file given in words "
            "found by search [AQ]",
            "stop",
        ),
        N("SC", "Script: cite-keys, check-urls [D15, D17]", "script"),
        N(
            "CC",
            "Citation compliance agent: fetches each source and reads the passage each "
            "claim cites [D50, D22]; retraction notices from lookup.py [AD7]; clinical "
            "rows [AH]; versions of one work [AK]; claims list [AV7]",
            "ruled",
        ),
        N(
            "EP",
            "Passages that closely repeat an earlier paper: reuse of results is flagged, a "
            "plagiarism tool is suggested [AD8]",
            "ruled",
        ),
        N("CD", "each issue", "choice"),
        N("CA", "Corrected by a patch, logged"),
        N("CH", "Flagged for your review"),
        N("CW", "Revised wording suggested, no patch"),
        N("S2", "A claim the run cannot support", "stop"),
        N(
            "CR",
            "Replaced by a candidate whose passage holds the claim, as a patch; flagged for "
            "you when none does [X]",
            "ruled",
        ),
        N("S1", "A reference that cannot be confirmed", "stop"),
        N(
            "ST",
            "The citation style to confirm: more than half the entries fail the same "
            "check [AV14]",
            "stop",
        ),
        N("RC", "Script: cite-keys, check-urls, quote-check [D50, D22]", "script"),
        N("CC2", "Citation compliance agent again, fresh, once [L]", "ruled"),
        N("RC2", "Script: the three checks again, failures left named [L]", "script"),
        N("X", "Citation report, checks.md"),
    )
    floating = (
        N(
            "PS",
            "At every patch: a structural patch, a patch that does not apply, a script "
            "failed [C]",
            "stop",
        ),
        N(
            "MS",
            "At every agent start: a model other than the configured one [D47]",
            "stop",
        ),
    )
    edges = (
        E("I", "I", "you change it, until you confirm [R]", "back"),
        E("I", "SC"),
        E("SC", "CC"),
        E("CC", "CD"),
        E("CD", "CA", "formatting, one right answer"),
        E("CD", "CH", "right claim, wrong source"),
        E("CD", "CW", "the claim drifts from its source"),
        E(
            "CD",
            "S2",
            "the claim is not in its source, or the source cannot be read [D22]",
        ),
        E("CD", "CR", "a retracted source"),
        E("CD", "EP", "a passage repeats an earlier paper [AD8]"),
        E("CD", "ST", "a systematic format error [AV14]"),
        E("ST", "CC", "a fresh start with the confirmed style, once", "back"),
        E(
            "CD",
            "S1",
            "no lookup confirms a reference, or under strict a DOI fails [O]",
        ),
        E("CA", "RC"),
        E("CH", "RC"),
        E("CW", "RC"),
        E("CR", "RC"),
        E("EP", "RC"),
        E("RC", "CC2", "a failure"),
        E("CC2", "RC2"),
        E("RC", "X"),
        E("RC2", "X"),
    )
    return _g(nodes, edges, floating, WIDE_WIDTH)


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


def paper_disclosure_detailed() -> gf.Graph:
    nodes = (
        N(
            "I",
            "Intake: config.md, the venue or the policy anchor [AV12], the kinds of AI "
            "use the records of earlier runs leave uncertain, each other kind "
            "pre-marked; you confirm [D24, AD10]; a file in words [AQ]",
            "stop",
        ),
        N("VL", "the venue listed?", "choice"),
        N(
            "MI",
            "Session: the model the alias claude:opus points to today, such as "
            "claude-opus-5-5, or the model the first agent was served when the list gives "
            "none [N]",
            "ruled",
        ),
        N(
            "DW",
            "Draft writer: the statements as a patch, disclosure.md; the disclosure names "
            "that model [D43, D47]",
            "ruled",
        ),
        N(
            "DW2",
            "Draft writer once more: the model identifier, when the list gave none [N]",
            "ruled",
        ),
        N("X", "Statements and placement"),
    )
    floating = (
        N(
            "PS",
            "At every patch: a structural patch, a patch that does not apply, a script "
            "failed [C]",
            "stop",
        ),
        N(
            "MS",
            "At every agent start: a model other than the configured one [D47]",
            "stop",
        ),
    )
    edges = (
        E("I", "I", "you change it, until you confirm [R]", "back"),
        E("I", "VL"),
        E("VL", "MI", "yes"),
        E("VL", "MI", "not listed: you paste its policy, at intake [W]"),
        E("VL", "MI", "no venue yet: the generic statement [W]"),
        E("MI", "DW"),
        E("DW", "DW2", "the list gave none [N]"),
        E("DW", "X"),
        E("DW2", "X"),
    )
    return _g(nodes, edges, floating, WIDE_WIDTH)


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


def paper_plan_detailed() -> gf.Graph:
    nodes = (
        N(
            "I",
            "Intake: config.md [D24]; the plan-mode interview of the topic, the materials in "
            "hand and the structure preference",
            "stop",
        ),
        N(
            "M",
            "Socratic mentor, started once and resumed with each answer; Step 0 refers a "
            "missing foundation to /paper lit-review and idea [4.A D5]; checkpoint.md "
            "after each round [AY]",
            "ruled",
        ),
        N(
            "Q",
            "The mentor's question: each round is a stop; its offers are to skip a "
            "chapter, switch to outline-only or pause [4.A D1]",
            "stop",
        ),
        N(
            "P1",
            "Planner, a fresh start when the mentor ends with next: outline; the outline "
            "and the argument map from the chapter summaries [AY] [4.A D16]",
            "ruled",
        ),
        N(
            "S",
            "Socratic mentor, Step 2.5: contribution sharpening, three questions on the "
            "chapter summaries, one round or more [4.A R2-7]",
            "ruled",
        ),
        N(
            "PE",
            "Planner, a fresh start for each answer: sub-arguments rated Strong, "
            "Moderate or Weak into stress-test.md [4.A D6]",
            "ruled",
        ),
        N(
            "P2",
            "Planner, a fresh start: chapter-plan.md with the plan-to-draft gate [4.A D6]",
            "ruled",
        ),
        N(
            "H",
            "The plan's handoff: the mentor's message and its cross-chapter observation "
            "beside the chapter plan; full mode only when the gate holds [4.A D3] "
            "[4.A R2-27]",
            "stop",
        ),
        N("X", "Chapter plan and INSIGHT collection"),
    )
    floating = (
        N(
            "MS",
            "At every agent start: a model other than the configured one [D47]",
            "stop",
        ),
    )
    edges = (
        E("I", "I", "you change it, until you confirm [R]", "back"),
        E("I", "M"),
        E("M", "Q"),
        E(
            "Q",
            "M",
            "your answer; over 8 rounds on a chapter or 30 in all: the offers",
            "back",
        ),
        E("M", "P1", "the last chapter summary is written"),
        E("P1", "S", "you confirm that summary"),
        E("S", "Q", "its questions to you", "back"),
        E("Q", "PE", "your answer to a stress-test question"),
        E("PE", "M", "the rating goes to the mentor", "back"),
        E(
            "M",
            "P2",
            "every sub-argument is Moderate or above, or you end it",
        ),
        E("P2", "H"),
        E("H", "M", "a condition of the gate is not met", "back"),
        E("H", "X"),
    )
    return _g(nodes, edges, floating, WIDE_WIDTH)


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


def paper_format_convert_detailed() -> gf.Graph:
    nodes = (
        N(
            "I",
            "Intake: config.md [D24]; the targets, the citation style, the venue and its "
            "limits, the format profile, the cover letter; a .md, .docx or .bib found by "
            "search [AQ] [4.A R2-20]",
            "stop",
        ),
        N(
            "PC",
            "Session: pandoc makes the .tex of a .md or .docx in the manuscript's folder "
            "with a relative media folder, never over a file; a .docx reaches no PDF "
            "[4.A D10] [4.A R1-21]",
            "script",
        ),
        N(
            "CP",
            "Session: copies the folder to convert/ before any patch; when the citation "
            "style stays, compiles it for the numbers of references and citations, "
            "whether or not the .tex names a .bib [4.A R1-23] [4.A R2-1]",
            "script",
        ),
        N(
            "F",
            "Formatter, first start: the format-convert patch, and the format-convert-copy "
            "patch too when the style stays; format-report.md, refs.bib, the cover "
            "letter [AY] [4.A R1-23] [4.A R2-9] [4.A R2-33]",
            "ruled",
        ),
        N(
            "G",
            "Formatter, same start: a missing required element gets a placeholder in the "
            ".tex, a missing DOI only a line in the report; the AI disclosure stays with "
            "the draft writer [AD9] [4.A R1-8]",
            "ruled",
        ),
        N(
            "AP",
            "Session: applies the format-convert patches to the manuscript only for "
            "latex, another citation style or a venue, else to pdf/; then cite-keys and "
            "check-urls [C] [4.A R1-26]",
            "script",
        ),
        N(
            "F2",
            "A change of the citation style with a DOCX or Markdown target: the session "
            "applies the patch to convert/ and compiles it, and the formatter starts "
            "again as a fresh agent for the conversion patch in the new style "
            "[4.A R2-9]",
            "ruled",
        ),
        N(
            "PD",
            "Session: latexmk makes the PDF in pdf/ and copies it beside the .tex [AY]",
            "script",
        ),
        N(
            "CV",
            "Session: applies the copy patches to convert/ and draws each figure to a "
            "PNG, kept beside the Markdown [4.A R1-22] [4.A R2-8]",
            "script",
        ),
        N(
            "RD",
            "Session: reference_docx.py writes the reference .docx when none is held, "
            "pandoc makes DOCX and Markdown with -s [4.A R1-24] [4.A R2-12]",
            "script",
        ),
        N(
            "CK",
            "Session: the counts of headings, figures, tables, rows, columns, cite "
            "commands, entries and words of each output, no threshold [4.A item 6] "
            "[4.A R2-21] [4.A R2-23]",
            "script",
        ),
        N(
            "CQ",
            "Session: the figure paths and the abstract's first words [4.A item 6] "
            "[4.A R2-23]",
            "script",
        ),
        N(
            "CR",
            "Session: appends the commands it ran to format-report.md [4.A R2-26]",
            "script",
        ),
        N("X", "Formatted documents and the report"),
    )
    floating = (
        N(
            "BL",
            "A .bib given: no formatter and none of the steps above; latex and bibtex "
            "with the style's .bst, or a CSL file, make its reference list as "
            "<name>-<style>.md and .docx [4.A R2-20]",
            "script",
        ),
        N(
            "PS",
            "At every patch: a structural patch, a patch that does not apply, a script "
            "failed [C]",
            "stop",
        ),
        N(
            "MS",
            "At every agent start: a model other than the configured one [D47]",
            "stop",
        ),
    )
    edges = (
        E("I", "I", "you change it, until you confirm [R]", "back"),
        E("I", "PC"),
        E("PC", "CP"),
        E("CP", "F"),
        E("F", "G"),
        E("G", "AP"),
        E("AP", "F2"),
        E("F2", "PD"),
        E("PD", "CV"),
        E("CV", "RD"),
        E("RD", "CK"),
        E("CK", "CQ"),
        E("CQ", "CR"),
        E("CR", "X"),
    )
    return _g(nodes, edges, floating, WIDE_WIDTH)


# ---------------------------------------------------------------------------------------
# The modes of academic-paper that paper does not have, and academic-pipeline.


class Pair(NamedTuple):
    """A mode of academic-paper and what takes its place in Ordo, as two panels."""

    left: gf.Panel
    right: gf.Panel


def only_modes() -> tuple[Pair, ...]:
    def todo(label: str) -> gf.Graph:
        return _g((N("P", label, "todo"),), ())

    coach = _g(
        (
            N("R", "Revision coach: the referee comments"),
            N("X", "Revision roadmap, tracking template, response letter skeleton"),
        ),
        (E("R", "X"),),
    )
    audit = _g(
        (
            N(
                "R",
                "Revision coach, parsing only: the comments and your response draft",
            ),
            N("X", "Coverage per comment, gaps, risk flags"),
        ),
        (E("R", "X"),),
    )
    return (
        Pair(
            gf.Panel("academic-paper revision-coach", coach),
            gf.Panel("Ordo", todo("rebuttal, entry 7")),
        ),
        Pair(
            gf.Panel("academic-paper rebuttal-audit", audit),
            gf.Panel("Ordo", todo("rebuttal, entry 7")),
        ),
    )


ONLY_NOTE = (
    "Plan mode and format conversion are built in paper, as its plan and format-convert modes. "
    "The two modes drawn here, revision-coach and rebuttal-audit, are the rebuttal skill's, "
    "roadmap entry 7."
)


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
# The figures.

SIMPLE = (
    (
        "full",
        ap_full_simple,
        "Also stops for you: a draft that fails its format check twice, and a claim not in "
        "its source. " + APNOTE,
    ),
    ("revision", ap_revision_simple, APNOTE),
    ("lit-review", ap_lit_review_simple, APNOTE),
    ("outline-only", ap_outline_only_simple, APNOTE),
    ("abstract-only", ap_abstract_only_simple, APNOTE),
    ("citation-check", ap_citation_check_simple, APNOTE),
    ("disclosure", ap_disclosure_simple, APNOTE),
    (
        "plan",
        ap_plan_simple,
        "academic-paper marks no stop in the dialogue rounds. " + APNOTE,
    ),
    ("format-convert", ap_format_convert_simple, APNOTE),
)

DETAILED = (
    (
        "full",
        ap_full_detailed,
        paper_full_detailed,
        (
            "No RAISE check (V) and no hard gate: what the hard gate refuses is handled by K and "
            "O. academic-paper's conversion to DOCX and Markdown is paper's format-convert mode "
            '(D3, D25). "[4.A R2-6]" is a ruling of step 4.A\'s second repair round.'
        ),
    ),
    (
        "revision",
        ap_revision_detailed,
        paper_revision_detailed,
        (
            "academic-paper: no compile and no formatter in this mode. Its agents are the peer "
            "reviewer, the draft writer and citation compliance; the mode table lists no intake "
            'agent for it, while the intake page\'s mode list names it. paper: "The stops of paper" '
            "is a ruling of plan 5. paper has no full re-emission: a structural patch is "
            'acknowledged or narrowed once (a ruling of plan 5). "[4.A R2-6]" is a ruling of '
            "step 4.A's second repair round."
        ),
    ),
    (
        "lit-review",
        ap_lit_review_detailed,
        paper_lit_review_detailed,
        ("academic-paper: no cycle, no reference check, no manuscript changed."),
    ),
    (
        "outline-only",
        ap_outline_only_detailed,
        paper_outline_only_detailed,
        ("academic-paper: no argument builder."),
    ),
    (
        "abstract-only",
        ap_abstract_only_detailed,
        paper_abstract_only_detailed,
        ("academic-paper: no cycle."),
    ),
    (
        "citation-check",
        ap_citation_check_detailed,
        paper_citation_check_detailed,
        (
            "academic-paper: one pass, no second run. The mode table lists no intake agent for it, "
            "while the intake page's mode list names it. paper: a retracted source follows "
            "academic-paper's retraction protocol (a ruling of plan 5); it differs only in that the "
            "replacement's passage is read in the run before it is used (D22, D50)."
        ),
    ),
    (
        "disclosure",
        ap_disclosure_detailed,
        paper_disclosure_detailed,
        (
            "academic-paper: no cycle. The mode table lists agent 9, the formatter; the mode guide "
            "says the disclosure protocol runs standalone. paper: the other statements are "
            "written when the venue or you ask (C108 part 4). paper has no policy-anchor track."
        ),
    ),
    (
        "plan",
        ap_plan_detailed,
        paper_plan_detailed,
        (
            "academic-paper: the dialogue rounds are no stops. paper: the mentor is one agent "
            "per run, resumed with each answer, and writes the checkpoint after each round "
            "so that a continued run starts from it (AY). The stress test is the planner's "
            "rating of each answer, with the plan-to-draft gate in the chapter plan. "
            "academic-paper names 30 rounds in one list and 15 in another, and paper takes 30. "
            'A tag such as "[4.A D1]" names a decision of step 4.A\'s brief and "[4.A R2-7]" '
            "a ruling of its second repair round."
        ),
    ),
    (
        "format-convert",
        ap_format_convert_detailed,
        paper_format_convert_detailed,
        (
            "academic-paper: the formatter converts and compiles itself, with a hard gate "
            "on provenance markers. paper: no provenance gate, no ARS marker stripping and "
            "no 1 percent word-count threshold; the formatter writes patches and a report "
            "and the session converts (AY); a PDF is made from the .tex only, never from a "
            ".docx. A request with no target takes Markdown [4.A R1-16]. A tag such as "
            '"[4.A D10]" names a decision of step 4.A\'s brief, "[4.A item 6]" an item of '
            'it, "[4.A R1-23]" a ruling of its first repair round and "[4.A R2-9]" a '
            "ruling of its second."
        ),
    ),
)


def only_modes_figure() -> str:
    name = "academic-paper-only-modes.svg"
    pairs = only_modes()
    layouts = [
        (gf.FlowLayout(name, pair.left.graph), gf.FlowLayout(name, pair.right.graph))
        for pair in pairs
    ]
    row_width = max(a.width + b.width + PANEL_GAP for a, b in layouts)
    width = max(row_width + 2 * gf.MARGIN, 700)
    heights = [max(a.height, b.height) for a, b in layouts]
    note_room = gf.note_height(name, ONLY_NOTE, width - 2 * gf.MARGIN)
    legend = (
        L("agent", "Solid box: built"),
        L("stop", "Orange box: the run stops for you"),
        L("todo", "Dashed box: not built yet, with its roadmap entry"),
    )
    height = (
        gf.MARGIN
        + sum(h + 40 + ROW_GAP for h in heights)
        + note_room
        + gf.legend_height(legend)
        + 3 * gf.MARGIN
    )
    boxes = []
    for pair in pairs:
        for panel in (pair.left, pair.right):
            boxes.append(
                f"{panel.caption}: " + "; ".join(n.label for n in panel.graph.nodes)
            )
    label = (
        "The modes academic-paper has and paper does not. Boxes: "
        + " | ".join(boxes)
        + "."
    )
    canvas = gf.Canvas(name, width, height, label)
    cursor = gf.MARGIN
    for pair, (a, b), row_height in zip(pairs, layouts, heights, strict=True):
        gf.draw_caption(canvas, gf.MARGIN, cursor + 12, pair.left.caption, a.width)
        gf.draw_caption(
            canvas, gf.MARGIN + a.width + PANEL_GAP, cursor + 12, "Ordo", b.width
        )
        a.draw(canvas, gf.MARGIN, cursor + 24)
        b.draw(canvas, gf.MARGIN + a.width + PANEL_GAP, cursor + 24)
        cursor += row_height + 40 + ROW_GAP
    gf.draw_note(canvas, gf.MARGIN, cursor + 4, ONLY_NOTE, width - 2 * gf.MARGIN)
    gf.draw_legend(canvas, gf.MARGIN, cursor + note_room + gf.MARGIN, legend)
    return canvas.render()


def figures() -> tuple[tuple[str, str], ...]:
    """Every figure of this script, as the file name and its body."""
    paper_simple = dict(gf.PAPER_MODES)
    out: list[tuple[str, str]] = []
    for mode, ap_build, note in SIMPLE:
        panels = [
            gf.Panel("academic-paper 3.2.0", ap_build()),
            gf.Panel("paper", paper_simple[mode]()),
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
    for mode, ap_build, paper_build, note in DETAILED:
        panels = [
            gf.Panel("academic-paper 3.2.0", ap_build()),
            gf.Panel("paper, as ruled", paper_build()),
        ]
        out.append(
            (
                f"{mode}-detailed.svg",
                gf.compose(
                    f"{mode}-detailed.svg",
                    gf.describe(f"The {mode} mode, detailed view", panels),
                    panels,
                    DETAILED_LEGEND,
                    note,
                ),
            )
        )
    out.append(("academic-paper-only-modes.svg", only_modes_figure()))
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
