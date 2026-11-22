# checks.md

## the session's resolve --entry runs on refs.bib

### Alam_2026

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Alam_2026'
Crossref: ratio 1.00: Joint modeling of high-dimensional longitudinal data and survival using supervised low-rank tensor decomposition | Mohammad Samsul Alam, Rima Kaddurah-Daouk, Sheng Luo | 2026 | Biostatistics | doi 10.1093/biostatistics/kxag007
OpenAlex: ratio 1.00: Joint modeling of high-dimensional longitudinal data and survival using supervised low-rank tensor decomposition | Mohammad Samsul Alam, Rima Kaddurah<hyphen>Daouk, Sheng Luo | 2026 | Biostatistics | doi 10.1093/biostatistics/kxag007 | OpenAlex W7153776866 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13070533/
Semantic Scholar: ratio 1.00: Joint modeling of high-dimensional longitudinal data and survival using supervised low-rank tensor decomposition | Mohammad Samsul Alam, R. Kaddurah-Daouk, Sheng Luo | 2026 | Biostatistics | doi 10.1093/biostatistics/kxag007 | Semantic Scholar ce2eee3c87f4884170d6b390f4889c29b6dd8c56 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13070533/
arXiv: left out, the input has no arXiv ID
Alam_2026: CONFIRMED against Crossref, ratio 1.00, year 2026
exit status: 0
```

### Konyar_2025

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Konyar_2025'
Crossref: ratio 1.00: Semi-Supervised PARAFAC2 Decomposition for Computational Phenotyping Using Electronic Health Records | Elif Konyar, Mostafa Reisi Gahrooei | 2025 | IEEE Journal of Biomedical and Health Informatics | doi 10.1109/jbhi.2025.3530271
OpenAlex: ratio 1.00: Semi-Supervised PARAFAC2 Decomposition for Computational Phenotyping Using Electronic Health Records | Elif Konyar, Mostafa Reisi Gahrooei | 2025 | IEEE Journal of Biomedical and Health Informatics | doi 10.1109/jbhi.2025.3530271 | OpenAlex W4406418094
Semantic Scholar: ratio 1.00: Semi-Supervised PARAFAC2 Decomposition for Computational Phenotyping Using Electronic Health Records | Elif Konyar, M. Gahrooei | 2025 | IEEE journal of biomedical and health informatics | doi 10.1109/JBHI.2025.3530271 | Semantic Scholar af4b6e676f4977a4273cbf12be569df2f78884a5
arXiv: left out, the input has no arXiv ID
Konyar_2025: CONFIRMED against Crossref, ratio 1.00, year 2025
exit status: 0
```

### Zhang_2021

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Zhang_2021'
Crossref: ratio 1.00: Feature extraction from unequal length heterogeneous EHR time series via dynamic time warping and tensor decomposition | Chi Zhang, Hadi Fanaee-T, Magne Thoresen | 2021 | Data Mining and Knowledge Discovery | doi 10.1007/s10618-020-00724-6
OpenAlex: ratio 1.00: Feature extraction from unequal length heterogeneous EHR time series via dynamic time warping and tensor decomposition | Chi Zhang, Hadi Fanaee<hyphen>T, Magne Thoresen | 2021 | Data Mining and Knowledge Discovery | doi 10.1007/s10618-020-00724-6 | OpenAlex W3119564402 | open access http://hdl.handle.net/10852/97241
Semantic Scholar: ratio 1.00: Feature extraction from unequal length heterogeneous EHR time series via dynamic time warping and tensor decomposition | Chi Zhang, Hadi Fanaee-T, M. Thoresen | 2021 | Data mining and knowledge discovery | doi 10.1007/s10618-020-00724-6 | Semantic Scholar a16430a4c833dcb138089028cdead15ea8ef70e6 | open access http://hdl.handle.net/10852/97241
arXiv: left out, the input has no arXiv ID
Zhang_2021: CONFIRMED against Crossref, ratio 1.00, year 2021
exit status: 0
```

### Afshar_2020

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Afshar_2020'
Crossref: ratio 1.00: TASTE | Ardavan Afshar, Ioakeim Perros, Haesun Park et al. | 2020 | Proceedings of the ACM Conference on Health, Inference, and Learning | doi 10.1145/3368555.3384464
OpenAlex: DOI_MISMATCH, ratio 0.11: TASTE: temporal and static tensor factorization for phenotyping electronic health records | Ardavan Afshar, Ioakeim Perros, Haesun Park et al. | 2020 | ACM Conference on Health, Inference, and Learning (CHIL) | doi 10.1145/3368555.3384464 | OpenAlex W3012523953 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7924914/
Semantic Scholar: DOI_MISMATCH, ratio 0.11: TASTE: Temporal and Static Tensor Factorization for Phenotyping Electronic Health Records | Ardavan Afshar, Ioakeim Perros, Haesun Park et al. | 2019 | ACM Conference on Health, Inference, and Learning | doi 10.1145/3368555.3384464 | arXiv 1911.05843 | Semantic Scholar ea3afc644347bb0f923e6daeaeb68c726c1f8381 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7924914/
arXiv: left out, the input has no arXiv ID
Afshar_2020: CONFIRMED against OpenAlex, ratio 1.00, year 2020
exit status: 0
```

### Yin_2020

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Yin_2020'
Crossref: ratio 1.00: LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values | Kejing Yin, Ardavan Afshar, Joyce C. Ho et al. | 2020 | Proceedings of the 26th ACM SIGKDD International Conference on Knowledge Discovery &amp; Data Mining | doi 10.1145/3394486.3403213
OpenAlex: ratio 1.00: LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values | Kejing Yin, Ardavan Afshar, Joyce C. Ho et al. | 2020 | ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD) | doi 10.1145/3394486.3403213 | OpenAlex W3080327921 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8186437/
Semantic Scholar: ratio 1.00: LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values | Kejing Yin, Ardavan Afshar, Joyce Ho et al. | 2020 | Knowledge Discovery and Data Mining | doi 10.1145/3394486.3403213 | Semantic Scholar 6f6d2b257ca9d7073da28ed66884fb53fa08295d | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8186437/
arXiv: left out, the input has no arXiv ID
Yin_2020: CONFIRMED against Crossref, ratio 1.00, year 2020
exit status: 0
```

### Zhou_2013

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Zhou_2013'
Crossref: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Lexin Li, Hongtu Zhu | 2013 | Journal of the American Statistical Association | doi 10.1080/01621459.2013.776499
OpenAlex: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Lexin Li, Hongtu Zhu | 2013 | Journal of the American Statistical Association | doi 10.1080/01621459.2013.776499 | OpenAlex W2136002544 | open access http://europepmc.org/articles/PMC4004091
Semantic Scholar: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Le-Xin Li, Hong-Tu Zhu | 2012 | Journal of the American Statistical Association | doi 10.1080/01621459.2013.776499 | arXiv 1203.3209 | Semantic Scholar cae78de351d5cbd5bd7fd853cf07034ca2e6659c | open access http://europepmc.org/articles/PMC4004091
arXiv: left out, the input has no arXiv ID
Zhou_2013: CONFIRMED against Crossref, ratio 1.00, year 2013
exit status: 0
```

### Li_2016

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Li_2016'
Crossref: ratio 1.00: Sparse Multi-Response Tensor Regression for Alzheimer's Disease Study With Multivariate Clinical Assessments | Zhou Li, Heung-Il Suk, Dinggang Shen et al. | 2016 | IEEE Transactions on Medical Imaging | doi 10.1109/tmi.2016.2538289
OpenAlex: ratio 1.00: Sparse Multi-Response Tensor Regression for Alzheimer's Disease Study With Multivariate Clinical Assessments | Li Zhou, Heung<hyphen>Il Suk, Dinggang G. Shen et al. | 2016 | IEEE Transactions on Medical Imaging | doi 10.1109/tmi.2016.2538289 | OpenAlex W2295513804 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC5154176/
Semantic Scholar: ratio 1.00: Sparse Multi-Response Tensor Regression for Alzheimer's Disease Study With Multivariate Clinical Assessments | Zhou Li, Heung-Il Suk, D. Shen et al. | 2016 | IEEE Transactions on Medical Imaging | doi 10.1109/TMI.2016.2538289 | Semantic Scholar 122d9c2a3f2d128ce604f3a499528af8b2864fb2 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC5154176/
arXiv: left out, the input has no arXiv ID
Li_2016: CONFIRMED against Crossref, ratio 1.00, year 2016
exit status: 0
```

### Miranda_2018

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Miranda_2018'
Crossref: ratio 1.00: TPRM: Tensor partition regression models with applications in imaging biomarker detection | Michelle F. Miranda, Hongtu Zhu, Joseph G. Ibrahim | 2018 | The Annals of Applied Statistics | doi 10.1214/17-aoas1116
OpenAlex: ratio 1.00: TPRM: Tensor partition regression models with applications in imaging biomarker detection | Michelle F. Miranda, Hongtu Zhu, Joseph G. Ibrahim | 2018 | The Annals of Applied Statistics | doi 10.1214/17-aoas1116 | OpenAlex W1541645201 | open access https://projecteuclid.org/journals/annals-of-applied-statistics/volume-12/issue-3/TPRM--Tensor-partition-regression-models-with-applications-in-imaging/10.1214/17-AOAS1116.pdf
Semantic Scholar: ratio 1.00: TPRM: TENSOR PARTITION REGRESSION MODELS WITH APPLICATIONS IN IMAGING BIOMARKER DETECTION | Michelle F. Miranda, Hong-Tu Zhu, J. Ibrahim | 2015 | Annals of Applied Statistics | doi 10.1214/17-AOAS1116 | arXiv 1505.05482 | Semantic Scholar f2dabe85321e813b8672399c976e6831fd4cd58e | open access https://projecteuclid.org/journals/annals-of-applied-statistics/volume-12/issue-3/TPRM--Tensor-partition-regression-models-with-applications-in-imaging/10.1214/17-AOAS1116.pdf
arXiv: left out, the input has no arXiv ID
Miranda_2018: CONFIRMED against Crossref, ratio 1.00, year 2018
exit status: 0
```

### Pan_2018

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Pan_2018'
Crossref: ratio 1.00: Covariate-Adjusted Tensor Classification in High Dimensions | Yuqing Pan, Qing Mai, Xin Zhang | 2018 | Journal of the American Statistical Association | doi 10.1080/01621459.2018.1497500
OpenAlex: ratio 1.00: Covariate-Adjusted Tensor Classification in High Dimensions | Yuqing Pan, Qing Mai, Xin Zhang | 2018 | Journal of the American Statistical Association | doi 10.1080/01621459.2018.1497500 | OpenAlex W2801329512 | open access https://arxiv.org/pdf/1805.04421
Semantic Scholar: ratio 1.00: Covariate-Adjusted Tensor Classification in High Dimensions | Yuqing Pan, Qing Mai, Xin Zhang | 2018 | Journal of the American Statistical Association | doi 10.1080/01621459.2018.1497500 | arXiv 1805.04421 | Semantic Scholar 1e2de3a029c5b27862a1c9aa4cfadb3561cdba3e | open access https://arxiv.org/pdf/1805.04421
arXiv: left out, the input has no arXiv ID
Pan_2018: CONFIRMED against Crossref, ratio 1.00, year 2018
exit status: 0
```

### Li_2018

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Li_2018'
Crossref: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiaoshan Li, Da Xu, Hua Zhou et al. | 2018 | Statistics in Biosciences | doi 10.1007/s12561-018-9215-6
OpenAlex: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiaoshan Li, Da Xu, Hua Zhou et al. | 2018 | Statistics in Biosciences | doi 10.1007/s12561-018-9215-6 | OpenAlex W1580176742 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8336908/
Semantic Scholar: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiao-Shan Li, Da Xu, Hua Zhou et al. | 2013 | Statistics in Biosciences | doi 10.1007/s12561-018-9215-6 | arXiv 1304.5637 | Semantic Scholar 99163e795fb486abbee830608383b6a142cdf434 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8336908/
arXiv: left out, the input has no arXiv ID
Li_2018: CONFIRMED against Crossref, ratio 1.00, year 2018
exit status: 0
```

### Zhang_2023

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Zhang_2023'
Crossref: ratio 1.00: Explainable Tensor Multi-Task Ensemble Learning Based on Brain Structure Variation for Alzheimer<right single quotation mark>s Disease Dynamic Prediction | Yu Zhang, Tong Liu, Vitaveska Lanfranchi et al. | 2023 | IEEE Journal of Translational Engineering in Health and Medicine | doi 10.1109/jtehm.2022.3219775
OpenAlex: ratio 1.00: Explainable Tensor Multi-Task Ensemble Learning Based on Brain Structure Variation for Alzheimer<right single quotation mark>s Disease Dynamic Prediction | Yu Zhang, Tong Liu, Vitaveska Lanfranchi et al. | 2022 | IEEE Journal of Translational Engineering in Health and Medicine | doi 10.1109/jtehm.2022.3219775 | OpenAlex W4310054753 | open access https://ieeexplore.ieee.org/ielx7/6221039/9961067/09940175.pdf
Semantic Scholar: ratio 1.00: Explainable Tensor Multi-Task Ensemble Learning Based on Brain Structure Variation for Alzheimer<right single quotation mark>s Disease Dynamic Prediction | Yu Zhang, Tong Liu, V. Lanfranchi et al. | 2022 | IEEE Journal of Translational Engineering in Health and Medicine | doi 10.1109/JTEHM.2022.3219775 | Semantic Scholar bf937eb60e35b7ee2e0ad3dd58559712fdd602f0 | open access https://ieeexplore.ieee.org/ielx7/6221039/9961067/09940175.pdf
arXiv: left out, the input has no arXiv ID
Zhang_2023: CONFIRMED against Crossref, ratio 1.00, year 2023
exit status: 0
```

### Liu_2023a

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Liu_2023a'
Crossref: ratio 1.00: Integrative Bayesian tensor regression for imaging genetics applications | Yajie Liu, Nilanjana Chakraborty, Zhaohui S. Qin et al. | 2023 | Frontiers in Neuroscience | doi 10.3389/fnins.2023.1212218
OpenAlex: ratio 1.00: Integrative Bayesian tensor regression for imaging genetics applications | Yajie Liu, Nilanjana Chakraborty, Zhaohui Steve Qin et al. | 2023 | Frontiers in Neuroscience | doi 10.3389/fnins.2023.1212218 | OpenAlex W4386099698 | open access https://www.frontiersin.org/articles/10.3389/fnins.2023.1212218/pdf
Semantic Scholar: ratio 1.00: Integrative Bayesian tensor regression for imaging genetics applications | Ya-Jie Liu, Nilanjana Chakraborty, Z. Qin et al. | 2023 | Frontiers in Neuroscience | doi 10.3389/fnins.2023.1212218 | Semantic Scholar a9cd8b1fe5a0c42881ea885b79728f97f274caac | open access https://www.frontiersin.org/articles/10.3389/fnins.2023.1212218/pdf
arXiv: left out, the input has no arXiv ID
Liu_2023a: CONFIRMED against Crossref, ratio 1.00, year 2023
exit status: 0
```

### Lyu_2017

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Lyu_2017'
Crossref: ratio 1.00: Discriminating sample groups with multi-way data | Tianmeng Lyu, Eric F. Lock, Lynn E. Eberly | 2017 | Biostatistics | doi 10.1093/biostatistics/kxw057
OpenAlex: ratio 1.00: Discriminating sample groups with multi-way data | Tianmeng Lyu, Eric F. Lock, Lynn E. Eberly | 2016 | Biostatistics | doi 10.1093/biostatistics/kxw057 | OpenAlex W2473158550 | open access https://academic.oup.com/biostatistics/article-pdf/18/3/434/24331799/kxw057.pdf
Semantic Scholar: ratio 1.00: Discriminating sample groups with multi<hyphen>way data | Tianmeng Lyu, E. Lock, L. Eberly | 2016 | Biostatistics | doi 10.1093/biostatistics/kxw057 | arXiv 1606.08046 | Semantic Scholar 2bb33ecb1336c816885e6a775930c30fe5032a11 | open access https://academic.oup.com/biostatistics/article-pdf/18/3/434/24331799/kxw057.pdf
arXiv: left out, the input has no arXiv ID
Lyu_2017: CONFIRMED against Crossref, ratio 1.00, year 2017
exit status: 0
```

### Lock_2018

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Lock_2018'
Crossref: ratio 1.00: Tensor-on-Tensor Regression | Eric F. Lock | 2018 | Journal of Computational and Graphical Statistics | doi 10.1080/10618600.2017.1401544
OpenAlex: ratio 1.00: Tensor-on-Tensor Regression | Eric F. Lock | 2017 | Journal of Computational and Graphical Statistics | doi 10.1080/10618600.2017.1401544 | OpenAlex W2569250433 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/6188709
Semantic Scholar: ratio 1.00: Tensor-on-tensor regression | E. Lock | 2017 | Journal of Computational And Graphical Statistics | doi 10.1080/10618600.2017.1401544 | arXiv 1701.01037 | Semantic Scholar e03232f936068366ac259fd0f01c075d12a29ce8 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/6188709
arXiv: left out, the input has no arXiv ID
Lock_2018: CONFIRMED against Crossref, ratio 1.00, year 2018
exit status: 0
```

