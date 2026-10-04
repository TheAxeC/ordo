# Step 10: the cost figures of plans 2.E and 2.E.A

Step 10 of plan 2.E.A, for your reading. Each table below is the output of `python3 skills/plan-orchestration/templates/plan_cost.py <ledger folder>`, run from the repository root on main at ef827bb, exit 0, copied as printed.

## How to read the tables

- A cost written `>=` is a lower bound: some of that row's responses have no response body in `~/.claude/api-bodies`, so their output count comes from the transcript, which can record it before the response ended. The column No body counts those responses.
- Responses from the agents started after the body folder was set up have a body each (No body 0), so their costs are exact.
- Each response is priced at the model its own entry names, from `skills/plan-orchestration/templates/prices.txt`.

## Plan 2.E.A

The runs over a repair round of steps 1 to 3 ran before step 3 landed the key `repair_reviewer`, so they ran on the reviewer's model, claude-opus-5-5. From step 4 on, the agent table shows each of them on claude-sonnet-5-5, the model `repair_reviewer: claude:sonnet` names, and priced at that model's row.

```
Plan 2.E.A self-rule: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
builder                     7      243   1008         4215400               0    82234226   411523     >=31.10
brief check                 8      184    666         1595476               0    45252464   173200     >=20.49
reviewer                    8      186    780         1667884               0    55049482   207966     >=23.51
reviewer over a round       8       89    602         1443526               0    40751103   225099     >=15.20
grill lookup                3       50    100          251024               0     3019080      819      >=1.88
Total                      34      752   3156         9173310               0   226306355  1018607     >=92.18

Agent              Role                             Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a15eaa0740335c7a3  builder of step 1                claude-sonnet-5-5       47     98          313453               0     5384216     547      >=1.87
af948d39c18780b67  builder of step 2                claude-sonnet-5-5       51    104          632159               0     9473075    1911      >=3.49
aaf2cfc92bfcb1844  builder of step 3                claude-sonnet-5-5       42     86          411074               0     5895323    1496      >=2.22
ae1c05d01d496c9b9  builder of step 4                claude-sonnet-5-5       87    228         1120897               0    19785802   27964      >=7.04
a15fd806c8f78a9ab  builder of step 6                claude-sonnet-5-5       16    320          852735               0    27324871  209682      >=9.69
a5ab075c3677ad2d7  builder of step 7                claude-sonnet-5-5        0    116          613562               0    11601177  133395        5.19
a8e821b5b3f0e2756  builder of step 8                claude-sonnet-5-5        0     56          271520               0     2769762   36528        1.60
a392a12ca146ff975  brief check of step 1            claude-opus-5-5         22     44          143943               0     2237294     276      >=1.17
abe95054772aeb0bc  brief check of step 2            claude-opus-5-5         37     74          206719               0     5303442     624      >=2.11
a844cca8905e3bb9c  brief check of step 3            claude-opus-5-5         39     78          194232               0     5018219     494      >=1.98
aa5bff28e5e1bed90  brief check of step 4            claude-opus-5-5         50    100          194528               0     6563894     972      >=2.31
af7f592df096cc3fb  brief check of step 5            claude-opus-5-5          0    142          233771               0    10817192   63414        4.60
acf87ddb30973c88b  brief check of step 6            claude-opus-5-5         36     72          226205               0     5335033    1021      >=2.22
acf5b218dfdc17a01  brief check of step 7            claude-opus-5-5          0     72          219465               0     4991324   59541        3.29
ad359a1df2ce3b5fe  brief check of step 8            claude-opus-5-5          0     84          176613               0     4986066   46858        2.82
ae9f3748642ce9c1e  reviewer of step 1               claude-opus-5-5         34     68          169004               0     4142756     362      >=1.68
aec84f54a17e39016  reviewer of step 2               claude-opus-5-5         42     84          203783               0     5774576    1494      >=2.20
afaa4e2644e7b3e6a  reviewer of step 3               claude-opus-5-5         45     90          178346               0     5730611     639      >=2.05
a7eae9ce124bd2bd6  reviewer of step 4               claude-opus-5-5         65    130          243418               0    10583727    1021      >=3.35
a8ec4aa6dab9bc81e  reviewer of step 5               claude-opus-5-5          0    128          232682               0     9465251   53992        4.14
a90205aabc898e907  reviewer of step 6               claude-opus-5-5          0    108          244130               0     8092423   65110        4.14
acaa1cd6ca52da97e  reviewer of step 7               claude-opus-5-5          0     70          244816               0     5369815   46920        3.24
aa9c2761143a81412  reviewer of step 8               claude-opus-5-5          0    102          151705               0     5890323   38428        2.71
a96acd76fe31399ad  reviewer of step 1 over round 1  claude-opus-5-5         20     40          116680               0     1659065     154      >=0.92
ae5cc0ca5a0659313  reviewer of step 2 over round 1  claude-opus-5-5         35     70          161281               0     3558528     883      >=1.54
af5b739d11c2d60e0  reviewer of step 3 over round 1  claude-opus-5-5         34     68          190148               0     4086145     604      >=1.78
a89c479922cf35964  reviewer of step 4 over round 1  claude-sonnet-5-5        0     98          185800               0     7122495   47607        2.37
a92eff98d2db7b840  reviewer of step 5 over round 1  claude-sonnet-5-5        0    106          196323               0     7277984   42131        2.37
aafe40381768b8fce  reviewer of step 6 over round 1  claude-sonnet-5-5        0     86          210489               0     6249678   51431        2.29
ad8e8ad9c3dbbb136  reviewer of step 7 over round 1  claude-sonnet-5-5        0     90          259576               0     8695275   59647        2.98
adeb36a8bdd6bc53b  reviewer of step 8 over round 1  claude-sonnet-5-5        0     44          123229               0     2101933   22642        0.95
a508428b7705f46eb  grill lookup                     claude-opus-5-5         24     48           91579               0     1560867     389      >=0.78
aea0212a318abe908  grill lookup                     claude-opus-5-5         11     22           66447               0      463960     245      >=0.43
af464f4a770b333a6  grill lookup                     claude-opus-5-5         15     30           92998               0      994253     185      >=0.67
```

