# Checks

## Steps 12, before the citation compliance agent: the lookup script cite-keys

```
$ python3 the lookup script cite-keys '../../manuscript/main.tex' '../../manuscript/refs.bib'
unused: Wagner_2020
unused: https://doi.org/10.5281/zenodo.4916206
unused: Mehari_2022
unused: arxiv_2005_13249
exit status: 1
```

## Steps 12, before the citation compliance agent: the lookup script check-urls

```
$ python3 the lookup script check-urls '../../manuscript/main.tex' '../../manuscript/refs.bib'
Kashou_2021: 403 https://doi.org/10.1136/heartjnl-2021-319385, ratio 1.00 against Crossref
Wolf_1991: 403 https://doi.org/10.1161/01.str.22.8.983, ratio 1.00 against Crossref
Schnabel_2015: 200 https://doi.org/10.1016/s0140-6736(14)61774-8, ratio 1.00 against Crossref
Alonso_2013: 403 https://doi.org/10.1161/jaha.112.000102, ratio 1.00 against Crossref
Raghunath_2021: 403 https://doi.org/10.1161/circulationaha.120.047829, ratio 1.00 against Crossref
Khurshid_2022: 403 https://doi.org/10.1161/circulationaha.121.057480, ratio 1.00 against Crossref
Van_Gelder_2024: 403 https://doi.org/10.1093/eurheartj/ehae176, ratio 1.00 against Crossref
Tsiartas_2025: 403 https://doi.org/10.1136/openhrt-2025-003657, ratio 1.00 against Crossref
Saiz_Vivo_2025: 403 https://doi.org/10.1093/ehjdh/ztaf144, ratio 1.00 against Crossref
Arends_2026: 403 https://doi.org/10.1093/ehjdh/ztag038, ratio 1.00 against Crossref
Rudin_2019: 200 https://doi.org/10.1038/s42256-019-0048-x, ratio 1.00 against Crossref
De_Lathauwer_2008: 403 https://doi.org/10.1137/070690729, ratio 1.00 against Crossref
Ye_2020: 200 https://doi.org/10.1016/j.neunet.2020.05.034, ratio 1.00 against Crossref
Faes_2024: 202 https://doi.org/10.1109/tnnls.2022.3216589, ratio 1.00 against Crossref
Valasakis_2026: 403 https://doi.org/10.1093/eurheartj/ehag785.598, ratio 1.00 against Crossref
Attia_2019: 200 https://doi.org/10.1016/s0140-6736(19)31721-0, ratio 1.00 against Crossref
Yuan_2023: 403 https://doi.org/10.1001/jamacardio.2023.3701, ratio 1.00 against Crossref
Jabbour_2024: 403 https://doi.org/10.1093/eurheartj/ehae595, ratio 1.00 against Crossref
Sau_2026: 200 https://doi.org/10.1016/j.hrthm.2025.08.024, ratio 1.00 against Crossref
Zeidaabadi_2026: 200 https://doi.org/10.1016/j.hrthm.2025.10.024, ratio 1.00 against Crossref
Habineza_2023: 200 https://doi.org/10.1016/j.jelectrocard.2023.09.011, ratio 1.00 against Crossref
Ribeiro_2020: 200 https://doi.org/10.1038/s41467-020-15432-4, ratio 1.00 against Crossref
Riek_2026: 200 https://doi.org/10.1016/j.hroo.2026.09.012, ratio 1.00 against Crossref
Schnabel_2009: 200 https://doi.org/10.1016/s0140-6736(09)60443-8, ratio 1.00 against Crossref
Cheng_2009: 403 https://doi.org/10.1001/jama.2009.888, ratio 1.00 against Crossref
Magnani_2015: 200 https://doi.org/10.1016/j.ahj.2014.10.009, ratio 1.00 against Crossref
Christopoulos_2020: 403 https://doi.org/10.1161/circep.120.009355, ratio 0.87 against Crossref
Khurshid_2025: 200 https://doi.org/10.1038/s41746-025-02164-2, ratio 1.00 against Crossref
Biton_2021: 403 https://doi.org/10.1093/ehjdh/ztab071, ratio 1.00 against Crossref
arxiv_1810_03292: 200 https://arxiv.org/abs/1810.03292
arxiv_1806_10758: 200 https://arxiv.org/abs/1806.10758
Wagner_2024: 200 https://doi.org/10.1016/j.compbiomed.2024.108525, ratio 1.00 against Crossref
arxiv_2007_04612: 200 https://arxiv.org/abs/2007.04612
arxiv_2106_13314: 200 https://arxiv.org/abs/2106.13314
arxiv_2205_10268: 200 https://arxiv.org/abs/2205.10268
arxiv_2507_16761: 200 https://arxiv.org/abs/2507.16761
arxiv_2504_02667: 200 https://arxiv.org/abs/2504.02667
Patlatzoglou_2025: 200 https://doi.org/10.1038/s41746-025-02122-y, ratio 1.00 against Crossref
arxiv_2511_04292: 200 https://arxiv.org/abs/2511.04292
Kolda_2009: 403 https://doi.org/10.1137/07070111x, ratio 1.00 against Crossref
Goulart_2020: 202 https://doi.org/10.1109/tsp.2020.2985591, ratio 1.00 against Crossref
https://doi.org/10.5281/zenodo.22227432: 200 https://doi.org/10.5281/ZENODO.22227432, ratio 1.00 against OpenAlex
https://doi.org/10.13026/4nqg-sb35: 200 https://doi.org/10.13026/4NQG-SB35, ratio 1.00 against OpenAlex
Cox_1972: 403 https://doi.org/10.1111/j.2517-6161.1972.tb00899.x, ratio 1.00 against Crossref
Katzman_2018: 200 https://doi.org/10.1186/s12874-018-0482-1, ratio 1.00 against Crossref
Johnson_2023: 200 https://doi.org/10.1038/s41597-022-01899-x, ratio 1.00 against Crossref
Rix_2012: 403 https://doi.org/10.3109/14017431.2012.673728, ratio 1.00 against Crossref
Vickers_2006: 403 https://doi.org/10.1177/0272989x06295361, ratio 1.00 against Crossref
Collins_2024: 403 https://doi.org/10.1136/bmj-2023-078378, ratio 1.00 against Crossref
Zeiler_2014: 200 https://doi.org/10.1007/978-3-319-10590-1_53, ratio 1.00 against Crossref
Ivanovs_2021: 200 https://doi.org/10.1016/j.patrec.2021.06.030, ratio 1.00 against Crossref
arxiv_1702_04595: 200 https://arxiv.org/abs/1702.04595
_imi__2025: 200 https://doi.org/10.1038/s41598-025-09538-2, ratio 1.00 against Crossref
McKeen_2025: 403 https://doi.org/10.1093/jamiaopen/ooaf122, ratio 1.00 against Crossref
Pfeifer_2026: 200 https://doi.org/10.1016/j.hrthm.2026.03.1956, ratio 1.00 against Crossref
Magnani_2013: 403 https://doi.org/10.1161/circep.112.975342, ratio 0.76 against Crossref
Tanaka_2021: 200 https://doi.org/10.1007/s00380-021-01805-2, ratio 0.99 against Crossref
Yogeswaran_2025: 403 https://doi.org/10.1161/jaha.125.043590, ratio 1.00 against Crossref
Emmanuela_2026: 200 https://doi.org/10.3897/bgcardio.32.e213539, ratio 1.00 against Crossref
Ostrowska_2022: 200 https://doi.org/10.1536/ihj.21-797, ratio 0.82 against Crossref
Goette_2016: 403 https://doi.org/10.1016/j.joa.2016.05.002, ratio 1.00 against Crossref
Maezono_2025: 403 https://doi.org/10.1093/ehjopen/oeaf126, ratio 1.00 against Crossref
Yao_2019: 200 https://doi.org/10.2147/clep.s206267, ratio 1.00 against Crossref
Malmo_2016: 200 https://doi.org/10.2147/clep.s103346, ratio 1.00 against Crossref
exit status: 1
```

## Steps 12, after the citation patches: the lookup script cite-keys

```
$ python3 the lookup script cite-keys '../../manuscript/main.tex' '../../manuscript/refs.bib'
unused: Wagner_2020
unused: https://doi.org/10.5281/zenodo.4916206
unused: Mehari_2022
unused: arxiv_2005_13249
exit status: 1
```

## Steps 12, after the citation patches: the lookup script check-urls

