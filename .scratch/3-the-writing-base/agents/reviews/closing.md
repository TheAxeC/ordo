# Closing report of plan 3, the writing base

The output of `python3 ~/.claude-backup/skills/plan-orchestration/templates/plan_cost.py .scratch/3-the-writing-base`, exit 0. The response bodies are read from `/Users/axelfaes/.claude/api-bodies`, which holds a body for every response of the builders, brief checks and reviewers; it lacks bodies for the three grill lookups (236 responses under "No body"), so their costs and the total are lower bounds:

```
Plan 3. The writing base: priced usage of its agents
Prices from /Users/axelfaes/.local/share/ordo-stable/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
builder                     5        0    824         3095497               0    74176110   811887       30.69
brief check                 9        0    788         1757157               0    54017383   480880       29.21
reviewer                    9        0    926         2463518               0    83395870   511971       39.24
reviewer over a round       9        0    800         1880244               0    59185772   477457       21.31
grill lookup                3      236    472          430649               0    23446775     2866      >=6.90
Total                      35      236   3810         9627065               0   294221910  2285061    >=127.36

Agent              Role                             Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
ad8dec496562b2dbf  builder of step 1                claude-sonnet-5-5        0    286          719836               0    26731763  213233        9.28
a248d03293a97a4ad  builder of step 3                claude-sonnet-5-5        0    108          568366               0    10447145  114906        4.66
a2237d2ff6d37342a  builder of step 5                claude-sonnet-5-5        0    160          700149               0    14911098  221143        6.94
a09a39ebd2fcccd6b  builder of step 7                claude-sonnet-5-5        0     90          466646               0     7007646   66147        3.23
aba3c07cc124b6961  builder of step 9                claude-sonnet-5-5        0    180          640500               0    15078458  196458        6.58
ac0e79251e07d0d2c  brief check of step 1            claude-opus-5-5          0    126          221839               0     9060338   75351        4.43
a1f33775f8646df06  brief check of step 2            claude-opus-5-5          0     88          182298               0     5601340   48662        3.01
ac0b534b48b96acce  brief check of step 3            claude-opus-5-5          0     98          237082               0     7442066   67660        4.03
ad1ea91040f763510  brief check of step 4            claude-opus-5-5          0     84          167891               0     5287361   48224        2.86
a31fba24d82d7a955  brief check of step 5            claude-opus-5-5          0     78          256369               0     6230653   58879        3.71
a3e0cceb00ecca6b5  brief check of step 6            claude-opus-5-5          0     92          167545               0     5643307   43708        2.84
a50f0c31ddca5b769  brief check of step 7            claude-opus-5-5          0     66          150205               0     3869397   38843        2.30
a4f02d8519832d0b6  brief check of step 8            claude-opus-5-5          0     78          191358               0     5779339   41559        2.94
aa2534267459358b5  brief check of step 9            claude-opus-5-5          0     78          182570               0     5103582   57994        3.09
ad97ac04e6f24c9ae  reviewer of step 1               claude-opus-5-5          0    132          261467               0    12368762   68674        5.16
a78110fac0e276e53  reviewer of step 2               claude-opus-5-5          0     98          239218               0     8643888   60269        4.13
abfeeaa9da306797f  reviewer of step 3               claude-opus-5-5          0     76          215636               0     5034265   47456        3.03
a3fe6a6fa48ceb52f  reviewer of step 4               claude-opus-5-5          0    108          301891               0    10951347   62980        4.96
abc52e37d862af422  reviewer of step 5               claude-opus-5-5          0     82          250394               0     6551780   62332        3.81
a93f0aad040198357  reviewer of step 6               claude-opus-5-5          0    116          384963               0    13308607   47658        5.54
afe8061d591582615  reviewer of step 7               claude-opus-5-5          0     70          171995               0     4193776   47012        2.64
aa417a503739647c4  reviewer of step 8               claude-opus-5-5          0    162          418754               0    16943759   56034        6.60
a9dcaf7661d9c1ae9  reviewer of step 9               claude-opus-5-5          0     82          219200               0     5399686   59556        3.37
a15e1830c0fcc52fe  reviewer of step 1 over round 1  claude-sonnet-5-5        0     90          192763               0     6271622   47481        2.21
a101b4b33474a65c9  reviewer of step 2 over round 1  claude-sonnet-5-5        0    106          186903               0     7186384   55523        2.46
a8a5490e9ef2bc1ad  reviewer of step 3 over round 1  claude-sonnet-5-5        0     48          187787               0     3018160   31694        1.39
a7b58ef3a3bbf84be  reviewer of step 4 over round 1  claude-sonnet-5-5        0    154          276385               0    13063585   66396        3.97
ac11b15dbd17b34b2  reviewer of step 5 over round 1  claude-sonnet-5-5        0     94          289630               0     8634258   92237        3.37
a03b4e5b01f526569  reviewer of step 6 over round 1  claude-sonnet-5-5        0     92          219891               0     7330229   54923        2.57
a5ac0aefa8b6630f9  reviewer of step 7 over round 1  claude-sonnet-5-5        0     62          176646               0     3860964   49686        1.71
ab480b5eb42266865  reviewer of step 8 over round 1  claude-sonnet-5-5        0     90          169379               0     5579212   30275        1.84
a52d49d8b5f66bfc8  reviewer of step 9 over round 1  claude-sonnet-5-5        0     64          180860               0     4241358   49242        1.79
a2cd8be14d77ebe85  grill lookup                     claude-opus-5-5         80    160          155027               0     8934293     920      >=2.58
a9d12b91117bb4165  grill lookup                     claude-opus-5-5         55    110          140081               0     5210503     621      >=1.76
ac071af1b2da2bf66  grill lookup                     claude-opus-5-5        101    202          135541               0     9301979    1325      >=2.57
```

