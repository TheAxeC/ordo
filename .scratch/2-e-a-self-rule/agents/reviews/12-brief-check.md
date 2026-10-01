# Step 12 brief check (on main at e7d37f6)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `.scratch/2-e-a-self-rule/agents/briefs/12.md`. Nothing in the repository was changed. Scratch files were written only under the session scratchpad.

## 1. Names

The step changes the `version:` line of eleven skills. It also changes any term a fix of item 2 may change; no such term is named in advance, so none can be grepped.

- Each current version value: `for v in 1.0.0 1.2.0 1.8.2 1.8.3 1.1.1 1.10.1 2.10.1 1.7.1 1.2.1 1.7.0; do git grep -n -F "$v" -- . ':!*.jsonl' | grep -v '^\.scratch/archive'; done`. Hits outside "Paths this step writes":
  - `docs/roadmap.md:237`: "2.E. grill: at the closing on main, `skills/grill/SKILL.md` 1.2.0 follows `docs/dev/skill-layout.md` ...". This is the gate output of a done entry and describes the 2.E closing. The raise does not make it false.
  - `skills/plan-retro/SKILL.md:5: version: "1.2.1"`. This is the same number as repo-setup's version, in a skill the step leaves unchanged (Case 12). It is not made false.
  - The ledger records of other plans and of this plan (`.scratch/2-e-a-self-rule/agents/briefs/2.md:22`, `briefs/3.md:25`, `reviews/2-report.md:132`, `reviews/3-report.md:56`, `.scratch/2-g-git-guard/plan.md:38`, `.scratch/2-h-session-retro/agents/briefs/3.md:83`, and others). Each records a version at a past moment. They are logs, and the raise does not make them false.
- Lock file or changelog: `git ls-files | grep -i 'lock\|CHANGELOG'` printed nothing.
- Version text in the docs: `grep -n -i 'metadata.version\|version:' README.md docs/*.md docs/dev/*.md` prints only `docs/dev/skill-layout.md:12`, `:22` and `:91`, which state the rule, plus two unrelated `docs/academic-coverage.md` rows.

Findings: none.

## 2. The step line

Step line: "The changed skills read against `docs/dev/skill-layout.md`, each changed skill's `version` raised; check: read by Axel (1 commit)".

- "The changed skills read against `docs/dev/skill-layout.md`": What to build 1 (the reading with per-section verdicts) and 2 (the fixes).
- "each changed skill's `version` raised": What to build 3, with Cases 1 to 12.
- "check: read by Axel": no item of What to build. Item 1's per-skill, per-section report is the page Axel reads. Under `self_rule: on` it becomes a kind-5 open item at landing, which is the orchestrator's work and needs no builder item.
- "(1 commit)": "Paths this step writes" and Verify 3 confine the step to one change set.

Findings: none.

## 3. Premises