```
$ python3 the lookup script check-urls '../../manuscript/main.tex' '../../manuscript/refs.bib'
Kashou_2021: 403 https://doi.org/10.1136/heartjnl-2021-319385, ratio 1.00 against Crossref
Wolf_1991: 403 https://doi.org/10.1161/01.str.22.8.983, ratio 1.00 against Crossref
Schnabel_2015: 200 https://doi.org/10.1016/s0140-6736(14)61774-8, ratio 1.00 against Crossref
Alonso_2013: 403 https://doi.org/10.1161/jaha.112.000102, ratio 1.00 against Crossref
Raghunath_2021: 403 https://doi.org/10.1161/circulationaha.120.047829, ratio 1.00 against Crossref
Khurshid_2022: 403 https://doi.org/10.1161/circulationaha.121.057480, ratio 1.00 against Crossref
Van_Gelder_2024: 403 https://doi.org/10.1093/eurheartj/ehae176, ratio 1.00 against Crossref
Tsiartas_2025: 403 https://doi.org/10.1136/openhrt-2025-003657, ratio 1.00 against Crossref
Saiz_Vivo_2025: 403 https://doi.org/10.1093/ehjdh/ztaf144, ratio 1.00 against Crossref
Arends_2026: 403 https://doi.org/10.1093/ehjdh/ztag038, ratio 1.00 against Crossref
Rudin_2019: 200 https://doi.org/10.1038/s42256-019-0048-x, ratio 1.00 against Crossref
De_Lathauwer_2008: 403 https://doi.org/10.1137/070690729, ratio 1.00 against Crossref
Ye_2020: 200 https://doi.org/10.1016/j.neunet.2020.05.034, ratio 1.00 against Crossref
Faes_2024: 202 https://doi.org/10.1109/tnnls.2022.3216589, ratio 1.00 against Crossref
Valasakis_2026: 403 https://doi.org/10.1093/eurheartj/ehag785.598, ratio 1.00 against Crossref
Attia_2019: 200 https://doi.org/10.1016/s0140-6736(19)31721-0, ratio 1.00 against Crossref
Yuan_2023: 403 https://doi.org/10.1001/jamacardio.2023.3701, ratio 1.00 against Crossref
Jabbour_2024: 403 https://doi.org/10.1093/eurheartj/ehae595, ratio 1.00 against Crossref
Sau_2026: 200 https://doi.org/10.1016/j.hrthm.2025.08.024, ratio 1.00 against Crossref
Zeidaabadi_2026: 200 https://doi.org/10.1016/j.hrthm.2025.10.024, ratio 1.00 against Crossref
Habineza_2023: 200 https://doi.org/10.1016/j.jelectrocard.2023.09.011, ratio 1.00 against Crossref
Ribeiro_2020: 200 https://doi.org/10.1038/s41467-020-15432-4, ratio 1.00 against Crossref
Riek_2026: 200 https://doi.org/10.1016/j.hroo.2026.09.012, ratio 1.00 against Crossref
Schnabel_2009: 200 https://doi.org/10.1016/s0140-6736(09)60443-8, ratio 1.00 against Crossref
Cheng_2009: 403 https://doi.org/10.1001/jama.2009.888, ratio 1.00 against Crossref
Magnani_2015: 200 https://doi.org/10.1016/j.ahj.2014.10.009, ratio 1.00 against Crossref
Christopoulos_2020: 403 https://doi.org/10.1161/circep.120.009355, ratio 0.87 against Crossref
Khurshid_2025: 200 https://doi.org/10.1038/s41746-025-02164-2, ratio 1.00 against Crossref
Biton_2021: 403 https://doi.org/10.1093/ehjdh/ztab071, ratio 1.00 against Crossref
arxiv_1810_03292: 200 https://doi.org/10.48550/arXiv.1810.03292, ratio 1.00 against OpenAlex
arxiv_1806_10758: 200 https://doi.org/10.48550/arXiv.1806.10758, ratio 1.00 against OpenAlex
Wagner_2024: 200 https://doi.org/10.1016/j.compbiomed.2024.108525, ratio 1.00 against Crossref
arxiv_2007_04612: 200 https://doi.org/10.48550/arXiv.2007.04612, ratio 1.00 against OpenAlex
arxiv_2106_13314: 200 https://doi.org/10.48550/arXiv.2106.13314, ratio 1.00 against OpenAlex
arxiv_2205_10268: 200 https://arxiv.org/abs/2205.10268
arxiv_2507_16761: 200 https://arxiv.org/abs/2507.16761
arxiv_2504_02667: 200 https://doi.org/10.48550/arXiv.2504.02667, ratio 1.00 against OpenAlex
Patlatzoglou_2025: 200 https://doi.org/10.1038/s41746-025-02122-y, ratio 1.00 against Crossref
arxiv_2511_04292: 200 https://doi.org/10.48550/arXiv.2511.04292, ratio 1.00 against OpenAlex
Kolda_2009: 403 https://doi.org/10.1137/07070111x, ratio 1.00 against Crossref
Goulart_2020: 202 https://doi.org/10.1109/tsp.2020.2985591, ratio 1.00 against Crossref
https://doi.org/10.5281/zenodo.22227432: 200 https://doi.org/10.5281/ZENODO.22227432, ratio 1.00 against OpenAlex
https://doi.org/10.13026/4nqg-sb35: 200 https://doi.org/10.13026/4NQG-SB35, ratio 1.00 against OpenAlex
Cox_1972: 403 https://doi.org/10.1111/j.2517-6161.1972.tb00899.x, ratio 1.00 against Crossref
Katzman_2018: 200 https://doi.org/10.1186/s12874-018-0482-1, ratio 1.00 against Crossref
Johnson_2023: 200 https://doi.org/10.1038/s41597-022-01899-x, ratio 1.00 against Crossref
Rix_2012: 403 https://doi.org/10.3109/14017431.2012.673728, ratio 1.00 against Crossref
Vickers_2006: 403 https://doi.org/10.1177/0272989x06295361, ratio 1.00 against Crossref
Collins_2024: 403 https://doi.org/10.1136/bmj-2023-078378, ratio 1.00 against Crossref
Zeiler_2014: 200 https://doi.org/10.1007/978-3-319-10590-1_53, ratio 1.00 against Crossref
Ivanovs_2021: 200 https://doi.org/10.1016/j.patrec.2021.06.030, ratio 1.00 against Crossref
arxiv_1702_04595: 200 https://doi.org/10.48550/arXiv.1702.04595, ratio 1.00 against OpenAlex
_imi__2025: 200 https://doi.org/10.1038/s41598-025-09538-2, ratio 1.00 against Crossref
McKeen_2025: 403 https://doi.org/10.1093/jamiaopen/ooaf122, ratio 1.00 against Crossref
Pfeifer_2026: 200 https://doi.org/10.1016/j.hrthm.2026.03.1956, ratio 1.00 against Crossref
Magnani_2013: 403 https://doi.org/10.1161/circep.112.975342, ratio 0.76 against Crossref
Tanaka_2021: 200 https://doi.org/10.1007/s00380-021-01805-2, ratio 0.99 against Crossref
Yogeswaran_2025: 403 https://doi.org/10.1161/jaha.125.043590, ratio 1.00 against Crossref
Emmanuela_2026: 200 https://doi.org/10.3897/bgcardio.32.e213539, ratio 1.00 against Crossref
Ostrowska_2022: 200 https://doi.org/10.1536/ihj.21-797, ratio 0.82 against Crossref
Goette_2016: 403 https://doi.org/10.1016/j.joa.2016.05.002, ratio 1.00 against Crossref
Maezono_2025: 403 https://doi.org/10.1093/ehjopen/oeaf126, ratio 1.00 against Crossref
Yao_2019: 200 https://doi.org/10.2147/clep.s206267, ratio 0.97 against Crossref
Malmo_2016: 200 https://doi.org/10.2147/clep.s103346, ratio 1.00 against Crossref
exit status: 1
```

## Steps 12, after the citation patches: the lookup script quote-check

```
$ python3 the lookup script quote-check '/work/run/citation-report.md' '../../manuscript/refs.bib' '<a temporary folder>'
line 813: Johnson_2023, section on the patients table: found
line 816: Schnabel_2009, abstract: found
line 819: Cheng_2009, abstract: found
line 822: Magnani_2013, abstract: found
line 825: arxiv_1810_03292, abstract section: found
line 828: arxiv_1806_10758, section 1: found
line 831: Arends_2026, abstract: found
line 834: arxiv_1702_04595, section 3.1: found
line 835: arxiv_1702_04595, section 4: found
line 838: _imi__2025, abstract: found
line 841: arxiv_2106_13314, abstract section: found
line 844: Cheng_2009, abstract: found
line 847: Magnani_2013, abstract: found
line 850: https://doi.org/10.13026/4nqg-sb35, abstract: found
line 853: Johnson_2023, abstract section: found
exit status: 0
```

## Steps 12, expanded revision (after review 2): the lookup script cite-keys

```
$ python3 the lookup script cite-keys '../../manuscript/main.tex' '../../manuscript/refs.bib'
unused: Wagner_2020
unused: https://doi.org/10.5281/zenodo.4916206
unused: Mehari_2022
unused: arxiv_2005_13249
exit status: 1
```

