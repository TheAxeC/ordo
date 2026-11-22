# Resolve of each entry of the lit-review run

Step 5, part 6 of the brief (case C8). Each entry the `paper` side's lit-review run wrote to its `refs.bib` (session 2437b798, `paper-runs/lit-review-2026-11-15/refs.bib`, 84 entries) was resolved by its title and year with `python3 skills/paper/templates/lookup.py resolve '<title>' --year <year>`, run from the ordo checkout by `resolve_all.py` in the session's scratchpad. An entry resolves when a line of the output reads `ratio <r>` with `r` at 0.70 or more and, for an entry with a DOI, that line's DOI equals the entry's DOI.

Runs:
- First run: 84 entries, output `lit-review-resolve.txt`.
- Retry: the five entries left by the first run, output `lit-review-resolve-retry.txt`. van_Griethuysen_2017 and Shifat_E_Rabbi_2025a resolved.
- Second retry, 2026-11-15 10:50 UTC: Kolda_2009, Agueh_2011 and Bonneel_2016, output `lit-review-resolve-retry2.txt`. OpenAlex and Semantic Scholar answered HTTP 429 after 3 retries on every call; `curl -s -o /dev/null -w '%{http_code}' 'https://api.openalex.org/works?search=tensor%20decompositions%20and%20applications&per-page=1'` printed 429.

For the three entries not resolved, `curl -s https://api.crossref.org/works/<doi>` on the entry's own DOI printed:
- 10.1137/07070111x: "Tensor Decompositions and Applications", 2009, SIAM Review.
- 10.1137/100805741: "Barycenters in the Wasserstein Space", 2011, SIAM Journal on Mathematical Analysis.
- 10.1145/2897824.2925918: "Wasserstein barycentric coordinates", 2016, ACM Transactions on Graphics. The entry's title adds the subtitle "histogram regression using optimal transport".

These DOI lookups are not the gate's check, which is the resolve by title; the three entries fail the clause and are raised to Axel as an open item.

The output of each entry below is its latest run.

entries 84, resolved 81, not resolved 3: Kolda_2009, Agueh_2011, Bonneel_2016

resolved (lit-review-resolve.txt)

```
### Zhou_2013
entry: title='Tensor Regression with Applications in Neuroimaging Data Analysis' year=2013 doi=10.1080/01621459.2013.776499
$ skills/paper/templates/lookup.py resolve 'Tensor Regression with Applications in Neuroimaging Data Analysis' --year 2013
Crossref: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Lexin Li, Hongtu Zhu | 2013 | Journal of the American Statistical Association | doi 10.1080/01621459.2013.776499
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Lexin Li, Hongtu Zhu | 2012 | doi 10.1080/01621459.2013.776499 | arXiv 1203.3209
```

resolved (lit-review-resolve.txt)

