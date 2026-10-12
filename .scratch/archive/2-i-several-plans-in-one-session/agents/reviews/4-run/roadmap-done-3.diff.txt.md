--- 2i-run-2/docs/roadmap.md 2026-10-12 22:53:26
+++ roadmap-done-3.md 2026-10-12 23:29:01
@@ -25,13 +25,6 @@
 - Gate: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` prints 1 (line 3 is the opening paragraph); `sh tests/guide.test.sh` prints `PASS: docs/guide.md`; `sh tests/guide.test.sh <a file whose first line is not a title>` and `sh tests/guide.test.sh <a file with a title line and a tab>` each print a `FAIL:` line; `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` prints 1.
 - Waits on: nothing.
 
-## 3. The guide's usage line and its FAQ
-
-- Status: [ ]
-- Goal: The opening paragraph of `docs/guide.md` gains, right after the install sentence, a sentence naming `sh run.sh <name>` as the command to run once `sh install.sh` has run. `docs/faq.md` holds two questions about the guide. `docs/faq.md` names the test command of entry 5.
-- Gate: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` prints 1 (the usage sentence is the sentence right after the install sentence, in the opening paragraph); `head -1 docs/faq.md` prints `# FAQ`; `grep -c '^## .*?$' docs/faq.md` prints 2; each of the two questions, read in place, is about the guide and is followed by a paragraph that answers it; `grep -c -F 'sh tests/guide.test.sh' docs/faq.md` prints 1.
-- Waits on: entry 5's test command, for the FAQ's naming of it only.
-
 # Not yet specified
 
 <!-- An entry:
@@ -46,6 +39,8 @@
 
 <!-- - [x] <n>. <title>: <the gate's command> printed <its summary line> -->
 
+- [x] 3. The guide's usage line and its FAQ: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` printed `1`; `head -1 docs/faq.md` printed `# FAQ`; `grep -c '^## .*?$' docs/faq.md` printed `2`; the two questions, read in place on lines 3 and 7, are about the guide and are each followed by a paragraph that answers it; `grep -c -F 'sh tests/guide.test.sh' docs/faq.md` printed `1`
+
 # Dropped
 
 <!-- - <n>. <title>: <the reason> -->
