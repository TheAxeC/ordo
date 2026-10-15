Everything in the brief is done.

# Step 3, repair round: report of the builder

Worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-3`, base `8ff6ed7`. The case files are in `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases` (called `<cases>` below). `git status --short` in the worktree prints ` M skills/writing/SKILL.md` and `?? .scratch/3-the-writing-base/agents/reviews/3-report.md` and nothing else.

## Open items of the state file

The state file `.scratch/3-the-writing-base/orchestrator-state.md` on main (the worktree's copy is older) reads under "Open items":

- none.

## The cases' first run (unchanged tree, before any change)

No case was found that the brief's own rules get wrong, so there was no hand-back. Each case below was run on the base (`8ff6ed7` for `SKILL.md`, the main checkout's `.scratch/3-the-writing-base/cases/` for the case files; `diff -r .scratch/3-the-writing-base/cases /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases` prints nothing and exits 0, so the worktree's copy is the same). C1, C2, C4, C6 and C9 were unmet on the base, as the brief expects. C3, C7, C8 and C10 held on the base for the unchanged text and are the state the change has to keep. C5 is a count of the base rows that the new file is compared with.

### C1, the section rules (read, with grep)

Command: `git show 8ff6ed7:skills/writing/SKILL.md | grep -n -i -E 'every section|each section|first sentence|whole draft|per 1000|per page'`

Printed (three hits; line 10 is the opening paragraph, line 79 is the bullet that reads the draft, line 127 is in "Rules"; none is a bullet that makes the agent check a rule over every section, every first sentence or the whole draft):

```
10:`/writing <file>` starts one fresh agent that reads a whole draft and reports each break of a named rule. The agent changes nothing and leaves no file. Its report is shown to the user as the message that ends the turn.
79:- Read in full and in this order: `<prose standard>`, `<references/rules.md>`, `<references/registers.md>`, then the whole draft: `<draft files>`.
127:- One agent reads the whole draft in a run, since a rule that spans sections is lost between agents that each read one section.
```

Result: unmet.

### C2, the second rules (read, with grep)

Command: `git show 8ff6ed7:skills/writing/SKILL.md | grep -n -i -E 'other rule|two rules'`

Printed:

```
100:- A passage that breaks two rules stands once, in the first group in that order, and its finding names the other rule on a line of its own.
```

Result: unmet. The base bullet is for two rules only and has no bullet that makes the agent check a reported passage against every other rule.

### C3, the rest of the prompt (read, with grep and wc)

Commands: `git show 8ff6ed7:skills/writing/SKILL.md | grep -n 'version:'` printed `5:  version: "1.0.0"`; `git show 8ff6ed7:skills/writing/SKILL.md | wc -l` printed `127`. The prompt names no prose-standard rule by its label: `git show 8ff6ed7:skills/writing/SKILL.md | sed -n 74,120p | grep -n -E 'Em dash|Semicolon|Vary paragraph|Binary contrast|Plain prose|rule of three|Mirror|No mirror'` printed nothing and exited 1 (status printed `status 1`). Result on the base: holds.

### C4, the unlisted breaks (reading, with grep)

Command: `grep -n -F -e 'Only one queue size was tested' -e 'Creating them therefore took 6 percent' -e 'A fixed pool may therefore scale' -e 'Obtaining ethics approval was a hassle' -e 'Richness therefore kept rising' -e 'Three species occurred only in the widest hedgerows' -e 'The correctness proof of this design fits into two pages (Jones, 2020).' -e 'allocates all 64 threads' -e 'The harness covered only x86 hosts, so' <main>/.scratch/3-the-writing-base/cases/*/main.tex <main>/.scratch/3-the-writing-base/cases/*/sections.tex` printed (each line cut at its left, the passage kept):

```
cases/engineering/main.tex:31:The correctness proof of this design fits into two pages (Jones, 2020).
cases/sciences/main.tex:49:Plots wider than 5 m held 16 species on average. Richness therefore kept rising at the wide end of the width range
cases/sciences/main.tex:51:Three species occurred only in the widest hedgerows. None occurred in hedgerows narrower than 3 m. Width may have 
cases/medicine/sections.tex:7:Obtaining ethics approval was a hassle that lasted four months.
cases/engineering/sections.tex:55:The harness covered only x86 hosts, so the results do not extend to other architectures. All four hosts use
cases/engineering/sections.tex:91:The growing pool created 248 threads during each run. Creating them therefore took 6 percent of each run. T
cases/engineering/sections.tex:95:The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the high
cases/engineering/sections.tex:119:Only one queue size was tested, which limited the latency result to that size.
cases/engineering/sections.tex:149:The fixed pool allocates all 64 threads at launch, which removes thread creation from the request path. Th
```

Read against the rule the gate reading named for each: every listed passage holds its break by the rule's own words. Result: unmet.

### C5, no break lost (counted on the base)

Command: `sed -n "/^## $d\$/,/^## [a-z]*\$/p" expected.md | grep -c '| break |'` and `| clean |`, per draft, on the main checkout's `expected.md`. Printed counts (break / clean): engineering 70 / 56, medicine 6 / 11, sciences 4 / 12, social 7 / 12. These are the rows the new file is compared with.

### C6, the two-rule rows (read on the base)

Command: `grep -n -E 'modern server|Sciences \(Natural, Applied\) / (Register|Terminology) \| break|What the reader looks for \| break|Em dash and dash-as-aside: zero \(see 0\) \| break|Social Sciences / Register \| break|Medicine and Health / Register \| break|Engineering and CS / Register \| break|Engineering and CS / Terminology \| break|Terminology \| break' expected.md` printed rows at lines 49, 122, 161, 163, 167, 177, 180, 185, 201, 203, 207, 224, 227 and 232. The base rows name one rule for a passage that breaks two (the three sciences rows, "modern server" at `sections.tex:19`) or hold the second rule in a separate row (the engineering Register and Terminology rows, the medicine and social Register, Terminology and What-the-reader-looks-for rows, the B dash row). Result: unmet.

### C7, the places (grep and docx_paragraphs.py on the base)

For every row of `expected.md` with one `.tex` place or one `.docx` paragraph, the passage was compared (`sed -n "${n}p"` on the `.tex` file and on the `docx_paragraphs.py` output, then `grep -q -F`) with the heading annotation "(the heading ...)" cut. Printed, no "place not met" line, and the counts of places checked:

```
engineering:      115 tex places,      106 docx places checked
medicine:       12 tex places,       12 docx places checked
sciences:       10 tex places,       10 docx places checked
social:       12 tex places,       12 docx places checked
```

Result: holds on the unchanged text (the rows with several places were read by `grep -n -F` of their passages).

### C8, the counts (docx_paragraphs.py on the base)

Command: `python3 skills/writing/templates/docx_paragraphs.py <main>/.scratch/3-the-writing-base/cases/<draft>/draft.docx`, then `wc -l`, `sed 's/^[0-9]*: //' | wc -w` and `grep -o ';' | wc -l`. Printed:

```
engineering exit 0 paragraphs      148 words     2574 semicolons        6
medicine exit 0 paragraphs       41 words      697 semicolons        1
sciences exit 0 paragraphs       43 words      672 semicolons        1
social exit 0 paragraphs       46 words      737 semicolons        1
```

Result: holds for the unchanged text, and equals the counts the base `expected.md` states.

### C9, the clean text (reading of the unchanged drafts)

The faults of `3-gate-reading.md` under "Reports in passages the tables do not list" are all present on the base (the C4 lines above are the engineering, medicine and sciences ones; the others are the passages named in the "For each fault" part below). The short drafts hold runs of one-sentence paragraphs the clean row "Vary paragraph length" denies (`medicine/sections.tex:21` to `:33`, six one-sentence paragraphs, `sciences/main.tex:25` to `:35` and `sections.tex:3` to `:9`, and the social runs). Result: unmet.

### C10, the two forms (run and comparison on the base)

Command per short draft: the `<p>` texts of `draft.html` sorted against the non-command lines of `main.tex` and `sections.tex` sorted, `comm -23` and `comm -13`. Printed for medicine, sciences and social: only the keywords line, which the `.tex` holds as `\noindent Keywords: ...`. `docx_paragraphs.py` exited 0 for all four base drafts (C8 lines). Result: holds on the base.

## DONE / NOT DONE

| Part of the brief | State | Check |
|---|---|---|
| Item 1, the review agent prompt (`skills/writing/SKILL.md`, 142 lines, `metadata.version` "1.0.0") | DONE | Check 4 (the diff, quoted whole), C1, C2 and C3 below |
| Item 2, unlisted and clean passages rewritten; every break stays a break row (nine second rows of a passage merged into the passage's one row: four engineering, two medicine, three social; the three sciences rows stand in the first group in prompt order; no break dropped or weakened) | DONE | C4, C5, C6, C9 below and "For each fault" |
| Item 2, one row per passage in prompt order, the "How the tables read" bullet rewritten | DONE | C6 below, `expected.md` lines 12 and 44 to 48 |
| Item 2, the five landing sentences | DONE | C4 below |
| Item 2, short drafts keep the seven whole-draft clean rules | DONE | C9 below |
| Item 2, places, counts and quoted passages true | DONE | Checks C7 and C8 below |
| Item 2, line 4 of `expected.md` | DONE | `sed -n 3,5p` printed below |
| Item 2, `draft.html` equals `.tex`, `draft.docx` remade | DONE | C10 below, Check 2 |
| Check 1, the character-set check | DONE | below |
| Check 2, `docx_paragraphs.py` per draft | DONE | below, output whole |
| Check 3, non-ASCII lines | DONE | below |
| Check 4, the `SKILL.md` diff | DONE | below |
| Check 5, list items and sentences read against the standard | DONE | below |
| The plan's whole verify list | NOT RUN | the brief assigns it to the landing on main |
| The copy of the case files to `.scratch/3-the-writing-base/cases/` on main | NOT DONE | the brief assigns it to the session before `land.sh` |

### Line 4 of `expected.md`

Command: `sed -n 3,5p /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/expected.md` printed:

```
Every passage of a draft that a table does not list is expected to be reported under no rule.