```
### Qibin_Zhao_2013
entry: title='Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method' year=2013 doi=10.1109/tpami.2012.254
$ skills/paper/templates/lookup.py resolve 'Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method' --year 2013
Crossref: ratio 1.00: Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method | Qibin Zhao, C. F. Caiafa, D. P. Mandic et al. | 2013 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/tpami.2012.254
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

NOT RESOLVED (lit-review-resolve-retry2.txt)

```
### Kolda_2009
entry: title='Tensor Decompositions and Applications' year=2009 doi=10.1137/07070111x
$ skills/paper/templates/lookup.py resolve 'Tensor Decompositions and Applications' --year 2009
Crossref: ratio 0.94: Tensor Decompositions: Applications | Algorithmic Aspects of Machine Learning | doi 10.1017/9781316882177.005
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Li_2018
entry: title='Tucker Tensor Regression and Neuroimaging Analysis' year=2018 doi=10.1007/s12561-018-9215-6
$ skills/paper/templates/lookup.py resolve 'Tucker Tensor Regression and Neuroimaging Analysis' --year 2018
Crossref: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiaoshan Li, Da Xu, Hua Zhou et al. | 2018 | Statistics in Biosciences | doi 10.1007/s12561-018-9215-6
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiaoshan Li, Hua Zhou, Lexin Li | 2013 | arXiv 1304.5637
```

resolved (lit-review-resolve.txt)

```
### Zhang_2017
entry: title='Tensor Envelope Partial Least-Squares Regression' year=2017 doi=10.1080/00401706.2016.1272495
$ skills/paper/templates/lookup.py resolve 'Tensor Envelope Partial Least-Squares Regression' --year 2017
Crossref: ratio 1.00: Tensor Envelope Partial Least-Squares Regression | Xin Zhang, Lexin Li | 2017 | Technometrics | doi 10.1080/00401706.2016.1272495
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Yan_2019
entry: title='Structured Point Cloud Data Analysis Via Regularized Tensor Regression for Process Modeling and Optimization' year=2019 doi=10.1080/00401706.2018.1529628
$ skills/paper/templates/lookup.py resolve 'Structured Point Cloud Data Analysis Via Regularized Tensor Regression for Process Modeling and Optimization' --year 2019
Crossref: ratio 1.00: Structured Point Cloud Data Analysis Via Regularized Tensor Regression for Process Modeling and Optimization | Hao Yan, Kamran Paynabar, Massimo Pacella | 2019 | Technometrics | doi 10.1080/00401706.2018.1529628
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Structured Point Cloud Data Analysis via Regularized Tensor Regression for Process Modeling and Optimization | Hao Yan, Kamran Paynabar, Massimo Pacella | 2018 | doi 10.1080/00401706.2018.1529628 | arXiv 1807.10278
```

resolved (lit-review-resolve.txt)

```
### Tang_2026
entry: title='Tensor Decomposition with Unaligned Observations' year=2026 doi=10.1137/24m1692836
$ skills/paper/templates/lookup.py resolve 'Tensor Decomposition with Unaligned Observations' --year 2026
Crossref: ratio 1.00: Tensor Decomposition with Unaligned Observations | Runshi Tang, Tamara G. Kolda, Anru R. Zhang | 2026 | SIAM Journal on Matrix Analysis and Applications | doi 10.1137/24m1692836
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Tensor Decomposition with Unaligned Observations | Runshi Tang, Tamara Kolda, Anru R. Zhang | 2024 | arXiv 2410.14046
```

resolved (lit-review-resolve.txt)

```
### Perros_2017
entry: title='SPARTan: Scalable PARAFAC2 for Large & Sparse Data' year=2017 doi=10.1145/3097983.3098014
$ skills/paper/templates/lookup.py resolve 'SPARTan: Scalable PARAFAC2 for Large & Sparse Data' --year 2017
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 1.00: SPARTan: Scalable PARAFAC2 for Large & Sparse Data | Ioakeim Perros, E. Papalexakis, Fei Wang et al. | 2017 | Knowledge Discovery and Data Mining | doi 10.1145/3097983.3098014 | arXiv 1703.04219 | Semantic Scholar 143a2335d35c669aabb983448a3113d3abe1a8dc
arXiv: ratio 1.00: SPARTan: Scalable PARAFAC2 for Large & Sparse Data | Ioakeim Perros, Evangelos E. Papalexakis, Fei Wang et al. | 2017 | arXiv 1703.04219
```

resolved (lit-review-resolve.txt)

```
### arxiv_2208_00993
entry: title='MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning' year=2022 doi=None
$ skills/paper/templates/lookup.py resolve 'MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning' --year 2022
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yifei Ren, Jian Lou, Li Xiong et al. | 2022 | arXiv 2208.00993
```

resolved (lit-review-resolve.txt)

```
### arxiv_2609_23705
entry: title='PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data' year=2026 doi=None
$ skills/paper/templates/lookup.py resolve 'PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data' --year 2026
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data | Mariafrancesca Patalano, Elif Konyar, Kamran Paynabar | 2026 | arXiv 2609.23705
```

resolved (lit-review-resolve.txt)

```
### Wang_2026
entry: title='A Bayesian Sparse Kronecker Product Decomposition Framework for Tensor Predictors With Mixed<hyphen>Type Responses: Applications to Neuroimaging Data Mining' year=2026 doi=10.1002/sam.70106
$ skills/paper/templates/lookup.py resolve 'A Bayesian Sparse Kronecker Product Decomposition Framework for Tensor Predictors With Mixed<hyphen>Type Responses: Applications to Neuroimaging Data Mining' --year 2026
Crossref: ratio 1.00: A Bayesian Sparse Kronecker Product Decomposition Framework for Tensor Predictors With Mixed<hyphen>Type Responses: Applications to Neuroimaging Data Mining | Shao<hyphen>Hsuan Wang, Hsin<hyphen>Hsiung Huang | 2026 | Statistical Analysis and Data Mining: An ASA Data Science Journal | doi 10.1002/sam.70106
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### He_2026
entry: title='An ensemble approach to tensor learning' year=2026 doi=10.1177/09622802261424654
$ skills/paper/templates/lookup.py resolve 'An ensemble approach to tensor learning' --year 2026
Crossref: ratio 1.00: An ensemble approach to tensor learning | Jiaxin He, Jialiang Li | 2026 | Statistical Methods in Medical Research | doi 10.1177/09622802261424654
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Pietrosanu_2026
entry: title='Regularized Tensor Quantile Regression With Applications to Neuroimaging Data Analysis' year=2026 doi=10.1002/sim.70582
$ skills/paper/templates/lookup.py resolve 'Regularized Tensor Quantile Regression With Applications to Neuroimaging Data Analysis' --year 2026
Crossref: ratio 1.00: Regularized Tensor Quantile Regression With Applications to Neuroimaging Data Analysis | Matthew Pietrosanu, Dengdeng Yu, Ivan Mizera et al. | 2026 | Statistics in Medicine | doi 10.1002/sim.70582
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Konyar_2025
entry: title='Semi-Supervised PARAFAC2 Decomposition for Computational Phenotyping Using Electronic Health Records' year=2025 doi=10.1109/jbhi.2025.3530271
$ skills/paper/templates/lookup.py resolve 'Semi-Supervised PARAFAC2 Decomposition for Computational Phenotyping Using Electronic Health Records' --year 2025
Crossref: ratio 1.00: Semi-Supervised PARAFAC2 Decomposition for Computational Phenotyping Using Electronic Health Records | Elif Konyar, Mostafa Reisi Gahrooei | 2025 | IEEE Journal of Biomedical and Health Informatics | doi 10.1109/jbhi.2025.3530271
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### arxiv_2505_12113
entry: title='Cyclic-Shift Sparse Kronecker Tensor Classifier for Signal-Region Detection in Neuroimaging' year=2025 doi=None
$ skills/paper/templates/lookup.py resolve 'Cyclic-Shift Sparse Kronecker Tensor Classifier for Signal-Region Detection in Neuroimaging' --year 2025
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Cyclic-Shift Sparse Kronecker Tensor Classifier for Signal-Region Detection in Neuroimaging | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2025 | arXiv 2505.12113
```

resolved (lit-review-resolve.txt)

```
### arxiv_2506_20065
entry: title='Supervised Coupled Matrix-Tensor Factorization (SCMTF) for Computational Phenotyping of Patient Reported Outcomes in Ulcerative Colitis' year=2025 doi=None
$ skills/paper/templates/lookup.py resolve 'Supervised Coupled Matrix-Tensor Factorization (SCMTF) for Computational Phenotyping of Patient Reported Outcomes in Ulcerative Colitis' --year 2025
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Supervised Coupled Matrix-Tensor Factorization (SCMTF) for Computational Phenotyping of Patient Reported Outcomes in Ulcerative Colitis | Cristian Minoccheri, Sophia Tesic, Kayvan Najarian et al. | 2025 | arXiv 2506.20065
```

resolved (lit-review-resolve.txt)

```
### arxiv_1306_0895
entry: title='Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances' year=2013 doi=None
$ skills/paper/templates/lookup.py resolve 'Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances' --year 2013
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 0.89: Sinkhorn Distances: Lightspeed Computation of Optimal Transport | Marco Cuturi | 2013 | Neural Information Processing Systems | arXiv 1306.0895 | Semantic Scholar 0080118b0eb02af581ff32b85a1bb6aed7081f45
arXiv: ratio 1.00: Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances | Marco Cuturi | 2013 | arXiv 1306.0895
```

resolved (lit-review-resolve.txt)

```
### Peyr__2019
entry: title='Computational Optimal Transport with Applications to Data Sciences' year=2019 doi=10.1561/2200000073
$ skills/paper/templates/lookup.py resolve 'Computational Optimal Transport with Applications to Data Sciences' --year 2019
Crossref: ratio 1.00: Computational Optimal Transport with Applications to Data Sciences | Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2019 | Foundations and Trends<registered sign> in Machine Learning | doi 10.1561/2200000073
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Benamou_2015
entry: title='Iterative Bregman Projections for Regularized Transportation Problems' year=2015 doi=10.1137/141000439
$ skills/paper/templates/lookup.py resolve 'Iterative Bregman Projections for Regularized Transportation Problems' --year 2015
Crossref: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | Jean-David Benamou, Guillaume Carlier, Marco Cuturi et al. | 2015 | SIAM Journal on Scientific Computing | doi 10.1137/141000439
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | Jean-David Benamou, Guillaume Carlier, Marco Cuturi et al. | 2014 | arXiv 1412.5154
```

resolved (lit-review-resolve.txt)

```
### arxiv_1810_08278
entry: title='Interpolating between Optimal Transport and MMD using Sinkhorn Divergences' year=2018 doi=None
$ skills/paper/templates/lookup.py resolve 'Interpolating between Optimal Transport and MMD using Sinkhorn Divergences' --year 2018
Crossref: ratio 0.75: Interpolating between Optimal Transport and KL Regularized Optimal Transport using R<latin small letter e with acute>nyi Divergences | Jonas Bresch, Viktor Stein | 2025 | Results in Mathematics | doi 10.1007/s00025-025-02579-z
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Interpolating between Optimal Transport and MMD using Sinkhorn Divergences | Jean Feydy, Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard et al. | 2018 | arXiv 1810.08278
```

resolved (lit-review-resolve.txt)

```
### Montesuma_2025
entry: title='Recent Advances in Optimal Transport for Machine Learning' year=2025 doi=10.1109/tpami.2024.3489030
$ skills/paper/templates/lookup.py resolve 'Recent Advances in Optimal Transport for Machine Learning' --year 2025
Crossref: ratio 1.00: Recent Advances in Optimal Transport for Machine Learning | Eduardo Fernandes Montesuma, Fred Maurice Ngol<latin small letter e with grave> Mboula, Antoine Souloumiac | 2025 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/tpami.2024.3489030
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Recent Advances in Optimal Transport for Machine Learning | Eduardo Fernandes Montesuma, Fred Ngol<latin small letter e with grave> Mboula, Antoine Souloumiac | 2023 | arXiv 2306.16156
```

resolved (lit-review-resolve.txt)

```
### arxiv_1805_09114
entry: title='Optimal Transport for structured data with application on graphs' year=2018 doi=None
$ skills/paper/templates/lookup.py resolve 'Optimal Transport for structured data with application on graphs' --year 2018
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, Laetitia Chapel, R<latin small letter e with acute>mi Flamary et al. | 2018 | arXiv 1805.09114
```

resolved (lit-review-resolve.txt)

```
### Vayer_2020
entry: title='Fused Gromov-Wasserstein Distance for Structured Objects' year=2020 doi=10.3390/a13090212
$ skills/paper/templates/lookup.py resolve 'Fused Gromov-Wasserstein Distance for Structured Objects' --year 2020
Crossref: ratio 1.00: Fused Gromov-Wasserstein Distance for Structured Objects | Titouan Vayer, Laetitia Chapel, Remi Flamary et al. | 2020 | Algorithms | doi 10.3390/a13090212
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### arxiv_2009_04266
entry: title='The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation' year=2020 doi=None
$ skills/paper/templates/lookup.py resolve 'The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation' --year 2020
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation | Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, Gabriel Peyr<latin small letter e with acute> | 2020 | arXiv 2009.04266
```

resolved (lit-review-resolve.txt)

```
### Zhang_2024
entry: title='Gromov<en dash>Wasserstein distances: Entropic regularization, duality and sample complexity' year=2024 doi=10.1214/24-aos2406
$ skills/paper/templates/lookup.py resolve 'Gromov<en dash>Wasserstein distances: Entropic regularization, duality and sample complexity' --year 2024
Crossref: ratio 1.00: Gromov<en dash>Wasserstein distances: Entropic regularization, duality and sample complexity | Zhengxin Zhang, Ziv Goldfeld, Youssef Mroueh et al. | 2024 | The Annals of Statistics | doi 10.1214/24-aos2406
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Gromov-Wasserstein Distances: Entropic Regularization, Duality, and Sample Complexity | Zhengxin Zhang, Ziv Goldfeld, Youssef Mroueh et al. | 2022 | arXiv 2212.12848
```

resolved (lit-review-resolve.txt)

```
### arxiv_1906_01277
entry: title='Wasserstein Weisfeiler-Lehman Graph Kernels' year=2019 doi=None
$ skills/paper/templates/lookup.py resolve 'Wasserstein Weisfeiler-Lehman Graph Kernels' --year 2019
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Wasserstein Weisfeiler-Lehman Graph Kernels | Matteo Togninalli, Elisabetta Ghisu, Felipe Llinares-L<latin small letter o with acute>pez et al. | 2019 | arXiv 1906.01277
```

resolved (lit-review-resolve.txt)

```
### Cang_2025
entry: title='Supervised Gromov<en dash>Wasserstein Optimal Transport with Metric-Preserving Constraints' year=2025 doi=10.1137/24m1630499
$ skills/paper/templates/lookup.py resolve 'Supervised Gromov<en dash>Wasserstein Optimal Transport with Metric-Preserving Constraints' --year 2025
Crossref: ratio 1.00: Supervised Gromov<en dash>Wasserstein Optimal Transport with Metric-Preserving Constraints | Zixuan Cang, Yaqi Wu, Yanxiang Zhao | 2025 | SIAM Journal on Mathematics of Data Science | doi 10.1137/24m1630499
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Seyedi_2026
entry: title='Conditional Gromov<en dash>Wasserstein matching across contexts: theory, regularization, and applications to brain connectivity' year=2026 doi=10.1186/s40708-026-00336-8
$ skills/paper/templates/lookup.py resolve 'Conditional Gromov<en dash>Wasserstein matching across contexts: theory, regularization, and applications to brain connectivity' --year 2026
Crossref: ratio 1.00: Conditional Gromov<en dash>Wasserstein matching across contexts: theory, regularization, and applications to brain connectivity | Iman Seyedi, Francesco Archetti | 2026 | Brain Informatics | doi 10.1186/s40708-026-00336-8
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Wang_2026a
entry: title='Neural Entropic Optimal Transport and Gromov<en dash>Wasserstein Alignment' year=2026 doi=10.1109/tit.2026.3661439
$ skills/paper/templates/lookup.py resolve 'Neural Entropic Optimal Transport and Gromov<en dash>Wasserstein Alignment' --year 2026
Crossref: ratio 1.00: Neural Entropic Optimal Transport and Gromov<en dash>Wasserstein Alignment | Tao Wang, Ziv Goldfeld | 2026 | IEEE Transactions on Information Theory | doi 10.1109/tit.2026.3661439
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Neural Entropic Optimal Transport and Gromov-Wasserstein Alignment | Tao Wang, Ziv Goldfeld | 2023 | doi 10.1109/TIT.2026.3661439) | arXiv 2312.07397
```

resolved (lit-review-resolve.txt)

```
### Takeda_2025
entry: title='Unsupervised alignment in neuroscience: Introducing a toolbox for Gromov<en dash>Wasserstein optimal transport' year=2025 doi=10.1016/j.jneumeth.2025.110443
$ skills/paper/templates/lookup.py resolve 'Unsupervised alignment in neuroscience: Introducing a toolbox for Gromov<en dash>Wasserstein optimal transport' --year 2025
Crossref: ratio 1.00: Unsupervised alignment in neuroscience: Introducing a toolbox for Gromov<en dash>Wasserstein optimal transport | Ken Takeda, Masaru Sasaki, Kota Abe et al. | 2025 | Journal of Neuroscience Methods | doi 10.1016/j.jneumeth.2025.110443
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

