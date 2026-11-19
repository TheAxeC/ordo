# checks.md

## Identifier check (literature review item 2)

Entries: 130 across the four theme files (theme-refs-1.bib 30, theme-refs-2.bib 35, theme-refs-3.bib 30, theme-refs-4.bib 35). 126 carry a DOI or an arXiv ID and are resolved on the DOI, else the arXiv ID. 4 carry only a url and are checked on their official proceedings page.

Result: no identifier provably fails. Every one of the 126 resolve runs printed at least one index record. No index line is `left out`, so no identifier is unchecked. The 4 url-only entries pass: each page names the entry's title. Titles an index prints that differ from the entry's title go to the merge run to resolve.

### Identifier listing

Command: `grep -n -i -E '^[[:space:]]*(doi|eprint)[[:space:]]*=' 'theme-refs-1.bib'`

```
9:  doi       = {10.1002/cem.1180010107}
20:  doi       = {10.1002/(SICI)1099-128X(199601)10:1<47::AID-CEM400>3.0.CO;2-C}
31:  doi       = {10.1109/TPAMI.2012.254}
42:  doi       = {10.1093/biomet/asaf082}
53:  doi       = {10.1080/01621459.2013.776499}
65:  eprint        = {1509.06490},
77:  doi       = {10.1007/s12561-018-9215-6}
88:  doi       = {10.1080/10618600.2017.1401544}
99:  doi       = {10.1007/s11222-026-10892-y}
110:  doi       = {10.1121/1.1981298}
121:  doi       = {10.1002/(SICI)1099-128X(199905/08)13:3/4<275::AID-CEM543>3.0.CO;2-B}
132:  doi       = {10.1002/(SICI)1099-128X(199905/08)13:3/4<295::AID-CEM547>3.0.CO;2-Y}
142:  doi       = {10.1145/3097983.3098014}
152:  doi       = {10.1145/3269206.3271775}
163:  doi       = {10.1007/978-3-319-93764-9_9}
174:  doi       = {10.1137/21M1450033}
184:  doi       = {10.1145/3394486.3403213}
195:  doi       = {10.1137/24M1692836}
206:  doi       = {10.1016/j.neuroimage.2008.05.062}
217:  doi       = {10.1214/18-EJS1421}
228:  doi       = {10.1080/10618600.2021.1978471}
240:  eprint        = {2208.00993},
252:  doi       = {10.1109/JBHI.2025.3530271}
259:  eprint        = {2609.23705},
272:  doi       = {10.1093/biostatistics/kxag007}
283:  doi       = {10.1137/22M1506857}
290:  eprint        = {1105.3422},
302:  doi       = {10.1109/JSTSP.2025.3579651}
313:  doi       = {10.1137/07070111X}
324:  doi       = {10.1007/BF02310791}
```

Exit status: 0

Command: `grep -n -i -E '^[[:space:]]*(doi|eprint)[[:space:]]*=' 'theme-refs-2.bib'`

```
12:  eprint        = {1306.0895},
25:  doi       = {10.1561/2200000073}
36:  doi       = {10.1090/mcom/3303}
47:  eprint        = {1810.08278},
58:  doi           = {10.1109/CVPR52688.2022.00059},
59:  eprint        = {2205.06688},
71:  doi       = {10.1007/s10208-011-9093-5}
82:  eprint        = {1805.09114},
94:  eprint        = {2009.04266},
107:  eprint        = {2106.01128},
118:  doi           = {10.52202/068431-1584},
119:  eprint        = {2206.09398},
128:  eprint        = {2110.02753},
141:  doi       = {10.1137/100805741}
153:  eprint        = {1310.4375},
166:  doi       = {10.1137/141000439}
188:  eprint        = {2202.03813},
212:  doi           = {10.1137/17M1140431},
213:  eprint        = {1708.01955},
225:  doi           = {10.1609/aaai.v34i04.6120},
226:  eprint        = {1911.08530},
238:  eprint        = {2102.06555},
249:  doi           = {10.52202/068431-0857},
250:  eprint        = {2205.15733},
262:  doi       = {10.1109/TPAMI.2024.3409772}
269:  eprint        = {2605.20883},
290:  doi           = {10.1109/CVPR.2016.568},
291:  eprint        = {1511.03198},
303:  doi       = {10.1007/s11263-012-0566-z}
314:  doi           = {10.1093/imaiai/iaac023},
315:  eprint        = {2008.09165},
325:  eprint        = {1906.01277},
335:  eprint        = {2006.12065},
345:  eprint        = {2006.09430},
354:  eprint        = {2006.04804},
368:  eprint        = {2202.03926},
377:  eprint        = {2401.01460},
387:  eprint        = {2510.22033},
400:  eprint        = {2210.06574},
```

Exit status: 0

Command: `grep -n -i -E '^[[:space:]]*(doi|eprint)[[:space:]]*=' 'theme-refs-3.bib'`

```
6:  eprint        = {1703.06114},
16:  eprint        = {1811.01900},
30:  eprint        = {1901.09006},
43:  eprint        = {2107.01959},
53:  eprint        = {1906.02795},
64:  eprint        = {2307.04001},
74:  eprint        = {1511.06391},
89:  eprint        = {1810.00825},
101:  eprint        = {2110.14416},
113:  doi           = {10.1109/CVPR.2017.16},
114:  eprint        = {1612.00593},
124:  eprint        = {1706.02413},
137:  doi           = {10.1145/3326362},
138:  eprint        = {1801.07829},
149:  doi           = {10.1109/ICCV.2019.00651}
159:  doi           = {10.1109/ICCV.2019.00443},
160:  eprint        = {1908.09186},
171:  doi           = {10.1109/ICCV48922.2021.01595},
172:  eprint        = {2012.09164},
184:  doi           = {10.1016/S0004-3702(96)00034-3}
196:  eprint        = {1802.04712},
208:  doi           = {10.1016/j.patcog.2017.08.026},
209:  eprint        = {1610.02501},
221:  doi           = {10.1038/s41591-019-0508-1}
232:  doi           = {10.1038/s41551-020-00682-w}
242:  eprint        = {2106.00908},
252:  eprint        = {2006.12065},
274:  doi           = {10.1109/TPAMI.2023.3314661}
283:  eprint        = {2405.16519},
296:  doi           = {10.1007/978-3-030-00931-1_60},
297:  eprint        = {1806.01069},
309:  doi           = {10.1007/978-3-031-16431-6_17},
310:  eprint        = {2207.02402},
321:  doi           = {10.1109/EMBC40787.2023.10340878},
322:  eprint        = {2307.07298},
331:  eprint        = {2310.16863},
343:  doi           = {10.1007/978-3-032-04927-8_31}
```

Exit status: 0

Command: `grep -n -i -E '^[[:space:]]*(doi|eprint)[[:space:]]*=' 'theme-refs-4.bib'`

```
5:  doi = {10.1016/j.media.2007.06.004},
16:  doi = {10.1109/TMI.2019.2897538},
27:  doi = {10.1016/j.media.2025.103893},
37:  doi = {10.1007/978-3-319-66182-7_34},
48:  doi = {10.1016/j.ejca.2011.11.036},
59:  doi = {10.1038/ncomms5006},
70:  doi = {10.1148/radiol.2015151169},
81:  doi = {10.1038/nrclinonc.2017.141},
92:  doi = {10.1158/0008-5472.CAN-17-0339},
103:  doi = {10.1148/radiol.2020191145},
114:  doi = {10.1016/j.ijrobp.2018.05.053},
125:  doi = {10.1002/mp.14368},
136:  doi = {10.1038/s41598-022-20703-9},
147:  doi = {10.1007/978-3-319-24574-4_28},
158:  doi = {10.1016/j.media.2016.10.004},
168:  doi = {10.1109/TMI.2014.2377694},
179:  doi = {10.1038/s41592-020-01008-z},
190:  doi = {10.1007/978-3-319-19992-4_20},
201:  doi = {10.1007/978-3-319-19992-4_32},
213:  doi = {10.1007/978-3-030-20351-1_18},
224:  doi = {10.52202/068431-1584},
234:  doi = {10.1016/j.media.2023.102864},
244:  doi = {10.3389/fonc.2025.1700447},
254:  doi = {10.1007/978-3-030-87240-3_72},
265:  doi = {10.1007/978-3-031-43993-3_22},
276:  doi = {10.1016/j.media.2020.101852},
286:  doi = {10.1007/978-3-031-16431-6_17},
297:  doi = {10.1109/embc40787.2023.10340878},
307:  doi = {10.1109/tmi.2017.2751523},
318:  doi = {10.1016/j.isci.2024.109004},
331:  eprint = {1908.02738},
342:  eprint = {2111.00648},
351:  eprint = {2203.04964},
360:  eprint = {2605.20883},
369:  eprint = {2602.09933},
```

Exit status: 0

### Proceedings pages of the entries with no DOI and no arXiv ID (WebFetch)

| Entry | url | What the page showed | Result |
|---|---|---|---|
| peyre2016gromov (theme 2) | https://proceedings.mlr.press/v48/peyre16.html | Title "Gromov-Wasserstein Averaging of Kernel and Distance Matrices"; Gabriel Peyre, Marco Cuturi, Justin Solomon; PMLR 48:2664-2672, ICML 2016 | passes |
| rolet2016fast (theme 2) | https://proceedings.mlr.press/v51/rolet16.html | Title "Fast Dictionary Learning with a Smoothed Wasserstein Loss"; Antoine Rolet, Marco Cuturi, Gabriel Peyre; PMLR 51:630-638, AISTATS 2016 | passes |
| huang2016supervised (theme 2) | https://proceedings.neurips.cc/paper_files/paper/2016/hash/10c66082c124f8afe3df4886f5e516e0-Abstract.html | Title "Supervised Word Mover's Distance"; Gao Huang, Chuan Guo, Matt J Kusner, Yu Sun, Fei Sha, Kilian Q. Weinberger; NIPS 2016 (NeurIPS 29) | passes |
| naderializadeh2021pswe (theme 3) | https://proceedings.neurips.cc/paper/2021/hash/1bc2029a8851ad344a8d503930dfd7f7-Abstract.html | Title "Pooling by Sliced-Wasserstein Embedding"; Navid Naderializadeh, Joseph F Comer, Reed Andrews, Heiko Hoffmann, Soheil Kolouri; NeurIPS 34 (2021) | passes |

### Resolve runs

The four runs on a url (peyre2016gromov, rolet2016fast, huang2016supervised, naderializadeh2021pswe) passed the entry's url to `resolve` in place of an identifier, since those entries have none. They print `not found` for a url and count for nothing; those entries are checked on their proceedings pages above.

### theme 1, wold1987multiway

Command: `python3 lookup resolve '10.1002/cem.1180010107'`

```
Crossref: ratio 1.00: Multi<hyphen>way principal components<hyphen>and PLS<hyphen>analysis | Svante Wold, Paul Geladi, Kim Esbensen, Jerker <latin capital letter o with diaeresis>hman | 1987 | Journal of Chemometrics | vol 1 | no 1 | pages 41--56 | doi 10.1002/cem.1180010107
OpenAlex: ratio 1.00: Multi<hyphen>way principal components<hyphen>and PLS<hyphen>analysis | Svante Wold, Paul L. M. Geladi, Kim H. Esbensen, Jerker <latin capital letter o with diaeresis>hman | 1987 | Journal of Chemometrics | vol 1 | no 1 | pages 41--56 | doi 10.1002/cem.1180010107 | OpenAlex W2055703272
Semantic Scholar: ratio 1.00: Multi<hyphen>way principal components<hyphen>and PLS<hyphen>analysis | S. Wold, P. Geladi, K. Esbensen, J. <latin capital letter o with diaeresis>hman | 1987 | vol 1 | doi 10.1002/cem.1180010107 | Semantic Scholar 6973b86cda44d0a863dded45b0206dac7b3270de
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, bro1996multiway

Command: `python3 lookup resolve '10.1002/(SICI)1099-128X(199601)10:1<47::AID-CEM400>3.0.CO;2-C'`

```
Crossref: ratio 1.00: Multiway calibration. Multilinear PLS | Rasmus Bro | 1996 | Journal of Chemometrics | vol 10 | no 1 | pages 47--61 | doi 10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c
OpenAlex: ratio 1.00: Multiway calibration. Multilinear PLS | Rasmus Bro | 1996 | Journal of Chemometrics | vol 10 | no 1 | pages 47--61 | doi 10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c | OpenAlex W2155639125
Semantic Scholar: ratio 1.00: Multiway calibration. Multilinear PLS | R. Bro | 1996 | vol 10 | doi 10.1002/(SICI)1099-128X(199601)10:1<47::AID-CEM400>3.0.CO;2-C | Semantic Scholar 5d7a1f4c37d36b804183d4240a304d1539cf5551
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, zhao2013hopls

Command: `python3 lookup resolve '10.1109/TPAMI.2012.254'`

```
Crossref: ratio 1.00: Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method | Qibin Zhao, C. F. Caiafa, D. P. Mandic, Z. C. Chao, Y. Nagasaka, N. Fujii, Liqing Zhang, A. Cichocki | 2013 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 35 | no 7 | pages 1660--1673 | doi 10.1109/tpami.2012.254
OpenAlex: ratio 1.00: Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method | Qibin Zhao, Cesar Federico Caiafa, Danilo P. Mandic, Z. C. Chao, Yasuo Nagasaka, Naotaka Fujii, Liqing Zhang, Andrzej S Cichocki | 2012 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 35 | no 7 | pages 1660--1673 | doi 10.1109/tpami.2012.254 | OpenAlex W1967696752 | open access https://arxiv.org/pdf/1207.1230
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, park2026sparsehopls

Command: `python3 lookup resolve '10.1093/biomet/asaf082'`

```
Crossref: ratio 1.00: Sparse higher-order partial least squares for simultaneous variable selection, dimension reduction and tensor denoising | Kwangmoon Park, S<latin small letter u with diaeresis>nd<latin small letter u with diaeresis>z Kele<latin small letter s with cedilla> | 2025 | Biometrika | vol 113 | no 1 | doi 10.1093/biomet/asaf082
OpenAlex: ratio 1.00: Sparse higher-order partial least squares for simultaneous variable selection, dimension reduction and tensor denoising | Kwangmoon Park, S<latin small letter u with diaeresis>nd<latin small letter u with diaeresis>z Kele<latin small letter s with cedilla> | 2025 | Biometrika | vol 113 | no 1 | doi 10.1093/biomet/asaf082 | OpenAlex W7106135362 | open access https://arxiv.org/pdf/2310.09428
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, zhou2013tensor

Command: `python3 lookup resolve '10.1080/01621459.2013.776499'`

```
Crossref: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Lexin Li, Hongtu Zhu | 2013 | Journal of the American Statistical Association | vol 108 | no 502 | pages 540--552 | doi 10.1080/01621459.2013.776499
OpenAlex: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Lexin Li, Hongtu Zhu | 2013 | Journal of the American Statistical Association | vol 108 | no 502 | pages 540--552 | doi 10.1080/01621459.2013.776499 | OpenAlex W2136002544 | open access http://europepmc.org/articles/PMC4004091
Semantic Scholar: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Le-Xin Li, Hong-Tu Zhu | 2012 | Journal of the American Statistical Association | vol 108 | pages 540--552 | doi 10.1080/01621459.2013.776499 | arXiv 1203.3209 | Semantic Scholar cae78de351d5cbd5bd7fd853cf07034ca2e6659c | open access http://europepmc.org/articles/PMC4004091
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, guhaniyogi2017bayesian

Command: `python3 lookup resolve '1509.06490'`

```
Crossref: not found
OpenAlex: ratio 1.00: Bayesian Tensor Regression | Rajarshi Guhaniyogi, Shaan Qamar, David B. Dunson | 2015 | arXiv (Cornell University) | vol 18 | no 79 | pages 1--31 | doi 10.48550/arxiv.1509.06490 | arXiv 1509.06490 | OpenAlex W2529970985 | open access https://arxiv.org/pdf/1509.06490
Semantic Scholar: ratio 1.00: Bayesian Tensor Regression | Rajarshi Guhaniyogi, Shaan Qamar, D. Dunson | 2015 | Journal of machine learning research | vol 18 | pages 79:1--79:31 | arXiv 1509.06490 | Semantic Scholar 03e2ba1bc02d230661adfcda9ed2953fb2d7f741
arXiv: ratio 1.00: Bayesian Tensor Regression | Rajarshi Guhaniyogi, Shaan Qamar, David B. Dunson | 2015 | arXiv 1509.06490
```

Exit status: 0

### theme 1, li2018tucker

Command: `python3 lookup resolve '10.1007/s12561-018-9215-6'`

```
Crossref: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiaoshan Li, Da Xu, Hua Zhou, Lexin Li | 2018 | Statistics in Biosciences | vol 10 | no 3 | pages 520--545 | doi 10.1007/s12561-018-9215-6
OpenAlex: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiaoshan Li, Da Xu, Hua Zhou, Lexin Li | 2018 | Statistics in Biosciences | vol 10 | no 3 | pages 520--545 | doi 10.1007/s12561-018-9215-6 | OpenAlex W1580176742 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8336908/
Semantic Scholar: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiao-Shan Li, Da Xu, Hua Zhou, Le-Xin Li | 2013 | Statistics in Biosciences | vol 10 | pages 520--545 | doi 10.1007/s12561-018-9215-6 | arXiv 1304.5637 | Semantic Scholar 99163e795fb486abbee830608383b6a142cdf434 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8336908/
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, lock2018tensor

Command: `python3 lookup resolve '10.1080/10618600.2017.1401544'`

```
Crossref: ratio 1.00: Tensor-on-Tensor Regression | Eric F. Lock | 2018 | Journal of Computational and Graphical Statistics | vol 27 | no 3 | pages 638--647 | doi 10.1080/10618600.2017.1401544
OpenAlex: ratio 1.00: Tensor-on-Tensor Regression | Eric F. Lock | 2017 | Journal of Computational and Graphical Statistics | vol 27 | no 3 | pages 638--647 | doi 10.1080/10618600.2017.1401544 | OpenAlex W2569250433 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/6188709
Semantic Scholar: ratio 1.00: Tensor-on-tensor regression | E. Lock | 2017 | Journal of Computational And Graphical Statistics | vol 27 | pages 638--647 | doi 10.1080/10618600.2017.1401544 | arXiv 1701.01037 | Semantic Scholar e03232f936068366ac259fd0f01c075d12a29ce8 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/6188709
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, huang2026shift

Command: `python3 lookup resolve '10.1007/s11222-026-10892-y'`

```
Crossref: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and Computing | vol 36 | no 3 | doi 10.1007/s11222-026-10892-y
OpenAlex: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and Computing | vol 36 | no 3 | doi 10.1007/s11222-026-10892-y | OpenAlex W7160305416 | open access https://link.springer.com/content/pdf/10.1007/s11222-026-10892-y.pdf
Semantic Scholar: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and computing | vol 36 | doi 10.1007/s11222-026-10892-y | Semantic Scholar 0022f9272776da223a17c89c95429f0a0c3d07cc | open access https://link.springer.com/content/pdf/10.1007/s11222-026-10892-y.pdf
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, harshman1972parafac2

Command: `python3 lookup resolve '10.1121/1.1981298'`

```
Crossref: ratio 1.00: <scp>PARAFAC2</scp>: Extensions of a Procedure for <left double quotation mark>Explanatory<right double quotation mark> Factor-Analysis and Multidimensional Scaling | Richard Harshman | 1972 | The Journal of the Acoustical Society of America | vol 51 | no 1A_Supplement | pages 111--111 | doi 10.1121/1.1981298
OpenAlex: ratio 0.97: PARAFAC2 : Extensions of a Procedure for <left double quotation mark>Explanatory<right double quotation mark> Factor-Analysis and Multidimensional Scaling | Richard A. Harshman | 1972 | The Journal of the Acoustical Society of America | vol 51 | no 1A_Supplement | pages 111--111 | doi 10.1121/1.1981298 | OpenAlex W2011925711 | open access https://pubs.aip.org/asa/jasa/article-pdf/51/1A_Supplement/111/11711089/111_5_online.pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, kiers1999parafac2

Command: `python3 lookup resolve '10.1002/(SICI)1099-128X(199905/08)13:3/4<275::AID-CEM543>3.0.CO;2-B'`

```
Crossref: ratio 1.00: PARAFAC2<em dash>Part I. A direct fitting algorithm for the PARAFAC2 model | Henk A. L. Kiers, Jos M. F. ten Berge, Rasmus Bro | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 275--294 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b
OpenAlex: ratio 0.99: PARAFAC2 - Part I. A direct fitting algorithm for the PARAFAC2 model | Henk A. L. Kiers, Jos M. F. ten Berge, Rasmus Bro | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 275--294 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b | OpenAlex W2167838035
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, bro1999parafac2

Command: `python3 lookup resolve '10.1002/(SICI)1099-128X(199905/08)13:3/4<295::AID-CEM547>3.0.CO;2-Y'`

```
Crossref: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | Rasmus Bro, Claus A. Andersson, Henk A. L. Kiers | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 295--309 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y
OpenAlex: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | Rasmus Bro, Claus A. Andersson, Henk A. L. Kiers | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 295--309 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y | OpenAlex W1964121443
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, perros2017spartan

Command: `python3 lookup resolve '10.1145/3097983.3098014'`

```
Crossref: ratio 1.00: SPARTan | Ioakeim Perros, Evangelos E. Papalexakis, Fei Wang, Richard Vuduc, Elizabeth Searles, Michael Thompson, Jimeng Sun | 2017 | Proceedings of the 23rd ACM SIGKDD International Conference on Knowledge Discovery and Data Mining | pages 375--384 | doi 10.1145/3097983.3098014
OpenAlex: DOI_MISMATCH, ratio 0.26: SPARTan: Scalable PARAFAC2 for Large & Sparse Data | Ioakeim Perros, Evangelos E. Papalexakis, Fei Wang, Richard W. Vuduc, Elizabeth Searles, Michael Thompson, Jimeng Sun | 2017 | ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD) | pages 375--384 | doi 10.1145/3097983.3098014 | OpenAlex W2604652149
Semantic Scholar: DOI_MISMATCH, ratio 0.26: SPARTan: Scalable PARAFAC2 for Large & Sparse Data | Ioakeim Perros, E. Papalexakis, Fei Wang, R. Vuduc, Elizabeth Searles, Michael Thompson, Ji-Meng Sun | 2017 | Knowledge Discovery and Data Mining | doi 10.1145/3097983.3098014 | arXiv 1703.04219 | Semantic Scholar 143a2335d35c669aabb983448a3113d3abe1a8dc
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, afshar2018copa

