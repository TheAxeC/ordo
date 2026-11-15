import json, sys, re
# usage: audit.py <copy root> <jsonl>...
root = sys.argv[1]
for fn in sys.argv[2:]:
    print("==", fn)
    for line in open(fn):
        try: d = json.loads(line)
        except Exception: continue
        if d.get("type") == "system" and d.get("subtype") == "init":
            print("init model", d.get("model"), "skills", len(d.get("skills", [])), "cwd", d.get("cwd"))
        if d.get("type") == "result":
            print("result", d.get("subtype"), "denials", d.get("permission_denials"), "models", list(d.get("modelUsage", {}).keys()))
        if d.get("type") != "assistant": continue
        for c in d.get("message", {}).get("content", []):
            if c.get("type") != "tool_use": continue
            n, i = c["name"], c.get("input", {})
            if n == "Skill": print("SKILL", i)
            s = json.dumps(i)
            for p in re.findall(r'(/(?:Users|private|tmp|var|etc|opt|home)[^"\s\\\']*)', s):
                if not p.startswith(root): print("OUTSIDE", n, p[:160])