## Plan 2.E

Plan 2.E (archived at `.scratch/archive/2-e-grill`) ran before the body folder existed, so every row is a lower bound.

```
Plan 2.E grill: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                    20     1072   2174         7657349               0   173755974  254012     >=61.89
brief check                21      608   1216         3283877               0    71470326   17194     >=31.06
reviewer                   20      659   1318         3186019               0    76795510   32165     >=31.94
reviewer over a round      17      497    994         2226819               0    51199034   10594     >=21.59
Total                      78     2836   5702        16354064               0   373220844  313965    >=146.48

Agent              Role                               Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a7e2d8da2f7e6b429  builder of step 1                  claude-opus-5-5         18     38           75398               0     1238411    6331      >=0.75
aca77c40330700c5a  builder of step 2                  claude-opus-5-5         45     92          493753               0     6112981   14724      >=3.99
a4e5bce8772d0d657  builder of step 3                  claude-opus-5-5         89    178          760669               0    17725652   38276      >=8.11
ae2714d2e377ffba9  builder of step 3                  claude-sonnet-5-5       43     86          201805               0     5866628     358      >=1.68
afb733385e80a6b22  builder of step 3                  claude-sonnet-5        109    218          474356               0    25591809   88184      >=7.19
ab59f62dd9e66f9e7  builder of step 4                  claude-opus-5-5         25     52          185770               0     2214777   12471      >=1.62
a875f9d0a947f6cda  builder of step 5                  claude-opus-5-5         40     82          273934               0     4450005   25593      >=2.77
a298a7e61f0556c39  builder of step 6                  claude-sonnet-5-5       20     42          178312               0     1291734     323      >=0.71
aef5fa9f4f1c80805  builder of step 7                  claude-sonnet-5-5       31     64          309861               0     2980485     400      >=1.37
a645de77ce926447e  builder of step 8                  claude-sonnet-5-5       22     46          192796               0     1795691     602      >=0.85
adbcd73f19dbe7eae  builder of step 9                  claude-sonnet-5-5       20     42          200143               0     1621428     406      >=0.83
a931b2d1ac6c7e98d  builder of step 9a                 claude-sonnet-5-5      193    386         1168956               0    39830728    4711     >=10.94
a9e8d4ac4aea212dc  builder of step 9a                 claude-sonnet-5-5      133    266          868429               0    26225485    3246      >=7.45
ac9a7eb3cc16f546c  builder of step 10                 claude-sonnet-5-5       22     46          200858               0     1854208     406      >=0.88
ae449ee78f0bf9ddf  builder of step 11                 claude-sonnet-5-5       40     82          255896               0     4296913     548      >=1.50
af8ac1a436c7c2213  builder of step 12                 claude-sonnet-5-5       53    108          483194               0     8852404   29057      >=3.27
ac6b1b3f4e4cf034e  builder of step 12a                claude-sonnet-5-5       68    138          421880               0     9738730   11132      >=3.11
a75765a1669931042  builder of step 14a                claude-sonnet-5-5       33     68          372613               0     4485382   10264      >=1.93
a12869b0c03367f5b  builder of step 14b                claude-sonnet-5-5       24     50          225195               0     2180156    6466      >=1.06
a23f99bf273bb8deb  builder of step 14c                claude-sonnet-5-5       44     90          313531               0     5402367     514      >=1.87
a9a57fb6f85b48b52  brief check of step 1              claude-opus-5-5         13     26           79750               0      855648    1002      >=0.59
af96ee837d1adb7c7  brief check of step 2              claude-opus-5-5         21     42           91670               0     1539688    1444      >=0.80
a728eba74e934416e  brief check of step 3              claude-opus-5-5         32     64          153916               0     3199919    1953      >=1.45
a789dc55985f66723  brief check of step 4              claude-opus-5-5         24     48           93324               0     1809838    1498      >=0.86
a22ab0fbcb877745c  brief check of step 5              claude-opus-5-5         30     60          125655               0     2923728    1998      >=1.25
ad84caedae9698163  brief check of step 6              claude-opus-5-5         17     34          104603               0     1223424     370      >=0.78
a7007aa25798273ed  brief check of step 7              claude-opus-5-5         25     50           99602               0     1979101     227      >=0.90
af4721357ea684de7  brief check of step 8              claude-opus-5-5         23     46          106178               0     1990030     168      >=0.93
a699640613f47d817  brief check of step 9              claude-opus-5-5         34     68          102827               0     2716938     330      >=1.06
a0efd11b092676656  brief check of step 9a             claude-opus-5-5         34     68          262754               0     6277521     597      >=2.58
a20881af2c74bd1b8  brief check of step 9a             claude-opus-5-5         22     44          255187               0     3721659    1088      >=2.04
a39b4380a345c407e  brief check of step 9a             claude-opus-5-5         37     74          332061               0     8589579    1726      >=3.41
a51b44de3267fa2f1  brief check of step 9a             claude-opus-5-5         41     82          306467               0     7579401    2140      >=3.09
ac1981f7bc7d15672  brief check of step 9a             claude-opus-5-5         25     50          214097               0     3641958     425      >=1.81
a28e51aabff829bf9  brief check of step 10             claude-opus-5-5         21     42           93820               0     1593350     154      >=0.79
aeb2528252e557bc4  brief check of step 11             claude-opus-5-5         28     56          144794               0     3238923     219      >=1.38
aec1f452c11e139cf  brief check of step 12             claude-opus-5-5         51    102          180328               0     6470248     516      >=2.21
ae32aff2265c8e0b3  brief check of step 12a            claude-opus-5-5         23     46          124166               0     1907135     157      >=1.01
a1e387a9c8dd5a603  brief check of step 14a            claude-opus-5-5         36     72          165061               0     4088448     347      >=1.65
abb43dec216464426  brief check of step 14b            claude-opus-5-5         39     78          121891               0     3235818     338      >=1.26
ae2bc9c93a6368c8a  brief check of step 14c            claude-opus-5-5         32     64          125726               0     2887972     497      >=1.22
a8e14477c535e8fa7  reviewer of step 1                 claude-opus-5-5         18     36           90880               0     1398446    1270      >=0.76
aad960981c84ce993  reviewer of step 2                 claude-opus-5-5         30     60          129801               0     3054170    3794      >=1.34
a616958f65947f02b  reviewer of step 3                 claude-opus-5-5         32     64          178655               0     3927522    1987      >=1.72
a9101e85531b9f6e9  reviewer of step 3                 claude-opus-5-5         35     70          166015               0     3963538     584      >=1.63
af3f8a357a2c497f3  reviewer of step 3                 claude-opus-5-5         32     64          166948               0     3678811     397      >=1.58
a5c8dae5aa6c9ede4  reviewer of step 4                 claude-opus-5-5         20     40          103829               0     1564588    1296      >=0.86
abffc5023d497db11  reviewer of step 5                 claude-opus-5-5         24     48          131212               0     2332513   11092      >=1.34
a48841ec0c221192f  reviewer of step 6                 claude-opus-5-5         29     58          110376               0     2564599    1068      >=1.09
ab6e40dc47138ff5d  reviewer of step 7                 claude-opus-5-5         32     64          149903               0     3564580     461      >=1.47
a848bfe82e08a3ec9  reviewer of step 8                 claude-opus-5-5         24     48          105387               0     1948209     367      >=0.92
a3a8bfb51e9648236  reviewer of step 9                 claude-opus-5-5         29     58          147517               0     2923377     321      >=1.33
a24e51727b5e7824c  reviewer of step 9a                claude-opus-5-5         48     96          277254               0     8147747    1382      >=3.04
a829573acbc0a1734  reviewer of step 9a                claude-opus-5-5         35     70          318217               0     6569666    3370      >=2.97
abb5c887c9bdd2def  reviewer of step 10                claude-opus-5-5         34     68          133531               0     3390213    1112      >=1.37
ae9547ab20b63fbcf  reviewer of step 11                claude-opus-5-5         42     84          163243               0     5445300     961      >=1.92
a2d31217ca1dc30ac  reviewer of step 12                claude-opus-5-5         34     68          180434               0     4324738     443      >=1.78
a05acfd10a5295fde  reviewer of step 12a               claude-opus-5-5         40     80          162678               0     4436691     617      >=1.71
a129bf73e9c12ed81  reviewer of step 14a               claude-opus-5-5         42     84          178418               0     5004529     633      >=1.91
ac62ce4943bc04190  reviewer of step 14b               claude-opus-5-5         42     84          136105               0     4626274     405      >=1.61
a0dd6a3b93ed6d820  reviewer of step 14c               claude-opus-5-5         37     74          155616               0     3929999     605      >=1.58
a4a7cc6b81613559f  reviewer of step 1 over round 1    claude-opus-5-5         12     24           50772               0      598028     708      >=0.39
a0eb27e12f5d699cc  reviewer of step 2 over round 1    claude-opus-5-5         15     30           81888               0     1060973    1193      >=0.65
a3d58afa74ebc4e91  reviewer of step 3 over round 1    claude-opus-5-5         45     90          202353               0     5820992     935      >=2.20
a9c0655a40ba85f12  reviewer of step 4 over round 1    claude-opus-5-5         17     34           94884               0     1146420    1130      >=0.73
ae0092694ce1afb80  reviewer of step 5 over round 1    claude-opus-5-5         26     52           97616               0     1855760    1042      >=0.88
aeb0058246f011df3  reviewer of step 6 over round 1    claude-opus-5-5         19     38           98556               0     1478879     195      >=0.79
ac08d005e9158bb2c  reviewer of step 7 over round 1    claude-opus-5-5         33     66          156261               0     3787874     362      >=1.55
aea73ed60282cb9b8  reviewer of step 8 over round 1    claude-opus-5-5         23     46          127993               0     1980017     362      >=1.04
aabd9379789f88aa7  reviewer of step 9 over round 1    claude-opus-5-5         26     52          124370               0     2440017     251      >=1.12
afacbebdfc83a75a7  reviewer of step 9a over round 1   claude-opus-5-5         30     60          184760               0     3655282     466      >=1.66
a1737316019904bbd  reviewer of step 10 over round 1   claude-opus-5-5         25     50           93042               0     1948032     303      >=0.86
a3f572b6261f0ac53  reviewer of step 11 over round 1   claude-opus-5-5         37     74          146402               0     4238139     317      >=1.59
a8acf863141d60192  reviewer of step 12 over round 1   claude-opus-5-5         30     60          166151               0     3499169     521      >=1.54
abc32ab2475e25d69  reviewer of step 12a over round 1  claude-opus-5-5         33     66          139824               0     3664058     994      >=1.45
a8118738207170d54  reviewer of step 14a over round 1  claude-opus-5-5         41     82          177417               0     4795301     796      >=1.86
a4b8de56cd2a793b3  reviewer of step 14b over round 1  claude-opus-5-5         50    100          144405               0     5443123     519      >=1.82
a8d77d92940469860  reviewer of step 14c over round 1  claude-opus-5-5         35     70          140125               0     3786970     500      >=1.47
```

