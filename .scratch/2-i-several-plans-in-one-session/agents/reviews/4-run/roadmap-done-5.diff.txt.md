--- 2i-run-2/docs/roadmap.md 2026-10-12 22:53:26
+++ roadmap-done-5.md 2026-10-12 23:21:39
@@ -18,13 +18,6 @@
 - Waits on: <entry numbers with the reason, or nothing>
 -->
 
-## 5. The guide's install line and its test
-
-- Status: [ ]
-- Goal: The opening paragraph of `docs/guide.md` gains a sentence naming the install command `sh install.sh`. A test `tests/guide.test.sh` checks the guide's form, and its command is in `docs/dev/building.md`.
-- Gate: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` prints 1 (line 3 is the opening paragraph); `sh tests/guide.test.sh` prints `PASS: docs/guide.md`; `sh tests/guide.test.sh <a file whose first line is not a title>` and `sh tests/guide.test.sh <a file with a title line and a tab>` each print a `FAIL:` line; `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` prints 1.
-- Waits on: nothing.
-
 ## 3. The guide's usage line and its FAQ
 
 - Status: [ ]
@@ -46,6 +39,8 @@
 
 <!-- - [x] <n>. <title>: <the gate's command> printed <its summary line> -->
 
+- [x] 5. The guide's install line and its test: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` printed `1`; `sh tests/guide.test.sh` printed `PASS: docs/guide.md`; `sh tests/guide.test.sh <a file whose first line is not a title>` printed `FAIL: <that file>: the first line is not a title`; `sh tests/guide.test.sh <a file with a title line and a tab on line 3>` printed `FAIL: <that file>: line 3 holds a tab`; `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` printed `1`
+
 # Dropped
 
 <!-- - <n>. <title>: <the reason> -->