The expected results are read against the reports of step 3 and are not changed after its second run.
```

## Checks, as printed

### Check 1, the character-set check

Command (from the worktree root, as the brief gives it): 

```
printf '%s\0' skills/writing/SKILL.md .scratch/3-the-writing-base/agents/reviews/3-report.md | xargs -0 sh -c 'for f; do case "$f" in .scratch/archive/*/*/cases/*) ;; .scratch/archive/*/cases/*) continue ;; .scratch/*/*/cases/*) ;; .scratch/*/cases/*) continue ;; esac; if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'; echo "exit $?"
```

It printed, on the final report and the final `SKILL.md`:

```
exit 0
```

The report quotes the line it printed and nothing came before it.

### Check 2, docx_paragraphs.py per draft (output whole; characters outside ASCII written by name)

Command: `python3 skills/writing/templates/docx_paragraphs.py /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/engineering/draft.docx; echo "exit $?"`

```
1: A Fixed Worker Pool for Bounded Task Queues
2: We compare a fixed worker pool with a growing worker pool for bounded task queues in server software. On four hosts the fixed pool raised throughput by 24 percent. It lowered the 99th percentile latency, the tail latency that 99 percent of tasks stayed below, from 410 to 190 microseconds.
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
13: The correctness proof of this design fits into two pages (Jones, 2020), so the objection to this design concerns its cost.
14: Contention grows with the thread count, as the threefold slowdown from 8 to 64 threads reported by Lee (2021) shows. Lee varied the thread count alone and left the effect of the pool policy unmeasured.
15: Lock-Free Queues
16: A lock-free queue advances its head and tail with compare-and-swap (CAS), an atomic instruction that conditionally stores a value. At 32 threads, the measurements of Park (2018) put the loss from CAS at 12 percent. The loss is below a third of the mutex loss, which suggests that CAS costs less than a lock at 32 threads.
17: A stalled thread cannot block the others in this design, since no thread waits for a lock (Kim, 2020).
18: Memory reclamation is the main cost of this design: another thread may still read a removed node. Michael (2004) described a remedy that costs one extra memory write per access, a cost that every worker pays. No measurement of a lock-free queue compares a fixed with a growing pool.
19: Implementation
20: The queue was a ring buffer with 4096 slots. Producers wrote at the tail index and workers read at the head index.
21: The fixed pool created 64 worker threads at launch. The growing pool created 8 threads and created one more thread whenever the queue held more than 2048 tasks.
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
34: In recent years, hosts gained cores, so the thread counts of this study started at 8 and 64. Both thread counts stayed below the core count of the smallest host.
35: Inputs: queue depth and thread count.
36: Outputs: tasks per second and tail latency.
37: With this setup complete, the harness submitted the first task.
38: The first task entered slot 0 of the ring buffer.
39: A worker ran each task to completion. Only then did it read the next slot.
40: Throughput Method
41: The throughput study tested whether a fixed pool completed more tasks per second than a growing pool.
42: We chose an offered load of 500,000 tasks per second because it saturated the growing pool on every host.
43: Each task spent 100 microseconds on the CPU. Producers submitted tasks at a constant rate.
44: Each run lasted 60 seconds after a 10-second warm-up. The run was repeated 30 times.
45: Producers ran on cores 0 to 7 of each host. The queue sat on core 8. The harness kept producers and workers on separate cores to avoid shared cache lines.
46: The harness covered only x86 hosts, which limited the results to that architecture. All four hosts used processors from one vendor.
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
64: Thread creation explained only part of the 24 percent gap. The growing pool created 248 threads during each run. Each creation took 15 milliseconds. Creating the threads therefore took 3.7 seconds, 6 percent of each 60-second run, a quarter of the gap.
65: The gain ranged from 22 percent on the first host to 27 percent on the fourth host. It held on all four hosts.
66: The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced, which suggested that a fixed pool scales with the core count of its host.
67: The fixed pool completed between 380,000 and 442,000 tasks per second on the four hosts, with a mean of 412,000. Even the lowest host exceeded the growing pool's mean of 331,000.
68: The growing pool was idle for 38 percent of each run. The fixed pool was idle for 4 percent.
69: The fixed pool created 64 threads. Consequently, the growing pool created 248 threads. The counts differed because only the growing pool changed its size.
70: The fixed pool used less memory than the growing pool. The harness sampled memory once per second.
71: No worker crashed in any throughput run, so no run lost part of its pool.
72: Latency Method
73: Each pool was compared by the 99th percentile of its task latency.
74: Each task recorded its submission time and its completion time. Its latency was the difference between the two.
75: The percentile was computed over the pooled latencies of all runs of a pool.
76: The two pools were compared with a Mann-Whitney U test, a rank test for two independent samples. The test required no assumption about the shape of the latency distribution.
77: We chose an offered load below saturation because latency grows without bound above it.
78: Only one queue depth was tested, which limited the latency result to that depth.
79: Latency Results
80: A Mann-Whitney U test compared the two latency distributions and gave p below 0.001. The test rejected the hypothesis that both pools had the same latency distribution.
81: The fixed pool lowered the 99th percentile latency from 410 to 190 microseconds. The result confirmed, for these hosts, the expectation that a fixed pool lowers the tail.
82: The growing pool created threads inside the request path, which may have added to the tail.
83: Discussion
84: The study adds what the earlier queue studies left unmeasured: the fixed pool lowered the tail latency on every host. Why does a fixed pool lower the tail latency? The results suggest that a fixed pool lowers tail latency by removing thread creation from the request path.
85: Hosts with more cores show larger gains, so core count raises the benefit of a fixed pool.
86: This section explains how the fixed pool lowers the tail. A fixed pool keeps every worker pinned to a warm cache.
87: The growing pool creates threads inside the request path and queues tasks behind them.
88: This raises the tail. A fixed pool avoids both effects.
89: A new thread of the growing pool starts on a cold core, where its first tasks miss the cache.
90: The cache is happy when a worker stays on one core.
91: Pinning keeps caches warm. A pinned worker never loses its cache to another core. In short, pinned workers keep their caches.
92: The growing pool creates threads on demand. Static in the fixed pool.
93: The fixed pool creates all 64 threads at launch, which removes thread creation from the request path. The growing pool creates its threads one at a time.
94: The queue provides bounded submission and is configurable.
95: The queue rejects a task when no slot is free. The producer receives an error code and moves on to its next task.
96: What does the harness log? It logs one line per run and one per rejected task.
97: The summary file is written by the harness.
98: The fixed pool is small, compact and light.
99: The harness uses two kinds of thread, the producers and the workers.
100: The queue holds tasks. The buffer orders them by arrival. The channel feeds the workers.
101: The fixed pool runs on cores 9 and above. The fixed pool leaves cores 0 to 8 to the producers and the queue. The fixed pool never shares a core with them.
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
128: The harness records each task twice. It stamps the submission time on entry. It stamps the completion time on exit. The host also reports memory use once per second, and a separate file keeps every sample. The harness writes the report after the run. A summary file holds the totals.
129: A queue holds tasks until a worker is free. Servers use queues for that purpose.
130: We believe the fixed pool is the better design.
131: We chose to report the 99th percentile because it exposes queueing delay. The 99th percentile is the latency that 99 percent of the tasks stay below.
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
145: The thread count of 64 stays below the 96 cores of the smallest host. The producers and the queue therefore keep cores of their own.
146: Conclusion
147: The study compared a fixed pool with a growing pool on four hosts.
148: The fixed pool raised throughput by 24 percent and lowered the 99th percentile latency to 190 microseconds.
exit 0
```

Command: `python3 skills/writing/templates/docx_paragraphs.py /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/medicine/draft.docx; echo "exit $?"`

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
10: We defined early mobilization as standing with a physiotherapist within 24 hours of surgery. Patients in the early group then walked twice a day. Usual mobilization began on the second day.
11: The trial followed the Consolidated Standards of Reporting Trials (CONSORT) guideline.
12: The authors enrolled the patients on the surgical ward. Patients were eligible if they could walk unaided before the fracture.
13: The trial had one limitation: patients and physiotherapists could not be blinded to the allocation.
14: The primary outcome was readmission within 30 days. Secondary outcomes were length of stay and mortality at 90 days. Outcome assessors did not know the allocation.
15: Readmission was recorded from hospital records for 30 days after discharge.
16: Trial Results
17: Early mobilization reduced 30-day readmission from 25 percent to 15 percent. The relative risk (RR) was 0.60 (95% CI [0.41, 0.87], p = .004). One readmission was avoided for every ten patients mobilized early.
18: Both groups of 240 patients completed follow-up and entered the analysis, so attrition could not account for the difference in readmission.
19: By 30 days, a heart attack had occurred in two patients, both in the usual mobilization group. The numbers were too small to compare the groups.
20: Mobilization began a median of 11 hours after surgery in the early group, inside the 24-hour target.
21: The secondary outcomes did not differ between the groups. Length of stay had a median of 7 days in each group. Mortality at 90 days was 6 percent after early mobilization and 8 percent after usual mobilization (RR 0.75, 95% CI [0.39, 1.43]). Chance alone could explain that difference.
22: Cohort Methods
23: The cohort drew on the records of 310 consecutive patients aged 65 years or older. Mobilization time was taken from nursing notes. Mobilization within 24 hours of surgery counted as early and any later mobilization as usual.
24: Records were incomplete for 18 patients, who were excluded. Their exclusion may have biased the cohort toward patients with complete nursing notes.
25: The ethics committee approved the use of the nursing notes after a hassle that lasted four months.
26: The primary outcome matched the trial outcome. Readmission was again recorded from hospital records for 30 days after discharge.
27: The analysis adjusted for age and the Charlson comorbidity index, a weighted count of chronic diseases.
28: Cohort Results
29: Readmission occurred in 22 percent of the 140 patients mobilized early and in 31 percent of the 170 patients with usual mobilization. After adjustment, the odds ratio for readmission was 0.68 (95% CI [0.47, 0.98]), against a crude odds ratio of 0.63. Age and comorbidity probably explained little of the association.
30: Three cases of deep vein thrombosis were recorded in the cohort, a rate of 1 percent. All three occurred in patients with usual mobilization. Usual mobilization may have added to the risk of thrombosis.
31: Discussion
32: The study adds randomized and observational evidence to the two small trials of early mobilization (Okoye, 2022).
33: The trial and the cohort agree in direction, which suggests that early mobilization reduces readmission. The trial is randomized; the cohort is observational. Agreement between the two designs strengthens the finding.
34: Both studies come from one hospital, so the effect may differ elsewhere.
35: Healthier patients, who could be mobilized earlier, may account for part of the cohort association. Adjustment for age and comorbidity changed the odds ratio only from 0.63 to 0.68, which limits that explanation.
36: The effect shows in readmission, not in length of stay.
37: Hospitals that wish to test early mobilization could schedule physiotherapy on the day of surgery.
38: Conclusion
39: Early mobilization within 24 hours may reduce readmission after hip fracture surgery in older adults. Future trials should test it in at least three hospitals.
exit 0
```

Command: `python3 skills/writing/templates/docx_paragraphs.py /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/sciences/draft.docx; echo "exit $?"`

```
1: Hedgerow Width and Ground Beetle Species Richness on Arable Farms
2: We tested whether wider hedgerows hold more ground beetle species on arable farms. Across 24 plots on 12 farms, species richness (species per plot) rose by 3.1 species per additional metre of hedgerow width. A second survey measured beetle activity as captures per month and found peak activity in June.
3: Keywords: ground beetles, hedgerows, species richness, agroecology
4: Introduction
5: Hedgerows shelter ground beetles that eat crop pests and weed seeds (Lang, 2016). Farms in eastern England removed 22 percent of their hedgerows between 1990 and 2010 (Weber, 2015).
6: The present survey related species richness to hedgerow width. The hypothesis was that wider hedgerows hold more species.
7: Richness Method
8: A total of 24 plots were sampled on 12 farms in an agricultural landscape of 40 square kilometres. Plots lay along hedgerows 1 to 7 m wide. Each plot held one transect.
9: Pitfall traps were placed 1 m apart along a 20 m transect. Each trap held propylene glycol, which killed the beetles within 1 hour and preserved them for counting. The traps were emptied every 7 days from April to September.
10: Soil moisture was sampled 6 inches below the surface.
11: The researchers identified each beetle to species.
12: We kept the plots at least 100 m apart so that the samples stayed independent. A limitation of the richness survey was that all plots lay in one region.
13: Hedgerow width was measured at 5 points per plot. The mean of the 5 values was used. Hedgerow age was taken from the farm records.
14: Beetles were counted in the laboratory under a microscope by two observers who worked independently. Their counts agreed for 97 percent of samples, and the counts were used without correction.
15: Richness Results
16: Species richness rose by 3.1 species per additional metre of hedgerow width (95% CI [2.2, 4.0]). Mean species richness was 12.3 species per plot (SD = 2.1). Because the interval excluded zero, width and species richness were positively associated.
17: Plots wider than 5 m held 16 species on average, 3.7 species above the mean of all plots. That excess agrees with the positive association between width and species richness.
18: Three species occurred only in hedgerows wider than 6 m, so width may have decided which species could persist.
19: Species richness did not depend on farm size (r = 0.12, p = .58). Farm size was an unlikely source of the width effect.
20: Hedgerows wider than 5 m held 9 forest specialists, species that live mainly in woodland, and hedgerows narrower than 3 m held 2. The difference may have reflected the shade that the wider hedgerows offered these species.
21: Hedgerow age rose with width (r = 0.64, p = .001), so the older hedgerows were also the wider ones.
22: Activity Method
23: A second survey recorded when ground beetles were most active. Beetles were sampled along hedgerows.
24: Species were identified with the keys of Luff (2007).
25: Only one season was sampled, and the pattern may differ in other years.
26: Activity Results
27: Beetle activity peaked in June, with 41 percent of all captures. Activity fell below 5 percent per month after August.
28: We were delighted to find Carabus auratus in the third hedgerow.
29: The timing of activity showed no link to hedgerow width (F = 0.8, p = .45). Width thus appeared to shape the number of species in a plot and to leave their season of activity unchanged.
30: Discussion
31: In these plots, wider hedgerows hold more species, which suggests that width adds habitat. The result extends earlier work on hedgerows as shelter for beetles (Lang, 2016) to the width of the hedgerow.
32: The pattern matches earlier surveys in Denmark (Holm, 2012).
33: Older hedgerows are wider in this sample, so age may explain part of the gain. A model with age and width together would separate the two effects.
34: A 5 m strip removes land from the crop; the same strip holds 16 species on average. Farmers therefore weigh a loss of cropland against a gain in species.
35: The gain relates to width, not to hedgerow length, since every transect was 20 m long.
36: We suggest that agri-environment schemes consider payments for hedgerows wider than 5 m.
37: Conclusion
38: Hedgerows wider than 5 m may hold more ground beetle species on arable farms. Future work should follow the same plots across at least three seasons.
exit 0
```

