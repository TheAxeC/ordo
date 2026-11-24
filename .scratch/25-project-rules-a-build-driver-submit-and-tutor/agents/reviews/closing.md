Plan 25. Project rules, a build driver, submit and tutor: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/orchestration/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies: none, so every cost is a lower bound.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
builder                     6      389    804         2533787               0    67394227   420627     >=34.56
brief check                 5      198    404          755825               0    23307161   156250     >=11.57
reviewer                    6      180    366          846988               0    21297046   181180     >=12.12
reviewer over a round       5       96    192          642833               0     9316803   118875      >=3.73
grill lookup                2       46     92          270999               0     5680324    36529      >=5.31
other                      30      723   1576         2974454               0    71241717   733424     >=43.80
Total                      54     1632   3434         8024886               0   198237278  1646885    >=111.08

Agent              Role                                                                                                     Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a1c62803166842022  builder of step 1                                                                                        claude-opus-5-5         35     74          300468               0     4284377   36632      >=3.09
a363858a943d81ea8  builder of step 2                                                                                        claude-opus-5-5        124    252          755864               0    25009457  107970     >=10.94
afe9b922f157189e8  builder of step 3                                                                                        claude-opus-5-5         83    174          488107               0    15301984  102857      >=7.56
aad1290499046e502  builder of step 4                                                                                        claude-opus-5-5         79    162          499219               0    14635981   84588      >=7.12
ab824b150f2570d7a  builder of step 5                                                                                        claude-opus-5-5         49    102          412444               0     6842519   73167      >=4.89
a623c018efa0d9295  builder of step 6                                                                                        claude-opus-5-5         19     40           77685               0     1319909   15413      >=0.96
a84e8e7f2b9dce5b4  brief check of step 1                                                                                    claude-opus-5-5         29     62          118068               0     2569775   24365      >=1.59
a87e63407ae314392  brief check of step 2                                                                                    claude-opus-5-5         50    104          206421               0     7557189   31534      >=3.17
ab554d078f519c4bd  brief check of step 3                                                                                    claude-opus-5-5         32     64          161022               0     3660140   32425      >=2.19
af32ec4714532fb10  brief check of step 4                                                                                    claude-opus-5-5         37     74          133823               0     4116038   30384      >=2.10
a80a3d262da646252  brief check of step 5                                                                                    claude-opus-5-5         50    100          136491               0     5404019   37542      >=2.51
aff8729b7d77a1e04  reviewer of step 1                                                                                       claude-opus-5-5         22     44          123053               0     2049118   25033      >=1.53
a98a16ecb5987063a  reviewer of step 2                                                                                       claude-opus-5-5         48     96          192481               0     6941090   42002      >=3.19
a5bc4b4e441d63e90  reviewer of step 3                                                                                       claude-opus-5-5         30     62          163950               0     3782971   33267      >=2.24
a69c8e7d7e94743e3  reviewer of step 4                                                                                       claude-opus-5-5         37     76          127950               0     4003791   33300      >=2.11
aadec4c5e8a7aae13  reviewer of step 5                                                                                       claude-opus-5-5         31     64          146607               0     3602755   33000      >=2.11
a5a55e89c91a2caba  reviewer of step 6                                                                                       claude-opus-5-5         12     24           92947               0      917321   14578      >=0.94
a82688a6d8c685329  reviewer of step 1 over round 1                                                                          claude-sonnet-5-5        5     10           82945               0      261975    7354      >=0.31
ab9fe8e68965015ba  reviewer of step 2 over round 1                                                                          claude-sonnet-5-5       35     70          125441               0     3533387   27095      >=0.94
a81a1a70ecf47f318  reviewer of step 3 over round 1                                                                          claude-sonnet-5-5       31     62          171034               0     3438416   32997      >=1.10
acaac3eedcad88ce6  reviewer of step 4 over round 1                                                                          claude-sonnet-5-5       14     28          124992               0     1174818   27315      >=0.70
ad09d6adfa6f4853c  reviewer of step 5 over round 1                                                                          claude-sonnet-5-5       11     22          138421               0      908207   24114      >=0.68
a6a641092c180b960  grill lookup                                                                                             claude-fable-5-2         4      8           74654               0      154986   10735      >=1.21
aa7a2f4de5dea9a2f  grill lookup                                                                                             claude-fable-5-2        42     84          196345               0     5525338   25794      >=4.10
a234f4e4517ec9965  builder of ruling F                                                                                      claude-opus-5-5         13     28           82509               0      806932    6534      >=0.70
aa238fda60548b301  builder of ruling H                                                                                      claude-opus-5-5         46     94          130808               0     5053974   54476      >=2.75
a43b8d38788a165a3  builder of ruling I                                                                                      claude-opus-5-5         14     30          108904               0     1145433   25740      >=1.29
ad2d880fc0e83b85c  builder of rulings J and K                                                                               claude-opus-5-5         27     56          113369               0     2297201   22953      >=1.49
aed2443ba14cc4b1e  builder of the fix of open item N in submit                                                              claude-opus-5-5         17     38           86286               0     1277364   11907      >=0.93
a01432936c4eba847  builder that closed the points of the final check of the deviations list (open item I)                   claude-opus-5-5         23     48          125222               0     2202696   33970      >=1.75
aa85f45e56022c96e  check of the deviations list against the source skill                                                    claude-opus-5-5         10     20           80061               0      661752   19976      >=0.93
a2435855152b195b4  check of the deviations list on v11.0.0-rc.5                                                             claude-opus-5-5          6     12           75802               0      336517   18712      >=0.82
a3f60f20db11b350f  final check of the deviations list against the source skill                                              claude-opus-5-5          7     14           75697               0      414130   20696      >=0.88
a9a9c8c3d3b79e1a8  final run of /submit on the deposit form on v11.0.0-rc.4, sheet and walk                                 claude-opus-5-5         22     56          141741               0     1521046   14837      >=1.31
a843a8bfc8d79eab3  final run of /submit on the journal's portal on v11.0.0-rc.4, sheet and walk                             claude-opus-5-5        153    330          297288               0    23992320   80775      >=7.90
ad2a691dcd28fd024  final run of /tutor explain --page on v11.0.0-rc.4                                                       claude-opus-5-5          9     24           50709               0      488295   14658      >=0.64
a4fb0fc7bbc09158b  final run of /tutor on v11.0.0-rc.4, first session                                                       claude-opus-5-5         34     74           96667               0     2680934   45881      >=1.94
a1f79db6ebd6b5521  first /tutor session on v11.0.0-rc.5                                                                     claude-opus-5-5         28     62           97583               0     2165627   43116      >=1.78
a8345eb24bd6ca099  gate run of /ordo-init build on a scratch clone of ordo                                                  claude-opus-5-5         23     48          120961               0     2170890   25650      >=1.55
a10d74bc88b8b7ab6  gate run of /ordo-init on a new python repository                                                        claude-opus-5-5         33     74          150698               0     3720533   36187      >=2.22
aac165cfb3187030c  gate run of /submit on the deposit form on v11.0.0-rc.2, to the approval of the sheet                    claude-opus-5-5          9     20           55313               0      518708    7856      >=0.54
ac3b8e3d52f4ad011  gate run of /submit on the deposit form on v11.0.0-rc.3, to the approval of the sheet                    claude-opus-5-5         10     22           59954               0      610613    8310      >=0.59
ae66c5257ddf0e46c  gate run of /submit on the journal's portal on v11.0.0-rc.2, to the approval of the sheet                claude-opus-5-5         10     22           52301               0      560404    7213      >=0.52
aa26a6855ea5b887b  gate run of /submit on the journal's portal on v11.0.0-rc.3, to the approval of the sheet                claude-opus-5-5         10     22           61268               0      579586   11947      >=0.66
a52fe985477014025  gate run of /submit on the journal's portal, to the approval of the sheet                                claude-opus-5-5          2      4           49041               0       45418    1862      >=0.29
a1b54bd28f2fc185a  gate run of /tutor explain git worktree --page                                                           claude-opus-5-5          6     16           62293               0      266760    6405      >=0.49
ae11221ea13d8e943  gate run of /tutor explain git worktree --page on v11.0.0-rc.2                                           claude-opus-5-5         12     30           54780               0      691088   15714      >=0.73
a79672ea3d3b4f41c  gate run of /tutor on v11.0.0-rc.2, first session, pixel art                                             claude-opus-5-5         29     64           98052               0     2262672   44816      >=1.84
a3aa8f1d0e51b9a81  gate run of /tutor on v11.0.0-rc.2, second session                                                       claude-opus-5-5         25     52          103200               0     2190511   41894      >=1.79
a75109dfea599bd95  gate run of /tutor, first session, pixel art                                                             claude-opus-5-5          3      6           49622               0       94021    1764      >=0.30
a4d2a14a26bf1d88f  run of /submit on the journal's portal on v11.0.0-rc.6, to the page of the title, abstract and keywords  claude-opus-5-5         35     78          152437               0     2873145   16316      >=1.66
a127aea36be3265fe  run of /submit on zenodo.org on v11.0.0-rc.6, sheet and walk                                             claude-opus-5-5         71    152          188583               0     6766350   31655      >=2.93
a48615233866f7916  run of /tutor explain --page on v11.0.0-rc.5                                                             claude-opus-5-5         11     28           48950               0      616324   14073      >=0.65
ab0ed5974895be2d2  second /tutor session on v11.0.0-rc.5                                                                    claude-opus-5-5         25     52          104355               0     2230473   47531      >=1.92
