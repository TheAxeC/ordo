Plan 8. grant: priced usage of its agents
Prices from /Users/axelfaes/.local/share/ordo-stable/skills/orchestration/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies: none, so every cost is a lower bound.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     2       79    172         1113365               0    13465499  171797     >=20.70
brief check                 2       43     92          416202               0     5936966   75631      >=8.38
reviewer                    2       49     98          405897               0     7589014   84945      >=8.98
reviewer over a round       2       36     76          278034               0     3658634   35405      >=1.42
grill lookup                1       10     20          107472               0      772299   12947      >=1.75
other                       2      206    534         1757280               0    40615667  381392     >=40.96
Total                      11      423    992         4078250               0    72038079  762117     >=82.17

Agent              Role                              Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a16e41a3e1d10c18d  builder of step 1                 claude-fable-5-2        43     94          637851               0     7881754  101288     >=12.01
a738739e2662829f0  builder of step 1b                claude-fable-5-2        36     78          475514               0     5583745   70509      >=8.69
af4851eb920202757  brief check of step 1             claude-fable-5-2        17     36          209868               0     2254420   35920      >=3.99
a362fcb5d89d0e667  brief check of step 1b            claude-fable-5-2        26     56          206334               0     3682546   39711      >=4.39
a49b15f323aa7dbde  reviewer of step 1                claude-fable-5-2        34     68          218436               0     5717272   45124      >=5.13
a30d052b6fe70f7e5  reviewer of step 1b               claude-fable-5-2        15     30          187461               0     1871742   39821      >=3.84
a9728ec4c5808246f  reviewer of step 1 over round 1   claude-sonnet-5-5       23     48          158456               0     2578935   21951      >=0.87
a2dd1cafa6974ce55  reviewer of step 1b over round 1  claude-sonnet-5-5       13     28          119578               0     1079699   13454      >=0.54
a3a9aa56d1fe033c2  grill lookup                      claude-fable-5-2        10     20          107472               0      772299   12947      >=1.75
a34959c2af3b37c09  run of step 2 on v9.2.0-rc.1      claude-fable-5-2       105    270         1325977               0    19763715  263283     >=27.75
ab45245f5bb134bf8  run of step 2 on v9.2.0-rc.2      claude-fable-5-2       101    264          431303               0    20851952  118109     >=13.21
