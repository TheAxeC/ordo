import re, sys
# usage: resolve_record.py <out.md> <resolve output>... ; later outputs replace earlier blocks of the same key
blocks, order = {}, []
for f in sys.argv[2:]:
    for b in re.split(r'(?m)^(?=### )', open(f, encoding='utf-8').read()):
        if not b.startswith('### '): continue
        k = b.split('\n', 1)[0][4:].strip()
        if k not in blocks: order.append(k)
        blocks[k] = (f.rsplit('/', 1)[-1], b.rstrip() + '\n')
def resolves(b):
    m = re.search(r"doi=(\S+)", b.split('\n')[1]); doi = m.group(1).lower() if m and m.group(1) != 'None' else None
    for line in b.split('\n')[3:]:
        r = re.search(r'ratio ([0-9.]+)', line)
        if not r or float(r.group(1)) < 0.70: continue
        if doi is None: return True
        d = re.search(r'\| doi (\S+)', line)
        if d and d.group(1).lower() == doi: return True
    return False
res = [k for k in order if resolves(blocks[k][1])]; un = [k for k in order if k not in res]
out = open(sys.argv[1], 'w', encoding='utf-8')
out.write(f"entries {len(order)}, resolved {len(res)}, not resolved {len(un)}: {', '.join(un)}\n\n")
for k in order:
    src, b = blocks[k]
    out.write(f"{'resolved' if k in res else 'NOT RESOLVED'} ({src})\n\n```\n{b}```\n\n")