### Qibin_Zhao_2013

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Qibin_Zhao_2013'
Crossref: ratio 1.00: Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method | Qibin Zhao, C. F. Caiafa, D. P. Mandic et al. | 2013 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/tpami.2012.254
OpenAlex: ratio 1.00: Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method | Qibin Zhao, Cesar Federico Caiafa, Danilo P. Mandic et al. | 2012 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/tpami.2012.254 | OpenAlex W1967696752 | open access https://arxiv.org/pdf/1207.1230
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
Qibin_Zhao_2013: CONFIRMED against Crossref, ratio 1.00, year 2013
exit status: 0
```

### Bro_1999

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Bro_1999'
Crossref: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | Rasmus Bro, Claus A. Andersson, Henk A. L. Kiers | 1999 | Journal of Chemometrics | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y
OpenAlex: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | Rasmus Bro, Claus A. Andersson, Henk A. L. Kiers | 1999 | Journal of Chemometrics | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y | OpenAlex W1964121443
Semantic Scholar: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | R. Bro, C. Andersson, H. Kiers | 1999 | doi 10.1002/(SICI)1099-128X(199905/08)13:3/4<295::AID-CEM547>3.0.CO;2-Y | Semantic Scholar 0ccfc172cc3ba9ee0d9b1f00ecbcca182aca6d6e
arXiv: left out, the input has no arXiv ID
Bro_1999: CONFIRMED against Crossref, ratio 1.00, year 1999
exit status: 0
```

### van_der_Ploeg_2026

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'van_der_Ploeg_2026'
Crossref: ratio 1.00: ACMTF-R: Supervised multi-omics data integration uncovering shared and distinct outcome-associated variation | Geert Roelof van der Ploeg, Fred T. G. White, Rasmus Riemer Jakobsen et al. | 2026 | PLOS One | doi 10.1371/journal.pone.0339650
OpenAlex: ratio 1.00: ACMTF-R: Supervised multi-omics data integration uncovering shared and distinct outcome-associated variation | Geert Roelof van der Ploeg, Fred T.G. White, Rasmus Riemer Jakobsen et al. | 2026 | PLoS ONE | doi 10.1371/journal.pone.0339650 | OpenAlex W7123346373 | open access https://doi.org/10.1371/journal.pone.0339650
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
van_der_Ploeg_2026: CONFIRMED against Crossref, ratio 1.00, year 2026
exit status: 0
```

### Amante_2019

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Amante_2019'
Crossref: ratio 1.00: Untargeted Metabolomic Profile for the Detection of Prostate Carcinoma<em dash>Preliminary Results from PARAFAC2 and PLS<en dash>DA Models | Eleonora Amante, Alberto Salomone, Eugenio Alladio et al. | 2019 | Molecules | doi 10.3390/molecules24173063
OpenAlex: ratio 1.00: Untargeted Metabolomic Profile for the Detection of Prostate Carcinoma<em dash>Preliminary Results from PARAFAC2 and PLS<en dash>DA Models | Eleonora Amante, Alberto Salomone, Eugenio Alladio et al. | 2019 | Molecules | doi 10.3390/molecules24173063 | OpenAlex W2969528598 | open access https://www.mdpi.com/1420-3049/24/17/3063/pdf?version=1567074558
Semantic Scholar: ratio 1.00: Untargeted Metabolomic Profile for the Detection of Prostate Carcinoma<em dash>Preliminary Results from PARAFAC2 and PLS<en dash>DA Models | E. Amante, A. Salomone, E. Alladio et al. | 2019 | Molecules | doi 10.3390/molecules24173063 | Semantic Scholar 1619f0ba999bb33117ace199e3df69561ec3feeb | open access https://www.mdpi.com/1420-3049/24/17/3063/pdf?version=1567074558
arXiv: left out, the input has no arXiv ID
Amante_2019: CONFIRMED against Crossref, ratio 1.00, year 2019
exit status: 0
```

### arxiv_1910_09699

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_1910_09699'
Crossref: not found
OpenAlex: ratio 1.00: Soft Tensor Regression | Georgia Papadogeorgou, Zhengwu Zhang, David B. Dunson | 2019 | Journal of Machine Learning Research | doi 10.48550/arxiv.1910.09699 | arXiv 1910.09699 | OpenAlex W2981716445 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC9222480/
Semantic Scholar: ratio 1.00: Soft Tensor Regression | Georgia Papadogeorgou, Zheng-Wu Zhang, D. Dunson | 2019 | Journal of machine learning research | arXiv 1910.09699 | Semantic Scholar d3e90bb4493a58ed0e050aa262a870f42fe79926
arXiv: ratio 1.00: Soft Tensor Regression | Georgia Papadogeorgou, Zhengwu Zhang, David B. Dunson | 2019 | arXiv 1910.09699
arxiv_1910_09699: CONFIRMED against OpenAlex, ratio 1.00, year 2019; year 2021 found on https://www.jmlr.org/papers/v22/20-476.html
exit status: 0
```

### arxiv_1306_0895

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_1306_0895'
Crossref: not found
OpenAlex: ratio 1.00: Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances | Marco Cuturi | 2013 | arXiv (Cornell University) | doi 10.48550/arxiv.1306.0895 | arXiv 1306.0895 | OpenAlex W1511358834 | open access https://arxiv.org/pdf/1306.0895
Semantic Scholar: ratio 0.89: Sinkhorn Distances: Lightspeed Computation of Optimal Transport | Marco Cuturi | 2013 | Neural Information Processing Systems | arXiv 1306.0895 | Semantic Scholar 0080118b0eb02af581ff32b85a1bb6aed7081f45
arXiv: ratio 1.00: Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances | Marco Cuturi | 2013 | arXiv 1306.0895
arxiv_1306_0895: CONFIRMED against OpenAlex, ratio 0.89, year 2013
exit status: 0
```

### M_moli_2011

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'M_moli_2011'
Crossref: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | Facundo M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | doi 10.1007/s10208-011-9093-5
OpenAlex: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | Facundo M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | doi 10.1007/s10208-011-9093-5 | OpenAlex W2027842533
Semantic Scholar: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | F. M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | doi 10.1007/s10208-011-9093-5 | Semantic Scholar 03a4f1c1975237a5e1e501dd26811b4ce55a35a9
arXiv: left out, the input has no arXiv ID
M_moli_2011: CONFIRMED against Crossref, ratio 1.00, year 2011
exit status: 0
```

### arxiv_1310_4375

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_1310_4375'
Crossref: not found
OpenAlex: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, Arnaud Doucet | 2013 | Oxford University Research Archive (ORA) (University of Oxford) | doi 10.48550/arxiv.1310.4375 | arXiv 1310.4375 | OpenAlex W1629559917 | open access https://ora.ox.ac.uk/objects/uuid:176f66e9-3fef-4847-b638-ace71b630ec5/files/mc3fe93fd63587cb3242319d64cbb87a5
Semantic Scholar: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, A. Doucet | 2013 | International Conference on Machine Learning | arXiv 1310.4375 | Semantic Scholar c697fd0b73ec7aaeb2e75cb89cf4b8b020dd9556
arXiv: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, Arnaud Doucet | 2013 | arXiv 1310.4375
arxiv_1310_4375: CONFIRMED against OpenAlex, ratio 1.00, year 2013; year 2014 found on https://proceedings.mlr.press/v32/cuturi14.html
exit status: 0
```

### Bonneel_2016

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Bonneel_2016'
Crossref: ratio 1.00: Wasserstein barycentric coordinates | Nicolas Bonneel, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2016 | ACM Transactions on Graphics | doi 10.1145/2897824.2925918
OpenAlex: DOI_MISMATCH, ratio 0.61: Wasserstein barycentric coordinates: histogram regression using optimal transport | Nicolas Bonneel, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2016 | ACM Transactions on Graphics | doi 10.1145/2897824.2925918 | OpenAlex W2464628725 | open access https://hal.science/hal-01303148v1/document
Semantic Scholar: ratio 1.00: Wasserstein barycentric coordinates | Nicolas Bonneel, G. Peyr<latin small letter e with acute>, Marco Cuturi | 2016 | ACM Transactions on Graphics | doi 10.1145/2897824.2925918 | Semantic Scholar 28886e910abdfa28311f886db4cb7f9f0b14c17e | open access https://hal.science/hal-01303148
arXiv: left out, the input has no arXiv ID
Bonneel_2016: CONFIRMED against OpenAlex, ratio 1.00, year 2016
exit status: 0
```

### Wang_2012

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Wang_2012'
Crossref: ratio 1.00: A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images | Wei Wang, Dejan Slep<latin small letter c with caron>ev, Saurav Basu et al. | 2012 | International Journal of Computer Vision | doi 10.1007/s11263-012-0566-z
OpenAlex: ratio 1.00: A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images | Wei Wang, Dejan Slep<latin small letter c with caron>ev, Saurav Basu et al. | 2012 | International Journal of Computer Vision | doi 10.1007/s11263-012-0566-z | OpenAlex W2094100343 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC3667970/
Semantic Scholar: ratio 1.00: A linear optimal transportation framework for quantifying and visualizing variations in sets of images | Wei Wang, D. Slep<latin small letter c with caron>ev, Saurav Basu et al. | 2012 | International Journal of Computer Vision | doi 10.1007/s11263-012-0566-z | Semantic Scholar 3b1f93716ef525f2b47dcc2faec8292a686e1086 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC3667970/
arXiv: left out, the input has no arXiv ID
Wang_2012: CONFIRMED against Crossref, ratio 1.00, year 2012
exit status: 0
```

### Schmitz_2018

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Schmitz_2018'
Crossref: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning | Morgan A. Schmitz, Matthieu Heitz, Nicolas Bonneel et al. | 2018 | SIAM Journal on Imaging Sciences | doi 10.1137/17m1140431
OpenAlex: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning | Morgan A. Schmitz, Matthieu Heitz, Nicolas Bonneel et al. | 2018 | SIAM Journal on Imaging Sciences | doi 10.1137/17m1140431 | OpenAlex W2744110160 | open access https://arxiv.org/pdf/1708.01955
Semantic Scholar: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-based unsupervised non-linear dictionary learning | M. Schmitz, Matthieu Heitz, Nicolas Bonneel et al. | 2017 | SIAM Journal of Imaging Sciences | doi 10.1137/17M1140431 | arXiv 1708.01955 | Semantic Scholar fd3d9ad8cecbb201a1ca82338681c92ca6174839 | open access https://arxiv.org/pdf/1708.01955
arXiv: left out, the input has no arXiv ID
Schmitz_2018: CONFIRMED against Crossref, ratio 1.00, year 2018
exit status: 0
```

### arxiv_1805_09114

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_1805_09114'
Crossref: not found
OpenAlex: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, La<latin small letter e with diaeresis>titia Chapel, R<latin small letter e with acute>mi Flamary et al. | 2018 | HAL | doi 10.48550/arxiv.1805.09114 | arXiv 1805.09114 | OpenAlex W2911397097 | open access http://arxiv.org/pdf/1805.09114
Semantic Scholar: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, L. Chapel, R<latin small letter e with acute>mi Flamary et al. | 2018 | International Conference on Machine Learning | arXiv 1805.09114 | Semantic Scholar 6f9de3cd77ac32ce00da3ba6b71e2360b5b2a81c
arXiv: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, Laetitia Chapel, R<latin small letter e with acute>mi Flamary et al. | 2018 | arXiv 1805.09114
arxiv_1805_09114: CONFIRMED against OpenAlex, ratio 1.00, year 2018; year 2019 found on https://proceedings.mlr.press/v97/titouan19a.html
exit status: 0
```

### arxiv_2006_09430

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_2006_09430'
Crossref: not found
OpenAlex: ratio 1.00: Wasserstein Embedding for Graph Learning | Soheil Kolouri, Navid Naderializadeh, Gustavo Kunde Rohde et al. | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.09430 | arXiv 2006.09430 | OpenAlex W3036694079 | open access https://arxiv.org/pdf/2006.09430
Semantic Scholar: ratio 1.00: Wasserstein Embedding for Graph Learning | Soheil Kolouri, Navid Naderializadeh, G. Rohde et al. | 2020 | International Conference on Learning Representations | doi 10.48550/arXiv.2006.09430 | arXiv 2006.09430 | Semantic Scholar b00e92cf883050461f545f3f3e4cf376c07bb1a2
arXiv: ratio 1.00: Wasserstein Embedding for Graph Learning | Soheil Kolouri, Navid Naderializadeh, Gustavo K. Rohde et al. | 2020 | arXiv 2006.09430
arxiv_2006_09430: CONFIRMED against OpenAlex, ratio 1.00, year 2020
exit status: 0
```

### Moosm_ller_2022

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Moosm_ller_2022'
Crossref: ratio 1.00: Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations | Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2022 | Information and Inference: A Journal of the IMA | doi 10.1093/imaiai/iaac023
OpenAlex: ratio 1.00: Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations | Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2022 | Information and Inference A Journal of the IMA | doi 10.1093/imaiai/iaac023 | OpenAlex W3165102544 | open access https://arxiv.org/pdf/2008.09165
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
Moosm_ller_2022: CONFIRMED against Crossref, ratio 1.00, year 2022
exit status: 0
```

### Vincent_Cuaz_2022

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Vincent_Cuaz_2022'
Crossref: ratio 1.00: Template Based Graph Neural Network with Optimal Transport Distances | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli et al. | 2022 | Advances in Neural Information Processing Systems 35 | doi 10.52202/068431-0857
OpenAlex: ratio 1.00: Template Based Graph Neural Network with Optimal Transport Distances | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli et al. | 2022 | neural information processing systems | doi 10.52202/068431-0857 | OpenAlex W7133234998
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
Vincent_Cuaz_2022: CONFIRMED against Crossref, ratio 1.00, year 2022
exit status: 0
```

### Xu_2023a

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Xu_2023a'
Crossref: ratio 1.00: Regularized Optimal Transport Layers for Generalized Global Pooling Operations | Hongteng Xu, Minjie Cheng | 2023 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/tpami.2023.3314661
OpenAlex: ratio 1.00: Regularized Optimal Transport Layers for Generalized Global Pooling Operations | Hongteng Xu, Minjie Cheng | 2023 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/tpami.2023.3314661 | OpenAlex W4386634627 | open access https://ieeexplore.ieee.org/ielx7/34/4359286/10247589.pdf
Semantic Scholar: ratio 1.00: Regularized Optimal Transport Layers for Generalized Global Pooling Operations | Hongteng Xu, Min-Jie Cheng | 2022 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/TPAMI.2023.3314661 | arXiv 2212.06339 | Semantic Scholar 0f422f1904f3e1b3e966bd61b3a27334a540f91d | open access https://ieeexplore.ieee.org/ielx7/34/4359286/10247589.pdf
arXiv: left out, the input has no arXiv ID
Xu_2023a: CONFIRMED against Crossref, ratio 1.00, year 2023
exit status: 0
```

### Xu_2023b

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Xu_2023b'
Crossref: ratio 1.00: Representing Graphs via Gromov-Wasserstein Factorization | Hongteng Xu, Jiachang Liu, Dixin Luo et al. | 2023 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/tpami.2022.3153126
OpenAlex: ratio 1.00: Representing Graphs via Gromov-Wasserstein Factorization | Hongteng Xu, Jiachang Liu, Dixin Luo et al. | 2022 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/tpami.2022.3153126 | OpenAlex W4213437519
Semantic Scholar: ratio 1.00: Representing Graphs via Gromov-Wasserstein Factorization | Hongteng Xu, Jiachang Liu, Dixin Luo et al. | 2022 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/TPAMI.2022.3153126 | Semantic Scholar 1f86010608ca56f74041fdf5d707a6d24f4ae357
arXiv: left out, the input has no arXiv ID
Xu_2023b: CONFIRMED against Crossref, ratio 1.00, year 2023
exit status: 0
```

### Kundu_2018

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Kundu_2018'
Crossref: ratio 1.00: Discovery and visualization of structural biomarkers from MRI using transport-based morphometry | Shinjini Kundu, Soheil Kolouri, Kirk I. Erickson et al. | 2018 | NeuroImage | doi 10.1016/j.neuroimage.2017.11.006
OpenAlex: ratio 1.00: Discovery and visualization of structural biomarkers from MRI using transport-based morphometry | Shinjini Kundu, Soheil Kolouri, Kirk I. Erickson et al. | 2017 | NeuroImage | doi 10.1016/j.neuroimage.2017.11.006 | OpenAlex W2616032077 | open access https://www.sciencedirect.com/science/article/am/pii/S1053811917309151
Semantic Scholar: ratio 1.00: Discovery and visualization of structural biomarkers from MRI using transport-based morphometry | Shinjini Kundu, Soheil Kolouri, K. Erickson et al. | 2017 | NeuroImage | doi 10.1016/j.neuroimage.2017.11.006 | arXiv 1705.04919 | Semantic Scholar 62185e836dbff2641cf33e57b9d73ce2bca25a08 | open access https://www.sciencedirect.com/science/article/am/pii/S1053811917309151
arXiv: left out, the input has no arXiv ID
Kundu_2018: CONFIRMED against Crossref, ratio 1.00, year 2018
exit status: 0
```