- Base commit: `git log --oneline --reverse -- .scratch/2-e-a-self-rule/plan.md | head -1` printed `9fc91dc Open plan 2.E.A, self-rule`. Matches. `git rev-parse --short HEAD` printed `e7d37f6`.
- The eleven changed skills: `git diff --name-only 9fc91dc HEAD -- skills | cut -d/ -f2 | sort -u` printed diagnose, grill, land, ordo-help, ordo-init, plan, plan-orchestration, refute, repo-setup, roadmap, spec. Matches. Both the brief and Case 10 already say that repo-setup changed only in its templates (`git diff --stat 9fc91dc HEAD -- skills` lists `skills/repo-setup/templates/plan-terms.md` and `shared-rules.md`, and no `skills/repo-setup/SKILL.md`).
- Versions at 9fc91dc and now: the loop of `grep -m1 'version:'` over each `SKILL.md` and `git show 9fc91dc:...` printed the same value at both commits: diagnose 1.0.0, grill 1.2.0, land 1.8.2, ordo-help 1.8.3, ordo-init 1.1.1, plan 1.10.1, plan-orchestration 2.10.1, refute 1.7.1, repo-setup 1.2.1, roadmap 1.2.0, spec 1.7.0. Matches.
- The layout page: `wc -l docs/dev/skill-layout.md` printed 92, and `grep -n '^## '` printed the eight sections the brief names. Matches. `grep -rn -i 'semver\|semantic version' docs README.md` printed nothing and exited 1. Matches. Reading the page confirms it says only where the version lives (Frontmatter) and never which part a change raises.
- Descriptions: the layout page's command printed 877 grill, 477 plan, 1022 roadmap, 961 plan-orchestration. Matches. `git show --stat e79afb5` confirms that step 7 changed those four `SKILL.md` files.
- The grill count: `grep -c -- '--self-rule' skills/grill/SKILL.md` printed 25, and the same over `git show 9fc91dc:` printed 0. Matches.
- ADRs: `ls docs/adr` printed 0001 to 0009, README.md and template.md. `grep -n -i 'version\|skill-layout' docs/adr/0*.md` printed nothing. Matches.
- The diagnose diff: `git diff 9fc91dc HEAD -- skills/diagnose` shows two changed lines. The first ("only the user can decide" became "what to do is a decision for the user") is a rewording. The second is the Stops row "The cause not found". Its "What resumes it" cell went from "Inside a plan, the user's ruling on the open item; run by a person, the user's next direction" to "Inside a plan, the user's ruling on the open item or, under `self_rule: on`, the choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books; run by a person, the user's next direction". That adds a new way to resume under `self_rule: on`. It is not "a table row's trailing text" with "the same behaviour", and it is not "the condition they state unchanged" (Decision 1, diagnose case).

Findings:
- P1. The premise "each a wording change with the same behaviour", and Decision 1's diagnose case "two lines reworded, the condition they state unchanged", are false for the second line. The row now states that, under `self_rule: on`, a choice booked by self-rule resumes diagnose's "The cause not found" stop. See check 4, C1, for what this does to Case 11.

## 4. Cases and checks

Each case was read against Decision 1, using `git diff 9fc91dc HEAD -- skills/<name>` for each skill.

- Case 1, plan-orchestration 2.11.0: the diff adds the "Self-rule" section, `references/self-rule.md`, next-entry mode, the cost script, the Dictated text hold before a round commit, and `builders_before`. This is new behaviour, so minor under Decision 1's minor clause. See C2 for the major clause.
- Case 2, grill 1.3.0: the diff adds `--self-rule` ("What it reads" 12 and two new Stops rows) and the Agents bullet per lookup. Minor holds.
- Case 3, plan 1.11.0: the diff adds `--self-rule`, the three keys in Steps 4, and the Agents section. It also adds the closing step's run of `plan_cost.py`, with "The ledger folder moves only when the script exits 0", and a non-zero exit becomes the stop "A red check". Inconsistent with Decision 1's major clause; see C2.
- Case 4, roadmap 1.3.0: `add` now accepts a "(self-rule)" bullet that it refused before. Minor holds.
- Case 5, refute 1.8.0: the run over a round on `repair_reviewer`, agent ids, and the self-rule disposition under "Finding dispositions". Minor holds. The case's reason leaves out the self-rule disposition; the value is unaffected.
- Case 6, spec 1.8.0: the Dictated text check and the agent id. The case's reason leaves out the main new input: the step authority now accepts a Rulings line ending "(self-rule)", in "What it reads" 4 and the Stops row "A step without its authority". Minor holds.
- Case 7, land 1.9.0: the Agents booking. The case's reason leaves out that a red line's first failure can now resume on a self-rule choice, and that a revert can rest on a "(self-rule)" choice. Minor holds under the minor clause; see C2.
- Case 8, ordo-help 1.9.0: Steps 2 is new ("Choices awaiting review: <count>" or "none", printed on every run), along with the `C<n> Agree` and `C<n> =>` lines of the sequence. ordo-help prints these lines and does not perform the review, so the case's reason "the review of a choice" describes plan-orchestration's behaviour. Minor holds under the minor clause; see C2.
- Case 9, ordo-init 1.2.0: the three keys are new. Before them, the base template held none of them (`git show 9fc91dc:skills/plan/templates/plan.yaml | grep -c 'repair_reviewer\|self_rule\|next_entry'` printed 0), so `check_config.py` reported each as "unknown key". The same diff also refuses a configuration the base accepted; see C2.
- Case 10, repo-setup 1.3.0: the templates' plan-terms and shared-rules sentence are new output of a sync. Minor holds.
- Case 11, diagnose 1.0.1: inconsistent with Decision 1 as the brief states it; see C1.
- Case 12: `git diff --name-only 9fc91dc HEAD -- skills/plan-retro skills/session-retro` printed nothing. Holds.