## Steps 12, expanded revision (after review 2): the lookup script check-urls

```
$ python3 the lookup script check-urls '../../manuscript/main.tex' '../../manuscript/refs.bib'
Kashou_2021: 403 https://doi.org/10.1136/heartjnl-2021-319385, ratio 1.00 against Crossref
Wolf_1991: 403 https://doi.org/10.1161/01.str.22.8.983, ratio 1.00 against Crossref
Schnabel_2015: 200 https://doi.org/10.1016/s0140-6736(14)61774-8, ratio 1.00 against Crossref
Alonso_2013: 403 https://doi.org/10.1161/jaha.112.000102, ratio 1.00 against Crossref
Raghunath_2021: 403 https://doi.org/10.1161/circulationaha.120.047829, ratio 1.00 against Crossref
Khurshid_2022: 403 https://doi.org/10.1161/circulationaha.121.057480, ratio 1.00 against Crossref
Tsiartas_2025: 403 https://doi.org/10.1136/openhrt-2025-003657, ratio 1.00 against Crossref
Saiz_Vivo_2025: 403 https://doi.org/10.1093/ehjdh/ztaf144, ratio 1.00 against Crossref
Van_Gelder_2024: 403 https://doi.org/10.1093/eurheartj/ehae176, ratio 1.00 against Crossref
Arends_2026: 403 https://doi.org/10.1093/ehjdh/ztag038, ratio 1.00 against Crossref
Rudin_2019: 200 https://doi.org/10.1038/s42256-019-0048-x, ratio 1.00 against Crossref
De_Lathauwer_2008: 403 https://doi.org/10.1137/070690729, ratio 1.00 against Crossref
Ye_2020: 200 https://doi.org/10.1016/j.neunet.2020.05.034, ratio 1.00 against Crossref
Faes_2024: 202 https://doi.org/10.1109/tnnls.2022.3216589, ratio 1.00 against Crossref
Valasakis_2026: 403 https://doi.org/10.1093/eurheartj/ehag785.598, ratio 1.00 against Crossref
Attia_2019: 200 https://doi.org/10.1016/s0140-6736(19)31721-0, ratio 1.00 against Crossref
Yuan_2023: 403 https://doi.org/10.1001/jamacardio.2023.3701, ratio 1.00 against Crossref
Jabbour_2024: 403 https://doi.org/10.1093/eurheartj/ehae595, ratio 1.00 against Crossref
Sau_2026: 200 https://doi.org/10.1016/j.hrthm.2025.08.024, ratio 1.00 against Crossref
Zeidaabadi_2026: 200 https://doi.org/10.1016/j.hrthm.2025.10.024, ratio 1.00 against Crossref
Habineza_2023: 200 https://doi.org/10.1016/j.jelectrocard.2023.09.011, ratio 1.00 against Crossref
Ribeiro_2020: 200 https://doi.org/10.1038/s41467-020-15432-4, ratio 1.00 against Crossref
Riek_2026: 200 https://doi.org/10.1016/j.hroo.2026.09.012, ratio 1.00 against Crossref
Schnabel_2009: 200 https://doi.org/10.1016/s0140-6736(09)60443-8, ratio 1.00 against Crossref
Cheng_2009: 403 https://doi.org/10.1001/jama.2009.888, ratio 1.00 against Crossref
Magnani_2015: 200 https://doi.org/10.1016/j.ahj.2014.10.009, ratio 1.00 against Crossref
Christopoulos_2020: 403 https://doi.org/10.1161/circep.120.009355, ratio 0.87 against Crossref
Khurshid_2025: 200 https://doi.org/10.1038/s41746-025-02164-2, ratio 1.00 against Crossref
Biton_2021: 403 https://doi.org/10.1093/ehjdh/ztab071, ratio 1.00 against Crossref
arxiv_1810_03292: 200 https://doi.org/10.48550/arXiv.1810.03292, ratio 1.00 against OpenAlex
arxiv_1806_10758: 200 https://doi.org/10.48550/arXiv.1806.10758, ratio 1.00 against OpenAlex
Wagner_2024: 200 https://doi.org/10.1016/j.compbiomed.2024.108525, ratio 1.00 against Crossref
arxiv_2007_04612: 200 https://doi.org/10.48550/arXiv.2007.04612, ratio 1.00 against OpenAlex
arxiv_2106_13314: 200 https://doi.org/10.48550/arXiv.2106.13314, ratio 1.00 against OpenAlex
arxiv_2205_10268: 200 https://doi.org/10.48550/arXiv.2205.10268, ratio 1.00 against OpenAlex
arxiv_2507_16761: 200 https://doi.org/10.48550/arXiv.2507.16761, ratio 1.00 against OpenAlex
arxiv_2504_02667: 200 https://doi.org/10.48550/arXiv.2504.02667, ratio 1.00 against OpenAlex
Patlatzoglou_2025: 200 https://doi.org/10.1038/s41746-025-02122-y, ratio 1.00 against Crossref
arxiv_2511_04292: 200 https://doi.org/10.48550/arXiv.2511.04292, ratio 1.00 against OpenAlex
Kolda_2009: 403 https://doi.org/10.1137/07070111x, ratio 1.00 against Crossref
Goulart_2020: 202 https://doi.org/10.1109/tsp.2020.2985591, ratio 1.00 against Crossref
https://doi.org/10.5281/zenodo.22227432: 200 https://doi.org/10.5281/ZENODO.22227432, ratio 1.00 against OpenAlex
https://doi.org/10.13026/4nqg-sb35: 200 https://doi.org/10.13026/4NQG-SB35, ratio 1.00 against OpenAlex
Cox_1972: 403 https://doi.org/10.1111/j.2517-6161.1972.tb00899.x, ratio 1.00 against Crossref
Katzman_2018: 200 https://doi.org/10.1186/s12874-018-0482-1, ratio 1.00 against Crossref
Johnson_2023: 200 https://doi.org/10.1038/s41597-022-01899-x, ratio 1.00 against Crossref
Rix_2012: 403 https://doi.org/10.3109/14017431.2012.673728, ratio 1.00 against Crossref
Vickers_2006: 403 https://doi.org/10.1177/0272989x06295361, ratio 1.00 against Crossref
Collins_2024: 403 https://doi.org/10.1136/bmj-2023-078378, ratio 1.00 against Crossref
Zeiler_2014: 200 https://doi.org/10.1007/978-3-319-10590-1_53, ratio 1.00 against Crossref
Ivanovs_2021: 200 https://doi.org/10.1016/j.patrec.2021.06.030, ratio 1.00 against Crossref
arxiv_1702_04595: 200 https://doi.org/10.48550/arXiv.1702.04595, ratio 1.00 against OpenAlex
_imi__2025: 200 https://doi.org/10.1038/s41598-025-09538-2, ratio 1.00 against Crossref
McKeen_2025: 403 https://doi.org/10.1093/jamiaopen/ooaf122, ratio 1.00 against Crossref
Pfeifer_2026: 200 https://doi.org/10.1016/j.hrthm.2026.03.1956, ratio 1.00 against Crossref
Magnani_2013: 403 https://doi.org/10.1161/circep.112.975342, ratio 0.76 against Crossref
Tanaka_2021: 200 https://doi.org/10.1007/s00380-021-01805-2, ratio 0.99 against Crossref
Yogeswaran_2025: 403 https://doi.org/10.1161/jaha.125.043590, ratio 1.00 against Crossref
Emmanuela_2026: 200 https://doi.org/10.3897/bgcardio.32.e213539, ratio 1.00 against Crossref
Ostrowska_2022: 200 https://doi.org/10.1536/ihj.21-797, ratio 0.82 against Crossref
Goette_2016: 403 https://doi.org/10.1016/j.joa.2016.05.002, ratio 1.00 against Crossref
Maezono_2025: 403 https://doi.org/10.1093/ehjopen/oeaf126, ratio 1.00 against Crossref
Yao_2019: 200 https://doi.org/10.2147/clep.s206267, ratio 0.97 against Crossref
Malmo_2016: 200 https://doi.org/10.2147/clep.s103346, ratio 1.00 against Crossref
exit status: 1
```

## Steps 12, expanded revision: the lookup script quote-check on the new citation report (no patch was written, so cite-keys and check-urls stand as in the section above)

```
$ python3 the lookup script quote-check '/work/run/citation-report.md' '../../manuscript/refs.bib' '<a temporary folder>'
lines found: 231
exit status: 0
```

## After the D3 patches: the lookup script cite-keys

```
$ python3 the lookup script cite-keys '../../manuscript/main.tex' '../../manuscript/refs.bib'
unused: Wagner_2020
unused: https://doi.org/10.5281/zenodo.4916206
unused: Mehari_2022
unused: arxiv_2005_13249
exit status: 1
```