### Qian_2024

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Qian_2024'
Crossref: ratio 1.00: Reimagining Graph Classification from a Prototype View with Optimal Transport: Algorithm and Theorem | Chen Qian, Huayi Tang, Hong Liang et al. | 2024 | Proceedings of the 30th ACM SIGKDD Conference on Knowledge Discovery and Data Mining | doi 10.1145/3637528.3671696
OpenAlex: ratio 1.00: Reimagining Graph Classification from a Prototype View with Optimal Transport: Algorithm and Theorem | Chen Qian, Huayi Tang, Hong Liang et al. | 2024 | ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD) | doi 10.1145/3637528.3671696 | OpenAlex W4401863353 | open access https://dl.acm.org/doi/pdf/10.1145/3637528.3671696
Semantic Scholar: ratio 1.00: Reimagining Graph Classification from a Prototype View with Optimal Transport: Algorithm and Theorem | Chen Qian, Huayi Tang, Hongsi Liang et al. | 2024 | Knowledge Discovery and Data Mining | doi 10.1145/3637528.3671696 | Semantic Scholar 462fcce248422d4c67b4408ef2ae34f5c360dc4e | open access https://dl.acm.org/doi/pdf/10.1145/3637528.3671696
arXiv: left out, the input has no arXiv ID
Qian_2024: CONFIRMED against Crossref, ratio 1.00, year 2024
exit status: 0
```

### Shifat_E_Rabbi_2025

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Shifat_E_Rabbi_2025'
Crossref: ratio 1.00: Linear Optimal Transport Subspaces for Point Set Classification | Mohammad Shifat-E-Rabbi, Naqib Sad Pathan, Shiying Li et al. | 2025 | Journal of Mathematical Imaging and Vision | doi 10.1007/s10851-025-01261-x
OpenAlex: ratio 1.00: Linear Optimal Transport Subspaces for Point Set Classification | Mohammad Shifat<hyphen>E<hyphen>Rabbi, Naqib Sad Pathan, Shiying Li et al. | 2025 | Journal of Mathematical Imaging and Vision | doi 10.1007/s10851-025-01261-x | OpenAlex W4412438080 | open access https://www.researchsquare.com/article/rs-4106387/latest.pdf
Semantic Scholar: ratio 1.00: Linear Optimal Transport Subspaces for Point Set Classification | Mohammad Shifat-E.-Rabbi, Naqib Sad Pathan, Shi-Ying Li et al. | 2025 | Journal of Mathematical Imaging and Vision | doi 10.1007/s10851-025-01261-x | Semantic Scholar 86d841a3ee340dcea113d278c1dfbbfbbe8c4ce9 | open access https://www.researchsquare.com/article/rs-4106387/latest.pdf
arXiv: left out, the input has no arXiv ID
Shifat_E_Rabbi_2025: CONFIRMED against Crossref, ratio 1.00, year 2025
exit status: 0
```

### Peyre_2016

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Peyre_2016'
Crossref: not found
OpenAlex: ratio 1.00: Gromov-Wasserstein Averaging of Kernel and Distance Matrices | Gabriel Peyr<latin small letter e with acute>, Marco Cuturi, Justin Solomon | 2016 | HAL | OpenAlex W2417433140 | open access https://hal.science/hal-01322992
Semantic Scholar: ratio 1.00: Gromov-Wasserstein Averaging of Kernel and Distance Matrices | G. Peyr<latin small letter e with acute>, Marco Cuturi, J. Solomon | 2016 | International Conference on Machine Learning | Semantic Scholar 4658ae98be04425f7967307401cbcb74c354ab65
arXiv: not found
Peyre_2016: CONFIRMED against OpenAlex, ratio 1.00, year 2016
exit status: 0
```

### Naderializadeh_2021

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Naderializadeh_2021'
Crossref: not found
OpenAlex: ratio 1.00: Pooling by Sliced-Wasserstein Embedding | Navid Naderializadeh, Joseph F. Comer, Reed W. Andrews et al. | 2021 | neural information processing systems | OpenAlex W3212862161
Semantic Scholar: ratio 1.00: Pooling by Sliced-Wasserstein Embedding | Navid Naderializadeh, Joseph F. Comer, Reed W. Andrews et al. | 2021 | Neural Information Processing Systems | Semantic Scholar 81aa417675aeb17790072f783c1179533f667c56
arXiv: not found
Naderializadeh_2021: CONFIRMED against OpenAlex, ratio 1.00, year 2021
exit status: 0
```

### Ren_2025

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Ren_2025'
Crossref: ratio 1.00: OTSurv: A Novel Multiple Instance Learning Framework for Survival Prediction with Heterogeneity-Aware Optimal Transport | Qin Ren, Yifan Wang, Ruogu Fang et al. | 2025 | Lecture Notes in Computer Science | doi 10.1007/978-3-032-05182-0_43
OpenAlex: ratio 1.00: OTSurv: A Novel Multiple Instance Learning Framework for Survival Prediction with Heterogeneity-Aware Optimal Transport | Qin Ren, Yifan Wang, Ruogu Fang et al. | 2025 | Lecture notes in computer science | doi 10.1007/978-3-032-05182-0_43 | OpenAlex W4414316006 | open access https://arxiv.org/pdf/2506.20741
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
Ren_2025: CONFIRMED against Crossref, ratio 0.99, year 2025
exit status: 0
```

### Gong_2026

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Gong_2026'
Crossref: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Hanying Gong, Jie Luo, Shufan Mao et al. | 2026 | Frontiers in Oncology | doi 10.3389/fonc.2025.1700447
OpenAlex: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Hanying Gong, Jun Luo, Shufan Mao et al. | 2026 | Frontiers in Oncology | doi 10.3389/fonc.2025.1700447 | OpenAlex W7126042104 | open access https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1700447/pdf
Semantic Scholar: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Han-Ying Gong, Jie Luo, Shufan Mao et al. | 2026 | Frontiers in Oncology | doi 10.3389/fonc.2025.1700447 | Semantic Scholar 6a61c6836e5159c5e80d457fa948bd2ab017feb3 | open access https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1700447/pdf
arXiv: left out, the input has no arXiv ID
Gong_2026: CONFIRMED against Crossref, ratio 1.00, year 2026
exit status: 0
```

### Gachon_2025

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Gachon_2025'
Crossref: ratio 1.00: Low Dimensional Representation of Multi<hyphen>Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia | Erell Gachon, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot, Elsa Cazelles et al. | 2025 | Cytometry Part A | doi 10.1002/cyto.a.24918
OpenAlex: ratio 1.00: Low Dimensional Representation of Multi<hyphen>Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia | Erell Gachon, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot, Elsa Cazelles et al. | 2025 | Cytometry Part A | doi 10.1002/cyto.a.24918 | OpenAlex W4408161545 | open access https://doi.org/10.1002/cyto.a.24918
Semantic Scholar: ratio 1.00: Low Dimensional Representation of Multi<hyphen>Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia | E. Gachon, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot, Elsa Cazelles et al. | 2024 | Cytometry Part A | doi 10.1002/cyto.a.24918 | arXiv 2407.17329 | Semantic Scholar eeda175edefd8c88a47f023d8f5b659a634e7fb5 | open access https://doi.org/10.1002/cyto.a.24918
arXiv: left out, the input has no arXiv ID
Gachon_2025: CONFIRMED against Crossref, ratio 1.00, year 2025
exit status: 0
```

### Zhang_2024

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Zhang_2024'
Crossref: ratio 1.00: Wasserstein Discriminant Dictionary Learning for Graph Representation | Tong Zhang, Guangbu Liu, Zhen Cui et al. | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/tpami.2024.3409772
OpenAlex: ratio 1.00: Wasserstein Discriminant Dictionary Learning for Graph Representation | Tong Zhang, Guangbu Liu, Zhen Cui et al. | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/tpami.2024.3409772 | OpenAlex W4399373692
Semantic Scholar: ratio 1.00: Wasserstein Discriminant Dictionary Learning for Graph Representation | Tong Zhang, Guangbu Liu, Zhen Cui et al. | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/TPAMI.2024.3409772 | Semantic Scholar 9ce07ee913a43b79c2b8d8edfff420869ac4b203
arXiv: left out, the input has no arXiv ID
Zhang_2024: CONFIRMED against Crossref, ratio 1.00, year 2024
exit status: 0
```

### Nguyen_2023

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Nguyen_2023'
Crossref: ratio 1.00: On a linear fused Gromov-Wasserstein distance for graph structured data | Dai Hai Nguyen, Koji Tsuda | 2023 | Pattern Recognition | doi 10.1016/j.patcog.2023.109351
OpenAlex: ratio 1.00: On a linear fused Gromov-Wasserstein distance for graph structured data | Hai Nguyen, Koji Tsuda | 2023 | Pattern Recognition | doi 10.1016/j.patcog.2023.109351 | OpenAlex W4317932208 | open access https://www.sciencedirect.com/science/article/am/pii/S0031320323000523
Semantic Scholar: ratio 1.00: On a linear fused Gromov-Wasserstein distance for graph structured data | Dai Hai Nguyen, K. Tsuda | 2022 | Pattern Recognition | doi 10.1016/j.patcog.2023.109351 | arXiv 2203.04711 | Semantic Scholar 2230cec2ca3405545da0f61287bbb949395a56c5 | open access https://www.sciencedirect.com/science/article/am/pii/S0031320323000523
arXiv: left out, the input has no arXiv ID
Nguyen_2023: CONFIRMED against Crossref, ratio 1.00, year 2023
exit status: 0
```

### arxiv_1703_06114

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_1703_06114'
Crossref: not found
OpenAlex: ratio 1.00: Deep Sets | Manzil Zaheer, Satwik Kottur, Siamak Ravanbakhsh et al. | 2017 | arXiv (Cornell University) | doi 10.48550/arxiv.1703.06114 | arXiv 1703.06114 | OpenAlex W4299457904 | open access https://arxiv.org/pdf/1703.06114
Semantic Scholar: ratio 1.00: Deep Sets | M. Zaheer, S. Kottur, Siamak Ravanbakhsh et al. | 2017 | arXiv 1703.06114 | Semantic Scholar de4edcddc028b0088f7ee44ae6e4be261f20b6f6
arXiv: ratio 1.00: Deep Sets | Manzil Zaheer, Satwik Kottur, Siamak Ravanbakhsh et al. | 2017 | arXiv 1703.06114
arxiv_1703_06114: CONFIRMED against OpenAlex, ratio 1.00, year 2017
exit status: 0
```

### arxiv_1810_00825

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_1810_00825'
Crossref: not found
OpenAlex: ratio 1.00: Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks | Juho Lee, Yoonho Lee, Jungtaek Kim et al. | 2018 | Oxford University Research Archive (ORA) (University of Oxford) | doi 10.48550/arxiv.1810.00825 | arXiv 1810.00825 | OpenAlex W2894384847 | open access https://ora.ox.ac.uk/objects/uuid:8aa5f831-66b2-46ca-89ea-7b2384064db3/files/s8k71nh51g
Semantic Scholar: DOI_MISMATCH, ratio 0.31: Set Transformer | Juho Lee, Yoonho Lee, Jungtaek Kim et al. | 2018 | International Conference on Machine Learning | doi 10.48550/arXiv.1810.00825 | arXiv 1810.00825 | Semantic Scholar 512b8ef0002e0bfd0ecb5ab17d533c1762eb9786
arXiv: ratio 1.00: Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks | Juho Lee, Yoonho Lee, Jungtaek Kim et al. | 2018 | arXiv 1810.00825
arxiv_1810_00825: CONFIRMED against OpenAlex, ratio 1.00, year 2018; year 2019 found on https://proceedings.mlr.press/v97/lee19d.html
exit status: 0
```

### arxiv_1802_04712

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_1802_04712'
Crossref: not found
OpenAlex: ratio 1.00: Attention-based Deep Multiple Instance Learning | Maximilian Ilse, Jakub M. Tomczak, Max Welling | 2018 | arXiv (Cornell University) | doi 10.48550/arxiv.1802.04712 | arXiv 1802.04712 | OpenAlex W2785934082 | open access https://arxiv.org/pdf/1802.04712
Semantic Scholar: not found
arXiv: ratio 1.00: Attention-based Deep Multiple Instance Learning | Maximilian Ilse, Jakub M. Tomczak, Max Welling | 2018 | arXiv 1802.04712
arxiv_1802_04712: CONFIRMED against OpenAlex, ratio 1.00, year 2018
exit status: 0
```

### arxiv_2106_00908

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_2106_00908'
Crossref: not found
OpenAlex: ratio 1.00: TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification | Zhuchen Shao, Hao Bian, Chen Yang et al. | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2106.00908 | arXiv 2106.00908 | OpenAlex W3193968034 | open access https://arxiv.org/pdf/2106.00908
Semantic Scholar: ratio 0.99: TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classication | Zhucheng Shao, Hao Bian, Yang Chen et al. | 2021 | Neural Information Processing Systems | doi 10.48550/arXiv.2106.00908 | arXiv 2106.00908 | Semantic Scholar 2153963d19b21e64e55295b69de81d99aadac465 | open access https://arxiv.org/pdf/2106.00908
arXiv: ratio 1.00: TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification | Zhuchen Shao, Hao Bian, Yang Chen et al. | 2021 | arXiv 2106.00908
arxiv_2106_00908: CONFIRMED against OpenAlex, ratio 1.00, year 2021
exit status: 0
```

### Lu_2021

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Lu_2021'
Crossref: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Y. Chen et al. | 2021 | Nature Biomedical Engineering | doi 10.1038/s41551-020-00682-w
OpenAlex: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Chen et al. | 2021 | Nature Biomedical Engineering | doi 10.1038/s41551-020-00682-w | OpenAlex W3018295606 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8711640/
Semantic Scholar: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Y. Chen et al. | 2020 | Nature Biomedical Engineering | doi 10.1038/s41551-020-00682-w | arXiv 2004.09666 | Semantic Scholar 3e358c3033908a9506e7f1e3cf29283e359f43d6 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8711640/
arXiv: left out, the input has no arXiv ID
Lu_2021: CONFIRMED against Crossref, ratio 1.00, year 2021
exit status: 0
```

### Campanella_2019

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Campanella_2019'
Crossref: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | Gabriele Campanella, Matthew G. Hanna, Luke Geneslaw et al. | 2019 | Nature Medicine | doi 10.1038/s41591-019-0508-1
OpenAlex: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | Gabriele S. V. Campanella, Matthew G. Hanna, Luke Geneslaw et al. | 2019 | Nature Medicine | doi 10.1038/s41591-019-0508-1 | OpenAlex W2956228567 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7418463/
Semantic Scholar: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | G. Campanella, M. Hanna, L. Geneslaw et al. | 2019 | Nature Medicine | doi 10.1038/s41591-019-0508-1 | Semantic Scholar addae423490bbe82da4fb2fc265237178686b4e8 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7418463/
arXiv: left out, the input has no arXiv ID
Campanella_2019: CONFIRMED against Crossref, ratio 1.00, year 2019
exit status: 0
```

### Zhu_2021

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Zhu_2021'
Crossref: ratio 1.00: Dual Attention Multi-Instance Deep Learning for Alzheimer<right single quotation mark>s Disease Diagnosis With Structural MRI | Wenyong Zhu, Liang Sun, Jiashuang Huang et al. | 2021 | IEEE Transactions on Medical Imaging | doi 10.1109/tmi.2021.3077079
OpenAlex: ratio 1.00: Dual Attention Multi-Instance Deep Learning for Alzheimer<right single quotation mark>s Disease Diagnosis With Structural MRI | Wenyong Zhu, Liang Sun, Jiashuang Huang et al. | 2021 | IEEE Transactions on Medical Imaging | doi 10.1109/tmi.2021.3077079 | OpenAlex W3158631207
Semantic Scholar: ratio 1.00: Dual Attention Multi-Instance Deep Learning for Alzheimer<right single quotation mark>s Disease Diagnosis With Structural MRI | Wenyong Zhu, Liang Sun, Jia-Shuang Huang et al. | 2021 | IEEE Transactions on Medical Imaging | doi 10.1109/TMI.2021.3077079 | Semantic Scholar b904fc6c0492b8ab5481315f54429f1a68783f84 | open access https://e-space.mmu.ac.uk/627639/1/FINAL%20VERSION-accepted.pdf
arXiv: left out, the input has no arXiv ID
Zhu_2021: CONFIRMED against Crossref, ratio 1.00, year 2021
exit status: 0
```

### Oner_2023

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Oner_2023'
Crossref: ratio 1.00: Distribution based MIL pooling filters: Experiments on a lymph node metastases dataset | Mustafa Umit Oner, Jared Marc Song Kye-Jet, Hwee Kuan Lee et al. | 2023 | Medical Image Analysis | doi 10.1016/j.media.2023.102813
OpenAlex: ratio 1.00: Distribution based MIL pooling filters: Experiments on a lymph node metastases dataset | Mustafa <latin capital letter u with diaeresis>mit <latin capital letter o with diaeresis>ner, Jared Marc Song Kye-Jet, Hwee Kuan Lee et al. | 2023 | Medical Image Analysis | doi 10.1016/j.media.2023.102813 | OpenAlex W4366490797 | open access https://doi.org/10.1016/j.media.2023.102813
Semantic Scholar: ratio 1.00: Distribution based MIL pooling filters: Experiments on a lymph node metastases dataset | Mustafa Umit Oner, Jared Marc Song Kye-Jet, Hwee Kuan Lee et al. | 2023 | Medical Image Anal. | doi 10.1016/j.media.2023.102813 | Semantic Scholar 2379a795e2eb260ae2eeb71c826048ee3f0c789c | open access https://doi.org/10.1016/j.media.2023.102813
arXiv: left out, the input has no arXiv ID
Oner_2023: CONFIRMED against Crossref, ratio 1.00, year 2023
exit status: 0
```

### Jurenaite_2024

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Jurenaite_2024'
Crossref: ratio 1.00: SetQuence &amp; SetOmic: Deep set transformers for whole genome and exome tumour analysis | Neringa Jurenaite, Daniel Le<latin small letter o with acute>n-Peri<latin small letter n with tilde><latin small letter a with acute>n, Veronika Donath et al. | 2024 | BioSystems | doi 10.1016/j.biosystems.2023.105095
OpenAlex: ratio 0.98: SetQuence & SetOmic: Deep set transformers for whole genome and exome tumour analysis | Neringa Jurenaite, Daniel Le<latin small letter o with acute>n-Peri<latin small letter n with tilde><latin small letter a with acute>n, Veronika Donath et al. | 2023 | Biosystems | doi 10.1016/j.biosystems.2023.105095 | OpenAlex W4389365697 | open access https://ars.els-cdn.com/content/image/1-s2.0-S0303264723002708-ga1_lrg.jpg
Semantic Scholar: ratio 0.98: SetQuence & SetOmic: Deep set transformers for whole genome and exome tumour analysis | Neringa Jurenaite, D. Le<latin small letter o with acute>n-Peri<latin small letter n with tilde><latin small letter a with acute>n, Veronika Donath et al. | 2023 | Biosyst. | doi 10.1016/j.biosystems.2023.105095 | Semantic Scholar 2ecfb29f25726814e1412ebb8c7c05cd4357bad8 | open access https://ars.els-cdn.com/content/image/1-s2.0-S0303264723002708-ga1_lrg.jpg
arXiv: left out, the input has no arXiv ID
Jurenaite_2024: CONFIRMED against Crossref, ratio 1.00, year 2024
exit status: 0
```

