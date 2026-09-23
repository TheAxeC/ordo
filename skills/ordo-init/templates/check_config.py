#!/usr/bin/env python3
"""Check a repository's .agents/plan.yaml against the keys the plan skills read.

Usage: check_config.py [repository root]

The keys, which of them are required and each optional key's default come from the plan skill's
templates/plan.yaml, found beside this skill's folder. Prints one line per error and per note, and
exits 1 when there is an error: a required key missing, an unknown key, a value of the wrong kind,
a page the configuration names that does not exist, a launch_note that is not an absolute path to an
executable file, a worktree root git does not ignore, or a configuration file git ignores.
"""
import os
import re
import subprocess
import sys

import yaml

PAGE_KEYS = ("roadmap", "verification", "rules")
HARNESS = re.compile(r"^(claude|codex):\S+$")


def example_keys():
    here = os.path.dirname(os.path.realpath(__file__))
    example = os.path.join(here, "..", "..", "plan", "templates", "plan.yaml")
    keys = {}
    for line in open(example):
        m = re.match(r"^([a-z_]+):\s*(.*?)\s+#\s*(required\.|optional, default (.*?)\.\s)", line)
        if m:
            keys[m.group(1)] = None if m.group(4) is None else yaml.safe_load(m.group(4))
    return keys


def git(root, *args):
    return subprocess.run(["git", "-C", root, *args], capture_output=True, text=True).returncode


def check_project(root, label, config, keys, errors, notes):
    prefix = f"{label}: " if label else ""
    for key, default in keys.items():
        if key not in config:
            if default is None:
                errors.append(f"{prefix}required key missing: {key}")
            else:
                notes.append(f"{prefix}{key} not set, default {default!r} applies")
    for key in config:
        if key not in keys:
            errors.append(f"{prefix}unknown key: {key}")
    for key in PAGE_KEYS:
        value = config.get(key)
        if isinstance(value, str) and not os.path.isfile(os.path.join(root, value)):
            errors.append(f"{prefix}{key} names a file that does not exist: {value}")
    for page in config.get("standards") or []:
        if not os.path.isfile(os.path.join(root, page)):
            errors.append(f"{prefix}standards names a file that does not exist: {page}")
    for path in config.get("worktree_paths") or []:
        if not os.path.exists(os.path.join(root, path)):
            errors.append(f"{prefix}worktree_paths names a path that does not exist: {path}")
    for key in ("worker", "reviewer"):
        value = config.get(key)
        if value is not None and not (isinstance(value, str) and HARNESS.match(value)):
            errors.append(f"{prefix}{key} is not harness:model (claude:<model> or codex:<model>): {value!r}")
    for key, default in keys.items():
        value = config.get(key)
        if value is None or default is None:
            continue
        if type(value) is not type(default):
            errors.append(f"{prefix}{key} is a {type(value).__name__}, its default is a {type(default).__name__}: {value!r}")
    note = config.get("launch_note")
    if isinstance(note, str) and note:
        if not os.path.isabs(note):
            errors.append(f"{prefix}launch_note is not an absolute path: {note!r}")
        elif os.path.isdir(note):
            errors.append(f"{prefix}launch_note names a directory, not a command: {note!r}")
        elif not os.path.isfile(note):
            errors.append(f"{prefix}launch_note names a file that does not exist: {note!r}")
        elif not os.access(note, os.X_OK):
            errors.append(f"{prefix}launch_note names a file that is not executable: {note!r}")
    if config.get("review") not in (None, "every", "earned"):
        errors.append(f"{prefix}review is neither every nor earned: {config['review']!r}")
    worktree_root = config.get("worktree_root")
    if isinstance(worktree_root, str):
        probe = os.path.join(worktree_root.rstrip("/"), "step-worktree")
        if git(root, "check-ignore", "-q", "--no-index", probe) != 0:
            errors.append(f"{prefix}worktree_root is not ignored by git: {worktree_root}")


def main():
    root = os.path.abspath(sys.argv[1] if len(sys.argv) > 1 else ".")
    path = os.path.join(root, ".agents", "plan.yaml")
    if not os.path.isfile(path):
        print(f"error: no .agents/plan.yaml in {root}")
        return 1
    config = yaml.safe_load(open(path)) or {}
    keys = example_keys()
    errors, notes = [], []
    if git(root, "check-ignore", "-q", "--no-index", ".agents/plan.yaml") == 0:
        errors.append(".agents/plan.yaml is ignored by git")
    if "projects" in config:
        if set(config) != {"projects"}:
            errors.append(f"keys beside projects: {sorted(set(config) - {'projects'})}")
        for name, project in (config["projects"] or {}).items():
            check_project(root, name, project or {}, keys, errors, notes)
    else:
        check_project(root, "", config, keys, errors, notes)
    for line in errors:
        print(f"error: {line}")
    for line in notes:
        print(f"note: {line}")
    if not errors:
        print("ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