Command: `python3 skills/writing/templates/docx_paragraphs.py /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/social/draft.docx; echo "exit $?"`

```
1: Trust in Local Government After a Municipal Merger
2: We examined how residents' trust in local government changed after two municipalities merged. In interviews with 24 residents, trust fell where the merger moved services away. A survey of 412 residents showed lower trust among those who lost a local office.
3: Keywords: political trust, municipal merger, local government, sociology
4: Introduction
5: A municipal merger moves public services away from some residents. Residents who lose a local office may feel less political trust, the belief that a government acts in the interest of its citizens (Abara, 2017).
6: Merged municipalities now serve 18 percent of residents in the country (Statistics Office, 2022). The study followed residents of two towns that merged in 2019.
7: Interviews explored how residents understood the merger, and a survey measured trust.
8: Interview Method
9: Semi-structured interviews were held with 24 residents (N = 24). Participants were recruited through the public library.
10: Residents were eligible if they had lived in either town since before the merger.
11: The interview guide asked about services and about contact with the council. Each interview lasted 45 minutes. Interviews were recorded and transcribed.
12: The researcher conducted the interviews in the participants' homes.
13: Each transcript was coded twice for themes of distance and voice, the sense of being heard by the council.
14: Interview Results
15: Fifteen of the 24 participants said that the new council felt distant. They described the loss as a loss of voice: the council no longer listened to them.
16: The merger brought better services in the view of six participants. Each of them lived within 5 km of the new town hall. That proximity may have explained the view.
17: Without a local office, participants faced a trip of 20 to 40 minutes to the new town hall. Four of them stopped visiting, so distance may have cut their contact with the council.
18: The three participants who kept an office nearby reported no change in their contact with the council. A nearby office may therefore have preserved that contact.
19: One participant said that the council "stopped listening," which illustrated the loss of voice that 15 participants described.
20: Survey Method
21: A mailed survey tested whether losing a local office lowered trust. We operationalized trust as agreement with five statements on a 5-point scale.
22: Place attachment was measured in the survey.
23: The survey was mailed to 1,200 residents, and 412 replied. A response rate of 34 percent left room for non-response bias.
24: People who moved after the merger were missing from the sample, because only residents with a registered address could be reached.
25: Losing an office was coded from the residents' registered address.
26: The survey had 18 items and took 10 minutes to complete. It was tested on 20 residents before mailing.
27: Survey Results
28: Respondents who had lost a local office reported lower trust than the others (mean 2.9 against 3.6, p below .001). The difference was 0.7 points on the 5-point scale.
29: The respondents were a mixed bag in age and occupation, with ages from 22 to 87 years and 31 occupations.
30: Trust rose with years of residence (r = .18, p below .001) and showed no link to age (r = .04, p = .41). Years of residence may have mattered more to trust than age.
31: Trust was lowest among residents who lived more than 10 km from the new town hall (mean 2.6). Distance may have helped to explain the pattern that the interviews described.
32: Response rates were similar in the two towns, at 33 and 35 percent, so neither town dominated the sample.
33: Discussion
34: The interviews and the survey suggest that losing a local office lowers trust. The study adds evidence from two merged towns to the claim of Abara (2017).
35: Participants were recruited at the public library, so they may differ from residents who never visit it.
36: The pattern may also reflect residents who already distrusted the merger. A survey before the merger would separate the two explanations.
37: The interviews suggest a mechanism; the survey shows its size.
38: Local offices give residents a place to be heard (Abara, 2017). A longer trip to the town hall may reduce contact with the council.
39: The loss appears to concern voice, not service quality, since six participants described better services.
40: We suggest that councils consider keeping a local office open after a merger.
41: Conclusion
42: Losing a local office may lower residents' trust in a merged municipality. Future studies should follow residents before and after a merger.
exit 0
```

### Check 3, lines outside ASCII (characters written by name)

Each line below is a break row of `expected.md` ("0. Hard rules / Em dash: zero" at `sections.tex:177` and `:179`, "B. Punctuation / ASCII throughout" at `:203` and `:205`, "0. Hard rules / Arrows" at `:211`); the short drafts print nothing. The status line is the exit status of the grep (0: lines found, 1: none).

Command: `python3 skills/writing/templates/docx_paragraphs.py /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/engineering/draft.docx | LC_ALL=C grep -n '[^ -~]'`

```
107:107: The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match. The gain appears on every host.
108:108: The growing pool pays for each new thread <en dash> a cost the fixed pool pays once.
120:120: The report prints the status <left double quotation mark>complete<right double quotation mark> after each run.
121:121: The harness counts rejected tasks<horizontal ellipsis> and reports the total.
124:124: Completion order is queue <rightwards arrow> worker.
status 0
```

Command: `LC_ALL=C grep -n '[^ -~]' /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/engineering/*.tex`

```
/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/engineering/sections.tex:177:The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match. The gain appears on every host.
/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/engineering/sections.tex:179:The growing pool pays for each new thread <en dash> a cost the fixed pool pays once.
/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/engineering/sections.tex:203:The report prints the status <left double quotation mark>complete<right double quotation mark> after each run.
/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/engineering/sections.tex:205:The harness counts rejected tasks<horizontal ellipsis> and reports the total.
/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/engineering/sections.tex:211:Completion order is queue <rightwards arrow> worker.
status 0
```

Command: `python3 skills/writing/templates/docx_paragraphs.py /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/medicine/draft.docx | LC_ALL=C grep -n '[^ -~]'`

```
status 1
```

Command: `LC_ALL=C grep -n '[^ -~]' /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/medicine/*.tex`

```
status 1
```

Command: `python3 skills/writing/templates/docx_paragraphs.py /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/sciences/draft.docx | LC_ALL=C grep -n '[^ -~]'`

```
status 1
```

Command: `LC_ALL=C grep -n '[^ -~]' /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/sciences/*.tex`

```
status 1
```

Command: `python3 skills/writing/templates/docx_paragraphs.py /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/social/draft.docx | LC_ALL=C grep -n '[^ -~]'`

```
status 1
```

Command: `LC_ALL=C grep -n '[^ -~]' /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases/social/*.tex`

```
status 1
```

### Check 4, the SKILL.md diff (quoted whole)

Command: `diff <(git show 8ff6ed7:skills/writing/SKILL.md) skills/writing/SKILL.md; echo "diff status $?"`

```
91a92,106
> - Before you write the report, check every section in turn against each rule that judges a section:
>   - The section's job and the reader's question it answers.
>   - The section's tense.
>   - The reader's four questions.
>   - What the reader of the register looks for.
> - Apply a rule that judges a section only to a section of the type its words name.
> - Check the first sentence of every paragraph against each rule that judges a paragraph's first sentence.
> - Check the whole draft once against each rule that judges the whole draft:
>   - A count per 1000 words or per page.
>   - The lengths of the paragraphs and the shape of the sections.
>   - A sentence shape that recurs and a run of sentences of one length.
>   - The acknowledgement of limitations and alternative interpretations.
> - Give a count you made only inside the finding of the break it shows.
> - A rule the draft keeps has no group and no line in the report.
> - Check each passage you report against every other rule of the three pages.
100c115
< - A passage that breaks two rules stands once, in the first group in that order, and its finding names the other rule on a line of its own.
---
> - A passage that breaks more than one rule stands once, in the first group in that order. Its finding names each of the other rules it breaks, each on a line of its own.
diff status 1
```

`wc -l skills/writing/SKILL.md` printed `142 skills/writing/SKILL.md`; `grep -n "version:" skills/writing/SKILL.md` prints `5:  version: "1.0.0"`:

```
     142 skills/writing/SKILL.md
5:  version: "1.0.0"
```

### Check 5, the new and changed items read against the standard's rules on list items and sentence length

The prose standard's rules read: "Three or more list-shaped items in paragraph form become a list. Lists are introduced with a colon.", "No rule of three", "Paragraphs cover one idea and stay under roughly four sentences" and "Sentence length: under roughly 20 words unless the mechanism needs more". Word counts below were printed by `diff <(git show 8ff6ed7:skills/writing/SKILL.md) skills/writing/SKILL.md | grep '^>'` piped through `wc -w` per line.

- Both lead-in bullets (17 and 13 words) end in a colon and introduce a nested list of four items each. The four items are the four kinds of rule the brief names, and the second list holds the four whole-draft kinds the brief names, so neither list was padded or trimmed to three.
- Departure: the items of the two nested lists are noun phrases (3 to 13 words), not imperative sentences like the other bullets of the prompt. They need that form because the lead-in bullet holds the one instruction and the items name what it applies to; written as imperatives each would repeat the instruction.
- The other six new bullets are single imperative or declarative sentences of 13 to 17 words, one instruction each.
- The changed bullet holds two sentences of 17 words each; one bullet of 34 words would depart from the sentence-length rule, so it is two sentences in one bullet, still one instruction.
- Departure: none for sentence length. No new sentence runs over 17 words.
- The nested lists use the file's existing two-level bullet form (`Steps` use it).

## The terms

The diff adds no term to `docs/glossary.md` and changes none. Command: the 140 bold terms of `docs/glossary.md` (`grep -o -E '^- \*\*[^*]+\*\*' docs/glossary.md`) each searched with `grep -i -w -F` in the lines the diff adds; it printed `term in diff: finding` and nothing else.

- finding: the glossary entry reads, for `/writing`, "a passage of a draft that breaks a named rule, given with its place, the quoted passage and the rule it breaks with what that rule asks for, with no proposed replacement". The new bullet "Give a count you made only inside the finding of the break it shows" and the changed bullet "Its finding names each of the other rules it breaks, each on a line of its own" use the term in that sense, as the base bullet did.
- kind: the first wording of the section-rule bullet said "a section of the kind its words name", and the glossary defines "kind" for the plan-retro grouping of findings. The bullet says "type" instead, so the glossary term is not used in a new place. After the change the same search prints no `kind`.