### Elhaminia_2023

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Elhaminia_2023'
Crossref: ratio 1.00: Toxicity Prediction in Pelvic Radiotherapy Using Multiple Instance Learning and Cascaded Attention Layers | Behnaz Elhaminia, Alexandra Gilbert, John Lilley et al. | 2023 | IEEE Journal of Biomedical and Health Informatics | doi 10.1109/jbhi.2023.3238825
OpenAlex: ratio 1.00: Toxicity Prediction in Pelvic Radiotherapy Using Multiple Instance Learning and Cascaded Attention Layers | Behnaz Elhaminia, Alexandra Gilbert, J. Lilley et al. | 2023 | IEEE Journal of Biomedical and Health Informatics | doi 10.1109/jbhi.2023.3238825 | OpenAlex W4317761556 | open access https://eprints.whiterose.ac.uk/196901/1/TOXICITY%20PREDICTION%20IN%20PELVIC%20RADIOTHERAPY%20USING%20MULTIPLE%20INSTANCE%20LEARNING%20AND%20CASCADED%20ATTENTION%20LAYERS.pdf
Semantic Scholar: ratio 1.00: Toxicity Prediction in Pelvic Radiotherapy Using Multiple Instance Learning and Cascaded Attention Layers | B. Elhaminia, A. Gilbert, J. Lilley et al. | 2023 | IEEE journal of biomedical and health informatics | doi 10.1109/JBHI.2023.3238825 | Semantic Scholar 93e0b21e23582c72ec99fdf43459e87ee1b02854 | open access https://eprints.whiterose.ac.uk/196901/1/TOXICITY%20PREDICTION%20IN%20PELVIC%20RADIOTHERAPY%20USING%20MULTIPLE%20INSTANCE%20LEARNING%20AND%20CASCADED%20ATTENTION%20LAYERS.pdf
arXiv: left out, the input has no arXiv ID
Elhaminia_2023: CONFIRMED against Crossref, ratio 1.00, year 2023
exit status: 0
```

### Craig_2025

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Craig_2025'
Crossref: ratio 1.00: Annotation-free discovery of disease-relevant cells in single-cell datasets | Erin Craig, Timothy J. Keyes, Jolanda Sarno et al. | 2025 | Science Advances | doi 10.1126/sciadv.adv5019
OpenAlex: ratio 1.00: Annotation-free discovery of disease-relevant cells in single-cell datasets | Erin Craig, Timothy Keyes, Jolanda Sarno et al. | 2025 | Science Advances | doi 10.1126/sciadv.adv5019 | OpenAlex W4413756015 | open access https://www.science.org/doi/pdf/10.1126/sciadv.adv5019?download=true
Semantic Scholar: ratio 1.00: Annotation-free discovery of disease-relevant cells in single-cell datasets | Erin Craig, T. Keyes, J. Sarno et al. | 2025 | Science Advances | doi 10.1126/sciadv.adv5019 | Semantic Scholar 1f015b9770e3ef91c9407f63086220eaedf924f6 | open access https://www.science.org/doi/pdf/10.1126/sciadv.adv5019?download=true
arXiv: left out, the input has no arXiv ID
Craig_2025: CONFIRMED against Crossref, ratio 1.00, year 2025
exit status: 0
```

### Liu_2023b

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Liu_2023b'
Crossref: ratio 1.00: Development and prospective validation of postoperative pain prediction from preoperative EHR data using attention-based set embeddings | Ran Liu, Rodrigo Guti<latin small letter e with acute>rrez, Rory V. Mather et al. | 2023 | npj Digital Medicine | doi 10.1038/s41746-023-00947-z
OpenAlex: ratio 1.00: Development and prospective validation of postoperative pain prediction from preoperative EHR data using attention-based set embeddings | Ran Liu, Rodrigo Guti<latin small letter e with acute>rrez, Rory Vu Mather et al. | 2023 | npj Digital Medicine | doi 10.1038/s41746-023-00947-z | OpenAlex W4388730556 | open access https://www.nature.com/articles/s41746-023-00947-z.pdf
Semantic Scholar: ratio 1.00: Development and prospective validation of postoperative pain prediction from preoperative EHR data using attention-based set embeddings | Ran Liu, Rodrigo Guti<latin small letter e with acute>rrez, R. Mather et al. | 2023 | npj Digit. Medicine | doi 10.1038/s41746-023-00947-z | Semantic Scholar 18b9cd0aecca758ce7e856376cdf8c9e4ba643ed | open access https://www.nature.com/articles/s41746-023-00947-z.pdf
arXiv: left out, the input has no arXiv ID
Liu_2023b: CONFIRMED against Crossref, ratio 1.00, year 2023
exit status: 0
```

### de_Vente_2024

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'de_Vente_2024'
Crossref: ratio 1.00: Uncertainty-aware multiple-instance learning for reliable classification: Application to optical coherence tomography | Coen de Vente, Bram van Ginneken, Carel B. Hoyng et al. | 2024 | Medical Image Analysis | doi 10.1016/j.media.2024.103259
OpenAlex: ratio 1.00: Uncertainty-aware multiple-instance learning for reliable classification: Application to optical coherence tomography | Coen de Vente, Bram van Ginneken, Carel B. Hoyng et al. | 2024 | Medical Image Analysis | doi 10.1016/j.media.2024.103259 | OpenAlex W4400078389 | open access https://doi.org/10.1016/j.media.2024.103259
Semantic Scholar: ratio 1.00: Uncertainty-aware multiple-instance learning for reliable classification: Application to optical coherence tomography | Coen de Vente, B. van Ginneken, C. Hoyng et al. | 2023 | Medical Image Anal. | doi 10.1016/j.media.2024.103259 | arXiv 2302.03116 | Semantic Scholar 362c510dec0d566d22d5be3af0519fc7eec8bb86 | open access https://doi.org/10.1016/j.media.2024.103259
arXiv: left out, the input has no arXiv ID
de_Vente_2024: CONFIRMED against Crossref, ratio 1.00, year 2024
exit status: 0
```

### Karimzadeh_2026

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Karimzadeh_2026'
Crossref: ratio 1.00: Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study | Reza Karimzadeh, Setareh Hasanabadi, Maryam Cheraghi et al. | 2026 | Physics in Medicine &amp; Biology | doi 10.1088/1361-6560/ae7955
OpenAlex: ratio 1.00: Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study | Reza Karimzadeh, Saeed Shafiee Hasanabadi, Maryam Cheraghi et al. | 2026 | Physics in Medicine and Biology | doi 10.1088/1361-6560/ae7955 | OpenAlex W7163639403 | open access https://iopscience.iop.org/article/10.1088/1361-6560/ae7955/pdf
Semantic Scholar: ratio 1.00: Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study | Reza Karimzadeh, S. Hasanabadi, Maryam Cheraghi et al. | 2026 | Physics in Medicine and Biology | doi 10.1088/1361-6560/ae7955 | Semantic Scholar 74f3f1dd7f19a09b1361f61914d94094d2817f7f | open access https://iopscience.iop.org/article/10.1088/1361-6560/ae7955/pdf
arXiv: left out, the input has no arXiv ID
Karimzadeh_2026: CONFIRMED against Crossref, ratio 1.00, year 2026
exit status: 0
```

### Chen_2021

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Chen_2021'
Crossref: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jianan Chen, Helen M. C. Cheung, Laurent Milot et al. | 2021 | Lecture Notes in Computer Science | doi 10.1007/978-3-030-87240-3_72
OpenAlex: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jianan Chen, Helen Cheung, Laurent M. Milot et al. | 2021 | Lecture notes in computer science | doi 10.1007/978-3-030-87240-3_72 | OpenAlex W3202344381
Semantic Scholar: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jia-Nan Chen, H. Cheung, L. Milot et al. | 2020 | International Conference on Medical Image Computing and Computer-Assisted Intervention | doi 10.1007/978-3-030-87240-3_72 | arXiv 2012.06875 | Semantic Scholar 6ede03256f54d773b3ba822e4824a8f0416b18a1
arXiv: left out, the input has no arXiv ID
Chen_2021: CONFIRMED against Crossref, ratio 1.00, year 2021
exit status: 0
```

### Chen_2022

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Chen_2022'
Crossref: ratio 1.00: Lung cancer diagnosis using deep attention<hyphen>based multiple instance learning and radiomics | Junhua Chen, Haiyan Zeng, Chong Zhang et al. | 2022 | Medical Physics | doi 10.1002/mp.15539
OpenAlex: ratio 1.00: Lung cancer diagnosis using deep attention<hyphen>based multiple instance learning and radiomics | Junhua Chen, Haiyan Zeng, Chong Zhang et al. | 2022 | Medical Physics | doi 10.1002/mp.15539 | OpenAlex W4212862206 | open access https://doi.org/10.1002/mp.15539
Semantic Scholar: ratio 1.00: Lung cancer diagnosis using deep attention<hyphen>based multiple instance learning and radiomics | Junhua Chen, H. Zeng, Chong Zhang et al. | 2021 | Medical Physics (Lancaster) | doi 10.1002/mp.15539 | arXiv 2104.14655 | Semantic Scholar 7631da3fd06db47f74c3907a3b28418c26f24151 | open access https://doi.org/10.1002/mp.15539
arXiv: left out, the input has no arXiv ID
Chen_2022: CONFIRMED against Crossref, ratio 1.00, year 2022
exit status: 0
```

### Thiery_2025

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Thiery_2025'
Crossref: ratio 1.00: PET-based lesion graphs meet clinical data: An interpretable cross-attention framework for DLBCL treatment response prediction | Oriane Thiery, Mira Rizkallah, Cl<latin small letter e with acute>ment Bailly et al. | 2025 | Computerized Medical Imaging and Graphics | doi 10.1016/j.compmedimag.2024.102481
OpenAlex: ratio 1.00: PET-based lesion graphs meet clinical data: An interpretable cross-attention framework for DLBCL treatment response prediction | Oriane Thiery, Mira Rizkallah, Cl<latin small letter e with acute>ment Bailly et al. | 2024 | Computerized Medical Imaging and Graphics | doi 10.1016/j.compmedimag.2024.102481 | OpenAlex W4402823365 | open access https://doi.org/10.1016/j.compmedimag.2024.102481
Semantic Scholar: ratio 1.00: PET-based lesion graphs meet clinical data: An interpretable cross-attention framework for DLBCL treatment response prediction | Oriane Thiery, M. Rizkallah, C. Bailly et al. | 2024 | Comput. Medical Imaging Graph. | doi 10.1016/j.compmedimag.2024.102481 | Semantic Scholar 27f0a0bc62eddb7f35830ad6c8a8e850a8eeff87 | open access https://doi.org/10.1016/j.compmedimag.2024.102481
arXiv: left out, the input has no arXiv ID
Thiery_2025: CONFIRMED against Crossref, ratio 1.00, year 2025
exit status: 0
```

### Zhang_2025

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Zhang_2025'
Crossref: ratio 1.00: Lymphoma Prognosis with Lesion-Anatomy Context Fusion and Attention-Based Multi-lesion Aggregation | Song Zhang, Jiajin Zhang, Liheng Qiu et al. | 2025 | Lecture Notes in Computer Science | doi 10.1007/978-3-032-04927-8_31
OpenAlex: ratio 1.00: Lymphoma Prognosis with Lesion-Anatomy Context Fusion and Attention-Based Multi-lesion Aggregation | Song Zhang, Jiajin Zhang, Liheng Qiu et al. | 2025 | Lecture notes in computer science | doi 10.1007/978-3-032-04927-8_31 | OpenAlex W4414380796
Semantic Scholar: ratio 1.00: Lymphoma Prognosis with Lesion-Anatomy Context Fusion and Attention-Based Multi-lesion Aggregation | Song Zhang, Jia-Jin Zhang, Li-Heng Qiu et al. | 2025 | International Conference on Medical Image Computing and Computer-Assisted Intervention | doi 10.1007/978-3-032-04927-8_31 | Semantic Scholar 7e6d88c8021a9d663fec57c6bba604cf50250088
arXiv: left out, the input has no arXiv ID
Zhang_2025: CONFIRMED against Crossref, ratio 0.99, year 2025
exit status: 0
```

### Liu_2018

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Liu_2018'
Crossref: ratio 1.00: Landmark-based deep multi-instance learning for brain disease diagnosis | Mingxia Liu, Jun Zhang, Ehsan Adeli et al. | 2018 | Medical Image Analysis | doi 10.1016/j.media.2017.10.005
OpenAlex: ratio 1.00: Landmark-based deep multi-instance learning for brain disease diagnosis | Mingxia Liu, Jun Zhang, Ehsan Adeli et al. | 2017 | Medical Image Analysis | doi 10.1016/j.media.2017.10.005 | OpenAlex W2765366332 | open access http://europepmc.org/pmc/articles/PMC6203325
Semantic Scholar: ratio 1.00: Landmark-based deep multi-instance learning for brain disease diagnosis | Mingxia Liu, Jun Zhang, E. Adeli et al. | 2017 | Medical Image Anal. | doi 10.1016/j.media.2017.10.005 | Semantic Scholar f67ff4a57a88c60d76e172d1de79f83ca6a36d1e | open access http://europepmc.org/pmc/articles/PMC6203325
arXiv: left out, the input has no arXiv ID
Liu_2018: CONFIRMED against Crossref, ratio 1.00, year 2018
exit status: 0
```

### Geady_2025

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Geady_2025'
Crossref: ratio 1.00: Radiomic-based approaches in the multi-metastatic setting: a quantitative review | Caryn Geady, Hemangini Patel, Jacob Peoples et al. | 2025 | BMC Cancer | doi 10.1186/s12885-025-13850-5
OpenAlex: ratio 1.00: Radiomic-based approaches in the multi-metastatic setting: a quantitative review | Caryn Geady, Hemangini Patel, Jacob Peoples et al. | 2025 | BMC Cancer | doi 10.1186/s12885-025-13850-5 | OpenAlex W4408835753 | open access https://doi.org/10.1186/s12885-025-13850-5
Semantic Scholar: ratio 1.00: Radiomic-based approaches in the multi-metastatic setting: a quantitative review | C. Geady, Hemangini Patel, J. Peoples et al. | 2024 | BMC Cancer | doi 10.1186/s12885-025-13850-5 | Semantic Scholar cd13f42426718476b87114ea525cdf1d4f438a71 | open access https://doi.org/10.1186/s12885-025-13850-5
arXiv: left out, the input has no arXiv ID
Geady_2025: CONFIRMED against Crossref, ratio 1.00, year 2025
exit status: 0
```

### Kovacs_2023

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Kovacs_2023'
Crossref: ratio 1.00: Addressing image misalignments in multi-parametric prostate MRI for enhanced computer-aided diagnosis of prostate cancer | Balint Kovacs, Nils Netzer, Michael Baumgartner et al. | 2023 | Scientific Reports | doi 10.1038/s41598-023-46747-z
OpenAlex: ratio 1.00: Addressing image misalignments in multi-parametric prostate MRI for enhanced computer-aided diagnosis of prostate cancer | B<latin small letter a with acute>lint Kov<latin small letter a with grave>cs, Nils Netzer, Michael Baumgartner et al. | 2023 | Scientific Reports | doi 10.1038/s41598-023-46747-z | OpenAlex W4388627300 | open access https://www.nature.com/articles/s41598-023-46747-z.pdf
Semantic Scholar: ratio 1.00: Addressing image misalignments in multi-parametric prostate MRI for enhanced computer-aided diagnosis of prostate cancer | B<latin small letter a with acute>lint Kov<latin small letter a with acute>cs, N. Netzer, M. Baumgartner et al. | 2023 | Scientific Reports | doi 10.1038/s41598-023-46747-z | Semantic Scholar 8e5b6ccace875c5bb3e7a48d82cc046bbe1d6309 | open access https://www.nature.com/articles/s41598-023-46747-z.pdf
arXiv: left out, the input has no arXiv ID
Kovacs_2023: CONFIRMED against Crossref, ratio 1.00, year 2023
exit status: 0
```

### Hering_2024

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Hering_2024'
Crossref: ratio 1.00: Deformable MRI Sequence Registration for AI-Based Prostate Cancer Diagnosis | Alessa Hering, Sarah de Boer, Anindo Saha et al. | 2024 | Lecture Notes in Computer Science | doi 10.1007/978-3-031-73480-9_12
OpenAlex: ratio 1.00: Deformable MRI Sequence Registration for AI-Based Prostate Cancer Diagnosis | Alessa Hering, Sarah de Boer, Anindo Saha et al. | 2024 | Lecture notes in computer science | doi 10.1007/978-3-031-73480-9_12 | OpenAlex W4403138969 | open access https://research.rug.nl/en/publications/109539f7-3f68-4f02-b560-d4e993e00d7b
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
Hering_2024: CONFIRMED against Crossref, ratio 0.99, year 2024
exit status: 0
```

### van_Griethuysen_2017

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'van_Griethuysen_2017'
Crossref: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | Joost J.M. van Griethuysen, Andriy Fedorov, Chintan Parmar et al. | 2017 | Cancer Research | doi 10.1158/0008-5472.can-17-0339
OpenAlex: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | Joost J. M. van Griethuysen, Andriy Fedorov, Chintan Parmar et al. | 2017 | Cancer Research | doi 10.1158/0008-5472.can-17-0339 | OpenAlex W2767128594 | open access https://cancerres.aacrjournals.org/content/canres/77/21/e104.full.pdf
Semantic Scholar: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | J. V. van Griethuysen, Andrey Fedorov, C. Parmar et al. | 2017 | Cancer Research | doi 10.1158/0008-5472.CAN-17-0339 | Semantic Scholar c53fa445bee435f567828db3a0ede0f08abdd0d5 | open access https://cancerres.aacrjournals.org/content/canres/77/21/e104.full.pdf
arXiv: left out, the input has no arXiv ID
van_Griethuysen_2017: CONFIRMED against Crossref, ratio 1.00, year 2017
exit status: 0
```

