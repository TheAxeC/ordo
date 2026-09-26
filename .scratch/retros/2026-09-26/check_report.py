"""Check a step report: every line the verify runner printed is quoted verbatim, and every path the step changed is named in backticks with a line count on its line.

Usage: report_check.py <report> <verify output> <from commit> <to commit>
"""
import subprocess, sys, re
report, vout, a, b = sys.argv[1:5]
text = open(report, encoding='utf-8').read()
lines = text.splitlines()
bad = 0
for v in open(vout, encoding='utf-8').read().splitlines():
    if v.strip() and not v.startswith('exit ') and v not in lines and v not in text:
        print(f"{report}: the verify line is not quoted: {v}"); bad = 1
paths = subprocess.run(['git', 'diff', '--name-only', a, b, '--', '.', ':(exclude).scratch'], capture_output=True, text=True, check=True).stdout.split()
for p in paths:
    hits = [l for l in lines if f'`{p}`' in l]
    if not hits:
        print(f"{report}: the changed file is not named: {p}"); bad = 1
    elif not any(re.search(r'\d', l.replace(f'`{p}`', '')) for l in hits):
        print(f"{report}: the changed file has no line count: {p}"); bad = 1
sys.exit(bad)
