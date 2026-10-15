Everything in the brief is done.

# Report of step 2, the known cases

## Open items of the state file

Verbatim from `.scratch/3-the-writing-base/orchestrator-state.md`, the section "Open items":

- none.

## The cases' first run, on the unchanged tree

Before any change: `git status --short` in the worktree printed nothing, and `git log --oneline | head -1` printed `f241b23 Prepare step 2 of plan 3, the known cases`. The case files do not exist: `ls -d /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases` printed `ls: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases: No such file or directory`, `ls .scratch/3-the-writing-base` printed `agents`, `orchestrator-state.md` and `plan.md`, and `git ls-files -co --exclude-standard | grep -c '^\.scratch/[^/]*/cases/\|^\.scratch/archive/[^/]*/cases/'` printed `0`.

- C1, the rule list. Read the prose standard whole (37 rules: 8 bullets in section 0, 3 paragraphs in A, 4 bullets in B, 3 paragraphs in C, 7 bullets in D, 8 bullets in E, 4 bullets in F) and ran `wc -l` on the three pages, which printed `75`, `220` and `77`, and `grep -c '^### '` on `rules.md` and `registers.md`, which printed `23` and `16`. The brief's counts hold. No `expected.md` exists, so no row can be checked yet. The brief's rules get no rule wrong.
- C2, the other registers. Read `registers.md` whole: four registers with four headings each, 16 in all. No draft exists to check. The brief's rules get no register wrong.
- C3, each passage against its rule. No passage exists. Read each rule's own words in the three pages to fix what a break and a clean passage of it must hold. The brief's item 3 matches those words, including the exceptions it names ("Hedge strength", "Alternatives", the code-fence rules, the three disciplines no draft is in).
- C4, the places. No `.tex` or `.docx` exists, so `grep -n -F` and `docx_paragraphs.py` have nothing to read. `docx_paragraphs.py`'s head comment was read: it prints text only, as the brief says.
- C5, the `\input` file. No `main.tex` exists, so `grep -n '\\input' <cases>/*/main.tex` has nothing to read.
- C6, the two forms. `textutil` is at `/usr/bin/textutil` (`which textutil` printed `/usr/bin/textutil`). No `draft.html` exists yet, so nothing to convert.
- C7, the discipline and the genre. No draft exists.
- C8, the clean text. No draft exists.
- C9, the skip. The loop of the unchanged command (its existence test replaced by `true`, since the paths do not exist) kept all eleven paths of item 4: `.scratch/3-the-writing-base/cases/engineering/main.tex`, `.scratch/archive/3-the-writing-base/cases/engineering/draft.docx`, `.scratch/my plan/cases/a b.tex`, `.scratch/3-the-writing-base/agents/reviews/cases/x.md`, `.scratch/archive/2-i-x/agents/reviews/2-run/.scratch/3-y/cases/z.md`, `.scratch/3-the-writing-base/agents/briefs/2-cases.md`, `skills/writing/cases/x.tex`, `docs/cases/x.md`, `cases/x.md`, `.scratch/3-the-writing-base/plan.md` and `README.md`. The loop with the four arms of item 4, run through `xargs -0 sh -c 'for f; do case "$f" in .scratch/archive/*/*/cases/*) ;; .scratch/archive/*/cases/*) continue ;; .scratch/*/*/cases/*) ;; .scratch/*/cases/*) continue ;; esac; printf "kept: %s\n" "$f"; done' sh`, printed eight kept paths: `.scratch/3-the-writing-base/agents/reviews/cases/x.md`, `.scratch/archive/2-i-x/agents/reviews/2-run/.scratch/3-y/cases/z.md`, `.scratch/3-the-writing-base/agents/briefs/2-cases.md`, `skills/writing/cases/x.tex`, `docs/cases/x.md`, `cases/x.md`, `.scratch/3-the-writing-base/plan.md` and `README.md`. That matches the "Kept" column of the table in item 4 (no, no, no, yes for the other eight). The unchanged command fails C9, as the step intends.
- C10, the check on the tree. The unchanged command, line 11 of `docs/dev/building.md` at HEAD, was run from the worktree root as `git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'` followed by `echo "exit $?"`. It printed `exit 0` and nothing before it. The case paths do not exist on the unchanged tree, so the loop part has nothing to run on them.
- C11, the sentence. Read the paragraph after the block in `docs/dev/building.md` as it stood: "The last command is the ASCII check over every tracked file and every untracked file git does not ignore that exists on disk, so a file deleted in a worktree and not yet staged is left out: it prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number, and exits 0 only when it prints nothing." It is true of the unchanged command and says nothing of a `cases/` folder, so it is made false by the changed command until it is rewritten.

Cases the brief's own rules get wrong: none. The first run found no case to hand back, and the work went on.

## DONE / NOT DONE

`<cases>` below is `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases`. Every command ran from the worktree root. No item is NOT DONE.

| Item | Status | Command and its output |
|---|---|---|
| 1. The four case drafts, each with `main.tex`, an `\input` file, `draft.html` and `draft.docx` | DONE | `ls <cases>/engineering <cases>/medicine <cases>/sciences <cases>/social` printed the files listed under "Files" below. `grep -n '\\input' <cases>/*/main.tex` printed the four lines quoted in C5 below. |
| 2. `expected.md` with one row per case and the two sentences word for word | DONE | `sed -n 3,4p <cases>/expected.md` printed the two sentences quoted below. The row counts are in the section "Rows of expected.md". |
| 3. What the cases hold | DONE | Checked by reading each draft whole against the three pages and by the runs of C4 to C8 below. |
| 4. The character-set command in `docs/dev/building.md` and `docs/dev/change-standard.md`, word for word, and the paragraph after the block | DONE | `diff <(sed -n 11p docs/dev/building.md) <(sed -n 75p docs/dev/change-standard.md)` printed nothing (Verify 2 below). The paragraph is quoted under "Every host- or user-visible change". |
| Verify 1, the changed command on the tree | DONE | See "Verify 1" below. |
| Verify 2, the two pages hold the same command | DONE | See "Verify 2" below. |
| Verify 3, the loop on the eleven paths and the case paths | DONE | See "Verify 3" below. |
| Verify 4, `docx_paragraphs.py` on each `.docx` | DONE | See "Verify 4" below, whole output. |
| Verify 5, the non-ASCII lines of each draft | DONE | See "Verify 5" below. |
| Verify 6, new sentences read against the standards | DONE | See "Verify 6" below. |

