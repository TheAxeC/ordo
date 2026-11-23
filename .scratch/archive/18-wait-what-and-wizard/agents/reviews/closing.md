Plan 18. wait-what and wizard: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/orchestration/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies: none, so every cost is a lower bound.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     3       61    132          771577               0     7577260  111857     >=13.71
brief check                 3       31     66          482300               0     2991237   84737      >=8.81
reviewer                    3       25     52          391456               0     2304297   68628      >=7.12
reviewer over a round       3       28     56          320901               0     2143530   34229      >=1.36
grill lookup                1        3      6           65039               0       98434   12038      >=1.15
other                       2       17     38          154345               0     1005441   22170      >=2.63
Total                      15      165    350         2185618               0    16120199  333659     >=34.78

Agent              Role                             Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a9fe20eeccf8024f2  builder of step 1                claude-fable-5-2        26     56          353485               0     3596506   35443      >=5.67
a220b11af9b5f3798  builder of step 3                claude-fable-5-2        21     46          284584               0     2452155   46061      >=5.18
a1b230b7ae645fe72  builder of step 5                claude-fable-5-2        14     30          133508               0     1528599   30353      >=2.86
a866bbf579774b48d  brief check of step 1            claude-fable-5-2        16     32          155398               0     1601634   32611      >=3.18
a232eee9f9b9e14d4  brief check of step 3            claude-fable-5-2         7     16          137660               0      594089   28001      >=2.62
a8cdca0e12b1ca0ca  brief check of step 5            claude-fable-5-2         8     18          189242               0      795514   24125      >=3.02
acb5ec6652074faf9  reviewer of step 1               claude-fable-5-2         8     16          132361               0      695881   22333      >=2.36
a35934f5ab790b7de  reviewer of step 3               claude-fable-5-2         9     18          147901               0      923805   28481      >=2.80
a69309a3c1d1e4eec  reviewer of step 5               claude-fable-5-2         8     18          111194               0      684611   17814      >=1.96
a0d93dacde474d366  reviewer of step 1 over round 1  claude-sonnet-5-5       12     24          125646               0     1068170   17800      >=0.60
a4b6a6a0a1e30749c  reviewer of step 3 over round 1  claude-sonnet-5-5       10     20          114302               0      748897   10439      >=0.47
a69d33b29fac68577  reviewer of step 5 over round 1  claude-sonnet-5-5        6     12           80953               0      326463    5990      >=0.29
a84939439ef3b0753  grill lookup                     claude-fable-5-2         3      6           65039               0       98434   12038      >=1.15
a7482350d02e2cd95  wizard run of step 4             claude-fable-5-2        12     26           95096               0      798284   16715      >=1.78
a1670e62864eff937  wizard run of the gate           claude-fable-5-2         5     12           59249               0      207157    5455      >=0.85