NOT RESOLVED (lit-review-resolve-retry2.txt)

```
### Agueh_2011
entry: title='Barycenters in the Wasserstein Space' year=2011 doi=10.1137/100805741
$ skills/paper/templates/lookup.py resolve 'Barycenters in the Wasserstein Space' --year 2011
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 0.88: Penalized Barycenters in the Wasserstein Space | J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot, Elsa Cazelles, Nicolas Papadakis | 2016 | arXiv 1606.01025
```

resolved (lit-review-resolve.txt)

```
### arxiv_1310_4375
entry: title='Fast Computation of Wasserstein Barycenters' year=2013 doi=None
$ skills/paper/templates/lookup.py resolve 'Fast Computation of Wasserstein Barycenters' --year 2013
Crossref: ratio 0.91: On the computation of Wasserstein barycenters | Giovanni Puccetti, Ludger R<latin small letter u with diaeresis>schendorf, Steven Vanduffel | 2018 | SSRN Electronic Journal | doi 10.2139/ssrn.3276147
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, Arnaud Doucet | 2013 | arXiv 1310.4375
```

NOT RESOLVED (lit-review-resolve-retry2.txt)

```
### Bonneel_2016
entry: title='Wasserstein barycentric coordinates: histogram regression using optimal transport' year=2016 doi=10.1145/2897824.2925918
$ skills/paper/templates/lookup.py resolve 'Wasserstein barycentric coordinates: histogram regression using optimal transport' --year 2016
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Schmitz_2018
entry: title='Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning' year=2018 doi=10.1137/17m1140431
$ skills/paper/templates/lookup.py resolve 'Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning' --year 2018
Crossref: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning | Morgan A. Schmitz, Matthieu Heitz, Nicolas Bonneel et al. | 2018 | SIAM Journal on Imaging Sciences | doi 10.1137/17m1140431
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### arxiv_2102_06555
entry: title='Online Graph Dictionary Learning' year=2021 doi=None
$ skills/paper/templates/lookup.py resolve 'Online Graph Dictionary Learning' --year 2021
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Online Graph Dictionary Learning | C<latin small letter e with acute>dric Vincent-Cuaz, Titouan Vayer, R<latin small letter e with acute>mi Flamary et al. | 2021 | arXiv 2102.06555
```