### Eertink_2022

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Eertink_2022'
Crossref: ratio 1.00: Comparing lesion and feature selections to predict progression in newly diagnosed DLBCL patients with FDG PET/CT radiomics features | Jakoba J. Eertink, Gerben J. C. Zwezerijnen, Matthijs C. F. Cysouw et al. | 2022 | European Journal of Nuclear Medicine and Molecular Imaging | doi 10.1007/s00259-022-05916-4
OpenAlex: ratio 1.00: Comparing lesion and feature selections to predict progression in newly diagnosed DLBCL patients with FDG PET/CT radiomics features | Jakoba Johanna Eertink, Gerben J.C. Zwezerijnen, Matthijs C. F. Cysouw et al. | 2022 | European Journal of Nuclear Medicine and Molecular Imaging | doi 10.1007/s00259-022-05916-4 | OpenAlex W4289731019 | open access https://link.springer.com/content/pdf/10.1007/s00259-022-05916-4.pdf
Semantic Scholar: ratio 1.00: Comparing lesion and feature selections to predict progression in newly diagnosed DLBCL patients with FDG PET/CT radiomics features | J. Eertink, G. Zwezerijnen, M. Cysouw et al. | 2022 | European Journal of Nuclear Medicine and Molecular Imaging | doi 10.1007/s00259-022-05916-4 | Semantic Scholar b427a6023c07092d5e80d00c12c167a02ef5acb3 | open access https://link.springer.com/content/pdf/10.1007/s00259-022-05916-4.pdf
arXiv: left out, the input has no arXiv ID
Eertink_2022: CONFIRMED against Crossref, ratio 1.00, year 2022
exit status: 0
```

### Wilk_2025

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Wilk_2025'
Crossref: ratio 1.00: Towards the use of multiple ROIs for radiomics-based survival modelling: Finding a strategy of aggregating lesions | Agata Ma<latin small letter l with stroke>gorzata Wilk, Andrzej Swierniak, Andrea d<right single quotation mark>Amico et al. | 2025 | Computer Methods and Programs in Biomedicine | doi 10.1016/j.cmpb.2025.108840
OpenAlex: ratio 1.00: Towards the use of multiple ROIs for radiomics-based survival modelling: Finding a strategy of aggregating lesions | Agata Wilk, Andrzej <latin capital letter s with acute>wierniak, Andrea d<right single quotation mark>Amico et al. | 2025 | Computer Methods and Programs in Biomedicine | doi 10.1016/j.cmpb.2025.108840 | OpenAlex W4410633222 | open access https://doi.org/10.1016/j.cmpb.2025.108840
Semantic Scholar: ratio 1.00: Towards the use of multiple ROIs for radiomics-based survival modelling: Finding a strategy of aggregating lesions | A. Wilk, A. <latin capital letter s with acute>wierniak, A. d'Amico et al. | 2024 | Comput. Methods Programs Biomed. | doi 10.1016/j.cmpb.2025.108840 | arXiv 2405.17668 | Semantic Scholar 249a09066113e0dcbe349655d8b96f9b7e034959 | open access https://doi.org/10.1016/j.cmpb.2025.108840
arXiv: left out, the input has no arXiv ID
Wilk_2025: CONFIRMED against Crossref, ratio 1.00, year 2025
exit status: 0
```

### Siless_2020

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Siless_2020'
Crossref: ratio 1.00: Registration-free analysis of diffusion MRI tractography data across subjects through the human lifespan | Viviana Siless, Juliet Y. Davidow, Jared Nielsen et al. | 2020 | NeuroImage | doi 10.1016/j.neuroimage.2020.116703
OpenAlex: ratio 1.00: Registration-free analysis of diffusion MRI tractography data across subjects through the human lifespan | Viviana Siless, Juliet Y. Davidow, Jared Allen Nielsen et al. | 2020 | NeuroImage | doi 10.1016/j.neuroimage.2020.116703 | OpenAlex W3009225680 | open access https://www.sciencedirect.com/science/article/pii/S1053811920301907/pdf
Semantic Scholar: ratio 1.00: Registration-free analysis of diffusion MRI tractography data across subjects through the human lifespan | V. Siless, Juliet Y. Davidow, J. Nielsen et al. | 2020 | NeuroImage | doi 10.1016/j.neuroimage.2020.116703 | Semantic Scholar 8a23cf1f9ce755790b974779d3eee5e02eb4ea47 | open access https://www.sciencedirect.com/science/article/pii/S1053811920301907/pdf
arXiv: left out, the input has no arXiv ID
Siless_2020: CONFIRMED against Crossref, ratio 1.00, year 2020
exit status: 0
```

### Gerber_2023

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Gerber_2023'
Crossref: ratio 1.00: Optimal transport features for morphometric population analysis | Samuel Gerber, Marc Niethammer, Ebrahim Ebrahim et al. | 2023 | Medical Image Analysis | doi 10.1016/j.media.2022.102696
OpenAlex: ratio 1.00: Optimal transport features for morphometric population analysis | Samuel Gerber, Marc Niethammer, Ebrahim Ebrahim et al. | 2022 | Medical Image Analysis | doi 10.1016/j.media.2022.102696 | OpenAlex W4309763215 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841522003243
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
Gerber_2023: CONFIRMED against Crossref, ratio 1.00, year 2023
exit status: 0
```

### Salim_2026

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Salim_2026'
Crossref: ratio 1.00: MRI Radiomics for Survival Prediction in Brain Metastases: A Machine Learning Analysis | Hamza Adel Salim, Evan Calabrese, Ahmed Naeem et al. | 2026 | American Journal of Neuroradiology | doi 10.3174/ajnr.a9630
OpenAlex: ratio 1.00: MRI Radiomics for Survival Prediction in Brain Metastases: A Machine Learning Analysis | Hamza Adel Salim, Evan Calabrese, Ahmed Naeem et al. | 2026 | American Journal of Neuroradiology | doi 10.3174/ajnr.a9630 | OpenAlex W7212006807 | open access https://doi.org/10.3174/ajnr.a9630
Semantic Scholar: ratio 1.00: MRI Radiomics for Survival Prediction in Brain Metastases: A Machine Learning Analysis. | H. Salim, E. Calabrese, A. Naeem et al. | 2026 | AJNR. American journal of neuroradiology | doi 10.3174/ajnr.A9630 | Semantic Scholar e8beb2f18dbc8406e07591d87ae8611a34d45c72 | open access https://doi.org/10.3174/ajnr.a9630
arXiv: left out, the input has no arXiv ID
Salim_2026: CONFIRMED against Crossref, ratio 1.00, year 2026
exit status: 0
```

### Qahqaie_2026

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Qahqaie_2026'
Crossref: ratio 1.00: Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors | Melika Qahqaie, Dominik Neumann, Tobias Heimann et al. | 2026 | 2026 IEEE 23rd International Symposium on Biomedical Imaging (ISBI) | doi 10.1109/isbi61048.2026.11516053
OpenAlex: ratio 1.00: Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors | Melika Qahqaie, Dominik Neumann, Tobias Heimann et al. | 2026 | IEEE International Symposium on Biomedical Imaging (ISBI) | doi 10.1109/isbi61048.2026.11516053 | OpenAlex W7161792725 | open access https://arxiv.org/pdf/2602.09933
Semantic Scholar: ratio 1.00: Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors | Melika Qahqaie, D. Neumann, T. Heimann et al. | 2026 | IEEE International Symposium on Biomedical Imaging | doi 10.1109/ISBI61048.2026.11516053 | arXiv 2602.09933 | Semantic Scholar 63b626e5debc3e636866c5faa73952b606e53433 | open access https://arxiv.org/pdf/2602.09933
arXiv: left out, the input has no arXiv ID
Qahqaie_2026: CONFIRMED against Crossref, ratio 1.00, year 2026
exit status: 0
```

### arxiv_2208_00993

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_2208_00993'
Crossref: not found
OpenAlex: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yifei Ren, Jian Lou, Xiong Li et al. | 2022 | arXiv (Cornell University) | doi 10.48550/arxiv.2208.00993 | arXiv 2208.00993 | OpenAlex W4289597181 | open access https://arxiv.org/pdf/2208.00993
Semantic Scholar: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yi-Fei Ren, Jian Lou, Li Xiong et al. | 2022 | arXiv.org | doi 10.48550/arXiv.2208.00993 | arXiv 2208.00993 | Semantic Scholar e8aa9a0fe21c23d18c872475a1f92ef9ab7cd4b7 | open access http://arxiv.org/pdf/2208.00993
arXiv: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yifei Ren, Jian Lou, Li Xiong et al. | 2022 | arXiv 2208.00993
arxiv_2208_00993: CONFIRMED against OpenAlex, ratio 0.83, year 2022; year 2023 found on https://proceedings.mlr.press/v225/ren23a.html
exit status: 0
```

### arxiv_1612_00593

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_1612_00593'
Crossref: not found
OpenAlex: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | Charles R. Qi, Hao Su, Kaichun Mo et al. | 2016 | arXiv (Cornell University) | doi 10.48550/arxiv.1612.00593 | arXiv 1612.00593 | OpenAlex W2950642167 | open access https://arxiv.org/pdf/1612.00593
Semantic Scholar: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | R. Q. Charles, Hao Su, K. Mo et al. | 2016 | Computer Vision and Pattern Recognition | doi 10.1109/CVPR.2017.16 | arXiv 1612.00593 | Semantic Scholar d997beefc0922d97202789d2ac307c55c2c52fba
arXiv: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | Charles R. Qi, Hao Su, Kaichun Mo et al. | 2016 | arXiv 1612.00593
arxiv_1612_00593: CONFIRMED against OpenAlex, ratio 1.00, year 2016; year 2017 found on https://openaccess.thecvf.com/content_cvpr_2017/html/Qi_PointNet_Deep_Learning_CVPR_2017_paper.html
exit status: 0
```

### Zwanenburg_2020

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Zwanenburg_2020'
Crossref: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping | Alex Zwanenburg, Martin Valli<latin small letter e with grave>res, Mahmoud A. Abdalah et al. | 2020 | Radiology | doi 10.1148/radiol.2020191145
OpenAlex: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping | Alex Zwanenburg, Martin Valli<latin small letter e with grave>res, Mahmoud A. Abdalah et al. | 2020 | Radiology | doi 10.1148/radiol.2020191145 | OpenAlex W2998789541 | open access https://research.rug.nl/files/119920642/The_Image_Biomarker_Standardization_Initiative_Standardized_Quantitative_Radiomics_for_High_Throughput_Image_based_Phenotyping.pdf
Semantic Scholar: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping. | A. Zwanenburg, M. Valli<latin small letter e with grave>res, M. Abdalah et al. | 2016 | Radiology | doi 10.1148/radiol.2020191145 | arXiv 1612.07003 | Semantic Scholar 41dfe7b56b3009500dad81a348cd39941cdfb716 | open access https://research.rug.nl/files/119920642/The_Image_Biomarker_Standardization_Initiative_Standardized_Quantitative_Radiomics_for_High_Throughput_Image_based_Phenotyping.pdf
arXiv: left out, the input has no arXiv ID
Zwanenburg_2020: CONFIRMED against Crossref, ratio 1.00, year 2020
exit status: 0
```

### Aerts_2014

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Aerts_2014'
Crossref: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | Hugo J. W. L. Aerts, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar et al. | 2014 | Nature Communications | doi 10.1038/ncomms5006
OpenAlex: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | Hugo J.W.L. Aerts, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar et al. | 2014 | Nature Communications | doi 10.1038/ncomms5006 | OpenAlex W2103004421 | open access https://www.nature.com/articles/ncomms5006.pdf
Semantic Scholar: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | H. Aerts, E. Velazquez, R. Leijenaar et al. | 2014 | Nature Communications | doi 10.1038/ncomms5006 | Semantic Scholar 3b002068646831a6f59fabb6daeb0209ed54049d | open access https://www.nature.com/articles/ncomms5006.pdf
arXiv: left out, the input has no arXiv ID
Aerts_2014: CONFIRMED against Crossref, ratio 1.00, year 2014
exit status: 0
```

### Chang_2021

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Chang_2021'
Crossref: ratio 1.00: Comparison of radiomic feature aggregation methods for patients with multiple tumors | Enoch Chang, Marina Z. Joel, Hannah Y. Chang et al. | 2021 | Scientific Reports | doi 10.1038/s41598-021-89114-6
OpenAlex: ratio 1.00: Comparison of radiomic feature aggregation methods for patients with multiple tumors | Enoch Chang, Marina Z. Joel, Hannah Chang et al. | 2021 | Scientific Reports | doi 10.1038/s41598-021-89114-6 | OpenAlex W3161801268 | open access https://www.nature.com/articles/s41598-021-89114-6.pdf
Semantic Scholar: ratio 1.00: Comparison of radiomic feature aggregation methods for patients with multiple tumors | E. Chang, M. Joel, Hannah Y. Chang et al. | 2020 | Scientific Reports | doi 10.1038/s41598-021-89114-6 | Semantic Scholar 08815602754aff969a49addd8277be128aa50bb7 | open access https://www.nature.com/articles/s41598-021-89114-6.pdf
arXiv: left out, the input has no arXiv ID
Chang_2021: CONFIRMED against Crossref, ratio 1.00, year 2021
exit status: 0
```

### arxiv_2111_00648

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_2111_00648'
Crossref: not found
OpenAlex: ratio 1.00: Accurate Point Cloud Registration with Robust Optimal Transport | Zhengyang Shen, Jean Feydy, Peirong Liu et al. | 2021 | PubMed | doi 10.48550/arxiv.2111.00648 | arXiv 2111.00648 | OpenAlex W3214180234 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13474259/
Semantic Scholar: ratio 1.00: Accurate Point Cloud Registration with Robust Optimal Transport | Zhengyang Shen, J. Feydy, Peirong Liu et al. | 2021 | Neural Information Processing Systems | doi 10.48550/arXiv.2111.00648 | arXiv 2111.00648 | Semantic Scholar ed076f369b558a0813d7e8b7e20c4d07587578f4 | open access https://arxiv.org/pdf/2111.00648
arXiv: ratio 1.00: Accurate Point Cloud Registration with Robust Optimal Transport | Zhengyang Shen, Jean Feydy, Peirong Liu et al. | 2021 | arXiv 2111.00648
arxiv_2111_00648: CONFIRMED against OpenAlex, ratio 1.00, year 2021
exit status: 0
```

### Kiers_1999

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Kiers_1999'
Crossref: ratio 1.00: PARAFAC2<em dash>Part I. A direct fitting algorithm for the PARAFAC2 model | Henk A. L. Kiers, Jos M. F. ten Berge, Rasmus Bro | 1999 | Journal of Chemometrics | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b
OpenAlex: ratio 0.99: PARAFAC2 - Part I. A direct fitting algorithm for the PARAFAC2 model | Henk A. L. Kiers, Jos M. F. ten Berge, Rasmus Bro | 1999 | Journal of Chemometrics | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b | OpenAlex W2167838035
Semantic Scholar: ratio 1.00: PARAFAC2<em dash>Part I. A direct fitting algorithm for the PARAFAC2 model | H. Kiers, J. T. ten Berge, R. Bro | 1999 | doi 10.1002/(SICI)1099-128X(199905/08)13:3/4<275::AID-CEM543>3.0.CO;2-B | Semantic Scholar a2c846e976575e84a1471fb1d042d7f5e04b3417
arXiv: left out, the input has no arXiv ID
Kiers_1999: CONFIRMED against Crossref, ratio 1.00, year 1999
exit status: 0
```

### Perros_2017

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Perros_2017'
Crossref: ratio 1.00: SPARTan | Ioakeim Perros, Evangelos E. Papalexakis, Fei Wang et al. | 2017 | Proceedings of the 23rd ACM SIGKDD International Conference on Knowledge Discovery and Data Mining | doi 10.1145/3097983.3098014
OpenAlex: DOI_MISMATCH, ratio 0.26: SPARTan: Scalable PARAFAC2 for Large & Sparse Data | Ioakeim Perros, Evangelos E. Papalexakis, Fei Wang et al. | 2017 | ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD) | doi 10.1145/3097983.3098014 | OpenAlex W2604652149
Semantic Scholar: DOI_MISMATCH, ratio 0.26: SPARTan: Scalable PARAFAC2 for Large & Sparse Data | Ioakeim Perros, E. Papalexakis, Fei Wang et al. | 2017 | Knowledge Discovery and Data Mining | doi 10.1145/3097983.3098014 | arXiv 1703.04219 | Semantic Scholar 143a2335d35c669aabb983448a3113d3abe1a8dc
arXiv: left out, the input has no arXiv ID
Perros_2017: CONFIRMED against OpenAlex, ratio 0.96, year 2017
exit status: 0
```