Command: `python3 lookup resolve '10.1145/3269206.3271775'`

```
Crossref: ratio 1.00: COPA | Ardavan Afshar, Ioakeim Perros, Evangelos E. Papalexakis, Elizabeth Searles, Joyce Ho, Jimeng Sun | 2018 | Proceedings of the 27th ACM International Conference on Information and Knowledge Management | pages 793--802 | doi 10.1145/3269206.3271775
OpenAlex: DOI_MISMATCH, ratio 0.15: COPA: Constrained PARAFAC2 for Sparse & Large Datasets | Ardavan Afshar, Ioakeim Perros, Evangelos E. Papalexakis, Elizabeth Searles, Joyce C. Ho, Jimeng Sun | 2018 | ACM International Conference on Information and Knowledge Management (CIKM) | vol 2018 | pages 793--802 | doi 10.1145/3269206.3271775 | OpenAlex W2964343053 | open access https://dl.acm.org/doi/pdf/10.1145/3269206.3271775
Semantic Scholar: DOI_MISMATCH, ratio 0.15: COPA: Constrained PARAFAC2 for Sparse & Large Datasets | Ardavan Afshar, Ioakeim Perros, E. Papalexakis, Elizabeth Searles, Joyce Ho, Ji-Meng Sun | 2018 | International Conference on Information and Knowledge Management | vol 2018 | pages 793--802 | doi 10.1145/3269206.3271775 | arXiv 1803.04572 | Semantic Scholar 48cfb687fa140be30e6c61775e83f77ea391fa3f | open access https://dl.acm.org/doi/pdf/10.1145/3269206.3271775
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, cohen2018nonnegative

Command: `python3 lookup resolve '10.1007/978-3-319-93764-9_9'`

```
Crossref: ratio 1.00: Nonnegative PARAFAC2: A Flexible Coupling Approach | Jeremy E. Cohen, Rasmus Bro | 2018 | Lecture Notes in Computer Science | pages 89--98 | doi 10.1007/978-3-319-93764-9_9
OpenAlex: ratio 1.00: Nonnegative PARAFAC2: A Flexible Coupling Approach | J<latin small letter e with acute>r<latin small letter e with acute>my E. Cohen, Rasmus Bro | 2018 | Lecture notes in computer science | pages 89--98 | doi 10.1007/978-3-319-93764-9_9 | OpenAlex W2785676486 | open access https://arxiv.org/pdf/1802.05035.pdf
Semantic Scholar: ratio 1.00: Nonnegative PARAFAC2: A Flexible Coupling Approach | Jeremy E. Cohen, R. Bro | 2018 | Latent Variable Analysis and Signal Separation | pages 89--98 | doi 10.1007/978-3-319-93764-9_9 | arXiv 1802.05035 | Semantic Scholar 4fac615c6cf7a1e915683d485e48f72767d110f2 | open access https://arxiv.org/pdf/1802.05035.pdf
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, roald2022aoadmm

Command: `python3 lookup resolve '10.1137/21M1450033'`

```
Crossref: ratio 1.00: An AO-ADMM Approach to Constraining PARAFAC2 on All Modes | Marie Roald, Carla Schenker, Vince D. Calhoun, T<latin small letter u with diaeresis>lay Adali, Rasmus Bro, Jeremy E. Cohen, Evrim Acar | 2022 | SIAM Journal on Mathematics of Data Science | vol 4 | no 3 | pages 1191--1222 | doi 10.1137/21m1450033
OpenAlex: ratio 1.00: An AO-ADMM Approach to Constraining PARAFAC2 on All Modes | Marie Roald, Carla Schenker, Vince D. Calhoun, T<latin small letter u with diaeresis>lay Adal<latin small letter dotless i>, Rasmus Bro, J<latin small letter e with acute>r<latin small letter e with acute>my E. Cohen, Evrim Acar | 2022 | SIAM Journal on Mathematics of Data Science | vol 4 | no 3 | pages 1191--1222 | doi 10.1137/21m1450033 | OpenAlex W3204697898 | open access https://researchprofiles.ku.dk/da/publications/dd651ebc-6bf8-47dc-bbd0-6ef6c9d69de1
Semantic Scholar: ratio 1.00: An AO-ADMM approach to constraining PARAFAC2 on all modes | Marie Roald, Carla Schenker, Vince D. Calhoun, T. Adal<latin small letter dotless i>, R. Bro, J<latin small letter e with acute>r<latin small letter e with acute>my E. Cohen, E. Acar | 2021 | SIAM Journal on Mathematics of Data Science | vol abs/2110.01278 | doi 10.1137/21M1450033 | arXiv 2110.01278 | Semantic Scholar 01704228ef364e00f837bbcfac101410d8caf6ea | open access https://researchprofiles.ku.dk/da/publications/dd651ebc-6bf8-47dc-bbd0-6ef6c9d69de1
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, yin2020logpar

Command: `python3 lookup resolve '10.1145/3394486.3403213'`

```
Crossref: ratio 1.00: LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values | Kejing Yin, Ardavan Afshar, Joyce C. Ho, William K. Cheung, Chao Zhang, Jimeng Sun | 2020 | Proceedings of the 26th ACM SIGKDD International Conference on Knowledge Discovery &amp; Data Mining | pages 1625--1635 | doi 10.1145/3394486.3403213
OpenAlex: ratio 1.00: LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values | Kejing Yin, Ardavan Afshar, Joyce C. Ho, William K. Cheung, Chao Zhang, Jimeng Sun | 2020 | ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD) | vol 2020 | pages 1625--1635 | doi 10.1145/3394486.3403213 | OpenAlex W3080327921 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8186437/
Semantic Scholar: ratio 1.00: LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values | Kejing Yin, Ardavan Afshar, Joyce Ho, W. Cheung, Chao Zhang, Ji-Meng Sun | 2020 | Knowledge Discovery and Data Mining | vol 2020 | pages 1625--1635 | doi 10.1145/3394486.3403213 | Semantic Scholar 6f6d2b257ca9d7073da28ed66884fb53fa08295d | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8186437/
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, tang2026unaligned

Command: `python3 lookup resolve '10.1137/24M1692836'`

```
Crossref: ratio 1.00: Tensor Decomposition with Unaligned Observations | Runshi Tang, Tamara G. Kolda, Anru R. Zhang | 2026 | SIAM Journal on Matrix Analysis and Applications | vol 47 | no 1 | pages 107--131 | doi 10.1137/24m1692836
OpenAlex: ratio 1.00: Tensor Decomposition with Unaligned Observations | Runshi Tang, Tamara G. Kolda, Anru R. Zhang | 2026 | SIAM Journal on Matrix Analysis and Applications | vol 47 | no 1 | pages 107--131 | doi 10.1137/24m1692836 | OpenAlex W7127277482 | open access https://arxiv.org/pdf/2410.14046
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, morup2008shift

Command: `python3 lookup resolve '10.1016/j.neuroimage.2008.05.062'`

```
Crossref: ratio 1.00: Shift-invariant multilinear decomposition of neuroimaging data | Morten M<latin small letter o with stroke>rup, Lars Kai Hansen, Sidse Marie Arnfred, Lek-Heng Lim, Kristoffer Hougaard Madsen | 2008 | NeuroImage | vol 42 | no 4 | pages 1439--1450 | doi 10.1016/j.neuroimage.2008.05.062
OpenAlex: ratio 1.00: Shift-invariant multilinear decomposition of neuroimaging data | Morten M<latin small letter o with stroke>rup, Lars Kai Hansen, Sidse Arnfred, Lek<hyphen>Heng Lim, Kristoffer Hougaard Madsen | 2008 | NeuroImage | vol 42 | no 4 | pages 1439--1450 | doi 10.1016/j.neuroimage.2008.05.062 | OpenAlex W2095141632
Semantic Scholar: ratio 1.00: Shift-invariant multilinear decomposition of neuroimaging data | M. M<latin small letter o with stroke>rup, L. Hansen, S. Arnfred, Lek-Heng Lim, Kristoffer Hougaard Madsen | 2008 | NeuroImage | vol 42 4 | pages 1439--50 | doi 10.1016/j.neuroimage.2008.05.062 | Semantic Scholar b63ce62e20b4afa7b377307783f58dde6748f8a7 | open access http://eprints.drcmr.dk/29/1/Shift_invariant_decomp_2008.pdf
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, lock2018supervised

Command: `python3 lookup resolve '10.1214/18-EJS1421'`

```
Crossref: ratio 1.00: Supervised multiway factorization | Eric F. Lock, Gen Li | 2018 | Electronic Journal of Statistics | vol 12 | no 1 | pages 1150--1180 | doi 10.1214/18-ejs1421
OpenAlex: ratio 1.00: Supervised multiway factorization | Eric F. Lock, Gen Li | 2018 | Electronic Journal of Statistics | vol 12 | no 1 | pages 1150--1180 | doi 10.1214/18-ejs1421 | OpenAlex W2574800895 | open access https://projecteuclid.org/journals/electronic-journal-of-statistics/volume-12/issue-1/Supervised-multiway-factorization/10.1214/18-EJS1421.pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, hu2022generalized

Command: `python3 lookup resolve '10.1080/10618600.2021.1978471'`

```
Crossref: ratio 1.00: Generalized Tensor Decomposition With Features on Multiple Modes | Jiaxin Hu, Chanwoo Lee, Miaoyan Wang | 2021 | Journal of Computational and Graphical Statistics | vol 31 | no 1 | pages 204--218 | doi 10.1080/10618600.2021.1978471
OpenAlex: ratio 1.00: Generalized Tensor Decomposition With Features on Multiple Modes | Jiaxin Hu, Chanwoo Lee, Miaoyan Wang | 2021 | Journal of Computational and Graphical Statistics | vol 31 | no 1 | pages 204--218 | doi 10.1080/10618600.2021.1978471 | OpenAlex W3193291542 | open access https://arxiv.org/pdf/1910.09499
Semantic Scholar: ratio 1.00: Generalized Tensor Decomposition With Features on Multiple Modes | Jiaxin Hu, Chan-Woo Lee, Miao-Yan Wang | 2019 | Journal of Computational And Graphical Statistics | vol 31 | pages 204--218 | doi 10.1080/10618600.2021.1978471 | arXiv 1910.09499 | Semantic Scholar 707660f2b0bd8c694a6966a30c31f6c9c882c6ed | open access https://arxiv.org/pdf/1910.09499
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, ren2023multipar

Command: `python3 lookup resolve '2208.00993'`

```
Crossref: not found
OpenAlex: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yifei Ren, Jian Lou, Xiong Li, Joyce C. Ho, Xiaoqian Jiang, Sivasubramanium Bhavan | 2022 | arXiv (Cornell University) | doi 10.48550/arxiv.2208.00993 | arXiv 2208.00993 | OpenAlex W4289597181 | open access https://arxiv.org/pdf/2208.00993
Semantic Scholar: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yi-Fei Ren, Jian Lou, Li Xiong, Joyce Ho, Xiaoqian Jiang, S. Bhavani | 2022 | arXiv.org | vol abs/2208.00993 | doi 10.48550/arXiv.2208.00993 | arXiv 2208.00993 | Semantic Scholar e8aa9a0fe21c23d18c872475a1f92ef9ab7cd4b7 | open access http://arxiv.org/pdf/2208.00993
arXiv: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yifei Ren, Jian Lou, Li Xiong, Joyce C Ho, Xiaoqian Jiang, Sivasubramanium Bhavani | 2022 | arXiv 2208.00993
```

Exit status: 0

### theme 1, konyar2025semisupervised

Command: `python3 lookup resolve '10.1109/JBHI.2025.3530271'`

```
Crossref: ratio 1.00: Semi-Supervised PARAFAC2 Decomposition for Computational Phenotyping Using Electronic Health Records | Elif Konyar, Mostafa Reisi Gahrooei | 2025 | IEEE Journal of Biomedical and Health Informatics | vol 29 | no 6 | pages 4415--4425 | doi 10.1109/jbhi.2025.3530271
OpenAlex: ratio 1.00: Semi-Supervised PARAFAC2 Decomposition for Computational Phenotyping Using Electronic Health Records | Elif Konyar, Mostafa Reisi Gahrooei | 2025 | IEEE Journal of Biomedical and Health Informatics | vol 29 | no 6 | pages 4415--4425 | doi 10.1109/jbhi.2025.3530271 | OpenAlex W4406418094
Semantic Scholar: ratio 1.00: Semi-Supervised PARAFAC2 Decomposition for Computational Phenotyping Using Electronic Health Records | Elif Konyar, M. Gahrooei | 2025 | IEEE journal of biomedical and health informatics | vol 29 | pages 4415--4425 | doi 10.1109/JBHI.2025.3530271 | Semantic Scholar af4b6e676f4977a4273cbf12be569df2f78884a5
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, patalano2026par2cox

Command: `python3 lookup resolve '2609.23705'`

```
Crossref: not found
OpenAlex: ratio 1.00: PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data | Mariafrancesca Patalano, Elif Konyar, Kamran Paynabar | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2609.23705 | arXiv 2609.23705 | OpenAlex W7214014480 | open access https://arxiv.org/pdf/2609.23705
Semantic Scholar: ratio 1.00: PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data | Mariafrancesca Patalano, Elif Konyar, K. Paynabar | 2026 | arXiv 2609.23705 | Semantic Scholar 771ea4ac7c2f53c12900ccbdcb94d3e2cb5711a7
arXiv: ratio 1.00: PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data | Mariafrancesca Patalano, Elif Konyar, Kamran Paynabar | 2026 | arXiv 2609.23705
```

Exit status: 0

### theme 1, alam2026joint

Command: `python3 lookup resolve '10.1093/biostatistics/kxag007'`

```
Crossref: ratio 1.00: Joint modeling of high-dimensional longitudinal data and survival using supervised low-rank tensor decomposition | Mohammad Samsul Alam, Rima Kaddurah-Daouk, Sheng Luo | 2026 | Biostatistics | vol 27 | no 1 | doi 10.1093/biostatistics/kxag007
OpenAlex: ratio 1.00: Joint modeling of high-dimensional longitudinal data and survival using supervised low-rank tensor decomposition | Mohammad Samsul Alam, Rima Kaddurah<hyphen>Daouk, Sheng Luo | 2026 | Biostatistics | vol 27 | no 1 | doi 10.1093/biostatistics/kxag007 | OpenAlex W7153776866 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13070533/
Semantic Scholar: ratio 1.00: Joint modeling of high-dimensional longitudinal data and survival using supervised low-rank tensor decomposition | Mohammad Samsul Alam, R. Kaddurah-Daouk, Sheng Luo | 2026 | Biostatistics | vol 27 | doi 10.1093/biostatistics/kxag007 | Semantic Scholar ce2eee3c87f4884170d6b390f4889c29b6dd8c56 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13070533/
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, sprangers2023group

Command: `python3 lookup resolve '10.1137/22M1506857'`

```
Crossref: ratio 1.00: Group-Invariant Tensor Train Networks for Supervised Learning | Brent Sprangers, Nick Vannieuwenhoven | 2023 | SIAM Journal on Mathematics of Data Science | vol 5 | no 4 | pages 829--853 | doi 10.1137/22m1506857
OpenAlex: ratio 1.00: Group-Invariant Tensor Train Networks for Supervised Learning | Brent Sprangers, Nick Vannieuwenhoven | 2023 | SIAM Journal on Mathematics of Data Science | vol 5 | no 4 | pages 829--853 | doi 10.1137/22m1506857 | OpenAlex W4387500824 | open access https://lirias.kuleuven.be/retrieve/e79ca68a-98b7-4fe9-b928-09ffb6771bc9
Semantic Scholar: ratio 1.00: Group-invariant tensor train networks for supervised learning | Brent Sprangers, N. Vannieuwenhoven | 2022 | SIAM Journal on Mathematics of Data Science | vol abs/2206.15051 | doi 10.1137/22M1506857 | arXiv 2206.15051 | Semantic Scholar 9816356916fb2a82c500f91824d1f2c6ddb5deb1 | open access https://lirias.kuleuven.be/retrieve/e79ca68a-98b7-4fe9-b928-09ffb6771bc9
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, acar2011allatonce

Command: `python3 lookup resolve '1105.3422'`

```
Crossref: not found
OpenAlex: ratio 1.00: All-at-once Optimization for Coupled Matrix and Tensor Factorizations | Evrim Acar, Tamara G. Kolda, Daniel Dunlavy | 2011 | arXiv (Cornell University) | doi 10.48550/arxiv.1105.3422 | arXiv 1105.3422 | OpenAlex W1632866817 | open access https://arxiv.org/pdf/1105.3422
Semantic Scholar: ratio 1.00: All-at-once Optimization for Coupled Matrix and Tensor Factorizations | E. Acar, T. Kolda, Daniel M. Dunlavy | 2011 | arXiv.org | vol abs/1105.3422 | doi 10.48550/arXiv.1105.3422 | arXiv 1105.3422 | Semantic Scholar 18977c6f7abb245691f4268ccd116036bd2391f0
arXiv: ratio 1.00: All-at-once Optimization for Coupled Matrix and Tensor Factorizations | Evrim Acar, Tamara G. Kolda, Daniel M. Dunlavy | 2011 | arXiv 1105.3422
```

Exit status: 0

### theme 1, schenker2025parafac2cmtf

Command: `python3 lookup resolve '10.1109/JSTSP.2025.3579651'`

```
Crossref: ratio 1.00: PARAFAC2-Based Coupled Matrix and Tensor Factorizations With Constraints | Carla Schenker, Xiulin Wang, David Horner, Morten A. Rasmussen, Evrim Acar | 2025 | IEEE Journal of Selected Topics in Signal Processing | vol 19 | no 7 | pages 1461--1476 | doi 10.1109/jstsp.2025.3579651
OpenAlex: ratio 1.00: PARAFAC2-Based Coupled Matrix and Tensor Factorizations With Constraints | Carla Schenker, Xiulin Wang, David A. Horner, Morten Arendt Rasmussen, Evrim Acar | 2025 | IEEE Journal of Selected Topics in Signal Processing | vol 19 | no 7 | pages 1461--1476 | doi 10.1109/jstsp.2025.3579651 | OpenAlex W4411232428 | open access https://arxiv.org/pdf/2406.12338
Semantic Scholar: ratio 1.00: PARAFAC2-Based Coupled Matrix and Tensor Factorizations With Constraints | Carla Schenker, Xiulin Wang, D. Horner, Morten A. Rasmussen, E. Acar | 2024 | IEEE Journal on Selected Topics in Signal Processing | vol 19 | pages 1461--1476 | doi 10.1109/JSTSP.2025.3579651 | arXiv 2406.12338 | Semantic Scholar ebc317f630f05c9ec42843004bcb7b610e48e2a2 | open access https://arxiv.org/pdf/2406.12338
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, kolda2009tensor

Command: `python3 lookup resolve '10.1137/07070111X'`

```
Crossref: ratio 1.00: Tensor Decompositions and Applications | Tamara G. Kolda, Brett W. Bader | 2009 | SIAM Review | vol 51 | no 3 | pages 455--500 | doi 10.1137/07070111x
OpenAlex: ratio 1.00: Tensor Decompositions and Applications | Tamara G. Kolda, Brett W. Bader | 2009 | SIAM Review | vol 51 | no 3 | pages 455--500 | doi 10.1137/07070111x | OpenAlex W2024165284
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 1, carroll1970analysis

Command: `python3 lookup resolve '10.1007/BF02310791'`

```
Crossref: ratio 1.00: Analysis of Individual Differences in Multidimensional Scaling Via an N-way Generalization of <left double quotation mark>Eckart-Young<right double quotation mark> Decomposition | J. Douglas Carroll, Jih-Jie Chang | 1970 | Psychometrika | vol 35 | no 3 | pages 283--319 | doi 10.1007/bf02310791
OpenAlex: ratio 1.00: Analysis of Individual Differences in Multidimensional Scaling Via an N-way Generalization of <left double quotation mark>Eckart-Young<right double quotation mark> Decomposition | J. Douglas Carroll, Jih-Jie Chang | 1970 | Psychometrika | vol 35 | no 3 | pages 283--319 | doi 10.1007/bf02310791 | OpenAlex W2000215628
Semantic Scholar: ratio 1.00: Analysis of individual differences in multidimensional scaling via an n-way generalization of <left double quotation mark>Eckart-Young<right double quotation mark> decomposition | J. Carroll, Jih-Jie Chang | 1970 | vol 35 | pages 283--319 | doi 10.1007/BF02310791 | Semantic Scholar 757cb62e3d1c0643c9f83bf57d45e427bd76e235
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, cuturi2013sinkhorn

Command: `python3 lookup resolve '1306.0895'`

```
Crossref: not found
OpenAlex: ratio 1.00: Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances | Marco Cuturi | 2013 | arXiv (Cornell University) | doi 10.48550/arxiv.1306.0895 | arXiv 1306.0895 | OpenAlex W1511358834 | open access https://arxiv.org/pdf/1306.0895
Semantic Scholar: ratio 0.89: Sinkhorn Distances: Lightspeed Computation of Optimal Transport | Marco Cuturi | 2013 | Neural Information Processing Systems | pages 2292--2300 | arXiv 1306.0895 | Semantic Scholar 0080118b0eb02af581ff32b85a1bb6aed7081f45
arXiv: ratio 1.00: Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances | Marco Cuturi | 2013 | arXiv 1306.0895
```

Exit status: 0

### theme 2, peyre2019computational

Command: `python3 lookup resolve '10.1561/2200000073'`