The second sentence pair, as `sed -n 3,4p <cases>/expected.md` printed it:

```
Every passage of a draft that a table does not list is expected to be reported under no rule.
The expected results are read against the reports of step 3 and are never changed after them.
```

C5, as `grep -n '\\input' <cases>/*/main.tex` printed it:

```
/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases/medicine/main.tex:57:\input{sections}
/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases/engineering/main.tex:43:\input{sections}
/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases/sciences/main.tex:59:\input{sections}
/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases/social/main.tex:53:\input{sections}
```

C6, the two forms. `textutil -convert docx draft.html -output draft.docx` was run from each draft's folder in `<cases>` and again in a second folder made with `mktemp -d` under `$TMPDIR` from a copy of each `draft.html`. `docx_paragraphs.py` was run on both `.docx` files of each draft and the two printed outputs were compared with `diff`. As printed:

```
engineering textutil exit 0
engineering second docx_paragraphs exit 0
engineering first docx_paragraphs exit 0
engineering diff exit 0
medicine textutil exit 0
medicine second docx_paragraphs exit 0
medicine first docx_paragraphs exit 0
medicine diff exit 0
sciences textutil exit 0
sciences second docx_paragraphs exit 0
sciences first docx_paragraphs exit 0
sciences diff exit 0
social textutil exit 0
social second docx_paragraphs exit 0
social first docx_paragraphs exit 0
social diff exit 0
```

The prose of each `.docx` equals the prose of its `.tex` form apart from the title, the headings, the keywords line and the tex-only cases. Checked with `sed 's/^[0-9]*: //' <paragraphs> | grep -v -F -f <(cat main.tex sections.tex | grep .)`, which printed only the title, the keywords line and the headings of each draft, and with `cat main.tex sections.tex | grep . | grep -v -F -f <(sed 's/^[0-9]*: //' <paragraphs>)`, which printed only the LaTeX commands of the preamble, `\input{sections}`, and for `engineering` the ten tex-only paragraphs and two `\subsection` headings.

`grep -c -i '<ul\|&nbsp;\|<table\|<li' <cases>/*/draft.html` printed `0` for each of the four files, and `unzip -p <cases>/<draft>/draft.docx word/document.xml | grep -c '<bullet>'` printed `0` for each (the bullet being U+2022).

## Verify 1, the changed character-set command

The command as written in `docs/dev/building.md` line 11, run from the worktree root through `sh` (`sed -n 11p docs/dev/building.md > $TMPDIR/cmd11.sh; sh $TMPDIR/cmd11.sh; echo "exit $?"`), printed nothing before the exit line:

```
exit 0
```

The same command over the files the step changes (the command of Verify 1 in the brief, over `docs/dev/building.md`, `docs/dev/change-standard.md` and `.scratch/3-the-writing-base/agents/reviews/2-report.md`) printed nothing before the exit line:

```
exit 0
```

## Verify 2, the two pages hold the same command

`diff <(sed -n 11p docs/dev/building.md) <(sed -n 75p docs/dev/change-standard.md); echo "diff exit $?"` printed:

```
diff exit 0
```

## Verify 3, the loop on the eleven paths and the case paths

The loop part of the changed command, `xargs -0 sh -c 'for f; do case "$f" in .scratch/archive/*/*/cases/*) ;; .scratch/archive/*/cases/*) continue ;; .scratch/*/*/cases/*) ;; .scratch/*/cases/*) continue ;; esac; printf "kept: %s\n" "$f"; done' sh`, on the eleven paths of item 4 followed by the sixteen paths `.scratch/3-the-writing-base/cases/<draft>/<file>` (draft in `engineering`, `medicine`, `sciences`, `social`; file in `main.tex`, `sections.tex`, `draft.html`, `draft.docx`) and `.scratch/3-the-writing-base/cases/expected.md`, printed:

```
kept: .scratch/3-the-writing-base/agents/reviews/cases/x.md
kept: .scratch/archive/2-i-x/agents/reviews/2-run/.scratch/3-y/cases/z.md
kept: .scratch/3-the-writing-base/agents/briefs/2-cases.md
kept: skills/writing/cases/x.tex
kept: docs/cases/x.md
kept: cases/x.md
kept: .scratch/3-the-writing-base/plan.md
kept: README.md
```

It printed the eight kept paths of the table of item 4 and none of the seventeen case paths.

## Verify 4, `docx_paragraphs.py` on each `.docx`, whole output

A character outside ASCII in a printed line is written by its name in angle brackets. Each run printed `exit 0`.

`python3 skills/writing/templates/docx_paragraphs.py <cases>/engineering/draft.docx; echo "exit $?"` printed:

