# 0051. The build driver is written by a mode of ordo-init, and by its new-repository run unless the user says no

Status: proposed

## Context

Roadmap entry 25's goal names a build driver, `utils/build.py`: one entry point with `build`, `test`, `check` and `gate`, one command per invocation, the checks imported and called, and every failure a non-zero exit. `skills/ordo/ordo-init/SKILL.md` holds the rule "Build files are written only for what the user names", has no template for a build file, and picks what it does from what the folder holds, with no named mode. The plan configuration of this repository says `libraries: avoid`, and every Python script under `skills/` uses the standard library alone.

## Decision

`ordo-init` has a mode, `/ordo-init build`.

- The mode writes `utils/build.py` from a template on the Python standard library, filled with the commands of the verification page, and rewrites that page to name the driver's `build`, `test` and `check`, one per line. `gate` runs the three.
- A subcommand with no command named says so and exits non-zero.
- A new-repository run writes the driver by the same steps, unless the user answers that it should not.
- An existing or a configured repository gets the driver only through the mode.
- The rule on build files stands, since typing the mode names the driver, and its text names the new-repository run as the one exception.
- The template has a test, since a gate that exits 0 on a failure costs a broken change on main.

## Alternatives rejected

- The driver offered in every run on an existing repository: it offers a build file nobody asked for, against the rule on build files.
- The driver written only when the user names a build system at intake: a repository set up before that choice never gets one.
- The mode alone, with nothing written in a new repository: a new repository then needs a second command to be complete.

## Consequences

`ordo-init` gains its first named mode, and its Quick start, Steps and Stops name it. The verification page of a repository with a driver names the driver's commands, so each plan's verify list follows (ADR 0010).
