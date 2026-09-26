"""Print each pair of lines of one SKILL.md that share a run of 8 words, outside the frontmatter and fenced code."""
import re, sys, glob, collections
bad = 0
for path in sys.argv[1:] or sorted(glob.glob('skills/*/SKILL.md')):
    seen = collections.defaultdict(set)
    fence, front = None, 0
    for n, line in enumerate(open(path, encoding='utf-8'), 1):
        s = line.strip()
        if front < 2 and s == '---':
            front += 1
            continue
        if front == 1:
            continue
        m = re.match(r'(`{3,}|~{3,})', s)
        if m:
            fence = None if fence and s.startswith(fence) else (fence or m.group(1))
            continue
        if fence or re.fullmatch(r'[|\- :]+', s):
            continue
        words = re.findall(r"[a-z0-9_`'/.-]+", s.lower())
        for i in range(len(words) - 7):
            seen[' '.join(words[i:i + 8])].add(n)
    pairs = collections.OrderedDict()
    for k, lines in sorted(seen.items(), key=lambda x: sorted(x[1])):
        if len(lines) > 1:
            pairs.setdefault(tuple(sorted(lines)), k)
    for lines, k in pairs.items():
        print(f"{path}:{','.join(map(str, lines))}: {k}")
        bad = 1
sys.exit(bad)