Each case was also read against `docs/dev/skill-layout.md` (Frontmatter: `version: "<major.minor.patch>"` in `metadata.version` only), the prose standard and the change standard. Each value has the required form.

What to build was read against the layout page:

- Items 1 and 2 against "Writing for an agent", last bullet: "The rules of this section apply to a skill's text when it is written or rewritten. Roadmap entry 23, the pruning pass, applies them to every existing skill." Item 1 reads each skill whole against "every section of that page", and item 2 fixes "every break item 1 finds". Item 2's own list includes two rules of that section, "a step without its completion criterion" and "a term used outside its glossary sense", and item 1 would also report breaks of "A sentence stays only when it changes what the reader does". Over the skills' unchanged text, that is entry 23's work. Entry 23 has its own gate (`docs/roadmap.md` line 214: "a reviewer's report lists every deleted sentence with the behaviour it carried and where that behaviour still stands"), and it "Waits on: every other open entry, so each skill is pruned once, in its final form". See C3.

Findings:
- C1. Case 11 (diagnose 1.0.0 to 1.0.1, patch) does not follow from Decision 1 as written. Its second changed line gives diagnose's stop "The cause not found" a new way to resume under `self_rule: on`. Decision 1 makes accepting "an input it did not accept" minor, and the brief applies that clause to spec, plan, grill and roadmap for the same kind of change (a "(self-rule)" choice accepted where only the user's ruling was before). By that reading diagnose is minor, 1.1.0. The other reading is that diagnose's own run is unchanged and the row only documents plan-orchestration's closing, which would make it patch. In that case the brief must state that reading, because Decision 1 does not give it, and the same reading would then apply to identical sentences in refute's "Finding dispositions" and land's Rules. Either way, the premise in "What is on the tree" and Decision 1's diagnose case misstate the diff.
- C2. Decision 1's sentence "under the default keys (...) no change of this plan does that" is false for at least two skills, under the clause's narrow reading ("a run that worked before is refused"):
  - ordo-init: `check_config.py` now refuses a `worker:` or `reviewer:` written with no value, which the base accepted. Scratch repository under the scratchpad, `.agents/plan.yaml` holding `worker:` with no value and the base's other required keys. The base `check_config.py` with its base `plan.yaml` template printed `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists` and exited 0. Head `skills/ordo-init/templates/check_config.py` printed `error: worker is not claude:<model>: None` and exited 1. By Decision 1 this is major (2.0.0), unless the brief adds a rule that fixing a defect is not a refusal. The base's docstring already called a value that is not `claude:<model>` an error, so this reading is open.
  - plan: the closing step `/plan` now drafts runs `plan_cost.py`, and "The ledger folder moves only when the script exits 0". A plan whose ledger names no agent (every step "orchestrator, no agent", no grill lookup) now stops at its closing, where it moved before. A scratch ledger whose `plan.md` has an empty `## Agents` section, run as `OTEL_LOG_RAW_API_BODIES= python3 skills/plan-orchestration/templates/plan_cost.py <ledger> <ledger>`, printed `error: the ledger names no agent` and exited 1. By Decision 1 this is major for `plan` (2.0.0), and arguably for plan-orchestration, whose loop runs that closing. The alternative is for the brief to say why a stop in a step that `/plan` drafts is not a refusal of `/plan`'s run.
  - Decision 1's other major clause, "does something else under the same inputs", taken literally also covers land (the booking now writes an Agents section under the default keys), ordo-help (every run now prints a "Choices awaiting review" line), grill (each lookup now writes an Agents bullet) and plan (an Agents section in every new `plan.md`). The brief rates all of these minor, so the clause needs a sentence that separates added output (minor) from changed or removed output (major). As written, the builder's check "that the rule gives that value" cannot settle these cases.