## The files, with line counts

Changed in the worktree: `skills/writing/SKILL.md`, 127 lines on the base, 142 now. Written there: this report.

Case files in `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases` (`wc -l`, printed after the change; the base counts follow in brackets):

```
     142 skills/writing/SKILL.md
     233 <cases>/expected.md
      45 <cases>/engineering/main.tex
      51 <cases>/medicine/main.tex
      51 <cases>/sciences/main.tex
      47 <cases>/social/main.tex
     278 <cases>/engineering/sections.tex
      35 <cases>/medicine/sections.tex
      33 <cases>/sciences/sections.tex
      45 <cases>/social/sections.tex
     161 <cases>/engineering/draft.html
      48 <cases>/medicine/draft.html
      47 <cases>/sciences/draft.html
      51 <cases>/social/draft.html
    1267 total
```

Base line counts, from `wc -l` on the main checkout's cases: expected.md 242; engineering main.tex 45, sections.tex 278, draft.html 161; medicine main.tex 53, sections.tex 37, draft.html 50; sciences main.tex 59, sections.tex 35, draft.html 52; social main.tex 51, sections.tex 49, draft.html 55. The four `draft.docx` are binary; `docx_paragraphs.py` prints 148, 39, 38 and 42 paragraphs for them (base: 148, 41, 43, 46).

## The cases after the change

#### C5, no break lost

Commands: the break and clean row counts per draft as in the first run, on `<cases>/expected.md`; for each base break row, `grep -c -F` of its rule over the new break rows; then `grep -F` of its quoted passage over the new break rows. Counts (break / clean), base then new:

```
engineering 70 / 56 -> 66 / 56
medicine 6 / 11 -> 4 / 11
sciences 4 / 12 -> 4 / 12
social 7 / 12 -> 4 / 12
```

The rule check printed one line: `rule of a base break row not named by any new break row: B. Punctuation / Em dash and dash-as-aside: zero (see 0)`. That base row was the separate "B" row of the five dash passages; the five dash rows (rows 44 to 48 of the new file) each name `B. Punctuation / Em dash and dash-as-aside`, so the rule stays named by the break rows of its five passages. Every other rule of a base break row is named by a new break row.

The passage check printed the passages that changed on purpose and nothing else: engineering `In recent years, hosts gained cores, so the pool sizes of this study started at 8 and 64 threads.`, the paragraph 66 and paragraph 128 passages, the merged rows (`Submission order is producer -> queue. / Completion order is queue <rightwards arrow> worker.` and `The five passages of the five rows above.`), medicine `By 30 days, a heart attack had occurred in two patients, both in the usual care group.` and `Obtaining ethics approval was a hassle that lasted four months.`, and social `The respondents were a mixed bag in age and occupation.` All are rewritten, see "For each fault".

#### C7, the places

The comparison of the first run, on the changed tree. It printed no "place not met" line, and these counts of places checked:

```
engineering: 113 tex places, 104 docx places checked
medicine: 10 tex places, 10 docx places checked
sciences: 10 tex places, 10 docx places checked
social: 9 tex places, 9 docx places checked
```

The rows with several places (engineering `sections.tex:11, 47, 117, 225`, `:33, 35`, `:81, 83`, `:229 to 236`, `:240 to 247`, `:265 to 266`, `main.tex:15 to 25`, `main.tex:27 and 35`; the "and" rows of the three short drafts) were checked with `grep -n -F` of the passage over the `.tex` file and `sed -n "<n>p"` of the docx output; each passage stands at the line and paragraph the row names.

#### C8, the counts

Command per draft: `python3 skills/writing/templates/docx_paragraphs.py <cases>/<draft>/draft.docx`, then `wc -l`, `sed 's/^[0-9]*: //' | wc -w` and `grep -o ';' | wc -l`. Printed:

```
engineering exit 0 paragraphs 148 words 2611 semicolons 6
medicine exit 0 paragraphs 39 words 754 semicolons 1
sciences exit 0 paragraphs 38 words 723 semicolons 1
social exit 0 paragraphs 42 words 739 semicolons 1
```

The binary contrasts: `grep -o -E ', not |; not '` over the engineering output printed 3 matches (the three in paragraph 127); the short drafts hold one each (`medicine/sections.tex:29`, `sciences/sections.tex:27`, `social/sections.tex:39`, the lines the `grep -n -i -E ' not |rather than|instead of|no longer|neither| nor '` listing under C9 shows). The rows state 148 paragraphs, 2611 words, 6 semicolons (2.30 per 1000, limit 5) and 3 binary contrasts for engineering; 39 paragraphs, 754 words and 1 semicolon (1.33 per 1000) for medicine; 38, 723 and 1 (1.38 per 1000) for sciences; 42, 739 and 1 (1.35 per 1000) for social. `grep -n -o 'Count: 1 semicolon in [0-9]* words ([0-9.]* per 1000)' expected.md` printed `181:Count: 1 semicolon in 754 words (1.33 per 1000)`, `204:Count: 1 semicolon in 723 words (1.38 per 1000)` and `227:Count: 1 semicolon in 739 words (1.35 per 1000)`; the engineering row reads `6 semicolons in 2611 words (2.30 per 1000)`.

#### C10, the two forms

Command per draft: the `<p>` texts of `draft.html` (`sed -n 's/^<p>\(.*\)<\/p>$/\1/p' | sort -u`) against the non-command lines of `main.tex` and `sections.tex` (`grep -v '^\\' | grep -v '^$' | sort -u`), with `comm -23` (html only) and `comm -13` (tex only). Printed counts of differing lines:

```
engineering: html only 7 lines, tex only 14 lines
medicine: html only 1 lines, tex only 0 lines
sciences: html only 1 lines, tex only 0 lines
social: html only 1 lines, tex only 0 lines
```

Medicine, sciences and social: the one html-only line is the keywords line, which the `.tex` holds as `\noindent Keywords: ...`. Engineering: the seven html-only lines are the keywords line, the five lines whose characters the `.html` spells as entities (`&#8212;`, `&#8211;`, `&#8220;` and `&#8221;`, `&#8230;`, `&#8594;`) and the `->` line spelled `-&gt;`; the `.docx` prints the characters. Of the fourteen tex-only lines, six are those same lines in characters and eight are the lines the rows mark "not in the `.docx`" (the `\textbf` and `\texttt` lines, the two hard-wrapped lines, the `configs/pool.yaml` line, the temperature paragraph and the summary-file line).

`grep -c -E '<ul|&nbsp;|<table' <cases>/*/draft.html` printed `0` for medicine, sciences and social and `10` for engineering; the ten engineering lines are the `<ol>` and `<li>` lines of its two lists, the same ten as in the base (`grep -c -E '<ul|<ol|<li|&nbsp;|<table'` on the base printed 10); none is a `<ul>`, an `&nbsp;` or a table. `ls -l` of the draft pairs, each `.docx` made after its `.html`:

```
Oct 15 19:18 <cases>/engineering/draft.docx
Oct 15 19:18 <cases>/engineering/draft.html
Oct 15 19:41 <cases>/medicine/draft.docx
Oct 15 19:41 <cases>/medicine/draft.html
Oct 15 19:42 <cases>/sciences/draft.docx
Oct 15 19:41 <cases>/sciences/draft.html
Oct 15 19:41 <cases>/social/draft.docx
Oct 15 19:41 <cases>/social/draft.html
```

`grep -c -F` of the new phrases over the docx outputs printed 1 (medicine `could not account`), 3 (sciences `may have reflected`, `That excess agrees`, `number of species in a plot`), 5 (social) and 1 (medicine `hassle that lasted`), so each `draft.docx` holds the edited text.

#### C1, C2 and C3, the prompt (reading of the changed `SKILL.md`)