### Kolda_2009

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Kolda_2009'
Crossref: ratio 1.00: Tensor Decompositions and Applications | Tamara G. Kolda, Brett W. Bader | 2009 | SIAM Review | doi 10.1137/07070111x
OpenAlex: ratio 1.00: Tensor Decompositions and Applications | Tamara G. Kolda, Brett W. Bader | 2009 | SIAM Review | doi 10.1137/07070111x | OpenAlex W2024165284
Semantic Scholar: ratio 1.00: Tensor Decompositions and Applications | T. Kolda, B. Bader | 2009 | SIAM Review | doi 10.1137/07070111X | Semantic Scholar 87e43e9eba01a4eb03436c9946bf6aa031a5d5af
arXiv: left out, the input has no arXiv ID
Kolda_2009: CONFIRMED against Crossref, ratio 1.00, year 2009
exit status: 0
```

### Peyr__2019

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Peyr__2019'
Crossref: ratio 1.00: Computational Optimal Transport with Applications to Data Sciences | Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2019 | Foundations and Trends<registered sign> in Machine Learning | doi 10.1561/2200000073
OpenAlex: ratio 1.00: Computational Optimal Transport with Applications to Data Sciences | Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2019 | Foundations and Trends<registered sign> in Machine Learning | doi 10.1561/2200000073 | OpenAlex W3039256091
Semantic Scholar: DOI_MISMATCH, ratio 0.64: Computational Optimal Transport | G. Peyr<latin small letter e with acute>, Marco Cuturi | 2018 | Found. Trends Mach. Learn. | doi 10.1561/2200000073 | arXiv 1803.00567 | Semantic Scholar 8e51d68250db5637cd6bc1de98a99396441399b2 | open access https://arxiv.org/pdf/1803.00567
arXiv: left out, the input has no arXiv ID
Peyr__2019: CONFIRMED against Crossref, ratio 1.00, year 2019
exit status: 0
```

### Quellec_2017

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Quellec_2017'
Crossref: ratio 1.00: Multiple-Instance Learning for Medical Image and Video Analysis | Gwenole Quellec, Guy Cazuguel, Beatrice Cochener et al. | 2017 | IEEE Reviews in Biomedical Engineering | doi 10.1109/rbme.2017.2651164
OpenAlex: ratio 1.00: Multiple-Instance Learning for Medical Image and Video Analysis | Gwenol<latin small letter e with acute> Quellec, Guy Cazuguel, B<latin small letter e with acute>atrice Cochener et al. | 2017 | IEEE Reviews in Biomedical Engineering | doi 10.1109/rbme.2017.2651164 | OpenAlex W2571156573
Semantic Scholar: ratio 1.00: Multiple-Instance Learning for Medical Image and Video Analysis | G. Quellec, G. Cazuguel, B. Cochener et al. | 2017 | IEEE Reviews in Biomedical Engineering | doi 10.1109/RBME.2017.2651164 | Semantic Scholar 3ef6b412e0bd53198eee89f274e268f2c4031182
arXiv: left out, the input has no arXiv ID
Quellec_2017: CONFIRMED against Crossref, ratio 1.00, year 2017
exit status: 0
```

### Wang_2018

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Wang_2018'
Crossref: ratio 1.00: Revisiting multiple instance neural networks | Xinggang Wang, Yongluan Yan, Peng Tang et al. | 2018 | Pattern Recognition | doi 10.1016/j.patcog.2017.08.026
OpenAlex: ratio 1.00: Revisiting multiple instance neural networks | Xinggang Wang, Yongluan Yan, Peng Tang et al. | 2017 | Pattern Recognition | doi 10.1016/j.patcog.2017.08.026 | OpenAlex W2531897166 | open access https://arxiv.org/pdf/1610.02501
Semantic Scholar: ratio 1.00: Revisiting multiple instance neural networks | Xing-Gang Wang, Yongluan Yan, Peng Tang et al. | 2016 | Pattern Recognition | doi 10.1016/j.patcog.2017.08.026 | arXiv 1610.02501 | Semantic Scholar 0820ccfdba775c304bedb9c3d82ee8758e0a416b | open access https://arxiv.org/pdf/1610.02501
arXiv: left out, the input has no arXiv ID
Wang_2018: CONFIRMED against Crossref, ratio 1.00, year 2018
exit status: 0
```

### Gillies_2016

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Gillies_2016'
Crossref: ratio 1.00: Radiomics: Images Are More than Pictures, They Are Data | Robert J. Gillies, Paul E. Kinahan, Hedvig Hricak | 2016 | Radiology | doi 10.1148/radiol.2015151169
OpenAlex: ratio 1.00: Radiomics: Images Are More than Pictures, They Are Data | Robert J. Gillies, Paul E. Kinahan, Hedvig Hricak | 2015 | Radiology | doi 10.1148/radiol.2015151169 | OpenAlex W2174661749 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC4734157/pdf/
Semantic Scholar: ratio 1.00: Radiomics: Images Are More than Pictures, They Are Data | R. Gillies, Paul Kinahan, H. Hricak | 2015 | Radiology | doi 10.1148/radiol.2015151169 | Semantic Scholar dcd99d49af33bd14e9e0750bcf854e7b306c808a | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC4734157/pdf/
arXiv: left out, the input has no arXiv ID
Gillies_2016: CONFIRMED against Crossref, ratio 1.00, year 2016
exit status: 0
```

### Rubner_2000

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Rubner_2000'
Crossref: ratio 1.00: The Earth Mover's Distance as a Metric for Image Retrieval | Yossi Rubner, Carlo Tomasi, Leonidas J. Guibas | 2000 | International Journal of Computer Vision | doi 10.1023/a:1026543900054
OpenAlex: ratio 1.00: The Earth Mover's Distance as a Metric for Image Retrieval | Yossi Rubner, Carlo Tomasi, Leonidas Guibas | 2000 | International Journal of Computer Vision | doi 10.1023/a:1026543900054 | OpenAlex W2143668817
Semantic Scholar: ratio 1.00: The Earth Mover's Distance as a Metric for Image Retrieval | Yossi Rubner, Carlo Tomasi, L. Guibas | 2000 | International Journal of Computer Vision | doi 10.1023/A:1026543900054 | Semantic Scholar 326cfa1ffff97bd923bb6ff58d9cb6a3f60edbe5
arXiv: left out, the input has no arXiv ID
Rubner_2000: CONFIRMED against Crossref, ratio 1.00, year 2000
exit status: 0
```

### AVANTS_2008

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'AVANTS_2008'
Crossref: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | B AVANTS, C EPSTEIN, M GROSSMAN et al. | 2008 | Medical Image Analysis | doi 10.1016/j.media.2007.06.004
OpenAlex: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | Brian Avants, Charles L. Epstein, Murray Grossman et al. | 2007 | Medical Image Analysis | doi 10.1016/j.media.2007.06.004 | OpenAlex W1970928383 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2276735/
Semantic Scholar: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | B. Avants, C. Epstein, M. Grossman et al. | 2008 | Medical Image Anal. | doi 10.1016/j.media.2007.06.004 | Semantic Scholar 66b498a54843e14270b75f0c3c8fc65a0b2e1e98 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2276735/
arXiv: left out, the input has no arXiv ID
AVANTS_2008: CONFIRMED against Crossref, ratio 1.00, year 2008
exit status: 0
```

### Papastergiou_2018

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Papastergiou_2018'
Crossref: ratio 1.00: Tensor Decomposition for Multiple<hyphen>Instance Classification of High<hyphen>Order Medical Data | Thomas Papastergiou, Evangelia I. Zacharaki, Vasileios Megalooikonomou | 2018 | Complexity | doi 10.1155/2018/8651930
OpenAlex: ratio 1.00: Tensor Decomposition for Multiple<hyphen>Instance Classification of High<hyphen>Order Medical Data | <greek capital letter theta><greek small letter omega><greek small letter mu><greek small letter alpha with tonos><greek small letter final sigma> <greek capital letter pi><greek small letter alpha><greek small letter pi><greek small letter alpha><greek small letter sigma><greek small letter tau><greek small letter epsilon><greek small letter rho><greek small letter gamma><greek small letter iota with tonos><greek small letter omicron><greek small letter upsilon>, Evangelia I. Zacharaki, Vasileios Megalooikonomou | 2018 | Complexity | doi 10.1155/2018/8651930 | OpenAlex W2902739757 | open access http://downloads.hindawi.com/journals/complexity/2018/8651930.pdf
Semantic Scholar: ratio 1.00: Tensor Decomposition for Multiple-Instance Classification of High-Order Medical Data | Thomas Papastergiou, E. Zacharaki, V. Megalooikonomou | 2018 | Complex | doi 10.1155/2018/8651930 | Semantic Scholar 9781dd4a4792140ad0efccddfc6282d8f1bbb653 | open access http://downloads.hindawi.com/journals/complexity/2018/8651930.pdf
arXiv: left out, the input has no arXiv ID
Papastergiou_2018: CONFIRMED against Crossref, ratio 1.00, year 2018
exit status: 0
```

### Papastergiou_2019

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Papastergiou_2019'
Crossref: ratio 1.00: TensMIL2: Improved Multiple Instance Classification Through Tensor Decomposition and Instance Selection | Thomas Papastergiou, Evangelia I. Zacharaki, Vasileios Megalooikonomou | 2019 | 2019 27th European Signal Processing Conference (EUSIPCO) | doi 10.23919/eusipco.2019.8902500
OpenAlex: ratio 1.00: TensMIL2: Improved Multiple Instance Classification Through Tensor Decomposition and Instance Selection | <greek capital letter theta><greek small letter omega><greek small letter mu><greek small letter alpha with tonos><greek small letter final sigma> <greek capital letter pi><greek small letter alpha><greek small letter pi><greek small letter alpha><greek small letter sigma><greek small letter tau><greek small letter epsilon><greek small letter rho><greek small letter gamma><greek small letter iota with tonos><greek small letter omicron><greek small letter upsilon>, Evangelia I. Zacharaki, Vasileios Megalooikonomou | 2019 | European Signal Processing Conference (EUSIPCO) | doi 10.23919/eusipco.2019.8902500 | OpenAlex W2989094872
Semantic Scholar: ratio 1.00: TensMIL2: Improved Multiple Instance Classification Through Tensor Decomposition and Instance Selection | Thomas Papastergiou, E. Zacharaki, V. Megalooikonomou | 2019 | European Signal Processing Conference | doi 10.23919/EUSIPCO.2019.8902500 | Semantic Scholar b116e7e2121a1dd92e78ff06e136aa8f88d31251
arXiv: left out, the input has no arXiv ID
Papastergiou_2019: CONFIRMED against Crossref, ratio 1.00, year 2019
exit status: 0
```

### arxiv_1807_00094

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_1807_00094'
Crossref: not found
OpenAlex: ratio 1.00: Classification of lung nodules in CT images based on Wasserstein distance in differential geometry | Min Zhang, Qianli Ma, Chengfeng Wen et al. | 2018 | arXiv (Cornell University) | doi 10.48550/arxiv.1807.00094 | arXiv 1807.00094 | OpenAlex W2811341893 | open access https://arxiv.org/pdf/1807.00094
Semantic Scholar: ratio 1.00: Classification of lung nodules in CT images based on Wasserstein distance in differential geometry | Min Zhang, Qian-Li Ma, Cheng-Feng Wen et al. | 2018 | arXiv.org | doi 10.48550/arXiv.1807.00094 | arXiv 1807.00094 | Semantic Scholar a093877479f35f56c6085937f86aa83290f591da | open access http://arxiv.org/pdf/1807.00094
arXiv: ratio 1.00: Classification of lung nodules in CT images based on Wasserstein distance in differential geometry | Min Zhang, Qianli Ma, Chengfeng Wen et al. | 2018 | arXiv 1807.00094
arxiv_1807_00094: CONFIRMED against OpenAlex, ratio 1.00, year 2018
exit status: 0
```

### Afshar_2021

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Afshar_2021'
Crossref: ratio 1.00: SWIFT: Scalable Wasserstein Factorization for Sparse Nonnegative Tensors | Ardavan Afshar, Kejing Yin, Sherry Yan et al. | 2021 | Proceedings of the AAAI Conference on Artificial Intelligence | doi 10.1609/aaai.v35i8.16811
OpenAlex: ratio 1.00: SWIFT: Scalable Wasserstein Factorization for Sparse Nonnegative Tensors | Ardavan Afshar, Kejing Yin, Sherry Y. Yan et al. | 2021 | Proceedings of the AAAI Conference on Artificial Intelligence | doi 10.1609/aaai.v35i8.16811 | OpenAlex W3092425059 | open access https://doi.org/10.1609/aaai.v35i8.16811
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
Afshar_2021: CONFIRMED against Crossref, ratio 1.00, year 2021
exit status: 0
```

### Zhang_2020

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Zhang_2020'
Crossref: ratio 1.00: Survival-relevant high-risk subregion identification for glioblastoma patients: the MRI-based multiple instance learning approach | Xi Zhang, Di Lu, Peng Gao et al. | 2020 | European Radiology | doi 10.1007/s00330-020-06912-8
OpenAlex: ratio 1.00: Survival-relevant high-risk subregion identification for glioblastoma patients: the MRI-based multiple instance learning approach | Xi Zhang, Di Lu, Peng Gao et al. | 2020 | European Radiology | doi 10.1007/s00330-020-06912-8 | OpenAlex W3025909390
Semantic Scholar: ratio 1.00: Survival-relevant high-risk subregion identification for glioblastoma patients: the MRI-based multiple instance learning approach | Xi Zhang, Di Lu, Peng Gao et al. | 2020 | European Radiology | doi 10.1007/s00330-020-06912-8 | Semantic Scholar 88099e53306c5aa7bd56892ad29e16a6855d914d
arXiv: left out, the input has no arXiv ID
Zhang_2020: CONFIRMED against Crossref, ratio 1.00, year 2020
exit status: 0
```

### Li_2021

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Li_2021'
Crossref: ratio 1.00: Dual-stream Multiple Instance Learning Network for Whole Slide Image Classification with Self-supervised Contrastive Learning | Bin Li, Yin Li, Kevin W. Eliceiri | 2021 | 2021 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR) | doi 10.1109/cvpr46437.2021.01409
OpenAlex: ratio 1.00: Dual-stream Multiple Instance Learning Network for Whole Slide Image Classification with Self-supervised Contrastive Learning | Bin Li, Yin Li, Kevin W. Eliceiri | 2021 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | doi 10.1109/cvpr46437.2021.01409 | OpenAlex W3176719058 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8765709/
Semantic Scholar: ratio 1.00: Dual-stream Multiple Instance Learning Network for Whole Slide Image Classification with Self-supervised Contrastive Learning | Bin Li, Yin Li, K. Eliceiri | 2020 | Computer Vision and Pattern Recognition | doi 10.1109/CVPR46437.2021.01409 | arXiv 2011.08939 | Semantic Scholar fc3a214aa4da4a4407c071f056d945bc41893875 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8765709/
arXiv: left out, the input has no arXiv ID
Li_2021: CONFIRMED against Crossref, ratio 1.00, year 2021
exit status: 0
```

### Dietterich_1997

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Dietterich_1997'
Crossref: ratio 1.00: Solving the multiple instance problem with axis-parallel rectangles | Thomas G. Dietterich, Richard H. Lathrop, Tom<latin small letter a with acute>s Lozano-P<latin small letter e with acute>rez | 1997 | Artificial Intelligence | doi 10.1016/s0004-3702(96)00034-3
OpenAlex: ratio 1.00: Solving the multiple instance problem with axis-parallel rectangles | Thomas G. Dietterich, Richard H. Lathrop, Tom<latin small letter a with acute>s Lozano<hyphen>P<latin small letter e with acute>rez | 1997 | Artificial Intelligence | doi 10.1016/s0004-3702(96)00034-3 | OpenAlex W2110119381 | open access https://www.sciencedirect.com/science/article/pii/S0004370296000343/pdf
Semantic Scholar: ratio 1.00: Solving the Multiple Instance Problem with Axis-Parallel Rectangles | Thomas G. Dietterich, R. Lathrop, Tomas Lozano-Perez | 1997 | Artificial Intelligence | doi 10.1016/S0004-3702(96)00034-3 | Semantic Scholar 1c7d38f68fe1150895a186e30b60c02dd89a676a | open access https://www.sciencedirect.com/science/article/pii/S0004370296000343/pdf
arXiv: left out, the input has no arXiv ID
Dietterich_1997: CONFIRMED against Crossref, ratio 1.00, year 1997
exit status: 0
```

### Chikontwe_2020

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Chikontwe_2020'
Crossref: ratio 1.00: Multiple Instance Learning with Center Embeddings for Histopathology Classification | Philip Chikontwe, Meejeong Kim, Soo Jeong Nam et al. | 2020 | Lecture Notes in Computer Science | doi 10.1007/978-3-030-59722-1_50
OpenAlex: ratio 1.00: Multiple Instance Learning with Center Embeddings for Histopathology Classification | Philip Chikontwe, Meejeong Kim, Soo Jeong Nam et al. | 2020 | Lecture notes in computer science | doi 10.1007/978-3-030-59722-1_50 | OpenAlex W3091730259
Semantic Scholar: ratio 1.00: Multiple Instance Learning with Center Embeddings for Histopathology Classification | Philip Chikontwe, Meejeong Kim, S. Nam et al. | 2020 | International Conference on Medical Image Computing and Computer-Assisted Intervention | doi 10.1007/978-3-030-59722-1_50 | Semantic Scholar 67e35996c3ac0e528f23d481fbb06e5ac0f19fd3
arXiv: left out, the input has no arXiv ID
Chikontwe_2020: CONFIRMED against Crossref, ratio 1.00, year 2020
exit status: 0
```

### Carbonneau_2018

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Carbonneau_2018'
Crossref: ratio 1.00: Multiple instance learning: A survey of problem characteristics and applications | Marc-Andr<latin small letter e with acute> Carbonneau, Veronika Cheplygina, Eric Granger et al. | 2018 | Pattern Recognition | doi 10.1016/j.patcog.2017.10.009
OpenAlex: ratio 1.00: Multiple instance learning: A survey of problem characteristics and applications | Marc<hyphen>Andr<latin small letter e with acute> Carbonneau, Veronika Cheplygina, <latin capital letter e with acute>ric Granger et al. | 2017 | Pattern Recognition | doi 10.1016/j.patcog.2017.10.009 | OpenAlex W2560886373 | open access https://research.tue.nl/files/90279032/carbonneau2017multiple.pdf
Semantic Scholar: ratio 1.00: Multiple instance learning: A survey of problem characteristics and applications | Marc-Andr<latin small letter e with acute> Carbonneau, V. Cheplygina, Eric Granger et al. | 2016 | Pattern Recognition | doi 10.1016/j.patcog.2017.10.009 | arXiv 1612.03365 | Semantic Scholar 1ba54fdb71e4f77447460616908f1b931e61c251 | open access https://research.tue.nl/files/90279032/carbonneau2017multiple.pdf
arXiv: left out, the input has no arXiv ID
Carbonneau_2018: CONFIRMED against Crossref, ratio 1.00, year 2018
exit status: 0
```