- C3. Items 1 and 2 apply "Writing for an agent" to the whole of each skill, against the layout page's own scope for that section (text written or rewritten) and against roadmap entry 23, which owns that work with its own gate. Close it by scoping items 1 and 2: "Writing for an agent" against the text this plan wrote or rewrote (`git diff 9fc91dc -- skills/<name>`), and every other section of the page against the whole skill. A break of that section found in unchanged text is listed in the report for entry 23, not fixed.

## 5. The question

The goal: the part of the plan's goal and gate this step delivers, "the changed skills follow `docs/dev/skill-layout.md`, read by you", plus the versions raised.

- Cases 1 to 10: could they pass without the goal being reached? On the "versions raised" part, no: a case passes only when the version line reads a raised value. A case can pass with a value Decision 1 does not give (C2), and a passing case says nothing about the layout part.
- Case 11: yes. It passes at 1.0.1, a raise, but by C1 that value is not the one Decision 1 gives.
- Case 12: no. An unchanged version for an unchanged skill is the goal for that skill.
- The step line's check, "read by Axel": no. The layout part is a judgment, and Axel's reading is its gate, as "Scripts compute facts; judgment is read" requires.
- Item 1: no, provided its verdicts are given per section with places, as "What it must do" requires. A bare "holds" is refused there. Only a reading (the refuter's, then Axel's) can show a wrong verdict, which is correct for a judgment.
- Item 2: yes, in one way the brief already routes. A break whose fix would change what a skill does is handed back unfixed, so item 2 can be done while a skill still breaks the layout. The brief sends each one to "Anything in the brief wrong or impossible". The orchestrator must then raise or book each one, or the gate's "the changed skills follow" part is not reached. This is not a defect of the brief, but the landing has to act on it.
- Item 3: no for "raised". It can pass with a wrong part raised (C1, C2).
- Verify 1 to 6: each checks a fact (the verify list, version values, the path set, description length, ASCII, the glossary sync). None can show layout compliance, which is correct under the change standard's "Scripts compute facts; judgment is read". Verify 3's `git diff --stat -- skills | tail -1` prints only a summary count and names no path. Only the `--name-only` half checks the path set, and neither half covers `docs/glossary.md`.

Findings: Case 11 (C1). Verify 3's `--stat` half checks nothing the `--name-only` half does not, which is minor.

## 6. Implied inputs

This is a text step: version lines and wording fixes in skill text. No script is written or changed. Not a code step.

Findings: none.

## 7. ADRs

Each record was read for its status line and its Decision section: `for f in docs/adr/0*.md; do grep -n -i -m3 'status\|superseded' $f; awk '/^## Decision/...' $f; done`. Every record says `Status: proposed` and none is superseded.