```
1: A Fixed Worker Pool for Bounded Task Queues
2: We compare a fixed worker pool with a growing worker pool for bounded task queues in server software. On four hosts the fixed pool raised throughput by 24 percent and lowered the 99th percentile latency from 410 to 190 microseconds.
3: Keywords: task queues, worker pools, concurrent systems, software engineering
4: Introduction
5: A server that accepts more work than it can run loses requests or exhausts memory. A bounded task queue limits that risk, but its locking cost grows with the number of threads.
6: We compare a fixed worker pool with a growing worker pool on four hosts. Both pools serve the same bounded queue of 4096 slots under the same offered load.
7: Does a fixed pool lower the 99th percentile latency of a bounded queue? The latency study answers that question on every host with the same harness and the same load.
8: The throughput study measures completed tasks per second at an offered load of 500,000 tasks per second. The latency study measures the 99th percentile of the time from submission to completion.
9: The four hosts have 16, 24, 32 and 48 cores. Each host has two sockets and 256 GB of memory, and each runs Linux 6.5 on x86 processors.
10: The fixed pool raised throughput by 24 percent and lowered the 99th percentile latency from 410 to 190 microseconds. Both gains held on every host and in every run.
11: Lock-Based Queues
12: A lock-based queue guards its head and tail with one mutex, a lock that admits one thread at a time. Smith (2019) measured the cost of that mutex and found a 40 percent loss at 32 threads.
13: The correctness proof of this design is short, and Jones (2020) fitted it into two pages.
14: Contention grows with the thread count, and Lee (2021) reported a threefold slowdown from 8 to 64 threads.
15: Lock-Free Queues
16: A lock-free queue advances its head and tail with compare-and-swap (CAS), an atomic instruction that conditionally stores a value. Park (2018) measured the cost of CAS and found a 12 percent loss at 32 threads.
17: No thread waits for a lock in this design, and Kim (2020) showed that a stalled thread cannot block the others.
18: Memory reclamation is the main cost, since a removed node may still be read by another thread. Michael (2004) described a remedy that costs one extra memory write per access.
19: Implementation
20: The queue is a ring buffer with 4096 slots. Producers write at the tail index and workers read at the head index.
21: The fixed pool starts 64 worker threads at launch. The growing pool starts 8 threads and adds one thread whenever the queue holds more than 2048 tasks.
22: Each worker is pinned to one core within its NUMA node. The kernel scheduler never moves a pinned worker to another core.
23: A task is a function pointer with a 64-byte argument block. The argument block is copied into its slot when the task is submitted.
24: We chose a ring buffer because it needs no allocation after launch.
25: The scheduler bails out when the queue is full.
26: When it comes to growth, the growing pool stops at 256 threads.
27: The fixed pool never changes its thread count.
28: The benchmark runs on a modern server. A harness thread submits the tasks.
29: The scheduler hands each task to a worker, and it fails when the queue is full.
30: A worker returns its slot to the queue when the task ends.
31: The harness is written in C, and the third host was installed in 2021.
32: The harness submits tasks from eight producer threads that each run on a separate core.
33: Due to the fact that all workers share one queue, the head index is atomic.
34: In recent years, hosts have gained cores, so the pool sizes of this study start at 8 and 64 threads.
35: Inputs: queue depth and thread count.
36: Outputs: tasks per second and tail latency.
37: With this setup complete, the harness submits the first task.
38: The harness submits the first task after a warm-up.
39: The worker runs the task to completion.
40: Throughput Method
41: The throughput study tested whether a fixed pool completed more tasks per second than a growing pool.
42: We chose an offered load of 500,000 tasks per second because it saturated the growing pool on every host.
43: Each task spent 200 microseconds on the CPU. Producers submitted tasks at a constant rate.
44: Each run lasted 60 seconds after a 10-second warm-up. We repeated each run 30 times.
45: Producers ran on cores 0 to 7 of each host. The queue sat on core 8. The harness kept producers and workers on separate cores to avoid shared cache lines.
46: The harness covered only x86 hosts, so the results do not extend to other architectures.
47: All runs used GCC 13.2 at optimization level 2 on Linux 6.5, and the random seed was 42.
48: The queue was filled with 4096 tasks before each run.
49: The harness appeared to stop each run after 60 seconds.
50: The harness didn't retry a failed task.
51: The pool did not change size during a run.
52: Due to the fact that each host had two sockets, we pinned workers per socket.
53: Because the cache state differed between runs, we randomized the run order.
54: The harness stopped just after the last task finished.
55: The authors chose a warm-up of 10 seconds.
56: We implemented the producers in C.
57: The harness recorded two outputs: tasks per second and tail latency.
58: Each pool ran on the same hosts and the same queue.
59: The throughput results were obtained with these settings on all four hosts.
60: Throughput Results
61: The fixed pool completed 412,000 tasks per second and the growing pool completed 331,000. The difference is 24 percent of the growing pool's rate.
62: The growing pool created 248 threads during each run. Therefore, it spent 6 percent of each run creating them.
63: The gain ranged from 22 percent on the first host to 27 percent on the fourth host.
64: The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced.
65: Host one completed 380,000 tasks per second. Host two completed 405,000 tasks per second. Host three completed 421,000 tasks per second.
66: Host four completed 442,000 tasks per second. Their mean was 412,000 tasks per second.
67: The growing pool was idle for 38 percent of each run. The fixed pool was idle for 4 percent.
68: The fixed pool created 64 threads. Therefore, the growing pool created 248 threads.
69: The fixed pool used less memory than the growing pool. The harness sampled memory once per second.
70: The latency study applied the same two pools to the tail of the latency distribution.
71: Latency Method
72: The latency study tested whether the two pools differed in the tail of the latency distribution.
73: Each task recorded its submission time and its completion time.
74: We computed the 99th percentile over all tasks of a run.
75: We chose an offered load below saturation because latency grows without bound above it.
76: The latency study covered one queue size only, so the results do not extend to larger queues.
77: Latency Results
78: A statistical test compared the two latency distributions and gave p below 0.001.
79: The fixed pool lowered the 99th percentile latency from 410 to 190 microseconds.
80: The growing pool paid for thread creation inside the request path, which added to the tail.
81: Discussion
82: The results suggest that a fixed pool lowers tail latency by removing thread creation from the request path.
83: Hosts with more cores show larger gains, so core count raises the benefit of a fixed pool.
84: This section explains how the pool lowers the tail. A fixed pool keeps every worker pinned to a warm cache.
85: The growing pool creates threads inside the request path and queues tasks behind them.
86: This raises the tail. A fixed pool avoids both effects.
87: Thread creation raises the tail because each creation blocks the producer.
88: The cache is happy when a worker stays on one core.
89: Pinning keeps caches warm. A pinned worker never loses its cache to another core. In short, pinned workers keep their caches.
90: The growing pool creates threads on demand. Static in the fixed pool.
91: The fixed pool allocates all 64 threads at launch, which removes thread creation from the request path.
92: The queue provides bounded submission and is configurable.
93: The queue rejects a task when no slot is free.
94: Why does the queue reject tasks? A full ring buffer has no free slot.
95: Overflow tasks are rejected by the queue.
96: The pool is small, compact and light.
97: The pool has two parts, the queue and the workers.
98: The queue holds tasks. The buffer rejects a task when it is full. The channel feeds the workers.
99: The pool holds workers. The pool starts them at launch. The pool never adds another.
100: The log holds the run number, the host name, the pool type and the elapsed time.
101: The harness varies the thread count and the queue depth.
102: The fixed pool reduces contention---the main cost of the lock-based queue.
103: The growing pool creates threads -- up to 256 of them -- inside the request path.
104: The ring buffer is bounded - a full queue rejects new tasks.
105: The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match.
106: The growing pool pays for each new thread <en dash> a cost the fixed pool pays once.
107: The lock-free queue and the 64-thread pool share one design goal.
108: The lock-based queue serializes every producer at one mutex. A mutex is a turnstile and a ring buffer is an open door.
109: The ring buffer lets producers write at the tail without taking a lock.
110: Contention rises with the thread count, which is exactly when a fixed pool pays off.
111: Pinning removes the cache misses that follow a thread from core to core.
112: Contact us if further data would help.
113: The data come from 120 runs per pool.
114: The fixed pool is a simple change to the scheduler.
115: The growing pool is typically idle between bursts.
116: The fixed pool leverages every core of the host.
117: Each worker owns one core of the host.
118: The queue rejects a task with the status <left double quotation mark>full<right double quotation mark> when no slot is free.
119: The harness counts rejected tasks<horizontal ellipsis> and reports the total.
120: The log line reads "task rejected ... queue full" for each rejected task.
121: Submission order is producer -> queue.
122: Completion order is queue <rightwards arrow> worker.
123: A task passes from the queue to a worker.
124: The queue is bounded; the pool is fixed; the clock is monotonic. Producers never block; workers never spawn. The harness stops after 60 seconds; it then reports the counts. A full queue rejects a task; the producer retries later.
125: The cause is contention, not thread count. The limit applies to threads, not to tasks. The pool needs pinning, not a larger queue.
126: The harness records each task twice. It stamps the submission time on entry. It stamps the completion time on exit. The host also reports memory use once per second. The harness writes the report after the run. A summary file holds the totals.
127: A queue holds tasks until a worker is free. Servers use queues for that purpose.
128: We believe the fixed pool is the better design.
129: We chose to report the 99th percentile because it exposes queueing delay.
130: The fixed pool leads on ALL four hosts.
131: Conclusion
132: The study compared a fixed pool with a growing pool on four hosts.
133: The fixed pool raised throughput by 24 percent and lowered the 99th percentile latency to 190 microseconds.
exit 0
```

