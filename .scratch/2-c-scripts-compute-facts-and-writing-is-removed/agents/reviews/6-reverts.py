import os, shutil, subprocess, sys, tempfile
WT = "/Users/axelfaes/workspace/ordo/.agents/worktrees/2c-6"
CC = "skills/ordo-init/templates/check_config.py"
SR = "skills/repo-setup/templates/sync_rules.py"
PIN = "utils/pin.sh"
COV = "utils/check_coverage.py"
PLAN = "skills/plan/templates/plan.yaml"
TEST = {PLAN: "skills/ordo-init/templates/check_config.test.sh", CC: "skills/ordo-init/templates/check_config.test.sh", SR: "skills/repo-setup/templates/sync_rules.test.sh",
        PIN: "utils/pin.test.sh", COV: "utils/check_coverage.test.sh"}
R = [] if os.environ.get("MODE") == "head" else [
 ("REMOVED pin C20 dup: both list comparisons dropped", PIN, '''        [ "$dir" = "$outside" ] && return 0
        [ -n "$outside_real" ] || continue
        [ "$(CDPATH= cd "$dir" 2>/dev/null && pwd -P)" = "$outside_real" ] && return 0
''', "        :\n"),
 ("cov missing-hidden (unlisted file not reported)", COV, '''                errors.append((0, f"'{skill}/{path}' is not listed"))''', "                pass"),
 # check_config
 ("cc complete", CC, "if value is None or default is None:\n            continue", "if value is None:\n            continue"),
 ("cc missing-key", CC, 'errors.append(f"{prefix}required key missing: {key}")', "pass"),
 ("cc unknown-key", CC, 'errors.append(f"{prefix}unknown key: {key}")', "pass"),
 ("cc missing-page", CC, 'errors.append(f"{prefix}{key} names a file that does not exist: {value}")', "pass"),
 ("cc not-ignored", CC, 'errors.append(f"{prefix}worktree_root is not ignored by git: {worktree_root}")', "pass"),
 ("cc config-ignored", CC, 'errors.append(".agents/plan.yaml is ignored by git")', "pass"),
 ("cc agents-star", CC, '"--no-index", ".agents/plan.yaml") == 0', '"--no-index", ".agents/probe") == 0'),
 ("cc bad-harness", CC, 'MODEL = re.compile(r"^claude:\\S+$")', 'MODEL = re.compile(r"^(claude:)?\\S+$")'),
 ("cc bad-type", CC, 'errors.append(f"{prefix}{key} is a {type(value).__name__}, its default is a {type(default).__name__}: {value!r}")', "pass"),
 ("cc codex-worker", CC, 'MODEL = re.compile(r"^claude:\\S+$")', 'MODEL = re.compile(r"^\\w+:\\S+$")'),
 ("cc projects pass", CC, 'if set(config) != {"projects"}:', 'if set(config) != set():'),
 ("cc projects missing worker", CC, "check_project(root, name, project or {}, keys, errors, notes)", "pass"),
 ("cc libraries-maybe", CC, 'errors.append(f"{prefix}libraries is neither check nor avoid: {config[\'libraries\']!r}")', "pass"),
 ("cc libraries-boolean", CC, 'if "libraries" in config and config["libraries"] not in', 'if isinstance(config.get("libraries"), str) and config["libraries"] not in'),
 ("cc libraries-empty", CC, 'if "libraries" in config and config["libraries"] not in ("check", "avoid"):', 'if config.get("libraries") not in (None, "check", "avoid"):'),
 ("cc libraries-avoid", CC, 'config["libraries"] not in ("check", "avoid")', 'config["libraries"] not in ("check",)'),
 # sync_rules
 ("sr drift detected", SR, "if block == template:", "if block.splitlines()[0] == template.splitlines()[0]:"),
 ("sr drift outside bytes", SR, "rewritten = text[:start] + eol", "rewritten = BEGIN + eol"),
 ("sr crlf", SR, 'with open(path, encoding="utf-8", newline="") as handle:', 'with open(path, encoding="utf-8") as handle:'),
 ("sr reversed", SR, " or text.index(BEGIN) > text.index(END):", ":"),
 ("sr two-begins", SR, "if text.count(BEGIN) != 1 or ", "if "),
 ("sr two-blocks", SR, "if text.count(BEGIN) != 1 or text.count(END) != 1 or", "if text.count(BEGIN) != text.count(END) or"),
 ("sr lost-write", SR, "if reread != rewritten:", "if False:"),
 # pin
 ("pin C1 no worktree", PIN, '    [ -d "$stable" ] || fail "no pinned worktree at $stable; run utils/pin.sh <tag>"\n', ""),
 ("pin C2 first pin", PIN, 'ln -sfn "$(skill_root "$stable")/$skill" "$dir/$skill" || continue', 'ln -sfn "$(skill_root "$repo")/$skill" "$dir/$skill" || continue'),
 ("pin C3 live clone moves", PIN, 'git -C "$repo" worktree add -q --force --detach "$stable" "$tag" ||', 'ln -s "$repo" "$stable" ||'),
 ("pin C4 dropped skill unlinked", PIN, '                rm "$link" || continue\n                printf \'pin: removed %s, which the tag %s does not hold\\n\'', '                continue\n                printf \'pin: removed %s, which the tag %s does not hold\\n\''),
 ("pin C5 check: skill tag lacks", PIN, '''                    [ -f "$target/SKILL.md" ] || {
                        printf 'pin: %s links to %s, which the pinned tag does not have\\n' \\
                            "$link" "$target" >&2
                        problems=$((problems + 1))
                    }''', "                    :"),
 ("pin C6 check: live clone link", PIN, '''                    printf 'pin: %s links to %s, in the live clone %s\\n' \\
                        "$link" "$target" "$repo" >&2
                    problems=$((problems + 1))''', "                    :"),
 ("pin C6 live clone link replaced", PIN, '        old=$(readlink "$dir/$skill" 2>/dev/null) || old=""\n', '        old=$(readlink "$dir/$skill" 2>/dev/null) || old=""\n        case "$old" in "$repo"/*) continue ;; esac\n'),
 ("pin C7 refusal live clone link", PIN, '''        tag_holds "$(basename "$link")" ||
            fail "$link links into the live clone $repo; move it away or pin a tag that holds it"''', "        :"),
 ("pin C8 check after linking", PIN, 'check_links || fail "the links do not match the pin after linking"', "check_links || :"),
 ("pin C9 local changes", PIN, '''    [ -z "$(git -C "$stable" status --porcelain)" ] ||
        fail "$stable has local changes; the pinned worktree is never edited"''', "    :"),
 ("REMOVED pin real directory", PIN, '        [ -L "$dir/$skill" ] || fail "$dir/$skill is a real directory; move it away and run again"\n', ""),
 ("pin C11 foreign link", PIN, '            *) fail "$dir/$skill links to $target, outside Ordo; move it away and run again" ;;\n', ""),
 ("pin C12 not a worktree", PIN, '''    [ "$toplevel" = "$(CDPATH= cd "$stable" && pwd -P)" ] ||
        fail "$stable exists and is not a git worktree"''', "    :"),
 ("pin C14 deleted by hand", PIN, "worktree add -q --force --detach", "worktree add -q --detach"),
 ("pin C14 other registration", PIN, '    git -C "$repo" worktree add -q --force', '    git -C "$repo" worktree prune\n    git -C "$repo" worktree add -q --force'),
 ("pin C15 defaults hold d2", PIN, '    skill_dirs="$HOME/.claude/skills"\n', '    skill_dirs="$HOME/.claude/skills$nl$HOME/.agents/skills"\n'),
 ("pin C16 land (folder left alone)", PIN, '''        rm "$link" || continue
        printf 'pin: removed %s, in a folder pin.sh no longer links into\\n' "$link"''', "        continue"),
 ("pin C16 gamma (live clone) *", PIN, '"$stable" | "$stable"/* | "$repo" | "$repo"/*) return 0 ;;', '"$stable" | "$stable"/*) return 0 ;;'),
 ("pin C16 plan (resolved)", PIN, '''    ordo_parent=$(CDPATH= cd "$(dirname "$ordo_target")" 2>/dev/null && pwd -P) || return 1
    case "$ordo_parent/$(basename "$ordo_target")" in
        "$stable" | "$stable"/* | "$repo" | "$repo"/*) return 0 ;;
    esac
''', ""),
 ("pin C16 stable-root *", PIN, '"$stable" | "$stable"/* | "$repo" | "$repo"/*) return 0 ;;', '"$stable"/* | "$repo"/*) return 0 ;;'),
 ("pin C16 other kept", PIN, '        links_into_ordo "$link" || continue\n        rm "$link" || continue', '        rm "$link" || continue'),
 ("pin C16 find-skills kept", PIN, '''    for link in "$old_dir"/*; do
        [ -L "$link" ] || continue
        links_into_ordo "$link" || continue
        rm "$link" || continue''', '''    for link in "$old_dir"/*; do
        [ -L "$link" ] || { rm -rf "$link"; continue; }
        links_into_ordo "$link" || continue
        rm "$link" || continue'''),
 ("pin C17 check reads the folder", PIN, '''            printf 'pin: %s links to %s, in a folder pin.sh no longer links into; %s\\n' \\
                "$link" "$(readlink "$link")" 'utils/pin.sh <tag> removes it' >&2
            problems=$((problems + 1))''', "            :"),
 ("pin C19 ORDO_SKILL_DIRS set", PIN, '    [ -z "${ORDO_SKILL_DIRS:-}" ] || return 0\n', ""),
 ("REMOVED pin CLAUDE_CONFIG_DIR=~/.agents, path comparison only", PIN, '        [ "$dir" = "$outside" ] && return 0\n', ""),
 ("pin C21 folder of the list by resolved path", PIN, '        [ "$(CDPATH= cd "$dir" 2>/dev/null && pwd -P)" = "$outside_real" ] && return 0\n', ""),
 ("pin C22 CLAUDE_CONFIG_DIR", PIN, '        skill_dirs="$skill_dirs$nl${CLAUDE_CONFIG_DIR%/}/skills"\n', "        :\n"),
 ("pin C23 split on tabs", PIN, "tr ' \\t' '\\n\\n'", "tr ' ' '\\n'"),
 ("pin C25 relative folder", PIN, "        *) fail \"'$dir' is not an absolute path\" ;;\n", ""),
 ("pin C25 whitespace", PIN, "        [[:space:]]* | *[[:space:]]) fail \"'$dir' has leading or trailing whitespace\" ;;\n", ""),
 ("pin C27 top-level tag", PIN, '''[ -n "$tag_skills" ] ||
    tag_skills=$(printf '%s\\n' "$tag_files" | sed -n 's#^\\([^/]*\\)/SKILL\\.md$#\\1#p')
''', ""),
 # check_coverage
 ("cov complete", COV, 'if body[i] == "\\\\" and i + 1 < len(body) and body[i + 1] == "|":', 'if False:'),
 ("cov nested-link", COV, '''            errors.append((0, f"'{skill}/{link}' is a link; its target is not listed or read"))''', "            pass"),
 ("REMOVED cov linked-empty", COV, '["find", "-H", folder,', '["find", folder,'),
 ("cov missing-hidden", COV, '"-type", kind, "-print0"]', '"-type", kind, "!", "-name", ".*", "-print0"]'),
 ("REMOVED cov missing-nested (control reddens)", COV, '["find", "-H", folder, "-type"', '["find", "-H", folder, "-maxdepth", "1", "-type"'),
 ("cov listed-twice", COV, '''            if path in seen:
                errors.append((n, f"'{path}' is listed twice in '{skill}' (first at line {seen[path]})"))
                continue
''', ""),
 ("cov wrong-section (not a file)", COV, '''                errors.append((n, f"'{path}' is not a file of {skill}"))''', "                pass"),
 ("cov wrong-section (per section, control reddens)", COV, "        seen = {}\n", "        seen = globals().setdefault('shared', {})\n"),
 ("cov wrong-section (listed in any section)", COV, "        for path in on_disk:\n            if path not in seen:", "        any_seen = globals().setdefault('ANY', set())\n        any_seen.update(seen)\n        for path in on_disk:\n            if path not in any_seen:"),
 ("cov unknown-mark", COV, 'if mark != "drop" and not mm:', 'if False:'),
 ("cov unknown-skill", COV, "elif mm and mm.group(2) not in new_skills:", "elif False:"),
 ("cov empty-reason", COV, "if not reason:", "if False:"),
 ("cov no-section", COV, '''            errors.append((0, f"no '## {skill}' section"))''', "            pass"),
 ("cov section-twice", COV, '''            errors.append((found[skill][1][0], f"'## {skill}' appears more than once"))''', "            pass"),
 ("cov entry-missing", COV, "if entry not in entries:", "if False:"),
 ("cov usage-no-skill", COV, "if len(argv) < 3:", "if len(argv) < 2:"),
 ("cov find-fails", COV, "if listed.returncode != 0:", "if False:"),
]
if os.environ.get("MODE") == "head":
    R = [
 ("H cc libraries-missing", PLAN, "libraries: check                          # required.", "libraries: check                          # optional, default check."),
 ("H cc unknown launch_note", PLAN, "bench: []", "launch_note: \"\"                           # optional, default \"\". x\nbench: []"),
 ("H sr no-block", SR, "if text.count(BEGIN) != 1 or text.count(END) != 1 or text.index(BEGIN) > text.index(END):", "if False:"),
 ("H sr two-ends", SR, "text.count(END) != 1 or ", ""),
 ("H sr no-claude", SR, '''    if not os.path.isfile(claude):
        print(f"error: no CLAUDE.md in {root}", file=sys.stderr)
        return 2
''', ""),
 ("H sr not-utf8", SR, '''    except UnicodeDecodeError as error:
        print(f"error: {path} is not UTF-8 (byte {error.start})", file=sys.stderr)
''', ""),
 ("H sr no-template", SR, "    if template is None:\n        return 2\n", ""),
 ("H sr template CRLF", SR, 'template = template.replace("\\r\\n", "\\n").strip("\\n")', 'template = template.strip("\\n")'),
 ("H sr read-only", SR, '''        try:
            with open(claude, "w", encoding="utf-8", newline="") as out:
                out.write(rewritten)
        except OSError as error:
            print(f"error: cannot write {claude}: {error.strerror}", file=sys.stderr)
            return 2
''', '''        with open(claude, "w", encoding="utf-8", newline="") as out:
            out.write(rewritten)
'''),
 ("H sr same-crlf", SR, 'block = text[start:stop].replace("\\r\\n", "\\n").strip("\\n")', 'block = text[start:stop].strip("\\n")'),
 ("H pin unknown tag", PIN, '''git -C "$repo" rev-parse -q --verify "refs/tags/$tag^{commit}" >/dev/null ||
    fail "no tag $tag in $repo"
''', ""),
 ("H pin real directory", PIN, '        [ -L "$dir/$skill" ] || fail "$dir/$skill is a real directory; move it away and run again"\n', ""),
 ("H pin names no folder", PIN, '    [ -n "$skill_dirs" ] || fail "ORDO_SKILL_DIRS names no folder"\n', ""),
 ("H pin leading whitespace", PIN, "        [[:space:]]* | *[[:space:]]) fail \"'$dir' has leading or trailing whitespace\" ;;\n", ""),
 ("H pin CLAUDE_CONFIG_DIR=~/.agents, path comparison only", PIN, '        [ "$dir" = "$outside" ] && return 0\n', ""),
 ("H pin CLAUDE_CONFIG_DIR=~/.agents, both comparisons", PIN, '''        [ "$dir" = "$outside" ] && return 0
        [ -n "$outside_real" ] || continue
        [ "$(CDPATH= cd "$dir" 2>/dev/null && pwd -P)" = "$outside_real" ] && return 0
''', "        :\n"),
 ("H pin removal reported although rm failed", PIN, '''                rm "$link" || continue
                printf 'pin: removed %s, which the tag %s does not hold\\n' "$link" "$tag"''', '''                rm "$link"
                printf 'pin: removed %s, which the tag %s does not hold\\n' "$link" "$tag"'''),
 ("H cov plain path", COV, "if not plain(path):", "if False:"),
 ("H cov cell count", COV, "if len(cells) != len(header):", "if False:"),
 ("H cov separator", COV, "if len(table_rows) < 2 or not SEPARATOR.match(table_rows[1][1].strip()):", "if False:"),
 ("H cov holds no table", COV, '        errors.append((heading_line, f"{where} holds no table"))\n', ""),
 ("H cov header", COV, "if split_row(first) != header:", "if False:"),
 ("H cov row after table", COV, '                errors.append((n, f"a table row after the end of the table in {where}"))\n', ""),
 ("H cov empty cell", COV, "if not skill or not entry:", "if False:"),
 ("H cov no New skills", COV, '        errors.append((0, f"no \'## {NEW_SKILLS}\' section"))', "        pass"),
 ("H cov option", COV, '''    for argument in argv:
        if argument.startswith("-"):
            print(f"usage error: {argument}: not an argument this script takes", file=sys.stderr)
            return 2
''', ""),
 ("H cov missing root", COV, '''        if not os.path.isdir(root):
            raise UsageError(f"{root}: not a folder")
''', ""),
 ("H cov missing folder", COV, '''            if not os.path.isdir(os.path.join(root, skill)):
                raise UsageError(f"{os.path.join(root, skill)}: not a folder")
''', "            pass\n"),
 ("H cov unreadable list", COV, '''    except OSError as e:
        raise UsageError(f"{path}: {e.strerror}")
''', ""),
 ("H cov linked-empty", COV, '["find", "-H", folder,', '["find", folder,'),
 ("H cov unclosed fence", COV, '        errors.append((opened_at, f"the fence {opener} opened here is never closed"))\n', "        pass\n"),
 ("H cov repeated skill", COV, "list(dict.fromkeys(argv[2:]))", "argv[2:]"),
    ]