resolved (lit-review-resolve.txt)

```
### arxiv_2205_15733
entry: title='Template based Graph Neural Network with Optimal Transport Distances' year=2022 doi=None
$ skills/paper/templates/lookup.py resolve 'Template based Graph Neural Network with Optimal Transport Distances' --year 2022
Crossref: ratio 1.00: Template Based Graph Neural Network with Optimal Transport Distances | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli et al. | 2022 | Advances in Neural Information Processing Systems 35 | doi 10.52202/068431-0857
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Template based Graph Neural Network with Optimal Transport Distances | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli et al. | 2022 | arXiv 2205.15733
```

resolved (lit-review-resolve.txt)

```
### arxiv_2202_03813
entry: title='Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters' year=2022 doi=None
$ skills/paper/templates/lookup.py resolve 'Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters' --year 2022
Crossref: ratio 0.79: Learning Graphons via Structured Gromov-Wasserstein Barycenters | Hongteng Xu, Dixin Luo, Lawrence Carin et al. | 2021 | Proceedings of the AAAI Conference on Artificial Intelligence | doi 10.1609/aaai.v35i12.17257
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters | Luc Brogat-Motte, R<latin small letter e with acute>mi Flamary, C<latin small letter e with acute>line Brouard et al. | 2022 | arXiv 2202.03813
```

resolved (lit-review-resolve.txt)

```
### Zhang_2024a
entry: title='Wasserstein Discriminant Dictionary Learning for Graph Representation' year=2024 doi=10.1109/tpami.2024.3409772
$ skills/paper/templates/lookup.py resolve 'Wasserstein Discriminant Dictionary Learning for Graph Representation' --year 2024
Crossref: ratio 1.00: Wasserstein Discriminant Dictionary Learning for Graph Representation | Tong Zhang, Guangbu Liu, Zhen Cui et al. | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | doi 10.1109/tpami.2024.3409772
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### arxiv_2006_12065
entry: title='A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention' year=2020 doi=None
$ skills/paper/templates/lookup.py resolve 'A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention' --year 2020
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, Dexiong Chen, Alexandre d'Aspremont et al. | 2020 | arXiv 2006.12065
```

resolved (lit-review-resolve.txt)

```
### arxiv_2006_04804
entry: title='Optimal Transport Graph Neural Networks' year=2020 doi=None
$ skills/paper/templates/lookup.py resolve 'Optimal Transport Graph Neural Networks' --year 2020
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Optimal Transport Graph Neural Networks | Benson Chen, Gary B<latin small letter e with acute>cigneul, Octavian-Eugen Ganea et al. | 2020 | arXiv 2006.04804
```

resolved (lit-review-resolve.txt)

```
### Beier_2025
entry: title='Tangential Fixpoint Iterations for Gromov<en dash>Wasserstein Barycenters' year=2025 doi=10.1137/24m1654804
$ skills/paper/templates/lookup.py resolve 'Tangential Fixpoint Iterations for Gromov<en dash>Wasserstein Barycenters' --year 2025
Crossref: ratio 1.00: Tangential Fixpoint Iterations for Gromov<en dash>Wasserstein Barycenters | Florian Beier, Robert Beinert | 2025 | SIAM Journal on Imaging Sciences | doi 10.1137/24m1654804
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Tangential Fixpoint Iterations for Gromov-Wasserstein Barycenters | Florian Beier, Robert Beinert | 2024 | arXiv 2403.08612
```

resolved (lit-review-resolve.txt)

```
### arxiv_1703_06114
entry: title='Deep Sets' year=2017 doi=None
$ skills/paper/templates/lookup.py resolve 'Deep Sets' --year 2017
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Deep Sets | Manzil Zaheer, Satwik Kottur, Siamak Ravanbakhsh et al. | 2017 | arXiv 1703.06114
```

resolved (lit-review-resolve.txt)

```
### Charles_2017
entry: title='PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation' year=2017 doi=10.1109/cvpr.2017.16
$ skills/paper/templates/lookup.py resolve 'PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation' --year 2017
Crossref: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | R. Qi Charles, Hao Su, Mo Kaichun et al. | 2017 | 2017 IEEE Conference on Computer Vision and Pattern Recognition (CVPR) | doi 10.1109/cvpr.2017.16
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 0.85: PointNet: Deep Learning on Point Sets for 3D Classi<latin small ligature fi>cation and Segmentation Supplementary Material | C. Qi, Hao Su, K. Mo et al. | 2017 | Semantic Scholar 8a792df25204a7c4cc8bc783047e3d52df1fd24e
arXiv: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | Charles R. Qi, Hao Su, Kaichun Mo et al. | 2016 | arXiv 1612.00593
```

resolved (lit-review-resolve.txt)

```
### arxiv_1810_00825
entry: title='Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks' year=2018 doi=None
$ skills/paper/templates/lookup.py resolve 'Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks' --year 2018
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks | Juho Lee, Yoonho Lee, Jungtaek Kim et al. | 2018 | arXiv 1810.00825
```

resolved (lit-review-resolve.txt)

```
### arxiv_1802_04712
entry: title='Attention-based Deep Multiple Instance Learning' year=2018 doi=None
$ skills/paper/templates/lookup.py resolve 'Attention-based Deep Multiple Instance Learning' --year 2018
Crossref: ratio 0.74: Attention-Based Deep Multiple Instance Learning with Adaptive Instance Sampling | Aliasghar Tarkhan, Trung Kien Nguyen, Noah Simon et al. | 2022 | 2022 IEEE 19th International Symposium on Biomedical Imaging (ISBI) | doi 10.1109/isbi52829.2022.9761661
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Attention-based Deep Multiple Instance Learning | Maximilian Ilse, Jakub M. Tomczak, Max Welling | 2018 | arXiv 1802.04712
```

resolved (lit-review-resolve.txt)

```
### arxiv_2103_03892
entry: title='Set Representation Learning with Generalized Sliced-Wasserstein Embeddings' year=2021 doi=None
$ skills/paper/templates/lookup.py resolve 'Set Representation Learning with Generalized Sliced-Wasserstein Embeddings' --year 2021
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 1.00: Set Representation Learning with Generalized Sliced-Wasserstein Embeddings | Navid Naderializadeh, Soheil Kolouri, Joseph F. Comer et al. | 2021 | arXiv.org | doi 10.48550/arXiv.2103.03892 | arXiv 2103.03892 | Semantic Scholar 8b691d878a92db2882a7c7ef6edbe7f1b4996eb5
arXiv: ratio 1.00: Set Representation Learning with Generalized Sliced-Wasserstein Embeddings | Navid Naderializadeh, Soheil Kolouri, Joseph F. Comer et al. | 2021 | arXiv 2103.03892
```