```
Crossref: ratio 1.00: Computational Optimal Transport with Applications to Data Sciences | Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2019 | Foundations and Trends<registered sign> in Machine Learning | vol 11 | no 5-6 | pages 355--607 | doi 10.1561/2200000073
OpenAlex: ratio 1.00: Computational Optimal Transport with Applications to Data Sciences | Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2019 | Foundations and Trends<registered sign> in Machine Learning | vol 11 | no 5-6 | pages 355--607 | doi 10.1561/2200000073 | OpenAlex W3039256091
Semantic Scholar: DOI_MISMATCH, ratio 0.64: Computational Optimal Transport | G. Peyr<latin small letter e with acute>, Marco Cuturi | 2018 | Found. Trends Mach. Learn. | vol 11 | pages 355--607 | doi 10.1561/2200000073 | arXiv 1803.00567 | Semantic Scholar 8e51d68250db5637cd6bc1de98a99396441399b2 | open access https://arxiv.org/pdf/1803.00567
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, chizat2018scaling

Command: `python3 lookup resolve '10.1090/mcom/3303'`

```
Crossref: ratio 1.00: Scaling algorithms for unbalanced optimal transport problems | L<latin small letter e with acute>na<latin small letter i with diaeresis>c Chizat, Gabriel Peyr<latin small letter e with acute>, Bernhard Schmitzer, Fran<latin small letter c with cedilla>ois-Xavier Vialard | 2018 | Mathematics of Computation | vol 87 | no 314 | pages 2563--2609 | doi 10.1090/mcom/3303
OpenAlex: ratio 1.00: Scaling algorithms for unbalanced optimal transport problems | L<latin small letter e with acute>na<latin small letter i with diaeresis>c Chizat, Gabriel Peyr<latin small letter e with acute>, Bernhard Schmitzer, Fran<latin small letter c with cedilla>ois<hyphen>Xavier Vialard | 2017 | Mathematics of Computation | vol 87 | no 314 | pages 2563--2609 | doi 10.1090/mcom/3303 | OpenAlex W2724892359 | open access https://www.ams.org/mcom/2018-87-314/S0025-5718-2018-03303-8/S0025-5718-2018-03303-8.pdf
Semantic Scholar: ratio 1.00: Scaling algorithms for unbalanced optimal transport problems | L<latin small letter e with acute>na<latin small letter i with diaeresis>c Chizat, G. Peyr<latin small letter e with acute>, Bernhard Schmitzer, Fran<latin small letter c with cedilla>ois-Xavier Vialard | 2017 | Mathematics of Computation | vol 87 | pages 2563--2609 | doi 10.1090/mcom/3303 | Semantic Scholar 3ecac5a84b7d8d8d15b25ecbd022ae353ad25c40 | open access https://doi.org/10.1090/mcom/3303
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, feydy2019interpolating

Command: `python3 lookup resolve '1810.08278'`

```
Crossref: not found
OpenAlex: ratio 1.00: Interpolating between Optimal Transport and MMD using Sinkhorn Divergences | Jean Feydy, Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois<hyphen>Xavier Vialard, <cyrillic capital letter sha><cyrillic small letter u><cyrillic small letter en>-<cyrillic small letter i><cyrillic small letter che><cyrillic small letter i> <cyrillic capital letter a><cyrillic small letter em><cyrillic small letter a><cyrillic small letter er><cyrillic small letter i>, A. Trouv<latin small letter e with acute>, Gabriel Peyr<latin small letter e with acute> | 2018 | arXiv (Cornell University) | vol 89 | pages 2681--2690 | doi 10.48550/arxiv.1810.08278 | arXiv 1810.08278 | OpenAlex W2897105053 | open access https://arxiv.org/pdf/1810.08278
Semantic Scholar: ratio 1.00: Interpolating between Optimal Transport and MMD using Sinkhorn Divergences | J. Feydy, Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, S. Amari, A. Trouv<latin small letter e with acute>, G. Peyr<latin small letter e with acute> | 2018 | International Conference on Artificial Intelligence and Statistics | pages 2681--2690 | arXiv 1810.08278 | Semantic Scholar dafb021ba04731669e9473477688345ef4962e63
arXiv: ratio 1.00: Interpolating between Optimal Transport and MMD using Sinkhorn Divergences | Jean Feydy, Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, Shun-ichi Amari, Alain Trouv<latin small letter e with acute>, Gabriel Peyr<latin small letter e with acute> | 2018 | arXiv 1810.08278
```

Exit status: 0

### theme 2, eisenberger2022unified

Command: `python3 lookup resolve '10.1109/CVPR52688.2022.00059'`

```
Crossref: ratio 1.00: A Unified Framework for Implicit Sinkhorn Differentiation | Marvin Eisenberger, Aysim Toker, Laura Leal-Taixe, Florian Bernard, Daniel Cremers | 2022 | 2022 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR) | pages 499--508 | doi 10.1109/cvpr52688.2022.00059
OpenAlex: ratio 1.00: A Unified Framework for Implicit Sinkhorn Differentiation | Marvin Eisenberger, Aysim Toker, Laura Leal-Taix<latin small letter e with acute>, Florian Bernard, Daniel Cremers | 2022 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | pages 499--508 | doi 10.1109/cvpr52688.2022.00059 | OpenAlex W4312692019 | open access https://arxiv.org/pdf/2205.06688
Semantic Scholar: ratio 1.00: A Unified Framework for Implicit Sinkhorn Differentiation | Marvin Eisenberger, Aysim Toker, L. Leal-Taix<latin small letter e with acute>, Florian Bernard, D. Cremers | 2022 | Computer Vision and Pattern Recognition | pages 499--508 | doi 10.1109/CVPR52688.2022.00059 | arXiv 2205.06688 | Semantic Scholar c6e1c30fd365f678d49fb541539bd2d412525ea3 | open access https://arxiv.org/pdf/2205.06688
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, memoli2011gromov

Command: `python3 lookup resolve '10.1007/s10208-011-9093-5'`

```
Crossref: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | Facundo M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | vol 11 | no 4 | pages 417--487 | doi 10.1007/s10208-011-9093-5
OpenAlex: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | Facundo M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | vol 11 | no 4 | pages 417--487 | doi 10.1007/s10208-011-9093-5 | OpenAlex W2027842533
Semantic Scholar: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | F. M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | vol 11 | pages 417--487 | doi 10.1007/s10208-011-9093-5 | Semantic Scholar 03a4f1c1975237a5e1e501dd26811b4ce55a35a9
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, vayer2019optimal

Command: `python3 lookup resolve '1805.09114'`

```
Crossref: not found
OpenAlex: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, La<latin small letter e with diaeresis>titia Chapel, R<latin small letter e with acute>mi Flamary, Romain Tavenard, Nicolas Courty | 2018 | HAL | pages 1--16 | doi 10.48550/arxiv.1805.09114 | arXiv 1805.09114 | OpenAlex W2911397097 | open access http://arxiv.org/pdf/1805.09114
Semantic Scholar: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, L. Chapel, R<latin small letter e with acute>mi Flamary, R. Tavenard, N. Courty | 2018 | International Conference on Machine Learning | pages 6275--6284 | arXiv 1805.09114 | Semantic Scholar 6f9de3cd77ac32ce00da3ba6b71e2360b5b2a81c
arXiv: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, Laetitia Chapel, R<latin small letter e with acute>mi Flamary, Romain Tavenard, Nicolas Courty | 2018 | arXiv 1805.09114
```

Exit status: 0

### theme 2, sejourne2021unbalanced

Command: `python3 lookup resolve '2009.04266'`

```
Crossref: not found
OpenAlex: ratio 1.00: The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation | Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois<hyphen>Xavier Vialard, Gabriel Peyr<latin small letter e with acute> | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2009.04266 | arXiv 2009.04266 | OpenAlex W3084165997 | open access https://arxiv.org/pdf/2009.04266
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation | Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, Gabriel Peyr<latin small letter e with acute> | 2020 | arXiv 2009.04266
```

Exit status: 0

### theme 2, scetbon2022linear

Command: `python3 lookup resolve '2106.01128'`

```
Crossref: not found
OpenAlex: ratio 1.00: Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs | Meyer Scetbon, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2106.01128 | arXiv 2106.01128 | OpenAlex W3169502490 | open access https://arxiv.org/pdf/2106.01128
Semantic Scholar: ratio 1.00: Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs | Meyer Scetbon, G. Peyr<latin small letter e with acute>, Marco Cuturi | 2021 | International Conference on Machine Learning | pages 19347--19365 | doi 10.48550/arXiv.2106.01128 | arXiv 2106.01128 | Semantic Scholar f54fd960e51f27f3484546eb84c481c4c055b882 | open access http://arxiv.org/pdf/2106.01128
arXiv: ratio 1.00: Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs | Meyer Scetbon, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2021 | arXiv 2106.01128
```

Exit status: 0

### theme 2, thual2022aligning

Command: `python3 lookup resolve '10.52202/068431-1584'`

```
Crossref: ratio 1.00: Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein | Alexis Thual, Quang Huy Tran, Tatiana Zemskova, Nicolas Courty, R<latin small letter e with acute>mi Flamary, Stanislas Dehaene, Bertrand Thirion | 2022 | Advances in Neural Information Processing Systems 35 | pages 21792--21804 | doi 10.52202/068431-1584
OpenAlex: ratio 1.00: Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein | Alexis Thual, Quang Huy Tran, Tatiana Zemskova, Nicolas Courty, R<latin small letter e with acute>mi Flamary, Stanislas Dehaene, Bertrand Thirion | 2022 | neural information processing systems | pages 21792--21804 | doi 10.52202/068431-1584 | OpenAlex W7133227349
Semantic Scholar: ratio 1.00: Aligning individual brains with fused unbalanced Gromov Wasserstein | Alexis Thual, Quang-Huy Tran, <cyrillic capital letter te>. <cyrillic capital letter pe>. <cyrillic capital letter ze><cyrillic small letter ie><cyrillic small letter em><cyrillic small letter es><cyrillic small letter ka><cyrillic small letter o><cyrillic small letter ve><cyrillic small letter a>, N. Courty, R<latin small letter e with acute>mi Flamary, S. Dehaene, B. Thirion | 2022 | Neural Information Processing Systems | doi 10.52202/068431-1584 | arXiv 2206.09398 | Semantic Scholar d67dcbf457ce55336f5c6c5c4c996ca3fda0d477
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, vincentcuaz2022semirelaxed

Command: `python3 lookup resolve '2110.02753'`

```
Crossref: not found
OpenAlex: ratio 1.00: Semi-relaxed Gromov-Wasserstein divergence with applications on graphs | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli, Titouan Vayer, Nicolas Courty | 2021 | arXiv (Cornell University) | pages 1--28 | doi 10.48550/arxiv.2110.02753 | arXiv 2110.02753 | OpenAlex W4286905149 | open access https://arxiv.org/pdf/2110.02753
Semantic Scholar: ratio 0.99: Semi-relaxed Gromov Wasserstein divergence with applications on graphs | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, M. Corneli, Titouan Vayer, N. Courty | 2021 | arXiv.org | vol abs/2110.02753 | doi 10.48550/arXiv.2110.02753 | arXiv 2110.02753 | Semantic Scholar d5c23d2340fe14ef0cddf9a13a8312bac80dd0fa | open access http://arxiv.org/pdf/2110.02753
arXiv: ratio 1.00: Semi-relaxed Gromov-Wasserstein divergence with applications on graphs | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli, Titouan Vayer, Nicolas Courty | 2021 | arXiv 2110.02753
```

Exit status: 0

### theme 2, agueh2011barycenters

Command: `python3 lookup resolve '10.1137/100805741'`

```
Crossref: ratio 1.00: Barycenters in the Wasserstein Space | Martial Agueh, Guillaume Carlier | 2011 | SIAM Journal on Mathematical Analysis | vol 43 | no 2 | pages 904--924 | doi 10.1137/100805741
OpenAlex: ratio 1.00: Barycenters in the Wasserstein Space | Martial Agueh, Guillaume Carlier | 2011 | SIAM Journal on Mathematical Analysis | vol 43 | no 2 | pages 904--924 | doi 10.1137/100805741 | OpenAlex W1968333723 | open access https://hal.archives-ouvertes.fr/hal-00637399/document
Semantic Scholar: ratio 1.00: Barycenters in the Wasserstein Space | M. Agueh, G. Carlier | 2011 | SIAM Journal on Mathematical Analysis | vol 43 | pages 904--924 | doi 10.1137/100805741 | Semantic Scholar 751ee5e11cb826a315d8737f6a5f34423d95fae9 | open access https://hal.archives-ouvertes.fr/hal-00637399/document
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, cuturi2014fast

Command: `python3 lookup resolve '1310.4375'`

```
Crossref: not found
OpenAlex: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, Arnaud Doucet | 2013 | Oxford University Research Archive (ORA) (University of Oxford) | pages 685--693 | doi 10.48550/arxiv.1310.4375 | arXiv 1310.4375 | OpenAlex W1629559917 | open access https://ora.ox.ac.uk/objects/uuid:176f66e9-3fef-4847-b638-ace71b630ec5/files/mc3fe93fd63587cb3242319d64cbb87a5
Semantic Scholar: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, A. Doucet | 2013 | International Conference on Machine Learning | pages 685--693 | arXiv 1310.4375 | Semantic Scholar c697fd0b73ec7aaeb2e75cb89cf4b8b020dd9556
arXiv: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, Arnaud Doucet | 2013 | arXiv 1310.4375
```

Exit status: 0

### theme 2, benamou2015iterative

Command: `python3 lookup resolve '10.1137/141000439'`

```
Crossref: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | Jean-David Benamou, Guillaume Carlier, Marco Cuturi, Luca Nenna, Gabriel Peyr<latin small letter e with acute> | 2015 | SIAM Journal on Scientific Computing | vol 37 | no 2 | pages A1111--A1138 | doi 10.1137/141000439
OpenAlex: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | Jean<hyphen>David Benamou, Guillaume Carlier, Marco Cuturi, Luca Nenna, Gabriel Peyr<latin small letter e with acute> | 2015 | SIAM Journal on Scientific Computing | vol 37 | no 2 | pages A1111--A1138 | doi 10.1137/141000439 | OpenAlex W2036996178 | open access https://arxiv.org/pdf/1412.5154
Semantic Scholar: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | J. Benamou, G. Carlier, Marco Cuturi, Luca Nenna, G. Peyr<latin small letter e with acute> | 2014 | SIAM Journal on Scientific Computing | vol 37 | doi 10.1137/141000439 | arXiv 1412.5154 | Semantic Scholar d3831561301ef27a6ba0d3c68d30bdf0f27eef63 | open access https://arxiv.org/pdf/1412.5154
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, peyre2016gromov

Command: `python3 lookup resolve 'https://proceedings.mlr.press/v48/peyre16.html'`

```
Crossref: not found
OpenAlex: not found
Semantic Scholar: not found
arXiv: not found
```

Exit status: 0

### theme 2, brogatmotte2022learning

Command: `python3 lookup resolve '2202.03813'`

```
Crossref: not found
OpenAlex: ratio 1.00: Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters | Luc Brogat-Motte, R<latin small letter e with acute>mi Flamary, C<latin small letter e with acute>line Brouard, Juho Rousu, Florence d<right single quotation mark>Alch<latin small letter e with acute><en dash>Buc | 2022 | arXiv (Cornell University) | vol 162 | doi 10.48550/arxiv.2202.03813 | arXiv 2202.03813 | OpenAlex W4221153250 | open access https://arxiv.org/pdf/2202.03813
Semantic Scholar: ratio 1.00: Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters | Luc Brogat-Motte, R<latin small letter e with acute>mi Flamary, C<latin small letter e with acute>line Brouard, Juho Rousu, Florence d'Alch<latin small letter e with acute>-Buc | 2022 | International Conference on Machine Learning | vol abs/2202.03813 | doi 10.48550/arXiv.2202.03813 | arXiv 2202.03813 | Semantic Scholar 1a9e5a6a4da5f882ef04f8bb936701220a642ec0 | open access https://arxiv.org/pdf/2202.03813
arXiv: ratio 1.00: Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters | Luc Brogat-Motte, R<latin small letter e with acute>mi Flamary, C<latin small letter e with acute>line Brouard, Juho Rousu, Florence d'Alch<latin small letter e with acute>-Buc | 2022 | arXiv 2202.03813
```

Exit status: 0

### theme 2, rolet2016fast

Command: `python3 lookup resolve 'https://proceedings.mlr.press/v51/rolet16.html'`

```
Crossref: not found
OpenAlex: not found
Semantic Scholar: not found
arXiv: not found
```

Exit status: 0

### theme 2, schmitz2018wasserstein

Command: `python3 lookup resolve '10.1137/17M1140431'`

```
Crossref: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning | Morgan A. Schmitz, Matthieu Heitz, Nicolas Bonneel, Fred Ngol<latin small letter e with grave>, David Coeurjolly, Marco Cuturi, Gabriel Peyr<latin small letter e with acute>, Jean-Luc Starck | 2018 | SIAM Journal on Imaging Sciences | vol 11 | no 1 | pages 643--678 | doi 10.1137/17m1140431
OpenAlex: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning | Morgan A. Schmitz, Matthieu Heitz, Nicolas Bonneel, Fred Ngol<latin small letter e with grave> Mboula, David C<latin small ligature oe>urjolly, Marco Cuturi, Gabriel Peyr<latin small letter e with acute>, Jean<hyphen>Luc Starck | 2018 | SIAM Journal on Imaging Sciences | vol 11 | no 1 | pages 643--678 | doi 10.1137/17m1140431 | OpenAlex W2744110160 | open access https://arxiv.org/pdf/1708.01955
Semantic Scholar: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-based unsupervised non-linear dictionary learning | M. Schmitz, Matthieu Heitz, Nicolas Bonneel, Fred Ngol<latin small letter e with grave> Mboula, D. Coeurjolly, Marco Cuturi, G. Peyr<latin small letter e with acute>, Jean-Luc Starck | 2017 | SIAM Journal of Imaging Sciences | vol 11 | pages 643--678 | doi 10.1137/17M1140431 | arXiv 1708.01955 | Semantic Scholar fd3d9ad8cecbb201a1ca82338681c92ca6174839 | open access https://arxiv.org/pdf/1708.01955
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, xu2020gromov

Command: `python3 lookup resolve '10.1609/aaai.v34i04.6120'`

```
Crossref: ratio 1.00: Gromov-Wasserstein Factorization Models for Graph Clustering | Hongtengl Xu | 2020 | Proceedings of the AAAI Conference on Artificial Intelligence | vol 34 | no 04 | pages 6478--6485 | doi 10.1609/aaai.v34i04.6120
OpenAlex: ratio 1.00: Gromov-Wasserstein Factorization Models for Graph Clustering | Hongtengl Xu | 2020 | Proceedings of the AAAI Conference on Artificial Intelligence | vol 34 | no 04 | pages 6478--6485 | doi 10.1609/aaai.v34i04.6120 | OpenAlex W2996858319 | open access https://doi.org/10.1609/aaai.v34i04.6120
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, vincentcuaz2021online

Command: `python3 lookup resolve '2102.06555'`

```
Crossref: not found
OpenAlex: ratio 1.00: Online Graph Dictionary Learning | C<latin small letter e with acute>dric Vincent-Cuaz, Titouan Vayer, R<latin small letter e with acute>mi Flamary, Marco Corneli, Nicolas Courty | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2102.06555 | arXiv 2102.06555 | OpenAlex W3131640093 | open access https://arxiv.org/pdf/2102.06555
Semantic Scholar: ratio 1.00: Online Graph Dictionary Learning | C<latin small letter e with acute>dric Vincent-Cuaz, Titouan Vayer, R<latin small letter e with acute>mi Flamary, M. Corneli, N. Courty | 2021 | International Conference on Machine Learning | vol abs/2102.06555 | doi 10.48550/arXiv.2102.06555 | arXiv 2102.06555 | Semantic Scholar 9e9017a874024e3f7d8ff5a3aff171afb52beccc
arXiv: ratio 1.00: Online Graph Dictionary Learning | C<latin small letter e with acute>dric Vincent-Cuaz, Titouan Vayer, R<latin small letter e with acute>mi Flamary, Marco Corneli, Nicolas Courty | 2021 | arXiv 2102.06555
```

Exit status: 0

### theme 2, vincentcuaz2022template

Command: `python3 lookup resolve '10.52202/068431-0857'`

```
Crossref: ratio 1.00: Template Based Graph Neural Network with Optimal Transport Distances | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli, Titouan Vayer, Nicolas Courty | 2022 | Advances in Neural Information Processing Systems 35 | pages 11800--11814 | doi 10.52202/068431-0857
OpenAlex: ratio 1.00: Template Based Graph Neural Network with Optimal Transport Distances | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli, Titouan Vayer, Nicolas Courty | 2022 | neural information processing systems | pages 11800--11814 | doi 10.52202/068431-0857 | OpenAlex W7133234998
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, zhang2024wasserstein

Command: `python3 lookup resolve '10.1109/TPAMI.2024.3409772'`

