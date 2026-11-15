import json, os, re, sys, shutil
# usage: blind.py <rules.json> <src dir> <dst dir> <log file>
# rules.json: {"paths": [[old_prefix, new_prefix], ...], "text": [[regex, replacement], ...]}
rules = json.load(open(sys.argv[1])); src, dst, logf = sys.argv[2], sys.argv[3], sys.argv[4]
log = open(logf, 'a')
for root, _, files in os.walk(src):
    for f in sorted(files):
        p = os.path.join(root, f); rel = os.path.relpath(p, src); new = rel
        for old, rep in rules['paths']:
            new = new.replace(old, rep)
        out = os.path.join(dst, new); os.makedirs(os.path.dirname(out), exist_ok=True)
        if new != rel: log.write(f"path: {rel} -> {new}\n")
        try:
            t = open(p, encoding='ascii').read()
        except UnicodeDecodeError:
            shutil.copy(p, out); log.write(f"binary kept whole: {new}\n"); continue
        for rx, rep in rules['text']:
            t, n = re.subn(rx, rep, t)
            if n: log.write(f"text: {new}: {n} x /{rx}/ -> {rep!r}\n")
        open(out, 'w', encoding='ascii').write(t)