## After the D3 patches: the lookup script check-urls

```
$ python3 the lookup script check-urls '../../manuscript/main.tex' '../../manuscript/refs.bib'
Kashou_2021: 403 https://doi.org/10.1136/heartjnl-2021-319385, ratio 1.00 against Crossref
Wolf_1991: 403 https://doi.org/10.1161/01.str.22.8.983, ratio 1.00 against Crossref
Schnabel_2015: 200 https://doi.org/10.1016/s0140-6736(14)61774-8, ratio 1.00 against Crossref
Alonso_2013: 403 https://doi.org/10.1161/jaha.112.000102, ratio 1.00 against Crossref
Raghunath_2021: 403 https://doi.org/10.1161/circulationaha.120.047829, ratio 1.00 against Crossref
Khurshid_2022: 403 https://doi.org/10.1161/circulationaha.121.057480, ratio 1.00 against Crossref
Tsiartas_2025: 403 https://doi.org/10.1136/openhrt-2025-003657, ratio 1.00 against Crossref
Saiz_Vivo_2025: 403 https://doi.org/10.1093/ehjdh/ztaf144, ratio 1.00 against Crossref
Van_Gelder_2024: 403 https://doi.org/10.1093/eurheartj/ehae176, ratio 1.00 against Crossref
Arends_2026: 403 https://doi.org/10.1093/ehjdh/ztag038, ratio 1.00 against Crossref
Rudin_2019: 200 https://doi.org/10.1038/s42256-019-0048-x, ratio 1.00 against Crossref
De_Lathauwer_2008: 403 https://doi.org/10.1137/070690729, ratio 1.00 against Crossref
arxiv_2010_04963: 200 https://doi.org/10.48550/arXiv.2010.04963, ratio 1.00 against OpenAlex
Faes_2024: 202 https://doi.org/10.1109/tnnls.2022.3216589, ratio 1.00 against Crossref
Valasakis_2026: 403 https://doi.org/10.1093/eurheartj/ehag785.598, ratio 1.00 against Crossref
Attia_2019: 200 https://doi.org/10.1016/s0140-6736(19)31721-0, ratio 1.00 against Crossref
Yuan_2023: 403 https://doi.org/10.1001/jamacardio.2023.3701, ratio 1.00 against Crossref
Jabbour_2024: 403 https://doi.org/10.1093/eurheartj/ehae595, ratio 1.00 against Crossref
Sau_2026: 200 https://doi.org/10.1016/j.hrthm.2025.08.024, ratio 1.00 against Crossref
Zeidaabadi_2026: 200 https://doi.org/10.1016/j.hrthm.2025.10.024, ratio 1.00 against Crossref
Habineza_2023: 200 https://doi.org/10.1016/j.jelectrocard.2023.09.011, ratio 1.00 against Crossref
Ribeiro_2020: 200 https://doi.org/10.1038/s41467-020-15432-4, ratio 1.00 against Crossref
Riek_2026: 200 https://doi.org/10.1016/j.hroo.2026.09.012, ratio 1.00 against Crossref
Schnabel_2009: 200 https://doi.org/10.1016/s0140-6736(09)60443-8, ratio 1.00 against Crossref
Cheng_2009: 403 https://doi.org/10.1001/jama.2009.888, ratio 1.00 against Crossref
Magnani_2015: 200 https://doi.org/10.1016/j.ahj.2014.10.009, ratio 1.00 against Crossref
Christopoulos_2020: 403 https://doi.org/10.1161/circep.120.009355, ratio 0.87 against Crossref
Khurshid_2025: 200 https://doi.org/10.1038/s41746-025-02164-2, ratio 1.00 against Crossref
Biton_2021: 403 https://doi.org/10.1093/ehjdh/ztab071, ratio 1.00 against Crossref
arxiv_1810_03292: 200 https://doi.org/10.48550/arXiv.1810.03292, ratio 1.00 against OpenAlex
arxiv_1806_10758: 200 https://doi.org/10.48550/arXiv.1806.10758, ratio 1.00 against OpenAlex
Wagner_2024: 200 https://doi.org/10.1016/j.compbiomed.2024.108525, ratio 1.00 against Crossref
arxiv_2007_04612: 200 https://doi.org/10.48550/arXiv.2007.04612, ratio 1.00 against OpenAlex
arxiv_2106_13314: 200 https://doi.org/10.48550/arXiv.2106.13314, ratio 1.00 against OpenAlex
arxiv_2205_10268: 200 https://doi.org/10.48550/arXiv.2205.10268, ratio 1.00 against OpenAlex
arxiv_2507_16761: 200 https://doi.org/10.48550/arXiv.2507.16761, ratio 1.00 against OpenAlex
arxiv_2504_02667: 200 https://doi.org/10.48550/arXiv.2504.02667, ratio 1.00 against OpenAlex
Patlatzoglou_2025: 200 https://doi.org/10.1038/s41746-025-02122-y, ratio 1.00 against Crossref
arxiv_2511_04292: 200 https://doi.org/10.48550/arXiv.2511.04292, ratio 1.00 against OpenAlex
Kolda_2009: 403 https://doi.org/10.1137/07070111x, ratio 1.00 against Crossref
Goulart_2020: 202 https://doi.org/10.1109/tsp.2020.2985591, ratio 1.00 against Crossref
https://doi.org/10.5281/zenodo.22227432: 200 https://doi.org/10.5281/ZENODO.22227432, ratio 1.00 against OpenAlex
https://doi.org/10.13026/4nqg-sb35: 200 https://doi.org/10.13026/4NQG-SB35, ratio 1.00 against OpenAlex
Cox_1972: 403 https://doi.org/10.1111/j.2517-6161.1972.tb00899.x, ratio 1.00 against Crossref
Katzman_2018: 200 https://doi.org/10.1186/s12874-018-0482-1, ratio 1.00 against Crossref
Johnson_2023: 200 https://doi.org/10.1038/s41597-022-01899-x, ratio 1.00 against Crossref
Rix_2012: 403 https://doi.org/10.3109/14017431.2012.673728, ratio 1.00 against Crossref
Vickers_2006: 403 https://doi.org/10.1177/0272989x06295361, ratio 1.00 against Crossref
Collins_2024: 403 https://doi.org/10.1136/bmj-2023-078378, ratio 1.00 against Crossref
Zeiler_2014: 200 https://doi.org/10.1007/978-3-319-10590-1_53, ratio 1.00 against Crossref
Ivanovs_2021: 200 https://doi.org/10.1016/j.patrec.2021.06.030, ratio 1.00 against Crossref
arxiv_1702_04595: 200 https://doi.org/10.48550/arXiv.1702.04595, ratio 1.00 against OpenAlex
_imi__2025: 200 https://doi.org/10.1038/s41598-025-09538-2, ratio 1.00 against Crossref
McKeen_2025: 403 https://doi.org/10.1093/jamiaopen/ooaf122, ratio 1.00 against Crossref
Pfeifer_2026: 200 https://doi.org/10.1016/j.hrthm.2026.03.1956, ratio 1.00 against Crossref
Magnani_2013: 403 https://doi.org/10.1161/circep.112.975342, ratio 0.76 against Crossref
Tanaka_2021: 200 https://doi.org/10.1007/s00380-021-01805-2, ratio 0.99 against Crossref
Yogeswaran_2025: 403 https://doi.org/10.1161/jaha.125.043590, ratio 1.00 against Crossref
Emmanuela_2026: 200 https://doi.org/10.3897/bgcardio.32.e213539, ratio 1.00 against Crossref
Ostrowska_2022: 200 https://doi.org/10.1536/ihj.21-797, ratio 0.82 against Crossref
Goette_2016: 403 https://doi.org/10.1016/j.joa.2016.05.002, ratio 1.00 against Crossref
Maezono_2025: 403 https://doi.org/10.1093/ehjopen/oeaf126, ratio 1.00 against Crossref
Yao_2019: 200 https://doi.org/10.2147/clep.s206267, ratio 0.97 against Crossref
Malmo_2016: 200 https://doi.org/10.2147/clep.s103346, ratio 1.00 against Crossref
exit status: 1
```

## After the D4 patches: the lookup script cite-keys

```
$ python3 the lookup script cite-keys '../../manuscript/main.tex' '../../manuscript/refs.bib'
unused: Wagner_2020
unused: https://doi.org/10.5281/zenodo.4916206
unused: Mehari_2022
unused: arxiv_2005_13249
exit status: 1
```

## After the D4 patches: the lookup script check-urls