```
Crossref: ratio 1.00: Wasserstein Discriminant Dictionary Learning for Graph Representation | Tong Zhang, Guangbu Liu, Zhen Cui, Wei Liu, Wenming Zheng, Jian Yang | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 46 | no 12 | pages 8619--8635 | doi 10.1109/tpami.2024.3409772
OpenAlex: ratio 1.00: Wasserstein Discriminant Dictionary Learning for Graph Representation | Tong Zhang, Guangbu Liu, Zhen Cui, Wei Liu, Wenming Zheng, Jian Jun Yang | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 46 | no 12 | pages 8619--8635 | doi 10.1109/tpami.2024.3409772 | OpenAlex W4399373692
Semantic Scholar: ratio 1.00: Wasserstein Discriminant Dictionary Learning for Graph Representation | Tong Zhang, Guangbu Liu, Zhen Cui, Wei Liu, Wen-Ming Zheng, Jian Yang | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 46 | pages 8619--8635 | doi 10.1109/TPAMI.2024.3409772 | Semantic Scholar 9ce07ee913a43b79c2b8d8edfff420869ac4b203
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, mazelet2026learning

Command: `python3 lookup resolve '2605.20883'`

```
Crossref: not found
OpenAlex: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2605.20883 | arXiv 2605.20883 | OpenAlex W7161973664 | open access https://arxiv.org/pdf/2605.20883
Semantic Scholar: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv.org | vol abs/2605.20883 | doi 10.48550/arXiv.2605.20883 | arXiv 2605.20883 | Semantic Scholar 932daed15a6e652d64deee16cde7602386c7e063
arXiv: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv 2605.20883
```

Exit status: 0

### theme 2, huang2016supervised

Command: `python3 lookup resolve 'https://proceedings.neurips.cc/paper_files/paper/2016/hash/10c66082c124f8afe3df4886f5e516e0-Abstract.html'`

```
Crossref: not found
OpenAlex: not found
Semantic Scholar: not found
arXiv: not found
```

Exit status: 0

### theme 2, kolouri2016sliced

Command: `python3 lookup resolve '10.1109/CVPR.2016.568'`

```
Crossref: ratio 1.00: Sliced Wasserstein Kernels for Probability Distributions | Soheil Kolouri, Yang Zou, Gustavo K. Rohde | 2016 | 2016 IEEE Conference on Computer Vision and Pattern Recognition (CVPR) | pages 5258--5267 | doi 10.1109/cvpr.2016.568
OpenAlex: ratio 1.00: Sliced Wasserstein Kernels for Probability Distributions | Soheil Kolouri, Yang Zou, Gustavo Kunde Rohde | 2016 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | pages 5258--5267 | doi 10.1109/cvpr.2016.568 | OpenAlex W2226906430 | open access https://arxiv.org/pdf/1511.03198
Semantic Scholar: ratio 1.00: Sliced Wasserstein Kernels for Probability Distributions | Soheil Kolouri, Yang Zou, G. Rohde | 2015 | Computer Vision and Pattern Recognition | pages 5258--5267 | doi 10.1109/CVPR.2016.568 | arXiv 1511.03198 | Semantic Scholar bb12329fb5beaed74fa6c9c201ee2c8b7ba3c885 | open access https://arxiv.org/pdf/1511.03198
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, wang2013linear

Command: `python3 lookup resolve '10.1007/s11263-012-0566-z'`

```
Crossref: ratio 1.00: A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images | Wei Wang, Dejan Slep<latin small letter c with caron>ev, Saurav Basu, John A. Ozolek, Gustavo K. Rohde | 2012 | International Journal of Computer Vision | vol 101 | no 2 | pages 254--269 | doi 10.1007/s11263-012-0566-z
OpenAlex: ratio 1.00: A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images | Wei Wang, Dejan Slep<latin small letter c with caron>ev, Saurav Basu, John A. Ozolek, Gustavo Kunde Rohde | 2012 | International Journal of Computer Vision | vol 101 | no 2 | pages 254--269 | doi 10.1007/s11263-012-0566-z | OpenAlex W2094100343 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC3667970/
Semantic Scholar: ratio 1.00: A linear optimal transportation framework for quantifying and visualizing variations in sets of images | Wei Wang, D. Slep<latin small letter c with caron>ev, Saurav Basu, J. Ozolek, G. Rohde | 2012 | International Journal of Computer Vision | vol 101 | pages 254--269 | doi 10.1007/s11263-012-0566-z | Semantic Scholar 3b1f93716ef525f2b47dcc2faec8292a686e1086 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC3667970/
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, moosmuller2023linear

Command: `python3 lookup resolve '10.1093/imaiai/iaac023'`

```
Crossref: ratio 1.00: Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations | Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2022 | Information and Inference: A Journal of the IMA | vol 12 | no 1 | pages 363--389 | doi 10.1093/imaiai/iaac023
OpenAlex: ratio 1.00: Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations | Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2022 | Information and Inference A Journal of the IMA | vol 12 | no 1 | pages 363--389 | doi 10.1093/imaiai/iaac023 | OpenAlex W3165102544 | open access https://arxiv.org/pdf/2008.09165
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 2, togninalli2019wasserstein

Command: `python3 lookup resolve '1906.01277'`

```
Crossref: not found
OpenAlex: ratio 1.00: Wasserstein Weisfeiler-Lehman Graph Kernels | Matteo Togninalli, Elisabetta Ghisu, Felipe Llinares-L<latin small letter o with acute>pez, Bastian Rieck, Karsten Michael Borgwardt | 2019 | arXiv (Cornell University) | vol 32 | pages 6439--6449 | doi 10.3929/ethz-b-000420933 | OpenAlex W2970823238 | open access https://arxiv.org/pdf/1906.01277
Semantic Scholar: ratio 1.00: Wasserstein Weisfeiler-Lehman Graph Kernels | Matteo Togninalli, M. Ghisu, F. Llinares-L<latin small letter o with acute>pez, Bastian Alexander Rieck, Karsten M. Borgwardt | 2019 | Neural Information Processing Systems | pages 6436--6446 | doi 10.48550/arXiv.1906.01277 | arXiv 1906.01277 | Semantic Scholar 081a05b34be9d604f85ca4e5582daa753370b960
arXiv: ratio 1.00: Wasserstein Weisfeiler-Lehman Graph Kernels | Matteo Togninalli, Elisabetta Ghisu, Felipe Llinares-L<latin small letter o with acute>pez, Bastian Rieck, Karsten Borgwardt | 2019 | arXiv 1906.01277
```

Exit status: 0

### theme 2, mialon2021trainable

Command: `python3 lookup resolve '2006.12065'`

```
Crossref: not found
OpenAlex: ratio 1.00: A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, Dexiong Chen, Alexandre d<right single quotation mark>Aspremont, Julien Mairal | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.12065 | arXiv 2006.12065 | OpenAlex W3127760629 | open access https://arxiv.org/pdf/2006.12065
Semantic Scholar: ratio 0.89: An Optimal Transport Kernel for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, De-Xiong Chen, A. d'Aspremont, Julien Mairal | 2020 | arXiv.org | vol abs/2006.12065 | doi 10.48550/arXiv.2006.12065 | arXiv 2006.12065 | Semantic Scholar 74bc260a893479cdada738017037c7bde4283d45 | open access http://arxiv.org/pdf/2006.12065
arXiv: ratio 1.00: A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, Dexiong Chen, Alexandre d'Aspremont, Julien Mairal | 2020 | arXiv 2006.12065
```

Exit status: 0

### theme 2, kolouri2021wasserstein

Command: `python3 lookup resolve '2006.09430'`

```
Crossref: not found
OpenAlex: ratio 1.00: Wasserstein Embedding for Graph Learning | Soheil Kolouri, Navid Naderializadeh, Gustavo Kunde Rohde, Hoffmann, Heiko | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.09430 | arXiv 2006.09430 | OpenAlex W3036694079 | open access https://arxiv.org/pdf/2006.09430
Semantic Scholar: ratio 1.00: Wasserstein Embedding for Graph Learning | Soheil Kolouri, Navid Naderializadeh, G. Rohde, Heiko Hoffmann | 2020 | International Conference on Learning Representations | vol abs/2006.09430 | doi 10.48550/arXiv.2006.09430 | arXiv 2006.09430 | Semantic Scholar b00e92cf883050461f545f3f3e4cf376c07bb1a2
arXiv: ratio 1.00: Wasserstein Embedding for Graph Learning | Soheil Kolouri, Navid Naderializadeh, Gustavo K. Rohde, Heiko Hoffmann | 2020 | arXiv 2006.09430
```

Exit status: 0

### theme 2, chen2020optimal

Command: `python3 lookup resolve '2006.04804'`

```
Crossref: not found
OpenAlex: ratio 1.00: Optimal Transport Graph Neural Networks | Benson Chen, Gary B<latin small letter e with acute>cigneul, Octavian-Eugen Ganea, Regina Barzilay, Tommi Jaakkola | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.04804 | arXiv 2006.04804 | OpenAlex W3034902920 | open access https://arxiv.org/pdf/2006.04804
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Optimal Transport Graph Neural Networks | Benson Chen, Gary B<latin small letter e with acute>cigneul, Octavian-Eugen Ganea, Regina Barzilay, Tommi Jaakkola | 2020 | arXiv 2006.04804
```

Exit status: 0

### theme 2, meunier2022distribution

Command: `python3 lookup resolve '2202.03926'`

```
Crossref: not found
OpenAlex: ratio 1.00: Distribution Regression with Sliced Wasserstein Kernels | Dimitri Meunier, Massimiliano Pontil, Carlo Ciliberto | 2022 | arXiv (Cornell University) | doi 10.48550/arxiv.2202.03926 | arXiv 2202.03926 | OpenAlex W4221146393 | open access https://arxiv.org/pdf/2202.03926
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Distribution Regression with Sliced Wasserstein Kernels | Dimitri Meunier, Massimiliano Pontil, Carlo Ciliberto | 2022 | arXiv 2202.03926
```

Exit status: 0

### theme 2, mahan2024point

Command: `python3 lookup resolve '2401.01460'`

```
Crossref: not found
OpenAlex: ratio 1.00: Point Cloud Classification via Deep Set Linearized Optimal Transport | Scott P. Mahan, Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2024 | arXiv (Cornell University) | doi 10.48550/arxiv.2401.01460 | arXiv 2401.01460 | OpenAlex W4390601194 | open access https://arxiv.org/pdf/2401.01460
Semantic Scholar: ratio 1.00: Point Cloud Classification via Deep Set Linearized Optimal Transport | Scott Mahan, Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2024 | arXiv.org | vol abs/2401.01460 | doi 10.48550/arXiv.2401.01460 | arXiv 2401.01460 | Semantic Scholar cd9333c9ca648d0c10dfa02982268ebef06fa4f1
arXiv: ratio 1.00: Point Cloud Classification via Deep Set Linearized Optimal Transport | Scott Mahan, Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2024 | arXiv 2401.01460
```

Exit status: 0

### theme 2, wang2025linearized

Command: `python3 lookup resolve '2510.22033'`

```
Crossref: not found
OpenAlex: ratio 1.00: Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | Wang, Tianxiang, Ke, Yingtong, Dhananjay Bhaskar, Krishnaswamy, Smita, Alexander Cloninger | 2025 | arXiv (Cornell University) | doi 10.48550/arxiv.2510.22033 | arXiv 2510.22033 | OpenAlex W7101579638 | open access https://arxiv.org/pdf/2510.22033
Semantic Scholar: ratio 1.00: Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | Tian-Xiang Wang, Yingtong Ke, Dhananjay Bhaskar, Smita Krishnaswamy, Alexander Cloninger | 2025 | arXiv.org | vol abs/2510.22033 | doi 10.48550/arXiv.2510.22033 | arXiv 2510.22033 | Semantic Scholar e0e8e29e4579991ec2c07a8baf7624de32135e77
arXiv: ratio 1.00: Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | Tianxiang Wang, Yingtong Ke, Dhananjay Bhaskar, Smita Krishnaswamy, Alexander Cloninger | 2025 | arXiv 2510.22033
```

Exit status: 0

### theme 2, bachoc2023gaussian

Command: `python3 lookup resolve '2210.06574'`

```
Crossref: not found
OpenAlex: ratio 1.00: Gaussian Processes on Distributions based on Regularized Optimal Transport | Fran<latin small letter c with cedilla>ois Bachoc, Louis B<latin small letter e with acute>thune, Alberto Gonz<latin small letter a with acute>lez-Sanz, Jean<en dash>Michel Loubes | 2022 | HAL | doi 10.48550/arxiv.2210.06574 | arXiv 2210.06574 | OpenAlex W4306294982 | open access http://arxiv.org/pdf/2210.06574
Semantic Scholar: ratio 1.00: Gaussian Processes on Distributions based on Regularized Optimal Transport | F. Bachoc, Louis B<latin small letter e with acute>thune, Alberto Gonz<latin small letter a with acute>lez-Sanz, Jean-Michel Loubes | 2022 | International Conference on Artificial Intelligence and Statistics | pages 4986--5010 | doi 10.48550/arXiv.2210.06574 | arXiv 2210.06574 | Semantic Scholar bf8530bfcb8a3d0aae7b8ec92e6df38c0d8a776a | open access http://arxiv.org/pdf/2210.06574
arXiv: ratio 1.00: Gaussian Processes on Distributions based on Regularized Optimal Transport | Fran<latin small letter c with cedilla>ois Bachoc, Louis B<latin small letter e with acute>thune, Alberto Gonzalez-Sanz, Jean-Michel Loubes | 2022 | arXiv 2210.06574
```

Exit status: 0

### theme 3, zaheer2017deepsets

Command: `python3 lookup resolve '1703.06114'`

```
Crossref: not found
OpenAlex: ratio 1.00: Deep Sets | Manzil Zaheer, Satwik Kottur, Siamak Ravanbakhsh, Barnab<latin small letter a with acute>s P<latin small letter o with acute>czos, Ruslan Salakhutdinov, Alexander Johannes Smola | 2017 | arXiv (Cornell University) | doi 10.48550/arxiv.1703.06114 | arXiv 1703.06114 | OpenAlex W4299457904 | open access https://arxiv.org/pdf/1703.06114
Semantic Scholar: ratio 1.00: Deep Sets | M. Zaheer, S. Kottur, Siamak Ravanbakhsh, B. P<latin small letter o with acute>czos, R. Salakhutdinov, Alex Smola | 2017 | arXiv 1703.06114 | Semantic Scholar de4edcddc028b0088f7ee44ae6e4be261f20b6f6
arXiv: ratio 1.00: Deep Sets | Manzil Zaheer, Satwik Kottur, Siamak Ravanbakhsh, Barnabas Poczos, Ruslan Salakhutdinov, Alexander Smola | 2017 | arXiv 1703.06114
```

Exit status: 0

### theme 3, murphy2019janossy

Command: `python3 lookup resolve '1811.01900'`

```
Crossref: not found
OpenAlex: ratio 1.00: Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs | Ryan L. Murphy, Balasubramaniam Srinivasan, Vinayak Rao, Bruno Ribeiro | 2018 | arXiv (Cornell University) | doi 10.48550/arxiv.1811.01900 | arXiv 1811.01900 | OpenAlex W2899038170 | open access https://arxiv.org/pdf/1811.01900
Semantic Scholar: ratio 1.00: Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs | R. Murphy, Balasubramaniam Srinivasan, Vinayak A. Rao, Bruno Ribeiro | 2018 | International Conference on Learning Representations | vol abs/1811.01900 | doi 10.48550/arXiv.1811.01900 | arXiv 1811.01900 | Semantic Scholar de9550945b2f631c541c299114a770c4f47f9616 | open access http://arxiv.org/pdf/1811.01900
arXiv: ratio 1.00: Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs | Ryan L. Murphy, Balasubramaniam Srinivasan, Vinayak Rao, Bruno Ribeiro | 2018 | arXiv 1811.01900
```

Exit status: 0

### theme 3, wagstaff2019limitations

Command: `python3 lookup resolve '1901.09006'`

```
Crossref: not found
OpenAlex: ratio 1.00: On the Limitations of Representing Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Ingmar Posner, Michael A. Osborne | 2019 | Oxford University Research Archive (ORA) (University of Oxford) | pages 6487--6494 | doi 10.48550/arxiv.1901.09006 | arXiv 1901.09006 | OpenAlex W2913668534 | open access https://ora.ox.ac.uk/objects/uuid:3d5730ad-0070-46e9-b173-5b139d122dba/files/mdb1a40b64d60b73dfda93fbcd08485f1
Semantic Scholar: ratio 1.00: On the Limitations of Representing Functions on Sets | Edward Wagstaff, F. Fuchs, Martin Engelcke, I. Posner, Michael A. Osborne | 2019 | International Conference on Machine Learning | pages 6487--6494 | doi 10.48550/arXiv.1901.09006 | arXiv 1901.09006 | Semantic Scholar bc6f7ba757b437842564cd028881a509c225ce26
arXiv: ratio 1.00: On the Limitations of Representing Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Ingmar Posner, Michael Osborne | 2019 | arXiv 1901.09006
```

Exit status: 0

### theme 3, wagstaff2022universal

Command: `python3 lookup resolve '2107.01959'`

```
Crossref: not found
OpenAlex: ratio 1.00: Universal Approximation of Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Michael A. Osborne, Ingmar Posner | 2021 | Oxford University Research Archive (ORA) (University of Oxford) | doi 10.48550/arxiv.2107.01959 | arXiv 2107.01959 | OpenAlex W3182587796 | open access https://ora.ox.ac.uk/objects/uuid:aad96d93-d8a9-4ac4-92a3-cd7bc3e3da96/files/rm326m2506
Semantic Scholar: ratio 1.00: Universal Approximation of Functions on Sets | Edward Wagstaff, F. Fuchs, Martin Engelcke, Michael A. Osborne, I. Posner | 2021 | Journal of machine learning research | vol abs/2107.01959 | doi 10.48550/arXiv.2107.01959 | arXiv 2107.01959 | Semantic Scholar c7c625fc31168b64ed3191f916e446e08baaf9d2 | open access http://arxiv.org/pdf/2107.01959
arXiv: ratio 1.00: Universal Approximation of Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Michael A. Osborne, Ingmar Posner | 2021 | arXiv 2107.01959
```

Exit status: 0

### theme 3, zhang2020fspool

Command: `python3 lookup resolve '1906.02795'`

```
Crossref: not found
OpenAlex: ratio 1.00: FSPool: Learning Set Representations with Featurewise Sort Pooling | Yan Zhang, Jonathon S. Hare, Adam Pr<latin small letter u with diaeresis>gel<hyphen>Bennett | 2019 | arXiv (Cornell University) | doi 10.48550/arxiv.1906.02795 | arXiv 1906.02795 | OpenAlex W2994687091 | open access https://arxiv.org/pdf/1906.02795
Semantic Scholar: ratio 1.00: FSPool: Learning Set Representations with Featurewise Sort Pooling | Yan Zhang, Jonathon S. Hare, A. Pr<latin small letter u with diaeresis>gel-Bennett | 2019 | International Conference on Learning Representations | vol abs/1906.02795 | doi 10.48550/arXiv.1906.02795 | arXiv 1906.02795 | Semantic Scholar 07d01345dd30f1400e41d5124ff74e2b0d655040
arXiv: ratio 1.00: FSPool: Learning Set Representations with Featurewise Sort Pooling | Yan Zhang, Jonathon Hare, Adam Pr<latin small letter u with diaeresis>gel-Bennett | 2019 | arXiv 1906.02795
```

Exit status: 0

### theme 3, wang2024polynomial

Command: `python3 lookup resolve '2307.04001'`

```
Crossref: not found
OpenAlex: ratio 1.00: Polynomial Width is Sufficient for Set Representation with High-dimensional Features | Peihao Wang, Shenghao Yang, Shu Li, Zhangyang Wang, Li, Pan | 2023 | arXiv (Cornell University) | doi 10.48550/arxiv.2307.04001 | arXiv 2307.04001 | OpenAlex W4383987642 | open access https://arxiv.org/pdf/2307.04001
Semantic Scholar: ratio 1.00: Polynomial Width is Sufficient for Set Representation with High-dimensional Features | Pei-Hao Wang, Sheng-Hao Yang, Shu Li, Zhang-Yang Wang, Pan Li | 2023 | International Conference on Learning Representations | vol abs/2307.04001 | doi 10.48550/arXiv.2307.04001 | arXiv 2307.04001 | Semantic Scholar 2d401d97bec4b6871fa4bcfef385107b5e27bb30 | open access https://arxiv.org/pdf/2307.04001
arXiv: ratio 1.00: Polynomial Width is Sufficient for Set Representation with High-dimensional Features | Peihao Wang, Shenghao Yang, Shu Li, Zhangyang Wang, Pan Li | 2023 | arXiv 2307.04001
```

Exit status: 0

### theme 3, vinyals2016order

Command: `python3 lookup resolve '1511.06391'`

```
Crossref: not found
OpenAlex: ratio 1.00: Order Matters: Sequence to sequence for sets | Oriol Vinyals, Samy Bengio, Manjunath Kudlur | 2015 | arXiv (Cornell University) | doi 10.48550/arxiv.1511.06391 | arXiv 1511.06391 | OpenAlex W2173183968 | open access https://arxiv.org/pdf/1511.06391
Semantic Scholar: ratio 1.00: Order Matters: Sequence to sequence for sets | O. Vinyals, Samy Bengio, M. Kudlur | 2015 | International Conference on Learning Representations | doi 10.48550/arXiv.1511.06391 | arXiv 1511.06391 | Semantic Scholar d01379ebb53c66a4ccf5f4959d904dcf9e161e41
arXiv: ratio 1.00: Order Matters: Sequence to sequence for sets | Oriol Vinyals, Samy Bengio, Manjunath Kudlur | 2015 | arXiv 1511.06391
```

Exit status: 0

### theme 3, lee2019settransformer

Command: `python3 lookup resolve '1810.00825'`

```
Crossref: not found
OpenAlex: ratio 1.00: Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks | Juho Lee, Yoonho Lee, Jungtaek Kim, Adam R. Kosiorek, Seungjin Choi, Yee Whye Teh | 2018 | Oxford University Research Archive (ORA) (University of Oxford) | doi 10.48550/arxiv.1810.00825 | arXiv 1810.00825 | OpenAlex W2894384847 | open access https://ora.ox.ac.uk/objects/uuid:8aa5f831-66b2-46ca-89ea-7b2384064db3/files/s8k71nh51g
Semantic Scholar: DOI_MISMATCH, ratio 0.31: Set Transformer | Juho Lee, Yoonho Lee, Jungtaek Kim, Adam R. Kosiorek, Seung-Jin Choi, Y. Teh | 2018 | International Conference on Machine Learning | vol abs/1810.00825 | doi 10.48550/arXiv.1810.00825 | arXiv 1810.00825 | Semantic Scholar 512b8ef0002e0bfd0ecb5ab17d533c1762eb9786
arXiv: ratio 1.00: Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks | Juho Lee, Yoonho Lee, Jungtaek Kim, Adam R. Kosiorek, Seungjin Choi, Yee Whye Teh | 2018 | arXiv 1810.00825
```

Exit status: 0

### theme 3, kim2021transformers

Command: `python3 lookup resolve '2110.14416'`