resolved (lit-review-resolve.txt)

```
### Moosm_ller_2022
entry: title='Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations' year=2022 doi=10.1093/imaiai/iaac023
$ skills/paper/templates/lookup.py resolve 'Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations' --year 2022
Crossref: ratio 1.00: Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations | Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2022 | Information and Inference: A Journal of the IMA | doi 10.1093/imaiai/iaac023
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 1.00: Linear Optimal Transport Embedding: Provable Wasserstein classification for certain rigid transformations and perturbations | Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2020 | arXiv 2008.09165 | Semantic Scholar b91cd338c11e2b87a372374f39dd6748b1040ca2
arXiv: ratio 1.00: Linear Optimal Transport Embedding: Provable Wasserstein classification for certain rigid transformations and perturbations | Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2020 | arXiv 2008.09165
```

resolved (lit-review-resolve.txt)

```
### Wang_2012
entry: title='A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images' year=2012 doi=10.1007/s11263-012-0566-z
$ skills/paper/templates/lookup.py resolve 'A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images' --year 2012
Crossref: ratio 1.00: A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images | Wei Wang, Dejan Slep<latin small letter c with caron>ev, Saurav Basu et al. | 2012 | International Journal of Computer Vision | doi 10.1007/s11263-012-0566-z
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 1.00: A linear optimal transportation framework for quantifying and visualizing variations in sets of images | Wei Wang, D. Slep<latin small letter c with caron>ev, Saurav Basu et al. | 2012 | International Journal of Computer Vision | doi 10.1007/s11263-012-0566-z | Semantic Scholar 3b1f93716ef525f2b47dcc2faec8292a686e1086 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC3667970/
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### arxiv_2401_01460
entry: title='Point Cloud Classification via Deep Set Linearized Optimal Transport' year=2024 doi=None
$ skills/paper/templates/lookup.py resolve 'Point Cloud Classification via Deep Set Linearized Optimal Transport' --year 2024
Crossref: ratio 0.75: Point Cloud Compression via Constrained Optimal Transport | Zezeng Li, Weimin Wang, Ziliang Wang et al. | 2024 | 2024 IEEE International Conference on Multimedia and Expo (ICME) | doi 10.1109/icme57554.2024.10688169
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Point Cloud Classification via Deep Set Linearized Optimal Transport | Scott Mahan, Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2024 | arXiv 2401.01460
```

resolved (lit-review-resolve.txt)

```
### arxiv_2202_03926
entry: title='Distribution Regression with Sliced Wasserstein Kernels' year=2022 doi=None
$ skills/paper/templates/lookup.py resolve 'Distribution Regression with Sliced Wasserstein Kernels' --year 2022
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Distribution Regression with Sliced Wasserstein Kernels | Dimitri Meunier, Massimiliano Pontil, Carlo Ciliberto | 2022 | arXiv 2202.03926
```

resolved (lit-review-resolve.txt)

```
### Shifat_E_Rabbi_2025
entry: title='Linear Optimal Transport Subspaces for Point Set Classification' year=2025 doi=10.1007/s10851-025-01261-x
$ skills/paper/templates/lookup.py resolve 'Linear Optimal Transport Subspaces for Point Set Classification' --year 2025
Crossref: ratio 1.00: Linear Optimal Transport Subspaces for Point Set Classification | Mohammad Shifat-E-Rabbi, Naqib Sad Pathan, Shiying Li et al. | 2025 | Journal of Mathematical Imaging and Vision | doi 10.1007/s10851-025-01261-x
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Linear optimal transport subspaces for point set classification | Mohammad Shifat E Rabbi, Naqib Sad Pathan, Shiying Li et al. | 2024 | arXiv 2403.10015
```

resolved (lit-review-resolve.txt)

```
### Beckmann_2026
entry: title='Normalized Radon Cumulative Distribution Transforms for Invariance and Robustness in Optimal Transport Based Image Classification' year=2026 doi=10.1137/25m1767741
$ skills/paper/templates/lookup.py resolve 'Normalized Radon Cumulative Distribution Transforms for Invariance and Robustness in Optimal Transport Based Image Classification' --year 2026
Crossref: ratio 1.00: Normalized Radon Cumulative Distribution Transforms for Invariance and Robustness in Optimal Transport Based Image Classification | Matthias Beckmann, Robert Beinert, Jonas Bresch | 2026 | SIAM Journal on Imaging Sciences | doi 10.1137/25m1767741
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Normalized Radon Cumulative Distribution Transforms for Invariance and Robustness in Optimal Transport Based Image Classification | Matthias Beckmann, Robert Beinert, Jonas Bresch | 2025 | arXiv 2506.08761
```

resolved (lit-review-resolve.txt)

```
### arxiv_2510_22033
entry: title='Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data' year=2025 doi=None
$ skills/paper/templates/lookup.py resolve 'Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data' --year 2025
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | Tianxiang Wang, Yingtong Ke, Dhananjay Bhaskar et al. | 2025 | arXiv 2510.22033
```

resolved (lit-review-resolve.txt)

```
### arxiv_2609_17906
entry: title='FlowLOT: Linearized Optimal Transport for Flow Cytometry Analysis' year=2026 doi=None
$ skills/paper/templates/lookup.py resolve 'FlowLOT: Linearized Optimal Transport for Flow Cytometry Analysis' --year 2026
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: FlowLOT: Linearized Optimal Transport for Flow Cytometry Analysis | Naqib Sad Pathan, Mohammad Shifat-E-Rabbi, Kristofor E. Pas et al. | 2026 | arXiv 2609.17906
```

resolved (lit-review-resolve.txt)

```
### Gramfort_2015
entry: title='Fast Optimal Transport Averaging of Neuroimaging Data' year=2015 doi=10.1007/978-3-319-19992-4_20
$ skills/paper/templates/lookup.py resolve 'Fast Optimal Transport Averaging of Neuroimaging Data' --year 2015
Crossref: ratio 1.00: Fast Optimal Transport Averaging of Neuroimaging Data | A. Gramfort, G. Peyr<latin small letter e with acute>, M. Cuturi | 2015 | Lecture Notes in Computer Science | doi 10.1007/978-3-319-19992-4_20
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Fast Optimal Transport Averaging of Neuroimaging Data | Alexandre Gramfort, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2015 | arXiv 1503.08596
```

resolved (lit-review-resolve.txt)

