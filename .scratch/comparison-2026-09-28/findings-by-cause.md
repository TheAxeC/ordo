# Refuter findings of the four archived plans, by cause

Source: every `*-refuter.md` under `.scratch/archive/*/agents/reviews/` in /Users/axelfaes/workspace/ordo. `ls .scratch/archive/*/agents/reviews/*-refuter.md | wc -l` prints 53: 13 in plan 1 (`1-one-layout-for-every-skill`), 6 in plan 2 (`2-coverage-inventory-of-the-academic-skills`), 4 in plan 2.A (`2-a-launch-notes-for-builders-run-as-their-own-process`) and 30 in plan 2.B (`2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found`). Each finding was read against its step's brief (`agents/briefs/<step>.md`), the round brief when one exists (`agents/briefs/<step>-round-<n>.md`, plan 2.B only), the report's Closed section and the step's booking in `plan.md`.

## How findings were counted

- A finding is one numbered or bulleted item under a Spec, Proof, Standards or Behaviour heading of the first review (R0) or of a "Repair round <n>, refuted" section (R1, R2). Sub-bullets are not counted apart.
- Items in which the reviewer reports no defect (a closure that holds, "none", a figure that reproduces, a judgment call it accepts) are not counted; each plan's section ends with the list of them.
- "Not checked" items are not counted, except where the reviewer reports a defect under that heading and it was acted on (plan 1, step 4, the garbled brief line).
- Where the report's own Closed section treats several items as one finding with one cause, they are counted once, and the row says so.
- Plans 1, 2 and 2.A ran with an inline executor (the orchestrating session built each step), so BUILDER there means that session in its builder role. Plan 2.B ran builder agents.

## Causes

- BRIEF: the finding follows from the brief as written (a wrong premise, an item that dictated the defect, a path list that left out a file the change made false, a missing ledger item), or from a repair-round brief's ruling. The row says what was wrong and whether it was visible before the build (or before the round): yes, no or unclear, with the reason.
- BUILDER: the build departed from or fell short of a brief that was right.
- REVIEWER-WRONG: the disposition found the finding wrong (kept as built, accepted, or not reproduced). The row says whether it was sent to the builder in a repair round before it was found wrong.
- OTHER: neither the brief nor the build of that step; the row gives the reason.
- UNCLEAR: the files do not settle the cause; the row gives the reason.

## Counts

| Plan | Reports | Findings | BRIEF | of which visible before build: yes / unclear / no | BUILDER | REVIEWER-WRONG | of which sent to the builder first | OTHER | UNCLEAR |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 13 | 270 | 15 | 14 / 1 / 0 | 248 | 1 | 0 | 6 | 0 |
| 2 (coverage) | 6 | 151 | 1 | 1 / 0 / 0 | 147 | 0 | 0 | 2 | 1 |
| 2.A | 4 | 88 | 10 | 10 / 0 / 0 | 77 | 1 | 0 | 0 | 0 |
| 2.B | 30 | 444 | 90 | 82 / 8 / 0 | 335 | 11 | 0 | 7 | 1 |
| Total | 53 | 953 | 116 | 107 / 9 / 0 | 807 | 13 | 0 | 15 | 2 |

As shares of the 953 findings: BRIEF 12.2%, BUILDER 84.7%, REVIEWER-WRONG 1.4%, OTHER 1.6%, UNCLEAR 0.2%. In plan 2.B alone, the only plan that ran builder agents: BRIEF 20.3%, BUILDER 75.5%, REVIEWER-WRONG 2.5%.

Of the 90 BRIEF findings of plan 2.B, 14 trace to a repair-round brief's ruling rather than to the step's brief (rows 62, 63, 93, 100, 179, 220, 228, 255, 319, 353, 361, 379, 394, 415), and 2 to both (rows 416 and 427, open item BB).

None of the 13 REVIEWER-WRONG findings was sent to a builder as a defect: each was kept as built, accepted or not reproduced by the orchestrator in a round brief's "No change" list or at landing (plan 2.A row 43; plan 1 row 180; plan 2.B rows 39, 40, 46, 84, 183, 195, 239, 245, 333, 367, 383).