The 27 agents of the inline steps 2, 4, 6 and 8 (the review agents of `/writing` and the markers) are numbered items in `plan.md`'s Agents section, outside the roles the script prices, so the total above leaves them out. Their tokens, tool uses and times are in the landing reports of those steps (`2-landing.md`, `4-landing.md`, `6-landing.md`, `8-landing.md`).

## How the gate stands

- The last runs are step 8's (`agents/reviews/8-report.md`, `8-marks.md`), on `/writing` pinned at `v7.1.0-rc.4`. 48 manuscript rows and 35 grant rows were not marked right by both markers. Gate conditions 1, 3, 4 and 7 held, condition 4 with the turn shape changed at the user's instruction; conditions 2, 5 and 6 failed.
- Step 9 fixed each row not marked right by both and each failure of conditions 2 and 5 in `skills/writing/SKILL.md` and `skills/writing/references/rules.md` (`agents/reviews/9-report.md`, the rows table; `9-landing.md`). By ruling I no run follows step 9, so no run of `/writing` at `v7.1.0-rc.5` shows that the fixed text gives right findings.
- The failures of gate condition 6 concern the markers' prompts, commands and reasons, no text of `/writing`: manuscript marker 1's third command printed draft lines; manuscript marker 1's first command and grant marker 1's third ran `grep` on the saved report; the grant marker prompts lacked the brief's `grep` rule; and 17 marks have no reason of their own (manuscript marker 1's 12.1 to 12.9 and 14.2 to 14.5, manuscript marker 2's 14.2 to 14.4, grant marker 1's 16s).
- Steps 4, 6 and 8, the repeated runs, landed unticked because their checks failed; steps 5, 7 and 9 fixed what each left, as rulings H and I set.
- The conditions of the gate that step 1's check covers (the record per `rebuild: writing` row, the skill against `docs/dev/skill-layout.md`, the two openers in section C of the prose standard template, the term **finding**) were read by step 1's refuter, and step 1 landed ticked (`1-refuter.md`, `1-landing.md`). `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template` on main at the closing.