`python3 skills/writing/templates/docx_paragraphs.py <cases>/medicine/draft.docx; echo "exit $?"` printed:

```
1: Early Mobilization After Hip Fracture Surgery in Older Adults
2: We tested whether mobilization within 24 hours of hip fracture surgery reduces readmission in older adults. In a randomized trial of 480 patients, early mobilization reduced 30-day readmission from 25 percent to 15 percent. A cohort of 310 patients showed the same direction.
3: Keywords: hip fracture, early mobilization, readmission, geriatric medicine
4: Introduction
5: Older adults readmitted within 30 days of hip fracture surgery face a higher risk of death (Brown, 2018). Early mobilization may lower the risk of readmission, but only two small trials have tested it (Okoye, 2022).
6: We tested early mobilization in a randomized trial and in a cohort study at one hospital.
7: The trial asked whether mobilization within 24 hours of surgery reduces readmission within 30 days. The cohort study checked for the same association in routine care. Both studies enrolled patients aged 65 years or older.
8: Trial Methods
9: The trial tested whether mobilization within 24 hours of surgery reduced readmission within 30 days.
10: We randomized 480 patients aged 65 years or older to early or usual mobilization. Allocation was concealed in sealed envelopes.
11: The trial followed the Consolidated Standards of Reporting Trials (CONSORT) guideline.
12: The authors enrolled the patients on the surgical ward.
13: Patients were eligible if they could walk unaided before the fracture.
14: The trial recruited at a single hospital, so the results may not apply to other settings.
15: Early mobilization began within 24 hours of surgery. A physiotherapist helped each patient to stand. Patients then walked twice a day. Usual care began on the second day.
16: The primary outcome was readmission within 30 days. Secondary outcomes were length of stay and mortality at 90 days. Outcome assessors did not know the allocation.
17: Readmission was recorded from hospital records for 30 days after discharge.
18: Trial Results
19: Early mobilization reduced 30-day readmission from 25 percent to 15 percent. The relative risk (RR) was 0.60 (95% CI [0.41, 0.87], p = .004).
20: Each group held 240 patients. No patient was lost to follow-up.
21: Two patients had a heart attack within 30 days. Both were in the usual care group.
22: Mobilization began a median of 11 hours after surgery in the early group.
23: Length of stay did not differ between the groups, with a median of 7 days in each.
24: Mortality at 90 days was 6 percent after early mobilization and 8 percent after usual care. The RR was 0.75 (95% CI [0.39, 1.43]).
25: The cohort study examined whether this effect appeared in routine care.
26: Cohort Methods
27: The cohort study tested whether the same effect appeared outside a trial.
28: We reviewed the records of 310 consecutive patients aged 65 years or older. Mobilization time was taken from nursing notes.
29: Records were incomplete for 18 patients, so these patients were excluded.
30: The team ran into snags with the ethics forms.
31: The primary outcome matched the trial outcome.
32: We adjusted for age, sex, comorbidity score and type of surgery.
33: Cohort Results
34: Readmission occurred in 22 percent of the 140 patients mobilized early and in 31 percent of the 170 others.
35: After adjustment, the odds ratio for readmission was 0.68 (95% CI [0.47, 0.98]).
36: Three patients had a deep vein thrombosis within 30 days.
37: Discussion
38: The trial and the cohort point in the same direction, which suggests that early mobilization reduces readmission.
39: A relative risk of 0.60 corresponds to 10 fewer readmissions per 100 patients.
40: Both studies took place at one hospital, so the effect may differ elsewhere.
41: The cohort association may also reflect healthier patients, who could be mobilized earlier.
42: The trial is randomized; the cohort is observational. Agreement between the two designs strengthens the finding.
43: The effect appears in readmission, not in length of stay.
44: Hospitals can apply the result by scheduling physiotherapy on the day of surgery.
45: We recommend a multicentre trial.
46: Conclusion
47: Early mobilization within 24 hours reduces readmission after hip fracture surgery in older adults. Future trials should test it in several hospitals.
exit 0
```

