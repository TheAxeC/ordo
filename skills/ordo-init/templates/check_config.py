#!/usr/bin/env python3
"""Check a repository's .agents/plan.yaml against the keys the plan skills read.

Usage: check_config.py [repository root]

The keys, which of them are required and each optional key's default come from the plan skill's templates/plan.yaml, found beside this skill's folder. Prints one line per error and per note, and exits 1 when there is an error, 0 otherwise. The errors:

- no .agents/plan.yaml in the repository;
- key written twice: <key>, a key written twice in one mapping, after its project's name and a colon when the mapping is a project under projects:; the file is then not checked further;
- keys beside projects: [...], a key other than projects at the top of the projects: form;
- a required key missing, or an unknown key;
- a value of the wrong kind: a worker or reviewer that is not claude:<model>, a review that is neither every nor earned, a libraries that is neither check nor avoid, and any other value whose kind differs from its default's;
- adr is not a folder path (not a non-empty string), adr is not a path under the repository root (absolute, or leading out through ..), or adr names a folder that does not exist (absent, or not a folder);
- design_bar is not industry, state-of-the-art or novel;
- design_references is not a list of text;
- worker_effort or reviewer_effort is not low, medium, high, xhigh or max;
- a page the configuration names that does not exist, a worktree root git does not ignore, or a configuration file git ignores.

For adr, design_bar, design_references, worker_effort and reviewer_effort the value check above replaces the kind check, so a wrong value gives one error. The notes: each optional key left out, with the default that applies, and the default adr folder docs/adr when it does not exist yet.
"""
import os
import re
import subprocess
import sys

import yaml

PAGE_KEYS = ("roadmap", "verification", "rules")
MODEL = re.compile(r"^claude:\S+$")
DESIGN_BARS = ("industry", "state-of-the-art", "novel")
EFFORTS = ("low", "medium", "high", "xhigh", "max")
MERGE_TAG = "tag:yaml.org,2002:merge"
VALUE_CHECKED = ("adr", "design_bar", "design_references", "worker_effort", "reviewer_effort")


class KeyWrittenTwice(Exception):
    def __init__(self, project, key):
        super().__init__(key)
        self.prefix = f"{project}: " if project else ""
        self.key = key


class UniqueKeyLoader(yaml.SafeLoader):
    """A safe loader that raises KeyWrittenTwice on a key written twice in one mapping.

    It names the key with the project it is in when the mapping is a project under projects:. A merge key (<<) is left out of the scan, so only the keys written in the mapping itself are compared, and a key that overrides a merged value is not a duplicate. A mapping written as the value of a merge key is scanned on its own, since the loader splices it into the mapping that holds the merge key and never constructs it.
    """

    def __init__(self, stream):
        super().__init__(stream)
        self.root_node = None
        self.projects_node = None
        self.project_of = {}

    def scan_keys(self, node, project):
        """Raise KeyWrittenTwice when a key is written twice among the keys written in the mapping node itself."""
        seen = set()
        for key_node, value_node in node.value:
            if not isinstance(key_node, yaml.ScalarNode):
                continue
            if key_node.tag == MERGE_TAG:
                merged = value_node.value if isinstance(value_node, yaml.SequenceNode) else [value_node]
                for item in merged:
                    if isinstance(item, yaml.MappingNode):
                        self.scan_keys(item, project)
                continue
            key = self.construct_object(key_node, deep=True)
            if key in seen:
                raise KeyWrittenTwice(project, key)
            seen.add(key)

    def construct_mapping(self, node, deep=False):
        if self.root_node is None:
            self.root_node = node
        self.scan_keys(node, self.project_of.get(id(node)))
        for key_node, value_node in node.value:
            if not isinstance(key_node, yaml.ScalarNode) or key_node.tag == MERGE_TAG:
                continue
            key = self.construct_object(key_node, deep=True)
            if node is self.root_node and key == "projects":
                self.projects_node = value_node
            if node is self.projects_node:
                self.project_of[id(value_node)] = key
        return super().construct_mapping(node, deep)


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


def check_adr(root, prefix, value, default, errors, notes):
    """Check adr: a non-empty path under the repository root naming a folder; the default may be absent."""
    if not isinstance(value, str) or value == "":
        errors.append(f"{prefix}adr is not a folder path: {value!r}")
        return
    path = os.path.normpath(value)
    if os.path.isabs(path) or path == ".." or path.startswith(".." + os.sep):
        errors.append(f"{prefix}adr is not a path under the repository root: {value!r}")
        return
    full = os.path.join(root, path)
    if os.path.isdir(full):
        return
    if not os.path.exists(full) and path == os.path.normpath(default):
        notes.append(f"{prefix}adr folder {default} does not exist yet; repo-setup or grill creates it")
        return
    errors.append(f"{prefix}adr names a folder that does not exist: {value}")


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
        if value is not None and not (isinstance(value, str) and MODEL.match(value)):
            errors.append(f"{prefix}{key} is not claude:<model>: {value!r}")
    for key, default in keys.items():
        value = config.get(key)
        if value is None or default is None or key in VALUE_CHECKED:
            continue
        if type(value) is not type(default):
            errors.append(f"{prefix}{key} is a {type(value).__name__}, its default is a {type(default).__name__}: {value!r}")
    if config.get("review") not in (None, "every", "earned"):
        errors.append(f"{prefix}review is neither every nor earned: {config['review']!r}")
    if "libraries" in config and config["libraries"] not in ("check", "avoid"):
        errors.append(f"{prefix}libraries is neither check nor avoid: {config['libraries']!r}")
    if "adr" in config:
        check_adr(root, prefix, config["adr"], keys["adr"], errors, notes)
    value = config.get("design_bar")
    if "design_bar" in config and not (isinstance(value, str) and value in DESIGN_BARS):
        errors.append(f"{prefix}design_bar is not industry, state-of-the-art or novel: {value!r}")
    value = config.get("design_references")
    if "design_references" in config and not (isinstance(value, list) and all(isinstance(item, str) for item in value)):
        errors.append(f"{prefix}design_references is not a list of text: {value!r}")
    for key in ("worker_effort", "reviewer_effort"):
        value = config.get(key)
        if key in config and not (isinstance(value, str) and value in EFFORTS):
            errors.append(f"{prefix}{key} is not low, medium, high, xhigh or max: {value!r}")
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
    try:
        config = yaml.load(open(path), Loader=UniqueKeyLoader) or {}
    except KeyWrittenTwice as duplicate:
        print(f"error: {duplicate.prefix}key written twice: {duplicate.key}")
        return 1
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
