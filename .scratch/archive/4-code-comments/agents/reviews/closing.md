Plan 4. code-comments: priced usage of its agents
Prices from /Users/axelfaes/.local/share/ordo-stable/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies: none, so every cost is a lower bound.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     3      200    406         1302034               0    39556077    7543     >=11.24
brief check                 2       77    154          407475               0    11121420    3467      >=4.33
reviewer                    3      138    276          580666               0    19829101    2559      >=6.92
reviewer over a round       2       65    130          321167               0     8092346     879      >=2.43
grill lookup                1       28     56           74926               0     1600522     655      >=0.71
Total                      11      508   1022         2686268               0    80199466   15103     >=25.63

Agent              Role                              Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a506da4c91c7ab7a8  builder of step 1                 claude-sonnet-5-5       71    146          562502               0    13825519    1048      >=4.18
af40906f8aa8074f1  builder of step 1a                claude-sonnet-5-5      110    222          624211               0    24100234    4780      >=6.43
a40a88b2b9f6d4594  builder of step 1b                claude-sonnet-5-5       19     38          115321               0     1630324    1715      >=0.63
a0c9f327f17f5773c  brief check of step 1             claude-opus-5-5         39     78          221778               0     5991048     643      >=2.32
ac9dd04a4278294c4  brief check of step 1a            claude-opus-5-5         38     76          185697               0     5130372    2824      >=2.01
a1303ca1b092c3c67  reviewer of step 1                claude-opus-5-5         44     88          216339               0     6594878     553      >=2.41
acaa6da129278eb92  reviewer of step 1a               claude-opus-5-5         53    106          240516               0     9034677    1182      >=3.03
a419e24d4ce17de1e  reviewer of step 1b               claude-opus-5-5         41     82          123811               0     4199546     824      >=1.48
a9ba00623e6a89399  reviewer of step 1 over round 1   claude-sonnet-5-5       30     60          159206               0     3544213     402      >=1.11
a8e96a35d67f32122  reviewer of step 1a over round 1  claude-sonnet-5-5       35     70          161961               0     4548133     477      >=1.32
a62d70475a1f1e686  grill lookup                      claude-opus-5-5         28     56           74926               0     1600522     655      >=0.71