`python3 skills/writing/templates/docx_paragraphs.py <cases>/sciences/draft.docx; echo "exit $?"` printed:

```
1: Hedgerow Width and Ground Beetle Diversity on Arable Farms
2: We tested whether wider hedgerows support more ground beetle species on arable farms. Across 24 plots on 12 farms, species richness rose by 3.1 species per additional metre of hedgerow width. A second survey found peak beetle activity in June.
3: Keywords: ground beetles, hedgerows, species richness, agroecology
4: Introduction
5: Hedgerows shelter ground beetles that eat crop pests and weed seeds (Lang, 2016). Farms in eastern England removed 22 percent of their hedgerows between 1990 and 2010 (Weber, 2015).
6: We tested whether wider hedgerows support more ground beetle species.
7: Species richness is the number of species in a plot. We expected richness to rise with hedgerow width. A second survey recorded when beetles were most active.
8: Richness Method
9: The richness survey tested whether wider hedgerows held more ground beetle species.
10: We sampled 24 plots on 12 farms in an agricultural landscape of 40 square kilometres. Plots lay along hedgerows 1 to 7 m wide.
11: Pitfall traps were placed 1 m apart along a 20 m transect.
12: Soil moisture was sampled 6 inches below the surface.
13: The researchers identified each beetle to species.
14: We emptied the traps every 7 days from April to September.
15: The survey covered one region, so the results may not apply to other climates.
16: Each trap held propylene glycol. The glycol killed the beetles quickly. It also preserved them for counting. Traps stayed open for 7 days.
17: Hedgerow width was measured at 5 points per plot. The mean of the 5 values was used.
18: Beetles were counted in the laboratory under a microscope.
19: Two observers counted each sample independently, and their counts agreed for 97 percent of samples.
20: Richness Results
21: Species richness rose by 3.1 species per additional metre of hedgerow width (95% CI [2.2, 4.0]). Mean richness was 12.3 species per plot (SD = 2.1).
22: Plots wider than 5 m held 16 species on average.
23: Three species occurred only in the widest hedgerows. None occurred in hedgerows narrower than 3 m.
24: Richness did not depend on farm size (r = 0.12, p = .58).
25: Wide hedgerows held 9 forest specialists and narrow hedgerows held 2.
26: The activity survey examined when beetles were most active.
27: Activity Method
28: The activity survey tested when ground beetles were most active.
29: We sampled beetles along hedgerows.
30: Species were identified from published keys.
31: The survey covered one season, so the pattern may differ in other years.
32: Activity Results
33: Beetle activity peaked in June, with 41 percent of all captures. Activity fell below 5 percent per month after August.
34: We were delighted to find a rare ground beetle in the third hedgerow.
35: Activity did not differ between hedgerows of different width (F = 0.8, p = .45).
36: Discussion
37: Wider hedgerows support more species, which suggests that width provides more habitat.
38: The survey covered one region and one season, so the effect may differ elsewhere.
39: Forest specialists need shade and leaf litter, which wide hedgerows provide (Lang, 2016).
40: The pattern matches earlier surveys in Denmark (Holm, 2012).
41: Older hedgerows are wider in this sample, so age may explain part of the gain.
42: Narrow hedgerows hold few species; wide hedgerows hold more. Farmers can plant wider strips at field edges.
43: The gain comes from width, not from hedgerow length.
44: We recommend that agri-environment schemes pay for hedgerows wider than 5 m.
45: Conclusion
46: Hedgerows wider than 5 m support more ground beetle species on arable farms. Future work should follow the same plots across several seasons.
exit 0
```

