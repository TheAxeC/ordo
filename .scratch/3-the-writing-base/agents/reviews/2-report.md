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
- C10, the check on the tree. The unchanged command, the sixth command of the block in the section "Building and checking Ordo" of `docs/dev/building.md` at HEAD, was run from the worktree root as `git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'` followed by `echo "exit $?"`. It printed `exit 0` and nothing before it. The loop part of the unchanged command, `xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "kept: %s\n" "$f"; fi; done' sh`, was run on the 17 path strings `.scratch/3-the-writing-base/cases/<draft>/<file>` (draft in `engineering`, `medicine`, `sciences`, `social`; file in `main.tex`, `sections.tex`, `draft.html`, `draft.docx`) and `.scratch/3-the-writing-base/cases/expected.md`. From the worktree root it printed nothing, because none of the 17 files exists in the worktree. In a folder made with `mktemp -d` that holds a copy of the case files at those 17 paths it printed 17 `kept:` lines, one for each of them. The whole unchanged command over that folder (`find .scratch -type f -print0` in place of `git ls-files`) printed five lines of `engineering/sections.tex` (lines 177, 179, 203, 205 and 211) and two lines of `engineering/draft.docx`, and exited 1 because perl stopped on the `.docx` with its `Malformed UTF-8 character (fatal)` error. The changed command over the same folder printed nothing and exited 0, and its loop printed none of the 17 paths.
- C11, the sentence. Read the paragraph after the block in `docs/dev/building.md` as it stood: "The last command is the ASCII check over every tracked file and every untracked file git does not ignore that exists on disk, so a file deleted in a worktree and not yet staged is left out: it prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number, and exits 0 only when it prints nothing." It is true of the unchanged command and says nothing of a `cases/` folder, so it is made false by the changed command until it is rewritten.

Cases the brief's own rules get wrong: none. The first run found no case to hand back, and the work went on.


## DONE / NOT DONE

`<cases>` below is `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases`. Every command ran from the worktree root. No item is NOT DONE.

| Item | Status | Command and its output |
|---|---|---|
| 1. The four case drafts, each with `main.tex`, an `\input` file, `draft.html` and `draft.docx` | DONE | `ls <cases>/engineering <cases>/medicine <cases>/sciences <cases>/social` printed the files listed under "The files, with line counts" below. `grep -n '\\input' <cases>/*/main.tex` printed the four lines quoted in C5 below. |
| 2. `expected.md` with one row per case and the two sentences word for word | DONE | `sed -n 3,4p <cases>/expected.md` printed the two sentences quoted below. The row counts are in the section "Rows of expected.md". |
| 3. What the cases hold | DONE | Checked by reading each draft whole against the three pages and by the runs of C4 to C8 below. |
| 4. The character-set command in `docs/dev/building.md` and `docs/dev/change-standard.md`, word for word, and the paragraph after the block | DONE | `diff <(sed -n 11p docs/dev/building.md) <(sed -n 75p docs/dev/change-standard.md)` printed nothing (Verify 2 below). The paragraph is quoted under "Host-visible changes, before and after". |
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
/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases/engineering/main.tex:43:\input{sections}
/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases/social/main.tex:49:\input{sections}
/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases/sciences/main.tex:57:\input{sections}
/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases/medicine/main.tex:51:\input{sections}
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

The prose of each `.docx` equals the prose of its `.tex` form apart from the title, the headings, the keywords line, the list items and the tex-only cases. Checked with `sed 's/^[0-9]*: //' <paragraphs> | grep -v -F -f <(cat main.tex sections.tex | grep .)`, which printed only the title, the keywords line and the headings of each draft and, for `engineering`, the eight list items (printed as a space, the number, a space and the text), and with `cat main.tex sections.tex | grep . | grep -v -F -f <(sed 's/^[0-9]*: //' <paragraphs>)`, which printed only the LaTeX commands of the preamble, `\input{sections}`, and for `engineering` the `\begin{enumerate}`, `\item` and `\end{enumerate}` lines of the two lists, the two `\subsection` headings and the eight tex-only paragraphs (the bold, path, code and hard-wrapped cases and the two closing paragraphs).

`grep -c -i '<ul\|&nbsp;\|<table' <cases>/*/draft.html` printed `0` for each of the four files. `grep -c '<ol' <cases>/engineering/draft.html` printed `2` and `grep -c '<li' <cases>/engineering/draft.html` printed `8`. `unzip -p <cases>/<draft>/draft.docx word/document.xml | LC_ALL=C grep -c $'\xe2\x80\xa2'` printed `0` for each of the four drafts (the pattern being the bullet U+2022).

## Verify 1, the changed character-set command