```
Crossref: not found
OpenAlex: ratio 1.00: Transformers Generalize DeepSets and Can be Extended to Graphs and Hypergraphs | Jinwoo Kim, Saeyoon Oh, Seunghoon Hong | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2110.14416 | arXiv 2110.14416 | OpenAlex W3210022402 | open access https://arxiv.org/pdf/2110.14416
Semantic Scholar: ratio 1.00: Transformers Generalize DeepSets and Can be Extended to Graphs and Hypergraphs | Jinwoo Kim, Saeyoon Oh, Seunghoon Hong | 2021 | Neural Information Processing Systems | vol abs/2110.14416 | doi 10.48550/arXiv.2110.14416 | arXiv 2110.14416 | Semantic Scholar a585828fab3ec46ad27e14adfd299953df107a47 | open access http://arxiv.org/pdf/2110.14416
arXiv: ratio 1.00: Transformers Generalize DeepSets and Can be Extended to Graphs and Hypergraphs | Jinwoo Kim, Saeyoon Oh, Seunghoon Hong | 2021 | arXiv 2110.14416
```

Exit status: 0

### theme 3, qi2017pointnet

Command: `python3 lookup resolve '10.1109/CVPR.2017.16'`

```
Crossref: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | R. Qi Charles, Hao Su, Mo Kaichun, Leonidas J. Guibas | 2017 | 2017 IEEE Conference on Computer Vision and Pattern Recognition (CVPR) | pages 77--85 | doi 10.1109/cvpr.2017.16
OpenAlex: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | Raffaelli Charles, Hao Su, Kaichun Mo, Leonidas J. Guibas | 2017 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | pages 77--85 | doi 10.1109/cvpr.2017.16 | OpenAlex W2560609797
Semantic Scholar: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | R. Q. Charles, Hao Su, K. Mo, L. Guibas | 2016 | Computer Vision and Pattern Recognition | pages 77--85 | doi 10.1109/CVPR.2017.16 | arXiv 1612.00593 | Semantic Scholar d997beefc0922d97202789d2ac307c55c2c52fba
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 3, qi2017pointnetpp

Command: `python3 lookup resolve '1706.02413'`

```
Crossref: not found
OpenAlex: ratio 1.00: PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space | Charles R. Qi, Li Yi, Hao Su, Leonidas J. Guibas | 2017 | arXiv (Cornell University) | doi 10.48550/arxiv.1706.02413 | arXiv 1706.02413 | OpenAlex W2624503621 | open access https://arxiv.org/pdf/1706.02413
Semantic Scholar: ratio 1.00: PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space | C. Qi, L. Yi, Hao Su, L. Guibas | 2017 | Neural Information Processing Systems | pages 5099--5108 | doi 10.48550/arXiv.1706.02413 | arXiv 1706.02413 | Semantic Scholar 8674494bd7a076286b905912d26d47f7501c4046
arXiv: ratio 1.00: PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space | Charles R. Qi, Li Yi, Hao Su, Leonidas J. Guibas | 2017 | arXiv 1706.02413
```

Exit status: 0

### theme 3, wang2019dgcnn

Command: `python3 lookup resolve '10.1145/3326362'`

```
Crossref: ratio 1.00: Dynamic Graph CNN for Learning on Point Clouds | Yue Wang, Yongbin Sun, Ziwei Liu, Sanjay E. Sarma, Michael M. Bronstein, Justin M. Solomon | 2019 | ACM Transactions on Graphics | vol 38 | no 5 | pages 1--12 | doi 10.1145/3326362
OpenAlex: ratio 1.00: Dynamic Graph CNN for Learning on Point Clouds | Yue Wang, Yongbin Sun, Ziwei Liu, Sanjay Emani Sarma, Michael M. Bronstein, Justin Solomon | 2019 | ACM Transactions on Graphics | vol 38 | no 5 | pages 1--12 | doi 10.1145/3326362 | OpenAlex W2979750740 | open access https://dl.acm.org/doi/pdf/10.1145/3326362
Semantic Scholar: ratio 1.00: Dynamic Graph CNN for Learning on Point Clouds | Yue Wang, Yongbin Sun, Zi-Wei Liu, S. Sarma, M. Bronstein, J. Solomon | 2018 | ACM Transactions on Graphics | vol 38 | pages 1--12 | doi 10.1145/3326362 | arXiv 1801.07829 | Semantic Scholar e1799aaf23c12af6932dc0ef3dfb1638f01413d1 | open access https://dl.acm.org/doi/pdf/10.1145/3326362
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 3, thomas2019kpconv

Command: `python3 lookup resolve '10.1109/ICCV.2019.00651'`

```
Crossref: ratio 1.00: KPConv: Flexible and Deformable Convolution for Point Clouds | Hugues Thomas, Charles R. Qi, Jean-Emmanuel Deschaud, Beatriz Marcotegui, Francois Goulette, Leonidas Guibas | 2019 | 2019 IEEE/CVF International Conference on Computer Vision (ICCV) | pages 6410--6419 | doi 10.1109/iccv.2019.00651
OpenAlex: ratio 1.00: KPConv: Flexible and Deformable Convolution for Point Clouds | Hugues Thomas, Charles R. Qi, Jean<hyphen>Emmanuel Deschaud, Beatriz Marcotegui, Fran<latin small letter c with cedilla>ois Goulette, Leonidas J. Guibas | 2019 | IEEE/CVF International Conference on Computer Vision (ICCV) | pages 6410--6419 | doi 10.1109/iccv.2019.00651 | OpenAlex W2938428612 | open access https://arxiv.org/pdf/1904.08889
Semantic Scholar: ratio 1.00: KPConv: Flexible and Deformable Convolution for Point Clouds | H. Thomas, C. Qi, Jean-Emmanuel Deschaud, B. Marcotegui, F. Goulette, L. Guibas | 2019 | IEEE International Conference on Computer Vision | pages 6410--6419 | doi 10.1109/ICCV.2019.00651 | arXiv 1904.08889 | Semantic Scholar 9218b3e7e447048a070e565b9add26e41d861964 | open access https://arxiv.org/pdf/1904.08889
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 3, prokudin2019bps

Command: `python3 lookup resolve '10.1109/ICCV.2019.00443'`

```
Crossref: ratio 1.00: Efficient Learning on Point Clouds With Basis Point Sets | Sergey Prokudin, Christoph Lassner, Javier Romero | 2019 | 2019 IEEE/CVF International Conference on Computer Vision (ICCV) | pages 4331--4340 | doi 10.1109/iccv.2019.00443
OpenAlex: ratio 1.00: Efficient Learning on Point Clouds With Basis Point Sets | Sergey Prokudin, Christoph Lassner, Javier Romero | 2019 | IEEE/CVF International Conference on Computer Vision (ICCV) | pages 4331--4340 | doi 10.1109/iccv.2019.00443 | OpenAlex W2969694596
Semantic Scholar: ratio 1.00: Efficient Learning on Point Clouds With Basis Point Sets | S. Prokudin, Christoph Lassner, J. Romero | 2019 | IEEE International Conference on Computer Vision | pages 4331--4340 | doi 10.1109/ICCV.2019.00443 | arXiv 1908.09186 | Semantic Scholar 4502a2773c9a6851ad1fb57904e84c8b0572ba95
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 3, zhao2021pointtransformer

Command: `python3 lookup resolve '10.1109/ICCV48922.2021.01595'`

```
Crossref: ratio 1.00: Point Transformer | Hengshuang Zhao, Li Jiang, Jiaya Jia, Philip Torr, Vladlen Koltun | 2021 | 2021 IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16239--16248 | doi 10.1109/iccv48922.2021.01595
OpenAlex: ratio 1.00: Point Transformer | Hengshuang Zhao, Li Jiang, Jiaya Jia, Philip H. S. Torr, Vladlen Koltun | 2021 | IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16239--16248 | doi 10.1109/iccv48922.2021.01595 | OpenAlex W4214755140
Semantic Scholar: ratio 1.00: Point Transformer | Heng-Shuang Zhao, Li Jiang, Jia-Ya Jia, P. Torr, V. Koltun | 2020 | IEEE International Conference on Computer Vision | pages 16239--16248 | doi 10.1109/ICCV48922.2021.01595 | arXiv 2012.09164 | Semantic Scholar ea249d27148fff074af742f70f88aa5878d29ae6
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 3, dietterich1997multiple

Command: `python3 lookup resolve '10.1016/S0004-3702(96)00034-3'`

```
Crossref: ratio 1.00: Solving the multiple instance problem with axis-parallel rectangles | Thomas G. Dietterich, Richard H. Lathrop, Tom<latin small letter a with acute>s Lozano-P<latin small letter e with acute>rez | 1997 | Artificial Intelligence | vol 89 | no 1-2 | pages 31--71 | doi 10.1016/s0004-3702(96)00034-3
OpenAlex: ratio 1.00: Solving the multiple instance problem with axis-parallel rectangles | Thomas G. Dietterich, Richard H. Lathrop, Tom<latin small letter a with acute>s Lozano<hyphen>P<latin small letter e with acute>rez | 1997 | Artificial Intelligence | vol 89 | no 1-2 | pages 31--71 | doi 10.1016/s0004-3702(96)00034-3 | OpenAlex W2110119381 | open access https://www.sciencedirect.com/science/article/pii/S0004370296000343/pdf
Semantic Scholar: ratio 1.00: Solving the Multiple Instance Problem with Axis-Parallel Rectangles | Thomas G. Dietterich, R. Lathrop, Tomas Lozano-Perez | 1997 | Artificial Intelligence | vol 89 | pages 31--71 | doi 10.1016/S0004-3702(96)00034-3 | Semantic Scholar 1c7d38f68fe1150895a186e30b60c02dd89a676a | open access https://www.sciencedirect.com/science/article/pii/S0004370296000343/pdf
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 3, ilse2018attention

Command: `python3 lookup resolve '1802.04712'`

```
Crossref: not found
OpenAlex: ratio 1.00: Attention-based Deep Multiple Instance Learning | Maximilian Ilse, Jakub M. Tomczak, Max Welling | 2018 | arXiv (Cornell University) | doi 10.48550/arxiv.1802.04712 | arXiv 1802.04712 | OpenAlex W2785934082 | open access https://arxiv.org/pdf/1802.04712
Semantic Scholar: not found
arXiv: ratio 1.00: Attention-based Deep Multiple Instance Learning | Maximilian Ilse, Jakub M. Tomczak, Max Welling | 2018 | arXiv 1802.04712
```

Exit status: 0

### theme 3, wang2018revisiting

Command: `python3 lookup resolve '10.1016/j.patcog.2017.08.026'`

```
Crossref: ratio 1.00: Revisiting multiple instance neural networks | Xinggang Wang, Yongluan Yan, Peng Tang, Xiang Bai, Wenyu Liu | 2018 | Pattern Recognition | vol 74 | pages 15--24 | doi 10.1016/j.patcog.2017.08.026
OpenAlex: ratio 1.00: Revisiting multiple instance neural networks | Xinggang Wang, Yongluan Yan, Peng Tang, Xiang Bai, Wenyu Liu | 2017 | Pattern Recognition | vol 74 | pages 15--24 | doi 10.1016/j.patcog.2017.08.026 | OpenAlex W2531897166 | open access https://arxiv.org/pdf/1610.02501
Semantic Scholar: ratio 1.00: Revisiting multiple instance neural networks | Xing-Gang Wang, Yongluan Yan, Peng Tang, Xiang Bai, Wen-Yu Liu | 2016 | Pattern Recognition | vol abs/1610.02501 | doi 10.1016/j.patcog.2017.08.026 | arXiv 1610.02501 | Semantic Scholar 0820ccfdba775c304bedb9c3d82ee8758e0a416b | open access https://arxiv.org/pdf/1610.02501
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 3, campanella2019clinical

Command: `python3 lookup resolve '10.1038/s41591-019-0508-1'`

```
Crossref: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | Gabriele Campanella, Matthew G. Hanna, Luke Geneslaw, Allen Miraflor, Vitor Werneck Krauss Silva, Klaus J. Busam, Edi Brogi, Victor E. Reuter, David S. Klimstra, Thomas J. Fuchs | 2019 | Nature Medicine | vol 25 | no 8 | pages 1301--1309 | doi 10.1038/s41591-019-0508-1
OpenAlex: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | Gabriele S. V. Campanella, Matthew G. Hanna, Luke Geneslaw, Allen P. Miraflor, Vitor Werneck Krauss Silva, Klaus Johannes BUSAM, Edi Brogi, Victor E. Reuter, David S. Klimstra, Thomas J. Fuchs | 2019 | Nature Medicine | vol 25 | no 8 | pages 1301--1309 | doi 10.1038/s41591-019-0508-1 | OpenAlex W2956228567 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7418463/
Semantic Scholar: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | G. Campanella, M. Hanna, L. Geneslaw, Allen P. Miraflor, Vitor Werneck Krauss Silva, K. Busam, E. Brogi, V. Reuter, D. Klimstra, Thomas J. Fuchs | 2019 | Nature Medicine | vol 25 | pages 1301--1309 | doi 10.1038/s41591-019-0508-1 | Semantic Scholar addae423490bbe82da4fb2fc265237178686b4e8 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7418463/
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 3, lu2021clam

Command: `python3 lookup resolve '10.1038/s41551-020-00682-w'`

```
Crossref: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Y. Chen, Richard J. Chen, Matteo Barbieri, Faisal Mahmood | 2021 | Nature Biomedical Engineering | vol 5 | no 6 | pages 555--570 | doi 10.1038/s41551-020-00682-w
OpenAlex: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Chen, Richard J. Chen, Matteo Barbieri, Faisal Mahmood | 2021 | Nature Biomedical Engineering | vol 5 | no 6 | pages 555--570 | doi 10.1038/s41551-020-00682-w | OpenAlex W3018295606 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8711640/
Semantic Scholar: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Y. Chen, Richard J. Chen, Matteo Barbieri, Faisal Mahmood | 2020 | Nature Biomedical Engineering | vol 5 | pages 555--570 | doi 10.1038/s41551-020-00682-w | arXiv 2004.09666 | Semantic Scholar 3e358c3033908a9506e7f1e3cf29283e359f43d6 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8711640/
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 3, shao2021transmil

Command: `python3 lookup resolve '2106.00908'`

```
Crossref: not found
OpenAlex: ratio 1.00: TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification | Zhuchen Shao, Hao Bian, Chen Yang, Wang, Yifeng, Jian Zhang, Xiangyang Ji, Yongbing Zhang | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2106.00908 | arXiv 2106.00908 | OpenAlex W3193968034 | open access https://arxiv.org/pdf/2106.00908
Semantic Scholar: ratio 0.99: TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classication | Zhucheng Shao, Hao Bian, Yang Chen, Yifeng Wang, Jian Zhang, Xiang-Yang Ji, Yong-Bing Zhang | 2021 | Neural Information Processing Systems | vol abs/2106.00908 | doi 10.48550/arXiv.2106.00908 | arXiv 2106.00908 | Semantic Scholar 2153963d19b21e64e55295b69de81d99aadac465 | open access https://arxiv.org/pdf/2106.00908
arXiv: ratio 1.00: TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification | Zhuchen Shao, Hao Bian, Yang Chen, Yifeng Wang, Jian Zhang, Xiangyang Ji, Yongbing Zhang | 2021 | arXiv 2106.00908
```

Exit status: 0

### theme 3, mialon2021otke

Command: `python3 lookup resolve '2006.12065'`

```
Crossref: not found
OpenAlex: ratio 1.00: A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, Dexiong Chen, Alexandre d<right single quotation mark>Aspremont, Julien Mairal | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.12065 | arXiv 2006.12065 | OpenAlex W3127760629 | open access https://arxiv.org/pdf/2006.12065
Semantic Scholar: ratio 0.89: An Optimal Transport Kernel for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, De-Xiong Chen, A. d'Aspremont, Julien Mairal | 2020 | arXiv.org | vol abs/2006.12065 | doi 10.48550/arXiv.2006.12065 | arXiv 2006.12065 | Semantic Scholar 74bc260a893479cdada738017037c7bde4283d45 | open access http://arxiv.org/pdf/2006.12065
arXiv: ratio 1.00: A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, Dexiong Chen, Alexandre d'Aspremont, Julien Mairal | 2020 | arXiv 2006.12065
```

Exit status: 0

### theme 3, naderializadeh2021pswe

Command: `python3 lookup resolve 'https://proceedings.neurips.cc/paper/2021/hash/1bc2029a8851ad344a8d503930dfd7f7-Abstract.html'`

```
Crossref: not found
OpenAlex: not found
Semantic Scholar: not found
arXiv: not found
```

Exit status: 0

### theme 3, xu2023rotp

Command: `python3 lookup resolve '10.1109/TPAMI.2023.3314661'`

```
Crossref: ratio 1.00: Regularized Optimal Transport Layers for Generalized Global Pooling Operations | Hongteng Xu, Minjie Cheng | 2023 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 45 | no 12 | pages 15426--15444 | doi 10.1109/tpami.2023.3314661
OpenAlex: ratio 1.00: Regularized Optimal Transport Layers for Generalized Global Pooling Operations | Hongteng Xu, Minjie Cheng | 2023 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 45 | no 12 | pages 15426--15444 | doi 10.1109/tpami.2023.3314661 | OpenAlex W4386634627 | open access https://ieeexplore.ieee.org/ielx7/34/4359286/10247589.pdf
Semantic Scholar: ratio 1.00: Regularized Optimal Transport Layers for Generalized Global Pooling Operations | Hongteng Xu, Min-Jie Cheng | 2022 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 45 | pages 15426--15444 | doi 10.1109/TPAMI.2023.3314661 | arXiv 2212.06339 | Semantic Scholar 0f422f1904f3e1b3e966bd61b3a27334a540f91d | open access https://ieeexplore.ieee.org/ielx7/34/4359286/10247589.pdf
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 3, amir2025fsw

Command: `python3 lookup resolve '2405.16519'`

```
Crossref: not found
OpenAlex: ratio 1.00: Fourier Sliced-Wasserstein Embedding for Multisets and Measures | Tal Amir, Nadav Dym | 2024 | arXiv (Cornell University) | doi 10.48550/arxiv.2405.16519 | arXiv 2405.16519 | OpenAlex W4399115724 | open access https://arxiv.org/pdf/2405.16519
Semantic Scholar: ratio 1.00: Fourier Sliced-Wasserstein Embedding for Multisets and Measures | Tal Amir, Nadav Dym | 2024 | International Conference on Learning Representations | vol abs/2504.02544 | doi 10.48550/arXiv.2504.02544 | arXiv 2504.02544 | Semantic Scholar d69bdfb1e898ea9356618c7e20269a7cda4e151e
arXiv: ratio 1.00: Fourier Sliced-Wasserstein Embedding for Multisets and Measures | Tal Amir, Nadav Dym | 2024 | arXiv 2405.16519
```

Exit status: 0

### theme 3, gutierrezbecker2018multistructural

Command: `python3 lookup resolve '10.1007/978-3-030-00931-1_60'`

```
Crossref: ratio 1.00: Deep Multi-structural Shape Analysis: Application to Neuroanatomy | Benjam<latin small letter i with acute>n Guti<latin small letter e with acute>rrez-Becker, Christian Wachinger | 2018 | Lecture Notes in Computer Science | pages 523--531 | doi 10.1007/978-3-030-00931-1_60
OpenAlex: ratio 1.00: Deep Multi-structural Shape Analysis: Application to Neuroanatomy | Benjam<latin small letter i with acute>n Guti<latin small letter e with acute>rrez-Becker, Christian Wachinger | 2018 | Lecture notes in computer science | pages 523--531 | doi 10.1007/978-3-030-00931-1_60 | OpenAlex W2805053989 | open access https://arxiv.org/pdf/1806.01069
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 3, chen2022tracts

Command: `python3 lookup resolve '10.1007/978-3-031-16431-6_17'`

```
Crossref: ratio 1.00: White Matter Tracts are Point Clouds: Neuropsychological Score Prediction and Critical Region Localization via Geometric Deep Learning | Yuqian Chen, Fan Zhang, Chaoyi Zhang, Tengfei Xue, Leo R. Zekelman, Jianzhong He, Yang Song, Nikos Makris, Yogesh Rathi, Alexandra J. Golby, Weidong Cai, Lauren J. O<right single quotation mark>Donnell | 2022 | Lecture Notes in Computer Science | pages 174--184 | doi 10.1007/978-3-031-16431-6_17
OpenAlex: ratio 1.00: White Matter Tracts are Point Clouds: Neuropsychological Score Prediction and Critical Region Localization via Geometric Deep Learning | Yuqian Chen, Fan Zhang, Chaoyi Zhang, Tengfei Xue, Leo Zekelman, Jianzhong He, Yang Song, Nikos Makris, Yogesh Rathi, Alexandra J. Golby, Weidong Cai, Lauren J. O<right single quotation mark>Donnell | 2022 | Lecture notes in computer science | pages 174--184 | doi 10.1007/978-3-031-16431-6_17 | OpenAlex W4284879865 | open access https://arxiv.org/pdf/2207.02402
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 3, beetz2023mi

Command: `python3 lookup resolve '10.1109/EMBC40787.2023.10340878'`