`python3 skills/writing/templates/docx_paragraphs.py <cases>/social/draft.docx; echo "exit $?"` printed:

```
1: Trust in Local Government After a Municipal Merger
2: We examined how residents' trust in local government changed after two municipalities merged. In interviews with 24 residents, trust fell where the merger moved services away. A survey of 412 residents showed lower trust among those who lost a local office.
3: Keywords: political trust, municipal merger, local government, sociology
4: Introduction
5: A municipal merger moves public services away from some residents. Residents who lose a local office may trust the new government less (Abara, 2017).
6: We studied residents of two towns that merged in 2019.
7: Merged municipalities now serve 18 percent of residents in the country (Statistics Office, 2022).
8: Political trust is the belief that a government acts in the interest of its citizens (Abara, 2017). The interviews explored how residents understood the merger. The survey measured trust and tested whether losing an office lowered it.
9: Interview Method
10: The interviews explored how residents understood the merger and its effect on trust.
11: We conducted semi-structured interviews with 24 residents (N = 24). Participants were recruited through the public library.
12: Residents were eligible if they had lived in either town since before the merger.
13: The interview guide asked about services and about contact with the council.
14: The researcher conducted the interviews in the participants' homes.
15: Each interview lasted 45 minutes. Interviews were recorded and transcribed.
16: We coded the transcripts for themes of distance and voice. Each transcript was coded twice.
17: Interview Results
18: Residents who lost a local office described a loss of voice. Fifteen of the 24 participants said the new council felt distant.
19: Nine participants described the merger as a gain in services.
20: Residents who lost an office described a trip of 20 to 40 minutes to the new town hall.
21: Participants who kept an office nearby described the merger in neutral terms.
22: One participant said that the council "stopped listening." Others described the same experience in other words.
23: The survey tested whether this pattern held in a larger sample.
24: Survey Method
25: The survey tested whether losing a local office lowered trust.
26: We operationalized trust as agreement with five statements on a 5-point scale.
27: Place attachment was measured in the survey.
28: We mailed the survey to 1,200 residents and 412 replied. The response rate was 34 percent.
29: Only residents with a registered address could be reached, so people who moved after the merger are missing.
30: Losing an office was coded from the residents' registered address. The questionnaire was tested on 20 residents before mailing.
31: The questionnaire had 18 items and took 10 minutes to complete.
32: Survey Results
33: Residents who lost a local office reported lower trust than the others (mean 2.9 against 3.6, p below .001). The difference was 0.7 points on the 5-point scale.
34: The respondents were a mixed bag.
35: Trust did not differ by age. It did differ by years of residence.
36: Trust was lowest among residents who lived more than 10 km from the new town hall (mean 2.6).
37: Response rates were similar in the two towns, at 33 and 35 percent.
38: Discussion
39: The interviews and the survey suggest that losing a local office lowers trust.
40: The survey reached registered residents only, so the estimate may miss recent movers.
41: The pattern may also reflect residents who already distrusted the merger.
42: The interviews explain the mechanism; the survey shows its size. Together they point to a loss of voice.
43: Local offices give residents a place to be heard (Abara, 2017).
44: A longer trip to the town hall may reduce contact with officials.
45: The loss concerns voice, not service quality.
46: We suggest that councils keep a local office open for two years after a merger.
47: Conclusion
48: Losing a local office lowers residents' trust in a merged municipality. Future studies should follow residents before and after a merger.
exit 0
```

## Verify 5, the non-ASCII lines of each draft

The lines below are the ASCII-rule breaks `expected.md` names: paragraphs 105 and 106 (the em dash and the en dash), 118 (curly quotes), 119 (the ellipsis character) and 122 (the arrow character) of `engineering`, which `expected.md` lists under "0. Hard rules / Em dash: zero", "B. Punctuation / ASCII throughout" and "0. Hard rules / Arrows". The other three drafts print nothing, and each `grep` exited 1.

`python3 skills/writing/templates/docx_paragraphs.py <cases>/engineering/draft.docx | LC_ALL=C grep -n '[^ -~]'` printed:

```
105:105: The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match.
106:106: The growing pool pays for each new thread <en dash> a cost the fixed pool pays once.
118:118: The queue rejects a task with the status <left double quotation mark>full<right double quotation mark> when no slot is free.
119:119: The harness counts rejected tasks<horizontal ellipsis> and reports the total.
122:122: Completion order is queue <rightwards arrow> worker.
```

`LC_ALL=C grep -n '[^ -~]' <cases>/engineering/*.tex` printed:

```
<cases>/engineering/sections.tex:173:The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match.
<cases>/engineering/sections.tex:175:The growing pool pays for each new thread <en dash> a cost the fixed pool pays once.
<cases>/engineering/sections.tex:199:The queue rejects a task with the status <left double quotation mark>full<right double quotation mark> when no slot is free.
<cases>/engineering/sections.tex:201:The harness counts rejected tasks<horizontal ellipsis> and reports the total.
<cases>/engineering/sections.tex:207:Completion order is queue <rightwards arrow> worker.
```

`python3 skills/writing/templates/docx_paragraphs.py <cases>/medicine/draft.docx | LC_ALL=C grep -n '[^ -~]'` printed:

```
```

`LC_ALL=C grep -n '[^ -~]' <cases>/medicine/*.tex` printed:

```
```

`python3 skills/writing/templates/docx_paragraphs.py <cases>/sciences/draft.docx | LC_ALL=C grep -n '[^ -~]'` printed:

```
```

`LC_ALL=C grep -n '[^ -~]' <cases>/sciences/*.tex` printed:

```
```

`python3 skills/writing/templates/docx_paragraphs.py <cases>/social/draft.docx | LC_ALL=C grep -n '[^ -~]'` printed:

```
```

`LC_ALL=C grep -n '[^ -~]' <cases>/social/*.tex` printed:

```
```

## Verify 6, new sentences read against the standards

The step adds or changes no list item and no `SKILL.md` text. The prose it changes outside the case files is the paragraph after the block in `docs/dev/building.md` (read against `skills/repo-setup/templates/docs/dev/prose-standard.md`, sections D, E and F, and against `docs/dev/skill-layout.md`, "Lists and tables"), and the two command lines (code, not prose).

- The new sentences of the paragraph are "A file deleted in a worktree and not yet staged is left out." (13 words), "So are the files under the `cases/` folder of a plan's folder or of an archived plan's folder." (19 words), "Those files hold the drafts the `/writing` gate runs on and their expected results." (14 words), "The drafts must hold the characters the prose standard bans." (10 words) and "It exits 0 only when it prints nothing." (8 words). Each is under about 20 words, carries one idea and is in the active voice.
- One sentence departs from the sentence-length rule: "The check prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number." is 31 words. Its words are the paragraph's old text, unchanged except that "it" became "The check" and "and exits 0 only when it prints nothing" became the sentence "It exits 0 only when it prints nothing."; the parenthesis lists the characters the check prints, which the sentence cannot do in fewer words without dropping the list.
- The paragraph has nine sentences and was three before the change. It holds one idea, what the last command checks and skips, in this order: what the command covers, what it skips, what it prints, how it exits, what a file that is not valid UTF-8 does, and where the checkmark is allowed. The three sentences that were there before (the first, the UTF-8 sentence and the checkmark sentence) keep their words, as the brief asks. The first, "The last command is the ASCII check over every tracked file and every untracked file git does not ignore that exists on disk.", is 23 words and is existing text. The paragraph is not split.
- The paragraph uses no bold, no list and no code fence. It names the folder `cases/` in code, and uses the word "drafts" and not the glossary term **case** for the files in it.

## The terms

No entry of `docs/glossary.md` is added or changed, so no "Stated in" needs a `grep -n` check. The diff uses three glossary terms in the paragraph after the block of `docs/dev/building.md`. Each was read against its entry (`grep -n '^- \*\*plan\*\*\|^- \*\*gate\*\*\|^- \*\*worktree\*\*\|^- \*\*ledger\*\*' docs/glossary.md`):

- **plan**, in "a plan's folder" and "an archived plan's folder": the entry says a plan is "the work of one roadmap entry, opened by `/plan` as a ledger folder". The folder of a plan is its ledger folder, and an archived plan's folder is the same folder moved under the archive root. The use matches.
- **gate**, in "the drafts the `/writing` gate runs on": the entry says a gate is "the check that proves a roadmap entry done, a command from the verification page, a test and what it asserts, or an observable result, which `/plan` copies into `plan.md`'s "## Gate"". The `/writing` runs on the case drafts are the Gate of roadmap entry 3, which step 3 of plan 3 runs (`grep -n 'The gate runs' .scratch/3-the-writing-base/plan.md` printed line 22). The use matches.
- **worktree**, in "a file deleted in a worktree": the words are the old text of the paragraph, unchanged, in the entry's sense (a step's git worktree).

The term **case** is not used for the drafts: the paragraph says "drafts", and `cases/` appears only as the folder's name in code.

## The files, with line counts

Files the step changes in the worktree:

```
      29 docs/dev/building.md
      87 docs/dev/change-standard.md
     116 total
```

Changed lines: `docs/dev/building.md` lines 11 and 25, `docs/dev/change-standard.md` line 75 (`git diff --stat` printed `2 files changed, 3 insertions(+), 3 deletions(-)`). The report is this file.

Case files in the scratch folder (`wc -l` from `<cases>`; the `.docx` sizes from `ls -l`, in bytes):

```
     240 expected.md
      45 engineering/main.tex
     254 engineering/sections.tex
     142 engineering/draft.html
      59 medicine/main.tex
      43 medicine/sections.tex
      56 medicine/draft.html
      61 sciences/main.tex
      39 sciences/sections.tex
      55 sciences/draft.html
      55 social/main.tex
      49 social/sections.tex
      57 social/draft.html
    1155 total
7872 bytes engineering/draft.docx
5313 bytes medicine/draft.docx
5159 bytes sciences/draft.docx
5241 bytes social/draft.docx
```

## Rows of expected.md per draft

Counted with an `awk` pass over the tables of each draft's section (column 2 of each row, `sort | uniq -c`):

| Draft | Break rows | Clean rows |
|---|---|---|
| `engineering/` | 70 | 55 |
| `medicine/` | 6 | 11 |
| `sciences/` | 4 | 12 |
| `social/` | 7 | 12 |

The tables hold 177 rows in all. Every other passage of a draft is expected to be reported under no rule, which is the first sentence of `expected.md`.

## Rules with no case, with the reason

Listed in `expected.md` under "Rules with no case" (lines 17 to 23):

- "Hedging / Hedge strength": it states the scale of hedging devices and asks nothing of a passage.
- "Flagged terms / Alternatives": its text says no finding is reported under it.
- "Flagged terms / Discipline exceptions", the exceptions "paradigm shift", "robust estimator" and "navigate": they name the philosophy of science, statistics and wayfinding research, and no draft is in those disciplines. The exception "landscape" has its clean case in `sciences/`.
- "F. Emphasis and formatting" code-fence rules (a language tag on a fence, one blank line around fences): neither a `.tex` nor a `.docx` draft holds a code fence. The other parts of those bullets have their cases.
- "D. Structure / Lists are introduced with a colon" (the colon part of the list bullet): a `.docx` draft made without a `<ul>` list holds no list. The part on three or more list-shaped items in paragraph form has its cases.