### Zhu_2022

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Zhu_2022'
Crossref: ratio 1.00: A pre-treatment CT-based weighted radiomic approach combined with clinical characteristics to predict durable clinical benefits of immunotherapy in advanced lung cancer | Zhenchen Zhu, Minjiang Chen, Ge Hu et al. | 2022 | European Radiology | doi 10.1007/s00330-022-09337-7
OpenAlex: ratio 1.00: A pre-treatment CT-based weighted radiomic approach combined with clinical characteristics to predict durable clinical benefits of immunotherapy in advanced lung cancer | Zhenchen Zhu, Minjiang Chen, Ge Hu et al. | 2022 | European Radiology | doi 10.1007/s00330-022-09337-7 | OpenAlex W4311357663 | open access https://link.springer.com/content/pdf/10.1007/s00330-022-09337-7.pdf
Semantic Scholar: ratio 1.00: A pre-treatment CT-based weighted radiomic approach combined with clinical characteristics to predict durable clinical benefits of immunotherapy in advanced lung cancer | Zhen-Chen Zhu, M. Chen, Genwu Hu et al. | 2022 | European Radiology | doi 10.1007/s00330-022-09337-7 | Semantic Scholar a727a3b79e5550e7a36912cc611b64d853580094 | open access https://link.springer.com/content/pdf/10.1007/s00330-022-09337-7.pdf
arXiv: left out, the input has no arXiv ID
Zhu_2022: CONFIRMED against Crossref, ratio 1.00, year 2022
exit status: 0
```

### Xu_2024

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Xu_2024'
Crossref: ratio 1.00: A hybrid few-shot multiple-instance learning model predicting the aggressiveness of lymphoma in PET/CT images | Caiwen Xu, Jie Feng, Yong Yue et al. | 2024 | Computer Methods and Programs in Biomedicine | doi 10.1016/j.cmpb.2023.107872
OpenAlex: ratio 1.00: A hybrid few-shot multiple-instance learning model predicting the aggressiveness of lymphoma in PET/CT images | Caiwen Xu, Jie Feng, Yong Yue et al. | 2023 | Computer Methods and Programs in Biomedicine | doi 10.1016/j.cmpb.2023.107872 | OpenAlex W4387709474
Semantic Scholar: ratio 1.00: A hybrid few-shot multiple-instance learning model predicting the aggressiveness of lymphoma in PET/CT images | Caiwen Xu, Jie Feng, Yong Yue et al. | 2023 | Comput. Methods Programs Biomed. | doi 10.1016/j.cmpb.2023.107872 | Semantic Scholar a26876a071cdb44ba6da2338a326e0ca88e7ad28
arXiv: left out, the input has no arXiv ID
Xu_2024: CONFIRMED against Crossref, ratio 1.00, year 2024
exit status: 0
```

### Zhu_2026

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Zhu_2026'
Crossref: ratio 1.00: M2OTCA: Multiple-magnification optimal transport-based cross-attention learning for whole slide image classification | Zhonghang Zhu, Erik Meijering, Liansheng Wang | 2026 | Medical Image Analysis | doi 10.1016/j.media.2026.104082
OpenAlex: ratio 1.00: M2OTCA: Multiple-magnification optimal transport-based cross-attention learning for whole slide image classification | Zhonghang Zhu, Erik H. W. Meijering, L S Wang | 2026 | Medical Image Analysis | doi 10.1016/j.media.2026.104082 | OpenAlex W7154842214
Semantic Scholar: ratio 1.00: M2OTCA: Multiple-magnification optimal transport-based cross-attention learning for whole slide image classification | Zhonghang Zhu, E. Meijering, Lian-Sheng Wang | 2026 | Medical Image Anal. | doi 10.1016/j.media.2026.104082 | Semantic Scholar 2f93f5f0ab5de846e5411ce0f023828d0a31a051
arXiv: left out, the input has no arXiv ID
Zhu_2026: CONFIRMED against Crossref, ratio 1.00, year 2026
exit status: 0
```

### arxiv_2603_06465

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_2603_06465'
Crossref: not found
OpenAlex: ratio 1.00: Risk Prediction in Cancer Imaging Using Enriched Radiomics Features | Alec Reinhardt, Tsung-Hung Yao, Raven Hollis et al. | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2603.06465 | arXiv 2603.06465 | OpenAlex W7134240461 | open access https://arxiv.org/pdf/2603.06465
Semantic Scholar: ratio 1.00: Risk Prediction in Cancer Imaging Using Enriched Radiomics Features | Alec Reinhardt, Tsung-Hung Yao, Raven J. Hollis et al. | 2026 | arXiv 2603.06465 | Semantic Scholar 3086f868dc47c8772c27390b8b21896cb7507aaf
arXiv: ratio 1.00: Risk Prediction in Cancer Imaging Using Enriched Radiomics Features | Alec Reinhardt, Tsung-Hung Yao, Raven Hollis et al. | 2026 | arXiv 2603.06465
arxiv_2603_06465: CONFIRMED against OpenAlex, ratio 1.00, year 2026
exit status: 0
```

### Cui_2023

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Cui_2023'
Crossref: ratio 1.00: Retrieval-Augmented Multiple Instance Learning | Yufei Cui, Ziquan Liu, Yixin Chen et al. | 2023 | Advances in Neural Information Processing Systems 36 | doi 10.52202/075280-1080
OpenAlex: ratio 1.00: Retrieval-Augmented Multiple Instance Learning | Yufei Cui, Ziquan Liu, Yixin Chen et al. | 2023 | neural information processing systems | doi 10.52202/075280-1080 | OpenAlex W7133239875 | open access https://discovery.ucl.ac.uk/10181255/1/8098_retrieval_augmented_multiple_i.pdf
Semantic Scholar: ratio 1.00: Retrieval-Augmented Multiple Instance Learning | Yufei Cui, Zi-Quan Liu, Yi-Xin Chen et al. | 2023 | Neural Information Processing Systems | doi 10.52202/075280-1080 | Semantic Scholar 64eb5e1e8e8ae9a4fd9495d380f89f80eccf60c6 | open access https://discovery.ucl.ac.uk/10181255/1/8098_retrieval_augmented_multiple_i.pdf
arXiv: left out, the input has no arXiv ID
Cui_2023: CONFIRMED against Crossref, ratio 1.00, year 2023
exit status: 0
```

### Diao_2024

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Diao_2024'
Crossref: ratio 1.00: A multi-instance tumor subtype classification method for small PET datasets using RA-DL attention module guided deep feature extraction with radiomics features | Zhaoshuo Diao, Huiyan Jiang | 2024 | Computers in Biology and Medicine | doi 10.1016/j.compbiomed.2024.108461
OpenAlex: ratio 1.00: A multi-instance tumor subtype classification method for small PET datasets using RA-DL attention module guided deep feature extraction with radiomics features | Zhaoshuo Diao, Huiyan Jiang | 2024 | Computers in Biology and Medicine | doi 10.1016/j.compbiomed.2024.108461 | OpenAlex W4394602543
Semantic Scholar: ratio 1.00: A multi-instance tumor subtype classification method for small PET datasets using RA-DL attention module guided deep feature extraction with radiomics features | Zhao-Shuo Diao, Hui-Yan Jiang | 2024 | Comput. Biol. Medicine | doi 10.1016/j.compbiomed.2024.108461 | Semantic Scholar 02f269347bc41db4fb65f47f12955ec92c28d013
arXiv: left out, the input has no arXiv ID
Diao_2024: CONFIRMED against Crossref, ratio 1.00, year 2024
exit status: 0
```

### Masson_Grehaigne_2024

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Masson_Grehaigne_2024'
Crossref: ratio 1.00: Enhancing Immunotherapy Response Prediction in Metastatic Lung Adenocarcinoma: Leveraging Shallow and Deep Learning with CT-Based Radiomics across Single and Multiple Tumor Sites | C<latin small letter e with acute>cile Masson-Grehaigne, Mathilde Lafon, Jean Palussi<latin small letter e with grave>re et al. | 2024 | Cancers | doi 10.3390/cancers16132491
OpenAlex: ratio 1.00: Enhancing Immunotherapy Response Prediction in Metastatic Lung Adenocarcinoma: Leveraging Shallow and Deep Learning with CT-Based Radiomics across Single and Multiple Tumor Sites | C<latin small letter e with acute>cile Masson-Grehaigne, Mathilde Lafon, Jean Palussi<latin small letter e with grave>re et al. | 2024 | Cancers | doi 10.3390/cancers16132491 | OpenAlex W4400409036 | open access https://doi.org/10.3390/cancers16132491
Semantic Scholar: ratio 1.00: Enhancing Immunotherapy Response Prediction in Metastatic Lung Adenocarcinoma: Leveraging Shallow and Deep Learning with CT-Based Radiomics across Single and Multiple Tumor Sites | C<latin small letter e with acute>cile Masson-Grehaigne, Mathilde Lafon, J. Palussiere et al. | 2024 | Cancers | doi 10.3390/cancers16132491 | Semantic Scholar 0a2ec7ea1ad677613993175c870622b2b186b7cc | open access https://doi.org/10.3390/cancers16132491
arXiv: left out, the input has no arXiv ID
Masson_Grehaigne_2024: CONFIRMED against Crossref, ratio 1.00, year 2024
exit status: 0
```

### Huang_2026

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Huang_2026'
Crossref: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and Computing | doi 10.1007/s11222-026-10892-y
OpenAlex: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and Computing | doi 10.1007/s11222-026-10892-y | OpenAlex W7160305416 | open access https://link.springer.com/content/pdf/10.1007/s11222-026-10892-y.pdf
Semantic Scholar: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and computing | doi 10.1007/s11222-026-10892-y | Semantic Scholar 0022f9272776da223a17c89c95429f0a0c3d07cc | open access https://link.springer.com/content/pdf/10.1007/s11222-026-10892-y.pdf
arXiv: left out, the input has no arXiv ID
Huang_2026: CONFIRMED against Crossref, ratio 1.00, year 2026
exit status: 0
```

### Zhu_2024

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Zhu_2024'
Crossref: ratio 1.00: Wasserstein HOG: Local Directionality Extraction via Optimal Transport | Jiening Zhu, Harini Veeraraghavan, Jue Jiang et al. | 2024 | IEEE Transactions on Medical Imaging | doi 10.1109/tmi.2023.3325295
OpenAlex: ratio 1.00: Wasserstein HOG: Local Directionality Extraction via Optimal Transport | Jiening Zhu, Harini Veeraraghavan, Jue Jiang et al. | 2023 | IEEE Transactions on Medical Imaging | doi 10.1109/tmi.2023.3325295 | OpenAlex W4387917825 | open access https://ieeexplore.ieee.org/ielx7/42/4359023/10294260.pdf
Semantic Scholar: ratio 1.00: Wasserstein HOG: Local Directionality Extraction via Optimal Transport | Jie-Ning Zhu, H. Veeraraghavan, Jue Jiang et al. | 2023 | IEEE Transactions on Medical Imaging | doi 10.1109/TMI.2023.3325295 | Semantic Scholar c27381099ca6ec9bb0bf9426c04acea2724cc0f7 | open access https://ieeexplore.ieee.org/ielx7/42/4359023/10294260.pdf
arXiv: left out, the input has no arXiv ID
Zhu_2024: CONFIRMED against Crossref, ratio 1.00, year 2024
exit status: 0
```

### Wang_2024b

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Wang_2024b'
Crossref: ratio 1.00: Graph Classification via Reference Distribution Learning: Theory and Practice | Zixiao Wang, Jicong Fan | 2024 | Advances in Neural Information Processing Systems 37 | doi 10.52202/079017-4374
OpenAlex: ratio 1.00: Graph Classification via Reference Distribution Learning: Theory and Practice | Zixiao Wang, Jicong Fan | 2024 | neural information processing systems | doi 10.52202/079017-4374 | OpenAlex W4415800566 | open access https://arxiv.org/pdf/2408.11370
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
Wang_2024b: CONFIRMED against Crossref, ratio 1.00, year 2024
exit status: 0
```

### arxiv_2407_00224

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_2407_00224'
Crossref: not found
OpenAlex: ratio 1.00: Multimodal Prototyping for cancer survival prediction | Andrew H. Song, Richard J. Chen, Guillaume Jaume et al. | 2024 | arXiv (Cornell University) | doi 10.48550/arxiv.2407.00224 | arXiv 2407.00224 | OpenAlex W4400267184 | open access https://arxiv.org/pdf/2407.00224
Semantic Scholar: ratio 1.00: Multimodal Prototyping for cancer survival prediction | Andrew H. Song, Richard J. Chen, G. Jaume et al. | 2024 | International Conference on Machine Learning | doi 10.48550/arXiv.2407.00224 | arXiv 2407.00224 | Semantic Scholar 94af1268bab97e78c28c583cdab2283d81a8faa3
arXiv: ratio 1.00: Multimodal Prototyping for cancer survival prediction | Andrew H. Song, Richard J. Chen, Guillaume Jaume et al. | 2024 | arXiv 2407.00224
arxiv_2407_00224: CONFIRMED against OpenAlex, ratio 1.00, year 2024
exit status: 0
```

### arxiv_2502_04907

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_2502_04907'
Crossref: not found
OpenAlex: ratio 1.00: Scalable Learning from Probability Measures with Mean Measure Quantization | Erell Gachon, Elsa Cazelles, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot | 2025 | Transactions on machine learning research | doi 10.48550/arxiv.2502.04907 | arXiv 2502.04907 | OpenAlex W4407310041 | open access https://openreview.net/forum?id=eA4cQkY7Ug
Semantic Scholar: ratio 1.00: Scalable Learning from Probability Measures with Mean Measure Quantization | E. Gachon, Elsa Cazelles, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot | 2025 | Trans. Mach. Learn. Res. | arXiv 2502.04907 | Semantic Scholar 71a4510715ee81fa63630aa1d78488f2a4023560
arXiv: ratio 1.00: Scalable Learning from Probability Measures with Mean Measure Quantization | Erell Gachon, Elsa Cazelles, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot | 2025 | arXiv 2502.04907
arxiv_2502_04907: CONFIRMED against OpenAlex, ratio 1.00, year 2025
exit status: 0
```

### Shan_2022

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Shan_2022'
Crossref: ratio 1.00: Transparent single-cell set classification with kernel mean embeddings | Siyuan Shan, Vishal Athreya Baskaran, Haidong Yi et al. | 2022 | Proceedings of the 13th ACM International Conference on Bioinformatics, Computational Biology and Health Informatics | doi 10.1145/3535508.3545538
OpenAlex: ratio 1.00: Transparent single-cell set classification with kernel mean embeddings | Siyuan Shan, Vishal Athreya Baskaran, Haidong Yi et al. | 2022 | ACM International Conference on Bioinformatics, Computational Biology, and Health Informatics (ACM-BCB) | doi 10.1145/3535508.3545538 | OpenAlex W4283728205 | open access https://arxiv.org/pdf/2201.07322
Semantic Scholar: ratio 1.00: Transparent single-cell set classification with kernel mean embeddings | Siyuan Shan, Vishal Baskaran, Haidong Yi et al. | 2022 | ACM International Conference on Bioinformatics, Computational Biology and Biomedicine | doi 10.1145/3535508.3545538 | arXiv 2201.07322 | Semantic Scholar 8b53a3fd19f7ecd4fd00afb2df9a2ceff5ce4597 | open access https://arxiv.org/pdf/2201.07322
arXiv: left out, the input has no arXiv ID
Shan_2022: CONFIRMED against Crossref, ratio 1.00, year 2022
exit status: 0
```

### Wang_2024a

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Wang_2024a'
Crossref: ratio 1.00: Rethinking Multiple Instance Learning for Whole Slide Image Classification: A Bag-Level Classifier is a Good Instance-Level Teacher | Hongyi Wang, Luyang Luo, Fang Wang et al. | 2024 | IEEE Transactions on Medical Imaging | doi 10.1109/tmi.2024.3404549
OpenAlex: ratio 1.00: Rethinking Multiple Instance Learning for Whole Slide Image Classification: A Bag-Level Classifier is a Good Instance-Level Teacher | Hongyi Wang, Luyang Luo, Fang Wang et al. | 2024 | IEEE Transactions on Medical Imaging | doi 10.1109/tmi.2024.3404549 | OpenAlex W4398250457 | open access https://arxiv.org/pdf/2312.01099
Semantic Scholar: ratio 1.00: Rethinking Multiple Instance Learning for Whole Slide Image Classification: A Bag-Level Classifier is a Good Instance-Level Teacher | Hong-Yi Wang, Lu-Yang Luo, Fang Wang et al. | 2023 | IEEE Transactions on Medical Imaging | doi 10.1109/TMI.2024.3404549 | arXiv 2312.01099 | Semantic Scholar 78d5536963704f628aa77a132cacb78383869e6a | open access https://arxiv.org/pdf/2312.01099
arXiv: left out, the input has no arXiv ID
Wang_2024a: CONFIRMED against Crossref, ratio 1.00, year 2024
exit status: 0
```

