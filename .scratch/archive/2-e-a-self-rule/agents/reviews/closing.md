Plan 2.E.A self-rule: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
builder                    12      243   2150         7909891               0   181386772  1132549     >=67.38
brief check                13      184   1082         2422557               0    69902442   377719     >=33.65
reviewer                   13      186   1250         2762546               0    93948579   445579     >=41.52
reviewer over a round      14       89   1104         2668182               0    76211993   506694     >=29.18
grill lookup                3       50    100          251024               0     3019080      819      >=1.88
Total                      55      752   5686        16014200               0   424468866  2463360    >=173.60

Agent              Role                               Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a15eaa0740335c7a3  builder of step 1                  claude-sonnet-5-5       47     98          313453               0     5384216     547      >=1.87
af948d39c18780b67  builder of step 2                  claude-sonnet-5-5       51    104          632159               0     9473075    1911      >=3.49
aaf2cfc92bfcb1844  builder of step 3                  claude-sonnet-5-5       42     86          411074               0     5895323    1496      >=2.22
ae1c05d01d496c9b9  builder of step 4                  claude-sonnet-5-5       87    228         1120897               0    19785802   27964      >=7.04
a15fd806c8f78a9ab  builder of step 6                  claude-sonnet-5-5       16    320          852735               0    27324871  209682      >=9.69
a5ab075c3677ad2d7  builder of step 7                  claude-sonnet-5-5        0    116          613562               0    11601177  133395        5.19
a8e821b5b3f0e2756  builder of step 8                  claude-sonnet-5-5        0     56          271520               0     2769762   36528        1.60
a3c9ead7c223bb0bb  builder of step 11b                claude-sonnet-5-5        0     52          228436               0     1954386   33145        1.29
a14b9e54394253a27  builder of step 11c                claude-sonnet-5-5        0     76          238679               0     3224992   35370        1.60
ae09983cdb0694a33  builder of step 12                 claude-sonnet-5-5        0    512         1279614               0    45786602  355937       15.92
a8ad5a883f593d085  builder of step 12b                claude-sonnet-5-5        0     84          281355               0     4497649   39775        2.00
a72058491ec0de347  builder of step 12c                claude-sonnet-5-5        0    418         1666407               0    43688917  256799       15.47
a392a12ca146ff975  brief check of step 1              claude-opus-5-5         22     44          143943               0     2237294     276      >=1.17
abe95054772aeb0bc  brief check of step 2              claude-opus-5-5         37     74          206719               0     5303442     624      >=2.11
a844cca8905e3bb9c  brief check of step 3              claude-opus-5-5         39     78          194232               0     5018219     494      >=1.98
aa5bff28e5e1bed90  brief check of step 4              claude-opus-5-5         50    100          194528               0     6563894     972      >=2.31
af7f592df096cc3fb  brief check of step 5              claude-opus-5-5          0    142          233771               0    10817192   63414        4.60
acf87ddb30973c88b  brief check of step 6              claude-opus-5-5         36     72          226205               0     5335033    1021      >=2.22
acf5b218dfdc17a01  brief check of step 7              claude-opus-5-5          0     72          219465               0     4991324   59541        3.29
ad359a1df2ce3b5fe  brief check of step 8              claude-opus-5-5          0     84          176613               0     4986066   46858        2.82
a4833282be61ec94d  brief check of step 11b            claude-opus-5-5          0     68          111382               0     3047841   29328        1.75
aca524bdfd236c383  brief check of step 11c            claude-opus-5-5          0     58          143113               0     2852567   37061        2.03
aeae0de1e8deb991b  brief check of step 12             claude-opus-5-5          0    100          188381               0     6171100   36388        2.90
aec3edbb8b9d18992  brief check of step 12b            claude-opus-5-5          0     82          151462               0     4393568   41729        2.47
aeae5b2d7ddaabf54  brief check of step 12c            claude-opus-5-5          0    108          232743               0     8184902   60013        4.00
ae9f3748642ce9c1e  reviewer of step 1                 claude-opus-5-5         34     68          169004               0     4142756     362      >=1.68
aec84f54a17e39016  reviewer of step 2                 claude-opus-5-5         42     84          203783               0     5774576    1494      >=2.20
afaa4e2644e7b3e6a  reviewer of step 3                 claude-opus-5-5         45     90          178346               0     5730611     639      >=2.05
a7eae9ce124bd2bd6  reviewer of step 4                 claude-opus-5-5         65    130          243418               0    10583727    1021      >=3.35
a8ec4aa6dab9bc81e  reviewer of step 5                 claude-opus-5-5          0    128          232682               0     9465251   53992        4.14
a90205aabc898e907  reviewer of step 6                 claude-opus-5-5          0    108          244130               0     8092423   65110        4.14
acaa1cd6ca52da97e  reviewer of step 7                 claude-opus-5-5          0     70          244816               0     5369815   46920        3.24
aa9c2761143a81412  reviewer of step 8                 claude-opus-5-5          0    102          151705               0     5890323   38428        2.71
ae0429a05481f2c42  reviewer of step 11b               claude-opus-5-5          0     62          170373               0     3319931   36378        2.24
a433ccdc683f799ba  reviewer of step 11c               claude-opus-5-5          0     60          137989               0     2729470   30922        1.85
a1a45441fab00dcd0  reviewer of step 12                claude-opus-5-5          0    150          332241               0    16808310   73527        6.49
af6d65d9212d1b716  reviewer of step 12b               claude-opus-5-5          0     74          155858               0     3962017   38253        2.34
abdb3e585189ce92d  reviewer of step 12c               claude-opus-5-5          0    124          298201               0    12079369   58533        5.08
a96acd76fe31399ad  reviewer of step 1 over round 1    claude-opus-5-5         20     40          116680               0     1659065     154      >=0.92
ae5cc0ca5a0659313  reviewer of step 2 over round 1    claude-opus-5-5         35     70          161281               0     3558528     883      >=1.54
af5b739d11c2d60e0  reviewer of step 3 over round 1    claude-opus-5-5         34     68          190148               0     4086145     604      >=1.78
a89c479922cf35964  reviewer of step 4 over round 1    claude-sonnet-5-5        0     98          185800               0     7122495   47607        2.37
a92eff98d2db7b840  reviewer of step 5 over round 1    claude-sonnet-5-5        0    106          196323               0     7277984   42131        2.37
aafe40381768b8fce  reviewer of step 6 over round 1    claude-sonnet-5-5        0     86          210489               0     6249678   51431        2.29
ad8e8ad9c3dbbb136  reviewer of step 7 over round 1    claude-sonnet-5-5        0     90          259576               0     8695275   59647        2.98
adeb36a8bdd6bc53b  reviewer of step 8 over round 1    claude-sonnet-5-5        0     44          123229               0     2101933   22642        0.95
abb9f0a46653f8ea9  reviewer of step 11b over round 1  claude-sonnet-5-5        0     42          105782               0     1828555   24502        0.88
afb38efb60769c41b  reviewer of step 11c over round 1  claude-sonnet-5-5        0     42          130269               0     2071710   29930        1.04
a66e5c70679decf11  reviewer of step 12 over round 1   claude-opus-5-5          0    100          214979               0     7642003   46902        3.54
aadacd036f0e6ee9e  reviewer of step 12 over round 1   claude-sonnet-5-5        0    110          223513               0     8674146   64316        2.94
ae3638bef5f010d8f  reviewer of step 12b over round 1  claude-sonnet-5-5        0     90          187085               0     5709038   56630        2.18
a7fd7dbc012b4e250  reviewer of step 12c over round 1  claude-sonnet-5-5        0    118          363028               0     9535438   59315        3.41
a508428b7705f46eb  grill lookup                       claude-opus-5-5         24     48           91579               0     1560867     389      >=0.78
aea0212a318abe908  grill lookup                       claude-opus-5-5         11     22           66447               0      463960     245      >=0.43
af464f4a770b333a6  grill lookup                       claude-opus-5-5         15     30           92998               0      994253     185      >=0.67