UNCLEAR (2): plan 2 row 67 (step 4 R1 Spec 7: the disposition ruled the 27 rewritten rows in scope but says nothing of the report's omission); plan 2.B row 26 (step 1 R1 Behaviour 4: the reviewer says it follows round ruling 1, whose text is not on disk).

OTHER (15): plan 1 rows 32, 99, 130, 143, 144, 148; plan 2 rows 34 and 42 (lists built over steps 3 to 6); plan 2.B rows 65 (the orchestrator's state file), 186 (a timing red from step 4's code, red on the base too), 295 (a roadmap entry's scope text), 313 (rows of another step's section), 339 (the orchestrator's ledger texts), 364 (a research-hub file changed after the build), 377 (the orchestrator's state file). Each row gives its reason.

Row numbers restart at 1 in each plan's section below.

## Plan 1: 1-one-layout-for-every-skill

Report paths are under `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/`; briefs under `.../agents/briefs/`. Plan 1's executor was inline (plan.md:43): the orchestrating session was the builder, so BUILDER here means the orchestrating session building the step. R0 is the first run; R1 is "Repair round 1, refuted".

| # | Step | Report, section | Finding (quote) | Cause | Evidence |
|---|---|---|---|---|---|
| 1 | 2 | 2-refuter.md R0 Spec | "a frontmatter that parses to a non-mapping ... crashes with a traceback instead of printing an error line" | BUILDER | brief 2.md:14 asks one error line per error and exit 1; closed in round 1 (2-refuter.md:174) |
| 2 | 2 | 2-refuter.md R0 Spec | "fence detection is `line.startswith(\"```\")` only" | BUILDER | brief 2.md:23,26 "outside fenced code blocks"; closed in round 1 |
| 3 | 2 | 2-refuter.md R0 Spec | "The LABEL pattern is anchored at column 0, so a nested item's label fails" | BUILDER | brief 2.md:26 "at the start of a bullet or numbered item"; closed in round 1 |
| 4 | 2 | 2-refuter.md R0 Spec | "Heading lines are never passed to check_bold" | BUILDER | brief 2.md:26 "bold anywhere else ... is an error"; closed in round 1 |
| 5 | 2 | 2-refuter.md R0 Spec | "Only `#`, `##` and `###` are checked. `#### Format v2.1` prints `ok:`" | BUILDER | brief 2.md:27 "A heading holding a version tag"; closed in round 1 |
| 6 | 2 | 2-refuter.md R0 Spec | "the version-tag test strips code spans from the heading first" | BUILDER | brief 2.md exempts code spans only in rule 6; closed in round 1 |
| 7 | 2 | 2-refuter.md R0 Spec | "a second `# ` heading anywhere in the body ... escapes the order and placement checks" | BRIEF | brief 2.md:23 rule 3 orders only `## ` headings and says nothing of a second `# ` line; visible before build: yes, the rule's scope is readable in the brief |
| 8 | 2 | 2-refuter.md R0 Spec | "rule 2 asks for \"at least one paragraph line\". Any non-blank line counts" | BUILDER | brief 2.md:22; closed in round 1 |
| 9 | 2 | 2-refuter.md R0 Spec | "The message lists every required heading present ... and does not name which one is out of place" | BUILDER | brief 2.md:23 "an error naming the heading"; closed in round 1 |
| 10 | 2 | 2-refuter.md R0 Spec | "the line given for a missing section is the line of the last heading in the file" | BUILDER | brief 2.md:14 `<path>:<line>`; closed in round 1 |
| 11 | 2 | 2-refuter.md R0 Proof | "rule 2's \"the first non-blank line is a `# ` title\" has no case" | BUILDER | brief 2.md:44 one case per rule; closed in round 1 |
| 12 | 2 | 2-refuter.md R0 Proof | "rule 1's \"parses as YAML\" and \"no frontmatter\" branches have no case" | BUILDER | brief 2.md:44; closed in round 1 |
| 13 | 2 | 2-refuter.md R0 Proof | "no case puts a heading or bold inside a fence" | BUILDER | brief 2.md:44; closed in round 1 |
| 14 | 2 | 2-refuter.md R0 Proof | "rule 4's \"What it reads holds a numbered list\" has no case" | BUILDER | brief 2.md:44; closed in round 1 |
| 15 | 2 | 2-refuter.md R0 Proof | "rule 5 names three tables. Only the Anti-patterns header is tested" | BUILDER | brief 2.md:44; closed in round 1 |
| 16 | 2 | 2-refuter.md R0 Proof | "`### ` version-tag checking (py:173-175) is untested" | BUILDER | brief 2.md:44; closed in round 1 |
| 17 | 2 | 2-refuter.md R0 Proof | "no case covers a duplicated required heading" | BUILDER | brief 2.md:44; closed in round 1 |
| 18 | 2 | 2-refuter.md R0 Standards | "the comments `# 1. Frontmatter.` to `# 7. Version tags in headings.` number the cases by the brief's list" | BUILDER | change-standard rule 10 cited; round 1 `grep -n '^# [0-9]'` no output (2-refuter.md:127) |
| 19 | 2 | 2-refuter.md R0 Standards | "A nonexistent path argument and a non-mapping frontmatter both end in a Python traceback" | BUILDER | change-standard rule 15; closed in round 1 |
| 20 | 2 | 2-refuter.md R0 Standards | "Neither file lists `utils/check_skill_layout.test.sh`. plan.md:32 schedules that for step 14" | BRIEF | brief 2.md:9 and plan step 14 put the wiring in step 14 while building.md says a new script adds its test with the script; ruled at landing (plan.md:48, 2-refuter.md:177); visible before build: yes, building.md:19 was on the tree |
| 21 | 2 | 2-refuter.md R0 Behaviour | "A new command ... that also accepts a skill folder ... The report's judgment calls do not state it" | BUILDER | report omission; closed in round 1 |
| 22 | 2 | 2-refuter.md R0 Behaviour | "With no argument, the check reads the `skills/` folder beside the script's own parent ... The report does not state this" | BUILDER | report omission; closed in round 1 |
| 23 | 2 | 2-refuter.md R1 | "the round closes the first review's \"Not checked: `__bold__`\" item by deciding in the builder's own report" | BRIEF | brief 2.md:26 limited bold to `**` while skill-layout.md:49 says bold in general; orchestrator ruled `__x__` counts (plan.md:47, 2-refuter.md:176); visible before build: yes |
| 24 | 2 | 2-refuter.md R1 | "the round closes a finding ... recorded as \"deferred work, not a defect\" by adding the test to all three lists now" | BRIEF | same cause as #20; ruled (plan.md:48); visible before build: yes |
| 25 | 2 | 2-refuter.md R1 | "My revert (line = last_line always) leaves the suite at `PASS`" | BUILDER | closed at landing with case missing-section (2-refuter.md:178) |
| 26 | 2 | 2-refuter.md R1 | "My revert of the closing condition to `if m:` leaves the suite at PASS" | BUILDER | closed at landing, cases longer-closer and other-closer (2-refuter.md:179) |
| 27 | 2 | 2-refuter.md R1 | "an inline code span at the start of a line ... opens a fence that never closes" | BUILDER | closed at landing (2-refuter.md:180) |
| 28 | 2 | 2-refuter.md R1 | "an ATX heading with closing hashes (`## Rules ##`) is read as a section named `Rules ##`" | BUILDER | closed at landing (2-refuter.md:181) |
| 29 | 2 | 2-refuter.md R1 | "a label that contains italics ... is reported as \"bold outside a list item's label\"" | BUILDER | closed at landing (2-refuter.md:182) |
| 30 | 2 | 2-refuter.md R1 | "`* ` bullets are not recognised as a list" | BUILDER | brief 2.md:24 "a bulleted list"; closed at landing (2-refuter.md:183) |
| 31 | 2 | 2-refuter.md R1 | "The rows for version-subheading/version-deep, subheading-only and spaced-header name no revert" | BUILDER | closed at landing (2-refuter.md:184) |
| 32 | 3 | 3-refuter.md R0 Spec | "the base given to this review, 273714d, is the dispatch commit after it ... The worktree's copy of the brief still carries the broken premise line" | OTHER | the review base and the worktree's brief copy were orchestration bookkeeping, not the build; the reviewer calls it "the base gap, not the builder's work" (3-refuter.md:52); the premise line was corrected at 97c8fdf (plan.md:73) |
| 33 | 3 | 3-refuter.md R0 Spec | "`item is not None and int(item) > new_places[key]` accepts item 0" | BUILDER | brief 3.md:40 "an item number no larger than..."; closed in round 1 (revert item-zero, 3-refuter.md:136) |
| 34 | 3 | 3-refuter.md R0 Spec | "an item counts toward the `## ` section as well as its `### ` subsection" | BUILDER | brief 3.md:34 "the n-th ... item of that section"; closed in round 1 (section-own-items) |
| 35 | 3 | 3-refuter.md R0 Spec | "some section names cannot be named at all. `## Inputs / outputs` fails" | BRIEF | the place format the brief defines (3.md:34, section name then ` / ` subsection or a trailing item number) cannot express a section name holding ` / ` or ending in a number; visible before build: yes |
| 36 | 3 | 3-refuter.md R0 Spec | "the inventory's table header row is never checked" | BUILDER | closed in round 1 |
| 37 | 3 | 3-refuter.md R0 Spec | "when an inventory has two `- Old:` or two `- New:` lines, the last one wins" | BUILDER | brief 3.md:38 "the two header bullets"; closed in round 1 |
| 38 | 3 | 3-refuter.md R0 Proof | "the single row `\| 1-26 \| everything \| Steps \|` prints `ok:`... The brief's format allows this" | BRIEF | the brief's format (3.md:33-34) let one row cover a whole file; ruled one rule per row (plan.md:49); visible before build: yes, the gate (plan.md:13) says one line per rule and the brief enforces nothing of it |
| 39 | 3 | 3-refuter.md R0 Proof | "a YAML comment inside the frontmatter ... matches `^#{1,6} ` and is exempt as a heading" | BUILDER | brief 3.md:39 exempts heading lines, not frontmatter content; closed in round 1 (yaml-comment) |
| 40 | 3 | 3-refuter.md R0 Proof | "inside a backtick fence, the line `~~~ inner text that is a rule` ... is exempt as a fence line" | BUILDER | closed in round 1 (tilde-in-fence) |
| 41 | 3 | 3-refuter.md R0 Proof | "a table body row made only of dashes and colons ... matches SEPARATOR and is exempt" | BUILDER | closed in round 1 (dash-row) |
| 42 | 3 | 3-refuter.md R0 Proof | "`<commit>` accepts any revision. `oldbranch` and `HEAD` both print `ok:`" | BRIEF | brief 3.md:24,38 says only `<commit>`; the orchestrator added "a hexadecimal id, never a branch, tag or HEAD" as a ruling in the repair round (plan.md:49); visible before build: yes |
| 43 | 3 | 3-refuter.md R0 Proof | "ten reverts of the check stay green" | BUILDER | brief 3.md:59 one case per rule and error form; closed in round 1 |
| 44 | 3 | 3-refuter.md R0 Proof | "the quoted red outputs are cut short, not verbatim" | BUILDER | brief 3.md:64 output verbatim; closed in round 1 |
| 45 | 3 | 3-refuter.md R0 Proof | "errors are sorted as (0, message) strings, so the uncovered lines print in string order" | BUILDER | closed in round 1 |
| 46 | 3 | 3-refuter.md R0 Proof | "an inventory or new file that is not UTF-8 raises a traceback" | BUILDER | closed in round 1 (old-not-utf8/new-not-utf8 at landing) |
| 47 | 3 | 3-refuter.md R0 Standards | "the untrusted commit value reaches `git show` as an option ... wrote the file `pwned:x`" | BUILDER | change-standard rule 15; closed (plan.md:75) |
| 48 | 3 | 3-refuter.md R0 Standards | "`os.path.join(root, new[0])` lets an absolute or `../` New path escape the repository" | BUILDER | change-standard rule 15; closed in round 1 (escaping-new) |
| 49 | 3 | 3-refuter.md R0 Standards | "a Rule cell holding an escaped pipe (`a \\| b`) is split into 4 cells" | BUILDER | closed in round 1 (escaped-pipe) |
| 50 | 3 | 3-refuter.md R0 Standards | "the comment \"The fence and item reading matches utils/check_skill_layout.py\" is false in three places" | BUILDER | brief 3.md:46 decision 2; closed in round 1 |
| 51 | 3 | 3-refuter.md R0 Standards | "with no arguments the check exits 2. The docstring ... and README state only exit 1" | BUILDER | change-standard rule 5; closed in round 1 |
| 52 | 3 | 3-refuter.md R0 Behaviour | "The report has no user-visible-changes section with before and after" | BUILDER | change-standard rule 7; closed in round 1 |
| 53 | 3 | 3-refuter.md R0 Behaviour | "The report states the `:0:` choice but not exit 2" | BUILDER | closed in round 1 |
| 54 | 3 | 3-refuter.md R1 | "ITEM matches only unindented `- `, `* ` and `N. `. A nested bullet ... does not count as an opener" | BUILDER | implementation of the ruling plan.md:49; closed at landing (3-refuter.md:194) |
| 55 | 3 | 3-refuter.md R1 | "a range may run across a fence's boundary into the next paragraph" | BUILDER | closed at landing (3-refuter.md:195) |
| 56 | 3 | 3-refuter.md R1 | "the block rule does not apply inside the frontmatter" | BUILDER | closed at landing (3-refuter.md:196) |
| 57 | 3 | 3-refuter.md R1 | "Table rows are counted after `lstrip`, so an indented table inside a list item counts as an item" | BUILDER | closed at landing (3-refuter.md:197) |
| 58 | 3 | 3-refuter.md R1 | "Eleven code paths that the round added or kept have no case, and their reverts stay green" | BUILDER | change-standard rule 13; closed at landing (3-refuter.md:198) |
| 59 | 3 | 3-refuter.md R1 | "the part of the report above \"Repair round 1\" still describes the state before the round" | BUILDER | closed at landing (3-refuter.md:199) |
| 60 | 3 | 3-refuter.md R1 | "The row does not say that the round's new code carries the untested paths above" | BUILDER | report defect; closed with #58/#59 |
| 61 | 4 | 4-refuter.md R0 Spec | "the interrupted-landing rule ... is now a bullet under \"On resumption with a dispatch block present:\"" | BUILDER | brief 4.md:19 every rule keeps its meaning; closed in round 1 (plan.md:85) |
| 62 | 4 | 4-refuter.md R0 Spec | "the Stops table adds \"A pause\" and \"The end\" ... as stops" | BUILDER | brief 4.md:19; closed in round 1 (4-refuter.md:120) |
| 63 | 4 | 4-refuter.md R0 Spec | "the \"What it shows\" cells add content the old file does not state" | BRIEF | brief 4.md:22 forbids added content except Quick start, Use instead and Anti-patterns, yet the layout requires the Stops columns What it shows and What resumes it; plan.md:51 later ruled such cells allowed; visible before build: yes |
| 64 | 4 | 4-refuter.md R0 Spec | "Rules written twice, against the brief's \"A rule is written once\"" | BUILDER | brief 4.md:20; closed in round 1 |
| 65 | 4 | 4-refuter.md R0 Spec | "Rules 2 adds statements the old file does not make as standing rules" | BUILDER | brief 4.md:22; closed in round 1 |
| 66 | 4 | 4-refuter.md R0 Spec | "Bullets that hold more than one rule (skill-layout.md line 45)" | BUILDER | closed in round 1 |
| 67 | 4 | 4-refuter.md R0 Spec | "the sub-bullets of item 10 are indented 3 spaces ... they render as a separate top-level list" | BUILDER | closed in round 1 (4-refuter.md:120) |
| 68 | 4 | 4-refuter.md R0 Spec | "The old line 82 says \"the builder's one repair round\", so the qualifier \"one\" is dropped" | BUILDER | brief 4.md:19 names the one-round exception; closed in round 1 |
| 69 | 4 | 4-refuter.md R0 Spec | "the description adds \"a fresh reviewer\" for the first refutation" | BUILDER | closed in round 1 |
| 70 | 4 | 4-refuter.md R0 Spec | "the version maps to \"Quick start\" ... Brief decision 1 says \"the version to Rules\"" | BRIEF | ruling plan.md:50 "this corrects step 4's brief, whose decision 1 named Rules for the version"; visible before build: yes, the layout keeps the version in the frontmatter only |
| 71 | 4 | 4-refuter.md R0 Spec | "inventory line 12 ... maps to \"The two tiers, and the harnesses 5\" ... which does not state it" | BUILDER | closed in round 1 |
| 72 | 4 | 4-refuter.md R0 Spec | "inventory lines 17 and 19 ... both map to \"Steps\". They are stated in the title paragraph" | BUILDER | closed in round 1 |
| 73 | 4 | 4-refuter.md R0 Spec | "inventory line 62: the Rule text drops the qualifier \"with at most one fix at landing\"" | BUILDER | closed in round 1 |
| 74 | 4 | 4-refuter.md R0 Proof | "\"the inventory ... 121 rows\". The rerun shows 113 body rows" | BUILDER | closed in round 1 |
| 75 | 4 | 4-refuter.md R0 Standards | "the same rule written in two sections breaks docs/dev/skill-layout.md line 41" | BUILDER | restates #64; closed in round 1 |
| 76 | 4 | 4-refuter.md R0 Standards | "docs/dev/skill-layout.md line 45, one rule per bullet" | BUILDER | restates #66; closed in round 1 |
| 77 | 4 | 4-refuter.md R0 Behaviour | "A landing interrupted between those two steps leaves a working-tree state file with no dispatch block" | BUILDER | effect of #61; closed in round 1 |
| 78 | 4 | 4-refuter.md R0 Behaviour | "an orchestrator would put a pause and \"nothing unblocked is left\" into the open items" | BUILDER | effect of #62; closed in round 1 |
| 79 | 4 | 4-refuter.md R0 Behaviour | "The pause row says the message shows \"the booked list\"" | BUILDER | closed in round 1 |
| 80 | 4 | 4-refuter.md R0 Not checked | "The brief's line 9 is garbled (\"`git show 836f5c5tree at v1.0.0;\")" | BRIEF | premise correction "brief line 9, garbled by the shell, restored at 8f7d0ec" (plan.md:83); visible before build: yes, the line is unreadable |
| 81 | 4 | 4-refuter.md R1 | "Both lines still state \"resolve a dispatch block before anything else\"" | BUILDER | closed at landing (4-refuter.md:151) |
| 82 | 4 | 4-refuter.md R1 | "the turn-end rule is written twice ... The first review did not raise it" | BUILDER | closed at landing (4-refuter.md:152) |
| 83 | 4 | 4-refuter.md R1 | "the round added \"Neither is a stop, and neither goes into the open items.\"" | BUILDER | closed at landing (4-refuter.md:152) |
| 84 | 4 | 4-refuter.md R1 | "every \"What it shows\" cell and the bullet at 207 both state ... The rule is written five times" | BUILDER | closed at landing (4-refuter.md:153) |
| 85 | 4 | 4-refuter.md R1 | "Row 18 ... still points at \"Use instead 1\", not Steps" | BUILDER | closed at landing (4-refuter.md:154) |
| 86 | 4 | 4-refuter.md R1 | "bullets that still hold two or more rules" | BUILDER | closed at landing (4-refuter.md:155) |
| 87 | 4 | 4-refuter.md R1 | "each row covers more than one rule ... against the plan.md ruling" | BUILDER | ruling plan.md:49 predates the brief; closed at landing (4-refuter.md:156) |
| 88 | 4 | 4-refuter.md R1 | "the title paragraph ... does not say [what it leaves behind]" | BUILDER | skill-layout.md row 1; closed at landing (4-refuter.md:157) |
| 89 | 4 | 4-refuter.md R1 | "the report still states things the tree does not show" | BUILDER | closed at landing (4-refuter.md:158) |
| 90 | 5 | 5-refuter.md R0 Spec | "one rule is written twice. Steps 3 says ... Anti-patterns row 1's Do instead says" | BUILDER | brief 5.md:18 "each written once"; closed in round 1 (5-report.md table) |
| 91 | 5 | 5-refuter.md R0 Spec | "the four refusals appear in full twice" | BUILDER | brief 5.md:18; closed in round 1 |
| 92 | 5 | 5-refuter.md R0 Spec | "\"A key the plan needs\" also covers optional keys" | BUILDER | closed in round 1 |
| 93 | 5 | 5-refuter.md R0 Spec | "it states that the empty folders are committed ... Git does not track empty folders" | BUILDER | closed in round 1 |
| 94 | 5 | 5-refuter.md R0 Spec | "The words \"mechanical half\" appear nowhere in the new file" | BUILDER | brief 5.md:18; closed in round 1 |
| 95 | 5 | 5-refuter.md R0 Spec | "the executor bullet holds more than one rule" | BUILDER | closed in round 1 |
| 96 | 5 | 5-refuter.md R0 Spec | "by the inventory's own count, this bullet holds two rules" | BUILDER | closed in round 1 |
| 97 | 5 | 5-refuter.md R0 Spec | "inventories/plan.md:15: the row maps ... to Steps 1 ... The sentence itself is at new line 10" | BUILDER | closed in round 1 (reopened as #104) |
| 98 | 5 | 5-refuter.md R0 Spec | "inventories/plan.md:16: the row maps ... to Stops 1. Stops row 1 ... says neither half" | BUILDER | closed in round 1 |
| 99 | 5 | 5-refuter.md R0 Spec | "the What it shows and What resumes it cells add content the old file does not state" | OTHER | the layout standard did not say whether its required columns may hold new text; the orchestrator ruled they may (plan.md:51; 5-report.md "Ruled by the orchestrator ... allowed") |
| 100 | 5 | 5-refuter.md R0 Standards | "skill-layout.md:41 ... These are the duplications listed under Spec" | BUILDER | restates #90/#91; closed in round 1 |
| 101 | 5 | 5-refuter.md R0 Standards | "skill-layout.md:45 (\"One rule per bullet or item\"). These are the multi-rule bullets listed under Spec" | BUILDER | restates #95/#96 |
| 102 | 5 | 5-refuter.md R0 Standards | "The opening paragraph contradicts Steps 6 about what is committed" | BUILDER | restates #93 under change-standard rule 14 |
| 103 | 5 | 5-refuter.md R0 Behaviour | "Someone following Stops row 3 ... could refuse when an optional key is missing" | BUILDER | effect of #92 |
| 104 | 5 | 5-refuter.md R1 | "Row 15 ... still points at a place that does not hold its rule" | BUILDER | closed at landing (5-refuter.md:130) |
| 105 | 5 | 5-refuter.md R1 | "Stops row 1's When cell says \"Every plan, after step 2\"" | BUILDER | closed at landing (5-refuter.md:131) |
| 106 | 6 | 6-refuter.md R0 Spec | "The new file calls every refusal \"a stop\"" | BUILDER | brief 6.md:18 meaning kept; old file separates refusal and stop; closed in round 1 (plan.md:101) |
| 107 | 6 | 6-refuter.md R0 Spec | "\"another step\" drops the case where the step in flight is the same step" | BUILDER | closed in round 1 (plan.md:101) |
| 108 | 6 | 6-refuter.md R0 Spec | "the \"unless the block allows more than one\" condition is written twice" | BUILDER | brief 6.md:18; closed in round 1 |
| 109 | 6 | 6-refuter.md R0 Spec | "the same rule is written twice. Bullet 1 ... and bullet 2" | BUILDER | brief 6.md:18 "each written once"; closed in round 1 (reopened as #126) |
| 110 | 6 | 6-refuter.md R0 Spec | "This is added text and it is false: the worktree is created and not committed" | BUILDER | closed in round 1 |
| 111 | 6 | 6-refuter.md R0 Spec | "appears in the intro and again in the Quick start comment" | BUILDER | closed in round 1 |
| 112 | 6 | 6-refuter.md R0 Spec | "\"the session books it, and /spec runs again\" ... leave out who runs it" | BUILDER | brief 6.md:19 booking keeps meaning exactly; closed in round 1 |
| 113 | 6 | 6-refuter.md R0 Spec | "It is the folder's `plan.md` that opens with the heading" | BUILDER | closed in round 1 |
| 114 | 6 | 6-refuter.md R0 Spec | "row 51 ... The booking is in Stops 2 ... and no inventory row points at Stops 2" | BUILDER | closed in round 1 (6-refuter.md:123 "Row 66 now points at Stops 2") |
| 115 | 6 | 6-refuter.md R0 Spec | "row 10 ... Quick start. The sentence is also the new intro" | BUILDER | closed in round 1 |
| 116 | 6 | 6-refuter.md R0 Proof | "the report gives none [line count] for the inventory (wc -l: 71)" | BUILDER | change-standard rule 7; closed in round 1 |
| 117 | 6 | 6-refuter.md R0 Standards | "the heading \"When it stopped\" is a clause, not a noun-phrase label" | BUILDER | skill-layout.md:29; closed in round 1 (the section is gone, 6-refuter.md:112) |
| 118 | 6 | 6-refuter.md R0 Standards | "the booking of a ruling is an invocation's execution sequence ... written as unordered bullets" | BUILDER | skill-layout.md:28,46; closed in round 1 |
| 119 | 6 | 6-refuter.md R0 Standards | "change-standard.md rule 14 requires the report to quote the grep for renamed or removed names" | BUILDER | closed in round 1 (partly, reopened as #128) |
| 120 | 6 | 6-refuter.md R0 Standards | "The report ... gives no before and after for the changed text a /spec user reads" | BUILDER | change-standard rule 7; closed in round 1 (reopened as #129) |
| 121 | 6 | 6-refuter.md R0 Behaviour | "would write an open item into `orchestrator-state.md` ... The old file only refused" | BUILDER | effect of #106 |
| 122 | 6 | 6-refuter.md R0 Behaviour | "A second /spec on the step that is already in flight ... is not refused" | BUILDER | effect of #107 |
| 123 | 6 | 6-refuter.md R0 Behaviour | "a session could run /spec itself in the same turn" | BUILDER | effect of #112 |
| 124 | 6 | 6-refuter.md R1 | "Stops row 1 ... still says \"the skill refuses rather than guesses\"" | BUILDER | closed at landing (6-refuter.md:131) |
| 125 | 6 | 6-refuter.md R1 | "the pointer bullet in What it reads 3 now states the refusal with no condition" | BUILDER | closed at landing (6-refuter.md:132) |
| 126 | 6 | 6-refuter.md R1 | "The duplication moved inside one sentence and was not removed" | BUILDER | closed at landing (6-refuter.md:133) |
| 127 | 6 | 6-refuter.md R1 | "Stops row 5 names the file as `plan.yaml`" | BUILDER | closed at landing (6-refuter.md:134) |
| 128 | 6 | 6-refuter.md R1 | "The line paraphrases a `grep -rn` ... but does not quote the command or its output" | BUILDER | closed at landing (6-refuter.md:135) |
| 129 | 6 | 6-refuter.md R1 | "The report still does not show this user-visible rewording" | BUILDER | closed at landing (6-refuter.md:135) |
| 130 | 7 | 7-refuter.md R0 Spec | "\"or booked in the state file's open items\". plan.md:52, the user's ruling committed at d540160 (after bfc8370)" | OTHER | the user's ruling was committed after the step's base and brief (7-refuter.md:44, `git log` d540160); brief 7.md does not carry it; closed in round 1 (plan.md:108) |
| 131 | 7 | 7-refuter.md R0 Spec | "the negation is dropped from the place the inventory names" | BUILDER | brief 7.md:18; closed in round 1 |
| 132 | 7 | 7-refuter.md R0 Spec | "the item has the reviewer write into the ledger file" | BUILDER | closed in round 1 (plan.md:109) |
| 133 | 7 | 7-refuter.md R0 Spec | "the runs over the repair rounds no longer carry \"never the builder\"" | BUILDER | closed in round 1 (plan.md:109) |
| 134 | 7 | 7-refuter.md R0 Spec | "three rules put in a reference section ... no step or item points at \"After the review\"" | BUILDER | skill-layout.md:29,38-40; closed in round 1 |
| 135 | 7 | 7-refuter.md R0 Spec | "one bullet holds two rules" | BUILDER | closed in round 1 |
| 136 | 7 | 7-refuter.md R0 Spec | "Anti-patterns Do instead cells ... restates Steps 6" | BUILDER | ruling plan.md:51 in force; closed in round 1 |
| 137 | 7 | 7-refuter.md R0 Spec | "The new row applies the exception to all four, so a background shell or polling the brief lists becomes allowed" | BUILDER | closed in round 1 (7-refuter.md:129) |
| 138 | 7 | 7-refuter.md R0 Spec | "The file says it in a sentence above the table ... and has no such row" | BUILDER | skill-layout.md:30; closed in round 1 |
| 139 | 7 | 7-refuter.md R0 Spec | "inventories/refute.md:12 ... \"once per step before its first repair round\" is stated nowhere in the body" | BUILDER | closed in round 1 |
| 140 | 7 | 7-refuter.md R0 Spec | "inventories/refute.md:16 ... Steps 1 (line 42) does not hold \"changes nothing\"" | BUILDER | closed in round 1 |
| 141 | 7 | 7-refuter.md R0 Spec | "inventories/refute.md:22 ... The ledger folder is What it reads 2" | BUILDER | closed in round 1 |
| 142 | 7 | 7-refuter.md R0 Spec | "inventories/refute.md:73: points at Steps 7 ... which Steps 7 does not hold" | BUILDER | closed in round 1 |
| 143 | 7 | 7-refuter.md R0 Standards | "skills/land/SKILL.md:15 ... Once refute is corrected to the plan.md:52 ruling, this sentence is false" | OTHER | same late ruling as #130; land.md was outside the brief because the ruling postdated it; carried in the round (plan.md:107) |
| 144 | 7 | 7-refuter.md R0 Standards | "\"Everything in the brief is done\" and the judgment call at line 33 leave the plan.md:52 ruling unmet" | OTHER | same late ruling as #130 |
| 145 | 7 | 7-refuter.md R0 Behaviour | "A reviewer following Over a repair round 6 ... appends its findings ... itself" | BUILDER | effect of #132 |
| 146 | 7 | 7-refuter.md R0 Behaviour | "An orchestrator following Over a repair round has no item that saves the run's report" | BUILDER | closed in round 1 |
| 147 | 7 | 7-refuter.md R0 Behaviour | "reads only \"a fresh reviewer each time\" ... without \"never the builder\"" | BUILDER | effect of #133 |
| 148 | 7 | 7-refuter.md R0 Behaviour | "An orchestrator following line 68 books the last round's unfixed findings in the open items" | OTHER | effect of the late ruling, #130 |
| 149 | 7 | 7-refuter.md R1 | "The second clause restates Steps 7 ... and \"Over a repair round\" 6" | BUILDER | closed at landing (7-refuter.md:141) |
| 150 | 7 | 7-refuter.md R1 | "7-report.md:43 says land's step 5 red line ... \"is taken up in step 8\". Nothing books it" | BUILDER | the builder's report deferred work without booking it; closed at landing, "Carried in this step, not deferred" (7-refuter.md:142) |
| 151 | 7 | 7-refuter.md R1 | "the body of the report no longer matches the tree after the round" | BUILDER | closed at landing (7-refuter.md:143) |
| 152 | 8 | 8-refuter.md R0 Spec | "a step path carrying the user's unrelated change now falls under \"listed and left alone\", not a refusal" | BUILDER | brief 8.md:18; closed in round 1 (plan.md:116) |
| 153 | 8 | 8-refuter.md R0 Spec | "The new line 36 says \"Neither report present\", which refuses only when both files are absent" | BUILDER | closed in round 1 (reopened as #167) |
| 154 | 8 | 8-refuter.md R0 Spec | "this now reads as the builder report's Closed heading" | BUILDER | closed in round 1 (8-refuter.md:116) |
| 155 | 8 | 8-refuter.md R0 Spec | "The row \"A red line\" calls every unfixed red line a stop" | BUILDER | closed in round 1 (plan.md:116) |
| 156 | 8 | 8-refuter.md R0 Spec | "one bullet holds four rules" | BUILDER | closed in round 1 |
| 157 | 8 | 8-refuter.md R0 Spec | "one bullet holds two rules (afterwards `git status --short` shows nothing...)" | BUILDER | closed in round 1 |
| 158 | 8 | 8-refuter.md R0 Spec | "is separated from the revert that is its condition, so it reads as an unconditional rule" | BUILDER | closed in round 1 (8-refuter.md:116) |
| 159 | 8 | 8-refuter.md R0 Spec | "inventories/land.md:14: ... Quick start ... does not hold this rule" | BUILDER | closed in round 1 (reopened as #171) |
| 160 | 8 | 8-refuter.md R0 Spec | "The new file makes it a read with no refusal and no Stops row" | BUILDER | closed in round 1 (Stops 4 "no dispatch block", 8-refuter.md:116) |
| 161 | 8 | 8-refuter.md R0 Standards | "one rule per bullet ... see Spec" | BUILDER | restates #156-#158 |
| 162 | 8 | 8-refuter.md R0 Standards | "Line 36 restates the refusal's conditions, and they differ from line 94" | BUILDER | restates #153 |
| 163 | 8 | 8-refuter.md R0 Behaviour | "does not refuse when one of the step's paths on main carries an unrelated change" | BUILDER | effect of #152 |
| 164 | 8 | 8-refuter.md R0 Behaviour | "lands a step whose refuter report is older than the builder's report" | BUILDER | effect of #153 |
| 165 | 8 | 8-refuter.md R0 Behaviour | "may look for the Closed dispositions in the builder's report" | BUILDER | effect of #154 |
| 166 | 8 | 8-refuter.md R0 Behaviour | "would treat the landing as a stop and run `/land` again" | BUILDER | effect of #155 |
| 167 | 8 | 8-refuter.md R1 | "the claimed closure of the \"Neither\" finding changed a different condition" | BUILDER | closed at landing (8-refuter.md:124) |
| 168 | 8 | 8-refuter.md R1 | "the closure of the red-line finding lost part of old line 10" | BUILDER | closed at landing (8-refuter.md:125) |
| 169 | 8 | 8-refuter.md R1 | "one paragraph holds several rules" | BUILDER | closed at landing (8-refuter.md:126) |
| 170 | 8 | 8-refuter.md R1 | "items 4 and 5 still state them in full" | BUILDER | ruling plan.md:51; closed at landing (8-refuter.md:127) |
| 171 | 8 | 8-refuter.md R1 | "the title paragraph at line 10 still states it. The rule is now written twice" | BUILDER | closed at landing (8-refuter.md:128) |
| 172 | 9 | 9-refuter.md R0 Spec | "Step 3 ... has no condition, so it applies to `/plan-help` without an entry as well" | BUILDER | brief 9.md:18; closed in round 1 (9-refuter.md:113) |
| 173 | 9 | 9-refuter.md R0 Spec | "the rule \"It writes nothing\" is written twice" | BUILDER | closed in round 1 |
| 174 | 9 | 9-refuter.md R0 Spec | "no row covers the rule carried by the old heading at line 14, \"printed verbatim\"" | BRIEF | the inventory format fixed in step 3 (briefs/3.md:47, decision 3: "A heading line in the old file needs no row") and brief 9 did not provide for old headings that carry rules, though brief 9.md:7 names both headings; led to the ruling plan.md:54; visible before build: yes |
| 175 | 9 | 9-refuter.md R0 Spec | "\"prints the commands for running a plan by hand\" adds \"by hand\"" | BUILDER | closed in round 1 |
| 176 | 9 | 9-refuter.md R0 Spec | "introduces the term \"step files\", which neither the old file nor any other place ... defines" | BUILDER | closed in round 1 |
| 177 | 9 | 9-refuter.md R0 Proof | "The new file still has \"It writes nothing.\" in the opening paragraph" | BUILDER | report claim false; closed in round 1 |
| 178 | 9 | 9-refuter.md R0 Behaviour | "would, for `/plan-help` with no entry, attempt Step 3" | BUILDER | effect of #172 |
| 179 | 9 | 9-refuter.md R1 | "the check now accepts a row whose range is one heading line ... changing the check is outside the brief" | BRIEF | brief 9.md:11-14 lists only the skill and its inventory while fixing #174 needed the check changed; ruled at landing (plan.md:54, 9-refuter.md:121); visible before build: unclear, the need showed only after #174 |
| 180 | 9 | 9-refuter.md R1 | "The heading predicate was widened so that an inventory with rows for old lines 14 and 45 would pass" | REVIEWER-WRONG | orchestrator at landing: "the plan-help inventory passed without the heading rows, so the change was not made to turn a red check green" (9-refuter.md:121); sent to the builder: no, closed at landing |
| 181 | 9 | 9-refuter.md R1 | "Rule 13 of the change standard requires the control's red output to be quoted beside it" | BUILDER | closed at landing (9-refuter.md:122) |
| 182 | 9 | 9-refuter.md R1 | "the row for old heading line 45 carries two rules in one row" | BUILDER | closed at landing (9-refuter.md:123) |
| 183 | 10 | 10-refuter.md R0 Spec | "Read in execution order, that is a write before approval" | BUILDER | brief 10.md:18-19; closed in round 1 (10-refuter.md:114) |
| 184 | 10 | 10-refuter.md R0 Spec | "It now survives only as the Do instead cell of an anti-pattern whose subject is ... a page" | BUILDER | closed in round 1 |
| 185 | 10 | 10-refuter.md R0 Spec | "It is now tied to \"Overwriting an existing page or `.agents/plan.yaml`\", which is narrower" | BUILDER | closed in round 1 |
| 186 | 10 | 10-refuter.md R0 Spec | "citing is written twice" | BUILDER | closed in round 1 |
| 187 | 10 | 10-refuter.md R0 Spec | "the order of what is shown is written twice" | BUILDER | ruling plan.md:51; closed in round 1 |
| 188 | 10 | 10-refuter.md R0 Spec | "\"with the example's value as the offered answer\" is written in step 6 and again in the Stops row" | BUILDER | closed in round 1 |
| 189 | 10 | 10-refuter.md R0 Spec | "the Stops row \"A failing command\" repeats \"its exit status and its last lines\"" | BUILDER | closed in round 1 |
| 190 | 10 | 10-refuter.md R0 Spec | "\"Run from the repository root\" is written at Steps line 34 and again in the Quick start" | BUILDER | closed in round 1 |
| 191 | 10 | 10-refuter.md R0 Spec | "SKILL.md:64: one bullet holds two rules" | BUILDER | closed in round 1 |
| 192 | 10 | 10-refuter.md R0 Spec | "SKILL.md:65: one bullet holds two rules" | BUILDER | closed in round 1 |
| 193 | 10 | 10-refuter.md R0 Spec | "SKILL.md:49: one bullet holds two rules" | BUILDER | closed in round 1 |
| 194 | 10 | 10-refuter.md R0 Spec | "steps 10 and 11 each hold more than one action" | BUILDER | skill-layout.md:28; closed in round 1 |
| 195 | 10 | 10-refuter.md R0 Spec | "inventories/ordo-init.md:9: one row covers several rules of old line 3" | BUILDER | closed in round 1 (reopened as #211) |
| 196 | 10 | 10-refuter.md R0 Spec | "inventories/ordo-init.md:14: ... Quick start ... does not hold the pages part" | BUILDER | closed in round 1 |
| 197 | 10 | 10-refuter.md R0 Spec | "inventories/ordo-init.md:49: one row covers two rules of old line 36" | BUILDER | closed in round 1 |
| 198 | 10 | 10-refuter.md R0 Spec | "inventories/ordo-init.md:53: ... points at Stops 1, which does not state it" | BUILDER | closed in round 1 |
| 199 | 10 | 10-refuter.md R0 Spec | "inventories/ordo-init.md:63: ... points at Anti-patterns 1, where the rule holds only for pages" | BUILDER | closed in round 1 |
| 200 | 10 | 10-refuter.md R0 Standards | "the duplicates are the citing rule, and in the Stops rows ... the text repeated" | BUILDER | restates #186-#189 |
| 201 | 10 | 10-refuter.md R0 Standards | "\"One rule per bullet or item\"" (lines 49, 64, 65) | BUILDER | restates #191-#193 |
| 202 | 10 | 10-refuter.md R0 Standards | "\"one action per item\"" (lines 66-68) | BUILDER | restates #194 |
| 203 | 10 | 10-refuter.md R0 Standards | "Read in order, the new file contradicts both sentences" (README.md:83, repo-setup:59) | BUILDER | effect of #183; closed in round 1 (10-refuter.md:114) |
| 204 | 10 | 10-refuter.md R0 Behaviour | "adds `/<worktree_root>/` to `.gitignore` at step 9 ... before the approval stop" | BUILDER | effect of #183 |
| 205 | 10 | 10-refuter.md R0 Behaviour | "The old rule at line 56 required a diff approved like the draft" | BUILDER | effect of #185 |
| 206 | 10 | 10-refuter.md R0 Behaviour | "the check runs a second time even when there was no error and no fix" | BUILDER | closed in round 1 |
| 207 | 10 | 10-refuter.md R0 Behaviour | "Drafting `.agents/plan.yaml` values ... is no longer bound by \"draws only from the repository\"" | BUILDER | effect of #184 |
| 208 | 10 | 10-refuter.md R1 | "the row for old line 28 ... still points at Stops 3" | BUILDER | closed at landing (10-refuter.md:122) |
| 209 | 10 | 10-refuter.md R1 | "the row for old line 25 ... points at Stops 4 ... The row also covers two rules" | BUILDER | closed at landing |
| 210 | 10 | 10-refuter.md R1 | "the row for old line 10 covers three rules" | BUILDER | closed at landing |
| 211 | 10 | 10-refuter.md R1 | "the row for old line 3 still joins two rules in one row" | BUILDER | closed at landing |
| 212 | 10 | 10-refuter.md R1 | "two sentences now state the diff requirement for `.gitignore`, and their scopes differ" | BUILDER | closed at landing (10-refuter.md:123) |
| 213 | 10 | 10-refuter.md R1 | "check-mode step 4 ... still holds two actions" | BUILDER | closed at landing (10-refuter.md:124) |
| 214 | 11 | 11-refuter.md R0 Spec | "\"**The introduction's rules.** They bind the skill.\" now binds the skill to every rule of the introduction" | BRIEF | the reviewer notes "The brief's ... uses the same wide wording" (brief 11.md:18 "the rules the roadmap file's introduction states keep binding the skill"); round 1 narrowed it back to the status rules (11-refuter.md R1 "narrowed back"); visible before build: yes, old line 33 says "These rules" |
| 215 | 11 | 11-refuter.md R0 Spec | "The new row narrows \"nothing\" to entries and dependencies" | BUILDER | closed in round 1 |
| 216 | 11 | 11-refuter.md R0 Spec | "\"Deleting a dropped entry\" forbids any deletion ... the rule is strengthened" | BUILDER | closed in round 1 ("silently" restored) |
| 217 | 11 | 11-refuter.md R0 Spec | "SKILL.md:97: one bullet holds two rules" | BUILDER | closed in round 1 |
| 218 | 11 | 11-refuter.md R0 Spec | "the Levels bullet holds three rules" | BUILDER | closed in round 1 |
| 219 | 11 | 11-refuter.md R0 Spec | "\"asked about once ... the answer is used from then on\" is written twice" | BUILDER | ruling plan.md:51; closed in round 1 |
| 220 | 11 | 11-refuter.md R0 Spec | "the item where a missing dependency is found does not point at Stops row 5" | BUILDER | ruling plan.md:51; closed in round 1 |
| 221 | 11 | 11-refuter.md R0 Spec | "Use instead row 1 ... repeats the refusal already stated" | BUILDER | closed in round 1 |
| 222 | 11 | 11-refuter.md R0 Spec | "one paragraph holds two rules: stops wait on the user; refusals name their cause" | BUILDER | closed in round 1 |
| 223 | 11 | 11-refuter.md R0 Spec | "inventories/roadmap.md:9: row ... covers several rules from the description line" | BUILDER | closed in round 1 (reopened as #230) |
| 224 | 11 | 11-refuter.md R0 Spec | "inventories/roadmap.md:14: ... Quick start line 20 holds only the invocation" | BUILDER | closed in round 1 |
| 225 | 11 | 11-refuter.md R0 Standards | "more than one rule per bullet or paragraph" | BUILDER | restates #217, #218, #222 |
| 226 | 11 | 11-refuter.md R0 Standards | "the same rule is written in two sections" | BUILDER | restates #219, #221 |
| 227 | 11 | 11-refuter.md R0 Behaviour | "would edit the roadmap file for done and drop before the approval stop" | BUILDER | brief 11.md:18 "nothing is written before approval"; closed in round 1 |
| 228 | 11 | 11-refuter.md R0 Behaviour | "a runner following add's steps has no step at which the missing dependency is raised" | BUILDER | effect of #220 |
| 229 | 11 | 11-refuter.md R1 | "The Anti-patterns row \"Implementation narration ...\" has \"Rules 1\" as its Do instead" | BUILDER | closed at landing (11-refuter.md Closed 1) |
| 230 | 11 | 11-refuter.md R1 | "Some clauses of the description still have no row" | BUILDER | closed at landing (Closed 2) |
| 231 | 11 | 11-refuter.md R1 | "Steps / drop 1 drafts the move, and only then does drop 2 refuse" | BUILDER | closed at landing (Closed 3) |
| 232 | 12 | 12-refuter.md R0 Spec | "Steps 3 holds three actions in one numbered item" | BUILDER | skill-layout.md:28; closed in round 1 (12-refuter.md R1 paragraph) |
| 233 | 12 | 12-refuter.md R0 Spec | "Steps 7 holds two actions" | BUILDER | closed in round 1 |
| 234 | 12 | 12-refuter.md R0 Spec | "Adding \"approved\" narrows the rule" | BUILDER | brief 12.md:18; closed in round 1 |
| 235 | 12 | 12-refuter.md R0 Spec | "inventories/plan-retro.md:12 ... points at Steps 7 ... does not state that nothing else changes" | BUILDER | closed in round 1 |
| 236 | 12 | 12-refuter.md R0 Spec | "inventories/plan-retro.md:10: one row covers two rules" | BUILDER | closed in round 1 |
| 237 | 12 | 12-refuter.md R0 Spec | "inventories/plan-retro.md:19: one row covers three rules" | BUILDER | closed in round 1 |
| 238 | 12 | 12-refuter.md R0 Spec | "inventories/plan-retro.md:30: ... The row covers two rules and misplaces one" | BUILDER | closed in round 1 |
| 239 | 12 | 12-refuter.md R0 Spec | "inventories/plan-retro.md:36: one row covers two rules" | BUILDER | closed in round 1 |
| 240 | 12 | 12-refuter.md R0 Proof | "the report introduces the grep output as \"(refute's own \"What it writes\")\" ... The parenthetical is false" | BUILDER | closed in round 1 |
| 241 | 12 | 12-refuter.md R0 Standards | "The report leaves out several [user-visible changes]" | BUILDER | change-standard rule 7; closed in round 1 |
| 242 | 12 | 12-refuter.md R0 Behaviour | "A check proposal the user corrects rather than approves ... it is not" | BUILDER | effect of #234 |
| 243 | 12 | 12-refuter.md R1 | "the collector command block has no language tag" | BUILDER | closed at landing (12-refuter.md Closed 1) |
| 244 | 12 | 12-refuter.md R1 | "\"before, four prose sections\" does not match the old file" | BUILDER | closed at landing (Closed 2) |
| 245 | 13 | 13-refuter.md R0 Spec 1 | "This step waits for the user's answers, but the Stops table ... has no row for it" | BUILDER | closed in round 1 (13-refuter.md Closed "First run") |
| 246 | 13 | 13-refuter.md R0 Spec 2 | "\"No file of the tree\" narrows it" | BUILDER | brief 13.md:18 "nothing written before the user approves"; closed in round 1 |
| 247 | 13 | 13-refuter.md R0 Spec 3 | "\"One\" is lost from the step" | BUILDER | closed in round 1 |
| 248 | 13 | 13-refuter.md R0 Spec 4 | "sync steps 5 to 7 belong only to exit 2 ... the new text does not state that condition" | BUILDER | brief 13.md:18 sync exit statuses keep meaning; closed in round 1 |
| 249 | 13 | 13-refuter.md R0 Spec 5 | "The first clause repeats The questions 6" | BUILDER | closed in round 1 |
| 250 | 13 | 13-refuter.md R0 Spec 6 | "\"11. Run the checks, and show each one's output\" is two actions in one item" | BUILDER | brief 13.md:18 one action per item; closed in round 1 |
| 251 | 13 | 13-refuter.md R0 Spec 7 | "\"One of those, or an empty folder\" is stricter than the old rule" | BUILDER | closed in round 1 |
| 252 | 13 | 13-refuter.md R0 Spec 8 | "the row for old line 84 holds two rules" | BUILDER | closed in round 1 |
| 253 | 13 | 13-refuter.md R0 Spec 9 | "each row holds two rules: show the draft (Steps 4) and write nothing before that" | BUILDER | closed in round 1 |
| 254 | 13 | 13-refuter.md R0 Spec 10 | "\"One commit by explicit path list ...\" to Steps 12, which does not hold \"one\"" | BUILDER | closed in round 1 |
| 255 | 13 | 13-refuter.md R0 Spec 11 | "What it reads leaves out the `ordo-init` skill's `templates/check_config.py`" | BUILDER | closed in round 1 |
| 256 | 13 | 13-refuter.md R0 Proof 1 | "The rerun prints \"2 files changed, 119 insertions(+), 42 deletions(-)\"" | BUILDER | closed in round 1 |
| 257 | 13 | 13-refuter.md R0 Proof 2 | "the command column quotes one command and the output column the output of another" | BUILDER | closed in round 1 |
| 258 | 13 | 13-refuter.md R0 Standards 1 | "The list leaves out the new title paragraph ... the new What it reads section" | BUILDER | change-standard rule 7; closed in round 1 |
| 259 | 13 | 13-refuter.md R0 Behaviour 1 | "after `sync` exits 1, the new list reads as if it goes on to rerun the check" | BUILDER | effect of #248 |
| 260 | 13 | 13-refuter.md R0 Behaviour 2 | "after, only files of the tree are covered. See Spec 2" | BUILDER | effect of #246 |
| 261 | 13 | 13-refuter.md R0 Behaviour 3 | "the refusal's resume path now names \"an empty folder\". See Spec 7" | BUILDER | effect of #251 |
| 262 | 13 | 13-refuter.md R1 Spec 1 | "under `sync` exit 1 it can be read as forbidding the `--write`" | BUILDER | the round's fix of #246 overreached; fixed at landing (13-refuter.md Closed) |
| 263 | 13 | 13-refuter.md R1 Standards 1 | "names another skill's file with the skill's name in code" | BUILDER | skill-layout.md "Paths and names"; fixed at landing |
| 264 | 13 | 13-refuter.md R1 Behaviour 1 | "the same as Spec 1" | BUILDER | restates #262; fixed at landing |
| 265 | 14 | 14-refuter.md R0 Spec 1 | "No brief item asks for it; report row 2 lists it inside item 2. The sentence is accurate" | BUILDER | the fix was to list it in the report as outside the items; closed in round 1 (14-refuter.md:122) |
| 266 | 14 | 14-refuter.md R0 Proof 1 | "row 4 quotes the output of a landing run that has not happened" | BUILDER | closed in round 1 |
| 267 | 14 | 14-refuter.md R0 Proof 2 | "the grep ... is paraphrased with no command and no output" | BUILDER | brief 14.md:28 asks for the grep with its output; closed in round 1 |
| 268 | 14 | 14-refuter.md R0 Standards 1 | "\"The green check is every test below passing\" ... The block now holds two commands that are not tests" | BRIEF | brief 14.md:14 puts a non-test command into the block building.md:3 describes as tests, and its grep list (14.md:22) would not find that sentence; visible before build: yes |
| 269 | 14 | 14-refuter.md R0 Standards 2 | "\"its output goes through a filter for its summary lines\" now contradicts line 49, which has no filter" | BRIEF | brief 14.md:15 places the command in the change-standard block whose preamble says each command is filtered, without naming that sentence; visible before build: yes |
| 270 | 14 | 14-refuter.md R0 Behaviour 2 | "the report describes the new sentence without quoting it" | BUILDER | closed in round 1 |

Items in plan 1 reports that are not counted as findings (the reviewer states in the bullet that there is no defect, or the bullet only records what holds): 2-refuter.md R0 Proof bullet "2-report.md:17 ... recorded, not a defect"; 2-refuter.md R0 Behaviour "Running the check on the current skills exits 1. That is expected"; 3-refuter.md R0 Proof "Inputs handled correctly"; 4-refuter.md R0 Standards "Other checks, none"; 5-refuter.md R0 Standards "Nothing to report on these"; 5-refuter.md R0 Behaviour "No rule of the old file conflicts with this order"; 5-refuter.md R1 "The other closures hold"; 6-refuter.md R0 Proof "Otherwise none"; 6-refuter.md R1 "Checked, no defect found"; 7-refuter.md R1 "the ruling carried ... The closure holds" and "The other closures ... hold"; 8-refuter.md R0 Behaviour "unchanged: none"; 8-refuter.md R1 "Checked and holding"; 9-refuter.md R1 "This bullet reports no defect" and "No finding here"; 10-refuter.md R1 "Closures verified as holding"; 11-refuter.md R1 "Closures checked, all hold"; 12-refuter.md R0 Behaviour "Nothing else found"; 13-refuter.md R0 Proof 3, Standards 2; 13-refuter.md R1 Proof 1 ("No fix needed"); 14-refuter.md R0 Spec 2, Proof 3, Standards 3, Behaviour 1 ("the report states the before and after"); 14-refuter.md R1 (all four headings "none").

## Plan 2: 2-coverage-inventory-of-the-academic-skills

Report paths are under `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/`; briefs under `.../agents/briefs/`. This plan's executor was also inline (plan.md, Rulings): BUILDER means the orchestrating session building the step. For steps 3 to 6 the "builder" work is reading source files and writing marks and reasons, so BUILDER there covers misreadings of the source files. Numbering restarts at 1.

| # | Step | Report, section | Finding (quote) | Cause | Evidence |
|---|---|---|---|---|---|
| 1 | 1 | 1-refuter.md R0 Spec 1 | "the brief's \"an empty table\" edge has no case for a named skill" | BUILDER | brief 1.md:44 lists the edge; closed in round 1 (1-refuter.md:109) |
| 2 | 1 | 1-refuter.md R0 Spec 2 | "only the empty entry cell is tested; `if not entry:` leaves the test green" | BUILDER | brief 1.md:43; closed in round 1 |
| 3 | 1 | 1-refuter.md R0 Spec 3 | "lettered entries are matched as `## 2.A. `, which the roadmap does not use" | BRIEF | brief 1.md:36 defines an entry as a heading `## <n>. `, which the roadmap's lettered entry `## 2.A Launch notes ...` does not follow; plan.md step 1 booking: "lettered roadmap entries read as the roadmap writes them"; visible before build: yes, `docs/roadmap.md:26` |
| 4 | 1 | 1-refuter.md R0 Spec 4 | "blank lines are dropped before the table is read, so a row after a blank line is merged" | BUILDER | brief 1.md:44 "a row after the table"; closed in round 1 |
| 5 | 1 | 1-refuter.md R0 Proof 1 | "the no-write assertion cannot fail" | BUILDER | brief 1.md:45; closed in round 1 |
| 6 | 1 | 1-refuter.md R0 Proof 2 | "\"a lettered entry (`2.A`)\" is claimed for the complete list, which holds none" | BUILDER | closed in round 1 |
| 7 | 1 | 1-refuter.md R0 Proof 3 | "Rules no case turns red (each revert left `PASS`)" | BUILDER | brief 1.md:43 each case red without the rule; closed in round 1 |
| 8 | 1 | 1-refuter.md R0 Standards 1 | "`order` is written and never read" | BUILDER | change-standard rule 11; closed in round 1 |
| 9 | 1 | 1-refuter.md R0 Standards 2 | "the docstring's usage-error list leaves out a list outside a git repository" | BUILDER | closed in round 1 |
| 10 | 1 | 1-refuter.md R0 Standards 3 | "a second fence reader, unlike the one `check_skill_layout.py` and `check_rule_inventory.py` share" | BUILDER | closed in round 1 |
| 11 | 1 | 1-refuter.md R0 Standards 4 | "the head comment is false (Proof 2)" | BUILDER | restates #6 |
| 12 | 1 | 1-refuter.md R0 Behaviour 1 | "a skill folder that is a symlink lists no file, and an empty table passes" | BUILDER | closed in round 1 |
| 13 | 1 | 1-refuter.md R0 Behaviour 2 | "a table indented four spaces (a code block in Markdown) is read as the table" | BUILDER | closed in round 1 |
| 14 | 1 | 1-refuter.md R0 Behaviour 3 | "Exit 2 outside a git repository and for a missing roadmap or list is not stated" | BUILDER | closed in round 1 |
| 15 | 1 | 1-refuter.md R1 Proof 1 | "exit 2 for a missing coverage list or `docs/roadmap.md` ... has no case" | BUILDER | fixed at landing (1-refuter.md:111) |
| 16 | 1 | 1-refuter.md R1 Proof 2 | "the backtick-in-info-string rule has no case" | BUILDER | fixed at landing |
| 17 | 1 | 1-refuter.md R1 Proof 3 | "the runs at test lines 332, 343 and 349 take no snapshot" | BUILDER | fixed at landing |
| 18 | 1 | 1-refuter.md R1 Behaviour 1 | "a link nested inside a skill folder has its files neither required nor accepted" | BUILDER | fixed at landing (1-refuter.md:114) |
| 19 | 1 | 1-refuter.md R1 Behaviour 2 | "table rows inside fenced code are read" | BUILDER | fixed at landing |
| 20 | 1 | 1-refuter.md R1 Behaviour 3 | "a heading's closing hashes are kept in its name" | BUILDER | fixed at landing |
| 21 | 2 | 2-refuter.md R0 Spec 1 | "the \"passes\" list leaves out behaviour the test covers and a reader needs" | BUILDER | brief 2.md:12 a bullet stating what the test checks; closed in round 1 |
| 22 | 2 | 2-refuter.md R0 Spec 2 | "\"It also checks the usage errors that exit 2\" claims all of them" | BUILDER | closed in round 1 |
| 23 | 2 | 2-refuter.md R0 Spec 3 | "\"a skill named twice, an empty cell\" reads as any table's empty cell" | BUILDER | closed in round 1 |
| 24 | 2 | 2-refuter.md R1 Spec 1 | "\"a skill named twice on the command line and checked once\" sits among the passing cases" | BUILDER | fixed at landing (2-refuter.md:98) |
| 25 | 2 | 2-refuter.md R1 Spec 2 | "the dot is in the roadmap heading (`## 6.B. `), not in the New skills entry" | BUILDER | fixed at landing |
| 26 | 2 | 2-refuter.md R1 Spec 3 | "\"a wrong cell count, table header or separator\": the test covers only a missing separator row" | BUILDER | fixed at landing |
| 27 | 3 | 3-refuter.md R0 Spec 1 | "The APA guide is marked `rebuild later` although it holds the only statistics rules" | BUILDER | brief 3.md:14-15 mark definitions; closed in round 1 (3-refuter.md:153) |
| 28 | 3 | 3-refuter.md R0 Spec 2 | "The policy-anchor drop says one rule carries over, but the file holds three that no kept file states" | BUILDER | closed in round 1 in substance, rest at landing |
| 29 | 3 | 3-refuter.md R0 Spec 3 | "The plan-mode drop names the wrong file as keeping the activation rules" | BUILDER | closed in round 1 (3-refuter.md:155) |
| 30 | 3 | 3-refuter.md R0 Spec 4 | "The CRediT template row misplaces one checklist item" | BUILDER | closed in round 1 |
| 31 | 3 | 3-refuter.md R0 Standards 5 | "Two rows exceed the brief's limit of two sentences" | BUILDER | brief 3.md:17 "in one sentence or two"; closed in round 1 |
| 32 | 3 | 3-refuter.md R0 Standards 6 | "Several rows break the prose standard's sentence length" | BUILDER | brief 3.md:23 prose standard; not closed in round 1, fixed at landing (3-refuter.md:196) |
| 33 | 3 | 3-refuter.md R0 Behaviour 7 | "The paper skill's disclosure step would read files that do not exist until entry 13" | BUILDER | closed in round 1; brief 4.md:24 then added the rule for later steps |
| 34 | 3 | 3-refuter.md R0 Behaviour 8 | "The intro's check command fails on the tree as it stands" | OTHER | the plan builds the list over steps 3 to 6 (plan.md:20-23), so an introduction and command for the four skills are false until step 6; brief 3.md:12 asks for "the command that checks it" without saying which form; closed in round 1 with the per-skill form |
| 35 | 3 | 3-refuter.md R1 Spec 1 | "\"Three venue-neutral rules\" includes a copyediting carve-out that differs by venue" | BUILDER | the round's own text; fixed at landing (3-refuter.md:197) |
| 36 | 3 | 3-refuter.md R1 Spec 2 | "\"no other file states\" is false for two of the three rules" | BUILDER | fixed at landing |
| 37 | 3 | 3-refuter.md R1 Spec 3 | "The fix for finding 4 also removed \"an equal-contribution sentence\"" | BUILDER | fixed at landing (3-refuter.md:198) |
| 38 | 3 | 3-refuter.md R1 Spec 4 | "The delta cut, from rows no finding named, clauses saying where parts of a split file go" | BUILDER | brief 3.md:22; fixed at landing (3-refuter.md:199) |
| 39 | 3 | 3-refuter.md R1 Spec 5 | "\"never filled from the model's memory\" is stronger than the source" | BUILDER | fixed at landing (3-refuter.md:200) |
| 40 | 3 | 3-refuter.md R1 Proof 1 | "The report's round item 6 presents cutting reasons of 70 words or more as the closure of finding 6" | BUILDER | report defect; disposition: "the report's round item stands as written; the finding it describes is closed at landing" (3-refuter.md:201) |
| 41 | 3 | 3-refuter.md R1 Standards 1 | "Prose standard section E, sentence length, broken in the 14 rows" | BUILDER | same as the Closures 6 note; fixed at landing (3-refuter.md:196) |
| 42 | 3 | 3-refuter.md R1 Behaviour 1 | "docs/academic-coverage.md:3 says the list covers every file ... while only `academic-paper` has a section" | OTHER | same sequencing cause as #34; fixed at landing (3-refuter.md:202) |
| 43 | 3 | 3-refuter.md R1 Behaviour 2 | "docs/academic-coverage.md:89 and :90 put venue rules for the same venues in two places" | BUILDER | restates #35; fixed at landing |
| 44 | 4 | 4-refuter.md R0 Spec 1 | "Writing the score first is the fix; the trap is \"Positivity-severity oscillation\"" | BUILDER | misreading of the source; closed in round 1 (4-refuter.md closures) |
| 45 | 4 | 4-refuter.md R0 Spec 2 | "\"nothing is conceded below four or twice in a row\". The source raises the bar" | BUILDER | closed in round 1 |
| 46 | 4 | 4-refuter.md R0 Spec 3 | "\"consensus counted over all reviewers\". The denominator is \"the 4 non-DA reviewers\"" | BUILDER | closed in round 1 |
| 47 | 4 | 4-refuter.md R0 Spec 4 | "\"The user confirms the cards before the reviews\" is not in the file" | BUILDER | closed in round 1 |
| 48 | 4 | 4-refuter.md R0 Spec 5 | "the methodology reviewer's fallacy table already lists overfitting" | BUILDER | closed in round 1 |
| 49 | 4 | 4-refuter.md R0 Spec 6 | "the reason does not say where \"Phase 2.5: REVISION COACHING\" goes" | BUILDER | brief 4.md:23; closed in round 1 |
| 50 | 4 | 4-refuter.md R0 Spec 7 | "`agents/perspective_reviewer_agent.md` marked `rebuild later`: entry 6's gate compares against academic-paper-reviewer, which runs R3" | BUILDER | closed in round 1 |
| 51 | 4 | 4-refuter.md R0 Spec 8 | "`references/statistical_reporting_standards.md` marked `rebuild later`: ... names it the primary reference" | BUILDER | closed in round 1 |
| 52 | 4 | 4-refuter.md R0 Spec 9 | "\"keeps one scale\" without saying which" | BUILDER | closed in round 1 |
| 53 | 4 | 4-refuter.md R0 Spec 10 | "`references/top_journals_by_field.md` dropped with a replacement rule no kept file states" | BUILDER | brief 4.md:25; not closed in round 1, fixed at landing (4-refuter.md Closed, Proof 3 and Behaviour 1) |
| 54 | 4 | 4-refuter.md R0 Spec 11 | "the traceability check applies to Priority 1 items only" | BUILDER | closed in round 1 |
| 55 | 4 | 4-refuter.md R0 Proof 2 | "Report item 4 claims the prose standard DONE; Standards 1 contradicts it" | BUILDER | closed in round 1 |
| 56 | 4 | 4-refuter.md R0 Proof 3 | "The report shows the introduction's check command only after the change, with no before and after" | BUILDER | change-standard rule 7; closed in round 1 |
| 57 | 4 | 4-refuter.md R0 Standards 1 | "15 of 26 reasons open \"The <thing>: <list>.\" ... a repeated construction" | BUILDER | prose standard section 0; closed in round 1 |
| 58 | 4 | 4-refuter.md R0 Standards 2 | "\"the sprint-contract phases follow ...\" appears word for word three times" | BUILDER | partly closed in round 1, rest at landing |
| 59 | 4 | 4-refuter.md R0 Behaviour 1 | "(\"the reason names where the rest goes\") is false for lines 114 and 131" | BUILDER | effect of #49, #54 |
| 60 | 4 | 4-refuter.md R0 Behaviour 2 | "docs/academic-coverage.md:16 is false for line 136 (Spec 10)" | BUILDER | effect of #53 |
| 61 | 4 | 4-refuter.md R1 Spec 1 | "\"Eleven modes run an eight-phase flow\"; the eight phases are the `full` flow" | BUILDER | introduced by the round's rewrite of landed rows; fixed at landing |
| 62 | 4 | 4-refuter.md R1 Spec 2 | "the trace and \"roadmap entry 5 names figures\" read as part of the ten checks" | BUILDER | same; fixed at landing |
| 63 | 4 | 4-refuter.md R1 Spec 3 | "no clause says where the sprint-contract sections ... go" | BUILDER | fixed at landing |
| 64 | 4 | 4-refuter.md R1 Spec 4 | "turns the source's option into a restriction" | BUILDER | fixed at landing |
| 65 | 4 | 4-refuter.md R1 Spec 5 | "the round removed \"at most two major rounds\" and \"an accept needs every required item fully addressed\"" | BUILDER | fixed at landing |
| 66 | 4 | 4-refuter.md R1 Spec 6 | "\"An outline is chosen from the paper type\"; the source chooses a structure" | BUILDER | fixed at landing |
| 67 | 4 | 4-refuter.md R1 Spec 7 | "the round rewrote 27 landed rows, which the report's DONE table does not list" | UNCLEAR | the disposition (4-refuter.md Closed, Spec 7) rules the rewrites in scope, "which the brief requires of the whole list", and fixes the facts under Spec 1, 2 and 6; it does not say whether the report was made to list the rewrites, so whether the reported defect (the unlisted rewrites) was accepted or rejected cannot be settled from the files |
| 68 | 4 | 4-refuter.md R1 Proof 1 | "The report says the sprint-contract clause names where the phases go; only line 117 names a file" | BUILDER | fixed at landing |
| 69 | 4 | 4-refuter.md R1 Proof 2 | "The report says the perspective edge case is as the source states it (Spec 4)" | BUILDER | fixed at landing |
| 70 | 4 | 4-refuter.md R1 Proof 3 | "The report says the journals row points at the reviewer rows; the brief requires a file" | BUILDER | brief 4.md:25; fixed at landing |
| 71 | 4 | 4-refuter.md R1 Standards 1 | "\"not carried\" ends a reason 29 times" | BUILDER | fixed at landing |
| 72 | 4 | 4-refuter.md R1 Standards 2 | "Lines 53 and 85 carry nearly the same sentence" | BUILDER | fixed at landing |
| 73 | 4 | 4-refuter.md R1 Standards 3 | "Lines 116 and 118 end on the same clause" | BUILDER | fixed at landing |
| 74 | 4 | 4-refuter.md R1 Standards 4 | "Lines 76 and 126 end with the same sentence" | BUILDER | fixed at landing |
| 75 | 4 | 4-refuter.md R1 Behaviour 1 | "the dropped file's venue selection has no replacement" | BUILDER | fixed at landing |
| 76 | 5 | 5-refuter.md R0 Spec 1 | "\"follows the stage order and checkpoints ... without adding a rule\" is false" | BUILDER | misreading of the source; closed in round 1 (partly; reopened as #96) |
| 77 | 5 | 5-refuter.md R0 Spec 2 | "the coaching it holds ... is in `agents/pipeline_orchestrator_agent.md` ... not in `references/external_review_protocol.md`" | BUILDER | closed in round 1 |
| 78 | 5 | 5-refuter.md R0 Spec 3 | "sending the lookup rules to `literature` (entry 9) leaves the paper skill's integrity and DOI checks (entry 5) without them" | BUILDER | brief 5.md:24 forbids sending first-gate content to a later entry; closed in round 1 |
| 79 | 5 | 5-refuter.md R0 Spec 4 | "split files whose reasons do not say where the rest goes" | BUILDER | brief 5.md:23; partly closed in round 1, rest at landing |
| 80 | 5 | 5-refuter.md R0 Spec 5 | "its content is repeated in the integrity agent's Phase E ... the reason does not say so" | BUILDER | closed in round 1 |
| 81 | 5 | 5-refuter.md R0 Spec 6 | "\"falls outside roadmap entry 5's goal\" contradicts a mark that says the file belongs to the paper skill" | BUILDER | closed in round 1 |
| 82 | 5 | 5-refuter.md R0 Spec 7 | "\"never accepted wholesale by default\" is the opposite of the file's default" | BUILDER | closed in round 1 |
| 83 | 5 | 5-refuter.md R0 Spec 8 | "the state tracker holds the audit trail, but line 147 says the researcher takes only its prerequisite table" | BUILDER | closed in round 1 |
| 84 | 5 | 5-refuter.md R0 Spec 9 | "the reset applies only with `ARS_PASSPORT_RESET=1`" | BUILDER | closed in round 1 |
| 85 | 5 | 5-refuter.md R0 Spec 10 | "Stage 4.5's originality check is a 50 percent sample" | BUILDER | closed in round 1 |
| 86 | 5 | 5-refuter.md R0 Spec 11 | "checkpoints stay mandatory at review decisions and Stage 5 as well as integrity checks" | BUILDER | closed in round 1 |
| 87 | 5 | 5-refuter.md R0 Spec 12 | "the advisory has four dimensions including geography" | BUILDER | closed in round 1 (partly; reopened as #98) |
| 88 | 5 | 5-refuter.md R0 Standards 1 | "Endings \"is/are not carried.\" ... and \"left out.\" ... recur" | BUILDER | brief 5.md:26 no recurring shape; closed in round 1 |
| 89 | 5 | 5-refuter.md R0 Standards 2 | "\"The researcher('s X) take(s) Y\" recurs" | BUILDER | closed in round 1 |
| 90 | 5 | 5-refuter.md R0 Standards 3 | "Drop rows repeat \", so no/nothing ...\"" | BUILDER | closed in round 1 |
| 91 | 5 | 5-refuter.md R0 Standards 4 | "Passive openers where the actor matters" | BUILDER | closed in round 1 |
| 92 | 5 | 5-refuter.md R0 Standards 5 | "Unclear wording: \"takes these over plan-orchestration\"" | BUILDER | closed in round 1 |
| 93 | 5 | 5-refuter.md R0 Behaviour 1 | "Line 18 of the introduction is false for lines 145 and 146 (Spec 4)" | BUILDER | effect of #79; not closed in round 1, fixed at landing |
| 94 | 5 | 5-refuter.md R1 Spec 1 | "the orchestrator reason omits the Cite-Time Provenance Finalizer ... the round removed the fallback" | BUILDER | fixed at landing (5-refuter.md Closed, Spec 1) |
| 95 | 5 | 5-refuter.md R1 Spec 2 | "Lines 148 and 166 contradict each other" | BUILDER | fixed at landing, mark changed to `rebuild: paper` |
| 96 | 5 | 5-refuter.md R1 Spec 3 | "\"two revision cycles\" is false; the run has one revision round" | BUILDER | fixed at landing |
| 97 | 5 | 5-refuter.md R1 Spec 4 | "the adaptive checkpoint system ... is neither assigned nor declared dropped" | BUILDER | fixed at landing |
| 98 | 5 | 5-refuter.md R1 Spec 5 | "gap identification and title-then-full-text screening are no longer named" | BUILDER | fixed at landing |
| 99 | 5 | 5-refuter.md R1 Proof 1 | "Lines 76 and 157 both end \"a new skill needs.\", against the report's four-word-ending claim" | BUILDER | fixed at landing |
| 100 | 5 | 5-refuter.md R1 Proof 2 | "The report says line 55 names the gaps again; it does not" | BUILDER | fixed at landing |
| 101 | 5 | 5-refuter.md R1 Proof 3 | "A judgment call says the researcher gets only the prerequisite table and entry" | BUILDER | fixed at landing |
| 102 | 5 | 5-refuter.md R1 Standards 1 | "\"nothing is kept of X\" recurs" | BUILDER | fixed at landing |
| 103 | 5 | 5-refuter.md R1 Standards 2 | "share the shape \"X go(es) to A, Y to B, and Z are dropped\"" | BUILDER | fixed at landing |
| 104 | 5 | 5-refuter.md R1 Standards 3 | "\", which makes X unnecessary\" closes lines 154 and 162" | BUILDER | fixed at landing |
| 105 | 5 | 5-refuter.md R1 Standards 4 | "Lines 76 and 157 share an ending" | BUILDER | fixed at landing |
| 106 | 5 | 5-refuter.md R1 Standards 5 | "Unclear: line 63 \"in general rather than clinical wording\"" | BUILDER | fixed at landing |
| 107 | 5 | 5-refuter.md R1 Standards 6 | "Sentence fragments: lines 53, 62, and untouched rows" | BUILDER | fixed at landing |
| 108 | 5 | 5-refuter.md R1 Standards 7 | "Passive where the actor matters: line 161" | BUILDER | fixed at landing |
| 109 | 5 | 5-refuter.md R1 Behaviour 1 | "Line 18 is false for lines 145 and 146" | BUILDER | fixed at landing |
| 110 | 6 | 6-refuter.md R0 Spec 1 | "neither ... `eic_agent.md` nor its `references/quality_rubrics.md` states \"no Accept while a critical issue stands\"" | BUILDER | brief 6.md:25 (same text as 4.md:25); closed in round 1 |
| 111 | 6 | 6-refuter.md R0 Spec 2 | "\"removes a reference no method confirms\" is wrong" | BUILDER | misreading of the source; closed in round 1 |
| 112 | 6 | 6-refuter.md R0 Spec 3 | "the file holds more search rules than one ... which the row neither places nor drops" | BUILDER | partly closed in round 1, rest at landing |
| 113 | 6 | 6-refuter.md R0 Spec 4 | "the peer-review definition, the source tiers ... are neither placed nor dropped" | BUILDER | partly closed in round 1, rest at landing |
| 114 | 6 | 6-refuter.md R0 Spec 5 | "Split files without a destination for part of their content" | BUILDER | brief 6.md:23; partly closed in round 1, rest at landing |
| 115 | 6 | 6-refuter.md R0 Spec 6 | "Lines 181 and 194 disagree: automatic merging of a preprint ... against scholar choice later" | BUILDER | closed in round 1 |
| 116 | 6 | 6-refuter.md R0 Spec 7 | "method design is not in roadmap entry 10's goal" | BUILDER | closed in round 1 |
| 117 | 6 | 6-refuter.md R0 Spec 8 | "without the evidence pyramid the kept rubric has no scale for its Evidence Level criterion" | BUILDER | partly closed in round 1, rest at landing |
| 118 | 6 | 6-refuter.md R0 Spec 9 | "not every claim gets a corrected sentence" | BUILDER | closed in round 1 |
| 119 | 6 | 6-refuter.md R0 Spec 10 | "a failed lookup omits the field; nothing is marked \"not checked\"" | BUILDER | closed in round 1 for row 181; row 208 fixed at landing |
| 120 | 6 | 6-refuter.md R0 Proof 1 | "Lines 105 and 194 share the ending \"its first gate\", against the report's claim" | BUILDER | closed in round 1 |
| 121 | 6 | 6-refuter.md R0 Standards 1 | "Ten reasons end on \"..., without the <features>.\"" | BUILDER | brief 6.md:26; partly closed in round 1 |
| 122 | 6 | 6-refuter.md R0 Standards 2 | "Four drops share the appositive" | BUILDER | closed in round 1 |
| 123 | 6 | 6-refuter.md R0 Standards 3 | "Lines 205, 208 and 209 repeat one clause about roadmap entry 9" | BUILDER | closed in round 1 |
| 124 | 6 | 6-refuter.md R0 Standards 4 | "\"that protocol file\" now points at the wrong file" | BUILDER | closed in round 1 |
| 125 | 6 | 6-refuter.md R0 Standards 5 | "the closing \"without ...\" attaches to the wrong clause" | BUILDER | closed in round 1 |
| 126 | 6 | 6-refuter.md R0 Standards 6 | "Line 187: the same construction" | BUILDER | closed in round 1 |
| 127 | 6 | 6-refuter.md R0 Standards 7 | "Line 192: passive where the actor matters" | BUILDER | closed in round 1 |
| 128 | 6 | 6-refuter.md R0 Standards 8 | "\"tracked authors are reported\" should be their new publications" | BUILDER | closed in round 1 |
| 129 | 6 | 6-refuter.md R0 Standards 9 | "Verbless opening noun phrases" | BUILDER | closed in round 1 |
| 130 | 6 | 6-refuter.md R0 Behaviour 1 | "Line 18 is false for lines 180, 182, 184, 187, 204, 207, 213 and 217" | BUILDER | effect of #114; not closed in round 1, fixed at landing |
| 131 | 6 | 6-refuter.md R0 Behaviour 2 | "\"Every file was read in full before it was marked\" is the builder's statement; Spec 2, 3 and 9 suggest otherwise" | BUILDER | brief 6.md:13 each file read in full |
| 132 | 6 | 6-refuter.md R1 Spec 1 | "the currency rule and the verification threshold are neither placed nor dropped" | BUILDER | fixed at landing (6-refuter.md Closed) |
| 133 | 6 | 6-refuter.md R1 Spec 2 | "the conflict-of-interest section has no destination" | BUILDER | fixed at landing |
| 134 | 6 | 6-refuter.md R1 Spec 3 | "the literature devil's advocate and the research architect ... are not placed" | BUILDER | fixed at landing |
| 135 | 6 | 6-refuter.md R1 Spec 4 | "`domain_evidence_profiles.md` holds no ladder" | BUILDER | fixed at landing |
| 136 | 6 | 6-refuter.md R1 Spec 5 | "reverse citation tracking is forward tracking ... not its chaining" | BUILDER | fixed at landing |
| 137 | 6 | 6-refuter.md R1 Proof 1 | "The report's closures for Spec 4 and 5 are overstated" | BUILDER | fixed at landing |
| 138 | 6 | 6-refuter.md R1 Proof 2 | "Line 72 changed a fact wrongly" | BUILDER | fixed at landing |
| 139 | 6 | 6-refuter.md R1 Standards 1 | "end \"... drops the <features>.\"" | BUILDER | fixed at landing |
| 140 | 6 | 6-refuter.md R1 Standards 2 | "share one routing template" | BUILDER | fixed at landing |
| 141 | 6 | 6-refuter.md R1 Standards 3 | "Rows 185 and 224 repeat one clause about entry 9" | BUILDER | fixed at landing |
| 142 | 6 | 6-refuter.md R1 Standards 4 | "Verbless openings at lines 78, 81, 93" | BUILDER | fixed at landing |
| 143 | 6 | 6-refuter.md R1 Standards 5 | "a vague qualifier (\"often\") and the unclear \"In one work with two versions\"" | BUILDER | fixed at landing |
| 144 | 6 | 6-refuter.md R1 Standards 6 | "three coordinated clauses run together" | BUILDER | fixed at landing |
| 145 | 6 | 6-refuter.md R1 Standards 7 | "\"the same pattern\" has no antecedent in the row" | BUILDER | fixed at landing |
| 146 | 6 | 6-refuter.md R1 Behaviour 1 | "the omitted field avoids reading as \"found\", not \"unmatched\"" | BUILDER | fixed at landing |
| 147 | 6 | 6-refuter.md R1 Behaviour 2 | "only the deep-research devil's advocate uses the fallacy catalogue" | BUILDER | fixed at landing, mark changed |
| 148 | 6 | 6-refuter.md R1 Behaviour 3 | "Rows 221 and 191 contradict each other on the reading probe" | BUILDER | fixed at landing |
| 149 | 6 | 6-refuter.md R1 Behaviour 4 | "Row 207 drops the CRITICAL definition that rows 213 and 182 rely on" | BUILDER | fixed at landing |
| 150 | 6 | 6-refuter.md R1 Behaviour 5 | "Line 18 is still false for rows 184, 204, 207" | BUILDER | fixed at landing |
| 151 | 6 | 6-refuter.md R1 Behaviour 6 | "Line 219 names no destination for fact-check requests" | BUILDER | fixed at landing |

Items in plan 2 reports that are not counted as findings: 1-refuter.md R0 Proof 4 ("The report's four reverts reproduce"); 2-refuter.md R0 paragraph after Spec ("no place listing the tests was missed") and Proof, Standards, Behaviour ("none"); 2-refuter.md R1 Proof, Standards, Behaviour ("none"); 3-refuter.md R0 Proof ("none"); 3-refuter.md R1 Closures list (each item restates a finding counted above or its closure; Closures 6 is counted once, as #41); 4-refuter.md R0 Proof 1, Standards 3, Behaviour 3; 4-refuter.md R1 Proof 4, Standards 5, Behaviour 2 and 3; 5-refuter.md R0 Proof ("None") and Behaviour 2; 5-refuter.md R1 Proof 4 and Behaviour 2; 6-refuter.md R0 Proof 2 and Behaviour 3; 6-refuter.md R1 Proof 3.


## Plan 2.A: 2-a-launch-notes-for-builders-run-as-their-own-process

Report paths are under `.scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/`; briefs under `.../agents/briefs/`. This plan's executor was also inline (plan.md, Rulings 2026-09-23): BUILDER means the orchestrating session building the step. Numbering restarts at 1 for this plan.

| # | Step | Report, section | Finding (quote) | Cause | Evidence |
|---|---|---|---|---|---|
| 1 | 1 | 1-refuter.md R0 Spec 1 | "the claude recipe's `cd` runs in a subshell, so a relative exit file lands in the caller's directory" | BUILDER | brief 1.md:30 "`launch.sh` reproduces them exactly"; closed in round 1 (1-refuter.md:75) |
| 2 | 1 | 1-refuter.md R0 Spec 2 | "`transcript` with an empty `--note` (the key's default) is a usage error, exit 64" | BUILDER | brief 1.md:18 "does nothing otherwise"; closed in round 1 |
| 3 | 1 | 1-refuter.md R0 Spec 3 | "\"A call that fails is ignored\": `transcript` passes the note's exit status and stderr through" | BUILDER | closed in round 1 |
| 4 | 1 | 1-refuter.md R0 Spec 4 | "the page does not say the plan skills name no project or path" | BUILDER | brief 1.md:26 requires it; closed in round 1 |
| 5 | 1 | 1-refuter.md R0 Spec 5 | "the launch modes accept a stray positional argument and codex-only options silently" | BUILDER | brief 1.md:19 usage errors exit 64; closed in round 1 |
| 6 | 1 | 1-refuter.md R0 Proof 1 | "A `start` that prints an id and exits non-zero never runs" | BUILDER | brief 1.md:23; closed in round 1 |
| 7 | 1 | 1-refuter.md R0 Proof 2 | "An empty id line is never exercised" | BUILDER | closed in round 1 |
| 8 | 1 | 1-refuter.md R0 Proof 3 | "The stderr redirections are never checked" | BUILDER | brief 1.md:21 exactly the recipe's redirections; closed in round 1 |
| 9 | 1 | 1-refuter.md R0 Proof 4 | "\"Returns at once\" is never checked" | BUILDER | closed in round 1 |
| 10 | 1 | 1-refuter.md R0 Proof 5 | "No path contains a space; unquoted `\"$opt_cwd\"` passes" | BUILDER | closed in round 1 |
| 11 | 1 | 1-refuter.md R0 Proof 6 | "`head -n 1` replaced by `cat` passes; no `start` prints two lines" | BUILDER | closed in round 1 |
| 12 | 1 | 1-refuter.md R0 Proof 7 | "The report names one revert for the whole test, not one per case" | BUILDER | change-standard rule 13; partly closed in round 1 (1-refuter.md:75), rest at landing |
| 13 | 1 | 1-refuter.md R0 Proof 8 | "The report lacks the changed files with their line counts" | BUILDER | change-standard rule 7; closed in round 1 |
| 14 | 1 | 1-refuter.md R0 Standards 1 | "prefix assignments before a function call ... are not exported to its children under POSIX" | BUILDER | brief 1.md:13 POSIX sh; closed (new cause found in R1, 1-refuter.md:75) |
| 15 | 1 | 1-refuter.md R0 Standards 2 | "`sleep 0.1` is not POSIX" | BUILDER | closed in round 1 |
| 16 | 1 | 1-refuter.md R0 Standards 3 | "three entries open with the same passive \"Made by ...\"" | BUILDER | prose standard; not closed in substance in round 1, closed at landing (1-refuter.md:120) |
| 17 | 1 | 1-refuter.md R0 Standards 4 | "two semicolons in 340 words, over the prose standard's rate" | BUILDER | closed in round 1 |
| 18 | 1 | 1-refuter.md R0 Standards 5 | "the head comment and usage do not mention the internal `_body_` modes" | BUILDER | closed in round 1 |
| 19 | 1 | 1-refuter.md R0 Behaviour 1 | "The detached process's output goes to `/dev/null`, where the recipe's bare `nohup` leaves it" | BUILDER | brief 1.md:30 "reproduces them exactly"; round 1 "stated as a decision" (1-refuter.md:75) |
| 20 | 1 | 1-refuter.md R1 Spec 1 | "a relative `--note` resolves for `start` but not for `end`" | BUILDER | introduced by the round's fix of #1; fixed at landing (1-refuter.md:113) |
| 21 | 1 | 1-refuter.md R1 Spec 2 | "`transcript` no longer requires `--id` with `--note`, and accepts the launch options" | BUILDER | fixed at landing (1-refuter.md:114) |
| 22 | 1 | 1-refuter.md R1 Spec 3 | "the script writes wherever `--id` names" | BUILDER | fixed at landing (1-refuter.md:115) |
| 23 | 1 | 1-refuter.md R1 Proof 1 | "Removing the absolute conversion of `--id` leaves the test green" | BUILDER | fixed at landing (1-refuter.md:116) |
| 24 | 1 | 1-refuter.md R1 Proof 2 | "Writing the exit file before `end` leaves the test green" | BUILDER | fixed at landing |
| 25 | 1 | 1-refuter.md R1 Proof 3 | "Removing the `--parent` or `--label` requirement leaves the test green" | BUILDER | fixed at landing |
| 26 | 1 | 1-refuter.md R1 Proof 4 | "No case uses a relative `--note`" | BUILDER | fixed at landing |
| 27 | 1 | 1-refuter.md R1 Proof 5 | "The plants table quotes one truncated line per plant" | BUILDER | fixed at landing (1-refuter.md:117) |
| 28 | 1 | 1-refuter.md R1 Standards 1 | "the unquoted `\|` in `${case_%%\|*}` is alternation under ksh93" | BUILDER | fixed at landing (1-refuter.md:118) |
| 29 | 1 | 1-refuter.md R1 Standards 2 | "the comment names `launch`, the function is `launch_into`" | BUILDER | fixed at landing |
| 30 | 1 | 1-refuter.md R1 Standards 3 | "the three entries repeat \"<actor> calls it ...\"" | BUILDER | fixed at landing (1-refuter.md:120) |
| 31 | 1 | 1-refuter.md R1 Behaviour 1 | "With a relative `launch_note`, every claude-mode record stays open" | BUILDER | restates #20 |
| 32 | 2 | 2-refuter.md R0 Spec 1 | "the list of what `check_config.py` reports omits the new launch_note errors" | BRIEF | brief 2.md:15 gives ordo-init one change (the drafting rule) and does not list the error list at `skills/ordo-init/SKILL.md:80`; visible before build: yes |
| 33 | 2 | 2-refuter.md R0 Spec 2 | "the docstring's list of errors omits them too" | BUILDER | the docstring is in `check_config.py`, which brief 2.md:17 has the builder change; closed in round 1 |
| 34 | 2 | 2-refuter.md R0 Spec 3 | "names only `launch.sh` as refusing a relative path, not `check_config.py`" | BRIEF | `docs/launch-note.md` is in brief 2.md:3 as reading only, not in What to build; visible before build: yes |
| 35 | 2 | 2-refuter.md R0 Spec 4 | "\"(docs/launch-note.md)\" points at a page that is not installed with the skills ... the brief dictated the wording" | BRIEF | brief 2.md:13 dictates the comment naming `docs/launch-note.md`; the page was moved beside `launch.sh` (plan.md, step 2 booking); visible before build: yes, `utils/pin.sh` links only `skills/` folders |
| 36 | 2 | 2-refuter.md R0 Proof 1 | "`check_config.test.sh` stays green with: `{prefix}` dropped from an error" | BUILDER | brief 2.md:26 each case red with its check removed; partly closed in round 1, rest at landing |
| 37 | 2 | 2-refuter.md R0 Proof 3 | "The report does not quote the rule-14 grep" | BUILDER | closed in round 1 |
| 38 | 2 | 2-refuter.md R0 Standards 1 | "The report lacks the files with line counts, the user-visible changes ... and the judgment calls" | BUILDER | change-standard rule 7; closed in round 1 |
| 39 | 2 | 2-refuter.md R0 Standards 2 | "a directory is reported as \"a file that does not exist\"" | BUILDER | closed in round 1 |
| 40 | 2 | 2-refuter.md R0 Behaviour 1 | "A configuration without the key now prints `note: launch_note not set ...`; the report does not say so" | BUILDER | closed in round 1 (stated) |
| 41 | 2 | 2-refuter.md R0 Behaviour 2 | "`check_config.py` now exits 1 on a relative, `~`, whitespace-only ... launch_note ... the report states none of this" | BUILDER | closed in round 1 (stated; one claim reopened as #50) |
| 42 | 2 | 2-refuter.md R1 Spec 1 | "The move of step 1's page and the rewrite of the brief's dictated comment are substitutes the orchestrator rules on" | BRIEF | same cause as #35: the brief's `docs/` path is not installed; orchestrator accepted both substitutes at landing (2-refuter.md:84); visible before build: yes |
| 43 | 2 | 2-refuter.md R1 Spec 2 | "The rename is staged in the worktree's index (`RM`), against ... \"a file is moved with `mv`\"" | REVIEWER-WRONG | closed at landing with no change: "the cherry-pick onto main stages the rename" (2-refuter.md:85); sent to the builder: no |
| 44 | 2 | 2-refuter.md R1 Proof 1 | "`{prefix}` removed from the directory, missing-file and not-executable errors leaves the test green" | BUILDER | fixed at landing (2-refuter.md:86) |
| 45 | 2 | 2-refuter.md R1 Proof 2 | "No check confirms the moved page exists where the pointers name it" | BUILDER | proof missing from the report; the orchestrator ran the grep at landing (2-refuter.md:87) |
| 46 | 2 | 2-refuter.md R1 Standards 1 | "\"that follows the interface below\" now attaches to \"a relative one\"" | BUILDER | fixed at landing (2-refuter.md:88) |
| 47 | 2 | 2-refuter.md R1 Standards 2 | "the comment names three cases; the cases now include a directory, `~`, whitespace and the projects form" | BUILDER | fixed at landing |
| 48 | 2 | 2-refuter.md R1 Standards 3 | "`launch.sh:9` is 113 characters" | BUILDER | fixed at landing |
| 49 | 2 | 2-refuter.md R1 Behaviour 1 | "errors print the value unquoted, so a trailing space is invisible" | BUILDER | fixed at landing (2-refuter.md:91) |
| 50 | 2 | 2-refuter.md R1 Behaviour 2 | "the base script prints ten notes, then `ok:`" | BUILDER | report claim; fixed at landing (2-refuter.md:92) |
| 51 | 3 | 3-refuter.md R0 Spec 1 | "\"the options of its launch\" read literally reuses the first run's prompt, report, stderr, events, exit and pid" | BRIEF | brief 3.md:20 dictates "with `--resume <session_id>` and the options of its launch" without saying which paths are the round's own or that the old exit file must go; visible before build: yes |
| 52 | 3 | 3-refuter.md R0 Spec 2 | "nothing says where a shell builder's `<session_id>` comes from ... nor what \"the builder's identity\" is" | BRIEF | brief 3.md:16 names "the builder's identity written into the dispatch block" without defining it for a shell builder; visible before build: yes |
| 53 | 3 | 3-refuter.md R0 Spec 3 | "the id file is recorded nowhere, and the dispatch field list ... has no id file and no `stderr`" | BRIEF | the fix needed `skills/plan/templates/orchestrator-state.md`, which the brief's paths (3.md:13-22) do not include (plan.md step 3 booking: the template now names the fields); visible before build: yes |
| 54 | 3 | 3-refuter.md R0 Spec 4 | "the absolute `-o` also applies to a first `codex exec` run, which no brief item asks for" | BUILDER | closed in round 1 |
| 55 | 3 | 3-refuter.md R0 Proof 1 | "The output does not come from the plant its label names" | BUILDER | closed in round 1 |
| 56 | 3 | 3-refuter.md R0 Proof 2 | "the first-run absolute `-o` is covered by no test" | BUILDER | closed in round 1 |
| 57 | 3 | 3-refuter.md R0 Proof 3 | "stays green with `--resume` removed from the option list" | BUILDER | closed in round 1 |
| 58 | 3 | 3-refuter.md R0 Proof 4 | "an empty session id is neither exercised nor refused" | BUILDER | change-standard rule 15; closed in round 1 |
| 59 | 3 | 3-refuter.md R0 Proof 5 | "no plant is listed for the resumed run with a note" | BUILDER | brief 3.md:31; closed in round 1 |
| 60 | 3 | 3-refuter.md R0 Standards 1 | "bare `launch.sh`, against the skill layout's ... `templates/<file>`" | BUILDER | closed in round 1 |
| 61 | 3 | 3-refuter.md R0 Standards 2 | "three added semicolons, against the prose standard's two per 1000 words" | BUILDER | closed in round 1 |
| 62 | 3 | 3-refuter.md R0 Standards 3 | "\"With `launch_note` empty, leave the note options out.\" and ... repeat a construction" | BUILDER | closed in round 1 |
| 63 | 3 | 3-refuter.md R0 Standards 4 | "the header is only partly reflowed" | BUILDER | closed in round 1 |
| 64 | 3 | 3-refuter.md R0 Standards 5 | "no open items, no per-file line counts, no before/after section" | BUILDER | change-standard rule 7; closed in round 1 |
| 65 | 3 | 3-refuter.md R0 Behaviour 1 | "the report states neither as a before/after" | BUILDER | closed in round 1 |
| 66 | 3 | 3-refuter.md R0 Behaviour 2 | "A first `codex exec` run with a relative `--report` now gets an absolute `-o`; not stated" | BUILDER | closed in round 1 |
| 67 | 3 | 3-refuter.md R0 Behaviour 3 | "A stale exit file satisfies the monitor at a resume, and `--resume ''` starts a fresh session silently" | BUILDER | report omission; closed in round 1 |
| 68 | 3 | 3-refuter.md R1 Spec 1 | "the round keeps \"the note options\" (which include `--id`) and also takes \"id files\" of its own" | BUILDER | the round's own text; fixed at landing (3-refuter.md:89) |
| 69 | 3 | 3-refuter.md R1 Spec 2 | "the template names \"the repair_ entries\" and no `repair_` field is named anywhere" | BUILDER | the round's own text; fixed at landing (3-refuter.md:90) |
| 70 | 3 | 3-refuter.md R1 Spec 3 | "the `claude -p` transcript is \"named by its session id\", taken from the JSON report, which exists only at exit" | BUILDER | brief 3.md:16 names the `.jsonl` under the projects folder; fixed at landing (3-refuter.md:91) |
| 71 | 3 | 3-refuter.md R1 Proof 1 | "the got and expected lines read the same ... the plant fails on `codex without a note`" | BUILDER | fixed at landing (3-refuter.md:92) |
| 72 | 3 | 3-refuter.md R1 Proof 2 | "the codex arm for a relative exit file is covered by no case" | BUILDER | fixed at landing |
| 73 | 3 | 3-refuter.md R1 Proof 3 | "`--resume` accepts a value that is an option name" | BUILDER | fixed at landing (3-refuter.md:94) |
| 74 | 3 | 3-refuter.md R1 Standards 1 | "a 40-word sentence" | BUILDER | brief 3.md:33 about 35 words; fixed at landing |
| 75 | 3 | 3-refuter.md R1 Standards 2 | "four bullets of one shape" | BUILDER | fixed at landing |
| 76 | 3 | 3-refuter.md R1 Standards 3 | "the comment attributes `stderr` and `note_id` to `/spec`, whose `SKILL.md:63` does not write them" | BUILDER | fixed at landing (3-refuter.md:97) |
| 77 | 3 | 3-refuter.md R1 Standards 4 | "`note_id` holds a path while `session_id` beside it holds an id" | BUILDER | fixed at landing (field renamed `note_id_file`) |
| 78 | 3 | 3-refuter.md R1 Behaviour 1 | "A first `claude -p` builder's transcript reaches the note only after `end`" | BUILDER | restates #70 |
| 79 | 3 | 3-refuter.md R1 Behaviour 2 | "`--resume` with a value starting with `--` is passed on as a flag; not stated" | BUILDER | restates #73 |
| 80 | 4 | 4-refuter.md R0 Proof 1 | "No codex launch has `--note ''` ... The sentence comes from the test's head comment ..., which is false" | BRIEF | brief 4.md:13 has the README bullet written "from its header comment" and keeps `launch.test.sh` out of the paths; plan.md step 4 booking: "The step's paths widened to `launch.test.sh`, so that the README's description holds"; visible before build: yes, by reading the test against its comment |
| 81 | 4 | 4-refuter.md R0 Proof 2 | "\"each usage error\". The usage loop ... asserts only exit 64, and several `fail_usage` calls are never reached" | BRIEF | same cause as #80; visible before build: yes, as for the finding it shares a cause with |
| 82 | 4 | 4-refuter.md R0 Proof 3 | "the grep output and the verify list's output are paraphrased and counted, not quoted" | BUILDER | brief 4.md:25 "quoted"; closed in round 1 |
| 83 | 4 | 4-refuter.md R0 Proof 4 | "DONE rows 1 to 3: no command with its output" | BUILDER | closed in round 1 |
| 84 | 4 | 4-refuter.md R0 Standards 1 | "repeats the false sentence of `launch.test.sh:2-3` without correcting either copy" | BRIEF | same cause as #80; visible before build: yes, as for the finding it shares a cause with |
| 85 | 4 | 4-refuter.md R1 Proof 1 | "the round removed the three `resume_error` cases ... and replaced none of them" | BUILDER | fixed at landing (4-refuter.md:72) |
| 86 | 4 | 4-refuter.md R1 Proof 2 | "is checked by the substring `Usage:`, which every usage error prints" | BUILDER | fixed at landing (4-refuter.md:73) |
| 87 | 4 | 4-refuter.md R1 Proof 3 | "\"every `fail_usage` call\" does not hold for `launch.sh:72`" | BUILDER | fixed at landing (4-refuter.md:72) |
| 88 | 4 | 4-refuter.md R1 Standards 1 | "\"every usage error with its message\" is false while the resume errors are not exercised" | BUILDER | effect of #85; fixed at landing |

Items in plan 2.A reports that are not counted as findings: 2-refuter.md R0 Spec 5 ("finds no other list missing `launch_note`"); 2-refuter.md R0 Proof 2 ("The report's five plants were not rerun; its verify output reproduces", a statement of what the reviewer did not do); 4-refuter.md R0 and R1 Spec and Behaviour ("none").

## Plan 2.B: 2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found

Report paths are under `.scratch/archive/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/`; briefs under `.../agents/briefs/`. This plan ran builder agents: BUILDER means the builder agent. A repair round's brief (`briefs/<step>-round-<n>.md`) is what was sent to the builder; where no round brief file exists, the round's rulings are read from the builder's report ("Repair round <n>" table) and the plan.md booking. Numbering restarts at 1 for this plan.

| # | Step | Report, section | Finding (quote) | Cause | Evidence |
|---|---|---|---|---|---|
| 1 | 1 | 1-refuter.md R0 Spec 1 | "the case \"a command with another tail filter\" is in no item of the brief's case list" | BRIEF | follows brief decision 2 (exact suffix `2>&1 \| tail -1`); visible before build: yes, decision 2 names the one spelling it accepts and the plan's step 1 names the failure it must end; ruled in round 1 (open item on decision 2) |
| 2 | 1 | 1-refuter.md R0 Spec 2 | "exit statuses 69 (no PyYAML) and 70 (no count) are not in the brief" | BUILDER | brief 1.md names 0, 1, 64 only; ruled (ruling 2 keeps 69) and head comment fixed in round 1 |
| 3 | 1 | 1-refuter.md R0 Spec 3 | "The state file's verify list ... still holds nine tests. `docs/dev/building.md` now holds ten." | BRIEF | the brief gave no item for the ledger's verify list, which the builder may not edit; visible before build: yes, the brief adds a tenth test to building.md; closed at landing (1-refuter.md Closed) |
| 4 | 1 | 1-refuter.md R0 Proof 1 | "the test enforces the defect the runner exists to end" | BRIEF | same cause as #1: the test follows decision 2; visible: yes; closed in round 1 |
| 5 | 1 | 1-refuter.md R0 Proof 2 | "judgment call 7 (\"Each command runs with standard input from /dev/null\") has no test" | BUILDER | change standard rule 13; closed in round 1 |
| 6 | 1 | 1-refuter.md R0 Proof 3 | "judgment call 6 (\"keeps quotes, newlines and carriage returns ...\") has no test" | BUILDER | closed in round 1 |
| 7 | 1 | 1-refuter.md R0 Proof 4 | "the signal traps ... has no test. Revert r8 leaves the test green." | BUILDER | closed in round 1 |
| 8 | 1 | 1-refuter.md R0 Proof 5 | "the count check: no case reaches it. Revert r9 leaves the test green." | BUILDER | closed in round 1 |
| 9 | 1 | 1-refuter.md R0 Proof 6 | "the brief asks for output quoted verbatim, but the report shortens the grep hits" | BUILDER | brief asks for verbatim output; closed in round 1 |
| 10 | 1 | 1-refuter.md R0 Standards 1 | "The diff makes three sentences in the skills contradict this, and none of them is booked" | BRIEF | the brief's path list left out the refute, spec and land texts that the change made stale; visible before build: yes, each names the filter by grep; booked for step 3 (Closed) |
| 11 | 1 | 1-refuter.md R0 Standards 2 | "\"A landing books the lines the runner prints.\" No skill does this yet" | BRIEF | the sentence was dictated by the brief's building.md item; visible: yes; booked for step 3 |
| 12 | 1 | 1-refuter.md R0 Standards 3 | "the head comment names exit 1 and 64 only. Exits 69, 70 and 128+n are not in it." | BUILDER | change standard rule 5; closed in round 1 |
| 13 | 1 | 1-refuter.md R0 Behaviour 1 | "a red test passes green whenever its filter is spelled any way other than the exact suffix" | BRIEF | reviewer: "This follows brief decision 2"; visible: yes, decision 2 is the exact-suffix rule; ruled in round 1 |
| 14 | 1 | 1-refuter.md R0 Behaviour 2 | "a state file that is not UTF-8 ends in a Python traceback ... and exit 1" | BUILDER | brief says an unreadable state file exits 64; closed in round 1 |
| 15 | 1 | 1-refuter.md R0 Behaviour 3 | "a SIGTERM sent to the runner alone does not stop the running command" | BUILDER | closed in round 1 |
| 16 | 1 | 1-refuter.md R0 Behaviour 4 | "only a fence whose info word is exactly `yaml` counts ... The report's judgment call 5 does not say this" | BUILDER | report omission; closed in round 1 |
| 17 | 1 | 1-refuter.md R1 Spec 1 | "This adds a new refusal path. Ruling 2 said to keep exit 69" | BUILDER | beyond the round's rulings; closed in round 2 (Closed: "every finding closed in repair round 2") |
| 18 | 1 | 1-refuter.md R1 Spec 2 | "This adds a new exit-64 refusal that no ruling asks for." | BUILDER | closed in round 2 |
| 19 | 1 | 1-refuter.md R1 Proof 1 | "the signal case sends only `kill -TERM`" | BUILDER | closed in round 2 |
| 20 | 1 | 1-refuter.md R1 Proof 2 | "The suite passes only when `sh` is bash." | BUILDER | closed in round 2 |
| 21 | 1 | 1-refuter.md R1 Standards 1 | "These sentences are false for the spellings in Behaviour 1" | BUILDER | effect of #23; closed in round 2 |
| 22 | 1 | 1-refuter.md R1 Standards 2 | "Both are false under dash (Behaviour 2)." | BUILDER | effect of #24; closed in round 2 |
| 23 | 1 | 1-refuter.md R1 Behaviour 1 | "the last pipeline stage is `tail`, yet the command is judged on tail's exit status" | BUILDER | the round's ruling asked for any spelling; closed in round 2 |
| 24 | 1 | 1-refuter.md R1 Behaviour 2 | "under dash with no terminal, `set -m` prints `set: can't access tty`" | BUILDER | closed in round 2 |
| 25 | 1 | 1-refuter.md R1 Behaviour 3 | "a pipe inside quotes becomes a false red that shows as a shell syntax error" | BUILDER | known defect stated as a limit (rule 12); closed in round 2 |
| 26 | 1 | 1-refuter.md R1 Behaviour 4 | "This follows ruling 1's wording, but a red test still passes" | UNCLEAR | reviewer says it follows ruling 1; the round-1 ruling text is not on disk (no round brief file; 1-report.md records only what closes it), so whether the ruling or the build caused it cannot be settled; led to open item F, ruled (a) |
| 27 | 1 | 1-refuter.md R2 Spec 1 | "`sh t 2>&1 \| tail -1;` ... all end in a pipe into tail, but the runner takes them as plain commands" | BUILDER | ruling item 2; booked as step 1a (Closed) |
| 28 | 1 | 1-refuter.md R2 Proof 1 | "every spelling runs only with `passexit1.test.sh`, a test that exits 1" | BUILDER | booked as step 1a |
| 29 | 1 | 1-refuter.md R2 Proof 2 | "the quoted-pipe case ... passes only because the echoed text starts with `PASS:`" | BUILDER | booked as step 1a |
| 30 | 1 | 1-refuter.md R2 Proof 3 | "With the TERM call and the grace removed ... the suite prints `PASS`" | BUILDER | booked as step 1a |
| 31 | 1 | 1-refuter.md R2 Proof 4 | "the report's claim \"so the runner always knows the pid\" has no test" | BUILDER | booked as step 1a |
| 32 | 1 | 1-refuter.md R2 Proof 5 | "no case covers a command killed by a signal" | BUILDER | fixed at landing |
| 33 | 1 | 1-refuter.md R2 Proof 6 | "when dash is not installed, the dash pass is skipped ... and the file prints the same `PASS`" | BUILDER | change standard rule 9; fixed at landing |
| 34 | 1 | 1-refuter.md R2 Standards 1 | "the runner also needs `ps` ... No check exits 69" | BUILDER | fixed at landing |
| 35 | 1 | 1-refuter.md R2 Standards 2 | "`VERIFY_TEST_SHELL=dash sh utils/verify.test.sh` exits 0 and prints nothing" | BUILDER | fixed at landing |
| 36 | 1 | 1-refuter.md R2 Standards 3 | "\"a red test piped into tail is red however the pipe is spelled\" ... false in two cases" | BUILDER | fixed at landing |
| 37 | 1 | 1-refuter.md R2 Behaviour 1 | "a `\| tail` inside quotes at the end of a command still makes it a summary test" | BUILDER | booked as step 1a |
| 38 | 1 | 1-refuter.md R2 Behaviour 2 | "without `ps` on `PATH`, a signal to the runner ends in `FileNotFoundError`" | BUILDER | fixed at landing |
| 39 | 1a | 1a-refuter.md R0 Spec 1 | "the added line `#   <skills> is the folder the skills are installed in.` is outside the letter of item 1" | REVIEWER-WRONG | kept as built, ruling 1 of 1a-round-1.md; sent to the builder: no, the round brief lists it under "No change" |
| 40 | 1a | 1a-refuter.md R0 Spec 2 | "the test line and the `verify.test.sh` bullet moved to follow `land.test.sh`" | REVIEWER-WRONG | kept as built, ruling 1 of 1a-round-1.md; sent: no ("No change") |
| 41 | 1a | 1a-refuter.md R0 Standards 1 | "uses \"the runner\" for `verify.sh`, while the same file's :40 and :42 use \"the runner\" for the agent harness" | BUILDER | prose standard D; closed in the round |
| 42 | 1a | 1a-refuter.md R0 Standards 2 | "the placeholder \"prints <a line per command and `verify: <n> commands passed`>\" is false" | BUILDER | closed in the round |
| 43 | 1a | 1a-refuter.md R0 Behaviour 1 | "The report's \"the pinned skills install them with the land skill\" is not true now" | BUILDER | report claim; closed in the round |
| 44 | 1a | 1a-refuter.md R0 Behaviour 2 | "`repo-setup` now writes ... the sentence ... with no runnable path" | BRIEF | brief decision 1 defines `<skills>` with no lookup; visible before build: yes, README:150 already states the lookup places the brief did not carry; closed in the round with the lookup order |
| 45 | 1a | 1a-refuter.md R0 Behaviour 3 | "Steps 6 now says the verify list runs through `templates/verify.sh`, while :100 says a ledger's `land.sh`" | BRIEF | `templates/land.sh` was outside the brief's path list; visible: yes, land/SKILL.md:100 names land.sh as passing Steps 6; closed in the round (ruling 5) |
| 46 | 1a | 1a-refuter.md R1 Spec 1 | "the preflight refusal of a missing state file is not in ruling 5" | REVIEWER-WRONG | Closed: "kept; it has its case and revert"; sent: no, raised after the round and kept at landing |
| 47 | 1a | 1a-refuter.md R1 Proof 1 | "\"which was 142 characters before and 144 after\" is wrong" | BUILDER | fixed at landing |
| 48 | 1a | 1a-refuter.md R1 Standards 1 | "land.sh:9 (\"fails the landing with the runner's output printed\") uses \"the runner\" for `verify.sh`" | BUILDER | same collision as #41; fixed at landing |
| 49 | 1a | 1a-refuter.md R1 Standards 2 | "a line the round changed is 142 characters" | BUILDER | brief conventions, about 100 characters; fixed at landing |
| 50 | 1a | 1a-refuter.md R1 Standards 3 | "the half of the sentence about the stub scripts no longer [holds]" | BUILDER | fixed at landing |
| 51 | 1a | 1a-refuter.md R1 Behaviour 1 | "A ledger that copies the new land.sh changes where its checks run." | BUILDER | the before and after missing from the report; fixed at landing |
| 52 | 1a | 1a-refuter.md R1 Behaviour 2 | "The preflight refuses a missing state file but not an unusable one." | BUILDER | fixed at landing with a case |
| 53 | 1c | 1c-refuter.md R0 Spec (premise) | "Premise of the brief not reproduced: \"The dispatch block ... is the `dispatch:` key of the first `yaml` block\"" | BRIEF | the brief's premise was false; visible before build: yes, `grep -n '^```yaml'` on main's state file and the template shows `dispatch:` in the second block; premise correction booked in plan.md step 1c (Closed) |
| 54 | 1c | 1c-refuter.md R0 Proof 1 | "only one direction of \"one names it whole\" is tested" | BUILDER | ruling 1 of 1c-round-1.md; closed in round 1 |
| 55 | 1c | 1c-refuter.md R0 Proof 2 | "the de-duplication of `shared:` lines is untested. Revert B stays green." | BUILDER | ruling 2; closed in round 1 |
| 56 | 1c | 1c-refuter.md R0 Proof 3 | "Revert C, which widens the pattern to `#{1,6}`, stays green" | BUILDER | ruling 3; closed in round 1 |
| 57 | 1c | 1c-refuter.md R0 Proof 4 | "The saved file ... holds 38 `FAIL:` lines ... The count is wrong by one." | BUILDER | ruling 4; closed in round 1 |
| 58 | 1c | 1c-refuter.md R0 Standards 1 | "\"the rest are refusals, which name their cause and leave nothing\". The change makes this sentence false" | BUILDER | the builder's own "brief is removed" call left the plan.md amendment; ruling 5; closed in round 1 |
| 59 | 1c | 1c-refuter.md R0 Behaviour 1-4 (dispatch shape, one finding) | "the state template ... lets a block be a single mapping when workers_at_once is 1" | BRIEF | brief item 2 required a list while the state template :27 allows a mapping; visible before build: yes, the template line is on main; ruling 6; closed in round 1 (the template comment outside the path list) |
| 60 | 1c | 1c-refuter.md R0 Behaviour 5 | "the builder is told to report a wrong case \"before any code changes\" ... This is as the brief worded it (item 5)" | BRIEF | reviewer attributes it to brief item 5; visible: yes, item 5 names no stop point; ruling 7 |
| 61 | 1c | 1c-refuter.md R0 Behaviour 6 | "the printed sequence lists \"/land refuses\" but has no line for spec's new refusal" | BRIEF | plan-help was outside the brief's path list; visible: yes, plan-help prints the refusal sequence; ruling 8 widened the paths |
| 62 | 1c | 1c-refuter.md R1 Standards 1 | "does not name the new round-0 ruling file `agents/briefs/<step>-cases.md`" | BRIEF | the cases file was introduced by ruling 7 of the round brief 1c-round-1.md, whose paths left out refute; visible before the round: yes, refute's "What it reads" lists the files; fixed at landing |
| 63 | 1c | 1c-refuter.md R1 Behaviour 2 | "restores plan.md with `git restore -- <path>` ... throws the user's edit away" | BRIEF | the restore was dictated by ruling 5 of 1c-round-1.md; visible: yes, the preflight at :45 allows unrelated changes; fixed at landing |
| 64 | 1c | 1c-refuter.md R1 Behaviour 3 | "resumes the builder for a cases ruling \"by the resume under Steps 8 (\"How\")\" only" | BUILDER | fixed at landing |
| 65 | 1c | 1c-refuter.md R1 Behaviour 4 | "the dispatch entry's `round:` value at main's orchestrator-state.md:52 held ... unquoted" | OTHER | the orchestrator's own ledger state file, outside the round's delta (reviewer: "Outside the round's delta"); fixed at landing |
| 66 | 2 | 2-refuter.md R0 Spec 1 | "\"... until a decision is the user's or nothing is left.\" This is the \"a stop ends the loop\" meaning that item 1 removes" | BUILDER | the sentence is in the step's file; ruling 1; closed in round 1 (2-report.md round table row 1) |
| 67 | 2 | 2-refuter.md R0 Spec 2 | "`skills/plan/templates/plan.md:3` ... still contradict the new plan Rules 1 and 2" | BRIEF | the plan templates were left out of the brief's path list; visible before build: yes, the template lines state the old rules; ruling 2 widened the paths |
| 68 | 2 | 2-refuter.md R0 Proof 1 | "the report's stated convention was applied to some changed rows and not to others" | BUILDER | ruling 3; closed in round 1 |
| 69 | 2 | 2-refuter.md R0 Proof 2 | "Report line 3 says \"Three sentences ...\" The \"Doc text\" section ... has four numbered items" | BUILDER | ruling 4; closed in round 1 |
| 70 | 2 | 2-refuter.md R0 Standards 1 | "put this repository's entry, step numbers and tool name" into the skill's examples | BRIEF | the example and the `2.B/4` label were dictated by brief items 12 to 14; visible: yes, the rule-file rule forbids project names; ruling 5 |
| 71 | 2 | 2-refuter.md R0 Standards 2 | "\"the models it names are the options the user ruled in ...\". This records who decided, in a rule file." | BRIEF | reviewer: "The wording is from brief item 6"; visible: yes, CLAUDE.md forbids recording who said a rule; ruling 6 |
| 72 | 2 | 2-refuter.md R0 Standards 3 | "The first clause repeats Steps 4, line 52" | BUILDER | ruling 7; closed in round 1 |
| 73 | 2 | 2-refuter.md R0 Standards 4 | "\"Every report opens with a position line\". `docs/dev/change-standard.md:19` ... still open a report with the NOT DONE line" | BRIEF | brief item 12 says "every report" while the change standard fixes the builder's report shape; visible: yes, change-standard rule 7 is on main; ruling 8 |
| 74 | 2 | 2-refuter.md R0 Standards 5 | "the open-item placeholder asks for \"its options and one recommendation\"" | BUILDER | ruling 9; closed in round 1 |
| 75 | 2 | 2-refuter.md R0 Standards 6 | "The `reviewer:` line (15) says only \"the model /refute runs on.\"" | BUILDER | ruling 10; closed in round 1 |
| 76 | 2 | 2-refuter.md R0 Standards 7 | "The Rules bullet it points at (`:263`) names only `/spec`, `/refute` and `/land`" | BUILDER | ruling 11; closed in round 1 |
| 77 | 2 | 2-refuter.md R0 Standards 8 | "the round-cap bullet has three sentences of 42, 18 and 54 words" | BUILDER | ruling 12; closed in round 1 |
| 78 | 2 | 2-refuter.md R1 Spec 1 | "Ruling 12 asked for the rule unchanged ... with three wording drifts" | BUILDER | the builder's five-bullet split; fixed at landing |
| 79 | 2 | 2-refuter.md R1 Spec 2 | "The parenthesis is written as the full list, but Steps 4 ... also has the loop build a step through `academic-paper`" | BUILDER | fixed at landing |
| 80 | 2 | 2-refuter.md R1 Proof 1 | "the sections above it still state the pre-round text as the tree's text" | BUILDER | change-standard rule 7; fixed at landing with a note |
| 81 | 2 | 2-refuter.md R1 Proof 2 | "\"Doc text\" item 3 ... After ruling 8, `SKILL.md:199` says \"A builder's report keeps the shape\"" | BUILDER | stale report item after the round; fixed at landing in the booked item |
| 82 | 2 | 2-refuter.md R1 Standards 1 | "This breaks `docs/dev/skill-layout.md`, \"Lists and tables\", first bullet" | BUILDER | the split of the cap; fixed at landing |
| 83 | 2 | 2-refuter.md R1 Standards 2 | "\"The bullets after it\" also covers line 268 ... which has nothing to do with the cap" | BUILDER | effect of #82; fixed at landing |
| 84 | 2 | 2-refuter.md R1 Standards 3 | "Vendor and tool names outside the models section in changed text, as your check asked" | REVIEWER-WRONG | Closed: "not a finding ... no written rule forbids them"; the reviewer itself says "not as a breach of a written rule"; sent to the builder: no, disposed of at landing |
| 85 | 3 | 3-refuter.md R0 Spec 1 | "the check has no outcome ... The shell builder is also only checked, never stopped." | BRIEF | brief 3.md item 7 prescribes the stop through the runner's stop tool and a pid check, with no failure outcome and no stop for a shell process; visible before build: yes, the item names a check and nothing after it, and launch.sh builders are not runner agents; ruling 1, closed in round 1 |
| 86 | 3 | 3-refuter.md R0 Spec 2 | "skills/plan-retro/SKILL.md:97: a change no item asks for." | BUILDER | item 14 asked only for the proposal order; ruling 2 removed the row |
| 87 | 3 | 3-refuter.md R0 Spec 3 | "the setup still commits whatever question 5 says" | BRIEF | item 17 names only the setup's Steps 13, while ordo-init's Steps 14 (run by the setup's Steps 9) commits unconditionally; visible: yes, both files were in the brief's reading list; ruling 3 |
| 88 | 3 | 3-refuter.md R0 Proof 1 | "a quoted grep output that the rerun does not reproduce" | BUILDER | closed in round 1 |
| 89 | 3 | 3-refuter.md R0 Standards 1 | "The words come from brief item 13, but the printed sequence now contradicts land." | BRIEF | item 13 dictates "the booked step comes next"; visible: yes, land:108 says queue order; closed in round 1 |
| 90 | 3 | 3-refuter.md R0 Standards 2 | "both describe every red line as taking the step out of main" | BRIEF | item 13's wording ("a red line (the step is taken back out of main and booked)"); visible: yes, land Steps 6 bullet 2 fixes a red line on main; closed in round 1 |
| 91 | 3 | 3-refuter.md R0 Standards 3 | "skills/spec/SKILL.md:47 is one 42-word sentence that holds three rules" | BUILDER | prose standard E, B; closed in round 1 |
| 92 | 3 | 3-refuter.md R0 Standards 4 | "\"The loop\" is not defined in the description." | BUILDER | closed in round 1 |
| 93 | 3 | 3-refuter.md R1 Spec 1 | "Ruling 8 asked for a report that opens with the position line ... The template still opens with the NOT-done line" | BRIEF | round ruling 8 asked for an order that step 2's ruling 8 (builder's report keeps the change standard's shape) contradicts; the landing kept the change standard's shape; visible before the round: unclear, step 2's ruling and step 3's round ran the same afternoon and their order is not recorded |
| 94 | 3 | 3-refuter.md R1 Proof 1 | "`3-report.md` still has sections from before the round that the round made false" | BUILDER | fixed at landing with a note |
| 95 | 3 | 3-refuter.md R1 Standards 1 | "Ruling 3 carried the same fix into repo-setup's opening paragraph but not into ordo-init's." | BUILDER | fixed at landing |
| 96 | 3 | 3-refuter.md R1 Standards 2 | "The question is asked at Steps 11 but written at Steps 14" | BUILDER | skill-layout "Where a rule goes"; fixed at landing |
| 97 | 3 | 3-refuter.md R1 Standards 3 | "one setup therefore raises the same decision twice" | BUILDER | fixed at landing |
| 98 | 3 | 3-refuter.md R1 Standards 4 | "\"a short grace\" is a vague qualifier ... The grace needs a number." | BUILDER | fixed at landing |
| 99 | 3 | 3-refuter.md R1 Standards 5 | "the rewritten sentence ... is 51 words" | BUILDER | fixed at landing |
| 100 | 3 | 3-refuter.md R1 Standards 6 | "the new printed line is 46 words with a semicolon ... The words are ruling 5's." | BRIEF | reviewer attributes the words to round ruling 5; visible: yes, the line names a loop inside the by-hand sequence; fixed at landing |
| 101 | 3 | 3-refuter.md R1 Behaviour 1 | "stopping a shell builder this way does not stop the builder, and the check can never pass" | BRIEF | item 7 and ruling 1 rely on a pid file that, until plan step 4 lands, names the wrapper shell; visible: yes, `launch.sh:193-194` on main writes `$!` of the wrapper; booked for step 4 |
| 102 | 3 | 3-refuter.md R1 Behaviour 2 | "The round's user-visible changes are not stated with a before and after anywhere in the report" | BUILDER | change-standard rule 7; fixed at landing in the booking |
| 103 | 4 | 4-refuter.md R0 Spec 1 | "brief item 2 asks that TERM, INT or HUP \"ends every process of the builder's session\"" | BUILDER | the runner's stop missed session members; closed in round 1 |
| 104 | 4 | 4-refuter.md R0 Spec 2 | "two of finding 8's untested cases are still untested" | BUILDER | the brief points the builder at findings 1 to 11; closed in round 1 |
| 105 | 4 | 4-refuter.md R0 Proof 1 | "\"The longest line of `launch.sh` is now 108 characters\" ... The measurement does not reproduce." | BUILDER | closed in round 1 |
| 106 | 4 | 4-refuter.md R0 Proof 2 | "No test checks that a descendant outside the builder's group gets TERM before KILL." | BUILDER | closed in round 1 |
| 107 | 4 | 4-refuter.md R0 Proof 3 | "the land sequence case does not run the KILL branch it is named for" | BUILDER | closed in round 1 |
| 108 | 4 | 4-refuter.md R0 Standards 1 | "`README.md:121` ... is false after this step ... `orchestrator-state.md:27` ... lacks `session_file`" | BRIEF | both files are outside the brief's path list ("Nothing else", brief 4.md:64); visible before build: yes, README:121 describes `launch.test.sh` and the template lists the launch fields that item 1 changes; template closed in the round, README fixed at landing |
| 109 | 4 | 4-refuter.md R0 Standards 2 | "No codex case calls `transcript` ... The sentence is false for codex." | BUILDER | closed in round 1 |
| 110 | 4 | 4-refuter.md R0 Behaviour 1 | "a signal can arrive after `\"run_$harness\" &` has started the builder and before `running=$!` is set" | BUILDER | closed in round 1 and at landing |
| 111 | 4 | 4-refuter.md R0 Behaviour 2 | "\"A dead pid with no exit file is a dead builder\" are false after KILL to the leader alone" | BUILDER | closed in round 1 (watchdog) |
| 112 | 4 | 4-refuter.md R0 Behaviour 3 | "the lock directory `<pid file>.lock` is a refusal the brief did not ask for" | BUILDER | brief item 4 refuses only on a live pid; closed in round 1 |
| 113 | 4 | 4-refuter.md R1 Spec and Standards 1 (one finding) | "`LAUNCH_TEST_SPAWN_DELAY` is a parameter whose only user is the test" | BUILDER | change-standard rule 11; fixed at landing (Closed counts Spec and Standards 1 as one) |
| 114 | 4 | 4-refuter.md R1 Proof 1 | "with `print $fh \"$$\\n\";` deleted the suite prints `PASS`" | BUILDER | fixed at landing with a case |
| 115 | 4 | 4-refuter.md R1 Proof 2 | "`spawning=1` before `note_exec start` ... With that line deleted the suite prints `PASS`" | BUILDER | rule 13; fixed at landing |
| 116 | 4 | 4-refuter.md R1 Proof 3 | "`$TMPDIR/red4/reverts1.py` and `$TMPDIR/red4/r1final.out` ... do not exist" | BUILDER | fixed at landing |
| 117 | 4 | 4-refuter.md R1 Standards 2 | "the replacement bullet runs to about ten sentences" | BUILDER | the state file's standing demands, cut (2); fixed at landing |
| 118 | 4 | 4-refuter.md R1 Standards 3 | "the report keeps the first report's sections with facts the round changed" | BUILDER | rule 7; fixed at landing |
| 119 | 4 | 4-refuter.md R1 Standards 4 | "perl appears on no requirement line" | BUILDER | the builder's round introduced perl; fixed at landing |
| 120 | 4 | 4-refuter.md R1 Behaviour 1 | "a same-class window remains between `fork` and the install of the runner's TERM/INT/HUP handlers" | BUILDER | fixed at landing |
| 121 | 4 | 4-refuter.md R1 Behaviour 2 | "`<pid file>.lock` now stays as a file beside the pid file ... SKILL.md does not say it" | BUILDER | fixed at landing |
| 122 | 5 | 5-refuter.md R0 Spec 1 | "`ls -A /Users/axelfaes/.claude-work/skills` still lists `alpha` ... a dangling link made by the builder's reproduction run" | BUILDER | the brief says the real folder is never changed; became open item I, the user's |
| 123 | 5 | 5-refuter.md R0 Spec 2 | "no brief item asks for any of these" | BUILDER | additions beyond the brief; ruled in round 1 |
| 124 | 5 | 5-refuter.md R0 Proof 1 | "revert M3 ... leaves `pin.test.sh` green" | BUILDER | closed in round 1 (M3 red) |
| 125 | 5 | 5-refuter.md R0 Proof 2 | "revert M6 ... leaves the test green. Judgment call 5 ... is not proven." | BUILDER | closed in round 1 |
| 126 | 5 | 5-refuter.md R0 Proof 3 | "revert M1 leaves the test green" | BUILDER | closed in round 1 |
| 127 | 5 | 5-refuter.md R0 Proof 4 | "the new prune refusal has no case and no revert" | BUILDER | closed in round 1 |
| 128 | 5 | 5-refuter.md R0 Proof 5 | "the case assumes `$test_root` holds no space ... it created `$T/tmp/beta` ... outside its scratch root" | BUILDER | closed in round 1 |
| 129 | 5 | 5-refuter.md R0 Standards 1 | "This is false for a hand-made link into the live clone for a skill the tag holds." | BUILDER | closed in round 1 |
| 130 | 5 | 5-refuter.md R0 Standards 2 | "`git worktree prune` removes the registration of every worktree of the clone whose folder is missing" | BUILDER | closed in round 1 |
| 131 | 5 | 5-refuter.md R0 Behaviour 1 | "pin mode now runs `git worktree prune` on the live clone whenever the pinned worktree folder is absent" | BUILDER | closed in round 1 (R6b red) |
| 132 | 5 | 5-refuter.md R0 Behaviour 2 | "pin mode exits 1 after it has checked the worktree out at the new tag and rewritten every link" | BUILDER | closed in round 1 |
| 133 | 5 | 5-refuter.md R0 Behaviour 3 | "a line with leading spaces becomes a relative folder under the current directory" | BUILDER | the defect class item 3 exists to end; closed in round 1 |
| 134 | 5 | 5-refuter.md R1 Proof 1 | "The test can write outside its scratch roots." | BUILDER | fixed at landing |
| 135 | 5 | 5-refuter.md R1 Standards 1 | "(\"which reuses its registration\") and ... (\"--force lets git reuse that record\") are false" | BUILDER | fixed at landing |
| 136 | 5 | 5-refuter.md R1 Standards 2 | "`README.md:167` states the absolute-path rule only in the `ORDO_SKILL_DIRS` paragraph" | BUILDER | fixed at landing |
| 137 | 5 | 5-refuter.md R1 Standards 3 | "four sentences in a row open with \"It checks\"" | BUILDER | prose standard D; fixed at landing |
| 138 | 5 | 5-refuter.md R1 Behaviour 1 | "A folder that is absolute but has trailing whitespace is refused with `... is not an absolute path`" | BUILDER | fixed at landing |
| 139 | 5 | 5-refuter.md R1 Behaviour 2 | "`pin: replaced <link>...` is printed even when `ln -sfn` failed" | BUILDER | fixed at landing |
| 140 | 6 | 6-refuter.md R0 Proof 1 | "agreement tests the section boundaries and not which items are findings" | BUILDER | brief item 7's count by hand; closed in round 1 |
| 141 | 6 | 6-refuter.md R0 Proof 2 | "The test has no tilde fence longer than three." | BUILDER | brief item 4; closed in round 1 (revert 18 red) |
| 142 | 6 | 6-refuter.md R0 Proof 3 | "Line 78 `elif line[0] in \" \\t\":` has no tab-indented case." | BUILDER | closed in round 1 (revert 19 red) |
| 143 | 6 | 6-refuter.md R0 Standards 1 | "This narrates attempts, which docs/dev/change-standard.md rule 7 forbids" | BUILDER | closed in round 1 |
| 144 | 6 | 6-refuter.md R0 Standards 2 | "The collector now refuses with exit 2 ... The skill states neither the refusal nor what it does" | BUILDER | the refusals are the builder's additions, not reported as Doc text for the read-only SKILL.md; closed in round 1 |
| 145 | 6 | 6-refuter.md R0 Behaviour 1 | "The new `^closures?` alternative also matches a round finding about a failed closure." | BUILDER | closed in round 1 (revert 31 red) |
| 146 | 6 | 6-refuter.md R0 Behaviour 2 | "The collector counts items that report no defect as findings ... there are 15 such rows" | BRIEF | brief 6.md item 1 defines a finding as every top-level item under the four headings; visible before build: yes, the archived reports the brief sends the builder to hold such items; ruling 6 of the round |
| 147 | 6 | 6-refuter.md R0 Behaviour 3 | "A heading with trailing punctuation ... matches none of HEADINGS, so every finding under it is dropped silently" | BUILDER | closed in round 1 (revert 34 red) |
| 148 | 6 | 6-refuter.md R0 Behaviour 4 | "\"- None found.\" and \"- None: every figure reproduces.\" are emitted as findings" | BUILDER | closed in round 1 |
| 149 | 6 | 6-refuter.md R0 Behaviour 5 | "The brief specified real-path comparison, so this is a change to the brief's matching" | BRIEF | brief item 5 compares by `os.path.realpath`, which changes when `/plan` moves the ledger to the archive; visible: yes, plan/SKILL.md:48 states the move; closed in round 1 (run in the key) |
| 150 | 6 | 6-refuter.md R1 Spec 1 | "a retro's list holds only its own new runs ... it reads again e[arlier runs]" | BUILDER | fixed at landing (Steps 8 carries entries over) |
| 151 | 6 | 6-refuter.md R1 Proof 1 | "no fixture combines two suffixes. With the loop replaced by a single pass the test prints `PASS`" | BUILDER | rule 13; booked as step 6a |
| 152 | 6 | 6-refuter.md R1 Proof 2 | "Only `..` is tested." | BUILDER | rules 13, 15; booked as step 6a |
| 153 | 6 | 6-refuter.md R1 Proof 3 | "The list is not complete." | BUILDER | booked as step 6a |
| 154 | 6 | 6-refuter.md R1 Standards 1 | "the first-run sections still state a superseded state" | BUILDER | rule 7; fixed at landing |
| 155 | 6 | 6-refuter.md R1 Standards 2 | "the new line is one bullet of 201 words" | BUILDER | prose standard D, E; fixed at landing |
| 156 | 6 | 6-refuter.md R1 Behaviour 1 | "The builder gave \"nothing\", \"no finding\" and \"no defect\" the same breadth." | BUILDER | beyond ruling 6; booked as step 6a |
| 157 | 6 | 6-refuter.md R1 Behaviour 2 | "The ruling's fix covered `^closures?` and left these two alternatives." | BUILDER | ruling 5 not applied whole; booked as step 6a |
| 158 | 6 | 6-refuter.md R1 Behaviour 3 | "Judgment on the builder's open point, the ten or so items that report nothing" | BRIEF | same cause as #146 (brief item 1's definition, with refute letting confirmations sit under the four headings); visible: yes; fixed at landing in plan-retro Grouping and booked into step 1a for refute |
| 159 | 6a | 6a-refuter.md R0 Proof 1 | "the only fixture with two-digit numbered items (\"10.\" to \"15.\") is gone" | BUILDER | brief 6a.md item 2 removes only fixtures that exist for a dropped form; closed in the round |
| 160 | 6a | 6a-refuter.md R0 Proof 2 | "the only case of a round item taking its kind from a trailing \"Proof.\" is gone" | BUILDER | closed in the round |
| 161 | 6a | 6a-refuter.md R0 Proof 3 | "says the removed fixtures existed \"only for a dropped form\", which is not true" | BUILDER | closed in the round |
| 162 | 6a | 6a-refuter.md R0 Standards 1 | "both say every item \"in a repair round\" is a finding ... The brief's wording was ... outside its unread subsections" | BUILDER | the builder dropped the brief's qualifier (brief item 1); closed in the round and at landing |
| 163 | 6a | 6a-refuter.md R0 Standards 2 | "the report states that the grep was run and its conclusion but gives neither the command nor its output" | BUILDER | rule 14; closed in the round |
| 164 | 6a | 6a-refuter.md R0 Behaviour 1 | "It does not state the count over the ledger" | BUILDER | closed in the round |
| 165 | 6a | 6a-refuter.md R1 Proof 1 | "A silent \"Closed\" list is not held by `NOT_READ`" | BUILDER | fixed at landing with a case |
| 166 | 6a | 6a-refuter.md R1 Proof 2 | "says the README bullet before the change was \"seven sentences\". The base line ... has 13 sentences." | BUILDER | fixed at landing |
| 167 | 6a | 6a-refuter.md R1 Standards 1 | "name \"a subheaded round's list before its subheadings\" as a part the collector does not read" | BUILDER | fixed at landing |
| 168 | 7 | 7-refuter.md R0 Spec 1 | "The case is inverted in the test ... The case is wrong and the rule is right." | BRIEF | the brief's case expected no bold error for `1. Read the input from __init__.py.`, while its own rule and CommonMark give bold; visible before build: yes, any CommonMark renderer shows it; ruling 1, and the brief's case corrected in the ledger at landing |
| 169 | 7 | 7-refuter.md R0 Spec 2 | "Indented headings reach one checker and not the other." | BRIEF | brief 7.md item 1 asks indented headings of the layout checker only, and item 3 gives the inventory checker no such fix; visible: yes, the inventory checker reads the same SKILL.md headings; ruling 2 |
| 170 | 7 | 7-refuter.md R0 Proof 1 | "The trailing carriage return has no red case, and cannot have one." | BRIEF | reviewer: "output-neutral code that the brief's fix text asks for" (item 1, "a trailing `\"\\r\"` stripped"); visible: unclear, it took a 4000-file differential to show no input separates the versions; ruling 3 |
| 171 | 7 | 7-refuter.md R0 Proof 2 | "The `**` case catches no mutation of its rule." | BUILDER | ruling 4 |
| 172 | 7 | 7-refuter.md R0 Proof 3 | "The `crlf` case is green under every revert." | BUILDER | the report's claim about it is false; ruling 5 |
| 173 | 7 | 7-refuter.md R0 Proof 4 | "The silent cases carry no quoted control output." | BUILDER | rule 13; ruling 6 |
| 174 | 7 | 7-refuter.md R0 Standards 1 | "README.md:128 overclaims the layout test." | BUILDER | ruling 7 |
| 175 | 7 | 7-refuter.md R0 Standards 2 | "README.md:129 overclaims the inventory test." | BUILDER | ruling 8 |
| 176 | 7 | 7-refuter.md R0 Standards 3 | "A docstring line was not rewrapped." | BUILDER | ruling 9 |
| 177 | 7 | 7-refuter.md R0 Behaviour 1 | "The report does not state the new errors on indented headings." | BUILDER | ruling 10 |
| 178 | 7 | 7-refuter.md R0 Behaviour 2 | "The table check reads only the first table of a section." | BUILDER | stated under judgment calls, not as a user-visible change; ruling 10 |
| 179 | 7 | 7-refuter.md R1 Spec 1 | "The ruling's premise for bold in an indented heading is wrong, and the report does not say so." | BRIEF | round brief 7-round-1.md ruling 10 said bold in an indented heading "now fail[s] where [it] passed"; visible before the round: yes, the base checker already failed it; stated in the booking, no code change |
| 180 | 7 | 7-refuter.md R1 Proof 1 | "two of the four old-file heading matches are indent-aware with nothing to prove it" | BUILDER | fixed at landing with cases `indented-row` and `indented-range` |
| 181 | 7 | 7-refuter.md R1 Standards 1 | "The docstrings' reason for keeping the carriage return is stronger than the code." | BUILDER | fixed at landing |
| 182 | 7a | 7a-refuter.md R0 Spec 1 | "The splitter only knows quotes and backslashes, so it cuts inside command substitutions, subshells, brace groups" | BUILDER | brief asks a split "into its simple commands"; ruling 1 of 7a-round-1.md |
| 183 | 7a | 7a-refuter.md R0 Spec 2 | "Exit 69 for a missing PyYAML is outside the brief" | REVIEWER-WRONG | ruling 3 kept it (the repository's convention for a missing dependency); sent to the builder: no, the round brief carries it as kept, with only the report's reason to state, which judgment call 2 already gave |
| 184 | 7a | 7a-refuter.md R0 Spec 3 | "it says the builder keys are at lines 10, 15, 21 and 23 ... prints line 11, not 10" | BRIEF | the brief's premise line number was wrong; visible before build: yes, one `grep -n`; the round brief names the premise line as the orchestrator's |
| 185 | 7a | 7a-refuter.md R0 Proof 1 | "Five branches of allow_list.py stay green when reverted." | BUILDER | rule 13; ruling 4 |
| 186 | 7a | 7a-refuter.md R0 Proof 2 | "The case sends TERM, runs `sleep 2`, then sends KILL, so it depends on timing." | OTHER | an intermittent red in step 4's `launch.test.sh` case and `launch.sh` stop, present on base df3c6a7 (16 of 16 red there under load, 7a-refuter.md R1 Proof 1); not in this step's brief or build; ruling 5 asked the round to trace it |
| 187 | 7a | 7a-refuter.md R0 Proof 3 | "The plan's verify list ... does not include `allow_list.test.sh`" | BRIEF | the brief gave no item for the ledger's verify list, which the builder may not edit; visible: yes, the brief adds a test; the round brief names it as the orchestrator's |
| 188 | 7a | 7a-refuter.md R0 Standards 1 | "Neither list names the allow file. launch.sh now refuses a claude resume without `--allow-file`" | BUILDER | rule 14, a sentence the change made false in a file on the path list; ruling 6 |
| 189 | 7a | 7a-refuter.md R0 Standards 2 | "It does not name `worker_allow` ... The cause is the brief's path list, which does not name this file." | BRIEF | visible: yes, plan/SKILL.md:52 lists every key /plan writes; ruling 7 widened the paths |
| 190 | 7a | 7a-refuter.md R0 Standards 3 | "the Tests bullets have no entry for `allow_list.test.sh` ... The cause is the brief's path list" | BRIEF | visible: yes, every test has a README bullet; written by the orchestrator at landing |
| 191 | 7a | 7a-refuter.md R0 Standards 4 | "This is one sentence of about 50 wo[rds]" | BUILDER | prose standard E; ruling 8 |
| 192 | 7a | 7a-refuter.md R0 Standards 5 | "Added code lines exceed it. The longest is ... 186 characters" | BUILDER | brief convention; ruling 9 |
| 193 | 7a | 7a-refuter.md R0 Behaviour 1 | "prints `worker_allow` entries without stripping them" | BUILDER | ruling 2 |
| 194 | 7a | 7a-refuter.md R0 Behaviour 2 | "the planned resume of step 7's builder ... must now pass `--allow-file`. The report does not name that consequence" | BRIEF | the brief made `--allow-file` required on every claude launch while plan.md:122 held a planned resume without it; visible: yes; the round brief names step 7's resume as the orchestrator's |
| 195 | 7a | 7a-refuter.md R1 Spec 1 | "Ruling 1 refuses `$(` and a backtick \"outside quotes\". The diff also refuses them inside double quotes." | REVIEWER-WRONG | Closed: "accepted. `sh` substitutes inside double quotes"; sent to the builder: no, disposed of at landing |
| 196 | 7a | 7a-refuter.md R1 Spec 2, Proof 1, Standards 2, Behaviour 1 (one finding) | "The intermittent red that ruling 5 asked to trace and end is not ended." | BUILDER | the builder changed the case instead of the defect; built in round 2 (7a-round-2.md), 0 of 16 red after (Closed counts the four as one) |
| 197 | 7a | 7a-refuter.md R1 Proof 2 and Behaviour 2 (one finding) | "the removed line-break refusal ... A carriage return outside quotes proves that false." | BUILDER | a check removed without its input handled; fixed at landing |
| 198 | 7a | 7a-refuter.md R1 Proof 3 | "For the backtick, `(`, `)`, `{` and `}`, this case cannot go red. The comment claims otherwise." | BUILDER | fixed at landing |
| 199 | 7a | 7a-refuter.md R1 Proof 4 | "Report line 245 (judgement call 10) says the resume rule \"is written once\"" | BUILDER | the report's claim does not reproduce; the text is right, no change (Closed) |
| 200 | 7a | 7a-refuter.md R1 Standards 1 | "It is one sentence of about 60 words with three ideas" | BUILDER | prose standard E; fixed at landing |
| 201 | 7a | 7a-refuter.md R2 Spec 1 | "Ruling 1 and ruling 4 are not met for a KILL that arrives after the builder has ended." | BUILDER | texts fixed at landing; the code's case booked as step 7b |
| 202 | 7a | 7a-refuter.md R2 Spec 3 | "The stop's duration is still unbounded. `session_members` ... reads the scanner's answer with no timeout." | BUILDER | booked as step 7b |
| 203 | 7a | 7a-refuter.md R2 Proof 1 | "The two guards of the no-replace write are each unproven." | BUILDER | rule 13; booked as step 7b |
| 204 | 7a | 7a-refuter.md R2 Proof 2 | "The bound is 50 iterations, not five seconds of wall time." | BUILDER | fixed at landing |
| 205 | 7a | 7a-refuter.md R2 Proof 3 | "No case covers either interleaving in Spec 1 or Behaviour 1" | BUILDER | rule 15; booked as step 7b |
| 206 | 7a | 7a-refuter.md R2 Standards 1 | "are made false by this round, see Behaviour 1" | BUILDER | rule 14; fixed at landing |
| 207 | 7a | 7a-refuter.md R2 Standards 2 | "This is the same defect ruling 8 of round 1 fixed in the head comment" | BUILDER | prose standard E; fixed at landing |
| 208 | 7a | 7a-refuter.md R2 Standards 3 | "Two phrases in `SKILL.md` name no concrete case" | BUILDER | prose standard A; fixed at landing |
| 209 | 7a | 7a-refuter.md R2 Behaviour 1 | "A launch that follows a KILLed one with the same exit file gets the old runner's `exit 137`" | BUILDER | new this round; rule written at landing, code booked as step 7b |
| 210 | 7a | 7a-refuter.md R2 Behaviour 2 | "A KILL after the builder ended leaves no exit file (Spec 1)." | BUILDER | stated at landing; booked as step 7b |
| 211 | 7a | 7a-refuter.md R2 Behaviour 3 | "The report's \"User-visible changes\" ... lists only the test change for round 2." | BUILDER | rule 7; stated in the booking |
| 212 | 7b | 7b-refuter.md R0 Proof 1 | "The launch's removal of an earlier run's temporary files has no case that turns red." | BUILDER | brief item 4's second sentence unproven; ruling 1 of 7b-round-1.md |
| 213 | 7b | 7b-refuter.md R0 Standards 1 | "`launch.sh:43` is false." | BUILDER | rule 14; ruling 4 |
| 214 | 7b | 7b-refuter.md R0 Standards 2 | "The same rule is written twice in `SKILL.md`, in lines this diff adds." | BUILDER | skill-layout "Where a rule goes"; ruling 5 |
| 215 | 7b | 7b-refuter.md R0 Standards 3 | "Sentences well over the brief's \"under about 20 words\"" | BUILDER | ruling 6 |
| 216 | 7b | 7b-refuter.md R0 Standards 4 | "`SKILL.md:182` says \"for a few seconds after the KILL\"." | BUILDER | prose standard A; ruling 7 |
| 217 | 7b | 7b-refuter.md R0 Behaviour 1 | "The guard can outlive its purpose when the leader's pid is reused ... `kill 0` by pid is the mechanism brief decision 1 names." | BRIEF | brief decision 1 prescribed watching the leader by pid; visible before build: unclear, the reviewer judged reuse "very unlikely" and the final ruling (round 2, ruling 1) kept the pid watch with a process-group check |
| 218 | 7b | 7b-refuter.md R0 Behaviour 2 | "A TERM followed by a KILL during the leader's own write leaves `<exit>.tmp.<leader pid>`." | BUILDER | the report's user-visible line omitted the exception; ruling 1 |
| 219 | 7b | 7b-refuter.md R0 Behaviour 3 | "The return value of `open $lock, \"+<&=\", ...` (237) is not checked." | BUILDER | ruling 3 |
| 220 | 7b | 7b-refuter.md R1 Spec 1, Standards 1, Behaviour 1 (one finding) | "Ruling 2 leaves a stop with no exit file, which contradicts the brief's \"What it must do\"." | BRIEF | reviewer: "Ruling 2 chose this design"; the round brief 7b-round-1.md ruling 2 bounded the guard at 10 s against the brief's requirement of an exit file after every KILL; visible before the round: yes, the ruling's own text says the guard then exits without writing; built in round 2 |
| 221 | 7b | 7b-refuter.md R1 Proof 1 and Standards 3 (one finding) | "\"no sentence this step added is over 24 words\" is not true" | BUILDER | built in round 2 (ruling 3) |
| 222 | 7b | 7b-refuter.md R1 Standards 2 | "The test's head comment does not list the round's two new cases." | BUILDER | built in round 2 (ruling 2) |
| 223 | 7b | 7b-refuter.md R1 Standards 4 | "`SKILL.md:195`, `SKILL.md:215` and `launch.sh:37` still say the runner stops the builder \"within about a second\"" | BUILDER | sentences beside the change left stale; built in round 2 (ruling 4) |
| 224 | 7b | 7b-refuter.md R2 Proof 1 and Standards 1 (one finding) | "the test's new comment has three sentences over the limit" | BUILDER | fixed at landing |
| 225 | 7b | 7b-refuter.md R2 Proof 2 | "The report's quoted red ... is not the suite's first `FAIL:` line." | BUILDER | report inaccuracy; the booking quotes the right line, no code change |
| 226 | 7b | 7b-refuter.md R2 Proof 3 | "The guard's `getpgrp` check ... has no case that turns red when it is removed" | BUILDER | rule 13; fixed at landing with the case "guard group" |
| 227 | 7b | 7b-refuter.md R2 Standards 2 | "`launch.test.sh:1291-1292` is garbled" | BUILDER | fixed at landing |
| 228 | 7b | 7b-refuter.md R2 Behaviour 3 | "The guard's exit condition is \"the leader has been reaped\", not \"the leader has ended\"." | BRIEF | round 2 ruling 1 (7b-round-2.md) withdrew the bound, which leaves the zombie case unbounded ("Round 1's bound limited this case to 10 s. Now it has no limit."); visible before the round: unclear, the case needs a non-reaping subreaper and was reasoned, not reproduced; booked as step 7c |
| 229 | 7c | 7c-refuter.md R0 Spec 1 | "The brief asks for the README line \"as `grep -n` prints it\". The report gives it cut short" | BUILDER | ruling 7 of 7c-round-1.md |
| 230 | 7c | 7c-refuter.md R0 Proof 1 | "Two counts in the report do not reproduce." | BUILDER | ruling 6 |
| 231 | 7c | 7c-refuter.md R0 Standards 1 | "\"So a normal end starts no ps.\" The sentence is false for a normal end whose note `end` takes between 1 and 3 seconds." | BUILDER | ruling 4 |
| 232 | 7c | 7c-refuter.md R0 Standards 2 | "The refusal is defined by \"live\" and the new term is \"gone\", two terms for one concept" | BUILDER | prose standard D; ruling 5 |
| 233 | 7c | 7c-refuter.md R0 Standards 3 | "the SKILL.md:195 sentence above is 21 by `wc -w`" | BUILDER | ruling 6 |
| 234 | 7c | 7c-refuter.md R0 Behaviour 1 | "The guard's `ps` call has no time limit." | BUILDER | ruling 1 |
| 235 | 7c | 7c-refuter.md R0 Behaviour 2 | "When `ps` fails or answers nothing, the result is \"alive\", with no message." | BUILDER | ruling 2 |
| 236 | 7c | 7c-refuter.md R0 Behaviour 3 | "`ps` resolves through the builder's `PATH` ... The report does not state it as host-visible." | BUILDER | ruling 3 |
| 237 | 7c | 7c-refuter.md R1 Spec 1-2 (one finding) | "The README Doc text sentence \"A normal end starts no `ps` in the guard.\"" and "says so once" | BUILDER | fixed at landing (Closed counts the two sentences as one item) |
| 238 | 7c | 7c-refuter.md R1 Proof 1 | "Ruling 2's \"one line, then asks ps no more\" is an audit, not a proof." | BUILDER | fixed at landing with a case |
| 239 | 7c | 7c-refuter.md R1 Proof 2 | "The normal-end check was widened without a ruling." | REVIEWER-WRONG | Closed: "accepted. Ruling 4 set the design ... the case checks what that design promises"; sent to the builder: no, disposed of at landing |
| 240 | 7c | 7c-refuter.md R1 Proof 3 | "The launch-case bound does not measure what ruling 1 asked." | BUILDER | fixed at landing |
| 241 | 7c | 7c-refuter.md R1 Proof 4 | "The report's first part is stale." | BUILDER | no change; the booking states the end state |
| 242 | 7c | 7c-refuter.md R1 Proof 5 | "The load-run closure does not reproduce as 0 red." | BRIEF | the brief's "What it must do" required 0 red of 32 runs at 16 at once, which main's files before the step also fail (1 of 32, 4 of 48); no red is in a case the step touches; visible before build: unclear, it depends on the machine's load and the base was not measured under it when the brief was written; booked as step 7d |
| 243 | 7c | 7c-refuter.md R1 Standards 1 | "state bounds the round's own 2-second `ps` limit breaks" | BUILDER | fixed at landing |
| 244 | 7c | 7c-refuter.md R1 Standards 2 | "The round narrowed the case to the guard's first second (see Proof), and this line was not carried." | BUILDER | fixed at landing |
| 245 | 7c | 7c-refuter.md R1 Behaviour 1 | "The zombie cases' patched copy now also raises the note's limit from 3 to 15 seconds. No ruling covers it" | REVIEWER-WRONG | Closed: "accepted; it keeps `end` hanging past the guard's first `ps`"; the reviewer itself says it does not weaken what the cases assert; sent: no |
| 246 | 8 | 8-refuter.md R0 Spec 1 | "The builder followed brief decision 1 ... as written, so the defect is in the decision." | BRIEF | decision 1 resolves reason paths against `skills/<skill>/`, so a research-hub path of the same form passes; visible before build: yes, the coverage list's reasons already name research-hub relative paths; ruled (prefix form) in round 1 |
| 247 | 8 | 8-refuter.md R0 Spec 2 | "`os.path.exists(...)` accepts a folder ... Brief item 4 says \"a path\", so the builder's reading is within the brief's words" | BRIEF | item 4 says "a path" where entry 15.A's gate asks for a file; visible: yes, the gate text is in the roadmap; closed in round 1 |
| 248 | 8 | 8-refuter.md R0 Standards 1 | "The brief limited the step's writes to the two utils files, so the builder could not write this page." | BRIEF | path list; visible: yes, docs/academic-coverage.md:20-24 shows the check's command; closed in round 1 |
| 249 | 8 | 8-refuter.md R0 Standards 2 | "the README sentence leaves it out" | BUILDER | the `.` exclusion missing from the Doc text; closed in round 1 |
| 250 | 8 | 8-refuter.md R0 Behaviour 1 | "on macOS's default case-insensitive APFS a reason naming `Templates/VENUE.tex` passes" | BUILDER | closed in round 1 |
| 251 | 8 | 8-refuter.md R0 Behaviour 2 | "a link inside `skills/<skill>/` that points to a file outside the repository counts as the named file" | BUILDER | closed in round 1 |
| 252 | 8 | 8-refuter.md R0 Behaviour 3 | "`--built <skill>` passes silently when the named sections hold no `rebuild: <skill>` row" | BUILDER | the report does not state the vacuous pass; closed in round 1 (ruling 3) |
| 253 | 8 | 8-refuter.md R1 Standards 1 | "This sentence is about 45 words and states two failure conditions." | BUILDER | fixed at landing |
| 254 | 8 | 8-refuter.md R1 Standards 2 | "A span not in normal form ... does not count ... The page's list leaves it out." | BUILDER | fixed at landing |
| 255 | 8 | 8-refuter.md R1 Behaviour 1 | "(ruling 3, the no-row error) against `plan.md` step 10 ... `--built <skill>` for any of them exits 1" | BRIEF | round ruling 3's no-row error meets plan step 10's text, which asks a gate through step 8's mode for skills that have no `rebuild:` row; visible: yes, docs/academic-coverage.md shows no row for entries 4, 8, 11, 12; carried into step 10 |
| 256 | 9 | 9-refuter.md R0 Spec 1 | "Brief item 2 says the block is written \"with the file's own line ending\" ... The line ending of the first line decides it." | BUILDER | closed in the round (majority ending) |
| 257 | 9 | 9-refuter.md R0 Proof 1 | "the report gives `land.sh` 495 lines and `land.test.sh` 528. `wc -l` ... prints 496 and 529" | BUILDER | closed in the round |
| 258 | 9 | 9-refuter.md R0 Standards 1 | "skills/repo-setup/SKILL.md:74-81 (outside the step's path list) ... The diff makes both sentences false" | BRIEF | the brief's path list left out the skill text that names sync_rules.py's exit 2; visible before build: yes, the sync steps name exit 2 and the brief adds exit-2 causes; closed in the round |
| 259 | 9 | 9-refuter.md R0 Standards 2 | "adds a new stop ... but the Stops table ... has no row for it" | BUILDER | skill-layout Sections row 7; closed in the round |
| 260 | 9 | 9-refuter.md R0 Behaviour 1 | "The message tells the user to land again, but ... running the landing again fails." | BUILDER | closed in the round (resume from `<pkg>-land`) |
| 261 | 9 | 9-refuter.md R0 Behaviour 2 | "does not give the mixed line-ending behaviour of `--write` ... with a before and after" | BUILDER | closed in the round |
| 262 | 9 | 9-refuter.md R1 Standards 1 | "The skill's own Steps never create `<step>-land`" | BUILDER | fixed at landing |
| 263 | 9 | 9-refuter.md R1 Standards 2 | "`fail` exits, so line 244 never runs. It is dead code that the round added." | BUILDER | fixed at landing |
| 264 | 9 | 9-refuter.md R1 Behaviour 1 | "The resume is not limited to lock stops, and it does not check main." | BUILDER | fixed at landing with the case "staged main" |
| 265 | 11 | 11-refuter.md R0 Spec 1 | "three `rebuild: paper` rows now defer part of their file to \"the later planning dialogue\"" | BUILDER | brief 11.md item 2 calls such a row defective; closed in round 1 |
| 266 | 11 | 11-refuter.md R0 Spec 2 | "the reason sends the pre-output checklist to \"Entry 5's final check\", but the row is not a `rebuild:` row" | BUILDER | closed in round 1 |
| 267 | 11 | 11-refuter.md R0 Spec 3 | "formatter_agent.md 844-847 ... and the format profile section 103-158 ... have no destination in the reason" | BUILDER | closed in round 1 |
| 268 | 11 | 11-refuter.md R0 Spec 4 | "intake_agent.md Step 5 ... Step 13 ... and the plan-mode 3-question interview ... are carried by no row" | BUILDER | closed in round 1 |
| 269 | 11 | 11-refuter.md R0 Spec 5 | "says \"zh-TW and evidence profiles go\", while line 86 ... keeps the `cs_ml` profile" | BUILDER | closed in round 1 |
| 270 | 11 | 11-refuter.md R0 Proof 1 | "the builder's comparison script output ... is not rerunnable as quoted" | BUILDER | closed in round 1 |
| 271 | 11 | 11-refuter.md R0 Proof 2 | "the builder ran `git diff --stat` against the brief's \"never run a git command\" rule" | BUILDER | disclosed; none in the round (Closed) |
| 272 | 11 | 11-refuter.md R0 Standards 1 | "Brief decision 2 (\"a reason that grows past about 35 words ...\"): changed cells at line 60 (44 words) ... are over" | BRIEF | the brief read ruling 2e as a limit per reason cell, where plan 2's brief set it as a sentence length (premise correction, plan.md:608); visible before build: yes, `.scratch/archive/2-coverage-.../briefs/4.md:38` states it; closed at landing with the brief corrected |
| 273 | 11 | 11-refuter.md R0 Standards 2 | "Ruling 2e (about 35 words per reason cell): 46 of the 61 cells in this step's own section ... are still over" | BRIEF | same misreading as #272, which sent the round to shorten 46 cells; visible: yes; closed at landing |
| 274 | 11 | 11-refuter.md R0 Standards 3 | "line 77 opens with a verbless list" | BUILDER | prose standard E, 0; closed in round 1 |
| 275 | 11 | 11-refuter.md R0 Standards 4 | "\"coach and audit modes\" does not name the modes" | BUILDER | closed in round 1 |
| 276 | 11 | 11-refuter.md R0 Standards 5 | "dropped \"among them\", so the list now reads as the file's whole rule set" | BUILDER | closed in round 1 |
| 277 | 11 | 11-refuter.md R0 Behaviour 1 | "docs/roadmap.md:120 ... says \"11 for paper\"; after this change the count is 8 ... outside the brief's path list" | BRIEF | the brief changes marks but left the roadmap count out of its paths; visible: yes, roadmap.md:120 counts the `rebuild later` rows; the round widened the paths |
| 278 | 11 | 11-refuter.md R0 Behaviour 7 | "Audit finding 13, ethics half: open. The rows are deep-research rows ... not academic-paper rows as the brief says" | BRIEF | the brief's premise put the ethics rows in academic-paper; visible: yes, docs/academic-coverage.md:190 and :218 are in the deep-research section; booked at step 14 |
| 279 | 11 | 11-refuter.md R1 Spec 1 | "the round removed the file's drop of the generator-evaluator contract ... Record 1 does not mention the removal" | BUILDER | ruling 7 required the shortening to keep every destination; closed in round 2 |
| 280 | 11 | 11-refuter.md R1 Spec 2 | "the round removed \"zh-TW fonts go\"" | BUILDER | closed in round 2 |
| 281 | 11 | 11-refuter.md R1 Spec 3 | "Bias-free language ... and the extended citation and reference forms ... are not page rules" | BUILDER | closed in round 2 |
| 282 | 11 | 11-refuter.md R1 Spec 4 | "The round dropped the interim home for venue limits" | BUILDER | closed in round 2 |
| 283 | 11 | 11-refuter.md R1 Spec 5 | "\"its templates\" names the wrong set" | BUILDER | closed in round 2 |
| 284 | 11 | 11-refuter.md R1 Spec 6 | "\"Ten figure checks include value fidelity, as entry 5 requires.\" Entry 5 ... has no value-check requirement." | BUILDER | closed in round 2 |
| 285 | 11 | 11-refuter.md R1 Proof 1 | "Result table row 2 ... and \"Wrong in the brief\" ... are false for the current tree" | BUILDER | closed in round 2 |
| 286 | 11 | 11-refuter.md R1 Standards 1 | "Ten cells now begin with \"It\" or \"Its\"" | BUILDER | closed in round 2 |
| 287 | 11 | 11-refuter.md R1 Standards 2 | "\"off-length drafts list sections, never deleting\" gives the listing to the draft" | BUILDER | closed in round 2 |
| 288 | 11 | 11-refuter.md R1 Standards 3 | "\"the fixed `apa7` class\" does not say what \"fixed\" means" | BUILDER | closed in round 2 |
| 289 | 11 | 11-refuter.md R1 Standards 4 | "\"`SKILL.md` takes the checklist\" does not say which checklist" | BUILDER | closed in round 2 |
| 290 | 11 | 11-refuter.md R1 Behaviour 1 | "The removed drops on lines 54, 59 and 81 change what entries 5 and 15.A must build" | BUILDER | closed in round 2 |
| 291 | 11 | 11-refuter.md R2 Spec 1 | "the base named materials and co-authors among the fixed fields ... the row now carries none of the three" | BUILDER | fixed at landing |
| 292 | 11 | 11-refuter.md R2 Spec 2 | "the drop of the APA page rules for headings ... and the title page ... is no longer stated" | BUILDER | fixed at landing |
| 293 | 11 | 11-refuter.md R2 Spec 3 | "round 2 removed \"with LaTeX templates\" ... which no ruling asked for" | BUILDER | fixed at landing |
| 294 | 11 | 11-refuter.md R2 Spec 4 | "the base named automatic format correction ... round 1 removed it and round 2 did not restore it" | BUILDER | fixed at landing |
| 295 | 11 | 11-refuter.md R2 Spec 5 | "the cover letter ... goes to `submit-manuscript`, but roadmap entry 14 ... names portal filling and a submission record" | OTHER | roadmap entry 14's scope text omits the cover letter the coverage rows now send there; a roadmap text outside the step, booked at step 10, which edits roadmap entries |
| 296 | 11 | 11-refuter.md R2 Proof 1 | "count cells over 35 words; ruling 2e limits sentences, and no sentence in lines 50-115 is over 35" | BRIEF | the report followed the brief's per-cell reading of ruling 2e (#272); visible: yes; fixed at landing |
| 297 | 11 | 11-refuter.md R2 Proof 2 | "record 15: \"the clinical safety note (82)\" ... the safety note is at 87-88" | BUILDER | fixed at landing |
| 298 | 11 | 11-refuter.md R2 Proof 3 | "records 4, 7, 13 and 28 claim parts kept that the rows no longer carry" | BUILDER | fixed at landing |
| 299 | 11 | 11-refuter.md R2 Standards 1 | "each cell ends \"X, Y and Z have no use.\"" | BUILDER | fixed at landing |
| 300 | 11 | 11-refuter.md R2 Standards 2 | "\"Its checklist repeats ...\" follows a sentence whose subject is \"Abstracts\"" | BUILDER | fixed at landing |
| 301 | 11 | 11-refuter.md R2 Standards 3 | "the reference is made the subject of all four checks" | BUILDER | fixed at landing |
| 302 | 11 | 11-refuter.md R2 Standards 4 | "\"from each policy page and access date\" reads as if the access date were a source" | BUILDER | fixed at landing |
| 303 | 11 | 11-refuter.md R2 Behaviour 1 | "leaves out line 90 ... and lines 60 and 81" | BUILDER | fixed at landing |
| 304 | 12 | 12-refuter.md R0 Spec 1 | "The five agent rows send \"the sprint-contract section\" ... to entry 15.A as a whole. That section includes the contract-driven decision" | BUILDER | conflicts with row 140's drop; ruling 1 of 12-round-1.md |
| 305 | 12 | 12-refuter.md R0 Spec 2 | "Row 12 ... carries a cross-model default that points to the same missing file and is not mentioned" | BUILDER | ruling 2 |
| 306 | 12 | 12-refuter.md R0 Spec 3 | "The reasons call the phase folders \"not installed\". The file describes them as run-time write targets" | BUILDER | ruling 3 |
| 307 | 12 | 12-refuter.md R0 Spec 4 | "gives a reason that fits the routing and invocation sections ... but not Version Info ... or Related Skills" | BUILDER | ruling 4 |
| 308 | 12 | 12-refuter.md R0 Spec 6 | "the 15.A deferrals in rows 120-127 and 140 name the entry and a protocol file, never the skill" | BUILDER | brief item 2 asks the skill and entry; ruling 5 |
| 309 | 12 | 12-refuter.md R0 Spec 8 | "15.A's gate would never check such a part. The pattern is consistent with brief item 2" | BRIEF | brief item 2 lets a `rebuild` row defer a part to a named skill and entry, while the doc's mark definitions and entry 15.A's gate (roadmap.md:120-121) count only `rebuild later` rows; visible before build: yes, both texts were on main; ruling 6 added a definition sentence |
| 310 | 12 | 12-refuter.md R0 Proof 1 | "the largest-sentence command is quoted ... so it cannot be rerun as quoted" | BUILDER | ruling 7 |
| 311 | 12 | 12-refuter.md R0 Proof 2 | "That range includes SKILL.md:406-412, the sprint hard gate, which the same record sends to entry 15.A." | BUILDER | ruling 7 |
| 312 | 12 | 12-refuter.md R0 Behaviour 1 | "The report does not state the conflict (Spec 1)." | BUILDER | ruling 1 |
| 313 | 12 | 12-refuter.md R1 Closures (ruling 6's list) | "rows 54 and 60, outside 116-146, name no carrying file" | OTHER | the rows are in step 11's section, outside this step's path list; the round's ruling 6 check surfaced them; fixed at landing (Closed item 7) |
| 314 | 12 | 12-refuter.md R1 Spec 1 | "\"since the first gate reviews with one model\" is not in the roadmap" | BUILDER | fixed at landing |
| 315 | 12 | 12-refuter.md R1 Spec 2 | "line 14 says a `rebuild:` skill \"must cover what the file does ...\" and does not point to the exception on line 15" | BUILDER | fixed at landing |
| 316 | 12 | 12-refuter.md R1 Spec 3 | "Row 133 ... does not name the synthesizer's guided-mode issue list that row 127 sends to it" | BUILDER | fixed at landing |
| 317 | 12 | 12-refuter.md R1 Proof 1 | "\"the rest of the hard gate ... (409-412)\" includes SKILL.md:411" | BUILDER | fixed at landing |
| 318 | 12 | 12-refuter.md R1 Proof 2 | "The report quotes `python3 check15a.py` from its session scratchpad, which cannot be rerun" | BUILDER | fixed at landing |
| 319 | 12 | 12-refuter.md R1 Standards 1 | "the new definition sentence is 46 words; the 35-word exception covers only reason cells" | BRIEF | the sentence is ruling 6's of 12-round-1.md, which the reviewer checked "word for word on line 15"; visible before the round: yes, a word count of the ruling's sentence; fixed at landing |
| 320 | 13 | 13-refuter.md R0 Spec 1 | "the new reason sends to `paper` that the audit \"reports claims that break the author's declared constraints ...\"" | BUILDER | conflicts with row 58; ruling 1 of 13-round-1.md |
| 321 | 13 | 13-refuter.md R0 Spec 2 | "gives every other part its own fate, except the run-level `slr_lineage` emission" | BUILDER | ruling 2 |
| 322 | 13 | 13-refuter.md R0 Spec 3 | "\"The budget display ends because ...\" does not hold for SKILL.md line 401, an up-front token-cost estimate" | BUILDER | ruling 3 |
| 323 | 13 | 13-refuter.md R0 Behaviour 1 | "It does not state the new build obligations the changed reasons place on later entries" | BUILDER | ruling 4 |
| 324 | 13 | 13-refuter.md R1 Spec 1, Proof 1, Behaviour 1 (one finding) | "row 152 still ends the orchestrator's round-trip count \"with the budget display of `SKILL.md`\"" | BUILDER | Closed: "(one cause)"; fixed at landing |
| 325 | 13 | 13-refuter.md R1 Spec 3 | "\"That grades the person rather than the research\" contradicts collaboration_depth_agent.md 122 and 154" | BUILDER | a `holds` row the builder's ruling-5 statement judged right; fixed at landing |
| 326 | 13 | 13-refuter.md R1 Spec 4 | "\"replaced by a read source\" ... no line says it was read" | BUILDER | same as #325; fixed at landing |
| 327 | 13 | 13-refuter.md R1 Standards 1 | "repeated sentence shape" | BUILDER | prose standard 0; fixed at landing |
| 328 | 14 | 14-refuter.md R0 Spec 1 | "three parts have no destination and no reason" (ethics rows 190 and 218) | BUILDER | ruling 1 of 14-round-1.md |
| 329 | 14 | 14-refuter.md R0 Spec 2 | "The file says these forms are consumed by `academic-paper` plan mode and `academic-paper-reviewer`" | BUILDER | ruling 2 |
| 330 | 14 | 14-refuter.md R0 Spec 3 | "The sidecar files ... are the agent's own output, which `report_compiler_agent.md:114-116` reads" | BUILDER | ruling 3 |
| 331 | 14 | 14-refuter.md R0 Spec 4 | "That file's row (line 55) does not list them, so the part is recorded only on the sending side." | BUILDER | ruling 4 |
| 332 | 14 | 14-refuter.md R0 Spec 5 | "The drop holds; the stated reason does not match the file on this rule." | BUILDER | ruling 5 |
| 333 | 14 | 14-refuter.md R0 Spec 6 | "The builder wrote `.agents/b14/` ... outside the path list" | REVIEWER-WRONG | Closed: "changes no tracked file and no path of another step"; not ruled; sent to the builder: no |
| 334 | 14 | 14-refuter.md R0 Standards 1 | "appears word for word in seven rows" | BUILDER | prose standard 0; ruling 6 |
| 335 | 14 | 14-refuter.md R0 Standards 2 | "gives \"11 `PASS:` lines, 10 `ok:` lines\" as counts ... and the report gives none" | BUILDER | ruling 8 |
| 336 | 14 | 14-refuter.md R0 Standards 3 | "the report names roadmap line 120 but not line 122" | BUILDER | rule 14; ruling 8 |
| 337 | 14 | 14-refuter.md R0 Behaviour 1 | "docs/roadmap.md:120 ... is now false: paper 6, researcher 0, total 15" | BRIEF | the brief changes marks but left roadmap.md:120 out of its paths, as step 11's brief had; visible before build: yes, the line counts the `rebuild later` rows; carried by open item M |
| 338 | 14 | 14-refuter.md R0 Behaviour 2 | "entry 15.A's \"Waits on: 5, 6, 9 and 13 ...\" is now false for 13 ... The report does not state this." | BUILDER | report omission; ruling 8 |
| 339 | 14 | 14-refuter.md R0 Behaviour 3 | "plan.md:100 and orchestrator-state.md:76 (open item M) are now false" | OTHER | the orchestrator's own ledger texts, carried by open item M, a user decision in flight |
| 340 | 14 | 14-refuter.md R0 Behaviour 4 | "Entry 9 waits only on 3 and 2 ... The source marks the step optional" | BUILDER | ruling 7 |
| 341 | 14 | 14-refuter.md R1 Spec 1, Standards 1, Standards 2 (one finding) | "the reworded sentences say the order of deep-research's own phases belongs to `researcher`" | BUILDER | Closed: "(one cause)"; fixed at landing |
| 342 | 14 | 14-refuter.md R1 Spec 2 | "\"Nothing of its phase-three boundary survives\" drops the whole boundary" | BUILDER | fixed at landing |
| 343 | 14 | 14-refuter.md R1 Spec 3 | "\"When the ethics check runs is decided by `researcher` (entry 13)\" contradicts the row's first sentences" | BUILDER | fixed at landing |
| 344 | 14 | 14-refuter.md R1 Spec 4 | "ethics training ... is a qualification the board checks before approval ... the stated reason does not hold" | BUILDER | fixed at landing |
| 345 | 14 | 14-refuter.md R1 Spec 5 | "The paper skill takes the acknowledgement from one file and drops it from the other, and the reason names the wrong skill." | BUILDER | fixed at landing |
| 346 | 15 | 15-refuter.md R0 Spec 1 | "still states a count of `PASS:` lines without quoting them, the pattern step 15 exists to end" | BUILDER | ruling 1 of 15-round-1.md |
| 347 | 15 | 15-refuter.md R0 Spec 2 | "the replacement removes \"every landing report `Open items: none. Booked list: empty`\", which is literally true" | BUILDER | the brief does not ask for the removal; ruling 2 |
| 348 | 15 | 15-refuter.md R0 Spec 3 | "leaves out that the closing ran the layout check, its test, the inventory check and its test on main" | BUILDER | ruling 1 |
| 349 | 15 | 15-refuter.md R0 Spec 4 | "the same ledger gives two counts for each" | BUILDER | an inconsistency inside the bookings the step rewrites; ruling 3 |
| 350 | 15 | 15-refuter.md R0 Spec 5 | "The new text credits a clean ASCII check to the re-run only" | BUILDER | ruling 4 |
| 351 | 15 | 15-refuter.md R0 Standards 1 | "The breach is forced by the brief: check 1 needs `git ls-files`, check 3 and the re-run need `git show`." | BRIEF | the brief forbade every git command while its own checks run read-only git; visible before build: yes, the checks name `git ls-files` and `git show`; the brief's convention corrected (Closed) |
| 352 | 15 | 15-refuter.md R0 Standards 2 | "open with sentences of 60 to 90 words joined by semicolons" | BUILDER | prose standard; ruling 5 |
| 353 | 15 | 15-refuter.md R1 Spec 1-3 (one finding) | "the round's rule counts an item that restates a finding under another heading once ... the old figures were not false" | BRIEF | round ruling 3 of 15-round-1.md dictated "one count per finding" with example counts that collapse restatements, a rule plans 2 and 2.A do not follow; visible before the round: yes, their usage rows are on disk; Closed: "(one cause, the counting rule)", fixed at landing |
| 354 | 15 | 15-refuter.md R1 Spec 4 | "The audit's own evidence ... names one open item committed in plan 1" | BUILDER | fixed at landing |
| 355 | 15 | 15-refuter.md R1 Proof 1 | "cite session log line 5551 ... which runs in step 5's worktree" | BUILDER | fixed at landing |
| 356 | 17 | 17-refuter.md R0 Behaviour 1 | "reads \"Every `skills/<name>/SKILL.md` follows this layout\". The new line 45 ... makes it false." | BRIEF | the brief dictated the new layout rule word for word and no sweep of the ten skills it makes non-conforming; visible before build: yes, the reviewer's three bullets are on main; not sent back, raised to the user as open item GG |
| 357 | 17a | 17a-refuter.md R0 Spec 1 | "\"It checks `review`'s value (line 65)\". At the base the `review` check is lines 69 and 70 ... The error is in the brief" | BRIEF | a wrong line number in the brief's premises; visible: yes, one `grep -n`; no change to the diff |
| 358 | 17a | 17a-refuter.md R0 Behaviour 1 | "\"(the `spec` skill's Steps 4)\". The comparison is now `/spec`'s Steps 5" | BRIEF | the brief's new `/spec` step (decision 3) renumbers Steps, and plan-orchestration is not on the brief's path list (17a.md:50-63); visible: yes, `grep -rn "Steps [0-9]"` finds the one reference; ruling 2 |
| 359 | 17a | 17a-refuter.md R0 Behaviour 2 | "`skills/plan/SKILL.md:54` lists the keys ... and does not name `libraries`" | BRIEF | plan/SKILL.md is not on the brief's path list; visible: yes, line 54 lists every key of the block; ruling 3 |
| 360 | 17a | 17a-refuter.md R0 Behaviour 3 | "Nothing exempts a candidate the user has already ruled on ... so the brief is never written" | BRIEF | brief item 4 (17a.md:28) makes every candidate a stop with no exemption for a ruled one; visible: yes, `/spec` is retyped after a ruling and redoes its checks; ruling 1 |
| 361 | 17a | 17a-refuter.md R1 Behaviour 1 | "Any Rulings line naming the candidate settles it, whatever capability it was ruled for" | BRIEF | the settling sentence is ruling 1 of 17a-round-1.md ("a line of `plan.md`'s Rulings section naming it, is settled"); visible before the round: yes, the ruling names no capability; fixed at landing |
| 362 | 18 | 18-refuter.md R0 Spec 1 | "3-H1 is out of order ... yet the row sits last in report 3" | BUILDER | the brief asks for report order; ruling 1 of 18-round-1.md |
| 363 | 18 | 18-refuter.md R0 Spec 2 | "6-F17's finding cell ... is 17 words with no `...`; the brief caps it at 15" | BUILDER | ruling 2 |
| 364 | 18 | 18-refuter.md R0 Behaviour 1 | "6-F13 and 6-F17 cite research-hub lines that no longer hold the quoted text" | OTHER | the research-hub file was committed three times after `closure.md` was last written, so the cited lines moved under a correct build; ruling 3 re-read them |
| 365 | 18 | 18-refuter.md R0 Behaviour 2 | "1-4 (`open`): the evidence does not match the report's Fix" | BUILDER | ruling 4 |
| 366 | 18 | 18-refuter.md R1 Proof 1 | "1-15's list of Closed sections that give one closure for a group of named findings leaves out `11-refuter.md`" | BUILDER | fixed at landing |
| 367 | 18 | 18-refuter.md R1 Proof 2 | "`7-refuter.md`, `7a-refuter.md`, `7c-refuter.md` and `22-refuter.md` have no Closed section, so 25 files have one" | REVIEWER-WRONG | Closed: "not reproduced by the orchestrator ... the reviewer's grep looked for `## ` headings only"; all 29 reports have a closure section; only the report's "28" wording was corrected at landing; sent to the builder: no |
| 368 | 20 | 20-refuter.md R0 Spec 1 | "`plan.md:40` (the step 20 line) names \"the models ruling's Astra and Sol, and `.agents/launch/2b-7`\"; the brief carries neither" | BRIEF | the brief left out two items of the plan's step line; visible before build: yes, plan.md:40 names them; fixed at landing |
| 369 | 20 | 20-refuter.md R0 Spec 2 | "`worker_effort` survives ... Its only reader was the Codex recipe's `--effort <worker_effort>`" | BUILDER | brief item 2 removes every Codex passage; closed in round 1 |
| 370 | 20 | 20-refuter.md R0 Spec 3 | "`launch-note.md` is 34 lines at base, not 35 ... This changes nothing." | BRIEF | a wrong count in the brief's premises; visible: yes, `wc -l`; no change needed |
| 371 | 20 | 20-refuter.md R0 Standards 1 | "the `<runs dir>` positional argument is still required ... but nothing reads it any more" | BUILDER | rule 11; closed in rounds 1 and 2 |
| 372 | 20 | 20-refuter.md R0 Standards 2 | "\"what differs per harness is in `plan-orchestration`'s launch recipes\" is false ... The file is outside the path list" | BRIEF | path list; visible: yes, the builder found it with the brief's grep; closed in round 1 |
| 373 | 20 | 20-refuter.md R0 Standards 3 | "the step removed the definition of a dead builder ... now use both terms with nothing" defining them | BUILDER | closed in round 1 |
| 374 | 20 | 20-refuter.md R0 Standards 4 | "each comment or name points at what the code did before" | BUILDER | rule 10; closed in round 1 |
| 375 | 20 | 20-refuter.md R0 Behaviour 1 | "`utils/pin.sh <tag>` neither updates nor checks them ... those ten links are then left pointing at paths that would no longer exist" | BRIEF | the brief (ruling W) drops `~/.agents/skills` from pin's folders without a step for the links an earlier pin made there; visible: yes, `ls -la ~/.agents/skills`; booked for the user at the pin |
| 376 | 20 | 20-refuter.md R0 Behaviour 2 | "neither is in its before-and-after table" | BUILDER | closed in round 1 |
| 377 | 20 | 20-refuter.md R1 Spec 1 | "the ledger's own `orchestrator-state.md:26` still carries `worker_effort: high`" | OTHER | the orchestrator's own state file, outside the builder's reach; fixed at landing |
| 378 | 20 | 20-refuter.md R1 Proof 1 | "Revert 1b (only `-lt 2` changed to `-lt 3`) leaves the suite green" | BUILDER | closed in round 2, the exception round |
| 379 | 20 | 20-refuter.md R1 Standards 1 | "Nothing tells finished from dead in a later session." | BRIEF | the dead-builder sentence is round ruling 3's (20-round-1.md), built "in the ruling's words"; visible before the round: unclear, it turns on whether a new session's agent listing carries an earlier session's agents, which the reviewer did not verify; fixed at landing |
| 380 | 20 | 20-refuter.md R1 Standards 2 | "\"that id\" has no antecedent" | BUILDER | prose standard E; fixed at landing |
| 381 | 21 | 21-refuter.md R0 Spec 1 | "The report's first line says \"Everything in the brief is done\", but item 8 is not done ... four stale sentences it did not change" | BRIEF | brief 21.md item 8 asks every sentence the change makes false to be changed while the stale ones (plan-help, the state template, repo-setup's change standard) are outside its path list; visible before build: yes, each is found by grep on main; closed in round 1 (ruling 7) |
| 382 | 21 | 21-refuter.md R0 Spec 2 | "adds a bullet that no item asks for ... The conflict comes from rulings U 4 and X (a), which say nothing about steps the orchestrator books" | BRIEF | the brief carried rulings U 4 and X (a) without a rule for steps the orchestrator books, and the builder filled the gap with a rule where rule 4 reserves the choice for the user; visible: yes, booked steps were in the ledger; put to the user as open item Y, ruled (a) |
| 383 | 21 | 21-refuter.md R0 Spec 3 | "6a entered plan.md at e9633bd, step 6's landing, as a step the orchestrator booked" | REVIEWER-WRONG | Closed: "no change; the user ruled on 6a's content"; sent to the builder: no |
| 384 | 21 | 21-refuter.md R0 Proof 1 | "The behaviour follows the brief's literal naming rule ... that needs the orchestrator's ruling on the brief's text" | BRIEF | brief 21.md:9 names a ruling line by "the text before ` (`" in a way that makes `Open item E:` the name; visible: yes, the Rulings section's `- Open item <L>: ...` lines are on disk; ruling 2 |
| 385 | 21 | 21-refuter.md R0 Proof 2 | "The mutation `#{1,2}` to `#{1,3}` ... leaves `check_step.test.sh` green" | BUILDER | ruling 3 |
| 386 | 21 | 21-refuter.md R0 Proof 3 | "The ledger-root validation in `land.sh:122-128` accepts values that the ignore pattern then fails to match" | BUILDER | rule 15; ruling 4 |
| 387 | 21 | 21-refuter.md R0 Proof 4 | "The state file's verify list does not run `check_step.test.sh`." | BRIEF | the brief gave no item for the ledger's verify list; visible: yes; fixed at landing |
| 388 | 21 | 21-refuter.md R0 Standards 1 | "A head comment and the README say more than the code does." | BUILDER | rule 14; ruling 5 |
| 389 | 21 | 21-refuter.md R0 Standards 2 | "\"What it reads\" does not list the `land` skill's `templates/land.sh` and `templates/land.test.sh`" | BUILDER | skill-layout row 4; ruling 6 |
| 390 | 21 | 21-refuter.md R0 Standards 3 | "The stale sentences of Spec 1 remain on the tree." | BRIEF | same cause as #381 (Closed: "closed with Spec 1"); visible before build: yes, as for the finding it shares a cause with |
| 391 | 21 | 21-refuter.md R0 Behaviour 1 | "The report does not state the before and after of Spec 2" | BUILDER | closed in round 1 |
| 392 | 21 | 21-refuter.md R0 Behaviour 2 | "The report's \"Ledger copy\" commands for this plan's ledger will therefore fail until the pin of ruling W. The report does not say this." | BUILDER | report omission; ruling 8 |
| 393 | 21 | 21-refuter.md R1 Spec 1 | "This still adds a step with no ruling named." | BUILDER | ruling 1 asked the texts to agree; fixed at landing |
| 394 | 21 | 21-refuter.md R1 Spec 2 and Behaviour 1 (one finding) | "`/spec` does not describe the path that the new texts send a backed-out step through." | BRIEF | round ruling 1 routes a backed-out step "through `/spec`", a route `/spec` does not have (its Steps 6 worktree add fails on the kept branch); visible before the round: yes, spec Steps 6 is on the tree; raised to the user as open item Z (Closed merges the two) |
| 395 | 21 | 21-refuter.md R1 Spec 3 | "Line 161 still says a finding beyond the brief is closed at landing" | BUILDER | the ruling asked these texts to agree; fixed at landing |
| 396 | 21 | 21-refuter.md R1 Proof 1 | "The report's \"Doc text\" section ... no longer describes the tree." | BUILDER | no change to the builder's report |
| 397 | 21 | 21-refuter.md R1 Standards 1 | "the description frontmatter does not name the new refusal" | BUILDER | fixed at landing |
| 398 | 22 | 22-refuter.md R0 Spec 1 | "A plain `git diff` writes no content for a binary file ... The brief's own text says `git diff <base> <step>`" | BRIEF | brief 22.md:19 prescribes `git diff <the entry's base> <step>`; visible before build: yes, git writes no content for a binary file without `--binary`; ruling 2 of 22-round-1.md |
| 399 | 22 | 22-refuter.md R0 Spec 2 | "`git apply` is all-or-nothing ... This also comes from the brief's own wording" | BRIEF | brief 22.md:22 ("when the check fails, nothing is applied, and the brief lists the files the patch did not apply to"); visible: yes, `git apply` behaviour; ruling 2 |
| 400 | 22 | 22-refuter.md R0 Spec 3 | "The path runs destructive commands on names derived from the step id, not the recorded worktree and its branch." | BRIEF | brief items 1 and 5 name `<step>`, `<step>-land` and `<worktree_root>/<step>`, while this plan's own entry records `worktree: .agents/worktrees/2b-22`; visible: yes, the dispatch entry is on disk; rulings 1 and 2 |
| 401 | 22 | 22-refuter.md R0 Spec 4 | "Under those executors the dispatch entry, a resume point under ruling AA, is committed by nothing before the landing." | BRIEF | brief item 4 (22.md:31, 33) keeps the entry's commit at launch only, which exists under `agent`; visible: yes, plan-orchestration's `inline` and `academic-paper` bullets write no identity; ruling 3 |
| 402 | 22 | 22-refuter.md R0 Spec 5 | "a stop the orchestrator raises ... is a listed resume point that no text commits" | BUILDER | brief item 4 lists a stop among the resume points and asks every false sentence changed; ruling 4 |
| 403 | 22 | 22-refuter.md R0 Spec 6 | "Line 50 now accepts any uncommitted change on `plan.md` and the state file ... The two sentences contradict each other" | BRIEF | brief item 4 (22.md:31) says "The preflight accepts uncommitted ch[anges]"; visible: yes, spec line 49 leaves a user's change alone; ruling 5 |
| 404 | 22 | 22-refuter.md R0 Proof 1 | "The commands of the backed-out path were never run by the builder" | BUILDER | ruling 2 made the path a script with a test |
| 405 | 22 | 22-refuter.md R0 Proof 2 | "`utils/pin.test.sh` never exercises `~/.agents/skills` as a link to a folder of the list" | BUILDER | ruling 6 |
| 406 | 22 | 22-refuter.md R0 Standards 1 | "These describe what an earlier version did, which is history in a comment and a doc" | BUILDER | rule 10; ruling 7 |
| 407 | 22 | 22-refuter.md R0 Standards 2 | "Some new sentences run well past about 20 words" | BUILDER | prose standard E; ruling 8 |
| 408 | 22 | 22-refuter.md R0 Standards 3 | "a link to the pinned worktree root itself ... is not matched ... the brief says \"inside\", so this is minor" | BRIEF | brief item 3 says a link "inside the pinned worktree"; visible: unclear, an edge the reviewer found by probe; closed by ruling 6 ("with the worktree root counted") |
| 409 | 22 | 22-refuter.md R0 Standards 4 | "`git status --porcelain --untracked-files=all` quotes a path holding a space" | BRIEF | the command is brief item 5's; visible: yes, git quotes such paths without `-z` (rule 15); ruling 1 |
| 410 | 22 | 22-refuter.md R0 Behaviour 1 | "compare `$HOME/.agents/skills` with the list only as text ... pin mode deletes every link it has just made" | BUILDER | ruling 6 |
| 411 | 22 | 22-refuter.md R0 Behaviour 2 | "Check mode on the user's current install now fails ... The report's before and after ... does not" say so | BUILDER | ruling 11 |
| 412 | 22 | 22-refuter.md R0 Behaviour 3 | "`/spec` now commits a user's uncommitted edit on the ledger's `plan.md`" | BRIEF | same cause as #403; ruling 5; visible before build: yes, as for the finding it shares a cause with |
| 413 | 22 | 22-refuter.md R0 Behaviour 4 | "the work of a step that changed a binary file ... is lost once `/spec` deletes the branches" | BRIEF | same cause as #398 and #399; ruling 2; visible before build: yes, as for the finding it shares a cause with |
| 414 | 22 | 22-refuter.md R1 Spec 1 | "No ruling asks for this ... an unattended run blocks on a question that has no place in \"Stops\"" | BUILDER | sent as item 4 of 22-round-2.md; step 22 then not landed on its own (open item EE), its work carried by step 23 |
| 415 | 22 | 22-refuter.md R1 Spec 2 | "Ruling 2 asked for this sentence, so the ruling was wrong on this point." | BRIEF | round ruling 2 of 22-round-1.md said the builder takes the patch's copy of a binary file, which `--binary` writes as a delta or compressed literal; visible before the round: yes, git's binary patch format; sent as item 2 of 22-round-2.md |
| 416 | 22 | 22-refuter.md R1 Spec 3 | "\"stays on the ask list, so the user is asked\" ... So both ... delete a worktree and two branches without asking the user." | BRIEF | brief decision 4, ruling 1 and the round brief's "Not sent back" ("the user is asked when it runs") all assumed the ask list reaches commands inside a script; visible: yes, the ask list in settings.json matches the command the session runs; raised as open item BB, ruled (b) |
| 417 | 22 | 22-refuter.md R1 Spec 4 | "have no text for what `git apply --3way` prints or its exit status" | BUILDER | sent as item 1 of 22-round-2.md |
| 418 | 22 | 22-refuter.md R1 Spec 5 | "move the worktree removal from after the commit to Steps 11 ... No ruling asks for this." | BUILDER | step 23's `/land` removes after the landing commit (plan.md:43) |
| 419 | 22 | 22-refuter.md R1 Proof 1 | "`remove_worktree.sh` runs at line 212, and `without_entry` and the read-back check run after it" | BUILDER | sent as item 3 of 22-round-2.md |
| 420 | 22 | 22-refuter.md R1 Proof 2 | "no case has main delete (or rename) a file the patch changes" | BUILDER | sent as item 1 of 22-round-2.md |
| 421 | 22 | 22-refuter.md R1 Proof 3 | "build the back-out state by hand ... Ruling 2 says \"built as `land.sh` leaves a back-out\"" | BUILDER | the reviewer's own run on the real state passed; a proof gap |
| 422 | 22 | 22-refuter.md R1 Proof 4 | "judgment call 8 ... still says the `land` Stops row is \"a refusal after the landing's commit\"" | BUILDER | stale report text |
| 423 | 22 | 22-refuter.md R1 Standards 1 | "\"The commit comes before the build starts\" ... is false for the default executor" | BUILDER | ruling 3 limited the pre-build commit to `inline` and `academic-paper` |
| 424 | 22 | 22-refuter.md R1 Standards 2 | "line 116 says \"no path or branch is built from the step id\", and line 99 ... still builds both from it" | BUILDER | carried by step 23 |
| 425 | 22 | 22-refuter.md R1 Behaviour 1 | "The report's \"after\" for the back-out shows only a case where the apply succeeds." | BUILDER | same as #417 |
| 426 | 22 | 22-refuter.md R1 Behaviour 2 | "a refused removal leaves main with the cherry-pick staged and the booking uncommitted" | BUILDER | same as #418 |
| 427 | 22 | 22-refuter.md R1 Behaviour 3 | "The deletion of the worktree and branches runs with no prompt (Spec 3)." | BRIEF | same cause as #416; open item BB; visible before build: yes, as for the finding it shares a cause with |
| 428 | 23 | 23-refuter.md R0 Spec 1 | "Files that share a line-range split get no judgment, and three texts contradict each other on it." | BUILDER | brief item 3 removes the exemption for non-overlapping ranges; ruling 1 of 23-round-1.md |
| 429 | 23 | 23-refuter.md R0 Behaviour 1 | "A stopped worktree removal cannot be resumed from the ledger." | BRIEF | brief 23.md item 5 puts the removal after the landing commit that clears the entry and forbids names built from the step id, and gives the stop no record of the worktree; visible before build: yes, by walking the brief's order; ruling 2 |
| 430 | 23 | 23-refuter.md R1 Behaviour 1 | "A removal stopped after `git worktree remove` succeeded cannot be resumed as the texts are written." | BUILDER | steps 2 and 3 lack the "only when it exists" guard step 4 has; fixed at landing |
| 431 | 24 | 24-refuter.md R0 Standards 1 | "`README.md` lines 47 and 111 state the same fact ... The brief's item 1 dictated the second" | BRIEF | Closed: "fixed at landing, since the brief caused it"; visible before build: yes, README line 47 already stated the requirement |
| 432 | 25 | 25-refuter.md R0 Spec 1.1 (eighteen items, one finding) | "New items that do not read alone ... the report's judgment call 8 keeps them on purpose, which the brief does not allow" | BUILDER | brief What to build 3; ruling 1 of 25-round-1.md |
| 433 | 25 | 25-refuter.md R0 Proof 2.1 | "\"No rule was added, removed or changed in scope\" ... not reproduced" | BUILDER | ruling 12 |
| 434 | 25 | 25-refuter.md R0 Standards 3.1 | "Repeated construction ... The brief's What to build 3 and Decision 1 lead to this" | BRIEF | the split rule of What to build 3 and Decision 1 produces runs of items with the same opening; visible before build: unclear, it shows only once the splits are made; ruling 2 (with ruling A's nesting) |
| 435 | 25 | 25-refuter.md R0 Behaviour 4.1 | "plan-help:43-44: `- The next line is \`Ruled: ...\`.` lost its condition" | BUILDER | rule 17; ruling 3 |
| 436 | 25 | 25-refuter.md R0 Behaviour 4.2 | "spec:37-38 ... read alone sends every step through the back-out procedure" | BUILDER | ruling 4 |
| 437 | 25 | 25-refuter.md R0 Behaviour 4.3 | "spec:199-200 ... reads as a rule for every ruling, and \"it\" has no antecedent" | BUILDER | ruling 5 |
| 438 | 25 | 25-refuter.md R0 Behaviour 4.4 | "refute:51-52 ... lost \"Where a claim needs a second build\"" | BUILDER | ruling 6 |
| 439 | 25 | 25-refuter.md R0 Behaviour 4.5 | "land:116-117: `- The note says so.` states nothing on its own" | BUILDER | ruling 7 |
| 440 | 25 | 25-refuter.md R0 Behaviour 4.6 | "spec:70-71 ... has no predicate read alone" | BUILDER | ruling 8 |
| 441 | 25 | 25-refuter.md R0 Behaviour 4.7 | "land:70-72 ... lost the back-out condition; read alone they contradict Steps 10" | BUILDER | ruling 9 |
| 442 | 25 | 25-refuter.md R0 Behaviour 4.8 | "drops the condition \"a stop\"; the brief's Cases 4 prescribes this text" | BRIEF | brief Cases 4 prescribed the split text; visible: yes, the case's line read alone has no condition; ruling 10 corrected the case |
| 443 | 25 | 25-refuter.md R0 "Orchestrator's read of the diff" | "Items still holding two requirements that can each be broken while the other holds" | BUILDER | written by the orchestrator into the report, not by the reviewer; ruling 11 |
| 444 | 25 | 25-refuter.md R1 Standards 1 | "open \"For each kind\" three times in a row ... The builder left the lines as base text." | BUILDER | round ruling 2 covers every place in the ten files; fixed at landing |

Items in plan 2.B reports that are not counted as findings, because the reviewer reports no defect in them, confirms a closure, or only records what it did or did not check: 1-refuter.md R2 Behaviour 3 and 4 (the builder's stated changes checked; probe results that are correct); 1a-refuter.md R0 Spec 3, Proof, Standards 3, Behaviour 4 and 5 (the builder's notes judged sound), R1 Spec 2 (answers to the brief's three questions), Proof 2, Standards 4, Behaviour 3; 1c-refuter.md R0 Spec bullets judging the builder's additions "right" or "Inside the brief", Proof 5 ("This is not a defect") and 6, Standards 2 and 3, the last Behaviour bullet, R1 Spec, Proof and the second Standards bullet; 2-refuter.md R0 and R1 Behaviour ("none"); 3-refuter.md R0 Behaviour ("none"); 5-refuter.md R1 Spec ("None"); 6-refuter.md R0 Spec ("none"); 6a-refuter.md R0 Spec, R1 Spec and Behaviour ("None found"); 7-refuter.md the "Nothing else" line under R0 Standards, and R1's "Every other ruling is carried out", "No other proof finding", "Other standards checks came back clean" and Behaviour ("None"); 7a-refuter.md R1 Standards 3 ("Ruling 9 holds"), R2 Spec 2 (five changes judged needed), Proof 4, Standards 4 and "Checks the brief named, with no finding"; 7b-refuter.md R0 Spec ("None"), Proof 2 to 6 (judgment calls the reviewer judged sound, accepted as judged by ruling 8), Standards 5, Behaviour 4 to 7 (observations, no change), R1 Proof 2 and Behaviour 2 to 4, R2 Spec, Proof 4, Standards 3, Behaviour 1, 2 and 4; 7c-refuter.md R0 "Otherwise none" under Spec, Proof bullets 2 and 3, the "none for" Standards bullet and Behaviour's "Nothing else reads a zombie leader as alive", R1 "none further" under Standards and Behaviour; 8-refuter.md R0 Proof, R1 Spec and Proof ("none"); 9-refuter.md R1 Spec and Proof ("none"); 11-refuter.md R0 Spec 6 and 7, the first Proof bullet, Standards 6, Behaviour 2 to 6 (audit findings confirmed closed, a restatement of Spec 2 and 3, and one item "not raised as a finding"), R1 "Rulings ... closed" under Spec, Proof 2 ("not verifiable"), "The two long cells" (a feasibility note), R2 Spec 6; 12-refuter.md R0 Spec 5, 7, 9 and Proof 3 (Closed: "reported no defect"), Behaviour 2, R1 Behaviour ("none"); 13-refuter.md the R0 "Carriers" paragraph, Proof and Standards ("none"), R1 Spec 2 and 5 (rulings hold); 14-refuter.md the R0 "All six mark changes hold" paragraph and Proof, R1 Proof and Behaviour; 15-refuter.md R0 Proof and Behaviour, R1 Standards and Behaviour; 17-refuter.md R0 Spec, Proof and Standards; 17a-refuter.md R0 Proof and Standards, R1 Spec, Proof and Standards; 18-refuter.md R0 Proof, Standards and the "Checked and holding" paragraph, R1 Spec, Standards and Behaviour; 18a-refuter.md, all four headings ("None"; Closed: "No finding under any of the four headings"); 20-refuter.md R0 Proof, R1 Behaviour, and every heading of R2; 21-refuter.md R0 Standards 4 and Behaviour 3 (a change the report already states; Closed: no change), R1 "No other finding" lines and the Closures list, whose items point at the Spec, Proof and Behaviour findings counted above; 22-refuter.md R0 Proof 3 and Standards 5, R1 Closures 1 to 11 (each points at a Spec, Proof or Behaviour finding counted above); 23-refuter.md R0 Proof and Standards, R1 Spec, Proof and Standards; 24-refuter.md R0 Spec, Proof and Behaviour; 25-refuter.md R1 Spec, Proof and Behaviour. "Not checked" sections are not counted. In 12-, 13- and 14-refuter.md the orchestrator ruled on a "Not checked" gap (the `holds` rows the reviewer did not read); those gaps report no defect and are not counted. Step 22 has no review over its round 2: open item EE (plan.md:138) took its work into step 23 without landing it.
