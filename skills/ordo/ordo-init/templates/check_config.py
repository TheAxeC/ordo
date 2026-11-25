#!/usr/bin/env python3
"""Check one plan.yaml against the keys the plan skills read, or find the plan.yaml a call reads.

Usage: check_config.py <path of plan.yaml>
       check_config.py --find <repository root> [<folder>]

The first form checks the file at the path given, absolute or relative to the current folder, and opens no other configuration. The repository root is the top level of the git repository that holds the file, which git names. Every path a key holds (roadmap, verification, rules, ledger_root, archive_root, worktree_root, adr, and each entry of standards and worktree_paths) is read relative to the folder that holds the file, and that folder and the repository root are resolved through symbolic links first. A path may lead out of the file's folder through .., and is an error when it resolves outside the repository. A key left out takes its default, and a default that is a path (adr, worktree_root) is read from the repository root.

The keys, which of them are required and each optional key's default come from the plan skill's templates/plan.yaml. The plan skill's folder is the folder plan beside this skill's folder, as in an installation, or, when that folder holds no templates/plan.yaml, the folder plan in a group folder beside this skill's group folder, as in the repository; this skill's folder is read with every link resolved. The default of repair_reviewer is the configured reviewer. The first form prints one line per error and per note, each naming the file by its path from the repository root, and exits 1 when there is an error, 0 otherwise. A path named in a line is written from the repository root, as it resolves. The errors:

- no path given, or more than one; a path that is not a file; a file in no git repository; each of these is printed with the path as given;
- the plan skill's templates/plan.yaml is in neither <folder>/plan nor <folder>/*/plan, the two places named with their paths; nothing is then checked;
- key written twice: <key>, a key written twice in one mapping, after its project's name and a colon when the mapping is a project under projects:; the file is then not checked further;
- keys beside projects: [...], a key other than projects at the top of the projects: form;
- a required key missing, or an unknown key;
- a value of the wrong kind: a worker or reviewer that is not claude:<model> (one written with no value included), a review that is neither every nor earned, a libraries that is neither check nor avoid, and any other value whose kind differs from its default's;
- <key> is not a path under the repository root, a path that resolves outside the repository, and for adr an absolute path as well;
- ledger_root or worktree_root is the repository root;
- the projects <name> and <name> have one ledger_root: <folder>, two or more projects of the projects: form whose ledger_root values resolve to one folder, since a rulings file under the ledger root is named by the entry's number alone; the line names the folder from the repository root and every project that names it;
- adr is not a folder path (not a non-empty string), or adr names a folder that does not exist (absent, or not a folder);
- design_bar is not industry, state-of-the-art or novel;
- design_references is not a list of text;
- worker_effort or reviewer_effort is not low, medium, high, xhigh or max;
- self_rule or next_entry is not a boolean, which YAML reads from on, off, yes, no, true and false written in lower case, with a capital first letter or in all upper case (oN and tRUE stay text); any other value, nothing and quoted text included, is neither on nor off;
- repair_reviewer is not claude:<model>, nothing or a list included;
- a page the configuration names that does not exist, a worktree root git does not ignore (the default .agents/worktrees when the key is left out), or a configuration file git ignores.

For adr, design_bar, design_references, worker_effort, reviewer_effort, self_rule, next_entry and repair_reviewer the value check above replaces the kind check, so a wrong value gives one error. The notes: each optional key left out, with the default that applies (self_rule and next_entry name default off, repair_reviewer says the reviewer's value applies, adr and worktree_root say the default is read from the repository root); next_entry on while self_rule is off or left out, which acts only under self-rule and is not noted when self_rule has an error; and the default adr folder docs/adr when adr names it and it does not exist yet.

The second form prints the path, from the repository root, of the first plan.yaml among the folder given, .scratch, docs and .agents, and exits 0. The folder is a path from the repository root, with or without a trailing slash. It exits 1 with one error line when it is given no repository root or more than one folder (--find takes a repository root and at most one folder), when the repository root is not a folder, when the folder resolves outside the repository, which names the folder, and when no place holds a plan.yaml, which names the places looked in.
"""
import glob
import os
import re
import subprocess
import sys

import yaml

PAGE_KEYS = ("roadmap", "verification", "rules")
ROOT_KEYS = ("ledger_root", "archive_root", "worktree_root")
NOT_THE_ROOT = ("ledger_root", "worktree_root")
PATH_DEFAULTS = ("adr", "worktree_root")
SEARCH_PLACES = (".scratch", "docs", ".agents")
MODEL = re.compile(r"^claude:\S+$")
DESIGN_BARS = ("industry", "state-of-the-art", "novel")
EFFORTS = ("low", "medium", "high", "xhigh", "max")
MERGE_TAG = "tag:yaml.org,2002:merge"
SWITCHES = ("self_rule", "next_entry")
VALUE_CHECKED = ("adr", "design_bar", "design_references", "worker_effort", "reviewer_effort", "self_rule", "next_entry", "repair_reviewer")


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


