Plan 6. paper-review-panel: priced usage of its agents
Prices from /Users/axelfaes/.local/share/ordo-stable/skills/orchestration/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies: none, so every cost is a lower bound.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     4      151    312         2086013               0    25402444  403695     >=42.09
brief check                 4       68    138          564010               0     8006878  125850     >=12.28
reviewer                    4       91    184          740008               0    11637997  117079     >=14.41
reviewer over a round       2       32     64          200172               0     2375655   23147      >=0.97
Total                      14      342    698         3590203               0    47422974  669771     >=69.75

Agent              Role                             Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a840c1d8f45ecd55f  builder of step 1                claude-fable-5-2        50    102          622310               0     8415518   83986     >=11.27
a21f2ad5c98eaac0b  builder of step 2                claude-fable-5-2        23     50          600795               0     4698770   77356     >=10.04
ac00f95bb01eebccf  builder of step 2.A              claude-fable-5-2        18     36          123791               0     1822995   23016      >=2.52
a57f5bfda7baf53ac  builder of step 3                claude-fable-5-2        60    124          739117               0    10465161  219337     >=18.26
a7158d80e8b21c9c4  brief check of step 1            claude-fable-5-2        24     50          203735               0     3662517   39424      >=4.35
a10369c9579256655  brief check of step 2            claude-fable-5-2        18     36          150123               0     2089780   38586      >=3.46
a44ce4cabb3f13e0e  brief check of step 2.A          claude-fable-5-2        17     34          118585               0     1629876   26201      >=2.56
afefa3411b72942e8  brief check of step 3            claude-fable-5-2         9     18           91567               0      624705   21639      >=1.91
a8df6fcc33e1a61cf  reviewer of step 1               claude-fable-5-2        26     52          175746               0     3266491   27647      >=3.52
a915fb8ba1219bbe2  reviewer of step 2               claude-fable-5-2        18     36          205344               0     2430771   33662      >=3.89
a545e898ed137ea94  reviewer of step 2.A             claude-fable-5-2        24     48          109308               0     2163936   25240      >=2.54
a4244c99937ed072e  reviewer of step 3               claude-fable-5-2        23     48          249610               0     3776799   30530      >=4.47
ae4197d6f7ce23142  reviewer of step 1 over round 1  claude-sonnet-5-5       18     36          113407               0     1380865   10301      >=0.52
ab963ce95a5408f40  reviewer of step 2 over round 1  claude-sonnet-5-5       14     28           86765               0      994790   12846      >=0.44
