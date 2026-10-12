Plan 5. The guide's install line and its test: priced usage of its agents
Prices from /Users/axelfaes/.local/share/ordo-stable/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     2        0     60          171911               0     1757023   28943        1.07
brief check                 1        0     26           82165               0      920934   21076        0.60
reviewer                    2        0     34          144180               0     1154275   24902        0.84
reviewer over a round       1        0     28           80053               0      972848   12182        0.52
Total                       6        0    148          478309               0     4805080   87103        3.03

Agent              Role                             Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
afc9aa3f92bc74bf1  builder of step 1                claude-sonnet-5-5        0     14           39615               0      324053    4722        0.21
a7ac8220a5207dd70  builder of step 2                claude-sonnet-5-5        0     46          132296               0     1432970   24221        0.86
a3a6121993983092e  brief check of step 2            claude-sonnet-5-5        0     26           82165               0      920934   21076        0.60
a5daed14247e301df  reviewer of step 1               claude-sonnet-5-5        0     10           49887               0      234533    6280        0.23
affe0b4b29ffefabd  reviewer of step 2               claude-sonnet-5-5        0     24           94293               0      919742   18622        0.61
a3df69c2e3d5202dc  reviewer of step 2 over round 1  claude-sonnet-5-5        0     28           80053               0      972848   12182        0.52
