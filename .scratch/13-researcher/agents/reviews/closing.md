Plan 13. researcher: priced usage of its agents
Prices from /Users/axelfaes/.local/share/ordo-stable/skills/orchestration/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies: none, so every cost is a lower bound.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
builder                     9      848   1730         5147138               0   170527725   985652     >=79.56
brief check                 6      266    552         1182217               0    36869619   208562     >=17.46
reviewer                    9      375    764         1614873               0    53907358   282710     >=24.51
reviewer over a round       6      148    304          968296               0    17848873   146287      >=5.67
grill lookup                4      207    418         1058681               0    34606866   136545     >=14.95
Total                      34     1844   3768         9971205               0   313760441  1759756    >=142.15

Agent              Role                             Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a90f7dfac5ca2a866  builder of step 1                claude-opus-5-5        237    478         1464673               0    51738803  294630     >=23.57
a6dece389171399fc  builder of step 2                claude-opus-5-5        159    326         1012165               0    32341717  178308     >=15.10
a8e79c1e64120e263  builder of step 3                claude-opus-5-5        113    230          563287               0    24082715  108504      >=9.80
a781286d82284189f  builder of step 4                claude-opus-5-5        165    334          883974               0    33893102  185990     >=14.92
a6b13ac6347fbb68a  builder of step 5                claude-opus-5-5         29     62          315599               0     3604888   52677      >=3.35
a96f07919efa565ec  builder of step 8                claude-opus-5-5         98    200          575241               0    20715363  117965      >=9.38
aae8b220f4c7bf7fa  builder of step 9                claude-opus-5-5         13     28           98495               0      900526   18884      >=1.05
a05f3e2e43c3796f6  builder of step 10               claude-opus-5-5         13     28           80585               0      940057    7195      >=0.73
ab807098ebde0e797  builder of step 11               claude-opus-5-5         21     44          153119               0     2310554   21499      >=1.66
a88f2b2030a881ff2  brief check of step 1            claude-opus-5-5         47     94          225046               0     7458302   39186      >=3.40
a7ab1a8b91934c83b  brief check of step 2            claude-opus-5-5         56    118          211754               0     7948217   38990      >=3.43
a5b81d093a7ce8107  brief check of step 3            claude-opus-5-5         56    116          209147               0     7656727   39281      >=3.36
ad013e826d92d4998  brief check of step 4            claude-opus-5-5         41     88          210162               0     6025117   30679      >=2.87
af1105b279c18c7ed  brief check of step 5            claude-opus-5-5         22     44          134147               0     2111813   24358      >=1.58
a0516fcf1aaec457a  brief check of step 8            claude-opus-5-5         44     92          191961               0     5669443   36068      >=2.82
aa05eb7854278e73e  reviewer of step 1               claude-opus-5-5         83    168          452363               0    16600799   50763      >=6.60
a1e8b7527ba8e54f0  reviewer of step 2               claude-opus-5-5         58    118          231690               0    10265231   36451      >=3.94
a779a2f818f5c41bd  reviewer of step 3               claude-opus-5-5         44     92          162713               0     5805194   36605      >=2.71
a6e39bbd6d6f0b790  reviewer of step 4               claude-opus-5-5         53    106          225492               0     7992693   47570      >=3.68
a0f7721f21de23fac  reviewer of step 5               claude-opus-5-5         30     62          124901               0     3089705   32630      >=1.90
a2ec2be82468551b2  reviewer of step 8               claude-opus-5-5         39     80          148415               0     4485426   30193      >=2.24
a12170d055f42a91d  reviewer of step 9               claude-opus-5-5         28     56          105401               0     2505307   22132      >=1.47
ae0353b7bc8dcad7f  reviewer of step 10              claude-opus-5-5         18     36           62099               0     1196026    8514      >=0.72
a25f4c569eaec55b5  reviewer of step 11              claude-opus-5-5         22     46          101799               0     1966977   17852      >=1.26
a13bf81b661469dae  reviewer of step 1 over round 1  claude-sonnet-5-5       43     88          242344               0     6417935   35934      >=1.61
a09d805b7d405035c  reviewer of step 2 over round 1  claude-sonnet-5-5       28     58          166633               0     3474936   24654      >=1.01
a61d1811a1c66fa14  reviewer of step 3 over round 1  claude-sonnet-5-5       29     58          166831               0     3458851   31540      >=1.08
a729e2eb1b9c75644  reviewer of step 4 over round 1  claude-sonnet-5-5       23     48          162246               0     2531997   19873      >=0.86
a3dcc47add2b65486  reviewer of step 5 over round 1  claude-sonnet-5-5        8     16          117601               0      615507   18468      >=0.54
a5d978c0616308574  reviewer of step 8 over round 1  claude-sonnet-5-5       17     36          112641               0     1349647   15818      >=0.57
a0d372b5be59b285c  grill lookup                     claude-opus-5-5         35     72          136650               0     3353389   26081      >=1.88
a1b3dec8561c0aab2  grill lookup                     claude-opus-5-5         63    126          176452               0     8053268   39214      >=3.28
a85ce783d175c0fce  grill lookup                     claude-opus-5-5         25     50          286011               0     4096749   29453      >=2.84
a95e2aa1f07c9faf8  grill lookup                     claude-opus-5-5         84    170          459568               0    19103460   41797      >=6.96