The command as written in the block of the section "Building and checking Ordo" in `docs/dev/building.md` (its sixth command), run from the worktree root through `sh` (`sed -n 11p docs/dev/building.md > $TMPDIR/cmd11.sh; sh $TMPDIR/cmd11.sh; echo "exit $?"`), printed nothing before the exit line:

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
7: A fixed pool may lower the 99th percentile latency of a bounded queue. The latency study checks that on every host with the same harness and the same load.
8: Throughput is the number of tasks completed per second at an offered load of 500,000 tasks per second. Latency is the 99th percentile of the time from submission to completion.
9: The four hosts have 96, 128, 160 and 192 cores, split over two sockets in each host. Each host runs Linux 6.5 on x86 processors with 512 GB of memory.
10: The fixed pool raised throughput by 24 percent and lowered the 99th percentile latency from 410 to 190 microseconds. Both gains held on every host and in every run.
11: Lock-Based Queues
12: A lock-based queue guards its head and tail with one mutex, a lock that admits one thread at a time. Smith (2019) measured the cost of that mutex and found a 40 percent loss at 32 threads. The loss suggests that the wait for the lock is the cost of this design.
13: The correctness proof of this design fits into two pages (Jones, 2020).
14: Contention grows with the thread count, as the threefold slowdown from 8 to 64 threads reported by Lee (2021) shows. Lee varied the thread count alone and left the effect of the pool policy unmeasured.
15: Lock-Free Queues
16: A lock-free queue advances its head and tail with compare-and-swap (CAS), an atomic instruction that conditionally stores a value. Park (2018) reported a 12 percent loss for CAS at 32 threads. The loss is below a third of the mutex loss, which suggests that CAS costs less than a lock at 32 threads.
17: A stalled thread cannot block the others in this design, since no thread waits for a lock (Kim, 2020).
18: Memory reclamation is the main cost of this design: another thread may still read a removed node. Michael (2004) described a remedy that costs one extra memory write per access, a cost that every worker pays. No measurement of a lock-free queue compares a fixed with a growing pool.
19: Implementation
20: The queue was a ring buffer with 4096 slots. Producers wrote at the tail index and workers read at the head index.
21: The fixed pool started 64 worker threads at launch. The growing pool started 8 threads and added one thread whenever the queue held more than 2048 tasks.
22: Each worker was pinned to one core within its NUMA node. The kernel scheduler never moved a pinned worker to another core.
23: A task was a function pointer with a 64-byte argument block that was copied into its slot on submission.
24: We chose a ring buffer because it needed no allocation after launch.
25: The scheduler bailed out when the queue was full.
26: When it came to growth, the growing pool stopped at 256 threads.
27: The fixed pool never changed its thread count. Its 64 workers stayed alive until the end of the run.
28: The benchmark ran on a modern server.
29: The scheduler passed the task to a worker when it was ready.
30: A worker returned its slot to the queue when the task ended. The slot was then free for the next producer write.
31: The harness was written in C, and the third host was installed in 2021.
32: The harness submitted tasks from eight producer threads that each ran on a separate core. The producers shared no state except the tail index.
33: Due to the fact that all workers shared one queue, the head index was atomic. The tail index was atomic for the same reason.
34: In recent years, hosts gained cores, so the pool sizes of this study started at 8 and 64 threads. Both starting sizes stayed below the core count of the smallest host.
35: Inputs: queue depth and thread count.
36: Outputs: tasks per second and tail latency.
37: With this setup complete, the harness submitted the first task.
38: The first task entered slot 0 of the ring buffer.
39: A worker ran each task to completion. Only then did it read the next slot.
40: Throughput Method
41: The throughput study tested whether a fixed pool completed more tasks per second than a growing pool.
42: We chose an offered load of 500,000 tasks per second because it saturated the growing pool on every host.
43: Each task spent 200 microseconds on the CPU. Producers submitted tasks at a constant rate.
44: Each run lasted 60 seconds after a 10-second warm-up. The run was repeated 30 times.
45: Producers ran on cores 0 to 7 of each host. The queue sat on core 8. The harness kept producers and workers on separate cores to avoid shared cache lines.
46: The harness covered only x86 hosts, so the results do not extend to other architectures. All four hosts used processors from one vendor.
47: All runs used GCC 13.2 at optimization level 2 on Linux 6.5. The same binary served both pools.
48: The queue was filled with 4096 tasks before each run.
49: The harness appeared to stop each run after 60 seconds. The log recorded the stop time of every run.
50: The harness didn't retry a failed task.
51: The growing pool did not remove a thread after a burst.
52: The queue was allocated in the memory of the first socket. Workers on the second socket accessed it remotely.
53: The run order was randomized because the cache state differed between runs.
54: The harness stopped just after the last task finished. It then wrote the summary of the run.
55: The authors chose 42 as the random seed.
56: We kept the producers identical for both pools.
57: The harness recorded two latency percentiles per run: the median and the 99th.
58: Each pool ran on the same hosts and the same queue.
59: The harness started all eight producers together. The queue filled within the first second. The workers then began to take tasks.
60: A timer started with the first task. The timer stopped after the 60th second.
61: Throughput was averaged over the repetitions of each host.
62: Throughput Results
63: The fixed pool completed 412,000 tasks per second and the growing pool completed 331,000. The difference was 24 percent of the growing pool's rate. Both pools served the same load on the same hosts, so the difference measured the effect of the pool policy.
64: The growing pool created 248 threads during each run. Creating them therefore took 6 percent of each run. Thread creation took time that the growing pool could not spend on tasks.
65: The gain ranged from 22 percent on the first host to 27 percent on the fourth host. It held on all four hosts.
66: The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced. That value set the upper end of the throughput range.
67: The fixed pool completed between 380,000 and 442,000 tasks per second on the four hosts, with a mean of 412,000. Even the lowest host exceeded the growing pool's mean of 331,000.
68: The growing pool was idle for 38 percent of each run. The fixed pool was idle for 4 percent.
69: The fixed pool created 64 threads. Consequently, the growing pool created 248 threads. The counts differed because only the growing pool changed its size.
70: The fixed pool used less memory than the growing pool. The harness sampled memory once per second.
71: The latency study applied the same two pools to the tail of the latency distribution.
72: Latency Method
73: Each pool was compared by the 99th percentile of its task latency.
74: Each task recorded its submission time and its completion time. Its latency was the difference between the two.
75: The percentile was computed over the pooled latencies of all runs of a pool.
76: The two pools were compared with a Mann-Whitney U test, a rank test for two independent samples. The test required no assumption about the shape of the latency distribution.
77: We chose an offered load below saturation because latency grows without bound above it.
78: Only one queue size was tested, which limited the latency result to that size.
79: Latency Results
80: A Mann-Whitney U test compared the two latency distributions and gave p below 0.001. The test rejected the hypothesis that both pools had the same latency distribution.
81: The fixed pool lowered the 99th percentile latency from 410 to 190 microseconds. The tail of the growing pool was more than twice as long.
82: The growing pool created threads inside the request path, which may have added to the tail.
83: Discussion
84: Why does a fixed pool lower the tail latency? The results suggest that a fixed pool lowers tail latency by removing thread creation from the request path.
85: Hosts with more cores show larger gains, so core count raises the benefit of a fixed pool.
86: This section explains how the fixed pool lowers the tail. A fixed pool keeps every worker pinned to a warm cache.
87: The growing pool creates threads inside the request path and queues tasks behind them.
88: This raises the tail. A fixed pool avoids both effects.
89: Thread creation may raise the tail because each creation blocks the producer.
90: The cache is happy when a worker stays on one core.
91: Pinning keeps caches warm. A pinned worker never loses its cache to another core. In short, pinned workers keep their caches.
92: The growing pool creates threads on demand. Static in the fixed pool.
93: The fixed pool allocates all 64 threads at launch, which removes thread creation from the request path. The growing pool allocates its threads one at a time.
94: The queue provides bounded submission and is configurable.
95: The queue rejects a task when no slot is free. The producer receives an error code and moves on to its next task.
96: What does the harness log? It logs one line per run.
97: The summary file is written by the harness.
98: The fixed pool is small, compact and light.
99: The harness uses two kinds of thread, the producers and the workers.
100: The queue holds tasks. The buffer orders them by arrival. The channel feeds the workers.
101: The fixed pool holds 64 workers. The fixed pool starts them at launch. The fixed pool never adds another.
102: The log holds the run number, the host name, the pool type and the elapsed time.
103: The harness varies the thread count and the queue depth. Every other setting stays fixed within a run.
104: The fixed pool reduces contention---the main cost of the lock-based queue.
105: The growing pool creates threads -- up to 256 of them -- inside the request path. The extra threads share the same queue.
106: The ring buffer is bounded - a full queue rejects new tasks.
107: The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match. The gain appears on every host.
108: The growing pool pays for each new thread <en dash> a cost the fixed pool pays once.
109: The lock-free queue and the fixed pool both keep waiting out of the request path.
110: The lock-based queue serializes every producer at one mutex. A mutex is a turnstile and a ring buffer is an open door.
111: A producer claims a slot with one atomic increment of the tail index. A worker frees the slot by advancing the head index.
112: Contention rises with the thread count, which is exactly when the fixed pool matters.
113: Pinning removes the cache misses that follow a thread from core to core. Each miss costs a read from main memory.
114: Contact us if further data would help.
115: The data come from 120 runs per pool. Each run lasts 70 seconds, including the warm-up.
116: The fixed pool is a simple change to the scheduler. It adds one counter and one loop.
117: The growing pool is typically idle between bursts.
118: The fixed pool leverages every core of the host.
119: Workers sleep while the queue is empty. They wake when a producer writes a task.
120: The report prints the status <left double quotation mark>complete<right double quotation mark> after each run.
121: The harness counts rejected tasks<horizontal ellipsis> and reports the total.
122: The log line reads "task rejected ... queue full" for each rejected task. The count of such lines equals the count of rejected tasks.
123: Submission order is producer -> queue.
124: Completion order is queue <rightwards arrow> worker.
125: Tasks leave the queue in the order in which they arrived. The order of arrival is the order of the tail index.
126: The queue is bounded; its ring buffer holds 4096 slots; each slot holds one task; no slot holds two; the free slots decide every write. A producer checks the free slots before it writes; a full queue rejects the write; the harness counts each rejection.
127: The fixed pool has a constant thread count, not a variable one. It pins each worker to a core, not to a socket. It places the queue on core 8, not on a worker core.
128: The harness records each task twice. It stamps the submission time on entry. It stamps the completion time on exit. The host also reports memory use once per second. The harness writes the report after the run. A summary file holds the totals.
129: A queue holds tasks until a worker is free. Servers use queues for that purpose.
130: We believe the fixed pool is the better design.
131: We chose to report the 99th percentile because it exposes queueing delay. The 99th percentile is the latency that 99 percent of the tasks stayed below.
132: The fixed pool leads on ALL four hosts.
133: The harness writes four result files.
134:  1 The raw latency samples of each run.
135:  2 A summary of the totals of each run.
136:  3 The memory samples taken once per second.
137:  4 A copy of the configuration file.
138: Each file carries the run number in its name, so a run can be traced to its files. The run number is the same in all four files.
139: The summary file holds four totals:
140:  1 The number of completed tasks.
141:  2 The number of rejected tasks.
142:  3 The mean latency.
143:  4 The 99th percentile latency.
144: The fixed pool is separate from the queue so that a stalled worker cannot block a producer. The queue sits on core 8 and the workers run on other cores.
145: The value of 64 was set below the 96 cores of the smallest host so that the producers and the queue keep cores of their own.
146: Conclusion
147: The study compared a fixed pool with a growing pool on four hosts.
148: The fixed pool raised throughput by 24 percent and lowered the 99th percentile latency to 190 microseconds.
exit 0
```

`python3 skills/writing/templates/docx_paragraphs.py <cases>/medicine/draft.docx; echo "exit $?"` printed:

```
1: Early Mobilization After Hip Fracture Surgery in Older Adults
2: We tested whether mobilization within 24 hours of hip fracture surgery reduces readmission in older adults. In a randomized trial of 480 patients, early mobilization reduced 30-day readmission from 25 percent to 15 percent. A cohort of 310 patients showed the same direction.
3: Keywords: hip fracture, early mobilization, readmission, geriatric medicine
4: Introduction
5: Older adults readmitted within 30 days of hip fracture surgery face a higher risk of death (Brown, 2018). Early mobilization may lower the risk of readmission, but only two small trials have tested it (Okoye, 2022).
6: A randomized trial and a cohort study of routine care address that gap.
7: Trial Methods
8: The trial compared early with usual mobilization in two parallel groups.
9: A total of 480 patients aged 65 years or older were randomized to early or usual mobilization. Allocation was concealed in sealed envelopes.
10: We defined early mobilization as standing with a physiotherapist within 24 hours of surgery. Patients then walked twice a day. Usual care began on the second day.
11: The trial followed the Consolidated Standards of Reporting Trials (CONSORT) guideline.
12: The authors enrolled the patients on the surgical ward.
13: Patients were eligible if they could walk unaided before the fracture.
14: The trial had one limitation: patients and physiotherapists could not be blinded to the allocation.
15: The primary outcome was readmission within 30 days. Secondary outcomes were length of stay and mortality at 90 days. Outcome assessors did not know the allocation.
16: Readmission was recorded from hospital records for 30 days after discharge.
17: Trial Results
18: Early mobilization reduced 30-day readmission from 25 percent to 15 percent. The relative risk (RR) was 0.60 (95% CI [0.41, 0.87], p = .004). One readmission was avoided for every ten patients mobilized early.
19: Each group held 240 patients. All 480 patients completed follow-up and entered the analysis.
20: By 30 days, a heart attack had occurred in two patients, both in the usual care group. The numbers were too small to compare the groups.
21: Mobilization began a median of 11 hours after surgery in the early group. The median lay inside the 24-hour target.
22: Length of stay did not differ between the groups, with a median of 7 days in each. Mortality at 90 days was 6 percent after early mobilization and 8 percent after usual care (RR 0.75, 95% CI [0.39, 1.43]). With an interval that included 1, the trial left the effect on mortality open.
23: Cohort Methods
24: The cohort drew on the records of 310 consecutive patients aged 65 years or older. Mobilization time was taken from nursing notes.
25: Records were incomplete for 18 patients, who were excluded.
26: Obtaining ethics approval was a hassle that lasted four months.
27: The primary outcome matched the trial outcome.
28: The analysis adjusted for age and comorbidity score.
29: Cohort Results
30: Readmission occurred in 22 percent of the 140 patients mobilized early and in 31 percent of the 170 others. After adjustment, the odds ratio for readmission was 0.68 (95% CI [0.47, 0.98]), against a crude odds ratio of 0.63. Age and comorbidity probably explained little of the association.
31: Three cases of deep vein thrombosis were recorded in the cohort, a rate of 1 percent. All three occurred in patients mobilized after the first day. Late mobilization may have added to the risk of thrombosis.
32: Discussion
33: The study adds randomized and observational evidence to the two small trials of early mobilization (Okoye, 2022).
34: The trial and the cohort agree in direction, which suggests that early mobilization reduces readmission.
35: Both studies took place at one hospital, so the effect may differ elsewhere.
36: Healthier patients, who could be mobilized earlier, may account for part of the cohort association.
37: The trial is randomized; the cohort is observational. Agreement between the two designs strengthens the finding.
38: The effect appears in readmission, not in length of stay.
39: Hospitals that wish to test the approach could schedule physiotherapy on the day of surgery.
40: Conclusion
41: Early mobilization within 24 hours may reduce readmission after hip fracture surgery in older adults. Future trials should test it in at least three hospitals.
exit 0
```

`python3 skills/writing/templates/docx_paragraphs.py <cases>/sciences/draft.docx; echo "exit $?"` printed:

```
1: Hedgerow Width and Ground Beetle Diversity on Arable Farms
2: We tested whether wider hedgerows hold more ground beetle species on arable farms. Across 24 plots on 12 farms, species richness rose by 3.1 species per additional metre of hedgerow width. A second survey found peak beetle activity in June.
3: Keywords: ground beetles, hedgerows, species richness, agroecology
4: Introduction
5: Hedgerows shelter ground beetles that eat crop pests and weed seeds (Lang, 2016). Farms in eastern England removed 22 percent of their hedgerows between 1990 and 2010 (Weber, 2015).
6: We surveyed ground beetles along hedgerows of different width.
7: Species richness is the number of species in a plot. We expected richness to rise with hedgerow width.
8: Richness Method
9: A total of 24 plots were sampled on 12 farms in an agricultural landscape of 40 square kilometres. Plots lay along hedgerows 1 to 7 m wide.
10: Pitfall traps were placed 1 m apart along a 20 m transect.
11: Soil moisture was sampled 6 inches below the surface.
12: The researchers identified each beetle to species.
13: We kept the plots at least 100 m apart so that the samples stayed independent.
14: The traps were emptied every 7 days from April to September.
15: A limitation of the richness survey was that all plots lay in one region.
16: Each trap held propylene glycol. The glycol killed the beetles within 1 hour. It also preserved them for counting.
17: Hedgerow width was measured at 5 points per plot. The mean of the 5 values was used.
18: Beetles were counted in the laboratory under a microscope.
19: Two observers counted each sample independently. Their counts agreed for 97 percent of samples, and the counts were used without correction.
20: Richness Results
21: Species richness rose by 3.1 species per additional metre of hedgerow width (95% CI [2.2, 4.0]). Mean richness was 12.3 species per plot (SD = 2.1). Because the interval excluded zero, width and richness were positively associated.
22: Plots wider than 5 m held 16 species on average. That mean exceeded the overall mean of 12.3 species by 3.7 species.
23: Three species occurred only in the widest hedgerows. None occurred in hedgerows narrower than 3 m. Width may have decided which species could persist.
24: Richness did not depend on farm size (r = 0.12, p = .58). Farm size was an unlikely source of the width effect.
25: Wide hedgerows held 9 forest specialists and narrow hedgerows held 2. The difference may reflect the shade that wide hedgerows offered these species.
26: Activity Method
27: A second survey recorded when ground beetles were most active.
28: Beetles were sampled along hedgerows.
29: Species were identified from published keys.
30: Only one season was sampled, and the pattern may differ in other years.
31: Activity Results
32: Beetle activity peaked in June, with 41 percent of all captures. Activity fell below 5 percent per month after August. Beetles were therefore most active in early summer.
33: We were delighted to find a rare ground beetle in the third hedgerow.
34: Activity did not differ between hedgerows of different width (F = 0.8, p = .45). Hedgerow width was unlikely to shift the timing of activity.
35: Discussion
36: Wider hedgerows hold more species, which suggests that width adds habitat. The result extends earlier work on hedgerows as shelter for beetles (Lang, 2016) to the width of the hedgerow.
37: The pattern matches earlier surveys in Denmark (Holm, 2012).
38: Older hedgerows are wider in this sample, so age may explain part of the gain. A survey of hedgerow age on the same plots would separate the two effects.
39: A 5 m strip removes land from the crop; the same strip holds 16 species on average. Farmers therefore weigh a loss of cropland against a gain in species.
40: The gain relates to width, not to hedgerow length, since every transect was 20 m long.
41: We suggest that agri-environment schemes consider payments for hedgerows wider than 5 m.
42: Conclusion
43: Hedgerows wider than 5 m may hold more ground beetle species on arable farms. Future work should follow the same plots across at least three seasons.
exit 0
```

`python3 skills/writing/templates/docx_paragraphs.py <cases>/social/draft.docx; echo "exit $?"` printed:

```
1: Trust in Local Government After a Municipal Merger
2: We examined how residents' trust in local government changed after two municipalities merged. In interviews with 24 residents, trust fell where the merger moved services away. A survey of 412 residents showed lower trust among those who lost a local office.
3: Keywords: political trust, municipal merger, local government, sociology
4: Introduction
5: A municipal merger moves public services away from some residents. Residents who lose a local office may feel less political trust, the belief that a government acts in the interest of its citizens (Abara, 2017).
6: We studied residents of two towns that merged in 2019.
7: Merged municipalities now serve 18 percent of residents in the country (Statistics Office, 2022).
8: Interviews explored how residents understood the merger, and a survey measured trust.
9: Interview Method
10: Semi-structured interviews were held with 24 residents (N = 24). Participants were recruited through the public library.
11: Residents were eligible if they had lived in either town since before the merger.
12: The interview guide asked about services and about contact with the council.
13: The researcher conducted the interviews in the participants' homes.
14: Each interview lasted 45 minutes. Interviews were recorded and transcribed.
15: Each transcript was coded twice for themes of distance and voice.
16: Interview Results
17: Fifteen of the 24 participants said that the new council felt distant. They described the loss as a loss of voice: the council no longer listened to them.
18: Nine participants described the merger as a gain in services. All nine lived within 5 km of the new town hall, which may explain their view.
19: Participants without a local office named a trip of 20 to 40 minutes to the new town hall as their main cost. Six of them said that the trip kept them from visiting at all.
20: Participants who kept an office nearby described the merger in neutral terms. Their answers named no change in their contact with the council.
21: One participant said that the council "stopped listening." The quotation illustrates the loss of voice that 15 participants described.
22: Survey Method
23: A mailed survey tested whether losing a local office lowered trust.
24: We operationalized trust as agreement with five statements on a 5-point scale.
25: Place attachment was measured in the survey.
26: The survey was mailed to 1,200 residents, and 412 replied. A response rate of 34 percent left room for non-response bias.
27: People who moved after the merger were missing from the sample, because only residents with a registered address could be reached.
28: Losing an office was coded from the residents' registered address.
29: The questionnaire had 18 items and took 10 minutes to complete. It was tested on 20 residents before mailing.
30: Survey Results
31: Respondents who had lost a local office reported lower trust than the others (mean 2.9 against 3.6, p below .001). The difference was 0.7 points on the 5-point scale. Losing an office was therefore associated with lower trust.
32: The respondents were a mixed bag in age and occupation.
33: Trust did not differ by age (r = .04, p = .41) but rose with years of residence (r = .18, p below .001). Years of residence may matter more to trust than age.
34: Trust was lowest among residents who lived more than 10 km from the new town hall (mean 2.6). Distance may help to explain the pattern that the interviews described.
35: Response rates were similar in the two towns, at 33 and 35 percent. Neither town dominated the sample.
36: Discussion
37: The interviews and the survey suggest that losing a local office lowers trust. The study adds evidence from two merged towns to the claim of Abara (2017).
38: Interviewees were recruited at the public library, so they may differ from residents who never visit it.
39: The pattern may also reflect residents who already distrusted the merger. A survey before the merger would separate the two explanations.
40: The interviews suggest a mechanism; the survey shows its size. Together they point to a loss of voice.
41: Local offices give residents a place to be heard (Abara, 2017).
42: A longer trip to the town hall may reduce contact with officials.
43: The loss appears to concern voice, not service quality, since nine participants described a gain in services.
44: We suggest that councils keep a local office open for two years after a merger.
45: Conclusion
46: Losing a local office may lower residents' trust in a merged municipality. Future studies should follow residents before and after a merger.
exit 0
```


## Verify 5, the non-ASCII lines of each draft

The lines below are the ASCII-rule breaks `expected.md` names: paragraphs 107 and 108 (the em dash and the en dash), 120 (curly quotes), 121 (the ellipsis character) and 124 (the arrow character) of `engineering`, which `expected.md` lists under "0. Hard rules / Em dash: zero", "B. Punctuation / ASCII throughout" and "0. Hard rules / Arrows". The other three drafts print nothing, and each `grep` exited 1. The list items of `engineering` (paragraphs 134 to 137 and 140 to 143) print ASCII digits and no other non-ASCII character.

`python3 skills/writing/templates/docx_paragraphs.py <cases>/engineering/draft.docx | LC_ALL=C grep -n '[^ -~]'` printed:

```
107:107: The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match. The gain appears on every host.
108:108: The growing pool pays for each new thread <en dash> a cost the fixed pool pays once.
120:120: The report prints the status <left double quotation mark>complete<right double quotation mark> after each run.
121:121: The harness counts rejected tasks<horizontal ellipsis> and reports the total.
124:124: Completion order is queue <rightwards arrow> worker.
```

`LC_ALL=C grep -n '[^ -~]' <cases>/engineering/*.tex` printed:

```
<cases>/engineering/sections.tex:177:The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match. The gain appears on every host.
<cases>/engineering/sections.tex:179:The growing pool pays for each new thread <en dash> a cost the fixed pool pays once.
<cases>/engineering/sections.tex:203:The report prints the status <left double quotation mark>complete<right double quotation mark> after each run.
<cases>/engineering/sections.tex:205:The harness counts rejected tasks<horizontal ellipsis> and reports the total.
<cases>/engineering/sections.tex:211:Completion order is queue <rightwards arrow> worker.
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

The step adds or changes no list item and no `SKILL.md` text. The prose it changes outside the case files is the paragraph after the block in the section "Building and checking Ordo" of `docs/dev/building.md` (now three paragraphs, read against `skills/repo-setup/templates/docs/dev/prose-standard.md`, sections D, E and F, and against `docs/dev/skill-layout.md`, "Lists and tables"), and the two command lines (code, not prose).

- The paragraphs have four, three and one sentences, each of one idea: what the command covers and skips, what it prints and how it exits, and where the checkmark is allowed. Their sentences have 23, 13, 18 and 25 words, then 31, 8 and 25 words, then 21 words (counted with an `awk` split on sentence ends over `sed -n 25,29p docs/dev/building.md`).
- One sentence departs from the sentence-length rule: "The check prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number." is 31 words. It is the paragraph's old text, with "it" replaced by "The check"; the parenthesis lists the characters the check prints, which the sentence cannot do in fewer words without dropping the list.
- The sentences that the step adds are "A file deleted in a worktree and not yet staged is left out." (13 words), "So are the files under the `cases/` folder of a plan's folder or of an archived plan's folder." (18 words), "Those files hold the drafts the `/writing` gate runs on and their expected results, and the drafts must hold the characters the prose standard bans." (25 words) and "It exits 0 only when it prints nothing." (8 words). Each carries one idea and is in the active voice, apart from the passive "A file ... is left out", which keeps the actor out because the file is the subject.
- The paragraphs use no bold, no list and no code fence. They name the folder `cases/` in code, and use the word "drafts" and not the glossary term **case** for the files in it.

## The terms

No entry of `docs/glossary.md` is added or changed, so no "Stated in" needs a `grep -n` check. The diff uses three glossary terms in the paragraphs after the block of `docs/dev/building.md`. Each was read against its entry (`grep -n '^- \*\*plan\*\*\|^- \*\*gate\*\*\|^- \*\*worktree\*\*\|^- \*\*ledger\*\*' docs/glossary.md`):

- **plan**, in "a plan's folder" and "an archived plan's folder": the entry says a plan is "the work of one roadmap entry, opened by `/plan` as a ledger folder". The folder of a plan is its ledger folder, and an archived plan's folder is the same folder moved under the archive root. The use matches.
- **gate**, in "the drafts the `/writing` gate runs on": the entry says a gate is "the check that proves a roadmap entry done, a command from the verification page, a test and what it asserts, or an observable result, which `/plan` copies into `plan.md`'s "## Gate"". The `/writing` runs on the case drafts are the Gate of roadmap entry 3, which step 3 of plan 3 runs (`grep -n 'The gate runs' .scratch/3-the-writing-base/plan.md` printed line 22). The use matches.
- **worktree**, in "a file deleted in a worktree": the words are the old text of the paragraph, unchanged, in the entry's sense (a step's git worktree).

The term **case** is not used for the drafts: the paragraphs say "drafts", and `cases/` appears only as the folder's name in code.

## The files, with line counts

Files the step changes in the worktree (`wc -l docs/dev/building.md docs/dev/change-standard.md`):

```
      33 docs/dev/building.md
      87 docs/dev/change-standard.md
     120 total
```

`git diff --stat` printed:

```
 docs/dev/building.md        | 8 ++++++--
 docs/dev/change-standard.md | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)
```

Changed places: the sixth command of the block and the paragraph after it in `docs/dev/building.md`, and the matching command in `docs/dev/change-standard.md`. The report is this file.

Case files in the scratch folder (`wc -l` from `<cases>`; the `.docx` sizes from `ls -l`, in bytes):

```
     242 expected.md
      45 engineering/main.tex
     278 engineering/sections.tex
     161 engineering/draft.html
      53 medicine/main.tex
      37 medicine/sections.tex
      50 medicine/draft.html
      59 sciences/main.tex
      35 sciences/sections.tex
      52 sciences/draft.html
      51 social/main.tex
      49 social/sections.tex
      55 social/draft.html
    1167 total
9199 bytes engineering/draft.docx
5420 bytes medicine/draft.docx
5419 bytes sciences/draft.docx
5553 bytes social/draft.docx
```

## Rows of expected.md per draft

Counted with an `awk` pass over the tables of each draft's section (column 2 of each row, counted per section):

| Draft | Break rows | Clean rows |
|---|---|---|
| `engineering/` | 70 | 56 |
| `medicine/` | 6 | 11 |
| `sciences/` | 4 | 12 |
| `social/` | 7 | 12 |

The tables hold 178 rows in all. Every other passage of a draft is expected to be reported under no rule, which is the first sentence of `expected.md`.

## Rules with no case, with the reason

Listed in `expected.md` under "Rules with no case":

- "Hedging / Hedge strength": it states the scale of hedging devices and asks nothing of a passage.
- "Flagged terms / Alternatives": its text says no finding is reported under it.
- "Flagged terms / Discipline exceptions", the exceptions "paradigm shift", "robust estimator" and "navigate": they name the philosophy of science, statistics and wayfinding research, and no draft is in those disciplines. The exception "landscape" has its clean case in `sciences/`.
- "F. Emphasis and formatting" code-fence rules (a language tag on a fence, one blank line around fences): neither a `.tex` nor a `.docx` draft holds a code fence. The other parts of those bullets have their cases.

"D. Structure / Lists are introduced with a colon" has its cases in `engineering/`: a break (a list introduced by a sentence that ends in a full stop) and a clean row (a list introduced with a colon), as `enumerate` lists in the `.tex` form and `<ol>` lists in the `.html` form.

## Rules whose clean row stands in a short draft

Seven rules are judged on a whole draft, so their clean case is a whole short draft that holds none of the break: semicolons at most 2 per 1000 words, binary contrast at most twice per page, vary paragraph length, no mirror structure, no repeated construction, five or more consecutive sentences of the same length, and Limitations and alternative interpretations. `medicine/`, `sciences/` and `social/` each keep all seven and each has one row for each (the section "Rules whose clean row stands in a short draft" of `expected.md` lists them). The break of each stands in `engineering/`.

## Judgment calls

- The whole-draft breaks in `engineering/` are placed in the paragraphs a report can name. Semicolons: six in one paragraph (paragraph 126, `sections.tex:215`), 2.38 per 1000 words of 2521, so above the limit of 5. Binary contrast: three "X, not Y" sentences in one paragraph (paragraph 127, `sections.tex:217`). Vary paragraph length: six consecutive two-sentence Introduction paragraphs of 32, 29, 29, 30, 30 and 29 words. Mirror structure: the sections "Lock-Based Queues" and "Lock-Free Queues", three paragraphs each in the same order. Repeated construction: "We chose X because Y", which recurs in four sections (`sections.tex:11`, `47`, `117` and `225`). Five same-length sentences: five sentences of seven words across two adjacent paragraphs (59 and 60, `sections.tex:81` and `83`).
- Limitations in `engineering/` is a break because the draft states two limitations (`sections.tex:55` and `119`) and no sentence acknowledges an alternative interpretation of the results. It is placed at the heading "Discussion" (`sections.tex:129`, paragraph 83), following the brief's rule that a missing item is placed at the heading of its section.
- Four section-judged breaks in `engineering/` are placed at a section heading: the Conclusion is written in the past tense, Latency Results opens with a statistical test and not the result, Implementation has no sentence on why the reader is there, what to take away or what comes next, and Latency Method gives no host, software version, offered load figure, run length, repetition count or seed. The tense clean rows are Throughput Method, Throughput Results and Discussion.
- Formatting-only cases (the sentence-shaped subsection heading "The fixed pool runs apart from the queue" with the clean heading "Pool Size", the bolded closing sentence, bold used for tone ("surprising") with the clean bold "Warning:" label, the path configs/pool.yaml outside code with the clean `\texttt{results/run.csv}`, and the source paragraph hard-wrapped over two lines with the clean one-line paragraph) are in the `.tex` only, as the brief says, each with the paragraph that holds it. Their `.docx` place in the table is "not in the `.docx`". The two paragraphs under the subsection headings are in both forms (paragraphs 144 and 145).
- The word counts in the tables are the counts of `docx_paragraphs.py` output with the paragraph numbers removed (`sed 's/^[0-9]*: //' | wc -w`): engineering 2521, medicine 677, sciences 665, social 733.
- A passage that breaks two rules has one row in the first group in the review prompt's order and names the other rule. The doubles are: the three dash cases (stand in "0. Hard rules / Em dash: zero", name B. Punctuation), the bolded closer (stands in 0, names F. Emphasis and formatting / Bold and Objectivity / Claims rest on evidence), `->` and the arrow character (stand in "0. Hard rules / Arrows", name B ASCII), "most specific term" and the `Terminology` register passage in `engineering/`, `medicine/` and `social/`, the colloquial passage in the `Register` rows of `engineering/`, `medicine/` and `social/`, "We believe..." (stands in "Claims rest on evidence", names "Claim with evidence"), the `social/` Interview Method heading (stands in "Reader's path / So what per section", names "Social Sciences / What the reader looks for") and the `social/` "place attachment" passage (stands in "Term defined at first use", names the `social/` Terminology rule).
- The citations in the drafts (Smith 2019 and the like) are invented placeholders and are not references to real papers.
- The `.html` files declare `<meta charset="utf-8">` and write the dash, the curly quotes, the ellipsis and the arrow as numeric entities (`&#8212;`, `&#8211;`, `&#8220;`, `&#8221;`, `&#8230;`, `&#8594;`), so `textutil` produces real characters in the `.docx` while the `.html` stays ASCII. The `->` of the ASCII-rule break is written `-&gt;`.
- A list in `engineering/` is an `enumerate` environment in the `.tex` form and an `<ol>` in the `.html` form. `docx_paragraphs.py` prints each item as a space, its number, a space and its text, so the list-item paragraphs hold only ASCII.
- The paragraphs after the block in `docs/dev/building.md` are split into shorter sentences and three paragraphs (see Verify 6), so they meet the prose standard's sentence length and paragraph length. Their wording otherwise follows the brief.

## Host-visible changes, before and after

- The character-set command, the sixth command of the block in the section "Building and checking Ordo" of `docs/dev/building.md` and the command in the section "Commands and their filters" of `docs/dev/change-standard.md`. Before: `git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl ...` (the loop only tested that the file exists). After: the loop has a `case "$f" in .scratch/archive/*/*/cases/*) ;; .scratch/archive/*/cases/*) continue ;; .scratch/*/*/cases/*) ;; .scratch/*/cases/*) continue ;; esac;` clause before the `if`, so a file under `.scratch/<plan>/cases/` or `.scratch/archive/<plan>/cases/` is skipped, and a file in a `cases/` folder deeper in the plan (such as `.scratch/3-the-writing-base/agents/reviews/cases/x.md`) is kept. The perl program is unchanged. The two commands are equal (`diff` printed nothing, Verify 2).
- The paragraph after the block in the section "Building and checking Ordo" of `docs/dev/building.md`. Before, one paragraph of three sentences:

```
The last command is the ASCII check over every tracked file and every untracked file git does not ignore that exists on disk, so a file deleted in a worktree and not yet staged is left out: it prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number, and exits 0 only when it prints nothing. A file that is not valid UTF-8 makes it exit non-zero: perl either stops with its `Malformed UTF-8 character (fatal)` error or prints the line. The green checkmark is allowed in Markdown files, where the plan ledgers use it as their status marker, and nowhere else.
```

After, three paragraphs as `sed -n 25,29p docs/dev/building.md` prints them:

```
The last command is the ASCII check over every tracked file and every untracked file git does not ignore that exists on disk. A file deleted in a worktree and not yet staged is left out. So are the files under the `cases/` folder of a plan's folder or of an archived plan's folder. Those files hold the drafts the `/writing` gate runs on and their expected results, and the drafts must hold the characters the prose standard bans.

The check prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number. It exits 0 only when it prints nothing. A file that is not valid UTF-8 makes it exit non-zero: perl either stops with its `Malformed UTF-8 character (fatal)` error or prints the line.

The green checkmark is allowed in Markdown files, where the plan ledgers use it as their status marker, and nowhere else.
```


- No other file in the worktree changes besides this report (`git status --short`, quoted under "Repair round 1", item 14).

## Anything wrong or impossible in the brief

Nothing found. The brief's rules for the four-arm loop, the expected rows and the report shape could all be carried out as written, and no case in the first run was handled differently by the brief's rules than the brief said.

## Repair round 1

All 17 rulings of `agents/briefs/2-round-1.md` are done in the case files in `<cases>`, in `docs/dev/building.md` and in this report. Every `draft.docx` was made again from its `draft.html` (`textutil -convert docx draft.html -output draft.docx` from each draft's folder, exit 0 for each), and the Verify, C3, C4 and C8 results in the sections above are the reruns over the whole of every draft. Places are `<draft>/<file>:<line>`; a "Before" place is the place in the case files before the round, an "After" place is the place now. Where a Before and an After sentence read the same, the sentence is unchanged and is the only sentence of its shape in its draft now. A passage that moved or was rewritten was read again against every rule; the rows of `expected.md` at the end of this section give the new places.

The counts after the round, from `python3 skills/writing/templates/docx_paragraphs.py <cases>/<draft>/draft.docx | sed 's/^[0-9]*: //' | wc -w` and `grep -o ';'`, are: engineering 148 paragraphs, 2521 words, 6 semicolons, 3 binary contrasts; medicine 41 paragraphs, 677 words, 1 semicolon, 1 binary contrast; sciences 43 paragraphs, 665 words, 1 semicolon, 1 binary contrast; social 46 paragraphs, 733 words, 1 semicolon, 1 binary contrast. The binary contrasts were found with `grep -n -o '[^.]*, not [^.]*\.'` over each paragraph listing, which printed the three sentences of paragraph 127 for `engineering` and one sentence each for the other three drafts.

### 1. Spec 1, repeated construction and restating paragraphs in the short drafts

`medicine/`, `sciences/` and `social/` were rewritten so that no sentence shape recurs across sections and no paragraph restates another. Each draft keeps its seven whole-draft rules in its whole text. The whole texts before and after are at the end of this item; the shapes the review names and the others a reread found, passage by passage:

Methods openers "The ... tested whether ...":

- Before, `medicine/main.tex:23`: The trial tested whether mobilization within 24 hours of surgery reduced readmission within 30 days.
  After, `medicine/main.tex:21`: The trial compared early with usual mobilization in two parallel groups.
- Before, `medicine/sections.tex:3`: The cohort study tested whether the same effect appeared outside a trial.
  After, `medicine/sections.tex:3`: The cohort drew on the records of 310 consecutive patients aged 65 years or older. Mobilization time was taken from nursing notes.
- Before, `sciences/main.tex:23`: The richness survey tested whether wider hedgerows held more ground beetle species.
  After: removed, no counterpart.
- Before, `sciences/main.tex:25`: We sampled 24 plots on 12 farms in an agricultural landscape of 40 square kilometres. Plots lay along hedgerows 1 to 7 m wide.
  After, `sciences/main.tex:23`: A total of 24 plots were sampled on 12 farms in an agricultural landscape of 40 square kilometres. Plots lay along hedgerows 1 to 7 m wide.
- Before, `sciences/sections.tex:3`: The activity survey tested when ground beetles were most active.
  After, `sciences/sections.tex:3`: A second survey recorded when ground beetles were most active.
- Before, `social/sections.tex:3`: The survey tested whether losing a local office lowered trust.
  After, `social/sections.tex:3`: A mailed survey tested whether losing a local office lowered trust.
- Before, `social/main.tex:25`: The interviews explored how residents understood the merger and its effect on trust.
  After: removed, no counterpart.
- Before, `social/main.tex:27`: We conducted semi-structured interviews with 24 residents (N = 24). Participants were recruited through the public library.
  After, `social/main.tex:25`: Semi-structured interviews were held with 24 residents (N = 24). Participants were recruited through the public library.

Introduction sentences that repeat the abstract or the methods:

- Before, `medicine/main.tex:17`: We tested early mobilization in a randomized trial and in a cohort study at one hospital.
  After, `medicine/main.tex:17`: A randomized trial and a cohort study of routine care address that gap.
- Before, `medicine/main.tex:19`: The trial asked whether mobilization within 24 hours of surgery reduces readmission within 30 days. The cohort study checked for the same association in routine care. Both studies enrolled patients aged 65 years or older.
  After: removed, no counterpart.
- Before, `sciences/main.tex:17`: We tested whether wider hedgerows support more ground beetle species.
  After, `sciences/main.tex:17`: We surveyed ground beetles along hedgerows of different width.
- Before, `sciences/main.tex:19`: Species richness is the number of species in a plot. We expected richness to rise with hedgerow width. A second survey recorded when beetles were most active.
  After, `sciences/main.tex:19`: Species richness is the number of species in a plot. We expected richness to rise with hedgerow width.
- Before, `social/main.tex:21`: Political trust is the belief that a government acts in the interest of its citizens (Abara, 2017). The interviews explored how residents understood the merger. The survey measured trust and tested whether losing an office lowered it.
  After, `social/main.tex:21`: Interviews explored how residents understood the merger, and a survey measured trust.

Section-end sentences that announce the next section:

- Before, `medicine/main.tex:55`: The cohort study examined whether this effect appeared in routine care.
  After: removed, no counterpart.
- Before, `sciences/main.tex:57`: The activity survey examined when beetles were most active.
  After: removed, no counterpart.
- Before, `social/main.tex:51`: The survey tested whether this pattern held in a larger sample.
  After: removed, no counterpart.

Limitation sentences "The survey covered ..., so ... may ...":

- Before, `medicine/main.tex:33`: The trial recruited at a single hospital, so the results may not apply to other settings.
  After, `medicine/main.tex:33`: The trial had one limitation: patients and physiotherapists could not be blinded to the allocation.
- Before, `medicine/sections.tex:29`: Both studies took place at one hospital, so the effect may differ elsewhere.
  After, `medicine/sections.tex:25`: Both studies took place at one hospital, so the effect may differ elsewhere.
- Before, `medicine/sections.tex:31`: The cohort association may also reflect healthier patients, who could be mobilized earlier.
  After, `medicine/sections.tex:27`: Healthier patients, who could be mobilized earlier, may account for part of the cohort association.
- Before, `sciences/main.tex:35`: The survey covered one region, so the results may not apply to other climates.
  After, `sciences/main.tex:35`: A limitation of the richness survey was that all plots lay in one region.
- Before, `sciences/sections.tex:9`: The survey covered one season, so the pattern may differ in other years.
  After, `sciences/sections.tex:9`: Only one season was sampled, and the pattern may differ in other years.
- Before, `sciences/sections.tex:23`: The survey covered one region and one season, so the effect may differ elsewhere.
  After: removed, no counterpart.
- Before, `sciences/sections.tex:29`: Older hedgerows are wider in this sample, so age may explain part of the gain.
  After, `sciences/sections.tex:25`: Older hedgerows are wider in this sample, so age may explain part of the gain. A survey of hedgerow age on the same plots would separate the two effects.
- Before, `social/sections.tex:11`: Only residents with a registered address could be reached, so people who moved after the merger are missing.
  After, `social/sections.tex:11`: People who moved after the merger were missing from the sample, because only residents with a registered address could be reached.
- Before, `social/sections.tex:33`: The survey reached registered residents only, so the estimate may miss recent movers.
  After, `social/sections.tex:33`: Interviewees were recruited at the public library, so they may differ from residents who never visit it.
- Before, `social/sections.tex:35`: The pattern may also reflect residents who already distrusted the merger.
  After, `social/sections.tex:35`: The pattern may also reflect residents who already distrusted the merger. A survey before the merger would separate the two explanations.

Results pairs "Two patients had ... within 30 days." and "Three patients had ... within 30 days.":

- Before, `medicine/main.tex:47`: Two patients had a heart attack within 30 days. Both were in the usual care group.
  After, `medicine/main.tex:45`: By 30 days, a heart attack had occurred in two patients, both in the usual care group. The numbers were too small to compare the groups.
- Before, `medicine/sections.tex:21`: Three patients had a deep vein thrombosis within 30 days.
  After, `medicine/sections.tex:17`: Three cases of deep vein thrombosis were recorded in the cohort, a rate of 1 percent. All three occurred in patients mobilized after the first day. Late mobilization may have added to the risk of thrombosis.

"Residents who lost ... office ..." openers:

- Before, `social/main.tex:41`: Residents who lost a local office described a loss of voice. Fifteen of the 24 participants said the new council felt distant.
  After, `social/main.tex:39`: Fifteen of the 24 participants said that the new council felt distant. They described the loss as a loss of voice: the council no longer listened to them.
- Before, `social/main.tex:45`: Residents who lost an office described a trip of 20 to 40 minutes to the new town hall.
  After, `social/main.tex:43`: Participants without a local office named a trip of 20 to 40 minutes to the new town hall as their main cost. Six of them said that the trip kept them from visiting at all.
- Before, `social/sections.tex:19`: Residents who lost a local office reported lower trust than the others (mean 2.9 against 3.6, p below .001). The difference was 0.7 points on the 5-point scale.
  After, `social/sections.tex:19`: Respondents who had lost a local office reported lower trust than the others (mean 2.9 against 3.6, p below .001). The difference was 0.7 points on the 5-point scale. Losing an office was therefore associated with lower trust.

Paragraphs that restate another:

- Before, `medicine/sections.tex:27`: A relative risk of 0.60 corresponds to 10 fewer readmissions per 100 patients.
  After: removed, no counterpart.
- Before, `sciences/sections.tex:25`: Forest specialists need shade and leaf litter, which wide hedgerows provide (Lang, 2016).
  After: removed, no counterpart.
- Before, `social/main.tex:49`: One participant said that the council "stopped listening." Others described the same experience in other words.
  After, `social/main.tex:47`: One participant said that the council "stopped listening." The quotation illustrates the loss of voice that 15 participants described.

The checks, as printed:

`grep -n -i 'tested whether' medicine/*.tex sciences/*.tex social/*.tex` (from `<cases>`) printed:

```
medicine/main.tex:8:We tested whether mobilization within 24 hours of hip fracture surgery reduces readmission in older adults. In a randomized trial of 480 patients, early mobilization reduced 30-day readmission from 25 percent to 15 percent. A cohort of 310 patients showed the same direction.
sciences/main.tex:8:We tested whether wider hedgerows hold more ground beetle species on arable farms. Across 24 plots on 12 farms, species richness rose by 3.1 species per additional metre of hedgerow width. A second survey found peak beetle activity in June.
social/sections.tex:3:A mailed survey tested whether losing a local office lowered trust.
```

`grep -n 'Two patients\|Three patients' medicine/*.tex` printed nothing and exited 1.

`grep -n 'Residents who' social/*.tex` printed:

```
social/main.tex:15:A municipal merger moves public services away from some residents. Residents who lose a local office may feel less political trust, the belief that a government acts in the interest of its citizens (Abara, 2017).
```

`grep -n -o '[^.]*, so [^.]*may[^.]*\.' medicine/*.tex sciences/*.tex social/*.tex` printed:

```
medicine/sections.tex:25:Both studies took place at one hospital, so the effect may differ elsewhere.
sciences/sections.tex:25:Older hedgerows are wider in this sample, so age may explain part of the gain.
social/sections.tex:33:Interviewees were recruited at the public library, so they may differ from residents who never visit it.
```

`grep -n 'covered' medicine/*.tex sciences/*.tex social/*.tex` printed nothing and exited 1.

The longest run of sentences of one length in each draft, counted by splitting each body paragraph of `docx_paragraphs.py` output at its sentence ends with `awk` and comparing neighbouring sentence lengths, printed:

```
engineering longest run of equal sentence lengths: 5
medicine longest run of equal sentence lengths: 2
sciences longest run of equal sentence lengths: 3
social longest run of equal sentence lengths: 2
```

The three `tested whether` lines are one in each draft (the abstract of `medicine/` and of `sciences/`, the Survey Method of `social/`), the three `, so ... may` lines are one in each draft.

The whole text of each short draft, as `docx_paragraphs.py` printed it before the round (from the `.docx` of that time) and now:

Before, `medicine`:

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
```

After, `medicine`:

```
1: Early Mobilization After Hip Fracture Surgery in Older Adults
2: We tested whether mobilization within 24 hours of hip fracture surgery reduces readmission in older adults. In a randomized trial of 480 patients, early mobilization reduced 30-day readmission from 25 percent to 15 percent. A cohort of 310 patients showed the same direction.
3: Keywords: hip fracture, early mobilization, readmission, geriatric medicine
4: Introduction
5: Older adults readmitted within 30 days of hip fracture surgery face a higher risk of death (Brown, 2018). Early mobilization may lower the risk of readmission, but only two small trials have tested it (Okoye, 2022).
6: A randomized trial and a cohort study of routine care address that gap.
7: Trial Methods
8: The trial compared early with usual mobilization in two parallel groups.
9: A total of 480 patients aged 65 years or older were randomized to early or usual mobilization. Allocation was concealed in sealed envelopes.
10: We defined early mobilization as standing with a physiotherapist within 24 hours of surgery. Patients then walked twice a day. Usual care began on the second day.
11: The trial followed the Consolidated Standards of Reporting Trials (CONSORT) guideline.
12: The authors enrolled the patients on the surgical ward.
13: Patients were eligible if they could walk unaided before the fracture.
14: The trial had one limitation: patients and physiotherapists could not be blinded to the allocation.
15: The primary outcome was readmission within 30 days. Secondary outcomes were length of stay and mortality at 90 days. Outcome assessors did not know the allocation.
16: Readmission was recorded from hospital records for 30 days after discharge.
17: Trial Results
18: Early mobilization reduced 30-day readmission from 25 percent to 15 percent. The relative risk (RR) was 0.60 (95% CI [0.41, 0.87], p = .004). One readmission was avoided for every ten patients mobilized early.
19: Each group held 240 patients. All 480 patients completed follow-up and entered the analysis.
20: By 30 days, a heart attack had occurred in two patients, both in the usual care group. The numbers were too small to compare the groups.
21: Mobilization began a median of 11 hours after surgery in the early group. The median lay inside the 24-hour target.
22: Length of stay did not differ between the groups, with a median of 7 days in each. Mortality at 90 days was 6 percent after early mobilization and 8 percent after usual care (RR 0.75, 95% CI [0.39, 1.43]). With an interval that included 1, the trial left the effect on mortality open.
23: Cohort Methods
24: The cohort drew on the records of 310 consecutive patients aged 65 years or older. Mobilization time was taken from nursing notes.
25: Records were incomplete for 18 patients, who were excluded.
26: Obtaining ethics approval was a hassle that lasted four months.
27: The primary outcome matched the trial outcome.
28: The analysis adjusted for age and comorbidity score.
29: Cohort Results
30: Readmission occurred in 22 percent of the 140 patients mobilized early and in 31 percent of the 170 others. After adjustment, the odds ratio for readmission was 0.68 (95% CI [0.47, 0.98]), against a crude odds ratio of 0.63. Age and comorbidity probably explained little of the association.
31: Three cases of deep vein thrombosis were recorded in the cohort, a rate of 1 percent. All three occurred in patients mobilized after the first day. Late mobilization may have added to the risk of thrombosis.
32: Discussion
33: The study adds randomized and observational evidence to the two small trials of early mobilization (Okoye, 2022).
34: The trial and the cohort agree in direction, which suggests that early mobilization reduces readmission.
35: Both studies took place at one hospital, so the effect may differ elsewhere.
36: Healthier patients, who could be mobilized earlier, may account for part of the cohort association.
37: The trial is randomized; the cohort is observational. Agreement between the two designs strengthens the finding.
38: The effect appears in readmission, not in length of stay.
39: Hospitals that wish to test the approach could schedule physiotherapy on the day of surgery.
40: Conclusion
41: Early mobilization within 24 hours may reduce readmission after hip fracture surgery in older adults. Future trials should test it in at least three hospitals.
```

Before, `sciences`:

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
```

After, `sciences`:

```
1: Hedgerow Width and Ground Beetle Diversity on Arable Farms
2: We tested whether wider hedgerows hold more ground beetle species on arable farms. Across 24 plots on 12 farms, species richness rose by 3.1 species per additional metre of hedgerow width. A second survey found peak beetle activity in June.
3: Keywords: ground beetles, hedgerows, species richness, agroecology
4: Introduction
5: Hedgerows shelter ground beetles that eat crop pests and weed seeds (Lang, 2016). Farms in eastern England removed 22 percent of their hedgerows between 1990 and 2010 (Weber, 2015).
6: We surveyed ground beetles along hedgerows of different width.
7: Species richness is the number of species in a plot. We expected richness to rise with hedgerow width.
8: Richness Method
9: A total of 24 plots were sampled on 12 farms in an agricultural landscape of 40 square kilometres. Plots lay along hedgerows 1 to 7 m wide.
10: Pitfall traps were placed 1 m apart along a 20 m transect.
11: Soil moisture was sampled 6 inches below the surface.
12: The researchers identified each beetle to species.
13: We kept the plots at least 100 m apart so that the samples stayed independent.
14: The traps were emptied every 7 days from April to September.
15: A limitation of the richness survey was that all plots lay in one region.
16: Each trap held propylene glycol. The glycol killed the beetles within 1 hour. It also preserved them for counting.
17: Hedgerow width was measured at 5 points per plot. The mean of the 5 values was used.
18: Beetles were counted in the laboratory under a microscope.
19: Two observers counted each sample independently. Their counts agreed for 97 percent of samples, and the counts were used without correction.
20: Richness Results
21: Species richness rose by 3.1 species per additional metre of hedgerow width (95% CI [2.2, 4.0]). Mean richness was 12.3 species per plot (SD = 2.1). Because the interval excluded zero, width and richness were positively associated.
22: Plots wider than 5 m held 16 species on average. That mean exceeded the overall mean of 12.3 species by 3.7 species.
23: Three species occurred only in the widest hedgerows. None occurred in hedgerows narrower than 3 m. Width may have decided which species could persist.
24: Richness did not depend on farm size (r = 0.12, p = .58). Farm size was an unlikely source of the width effect.
25: Wide hedgerows held 9 forest specialists and narrow hedgerows held 2. The difference may reflect the shade that wide hedgerows offered these species.
26: Activity Method
27: A second survey recorded when ground beetles were most active.
28: Beetles were sampled along hedgerows.
29: Species were identified from published keys.
30: Only one season was sampled, and the pattern may differ in other years.
31: Activity Results
32: Beetle activity peaked in June, with 41 percent of all captures. Activity fell below 5 percent per month after August. Beetles were therefore most active in early summer.
33: We were delighted to find a rare ground beetle in the third hedgerow.
34: Activity did not differ between hedgerows of different width (F = 0.8, p = .45). Hedgerow width was unlikely to shift the timing of activity.
35: Discussion
36: Wider hedgerows hold more species, which suggests that width adds habitat. The result extends earlier work on hedgerows as shelter for beetles (Lang, 2016) to the width of the hedgerow.
37: The pattern matches earlier surveys in Denmark (Holm, 2012).
38: Older hedgerows are wider in this sample, so age may explain part of the gain. A survey of hedgerow age on the same plots would separate the two effects.
39: A 5 m strip removes land from the crop; the same strip holds 16 species on average. Farmers therefore weigh a loss of cropland against a gain in species.
40: The gain relates to width, not to hedgerow length, since every transect was 20 m long.
41: We suggest that agri-environment schemes consider payments for hedgerows wider than 5 m.
42: Conclusion
43: Hedgerows wider than 5 m may hold more ground beetle species on arable farms. Future work should follow the same plots across at least three seasons.
```

Before, `social`:

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
```

After, `social`:

```
1: Trust in Local Government After a Municipal Merger
2: We examined how residents' trust in local government changed after two municipalities merged. In interviews with 24 residents, trust fell where the merger moved services away. A survey of 412 residents showed lower trust among those who lost a local office.
3: Keywords: political trust, municipal merger, local government, sociology
4: Introduction
5: A municipal merger moves public services away from some residents. Residents who lose a local office may feel less political trust, the belief that a government acts in the interest of its citizens (Abara, 2017).
6: We studied residents of two towns that merged in 2019.
7: Merged municipalities now serve 18 percent of residents in the country (Statistics Office, 2022).
8: Interviews explored how residents understood the merger, and a survey measured trust.
9: Interview Method
10: Semi-structured interviews were held with 24 residents (N = 24). Participants were recruited through the public library.
11: Residents were eligible if they had lived in either town since before the merger.
12: The interview guide asked about services and about contact with the council.
13: The researcher conducted the interviews in the participants' homes.
14: Each interview lasted 45 minutes. Interviews were recorded and transcribed.
15: Each transcript was coded twice for themes of distance and voice.
16: Interview Results
17: Fifteen of the 24 participants said that the new council felt distant. They described the loss as a loss of voice: the council no longer listened to them.
18: Nine participants described the merger as a gain in services. All nine lived within 5 km of the new town hall, which may explain their view.
19: Participants without a local office named a trip of 20 to 40 minutes to the new town hall as their main cost. Six of them said that the trip kept them from visiting at all.
20: Participants who kept an office nearby described the merger in neutral terms. Their answers named no change in their contact with the council.
21: One participant said that the council "stopped listening." The quotation illustrates the loss of voice that 15 participants described.
22: Survey Method
23: A mailed survey tested whether losing a local office lowered trust.
24: We operationalized trust as agreement with five statements on a 5-point scale.
25: Place attachment was measured in the survey.
26: The survey was mailed to 1,200 residents, and 412 replied. A response rate of 34 percent left room for non-response bias.
27: People who moved after the merger were missing from the sample, because only residents with a registered address could be reached.
28: Losing an office was coded from the residents' registered address.
29: The questionnaire had 18 items and took 10 minutes to complete. It was tested on 20 residents before mailing.
30: Survey Results
31: Respondents who had lost a local office reported lower trust than the others (mean 2.9 against 3.6, p below .001). The difference was 0.7 points on the 5-point scale. Losing an office was therefore associated with lower trust.
32: The respondents were a mixed bag in age and occupation.
33: Trust did not differ by age (r = .04, p = .41) but rose with years of residence (r = .18, p below .001). Years of residence may matter more to trust than age.
34: Trust was lowest among residents who lived more than 10 km from the new town hall (mean 2.6). Distance may help to explain the pattern that the interviews described.
35: Response rates were similar in the two towns, at 33 and 35 percent. Neither town dominated the sample.
36: Discussion
37: The interviews and the survey suggest that losing a local office lowers trust. The study adds evidence from two merged towns to the claim of Abara (2017).
38: Interviewees were recruited at the public library, so they may differ from residents who never visit it.
39: The pattern may also reflect residents who already distrusted the merger. A survey before the merger would separate the two explanations.
40: The interviews suggest a mechanism; the survey shows its size. Together they point to a loss of voice.
41: Local offices give residents a place to be heard (Abara, 2017).
42: A longer trip to the town hall may reduce contact with officials.
43: The loss appears to concern voice, not service quality, since nine participants described a gain in services.
44: We suggest that councils keep a local office open for two years after a merger.
45: Conclusion
46: Losing a local office may lower residents' trust in a merged municipality. Future studies should follow residents before and after a merger.
```

### 2. Spec 4, hedged claims in the Conclusions and Discussions

Each causal claim from correlational data and each generalization from a limited sample in a Conclusion or Discussion now carries a hedge ("may", "suggests", "appears to", "could"), and the recommendations are worded as suggestions. The engineering break row of "Hedging / Hedge where a claim is uncertain" (`engineering/sections.tex:133`, paragraph 85) stays the one break of it.

Unhedged conclusions and discussion claims:

- Before, `social/sections.tex:49`: Losing a local office lowers residents' trust in a merged municipality. Future studies should follow residents before and after a merger.
  After, `social/sections.tex:49`: Losing a local office may lower residents' trust in a merged municipality. Future studies should follow residents before and after a merger.
- Before, `sciences/sections.tex:39`: Hedgerows wider than 5 m support more ground beetle species on arable farms. Future work should follow the same plots across several seasons.
  After, `sciences/sections.tex:35`: Hedgerows wider than 5 m may hold more ground beetle species on arable farms. Future work should follow the same plots across at least three seasons.
- Before, `medicine/sections.tex:43`: Early mobilization within 24 hours reduces readmission after hip fracture surgery in older adults. Future trials should test it in several hospitals.
  After, `medicine/sections.tex:37`: Early mobilization within 24 hours may reduce readmission after hip fracture surgery in older adults. Future trials should test it in at least three hospitals.
- Before, `engineering/sections.tex:137`: Thread creation raises the tail because each creation blocks the producer.
  After, `engineering/sections.tex:141`: Thread creation may raise the tail because each creation blocks the producer.
- Before, `social/sections.tex:43`: The loss concerns voice, not service quality.
  After, `social/sections.tex:43`: The loss appears to concern voice, not service quality, since nine participants described a gain in services.
- Before, `sciences/sections.tex:21`: Wider hedgerows support more species, which suggests that width provides more habitat.
  After, `sciences/sections.tex:21`: Wider hedgerows hold more species, which suggests that width adds habitat. The result extends earlier work on hedgerows as shelter for beetles (Lang, 2016) to the width of the hedgerow.
- Before, `sciences/sections.tex:33`: The gain comes from width, not from hedgerow length.
  After, `sciences/sections.tex:29`: The gain relates to width, not to hedgerow length, since every transect was 20 m long.
- Before, `sciences/sections.tex:35`: We recommend that agri-environment schemes pay for hedgerows wider than 5 m.
  After, `sciences/sections.tex:31`: We suggest that agri-environment schemes consider payments for hedgerows wider than 5 m.
- Before, `medicine/sections.tex:37`: Hospitals can apply the result by scheduling physiotherapy on the day of surgery.
  After, `medicine/sections.tex:33`: Hospitals that wish to test the approach could schedule physiotherapy on the day of surgery.

The checks, as printed:

The Conclusion lines and the Cold opens clean row, as `sed -n <line>p` printed them (`social/sections.tex` 49, `sciences/sections.tex` 35, `medicine/sections.tex` 37, `engineering/sections.tex` 141):

```
Losing a local office may lower residents' trust in a merged municipality. Future studies should follow residents before and after a merger.
Hedgerows wider than 5 m may hold more ground beetle species on arable farms. Future work should follow the same plots across at least three seasons.
Early mobilization within 24 hours may reduce readmission after hip fracture surgery in older adults. Future trials should test it in at least three hospitals.
Thread creation may raise the tail because each creation blocks the producer.
```

The hedge words on the lines of the Discussions and Conclusions of the short drafts, printed by `grep -n -o -i '\bmay\b\|suggest[a-z]*\|appears\|could\|probably\|unlikely\|may have'` over `medicine/sections.tex`, `sciences/sections.tex` and `social/sections.tex` (a line number from the Discussion heading on):

```
medicine/sections.tex:23: suggests
medicine/sections.tex:25: may
medicine/sections.tex:27: could
medicine/sections.tex:27: may
medicine/sections.tex:31: appears
medicine/sections.tex:33: could
medicine/sections.tex:37: may
sciences/sections.tex:21: suggests
sciences/sections.tex:25: may
sciences/sections.tex:31: suggest
sciences/sections.tex:35: may
social/sections.tex:31: suggest
social/sections.tex:33: may
social/sections.tex:35: may
social/sections.tex:41: may
social/sections.tex:43: appears
social/sections.tex:45: suggest
social/sections.tex:49: may
```

The lines of those sections without one of these words were read one by one: each states a cited source, a design, a limitation or a descriptive result, and none states a causal claim or a generalization.

### 3. Spec 6, unlisted breaks in the short drafts

Each unlisted break of the review is removed:

Unlisted breaks in the short drafts:

- Before, `medicine/sections.tex:13`: We adjusted for age, sex, comorbidity score and type of surgery.
  After, `medicine/sections.tex:11`: The analysis adjusted for age and comorbidity score.
- Before, `social/sections.tex:23`: Trust did not differ by age. It did differ by years of residence.
  After, `social/sections.tex:23`: Trust did not differ by age (r = .04, p = .41) but rose with years of residence (r = .18, p below .001). Years of residence may matter more to trust than age.
- Before, `sciences/main.tex:19`: Species richness is the number of species in a plot. We expected richness to rise with hedgerow width. A second survey recorded when beetles were most active.
  After, `sciences/main.tex:19`: Species richness is the number of species in a plot. We expected richness to rise with hedgerow width.
- Before, `social/sections.tex:13`: Losing an office was coded from the residents' registered address. The questionnaire was tested on 20 residents before mailing.
  After, `social/sections.tex:13`: Losing an office was coded from the residents' registered address.
- Before, `social/sections.tex:13`: Losing an office was coded from the residents' registered address. The questionnaire was tested on 20 residents before mailing.
  After, `social/sections.tex:15`: The questionnaire had 18 items and took 10 minutes to complete. It was tested on 20 residents before mailing.
- Before, `sciences/sections.tex:31`: Narrow hedgerows hold few species; wide hedgerows hold more. Farmers can plant wider strips at field edges.
  After, `sciences/sections.tex:27`: A 5 m strip removes land from the crop; the same strip holds 16 species on average. Farmers therefore weigh a loss of cropland against a gain in species.
- Before, `sciences/main.tex:37`: Each trap held propylene glycol. The glycol killed the beetles quickly. It also preserved them for counting. Traps stayed open for 7 days.
  After, `sciences/main.tex:37`: Each trap held propylene glycol. The glycol killed the beetles within 1 hour. It also preserved them for counting.
- Before, `medicine/main.tex:55`: The cohort study examined whether this effect appeared in routine care.
  After: removed, no counterpart.
- Before, `social/main.tex:51`: The survey tested whether this pattern held in a larger sample.
  After: removed, no counterpart.

The checks, as printed:

`grep -n -i quickly sciences/*.tex` printed nothing and exited 1. `grep -n '^This \|^These ' */main.tex */sections.tex` printed:

```
engineering/sections.tex:135:This section explains how the fixed pool lowers the tail. A fixed pool keeps every worker pinned to a warm cache.
engineering/sections.tex:139:This raises the tail. A fixed pool avoids both effects.
```

The only paragraph of `sciences/` with a semicolon is the semicolon clean row, `sciences/sections.tex:27`, which holds one idea (the cost and the gain of a 5 m strip). The cold-open lines that remain are the engineering break rows `engineering/sections.tex:135` and `:139`.

### 4. Proof 1, the counts

The "Vary paragraph length" clean rows and every other count row were recounted after the rewrite. The counts are in the rows of `expected.md` and were produced as follows.
Counted from `docx_paragraphs.py` output with an `awk` pass that splits each body paragraph (title, abstract, keywords and headings left out) at its sentence ends (a word that ends in a full stop, a question mark or an exclamation mark, with an optional closing straight quote, and is not a decimal number), the three short drafts print:

```
medicine: 31 body paragraphs, 7 to 53 words; 1 sentence(s): 17 (paragraphs 6 8 11 12 13 14 16 25 26 27 28 33 34 35 36 38 39); 2 sentence(s): 8 (paragraphs 5 9 19 20 21 24 37 41); 3 sentence(s): 6 (paragraphs 10 15 18 22 30 31);
sciences: 33 body paragraphs, 5 to 37 words; 1 sentence(s): 16 (paragraphs 6 10 11 12 13 14 15 18 27 28 29 30 33 37 40 41); 2 sentence(s): 13 (paragraphs 5 7 9 17 19 22 24 25 34 36 38 39 43); 3 sentence(s): 4 (paragraphs 16 21 23 32);
social: 36 body paragraphs, 7 to 38 words; 1 sentence(s): 18 (paragraphs 6 7 8 11 12 13 15 23 24 25 27 28 32 38 41 42 43 44); 2 sentence(s): 17 (paragraphs 5 10 14 17 18 19 20 21 26 29 33 34 35 37 39 40 46); 3 sentence(s): 1 (paragraphs 31);
```

The review named two counts. The old `social/` row counted the quotation paragraph ("One participant said that the council ...", old paragraph 22) among its one-sentence paragraphs although it holds two sentences, and the old `medicine/` row said "paragraphs 5 to 47" while it counted paragraph 2, the abstract, among its three-sentence paragraphs. Each count row now covers only the body paragraphs inside its stated range (the title, the abstract, the keywords and the headings are left out), lists the paragraph numbers of its two-sentence and three-sentence paragraphs, and agrees with the printed lines above: `social/` paragraphs 5 to 46 hold 36 body paragraphs, 18 of one sentence, 17 of two (the quotation paragraph, now paragraph 21 at `social/main.tex:47`, is one of them) and 1 of three; `medicine/` paragraphs 5 to 41 hold 31 body paragraphs (17, 8 and 6), and every listed paragraph number lies inside the range; `sciences/` paragraphs 5 to 43 hold 33 body paragraphs (16, 13 and 4). The other count rows are:

- Words and semicolons: `sed 's/^[0-9]*: //' <paragraphs> | wc -w` and `grep -o ';' <paragraphs> | wc -l` printed 2521 and 6 (engineering), 677 and 1 (medicine), 665 and 1 (sciences), 733 and 1 (social), as in the rows (2.38, 1.48, 1.50 and 1.36 semicolons per 1000 words, from `awk 'BEGIN{print 6000/2521}'` and its like).
- Paragraphs: `wc -l` of each paragraph listing printed 148, 41, 43 and 46.
- The six Introduction paragraphs of `engineering/` hold 32, 29, 29, 30, 30 and 29 words and 2 sentences each (`sed -n 5,10p <paragraphs>` with `awk '{print NF}'` after removing the numbers printed `32 29 29 30 30 29`).
- The rows' lists of paragraph numbers for the short drafts and the longest run of equal sentence lengths are the printed lines of items 1 and 4.

### 5. Spec 3, Voice

In every draft a procedure takes the passive and "we" stands only for the authors' decisions, contributions and results. Each Voice clean row is a "we" sentence of a shape no other sentence of its draft has:

Procedures in the passive, "we" for decisions:

- Before, `sciences/main.tex:25`: We sampled 24 plots on 12 farms in an agricultural landscape of 40 square kilometres. Plots lay along hedgerows 1 to 7 m wide.
  After, `sciences/main.tex:23`: A total of 24 plots were sampled on 12 farms in an agricultural landscape of 40 square kilometres. Plots lay along hedgerows 1 to 7 m wide.
- Before, `sciences/main.tex:33`: We emptied the traps every 7 days from April to September.
  After, `sciences/main.tex:33`: The traps were emptied every 7 days from April to September.
- Before, `sciences/sections.tex:5`: We sampled beetles along hedgerows.
  After, `sciences/sections.tex:5`: Beetles were sampled along hedgerows.
- Before, `medicine/main.tex:25`: We randomized 480 patients aged 65 years or older to early or usual mobilization. Allocation was concealed in sealed envelopes.
  After, `medicine/main.tex:23`: A total of 480 patients aged 65 years or older were randomized to early or usual mobilization. Allocation was concealed in sealed envelopes.
- Before, `medicine/sections.tex:5`: We reviewed the records of 310 consecutive patients aged 65 years or older. Mobilization time was taken from nursing notes.
  After, `medicine/sections.tex:3`: The cohort drew on the records of 310 consecutive patients aged 65 years or older. Mobilization time was taken from nursing notes.
- Before, `medicine/sections.tex:13`: We adjusted for age, sex, comorbidity score and type of surgery.
  After, `medicine/sections.tex:11`: The analysis adjusted for age and comorbidity score.
- Before, `social/main.tex:27`: We conducted semi-structured interviews with 24 residents (N = 24). Participants were recruited through the public library.
  After, `social/main.tex:25`: Semi-structured interviews were held with 24 residents (N = 24). Participants were recruited through the public library.
- Before, `social/main.tex:37`: We coded the transcripts for themes of distance and voice. Each transcript was coded twice.
  After, `social/main.tex:35`: Each transcript was coded twice for themes of distance and voice.
- Before, `social/sections.tex:9`: We mailed the survey to 1,200 residents and 412 replied. The response rate was 34 percent.
  After, `social/sections.tex:9`: The survey was mailed to 1,200 residents, and 412 replied. A response rate of 34 percent left room for non-response bias.
- Before, `engineering/sections.tex:51`: Each run lasted 60 seconds after a 10-second warm-up. We repeated each run 30 times.
  After, `engineering/sections.tex:51`: Each run lasted 60 seconds after a 10-second warm-up. The run was repeated 30 times.
- Before, `engineering/sections.tex:67`: Due to the fact that each host had two sockets, we pinned workers per socket.
  After, `engineering/sections.tex:67`: The queue was allocated in the memory of the first socket. Workers on the second socket accessed it remotely.
- Before, `engineering/sections.tex:69`: Because the cache state differed between runs, we randomized the run order.
  After, `engineering/sections.tex:69`: The run order was randomized because the cache state differed between runs.
- Before, `engineering/sections.tex:75`: We implemented the producers in C.
  After, `engineering/sections.tex:75`: We kept the producers identical for both pools.
- Before, `engineering/sections.tex:111`: We computed the 99th percentile over all tasks of a run.
  After, `engineering/sections.tex:113`: The percentile was computed over the pooled latencies of all runs of a pool.

The Voice clean rows:

- Before, `sciences/main.tex:33`: We emptied the traps every 7 days from April to September.
  After, `sciences/main.tex:31`: We kept the plots at least 100 m apart so that the samples stayed independent.
- Before, `medicine/main.tex:25`: We randomized 480 patients aged 65 years or older to early or usual mobilization. Allocation was concealed in sealed envelopes.
  After, `medicine/main.tex:25`: We defined early mobilization as standing with a physiotherapist within 24 hours of surgery. Patients then walked twice a day. Usual care began on the second day.
- Before, `engineering/sections.tex:75`: We implemented the producers in C.
  After, `engineering/sections.tex:75`: We kept the producers identical for both pools.

The check, as printed:

`grep -n -o '[^.]*\b[Ww]e \w* [^.]*\.' */main.tex */sections.tex` (a sentence with "we" and a verb) printed:

```
medicine/main.tex:8:We tested whether mobilization within 24 hours of hip fracture surgery reduces readmission in older adults.
medicine/main.tex:25:We defined early mobilization as standing with a physiotherapist within 24 hours of surgery.
engineering/main.tex:8:We compare a fixed worker pool with a growing worker pool for bounded task queues in server software.
engineering/main.tex:17:We compare a fixed worker pool with a growing worker pool on four hosts.
social/main.tex:8:We examined how residents' trust in local government changed after two municipalities merged.
social/main.tex:17:We studied residents of two towns that merged in 2019.
sciences/main.tex:8:We tested whether wider hedgerows hold more ground beetle species on arable farms.
sciences/main.tex:17:We surveyed ground beetles along hedgerows of different width.
sciences/main.tex:19: We expected richness to rise with hedgerow width.
sciences/main.tex:31:We kept the plots at least 100 m apart so that the samples stayed independent.
sciences/sections.tex:15:We were delighted to find a rare ground beetle in the third hedgerow.
sciences/sections.tex:31:We suggest that agri-environment schemes consider payments for hedgerows wider than 5 m.
social/sections.tex:5:We operationalized trust as agreement with five statements on a 5-point scale.
social/sections.tex:45:We suggest that councils keep a local office open for two years after a merger.
engineering/sections.tex:11:We chose a ring buffer because it needed no allocation after launch.
engineering/sections.tex:47:We chose an offered load of 500,000 tasks per second because it saturated the growing pool on every host.
engineering/sections.tex:75:We kept the producers identical for both pools.
engineering/sections.tex:117:We chose an offered load below saturation because latency grows without bound above it.
engineering/sections.tex:223:We believe the fixed pool is the better design.
engineering/sections.tex:225:We chose to report the 99th percentile because it exposes queueing delay.
```

Each of these sentences states a decision (what was chosen, kept, defined, operationalized or suggested), a contribution (what the study compares, examines or surveyed) or an expectation ("We expected richness to rise with hedgerow width"). `sciences/sections.tex:15` ("We were delighted ...") is the Register break row.

### 6. Spec 5, evidence followed by what it means

Every paragraph that reports evidence now ends with a sentence that says what the evidence means for its claim, and the break row `engineering/sections.tex:97` of the review (now `:99`, paragraph 68) is the one break of the rule. The clean row is `engineering/sections.tex:89` (paragraph 63), whose last sentence says the difference measured the effect of the pool policy.

Paragraphs that report evidence now say what it means:

- Before, `medicine/main.tex:53`: Mortality at 90 days was 6 percent after early mobilization and 8 percent after usual care. The RR was 0.75 (95% CI [0.39, 1.43]).
  After, `medicine/main.tex:49`: Length of stay did not differ between the groups, with a median of 7 days in each. Mortality at 90 days was 6 percent after early mobilization and 8 percent after usual care (RR 0.75, 95% CI [0.39, 1.43]). With an interval that included 1, the trial left the effect on mortality open.
- Before, `medicine/main.tex:49`: Mobilization began a median of 11 hours after surgery in the early group.
  After, `medicine/main.tex:47`: Mobilization began a median of 11 hours after surgery in the early group. The median lay inside the 24-hour target.
- Before, `medicine/main.tex:51`: Length of stay did not differ between the groups, with a median of 7 days in each.
  After, `medicine/main.tex:49`: Length of stay did not differ between the groups, with a median of 7 days in each. Mortality at 90 days was 6 percent after early mobilization and 8 percent after usual care (RR 0.75, 95% CI [0.39, 1.43]). With an interval that included 1, the trial left the effect on mortality open.
- Before, `sciences/main.tex:47`: Species richness rose by 3.1 species per additional metre of hedgerow width (95% CI [2.2, 4.0]). Mean richness was 12.3 species per plot (SD = 2.1).
  After, `sciences/main.tex:47`: Species richness rose by 3.1 species per additional metre of hedgerow width (95% CI [2.2, 4.0]). Mean richness was 12.3 species per plot (SD = 2.1). Because the interval excluded zero, width and richness were positively associated.
- Before, `social/sections.tex:19`: Residents who lost a local office reported lower trust than the others (mean 2.9 against 3.6, p below .001). The difference was 0.7 points on the 5-point scale.
  After, `social/sections.tex:19`: Respondents who had lost a local office reported lower trust than the others (mean 2.9 against 3.6, p below .001). The difference was 0.7 points on the 5-point scale. Losing an office was therefore associated with lower trust.
- Before, `engineering/sections.tex:85`: The fixed pool completed 412,000 tasks per second and the growing pool completed 331,000. The difference is 24 percent of the growing pool's rate.
  After, `engineering/sections.tex:89`: The fixed pool completed 412,000 tasks per second and the growing pool completed 331,000. The difference was 24 percent of the growing pool's rate. Both pools served the same load on the same hosts, so the difference measured the effect of the pool policy.
- Before, `engineering/sections.tex:87`: The growing pool created 248 threads during each run. Therefore, it spent 6 percent of each run creating them.
  After, `engineering/sections.tex:91`: The growing pool created 248 threads during each run. Creating them therefore took 6 percent of each run. Thread creation took time that the growing pool could not spend on tasks.
- Before, `engineering/sections.tex:89`: The gain ranged from 22 percent on the first host to 27 percent on the fourth host.
  After, `engineering/sections.tex:93`: The gain ranged from 22 percent on the first host to 27 percent on the fourth host. It held on all four hosts.
- Before, `engineering/sections.tex:91`: The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced.
  After, `engineering/sections.tex:95`: The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced. That value set the upper end of the throughput range.
- Before, `engineering/sections.tex:93`: Host one completed 380,000 tasks per second. Host two completed 405,000 tasks per second. Host three completed 421,000 tasks per second.
  After, `engineering/sections.tex:97`: The fixed pool completed between 380,000 and 442,000 tasks per second on the four hosts, with a mean of 412,000. Even the lowest host exceeded the growing pool's mean of 331,000.
- Before, `engineering/sections.tex:95`: Host four completed 442,000 tasks per second. Their mean was 412,000 tasks per second.
  After, `engineering/sections.tex:97`: The fixed pool completed between 380,000 and 442,000 tasks per second on the four hosts, with a mean of 412,000. Even the lowest host exceeded the growing pool's mean of 331,000.
- Before, `engineering/sections.tex:97`: The growing pool was idle for 38 percent of each run. The fixed pool was idle for 4 percent.
  After, `engineering/sections.tex:99`: The growing pool was idle for 38 percent of each run. The fixed pool was idle for 4 percent.
- Before, `engineering/sections.tex:119`: A statistical test compared the two latency distributions and gave p below 0.001.
  After, `engineering/sections.tex:123`: A Mann-Whitney U test compared the two latency distributions and gave p below 0.001. The test rejected the hypothesis that both pools had the same latency distribution.
- Before, `engineering/sections.tex:121`: The fixed pool lowered the 99th percentile latency from 410 to 190 microseconds.
  After, `engineering/sections.tex:125`: The fixed pool lowered the 99th percentile latency from 410 to 190 microseconds. The tail of the growing pool was more than twice as long.
- Before, `engineering/sections.tex:123`: The growing pool paid for thread creation inside the request path, which added to the tail.
  After, `engineering/sections.tex:127`: The growing pool created threads inside the request path, which may have added to the tail.

The check, as printed:

The last sentence of each paragraph of the Results sections (the paragraphs that report evidence), printed by an `awk` pass that splits each paragraph at ". " and prints the last piece with its file and line:

```
medicine/main.tex:41: One readmission was avoided for every ten patients mobilized early.
medicine/main.tex:43: All 480 patients completed follow-up and entered the analysis.
medicine/main.tex:45: The numbers were too small to compare the groups.
medicine/main.tex:47: The median lay inside the 24-hour target.
medicine/main.tex:49: With an interval that included 1, the trial left the effect on mortality open.
medicine/sections.tex:15: Age and comorbidity probably explained little of the association.
medicine/sections.tex:17: Late mobilization may have added to the risk of thrombosis.
sciences/main.tex:47: Because the interval excluded zero, width and richness were positively associated.
sciences/main.tex:49: That mean exceeded the overall mean of 12.3 species by 3.7 species.
sciences/main.tex:51: Width may have decided which species could persist.
sciences/main.tex:53: Farm size was an unlikely source of the width effect.
sciences/main.tex:55: The difference may reflect the shade that wide hedgerows offered these species.
sciences/sections.tex:13: Beetles were therefore most active in early summer.
sciences/sections.tex:15: We were delighted to find a rare ground beetle in the third hedgerow.
sciences/sections.tex:17: Hedgerow width was unlikely to shift the timing of activity.
social/main.tex:39: They described the loss as a loss of voice: the council no longer listened to them.
social/main.tex:41: All nine lived within 5 km of the new town hall, which may explain their view.
social/main.tex:43: Six of them said that the trip kept them from visiting at all.
social/main.tex:45: Their answers named no change in their contact with the council.
social/main.tex:47: One participant said that the council "stopped listening." The quotation illustrates the loss of voice that 15 participants described.
social/sections.tex:19: Losing an office was therefore associated with lower trust.
social/sections.tex:21: The respondents were a mixed bag in age and occupation.
social/sections.tex:23: Years of residence may matter more to trust than age.
social/sections.tex:25: Distance may help to explain the pattern that the interviews described.
social/sections.tex:27: Neither town dominated the sample.
engineering/sections.tex:89: Both pools served the same load on the same hosts, so the difference measured the effect of the pool policy.
engineering/sections.tex:91: Thread creation took time that the growing pool could not spend on tasks.
engineering/sections.tex:93: It held on all four hosts.
engineering/sections.tex:95: That value set the upper end of the throughput range.
engineering/sections.tex:97: Even the lowest host exceeded the growing pool's mean of 331,000.
engineering/sections.tex:99: The fixed pool was idle for 4 percent.
engineering/sections.tex:101: The counts differed because only the growing pool changed its size.
engineering/sections.tex:103: The harness sampled memory once per second.
engineering/sections.tex:105: The latency study applied the same two pools to the tail of the latency distribution.
engineering/sections.tex:123: The test rejected the hypothesis that both pools had the same latency distribution.
engineering/sections.tex:125: The tail of the growing pool was more than twice as long.
engineering/sections.tex:127: The growing pool created threads inside the request path, which may have added to the tail.
```

Each last sentence is a conclusion, an interpretation or a consequence of the evidence in its paragraph, except `engineering/sections.tex:99` (the break row), `:103` (the Claim with evidence break row, a paragraph that reports a claim and a method detail and no data) and `:105` (a paragraph that announces the next study and reports no evidence).

### 7. Spec 2, near-copies

Each clean passage has content of its own and is no longer the break sentence with its fault removed:

Near-copy pairs:

- Before, `engineering/sections.tex:37`: With this setup complete, the harness submits the first task.
  After, `engineering/sections.tex:37`: With this setup complete, the harness submitted the first task.
- Before, `engineering/sections.tex:39`: The harness submits the first task after a warm-up.
  After, `engineering/sections.tex:39`: The first task entered slot 0 of the ring buffer.
- Before, `engineering/sections.tex:246`: Pinning keeps each cache warm and removes cross-core traffic. \textbf{The pool design is the strongest option for this workload.}
  After, `engineering/sections.tex:270`: Pinning keeps each cache warm and removes cross-core traffic. \textbf{The fixed pool design is the strongest option for this workload.}
- Before, `engineering/sections.tex:248`: Pinning keeps each cache warm and removes cross-core traffic. The measured gain on the fourth host is 27 percent.
  After, `engineering/sections.tex:272`: Workers stay on their cores and keep their caches warm. The measured gain on the fourth host is 27 percent.
- Before, `engineering/sections.tex:199`: The queue rejects a task with the status <left double quotation mark>full<right double quotation mark> when no slot is free.
  After, `engineering/sections.tex:203`: The report prints the status <left double quotation mark>complete<right double quotation mark> after each run.
- Before, `engineering/sections.tex:149`: The queue rejects a task when no slot is free.
  After, `engineering/sections.tex:153`: The queue rejects a task when no slot is free. The producer receives an error code and moves on to its next task.
- Before, `engineering/sections.tex:195`: The fixed pool leverages every core of the host.
  After, `engineering/sections.tex:199`: The fixed pool leverages every core of the host.
- Before, `engineering/sections.tex:197`: Each worker owns one core of the host.
  After, `engineering/sections.tex:201`: Workers sleep while the queue is empty. They wake when a producer writes a task.
- Before, `engineering/sections.tex:207`: Completion order is queue <rightwards arrow> worker.
  After, `engineering/sections.tex:211`: Completion order is queue <rightwards arrow> worker.
- Before, `engineering/sections.tex:209`: A task passes from the queue to a worker.
  After, `engineering/sections.tex:213`: Tasks leave the queue in the order in which they arrived. The order of arrival is the order of the tail index.
- Before, `medicine/main.tex:47`: Two patients had a heart attack within 30 days. Both were in the usual care group.
  After, `medicine/main.tex:45`: By 30 days, a heart attack had occurred in two patients, both in the usual care group. The numbers were too small to compare the groups.
- Before, `medicine/sections.tex:21`: Three patients had a deep vein thrombosis within 30 days.
  After, `medicine/sections.tex:17`: Three cases of deep vein thrombosis were recorded in the cohort, a rate of 1 percent. All three occurred in patients mobilized after the first day. Late mobilization may have added to the risk of thrombosis.

The break sentences that stay as they were (`engineering/sections.tex:199` and `:211`) are single sentences of their own rule; their clean partners (`:201` and `:213`) say something else.

### 8. Spec 7, a second rule a break passage breaks

Each break passage was rewritten so that it breaks only its rule, or its row names the second rule with the group the review's order gives:

Second rule of a break passage:

- Before, `medicine/sections.tex:9`: The team ran into snags with the ethics forms.
  After, `medicine/sections.tex:7`: Obtaining ethics approval was a hassle that lasted four months.
- Before, `engineering/sections.tex:21`: The scheduler hands each task to a worker, and it fails when the queue is full.
  After, `engineering/sections.tex:21`: The scheduler passed the task to a worker when it was ready.
- Before, `engineering/sections.tex:19`: The benchmark runs on a modern server. A harness thread submits the tasks.
  After, `engineering/sections.tex:19`: The benchmark ran on a modern server.
- Before, `engineering/sections.tex:211`: The queue is bounded; the pool is fixed; the clock is monotonic. Producers never block; workers never spawn. The harness stops after 60 seconds; it then reports the counts. A full queue rejects a task; the producer retries later.
  After, `engineering/sections.tex:215`: The queue is bounded; its ring buffer holds 4096 slots; each slot holds one task; no slot holds two; the free slots decide every write. A producer checks the free slots before it writes; a full queue rejects the write; the harness counts each rejection.
- Before, `engineering/sections.tex:213`: The cause is contention, not thread count. The limit applies to threads, not to tasks. The pool needs pinning, not a larger queue.
  After, `engineering/sections.tex:217`: The fixed pool has a constant thread count, not a variable one. It pins each worker to a core, not to a socket. It places the queue on core 8, not on a worker core.
- Before, `engineering/sections.tex:119`: A statistical test compared the two latency distributions and gave p below 0.001.
  After, `engineering/sections.tex:123`: A Mann-Whitney U test compared the two latency distributions and gave p below 0.001. The test rejected the hypothesis that both pools had the same latency distribution.
- Before, `engineering/sections.tex:183`: Contention rises with the thread count, which is exactly when a fixed pool pays off.
  After, `engineering/sections.tex:187`: Contention rises with the thread count, which is exactly when the fixed pool matters.
- Before, `engineering/sections.tex:246`: Pinning keeps each cache warm and removes cross-core traffic. \textbf{The pool design is the strongest option for this workload.}
  After, `engineering/sections.tex:270`: Pinning keeps each cache warm and removes cross-core traffic. \textbf{The fixed pool design is the strongest option for this workload.}

The rows that name a second rule are the Register and Terminology rows (each stands once in Formality or Precision and names the register), the bolded closer (stands in "0. Hard rules / No dramatic bolded closers" and names "F. Emphasis and formatting / Bold" and "Objectivity / Claims rest on evidence", per its row), and the double rows of the "Judgment calls" list above.

### 9. Spec 8, the group of a double break

- The mirror-structure sections `engineering/main.tex:27` to `:41` lose the repeated shape "X (year) measured the cost of Y and found Z" and break only "No mirror structure":

Mirror-structure sections and the two Wordy phrase breaks:

- Before, `engineering/main.tex:29`: A lock-based queue guards its head and tail with one mutex, a lock that admits one thread at a time. Smith (2019) measured the cost of that mutex and found a 40 percent loss at 32 threads.
  After, `engineering/main.tex:29`: A lock-based queue guards its head and tail with one mutex, a lock that admits one thread at a time. Smith (2019) measured the cost of that mutex and found a 40 percent loss at 32 threads. The loss suggests that the wait for the lock is the cost of this design.
- Before, `engineering/main.tex:37`: A lock-free queue advances its head and tail with compare-and-swap (CAS), an atomic instruction that conditionally stores a value. Park (2018) measured the cost of CAS and found a 12 percent loss at 32 threads.
  After, `engineering/main.tex:37`: A lock-free queue advances its head and tail with compare-and-swap (CAS), an atomic instruction that conditionally stores a value. Park (2018) reported a 12 percent loss for CAS at 32 threads. The loss is below a third of the mutex loss, which suggests that CAS costs less than a lock at 32 threads.
- Before, `engineering/main.tex:31`: The correctness proof of this design is short, and Jones (2020) fitted it into two pages.
  After, `engineering/main.tex:31`: The correctness proof of this design fits into two pages (Jones, 2020).
- Before, `engineering/main.tex:33`: Contention grows with the thread count, and Lee (2021) reported a threefold slowdown from 8 to 64 threads.
  After, `engineering/main.tex:33`: Contention grows with the thread count, as the threefold slowdown from 8 to 64 threads reported by Lee (2021) shows. Lee varied the thread count alone and left the effect of the pool policy unmeasured.
- Before, `engineering/main.tex:39`: No thread waits for a lock in this design, and Kim (2020) showed that a stalled thread cannot block the others.
  After, `engineering/main.tex:39`: A stalled thread cannot block the others in this design, since no thread waits for a lock (Kim, 2020).
- Before, `engineering/main.tex:41`: Memory reclamation is the main cost, since a removed node may still be read by another thread. Michael (2004) described a remedy that costs one extra memory write per access.
  After, `engineering/main.tex:41`: Memory reclamation is the main cost of this design: another thread may still read a removed node. Michael (2004) described a remedy that costs one extra memory write per access, a cost that every worker pays. No measurement of a lock-free queue compares a fixed with a growing pool.
- Before, `engineering/sections.tex:29`: Due to the fact that all workers share one queue, the head index is atomic.
  After, `engineering/sections.tex:29`: Due to the fact that all workers shared one queue, the head index was atomic. The tail index was atomic for the same reason.
- Before, `engineering/sections.tex:67`: Due to the fact that each host had two sockets, we pinned workers per socket.
  After, `engineering/sections.tex:67`: The queue was allocated in the memory of the first socket. Workers on the second socket accessed it remotely.

The social Discussion and the interview study's limitation:

- Before, `social/sections.tex:33`: The survey reached registered residents only, so the estimate may miss recent movers.
  After, `social/sections.tex:33`: Interviewees were recruited at the public library, so they may differ from residents who never visit it.

The checks, as printed:

`grep -n 'measured the cost' engineering/main.tex` printed:

```
29:A lock-based queue guards its head and tail with one mutex, a lock that admits one thread at a time. Smith (2019) measured the cost of that mutex and found a 40 percent loss at 32 threads. The loss suggests that the wait for the lock is the cost of this design.
```

`grep -n 'Due to the fact' engineering/sections.tex` printed:

```
29:Due to the fact that all workers shared one queue, the head index was atomic. The tail index was atomic for the same reason.
```

- The two "Wordy phrase" breaks: one is removed (`engineering/sections.tex:67` is rewritten, see item 5) and one stays (`:29`), so the draft has one occurrence of "Due to the fact that".
- The social Interview Method keeps its double break with "Reader's path / So what per section" and the Social Sciences "What the reader looks for" (`social/main.tex:23`, paragraph 9), and the Discussion states the interview study's limitation (`social/sections.tex:33`, paragraph 38), so the clean row of "Objectivity / Limitations and alternative interpretations" holds with the paragraphs 27, 38 and 39.

### 10. Spec 9, unlisted places of listed rules in `engineering/`

Each unlisted place is removed, so the rows' places are the only ones:

Unlisted places of listed rules in engineering:

- Before, `engineering/sections.tex:45`: The throughput study tested whether a fixed pool completed more tasks per second than a growing pool.
  After, `engineering/sections.tex:45`: The throughput study tested whether a fixed pool completed more tasks per second than a growing pool.
- Before, `engineering/sections.tex:107`: The latency study tested whether the two pools differed in the tail of the latency distribution.
  After, `engineering/sections.tex:109`: Each pool was compared by the 99th percentile of its task latency.
- Before, `engineering/sections.tex:55`: The harness covered only x86 hosts, so the results do not extend to other architectures.
  After, `engineering/sections.tex:55`: The harness covered only x86 hosts, so the results do not extend to other architectures. All four hosts used processors from one vendor.
- Before, `engineering/sections.tex:115`: The latency study covered one queue size only, so the results do not extend to larger queues.
  After, `engineering/sections.tex:119`: Only one queue size was tested, which limited the latency result to that size.
- Before, `engineering/main.tex:41`: Memory reclamation is the main cost, since a removed node may still be read by another thread. Michael (2004) described a remedy that costs one extra memory write per access.
  After, `engineering/main.tex:41`: Memory reclamation is the main cost of this design: another thread may still read a removed node. Michael (2004) described a remedy that costs one extra memory write per access, a cost that every worker pays. No measurement of a lock-free queue compares a fixed with a growing pool.
- Before, `engineering/sections.tex:85`: The fixed pool completed 412,000 tasks per second and the growing pool completed 331,000. The difference is 24 percent of the growing pool's rate.
  After, `engineering/sections.tex:89`: The fixed pool completed 412,000 tasks per second and the growing pool completed 331,000. The difference was 24 percent of the growing pool's rate. Both pools served the same load on the same hosts, so the difference measured the effect of the pool policy.
- Before, `engineering/sections.tex:3`: The queue is a ring buffer with 4096 slots. Producers write at the tail index and workers read at the head index.
  After, `engineering/sections.tex:3`: The queue was a ring buffer with 4096 slots. Producers wrote at the tail index and workers read at the head index.
- Before, `engineering/sections.tex:57`: All runs used GCC 13.2 at optimization level 2 on Linux 6.5, and the random seed was 42.
  After, `engineering/sections.tex:57`: All runs used GCC 13.2 at optimization level 2 on Linux 6.5. The same binary served both pools.
- Before, `engineering/main.tex:19`: Does a fixed pool lower the 99th percentile latency of a bounded queue? The latency study answers that question on every host with the same harness and the same load.
  After, `engineering/main.tex:19`: A fixed pool may lower the 99th percentile latency of a bounded queue. The latency study checks that on every host with the same harness and the same load.
- Before, `engineering/sections.tex:151`: Why does the queue reject tasks? A full ring buffer has no free slot.
  After, `engineering/sections.tex:131`: Why does a fixed pool lower the tail latency? The results suggest that a fixed pool lowers tail latency by removing thread creation from the request path.

The checks, as printed:

Runs of consecutive body paragraphs with the same sentence count, four or more, in the `engineering` draft, counted with an `awk` pass over `docx_paragraphs.py` output (list items left out). Before the round (the `.docx` of that time):

```
4 paragraphs of 1 sentence(s), paragraphs 24 to 27
4 paragraphs of 2 sentence(s), paragraphs 20 to 23
4 paragraphs of 2 sentence(s), paragraphs 66 to 69
5 paragraphs of 1 sentence(s), paragraphs 72 to 76
6 paragraphs of 2 sentence(s), paragraphs 5 to 10
8 paragraphs of 1 sentence(s), paragraphs 100 to 107
11 paragraphs of 1 sentence(s), paragraphs 109 to 119
11 paragraphs of 1 sentence(s), paragraphs 29 to 39
14 paragraphs of 1 sentence(s), paragraphs 46 to 59
```

After the round:

```
4 paragraphs of 1 sentence(s), paragraphs 23 to 26
4 paragraphs of 1 sentence(s), paragraphs 35 to 38
4 paragraphs of 1 sentence(s), paragraphs 55 to 58
4 paragraphs of 2 sentence(s), paragraphs 65 to 68
6 paragraphs of 2 sentence(s), paragraphs 5 to 10
```

`grep -n -i 'tested whether' engineering/*.tex` printed:

```
engineering/sections.tex:45:The throughput study tested whether a fixed pool completed more tasks per second than a growing pool.
```

`grep -n 'covered only\|Only one queue' engineering/sections.tex` printed:

```
55:The harness covered only x86 hosts, so the results do not extend to other architectures. All four hosts used processors from one vendor.
119:Only one queue size was tested, which limited the latency result to that size.
```

The Implementation and Throughput Method sections are in the past tense, the Throughput Results section is in the past tense (`sections.tex:89` to `:103`), and the literature sections end on the gap (`main.tex:33` and `:41`, quoted in item 9). The clean row of "Rhetorical questions" is now `engineering/sections.tex:131` (paragraph 84), a question that the Discussion answers as its subject. Paragraph 128 (`sections.tex:219`) is the break row of "Paragraphs cover one idea and stay under roughly four sentences".

### 11. Spec 12, contradictions

The contradictions are removed, the hosts have 96, 128, 160 and 192 cores, and each sentence of the draft names its pool:

Contradictions and the pool named:

- Before, `engineering/main.tex:23`: The four hosts have 16, 24, 32 and 48 cores. Each host has two sockets and 256 GB of memory, and each runs Linux 6.5 on x86 processors.
  After, `engineering/main.tex:23`: The four hosts have 96, 128, 160 and 192 cores, split over two sockets in each host. Each host runs Linux 6.5 on x86 processors with 512 GB of memory.
- Before, `engineering/sections.tex:157`: The pool has two parts, the queue and the workers.
  After, `engineering/sections.tex:161`: The harness uses two kinds of thread, the producers and the workers.
- Before, `engineering/sections.tex:227`: The pool is separate from the queue so that a stalled worker cannot block a producer.
  After, `engineering/sections.tex:251`: The fixed pool is separate from the queue so that a stalled worker cannot block a producer. The queue sits on core 8 and the workers run on other cores.
- Before, `engineering/sections.tex:235`: \textbf{Warning:} the pool size must not exceed the core count of the host.
  After, `engineering/sections.tex:259`: \textbf{Warning:} the queue depth must be a power of two.
- Before, `engineering/sections.tex:155`: The pool is small, compact and light.
  After, `engineering/sections.tex:159`: The fixed pool is small, compact and light.
- Before, `engineering/sections.tex:159`: The queue holds tasks. The buffer rejects a task when it is full. The channel feeds the workers.
  After, `engineering/sections.tex:163`: The queue holds tasks. The buffer orders them by arrival. The channel feeds the workers.
- Before, `engineering/sections.tex:161`: The pool holds workers. The pool starts them at launch. The pool never adds another.
  After, `engineering/sections.tex:165`: The fixed pool holds 64 workers. The fixed pool starts them at launch. The fixed pool never adds another.
- Before, `engineering/sections.tex:177`: The lock-free queue and the 64-thread pool share one design goal.
  After, `engineering/sections.tex:181`: The lock-free queue and the fixed pool both keep waiting out of the request path.
- Before, `engineering/sections.tex:65`: The pool did not change size during a run.
  After, `engineering/sections.tex:65`: The growing pool did not remove a thread after a burst.

The check, as printed:

`grep -n -w pool engineering/main.tex engineering/sections.tex | grep -v 'fixed pool\|growing pool\|Fixed pool\|Growing pool\|worker pool'` printed the sentences that say "pool" without naming it:

```
engineering/main.tex:33:Contention grows with the thread count, as the threefold slowdown from 8 to 64 threads reported by Lee (2021) shows. Lee varied the thread count alone and left the effect of the pool policy unmeasured.
engineering/sections.tex:31:In recent years, hosts gained cores, so the pool sizes of this study started at 8 and 64 threads. Both starting sizes stayed below the core count of the smallest host.
engineering/sections.tex:79:Each pool ran on the same hosts and the same queue.
engineering/sections.tex:109:Each pool was compared by the 99th percentile of its task latency.
engineering/sections.tex:113:The percentile was computed over the pooled latencies of all runs of a pool.
engineering/sections.tex:167:The log holds the run number, the host name, the pool type and the elapsed time.
engineering/sections.tex:193:The data come from 120 runs per pool. Each run lasts 70 seconds, including the warm-up.
engineering/sections.tex:261:The harness reads its pool settings from configs/pool.yaml.
```

Each of these says "each pool", "a pool" or a field name and means both pools, or names the pool settings file.

The synonym-cycling clean row (`engineering/sections.tex:165`, paragraph 101) names the fixed pool in each of its three sentences.

### 12. Spec 10, the list colon

`engineering/` holds the two cases of the colon part of section D's list bullet, as `enumerate` environments in the `.tex` form and `<ol>` lists in the `.html` form: the break is `engineering/sections.tex:229` to `:236` (paragraphs 133 to 137, "The harness writes four result files." followed by four items, the introducing sentence ending in a full stop), and the clean case is `sections.tex:240` to `:247` (paragraphs 139 to 143, "The summary file holds four totals:" followed by four items). The bullet is dropped from "Rules with no case". `docx_paragraphs.py <cases>/engineering/draft.docx | sed -n '133,143p'` printed:

```
133: The harness writes four result files.
134:  1 The raw latency samples of each run.
135:  2 A summary of the totals of each run.
136:  3 The memory samples taken once per second.
137:  4 A copy of the configuration file.
138: Each file carries the run number in its name, so a run can be traced to its files. The run number is the same in all four files.
139: The summary file holds four totals:
140:  1 The number of completed tasks.
141:  2 The number of rejected tasks.
142:  3 The mean latency.
143:  4 The 99th percentile latency.
```

`docx_paragraphs.py <cases>/engineering/draft.docx | LC_ALL=C grep -n '[^ -~]'` printed the five lines of Verify 5 and none of the list lines (paragraphs 133 to 143).

### 13. Spec 11, the two forms

The two paragraphs under the `.tex` subsection headings are in `draft.html` too, so they are paragraphs 144 and 145 of `engineering/draft.docx`. The cases that only the `.tex` form holds are the eight formatting cases and the two subsection headings, as the C6 comparison above prints:

The paragraphs under the subsection headings:

- Before, `engineering/sections.tex:227`: The pool is separate from the queue so that a stalled worker cannot block a producer.
  After, `engineering/sections.tex:251`: The fixed pool is separate from the queue so that a stalled worker cannot block a producer. The queue sits on core 8 and the workers run on other cores.
- Before, `engineering/sections.tex:231`: The pool size is set once at launch and never changes during a run.
  After, `engineering/sections.tex:255`: The value of 64 was set below the 96 cores of the smallest host so that the producers and the queue keep cores of their own.

### 14. Standards 1, the paragraph after the block in `docs/dev/building.md`

The paragraph is split into three paragraphs of four, three and one sentences, each of one idea (what the command covers and skips; what it prints and how it exits; where the checkmark is allowed), and every fact it stated before is kept. Before, one paragraph of nine sentences:

```
The last command is the ASCII check over every tracked file and every untracked file git does not ignore that exists on disk. A file deleted in a worktree and not yet staged is left out. So are the files under the `cases/` folder of a plan's folder or of an archived plan's folder. Those files hold the drafts the `/writing` gate runs on and their expected results. The drafts must hold the characters the prose standard bans. The check prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number. It exits 0 only when it prints nothing. A file that is not valid UTF-8 makes it exit non-zero: perl either stops with its `Malformed UTF-8 character (fatal)` error or prints the line. The green checkmark is allowed in Markdown files, where the plan ledgers use it as their status marker, and nowhere else.
```

After, as `sed -n 25,29p docs/dev/building.md` prints them in the section "Building and checking Ordo":

```
The last command is the ASCII check over every tracked file and every untracked file git does not ignore that exists on disk. A file deleted in a worktree and not yet staged is left out. So are the files under the `cases/` folder of a plan's folder or of an archived plan's folder. Those files hold the drafts the `/writing` gate runs on and their expected results, and the drafts must hold the characters the prose standard bans.

The check prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number. It exits 0 only when it prints nothing. A file that is not valid UTF-8 makes it exit non-zero: perl either stops with its `Malformed UTF-8 character (fatal)` error or prints the line.

The green checkmark is allowed in Markdown files, where the plan ledgers use it as their status marker, and nowhere else.
```

The sentence lengths are in Verify 6 above. The facts kept are: the files the command covers (tracked files and untracked files git does not ignore that exist on disk), the file deleted in a worktree and not yet staged that is left out, the `cases/` files of a plan's folder and of an archived plan's folder that are left out, what those files hold, that the drafts must hold the banned characters, what the check prints, when it exits 0, the non-UTF-8 behaviour with perl's error, and the checkmark in Markdown files. `git status --short` printed:

```
 M docs/dev/building.md
 M docs/dev/change-standard.md
?? .scratch/3-the-writing-base/agents/briefs/2-round-1.md
?? .scratch/3-the-writing-base/agents/reviews/2-refuter.md
?? .scratch/3-the-writing-base/agents/reviews/2-report.md
```

### 15. Standards 2, citing `docs/dev/building.md` by section

The report names `docs/dev/building.md` by its section "Building and checking Ordo", the block or the paragraphs after it, and names `docs/dev/change-standard.md` by its section "Commands and their filters". It cites no line number of either page in its prose; the line numbers that remain are inside commands (`sed -n 11p`, `sed -n 25,29p`, `sed -n 75p`). `grep -n -i 'building.md.\{0,80\}lines\{0,1\} [0-9]\|change-standard.md.\{0,80\}lines\{0,1\} [0-9]' .scratch/3-the-writing-base/agents/reviews/2-report.md` printed nothing and exited 1.

### 16. Behaviour 1, the before and after of `docs/dev/building.md`

The section "Host-visible changes, before and after" above quotes the paragraph before the first change of the step and the three paragraphs after it in full, and item 14 quotes the paragraph before this round and the three paragraphs after it in full.

### 17. Spec 13, the first run of C10's loop half

The base's loop is the loop part of the sixth command of the block as `git show f241b23:docs/dev/building.md` prints it: `xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh`. It was run with a `printf "kept: %s\n"` in place of the `printf "%s\0"` so that it prints the paths it keeps, on the 17 path strings `.scratch/3-the-writing-base/cases/<draft>/<file>` (draft in `engineering`, `medicine`, `sciences`, `social`; file in `main.tex`, `sections.tex`, `draft.html`, `draft.docx`) and `.scratch/3-the-writing-base/cases/expected.md`, fed as NUL-separated strings from a shell function `paths`. `paths | wc -l` printed `17`.

From the worktree root the base's loop printed nothing (`| wc -l` printed `0`), because none of the 17 files exists in the worktree. In a folder made with `mktemp -d` that holds a copy of the case files at those 17 paths (`cp -R <cases> <folder>/.scratch/3-the-writing-base/cases`, run from that folder), it printed these 17 lines, one for each path, so the base's loop keeps every case file:

```
kept: .scratch/3-the-writing-base/cases/engineering/main.tex
kept: .scratch/3-the-writing-base/cases/engineering/sections.tex
kept: .scratch/3-the-writing-base/cases/engineering/draft.html
kept: .scratch/3-the-writing-base/cases/engineering/draft.docx
kept: .scratch/3-the-writing-base/cases/medicine/main.tex
kept: .scratch/3-the-writing-base/cases/medicine/sections.tex
kept: .scratch/3-the-writing-base/cases/medicine/draft.html
kept: .scratch/3-the-writing-base/cases/medicine/draft.docx
kept: .scratch/3-the-writing-base/cases/sciences/main.tex
kept: .scratch/3-the-writing-base/cases/sciences/sections.tex
kept: .scratch/3-the-writing-base/cases/sciences/draft.html
kept: .scratch/3-the-writing-base/cases/sciences/draft.docx
kept: .scratch/3-the-writing-base/cases/social/main.tex
kept: .scratch/3-the-writing-base/cases/social/sections.tex
kept: .scratch/3-the-writing-base/cases/social/draft.html
kept: .scratch/3-the-writing-base/cases/social/draft.docx
kept: .scratch/3-the-writing-base/cases/expected.md
```

The whole base command over that folder (`find .scratch -type f -print0` in place of `git ls-files -coz`, then the base's loop, then the perl program) printed these lines and then stopped:

```
.scratch/3-the-writing-base/cases/engineering/sections.tex:177: The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match. The gain appears on every host.
.scratch/3-the-writing-base/cases/engineering/sections.tex:179: The growing pool pays for each new thread <en dash> a cost the fixed pool pays once.
.scratch/3-the-writing-base/cases/engineering/sections.tex:203: The report prints the status <left double quotation mark>complete<right double quotation mark> after each run.
.scratch/3-the-writing-base/cases/engineering/sections.tex:205: The harness counts rejected tasks<horizontal ellipsis> and reports the total.
.scratch/3-the-writing-base/cases/engineering/sections.tex:211: Completion order is queue <rightwards arrow> worker.
```

After these five lines of `engineering/sections.tex` (the em dash, the en dash, the curly quotes, the ellipsis character and the arrow character of the ASCII-rule breaks), the command printed two lines of `engineering/draft.docx` (binary data, not text), perl stopped on the `.docx` with its `Malformed UTF-8 character (fatal)` error, and the command exited 1. So on main, with the case files in place, the base's command would report the breaks of the drafts and the binary `.docx` files, and exit non-zero.

The changed command's loop on the same folder (the four-arm `case`, then `[ -e "$f" ]`) printed none of the 17 paths (`| wc -l` printed `0`), and the whole changed command over the folder printed nothing and exited 0. Verify 3 above runs the changed loop on the same 17 path strings from the worktree root and prints none of them.

### The rows of `expected.md` that changed

`expected.md` outside the tables changed in two lines. Counted with `diff` over the text before the `## engineering` heading (`diff` printed these two hunks):

```
15a16
> - A list in a `.docx` prints one paragraph for its introduction and one for each item, the item as a space, its number, a space and its text. In the `.tex` form a list is an `enumerate` environment, one item to a source line.
23d23
< - "D. Structure / Three or more list-shaped items ... Lists are introduced with a colon": the part on the colon has no case, since a `.docx` draft made without a `<ul>` list holds no list. The part on three or more list-shaped items in paragraph form has its cases.
```

The two sentences at the top of the file (`sed -n 3,4p`) are unchanged. The tables held 177 rows before the round and hold 178 now. An `awk` pass that keys each row by draft, rule, break or clean and its order among the rows of that key found 155 rows whose text changed (place, passage, count or expected result), 21 rows unchanged, 2 rows added (the break and the clean row of "D. Structure / Lists are introduced with a colon") and 1 row removed (the second break of "Common style errors / Wordy phrase"). Each changed row follows, before and after, under the draft whose table holds it. A character outside ASCII in a row is written by its name in angle brackets.

#### Rows of engineering

Before:

```
| 0. Hard rules / Em dash: zero | break | sections.tex:167 | paragraph 102 | The fixed pool reduces contention---the main cost of the lock-based queue. | Reported under 0. Hard rules / Em dash: zero. The finding names B. Punctuation / Em dash and dash-as-aside on a line of its own. |
```

After:

```
| 0. Hard rules / Em dash: zero | break | sections.tex:171 | paragraph 104 | The fixed pool reduces contention---the main cost of the lock-based queue. | Reported under 0. Hard rules / Em dash: zero. The finding names B. Punctuation / Em dash and dash-as-aside on a line of its own. |
```

Before:

```
| 0. Hard rules / Em dash: zero | break | sections.tex:169 | paragraph 103 | The growing pool creates threads -- up to 256 of them -- inside the request path. | Reported under 0. Hard rules / Em dash: zero, naming B. Punctuation / Em dash and dash-as-aside. |
```

After:

```
| 0. Hard rules / Em dash: zero | break | sections.tex:173 | paragraph 105 | The growing pool creates threads -- up to 256 of them -- inside the request path. | Reported under 0. Hard rules / Em dash: zero, naming B. Punctuation / Em dash and dash-as-aside. |
```

Before:

```
| 0. Hard rules / Em dash: zero | break | sections.tex:171 | paragraph 104 | The ring buffer is bounded - a full queue rejects new tasks. | Reported under 0. Hard rules / Em dash: zero, naming B. Punctuation / Em dash and dash-as-aside. |
```

After:

```
| 0. Hard rules / Em dash: zero | break | sections.tex:175 | paragraph 106 | The ring buffer is bounded - a full queue rejects new tasks. | Reported under 0. Hard rules / Em dash: zero, naming B. Punctuation / Em dash and dash-as-aside. |
```

Before:

```
| 0. Hard rules / Em dash: zero | break | sections.tex:173 | paragraph 105 | The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match. | Reported under 0. Hard rules / Em dash: zero, naming B. Punctuation / Em dash and dash-as-aside and B. Punctuation / ASCII throughout. |
```

After:

```
| 0. Hard rules / Em dash: zero | break | sections.tex:177 | paragraph 107 | The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match. | Reported under 0. Hard rules / Em dash: zero, naming B. Punctuation / Em dash and dash-as-aside and B. Punctuation / ASCII throughout. |
```

Before:

```
| 0. Hard rules / Em dash: zero | break | sections.tex:175 | paragraph 106 | The growing pool pays for each new thread <en dash> a cost the fixed pool pays once. | Reported under 0. Hard rules / Em dash: zero, naming B. Punctuation / Em dash and dash-as-aside and B. Punctuation / ASCII throughout. |
```

After:

```
| 0. Hard rules / Em dash: zero | break | sections.tex:179 | paragraph 108 | The growing pool pays for each new thread <en dash> a cost the fixed pool pays once. | Reported under 0. Hard rules / Em dash: zero, naming B. Punctuation / Em dash and dash-as-aside and B. Punctuation / ASCII throughout. |
```

Before:

```
| 0. Hard rules / Em dash: zero | clean | sections.tex:177 | paragraph 107 | The lock-free queue and the 64-thread pool share one design goal. | nothing reported |
```

After:

```
| 0. Hard rules / Em dash: zero | clean | sections.tex:181 | paragraph 109 | The lock-free queue and the fixed pool both keep waiting out of the request path. | nothing reported |
```

Before:

```
| B. Punctuation / Em dash and dash-as-aside: zero (see 0) | break | sections.tex:167, 169, 171, 173, 175 | paragraphs 102 to 106 | The five passages of the five rows above. | Each stands once, in the group 0. Hard rules / Em dash: zero, and the finding names this rule. |
```

After:

```
| B. Punctuation / Em dash and dash-as-aside: zero (see 0) | break | sections.tex:171, 173, 175, 177, 179 | paragraphs 104 to 108 | The five passages of the five rows above. | Each stands once, in the group 0. Hard rules / Em dash: zero, and the finding names this rule. |
```

Before:

```
| B. Punctuation / Em dash and dash-as-aside: zero (see 0) | clean | sections.tex:177 | paragraph 107 | The lock-free queue and the 64-thread pool share one design goal. | nothing reported |
```

After:

```
| B. Punctuation / Em dash and dash-as-aside: zero (see 0) | clean | sections.tex:181 | paragraph 109 | The lock-free queue and the fixed pool both keep waiting out of the request path. | nothing reported |
```

Before:

```
| 0. Hard rules / Plain prose only | break | sections.tex:179 | paragraph 108 | A mutex is a turnstile and a ring buffer is an open door. | Reported under 0. Hard rules / Plain prose only. |
```

After:

```
| 0. Hard rules / Plain prose only | break | sections.tex:183 | paragraph 110 | A mutex is a turnstile and a ring buffer is an open door. | Reported under 0. Hard rules / Plain prose only. |
```

Before:

```
| 0. Hard rules / Plain prose only | clean | sections.tex:181 | paragraph 109 | The ring buffer lets producers write at the tail without taking a lock. | nothing reported |
```

After:

```
| 0. Hard rules / Plain prose only | clean | sections.tex:185 | paragraph 111 | A producer claims a slot with one atomic increment of the tail index. A worker frees the slot by advancing the head index. | nothing reported |
```

Before:

```
| 0. Hard rules / No performative asides | break | sections.tex:183 | paragraph 110 | Contention rises with the thread count, which is exactly when a fixed pool pays off. | Reported under 0. Hard rules / No performative asides. |
```

After:

```
| 0. Hard rules / No performative asides | break | sections.tex:187 | paragraph 112 | Contention rises with the thread count, which is exactly when the fixed pool matters. | Reported under 0. Hard rules / No performative asides. |
```

Before:

```
| 0. Hard rules / No performative asides | clean | sections.tex:185 | paragraph 111 | Pinning removes the cache misses that follow a thread from core to core. | nothing reported |
```

After:

```
| 0. Hard rules / No performative asides | clean | sections.tex:189 | paragraph 113 | Pinning removes the cache misses that follow a thread from core to core. | nothing reported |
```

Before:

```
| 0. Hard rules / No dramatic bolded closers | break | sections.tex:246 | not in the `.docx` | \textbf{The pool design is the strongest option for this workload.} | Reported under 0. Hard rules / No dramatic bolded closers, naming F. Emphasis and formatting / Bold on a line of its own. |
```

After:

```
| 0. Hard rules / No dramatic bolded closers | break | sections.tex:270 | not in the `.docx` | \textbf{The fixed pool design is the strongest option for this workload.} | Reported under 0. Hard rules / No dramatic bolded closers, naming F. Emphasis and formatting / Bold and Objectivity / Claims rest on evidence on lines of their own. |
```

Before:

```
| 0. Hard rules / No dramatic bolded closers | clean | sections.tex:248 | not in the `.docx` | Pinning keeps each cache warm and removes cross-core traffic. The measured gain on the fourth host is 27 percent. | nothing reported |
```

After:

```
| 0. Hard rules / No dramatic bolded closers | clean | sections.tex:272 | not in the `.docx` | Workers stay on their cores and keep their caches warm. The measured gain on the fourth host is 27 percent. | nothing reported |
```

Before:

```
| 0. Hard rules / Headings are labels, not sentences | break | sections.tex:225 | not in the `.docx` | \subsection{The pool runs apart from the queue} | Reported under 0. Hard rules / Headings are labels, not sentences. |
```

After:

```
| 0. Hard rules / Headings are labels, not sentences | break | sections.tex:249 | not in the `.docx` | \subsection{The fixed pool runs apart from the queue} | Reported under 0. Hard rules / Headings are labels, not sentences. |
```

Before:

```
| 0. Hard rules / Headings are labels, not sentences | clean | sections.tex:229 | not in the `.docx` | \subsection{Pool Size} | nothing reported |
```

After:

```
| 0. Hard rules / Headings are labels, not sentences | clean | sections.tex:253 | not in the `.docx` | \subsection{Pool Size} | nothing reported |
```

Before:

```
| 0. Hard rules / No repeated construction | break | sections.tex:11, 47, 113, 221 | paragraphs 24, 42, 75, 129 | We chose a ring buffer because it needs no allocation after launch. / We chose an offered load of 500,000 tasks per second because it saturated the growing pool on every host. / We chose an offered load below saturation because latency grows without bound above it. / We chose to report the 99th percentile because it exposes queueing delay. | Reported under 0. Hard rules / No repeated construction: the shape "We chose X because Y" recurs in four sections (Implementation, Throughput Method, Latency Method, Discussion). A report that places it at any of the four is at its place. |
```

After:

```
| 0. Hard rules / No repeated construction | break | sections.tex:11, 47, 117, 225 | paragraphs 24, 42, 77, 131 | We chose a ring buffer because it needed no allocation after launch. / We chose an offered load of 500,000 tasks per second because it saturated the growing pool on every host. / We chose an offered load below saturation because latency grows without bound above it. / We chose to report the 99th percentile because it exposes queueing delay. | Reported under 0. Hard rules / No repeated construction: the shape "We chose X because Y" recurs in four sections (Implementation, Throughput Method, Latency Method, Discussion). A report that places it at any of the four is at its place. |
```

Before:

```
| 0. Hard rules / Arrows (`->`) only inside code and code comments | break | sections.tex:205 | paragraph 121 | Submission order is producer -> queue. | Reported under 0. Hard rules / Arrows (`->`) only inside code and code comments, naming B. Punctuation / ASCII throughout. |
```

After:

```
| 0. Hard rules / Arrows (`->`) only inside code and code comments | break | sections.tex:209 | paragraph 123 | Submission order is producer -> queue. | Reported under 0. Hard rules / Arrows (`->`) only inside code and code comments, naming B. Punctuation / ASCII throughout. |
```

Before:

```
| 0. Hard rules / Arrows (`->`) only inside code and code comments | break | sections.tex:207 | paragraph 122 | Completion order is queue <rightwards arrow> worker. | Reported under 0. Hard rules / Arrows (`->`) only inside code and code comments, naming B. Punctuation / ASCII throughout. |
```

After:

```
| 0. Hard rules / Arrows (`->`) only inside code and code comments | break | sections.tex:211 | paragraph 124 | Completion order is queue <rightwards arrow> worker. | Reported under 0. Hard rules / Arrows (`->`) only inside code and code comments, naming B. Punctuation / ASCII throughout. |
```

Before:

```
| 0. Hard rules / Arrows (`->`) only inside code and code comments | clean | sections.tex:209 | paragraph 123 | A task passes from the queue to a worker. | nothing reported |
```

After:

```
| 0. Hard rules / Arrows (`->`) only inside code and code comments | clean | sections.tex:213 | paragraph 125 | Tasks leave the queue in the order in which they arrived. | nothing reported |
```

Before:

```
| 0. Hard rules / No chatbot framing | break | sections.tex:187 | paragraph 112 | Contact us if further data would help. | Reported under 0. Hard rules / No chatbot framing. |
```

After:

```
| 0. Hard rules / No chatbot framing | break | sections.tex:191 | paragraph 114 | Contact us if further data would help. | Reported under 0. Hard rules / No chatbot framing. |
```

Before:

```
| 0. Hard rules / No chatbot framing | clean | sections.tex:189 | paragraph 113 | The data come from 120 runs per pool. | nothing reported |
```

After:

```
| 0. Hard rules / No chatbot framing | clean | sections.tex:193 | paragraph 115 | The data come from 120 runs per pool. | nothing reported |
```

Before:

```
| A. Vocabulary / Banned as filler | break | sections.tex:191 | paragraph 114 | The fixed pool is a simple change to the scheduler. | Reported under A. Vocabulary / Banned as filler ("simple"). |
```

After:

```
| A. Vocabulary / Banned as filler | break | sections.tex:195 | paragraph 116 | The fixed pool is a simple change to the scheduler. | Reported under A. Vocabulary / Banned as filler ("simple"). |
```

Before:

```
| A. Vocabulary / Vague qualifiers are replaced | break | sections.tex:193 | paragraph 115 | The growing pool is typically idle between bursts. | Reported under A. Vocabulary / Vague qualifiers are replaced ("typically"). |
```

After:

```
| A. Vocabulary / Vague qualifiers are replaced | break | sections.tex:197 | paragraph 117 | The growing pool is typically idle between bursts. | Reported under A. Vocabulary / Vague qualifiers are replaced ("typically"). |
```

Before:

```
| A. Vocabulary / Vague qualifiers are replaced | clean | sections.tex:87 | paragraph 62 | The growing pool created 248 threads during each run. | nothing reported |
```

After:

```
| A. Vocabulary / Vague qualifiers are replaced | clean | sections.tex:91 | paragraph 64 | The growing pool created 248 threads during each run. | nothing reported |
```

Before:

```
| A. Vocabulary / Flagged, not banned | break | sections.tex:195 | paragraph 116 | The fixed pool leverages every core of the host. | Reported under A. Vocabulary / Flagged, not banned ("leverages"), asking for the most precise word and listing no alternative. |
```

After:

```
| A. Vocabulary / Flagged, not banned | break | sections.tex:199 | paragraph 118 | The fixed pool leverages every core of the host. | Reported under A. Vocabulary / Flagged, not banned ("leverages"), asking for the most precise word and listing no alternative. |
```

Before:

```
| A. Vocabulary / Flagged, not banned | clean | sections.tex:197 | paragraph 117 | Each worker owns one core of the host. | nothing reported |
```

After:

```
| A. Vocabulary / Flagged, not banned | clean | sections.tex:201 | paragraph 119 | Workers sleep while the queue is empty. | nothing reported |
```

Before:

```
| B. Punctuation / Semicolons: at most 2 per 1000 words | break | sections.tex:211 | paragraph 124 | The queue is bounded; the pool is fixed; the clock is monotonic. Producers never block; workers never spawn. The harness stops after 60 seconds; it then reports the counts. A full queue rejects a task; the producer retries later. | Reported under B. Punctuation / Semicolons. Count: 5 semicolons in 1933 words (2.59 per 1000), all in this paragraph; the limit for 1933 words is 3. |
```

After:

```
| B. Punctuation / Semicolons: at most 2 per 1000 words | break | sections.tex:215 | paragraph 126 | The queue is bounded; its ring buffer holds 4096 slots; each slot holds one task; no slot holds two; the free slots decide every write. A producer checks the free slots before it writes; a full queue rejects the write; the harness counts each rejection. | Reported under B. Punctuation / Semicolons. Count: 6 semicolons in 2521 words (2.38 per 1000), all in this paragraph; the limit for 2521 words is 5. |
```

Before:

```
| B. Punctuation / Never two or more consecutive paragraphs that each open with a colon and a list | clean | sections.tex:77 | paragraph 57 | The harness recorded two outputs: tasks per second and tail latency. | nothing reported (one such paragraph, followed by a paragraph that opens otherwise). |
```

After:

```
| B. Punctuation / Never two or more consecutive paragraphs that each open with a colon and a list | clean | sections.tex:77 | paragraph 57 | The harness recorded two latency percentiles per run: the median and the 99th. | nothing reported (one such paragraph, followed by a paragraph that opens otherwise). |
```

Before:

```
| B. Punctuation / ASCII throughout | break | sections.tex:199 | paragraph 118 | The queue rejects a task with the status <left double quotation mark>full<right double quotation mark> when no slot is free. | Reported under B. Punctuation / ASCII throughout (curly quotes). |
```

After:

```
| B. Punctuation / ASCII throughout | break | sections.tex:203 | paragraph 120 | The report prints the status <left double quotation mark>complete<right double quotation mark> after each run. | Reported under B. Punctuation / ASCII throughout (curly quotes). |
```

Before:

```
| B. Punctuation / ASCII throughout | break | sections.tex:201 | paragraph 119 | The harness counts rejected tasks<horizontal ellipsis> and reports the total. | Reported under B. Punctuation / ASCII throughout (ellipsis character). |
```

After:

```
| B. Punctuation / ASCII throughout | break | sections.tex:205 | paragraph 121 | The harness counts rejected tasks<horizontal ellipsis> and reports the total. | Reported under B. Punctuation / ASCII throughout (ellipsis character). |
```

Before:

```
| B. Punctuation / ASCII throughout | break | sections.tex:205, 207 | paragraphs 121, 122 | Submission order is producer -> queue. / Completion order is queue <rightwards arrow> worker. | Each stands once, in 0. Hard rules / Arrows, and the finding names this rule. |
```

After:

```
| B. Punctuation / ASCII throughout | break | sections.tex:209, 211 | paragraphs 123, 124 | Submission order is producer -> queue. / Completion order is queue <rightwards arrow> worker. | Each stands once, in 0. Hard rules / Arrows, and the finding names this rule. |
```

Before:

```
| B. Punctuation / ASCII throughout | clean | sections.tex:203 | paragraph 120 | The log line reads "task rejected ... queue full" for each rejected task. | nothing reported (straight quotes, three dots). |
```

After:

```
| B. Punctuation / ASCII throughout | clean | sections.tex:207 | paragraph 122 | The log line reads "task rejected ... queue full" for each rejected task. | nothing reported (straight quotes, three dots). |
```

Before:

```
| C. Throat-clearing and meta-commentary / Delete the opener rather than rewriting it | break | sections.tex:15 | paragraph 26 | When it comes to growth, the growing pool stops at 256 threads. | Reported under C. Throat-clearing and meta-commentary ("When it comes to"). |
```

After:

```
| C. Throat-clearing and meta-commentary / Delete the opener rather than rewriting it | break | sections.tex:15 | paragraph 26 | When it came to growth, the growing pool stopped at 256 threads. | Reported under C. Throat-clearing and meta-commentary ("When it comes to"). |
```

Before:

```
| C. Throat-clearing and meta-commentary / Delete the opener rather than rewriting it | clean | sections.tex:17 | paragraph 27 | The fixed pool never changes its thread count. | nothing reported |
```

After:

```
| C. Throat-clearing and meta-commentary / Delete the opener rather than rewriting it | clean | sections.tex:17 | paragraph 27 | The fixed pool never changed its thread count. | nothing reported |
```

Before:

```
| C. Throat-clearing and meta-commentary / Never describe what the page is about to do | break | sections.tex:131 | paragraph 84 | This section explains how the pool lowers the tail. | Reported under C. Throat-clearing and meta-commentary / Never describe what the page is about to do. |
```

After:

```
| C. Throat-clearing and meta-commentary / Never describe what the page is about to do | break | sections.tex:135 | paragraph 86 | This section explains how the fixed pool lowers the tail. | Reported under C. Throat-clearing and meta-commentary / Never describe what the page is about to do. |
```

Before:

```
| C. Throat-clearing and meta-commentary / Never describe what the page is about to do | clean | sections.tex:133 | paragraph 85 | The growing pool creates threads inside the request path and queues tasks behind them. | nothing reported |
```

After:

```
| C. Throat-clearing and meta-commentary / Never describe what the page is about to do | clean | sections.tex:137 | paragraph 87 | The growing pool creates threads inside the request path and queues tasks behind them. | nothing reported |
```

Before:

```
| C. Throat-clearing and meta-commentary / Never open a paragraph by recapping the prior one | break | sections.tex:37 | paragraph 37 | With this setup complete, the harness submits the first task. | Reported under C. Throat-clearing and meta-commentary / Never open a paragraph by recapping the prior one. |
```

After:

```
| C. Throat-clearing and meta-commentary / Never open a paragraph by recapping the prior one | break | sections.tex:37 | paragraph 37 | With this setup complete, the harness submitted the first task. | Reported under C. Throat-clearing and meta-commentary / Never open a paragraph by recapping the prior one. |
```

Before:

```
| C. Throat-clearing and meta-commentary / Never open a paragraph by recapping the prior one | clean | sections.tex:39 | paragraph 38 | The harness submits the first task after a warm-up. | nothing reported |
```

After:

```
| C. Throat-clearing and meta-commentary / Never open a paragraph by recapping the prior one | clean | sections.tex:39 | paragraph 38 | The first task entered slot 0 of the ring buffer. | nothing reported |
```

Before:

```
| D. Structure / No rule of three | break | sections.tex:155 | paragraph 96 | The pool is small, compact and light. | Reported under D. Structure / No rule of three. |
```

After:

```
| D. Structure / No rule of three | break | sections.tex:159 | paragraph 98 | The fixed pool is small, compact and light. | Reported under D. Structure / No rule of three. |
```

Before:

```
| D. Structure / No rule of three | clean | sections.tex:157 | paragraph 97 | The pool has two parts, the queue and the workers. | nothing reported |
```

After:

```
| D. Structure / No rule of three | clean | sections.tex:161 | paragraph 99 | The harness uses two kinds of thread, the producers and the workers. | nothing reported |
```

Before:

```
| D. Structure / Paragraphs cover one idea and stay under roughly four sentences | break | sections.tex:215 | paragraph 126 | The harness records each task twice. It stamps the submission time on entry. It stamps the completion time on exit. The host also reports memory use once per second. The harness writes the report after the run. A summary file holds the totals. | Reported under D. Structure / Paragraphs cover one idea and stay under roughly four sentences (six sentences, two ideas). |
```

After:

```
| D. Structure / Paragraphs cover one idea and stay under roughly four sentences | break | sections.tex:219 | paragraph 128 | The harness records each task twice. It stamps the submission time on entry. It stamps the completion time on exit. The host also reports memory use once per second. The harness writes the report after the run. A summary file holds the totals. | Reported under D. Structure / Paragraphs cover one idea and stay under roughly four sentences (six sentences, two ideas). |
```

Before:

```
| D. Structure / Vary paragraph length | break | main.tex:15 to 25 | paragraphs 5 to 10 | The six paragraphs of the Introduction, each of two sentences: 32, 29, 30, 31, 28 and 29 words. | Reported under D. Structure / Vary paragraph length. Count: 6 consecutive paragraphs of 2 sentences and 28 to 32 words. A report at any of the six paragraphs is at its place. |
```

After:

```
| D. Structure / Vary paragraph length | break | main.tex:15 to 25 | paragraphs 5 to 10 | The six paragraphs of the Introduction, each of two sentences: 32, 29, 29, 30, 30 and 29 words. | Reported under D. Structure / Vary paragraph length. Count: 6 consecutive paragraphs of 2 sentences and 29 to 32 words; no other run of paragraphs in the draft has the same sentence count and length. A report at any of the six paragraphs is at its place. |
```

Before:

```
| D. Structure / No synonym cycling | break | sections.tex:159 | paragraph 98 | The queue holds tasks. The buffer rejects a task when it is full. The channel feeds the workers. | Reported under D. Structure / No synonym cycling ("queue", "buffer" and "channel" for one thing). |
```

After:

```
| D. Structure / No synonym cycling | break | sections.tex:163 | paragraph 100 | The queue holds tasks. The buffer orders them by arrival. The channel feeds the workers. | Reported under D. Structure / No synonym cycling ("queue", "buffer" and "channel" for one thing). |
```

Before:

```
| D. Structure / No synonym cycling | clean | sections.tex:161 | paragraph 99 | The pool holds workers. The pool starts them at launch. The pool never adds another. | nothing reported |
```

After:

```
| D. Structure / No synonym cycling | clean | sections.tex:165 | paragraph 101 | The fixed pool holds 64 workers. The fixed pool starts them at launch. The fixed pool never adds another. | nothing reported |
```

Before:

```
| D. Structure / Binary contrast ("not X, Y") at most twice per page | break | sections.tex:213 | paragraph 125 | The cause is contention, not thread count. The limit applies to threads, not to tasks. The pool needs pinning, not a larger queue. | Reported under D. Structure / Binary contrast. Count: 3 binary contrasts in the draft (a page is the draft as a whole), all in this paragraph; the limit is 2. |
```

After:

```
| D. Structure / Binary contrast ("not X, Y") at most twice per page | break | sections.tex:217 | paragraph 127 | The fixed pool has a constant thread count, not a variable one. It pins each worker to a core, not to a socket. It places the queue on core 8, not on a worker core. | Reported under D. Structure / Binary contrast. Count: 3 binary contrasts in the draft (a page is the draft as a whole), all in this paragraph; the limit is 2. |
```

Before:

```
| D. Structure / No mirror structure | break | main.tex:27 and 35 | paragraphs 11 and 15 | The sections "Lock-Based Queues" (main.tex:27 to 33) and "Lock-Free Queues" (main.tex:35 to 41): three paragraphs each, in the same order of design with its measured cost, advantage and cost. | Reported under D. Structure / No mirror structure. A report at either heading or at any paragraph of the two sections is at its place. |
```

After:

```
| D. Structure / No mirror structure | break | main.tex:27 and 35 | paragraphs 11 and 15 | The sections "Lock-Based Queues" (main.tex:27 to 33) and "Lock-Free Queues" (main.tex:35 to 41): three paragraphs each, in the same order of design with its measured cost, a property with a citation, and a cost that ends on the gap. | Reported under D. Structure / No mirror structure. A report at either heading or at any paragraph of the two sections is at its place. |
```

Before:

```
| D. Structure / Three or more list-shaped items in paragraph form become a list | break | sections.tex:163 | paragraph 100 | The log holds the run number, the host name, the pool type and the elapsed time. | Reported under D. Structure / Three or more list-shaped items in paragraph form become a list (four items). |
```

After:

```
| D. Structure / Three or more list-shaped items in paragraph form become a list | break | sections.tex:167 | paragraph 102 | The log holds the run number, the host name, the pool type and the elapsed time. | Reported under D. Structure / Three or more list-shaped items in paragraph form become a list (four items). |
```

Before:

```
| D. Structure / Three or more list-shaped items in paragraph form become a list | clean | sections.tex:165 | paragraph 101 | The harness varies the thread count and the queue depth. | nothing reported (two items). |
```

After:

```
| D. Structure / Three or more list-shaped items in paragraph form become a list | clean | sections.tex:169 | paragraph 103 | The harness varies the thread count and the queue depth. | nothing reported (two items). |
```

Added:

```
| D. Structure / Lists are introduced with a colon | break | sections.tex:229 to 236 | paragraphs 133 to 137 | The harness writes four result files. (followed by an enumerate list of four items) | Reported under D. Structure / Lists are introduced with a colon (the sentence that introduces the list ends in a full stop). A report at the introducing paragraph or at any item is at its place. |
```

Added:

```
| D. Structure / Lists are introduced with a colon | clean | sections.tex:240 to 247 | paragraphs 139 to 143 | The summary file holds four totals: (followed by an enumerate list of four items) | nothing reported |
```

Before:

```
| E. Sentence shapes / Spec-sheet voice | break | sections.tex:147 | paragraph 92 | The queue provides bounded submission and is configurable. | Reported under E. Sentence shapes / Spec-sheet voice. |
```

After:

```
| E. Sentence shapes / Spec-sheet voice | break | sections.tex:151 | paragraph 94 | The queue provides bounded submission and is configurable. | Reported under E. Sentence shapes / Spec-sheet voice. |
```

Before:

```
| E. Sentence shapes / Spec-sheet voice | clean | sections.tex:149 | paragraph 93 | The queue rejects a task when no slot is free. | nothing reported |
```

After:

```
| E. Sentence shapes / Spec-sheet voice | clean | sections.tex:153 | paragraph 95 | The queue rejects a task when no slot is free. The producer receives an error code and moves on to its next task. | nothing reported |
```

Before:

```
| E. Sentence shapes / Stop-start fragments | break | sections.tex:143 | paragraph 90 | The growing pool creates threads on demand. Static in the fixed pool. | Reported under E. Sentence shapes / Stop-start fragments. |
```

After:

```
| E. Sentence shapes / Stop-start fragments | break | sections.tex:147 | paragraph 92 | The growing pool creates threads on demand. Static in the fixed pool. | Reported under E. Sentence shapes / Stop-start fragments. |
```

Before:

```
| E. Sentence shapes / Stop-start fragments | clean | sections.tex:145 | paragraph 91 | The fixed pool allocates all 64 threads at launch, which removes thread creation from the request path. | nothing reported |
```

After:

```
| E. Sentence shapes / Stop-start fragments | clean | sections.tex:149 | paragraph 93 | The fixed pool allocates all 64 threads at launch, which removes thread creation from the request path. | nothing reported |
```

Before:

```
| E. Sentence shapes / Cold opens | break | sections.tex:135 | paragraph 86 | This raises the tail. | Reported under E. Sentence shapes / Cold opens: "This" follows a paragraph whose last sentence names two things (thread creation and queueing). |
```

After:

```
| E. Sentence shapes / Cold opens | break | sections.tex:139 | paragraph 88 | This raises the tail. | Reported under E. Sentence shapes / Cold opens: "This" follows a paragraph whose last sentence names two things (thread creation and queueing). |
```

Before:

```
| E. Sentence shapes / Cold opens | clean | sections.tex:137 | paragraph 87 | Thread creation raises the tail because each creation blocks the producer. | nothing reported |
```

After:

```
| E. Sentence shapes / Cold opens | clean | sections.tex:141 | paragraph 89 | Thread creation may raise the tail because each creation blocks the producer. | nothing reported |
```

Before:

```
| E. Sentence shapes / Restating closes | break | sections.tex:141 | paragraph 89 | In short, pinned workers keep their caches. | Reported under E. Sentence shapes / Restating closes (the final sentence says the paragraph again in shorter words). |
```

After:

```
| E. Sentence shapes / Restating closes | break | sections.tex:145 | paragraph 91 | In short, pinned workers keep their caches. | Reported under E. Sentence shapes / Restating closes (the final sentence says the paragraph again in shorter words). |
```

Before:

```
| E. Sentence shapes / Restating closes | clean | sections.tex:133 | paragraph 85 | The growing pool creates threads inside the request path and queues tasks behind them. | nothing reported |
```

After:

```
| E. Sentence shapes / Restating closes | clean | sections.tex:137 | paragraph 87 | The growing pool creates threads inside the request path and queues tasks behind them. | nothing reported |
```

Before:

```
| E. Sentence shapes / Personified artifacts | break | sections.tex:139 | paragraph 88 | The cache is happy when a worker stays on one core. | Reported under E. Sentence shapes / Personified artifacts. |
```

After:

```
| E. Sentence shapes / Personified artifacts | break | sections.tex:143 | paragraph 90 | The cache is happy when a worker stays on one core. | Reported under E. Sentence shapes / Personified artifacts. |
```

Before:

```
| E. Sentence shapes / Personified artifacts | clean | sections.tex:41 | paragraph 39 | The worker runs the task to completion. | nothing reported ("worker" is the draft's defined vocabulary). |
```

After:

```
| E. Sentence shapes / Personified artifacts | clean | sections.tex:41 | paragraph 39 | A worker ran each task to completion. | nothing reported ("worker" is the draft's defined vocabulary). |
```

Before:

```
| E. Sentence shapes / Rhetorical questions | break | sections.tex:151 | paragraph 94 | Why does the queue reject tasks? | Reported under E. Sentence shapes / Rhetorical questions. |
```

After:

```
| E. Sentence shapes / Rhetorical questions | break | sections.tex:155 | paragraph 96 | What does the harness log? | Reported under E. Sentence shapes / Rhetorical questions. |
```

Before:

```
| E. Sentence shapes / Rhetorical questions | clean | main.tex:19 | paragraph 7 | Does a fixed pool lower the 99th percentile latency of a bounded queue? | nothing reported (the question the study answers as its subject). |
```

After:

```
| E. Sentence shapes / Rhetorical questions | clean | sections.tex:131 | paragraph 84 | Why does a fixed pool lower the tail latency? | nothing reported (the question the Discussion answers as its subject). |
```

Before:

```
| E. Sentence shapes / Passive voice | break | sections.tex:153 | paragraph 95 | Overflow tasks are rejected by the queue. | Reported under E. Sentence shapes / Passive voice. |
```

After:

```
| E. Sentence shapes / Passive voice | break | sections.tex:157 | paragraph 97 | The summary file is written by the harness. | Reported under E. Sentence shapes / Passive voice. |
```

Before:

```
| E. Sentence shapes / Sentence length | break | sections.tex:91 | paragraph 64 | The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced. | Reported under E. Sentence shapes / Sentence length (30 words). |
```

After:

```
| E. Sentence shapes / Sentence length | break | sections.tex:95 | paragraph 66 | The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced. | Reported under E. Sentence shapes / Sentence length (30 words). |
```

Before:

```
| E. Sentence shapes / Sentence length | clean | sections.tex:89 | paragraph 63 | The gain ranged from 22 percent on the first host to 27 percent on the fourth host. | nothing reported (17 words). |
```

After:

```
| E. Sentence shapes / Sentence length | clean | sections.tex:93 | paragraph 65 | The gain ranged from 22 percent on the first host to 27 percent on the fourth host. | nothing reported (17 words). |
```

Before:

```
| E. Sentence shapes / Sentence length (five or more consecutive sentences of the same length) | break | sections.tex:93, 95 | paragraphs 65, 66 | Host one completed 380,000 tasks per second. Host two completed 405,000 tasks per second. Host three completed 421,000 tasks per second. Host four completed 442,000 tasks per second. Their mean was 412,000 tasks per second. | Reported under E. Sentence shapes / Sentence length. Count: 5 consecutive sentences of 7 words each, in two adjacent paragraphs of 3 and 2 sentences. A report at either paragraph is at its place. |
```

After:

```
| E. Sentence shapes / Sentence length (five or more consecutive sentences of the same length) | break | sections.tex:81, 83 | paragraphs 59, 60 | The harness started all eight producers together. The queue filled within the first second. The workers then began to take tasks. A timer started with the first task. The timer stopped after the 60th second. | Reported under E. Sentence shapes / Sentence length. Count: 5 consecutive sentences of 7 words each, in two adjacent paragraphs of 3 and 2 sentences. A report at either paragraph is at its place. |
```

Before:

```
| F. Emphasis and formatting / Bold | break | sections.tex:233 | not in the `.docx` | The second result is \textbf{surprising} for a design this small. | Reported under F. Emphasis and formatting / Bold (bold reached for tone). |
```

After:

```
| F. Emphasis and formatting / Bold | break | sections.tex:257 | not in the `.docx` | The gain on the second host is \textbf{surprising} for a design this small. | Reported under F. Emphasis and formatting / Bold (bold reached for tone). |
```

Before:

```
| F. Emphasis and formatting / Bold | clean | sections.tex:235 | not in the `.docx` | \textbf{Warning:} the pool size must not exceed the core count of the host. | nothing reported (bold for a warning). |
```

After:

```
| F. Emphasis and formatting / Bold | clean | sections.tex:259 | not in the `.docx` | \textbf{Warning:} the queue depth must be a power of two. | nothing reported (bold for a warning). |
```

Before:

```
| F. Emphasis and formatting / No ALL-CAPS emphasis in prose | break | sections.tex:223 | paragraph 130 | The fixed pool leads on ALL four hosts. | Reported under F. Emphasis and formatting / No ALL-CAPS emphasis in prose. |
```

After:

```
| F. Emphasis and formatting / No ALL-CAPS emphasis in prose | break | sections.tex:227 | paragraph 132 | The fixed pool leads on ALL four hosts. | Reported under F. Emphasis and formatting / No ALL-CAPS emphasis in prose. |
```

Before:

```
| F. Emphasis and formatting / Inline code for paths | break | sections.tex:237 | not in the `.docx` | The harness reads its settings from configs/pool.yaml. | Reported under F. Emphasis and formatting / Inline code for paths, identifiers, literals (the path is not in monospace). |
```

After:

```
| F. Emphasis and formatting / Inline code for paths | break | sections.tex:261 | not in the `.docx` | The harness reads its pool settings from configs/pool.yaml. | Reported under F. Emphasis and formatting / Inline code for paths, identifiers, literals (the path is not in monospace). |
```

Before:

```
| F. Emphasis and formatting / Inline code for paths | clean | sections.tex:239 | not in the `.docx` | The harness writes its results to \texttt{results/run.csv}. | nothing reported |
```

After:

```
| F. Emphasis and formatting / Inline code for paths | clean | sections.tex:263 | not in the `.docx` | The harness writes its results to \texttt{results/run.csv}. | nothing reported |
```

Before:

```
| F. Emphasis and formatting / Source formatting: one paragraph or bullet per source line | break | sections.tex:241 to 242 | not in the `.docx` | The harness writes one summary file per run and (line 241) / stores the file beside the raw samples. (line 242) | Reported under F. Emphasis and formatting / Source formatting (a paragraph hard-wrapped over two source lines). |
```

After:

```
| F. Emphasis and formatting / Source formatting: one paragraph or bullet per source line | break | sections.tex:265 to 266 | not in the `.docx` | The harness writes one summary file per run and (line 265) / names the file after the run number. (line 266) | Reported under F. Emphasis and formatting / Source formatting (a paragraph hard-wrapped over two source lines). |
```

Before:

```
| F. Emphasis and formatting / Source formatting: one paragraph or bullet per source line | clean | sections.tex:244 | not in the `.docx` | The summary file lists the totals for each run, and the raw samples stay in a separate folder for later analysis. | nothing reported |
```

After:

```
| F. Emphasis and formatting / Source formatting: one paragraph or bullet per source line | clean | sections.tex:268 | not in the `.docx` | The summary file lists the totals for each run, and the raw samples stay in a separate folder for later analysis. | nothing reported |
```

Before:

```
| Precision / Most specific term | break | sections.tex:19 | paragraph 28 | The benchmark runs on a modern server. | Reported under Precision / Most specific term, naming Engineering and CS / Terminology on a line of its own. |
```

After:

```
| Precision / Most specific term | break | sections.tex:19 | paragraph 28 | The benchmark ran on a modern server. | Reported under Precision / Most specific term, naming Engineering and CS / Terminology on a line of its own. |
```

Before:

```
| Precision / Most specific term | clean | main.tex:23 | paragraph 9 | The four hosts have 16, 24, 32 and 48 cores. | nothing reported |
```

After:

```
| Precision / Most specific term | clean | main.tex:23 | paragraph 9 | The four hosts have 96, 128, 160 and 192 cores, split over two sockets in each host. | nothing reported |
```

Before:

```
| Precision / Term defined at first use | break | sections.tex:7 | paragraph 22 | Each worker is pinned to one core within its NUMA node. | Reported under Precision / Term defined at first use ("NUMA", never defined). |
```

After:

```
| Precision / Term defined at first use | break | sections.tex:7 | paragraph 22 | Each worker was pinned to one core within its NUMA node. | Reported under Precision / Term defined at first use ("NUMA", never defined). |
```

Before:

```
| Precision / Pronoun with a clear antecedent | break | sections.tex:21 | paragraph 29 | The scheduler hands each task to a worker, and it fails when the queue is full. | Reported under Precision / Pronoun with a clear antecedent ("it": the scheduler, the worker or the task). |
```

After:

```
| Precision / Pronoun with a clear antecedent | break | sections.tex:21 | paragraph 29 | The scheduler passed the task to a worker when it was ready. | Reported under Precision / Pronoun with a clear antecedent ("it": the task or the worker). |
```

Before:

```
| Precision / Pronoun with a clear antecedent | clean | sections.tex:23 | paragraph 30 | A worker returns its slot to the queue when the task ends. | nothing reported |
```

After:

```
| Precision / Pronoun with a clear antecedent | clean | sections.tex:23 | paragraph 30 | A worker returned its slot to the queue when the task ended. | nothing reported |
```

Before:

```
| Concision / One idea per sentence | break | sections.tex:25 | paragraph 31 | The harness is written in C, and the third host was installed in 2021. | Reported under Concision / One idea per sentence. |
```

After:

```
| Concision / One idea per sentence | break | sections.tex:25 | paragraph 31 | The harness was written in C, and the third host was installed in 2021. | Reported under Concision / One idea per sentence. |
```

Before:

```
| Concision / One idea per sentence | clean | sections.tex:27 | paragraph 32 | The harness submits tasks from eight producer threads that each run on a separate core. | nothing reported |
```

After:

```
| Concision / One idea per sentence | clean | sections.tex:27 | paragraph 32 | The harness submitted tasks from eight producer threads that each ran on a separate core. | nothing reported |
```

Before:

```
| Objectivity / Claims rest on evidence | break | sections.tex:219 | paragraph 128 | We believe the fixed pool is the better design. | Reported under Objectivity / Claims rest on evidence, naming Paragraphs / Claim with evidence or citation on a line of its own. |
```

After:

```
| Objectivity / Claims rest on evidence | break | sections.tex:223 | paragraph 130 | We believe the fixed pool is the better design. | Reported under Objectivity / Claims rest on evidence, naming Paragraphs / Claim with evidence or citation on a line of its own. |
```

Before:

```
| Objectivity / Claims rest on evidence | clean | sections.tex:85 | paragraph 61 | The fixed pool completed 412,000 tasks per second and the growing pool completed 331,000. | nothing reported |
```

After:

```
| Objectivity / Claims rest on evidence | clean | sections.tex:89 | paragraph 63 | The fixed pool completed 412,000 tasks per second and the growing pool completed 331,000. | nothing reported |
```

Before:

```
| Objectivity / Limitations and alternative interpretations | break | sections.tex:125 | paragraph 81 | Discussion (the heading) | Reported under Objectivity / Limitations and alternative interpretations: the draft states two limitations (sections.tex:55 and 115) and no sentence acknowledges an alternative interpretation of the results (0 such sentences). A report that places it at the Discussion heading or at any paragraph of that section is at its place. |
```

After:

```
| Objectivity / Limitations and alternative interpretations | break | sections.tex:129 | paragraph 83 | Discussion (the heading) | Reported under Objectivity / Limitations and alternative interpretations: the draft states limitations (sections.tex:55 and 119) and no sentence acknowledges an alternative interpretation of the results (0 such sentences). A report that places it at the Discussion heading or at any paragraph of that section is at its place. |
```

Before:

```
| Formality / Full forms | clean | sections.tex:65 | paragraph 51 | The pool did not change size during a run. | nothing reported |
```

After:

```
| Formality / Full forms | clean | sections.tex:65 | paragraph 51 | The growing pool did not remove a thread after a burst. | nothing reported |
```

Before:

```
| Formality / No colloquial words | break | sections.tex:13 | paragraph 25 | The scheduler bails out when the queue is full. | Reported under Formality / No colloquial words ("bails out"), naming Engineering and CS / Register on a line of its own. |
```

After:

```
| Formality / No colloquial words | break | sections.tex:13 | paragraph 25 | The scheduler bailed out when the queue was full. | Reported under Formality / No colloquial words ("bailed out"), naming Engineering and CS / Register on a line of its own. |
```

Before:

```
| Formality / No colloquial words | clean | sections.tex:17 | paragraph 27 | The fixed pool never changes its thread count. | nothing reported |
```

After:

```
| Formality / No colloquial words | clean | sections.tex:17 | paragraph 27 | The fixed pool never changed its thread count. | nothing reported |
```

Before:

```
| Hedging / Hedge where a claim is uncertain | break | sections.tex:129 | paragraph 83 | Hosts with more cores show larger gains, so core count raises the benefit of a fixed pool. | Reported under Hedging / Hedge where a claim is uncertain (a causal claim from correlational data, stated without a hedge). |
```

After:

```
| Hedging / Hedge where a claim is uncertain | break | sections.tex:133 | paragraph 85 | Hosts with more cores show larger gains, so core count raises the benefit of a fixed pool. | Reported under Hedging / Hedge where a claim is uncertain (a causal claim from correlational data, stated without a hedge). |
```

Before:

```
| Hedging / Hedge where a claim is uncertain | clean | sections.tex:127 | paragraph 82 | The results suggest that a fixed pool lowers tail latency by removing thread creation from the request path. | nothing reported |
```

After:

```
| Hedging / Hedge where a claim is uncertain | clean | sections.tex:131 | paragraph 84 | The results suggest that a fixed pool lowers tail latency by removing thread creation from the request path. | nothing reported |
```

Before:

```
| Transitions / Transition that states the relation | break | sections.tex:99 | paragraph 68 | The fixed pool created 64 threads. Therefore, the growing pool created 248 threads. | Reported under Transitions / Transition that states the relation ("Therefore" states a cause the two sentences do not have). |
```

After:

```
| Transitions / Transition that states the relation | break | sections.tex:101 | paragraph 69 | The fixed pool created 64 threads. Consequently, the growing pool created 248 threads. | Reported under Transitions / Transition that states the relation ("Consequently" states a cause the two sentences do not have). |
```

Before:

```
| Transitions / Transition that states the relation | clean | sections.tex:87 | paragraph 62 | The growing pool created 248 threads during each run. Therefore, it spent 6 percent of each run creating them. | nothing reported |
```

After:

```
| Transitions / Transition that states the relation | clean | sections.tex:91 | paragraph 64 | The growing pool created 248 threads during each run. Creating them therefore took 6 percent of each run. | nothing reported |
```

Before:

```
| Paragraphs / Claim with evidence or citation | break | sections.tex:101 | paragraph 69 | The fixed pool used less memory than the growing pool. The harness sampled memory once per second. | Reported under Paragraphs / Claim with evidence or citation (the claim is followed by no data). |
```

After:

```
| Paragraphs / Claim with evidence or citation | break | sections.tex:103 | paragraph 70 | The fixed pool used less memory than the growing pool. The harness sampled memory once per second. | Reported under Paragraphs / Claim with evidence or citation (the claim is followed by no data). |
```

Before:

```
| Paragraphs / Claim with evidence or citation | clean | sections.tex:85 | paragraph 61 | The fixed pool completed 412,000 tasks per second and the growing pool completed 331,000. The difference is 24 percent of the growing pool's rate. | nothing reported |
```

After:

```
| Paragraphs / Claim with evidence or citation | clean | sections.tex:89 | paragraph 63 | The fixed pool completed 412,000 tasks per second and the growing pool completed 331,000. The difference was 24 percent of the growing pool's rate. | nothing reported |
```

Before:

```
| Paragraphs / Evidence followed by what it means | break | sections.tex:97 | paragraph 67 | The growing pool was idle for 38 percent of each run. The fixed pool was idle for 4 percent. | Reported under Paragraphs / Evidence followed by what it means. |
```

After:

```
| Paragraphs / Evidence followed by what it means | break | sections.tex:99 | paragraph 68 | The growing pool was idle for 38 percent of each run. The fixed pool was idle for 4 percent. | Reported under Paragraphs / Evidence followed by what it means. |
```

Before:

```
| Paragraphs / Evidence followed by what it means | clean | sections.tex:87 | paragraph 62 | The growing pool created 248 threads during each run. Therefore, it spent 6 percent of each run creating them. | nothing reported |
```

After:

```
| Paragraphs / Evidence followed by what it means | clean | sections.tex:89 | paragraph 63 | The fixed pool completed 412,000 tasks per second and the growing pool completed 331,000. The difference was 24 percent of the growing pool's rate. Both pools served the same load on the same hosts, so the difference measured the effect of the pool policy. | nothing reported (the last sentence says what the figures mean for the paragraph's claim). |
```

Before:

```
| Common style errors / Wordy phrase | break | sections.tex:29 | paragraph 33 | Due to the fact that all workers share one queue, the head index is atomic. | Reported under Common style errors / Wordy phrase ("Due to the fact that"). |
```

After:

```
| Common style errors / Wordy phrase | break | sections.tex:29 | paragraph 33 | Due to the fact that all workers shared one queue, the head index was atomic. | Reported under Common style errors / Wordy phrase ("Due to the fact that"). |
```

Before:

```
| Common style errors / Wordy phrase | clean | sections.tex:69 | paragraph 53 | Because the cache state differed between runs, we randomized the run order. | nothing reported |
```

After:

```
| Common style errors / Wordy phrase | clean | sections.tex:69 | paragraph 53 | The run order was randomized because the cache state differed between runs. | nothing reported |
```

Before:

```
| Common style errors / Vague phrase | break | sections.tex:31 | paragraph 34 | In recent years, hosts have gained cores, so the pool sizes of this study start at 8 and 64 threads. | Reported under Common style errors / Vague phrase ("In recent years"). |
```

After:

```
| Common style errors / Vague phrase | break | sections.tex:31 | paragraph 34 | In recent years, hosts gained cores, so the pool sizes of this study started at 8 and 64 threads. | Reported under Common style errors / Vague phrase ("In recent years"). |
```

Before:

```
| Common style errors / Tense per section | break | sections.tex:250 | paragraph 131 | Conclusion (the heading; the section is written in the past tense) | Reported under Common style errors / Tense per section: the Conclusion row asks for the present or the future. |
```

After:

```
| Common style errors / Tense per section | break | sections.tex:274 | paragraph 146 | Conclusion (the heading; the section is written in the past tense) | Reported under Common style errors / Tense per section: the Conclusion row asks for the present or the future. |
```

Before:

```
| Common style errors / Tense per section | clean | sections.tex:43, 83 and 125 | paragraphs 40, 60 and 81 | Throughput Method (past tense), Throughput Results (past tense) and Discussion (present tense) | nothing reported |
```

After:

```
| Common style errors / Tense per section | clean | sections.tex:43, 87 and 129 | paragraphs 40, 62 and 83 | Throughput Method (past tense), Throughput Results (past tense) and Discussion (present tense) | nothing reported |
```

Before:

```
| Reader's path / Clarity test | break | sections.tex:217 | paragraph 127 | A queue holds tasks until a worker is free. Servers use queues for that purpose. | Reported under Reader's path / Clarity test (removing the paragraph loses nothing). |
```

After:

```
| Reader's path / Clarity test | break | sections.tex:221 | paragraph 129 | A queue holds tasks until a worker is free. Servers use queues for that purpose. | Reported under Reader's path / Clarity test (removing the paragraph loses nothing). |
```

Before:

```
| Reader's path / Clarity test | clean | sections.tex:111 | paragraph 74 | We computed the 99th percentile over all tasks of a run. | nothing reported |
```

After:

```
| Reader's path / Clarity test | clean | sections.tex:113 | paragraph 75 | The percentile was computed over the pooled latencies of all runs of a pool. | nothing reported |
```

Before:

```
| Reader's path / So what per section | break | sections.tex:117 | paragraph 77 | Latency Results (the heading; the section opens with "A statistical test compared the two latency distributions and gave p below 0.001.") | Reported under Reader's path / So what per section: the Results row asks the section to lead with the result, not the statistical test. |
```

After:

```
| Reader's path / So what per section | break | sections.tex:121 | paragraph 79 | Latency Results (the heading; the section opens with "A Mann-Whitney U test compared the two latency distributions and gave p below 0.001.") | Reported under Reader's path / So what per section: the Results row asks the section to lead with the result, not the statistical test. |
```

Before:

```
| Reader's path / So what per section | clean | sections.tex:83 | paragraph 60 | Throughput Results (the heading; the section opens with the result) | nothing reported |
```

After:

```
| Reader's path / So what per section | clean | sections.tex:87 | paragraph 62 | Throughput Results (the heading; the section opens with the result) | nothing reported |
```

Before:

```
| Engineering and CS / Register | break | sections.tex:13 | paragraph 25 | The scheduler bails out when the queue is full. | Stands once, in Formality / No colloquial words; the finding names this rule. |
```

After:

```
| Engineering and CS / Register | break | sections.tex:13 | paragraph 25 | The scheduler bailed out when the queue was full. | Stands once, in Formality / No colloquial words; the finding names this rule. |
```

Before:

```
| Engineering and CS / Register | clean | sections.tex:3 | paragraph 20 | The queue is a ring buffer with 4096 slots. Producers write at the tail index and workers read at the head index. | nothing reported |
```

After:

```
| Engineering and CS / Register | clean | sections.tex:3 | paragraph 20 | The queue was a ring buffer with 4096 slots. Producers wrote at the tail index and workers read at the head index. | nothing reported |
```

Before:

```
| Engineering and CS / Terminology | break | sections.tex:19 | paragraph 28 | The benchmark runs on a modern server. | Stands once, in Precision / Most specific term; the finding names this rule. |
```

After:

```
| Engineering and CS / Terminology | break | sections.tex:19 | paragraph 28 | The benchmark ran on a modern server. | Stands once, in Precision / Most specific term; the finding names this rule. |
```

Before:

```
| Engineering and CS / Voice | break | sections.tex:73 | paragraph 55 | The authors chose a warm-up of 10 seconds. | Reported under Engineering and CS / Voice (the authors refer to themselves in the third person). |
```

After:

```
| Engineering and CS / Voice | break | sections.tex:73 | paragraph 55 | The authors chose 42 as the random seed. | Reported under Engineering and CS / Voice (the authors refer to themselves in the third person). |
```

Before:

```
| Engineering and CS / Voice | clean | sections.tex:75 | paragraph 56 | We implemented the producers in C. | nothing reported |
```

After:

```
| Engineering and CS / Voice | clean | sections.tex:75 | paragraph 56 | We kept the producers identical for both pools. | nothing reported (a decision with "we"). |
```

Before:

```
| Engineering and CS / What the reader looks for | break | sections.tex:105 | paragraph 71 | Latency Method (the heading) | Reported under Engineering and CS / What the reader looks for: the section gives no host, software version, offered load, run length, repetition count or seed. |
```

After:

```
| Engineering and CS / What the reader looks for | break | sections.tex:107 | paragraph 72 | Latency Method (the heading) | Reported under Engineering and CS / What the reader looks for: the section gives no host, software version, offered load figure, run length, repetition count or seed. |
```


#### Rows of medicine

Before:

```
| Medicine and Health / Register | break | sections.tex:9 | paragraph 30 | The team ran into snags with the ethics forms. | Stands once, in Formality / No colloquial words; the finding names this rule. |
```

After:

```
| Medicine and Health / Register | break | sections.tex:7 | paragraph 26 | Obtaining ethics approval was a hassle that lasted four months. | Stands once, in Formality / No colloquial words; the finding names this rule. |
```

Before:

```
| Formality / No colloquial words | break | sections.tex:9 | paragraph 30 | The team ran into snags with the ethics forms. | Reported under Formality / No colloquial words ("ran into snags"), naming Medicine and Health / Register on a line of its own. |
```

After:

```
| Formality / No colloquial words | break | sections.tex:7 | paragraph 26 | Obtaining ethics approval was a hassle that lasted four months. | Reported under Formality / No colloquial words ("a hassle"), naming Medicine and Health / Register on a line of its own. |
```

Before:

```
| Medicine and Health / Register | clean | main.tex:43 | paragraph 19 | Early mobilization reduced 30-day readmission from 25 percent to 15 percent. | nothing reported |
```

After:

```
| Medicine and Health / Register | clean | main.tex:41 | paragraph 18 | Early mobilization reduced 30-day readmission from 25 percent to 15 percent. | nothing reported |
```

Before:

```
| Medicine and Health / Terminology | break | main.tex:47 | paragraph 21 | Two patients had a heart attack within 30 days. | Stands once, in Precision / Most specific term; the finding names this rule. |
```

After:

```
| Medicine and Health / Terminology | break | main.tex:45 | paragraph 20 | By 30 days, a heart attack had occurred in two patients, both in the usual care group. | Stands once, in Precision / Most specific term; the finding names this rule. |
```

Before:

```
| Precision / Most specific term | break | main.tex:47 | paragraph 21 | Two patients had a heart attack within 30 days. | Reported under Precision / Most specific term ("heart attack" for myocardial infarction), naming Medicine and Health / Terminology on a line of its own. |
```

After:

```
| Precision / Most specific term | break | main.tex:45 | paragraph 20 | By 30 days, a heart attack had occurred in two patients, both in the usual care group. | Reported under Precision / Most specific term ("heart attack" for myocardial infarction), naming Medicine and Health / Terminology on a line of its own. |
```

Before:

```
| Medicine and Health / Terminology | clean | sections.tex:21 | paragraph 36 | Three patients had a deep vein thrombosis within 30 days. | nothing reported |
```

After:

```
| Medicine and Health / Terminology | clean | sections.tex:17 | paragraph 31 | Three cases of deep vein thrombosis were recorded in the cohort, a rate of 1 percent. | nothing reported |
```

Before:

```
| Medicine and Health / Voice | clean | main.tex:25 | paragraph 10 | We randomized 480 patients aged 65 years or older to early or usual mobilization. Allocation was concealed in sealed envelopes. | nothing reported (a decision with "we", a procedure in the passive). |
```

After:

```
| Medicine and Health / Voice | clean | main.tex:25 | paragraph 10 | We defined early mobilization as standing with a physiotherapist within 24 hours of surgery. | nothing reported (a decision with "we"). |
```

Before:

```
| Medicine and Health / What the reader looks for | break | sections.tex:1 | paragraph 26 | Cohort Methods (the heading) | Reported under Medicine and Health / What the reader looks for: neither the Cohort Methods nor the Cohort Results names a reporting guideline. |
```

After:

```
| Medicine and Health / What the reader looks for | break | sections.tex:1 | paragraph 23 | Cohort Methods (the heading) | Reported under Medicine and Health / What the reader looks for: neither the Cohort Methods nor the Cohort Results names a reporting guideline. |
```

Before:

```
| Medicine and Health / What the reader looks for | clean | main.tex:21 | paragraph 8 | Trial Methods (the heading; main.tex:27 names the CONSORT guideline) | nothing reported |
```

After:

```
| Medicine and Health / What the reader looks for | clean | main.tex:19 | paragraph 7 | Trial Methods (the heading; main.tex:27 names the CONSORT guideline) | nothing reported |
```

Before:

```
| B. Punctuation / Semicolons: at most 2 per 1000 words | clean | sections.tex:33 | paragraph 42 | The trial is randomized; the cohort is observational. | nothing reported. Count: 1 semicolon in 655 words (1.53 per 1000). |
```

After:

```
| B. Punctuation / Semicolons: at most 2 per 1000 words | clean | sections.tex:29 | paragraph 37 | The trial is randomized; the cohort is observational. | nothing reported. Count: 1 semicolon in 677 words (1.48 per 1000). |
```

Before:

```
| D. Structure / Binary contrast ("not X, Y") at most twice per page | clean | sections.tex:35 | paragraph 43 | The effect appears in readmission, not in length of stay. | nothing reported. Count: 1 binary contrast in the draft. |
```

After:

```
| D. Structure / Binary contrast ("not X, Y") at most twice per page | clean | sections.tex:31 | paragraph 38 | The effect appears in readmission, not in length of stay. | nothing reported. Count: 1 binary contrast in the draft. |
```

Before:

```
| D. Structure / Vary paragraph length | clean | the whole draft | paragraphs 5 to 47 | Paragraphs of 1 sentence (25 of them), 2 sentences (9), 3 sentences (3: paragraphs 2, 7 and 16) and 4 sentences (1: paragraph 15), with 5 to 43 words each (the title, the headings and the keywords left out) | nothing reported |
```

After:

```
| D. Structure / Vary paragraph length | clean | the whole draft | paragraphs 5 to 41 | 31 paragraphs of 1 sentence (17 of them), 2 sentences (8: paragraphs 5, 9, 19, 20, 21, 24, 37 and 41) and 3 sentences (6: paragraphs 10, 15, 18, 22, 30 and 31), with 7 to 53 words each (the title, the abstract, the keywords and the headings left out) | nothing reported |
```

Before:

```
| D. Structure / No mirror structure | clean | main.tex:21 to 39 and sections.tex:1 to 13 | paragraphs 8 to 17 and 26 to 32 | Trial Methods (9 paragraphs: aim, randomization, guideline, enrolment, eligibility, limitation, intervention, outcomes, recording) and Cohort Methods (6 paragraphs of a different order and content) | nothing reported |
```

After:

```
| D. Structure / No mirror structure | clean | main.tex:21 to 37 and sections.tex:3 to 11 | paragraphs 8 to 16 and 24 to 28 | Trial Methods (9 paragraphs: aim, randomization, intervention, guideline, enrolment, eligibility, limitation, outcomes, recording) and Cohort Methods (5 paragraphs: data source, exclusions, ethics approval, outcome, analysis), which differ in length, order and content | nothing reported |
```

Before:

```
| 0. Hard rules / No repeated construction | clean | the whole draft | paragraphs 1 to 47 | No sentence shape recurs across sections. | nothing reported |
```

After:

```
| 0. Hard rules / No repeated construction | clean | the whole draft | paragraphs 1 to 41 | No sentence shape recurs across sections. | nothing reported |
```

Before:

```
| E. Sentence shapes / Sentence length (five or more consecutive sentences of the same length) | clean | the whole draft | paragraphs 1 to 47 | No run of five consecutive sentences of the same length. | nothing reported |
```

After:

```
| E. Sentence shapes / Sentence length (five or more consecutive sentences of the same length) | clean | the whole draft | paragraphs 1 to 41 | No run of five consecutive sentences of the same length. | nothing reported |
```

Before:

```
| Objectivity / Limitations and alternative interpretations | clean | main.tex:33, sections.tex:29, sections.tex:31 | paragraphs 14, 40, 41 | The trial recruited at a single hospital, so the results may not apply to other settings. / Both studies took place at one hospital, so the effect may differ elsewhere. / The cohort association may also reflect healthier patients, who could be mobilized earlier. | nothing reported (two limitations, one alternative interpretation). |
```

After:

```
| Objectivity / Limitations and alternative interpretations | clean | main.tex:33, sections.tex:25, sections.tex:27 | paragraphs 14, 35, 36 | The trial had one limitation: patients and physiotherapists could not be blinded to the allocation. / Both studies took place at one hospital, so the effect may differ elsewhere. / Healthier patients, who could be mobilized earlier, may account for part of the cohort association. | nothing reported (two limitations, one alternative interpretation). |
```


#### Rows of sciences

Before:

```
| Sciences (Natural, Applied) / Register | break | sections.tex:15 | paragraph 34 | We were delighted to find a rare ground beetle in the third hedgerow. | Reported under Sciences (Natural, Applied) / Register (the text is not impersonal). |
```

After:

```
| Sciences (Natural, Applied) / Register | break | sections.tex:15 | paragraph 33 | We were delighted to find a rare ground beetle in the third hedgerow. | Reported under Sciences (Natural, Applied) / Register (the text is not impersonal). |
```

Before:

```
| Sciences (Natural, Applied) / Terminology | break | main.tex:29 | paragraph 12 | Soil moisture was sampled 6 inches below the surface. | Reported under Sciences (Natural, Applied) / Terminology (a measurement not in SI units). |
```

After:

```
| Sciences (Natural, Applied) / Terminology | break | main.tex:27 | paragraph 11 | Soil moisture was sampled 6 inches below the surface. | Reported under Sciences (Natural, Applied) / Terminology (a measurement not in SI units). |
```

Before:

```
| Sciences (Natural, Applied) / Terminology | clean | main.tex:27 and 47 | paragraphs 11 and 21 | Pitfall traps were placed 1 m apart along a 20 m transect. / Mean richness was 12.3 species per plot (SD = 2.1). | nothing reported |
```

After:

```
| Sciences (Natural, Applied) / Terminology | clean | main.tex:25 and 47 | paragraphs 10 and 21 | Pitfall traps were placed 1 m apart along a 20 m transect. / Mean richness was 12.3 species per plot (SD = 2.1). | nothing reported |
```

Before:

```
| Sciences (Natural, Applied) / Voice | break | main.tex:31 | paragraph 13 | The researchers identified each beetle to species. | Reported under Sciences (Natural, Applied) / Voice (the authors refer to themselves in the third person). |
```

After:

```
| Sciences (Natural, Applied) / Voice | break | main.tex:29 | paragraph 12 | The researchers identified each beetle to species. | Reported under Sciences (Natural, Applied) / Voice (the authors refer to themselves in the third person). |
```

Before:

```
| Sciences (Natural, Applied) / Voice | clean | main.tex:33 and 27 | paragraphs 14 and 11 | We emptied the traps every 7 days from April to September. / Pitfall traps were placed 1 m apart along a 20 m transect. | nothing reported (a decision with "we", a procedure in the passive). |
```

After:

```
| Sciences (Natural, Applied) / Voice | clean | main.tex:31 | paragraph 13 | We kept the plots at least 100 m apart so that the samples stayed independent. | nothing reported (a decision with "we"). |
```

Before:

```
| Sciences (Natural, Applied) / What the reader looks for | break | sections.tex:1 | paragraph 27 | Activity Method (the heading) | Reported under Sciences (Natural, Applied) / What the reader looks for: the section gives no number of traps, plots, days or dates. |
```

After:

```
| Sciences (Natural, Applied) / What the reader looks for | break | sections.tex:1 | paragraph 26 | Activity Method (the heading) | Reported under Sciences (Natural, Applied) / What the reader looks for: the section gives no number of traps, plots, days or dates. |
```

Before:

```
| Flagged terms / Discipline exceptions | clean | main.tex:25 | paragraph 10 | We sampled 24 plots on 12 farms in an agricultural landscape of 40 square kilometres. | nothing reported ("landscape" in its literal sense in ecology). |
```

After:

```
| Flagged terms / Discipline exceptions | clean | main.tex:23 | paragraph 9 | A total of 24 plots were sampled on 12 farms in an agricultural landscape of 40 square kilometres. | nothing reported ("landscape" in its literal sense in ecology). |
```

Before:

```
| B. Punctuation / Semicolons: at most 2 per 1000 words | clean | sections.tex:31 | paragraph 42 | Narrow hedgerows hold few species; wide hedgerows hold more. | nothing reported. Count: 1 semicolon in 577 words (1.73 per 1000). |
```

After:

```
| B. Punctuation / Semicolons: at most 2 per 1000 words | clean | sections.tex:27 | paragraph 39 | A 5 m strip removes land from the crop; the same strip holds 16 species on average. | nothing reported. Count: 1 semicolon in 665 words (1.50 per 1000). |
```

Before:

```
| D. Structure / Binary contrast ("not X, Y") at most twice per page | clean | sections.tex:33 | paragraph 43 | The gain comes from width, not from hedgerow length. | nothing reported. Count: 1 binary contrast in the draft. |
```

After:

```
| D. Structure / Binary contrast ("not X, Y") at most twice per page | clean | sections.tex:29 | paragraph 40 | The gain relates to width, not to hedgerow length, since every transect was 20 m long. | nothing reported. Count: 1 binary contrast in the draft. |
```

Before:

```
| D. Structure / Vary paragraph length | clean | the whole draft | paragraphs 5 to 46 | Paragraphs of 1 sentence (26 of them), 2 sentences (8), 3 sentences (2: paragraphs 2 and 7) and 4 sentences (1: paragraph 16), with 5 to 40 words each (the title, the headings and the keywords left out) | nothing reported |
```

After:

```
| D. Structure / Vary paragraph length | clean | the whole draft | paragraphs 5 to 43 | 33 paragraphs of 1 sentence (16 of them), 2 sentences (13: paragraphs 5, 7, 9, 17, 19, 22, 24, 25, 34, 36, 38, 39 and 43) and 3 sentences (4: paragraphs 16, 21, 23 and 32), with 5 to 37 words each (the title, the abstract, the keywords and the headings left out) | nothing reported |
```

Before:

```
| D. Structure / No mirror structure | clean | main.tex:21 to 43 and sections.tex:1 to 9 | paragraphs 8 to 19 and 27 to 31 | Richness Method (11 paragraphs) and Activity Method (4 paragraphs), which differ in length and content | nothing reported |
```

After:

```
| D. Structure / No mirror structure | clean | main.tex:23 to 43 and sections.tex:3 to 9 | paragraphs 9 to 19 and 27 to 30 | Richness Method (11 paragraphs) and Activity Method (4 paragraphs), which differ in length and content | nothing reported |
```

Before:

```
| 0. Hard rules / No repeated construction | clean | the whole draft | paragraphs 1 to 46 | No sentence shape recurs across sections. | nothing reported |
```

After:

```
| 0. Hard rules / No repeated construction | clean | the whole draft | paragraphs 1 to 43 | No sentence shape recurs across sections. | nothing reported |
```

Before:

```
| E. Sentence shapes / Sentence length (five or more consecutive sentences of the same length) | clean | the whole draft | paragraphs 1 to 46 | No run of five consecutive sentences of the same length. | nothing reported |
```

After:

```
| E. Sentence shapes / Sentence length (five or more consecutive sentences of the same length) | clean | the whole draft | paragraphs 1 to 43 | No run of five consecutive sentences of the same length. | nothing reported |
```

Before:

```
| Objectivity / Limitations and alternative interpretations | clean | main.tex:35, sections.tex:9, sections.tex:23, sections.tex:29 | paragraphs 15, 31, 38, 41 | The survey covered one region, so the results may not apply to other climates. / The survey covered one season, so the pattern may differ in other years. / The survey covered one region and one season, so the effect may differ elsewhere. / Older hedgerows are wider in this sample, so age may explain part of the gain. | nothing reported (three limitations, one alternative interpretation). |
```

After:

```
| Objectivity / Limitations and alternative interpretations | clean | main.tex:35, sections.tex:9, sections.tex:25 | paragraphs 15, 30, 38 | A limitation of the richness survey was that all plots lay in one region. / Only one season was sampled, and the pattern may differ in other years. / Older hedgerows are wider in this sample, so age may explain part of the gain. | nothing reported (two limitations, one alternative interpretation). |
```


#### Rows of social

Before:

```
| Social Sciences / Register | break | sections.tex:21 | paragraph 34 | The respondents were a mixed bag. | Stands once, in Formality / No colloquial words; the finding names this rule. |
```

After:

```
| Social Sciences / Register | break | sections.tex:21 | paragraph 32 | The respondents were a mixed bag in age and occupation. | Stands once, in Formality / No colloquial words; the finding names this rule. |
```

Before:

```
| Formality / No colloquial words | break | sections.tex:21 | paragraph 34 | The respondents were a mixed bag. | Reported under Formality / No colloquial words ("a mixed bag"), naming Social Sciences / Register on a line of its own. |
```

After:

```
| Formality / No colloquial words | break | sections.tex:21 | paragraph 32 | The respondents were a mixed bag in age and occupation. | Reported under Formality / No colloquial words ("a mixed bag"), naming Social Sciences / Register on a line of its own. |
```

Before:

```
| Social Sciences / Register | clean | main.tex:41 | paragraph 18 | Residents who lost a local office described a loss of voice. Fifteen of the 24 participants said the new council felt distant. | nothing reported |
```

After:

```
| Social Sciences / Register | clean | main.tex:39 | paragraph 17 | Fifteen of the 24 participants said that the new council felt distant. They described the loss as a loss of voice: the council no longer listened to them. | nothing reported |
```

Before:

```
| Social Sciences / Terminology | break | sections.tex:7 | paragraph 27 | Place attachment was measured in the survey. | Stands once, in Precision / Term defined at first use; the finding names this rule. |
```

After:

```
| Social Sciences / Terminology | break | sections.tex:7 | paragraph 25 | Place attachment was measured in the survey. | Stands once, in Precision / Term defined at first use; the finding names this rule. |
```

Before:

```
| Precision / Term defined at first use | break | sections.tex:7 | paragraph 27 | Place attachment was measured in the survey. | Reported under Precision / Term defined at first use ("place attachment", neither defined nor operationalized), naming Social Sciences / Terminology on a line of its own. |
```

After:

```
| Precision / Term defined at first use | break | sections.tex:7 | paragraph 25 | Place attachment was measured in the survey. | Reported under Precision / Term defined at first use ("place attachment", neither defined nor operationalized), naming Social Sciences / Terminology on a line of its own. |
```

Before:

```
| Social Sciences / Terminology | clean | sections.tex:5 and main.tex:27 | paragraphs 26 and 11 | We operationalized trust as agreement with five statements on a 5-point scale. / We conducted semi-structured interviews with 24 residents (N = 24). | nothing reported |
```

After:

```
| Social Sciences / Terminology | clean | sections.tex:5 and main.tex:25 | paragraphs 24 and 10 | We operationalized trust as agreement with five statements on a 5-point scale. / Semi-structured interviews were held with 24 residents (N = 24). | nothing reported |
```

Before:

```
| Social Sciences / Voice | break | main.tex:33 | paragraph 14 | The researcher conducted the interviews in the participants' homes. | Reported under Social Sciences / Voice (the authors refer to themselves in the third person). |
```

After:

```
| Social Sciences / Voice | break | main.tex:31 | paragraph 13 | The researcher conducted the interviews in the participants' homes. | Reported under Social Sciences / Voice (the authors refer to themselves in the third person). |
```

Before:

```
| Social Sciences / Voice | clean | main.tex:27 and sections.tex:45 | paragraphs 11 and 46 | We conducted semi-structured interviews with 24 residents (N = 24). Participants were recruited through the public library. / We suggest that councils keep a local office open for two years after a merger. | nothing reported (a decision with "we", a procedure in the passive where the participants matter). |
```

After:

```
| Social Sciences / Voice | clean | main.tex:25 and sections.tex:45 | paragraphs 10 and 44 | Semi-structured interviews were held with 24 residents (N = 24). Participants were recruited through the public library. / We suggest that councils keep a local office open for two years after a merger. | nothing reported (a procedure in the passive where the participants matter, a decision with "we"). |
```

Before:

```
| Social Sciences / What the reader looks for | clean | sections.tex:1 | paragraph 24 | Survey Method (the heading; sections.tex:11 states that people who moved after the merger are missing) | nothing reported |
```

After:

```
| Social Sciences / What the reader looks for | clean | sections.tex:1 | paragraph 22 | Survey Method (the heading; sections.tex:11 states that people who moved after the merger are missing) | nothing reported |
```

Before:

```
| Reader's path / So what per section | clean | sections.tex:1 | paragraph 24 | Survey Method (the heading) | nothing reported |
```

After:

```
| Reader's path / So what per section | clean | sections.tex:1 | paragraph 22 | Survey Method (the heading) | nothing reported |
```

Before:

```
| B. Punctuation / Semicolons: at most 2 per 1000 words | clean | sections.tex:37 | paragraph 42 | The interviews explain the mechanism; the survey shows its size. | nothing reported. Count: 1 semicolon in 624 words (1.60 per 1000). |
```

After:

```
| B. Punctuation / Semicolons: at most 2 per 1000 words | clean | sections.tex:37 | paragraph 40 | The interviews suggest a mechanism; the survey shows its size. | nothing reported. Count: 1 semicolon in 733 words (1.36 per 1000). |
```

Before:

```
| D. Structure / Binary contrast ("not X, Y") at most twice per page | clean | sections.tex:43 | paragraph 45 | The loss concerns voice, not service quality. | nothing reported. Count: 1 binary contrast in the draft. |
```

After:

```
| D. Structure / Binary contrast ("not X, Y") at most twice per page | clean | sections.tex:43 | paragraph 43 | The loss appears to concern voice, not service quality, since nine participants described a gain in services. | nothing reported. Count: 1 binary contrast in the draft. |
```

Before:

```
| D. Structure / Vary paragraph length | clean | the whole draft | paragraphs 5 to 48 | Paragraphs of 1 sentence (26 of them), 2 sentences (11) and 3 sentences (2: paragraphs 2 and 8), with 6 to 41 words each (the title, the headings and the keywords left out) | nothing reported |
```

After:

```
| D. Structure / Vary paragraph length | clean | the whole draft | paragraphs 5 to 46 | 36 paragraphs of 1 sentence (18 of them), 2 sentences (17: paragraphs 5, 10, 14, 17, 18, 19, 20, 21, 26, 29, 33, 34, 35, 37, 39, 40 and 46) and 3 sentences (1: paragraph 31), with 7 to 38 words each (the title, the abstract, the keywords and the headings left out) | nothing reported |
```

Before:

```
| D. Structure / No mirror structure | clean | main.tex:23 to 37 and sections.tex:1 to 15 | paragraphs 9 to 16 and 24 to 31 | Interview Method (7 paragraphs: aim, sample, eligibility, guide, interviewer, duration, coding) and Survey Method (7 paragraphs: aim, measure, second variable, mailing, limitation, coding and pretest, length), which differ in content and order | nothing reported |
```

After:

```
| D. Structure / No mirror structure | clean | main.tex:25 to 35 and sections.tex:3 to 15 | paragraphs 10 to 15 and 23 to 29 | Interview Method (6 paragraphs: sample, eligibility, guide, interviewer, duration, coding) and Survey Method (7 paragraphs: aim, measure, second variable, mailing, limitation, coding, questionnaire), which differ in content and order | nothing reported |
```

Before:

```
| 0. Hard rules / No repeated construction | clean | the whole draft | paragraphs 1 to 48 | No sentence shape recurs across sections. | nothing reported |
```

After:

```
| 0. Hard rules / No repeated construction | clean | the whole draft | paragraphs 1 to 46 | No sentence shape recurs across sections. | nothing reported |
```

Before:

```
| E. Sentence shapes / Sentence length (five or more consecutive sentences of the same length) | clean | the whole draft | paragraphs 1 to 48 | No run of five consecutive sentences of the same length. | nothing reported |
```

After:

```
| E. Sentence shapes / Sentence length (five or more consecutive sentences of the same length) | clean | the whole draft | paragraphs 1 to 46 | No run of five consecutive sentences of the same length. | nothing reported |
```

Before:

```
| Objectivity / Limitations and alternative interpretations | clean | sections.tex:11, sections.tex:33, sections.tex:35 | paragraphs 29, 40, 41 | Only residents with a registered address could be reached, so people who moved after the merger are missing. / The survey reached registered residents only, so the estimate may miss recent movers. / The pattern may also reflect residents who already distrusted the merger. | nothing reported (two limitations, one alternative interpretation). |
```

After:

```
| Objectivity / Limitations and alternative interpretations | clean | sections.tex:11, sections.tex:33, sections.tex:35 | paragraphs 27, 38, 39 | People who moved after the merger were missing from the sample, because only residents with a registered address could be reached. / Interviewees were recruited at the public library, so they may differ from residents who never visit it. / The pattern may also reflect residents who already distrusted the merger. | nothing reported (two limitations, one alternative interpretation). |
```

Removed:

```
| Common style errors / Wordy phrase | break | sections.tex:67 | paragraph 52 | Due to the fact that each host had two sockets, we pinned workers per socket. | Reported under Common style errors / Wordy phrase. |
```

