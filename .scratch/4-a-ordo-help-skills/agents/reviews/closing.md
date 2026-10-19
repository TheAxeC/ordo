Plan 4.A ordo-help skills: priced usage of its agents
Prices from /Users/axelfaes/.local/share/ordo-stable/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies: none, so every cost is a lower bound.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     1       36     74          335380               0     4312054     645      >=1.71
brief check                 2       71    142          330063               0     8302320     829      >=3.33
reviewer                    2       78    156          331699               0     8731499    1880      >=3.44
reviewer over a round       2       35     70          246583               0     3107493     480      >=1.24
Total                       7      220    442         1243725               0    24453366    3834      >=9.72

Agent              Role                             Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a157a6a4203c3d078  builder of step 1                claude-sonnet-5-5       36     74          335380               0     4312054     645      >=1.71
aa44557b3704429d8  brief check of step 1            claude-opus-5-5         33     66          157068               0     3692435     263      >=1.53
a53a068ce215da323  brief check of step 2            claude-opus-5-5         38     76          172995               0     4609885     566      >=1.80
a6c49cd6b72bbc846  reviewer of step 1               claude-opus-5-5         33     66          150805               0     3255791     708      >=1.42
a196390485e816956  reviewer of step 2               claude-opus-5-5         45     90          180894               0     5475708    1172      >=2.02
a248c71344ddb9568  reviewer of step 1 over round 1  claude-sonnet-5-5       14     28          108278               0     1166973     116      >=0.51
af7ac9ea3e0384a8b  reviewer of step 2 over round 1  claude-sonnet-5-5       21     42          138305               0     1940520     364      >=0.74
