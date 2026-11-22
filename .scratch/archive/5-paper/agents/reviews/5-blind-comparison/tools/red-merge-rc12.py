import json,re,sys,glob,os
S='/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad'
R=S+'/gate5f/raw-paper/run'
P=glob.glob(os.path.expanduser('~/.claude/projects/*gate5f-lit-review-rc12/5e3eeaa0-*.jsonl'))[0]
targets={}
for l in open(P):
    d=json.loads(l)
    if d.get('type')!='assistant': continue
    for c in d['message'].get('content',[]):
        if c.get('type')=='tool_use' and c['name'] in('Agent','Task'):
            m=re.search(r'Theme (\d)',c['input'].get('description',''))
            t=re.search(r'Target (\d+) to (\d+) included sources',c['input'].get('prompt',''))
            if m and t: targets[int(m.group(1))]=(int(t.group(1)),int(t.group(2)))
fails=0
for k in sorted(targets):
    n=len(re.findall(r'^@',open(f'{R}/refs-theme-{k}.bib').read(),re.M))
    rep=open(f'{R}/review-theme-{k}.md').read()
    held=re.findall(r'[^\n|]*(?:hold the target|held out to the target|theme cap|over the target|above the target|beyond the target)[^\n|]*',rep)
    print(f'part 1, theme {k}: {n} included, target {targets[k][0]} to {targets[k][1]}: ' + ('RED, ends at the top of its range' if n==targets[k][1] else 'green'))
    print(f'part 2, theme {k}: {len(held)} exclusions or cuts naming the target: ' + ('RED' if held else 'green'))
    for h in held[:3]: print('   ', h.strip()[:160])
    fails+= (n==targets[k][1]) + bool(held)
rev=open(f'{R}/review.md').read()
added=len(re.findall(r'Added by this merge run',rev))
print(f'part 3, merge: {added} sources added by the merge run against 23 and 40 in academic-paper runs: ' + ('RED' if added<=5 else 'green'))
fails+= added<=5
print('red command:', 'RED' if fails else 'GREEN', f'({fails} assertions red)'); sys.exit(1 if fails else 0)