```
$ python3 the lookup script check-urls '../../manuscript/main.tex' '../../manuscript/refs.bib'
Kashou_2021: 403 https://doi.org/10.1136/heartjnl-2021-319385, ratio 1.00 against Crossref
Wolf_1991: 403 https://doi.org/10.1161/01.str.22.8.983, ratio 1.00 against Crossref
Schnabel_2015: 200 https://doi.org/10.1016/s0140-6736(14)61774-8, ratio 1.00 against Crossref
Alonso_2013: 403 https://doi.org/10.1161/jaha.112.000102, ratio 1.00 against Crossref
Raghunath_2021: 403 https://doi.org/10.1161/circulationaha.120.047829, ratio 1.00 against Crossref
Khurshid_2022: 403 https://doi.org/10.1161/circulationaha.121.057480, ratio 1.00 against Crossref
Tsiartas_2025: 403 https://doi.org/10.1136/openhrt-2025-003657, ratio 1.00 against Crossref
Saiz_Vivo_2025: 403 https://doi.org/10.1093/ehjdh/ztaf144, ratio 1.00 against Crossref
Van_Gelder_2024: 403 https://doi.org/10.1093/eurheartj/ehae176, ratio 1.00 against Crossref
Arends_2026: 403 https://doi.org/10.1093/ehjdh/ztag038, ratio 1.00 against Crossref
Rudin_2019: 200 https://doi.org/10.1038/s42256-019-0048-x, ratio 1.00 against Crossref
De_Lathauwer_2008: 403 https://doi.org/10.1137/070690729, ratio 1.00 against Crossref
arxiv_2010_04963: 200 https://doi.org/10.48550/arXiv.2010.04963, ratio 1.00 against OpenAlex
Faes_2024: 202 https://doi.org/10.1109/tnnls.2022.3216589, ratio 1.00 against Crossref
Valasakis_2026: 403 https://doi.org/10.1093/eurheartj/ehag785.598, ratio 1.00 against Crossref
Attia_2019: 200 https://doi.org/10.1016/s0140-6736(19)31721-0, ratio 1.00 against Crossref
Yuan_2023: 403 https://doi.org/10.1001/jamacardio.2023.3701, ratio 1.00 against Crossref
Jabbour_2024: 403 https://doi.org/10.1093/eurheartj/ehae595, ratio 1.00 against Crossref
Sau_2026: 200 https://doi.org/10.1016/j.hrthm.2025.08.024, ratio 1.00 against Crossref
Zeidaabadi_2026: 200 https://doi.org/10.1016/j.hrthm.2025.10.024, ratio 1.00 against Crossref
Habineza_2023: 200 https://doi.org/10.1016/j.jelectrocard.2023.09.011, ratio 1.00 against Crossref
Ribeiro_2020: 200 https://doi.org/10.1038/s41467-020-15432-4, ratio 1.00 against Crossref
Riek_2026: 200 https://doi.org/10.1016/j.hroo.2026.09.012, ratio 1.00 against Crossref
Schnabel_2009: 200 https://doi.org/10.1016/s0140-6736(09)60443-8, ratio 1.00 against Crossref
Cheng_2009: 403 https://doi.org/10.1001/jama.2009.888, ratio 1.00 against Crossref
Magnani_2015: 200 https://doi.org/10.1016/j.ahj.2014.10.009, ratio 1.00 against Crossref
Christopoulos_2020: 403 https://doi.org/10.1161/circep.120.009355, ratio 0.87 against Crossref
Khurshid_2025: 200 https://doi.org/10.1038/s41746-025-02164-2, ratio 1.00 against Crossref
Biton_2021: 403 https://doi.org/10.1093/ehjdh/ztab071, ratio 1.00 against Crossref
arxiv_1810_03292: 200 https://doi.org/10.48550/arXiv.1810.03292, ratio 1.00 against OpenAlex
arxiv_1806_10758: 200 https://doi.org/10.48550/arXiv.1806.10758, ratio 1.00 against OpenAlex
Wagner_2024: 200 https://doi.org/10.1016/j.compbiomed.2024.108525, ratio 1.00 against Crossref
arxiv_2007_04612: 200 https://doi.org/10.48550/arXiv.2007.04612, ratio 1.00 against OpenAlex
arxiv_2106_13314: 200 https://doi.org/10.48550/arXiv.2106.13314, ratio 1.00 against OpenAlex
arxiv_2205_10268: 200 https://doi.org/10.48550/arXiv.2205.10268, ratio 1.00 against OpenAlex
arxiv_2507_16761: 200 https://doi.org/10.48550/arXiv.2507.16761, ratio 1.00 against OpenAlex
arxiv_2504_02667: 200 https://doi.org/10.48550/arXiv.2504.02667, ratio 1.00 against OpenAlex
Patlatzoglou_2025: 200 https://doi.org/10.1038/s41746-025-02122-y, ratio 1.00 against Crossref
arxiv_2511_04292: 200 https://doi.org/10.48550/arXiv.2511.04292, ratio 1.00 against OpenAlex
Kolda_2009: 403 https://doi.org/10.1137/07070111x, ratio 1.00 against Crossref
Goulart_2020: 202 https://doi.org/10.1109/tsp.2020.2985591, ratio 1.00 against Crossref
https://doi.org/10.5281/zenodo.22227432: 200 https://doi.org/10.5281/ZENODO.22227432, ratio 1.00 against OpenAlex
https://doi.org/10.13026/4nqg-sb35: 200 https://doi.org/10.13026/4NQG-SB35, ratio 1.00 against OpenAlex
Cox_1972: 403 https://doi.org/10.1111/j.2517-6161.1972.tb00899.x, ratio 1.00 against Crossref
Katzman_2018: 200 https://doi.org/10.1186/s12874-018-0482-1, ratio 1.00 against Crossref
Johnson_2023: 200 https://doi.org/10.1038/s41597-022-01899-x, ratio 1.00 against Crossref
Rix_2012: 403 https://doi.org/10.3109/14017431.2012.673728, ratio 1.00 against Crossref
Vickers_2006: 403 https://doi.org/10.1177/0272989x06295361, ratio 1.00 against Crossref
Collins_2024: 403 https://doi.org/10.1136/bmj-2023-078378, ratio 1.00 against Crossref
Zeiler_2014: 200 https://doi.org/10.1007/978-3-319-10590-1_53, ratio 1.00 against Crossref
Ivanovs_2021: 200 https://doi.org/10.1016/j.patrec.2021.06.030, ratio 1.00 against Crossref
arxiv_1702_04595: 200 https://doi.org/10.48550/arXiv.1702.04595, ratio 1.00 against OpenAlex
_imi__2025: 200 https://doi.org/10.1038/s41598-025-09538-2, ratio 1.00 against Crossref
McKeen_2025: 403 https://doi.org/10.1093/jamiaopen/ooaf122, ratio 1.00 against Crossref
Pfeifer_2026: 200 https://doi.org/10.1016/j.hrthm.2026.03.1956, ratio 1.00 against Crossref
Magnani_2013: 403 https://doi.org/10.1161/circep.112.975342, ratio 0.76 against Crossref
Tanaka_2021: 200 https://doi.org/10.1007/s00380-021-01805-2, ratio 0.99 against Crossref
Yogeswaran_2025: 403 https://doi.org/10.1161/jaha.125.043590, ratio 1.00 against Crossref
Emmanuela_2026: 200 https://doi.org/10.3897/bgcardio.32.e213539, ratio 1.00 against Crossref
Ostrowska_2022: 200 https://doi.org/10.1536/ihj.21-797, ratio 0.82 against Crossref
Goette_2016: 403 https://doi.org/10.1016/j.joa.2016.05.002, ratio 1.00 against Crossref
Maezono_2025: 403 https://doi.org/10.1093/ehjopen/oeaf126, ratio 1.00 against Crossref
Yao_2019: 200 https://doi.org/10.2147/clep.s206267, ratio 0.97 against Crossref
Malmo_2016: 200 https://doi.org/10.2147/clep.s103346, ratio 1.00 against Crossref
exit status: 1
```

## Second expanded revision: the lookup script quote-check on the new citation report (no patch was written, so cite-keys and check-urls stand as in "After the D4 patches")

```
$ python3 the lookup script quote-check '/work/run/citation-report.md' '../../manuscript/refs.bib' '<a temporary folder>'
lines found: 244
exit status: 0
```

## After the D5 patches: the lookup script cite-keys

```
$ python3 the lookup script cite-keys '../../manuscript/main.tex' '../../manuscript/refs.bib'
unused: Wagner_2020
unused: https://doi.org/10.5281/zenodo.4916206
unused: Mehari_2022
unused: arxiv_2005_13249
exit status: 1
```

## After the D5 patches: the lookup script check-urls