```
Crossref: ratio 1.00: 3D Shape-Based Myocardial Infarction Prediction Using Point Cloud Classification Networks | Marcel Beetz, Yilong Yang, Abhirup Banerjee, Lei Li, Vicente Grau | 2023 | 2023 45th Annual International Conference of the IEEE Engineering in Medicine &amp; Biology Society (EMBC) | pages 1--4 | doi 10.1109/embc40787.2023.10340878
OpenAlex: ratio 1.00: 3D Shape-Based Myocardial Infarction Prediction Using Point Cloud Classification Networks | Marcel Beetz, Yilong Yang, Abhirup Banerjee, Lei Li, Vicente Grau | 2023 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC) | vol 2023 | pages 1--4 | doi 10.1109/embc40787.2023.10340878 | OpenAlex W4389542902 | open access https://ora.ox.ac.uk/objects/uuid:3d74cf55-6626-4af7-a261-45927118be4a/files/s8049g6327
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 3, thiery2023dlbcl

Command: `python3 lookup resolve '2310.16863'`

```
Crossref: not found
OpenAlex: ratio 1.00: Graph-Based Multimodal Multi-lesion DLBCL Treatment Response Prediction from PET Images | Oriane Thiery, Mira Rizkallah, Cl<latin small letter e with acute>ment Bailly, Caroline Bodet<hyphen>Milin, Emmanuel Itti, Olivier Casasnovas, Steven Le Gouill, Thomas Carlier, Diana Mateus | 2023 | Lecture notes in computer science | vol 14394 | pages 103--112 | doi 10.1007/978-3-031-47425-5_10 | OpenAlex W4387995849 | open access https://arxiv.org/pdf/2310.16863
Semantic Scholar: ratio 1.00: Graph-based multimodal multi-lesion DLBCL treatment response prediction from PET images | Oriane Thiery, M. Rizkallah, C. Bailly, C. bodet-Milin, E. Itti, R. Casasnovas, S. le Gouill, T. Carlier, D. Mateus | 2023 | MTSAIL/LEAF/AI4Treat/MMMI/REMIA@MICCAI | pages 103--112 | doi 10.48550/arXiv.2310.16863 | arXiv 2310.16863 | Semantic Scholar 62775aac10581b9c476df6b7d417c56c4fb60f92
arXiv: ratio 1.00: Graph-based multimodal multi-lesion DLBCL treatment response prediction from PET images | Oriane Thiery, Mira Rizkallah, Cl<latin small letter e with acute>ment Bailly, Caroline Bodet-Milin, Emmanuel Itti, Ren<latin small letter e with acute>-Olivier Casasnovas, Steven Le Gouill, Thomas Carlier, Diana Mateus | 2023 | arXiv 2310.16863
```

Exit status: 0

### theme 3, zhang2025lamp

Command: `python3 lookup resolve '10.1007/978-3-032-04927-8_31'`

```
Crossref: ratio 1.00: Lymphoma Prognosis with Lesion-Anatomy Context Fusion and Attention-Based Multi-lesion Aggregation | Song Zhang, Jiajin Zhang, Liheng Qiu, Wei Liu, Dakai Jin, Le Lu, Shenmiao Yang, Ke Yan | 2025 | Lecture Notes in Computer Science | pages 322--332 | doi 10.1007/978-3-032-04927-8_31
OpenAlex: ratio 1.00: Lymphoma Prognosis with Lesion-Anatomy Context Fusion and Attention-Based Multi-lesion Aggregation | Song Zhang, Jiajin Zhang, Liheng Qiu, Wei Liu, Dakai Jin, Le Lu, Shenmiao Yang, Ke Yan | 2025 | Lecture notes in computer science | pages 322--332 | doi 10.1007/978-3-032-04927-8_31 | OpenAlex W4414380796
Semantic Scholar: ratio 1.00: Lymphoma Prognosis with Lesion-Anatomy Context Fusion and Attention-Based Multi-lesion Aggregation | Song Zhang, Jia-Jin Zhang, Li-Heng Qiu, Wei Liu, Da-Kai Jin, Le Lu, Shen-Miao Yang, Ke Yan | 2025 | International Conference on Medical Image Computing and Computer-Assisted Intervention | pages 322--332 | doi 10.1007/978-3-032-04927-8_31 | Semantic Scholar 7e6d88c8021a9d663fec57c6bba604cf50250088
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, avants2008syn

Command: `python3 lookup resolve '10.1016/j.media.2007.06.004'`

```
Crossref: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | B AVANTS, C EPSTEIN, M GROSSMAN, J GEE | 2008 | Medical Image Analysis | vol 12 | no 1 | pages 26--41 | doi 10.1016/j.media.2007.06.004
OpenAlex: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | Brian Avants, Charles L. Epstein, Murray Grossman, James C. Gee | 2007 | Medical Image Analysis | vol 12 | no 1 | pages 26--41 | doi 10.1016/j.media.2007.06.004 | OpenAlex W1970928383 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2276735/
Semantic Scholar: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | B. Avants, C. Epstein, M. Grossman, J. Gee | 2008 | Medical Image Anal. | vol 12 1 | pages 26--41 | doi 10.1016/j.media.2007.06.004 | Semantic Scholar 66b498a54843e14270b75f0c3c8fc65a0b2e1e98 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2276735/
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, balakrishnan2019voxelmorph

Command: `python3 lookup resolve '10.1109/TMI.2019.2897538'`

```
Crossref: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | Guha Balakrishnan, Amy Zhao, Mert R. Sabuncu, John Guttag, Adrian V. Dalca | 2019 | IEEE Transactions on Medical Imaging | vol 38 | no 8 | pages 1788--1800 | doi 10.1109/tmi.2019.2897538
OpenAlex: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | Guha Balakrishnan, Amy Zhao, Mert Rory Sabuncu, John V. Guttag, Adrian Vasile Dalca | 2019 | IEEE Transactions on Medical Imaging | vol 38 | no 8 | pages 1788--1800 | doi 10.1109/tmi.2019.2897538 | OpenAlex W2891631795 | open access https://arxiv.org/pdf/1809.05231
Semantic Scholar: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | G. Balakrishnan, Amy Zhao, M. Sabuncu, J. Guttag, Adrian V. Dalca | 2018 | IEEE Transactions on Medical Imaging | vol 38 | pages 1788--1800 | doi 10.1109/TMI.2019.2897538 | arXiv 1809.05231 | Semantic Scholar 6a88c8abd298b5e9ea7485f41a6a1b1e43b16d5f | open access https://arxiv.org/pdf/1809.05231
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, rakic2026atlasmorph

Command: `python3 lookup resolve '10.1016/j.media.2025.103893'`

```
Crossref: ratio 1.00: AtlasMorph: Learning conditional deformable templates for brain MRI | Marianne Rakic, Andrew Hoopes, Mazdak S. Abulnaga, Mert R. Sabuncu, John V. Guttag, Adrian V. Dalca | 2026 | Medical Image Analysis | vol 110 | pages 103893 | doi 10.1016/j.media.2025.103893
OpenAlex: ratio 1.00: AtlasMorph: Learning conditional deformable templates for brain MRI | Marianne Rakic, Andrew Hoopes, S. Mazdak Abulnaga, Mert Rory Sabuncu, John V. Guttag, Adrian Vasile Dalca | 2025 | Medical Image Analysis | vol 110 | pages 103893--103893 | doi 10.1016/j.media.2025.103893 | OpenAlex W7114773373 | open access https://doi.org/10.1016/j.media.2025.103893
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, feydy2017optimal

Command: `python3 lookup resolve '10.1007/978-3-319-66182-7_34'`

```
Crossref: ratio 1.00: Optimal Transport for Diffeomorphic Registration | Jean Feydy, Benjamin Charlier, Fran<latin small letter c with cedilla>ois-Xavier Vialard, Gabriel Peyr<latin small letter e with acute> | 2017 | Lecture Notes in Computer Science | pages 291--299 | doi 10.1007/978-3-319-66182-7_34
OpenAlex: ratio 1.00: Optimal Transport for Diffeomorphic Registration | Jean Feydy, Benjamin Charlier, Fran<latin small letter c with cedilla>ois<hyphen>Xavier Vialard, Gabriel Peyr<latin small letter e with acute> | 2017 | Lecture notes in computer science | pages 291--299 | doi 10.1007/978-3-319-66182-7_34 | OpenAlex W2626618681 | open access https://arxiv.org/pdf/1706.05218
Semantic Scholar: ratio 1.00: Optimal Transport for Diffeomorphic Registration | J. Feydy, Benjamin Charlier, Fran<latin small letter c with cedilla>ois-Xavier Vialard, G. Peyr<latin small letter e with acute> | 2017 | International Conference on Medical Image Computing and Computer-Assisted Intervention | pages 291--299 | doi 10.1007/978-3-319-66182-7_34 | arXiv 1706.05218 | Semantic Scholar 22f2a1f549d39fa75c7a245c464bad373032e1da | open access https://arxiv.org/pdf/1706.05218
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, lambin2012radiomics

Command: `python3 lookup resolve '10.1016/j.ejca.2011.11.036'`

```
Crossref: ratio 1.00: Radiomics: Extracting more information from medical images using advanced feature analysis | Philippe Lambin, Emmanuel Rios-Velazquez, Ralph Leijenaar, Sara Carvalho, Ruud G.P.M. van Stiphout, Patrick Granton, Catharina M.L. Zegers, Robert Gillies, Ronald Boellard, Andr<latin small letter e with acute> Dekker, Hugo J.W.L. Aerts | 2012 | European Journal of Cancer | vol 48 | no 4 | pages 441--446 | doi 10.1016/j.ejca.2011.11.036
OpenAlex: ratio 1.00: Radiomics: Extracting more information from medical images using advanced feature analysis | Philippe Lambin, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Sara Carvalho, Ruud G.P.M. van Stiphout, Patrick Vincent Granton, Catharina M.L. Zegers, Robert J. Gillies, Ronald Boellaard, Andre L.A.J. Dekker, Hugo J.W.L. Aerts | 2012 | European Journal of Cancer | vol 48 | no 4 | pages 441--446 | doi 10.1016/j.ejca.2011.11.036 | OpenAlex W2128739912 | open access http://www.ejcancer.com/article/S0959804911009993/pdf
Semantic Scholar: ratio 1.00: Radiomics: Extracting more information from medical images using advanced feature analysis | P. Lambin, E. Velazquez, R. Leijenaar, S. Carvalho, R. van Stiphout, P. Granton, C. Zegers, R. Gillies, Ronald Boellard, A. Dekker, H. Aerts | 2012 | European Journal of Cancer | vol 48 | pages 441--446 | doi 10.1016/j.ejca.2011.11.036 | Semantic Scholar 9971ff92d9d09b4736228bdbd7726e2e19b9aa2d | open access http://www.ejcancer.com/article/S0959804911009993/pdf
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, aerts2014decoding

Command: `python3 lookup resolve '10.1038/ncomms5006'`

```
Crossref: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | Hugo J. W. L. Aerts, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Chintan Parmar, Patrick Grossmann, Sara Carvalho, Johan Bussink, Ren<latin small letter e with acute> Monshouwer, Benjamin Haibe-Kains, Derek Rietveld, Frank Hoebers, Michelle M. Rietbergen, C. Ren<latin small letter e with acute> Leemans, Andre Dekker, John Quackenbush, Robert J. Gillies, Philippe Lambin | 2014 | Nature Communications | vol 5 | no 1 | doi 10.1038/ncomms5006
OpenAlex: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | Hugo J.W.L. Aerts, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Chintan Parmar, Patrick Gro<latin small letter sharp s>mann, Sara Carvalho, Johan Bussink, Ren<latin small letter e with acute> Monshouwer, Benjamin Haibe<hyphen>Kains, Derek H. F. Rietveld, Frank J P Hoebers, Michelle M. Rietbergen, Charles Ren<latin small letter e with acute> Leemans, Andre L.A.J. Dekker, John F Quackenbush, Robert J. Gillies, Philippe Lambin | 2014 | Nature Communications | vol 5 | no 1 | pages 4006--4006 | doi 10.1038/ncomms5006 | OpenAlex W2103004421 | open access https://www.nature.com/articles/ncomms5006.pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, gillies2016radiomics

Command: `python3 lookup resolve '10.1148/radiol.2015151169'`

```
Crossref: ratio 1.00: Radiomics: Images Are More than Pictures, They Are Data | Robert J. Gillies, Paul E. Kinahan, Hedvig Hricak | 2016 | Radiology | vol 278 | no 2 | pages 563--577 | doi 10.1148/radiol.2015151169
OpenAlex: ratio 1.00: Radiomics: Images Are More than Pictures, They Are Data | Robert J. Gillies, Paul E. Kinahan, Hedvig Hricak | 2015 | Radiology | vol 278 | no 2 | pages 563--577 | doi 10.1148/radiol.2015151169 | OpenAlex W2174661749 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC4734157/pdf/
Semantic Scholar: ratio 1.00: Radiomics: Images Are More than Pictures, They Are Data | R. Gillies, Paul Kinahan, H. Hricak | 2015 | Radiology | vol 278 | pages 563--577 | doi 10.1148/radiol.2015151169 | Semantic Scholar dcd99d49af33bd14e9e0750bcf854e7b306c808a | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC4734157/pdf/
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, lambin2017radiomics

Command: `python3 lookup resolve '10.1038/nrclinonc.2017.141'`

```
Crossref: ratio 1.00: Radiomics: the bridge between medical imaging and personalized medicine | Philippe Lambin, Ralph T.H. Leijenaar, Timo M. Deist, Jurgen Peerlings, Evelyn E.C. de Jong, Janita van Timmeren, Sebastian Sanduleanu, Ruben T.H.M. Larue, Aniek J.G. Even, Arthur Jochems, Yvonka van Wijk, Henry Woodruff, Johan van Soest, Tim Lustberg, Erik Roelofs, Wouter van Elmpt, Andre Dekker, Felix M. Mottaghy, Joachim E. Wildberger, Sean Walsh | 2017 | Nature Reviews Clinical Oncology | vol 14 | no 12 | pages 749--762 | doi 10.1038/nrclinonc.2017.141
OpenAlex: ratio 1.00: Radiomics: the bridge between medical imaging and personalized medicine | Philippe Lambin, Ralph T. H. Leijenaar, Timo M. Deist, Jurgen Peerlings, Evelyn E.C. de Jong, Janita E. van Timmeren, Sebastian Sanduleanu, Ruben T. H. M. Larue, Aniek J.G. Even, Arthur Jochems, Yvonka van Wijk, Henry C. Woodruff, Johan van Soest, Tim Lustberg, Erik Roelofs, Wouter van Elmpt, Andre L.A.J. Dekker, Felix Manuel Mottaghy, Joachim Ernst Wildberger, Se<latin small letter a with acute>n Walsh | 2017 | Nature Reviews Clinical Oncology | vol 14 | no 12 | pages 749--762 | doi 10.1038/nrclinonc.2017.141 | OpenAlex W2763355946 | open access https://cris.maastrichtuniversity.nl/en/publications/104e5982-844e-413f-9bae-c2d4d1d3c177
Semantic Scholar: ratio 1.00: Radiomics: the bridge between medical imaging and personalized medicine | P. Lambin, R. Leijenaar, T. Deist, J. Peerlings, E. E. D. de Jong, J. V. van Timmeren, S. Sanduleanu, R. Larue, A. Even, A. Jochems, Y. van Wijk, H. Woodruff, J. van Soest, T. Lustberg, E. Roelofs, W. van Elmpt, A. Dekker, F. Mottaghy, J. Wildberger, S. Walsh | 2017 | Nature Reviews Clinical Oncology | vol 14 | pages 749--762 | doi 10.1038/nrclinonc.2017.141 | Semantic Scholar f9b5c08711b30103ffc7ba144d4f590bbd9b065b | open access https://cris.maastrichtuniversity.nl/en/publications/104e5982-844e-413f-9bae-c2d4d1d3c177
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, vangriethuysen2017computational

Command: `python3 lookup resolve '10.1158/0008-5472.CAN-17-0339'`

```
Crossref: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | Joost J.M. van Griethuysen, Andriy Fedorov, Chintan Parmar, Ahmed Hosny, Nicole Aucoin, Vivek Narayan, Regina G.H. Beets-Tan, Jean-Christophe Fillion-Robin, Steve Pieper, Hugo J.W.L. Aerts | 2017 | Cancer Research | vol 77 | no 21 | pages e104--e107 | doi 10.1158/0008-5472.can-17-0339
OpenAlex: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | Joost J. M. van Griethuysen, Andriy Fedorov, Chintan Parmar, Ahmed Hosny, Nicole Aucoin, Vivek Narayan, Regina G. H. Beets<hyphen>Tan, Jean<hyphen>Christophe Fillion<hyphen>Robin, Steve Pieper, Hugo J.W.L. Aerts | 2017 | Cancer Research | vol 77 | no 21 | pages e104--e107 | doi 10.1158/0008-5472.can-17-0339 | OpenAlex W2767128594 | open access https://cancerres.aacrjournals.org/content/canres/77/21/e104.full.pdf
Semantic Scholar: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | J. V. van Griethuysen, Andrey Fedorov, C. Parmar, A. Hosny, N. Aucoin, V. Narayan, R. Beets-Tan, J. Fillion-Robin, S. Pieper, H. Aerts | 2017 | Cancer Research | vol 77 | pages e104--e107 | doi 10.1158/0008-5472.CAN-17-0339 | Semantic Scholar c53fa445bee435f567828db3a0ede0f08abdd0d5 | open access https://cancerres.aacrjournals.org/content/canres/77/21/e104.full.pdf
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, zwanenburg2020ibsi

Command: `python3 lookup resolve '10.1148/radiol.2020191145'`

```
Crossref: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping | Alex Zwanenburg, Martin Valli<latin small letter e with grave>res, Mahmoud A. Abdalah, Hugo J. W. L. Aerts, Vincent Andrearczyk, Aditya Apte, Saeed Ashrafinia, Spyridon Bakas, Roelof J. Beukinga, Ronald Boellaard, Marta Bogowicz, Luca Boldrini, Ir<latin small letter e with grave>ne Buvat, Gary J. R. Cook, Christos Davatzikos, Adrien Depeursinge, Marie-Charlotte Desseroit, Nicola Dinapoli, Cuong Viet Dinh, Sebastian Echegaray, Issam El Naqa, Andriy Y. Fedorov, Roberto Gatta, Robert J. Gillies, Vicky Goh, Michael G<latin small letter o with diaeresis>tz, Matthias Guckenberger, Sung Min Ha, Mathieu Hatt, Fabian Isensee, Philippe Lambin, Stefan Leger, Ralph T.H. Leijenaar, Jacopo Lenkowicz, Fiona Lippert, Are Losneg<latin small letter a with ring above>rd, Klaus H. Maier-Hein, Olivier Morin, Henning M<latin small letter u with diaeresis>ller, Sandy Napel, Christophe Nioche, Fanny Orlhac, Sarthak Pati, Elisabeth A.G. Pfaehler, Arman Rahmim, Arvind U.K. Rao, Jonas Scherer, Muhammad Musib Siddique, Nanna M. Sijtsema, Jairo Socarras Fernandez, Emiliano Spezi, Roel J.H.M. Steenbakkers, Stephanie Tanadini-Lang, Daniela Thorwarth, Esther G.C. Troost, Taman Upadhaya, Vincenzo Valentini, Lisanne V. van Dijk, Joost van Griethuysen, Floris H.P. van Velden, Philip Whybra, Christian Richter, Steffen L<latin small letter o with diaeresis>ck | 2020 | Radiology | vol 295 | no 2 | pages 328--338 | doi 10.1148/radiol.2020191145
OpenAlex: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping | Alex Zwanenburg, Martin Valli<latin small letter e with grave>res, Mahmoud A. Abdalah, Hugo J.W.L. Aerts, Vincent Andrearczyk, Aditya Apte, Saeed Ashrafinia, Spyridon Bakas, Roelof J. Beukinga, Ronald Boellaard, Marta Bogowicz, Luca Boldrini, Ir<latin small letter e with grave>ne Buvat, Gary Cook, Christos A. Davatzikos, Adrien Depeursinge, Marie-Charlotte Desseroit, N. Dinapoli, Cuong Viet Dinh, Sebastian Echegaray, Issam El Naqa, Andriy Fedorov, Roberto Gatta, Robert J. Gillies, Vicky Goh, MICHAEL A. GOETZ, Matthias G<latin small letter u with diaeresis>ckenberger, Sung Min Ha, Mathieu Hatt, Fabian Isensee, Philippe Lambin, Stefan Leger, Ralph T. H. Leijenaar, Jacopo Lenkowicz, Fiona Lippert, Are Losneg<latin small letter a with ring above>rd, Klaus Hermann Maier-Hein, Olivier Morin, Henning M<latin small letter u with diaeresis>ller, Sandy A. Napel, Christophe Nioche, Fanny Orlhac, Sarthak Pati, Elisabeth A. G. Pfaehler, Arman Rahmim, Arvind U K Rao, Jonas Scherer, Muhammad Musib Siddique, Nanna Maria Sijtsema, Jairo Socarras Fernandez, Emiliano Spezi, Roel J.H.M. Steenbakkers, Stephanie Tanadini<hyphen>Lang, Daniela Thorwarth, Esther G.C. Troost, Taman Upadhaya, Vincenzo Valentini, Lisanne Vania van Dijk, Joost J. M. van Griethuysen, Floris H. P. van Velden, P. Whybra, Christian Richter, Steffen L<latin small letter o with diaeresis>ck | 2020 | Radiology | vol 295 | no 2 | pages 328--338 | doi 10.1148/radiol.2020191145 | OpenAlex W2998789541 | open access https://research.rug.nl/files/119920642/The_Image_Biomarker_Standardization_Initiative_Standardized_Quantitative_Radiomics_for_High_Throughput_Image_based_Phenotyping.pdf
Semantic Scholar: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping. | A. Zwanenburg, M. Valli<latin small letter e with grave>res, M. Abdalah, H. Aerts, V. Andrearczyk, A. Apte, S. Ashrafinia, S. Bakas, R. Beukinga, R. Boellaard, M. Bogowicz, L. Boldrini, I. Buvat, G. Cook, C. Davatzikos, A. Depeursinge, Marie-Charlotte Desseroit, N. Dinapoli, C. Dinh, S. Echegaray, I. El Naqa, Andrey Fedorov, R. Gatta, R. Gillies, V. Goh, M. G<latin small letter o with diaeresis>tz, M. Guckenberger, Min-Ha Sung, M. Hatt, F. Isensee, P. Lambin, S. Leger, R. Leijenaar, J. Lenkowicz, F. Lippert, Are Losneg<latin small letter a with ring above>rd, Klaus Hermann Maier-Hein, O. Morin, Henning M<latin small letter u with diaeresis>ller, S. Napel, C. Nioche, F. Orlhac, Sarthak Pati, E. Pfaehler, A. Rahmim, Arvind Rao, J. Scherer, M. Siddique, N. Sijtsema, J. Socarras Fernandez, E. Spezi, R. Steenbakkers, S. Tanadini-Lang, D. Thorwarth, E. Troost, T. Upadhaya, V. Valentini, L. van Dijk, J. V. van Griethuysen, F. V. van Velden, P. Whybra, C. Richter, S. L<latin small letter o with diaeresis>ck | 2016 | Radiology | pages 191145 | doi 10.1148/radiol.2020191145 | arXiv 1612.07003 | Semantic Scholar 41dfe7b56b3009500dad81a348cd39941cdfb716 | open access https://research.rug.nl/files/119920642/The_Image_Biomarker_Standardization_Initiative_Standardized_Quantitative_Radiomics_for_High_Throughput_Image_based_Phenotyping.pdf
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, traverso2018repeatability

