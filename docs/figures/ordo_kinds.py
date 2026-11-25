"""The kind of box both of Ordo's figure scripts draw: PAPER, a run of another skill.

Imported by docs/figures/gen_figures.py and docs/figures/academic/researcher/gen_academic_pipeline.py,
each after it has put the drawing engine's folder, skills/code/handbook/templates, on sys.path and
set sys.dont_write_bytecode, so that importing this file writes no __pycache__ folder. Each script
passes PAPER to the engine's with_kinds under the name "paper".

The file reads no input and writes nothing. It imports the engine, so the engine must be importable.
"""

from figures import Kind, Style

PAPER = Kind(Style("#dff3f1", "#0f766e", "", "#134e4a", 1.5, False), "a run of another skill")
