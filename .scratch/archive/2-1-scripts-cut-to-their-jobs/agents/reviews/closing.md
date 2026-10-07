# Closing report of plan 2.1, Scripts cut to their jobs

The output of `python3 skills/plan-orchestration/templates/plan_cost.py .scratch/2-1-scripts-cut-to-their-jobs`, exit 0:

```
Plan 2.1 Scripts cut to their jobs: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     3        0    480         1432619               0    48255331  299348       16.23
brief check                 2        0    186          343007               0    10569004   93632        5.70
reviewer                    3        0    288          552375               0    21386891  122142        9.48
reviewer over a round       2        0    146          299124               0     8443003   61872        3.06
Total                      10        0   1100         2627125               0    88654229  576994       34.47

Agent              Role                             Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a461ff8462cc74f48  builder of step 1                claude-sonnet-5-5        0    174          618972               0    19423816  104229        6.47
ad1ce82fc34ae13aa  builder of step 2                claude-sonnet-5-5        0     16           43673               0      375878    6306        0.25
a4927c19e2b176577  builder of step 3                claude-sonnet-5-5        0    290          769974               0    28455637  188813        9.50
aefdc70d38c003911  brief check of step 1            claude-opus-5-5          0     96          170866               0     5297448   43029        2.77
a7ff33a2ab947b3a1  brief check of step 3            claude-opus-5-5          0     90          172141               0     5271556   50603        2.93
a36aab8f6d73b9602  reviewer of step 1               claude-opus-5-5          0    104          186028               0     6684893   38775        3.04
a00ca6ccb690968fe  reviewer of step 2               claude-opus-5-5          0     44           90635               0     1643662   15834        1.10
adebd5ea8efbd7e4d  reviewer of step 3               claude-opus-5-5          0    140          275712               0    13058336   67533        5.34
a707f6f3bdfff2344  reviewer of step 1 over round 1  claude-sonnet-5-5        0     70          155372               0     4156871   28798        1.51
a3203a31d2578865b  reviewer of step 3 over round 1  claude-sonnet-5-5        0     76          143752               0     4286132   33074        1.55
```