Command: `python3 lookup resolve '10.1016/j.ijrobp.2018.05.053'`

```
Crossref: ratio 1.00: Repeatability and Reproducibility of Radiomic Features: A Systematic Review | Alberto Traverso, Leonard Wee, Andre Dekker, Robert Gillies | 2018 | International Journal of Radiation Oncology*Biology*Physics | vol 102 | no 4 | pages 1143--1158 | doi 10.1016/j.ijrobp.2018.05.053
OpenAlex: ratio 1.00: Repeatability and Reproducibility of Radiomic Features: A Systematic Review | Alberto Traverso, Leonard Wee, Andre L.A.J. Dekker, Robert J. Gillies | 2018 | International Journal of Radiation Oncology*Biology*Physics | vol 102 | no 4 | pages 1143--1158 | doi 10.1016/j.ijrobp.2018.05.053 | OpenAlex W2806986802 | open access http://www.redjournal.org/article/S0360301618309052/pdf
Semantic Scholar: ratio 1.00: Repeatability and Reproducibility of Radiomic Features: A Systematic Review | A. Traverso, L. Wee, A. Dekker, R. Gillies | 2018 | International Journal of Radiation Oncology, Biology, Physics | vol 102 | pages 1143--1158 | doi 10.1016/j.ijrobp.2018.05.053 | Semantic Scholar 422bdddb34b4ed581591381de4c7cd6445d25a22 | open access http://www.redjournal.org/article/S0360301618309052/pdf
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, shiri2020repeatability

Command: `python3 lookup resolve '10.1002/mp.14368'`

```
Crossref: ratio 1.00: Repeatability of radiomic features in magnetic resonance imaging of glioblastoma: Test<en dash>retest and image registration analyses | Isaac Shiri, Ghasem Hajianfar, Ahmad Sohrabi, Hamid Abdollahi, Sajad P. Shayesteh, Parham Geramifar, Habib Zaidi, Mehrdad Oveisi, Arman Rahmim | 2020 | Medical Physics | vol 47 | no 9 | pages 4265--4280 | doi 10.1002/mp.14368
OpenAlex: ratio 1.00: Repeatability of radiomic features in magnetic resonance imaging of glioblastoma: Test<en dash>retest and image registration analyses | Isaac Shiri, Ghasem Hajianfar, Ahmad Sohrabi, Hamid Abdollahi, Sajad P. Shayesteh, Parham Geramifar, Habib Zaidi, Mehrdad Oveisi, Arman Rahmim | 2020 | Medical Physics | vol 47 | no 9 | pages 4265--4280 | doi 10.1002/mp.14368 | OpenAlex W3039802208 | open access https://onlinelibrary.wiley.com/doi/pdfdirect/10.1002/mp.14368
Semantic Scholar: ratio 1.00: Repeatability of Radiomic Features in Magnetic Resonance Imaging of Glioblastoma: Test-Retest and Image Registration Analyses. | Isaac Shiri, G. Hajianfar, A. Sohrabi, H. Abdollahi, S. P. Shayesteh, P. Geramifar, H. Zaidi, M. Oveisi, A. Rahmim | 2020 | Medical Physics (Lancaster) | doi 10.1002/mp.14368 | Semantic Scholar 6f8d796c8ea6ad39fae6975f8622b922b65ef01b | open access https://onlinelibrary.wiley.com/doi/pdfdirect/10.1002/mp.14368
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, poirot2022robustness

Command: `python3 lookup resolve '10.1038/s41598-022-20703-9'`

```
Crossref: ratio 1.00: Robustness of radiomics to variations in segmentation methods in multimodal brain MRI | M. G. Poirot, M. W. A. Caan, H. G. Ruhe, A. Bj<latin small letter o with stroke>rnerud, I. Groote, L. Reneman, H. A. Marquering | 2022 | Scientific Reports | vol 12 | no 1 | doi 10.1038/s41598-022-20703-9
OpenAlex: ratio 1.00: Robustness of radiomics to variations in segmentation methods in multimodal brain MRI | Maarten G. Poirot, Matthan W.A. Caan, Henricus Gerardus Ruh<latin small letter e with acute>, Atle Bj<latin small letter o with stroke>rnerud, Inge Rasmus Groote, Liesbeth Reneman, Henk A. Marquering | 2022 | Scientific Reports | vol 12 | no 1 | pages 16712--16712 | doi 10.1038/s41598-022-20703-9 | OpenAlex W4302292929 | open access https://www.nature.com/articles/s41598-022-20703-9.pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, ronneberger2015unet

Command: `python3 lookup resolve '10.1007/978-3-319-24574-4_28'`

```
Crossref: ratio 1.00: U-Net: Convolutional Networks for Biomedical Image Segmentation | Olaf Ronneberger, Philipp Fischer, Thomas Brox | 2015 | Lecture Notes in Computer Science | pages 234--241 | doi 10.1007/978-3-319-24574-4_28
OpenAlex: ratio 1.00: U-Net: Convolutional Networks for Biomedical Image Segmentation | Olaf Ronneberger, Philipp Fischer, Thomas Brox | 2015 | Lecture notes in computer science | pages 234--241 | doi 10.1007/978-3-319-24574-4_28 | OpenAlex W1901129140 | open access https://link.springer.com/content/pdf/10.1007/978-3-319-24574-4_28.pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, kamnitsas2017efficient

Command: `python3 lookup resolve '10.1016/j.media.2016.10.004'`

```
Crossref: ratio 1.00: Efficient multi-scale 3D CNN with fully connected CRF for accurate brain lesion segmentation | Konstantinos Kamnitsas, Christian Ledig, Virginia F.J. Newcombe, Joanna P. Simpson, Andrew D. Kane, David K. Menon, Daniel Rueckert, Ben Glocker | 2017 | Medical Image Analysis | vol 36 | pages 61--78 | doi 10.1016/j.media.2016.10.004
OpenAlex: ratio 1.00: Efficient multi-scale 3D CNN with fully connected CRF for accurate brain lesion segmentation | Konstantinos Kamnitsas, Christian Ledig, Virginia Newcombe, Joanna P. Simpson, Andrew D. Kane, David Krishna Menon, Daniel Rueckert, Ben Glocker | 2016 | Medical Image Analysis | vol 36 | pages 61--78 | doi 10.1016/j.media.2016.10.004 | OpenAlex W2301358467 | open access https://www.sciencedirect.com/science/article/pii/S1361841516301839/pdf
Semantic Scholar: ratio 1.00: Efficient multi<hyphen>scale 3D CNN with fully connected CRF for accurate brain lesion segmentation | K. Kamnitsas, C. Ledig, V. Newcombe, Joanna P. Simpson, A. D. Kane, D. Menon, D. Rueckert, Ben Glocker | 2016 | Medical Image Anal. | vol 36 | pages 61<en dash>78 | doi 10.1016/j.media.2016.10.004 | arXiv 1603.05959 | Semantic Scholar 7c2bcf6f32b05a04cd3444c030db743e5666af88 | open access https://www.sciencedirect.com/science/article/pii/S1361841516301839/pdf
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, menze2015brats

Command: `python3 lookup resolve '10.1109/TMI.2014.2377694'`

```
Crossref: ratio 1.00: The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS) | Bjoern H. Menze, Andras Jakab, Stefan Bauer, Jayashree Kalpathy-Cramer, Keyvan Farahani, Justin Kirby, Yuliya Burren, Nicole Porz, Johannes Slotboom, Roland Wiest, Levente Lanczi, Elizabeth Gerstner, Marc-Andre Weber, Tal Arbel, Brian B. Avants, Nicholas Ayache, Patricia Buendia, D. Louis Collins, Nicolas Cordier, Jason J. Corso, Antonio Criminisi, Tilak Das, Herve Delingette, Cagatay Demiralp, Christopher R. Durst, Michel Dojat, Senan Doyle, Joana Festa, Florence Forbes, Ezequiel Geremia, Ben Glocker, Polina Golland, Xiaotao Guo, Andac Hamamci, Khan M. Iftekharuddin, Raj Jena, Nigel M. John, Ender Konukoglu, Danial Lashkari, Jose Antonio Mariz, Raphael Meier, Sergio Pereira, Doina Precup, Stephen J. Price, Tammy Riklin Raviv, Syed M. S. Reza, Michael Ryan, Duygu Sarikaya, Lawrence Schwartz, Hoo-Chang Shin, Jamie Shotton, Carlos A. Silva, Nuno Sousa, Nagesh K. Subbanna, Gabor Szekely, Thomas J. Taylor, Owen M. Thomas, Nicholas J. Tustison, Gozde Unal, Flor Vasseur, Max Wintermark, Dong Hye Ye, Liang Zhao, Binsheng Zhao, Darko Zikic, Marcel Prastawa, Mauricio Reyes, Koen Van Leemput | 2015 | IEEE Transactions on Medical Imaging | vol 34 | no 10 | pages 1993--2024 | doi 10.1109/tmi.2014.2377694
OpenAlex: ratio 1.00: The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS) | Bjoern H. Menze, Jakab Andr<latin small letter a with acute>s, Stefan Bauer, Jayashree Kalpathy<en dash>Cramer, Keyvan Farahani, Justin Kirby, Yuliya Burren, Nicole Porz, Johannes Slotboom, Roland Wiest, Levente L<latin small letter a with acute>nczi, Elizabeth Robins Gerstner, Marc<hyphen>Andr<latin small letter e with acute> Weber, Tal Arbel, Brian Avants, Nicholas Ayache, Patricia Buendia, D. Louis Collins, Nicolas Cordier, Jason J. Corso, Antonio Criminisi, Tilak Das, Herv<latin small letter e with acute> Delingette, <latin capital letter c with cedilla>a<latin small letter g with breve>atay Demiralp, Christopher R. Durst, Michel Dojat, Senan Doyle, Joana Festa, Florence Forbes, Ezequiel Geremia, Ben Glocker, Polina Golland, Xiaotao Guo, Anda<latin small letter c with cedilla> Hamamc<latin small letter dotless i>, Khan M. Iftekharuddin, R. Jena, Nigel John, Ender Konuko<latin small letter g with breve>lu, Danial Lashkari, Jos<latin small letter e with acute> Ant<latin small letter o with acute>nio Mariz, Raphael Meier, S<latin small letter e with acute>rgio Pereira, Doina Precup, Stephen John Price, Tammy Riklin Raviv, Syed M. S. Reza, Michael J. Ryan, Duygu Sar<latin small letter dotless i>kaya, Lawrence Howard Schwartz, Hoo-Chang Shin, Jamie Shotton, Carlos A. Silva, Nuno Sousa, Nagesh K. Subbanna, G<latin small letter a with acute>bor J. Sz<latin small letter e with acute>kely, Thomas J. Taylor, Owen Thomas, Nicholas James Tustison, G<latin small letter o with diaeresis>zde <latin capital letter u with diaeresis>nal, Flor Vasseur, Max Wintermark, Dong Hye Ye, Liang Zhao, Binsheng Zhao, Darko Zikic, Marcel W. Prastawa, Mauricio Reyes, Koen Van Leemput | 2014 | IEEE Transactions on Medical Imaging | vol 34 | no 10 | pages 1993--2024 | doi 10.1109/tmi.2014.2377694 | OpenAlex W1641498739 | open access https://ieeexplore.ieee.org/ielx7/42/7283692/06975210.pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, isensee2021nnunet

Command: `python3 lookup resolve '10.1038/s41592-020-01008-z'`

```
Crossref: ratio 1.00: nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation | Fabian Isensee, Paul F. Jaeger, Simon A. A. Kohl, Jens Petersen, Klaus H. Maier-Hein | 2020 | Nature Methods | vol 18 | no 2 | pages 203--211 | doi 10.1038/s41592-020-01008-z
OpenAlex: ratio 1.00: nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation | Fabian Isensee, Paul F. Jaeger, Simon A. A. Kohl, Jens Petersen, Klaus H. Maier-Hein | 2020 | Nature Methods | vol 18 | no 2 | pages 203--211 | doi 10.1038/s41592-020-01008-z | OpenAlex W3014974815 | open access https://arxiv.org/pdf/1904.08128
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, gramfort2015fast

Command: `python3 lookup resolve '10.1007/978-3-319-19992-4_20'`

```
Crossref: ratio 1.00: Fast Optimal Transport Averaging of Neuroimaging Data | A. Gramfort, G. Peyr<latin small letter e with acute>, M. Cuturi | 2015 | Lecture Notes in Computer Science | pages 261--272 | doi 10.1007/978-3-319-19992-4_20
OpenAlex: ratio 1.00: Fast Optimal Transport Averaging of Neuroimaging Data | Alexandre Gramfort, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2015 | Lecture notes in computer science | vol 24 | pages 261--272 | doi 10.1007/978-3-319-19992-4_20 | OpenAlex W2111725927 | open access https://arxiv.org/pdf/1503.08596
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, su2015shape

Command: `python3 lookup resolve '10.1007/978-3-319-19992-4_32'`

```
Crossref: ratio 1.00: Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis | Zhengyu Su, Wei Zeng, Yalin Wang, Zhong-Lin Lu, Xianfeng Gu | 2015 | Lecture Notes in Computer Science | pages 411--423 | doi 10.1007/978-3-319-19992-4_32
OpenAlex: ratio 1.00: Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis | Zhengyu Su, Wei Zeng, Yalin Wang, Zhong<hyphen>Lin Lu, Xianfeng David Gu | 2015 | Lecture notes in computer science | vol 24 | pages 411--423 | doi 10.1007/978-3-319-19992-4_32 | OpenAlex W1919720529 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4527322
Semantic Scholar: ratio 1.00: Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis | Zhengyu Su, W. Zeng, Y. Wang, Zhong-Lin Lu, X. Gu | 2015 | Information Processing in Medical Imaging | vol 24 | pages 411--423 | doi 10.1007/978-3-319-19992-4_32 | Semantic Scholar b2ef0bf744cddba8fa7008fbc7818f845966cca7 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4527322
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, bazeille2019local

Command: `python3 lookup resolve '10.1007/978-3-030-20351-1_18'`

```
Crossref: ratio 1.00: Local Optimal Transport for Functional Brain Template Estimation | T. Bazeille, H. Richard, H. Janati, B. Thirion | 2019 | Lecture Notes in Computer Science | pages 237--248 | doi 10.1007/978-3-030-20351-1_18
OpenAlex: ratio 1.00: Local Optimal Transport for Functional Brain Template Estimation | Thomas Bazeille, H. Richard, Hicham Janati, Bertrand Thirion | 2019 | Lecture notes in computer science | pages 237--248 | doi 10.1007/978-3-030-20351-1_18 | OpenAlex W2946207497 | open access https://hal.archives-ouvertes.fr/hal-02278663/file/Local_optimal_transport_for_functional_brain_template_estimation.pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, thual2022aligning

Command: `python3 lookup resolve '10.52202/068431-1584'`

```
Crossref: ratio 1.00: Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein | Alexis Thual, Quang Huy Tran, Tatiana Zemskova, Nicolas Courty, R<latin small letter e with acute>mi Flamary, Stanislas Dehaene, Bertrand Thirion | 2022 | Advances in Neural Information Processing Systems 35 | pages 21792--21804 | doi 10.52202/068431-1584
OpenAlex: ratio 1.00: Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein | Alexis Thual, Quang Huy Tran, Tatiana Zemskova, Nicolas Courty, R<latin small letter e with acute>mi Flamary, Stanislas Dehaene, Bertrand Thirion | 2022 | neural information processing systems | pages 21792--21804 | doi 10.52202/068431-1584 | OpenAlex W7133227349
Semantic Scholar: ratio 1.00: Aligning individual brains with fused unbalanced Gromov Wasserstein | Alexis Thual, Quang-Huy Tran, <cyrillic capital letter te>. <cyrillic capital letter pe>. <cyrillic capital letter ze><cyrillic small letter ie><cyrillic small letter em><cyrillic small letter es><cyrillic small letter ka><cyrillic small letter o><cyrillic small letter ve><cyrillic small letter a>, N. Courty, R<latin small letter e with acute>mi Flamary, S. Dehaene, B. Thirion | 2022 | Neural Information Processing Systems | doi 10.52202/068431-1584 | arXiv 2206.09398 | Semantic Scholar d67dcbf457ce55336f5c6c5c4c996ca3fda0d477
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, dadashkarimi2023carot

Command: `python3 lookup resolve '10.1016/j.media.2023.102864'`

```
Crossref: ratio 1.00: Cross Atlas Remapping via Optimal Transport (CAROT): Creating connectomes for different atlases when raw data is not available | Javid Dadashkarimi, Amin Karbasi, Qinghao Liang, Matthew Rosenblatt, Stephanie Noble, Maya Foster, Raimundo Rodriguez, Brendan Adkinson, Jean Ye, Huili Sun, Chris Camp, Michael Farruggia, Link Tejavibulya, Wei Dai, Rongtao Jiang, Angeliki Pollatou, Dustin Scheinost | 2023 | Medical Image Analysis | vol 88 | pages 102864 | doi 10.1016/j.media.2023.102864
OpenAlex: ratio 0.95: Cross Atlas Remapping via Optimal Transport (CAROT): Creating connectomes for any atlas when raw data is not available | Javid Dadashkarimi, Amin Karbasi, Qinghao Liang, Matthew Rosenblatt, Stephanie Noble, Maya L. Foster, Raimundo X. Rodriguez, Brendan D. Adkinson, Jean Ye, Huili Sun, Chris Camp, Michael Farruggia, Link Tejavibulya, Wei Dai, Rongtao Jiang, Angeliki Pollatou, Dustin Scheinost | 2022 | Medical Image Analysis | vol 88 | pages 102864--102864 | doi 10.1016/j.media.2023.102864 | OpenAlex W4379879414 | open access https://www.sciencedirect.com/science/article/am/pii/S136184152300124X
Semantic Scholar: ratio 1.00: Cross Atlas Remapping via Optimal Transport (CAROT): Creating connectomes for different atlases when raw data is not available | J. Dadashkarimi, Amin Karbasi, Qing-Hao Liang, M. Rosenblatt, S. Noble, Maya L. Foster, R. Rodriguez, B. Adkinson, Jean Ye, Hui-Li Sun, C. Camp, Michael C. Farruggia, Link Tejavibulya, Wei Dai, Rong-Tao Jiang, A. Pollatou, D. Scheinost | 2023 | Medical Image Anal. | vol 88 | pages 102864--102864 | doi 10.1016/j.media.2023.102864 | Semantic Scholar cea68dc22bbea44c66cadd0c2d1d2bce2dbc60bf | open access https://www.sciencedirect.com/science/article/am/pii/S136184152300124X
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, gong2026robust

Command: `python3 lookup resolve '10.3389/fonc.2025.1700447'`

```
Crossref: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Hanying Gong, Jie Luo, Shufan Mao, Yanchen Gong, Yu Lu, Jian Ding, Xiang Zhu | 2026 | Frontiers in Oncology | vol 15 | doi 10.3389/fonc.2025.1700447
OpenAlex: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Hanying Gong, Jun Luo, Shufan Mao, Yanchen Gong, Yu Lu, Jian Ding, Xiang Zhu | 2026 | Frontiers in Oncology | vol 15 | pages 1700447--1700447 | doi 10.3389/fonc.2025.1700447 | OpenAlex W7126042104 | open access https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1700447/pdf
Semantic Scholar: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Han-Ying Gong, Jie Luo, Shufan Mao, Yanan Gong, Yu Lu, Jian Ding, Xiang Zhu | 2026 | Frontiers in Oncology | vol 15 | doi 10.3389/fonc.2025.1700447 | Semantic Scholar 6a61c6836e5159c5e80d457fa948bd2ab017feb3 | open access https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1700447/pdf
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, chen2021aminn

Command: `python3 lookup resolve '10.1007/978-3-030-87240-3_72'`

```
Crossref: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jianan Chen, Helen M. C. Cheung, Laurent Milot, Anne L. Martel | 2021 | Lecture Notes in Computer Science | pages 752--761 | doi 10.1007/978-3-030-87240-3_72
OpenAlex: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jianan Chen, Helen Cheung, Laurent M. Milot, Anne Louise Martel | 2021 | Lecture notes in computer science | pages 752--761 | doi 10.1007/978-3-030-87240-3_72 | OpenAlex W3202344381
Semantic Scholar: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jia-Nan Chen, H. Cheung, L. Milot, Anne L. Martel | 2020 | International Conference on Medical Image Computing and Computer-Assisted Intervention | pages 752--761 | doi 10.1007/978-3-030-87240-3_72 | arXiv 2012.06875 | Semantic Scholar 6ede03256f54d773b3ba822e4824a8f0416b18a1
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, prabhakar2023selfpruning

Command: `python3 lookup resolve '10.1007/978-3-031-43993-3_22'`

```
Crossref: ratio 1.00: Self-pruning Graph Neural Network for Predicting Inflammatory Disease Activity in Multiple Sclerosis from Brain MR Images | Chinmay Prabhakar, Hongwei Bran Li, Johannes C. Paetzold, Timo Loehr, Chen Niu, Mark M<latin small letter u with diaeresis>hlau, Daniel Rueckert, Benedikt Wiestler, Bjoern Menze | 2023 | Lecture Notes in Computer Science | pages 226--236 | doi 10.1007/978-3-031-43993-3_22
OpenAlex: ratio 1.00: Self-pruning Graph Neural Network for Predicting Inflammatory Disease Activity in Multiple Sclerosis from Brain MR Images | Chinmay Prabhakar, Hongwei Li, Johannes Christian Paetzold, Timo Loehr, Chen Niu, Mark M<latin small letter u with diaeresis>hlau, Daniel Rueckert, Benedikt Wiestler, Bjoern H. Menze | 2023 | Lecture notes in computer science | pages 226--236 | doi 10.1007/978-3-031-43993-3_22 | OpenAlex W4387211084 | open access https://arxiv.org/pdf/2308.16863
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, gutierrezbecker2021discriminative

Command: `python3 lookup resolve '10.1016/j.media.2020.101852'`

```
Crossref: ratio 1.00: Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks | Benjam<latin small letter i with acute>n Guti<latin small letter e with acute>rrez-Becker, Ignacio Sarasua, Christian Wachinger | 2021 | Medical Image Analysis | vol 67 | pages 101852 | doi 10.1016/j.media.2020.101852
OpenAlex: ratio 1.00: Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks | Benjam<latin small letter i with acute>n Guti<latin small letter e with acute>rrez-Becker, Ignacio Saras<latin small letter u with acute>a, Christian Wachinger | 2020 | Medical Image Analysis | vol 67 | pages 101852--101852 | doi 10.1016/j.media.2020.101852 | OpenAlex W3092480895 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841520302164
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, chen2022white

