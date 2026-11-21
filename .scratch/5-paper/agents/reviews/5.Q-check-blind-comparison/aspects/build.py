# Builds the aspect judges' copies: python3 build.py
import os, shutil, subprocess, json, random, difflib, re
Q='/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate5q'
OUT='/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/aspect'
FR=Q+'/full-rc18/paper-runs/full-2026-11-21/patches'
RR=Q+'/revision-rc18/paper-runs/revision-2026-11-21/patches'
rules=json.load(open(Q+'/fullj/rules-full-rc18.json'))['text']
def blind(t):
    for rx,rep in rules: t=re.sub(rx,rep,t)
    return t
def rd(p): return open(p,encoding='utf-8').read()
def full_input(d):
    subprocess.run(f"cd {Q}/full-rc18 && git archive de865a4 code notes RESULTS.md | tar -x -C {d}",shell=True,check=True)
    p=d+'/RESULTS.md'; s=rd(p); s=s.replace(", then draft via the `academic-paper` skill.",", then draft the paper."); open(p,'w').write(s)
    shutil.copytree(Q+'/fullj/pages',d+'/pages')
def rev_input(d):
    src=Q+'/judge-rev-rc18-1'
    for x in ['admin','code','manuscript','sources']: shutil.copytree(src+'/'+x,d+'/input/'+x)
    shutil.copytree(src+'/outputs/pages',d+'/pages')
def pairs_file(pairs, flip):
    # each pair (before, after); writes changed paragraphs as version 1 / version 2
    out=[]; key=[]
    for i,(b,a) in enumerate(pairs,1):
        B=blind(rd(b)).split('\n'); A=blind(rd(a)).split('\n')
        sm=difflib.SequenceMatcher(None,B,A,autojunk=False)
        hb=[];ha=[]
        for op,i1,i2,j1,j2 in sm.get_opcodes():
            if op!='equal':
                hb.append('\n'.join(B[i1:i2]) or '(nothing)'); ha.append('\n'.join(A[j1:j2]) or '(nothing)')
        r=random.Random(i*7+1).random()<0.5
        if flip==2: r=not r
        v1,v2=(ha,hb) if r else (hb,ha)
        key.append(f"change {i}: version 1 is {'after' if r else 'before'}")
        out.append(f"## Change {i}\n")
        for k,(x,y) in enumerate(zip(v1,v2),1):
            out.append(f"### Change {i}, place {k}, version 1\n\n```\n{x}\n```\n\n### Change {i}, place {k}, version 2\n\n```\n{y}\n```\n")
    return '\n'.join(out), key
EXCL=open(OUT+'/excl.txt').read()
setups={}
def mk(name, n, inputf, files, prompt, keylines):
    d=f"{OUT}/judge-{name}-{n}"; shutil.rmtree(d,ignore_errors=True); os.makedirs(d)
    inputf(d)
    for rel,content in files.items():
        p=d+'/'+rel; os.makedirs(os.path.dirname(p),exist_ok=True); open(p,'w').write(content)
    open(f"{OUT}/prompt-{name}-{n}.txt",'w').write(prompt+'\n\n'+EXCL)
    open(f"{OUT}/key-{name}-{n}.txt",'w').write('\n'.join(keylines)+'\n')
for n in (1,2):
    # 1 full writing pass: before = 29, after = 31
    b,a=blind(rd(FR+'/29-main.tex.patched')),blind(rd(FR+'/31-main.tex.patched'))
    A,B=(a,b) if n==1 else (b,a)
    mk('fullwriting',n,full_input,{'versions/version-A/main.tex':A,'versions/version-B/main.tex':B},open(OUT+'/p-writing-full.txt').read(),[f"version-A is {'after' if n==1 else 'before'} the pass"])
    # 2 full incremental checks
    pf=[(FR+'/07-main.tex.patched',FR+'/10-main.tex.patched'),(FR+'/10-main.tex.patched',FR+'/13-main.tex.patched'),(FR+'/31-main.tex.patched',FR+'/32-main.tex.patched'),(FR+'/32-main.tex.patched',FR+'/34-main.tex.patched'),(FR+'/34-main.tex.patched',FR+'/37-main.tex.patched'),(FR+'/37-main.tex.patched',FR+'/40-main.tex.patched')]
    t,k=pairs_file(pf,n)
    mk('fullchecks',n,full_input,{'changes.md':t,'refs.bib':blind(rd(Q+'/full-rc18/manuscript/refs.bib'))},open(OUT+'/p-checks.txt').read(),k)
    # 3 revision writing pass: before = 09, after = 12
    b,a=blind(rd(RR+'/09-main.tex.patched')),blind(rd(RR+'/12-main.tex.patched'))
    A,B=(a,b) if n==1 else (b,a)
    mk('revwriting',n,rev_input,{'versions/version-A/main.tex':A,'versions/version-B/main.tex':B},open(OUT+'/p-writing-rev.txt').read(),[f"version-A is {'after' if n==1 else 'before'} the pass"])
    # 4 revision incremental checks
    t,k=pairs_file([(RR+'/05-main.tex.patched',RR+'/07-main.tex.patched'),(RR+'/12-main.tex.patched',RR+'/14-main.tex.patched')],n)
    mk('revchecks',n,rev_input,{'changes.md':t,'refs.bib':blind(rd(Q+'/revision-rc18/manuscript/refs.bib'))},open(OUT+'/p-checks-rev.txt').read(),k)
    # 5 claim check: paper final vs academic-paper final
    L='/Users/axelfaes/workspace/ordo/.scratch/5-paper/agents/reviews/5-blind-comparison/full/output-B/run/final'
    P={'main.tex':blind(rd(Q+'/full-rc18/manuscript/main.tex')),'refs.bib':blind(rd(Q+'/full-rc18/manuscript/refs.bib'))}
    AP={'main.tex':rd(L+'/manuscript.tex'),'refs.bib':rd(L+'/references.bib')}
    X,Y=(P,AP) if n==1 else (AP,P)
    files={f'manuscripts/manuscript-A/{f}':c for f,c in X.items()}; files.update({f'manuscripts/manuscript-B/{f}':c for f,c in Y.items()})
    mk('claims',n,full_input,files,open(OUT+'/p-claims.txt').read(),[f"manuscript-A is {'paper' if n==1 else 'academic-paper'}"])
print('built')
