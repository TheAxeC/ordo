# Closing report of plan 2.I, several plans in one session

The output of `python3 skills/plan-orchestration/templates/plan_cost.py .scratch/2-i-several-plans-in-one-session`, exit 0. The response bodies are read from `/Users/axelfaes/.claude/api-bodies`, which holds a body for every response, so no cost is a lower bound:

```
Plan 2.I Several plans in one session: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
builder                     2        0    476         1136233               0    47962906   331953       15.75
brief check                 5        0    404         1161421               0    32077263   282631       17.88
reviewer                    4        0    460         1105271               0    41424521   240429       18.62
reviewer over a round       4        0    310          706445               0    19751653   173522        7.45
grill lookup                2        0     60          208200               0     3104186    47775        2.62
Total                      17        0   1710         4317570               0   144320529  1076310       62.32

Agent              Role                             Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a4fbe03371bb439ec  builder of step 1                claude-sonnet-5-5        0    232          609542               0    22320688  157237        7.56
a04584a0f86c68b1f  builder of step 3                claude-sonnet-5-5        0    244          526691               0    25642218  174716        8.19
a0a3ea2bc782eb427  brief check of step 1            claude-opus-5-5          0    106          268208               0     9690006   76033        4.80
adb62eea8017b1dd4  brief check of step 2            claude-opus-5-5          0     94          261104               0     7982856   64919        4.20
a26b85029189e3c01  brief check of step 3            claude-opus-5-5          0     54          194952               0     3294780   24971        2.13
a6ce8870a2a7c0b32  brief check of step 3            claude-opus-5-5          0     78          204359               0     5762495   54231        3.26
a7bbcb94c44630b82  brief check of step 4            claude-opus-5-5          0     72          232798               0     5347126   62477        3.48
afa9f0216c64339f0  reviewer of step 1               claude-opus-5-5          0    102          284292               0     9227950   55882        4.39
a4f34743273779a48  reviewer of step 2               claude-opus-5-5          0    122          266590               0    10261393   56800        4.52
ab30d93c9a0113445  reviewer of step 3               claude-opus-5-5          0     90          217003               0     6528409   55692        3.50
a6c40dff28725d6f6  reviewer of step 4               claude-opus-5-5          0    146          337386               0    15406769   72055        6.21
a06100f8bf1b72886  reviewer of step 1 over round 1  claude-sonnet-5-5        0     56          197876               0     3645123   37583        1.60
a147c0afbb4437820  reviewer of step 2 over round 1  claude-sonnet-5-5        0     78          154508               0     4803983   51094        1.86
a3b381607c4f71126  reviewer of step 3 over round 1  claude-sonnet-5-5        0     76          192648               0     5220495   38362        1.91
a6ca10935d8f1088b  reviewer of step 4 over round 1  claude-sonnet-5-5        0    100          161413               0     6082052   46483        2.08
a3d2aab3380f2928e  grill lookup                     claude-opus-5-5          0     42          168037               0     2707970   36710        2.12
a8617f9a43650cc22  grill lookup                     claude-opus-5-5          0     18           40163               0      396216   11065        0.50
```

The agents of the two scratch runs are numbered items in `plan.md`'s Agents section, outside the roles the script prices. Their cost is the scratch closings' cost-script output: 3.38 USD (plan 5) and 1.17 USD (plan 3) for step 2's run, in `agents/reviews/2-report.md`, and 3.03 USD (plan 5) and 1.58 USD (plan 3) for step 4's run, in `agents/reviews/4-report.md`.