- 0001, 0002, 0003 (the writing base, the prose standard over the academic sources, the fresh reviewer of a draft): these govern a `/writing` skill. `ls skills` lists no such skill, and `grep -rn -l 'writing base\|/writing' skills/*/SKILL.md` printed nothing. Not touched.
- 0004: "A decision taken under self-rule is booked as a bullet whose first line ends "(self-rule)". `/spec`, `/plan` and `/grill` accept it wherever they accept "(the user)"." Touched: a wording fix in spec, plan or grill must keep this. Named by the brief.
- 0005: "Every choice taken under self-rule ... is written to `<ledger_root>/choices.md`, grouped by roadmap entry." Touched, through the text of plan-orchestration, grill and plan. Named.
- 0006: "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model." Touched, through refute, spec, grill, land and plan-orchestration. Named.
- 0007: "The run over a repair round runs on the model an optional key `repair_reviewer` names, whose default is the `reviewer` value." Touched, through refute and plan-orchestration. Named.
- 0008 and 0009 (the price table, and response bodies first): touched, through plan-orchestration's "Usage" and the closing step `plan` drafts. Named.
- No ADR governs versions or the skill layout: `grep -n -i 'version\|skill-layout' docs/adr/0*.md` printed nothing.

Findings: none. No part of the brief contradicts an ADR, and the brief names every ADR the step touches.

## 8. Dictated text

The brief dictates the eleven version values into the files, plus the report's first-line words.

- `plan-orchestration` "2.11.0", `grill` "1.3.0", `plan` "1.11.0", `roadmap` "1.3.0", `refute` "1.8.0", `spec` "1.8.0", `land` "1.9.0", `ordo-help` "1.9.0", `ordo-init` "1.2.0", `repo-setup` "1.3.0", `diagnose` "1.0.1". Found with `grep -n ' to [0-9]*\.[0-9]*\.[0-9]*' .scratch/2-e-a-self-rule/agents/briefs/12.md`, lines 28 to 38. Each holds against the standards:
  - `docs/dev/skill-layout.md`, Frontmatter: the form `<major.minor.patch>`, in `metadata.version` only.
  - The prose standard: ASCII, checked with `LC_ALL=C grep -n '[^ -~]'` over the brief, which printed nothing.
  - The glossary: no term involved.
  - The change standard: no history.
  
  Three values break the brief's own Decision 1 rather than a standards page: diagnose, see C1; ordo-init and plan, see C2.
- The report's first line, "Everything in the brief is done": `grep -n 'Everything in the brief is done'` finds it at line 113. Holds: plain ASCII, the wording of the change standard's rule 7.

Findings: none against the standards pages. The value conflicts are reported under check 4.

## Declined to judge

- Which reading of Decision 1 is right for diagnose (C1), and whether a refusal that ends a defect counts as major (C2). The rule is the brief's and has no page behind it. This is the orchestrator's call, or the user's if it is treated as below.
- Whether Decision 1 is a user-visible choice that the brief should not take. `spec` Steps 4 says "A user-visible choice (a public shape, a wire format, a config key, a vocabulary) is not taken". Plan 2.G's Rulings (`.scratch/2-g-git-guard/plan.md:38`) kept repo-setup at 1.2.1 "for one practice across the plans in flight until Axel rules on when a version changes". The plan 2.H brief check (`.scratch/2-h-session-retro/agents/reviews/3-brief-check.md:126`) called the version rule "the user's". `grep -n -i 'version' .scratch/choices.md` printed nothing, so no choice books it. Under `self_rule: on`, this is outside the six kinds (no written rule exists to change), so it would be closed as an open item with a Rulings bullet and an entry in `choices.md` for the user's review, not as a decision buried in a brief. That routing is the orchestrator's judgment.
- Whether the changed templates (`plan-orchestration/templates/choices.md`, `spec/templates/brief-check.md`, `refute/templates/report.md`, `plan/templates/*`, `repo-setup/templates/plan-terms.md` and `shared-rules.md`) should also be read against the prose standard. The layout page governs only `SKILL.md`, and the step line names only the layout, so it is outside this check.
- Whether Claude Code's transcript cleanup can remove an agent's transcript before a plan's closing (another way to reach the C2 closing stop, "no transcript of agent"). Not verified.

Agent usage: aeae0de1e8deb991b, claude-opus-5-5 (ordo-high), 196521 tokens, 52 tool uses, 7 min 0 s.
