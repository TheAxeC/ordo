# The cases of step 6a after its first review, and a prototype of the round-1 rulings run over them.
# Run: python3 -B round1-cases.py
import re
SENT=re.compile(r"(.*?)(?:[.;](?:\s|$)|$)")   # first sentence: up to . or ; followed by space or end
WHOLE=re.compile(r"(none|nothing|no findings?|no defects?|otherwise none|checked, no defects?)( found| here)?",re.I)
def nothing(item):
    return bool(WHOLE.fullmatch(SENT.match(item.strip()).group(1)))
NEG=re.compile(r"\b(not|no|only|still|partly|in part|but|except|however|apart from|fails?|failed)\b|\?",re.I)
CL=[re.compile(r"closed(?::.*)?",re.I|re.S), re.compile(r"[^:]+: closed",re.I),
    re.compile(r"closures checked, all hold(?::.*)?",re.I|re.S), re.compile(r"checked and holding(?::.*)?",re.I|re.S)]
def closure(item):
    s=item.strip(); first=SENT.match(s).group(1)
    if not any(p.fullmatch(first) for p in CL): return False
    if NEG.search(first): return False
    rest=s[len(first):].lstrip(".; ")
    if re.match(r"(but|except|however|apart from)\b",rest,re.I): return False
    return True
nf_drop=["None.","None found.","Nothing.","Nothing found.","Nothing here.","No findings.","No finding.","No defects.","No defect.","No defect found.","Otherwise none.","Checked, no defects."]
nf_keep=["None: the report reproduces.","None of the eleven cases fails.","None of the reverts turns the test red: a.py:3 is untested.","Nothing says what happens when the check fails: the page is silent.","No defect test covers the tab case.","No finding in the report names the file.","Nothing rejects a relative path.","No findings are listed for step 3, although it has two.","Nothing found by the test, although a.py:3 is wrong.","Nothing else: the ASCII check is clean.","No defect in the new check.","No defect: src/a.py:3 divides by zero.","Nothing: the page at docs/a.md:4 is silent."]
cl_drop=["Closed.","Closed: the fix at a.py:3 holds.","Spec 1: closed.","Spec 1: closed; the rerun reproduces, not only the test.","Closures checked, all hold: Spec 1, Proof 2.","Checked and holding: Spec 1.","Proof 1 (see 6-report.md): closed."]
cl_keep=["Spec 2: closed in part only; the tab case is still missing.","Proof 1, claimed closed: closed is not what the rerun shows.","Closed? No: src/a.py:7 still fails.","Spec 3: not closed.","Closed only for the codex path.","Closures checked; Spec 2 does not hold: a.py:4.","Closed: the fix does not hold at a.py:3.","Closed: only the claude path.","Closed: the fix at a.py:3 holds only for the codex path.","Closed, but the fix fails at a.py:3.","Spec 1: closed, but a.py:3 fails.","Closed: but a.py:3 fails.","Closures checked, all hold except Spec 2: a.py:4.","Checked and holding, except Spec 2 at a.py:4.","Closed; except the tab case.","Spec 1: closed;see a.py:3."]
bad=0
for c in nf_drop:
    if not nothing(c): print("NF should drop:",c); bad+=1
for c in nf_keep:
    if nothing(c): print("NF should keep:",c); bad+=1
for c in cl_drop:
    if not closure(c): print("CL should drop:",c); bad+=1
for c in cl_keep:
    if closure(c): print("CL should keep:",c); bad+=1
print("contradictions:",bad,"cases:",len(nf_drop)+len(nf_keep)+len(cl_drop)+len(cl_keep))