```
### Gerber_2018
entry: title='Exploratory Population Analysis with Unbalanced Optimal Transport' year=2018 doi=10.1007/978-3-030-00931-1_53
$ skills/paper/templates/lookup.py resolve 'Exploratory Population Analysis with Unbalanced Optimal Transport' --year 2018
Crossref: ratio 1.00: Exploratory Population Analysis with Unbalanced Optimal Transport | Samuel Gerber, Marc Niethammer, Martin Styner et al. | 2018 | Lecture Notes in Computer Science | doi 10.1007/978-3-030-00931-1_53
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 1.00: Exploratory Population Analysis with Unbalanced Optimal Transport | Samuel Gerber, M. Niethammer, M. Styner et al. | 2018 | International Conference on Medical Image Computing and Computer-Assisted Intervention | doi 10.1007/978-3-030-00931-1_53 | Semantic Scholar c6a3d4e4b42d25e1a3008b5f8c7e439b404b886a | open access https://link.springer.com/content/pdf/10.1007/978-3-030-00931-1_53.pdf
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Gerber_2023
entry: title='Optimal transport features for morphometric population analysis' year=2023 doi=10.1016/j.media.2022.102696
$ skills/paper/templates/lookup.py resolve 'Optimal transport features for morphometric population analysis' --year 2023
Crossref: ratio 1.00: Optimal transport features for morphometric population analysis | Samuel Gerber, Marc Niethammer, Ebrahim Ebrahim et al. | 2023 | Medical Image Analysis | doi 10.1016/j.media.2022.102696
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 1.00: Optimal Transport Features for Morphometric Population Analysis | Samuel Gerber, M. Niethammer, Ebrahim Ebrahim et al. | 2022 | Medical Image Anal. | doi 10.48550/arXiv.2208.05891 | arXiv 2208.05891 | Semantic Scholar 8ef583ff00879a3a66778594101cba57ca91753e | open access http://arxiv.org/pdf/2208.05891
arXiv: ratio 1.00: Optimal Transport Features for Morphometric Population Analysis | Samuel Gerber, Marc Niethammer, Ebrahim Ebrahim et al. | 2022 | arXiv 2208.05891
```

resolved (lit-review-resolve.txt)

```
### Thual_2022
entry: title='Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein' year=2022 doi=10.52202/068431-1584
$ skills/paper/templates/lookup.py resolve 'Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein' --year 2022
Crossref: ratio 1.00: Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein | Alexis Thual, Quang Huy Tran, Tatiana Zemskova et al. | 2022 | Advances in Neural Information Processing Systems 35 | doi 10.52202/068431-1584
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 1.00: Aligning individual brains with fused unbalanced Gromov Wasserstein | A. Thual, Quang-Huy Tran, T. Zemskova et al. | 2022 | Neural Information Processing Systems | doi 10.52202/068431-1584 | arXiv 2206.09398 | Semantic Scholar d67dcbf457ce55336f5c6c5c4c996ca3fda0d477
arXiv: ratio 0.99: Aligning individual brains with Fused Unbalanced Gromov-Wasserstein | Alexis Thual, Huy Tran, Tatiana Zemskova et al. | 2022 | arXiv 2206.09398
```

resolved (lit-review-resolve.txt)

```
### arxiv_2605_20883
entry: title='Learning fMRI activations dictionaries across individual geometries via optimal transport' year=2026 doi=None
$ skills/paper/templates/lookup.py resolve 'Learning fMRI activations dictionaries across individual geometries via optimal transport' --year 2026
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv 2605.20883
```

resolved (lit-review-resolve.txt)

```
### Qahqaie_2026
entry: title='Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors' year=2026 doi=10.1109/isbi61048.2026.11516053
$ skills/paper/templates/lookup.py resolve 'Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors' --year 2026
Crossref: ratio 1.00: Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors | Melika Qahqaie, Dominik Neumann, Tobias Heimann et al. | 2026 | 2026 IEEE 23rd International Symposium on Biomedical Imaging (ISBI) | doi 10.1109/isbi61048.2026.11516053
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Unbalanced optimal transport for robust longitudinal lesion evolution with registration-aware and appearance-guided priors | Melika Qahqaie, Dominik Neumann, Tobias Heimann et al. | 2026 | arXiv 2602.09933
```

resolved (lit-review-resolve.txt)

```
### arxiv_2602_07260
entry: title='3D Transport-based Morphometry (3D-TBM) for medical image analysis' year=2026 doi=None
$ skills/paper/templates/lookup.py resolve '3D Transport-based Morphometry (3D-TBM) for medical image analysis' --year 2026
Crossref: not found
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: 3D Transport-based Morphometry (3D-TBM) for medical image analysis | Hongyu Kan, Kristofor Pas, Ivan Medri et al. | 2026 | arXiv 2602.07260
```

resolved (lit-review-resolve.txt)

```
### Xu_2023
entry: title='Multimodal Optimal Transport-based Co-Attention Transformer with Global Structure Consistency for Survival Prediction' year=2023 doi=10.1109/iccv51070.2023.01942
$ skills/paper/templates/lookup.py resolve 'Multimodal Optimal Transport-based Co-Attention Transformer with Global Structure Consistency for Survival Prediction' --year 2023
Crossref: ratio 1.00: Multimodal Optimal Transport-based Co-Attention Transformer with Global Structure Consistency for Survival Prediction | Yingxue Xu, Hao Chen | 2023 | 2023 IEEE/CVF International Conference on Computer Vision (ICCV) | doi 10.1109/iccv51070.2023.01942
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Multimodal Optimal Transport-based Co-Attention Transformer with Global Structure Consistency for Survival Prediction | Yingxue Xu, Hao Chen | 2023 | arXiv 2306.08330
```

resolved (lit-review-resolve.txt)

```
### Balakrishnan_2019
entry: title='VoxelMorph: A Learning Framework for Deformable Medical Image Registration' year=2019 doi=10.1109/tmi.2019.2897538
$ skills/paper/templates/lookup.py resolve 'VoxelMorph: A Learning Framework for Deformable Medical Image Registration' --year 2019
Crossref: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | Guha Balakrishnan, Amy Zhao, Mert R. Sabuncu et al. | 2019 | IEEE Transactions on Medical Imaging | doi 10.1109/tmi.2019.2897538
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | Guha Balakrishnan, Amy Zhao, Mert R. Sabuncu et al. | 2018 | doi 10.1109/TMI.2019.2897538 | arXiv 1809.05231
```

resolved (lit-review-resolve.txt)

```
### Sotiras_2013
entry: title='Deformable Medical Image Registration: A Survey' year=2013 doi=10.1109/tmi.2013.2265603
$ skills/paper/templates/lookup.py resolve 'Deformable Medical Image Registration: A Survey' --year 2013
Crossref: ratio 1.00: Deformable Medical Image Registration: A Survey | A. Sotiras, C. Davatzikos, N. Paragios | 2013 | IEEE Transactions on Medical Imaging | doi 10.1109/tmi.2013.2265603
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Hu_2019
entry: title='Conditional Segmentation in Lieu of Image Registration' year=2019 doi=10.1007/978-3-030-32245-8_45
$ skills/paper/templates/lookup.py resolve 'Conditional Segmentation in Lieu of Image Registration' --year 2019
Crossref: ratio 1.00: Conditional Segmentation in Lieu of Image Registration | Yipeng Hu, Eli Gibson, Dean C. Barratt et al. | 2019 | Lecture Notes in Computer Science | doi 10.1007/978-3-030-32245-8_45
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Conditional Segmentation in Lieu of Image Registration | Yipeng Hu, Eli Gibson, Dean C. Barratt et al. | 2019 | doi 10.1007/978-3-030-32245-8_45 | arXiv 1907.00438
```

resolved (lit-review-resolve.txt)

