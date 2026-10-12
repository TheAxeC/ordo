Plan 5. The guide's install line and its test: priced usage of its agents
Prices from /Users/axelfaes/.local/share/ordo-stable/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     2        0     76          157875               0     2803526   45818        1.41
brief check                 1        0     30           85517               0      976537   35289        0.76
reviewer                    2        0     34          128712               0     1056978   22473        0.76
reviewer over a round       1        0     20           69780               0      623127   14607        0.45
Total                       6        0    160          441884               0     5460168  118187        3.38

Agent              Role                             Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a5398469161450042  builder of step 1                claude-sonnet-5-5        0     16           43122               0      385942    4979        0.23
a9c4b36b1a7ccc304  builder of step 2                claude-sonnet-5-5        0     60          114753               0     2417584   40839        1.18
ab9154be194d9c2f8  brief check of step 2            claude-sonnet-5-5        0     30           85517               0      976537   35289        0.76
a0406117ec1eed592  reviewer of step 1               claude-sonnet-5-5        0     12           48129               0      302307    6088        0.24
a99b21923806479bc  reviewer of step 2               claude-sonnet-5-5        0     22           80583               0      754671   16385        0.52
a23e65e6307fe3c6a  reviewer of step 2 over round 1  claude-sonnet-5-5        0     20           69780               0      623127   14607        0.45
