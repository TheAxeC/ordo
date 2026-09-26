"""Prose checks over Markdown: semicolons per 1000 words of running prose, sentences past a word limit, and a sentence ending shared by three or more sentences."""
import re, sys, glob, collections
LIMIT_PROSE, LIMIT_CELL = 40, 45
bad = 0
files = sys.argv[1:] or sorted(glob.glob('docs/*.md') + glob.glob('docs/dev/*.md') + glob.glob('skills/*/SKILL.md') + ['README.md'])
for path in files:
    fence = None; front = 0; words = 0; semis = []; ends = collections.defaultdict(list)
    for n, line in enumerate(open(path, encoding='utf-8'), 1):
        s = line.strip()
        if n == 1 and s == '---': front = 1; continue
        if front == 1:
            if s == '---': front = 2
            continue
        m = re.match(r'(`{3,}|~{3,})', s)
        if m:
            fence = None if fence and s.startswith(fence) else (fence or m.group(1)); continue
        if fence or not s or s.startswith('#') or re.fullmatch(r'[|\- :]+', s): continue
        cell = s.startswith('|')
        text = re.sub(r'`[^`]*`', 'X', s)
        parts = [p for p in text.split('|') if p.strip()] if cell else [text]
        for p in parts:
            for sent in re.split(r'(?<=[.!?])\s+', p.strip(' -*0123456789.')):
                w = re.findall(r"[A-Za-z0-9'X]+", sent)
                if not cell:
                    words += len(w)
                limit = LIMIT_CELL if cell else LIMIT_PROSE
                if len(w) > limit:
                    print(f"{path}:{n}: a sentence of {len(w)} words (limit {limit})"); bad = 1
                if len(w) >= 6:
                    ends[' '.join(x.lower() for x in w[-3:])].append(n)
        if not cell and ';' in text:
            semis += [n] * text.count(';')
    if words and len(semis) * 1000 > 2 * words and len(semis) > 2:
        print(f"{path}: {len(semis)} semicolons in {words} words of running prose (at most 2 per 1000)"); bad = 1
    for e, lines in ends.items():
        if len(set(lines)) >= 3:
            print(f"{path}:{','.join(map(str, sorted(set(lines))))}: {len(set(lines))} sentences end \"{e}\""); bad = 1
sys.exit(bad)