```
### Gillies_2016
entry: title='Radiomics: Images Are More than Pictures, They Are Data' year=2016 doi=10.1148/radiol.2015151169
$ skills/paper/templates/lookup.py resolve 'Radiomics: Images Are More than Pictures, They Are Data' --year 2016
Crossref: ratio 1.00: Radiomics: Images Are More than Pictures, They Are Data | Robert J. Gillies, Paul E. Kinahan, Hedvig Hricak | 2016 | Radiology | doi 10.1148/radiol.2015151169
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve-retry.txt)

```
### van_Griethuysen_2017
entry: title='Computational Radiomics System to Decode the Radiographic Phenotype' year=2017 doi=10.1158/0008-5472.can-17-0339
$ skills/paper/templates/lookup.py resolve 'Computational Radiomics System to Decode the Radiographic Phenotype' --year 2017
Crossref: ratio 0.93: Data from Computational Radiomics System to Decode the Radiographic Phenotype | Joost J.M. van Griethuysen, Andriy Fedorov, Chintan Parmar et al. | 2023 | doi 10.1158/0008-5472.c.6510165.v1
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | J. V. van Griethuysen, Andrey Fedorov, C. Parmar et al. | 2017 | Cancer Research | doi 10.1158/0008-5472.CAN-17-0339 | Semantic Scholar c53fa445bee435f567828db3a0ede0f08abdd0d5 | open access https://cancerres.aacrjournals.org/content/canres/77/21/e104.full.pdf
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Isensee_2020
entry: title='nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation' year=2020 doi=10.1038/s41592-020-01008-z
$ skills/paper/templates/lookup.py resolve 'nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation' --year 2020
Crossref: ratio 1.00: nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation | Fabian Isensee, Paul F. Jaeger, Simon A. A. Kohl et al. | 2020 | Nature Methods | doi 10.1038/s41592-020-01008-z
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Quellec_2017
entry: title='Multiple-Instance Learning for Medical Image and Video Analysis' year=2017 doi=10.1109/rbme.2017.2651164
$ skills/paper/templates/lookup.py resolve 'Multiple-Instance Learning for Medical Image and Video Analysis' --year 2017
Crossref: ratio 1.00: Multiple-Instance Learning for Medical Image and Video Analysis | Gwenole Quellec, Guy Cazuguel, Beatrice Cochener et al. | 2017 | IEEE Reviews in Biomedical Engineering | doi 10.1109/rbme.2017.2651164
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Chen_2021
entry: title='AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases' year=2021 doi=10.1007/978-3-030-87240-3_72
$ skills/paper/templates/lookup.py resolve 'AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases' --year 2021
Crossref: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jianan Chen, Helen M. C. Cheung, Laurent Milot et al. | 2021 | Lecture Notes in Computer Science | doi 10.1007/978-3-030-87240-3_72
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 0.98: AMINN: Autoencoder-based Multiple Instance Neural Network Improves Outcome Prediction of Multifocal Liver Metastases | Jianan Chen, Helen M. C. Cheung, Laurent Milot et al. | 2020 | arXiv 2012.06875
```

resolved (lit-review-resolve.txt)

```
### Karimzadeh_2026
entry: title='Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study' year=2026 doi=10.1088/1361-6560/ae7955
$ skills/paper/templates/lookup.py resolve 'Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study' --year 2026
Crossref: ratio 1.00: Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study | Reza Karimzadeh, Setareh Hasanabadi, Maryam Cheraghi et al. | 2026 | Physics in Medicine &amp; Biology | doi 10.1088/1361-6560/ae7955
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Jajroudi_2026
entry: title='A deep learning framework for lesion-level treatment response prediction in hodgkin lymphoma using PET/CT tensor radiomics' year=2026 doi=10.1186/s40658-026-00838-8
$ skills/paper/templates/lookup.py resolve 'A deep learning framework for lesion-level treatment response prediction in hodgkin lymphoma using PET/CT tensor radiomics' --year 2026
Crossref: ratio 1.00: A deep learning framework for lesion-level treatment response prediction in hodgkin lymphoma using PET/CT tensor radiomics | Mahdie Jajroudi, Hossein Jamalirad, Milad Enferadi et al. | 2026 | EJNMMI Physics | doi 10.1186/s40658-026-00838-8
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 1.00: A deep learning framework for lesion-level treatment response prediction in hodgkin lymphoma using PET/CT tensor radiomics | M. Jajroudi, H. Jamalirad, M. Enferadi et al. | 2026 | EJNMMI Physics | doi 10.1186/s40658-026-00838-8 | Semantic Scholar dfb80951002d3ddbf50c54c97b86fa4266c93912 | open access https://link.springer.com/content/pdf/10.1186/s40658-026-00838-8.pdf
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Chang_2020
entry: title='Automatic cardiac MRI segmentation and permutation-invariant pathology classification using deep neural networks and point clouds' year=2020 doi=10.1016/j.neucom.2020.08.030
$ skills/paper/templates/lookup.py resolve 'Automatic cardiac MRI segmentation and permutation-invariant pathology classification using deep neural networks and point clouds' --year 2020
Crossref: ratio 1.00: Automatic cardiac MRI segmentation and permutation-invariant pathology classification using deep neural networks and point clouds | Yakun Chang, Cheolkon Jung | 2020 | Neurocomputing | doi 10.1016/j.neucom.2020.08.030
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Ktena_2017
entry: title='Distance Metric Learning Using Graph Convolutional Networks: Application to\xa0Functional Brain Networks' year=2017 doi=10.1007/978-3-319-66182-7_54
$ skills/paper/templates/lookup.py resolve 'Distance Metric Learning Using Graph Convolutional Networks: Application to\xa0Functional Brain Networks' --year 2017
Crossref: ratio 0.99: Distance Metric Learning Using Graph Convolutional Networks: Application to Functional Brain Networks | Sofia Ira Ktena, Sarah Parisot, Enzo Ferrante et al. | 2017 | Lecture Notes in Computer Science | doi 10.1007/978-3-319-66182-7_54
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 0.99: Distance Metric Learning using Graph Convolutional Networks: Application to Functional Brain Networks | Sofia Ira Ktena, Sarah Parisot, Enzo Ferrante et al. | 2017 | arXiv 1703.02161
```

resolved (lit-review-resolve.txt)

```
### Xiao_2025
entry: title='Optimal Transport for Brain-Image Alignment: Unveiling Redundancy and Synergy in Neural Information Processing' year=2025 doi=10.1109/iccv51701.2025.01901
$ skills/paper/templates/lookup.py resolve 'Optimal Transport for Brain-Image Alignment: Unveiling Redundancy and Synergy in Neural Information Processing' --year 2025
Crossref: ratio 1.00: Optimal Transport for Brain-Image Alignment: Unveiling Redundancy and Synergy in Neural Information Processing | Yang Xiao, Wang Lu, Jie Ji et al. | 2025 | 2025 IEEE/CVF International Conference on Computer Vision (ICCV) | doi 10.1109/iccv51701.2025.01901
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 1.00: Optimal Transport for Brain-Image Alignment: Unveiling Redundancy and Synergy in Neural Information Processing | Yang Xiao, Wang Lu, Jie Ji et al. | 2025 | IEEE International Conference on Computer Vision | doi 10.1109/ICCV51701.2025.01901 | arXiv 2503.10663 | Semantic Scholar c5785adfb13f12746ebd8a93b7e1983b5cd97776 | open access https://arxiv.org/pdf/2503.10663
arXiv: ratio 1.00: Optimal Transport for Brain-Image Alignment: Unveiling Redundancy and Synergy in Neural Information Processing | Yang Xiao, Wang Lu, Jie Ji et al. | 2025 | arXiv 2503.10663
```

resolved (lit-review-resolve-retry.txt)

```
### Shifat_E_Rabbi_2025a
entry: title='Quantifying Nuclear Structures of Digital Pathology Images Across Cancers Using Transport<hyphen>Based Morphometry' year=2025 doi=10.1002/cyto.a.24917
$ skills/paper/templates/lookup.py resolve 'Quantifying Nuclear Structures of Digital Pathology Images Across Cancers Using Transport<hyphen>Based Morphometry' --year 2025
Crossref: ratio 0.95: Review for "Quantifying Nuclear Structures of Digital Pathology Images Across Cancers Using Transport<hyphen>Based Morphometry" | 2025 | doi 10.1002/cyto.a.24917/v2/review2
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 1.00: Quantifying Nuclear Structures of Digital Pathology Images Across Cancers Using Transport-Based Morphometry | Mohammad Shifat-E.-Rabbi, Natasha Ironside, Naqib Sad Pathan et al. | 2025 | Cytometry Part A | doi 10.1002/cyto.a.24917 | Semantic Scholar c7f4ca22270d1c951c52852e420ab41b55f66e3c | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13298727/
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Lopes_2024
entry: title='Cell Classification Based on Superpixel Segmentation and Transport-Based Morphometry' year=2024 doi=10.1109/sibgrapi62404.2024.10716334
$ skills/paper/templates/lookup.py resolve 'Cell Classification Based on Superpixel Segmentation and Transport-Based Morphometry' --year 2024
Crossref: ratio 1.00: Cell Classification Based on Superpixel Segmentation and Transport-Based Morphometry | Gustavo Lopes, Gabriel Fonseca, Giulia Novais et al. | 2024 | 2024 37th SIBGRAPI Conference on Graphics, Patterns and Images (SIBGRAPI) | doi 10.1109/sibgrapi62404.2024.10716334
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 1.00: Cell Classification Based on Superpixel Segmentation and Transport-Based Morphometry | Gustavo Lopes, Gabriel Fonseca, Giulia Novais et al. | 2024 | SIBGRAPI Conference on Graphics, Patterns and Images | doi 10.1109/SIBGRAPI62404.2024.10716334 | Semantic Scholar e406b7918a50eca6ad1b4f9af8f7e9d2821abeca
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Barbarant_2026
entry: title='Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders' year=2026 doi=10.64898/2026.05.21.726781
$ skills/paper/templates/lookup.py resolve 'Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders' --year 2026
Crossref: ratio 1.00: Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders | Pierre-Louis Barbarant, Florent Meyniel, Bertrand Thirion | 2026 | doi 10.64898/2026.05.21.726781
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: ratio 1.00: Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders | Pierre-Louis Barbarant, F. Meyniel, Bertrand Thirion | 2026 | bioRxiv | doi 10.64898/2026.05.21.726781 | Semantic Scholar a7be9d88b1f97a6f7b7df169d4a269bde4ff7811 | open access https://doi.org/10.64898/2026.05.21.726781
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Koch_2026
entry: title='Probabilistic mouse-human brain correspondence by multimodal optimal transport' year=2026 doi=10.64898/2026.08.24.746652
$ skills/paper/templates/lookup.py resolve 'Probabilistic mouse-human brain correspondence by multimodal optimal transport' --year 2026
Crossref: ratio 1.00: Probabilistic mouse-human brain correspondence by multimodal optimal transport | Stefan P Koch, Mario Perales, Tanmoy Sil et al. | 2026 | doi 10.64898/2026.08.24.746652
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Diao_2024
entry: title='A multi-instance tumor subtype classification method for small PET datasets using RA-DL attention module guided deep feature extraction with radiomics features' year=2024 doi=10.1016/j.compbiomed.2024.108461
$ skills/paper/templates/lookup.py resolve 'A multi-instance tumor subtype classification method for small PET datasets using RA-DL attention module guided deep feature extraction with radiomics features' --year 2024
Crossref: ratio 1.00: A multi-instance tumor subtype classification method for small PET datasets using RA-DL attention module guided deep feature extraction with radiomics features | Zhaoshuo Diao, Huiyan Jiang | 2024 | Computers in Biology and Medicine | doi 10.1016/j.compbiomed.2024.108461
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Winzell_2025
entry: title='Longitudinal outcome prediction of prostate cancer patients on active surveillance using multiple instance learning' year=2025 doi=10.1117/1.jmi.12.6.061408
$ skills/paper/templates/lookup.py resolve 'Longitudinal outcome prediction of prostate cancer patients on active surveillance using multiple instance learning' --year 2025
Crossref: ratio 1.00: Longitudinal outcome prediction of prostate cancer patients on active surveillance using multiple instance learning | Filip Winzell, Ida Arvidsson, Kalle <latin capital letter a with ring above>str<latin small letter o with diaeresis>m et al. | 2025 | Journal of Medical Imaging | doi 10.1117/1.jmi.12.6.061408
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Xia_2024
entry: title='Multicenter Evaluation of a Weakly Supervised Deep Learning Model for Lymph Node Diagnosis in Rectal Cancer at MRI' year=2024 doi=10.1148/ryai.230152
$ skills/paper/templates/lookup.py resolve 'Multicenter Evaluation of a Weakly Supervised Deep Learning Model for Lymph Node Diagnosis in Rectal Cancer at MRI' --year 2024
Crossref: ratio 1.00: Multicenter Evaluation of a Weakly Supervised Deep Learning Model for Lymph Node Diagnosis in Rectal Cancer at MRI | Wei Xia, Dandan Li, Wenguang He et al. | 2024 | Radiology: Artificial Intelligence | doi 10.1148/ryai.230152
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Gacheva_2026
entry: title='Multiple instance learning for differentiating neoplastic and non-neoplastic brain lesions using MR spectroscopy' year=2026 doi=10.1016/j.ynirp.2026.100418
$ skills/paper/templates/lookup.py resolve 'Multiple instance learning for differentiating neoplastic and non-neoplastic brain lesions using MR spectroscopy' --year 2026
Crossref: ratio 1.00: Multiple instance learning for differentiating neoplastic and non-neoplastic brain lesions using MR spectroscopy | Iskra Gacheva, Diyuan Lu, Gerhard Kurz et al. | 2026 | NeuroImage: Reports | doi 10.1016/j.ynirp.2026.100418
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

resolved (lit-review-resolve.txt)

```
### Li_2026
entry: title='Revisiting Dual-Encoder Fusion and Optimal Transport Regularization in PET-CT Tumor Segmentation: A Matched-Control Study under Extended Training' year=2026 doi=10.53941/aim.2026.100012
$ skills/paper/templates/lookup.py resolve 'Revisiting Dual-Encoder Fusion and Optimal Transport Regularization in PET-CT Tumor Segmentation: A Matched-Control Study under Extended Training' --year 2026
Crossref: ratio 1.00: Revisiting Dual-Encoder Fusion and Optimal Transport Regularization in PET-CT Tumor Segmentation: A Matched-Control Study under Extended Training | Man Li, Yongwei Tang, Xiaoqing Zhao et al. | 2026 | AI Medicine | doi 10.53941/aim.2026.100012
OpenAlex: left out, HTTP 429 after 3 retries
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
```

