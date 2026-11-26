"""Draw the diagrams of this repository's documentation as SVG files.

Writes each diagram at its path under docs/user/diagrams/:

- parts.svg: the three builds of Officium, where each reads the library, and the shared data,
  reader and view code they hand the documents to.
- document-path.svg: the path of a document from its YAML file to the reader, and the library
  screen that shows a document refused on the way.

Every box, arrow and label is written in this file; the script reads no other input. The
drawing engine is utils/figures.py beside this file, imported with sys.dont_write_bytecode set
so that no __pycache__ folder is written.

Run, from the repository root: python3 utils/diagrams.py
The script finds the repository root from its own location, so it runs from any directory.

Errors, each printed to stderr as "error: <message>":

- the drawing engine not found, or a name this script imports missing from it: the message
  names the engine's path and the ImportError;
- a diagram the engine refuses, each FigureError its head comment lists: the engine's message.

Exit status: 0 every file written and verified, 1 an error above.
"""

import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
OUT = ROOT / "docs" / "user" / "diagrams"

sys.dont_write_bytecode = True
sys.path.insert(0, str(HERE))
try:
    from figures import (
        Edge,
        FigureError,
        Kind,
        Legend,
        Node,
        Panel,
        Style,
        compose,
        describe,
        graph,
        with_kinds,
        write_figures,
    )
except ImportError as error:
    print(
        f"error: the drawing engine utils/figures.py cannot be imported: {error}",
        file=sys.stderr,
    )
    sys.exit(1)

PART = Style("#ffffff", "#64748b", "", "#0f172a", 1.5, False)
OUTSIDE = Style("#eceff3", "#64748b", "6 4", "#0f172a", 1.5, False)
REFUSAL = Style("#fff1e6", "#b45309", "", "#7c2d12", 2, False)
KINDS = with_kinds(
    {
        "part": Kind(PART, "part of Officium"),
        "outside": Kind(OUTSIDE, "files outside the code"),
        "refusal": Kind(REFUSAL, "what the user sees on a refusal"),
    }
)


def parts() -> tuple[str, str]:
    nodes = (
        Node('library', 'Library folder: rituals/ or examples/rituals/', 'outside'),
        Node('server', 'Browser build: Node server, src/lib/server/', 'part'),
        Node('desktop', 'Desktop build: Tauri, src-tauri/src/library.rs', 'part'),
        Node('oculus', 'Oculus build: file bridge, src/lib/oculus/', 'part'),
        Node('data', 'Data layer: parse and validate, src/lib/data/', 'part'),
        Node('reader', 'Reader functions: src/lib/reader/', 'part'),
        Node('views', 'Views: src/lib/views/Reader.svelte', 'part'),
    )
    edges = (
        Edge('library', 'server'),
        Edge('library', 'desktop'),
        Edge('library', 'oculus'),
        Edge('server', 'data'),
        Edge('desktop', 'data'),
        Edge('oculus', 'data'),
        Edge('data', 'reader', 'documents'),
        Edge('reader', 'views', 'index items'),
    )
    panels = [Panel('', graph(nodes, edges))]
    legend = (
        Legend('outside', 'Dashed grey box: files the user keeps, outside the code'),
        Legend('part', 'Solid box: a part of Officium'),
    )
    title = 'The parts of Officium'
    label = describe(title, panels, KINDS)
    return 'parts.svg', compose('parts.svg', label, panels, legend, '', KINDS)


def document_path() -> tuple[str, str]:
    nodes = (
        Node('find', 'Find each document: a document.yaml folder or a .yaml file', 'part'),
        Node('parse', 'Parse the YAML, src/lib/data/parse.ts', 'part'),
        Node('validate', 'Validate the fields, src/lib/data/validate.ts', 'part'),
        Node('paths', 'Check the images, and in the browser and oculus builds the PDF, lie in the library', 'part'),
        Node('order', 'Check unique id and order, then sort, src/lib/data/order.ts', 'part'),
        Node('show', 'The reader shows the documents', 'part'),
        Node('refused', 'Library screen: the load error', 'refusal'),
    )
    edges = (
        Edge('find', 'parse'),
        Edge('parse', 'validate'),
        Edge('validate', 'paths'),
        Edge('paths', 'order'),
        Edge('order', 'show'),
        Edge('validate', 'refused', 'refused', 'dotted'),
    )
    panels = [Panel('', graph(nodes, edges))]
    legend = (
        Legend('part', 'Solid box: a step of loading the library'),
        Legend('refusal', 'Orange box: what the reader shows when a step refuses'),
        Legend('dotted', 'Dotted arrow: taken only when a step refuses'),
    )
    title = 'The path of a document'
    note = 'Any step that refuses leads to the library screen; the arrow shows validation.'
    label = describe(title, panels, KINDS)
    return 'document-path.svg', compose(
        'document-path.svg', label, panels, legend, note, KINDS
    )


def diagrams() -> tuple[tuple[str, str], ...]:
    return (parts(), document_path())


def main() -> int:
    try:
        lines = write_figures(OUT, diagrams(), ROOT)
    except FigureError as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    for line in lines:
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main())