- C1 holds. The bullet "Before you write the report, check every section in turn against each rule that judges a section:" with the four kinds the brief names (job and question, tense, four questions, a register's "What the reader looks for"); the bullet "Check the first sentence of every paragraph against each rule that judges a paragraph's first sentence."; the bullet "Check the whole draft once against each rule that judges the whole draft:" with its four kinds (a count per 1000 words or per page, paragraph lengths and the shape of the sections, a recurring sentence shape and a run of sentences of one length, limitations and alternative interpretations). These stand after the bullet that reads the whole draft and before the bullets on the report's form.
- The bullet "Apply a rule that judges a section only to a section of the type its words name." is the section-kind bullet; "Give a count you made only inside the finding of the break it shows." and "A rule the draft keeps has no group and no line in the report." are the count and kept-rule bullets.
- C2 holds. "Check each passage you report against every other rule of the three pages." and, in place of the two-rule bullet, "A passage that breaks more than one rule stands once, in the first group in that order. Its finding names each of the other rules it breaks, each on a line of its own."
- C3 holds. `diff` (Check 4) shows only the added bullets and the one changed bullet; `metadata.version` is "1.0.0"; the prompt names no prose-standard rule by its label (`sed -n 74,120p skills/writing/SKILL.md | grep -n -E 'Em dash|Semicolon|Vary paragraph|Binary contrast|Plain prose|rule of three|Mirror|No mirror'` printed nothing and `status 1`); the new bullets name rules only by what their words judge. No other section of the file says anything the change makes false: `grep -n -i -E 'other rule|two rules|per 1000|section rule|every section' skills/writing/SKILL.md` printed only the new bullets, and `grep -rn -F -e 'breaks two rules' -e 'stands once' skills utils docs README.md` printed only the changed bullet (`skills/writing/SKILL.md:115`). ADR 0003 holds: one agent, no edit, no replacement, no second pass.

#### C4 and C6, the passages and the rows

See "For each fault" below for each passage and row before and after.

#### C9, the clean text, per draft

Rules read for each draft: all of the prose standard (section 0: the eight hard rules; A: filler, vague qualifiers, flagged terms; B: dashes, semicolon count, colon-list paragraphs, ASCII; C: openers, announcements, recaps; D: rule of three, paragraph length and variety, synonym cycling, binary contrast, mirror structure, list-shaped items and list introductions; E: spec-sheet voice, fragments, cold opens, restating closes, personification, rhetorical questions, passive voice, sentence length and runs; F: bold, capitals, inline code, source formatting), all of `references/rules.md` (Precision, Concision, Objectivity, Formality, Hedging, Transitions, Paragraphs, Common style errors, Reader's path, Flagged terms) and the four rules of the draft's register in `references/registers.md`, every sentence in turn. Commands run for the reading on the final texts (output of the vocabulary and contrast searches, cut at 110 characters):

```
$ grep -n -i -w -E 'easy|simple|quick|very|really|just|simply|significantly|many|often|typically|generally|delve|tapestry|landscape|pivotal|crucial|foster|showcase|testament|navigate|leverage|realm|embark|underscore|multifaceted|nuanced|comprehensive|robust|intricate|cornerstone|paradigm|synergy|holistic|streamline|important|worth|notably|clearly|obviously|interestingly|quite|rather|somewhat|fairly' <draft>/main.tex <draft>/sections.tex   (medicine, sciences, social)
sciences/main.tex:21:A total of 24 plots were sampled on 12 farms in an agricultural landscape of 40 square ki
```

```
$ grep -n -i -E ' not |rather than|instead of|no longer|neither| nor ' <draft>/main.tex <draft>/sections.tex   (medicine, sciences, social, cut at 110 characters)
medicine/sections.tex:29:The effect shows in readmission, not in length of stay.
medicine/main.tex:31:The trial had one limitation: patients and physiotherapists could not be blinded to the a
medicine/main.tex:33:The primary outcome was readmission within 30 days. Secondary outcomes were length of sta
medicine/main.tex:41:Both groups of 240 patients completed follow-up and entered the analysis, so attrition co
medicine/main.tex:47:The secondary outcomes did not differ between the groups. Length of stay had a median of 
sciences/main.tex:43:Species richness did not depend on farm size (r = 0.12, p = .58). Farm size was an unlike
sciences/sections.tex:27:The gain relates to width, not to hedgerow length, since every transect was 20 m long
social/sections.tex:25:Response rates were similar in the two towns, at 33 and 35 percent, so neither town dom
social/sections.tex:39:The loss appears to concern voice, not service quality, since six participants describe
social/main.tex:35:Fifteen of the 24 participants said that the new council felt distant. They described the l
```

The one hit, `landscape` at `sciences/main.tex:21`, is the clean case of "Flagged terms / Discipline exceptions" (the literal sense in ecology).

Further commands: every sentence over 21 words (`sed` of the docx output split at ". ", `wc -w` per sentence) printed for the short drafts: medicine two sentences of 22 words (a result sentence with its interval, and the two groups' percentages), sciences one of 23 words (the forest specialist definition) and social two of 25 and 24 words (the definition of political trust, from the base, and a result with two correlations); each is a figure-bearing or defining sentence within "roughly 20 words unless the mechanism needs more". The sentence lengths of each short draft in order were printed (`sed` of the docx output split at ". ", `wc -w` per sentence) and read for a run of five sentences of one length: none; the longest stretch of identical lengths is two, and the longest stretch within one word of each other is four (social, 11, 10, 10 and 11). The sentence count of every body paragraph, in document order across the headings, was read for a run of three paragraphs of one sentence count: none in any short draft (the longest runs are two).

Sentences changed by the reading, per draft (all texts are in the `diff` blocks below; the cause is the rule named):

- Engineering: `main.tex:8` (Term defined at first use), `main.tex:31` (Clarity test); `sections.tex:5`, `:31`, `:119`, `:149`, `:253` and `:255` (No synonym cycling: "started", "added", "pool size", "starting sizes", "queue size" and "allocates" for the one vocabulary of "created" and "thread count" and "queue depth"); `:55` (Tense per section, a Method section in the present tense); `:91` and `:95` (the landing sentences); `:125`, `:225`, `:255`, `:272` (Tense per section: Latency Results in the past, the Discussion subsections in the present); `:219` (the run of near-equal sentences in a paragraph the row breaks only by length).
- Medicine: the group is named "usual mobilization" throughout and the eligibility sentence joins the enrolment paragraph (No synonym cycling, Vary paragraph length); the attrition paragraph, the median-hours paragraph and the secondary-outcomes paragraph are rewritten (First sentence states the point, Restating closes); the cohort paragraphs gain the definition of early and usual mobilization, the recording of readmission and the named comorbidity index (Term defined at first use, Most specific term); the Discussion is regrouped so no run of one-sentence paragraphs stands and the semicolon sentence follows a first sentence that states the point; the ethics sentence names the committee and the notes (Clarity test); "cannot account" became "could not account" (Tense per section, a Results section).
- Sciences: the title and abstract use "species richness" and define it and "beetle activity"; the hypothesis sentence replaces the passive definition; the method gains the trap interval, the glycol clause, the width and age measurement and the observers' agreement, and the one-sentence method paragraphs are merged (Vary paragraph length); results gain the age-and-width paragraph and the figure-with-meaning second sentence of the wide-plot paragraph (Evidence followed by what it means); "forest specialists" is defined; "how many species" became "the number of species" (Vague qualifiers); "may reflect" became "may have reflected" (Tense per section); "published keys" is named; the Discussion opens "In these plots" (Hedge where a claim is uncertain).
- Social: the definition of "voice" moves before its first use; the mailing, coding and instrument paragraphs are merged and renamed ("survey" for "questionnaire", "participants" for "interviewees") (No synonym cycling, Vary paragraph length); "Together they point to a loss of voice." and "Losing an office was therefore associated with lower trust." are cut (Restating closes); "a mixed bag" now carries the ages and the occupation count (Claim with evidence); the two-year recommendation lost its unsupported figure (Claim with evidence); five Results sentences moved to the past tense ("may have explained", "so distance may have cut", "which illustrated", "may have mattered", "may have helped") (Tense per section).

The complete base-to-new text differences, `diff <base>/<draft>/<file> <cases>/<draft>/<file>`:

Command: `diff <base>/engineering/main.tex <cases>/engineering/main.tex`

```
8c8
< We compare a fixed worker pool with a growing worker pool for bounded task queues in server software. On four hosts the fixed pool raised throughput by 24 percent and lowered the 99th percentile latency from 410 to 190 microseconds.
---
> We compare a fixed worker pool with a growing worker pool for bounded task queues in server software. On four hosts the fixed pool raised throughput by 24 percent. It lowered the 99th percentile latency, the tail latency that 99 percent of tasks stayed below, from 410 to 190 microseconds.
31c31
< The correctness proof of this design fits into two pages (Jones, 2020).
---
> The correctness proof of this design fits into two pages (Jones, 2020), so the objection to this design concerns its cost.
```

Command: `diff <base>/engineering/sections.tex <cases>/engineering/sections.tex`

```
5c5
< The fixed pool started 64 worker threads at launch. The growing pool started 8 threads and added one thread whenever the queue held more than 2048 tasks.
---
> The fixed pool created 64 worker threads at launch. The growing pool created 8 threads and created one more thread whenever the queue held more than 2048 tasks.
31c31
< In recent years, hosts gained cores, so the pool sizes of this study started at 8 and 64 threads. Both starting sizes stayed below the core count of the smallest host.
---
> In recent years, hosts gained cores, so the thread counts of this study started at 8 and 64. Both thread counts stayed below the core count of the smallest host.
55c55
< The harness covered only x86 hosts, so the results do not extend to other architectures. All four hosts used processors from one vendor.
---
> The harness covered only x86 hosts, which limited the results to that architecture. All four hosts used processors from one vendor.
91c91
< The growing pool created 248 threads during each run. Creating them therefore took 6 percent of each run. Thread creation alone thus explains only part of the 24 percent gap.
---
> Thread creation explained only part of the 24 percent gap. The growing pool created 248 threads during each run. Each creation took 15 milliseconds. Creating the threads therefore took 3.7 seconds, 6 percent of each 60-second run, a quarter of the gap.
95c95
< The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced. A fixed pool may therefore scale with the core count of its host.
---
> The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced, which suggested that a fixed pool scales with the core count of its host.
119c119
< Only one queue size was tested, which limited the latency result to that size.
---
> Only one queue depth was tested, which limited the latency result to that depth.
125c125
< The fixed pool lowered the 99th percentile latency from 410 to 190 microseconds. The result confirms, for these hosts, the expectation that a fixed pool lowers the tail.
---
> The fixed pool lowered the 99th percentile latency from 410 to 190 microseconds. The result confirmed, for these hosts, the expectation that a fixed pool lowers the tail.
149c149
< The fixed pool allocates all 64 threads at launch, which removes thread creation from the request path. The growing pool allocates its threads one at a time.
---
> The fixed pool creates all 64 threads at launch, which removes thread creation from the request path. The growing pool creates its threads one at a time.
219c219
< The harness records each task twice. It stamps the submission time on entry. It stamps the completion time on exit. The host also reports memory use once per second. The harness writes the report after the run. A summary file holds the totals.
---
> The harness records each task twice. It stamps the submission time on entry. It stamps the completion time on exit. The host also reports memory use once per second, and a separate file keeps every sample. The harness writes the report after the run. A summary file holds the totals.
225c225
< We chose to report the 99th percentile because it exposes queueing delay. The 99th percentile is the latency that 99 percent of the tasks stayed below.
---
> We chose to report the 99th percentile because it exposes queueing delay. The 99th percentile is the latency that 99 percent of the tasks stay below.
253c253
< \subsection{Pool Size}
---
> \subsection{Thread Count}
255c255
< The pool size of 64 stayed below the 96 cores of the smallest host. The producers and the queue therefore kept cores of their own.
---
> The thread count of 64 stays below the 96 cores of the smallest host. The producers and the queue therefore keep cores of their own.
272c272
< The harness also records the temperature of each host once per minute. No run exceeded 80 degrees Celsius, so no processor slowed its clock.
---
> The harness also records the temperature of each host once per minute. No run exceeds 80 degrees Celsius, so no processor slows its clock.
```

Command: `diff <base>/medicine/main.tex <cases>/medicine/main.tex`

```
25c25
< We defined early mobilization as standing with a physiotherapist within 24 hours of surgery. Patients then walked twice a day. Usual care began on the second day.
---
> We defined early mobilization as standing with a physiotherapist within 24 hours of surgery. Patients in the early group then walked twice a day. Usual mobilization began on the second day.
29c29
< The authors enrolled the patients on the surgical ward.
---
> The authors enrolled the patients on the surgical ward. Patients were eligible if they could walk unaided before the fracture.
31,32d30
< Patients were eligible if they could walk unaided before the fracture.
< 
43c41
< Each group held 240 patients. All 480 patients completed follow-up and entered the analysis. With no loss to follow-up, attrition cannot account for the difference in readmission.
---
> Both groups of 240 patients completed follow-up and entered the analysis, so attrition could not account for the difference in readmission.
45c43
< By 30 days, a heart attack had occurred in two patients, both in the usual care group. The numbers were too small to compare the groups.
---
> By 30 days, a heart attack had occurred in two patients, both in the usual mobilization group. The numbers were too small to compare the groups.
47c45
< Mobilization began a median of 11 hours after surgery in the early group. The median lay inside the 24-hour target.
---
> Mobilization began a median of 11 hours after surgery in the early group, inside the 24-hour target.
49c47
< Length of stay had a median of 7 days in each group. Mortality at 90 days was 6 percent after early mobilization and 8 percent after usual care (RR 0.75, 95% CI [0.39, 1.43]). The trial thus gave no evidence that early mobilization changed either secondary outcome.
---
> The secondary outcomes did not differ between the groups. Length of stay had a median of 7 days in each group. Mortality at 90 days was 6 percent after early mobilization and 8 percent after usual mobilization (RR 0.75, 95% CI [0.39, 1.43]). Chance alone could explain that difference.
```

Command: `diff <base>/medicine/sections.tex <cases>/medicine/sections.tex`

```
3c3
< The cohort drew on the records of 310 consecutive patients aged 65 years or older. Mobilization time was taken from nursing notes.
---
> The cohort drew on the records of 310 consecutive patients aged 65 years or older. Mobilization time was taken from nursing notes. Mobilization within 24 hours of surgery counted as early and any later mobilization as usual.
7c7
< Obtaining ethics approval was a hassle that lasted four months.
---
> The ethics committee approved the use of the nursing notes after a hassle that lasted four months.
9c9
< The primary outcome matched the trial outcome.
---
> The primary outcome matched the trial outcome. Readmission was again recorded from hospital records for 30 days after discharge.
11c11
< The analysis adjusted for age and comorbidity score.
---
> The analysis adjusted for age and the Charlson comorbidity index, a weighted count of chronic diseases.
15c15
< Readmission occurred in 22 percent of the 140 patients mobilized early and in 31 percent of the 170 others. After adjustment, the odds ratio for readmission was 0.68 (95% CI [0.47, 0.98]), against a crude odds ratio of 0.63. Age and comorbidity probably explained little of the association.
---
> Readmission occurred in 22 percent of the 140 patients mobilized early and in 31 percent of the 170 patients with usual mobilization. After adjustment, the odds ratio for readmission was 0.68 (95% CI [0.47, 0.98]), against a crude odds ratio of 0.63. Age and comorbidity probably explained little of the association.
17c17
< Three cases of deep vein thrombosis were recorded in the cohort, a rate of 1 percent. All three occurred in patients mobilized after the first day. Late mobilization may have added to the risk of thrombosis.
---
> Three cases of deep vein thrombosis were recorded in the cohort, a rate of 1 percent. All three occurred in patients with usual mobilization. Usual mobilization may have added to the risk of thrombosis.
23c23
< The trial and the cohort agree in direction, which suggests that early mobilization reduces readmission.
---
> The trial and the cohort agree in direction, which suggests that early mobilization reduces readmission. The trial is randomized; the cohort is observational. Agreement between the two designs strengthens the finding.
25c25
< Both studies took place at one hospital, so the effect may differ elsewhere.
---
> Both studies come from one hospital, so the effect may differ elsewhere.
27c27
< Healthier patients, who could be mobilized earlier, may account for part of the cohort association.
---
> Healthier patients, who could be mobilized earlier, may account for part of the cohort association. Adjustment for age and comorbidity changed the odds ratio only from 0.63 to 0.68, which limits that explanation.
29c29
< The trial is randomized; the cohort is observational. Agreement between the two designs strengthens the finding.
---
> The effect shows in readmission, not in length of stay.
31c31
< The effect appears in readmission, not in length of stay.
---
> Hospitals that wish to test early mobilization could schedule physiotherapy on the day of surgery.
33,34d32
< Hospitals that wish to test the approach could schedule physiotherapy on the day of surgery.
< 
```

Command: `diff <base>/sciences/main.tex <cases>/sciences/main.tex`

```
2c2
< \title{Hedgerow Width and Ground Beetle Diversity on Arable Farms}
---
> \title{Hedgerow Width and Ground Beetle Species Richness on Arable Farms}
8c8
< We tested whether wider hedgerows hold more ground beetle species on arable farms. Across 24 plots on 12 farms, species richness rose by 3.1 species per additional metre of hedgerow width. A second survey found peak beetle activity in June.
---
> We tested whether wider hedgerows hold more ground beetle species on arable farms. Across 24 plots on 12 farms, species richness (species per plot) rose by 3.1 species per additional metre of hedgerow width. A second survey measured beetle activity as captures per month and found peak activity in June.
17c17
< The present survey related ground beetle richness to hedgerow width.
---
> The present survey related species richness to hedgerow width. The hypothesis was that wider hedgerows hold more species.
19,20d18
< Species richness, the number of species in a plot, was expected to rise with hedgerow width.
< 
23c21
< A total of 24 plots were sampled on 12 farms in an agricultural landscape of 40 square kilometres. Plots lay along hedgerows 1 to 7 m wide.
---
> A total of 24 plots were sampled on 12 farms in an agricultural landscape of 40 square kilometres. Plots lay along hedgerows 1 to 7 m wide. Each plot held one transect.
25c23
< Pitfall traps were placed 1 m apart along a 20 m transect.
---
> Pitfall traps were placed 1 m apart along a 20 m transect. Each trap held propylene glycol, which killed the beetles within 1 hour and preserved them for counting. The traps were emptied every 7 days from April to September.
31c29
< We kept the plots at least 100 m apart so that the samples stayed independent.
---
> We kept the plots at least 100 m apart so that the samples stayed independent. A limitation of the richness survey was that all plots lay in one region.
33c31
< The traps were emptied every 7 days from April to September.
---
> Hedgerow width was measured at 5 points per plot. The mean of the 5 values was used. Hedgerow age was taken from the farm records.
35c33
< A limitation of the richness survey was that all plots lay in one region.
---
> Beetles were counted in the laboratory under a microscope by two observers who worked independently. Their counts agreed for 97 percent of samples, and the counts were used without correction.
37,44d34
< Each trap held propylene glycol. The glycol killed the beetles within 1 hour. It also preserved them for counting.
< 
< Hedgerow width was measured at 5 points per plot. The mean of the 5 values was used.
< 
< Beetles were counted in the laboratory under a microscope.
< 
< Two observers counted each sample independently. Their counts agreed for 97 percent of samples, and the counts were used without correction.
< 
47c37
< Species richness rose by 3.1 species per additional metre of hedgerow width (95% CI [2.2, 4.0]). Mean richness was 12.3 species per plot (SD = 2.1). Because the interval excluded zero, width and richness were positively associated.
---
> Species richness rose by 3.1 species per additional metre of hedgerow width (95% CI [2.2, 4.0]). Mean species richness was 12.3 species per plot (SD = 2.1). Because the interval excluded zero, width and species richness were positively associated.
49c39
< Plots wider than 5 m held 16 species on average. Richness therefore kept rising at the wide end of the width range.
---
> Plots wider than 5 m held 16 species on average, 3.7 species above the mean of all plots. That excess agrees with the positive association between width and species richness.
51c41
< Three species occurred only in the widest hedgerows. None occurred in hedgerows narrower than 3 m. Width may have decided which species could persist.
---
> Three species occurred only in hedgerows wider than 6 m, so width may have decided which species could persist.
53c43
< Richness did not depend on farm size (r = 0.12, p = .58). Farm size was an unlikely source of the width effect.
---
> Species richness did not depend on farm size (r = 0.12, p = .58). Farm size was an unlikely source of the width effect.
55c45
< Wide hedgerows held 9 forest specialists and narrow hedgerows held 2. The difference may reflect the shade that wide hedgerows offered these species.
---
> Hedgerows wider than 5 m held 9 forest specialists, species that live mainly in woodland, and hedgerows narrower than 3 m held 2. The difference may have reflected the shade that the wider hedgerows offered these species.
56a47,48
> Hedgerow age rose with width (r = 0.64, p = .001), so the older hedgerows were also the wider ones.
> 
```

Command: `diff <base>/sciences/sections.tex <cases>/sciences/sections.tex`

```
3c3
< A second survey recorded when ground beetles were most active.
---
> A second survey recorded when ground beetles were most active. Beetles were sampled along hedgerows.
5c5
< Beetles were sampled along hedgerows.
---
> Species were identified with the keys of Luff (2007).
7,8d6
< Species were identified from published keys.
< 
13c11
< Beetle activity peaked in June, with 41 percent of all captures. Activity fell below 5 percent per month after August. Beetles were therefore most active in early summer.
---
> Beetle activity peaked in June, with 41 percent of all captures. Activity fell below 5 percent per month after August.
17c15
< The timing of activity showed no link to hedgerow width (F = 0.8, p = .45). Width thus appeared to shape how many species a plot held and to leave their season of activity unchanged.
---
> The timing of activity showed no link to hedgerow width (F = 0.8, p = .45). Width thus appeared to shape the number of species in a plot and to leave their season of activity unchanged.
21c19
< Wider hedgerows hold more species, which suggests that width adds habitat. The result extends earlier work on hedgerows as shelter for beetles (Lang, 2016) to the width of the hedgerow.
---
> In these plots, wider hedgerows hold more species, which suggests that width adds habitat. The result extends earlier work on hedgerows as shelter for beetles (Lang, 2016) to the width of the hedgerow.
25c23
< Older hedgerows are wider in this sample, so age may explain part of the gain. A survey of hedgerow age on the same plots would separate the two effects.
---
> Older hedgerows are wider in this sample, so age may explain part of the gain. A model with age and width together would separate the two effects.
```

Command: `diff <base>/social/main.tex <cases>/social/main.tex`

```
17c17
< The study followed residents of two towns that merged in 2019.
---
> Merged municipalities now serve 18 percent of residents in the country (Statistics Office, 2022). The study followed residents of two towns that merged in 2019.
19,20d18
< Merged municipalities now serve 18 percent of residents in the country (Statistics Office, 2022).
< 
29c27
< The interview guide asked about services and about contact with the council.
---
> The interview guide asked about services and about contact with the council. Each interview lasted 45 minutes. Interviews were recorded and transcribed.
33c31
< Each interview lasted 45 minutes. Interviews were recorded and transcribed.
---
> Each transcript was coded twice for themes of distance and voice, the sense of being heard by the council.
35,36d32
< Each transcript was coded twice for themes of distance and voice.
< 
41c37
< The merger brought better services in the view of six participants. Each of them lived within 5 km of the new town hall, which may explain the view.
---
> The merger brought better services in the view of six participants. Each of them lived within 5 km of the new town hall. That proximity may have explained the view.
43c39
< Without a local office, participants faced a trip of 20 to 40 minutes to the new town hall. Four of them stopped visiting, which suggests that distance cut their contact with the council.
---
> Without a local office, participants faced a trip of 20 to 40 minutes to the new town hall. Four of them stopped visiting, so distance may have cut their contact with the council.
47c43
< One participant said that the council "stopped listening." The quotation illustrates the loss of voice that 15 participants described.
---
> One participant said that the council "stopped listening," which illustrated the loss of voice that 15 participants described.
```

Command: `diff <base>/social/sections.tex <cases>/social/sections.tex`

```
3c3
< A mailed survey tested whether losing a local office lowered trust.
---
> A mailed survey tested whether losing a local office lowered trust. We operationalized trust as agreement with five statements on a 5-point scale.
5,6d4
< We operationalized trust as agreement with five statements on a 5-point scale.
< 
15c13
< The questionnaire had 18 items and took 10 minutes to complete. It was tested on 20 residents before mailing.
---
> The survey had 18 items and took 10 minutes to complete. It was tested on 20 residents before mailing.
19c17
< Respondents who had lost a local office reported lower trust than the others (mean 2.9 against 3.6, p below .001). The difference was 0.7 points on the 5-point scale. Losing an office was therefore associated with lower trust.
---
> Respondents who had lost a local office reported lower trust than the others (mean 2.9 against 3.6, p below .001). The difference was 0.7 points on the 5-point scale.
21c19
< The respondents were a mixed bag in age and occupation.
---
> The respondents were a mixed bag in age and occupation, with ages from 22 to 87 years and 31 occupations.
23c21
< Trust rose with years of residence (r = .18, p below .001) and showed no link to age (r = .04, p = .41). Years of residence may matter more to trust than age.
---
> Trust rose with years of residence (r = .18, p below .001) and showed no link to age (r = .04, p = .41). Years of residence may have mattered more to trust than age.
25c23
< Trust was lowest among residents who lived more than 10 km from the new town hall (mean 2.6). Distance may help to explain the pattern that the interviews described.
---
> Trust was lowest among residents who lived more than 10 km from the new town hall (mean 2.6). Distance may have helped to explain the pattern that the interviews described.
27c25
< Response rates were similar in the two towns, at 33 and 35 percent. Neither town dominated the sample.
---
> Response rates were similar in the two towns, at 33 and 35 percent, so neither town dominated the sample.
33c31
< Interviewees were recruited at the public library, so they may differ from residents who never visit it.
---
> Participants were recruited at the public library, so they may differ from residents who never visit it.
37c35
< The interviews suggest a mechanism; the survey shows its size. Together they point to a loss of voice.
---
> The interviews suggest a mechanism; the survey shows its size.
39c37
< Local offices give residents a place to be heard (Abara, 2017).
---
> Local offices give residents a place to be heard (Abara, 2017). A longer trip to the town hall may reduce contact with the council.
41c39
< A longer trip to the town hall may reduce contact with officials.
---
> The loss appears to concern voice, not service quality, since six participants described better services.
43c41
< The loss appears to concern voice, not service quality, since six participants described a gain in services.
---
> We suggest that councils consider keeping a local office open after a merger.
45,46d42
< We suggest that councils keep a local office open for two years after a merger.
< 
```

## For each fault of `3-gate-reading.md` that item 2 closes

Row counts of `expected.md` per draft, break / clean, before then after: engineering 70 / 56 then 66 / 56; medicine 6 / 11 then 4 / 11; sciences 4 / 12 then 4 / 12; social 7 / 12 then 4 / 12. The rows removed are the nine second rows of a passage that now stands in one row (engineering: the "B" dash row, the "B" ASCII row of the two arrow passages, "Engineering and CS / Register" and "Engineering and CS / Terminology"; medicine: "Medicine and Health / Register" and "Medicine and Health / Terminology"; social: "Social Sciences / Register", "Social Sciences / Terminology" and "Social Sciences / What the reader looks for"). The break rows of those passages stay, each naming the rule of the removed row.

### Engineering

- `sections.tex:19` / paragraph 28, "modern server" (one rule named for a passage that breaks four). Passage before and after: `The benchmark ran on a modern server.` (unchanged). Rows before: `Precision / Most specific term ... naming Engineering and CS / Terminology on a line of its own.` and a second row `Engineering and CS / Terminology | break ... Stands once, in Precision / Most specific term; the finding names this rule.` Row after: `Precision / Most specific term ... naming Common style errors / Vague phrase, Engineering and CS / Register and Engineering and CS / Terminology, each on a line of its own.`
- `sections.tex:171` to `:179` / paragraphs 104 to 108, the five dash passages (second rule not named). Passages unchanged. Rows before: five rows `0. Hard rules / Em dash: zero` (the first naming `B. Punctuation / Em dash and dash-as-aside` on a line of its own, the other four `naming B. Punctuation / Em dash and dash-as-aside` and, for `:177` and `:179`, `B. Punctuation / ASCII throughout`) and the separate row `B. Punctuation / Em dash and dash-as-aside: zero (see 0) | break | ... | The five passages of the five rows above. | Each stands once, in the group 0. Hard rules / Em dash: zero, and the finding names this rule.` Rows after: the same five rows, now the only rows of the passages; the separate row is removed.
- `sections.tex:209` and `:211` / paragraphs 123 and 124, the arrows. The row at `:209` named `B. Punctuation / ASCII throughout`, which the reading questioned because `->` is ASCII. The bullet it names reads "ASCII throughout: straight quotes, three dots, `+/-`, `~`, `->` only in code", so `->` in prose breaks it by the bullet's own words, and the row keeps naming it. Rows before: two rows `0. Hard rules / Arrows (`->`) only inside code and code comments ... naming B. Punctuation / ASCII throughout` and the separate row `B. Punctuation / ASCII throughout | break | sections.tex:209, 211 | ... | Each stands once, in 0. Hard rules / Arrows, and the finding names this rule.` Rows after: the two arrow rows, unchanged, naming the rule; the separate row is removed.
- `sections.tex:13` / paragraph 25, "bailed out" (`:13` names no Register in the report). Passage unchanged. Row before: `Formality / No colloquial words ... naming Engineering and CS / Register on a line of its own` and a second row `Engineering and CS / Register | break ... Stands once, in Formality / No colloquial words; the finding names this rule.` Row after: the first row only.
- `sections.tex:223` / paragraph 130, "We believe ...". The row named `Paragraphs / Claim with evidence or citation` already; the report left it out. Row and passage unchanged.
- `sections.tex:119`, "queue size". Before: `Only one queue size was tested, which limited the latency result to that size.` After: `Only one queue depth was tested, which limited the latency result to that depth.`
- `main.tex:8`, "99th percentile latency" defined late. Before: `On four hosts the fixed pool raised throughput by 24 percent and lowered the 99th percentile latency from 410 to 190 microseconds.` After: `On four hosts the fixed pool raised throughput by 24 percent. It lowered the 99th percentile latency, the tail latency that 99 percent of tasks stayed below, from 410 to 190 microseconds.`
- `main.tex:31`, the correctness-proof paragraph. Before: `The correctness proof of this design fits into two pages (Jones, 2020).` After: `The correctness proof of this design fits into two pages (Jones, 2020), so the objection to this design concerns its cost.`
- `sections.tex:91` / paragraph 64 (landing sentences; Transitions and First sentence states the point). Before: `The growing pool created 248 threads during each run. Creating them therefore took 6 percent of each run. Thread creation alone thus explains only part of the 24 percent gap.` After: `Thread creation explained only part of the 24 percent gap. The growing pool created 248 threads during each run. Each creation took 15 milliseconds. Creating the threads therefore took 3.7 seconds, 6 percent of each 60-second run, a quarter of the gap.` (248 times 15 milliseconds is 3.72 seconds; 3.72 over 60 is 6.2 percent; 6 over 24 is a quarter.) Rows: `Transitions / Transition that states the relation | clean` before `The growing pool created 248 threads during each run. Creating them therefore took 6 percent of each run.`, after `Each creation took 15 milliseconds. Creating the threads therefore took 3.7 seconds, 6 percent of each 60-second run, a quarter of the gap.`; the `Vague qualifiers` clean row at paragraph 64 keeps its passage `The growing pool created 248 threads during each run.`
- `sections.tex:95` / paragraph 66 (landing sentence; Sentence length). Before: two sentences, `The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced. A fixed pool may therefore scale with the core count of its host.` After, one sentence: `The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced, which suggested that a fixed pool scales with the core count of its host.` Row before: `E. Sentence shapes / Sentence length | break` with the first sentence as passage, `(30 words)`. Row after: the whole sentence as passage, `(44 words)`.
- `sections.tex:149` / paragraph 93, "allocates". Before: `The fixed pool allocates all 64 threads at launch, which removes thread creation from the request path. The growing pool allocates its threads one at a time.` After: `The fixed pool creates all 64 threads at launch, which removes thread creation from the request path. The growing pool creates its threads one at a time.` The clean row's passage reads "creates".
- `sections.tex:159` / paragraph 98 and paragraph 128 (second rules the rows did not name). Paragraph 98: row before `D. Structure / No rule of three`, row after the same naming `Paragraphs / Claim with evidence or citation (the claim is followed by no data) on a line of its own`; the passage is unchanged. Paragraph 128 (`sections.tex:219`, Sentence length run): sentence 4 before `The host also reports memory use once per second.`, after `The host also reports memory use once per second, and a separate file keeps every sample.`, so the six sentences are no longer a run of near-equal length; the row names only `Paragraphs cover one idea ... (six sentences, two ideas)`, as before, with the new sentence in its passage.
- `sections.tex:103` / paragraph 70. The report named `Engineering and CS / Terminology` for the memory claim with no figure; the row now names it (row before `Paragraphs / Claim with evidence or citation (the claim is followed by no data)`, after `... , naming Engineering and CS / Terminology (no memory figure is stated) on a line of its own`).
- Not in the gate reading's list, found by the reading of every sentence: `sections.tex:5`, before `The fixed pool started 64 worker threads at launch. The growing pool started 8 threads and added one thread whenever the queue held more than 2048 tasks.`, after `The fixed pool created 64 worker threads at launch. The growing pool created 8 threads and created one more thread whenever the queue held more than 2048 tasks.`; `:31`, before `In recent years, hosts gained cores, so the pool sizes of this study started at 8 and 64 threads. Both starting sizes stayed below the core count of the smallest host.`, after `In recent years, hosts gained cores, so the thread counts of this study started at 8 and 64. Both thread counts stayed below the core count of the smallest host.` (the Vague phrase break row's passage updated); `:55`, before `The harness covered only x86 hosts, so the results do not extend to other architectures.`, after `The harness covered only x86 hosts, which limited the results to that architecture.`; `:125`, `confirms` became `confirmed`; `:225`, `stayed below` became `stay below`; `:253` and `:255`, `\subsection{Pool Size}` and `The pool size of 64 stayed below the 96 cores of the smallest host. The producers and the queue therefore kept cores of their own.` became `\subsection{Thread Count}` and `The thread count of 64 stays below the 96 cores of the smallest host. The producers and the queue therefore keep cores of their own.`; `:272`, `No run exceeded 80 degrees Celsius, so no processor slowed its clock.` became `No run exceeds 80 degrees Celsius, so no processor slows its clock.` Their rows (the Headings clean row, the bolded-closer clean row, the Vague phrase break row) carry the new passages.
- The Vary paragraph length row (paragraphs 5 to 10): before `no other run of paragraphs in the draft has the same sentence count and length.`, after `the longest other run of consecutive paragraphs with one sentence count is 4 (1 sentence each, 6 to 19 words: paragraphs 23 to 26, 35 to 38 and 55 to 58).` See the judgment calls.

### Medicine

- `medicine/main.tex:25`, `:45`, `:49` and docx paragraphs 10, 20, 22 ("usual care"). Before: `Usual care began on the second day.` / `both in the usual care group` / `8 percent after usual care`. After: `Usual mobilization began on the second day.` / `both in the usual mobilization group` / `8 percent after usual mobilization`.
- `sections.tex:17`, "Late mobilization" and "the 170 others". Before: `... in 31 percent of the 170 others.` and `All three occurred in patients mobilized after the first day. Late mobilization may have added to the risk of thrombosis.` After: `... in 31 percent of the 170 patients with usual mobilization.` and `All three occurred in patients with usual mobilization. Usual mobilization may have added to the risk of thrombosis.`
- `sections.tex:21` to `:33`, the six one-sentence Discussion paragraphs (Vary paragraph length). After: the Discussion holds six paragraphs of 1, 3, 1, 2, 1 and 1 sentences (docx paragraphs 32 to 37); the clean row "the whole draft" names the counts for all 29 body paragraphs.
- `sections.tex:31`, "appears". Before: `The effect appears in readmission, not in length of stay.` After: `The effect shows in readmission, not in length of stay.` (the binary-contrast clean row's passage).
- `main.tex:43` (landing sentence; First sentence states the point). Before: `Each group held 240 patients. All 480 patients completed follow-up and entered the analysis. With no loss to follow-up, attrition cannot account for the difference in readmission.` After: `Both groups of 240 patients completed follow-up and entered the analysis, so attrition could not account for the difference in readmission.`
- Docx paragraph 26 / `sections.tex:7` ("a hassle"; the report named Clarity test where the row named Register). Before: `Obtaining ethics approval was a hassle that lasted four months.` After: `The ethics committee approved the use of the nursing notes after a hassle that lasted four months.` The passage now carries a method fact, so the Clarity test does not apply; rows before `Medicine and Health / Register | break ... Stands once, in Formality / No colloquial words` and `Formality / No colloquial words | break ... naming Medicine and Health / Register`, row after the second only.
- Docx paragraph 28, "comorbidity score" with no named score. Before: `The analysis adjusted for age and comorbidity score.` After: `The analysis adjusted for age and the Charlson comorbidity index, a weighted count of chronic diseases.`
- Docx paragraph 37 (First sentence states the point). Before: `The trial is randomized; the cohort is observational. Agreement between the two designs strengthens the finding.` After: `The trial and the cohort agree in direction, which suggests that early mobilization reduces readmission. The trial is randomized; the cohort is observational. Agreement between the two designs strengthens the finding.`
- Docx paragraph 39, "the approach". Before: `Hospitals that wish to test the approach could schedule physiotherapy on the day of surgery.` After: `Hospitals that wish to test early mobilization could schedule physiotherapy on the day of surgery.`
- Rows. `Medicine and Health / Terminology` and `Precision / Most specific term` (`main.tex:45`, now `main.tex:43`, paragraph 19): rows before `Medicine and Health / Terminology | break ... Stands once, in Precision / Most specific term` and `Precision / Most specific term | break ... naming Medicine and Health / Terminology`, row after the second only, with the passage `By 30 days, a heart attack had occurred in two patients, both in the usual mobilization group.` The "What the reader looks for" row (Cohort Methods heading) and the Voice row keep their rules; the paragraph numbers moved (23 to 22, 12 unchanged).

### Sciences

- Three rows that named one rule for two (`sections.tex:15`, `main.tex:27`, `sections.tex:1`). Rows before: `Sciences (Natural, Applied) / Register | break | sections.tex:15 ... We were delighted to find Carabus auratus in the third hedgerow. | Reported under Sciences (Natural, Applied) / Register (the text is not impersonal).`; `Sciences (Natural, Applied) / Terminology | break | main.tex:27 ... Soil moisture was sampled 6 inches below the surface. | Reported under Sciences (Natural, Applied) / Terminology (a measurement not in SI units).`; `Sciences (Natural, Applied) / What the reader looks for | break | sections.tex:1 ... Activity Method (the heading) | Reported under Sciences (Natural, Applied) / What the reader looks for: the section gives no number of traps, plots, days or dates.` Rows after (passages unchanged, places `sections.tex:13`, `main.tex:25`, `sections.tex:1`; paragraphs 28, 10, 22): `Reader's path / Clarity test` naming `Sciences (Natural, Applied) / Register` on a line of its own; `Reader's path / Clarity test` naming `Sciences (Natural, Applied) / Terminology` on a line of its own (soil moisture is used in no later paragraph: `grep -n -i -c 'moisture'` printed 1 for `sciences/main.tex` and 0 for `sections.tex`); `Reader's path / So what per section` (the Methodology row asks the section to show rigor, and the section gives no number of traps, plots, days or dates) naming `Sciences (Natural, Applied) / What the reader looks for`.
- `sections.tex:13`, "Beetles were therefore most active in early summer." (Restating closes). Removed; the paragraph is `Beetle activity peaked in June, with 41 percent of all captures. Activity fell below 5 percent per month after August.`
- `main.tex:19`, the passive definition (landing sentence). Before: `Species richness, the number of species in a plot, was expected to rise with hedgerow width.` After: `The hypothesis was that wider hedgerows hold more species.` The abstract defines the term: `species richness (species per plot)`.
- `main.tex:8`, "species richness" before its definition and the title. Before: `Across 24 plots on 12 farms, species richness rose by 3.1 species per additional metre of hedgerow width. A second survey found peak beetle activity in June.` and the title `Hedgerow Width and Ground Beetle Diversity on Arable Farms`. After: `Across 24 plots on 12 farms, species richness (species per plot) rose by 3.1 species per additional metre of hedgerow width. A second survey measured beetle activity as captures per month and found peak activity in June.` and `Hedgerow Width and Ground Beetle Species Richness on Arable Farms`.
- `sections.tex:21`, the unhedged generalization. Before: `Wider hedgerows hold more species, which suggests that width adds habitat.` After: `In these plots, wider hedgerows hold more species, which suggests that width adds habitat.`
- `main.tex:49` (landing sentence; Transitions). Before: `Plots wider than 5 m held 16 species on average. Richness therefore kept rising at the wide end of the width range.` After: `Plots wider than 5 m held 16 species on average, 3.7 species above the mean of all plots. That excess agrees with the positive association between width and species richness.` (16 less the mean of 12.3 is 3.7.) The Register clean row and the Terminology clean row (`Mean species richness was 12.3 species per plot (SD = 2.1).`) carry the new passages.
- `sections.tex:25`, age with no data. Before: `A survey of hedgerow age on the same plots would separate the two effects.` After: `A model with age and width together would separate the two effects.`, with the data: `Hedgerow age was taken from the farm records.` (`main.tex:31`) and `Hedgerow age rose with width (r = 0.64, p = .001), so the older hedgerows were also the wider ones.` (`main.tex:47`).
- `sections.tex:7`, "published keys". Before: `Species were identified from published keys.` After: `Species were identified with the keys of Luff (2007).`
- Docx paragraphs 1, 2, 25 and 23. The title (above), the abstract (above), `Wide hedgerows held 9 forest specialists and narrow hedgerows held 2.` became `Hedgerows wider than 5 m held 9 forest specialists, species that live mainly in woodland, and hedgerows narrower than 3 m held 2.`, and `Three species occurred only in the widest hedgerows. None occurred in hedgerows narrower than 3 m.` became `Three species occurred only in hedgerows wider than 6 m, so width may have decided which species could persist.`
- Vary paragraph length runs (`main.tex:25` to `:35`, `sections.tex:3` to `:9`). After: the one-sentence method paragraphs are merged; the clean row names 28 body paragraphs of 1 (10), 2 (14) and 3 (4) sentences and no run of three equal counts.

### Social

- `sections.tex:21` / paragraph 32 ("a mixed bag"; the report named Claim with evidence where the row named Register). Before: `The respondents were a mixed bag in age and occupation.` After: `The respondents were a mixed bag in age and occupation, with ages from 22 to 87 years and 31 occupations.` Rows before: `Social Sciences / Register | break ... Stands once, in Formality / No colloquial words` and `Formality / No colloquial words | break ... naming Social Sciences / Register`; row after the second only (now `sections.tex:19`, paragraph 29).
- `sections.tex:37` (the punchy closing sentence). Before: `The interviews suggest a mechanism; the survey shows its size. Together they point to a loss of voice.` After: `The interviews suggest a mechanism; the survey shows its size.`
- Vary paragraph length at six runs. After: the clean row names 32 body paragraphs of 1 (14), 2 (16) and 3 (2) sentences and no run of three equal counts.
- `sections.tex:15` and `:33`, "questionnaire" and "Interviewees". Before: `The questionnaire had 18 items and took 10 minutes to complete.` / `Interviewees were recruited at the public library, so they may differ from residents who never visit it.` After: `The survey had 18 items and took 10 minutes to complete.` / `Participants were recruited at the public library, so they may differ from residents who never visit it.`
- `sections.tex:19`, the restating close. Before: `Respondents who had lost a local office reported lower trust than the others (mean 2.9 against 3.6, p below .001). The difference was 0.7 points on the 5-point scale. Losing an office was therefore associated with lower trust.` After: the first two sentences.
- `main.tex:35`, "voice" before its definition. Before: `Each transcript was coded twice for themes of distance and voice.` (the definition stood in the results). After: `Each transcript was coded twice for themes of distance and voice, the sense of being heard by the council.`
- `sections.tex:45`, the two-year figure. Before: `We suggest that councils keep a local office open for two years after a merger.` After: `We suggest that councils consider keeping a local office open after a merger.`
- Docx paragraphs 38 and 42 (synonyms), 31 (restating close), 15 and 44 are the same passages as above in the docx numbering; paragraph 40 (an unhedged interpretation, `Together they point to a loss of voice.`) is the cut sentence above.
- Rows. `Social Sciences / Terminology` and `Precision / Term defined at first use` (`sections.tex:7`, paragraph 25, now `sections.tex:5`, paragraph 22): rows before `Social Sciences / Terminology | break ... Stands once, in Precision / Term defined at first use` and `Precision / Term defined at first use | break ... naming Social Sciences / Terminology`; row after `Precision / Term defined at first use ... naming Reader's path / Clarity test (no later paragraph uses it) and Social Sciences / Terminology, each on a line of its own` (`grep -n -i 'attachment' social/main.tex social/sections.tex` printed the one line `sections.tex:5`). `Social Sciences / What the reader looks for` and `Reader's path / So what per section` (Interview Method heading): rows before the two rows `Stands once ...` and `naming Social Sciences / What the reader looks for`, row after the second only.

## Every judgment call the brief left open

- Where the new bullets stand: after the bullet on the manuscript and grant rules and before the bullets on the form of a finding, so that the checks come before the report is written.
- The two nested lists name the four kinds of rule the brief names, in the brief's order, as noun phrases; the bullets name rule kinds by what their words judge and name no prose-standard rule.
- "type" for "kind" (glossary).
- The kept-rule bullet "A rule the draft keeps has no group and no line in the report." stands as its own bullet, beside the base bullet "Under a group heading write the findings and no other line.", because the brief asks the prompt to say it.
- The changed two-rule bullet is two sentences of 17 words, not one of 34.
- The merged rows follow the order "the group it stands in, then each other rule"; a rule of `references/registers.md` is named after the rule of the prose standard or `references/rules.md` that the passage also breaks, so a passage that breaks a register rule and a `references/rules.md` rule stands in the `references/rules.md` group.
- Whether a passage breaks `Reader's path / Clarity test`: where the paragraph holds one sentence that no later paragraph uses (sciences "delighted" and "6 inches", social "place attachment") the row names it. The medicine "hassle" sentence was rewritten to carry the committee's approval of the use of the notes, a method fact, so its row does not name Clarity test; the three others (sciences "delighted" and "6 inches", social "place attachment") are paragraphs whose removal loses nothing, so they break Clarity test by its words, and their rows stand under it or name it.
- Engineering "Vary paragraph length": the base wording "no other run of paragraphs in the draft has the same sentence count and length" does not say what counts as a run, and the draft holds runs of four one-sentence paragraphs (paragraphs 23 to 26, 35 to 38 and 55 to 58), in the base as well. The row now states the longest other run (4) and its lengths, so the sentence is true of the file; those runs are not break rows, as in the base (the gate reading listed no report under them).
- Tense per section in the short drafts' Methods and Results: the present-tense clauses of the Results sections ("cannot account", "suggests", "illustrates", "may matter", "may help", "may explain", "may reflect") were put into the past ("could not account", "so distance may have cut", "which illustrated", "may have mattered", "may have helped", "may have explained", "may have reflected"), since the rule's words give the tense of the section. The first run did not report them, so no row depends on them.
- Evidence followed by what it means: sciences paragraph 17 (wide plots) had two figures and no interpretation after the Transitions sentence was cut; it now ends in `That excess agrees with the positive association between width and species richness.`
- The engineering `.html` keeps its two `<ol>` lists (the lists the "Lists are introduced with a colon" rows read); the brief bans `<ul>`, `&nbsp;` and tables only.
- `docx` remaking: `textutil -convert docx draft.html -output draft.docx` was run from each draft's folder after each batch of html edits; `docx_paragraphs.py` prints the final texts (Check 2).

## Host- or user-visible changes

- The `/writing` review agent's prompt (`skills/writing/SKILL.md`, "Review agent prompt"). Before: 26 bullet lines (`awk` of the section from "## Review agent prompt" to "## Stops", `grep -c -E '^ *- '`), one two-rule bullet, no bullet that makes the agent check a section rule against every section, a first-sentence rule against every paragraph or a whole-draft rule against the whole draft, and none for a count outside a finding, a kept rule or a passage against every other rule. After: 41 bullet lines (the 15 new lines hold two nested lists of four; the two-rule bullet is replaced by a bullet for any number of rules). The file grows from 127 to 142 lines; `metadata.version` stays "1.0.0".
- The case files (a test fixture of the `writing` skill, in the scratch folder until the session copies them): before and after in the sections above. They are not read by any user-facing command.

## Anything in the brief that was wrong or impossible

- Nothing in the brief was wrong or impossible. Its counts hold on the base: `SKILL.md` 127 lines (`git show 8ff6ed7:skills/writing/SKILL.md | wc -l` printed 127), `expected.md` 242 lines (`wc -l` printed 242), line 4 of `expected.md` as quoted (`sed -n 4p` printed `The expected results are read against the reports of step 3 and are never changed after them.`).
