import json, sys, glob, os, re
G = sys.argv[1]
def scan(files, root=None):
    sid = mod = None; sk = []; ag = 0; den = []; models = set(); outside = []; tools = skills = None
    for f in files:
        for l in open(f):
            try: o = json.loads(l)
            except: continue
            if o.get("type") == "system" and o.get("subtype") == "init":
                sid = sid or o["session_id"]; mod = mod or o.get("model"); tools = o.get("tools"); skills = o.get("skills")
            if o.get("type") == "assistant":
                for c in o["message"].get("content", []):
                    if c.get("type") != "tool_use": continue
                    if c["name"] == "Skill": sk.append(c["input"].get("skill"))
                    if c["name"] in ("Agent", "Task"): ag += 1
                    if root and c["name"] in ("Read", "Glob", "Grep"):
                        p = c["input"].get("file_path") or c["input"].get("path") or root
                        if not os.path.abspath(os.path.join(root, p)).startswith(root): outside.append(p)
            if o.get("type") == "result":
                den += [d.get("tool_name") for d in o.get("permission_denials", [])]; models |= set(o.get("modelUsage", {}).keys())
    return sid, mod, sk, ag, den, sorted(models), outside, tools, skills
def instr(sid, d):
    for T in glob.glob(os.path.expanduser(f"~/.claude/projects/*{d}/{sid}.jsonl")):
        for l in open(T):
            o = json.loads(l); a = o.get("attachment")
            if o.get("type") == "attachment" and isinstance(a, dict) and a.get("type") == "instructions":
                return [x.get("path") if isinstance(x, dict) else x for x in a.get("files", [])]
    return None
for side in ["lit-review-1", "lit-review-2", "revision-1", "full-1", "full-2"]:
    sid, mod, sk, ag, den, models, _, _, _ = scan(sorted(glob.glob(f"{G}/{side}-turn*.jsonl")))
    inf = instr(sid, "gate5-" + side)
    print(f"SIDE {side}: session {sid}; init model {mod}; Skill calls {sk or 'none'}; Agent calls {ag}; denied {den or 'none'}; modelUsage {models}; instruction files {len(inf) if inf else inf}")
for j in sys.argv[2:] or ["judge-lit-review-1", "judge-lit-review-2", "judge-revision-1", "judge-revision-2", "judge-full-1", "judge-full-2"]:
    root = f"{G}/{j}"
    sid, mod, sk, ag, den, models, outside, tools, skills = scan([f"{G}/{j}.jsonl"], root)
    inf = instr(sid, "gate5-" + j)
    print(f"JUDGE {j}: session {sid}; init model {mod}; tools {tools}; skills {skills}; modelUsage {models}; denied {den or 'none'}; instruction files {len(inf) if inf else inf}; reads outside the copy {outside or 'none'}")
