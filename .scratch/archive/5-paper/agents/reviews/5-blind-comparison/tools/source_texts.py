import base64, glob, json, os, re, sys
# usage: source_texts.py <out dir> <temp folder prefix> <session folder> <session jsonl>...
# Writes each tool result of the given transcripts that returned a fetched source:
# a WebFetch result, the result of a shell call that runs curl, and the result of a
# Read, Grep or shell call that names a file under the temp folder prefix (the side's
# downloads) or under the session's tool-results folder. A result saved to a file
# because it was too large is written with that file's text. Each text goes to
# source-NNN.txt, its image blocks to source-NNN-<k>.<ext>, and index.md maps each
# file to the identifiers or URLs it was fetched by.
out, tmp, session = sys.argv[1], sys.argv[2], sys.argv[3]
transcripts = sys.argv[4:]
os.makedirs(out, exist_ok=True)
tool_results = os.path.join(session, 'tool-results')
url_rx = re.compile(r'https?://[^\s"\'<>`|]+')
saved_rx = re.compile(r'Full output saved to: (\S+)')

def names(tool, inp):
    if tool == 'WebFetch':
        return [inp.get('url', '')]
    text = ' '.join(str(v) for v in inp.values())
    found = [u.rstrip('\\.,;:') for u in url_rx.findall(text)] if 'curl' in text else []
    found += re.findall(r'\b10\.\d{4,9}/[^\s"\'`|;]+[^\s"\'`|;.,]', text)
    found += re.findall(r'(?<![\d./])\d{4}\.\d{4,5}(?:v\d+)?(?![\d/])', text)
    for p in re.findall(re.escape(tmp) + r'[^\s"\'`|;)]*', text):
        if '/ordo-lookup-' not in p and '.' in os.path.basename(p):
            found.append(os.path.basename(p))
    if tool_results in text:
        found.append('a result the side saved earlier')
    return found

def wanted(tool, inp):
    text = json.dumps(inp)
    if tool == 'WebFetch':
        return True
    if tool == 'Bash' and re.search(r'\bcurl\b', inp.get('command', '')):
        return True
    if tool in ('Read', 'Grep', 'Bash'):
        hits = [p for p in re.findall(re.escape(tmp) + r'[^\s"\'`|;)]*', text) if '/ordo-lookup-' not in p]
        return bool(hits) or tool_results in text
    return False

calls, n, index = {}, 0, []
for f in transcripts:
    for line in open(f, encoding='utf-8'):
        try:
            d = json.loads(line)
        except ValueError:
            continue
        m = d.get('message') or {}
        content = m.get('content')
        if not isinstance(content, list):
            continue
        if d.get('type') == 'assistant':
            for x in content:
                if x.get('type') == 'tool_use' and wanted(x['name'], x.get('input', {})):
                    calls[x['id']] = (x['name'], x.get('input', {}))
        elif d.get('type') == 'user':
            for x in content:
                if x.get('type') != 'tool_result' or x.get('tool_use_id') not in calls:
                    continue
                tool, inp = calls[x['tool_use_id']]
                n += 1
                stem = 'source-%03d' % n
                c = x.get('content')
                blocks = [{'type': 'text', 'text': c}] if isinstance(c, str) else (c or [])
                parts, k = [], 0
                for b in blocks:
                    if b.get('type') == 'text':
                        t = b.get('text', '')
                        s = saved_rx.search(t)
                        if s and os.path.isfile(s.group(1)):
                            t = open(s.group(1), encoding='utf-8', errors='replace').read()
                        parts.append(t)
                    elif b.get('type') == 'image':
                        k += 1
                        src = b.get('source', {})
                        ext = (src.get('media_type', 'image/png').split('/')[-1])
                        open(os.path.join(out, '%s-%d.%s' % (stem, k, ext)), 'wb').write(base64.b64decode(src.get('data', '')))
                        parts.append('[image %s-%d.%s]' % (stem, k, ext))
                body = '\n'.join(parts)
                label = ', '.join(dict.fromkeys(names(tool, inp))) or 'no identifier in the call'
                open(os.path.join(out, stem + '.txt'), 'w', encoding='utf-8').write('Fetched by: ' + label + '\n\n' + body + '\n')
                index.append('- %s.txt: %s (%d characters%s)' % (stem, label, len(body), ', %d images' % k if k else ''))
open(os.path.join(out, 'index.md'), 'w', encoding='utf-8').write('# Source texts\n\n' + '\n'.join(index) + '\n')
print('%d source texts written to %s' % (n, out))
