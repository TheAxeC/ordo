Plan 27. A newcomer's README, researcher's project READMEs, a skill for a software repository's documentation and a figure for every skill: priced usage of its agents
Prices from /Users/axelfaes/.local/share/ordo-stable/skills/orchestration/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies: none, so every cost is a lower bound.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
builder                     8      748   1536         4097191               0   146270909   840599     >=66.56
brief check                 8      302    604         1291819               0    36545246   278464     >=19.34
reviewer                    8      295    598         1310563               0    37996280   270337     >=19.56
reviewer over a round       8      189    380         1059194               0    19279978   173707      >=6.31
other                       9      352    730         2501487               0    55073852   552383     >=34.57
Total                      41     1886   3848        10260254               0   295166265  2115490    >=146.35

Agent              Role                                                                                         Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
aa853461e0bda0675  builder of step 1                                                                            claude-opus-5-5        116    236          532682               0    22847206  112735      >=9.49
a08312753d0d93b46  builder of step 2                                                                            claude-opus-5-5        111    224          626581               0    26869110  116693     >=10.84
a15970d264f25815b  builder of step 3                                                                            claude-opus-5-5         70    146          481593               0    12216080  109358      >=7.04
ac96504d9c4e48105  builder of step 4                                                                            claude-opus-5-5         68    142          462698               0    12011113   90912      >=6.53
a88b86c8d82539450  builder of step 5                                                                            claude-opus-5-5        128    262          614857               0    26833319  128856     >=11.02
aea116595a1666e4b  builder of step 6                                                                            claude-opus-5-5        153    312          820075               0    30594694  169532     >=13.61
a657185e09bea583a  builder of step 7                                                                            claude-opus-5-5         33     70          162569               0     3696651   44112      >=2.43
ad11c3888bf0dab20  builder of step 10                                                                           claude-opus-5-5         69    144          396136               0    11202736   68401      >=5.59
a2f96bd6829d5adb2  brief check of step 1                                                                        claude-opus-5-5         41     82          206519               0     6207614   34149      >=2.96
aa8df1549baebff17  brief check of step 2                                                                        claude-opus-5-5         27     54          167847               0     3364026   26008      >=2.03
af894f369408218fe  brief check of step 3                                                                        claude-opus-5-5         44     88          172146               0     5451825   40515      >=2.76
af6924bb5a482c6d5  brief check of step 4                                                                        claude-opus-5-5         35     70          138621               0     3967409   31767      >=2.12
a9a2c1a5a8e296d2c  brief check of step 5                                                                        claude-opus-5-5         56    112          175926               0     6869670   40878      >=3.07
a155439c811cde7fc  brief check of step 6                                                                        claude-opus-5-5         38     76          172536               0     4648029   39519      >=2.58
a9a2fe5d909e6aec9  brief check of step 7                                                                        claude-opus-5-5         26     52          102878               0     2281644   23872      >=1.45
a8c25cbeecbc26775  brief check of step 10                                                                       claude-opus-5-5         35     70          155346               0     3755029   41756      >=2.36
a87f37bb66e71447b  reviewer of step 1                                                                           claude-opus-5-5         46     92          154930               0     5471868   37964      >=2.63
a0d3f8882c6d34f95  reviewer of step 2                                                                           claude-opus-5-5         41     82          200679               0     6218246   42230      >=3.09
a70dc44bade66da5f  reviewer of step 3                                                                           claude-opus-5-5         33     66          152730               0     3986474   37361      >=2.31
a8b65453be25f0c4e  reviewer of step 4                                                                           claude-opus-5-5         26     52          139310               0     2855387   31682      >=1.90
aa254c90a04682a8f  reviewer of step 5                                                                           claude-opus-5-5         57    118          194152               0     8131314   36451      >=3.33
a42e8ad1b4355625a  reviewer of step 6                                                                           claude-opus-5-5         35     72          190757               0     4951116   30093      >=2.55
aff4b9ac101cacafe  reviewer of step 7                                                                           claude-opus-5-5         20     42          118240               0     1901352   17322      >=1.32
af1e418a616f06810  reviewer of step 10                                                                          claude-opus-5-5         37     74          159765               0     4480523   37234      >=2.44
a3e0d150656bdfa82  reviewer of step 1 over round 1                                                              claude-sonnet-5-5       30     60          146173               0     3192639   29701      >=0.98
a64f14efcb86d398c  reviewer of step 2 over round 1                                                              claude-sonnet-5-5       25     50           92107               0     2097498   17049      >=0.61
af7bdca8540146551  reviewer of step 3 over round 1                                                              claude-sonnet-5-5       23     46          130800               0     2150782   21028      >=0.75
a17fd6fa34a365aba  reviewer of step 4 over round 1                                                              claude-sonnet-5-5       17     34          128869               0     1485130   19696      >=0.67
a64a84c7d081865f5  reviewer of step 5 over round 1                                                              claude-sonnet-5-5       36     72          177156               0     4274290   31890      >=1.19
afae27d9fa1f4b23f  reviewer of step 6 over round 1                                                              claude-sonnet-5-5       32     64          172019               0     3950602   32286      >=1.15
aca6b0752431a7acd  reviewer of step 7 over round 1                                                              claude-sonnet-5-5        7     14           94029               0      421575    6444      >=0.34
ad6d31d762deb1ecf  reviewer of step 10 over round 1                                                             claude-sonnet-5-5       19     40          118041               0     1707462   15613      >=0.62
ad3cfbb8d27ee411e  lookup agent of step 8, the answers to the engram run's questions from the project's files   claude-opus-5-5         32     64          134533               0     3260805   18035      >=1.69
a2550cd6357eca88f  lookup agent of step 8, the answers to the linfoot run's questions from the project's files  claude-opus-5-5         55    110          161470               0     6515674   28704      >=2.69
a026bf3a9b73b7a04  step 8 rerun of `/handbook` on officium on v11.2.1                                           claude-opus-5-5         82    170          553076               0    15760289   90540      >=7.73
aeee2784e4107041d  step 8 rerun of `/researcher readme` on engram on v11.2.1                                    claude-opus-5-5         36     76          362250               0     5025788   63122      >=4.08
a1cce101135778708  step 8 rerun of `/researcher readme` on linfoot-estimator on v11.2.1                         claude-opus-5-5         40     86          516630               0     7488494  127432      >=6.63
ab642d67e3b49ae76  step 8 run of `/handbook` on officium                                                        claude-opus-5-5         54    114          258644               0     9349265   99092      >=5.15
a829b4222f644a0a3  step 8 run of `/ordo-help skills`                                                            claude-opus-5-5          6     12           72413               0      271761    9006      >=0.60
a1a026f00a0b024af  step 8 run of `/researcher readme` on engram                                                 claude-opus-5-5         23     48          183491               0     3149428   54277      >=2.63
a9cddaa77d1b7a90f  step 8 run of `/researcher readme` on linfoot-estimator                                      claude-opus-5-5         24     50          258980               0     4252348   62175      >=3.39
