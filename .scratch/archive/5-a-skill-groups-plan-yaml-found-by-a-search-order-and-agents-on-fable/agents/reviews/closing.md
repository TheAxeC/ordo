Plan 5.A Skill groups, plan.yaml found by a search order, and agents on Fable: priced usage of its agents
Prices from /Users/axelfaes/.local/share/ordo-stable/skills/orchestration/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies: none, so every cost is a lower bound.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     5      198    412         2595913               0    37677579  408286     >=49.83
brief check                 5       98    200          752214               0    10514163  150307     >=15.64
reviewer                    5      107    216          907294               0    14769651  179277     >=19.20
reviewer over a round       5       68    138          550716               0     5301836   63908      >=2.55
Total                      20      471    966         4806137               0    68263229  801778     >=87.21

Agent              Role                               Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
ad35ad4cb7d6e0618  builder of step 1                  claude-fable-5-2        43     88          492488               0     7958704   68278      >=9.25
a8ad09548be32789f  builder of step 2                  claude-fable-5-2        53    110          428806               0     8654477   76702      >=9.09
a235f7278dcf9dd9a  builder of step 3                  claude-fable-5-2        54    110          650684               0    12279449  146548     >=14.83
a92f129df7f7c8dad  builder of step 4.A                claude-fable-5-2        24     52          450729               0     4165307   53995      >=7.50
a37581bb6bc0695fb  builder of step 4.B                claude-fable-5-2        24     52          573206               0     4619642   62763      >=9.17
a3baabc725c3d4805  brief check of step 1              claude-fable-5-2        15     30          111704               0     1334247   20638      >=2.21
a4acb97b2cf90ba34  brief check of step 2              claude-fable-5-2        24     48          145712               0     2517017   37740      >=3.47
a4d3ffc7dd382169a  brief check of step 3              claude-fable-5-2        18     36          129653               0     1805106   29833      >=2.85
abe740866c4b4563f  brief check of step 4.A            claude-fable-5-2        22     46          170172               0     2431558   32788      >=3.50
a47ecb618ac9075df  brief check of step 4.B            claude-fable-5-2        19     40          194973               0     2426235   29308      >=3.61
af9bdf0f24d9b60a2  reviewer of step 1                 claude-fable-5-2        22     44          198147               0     3318888   26451      >=3.70
a0017d39ad43dafa5  reviewer of step 2                 claude-fable-5-2        24     48          156714               0     2985048   41288      >=3.82
a5a88f7bf8c87a8df  reviewer of step 3                 claude-fable-5-2        24     50          258281               0     4224136   50185      >=5.44
ac48bcc73303d1ab2  reviewer of step 4.A               claude-fable-5-2        17     34          152938               0     1995444   32831      >=3.24
a03fbb7e634c9b0ca  reviewer of step 4.B               claude-fable-5-2        20     40          141214               0     2246135   28522      >=3.00
afa2da60d2fdec6cb  reviewer of step 1 over round 1    claude-sonnet-5-5        9     18           96988               0      592622    7483      >=0.38
af5606dff19e38bc4  reviewer of step 2 over round 1    claude-sonnet-5-5       18     36          114797               0     1525311   12072      >=0.56
a5832b59f2e35e98e  reviewer of step 3 over round 1    claude-sonnet-5-5       15     30          117993               0     1282955   12353      >=0.55
a8dcb670671355abb  reviewer of step 4.A over round 1  claude-sonnet-5-5       15     32          128150               0     1158515   19932      >=0.64
af7abcb570a9e69e8  reviewer of step 4.B over round 1  claude-sonnet-5-5       11     22           92788               0      742433   12068      >=0.43