```
$ python3 the lookup script check-urls '../../manuscript/main.tex' '../../manuscript/refs.bib'
Kashou_2021: 403 https://doi.org/10.1136/heartjnl-2021-319385, ratio 1.00 against Crossref
Wolf_1991: 403 https://doi.org/10.1161/01.str.22.8.983, ratio 1.00 against Crossref
Schnabel_2015: 200 https://doi.org/10.1016/s0140-6736(14)61774-8, ratio 1.00 against Crossref
Alonso_2013: 403 https://doi.org/10.1161/jaha.112.000102, ratio 1.00 against Crossref
Raghunath_2021: 403 https://doi.org/10.1161/circulationaha.120.047829, ratio 1.00 against Crossref
Khurshid_2022: 403 https://doi.org/10.1161/circulationaha.121.057480, ratio 1.00 against Crossref
Tsiartas_2025: 403 https://doi.org/10.1136/openhrt-2025-003657, ratio 1.00 against Crossref
Saiz_Vivo_2025: 403 https://doi.org/10.1093/ehjdh/ztaf144, ratio 1.00 against Crossref
Van_Gelder_2024: 403 https://doi.org/10.1093/eurheartj/ehae176, ratio 1.00 against Crossref
Arends_2026: 403 https://doi.org/10.1093/ehjdh/ztag038, ratio 1.00 against Crossref
Rudin_2019: 200 https://doi.org/10.1038/s42256-019-0048-x, ratio 1.00 against Crossref
De_Lathauwer_2008: 403 https://doi.org/10.1137/070690729, ratio 1.00 against Crossref
arxiv_2010_04963: 200 https://doi.org/10.48550/arXiv.2010.04963, ratio 1.00 against OpenAlex
Faes_2024: 202 https://doi.org/10.1109/tnnls.2022.3216589, ratio 1.00 against Crossref
Valasakis_2026: 403 https://doi.org/10.1093/eurheartj/ehag785.598, ratio 1.00 against Crossref
Attia_2019: 200 https://doi.org/10.1016/s0140-6736(19)31721-0, ratio 1.00 against Crossref
Yuan_2023: 403 https://doi.org/10.1001/jamacardio.2023.3701, ratio 1.00 against Crossref
Jabbour_2024: 403 https://doi.org/10.1093/eurheartj/ehae595, ratio 1.00 against Crossref
Sau_2026: 200 https://doi.org/10.1016/j.hrthm.2025.08.024, ratio 1.00 against Crossref
Zeidaabadi_2026: 200 https://doi.org/10.1016/j.hrthm.2025.10.024, ratio 1.00 against Crossref
Habineza_2023: 200 https://doi.org/10.1016/j.jelectrocard.2023.09.011, ratio 1.00 against Crossref
Ribeiro_2020: 200 https://doi.org/10.1038/s41467-020-15432-4, ratio 1.00 against Crossref
Riek_2026: 200 https://doi.org/10.1016/j.hroo.2026.09.012, ratio 1.00 against Crossref
Schnabel_2009: 200 https://doi.org/10.1016/s0140-6736(09)60443-8, ratio 1.00 against Crossref
Cheng_2009: 403 https://doi.org/10.1001/jama.2009.888, ratio 1.00 against Crossref
Magnani_2015: 200 https://doi.org/10.1016/j.ahj.2014.10.009, ratio 1.00 against Crossref
Christopoulos_2020: 403 https://doi.org/10.1161/circep.120.009355, ratio 0.87 against Crossref
Khurshid_2025: 200 https://doi.org/10.1038/s41746-025-02164-2, ratio 1.00 against Crossref
Biton_2021: 403 https://doi.org/10.1093/ehjdh/ztab071, ratio 1.00 against Crossref
arxiv_1810_03292: 200 https://doi.org/10.48550/arXiv.1810.03292, ratio 1.00 against OpenAlex
arxiv_1806_10758: 200 https://doi.org/10.48550/arXiv.1806.10758, ratio 1.00 against OpenAlex
Wagner_2024: 200 https://doi.org/10.1016/j.compbiomed.2024.108525, ratio 1.00 against Crossref
arxiv_2007_04612: 200 https://doi.org/10.48550/arXiv.2007.04612, ratio 1.00 against OpenAlex
arxiv_2106_13314: 200 https://doi.org/10.48550/arXiv.2106.13314, ratio 1.00 against OpenAlex
arxiv_2205_10268: 200 https://doi.org/10.48550/arXiv.2205.10268, ratio 1.00 against OpenAlex
arxiv_2507_16761: 200 https://doi.org/10.48550/arXiv.2507.16761, ratio 1.00 against OpenAlex
arxiv_2504_02667: 200 https://doi.org/10.48550/arXiv.2504.02667, ratio 1.00 against OpenAlex
Patlatzoglou_2025: 200 https://doi.org/10.1038/s41746-025-02122-y, ratio 1.00 against Crossref
arxiv_2511_04292: 200 https://doi.org/10.48550/arXiv.2511.04292, ratio 1.00 against OpenAlex
Kolda_2009: 403 https://doi.org/10.1137/07070111x, ratio 1.00 against Crossref
Goulart_2020: 202 https://doi.org/10.1109/tsp.2020.2985591, ratio 1.00 against Crossref
https://doi.org/10.5281/zenodo.22227432: 200 https://doi.org/10.5281/ZENODO.22227432, ratio 1.00 against OpenAlex
https://doi.org/10.13026/4nqg-sb35: 200 https://doi.org/10.13026/4NQG-SB35, ratio 1.00 against OpenAlex
Cox_1972: 403 https://doi.org/10.1111/j.2517-6161.1972.tb00899.x, ratio 1.00 against Crossref
Katzman_2018: 200 https://doi.org/10.1186/s12874-018-0482-1, ratio 1.00 against Crossref
Johnson_2023: 200 https://doi.org/10.1038/s41597-022-01899-x, ratio 1.00 against Crossref
Rix_2012: 403 https://doi.org/10.3109/14017431.2012.673728, ratio 1.00 against Crossref
Vickers_2006: 403 https://doi.org/10.1177/0272989x06295361, ratio 1.00 against Crossref
Collins_2024: 403 https://doi.org/10.1136/bmj-2023-078378, ratio 1.00 against Crossref
Zeiler_2014: 200 https://doi.org/10.1007/978-3-319-10590-1_53, ratio 1.00 against Crossref
Ivanovs_2021: 200 https://doi.org/10.1016/j.patrec.2021.06.030, ratio 1.00 against Crossref
arxiv_1702_04595: 200 https://doi.org/10.48550/arXiv.1702.04595, ratio 1.00 against OpenAlex
_imi__2025: 200 https://doi.org/10.1038/s41598-025-09538-2, ratio 1.00 against Crossref
McKeen_2025: 403 https://doi.org/10.1093/jamiaopen/ooaf122, ratio 1.00 against Crossref
Pfeifer_2026: 200 https://doi.org/10.1016/j.hrthm.2026.03.1956, ratio 1.00 against Crossref
Magnani_2013: 403 https://doi.org/10.1161/circep.112.975342, ratio 0.76 against Crossref
Tanaka_2021: 200 https://doi.org/10.1007/s00380-021-01805-2, ratio 0.99 against Crossref
Yogeswaran_2025: 403 https://doi.org/10.1161/jaha.125.043590, ratio 1.00 against Crossref
Emmanuela_2026: 200 https://doi.org/10.3897/bgcardio.32.e213539, ratio 1.00 against Crossref
Ostrowska_2022: 200 https://doi.org/10.1536/ihj.21-797, ratio 0.82 against Crossref
Goette_2016: 403 https://doi.org/10.1016/j.joa.2016.05.002, ratio 1.00 against Crossref
Maezono_2025: 403 https://doi.org/10.1093/ehjopen/oeaf126, ratio 1.00 against Crossref
Yao_2019: 200 https://doi.org/10.2147/clep.s206267, ratio 0.97 against Crossref
Malmo_2016: 200 https://doi.org/10.2147/clep.s103346, ratio 1.00 against Crossref
exit status: 1
```

## After the D6 patches: the lookup script cite-keys

```
$ python3 the lookup script cite-keys '../../manuscript/main.tex' '../../manuscript/refs.bib'
unused: Wagner_2020
unused: https://doi.org/10.5281/zenodo.4916206
unused: Mehari_2022
unused: arxiv_2005_13249
exit status: 1
```

## After the D6 patches: the lookup script check-urls

