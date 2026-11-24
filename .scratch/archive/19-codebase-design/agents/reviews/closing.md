Plan 19. codebase-design: priced usage of its agents
Prices from /Users/axelfaes/.local/share/ordo-stable/skills/orchestration/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies: none, so every cost is a lower bound.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
builder                     4      148    314         1836458               0    25930879   323446     >=36.49
brief check                 4       69    140          699106               0     8003607   135312     >=14.01
reviewer                    4       63    128          629433               0     7512846   137588     >=13.30
reviewer over a round       4       66    136          566088               0     6382487    82989      >=2.88
other                      13      284    658         2388980               0    35974037   481013     >=50.33
Total                      29      630   1376         6120065               0    83803856  1160348    >=117.01

Agent              Role                                                                     Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
ab12944454eff9c48  builder of step 1                                                        claude-fable-5-2        29     60          473928               0     5071412   62384      >=8.25
af1ee5368f50ec6e2  builder of step 4                                                        claude-fable-5-2        28     62          355515               0     3909845   70771      >=7.17
a8d73c9c4d7eaf570  builder of step 5                                                        claude-fable-5-2        53    110          483456               0     9795704  110860     >=11.23
acbe2f1c6ca322be6  builder of step 6                                                        claude-fable-5-2        38     82          523559               0     7153918   79431      >=9.84
abf99cfe27e48f423  brief check of step 1                                                    claude-fable-5-2        16     32          183049               0     2003913   29960      >=3.43
a3a640202fd2b636a  brief check of step 4                                                    claude-fable-5-2        21     42          155295               0     2192539   32677      >=3.30
adb032fec2fe9803e  brief check of step 5                                                    claude-fable-5-2        18     36          163040               0     2104906   32084      >=3.34
a33239329078fdf56  brief check of step 6                                                    claude-fable-5-2        14     30          197722               0     1702249   40591      >=3.94
aec236c414c8142fa  reviewer of step 1                                                       claude-fable-5-2        18     36          180418               0     2423048   33616      >=3.63
a0f5e5d3a9d6b9ca8  reviewer of step 4                                                       claude-fable-5-2        12     24          111235               0     1058741   27644      >=2.43
a5a056ebb96ece6ae  reviewer of step 5                                                       claude-fable-5-2        22     46          164106               0     2787655   37375      >=3.69
a7057f07033744b86  reviewer of step 6                                                       claude-fable-5-2        11     22          173674               0     1243402   38953      >=3.54
a0f46fdedb82ed703  reviewer of step 1 over round 1                                          claude-sonnet-5-5       19     40          140885               0     1687558   13912      >=0.66
a36ce253e9ce66cbf  reviewer of step 4 over round 1                                          claude-sonnet-5-5        9     18          108147               0      595211   19657      >=0.53
add1fddfd58c551b7  reviewer of step 5 over round 1                                          claude-sonnet-5-5       24     50          183881               0     2831373   32282      >=1.07
a15943d1cd0d846a9  reviewer of step 6 over round 1                                          claude-sonnet-5-5       14     28          133175               0     1268345   17138      >=0.63
aaeb5620b1475d957  gate run of ordo-init on a configured repository on v9.4.0-rc.3, step 2  claude-fable-5-2        14     34          102916               0     1053878   15718      >=1.87
a7df954223e997d4a  gate run of ordo-init on a configured repository on v9.4.0-rc.4, step 2  claude-fable-5-2        13     30          125703               0     1078881   16462      >=2.13
af172707cbe2ca342  gate run of ordo-init on an empty folder on v9.4.0-rc.3, step 2          claude-fable-5-2        21     54          169063               0     2269729   57690      >=4.45
a3aac14008c7ec84e  gate run of ordo-init on an empty folder on v9.4.0-rc.4, step 2          claude-fable-5-2        16     40          140228               0     1570257   27791      >=2.83
a442384b82998c183  gate run of ordo-init on an empty folder on v9.4.0-rc.5, step 2          claude-fable-5-2        14     28          119335               0     1327702   23495      >=2.40
a9479700a654c2165  gate run of ordo-init on an existing repository on v9.4.0-rc.3, step 2   claude-fable-5-2        16     38          168294               0     1647832   42716      >=3.72
ace1d88975705aa94  gate run of ordo-init on an existing repository on v9.4.0-rc.4, step 2   claude-fable-5-2        14     32          150672               0     1377771   19288      >=2.55
aeec4d98036270380  gate run of ordo-init on an existing repository on v9.4.0-rc.5, step 2   claude-fable-5-2        13     26          128850               0     1243535   18500      >=2.28
a1136d134914ace47  gate run of the review mode on v9.4.0-rc.3, step 2                       claude-fable-5-2        42    104          312267               0     6253352   44638      >=6.16
a92d37754d11b71c7  gate run of the review mode on v9.4.0-rc.4, step 2                       claude-fable-5-2        54    128          447009               0    10807155   74691      >=9.62
adc8022a453c525b2  gate run of the standards mode on v9.4.0-rc.3, step 2                    claude-fable-5-2        27     58          175622               0     3027786   55541      >=4.58
aa62707e2037f74e7  gate run of the standards mode on v9.4.0-rc.4, step 2                    claude-fable-5-2        19     42          174408               0     2093989   39494      >=3.74
ab9a7ef09ce1a15fc  gate run of the standards mode, step 2                                   claude-fable-5-2        21     44          174613               0     2222170   44989      >=3.99
