# Closing report

Roadmap entry 28 (writing reads the draft from its files). Plan step 3 of 3: the closing. Next: the roadmap diff of `/roadmap done 28`, for the user's approval.

`python3 ~/.claude/skills/plan-orchestration/templates/plan_cost.py .scratch/28-writing-reads-the-draft-from-its-files` exited 0 and printed:

```
Plan 28. writing reads the draft from its files: priced usage of its agents
Prices from /Users/axelfaes/.local/share/ordo-stable/skills/orchestration/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies: none, so every cost is a lower bound.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     1       39     82          448793               0     5049804   38264      >=4.02
brief check                 1       17     36          125857               0     1477787   23045      >=1.39
reviewer                    1       32     64          121801               0     3361883   24732      >=1.78
reviewer over a round       1        6     12           74532               0      298821    4676      >=0.26
Total                       4       94    194          770983               0    10188295   90717      >=7.44

Agent              Role                             Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
aa4686ded176983bc  builder of step 1                claude-opus-5-5         39     82          448793               0     5049804   38264      >=4.02
a92c188eb9f947915  brief check of step 1            claude-opus-5-5         17     36          125857               0     1477787   23045      >=1.39
ad51bb4d543e67209  reviewer of step 1               claude-opus-5-5         32     64          121801               0     3361883   24732      >=1.78
ac6a4bc80c156981f  reviewer of step 1 over round 1  claude-sonnet-5-5        6     12           74532               0      298821    4676      >=0.26
```