class NoPlanSkill(Exception):
    def __init__(self, beside, grouped):
        super().__init__(beside)
        self.beside = beside
        self.grouped = grouped


def plan_skill():
    """Return the plan skill's folder: beside this skill's folder, or else in a group folder beside this skill's group folder."""
    parent = os.path.dirname(os.path.dirname(os.path.dirname(os.path.realpath(__file__))))
    beside = os.path.join(parent, "plan")
    grouped = os.path.join(os.path.dirname(parent), "*", "plan")
    for folder in [beside] + sorted(glob.glob(grouped)):
        if os.path.isfile(os.path.join(folder, "templates", "plan.yaml")):
            return folder
    raise NoPlanSkill(beside, grouped)


def example_keys():
    example = os.path.join(plan_skill(), "templates", "plan.yaml")
    keys = {}
    for line in open(example):
        m = re.match(r"^([a-z_]+):\s*(.*?)\s+#\s*(required\.|optional, default (.*?)\.\s)", line)
        if m:
            keys[m.group(1)] = None if m.group(4) is None else yaml.safe_load(m.group(4))
    return keys


def git(root, *args):
    return subprocess.run(["git", "-C", root, *args], capture_output=True, text=True).returncode


def inside(root, path):
    return path == root or path.startswith(root + os.sep)


class Paths:
    """The repository root and the folder that holds the configuration file, both resolved through links."""

    def __init__(self, root, folder):
        self.root = root
        self.folder = folder

    def resolve(self, prefix, key, value, errors):
        """Return the path a key's value names, resolved from the file's folder, or None with an error when it lies outside the repository."""
        full = os.path.realpath(os.path.join(self.folder, value))
        if not inside(self.root, full):
            errors.append(f"{prefix}{key} is not a path under the repository root: {value!r}")
            return None
        return full

    def shown(self, full):
        """A resolved path as a line names it: from the repository root."""
        return os.path.relpath(full, self.root)


def check_adr(paths, prefix, value, default, errors, notes):
    """Check adr: a non-empty relative path naming a folder inside the repository; the default folder may be absent."""
    if not isinstance(value, str) or value == "":
        errors.append(f"{prefix}adr is not a folder path: {value!r}")
        return
    if os.path.isabs(value):
        errors.append(f"{prefix}adr is not a path under the repository root: {value!r}")
        return
    full = paths.resolve(prefix, "adr", value, errors)
    if full is None or os.path.isdir(full):
        return
    if not os.path.exists(full) and full == os.path.join(paths.root, default):
        notes.append(f"{prefix}adr folder {default} does not exist yet; ordo-init or grill creates it")
        return
    errors.append(f"{prefix}adr names a folder that does not exist: {paths.shown(full)}")


def is_model(value):
    return isinstance(value, str) and MODEL.match(value) is not None


def default_note(prefix, key, default):
    """The note for an optional key left out: the default that applies, which for repair_reviewer is the configured reviewer."""
    if key in SWITCHES:
        return f"{prefix}{key} not set, default {'on' if default else 'off'} applies"
    if key == "repair_reviewer":
        return f"{prefix}repair_reviewer not set, the reviewer's value applies"
    if key in PATH_DEFAULTS:
        return f"{prefix}{key} not set, default {default!r} at the repository root applies"
    return f"{prefix}{key} not set, default {default!r} applies"


def check_switch(prefix, key, value, errors):
    """Check self_rule or next_entry: a boolean, which is how YAML reads on and off."""
    if not isinstance(value, bool):
        errors.append(f"{prefix}{key} is neither on nor off: {value!r}")


