# Repair round 1 of step 14c

The review is `.scratch/2-e-grill/agents/reviews/14c-refuter.md`. Items 1 to 5 hold as dictated; K1 and K7 are partial, K2 and K6 unmet; the findings are on the dictated text. Each finding below is sent back with its ruling. Work in the same worktree under the same brief, the rules file and the standards; change nothing else. Each text below is written exactly as given, with the indent its place states. Each place is named by the line of `skills/grill/SKILL.md` in the worktree as it stands now, quoted. The builder runs no git command, read-only ones included; a fact that needs one is asked of the orchestrator in the report.

1. Standards 1 and Proof 1: "A ruling of the user ... wherever it stands under `<ledger_root>/`" takes in brief inputs and reports, so the brief input copy `.scratch/2-e-grill/agents/briefs/14c-input/3-the-writing-base-plan.md:45` sets plan 3 aside. The line "     - A ruling of the user is a bullet whose first line ends with "(the user)", with or without a full stop after it, wherever it stands under `<ledger_root>/`, the archived plan it sets aside included." becomes, at five spaces:

   ```
        - A ruling of the user is a bullet whose first line ends with "(the user)", with or without a full stop after it, of a section whose heading begins `## Rulings` in a `plan.md` under `<ledger_root>/`, or of a rulings file under `<ledger_root>/rulings/`, the archived plan it sets aside included.
   ```

2. Spec 1: the first round quotes one ruling for a plan two rulings set aside, and lists plans whose bullets no entry would carry. The line "   - The first round also lists each archived plan a ruling sets aside, whole or in part, with the ruling quoted as written and its `<path>:<line>`." becomes, at three spaces:

   ```
      - The first round also lists each archived plan whose bullets would otherwise be carried rulings for the entry and that a ruling sets aside, whole or in part, with each ruling that sets it aside quoted as written and its `<path>:<line>`.
   ```

3. Spec 2 (case K6) and the Standards finding on a ruling of one plan replaced by a ruling of the plan it set aside: one decision booked in two places stays in force when the user replaces one of them, and the text gives two results for a set-aside plan's bullet that replaces the ruling setting it aside. The ruling: the latest ruling of the user on whether a plan stands decides.
   - The line "     - A ruling that a later ruling names as the one it replaces sets no plan aside." becomes, at five spaces:

     ```
          - A ruling that a later ruling names as the one it replaces sets no plan aside, and neither does any other ruling that sets the same plan, bullets or steps aside and is dated no later than the ruling replaced.
     ```

   - The line "       - Such a bullet settles no decision and replaces no ruling." becomes, at seven spaces:

     ```
            - Such a bullet settles no decision, and replaces no ruling except a ruling that sets its own plan aside, which it replaces as any later ruling does.
     ```

4. The Standards finding on the Stops row "A round": the cell "The frontier as decisions in the decision form, the answer form, and in the first round the decisions carried rulings settle" becomes "The frontier as decisions in the decision form, the answer form, and in the first round the decisions carried rulings settle and the archived plans a ruling sets aside".

5. The Standards finding on exceptions kept away from their rules: each rule of Steps 3 and "Writing what settled" 1 gets its exception as a sub-bullet, two spaces further in than the rule.
   - Under "   - A decision that a line of the Rulings or the rulings file settles, or an ADR in force settles, is marked settled and is not asked again.", at five spaces: `     - A bullet that reads "carried from" a bullet now set aside settles nothing ("What it reads" 6).`
   - Under "     - Of a ruling and the later ruling that names it as the one it replaces, the later ruling is the one carried.", at seven spaces: `       - A bullet of a set-aside plan replaces no ruling, except as "What it reads" 6 says, and the ruling it names stays the one carried.`
   - Under "     - A carried ruling that contradicts another carried ruling, or a bullet of the entry's Rulings or rulings file, neither naming the other as the one it replaces, is a rule clash ("Steps / An answer that contradicts").", at seven spaces: `       - A bullet that settles nothing ("What it reads" 6) makes no rule clash.`
   - Under "     - A decision a bullet of the entry's Rulings or rulings file already settles, a bullet carried in an earlier session included, gets no carried bullet.", at seven spaces: `       - A bullet carried in an earlier session from a bullet now set aside settles nothing, and is removed as the next sub-bullet says.`

6. The Standards finding on the rulings file: a "carried from" bullet that settles nothing stays in the rulings file, which the glossary says holds the user's settled answers, and `/plan` copies it. It is removed.
   - After the sub-bullet "     - A decision a bullet of the entry's Rulings or rulings file already settles, ..." and its new sub-bullet of item 5, at five spaces:

     ```
          - A bullet that reads "carried from" a bullet now set aside ("What it reads" 6) is removed from the entry's Rulings or rulings file at the first write of Steps 8, and Steps 10 lists each removal with the bullet as it stood.
     ```

   - In Steps 10, after the sub-bullet "      - The decisions carried rulings settle are listed among them, ...", at four spaces:

     ```
         - List each "carried from" bullet removed ("Steps / Writing what settled" 1), with the bullet as it stood and its `<path>:<line>`.
     ```

7. The Behaviour finding: with an empty frontier no round is sent, so the user never sees which archived plans were set aside. In Steps 10, after the bullet of item 6, at four spaces:

   ```
       - List each archived plan a ruling sets aside, as the first round lists it (Steps 6), those of an interview whose first pass found no frontier included.
   ```

8. The Standards finding on the term: the term's "and that no ruling of the user sets aside" covers every carried ruling, while the skill sets aside only bullets of archived plans. In `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`, in the term **carried ruling**, "or of the Rulings of an archived plan of that entry, and that no ruling of the user sets aside;" becomes "or of the Rulings of an archived plan of that entry, and that is no bullet of an archived plan a ruling of the user sets aside;". The two lines stay equal.

## Cases

Walk again, on the changed text, with the ledger in the main checkout as it stands (the brief input copies under `.scratch/2-e-grill/agents/briefs/` included, since they stand under the ledger root), every case K1 to K10 of the brief, and these:

- K11. Plan P1's ruling X (2026-09-28) says plan P2 is set aside; a later bullet Y of P2's own Rulings (2026-09-29) reads "... replacing X (the user).": P2 stands again and its bullets are carried.
- K12. `.scratch/rulings/3-the-writing-base.md` holds a "carried from" bullet whose source plan 3 is now set aside: at the first write of Steps 8 it is removed, the decision it held is asked, and Steps 10 lists the removal.
- K13. The entry's rulings file settles every decision and an archived plan of the entry is set aside: no round is sent, and Steps 10 lists the set-aside plan with its ruling.

## Checks

Run from the worktree's root and quote each with its output:

1. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md` ends `checks: 10 commands passed`, exit 0.
2. Each new or changed line above is in its file once (`grep -c -F -x -f <scratch file>` prints 1), and each replaced line prints 0.
3. `diff -U2 /Users/axelfaes/workspace/ordo/<file> <file>` for each changed file shows only the brief's changes and this round's, at their indents.
4. `LC_ALL=C grep -n '[^ -~]'` over the three files prints nothing.
5. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`.
6. The walks of K1 to K13, each step with the line of `grill` it follows, quoted as `grep -n` prints it.

## Report

Append a section "Repair round 1" to `.scratch/2-e-grill/agents/reviews/14c-report.md` in the worktree: per item, the change made with its before and after, then each check with its command and output verbatim, then anything not done. A shortcut, a case walked on a narrower ledger than stated, or a check reported as run that was not, is a failure of the round.
