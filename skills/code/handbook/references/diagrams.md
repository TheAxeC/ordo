# The diagram file

The diagrams of a documented repository stand in one file, `utils/diagrams.py`, beside the drawing engine `utils/figures.py`, which `handbook` copies from its `templates/figures.py`. The file holds one function per diagram, each returning the diagram's file name and the text of its SVG file, and writes each `.svg` to `docs/user/diagrams/<name>.svg` with the engine's `write_figures`. The engine's head comment says how a script uses it; this page gives the form the session writes it in.

## The rules of the file

- The file finds the repository root from its own path, `Path(__file__).resolve().parent.parent`, so `python3 utils/diagrams.py` writes under `docs/user/diagrams/` of the repository from any working directory.
- It sets `sys.dont_write_bytecode` before it imports the engine, so no `__pycache__` folder is written under `utils/`.
- Each label, each edge label, each title and each legend line is written as a Python string literal by `repr`, so a quote or a backslash in a label runs and draws as given: the label `Reads "a\b"` is written `'Reads "a\\b"'`.
- Each label is ASCII, since the engine refuses a non-ASCII body: a name with an accented letter is written without the accent.
- The draft names each label changed to ASCII.
- The boxes are drawn with kinds of the file's own, built once with the engine's `with_kinds`, each with the words its alternative text says for a box of that kind, since the engine's own kinds describe the runs of Ordo's skills.
- The head comment names each diagram with its path, the command that runs the file, each error the file prints and its exit statuses, in the form below.
- A diagram file that exists keeps every graph it holds, each change marked in its draft, as `SKILL.md`, Steps 7, says.

## The form

A made-up example: a C++ library named `tinyjson` with a parser, a document model and a writer. Its names, labels and paths are invented for this page.

```python
"""Draw the diagrams of this repository's documentation as SVG files.

Writes each diagram at its path under docs/user/diagrams/:

- parts.svg: the parts of the library and the calls between them.

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
KINDS = with_kinds(
    {
        "part": Kind(PART, "part of the library"),
        "outside": Kind(OUTSIDE, "outside the library"),
    }
)

LEGEND = (
    Legend('part', 'Solid box: a part of the library'),
    Legend('outside', 'Dashed grey box: code outside the library'),
)


def parts() -> tuple[str, str]:
    nodes = (
        Node('app', 'The calling program', 'outside'),
        Node('parser', 'Parser: reads "JSON" text', 'part'),
        Node('model', 'Document model', 'part'),
        Node('writer', 'Writer', 'part'),
    )
    edges = (
        Edge('app', 'parser', 'parse()'),
        Edge('parser', 'model', 'builds'),
        Edge('model', 'writer', 'dump()'),
    )
    panels = [Panel('', graph(nodes, edges))]
    title = 'The parts of tinyjson'
    label = describe(title, panels, KINDS)
    return 'parts.svg', compose('parts.svg', label, panels, LEGEND, '', KINDS)


def diagrams() -> tuple[tuple[str, str], ...]:
    return (parts(),)


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
```

The session writes the head comment's list of diagrams, each diagram's function and the tuple of `diagrams()` for the repository; the rest of the form stands as above.
