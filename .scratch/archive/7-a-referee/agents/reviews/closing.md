Plan 7.A referee: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/orchestration/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies: none, so every cost is a lower bound.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     2       76    164         1362135               0    14631473  221490     >=25.41
brief check                 2       22     46          363851               0     2279378   60778      >=6.53
reviewer                    2       27     54          333398               0     3200629   71882      >=6.85
reviewer over a round       4       50    102          498498               0     3820837  100505      >=2.63
other                       7      227    604         1207732               0    23613539  186068     >=24.25
Total                      17      402    970         3765614               0    47545856  640723     >=65.67

Agent              Role                                        Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a9dad9cfb0f9e82db  builder of step 1                           claude-fable-5-2        25     56          418226               0     3976401   57726      >=7.29
af33cf9bca3b7181b  builder of step 1b                          claude-fable-5-2        51    108          943909               0    10655072  163764     >=18.12
abb679c2d2f988485  brief check of step 1                       claude-fable-5-2         9     20          162805               0      840029   30809      >=3.03
a209c45f6fbb2d894  brief check of step 1b                      claude-fable-5-2        13     26          201046               0     1439349   29969      >=3.50
ade192054e78b1aaa  reviewer of step 1                          claude-fable-5-2        16     32          187613               0     2126592   32530      >=3.60
a7fa4b89e49397c7e  reviewer of step 1b                         claude-fable-5-2        11     22          145785               0     1074037   39352      >=3.25
a9633d2af5c6d3428  reviewer of step 1 over round 1             claude-sonnet-5-5       13     26          116432               0      986154   12660      >=0.52
ae590f6a0158cac61  reviewer of step 1b over round 1            claude-sonnet-5-5       14     28          134076               0     1181397   26488      >=0.72
a3ca2ba385c8bda09  reviewer of step 1b over round 2            claude-sonnet-5-5        9     18          109547               0      566343   19501      >=0.53
a8d9eb6c178218674  reviewer of step 1b over round 3            claude-sonnet-5-5       14     30          138443               0     1086943   41856      >=0.87
a2251a63e8f8c21d4  run of step 2 on v9.1.0-rc.2, first round   claude-fable-5-2        32     90          305489               0     3611388   37637      >=5.28
a34649d7e04f8a312  run of step 2 on v9.1.0-rc.2, second round  claude-fable-5-2        18     44           86338               0     1170318   11628      >=1.56
a4aad40b847263808  run of step 2 on v9.1.0-rc.3                claude-fable-5-2        36     94          134861               0     3419403   23720      >=2.98
a5165b90dc5db64d4  run of step 2 on v9.1.0-rc.3                claude-fable-5-2        61    166          312219               0     7953088   42997      >=6.43
af5dac36ecf3aab56  run of step 2 on v9.1.0-rc.4                claude-fable-5-2        30     78          146340               0     3136928   24972      >=3.09
a8a1ce052177b256e  run of step 2, first round                  claude-fable-5-2        31     86          139774               0     3108676   33875      >=3.38
a912c1d07c6e1f03e  run of step 2, second round                 claude-fable-5-2        19     46           82711               0     1213738   11239      >=1.52
