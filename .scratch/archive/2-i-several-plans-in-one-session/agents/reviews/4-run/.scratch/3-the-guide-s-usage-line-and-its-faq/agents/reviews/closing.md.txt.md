Plan 3. The guide's usage line and its FAQ: priced usage of its agents
Prices from /Users/axelfaes/.local/share/ordo-stable/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role      Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder        3        0     54          125407               0     1308415   17144        0.75
reviewer       3        0     44          150163               0     1113962   23164        0.83
Total          6        0     98          275570               0     2422377   40308        1.58

Agent              Role                Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a115b0da88ae3351b  builder of step 1   claude-sonnet-5-5        0     20           41716               0      485487    6412        0.27
aa0e9d44326c1ae87  builder of step 2   claude-sonnet-5-5        0     14           40218               0      322675    5410        0.22
a762551a7c79dd83a  builder of step 3   claude-sonnet-5-5        0     20           43473               0      500253    5322        0.26
a8a41fe99a8b7fb42  reviewer of step 1  claude-sonnet-5-5        0     14           48104               0      354392    5907        0.25
a9ee783bdb416bde3  reviewer of step 2  claude-sonnet-5-5        0     12           48507               0      294653    7781        0.26
ab949a5723e4a311d  reviewer of step 3  claude-sonnet-5-5        0     18           53552               0      464917    9476        0.32