```
$ python3 the lookup script check-urls '../../manuscript/main.tex' '../../manuscript/refs.bib'
Kashou_2021: 403 https://doi.org/10.1136/heartjnl-2021-319385, ratio 1.00 against Crossref
Wolf_1991: 403 https://doi.org/10.1161/01.str.22.8.983, ratio 1.00 against Crossref
Schnabel_2015: 200 https://doi.org/10.1016/s0140-6736(14)61774-8, ratio 1.00 against Crossref
Alonso_2013: 403 https://doi.org/10.1161/jaha.112.000102, ratio 1.00 against Crossref
Raghunath_2021: 403 https://doi.org/10.1161/circulationaha.120.047829, ratio 1.00 against Crossref
Khurshid_2022: 403 https://doi.org/10.1161/circulationaha.121.057480, ratio 1.00 against Crossref
Tsiartas_2025: 403 https://doi.org/10.1136/openhrt-2025-003657, ratio 1.00 against Crossref
Saiz_Vivo_2025: 403 https://doi.org/10.1093/ehjdh/ztaf144, ratio 1.00 against Crossref
Van_Gelder_2024: 403 https://doi.org/10.1093/eurheartj/ehae176, ratio 1.00 against Crossref
Arends_2026: 403 https://doi.org/10.1093/ehjdh/ztag038, ratio 1.00 against Crossref
Rudin_2019: 200 https://doi.org/10.1038/s42256-019-0048-x, ratio 1.00 against Crossref
De_Lathauwer_2008: 403 https://doi.org/10.1137/070690729, ratio 1.00 against Crossref
arxiv_2010_04963: 200 https://doi.org/10.48550/arXiv.2010.04963, ratio 1.00 against OpenAlex
Faes_2024: 202 https://doi.org/10.1109/tnnls.2022.3216589, ratio 1.00 against Crossref
Valasakis_2026: 403 https://doi.org/10.1093/eurheartj/ehag785.598, ratio 1.00 against Crossref
Attia_2019: 200 https://doi.org/10.1016/s0140-6736(19)31721-0, ratio 1.00 against Crossref
Yuan_2023: 403 https://doi.org/10.1001/jamacardio.2023.3701, ratio 1.00 against Crossref
Jabbour_2024: 403 https://doi.org/10.1093/eurheartj/ehae595, ratio 1.00 against Crossref
Sau_2026: 200 https://doi.org/10.1016/j.hrthm.2025.08.024, ratio 1.00 against Crossref
Zeidaabadi_2026: 200 https://doi.org/10.1016/j.hrthm.2025.10.024, ratio 1.00 against Crossref
Habineza_2023: 200 https://doi.org/10.1016/j.jelectrocard.2023.09.011, ratio 1.00 against Crossref
Ribeiro_2020: 200 https://doi.org/10.1038/s41467-020-15432-4, ratio 1.00 against Crossref
Riek_2026: 200 https://doi.org/10.1016/j.hroo.2026.09.012, ratio 1.00 against Crossref
Schnabel_2009: 200 https://doi.org/10.1016/s0140-6736(09)60443-8, ratio 1.00 against Crossref
Cheng_2009: 403 https://doi.org/10.1001/jama.2009.888, ratio 1.00 against Crossref
Magnani_2015: 200 https://doi.org/10.1016/j.ahj.2014.10.009, ratio 1.00 against Crossref
Christopoulos_2020: 403 https://doi.org/10.1161/circep.120.009355, ratio 0.87 against Crossref
Khurshid_2025: 200 https://doi.org/10.1038/s41746-025-02164-2, ratio 1.00 against Crossref
Biton_2021: 403 https://doi.org/10.1093/ehjdh/ztab071, ratio 1.00 against Crossref
arxiv_1810_03292: 200 https://doi.org/10.48550/arXiv.1810.03292, ratio 1.00 against OpenAlex
arxiv_1806_10758: 200 https://doi.org/10.48550/arXiv.1806.10758, ratio 1.00 against OpenAlex
Wagner_2024: 200 https://doi.org/10.1016/j.compbiomed.2024.108525, ratio 1.00 against Crossref
arxiv_2007_04612: 200 https://doi.org/10.48550/arXiv.2007.04612, ratio 1.00 against OpenAlex
arxiv_2106_13314: 200 https://doi.org/10.48550/arXiv.2106.13314, ratio 1.00 against OpenAlex
arxiv_2205_10268: 200 https://doi.org/10.48550/arXiv.2205.10268, ratio 1.00 against OpenAlex
arxiv_2507_16761: 200 https://doi.org/10.48550/arXiv.2507.16761, ratio 1.00 against OpenAlex
arxiv_2504_02667: 200 https://doi.org/10.48550/arXiv.2504.02667, ratio 1.00 against OpenAlex
Patlatzoglou_2025: 200 https://doi.org/10.1038/s41746-025-02122-y, ratio 1.00 against Crossref
arxiv_2511_04292: 200 https://doi.org/10.48550/arXiv.2511.04292, ratio 1.00 against OpenAlex
Kolda_2009: 403 https://doi.org/10.1137/07070111x, ratio 1.00 against Crossref
Goulart_2020: 202 https://doi.org/10.1109/tsp.2020.2985591, ratio 1.00 against Crossref
https://doi.org/10.5281/zenodo.22227432: 200 https://doi.org/10.5281/ZENODO.22227432, ratio 1.00 against OpenAlex
https://doi.org/10.13026/4nqg-sb35: 200 https://doi.org/10.13026/4NQG-SB35, ratio 1.00 against OpenAlex
Cox_1972: 403 https://doi.org/10.1111/j.2517-6161.1972.tb00899.x, ratio 1.00 against Crossref
Katzman_2018: 200 https://doi.org/10.1186/s12874-018-0482-1, ratio 1.00 against Crossref
Johnson_2023: 200 https://doi.org/10.1038/s41597-022-01899-x, ratio 1.00 against Crossref
Rix_2012: 403 https://doi.org/10.3109/14017431.2012.673728, ratio 1.00 against Crossref
Vickers_2006: 403 https://doi.org/10.1177/0272989x06295361, ratio 1.00 against Crossref
Collins_2024: 403 https://doi.org/10.1136/bmj-2023-078378, ratio 1.00 against Crossref
Zeiler_2014: 200 https://doi.org/10.1007/978-3-319-10590-1_53, ratio 1.00 against Crossref
Ivanovs_2021: 200 https://doi.org/10.1016/j.patrec.2021.06.030, ratio 1.00 against Crossref
arxiv_1702_04595: 200 https://doi.org/10.48550/arXiv.1702.04595, ratio 1.00 against OpenAlex
_imi__2025: 200 https://doi.org/10.1038/s41598-025-09538-2, ratio 1.00 against Crossref
McKeen_2025: 403 https://doi.org/10.1093/jamiaopen/ooaf122, ratio 1.00 against Crossref
Pfeifer_2026: 200 https://doi.org/10.1016/j.hrthm.2026.03.1956, ratio 1.00 against Crossref
Magnani_2013: 403 https://doi.org/10.1161/circep.112.975342, ratio 0.76 against Crossref
Tanaka_2021: 200 https://doi.org/10.1007/s00380-021-01805-2, ratio 0.99 against Crossref
Yogeswaran_2025: 403 https://doi.org/10.1161/jaha.125.043590, ratio 1.00 against Crossref
Emmanuela_2026: 200 https://doi.org/10.3897/bgcardio.32.e213539, ratio 1.00 against Crossref
Ostrowska_2022: 200 https://doi.org/10.1536/ihj.21-797, ratio 0.82 against Crossref
Goette_2016: 403 https://doi.org/10.1016/j.joa.2016.05.002, ratio 1.00 against Crossref
Maezono_2025: 403 https://doi.org/10.1093/ehjopen/oeaf126, ratio 1.00 against Crossref
Yao_2019: 200 https://doi.org/10.2147/clep.s206267, ratio 0.97 against Crossref
Malmo_2016: 200 https://doi.org/10.2147/clep.s103346, ratio 1.00 against Crossref
exit status: 1
```

## Third expanded revision: the lookup script quote-check on the new citation report (no patch was written, so cite-keys and check-urls stand as in "After the D6 patches")

```
$ python3 the lookup script quote-check '/work/run/citation-report.md' '../../manuscript/refs.bib' '<a temporary folder>'
lines found: 249
exit status: 0
```

## After the D7 patches: the lookup script cite-keys

```
$ python3 the lookup script cite-keys '../../manuscript/main.tex' '../../manuscript/refs.bib'
unused: Wagner_2020
unused: https://doi.org/10.5281/zenodo.4916206
unused: Mehari_2022
unused: arxiv_2005_13249
exit status: 1
```

## After the D7 patches: the lookup script check-urls