base = tempfile.mkdtemp(prefix="revert-", dir=os.environ.get("TMPDIR", "/tmp"))
MODE = os.environ.get("MODE", "now")
only = sys.argv[1:]
env = {k: v for k, v in os.environ.items() if k not in ("CLAUDE_CONFIG_DIR", "ORDO_SKILL_DIRS", "ORDO_STABLE")}
for i, (label, path, old, new) in enumerate(R):
    if only and not any(o in label for o in only):
        continue
    d = os.path.join(base, str(i))
    os.makedirs(d)
    for sub in ("skills", "utils"):
        shutil.copytree(os.path.join(WT, sub), os.path.join(d, sub), symlinks=True)
    p = os.path.join(d, path)
    text = open(p).read()
    want_all = label.endswith("*")
    if text.count(old) == 0 or (text.count(old) != 1 and not want_all):
        print(f"{label}: PATCH NOT APPLIED ({text.count(old)} matches)")
        continue
    open(p, "w").write(text.replace(old, new))
    if MODE == "head":
        t = os.path.join(d, TEST[path])
        open(t, "w").write(subprocess.run(["git", "-C", WT, "show", "HEAD:" + TEST[path]], capture_output=True, text=True, check=True).stdout)
    r = subprocess.run(["sh", os.path.join(d, TEST[path])], capture_output=True, text=True, env=env, cwd=d)
    last = (r.stdout + r.stderr).strip().splitlines()
    fail = [l for l in last if l.startswith("FAIL:")]
    print(f"{label} | exit {r.returncode} | {fail[-1] if fail else (last[-1] if last else '')}")
    subprocess.run(["chmod", "-R", "u+rwx", d])
    shutil.rmtree(d, ignore_errors=True)