## Rules whose clean row stands in a short draft

Seven rules are judged on a whole draft, so their clean case is a whole short draft that holds none of the break: semicolons at most 2 per 1000 words, binary contrast at most twice per page, vary paragraph length, no mirror structure, no repeated construction, five or more consecutive sentences of the same length, and Limitations and alternative interpretations. `medicine/`, `sciences/` and `social/` each keep all seven and each has one row for each (lines 25 to 35 of `expected.md`). The break of each stands in `engineering/`.

## Judgment calls

- The whole-draft breaks in `engineering/` are placed in the paragraphs a report can name. Semicolons: five in one paragraph (paragraph 124, `sections.tex:211`), 2.59 per 1000 words of 1933, with one sentence of three clauses. Binary contrast: three "X, not Y" sentences in one paragraph (paragraph 125, `sections.tex:213`). Vary paragraph length: six consecutive two-sentence Introduction paragraphs of 32, 29, 30, 31, 28 and 29 words. Mirror structure: the sections "Lock-Based Queues" and "Lock-Free Queues", three paragraphs each with the same sentence order. Repeated construction: "We chose X because Y", which recurs in four sections. Five same-length sentences: five sentences of seven words across two adjacent paragraphs (three and two).
- Limitations in `engineering/` is a break because the draft states two limitations (`sections.tex:55` and `115`) and no sentence acknowledges an alternative interpretation of the results. It is placed at the heading "Discussion" (`sections.tex:125`, paragraph 81), following the brief's rule that a missing item is placed at the heading of its section.
- Four section-judged breaks in `engineering/` are placed at a section heading: the Conclusion is written in the past tense, Latency Results opens with a statistical test and not the result, Implementation has no sentence on why the reader is there, what to take away or what comes next, and Latency Method gives no host, software version, offered load, run length, repetition count or seed. The tense clean rows are Throughput Method, Throughput Results and Discussion.
- Formatting-only cases (the sentence-shaped subsection heading "The pool runs apart from the queue" with the clean heading "Pool Size", the bolded closing sentence, bold used for tone ("surprising") with the clean bold "Warning:" label, the path configs/pool.yaml outside code with the clean `\texttt{results/run.csv}`, and the source paragraph hard-wrapped over two lines with the clean one-line paragraph) are in the `.tex` only, as the brief says, each with the paragraph that holds it. Their `.docx` place in the table is "not in the `.docx`".
- The word counts in the tables are the counts of `docx_paragraphs.py` output with the paragraph numbers removed (`sed 's/^[0-9]*: //' | wc -w`): engineering 1933, medicine 655, sciences 577, social 624.
- A passage that breaks two rules has one row in the first group in the review prompt's order and names the other rule. The doubles are: the three dash cases (stand in "0. Hard rules / Em dash: zero", name B. Punctuation), the bolded closer (stands in 0, names F), `->` and the arrow character (stand in "0. Hard rules / Arrows", name B ASCII), "most specific term" and the `Terminology` register passage in `engineering/` and `medicine/`, the colloquial passage in the `Register` rows of `engineering/`, `medicine/` and `social/`, "We believe..." (stands in "Claims rest on evidence", names "Claim with evidence"), the `social/` Interview Method heading (stands in "Reader's path / So what per section", names "Social Sciences / What the reader looks for") and the `social/` "place attachment" passage (stands in "Term defined at first use", names the `social/` Terminology rule).
- The citations in the drafts (Smith 2019 and the like) are invented placeholders and are not references to real papers.
- The `.html` files declare `<meta charset="utf-8">` and write the dash, the curly quotes, the ellipsis and the arrow as numeric entities (`&#8212;`, `&#8211;`, `&#8220;`, `&#8221;`, `&#8230;`, `&#8594;`), so `textutil` produces real characters in the `.docx` while the `.html` stays ASCII. The `->` of the ASCII-rule break is written `-&gt;`.
- `building.md`'s paragraph is split into shorter sentences (see Verify 6), so it meets the prose standard's sentence length. Its wording otherwise follows the brief.

## Host-visible changes, before and after

- `docs/dev/building.md` line 11 and `docs/dev/change-standard.md` line 75, the character-set command. Before: `git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl ...` (the loop only tested that the file exists). After: the loop has a `case "$f" in .scratch/archive/*/*/cases/*) ;; .scratch/archive/*/cases/*) continue ;; .scratch/*/*/cases/*) ;; .scratch/*/cases/*) continue ;; esac;` clause before the `if`, so a file under `.scratch/<plan>/cases/` or `.scratch/archive/<plan>/cases/` is skipped, and a file in a `cases/` folder deeper in the plan (such as `.scratch/3-the-writing-base/agents/reviews/cases/x.md`) is kept. The perl program is unchanged. The two lines are equal (`diff` printed nothing, Verify 2).
- `docs/dev/building.md` line 25, the paragraph after the block. Before: "The last command is the ASCII check over every tracked file and every untracked file git does not ignore that exists on disk, so a file deleted in a worktree and not yet staged is left out: it prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number, and exits 0 only when it prints nothing." After: the text as the file reads now (lines 25 of `docs/dev/building.md`), which adds that the files under the `cases/` folder of a plan's folder or of an archived plan's folder are skipped, that they hold the drafts the `/writing` gate runs on and their expected results, and that the drafts must hold the characters the prose standard bans.
- No other file in the worktree changes besides this report (`git status --short`, run for Verify 6 below).

## Anything wrong or impossible in the brief

Nothing found. The brief's rules for the four-arm loop, the expected rows and the report shape could all be carried out as written, and no case in the first run was handled differently by the brief's rules than the brief said.