def check_project(paths, label, config, keys, errors, notes):
    """Check one project's keys, or the keys of the one-project form; return the folder its ledger_root resolves to, or None when it has none or an error."""
    prefix = f"{label}: " if label else ""
    for key, default in keys.items():
        if key not in config:
            if default is None:
                errors.append(f"{prefix}required key missing: {key}")
            else:
                notes.append(default_note(prefix, key, default))
    for key in config:
        if key not in keys:
            errors.append(f"{prefix}unknown key: {key}")
    for key in PAGE_KEYS:
        value = config.get(key)
        if isinstance(value, str):
            full = paths.resolve(prefix, key, value, errors)
            if full is not None and not os.path.isfile(full):
                errors.append(f"{prefix}{key} names a file that does not exist: {paths.shown(full)}")
    for page in config.get("standards") or []:
        full = paths.resolve(prefix, "standards", page, errors)
        if full is not None and not os.path.isfile(full):
            errors.append(f"{prefix}standards names a file that does not exist: {paths.shown(full)}")
    for path in config.get("worktree_paths") or []:
        full = paths.resolve(prefix, "worktree_paths", path, errors)
        if full is not None and not os.path.exists(full):
            errors.append(f"{prefix}worktree_paths names a path that does not exist: {paths.shown(full)}")
    roots = {}
    for key in ROOT_KEYS:
        value = config.get(key)
        if isinstance(value, str):
            roots[key] = paths.resolve(prefix, key, value, errors)
            if key in NOT_THE_ROOT and roots[key] == paths.root:
                errors.append(f"{prefix}{key} is the repository root: {value!r}")
                roots[key] = None
    if "worktree_root" not in config:
        roots["worktree_root"] = os.path.join(paths.root, keys["worktree_root"])
    for key in ("worker", "reviewer", "repair_reviewer"):
        if key in config and not is_model(config[key]):
            errors.append(f"{prefix}{key} is not claude:<model>: {config[key]!r}")
    for key in SWITCHES:
        if key in config:
            check_switch(prefix, key, config[key], errors)
    if config.get("next_entry") is True and config.get("self_rule", False) is False:
        notes.append(f"{prefix}next_entry is on while self_rule is off; it acts only under self-rule")
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
        check_adr(paths, prefix, config["adr"], keys["adr"], errors, notes)
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
    worktree_root = roots.get("worktree_root")
    if worktree_root is not None:
        probe = os.path.join(paths.shown(worktree_root), "step-worktree")
        if git(paths.root, "check-ignore", "-q", "--no-index", "--", probe) != 0:
            errors.append(f"{prefix}worktree_root is not ignored by git: {paths.shown(worktree_root)}")
    return roots.get("ledger_root")


def find(arguments):
    """Print the first plan.yaml of the search order by its path from the repository root; return the exit status."""
    if len(arguments) not in (1, 2):
        print("error: --find takes a repository root and at most one folder")
        return 1
    if not os.path.isdir(arguments[0]):
        print(f"error: the repository root is not a folder: {arguments[0]}")
        return 1
    root = os.path.realpath(arguments[0])
    places = []
    if len(arguments) == 2:
        folder = os.path.realpath(os.path.join(root, arguments[1]))
        if not inside(root, folder):
            print(f"error: the folder {arguments[1]} is outside the repository {arguments[0]}")
            return 1
        places.append(os.path.relpath(folder, root))
    places.extend(place for place in SEARCH_PLACES if place not in places)
    for place in places:
        if os.path.isfile(os.path.join(root, place, "plan.yaml")):
            print(os.path.normpath(os.path.join(place, "plan.yaml")))
            return 0
    print(f"error: no plan.yaml in {', '.join(places)} of {arguments[0]}")
    return 1


def check(arguments):
    """Check the configuration file at the path given; return the exit status."""
    if len(arguments) != 1:
        print("error: give the path of one plan.yaml: check_config.py <path of plan.yaml>, or check_config.py --find <repository root> [<folder>]")
        return 1
    given = arguments[0]
    if not os.path.isfile(given):
        print(f"error: not a file: {given}")
        return 1
    folder = os.path.realpath(os.path.dirname(os.path.abspath(given)))
    top = subprocess.run(["git", "-C", folder, "rev-parse", "--show-toplevel"], capture_output=True, text=True)
    if top.returncode != 0 or not top.stdout.strip():
        print(f"error: in no git repository: {given}")
        return 1
    paths = Paths(os.path.realpath(top.stdout.rstrip("\n")), folder)
    name = paths.shown(os.path.join(folder, os.path.basename(given)))
    try:
        config = yaml.load(open(given), Loader=UniqueKeyLoader) or {}
    except KeyWrittenTwice as duplicate:
        print(f"error: {name}: {duplicate.prefix}key written twice: {duplicate.key}")
        return 1
    try:
        keys = example_keys()
    except NoPlanSkill as missing:
        print(f"error: the plan skill's templates/plan.yaml is in neither {missing.beside} nor {missing.grouped}")
        return 1
    errors, notes = [], []
    if "projects" in config:
        if set(config) != {"projects"}:
            errors.append(f"keys beside projects: {sorted(set(config) - {'projects'})}")
        projects_of = {}
        for project_name, project in (config["projects"] or {}).items():
            ledger_root = check_project(paths, project_name, project or {}, keys, errors, notes)
            if ledger_root is not None:
                projects_of.setdefault(ledger_root, []).append(str(project_name))
        for ledger_root, names in projects_of.items():
            if len(names) > 1:
                errors.append(f"the projects {' and '.join(names)} have one ledger_root: {paths.shown(ledger_root)}")
    else:
        check_project(paths, "", config, keys, errors, notes)
    ignored = git(paths.root, "check-ignore", "-q", "--no-index", "--", name) == 0
    if ignored:
        print(f"error: {name} is ignored by git")
    for line in errors:
        print(f"error: {name}: {line}")
    for line in notes:
        print(f"note: {name}: {line}")
    if errors or ignored:
        return 1
    print(f"ok: {name} carries every required key, no unknown key, and every page it names exists")
    return 0


def main():
    if sys.argv[1:2] == ["--find"]:
        return find(sys.argv[2:])
    return check(sys.argv[1:])


if __name__ == "__main__":
    sys.exit(main())