## The brief checks that met dictated text

The brief check's check "8. Dictated text" came with step 3, so the brief checks of steps 1 and 2 have none. Each brief check from step 3 on read the text the orchestrator dictated into the brief line by line against the rules file, `docs/dev/skill-layout.md`, the prose standard and the glossary, giving each line "holds" or each rule it breaks with its page and section. Every line that broke a rule was closed in the brief before the build, as the report's "Closed" section names for steps 3 to 6 and the brief's "Closed" section for steps 7 and 8 (`agents/briefs/7.md:242`, `agents/briefs/8.md:123`).

- Step 3, `agents/reviews/3-brief-check.md` lines 150-183: the `spec` and `refute` lines of the dictated-text check itself, and the **reviewer** term.
- Step 4, `agents/reviews/4-brief-check.md` lines 147-181: the price table's comment lines and rows (one row, `claude-opus-5-5[1m]`, broke rule 11 and was removed), the usage line, the output's titles and column names, the role kinds.
- Step 5, `agents/reviews/5-brief-check.md` lines 146-161: the agent-roles file's heading, its paragraph of agents in no priced role, the Agents template paragraph and case 1's error text.
- Step 6, `agents/reviews/6-brief-check.md` lines 126-162: the "Self-rule" sub-headings, the Rulings bullet form, the choices file's headings and lines, the review lines `C<n> Agree` and `C<n> =>`, and the fix-step form.
- Step 7, `agents/reviews/7-brief-check.md` lines 230-260: the "Next-entry mode" heading, the `Booked:` and `replacing` forms, and the Quick start lines of `/plan --self-rule` and `/grill --self-rule`.
- Step 8, `agents/reviews/8-brief-check.md` lines 119-154: the terms **choices file**, **self-rule**, **open item**, **ruling** and **stop**, and the four sentences of item 7.