### Lysukhin_2025

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Lysukhin_2025'
Crossref: ratio 1.00: Multiple-Instance Learning for thyroid gland disease classification: A hands-on experience | Daniil Lysukhin, Andrey Varlamov, Boris Yakimov et al. | 2025 | Computers in Biology and Medicine | doi 10.1016/j.compbiomed.2024.109424
OpenAlex: ratio 1.00: Multiple-Instance Learning for thyroid gland disease classification: A hands-on experience | <cyrillic capital letter de><cyrillic small letter a><cyrillic small letter en><cyrillic small letter i><cyrillic small letter i><cyrillic small letter el> <cyrillic capital letter de><cyrillic small letter em><cyrillic small letter i><cyrillic small letter te><cyrillic small letter er><cyrillic small letter i><cyrillic small letter ie><cyrillic small letter ve><cyrillic small letter i><cyrillic small letter che> <cyrillic capital letter el><cyrillic small letter yeru><cyrillic small letter es><cyrillic small letter u><cyrillic small letter ha><cyrillic small letter i><cyrillic small letter en>, A. V. Varlamov, Boris P. Yakimov et al. | 2024 | Computers in Biology and Medicine | doi 10.1016/j.compbiomed.2024.109424 | OpenAlex W4404838760
Semantic Scholar: ratio 1.00: Multiple-Instance Learning for thyroid gland disease classification: A hands-on experience | D. Lysukhin, A. Varlamov, B. Yakimov et al. | 2024 | Comput. Biol. Medicine | doi 10.1016/j.compbiomed.2024.109424 | Semantic Scholar 18eaccee0283ccce375134ae35c177bc71bc333b
arXiv: left out, the input has no arXiv ID
Lysukhin_2025: CONFIRMED against Crossref, ratio 1.00, year 2025
exit status: 0
```

### Thi_ry_2023

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Thi_ry_2023'
Crossref: ratio 1.00: Medical Application of Geometric Deep Learning for the Diagnosis of Glaucoma | Alexandre H. Thi<latin small letter e with acute>ry, Fabian Braeu, Tin A. Tun et al. | 2023 | Translational Vision Science &amp; Technology | doi 10.1167/tvst.12.2.23
OpenAlex: ratio 1.00: Medical Application of Geometric Deep Learning for the Diagnosis of Glaucoma | Alexandre H. Thi<latin small letter e with acute>ry, Fabian Albert Braeu, Tin A. Tun et al. | 2023 | Translational Vision Science & Technology | doi 10.1167/tvst.12.2.23 | OpenAlex W4320857295 | open access https://tvst.arvojournals.org/arvo/content_public/journal/tvst/938623/i2164-2591-12-2-23_1676453202.99957.pdf
Semantic Scholar: ratio 1.00: Medical Application of Geometric Deep Learning for the Diagnosis of Glaucoma | Alexandre H. Thi<latin small letter e with acute>ry, F. Braeu, Tun A. Tin et al. | 2022 | Translational Vision Science & Technology | doi 10.1167/tvst.12.2.23 | arXiv 2204.07004 | Semantic Scholar fac7887b9d02c815c848c273c12d25b13dc0f9a8 | open access https://tvst.arvojournals.org/arvo/content_public/journal/tvst/938623/i2164-2591-12-2-23_1676453202.99957.pdf
arXiv: left out, the input has no arXiv ID
Thi_ry_2023: CONFIRMED against Crossref, ratio 1.00, year 2023
exit status: 0
```

### Sabouri_2025

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Sabouri_2025'
Crossref: ratio 1.00: Enhancing PRRT Outcome Prediction in Neuroendocrine Tumors: Aggregated Multi-Lesion PET Radiomics Incorporating Inter-Tumor Heterogeneity | Maziar Sabouri, Ghasem Hajianfar, Omid Gharibi et al. | 2025 | Cancers | doi 10.3390/cancers17233887
OpenAlex: ratio 1.00: Enhancing PRRT Outcome Prediction in Neuroendocrine Tumors: Aggregated Multi-Lesion PET Radiomics Incorporating Inter-Tumor Heterogeneity | Maziar Sabouri, Ghasem Hajianfar, Omid Gharibi et al. | 2025 | Cancers | doi 10.3390/cancers17233887 | OpenAlex W4417040418 | open access https://www.mdpi.com/2072-6694/17/23/3887/pdf?version=1764866061
Semantic Scholar: ratio 1.00: Enhancing PRRT Outcome Prediction in Neuroendocrine Tumors: Aggregated Multi-Lesion PET Radiomics Incorporating Inter-Tumor Heterogeneity | M. Sabouri, G. Hajianfar, O. Gharibi et al. | 2025 | Cancers | doi 10.3390/cancers17233887 | Semantic Scholar b6c80b3360f5bbe7b61a42afcd9cae858674e833 | open access https://www.mdpi.com/2072-6694/17/23/3887/pdf?version=1764866061
arXiv: left out, the input has no arXiv ID
Sabouri_2025: CONFIRMED against Crossref, ratio 1.00, year 2025
exit status: 0
```

### Belkhatir_2022

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Belkhatir_2022'
Crossref: ratio 1.00: Wasserstein-based texture analysis in radiomic studies | Zehor Belkhatir, Ra<latin small letter u with acute>l San Jos<latin small letter e with acute> Est<latin small letter e with acute>par, Allen R. Tannenbaum | 2022 | Computerized Medical Imaging and Graphics | doi 10.1016/j.compmedimag.2022.102129
OpenAlex: ratio 1.00: Wasserstein-based texture analysis in radiomic studies | Zehor Belkhatir, Ra<latin small letter u with acute>l San Jo<latin small letter s with acute>e Est<latin small letter e with acute>par, Allen Tannenbaum | 2022 | Computerized Medical Imaging and Graphics | doi 10.1016/j.compmedimag.2022.102129 | OpenAlex W4306767793 | open access https://www.sciencedirect.com/science/article/pii/S0895611122000994/pdf
Semantic Scholar: ratio 1.00: Wasserstein-based texture analysis in radiomic studies | Z. Belkhatir, Ra<latin small letter u with acute>l San Jos<latin small letter e with acute> Est<latin small letter e with acute>par, A. Tannenbaum | 2022 | Comput. Medical Imaging Graph. | doi 10.1016/j.compmedimag.2022.102129 | Semantic Scholar 6371fe7d39af4b20ccc6e76fad7448a7ebded86d | open access https://www.sciencedirect.com/science/article/pii/S0895611122000994/pdf
arXiv: left out, the input has no arXiv ID
Belkhatir_2022: CONFIRMED against Crossref, ratio 1.00, year 2022
exit status: 0
```

### Zhang_2022

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Zhang_2022'
Crossref: ratio 1.00: DTFD-MIL: Double-Tier Feature Distillation Multiple Instance Learning for Histopathology Whole Slide Image Classification | Hongrun Zhang, Yanda Meng, Yitian Zhao et al. | 2022 | 2022 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR) | doi 10.1109/cvpr52688.2022.01824
OpenAlex: ratio 1.00: DTFD-MIL: Double-Tier Feature Distillation Multiple Instance Learning for Histopathology Whole Slide Image Classification | Hongrun Zhang, Yanda Meng, Yitian Zhao et al. | 2022 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | doi 10.1109/cvpr52688.2022.01824 | OpenAlex W4312765357 | open access https://arxiv.org/pdf/2203.12081
Semantic Scholar: ratio 1.00: DTFD-MIL: Double-Tier Feature Distillation Multiple Instance Learning for Histopathology Whole Slide Image Classification | Hong-Run Zhang, Yan-Da Meng, Yitian Zhao et al. | 2022 | Computer Vision and Pattern Recognition | doi 10.1109/CVPR52688.2022.01824 | arXiv 2203.12081 | Semantic Scholar e27c59ca5853172ce28b6a0e3967ec693611820b | open access https://arxiv.org/pdf/2203.12081
arXiv: left out, the input has no arXiv ID
Zhang_2022: CONFIRMED against Crossref, ratio 1.00, year 2022
exit status: 0
```

### Niu_2026

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Niu_2026'
Crossref: ratio 1.00: AGE-MIL: Anchor-Guided Evidence Learning for Patient-Level Prediction | Jiawei Niu, Jian Chen, Di Zhang et al. | 2026 | Lecture Notes in Computer Science | doi 10.1007/978-3-032-38224-5_2
OpenAlex: ratio 1.00: AGE-MIL: Anchor-Guided Evidence Learning for Patient-Level Prediction | Jiawei Niu, Jian Chen (15340), Di Zhang et al. | 2026 | Lecture notes in computer science | doi 10.1007/978-3-032-38224-5_2 | OpenAlex W7164380536 | open access https://arxiv.org/pdf/2606.12126
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
Niu_2026: CONFIRMED against Crossref, ratio 0.99, year 2026
exit status: 0
```

### Zhao_2022

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Zhao_2022'
Crossref: ratio 1.00: Multi-lesion radiomics of PET/CT for non-invasive survival stratification and histologic tumor risk profiling in patients with lung adenocarcinoma | Meixin Zhao, Kilian Kluge, Laszlo Papp et al. | 2022 | European Radiology | doi 10.1007/s00330-022-08999-7
OpenAlex: ratio 1.00: Multi-lesion radiomics of PET/CT for non-invasive survival stratification and histologic tumor risk profiling in patients with lung adenocarcinoma | Meixin Zhao, Kilian Kluge, L<latin small letter a with acute>szl<latin small letter o with acute> Papp et al. | 2022 | European Radiology | doi 10.1007/s00330-022-08999-7 | OpenAlex W4288060250
Semantic Scholar: ratio 1.00: Multi-lesion radiomics of PET/CT for non-invasive survival stratification and histologic tumor risk profiling in patients with lung adenocarcinoma | Mei-Xin Zhao, K. Kluge, L. Papp et al. | 2022 | European Radiology | doi 10.1007/s00330-022-08999-7 | Semantic Scholar 6bf3e49f105c6bffe5b44dbe57aa2fbef3c28103
arXiv: left out, the input has no arXiv ID
Zhao_2022: CONFIRMED against Crossref, ratio 1.00, year 2022
exit status: 0
```

### Andrews_2002

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Andrews_2002'
Crossref: ratio 0.93: Robust support vector machines for multiple instance learning | Mohammad H. Poursaeidi, O. Erhun Kundakcioglu | 2012 | Annals of Operations Research | doi 10.1007/s10479-012-1241-z
OpenAlex: ratio 1.00: Support Vector Machines for Multiple-Instance Learning | Stuart J. Andrews, Ioannis Tsochantaridis, Thomas Hofmann | 2002 | neural information processing systems | OpenAlex W2108745803
Semantic Scholar: ratio 1.00: Support Vector Machines for Multiple-Instance Learning | S. Andrews, Ioannis Tsochantaridis, Thomas Hofmann | 2002 | Neural Information Processing Systems | Semantic Scholar 02e68b069d9cf13c082049429ffed18a5ca5f6d0
arXiv: not found
Andrews_2002: CONFIRMED against OpenAlex, ratio 1.00, year 2002
exit status: 0
```

### Maron_1997

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Maron_1997'
Crossref: not found
OpenAlex: ratio 1.00: A Framework for Multiple-Instance Learning | Oded Maron, Tom<latin small letter a with acute>s Lozano<hyphen>P<latin small letter e with acute>rez | 1997 | neural information processing systems | OpenAlex W2154318594
Semantic Scholar: ratio 1.00: A Framework for Multiple-Instance Learning | O. Maron, Tomas Lozano-Perez | 1997 | Neural Information Processing Systems | Semantic Scholar 4d8340eae2c98ab5e0a3b1a7e071a7ddb9106cff
arXiv: not found
Maron_1997: CONFIRMED against OpenAlex, ratio 1.00, year 1997
exit status: 0
```

### Gaertner_2002

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Gaertner_2002'
Crossref: ratio 0.79: Multi-Instance Learning | SpringerReference | doi 10.1007/springerreference_179281
OpenAlex: ratio 1.00: Multi-Instance Kernels | Thomas G<latin small letter a with diaeresis>rtner, Peter A. Flach, Adam Kowalczyk et al. | 2002 | Publikationsdatenbank der Fraunhofer-Gesellschaft (Fraunhofer-Gesellschaft) | OpenAlex W1535599202
Semantic Scholar: ratio 1.00: Multi-Instance Kernels | Thomas G<latin small letter a with diaeresis>rtner, Peter A. Flach, A. Kowalczyk et al. | 2002 | International Conference on Machine Learning | Semantic Scholar 10c1ab4e9ad4b5c6f8298812e2aed1c615ee3ebb
arXiv: not found
Gaertner_2002: CONFIRMED against OpenAlex, ratio 1.00, year 2002
exit status: 0
```

### Ren_2025b

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Ren_2025b'
Crossref: not found
OpenAlex: ratio 1.00: Unraveling Complex Temporal Patterns in EHRs via Robust Irregular Tensor Factorization. | Ren Yifei, Linghui Zeng, Jian Lou et al. | 2025 | Europe PMC (PubMed Central) | OpenAlex W4411256920 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/12150736
Semantic Scholar: ratio 1.00: Unraveling Complex Temporal Patterns in EHRs via Robust Irregular Tensor Factorization. | Yi-Fei Ren, Linghui Zeng, Jian Lou et al. | 2025 | AMIA Joint Summits on Translational Science proceedings. AMIA Joint Summits on Translational Science | Semantic Scholar 62ab6b28755d18f87a009ee113376390899f8f2f
arXiv: not found
Ren_2025b: CONFIRMED against OpenAlex, ratio 1.00, year 2025
exit status: 0
```

### Hou_2016

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Hou_2016'
Crossref: ratio 1.00: Patch-Based Convolutional Neural Network for Whole Slide Tissue Image Classification | Le Hou, Dimitris Samaras, Tahsin M. Kurc et al. | 2016 | 2016 IEEE Conference on Computer Vision and Pattern Recognition (CVPR) | doi 10.1109/cvpr.2016.266
OpenAlex: ratio 1.00: Patch-Based Convolutional Neural Network for Whole Slide Tissue Image Classification | Le Hou, Dimitris Samaras, Tahsin Kur<latin small letter c with cedilla> et al. | 2016 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | doi 10.1109/cvpr.2016.266 | OpenAlex W2302302587 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/5085270
Semantic Scholar: ratio 1.00: Patch-based Convolutional Neural Network for Whole Slide Tissue Image Classification | L. Hou, D. Samaras, T. Kur<latin small letter c with cedilla> et al. | 2015 | Computer Vision and Pattern Recognition | doi 10.1109/CVPR.2016.266 | arXiv 1504.07947 | Semantic Scholar 004ef85f9c53dc0db6dc3adc1ca8ecb71f7a06b4 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/5085270
arXiv: left out, the input has no arXiv ID
Hou_2016: CONFIRMED against Crossref, ratio 1.00, year 2016
exit status: 0
```

### arxiv_1910_10825

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'arxiv_1910_10825'
Crossref: not found
OpenAlex: ratio 1.00: Semi-Supervised Histology Classification using Deep Multiple Instance Learning and Contrastive Predictive Coding | Ming Y. Lu, Richard J. Chen, Jingwen Wang et al. | 2019 | arXiv (Cornell University) | doi 10.48550/arxiv.1910.10825 | arXiv 1910.10825 | OpenAlex W2981684510 | open access https://arxiv.org/pdf/1910.10825
Semantic Scholar: ratio 1.00: Semi-Supervised Histology Classification using Deep Multiple Instance Learning and Contrastive Predictive Coding | Ming Y. Lu, Richard J. Chen, Jingwen Wang et al. | 2019 | arXiv.org | doi 10.48550/arXiv.1910.10825 | arXiv 1910.10825 | Semantic Scholar e2d38145232176a4b94dc8988c33d919534d31e1 | open access http://arxiv.org/pdf/1910.10825
arXiv: ratio 1.00: Semi-Supervised Histology Classification using Deep Multiple Instance Learning and Contrastive Predictive Coding | Ming Y. Lu, Richard J. Chen, Jingwen Wang et al. | 2019 | arXiv 1910.10825
arxiv_1910_10825: CONFIRMED against OpenAlex, ratio 1.00, year 2019
exit status: 0
```

### Feng_2017

```
$ python3 lookup resolve --entry '/work/run/refs.bib' 'Feng_2017'
Crossref: ratio 1.00: Deep MIML Network | Ji Feng, Zhi-Hua Zhou | 2017 | Proceedings of the AAAI Conference on Artificial Intelligence | doi 10.1609/aaai.v31i1.10890
OpenAlex: ratio 1.00: Deep MIML Network | Ji Feng, Zhi-Hua Zhou | 2017 | Proceedings of the AAAI Conference on Artificial Intelligence | doi 10.1609/aaai.v31i1.10890 | OpenAlex W4293861233 | open access https://doi.org/10.1609/aaai.v31i1.10890
Semantic Scholar: ratio 1.00: Deep MIML Network | Ji Feng, Zhi-Hua Zhou | 2017 | AAAI Conference on Artificial Intelligence | doi 10.1609/aaai.v31i1.10890 | Semantic Scholar fc2d509a5aae61806feffefe11f23926e834dd39 | open access https://doi.org/10.1609/aaai.v31i1.10890
arXiv: left out, the input has no arXiv ID
Feng_2017: CONFIRMED against Crossref, ratio 1.00, year 2017
exit status: 0
```

