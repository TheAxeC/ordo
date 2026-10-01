# Step 12 landing report

Roadmap entry 2.E.A, self-rule. Plan step 15 of 17 (steps 1 to 13, 6b, 11b, 11c and 12b), step 12, the changed skills and their versions. Next: step 12b, how a "(self-rule)" ruling names a finding of a diagnosis record or a landing report, under ruling O.

## Open items, verbatim

- Open item Q, step 12's check "read by Axel" (kind 5, the user's reading of a page). Step 12 landed. Its check is your reading of what it changed:
  - the five bullets of the version rule in `docs/dev/skill-layout.md`, Frontmatter;
  - the eleven versions;
  - the closing step of `skills/plan/SKILL.md` Steps 2;
  - the rewordings of the eleven skills, listed with their place before and after in `agents/reviews/12-report.md`, "Appendix: every change with its place, before and after".

  The options:
  - (a) Read and agree. Pros: the step's check is met. Cons: none.
  - (b) Read and rule a change. Pros: a wording you disagree with is changed before the tag `v2.8.0-rc.1`. Cons: a further step.

  Recommendation: (a) once read. Both reviewers over the round found each ruling met, and the eight fixes at landing are named in `agents/reviews/12-refuter.md`, "Closed". No option is the lazy one, since the reading is yours.

## The check of Steps 1

The runner's agent listing (ListAgents) showed no agent of step 12, only the peer session research-hub-aa. The builder ae09983cdb0694a33, the reviewer a1a45441fab00dcd0 and the two reviewers over round 1, a66e5c70679decf11 and aadacd036f0e6ee9e, had ended, each with its completion notice.

## NOT DONE

The step's check, "read by Axel", is Open item Q.

## What landed with the commit

- `docs/dev/skill-layout.md`, Frontmatter: the five bullets of the version rule (Open item L (a)).
- The eleven skills this plan changed:
  - read against every section of the layout page except "Writing for an agent";
  - each break fixed, with its rule kept;
  - each version raised by the rule: plan-orchestration 2.11.0, grill 1.3.0, plan 1.11.0, roadmap 1.3.0, refute 1.8.0, spec 1.8.0, land 1.9.0, ordo-help 1.9.0, ordo-init 1.2.0, repo-setup 1.3.0, diagnose 1.1.0.
- `skills/plan/SKILL.md` Steps 2: the closing step skips the cost script whenever the ledger names no agent (Open item N (a), C4).
- `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`: the entry "kind, of an open item" names where the six kinds are stated.
- 15 files, 517 insertions, 241 deletions.

## What was found

- The brief check's findings were closed in the brief before the build.
- The builder's first run of the cases handed back cases 1, 3 and 6: a ledger without `## Agents` was refused at closing. The cases ruling added item 4 and cases 13 to 17.
- The first review found items 1 and 2 violated. Its findings were ruled in `agents/briefs/12-round-1.md` (fourteen rulings).
- The reviewer trial (Open item P (c)): two reviewers ran over round 1 blind, A on Opus and B on Sonnet. The comparison is in `agents/reviews/12-refuter.md`, "The reviewer trial over round 1, compared".
  - Their verdicts were the same.
  - Both found that a cut in `refute` Proof dropped the rule "not a Proof pass".
  - A alone found three other joins or cuts against the layout page.
  - B alone found that `diagnose` Steps 11 lost the condition of its log-line clause, plus four smaller points.
  - A cost $3.54 and B $2.94.
- Fixes at landing: 8, each named in `agents/reviews/12-refuter.md`, "Closed".
  - Seven are in the skills: `refute` Proof and Steps 7, `plan-orchestration` "Resuming, and handing the plan over", `repo-setup` Rules, `diagnose` Steps 11, `land` Stops and `roadmap` Rules.
  - One is in the builder's report.

## Verification on main

`sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, after the fixes at landing:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
```

A/B: none (`bench: []`). Look: none (`look:` empty).

## Usage

- Brief check aeae0de1e8deb991b, claude-opus-5-5: 196521 tokens, 52 tool uses, 7 min 0 s.
- Builder ae09983cdb0694a33, claude-sonnet-5-5:
  - 179551 tokens, 24 tool uses, 3 min 33 s (the first run of the cases, handed back);
  - 315699 tokens, 128 tool uses, 36 min 6 s (the build);
  - 274926 tokens, 112 tool uses, 33 min 10 s (round 1).
- Reviewer a1a45441fab00dcd0, claude-opus-5-5: 342934 tokens, 78 tool uses, 14 min 22 s.
- Reviewers over round 1:
  - a66e5c70679decf11, claude-opus-5-5: 225543 tokens, 54 tool uses, 10 min 41 s;
  - aadacd036f0e6ee9e, claude-sonnet-5-5: 250869 tokens, 59 tool uses, 12 min 2 s.
- The builder's first report did not pass its bar.
- Fixes at landing: 8.
