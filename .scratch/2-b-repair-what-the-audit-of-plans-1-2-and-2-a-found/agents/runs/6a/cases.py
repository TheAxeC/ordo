# The cases of brief 6a, and a prototype of its two decisions run over them.
# Run: python3 -B cases.py
import re
FIRST=re.compile(r"(.*?)(?:[.:;](?:\s|$)|$)")
NONE=re.compile(r"none\b",re.I)
WHOLE=re.compile(r"(nothing|no findings?|no defects?|otherwise none|checked, no defects?)( found| here)?",re.I)
def nothing(item):
    s=item.strip(); first=FIRST.match(s).group(1)
    return bool(NONE.match(s) or WHOLE.fullmatch(first))
CL=[re.compile(r"closed(?:[.;:](?:\s|$)|$)",re.I),
    re.compile(r"[^:?]{1,60}: closed(?:[.;](?:\s|$)|$)",re.I),
    re.compile(r"closures checked, all hold(?:[.:;](?:\s|$)|$)",re.I),
    re.compile(r"checked and holding(?:[.:;](?:\s|$)|$)",re.I)]
NEG=re.compile(r"\b(not|no|only|still|partly|in part)\b|\?",re.I)
def closure(item):
    s=item.strip(); first=re.match(r"[^.;]*",s).group(0)
    if NEG.search(first): return False
    return any(p.match(s) for p in CL)
nf_drop=["None.","None found.","None: the report reproduces.","None of the eleven cases fails.","Nothing.","Nothing found.","No findings.","No finding.","No defects.","No defect.","No defect found.","Otherwise none.","Checked, no defects.","Nothing here."]
nf_keep=["Nothing says what happens when the check fails: the page is silent.","No defect test covers the tab case.","No finding in the report names the file.","Nothing rejects a relative path.","No findings are listed for step 3, although it has two.","Nothing found by the test, although a.py:3 is wrong."]
cl_drop=["Closed.","Closed: the fix at a.py:3 holds.","Spec 1: closed.","Spec 1: closed; the rerun reproduces, not only the test.","Closures checked, all hold: Spec 1, Proof 2.","Checked and holding: Spec 1."]
cl_keep=["Spec 2: closed in part only; the tab case is still missing.","Proof 1, claimed closed: closed is not what the rerun shows.","Closed? No: src/a.py:7 still fails.","Spec 3: not closed.","Closed only for the codex path.","Closures checked; Spec 2 does not hold: a.py:4.","Closed: the fix does not hold at a.py:3.","Closed: only the claude path."]
bad=0
for c in nf_drop:
    if not nothing(c): print("NF should drop:",c); bad+=1
for c in nf_keep:
    if nothing(c): print("NF should keep:",c); bad+=1
for c in cl_drop:
    if not closure(c): print("CL should drop:",c); bad+=1
for c in cl_keep:
    if closure(c): print("CL should keep:",c); bad+=1
print("contradictions:",bad, "cases:",len(nf_drop)+len(nf_keep)+len(cl_drop)+len(cl_keep))