```
$ python3 the lookup script check-urls '../../manuscript/main.tex' '../../manuscript/refs.bib'
Kashou_2021: 403 https://doi.org/10.1136/heartjnl-2021-319385, ratio 1.00 against Crossref
Wolf_1991: 403 https://doi.org/10.1161/01.str.22.8.983, ratio 1.00 against Crossref
Schnabel_2015: 200 https://doi.org/10.1016/s0140-6736(14)61774-8, ratio 1.00 against Crossref
Alonso_2013: 403 https://doi.org/10.1161/jaha.112.000102, ratio 1.00 against Crossref
Raghunath_2021: 403 https://doi.org/10.1161/circulationaha.120.047829, ratio 1.00 against Crossref
Khurshid_2022: 403 https://doi.org/10.1161/circulationaha.121.057480, ratio 1.00 against Crossref
Tsiartas_2025: 403 https://doi.org/10.1136/openhrt-2025-003657, ratio 1.00 against Crossref
Saiz_Vivo_2025: 403 https://doi.org/10.1093/ehjdh/ztaf144, ratio 1.00 against Crossref
Van_Gelder_2024: 403 https://doi.org/10.1093/eurheartj/ehae176, ratio 1.00 against Crossref
Arends_2026: 403 https://doi.org/10.1093/ehjdh/ztag038, ratio 1.00 against Crossref
Rudin_2019: 200 https://doi.org/10.1038/s42256-019-0048-x, ratio 1.00 against Crossref
De_Lathauwer_2008: 403 https://doi.org/10.1137/070690729, ratio 1.00 against Crossref
arxiv_2010_04963: 200 https://doi.org/10.48550/arXiv.2010.04963, ratio 1.00 against OpenAlex
Faes_2024: 202 https://doi.org/10.1109/tnnls.2022.3216589, ratio 1.00 against Crossref
Valasakis_2026: 403 https://doi.org/10.1093/eurheartj/ehag785.598, ratio 1.00 against Crossref
Attia_2019: 200 https://doi.org/10.1016/s0140-6736(19)31721-0, ratio 1.00 against Crossref
Yuan_2023: 403 https://doi.org/10.1001/jamacardio.2023.3701, ratio 1.00 against Crossref
Jabbour_2024: 403 https://doi.org/10.1093/eurheartj/ehae595, ratio 1.00 against Crossref
Sau_2026: 200 https://doi.org/10.1016/j.hrthm.2025.08.024, ratio 1.00 against Crossref
Zeidaabadi_2026: 200 https://doi.org/10.1016/j.hrthm.2025.10.024, ratio 1.00 against Crossref
Habineza_2023: 200 https://doi.org/10.1016/j.jelectrocard.2023.09.011, ratio 1.00 against Crossref
Ribeiro_2020: 200 https://doi.org/10.1038/s41467-020-15432-4, ratio 1.00 against Crossref
Riek_2026: 200 https://doi.org/10.1016/j.hroo.2026.09.012, ratio 1.00 against Crossref
Schnabel_2009: 200 https://doi.org/10.1016/s0140-6736(09)60443-8, ratio 1.00 against Crossref
Cheng_2009: 403 https://doi.org/10.1001/jama.2009.888, ratio 1.00 against Crossref
Magnani_2015: 200 https://doi.org/10.1016/j.ahj.2014.10.009, ratio 1.00 against Crossref
Christopoulos_2020: 403 https://doi.org/10.1161/circep.120.009355, ratio 0.87 against Crossref
Khurshid_2025: 200 https://doi.org/10.1038/s41746-025-02164-2, ratio 1.00 against Crossref
Biton_2021: 403 https://doi.org/10.1093/ehjdh/ztab071, ratio 1.00 against Crossref
arxiv_1810_03292: 200 https://doi.org/10.48550/arXiv.1810.03292, ratio 1.00 against OpenAlex
arxiv_1806_10758: 200 https://doi.org/10.48550/arXiv.1806.10758, ratio 1.00 against OpenAlex
Wagner_2024: 200 https://doi.org/10.1016/j.compbiomed.2024.108525, ratio 1.00 against Crossref
arxiv_2007_04612: 200 https://doi.org/10.48550/arXiv.2007.04612, ratio 1.00 against OpenAlex
arxiv_2106_13314: 200 https://doi.org/10.48550/arXiv.2106.13314, ratio 1.00 against OpenAlex
arxiv_2205_10268: 200 https://doi.org/10.48550/arXiv.2205.10268, ratio 1.00 against OpenAlex
arxiv_2507_16761: 200 https://doi.org/10.48550/arXiv.2507.16761, ratio 1.00 against OpenAlex
arxiv_2504_02667: 200 https://doi.org/10.48550/arXiv.2504.02667, ratio 1.00 against OpenAlex
Patlatzoglou_2025: 200 https://doi.org/10.1038/s41746-025-02122-y, ratio 1.00 against Crossref
arxiv_2511_04292: 200 https://doi.org/10.48550/arXiv.2511.04292, ratio 1.00 against OpenAlex
Kolda_2009: 403 https://doi.org/10.1137/07070111x, ratio 1.00 against Crossref
Goulart_2020: 202 https://doi.org/10.1109/tsp.2020.2985591, ratio 1.00 against Crossref
https://doi.org/10.5281/zenodo.22227432: 200 https://doi.org/10.5281/ZENODO.22227432, ratio 1.00 against OpenAlex
https://doi.org/10.13026/4nqg-sb35: 200 https://doi.org/10.13026/4NQG-SB35, ratio 1.00 against OpenAlex
Cox_1972: 403 https://doi.org/10.1111/j.2517-6161.1972.tb00899.x, ratio 1.00 against Crossref
Katzman_2018: 200 https://doi.org/10.1186/s12874-018-0482-1, ratio 1.00 against Crossref
Johnson_2023: 200 https://doi.org/10.1038/s41597-022-01899-x, ratio 1.00 against Crossref
Rix_2012: 403 https://doi.org/10.3109/14017431.2012.673728, ratio 1.00 against Crossref
Vickers_2006: 403 https://doi.org/10.1177/0272989x06295361, ratio 1.00 against Crossref
Collins_2024: 403 https://doi.org/10.1136/bmj-2023-078378, ratio 1.00 against Crossref
Zeiler_2014: 200 https://doi.org/10.1007/978-3-319-10590-1_53, ratio 1.00 against Crossref
Ivanovs_2021: 200 https://doi.org/10.1016/j.patrec.2021.06.030, ratio 1.00 against Crossref
arxiv_1702_04595: 200 https://doi.org/10.48550/arXiv.1702.04595, ratio 1.00 against OpenAlex
_imi__2025: 200 https://doi.org/10.1038/s41598-025-09538-2, ratio 1.00 against Crossref
McKeen_2025: 403 https://doi.org/10.1093/jamiaopen/ooaf122, ratio 1.00 against Crossref
Pfeifer_2026: 200 https://doi.org/10.1016/j.hrthm.2026.03.1956, ratio 1.00 against Crossref
Magnani_2013: 403 https://doi.org/10.1161/circep.112.975342, ratio 0.76 against Crossref
Tanaka_2021: 200 https://doi.org/10.1007/s00380-021-01805-2, ratio 0.99 against Crossref
Yogeswaran_2025: 403 https://doi.org/10.1161/jaha.125.043590, ratio 1.00 against Crossref
Emmanuela_2026: 200 https://doi.org/10.3897/bgcardio.32.e213539, ratio 1.00 against Crossref
Ostrowska_2022: 200 https://doi.org/10.1536/ihj.21-797, ratio 0.82 against Crossref
Goette_2016: 403 https://doi.org/10.1016/j.joa.2016.05.002, ratio 1.00 against Crossref
Maezono_2025: 403 https://doi.org/10.1093/ehjopen/oeaf126, ratio 1.00 against Crossref
Yao_2019: 200 https://doi.org/10.2147/clep.s206267, ratio 0.97 against Crossref
Malmo_2016: 200 https://doi.org/10.2147/clep.s103346, ratio 1.00 against Crossref
exit status: 1
```

## Reference fix after the last writer pass (mark-only)

The draft writer was started once with the patch id `reference-fix` for the 28 check-urls lines of "After the D7 patches" whose status is not 200 (26 answering 403, 2 answering 202). `lookup resolve` confirmed each DOI against its entry (title, first author, year); no identifier needed a change, and no patch was written. Under mark-only these 28 lines stay as failing links in this file and in the final message: Kashou_2021, Wolf_1991, Alonso_2013, Raghunath_2021, Khurshid_2022, Tsiartas_2025, Saiz_Vivo_2025, Van_Gelder_2024, Arends_2026, De_Lathauwer_2008, Faes_2024 (202), Valasakis_2026, Yuan_2023, Jabbour_2024, Cheng_2009, Christopoulos_2020, Biton_2021, Kolda_2009, Goulart_2020 (202), Cox_1972, Rix_2012, Vickers_2006, Collins_2024, McKeen_2025, Magnani_2013, Yogeswaran_2025, Goette_2016, Maezono_2025.

## Compile (full item 12)

```
$ cp -R manuscript <temporary folder>/compile; cd <temporary folder>/compile; latexmk -pdf -interaction=nonstopmode -halt-on-error 'main.tex'
latexmk exit status: 0
lines starting "!" in main.log: 0
Overfull \hbox, Overfull \vbox, "LaTeX Warning: Float too large" lines: 0
LaTeX Warning lines: 0
Output written on main.pdf (36 pages, 921344 bytes).
```
Engine: pdfLaTeX, from the class table of `references/latex-template.md` for `elsarticle` (no `% !TEX program` line).