Command: `python3 lookup resolve '10.1007/978-3-031-16431-6_17'`

```
Crossref: ratio 1.00: White Matter Tracts are Point Clouds: Neuropsychological Score Prediction and Critical Region Localization via Geometric Deep Learning | Yuqian Chen, Fan Zhang, Chaoyi Zhang, Tengfei Xue, Leo R. Zekelman, Jianzhong He, Yang Song, Nikos Makris, Yogesh Rathi, Alexandra J. Golby, Weidong Cai, Lauren J. O<right single quotation mark>Donnell | 2022 | Lecture Notes in Computer Science | pages 174--184 | doi 10.1007/978-3-031-16431-6_17
OpenAlex: ratio 1.00: White Matter Tracts are Point Clouds: Neuropsychological Score Prediction and Critical Region Localization via Geometric Deep Learning | Yuqian Chen, Fan Zhang, Chaoyi Zhang, Tengfei Xue, Leo Zekelman, Jianzhong He, Yang Song, Nikos Makris, Yogesh Rathi, Alexandra J. Golby, Weidong Cai, Lauren J. O<right single quotation mark>Donnell | 2022 | Lecture notes in computer science | pages 174--184 | doi 10.1007/978-3-031-16431-6_17 | OpenAlex W4284879865 | open access https://arxiv.org/pdf/2207.02402
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, beetz2023shape

Command: `python3 lookup resolve '10.1109/embc40787.2023.10340878'`

```
Crossref: ratio 1.00: 3D Shape-Based Myocardial Infarction Prediction Using Point Cloud Classification Networks | Marcel Beetz, Yilong Yang, Abhirup Banerjee, Lei Li, Vicente Grau | 2023 | 2023 45th Annual International Conference of the IEEE Engineering in Medicine &amp; Biology Society (EMBC) | pages 1--4 | doi 10.1109/embc40787.2023.10340878
OpenAlex: ratio 1.00: 3D Shape-Based Myocardial Infarction Prediction Using Point Cloud Classification Networks | Marcel Beetz, Yilong Yang, Abhirup Banerjee, Lei Li, Vicente Grau | 2023 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC) | vol 2023 | pages 1--4 | doi 10.1109/embc40787.2023.10340878 | OpenAlex W4389542902 | open access https://ora.ox.ac.uk/objects/uuid:3d74cf55-6626-4af7-a261-45927118be4a/files/s8049g6327
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, carneiro2017automated

Command: `python3 lookup resolve '10.1109/tmi.2017.2751523'`

```
Crossref: ratio 1.00: Automated Analysis of Unregistered Multi-View Mammograms With Deep Learning | Gustavo Carneiro, Jacinto Nascimento, Andrew P. Bradley | 2017 | IEEE Transactions on Medical Imaging | vol 36 | no 11 | pages 2355--2365 | doi 10.1109/tmi.2017.2751523
OpenAlex: ratio 1.00: Automated Analysis of Unregistered Multi-View Mammograms With Deep Learning | Gustavo Carneiro, Jacinto C. Nascimento, Andrew Peter Bradley | 2017 | IEEE Transactions on Medical Imaging | vol 36 | no 11 | pages 2355--2365 | doi 10.1109/tmi.2017.2751523 | OpenAlex W2755855890 | open access https://eprints.qut.edu.au/114146/1/tmi_multimodal_2.pdf
Semantic Scholar: ratio 1.00: Automated Analysis of Unregistered Multi-View Mammograms With Deep Learning | G. Carneiro, Jacinto C. Nascimento, A. Bradley | 2017 | IEEE Transactions on Medical Imaging | vol 36 | pages 2355--2365 | doi 10.1109/TMI.2017.2751523 | Semantic Scholar b73319bc622a14d34d90c8ea453c64ef5779e086 | open access https://eprints.qut.edu.au/114146/1/tmi_multimodal_2.pdf
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, dong2024selfsupervised

Command: `python3 lookup resolve '10.1016/j.isci.2024.109004'`

```
Crossref: ratio 1.00: A self-supervised learning approach for registration agnostic imaging models with 3D brain CTA | Yingjun Dong, Samiksha Pachade, Xiaomin Liang, Sunil A. Sheth, Luca Giancardo | 2024 | iScience | vol 27 | no 3 | pages 109004 | doi 10.1016/j.isci.2024.109004
OpenAlex: ratio 1.00: A self-supervised learning approach for registration agnostic imaging models with 3D brain CTA | Yingjun Dong, Samiksha Pachade, Xiaomin Liang, Sunil A. Sheth, Luca Giancardo | 2024 | iScience | vol 27 | no 3 | pages 109004--109004 | doi 10.1016/j.isci.2024.109004 | OpenAlex W4391450968 | open access https://doi.org/10.1016/j.isci.2024.109004
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### theme 4, dalca2019learning

Command: `python3 lookup resolve '1908.02738'`

```
Crossref: not found
OpenAlex: ratio 1.00: Learning Conditional Deformable Templates with Convolutional Networks | Adrian Vasile Dalca, Marianne Rakic, John V. Guttag, Mert Rory Sabuncu | 2019 | arXiv (Cornell University) | vol 32 | pages 804--816 | doi 10.48550/arxiv.1908.02738 | arXiv 1908.02738 | OpenAlex W2965946035 | open access https://arxiv.org/pdf/1908.02738
Semantic Scholar: ratio 1.00: Learning Conditional Deformable Templates with Convolutional Networks | Adrian V. Dalca, Marianne Rakic, J. Guttag, M. Sabuncu | 2019 | Neural Information Processing Systems | vol abs/1908.02738 | doi 10.48550/arXiv.1908.02738 | arXiv 1908.02738 | Semantic Scholar 17c5e70bce680af4498f4fe2b5f2c64bdeb35053
arXiv: ratio 1.00: Learning Conditional Deformable Templates with Convolutional Networks | Adrian V. Dalca, Marianne Rakic, John Guttag, Mert R. Sabuncu | 2019 | arXiv 1908.02738
```

Exit status: 0

### theme 4, shen2021accurate

Command: `python3 lookup resolve '2111.00648'`

```
Crossref: not found
OpenAlex: ratio 1.00: Accurate Point Cloud Registration with Robust Optimal Transport | Zhengyang Shen, Jean Feydy, Peirong Liu, Ariel H. Curiale, R. San Jos<latin small letter e with acute> Est<latin small letter e with acute>par, Ra<latin small letter u with acute>l San Jo<latin small letter s with acute>e Est<latin small letter e with acute>par, Marc Niethammer | 2021 | PubMed | vol 34 | pages 5373--5389 | doi 10.48550/arxiv.2111.00648 | arXiv 2111.00648 | OpenAlex W3214180234 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13474259/
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Accurate Point Cloud Registration with Robust Optimal Transport | Zhengyang Shen, Jean Feydy, Peirong Liu, Ariel Hern<latin small letter a with acute>n Curiale, Ruben San Jose Estepar, Raul San Jose Estepar, Marc Niethammer | 2021 | arXiv 2111.00648
```

Exit status: 0

### theme 4, chen2022injective

Command: `python3 lookup resolve '2203.04964'`

```
Crossref: not found
OpenAlex: ratio 1.00: Metastatic Cancer Outcome Prediction with Injective Multiple Instance Pooling | Jianan Chen, Anne Louise Martel | 2022 | arXiv (Cornell University) | doi 10.48550/arxiv.2203.04964 | arXiv 2203.04964 | OpenAlex W4221154709 | open access https://arxiv.org/pdf/2203.04964
Semantic Scholar: ratio 1.00: Metastatic Cancer Outcome Prediction with Injective Multiple Instance Pooling | Jianan Chen, Anne L. Martel | 2022 | arXiv.org | vol abs/2203.04964 | doi 10.48550/arXiv.2203.04964 | arXiv 2203.04964 | Semantic Scholar e764e677cc864fb944129219d40495a15ac7c7a3 | open access http://arxiv.org/pdf/2203.04964
arXiv: ratio 1.00: Metastatic Cancer Outcome Prediction with Injective Multiple Instance Pooling | Jianan Chen, Anne L. Martel | 2022 | arXiv 2203.04964
```

Exit status: 0

### theme 4, mazelet2026learning

Command: `python3 lookup resolve '2605.20883'`

```
Crossref: not found
OpenAlex: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2605.20883 | arXiv 2605.20883 | OpenAlex W7161973664 | open access https://arxiv.org/pdf/2605.20883
Semantic Scholar: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv.org | vol abs/2605.20883 | doi 10.48550/arXiv.2605.20883 | arXiv 2605.20883 | Semantic Scholar 932daed15a6e652d64deee16cde7602386c7e063
arXiv: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv 2605.20883
```

Exit status: 0

### theme 4, qahqaie2026unbalanced

Command: `python3 lookup resolve '2602.09933'`

```
Crossref: not found
OpenAlex: ratio 1.00: Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors | Melika Qahqaie, Dominik Neumann, Tobias Heimann, Andreas Maier, Veronika A. Zimmer | 2026 | IEEE International Symposium on Biomedical Imaging (ISBI) | pages 1--4 | doi 10.1109/isbi61048.2026.11516053 | OpenAlex W7161792725 | open access https://arxiv.org/pdf/2602.09933
Semantic Scholar: ratio 1.00: Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors | Melika Qahqaie, D. Neumann, T. Heimann, A. Maier, Veronika A. M. Zimmer | 2026 | IEEE International Symposium on Biomedical Imaging | pages 1--4 | doi 10.1109/ISBI61048.2026.11516053 | arXiv 2602.09933 | Semantic Scholar 63b626e5debc3e636866c5faa73952b606e53433 | open access https://arxiv.org/pdf/2602.09933
arXiv: ratio 1.00: Unbalanced optimal transport for robust longitudinal lesion evolution with registration-aware and appearance-guided priors | Melika Qahqaie, Dominik Neumann, Tobias Heimann, Andreas Maier, Veronika A. Zimmer | 2026 | arXiv 2602.09933
```

Exit status: 0


## Identifier check of the merge run's added and changed entries

The merge run added 5 sources and changed or added identifiers on 3 entries. Each is resolved on its DOI, else its arXiv ID. Result: every identifier prints a matching index record (ratio 1.00), none provably fails. For chen2026brainpicm, OpenAlex prints a version of record, doi 10.1007/978-3-032-38069-2_44 (Lecture Notes in Computer Science, pages 461--471), which goes to the merge search agent.

### gachon2025low

Command: `python3 lookup resolve '10.1002/cyto.a.24918'`

```
Crossref: ratio 1.00: Low Dimensional Representation of Multi<hyphen>Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia | Erell Gachon, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot, Elsa Cazelles, Audrey Bidet, Jean<hyphen>Philippe Vial, Pierre<hyphen>Yves Dumas, Aguirre Mimoun | 2025 | Cytometry Part A | vol 107 | no 2 | pages 126--139 | doi 10.1002/cyto.a.24918
OpenAlex: ratio 1.00: Low Dimensional Representation of Multi<hyphen>Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia | Erell Gachon, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot, Elsa Cazelles, Audrey Bidet, Jean Vial, Pierre<hyphen>Yves Dumas, Aguirre Mimoun | 2025 | Cytometry Part A | vol 107 | no 2 | pages 126--139 | doi 10.1002/cyto.a.24918 | OpenAlex W4408161545 | open access https://doi.org/10.1002/cyto.a.24918
Semantic Scholar: ratio 1.00: Low Dimensional Representation of Multi<hyphen>Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia | E. Gachon, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot, Elsa Cazelles, A. Bidet, J. Vial, P. Dumas, A. Mimoun | 2024 | Cytometry Part A | vol 107 | doi 10.1002/cyto.a.24918 | arXiv 2407.17329 | Semantic Scholar eeda175edefd8c88a47f023d8f5b659a634e7fb5 | open access https://doi.org/10.1002/cyto.a.24918
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### bae2024hognet

Command: `python3 lookup resolve '10.1007/978-3-031-72086-4_30'`

```
Crossref: ratio 1.00: HoG-Net: Hierarchical Multi-organ Graph Network for Head and Neck Cancer Recurrence Prediction from CT Images | Joseph Bae, Saarthak Kapse, Lei Zhou, Kartik Mani, Prateek Prasanna | 2024 | Lecture Notes in Computer Science | pages 317--327 | doi 10.1007/978-3-031-72086-4_30
OpenAlex: ratio 1.00: HoG-Net: Hierarchical Multi-organ Graph Network for Head and Neck Cancer Recurrence Prediction from CT Images | Joseph Bae, Saarthak Kapse, Lei Zhou, Kartik Mani, Prateek Prasanna | 2024 | Lecture notes in computer science | pages 317--327 | doi 10.1007/978-3-031-72086-4_30 | OpenAlex W4403088675
Semantic Scholar: ratio 1.00: HoG-Net: Hierarchical Multi-organ Graph Network for Head and Neck Cancer Recurrence Prediction from CT Images | Joseph Bae, Saarthak Kapse, Lei Zhou, K. Mani, P. Prasanna | 2024 | International Conference on Medical Image Computing and Computer-Assisted Intervention | pages 317--327 | doi 10.1007/978-3-031-72086-4_30 | Semantic Scholar 096905005e8f12fa89d2ed6897f544b0fe0d1e26
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### alberb2026automated

Command: `python3 lookup resolve '2603.10216'`

```
Crossref: not found
OpenAlex: ratio 1.00: An Automated Radiomics Framework for Postoperative Survival Prediction in Colorectal Liver Metastases using Preoperative MRI | Muhammad Alberb, Jianan Chen, Hossam El-Rewaidy, Paul Jack Karanicolas, Arun K. Seth, Yutaka Amemiya, Anne Martel, Helen Cheung | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2603.10216 | arXiv 2603.10216 | OpenAlex W7135073551 | open access https://arxiv.org/pdf/2603.10216
Semantic Scholar: ratio 1.00: An Automated Radiomics Framework for Postoperative Survival Prediction in Colorectal Liver Metastases using Preoperative MRI | Muhammad Alberb, Jia-Nan Chen, Hossam El-Rewaidy, P. Karanicolas, Arun Seth, Y. Amemiya, Anne L. Martel, H. Cheung | 2026 | arXiv.org | vol abs/2603.10216 | doi 10.48550/arXiv.2603.10216 | arXiv 2603.10216 | Semantic Scholar 9ddd9d51fd9d7faf8565dfe525c60c4277ac59c4
arXiv: ratio 1.00: An Automated Radiomics Framework for Postoperative Survival Prediction in Colorectal Liver Metastases using Preoperative MRI | Muhammad Alberb, Jianan Chen, Hossam El-rewaidy, Paul Karanicolas, Arun Seth, Yutaka Amemiya, Anne Martel, Helen Cheung | 2026 | arXiv 2603.10216
```

Exit status: 0

### tian2026roam

Command: `python3 lookup resolve '2604.07298'`

```
Crossref: not found
OpenAlex: ratio 1.00: Region-Graph Optimal Transport Routing for Mixture-of-Experts Whole-Slide Image Classification | Xin Tian, Jiuliu Lu, Ephraim L. Tsalik, Bart Wanders, Colleen Knoth, Julian Knight | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2604.07298 | arXiv 2604.07298 | OpenAlex W7152448587 | open access https://arxiv.org/pdf/2604.07298
Semantic Scholar: ratio 1.00: Region-Graph Optimal Transport Routing for Mixture-of-Experts Whole-Slide Image Classification | Xin-Yu Tian, Jiu-Liu Lu, E. Tsalik, Bart Wanders, Colleen Knoth, J. Knight | 2026 | arXiv.org | vol abs/2604.07298 | doi 10.48550/arXiv.2604.07298 | arXiv 2604.07298 | Semantic Scholar 2bfe6ea150f83757cac84f1cb1341cecf5cdedee
arXiv: ratio 1.00: Region-Graph Optimal Transport Routing for Mixture-of-Experts Whole-Slide Image Classification | Xin Tian, Jiuliu Lu, Ephraim Tsalik, Bart Wanders, Colleen Knoth, Julian Knight | 2026 | arXiv 2604.07298
```

Exit status: 0

### chen2026brainpicm

Command: `python3 lookup resolve '2606.29695'`

```
Crossref: not found
OpenAlex: ratio 1.00: Progressive Self-supervised Learning with Individualized Community Assignment for Brain Network Analysis | Hairui Chen, Yanwu Yang, Jianfeng Cao, Hanyang Peng, Chenfei Ye, Ting Ma | 2026 | Lecture notes in computer science | pages 461--471 | doi 10.1007/978-3-032-38069-2_44 | OpenAlex W7166686538 | open access https://arxiv.org/pdf/2606.29695
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Progressive Self-Supervised Learning with Individualized Community Assignment for Brain Network Analysis | Hairui Chen, Yanwu Yang, Jianfeng Cao, Hanyang Peng, Chenfei Ye, Ting Ma | 2026 | arXiv 2606.29695
```

Exit status: 0

### thiery2023dlbcl

Command: `python3 lookup resolve '10.1007/978-3-031-47425-5_10'`

```
Crossref: ratio 1.00: Graph-Based Multimodal Multi-lesion DLBCL Treatment Response Prediction from PET Images | Oriane Thiery, Mira Rizkallah, Cl<latin small letter e with acute>ment Bailly, Caroline Bodet-Milin, Emmanuel Itti, Ren<latin small letter e with acute>-Olivier Casasnovas, Steven Le Gouill, Thomas Carlier, Diana Mateus | 2023 | Lecture Notes in Computer Science | pages 103--112 | doi 10.1007/978-3-031-47425-5_10
OpenAlex: ratio 1.00: Graph-Based Multimodal Multi-lesion DLBCL Treatment Response Prediction from PET Images | Oriane Thiery, Mira Rizkallah, Cl<latin small letter e with acute>ment Bailly, Caroline Bodet<hyphen>Milin, Emmanuel Itti, Olivier Casasnovas, Steven Le Gouill, Thomas Carlier, Diana Mateus | 2023 | Lecture notes in computer science | vol 14394 | pages 103--112 | doi 10.1007/978-3-031-47425-5_10 | OpenAlex W4387995849 | open access https://arxiv.org/pdf/2310.16863
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### qahqaie2026unbalanced

Command: `python3 lookup resolve '10.1109/ISBI61048.2026.11516053'`

```
Crossref: ratio 1.00: Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors | Melika Qahqaie, Dominik Neumann, Tobias Heimann, Andreas Maier, Veronika A. Zimmer | 2026 | 2026 IEEE 23rd International Symposium on Biomedical Imaging (ISBI) | pages 1--4 | doi 10.1109/isbi61048.2026.11516053
OpenAlex: ratio 1.00: Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors | Melika Qahqaie, Dominik Neumann, Tobias Heimann, Andreas Maier, Veronika A. Zimmer | 2026 | IEEE International Symposium on Biomedical Imaging (ISBI) | pages 1--4 | doi 10.1109/isbi61048.2026.11516053 | OpenAlex W7161792725 | open access https://arxiv.org/pdf/2602.09933
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

### gutierrezbecker2021discriminative

Command: `python3 lookup resolve '2010.00820'`

```
Crossref: not found
OpenAlex: ratio 1.00: Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks | Benjam<latin small letter i with acute>n Guti<latin small letter e with acute>rrez-Becker, Ignacio Saras<latin small letter u with acute>a, Christian Wachinger | 2020 | Medical Image Analysis | vol 67 | pages 101852--101852 | doi 10.1016/j.media.2020.101852 | OpenAlex W3092480895 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841520302164
Semantic Scholar: ratio 1.00: Discriminative and Generative Models for Anatomical Shape Analysison Point Clouds with Deep Neural Networks | B. Guti<latin small letter e with acute>rrez-Becker, Ignacio Saras<latin small letter u with acute>a, C. Wachinger | 2020 | Medical Image Anal. | vol 67 | pages 101852 | doi 10.48550/arXiv.2010.00820 | arXiv 2010.00820 | Semantic Scholar 06b0279c363ae4e1a793a84550f2e4326379202f | open access https://doi.org/10.1016/j.media.2020.101852
arXiv: ratio 1.00: Discriminative and Generative Models for Anatomical Shape Analysison Point Clouds with Deep Neural Networks | Benjamin Gutierrez Becker, Ignacio Sarasua, Christian Wachinger | 2020 | arXiv 2010.00820
```

Exit status: 0


## Identifier check of the corrected entry (literature review item 5)

### chen2026brainpicm (version of record)

Command: `python3 lookup resolve '10.1007/978-3-032-38069-2_44'`

```
Crossref: ratio 1.00: Progressive Self-supervised Learning with Individualized Community Assignment for Brain Network Analysis | Hairui Chen, Yanwu Yang, Jianfeng Cao, Hanyang Peng, Chenfei Ye, Ting Ma | 2026 | Lecture Notes in Computer Science | pages 461--471 | doi 10.1007/978-3-032-38069-2_44
OpenAlex: ratio 1.00: Progressive Self-supervised Learning with Individualized Community Assignment for Brain Network Analysis | Hairui Chen, Yanwu Yang, Jianfeng Cao, Hanyang Peng, Chenfei Ye, Ting Ma | 2026 | Lecture notes in computer science | pages 461--471 | doi 10.1007/978-3-032-38069-2_44 | OpenAlex W7166686538 | open access https://arxiv.org/pdf/2606.29695
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```

Exit status: 0

