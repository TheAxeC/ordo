import re, sys, subprocess, time
bib, lookup = sys.argv[1], sys.argv[2]
text = open(bib, encoding="utf-8").read()
def field(body, name):
    m = re.search(r'\b' + name + r'\s*=\s*', body, re.I)
    if not m: return None
    i = m.end()
    if body[i] in '{"':
        close = '}' if body[i] == '{' else '"'
        depth, j = 0, i
        while j < len(body):
            c = body[j]
            if c == '{': depth += 1
            elif c == '}': depth -= 1
            if (close == '}' and depth == 0 and c == '}') or (close == '"' and c == '"' and j > i): break
            j += 1
        return body[i+1:j].strip()
    m2 = re.match(r'[^,}\s]+', body[i:]); return m2.group(0) if m2 else None
only = set(sys.argv[3].split(',')) if len(sys.argv) > 3 and sys.argv[3] else None
pause = float(sys.argv[4]) if len(sys.argv) > 4 else 2
for m in re.finditer(r'@(\w+)\s*\{\s*([^,\s]+)\s*,', text):
    start = m.end(); mm = re.compile(r'\n[ \t]*@\w+\s*\{').search(text, start); nxt = mm.start() if mm else len(text)
    body = text[start:nxt]
    key, title, year, doi = m.group(2), field(body, 'title'), field(body, 'year'), field(body, 'doi')
    if only and key not in only: continue
    title = re.sub(r'[{}]', '', title or '').replace('&amp;', '&')
    cmd = ['python3', lookup, 'resolve', title] + (['--year', year] if year else [])
    out = subprocess.run(cmd, capture_output=True, text=True).stdout
    print(f"### {key}\nentry: title={title!r} year={year} doi={doi}\n$ {' '.join(repr(c) if ' ' in c else c for c in cmd[1:])}\n{out}", flush=True)
    time.sleep(pause)
