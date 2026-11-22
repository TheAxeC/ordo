# checks.md

The session's checks of this literature review run (the instructions, literature review items 2, 4 and 6).

## Identifier check: theme run 4 (theme-refs-4.bib), 2026-11-19 23:04

Command: grep -n -i -E '^[[:space:]]*(doi|eprint)[[:space:]]*=' 'theme-refs-4.bib'
```
10:  doi = {10.1016/j.media.2007.06.004}
22:  doi = {10.1016/j.neuroimage.2004.07.068}
34:  doi = {10.1109/TMI.2019.2897538}
44:  eprint = {1908.02738},
55:  doi = {10.1109/CVPR52734.2025.02878}
67:  doi = {10.1006/nimg.2000.0582}
79:  doi = {10.1038/nn1050}
91:  doi = {10.1109/TMI.2012.2236651}
103:  doi = {10.1016/j.ejca.2011.11.036}
115:  doi = {10.1038/ncomms5006}
127:  doi = {10.1158/0008-5472.CAN-17-0339}
139:  doi = {10.1148/radiol.2020191145}
151:  doi = {10.1007/s00330-020-06957-9}
163:  doi = {10.1109/TMI.2014.2377694}
175:  doi = {10.1038/s41592-020-01008-z}
187:  doi = {10.1038/s41598-018-31911-7}
198:  doi = {10.1016/j.compbiomed.2025.110919}
210:  doi = {10.1016/j.neuroimage.2008.12.037}
221:  doi = {10.1016/j.compbiomed.2024.108320}
233:  doi = {10.1080/0284186X.2018.1445283}
245:  doi = {10.1038/s41598-022-20703-9}
257:  doi = {10.1117/1.JMI.12.5.054501}
268:  doi = {10.1016/j.neuroimage.2017.07.059},
269:  eprint = {1612.02572},
282:  doi = {10.1371/journal.pmed.1002711}
294:  doi = {10.3390/cancers16142538},
295:  eprint = {2405.01756},
307:  doi = {10.1007/978-3-031-43993-3_40},
308:  eprint = {2307.09000},
```
Exit status: 0

### avants2008symmetric
Command: python3 lookup resolve '10.1016/j.media.2007.06.004'
```
Crossref: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | B AVANTS, C EPSTEIN, M GROSSMAN, J GEE | 2008 | Medical Image Analysis | vol 12 | no 1 | pages 26--41 | doi 10.1016/j.media.2007.06.004
OpenAlex: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | Brian Avants, Charles L. Epstein, Murray Grossman, James C. Gee | 2007 | Medical Image Analysis | vol 12 | no 1 | pages 26--41 | doi 10.1016/j.media.2007.06.004 | OpenAlex W1970928383 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2276735/
Semantic Scholar: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | B. Avants, C. Epstein, M. Grossman, J. Gee | 2008 | Medical Image Anal. | vol 12 1 | pages 26--41 | doi 10.1016/j.media.2007.06.004 | Semantic Scholar 66b498a54843e14270b75f0c3c8fc65a0b2e1e98 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2276735/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### joshi2004unbiased
Command: python3 lookup resolve '10.1016/j.neuroimage.2004.07.068'
```
Crossref: ratio 1.00: Unbiased diffeomorphic atlas construction for computational anatomy | S. Joshi, Brad Davis, Matthieu Jomier, Guido Gerig | 2004 | NeuroImage | vol 23 | pages S151--S160 | doi 10.1016/j.neuroimage.2004.07.068
OpenAlex: ratio 1.00: Unbiased diffeomorphic atlas construction for computational anatomy | Sarang C. Joshi, Brad C. Davis, Matthieu Jomier, Guido Gerig | 2004 | NeuroImage | vol 23 | pages S151--S160 | doi 10.1016/j.neuroimage.2004.07.068 | OpenAlex W2121014637
Semantic Scholar: ratio 1.00: Unbiased diffeomorphic atlas construction for computational anatomy. | S. Joshi, B. Davis, Matthieu Jomier, G. Gerig | 2004 | NeuroImage | vol 23 Suppl 1 | pages S151--60 | doi 10.1016/J.NEUROIMAGE.2004.07.068 | Semantic Scholar ad7d62a47c7c1a61828112cce4aa9e8566558da9
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### balakrishnan2019voxelmorph
Command: python3 lookup resolve '10.1109/TMI.2019.2897538'
```
Crossref: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | Guha Balakrishnan, Amy Zhao, Mert R. Sabuncu, John Guttag, Adrian V. Dalca | 2019 | IEEE Transactions on Medical Imaging | vol 38 | no 8 | pages 1788--1800 | doi 10.1109/tmi.2019.2897538
OpenAlex: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | Guha Balakrishnan, Amy Zhao, Mert Rory Sabuncu, John V. Guttag, Adrian Vasile Dalca | 2019 | IEEE Transactions on Medical Imaging | vol 38 | no 8 | pages 1788--1800 | doi 10.1109/tmi.2019.2897538 | OpenAlex W2891631795 | open access https://arxiv.org/pdf/1809.05231
Semantic Scholar: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | G. Balakrishnan, Amy Zhao, M. Sabuncu, J. Guttag, Adrian V. Dalca | 2018 | IEEE Transactions on Medical Imaging | vol 38 | pages 1788--1800 | doi 10.1109/TMI.2019.2897538 | arXiv 1809.05231 | Semantic Scholar 6a88c8abd298b5e9ea7485f41a6a1b1e43b16d5f | open access https://arxiv.org/pdf/1809.05231
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dalca2019learning
Command: python3 lookup resolve '1908.02738'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning Conditional Deformable Templates with Convolutional Networks | Adrian Vasile Dalca, Marianne Rakic, John V. Guttag, Mert Rory Sabuncu | 2019 | arXiv (Cornell University) | vol 32 | pages 804--816 | doi 10.48550/arxiv.1908.02738 | arXiv 1908.02738 | OpenAlex W2965946035 | open access https://arxiv.org/pdf/1908.02738
Semantic Scholar: ratio 1.00: Learning Conditional Deformable Templates with Convolutional Networks | Adrian V. Dalca, Marianne Rakic, J. Guttag, M. Sabuncu | 2019 | Neural Information Processing Systems | vol abs/1908.02738 | doi 10.48550/arXiv.1908.02738 | arXiv 1908.02738 | Semantic Scholar 17c5e70bce680af4498f4fe2b5f2c64bdeb35053
arXiv: ratio 1.00: Learning Conditional Deformable Templates with Convolutional Networks | Adrian V. Dalca, Marianne Rakic, John Guttag, Mert R. Sabuncu | 2019 | arXiv 1908.02738
```
Exit status: 0

### abulnaga2025multimorph
Command: python3 lookup resolve '10.1109/CVPR52734.2025.02878'
```
Crossref: ratio 1.00: MultiMorph: On-Demand Atlas Construction | S. Mazdak Abulnaga, Andrew Hoopes, Neel Dey, Malte Hoffmann, Bruce Fischl, John Guttag, Adrian Dalca | 2025 | 2025 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR) | pages 30906--30917 | doi 10.1109/cvpr52734.2025.02878
OpenAlex: ratio 1.00: MultiMorph: On-Demand Atlas Construction | S. Mazdak Abulnaga, Andrew Hoopes, Neel Dey, Malte Hoffmann, Bruce R. Fischl, John V. Guttag, Adrian Vasile Dalca | 2025 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | vol 2025 | pages 30906--30917 | doi 10.1109/cvpr52734.2025.02878 | OpenAlex W4413145966 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13089913/pdf/nihms-2154554.pdf
Semantic Scholar: ratio 1.00: MultiMorph: On-demand Atlas Construction | S. M. Abulnaga, Andrew Hoopes, Neel Dey, Malte Hoffmann, Marianne Rakic, B. Fischl, J. Guttag, Adrian V. Dalca | 2025 | Computer Vision and Pattern Recognition | vol 2025 | pages 30906--30917 | doi 10.1109/CVPR52734.2025.02878 | arXiv 2504.00247 | Semantic Scholar 999d94690f9529d4cac842bf8a683de76cdbead3 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13089913/pdf/nihms-2154554.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ashburner2000voxel
Command: python3 lookup resolve '10.1006/nimg.2000.0582'
```
Crossref: ratio 1.00: Voxel-Based Morphometry<em dash>The Methods | John Ashburner, Karl J. Friston | 2000 | NeuroImage | vol 11 | no 6 | pages 805--821 | doi 10.1006/nimg.2000.0582
OpenAlex: ratio 1.00: Voxel-Based Morphometry<em dash>The Methods | John Ashburner, Karl John Friston | 2000 | NeuroImage | vol 11 | no 6 | pages 805--821 | doi 10.1006/nimg.2000.0582 | OpenAlex W2119848633
Semantic Scholar: ratio 1.00: Voxel-based morphometry--the methods. | J. Ashburner, Karl J. Friston | 2000 | NeuroImage | vol 11 6 Pt 1 | pages 805--21 | doi 10.1006/NIMG.2000.0582 | Semantic Scholar 236cb915a1724c4b9ec3e53cfed64ce169358cda | open access http://www.stat.wisc.edu/~mchung/teaching/MIA/reading/VBM.ashburner.2000.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bates2003voxel
Command: python3 lookup resolve '10.1038/nn1050'
```
Crossref: ratio 1.00: Voxel-based lesion<en dash>symptom mapping | Elizabeth Bates, Stephen M. Wilson, Ayse Pinar Saygin, Frederic Dick, Martin I. Sereno, Robert T. Knight, Nina F. Dronkers | 2003 | Nature Neuroscience | vol 6 | no 5 | pages 448--450 | doi 10.1038/nn1050
OpenAlex: ratio 1.00: Voxel-based lesion<en dash>symptom mapping | Elizabeth A. Bates, Stephen M. Wilson, Ay<latin small letter s with cedilla>e P<latin small letter dotless i>nar Sayg<latin small letter dotless i>n, Frederic Dick, Martin I. Sereno, Robert Thomas Knight, Nina F. Dronkers | 2003 | Nature Neuroscience | vol 6 | no 5 | pages 448--450 | doi 10.1038/nn1050 | OpenAlex W2153857579
Semantic Scholar: ratio 1.00: Voxel-based lesion<en dash>symptom mapping | E. Bates, S. Wilson, A. Saygin, F. Dick, M. Sereno, R. Knight, N. Dronkers | 2003 | Nature Neuroscience | vol 6 | pages 448--450 | doi 10.1038/nn1050 | Semantic Scholar bc690f553f329b497307f309738c6671ce25e733
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### simpson2013ensemble
Command: python3 lookup resolve '10.1109/TMI.2012.2236651'
```
Crossref: ratio 1.00: Ensemble Learning Incorporating Uncertain Registration | I. J. A. Simpson, M. W. Woolrich, J. L. R. Andersson, A. R. Groves, J. A. Schnabel | 2013 | IEEE Transactions on Medical Imaging | vol 32 | no 4 | pages 748--756 | doi 10.1109/tmi.2012.2236651
OpenAlex: ratio 1.00: Ensemble Learning Incorporating Uncertain Registration | Ivor Simpson, Mark W. Woolrich, Jesper Andersson, Adrian R. Groves, Julia A. Schnabel | 2012 | IEEE Transactions on Medical Imaging | vol 32 | no 4 | pages 748--756 | doi 10.1109/tmi.2012.2236651 | OpenAlex W1978054149
Semantic Scholar: ratio 1.00: Ensemble Learning Incorporating Uncertain Registration | Ivor J. A. Simpson, M. Woolrich, J. Andersson, A. Groves, J. Schnabel | 2013 | IEEE Transactions on Medical Imaging | vol 32 | pages 748--756 | doi 10.1109/TMI.2012.2236651 | Semantic Scholar a413da35e1ad87124e2befc6b6e35878ff658b59 | open access http://www0.cs.ucl.ac.uk/staff/I.Simpson/papers/ISimpsonTMI2013.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### lambin2012radiomics
Command: python3 lookup resolve '10.1016/j.ejca.2011.11.036'
```
Crossref: ratio 1.00: Radiomics: Extracting more information from medical images using advanced feature analysis | Philippe Lambin, Emmanuel Rios-Velazquez, Ralph Leijenaar, Sara Carvalho, Ruud G.P.M. van Stiphout, Patrick Granton, Catharina M.L. Zegers, Robert Gillies, Ronald Boellard, Andr<latin small letter e with acute> Dekker, Hugo J.W.L. Aerts | 2012 | European Journal of Cancer | vol 48 | no 4 | pages 441--446 | doi 10.1016/j.ejca.2011.11.036
OpenAlex: ratio 1.00: Radiomics: Extracting more information from medical images using advanced feature analysis | Philippe Lambin, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Sara Carvalho, Ruud G.P.M. van Stiphout, Patrick Vincent Granton, Catharina M.L. Zegers, Robert J. Gillies, Ronald Boellaard, Andre L.A.J. Dekker, Hugo J.W.L. Aerts | 2012 | European Journal of Cancer | vol 48 | no 4 | pages 441--446 | doi 10.1016/j.ejca.2011.11.036 | OpenAlex W2128739912 | open access http://www.ejcancer.com/article/S0959804911009993/pdf
Semantic Scholar: ratio 1.00: Radiomics: Extracting more information from medical images using advanced feature analysis | P. Lambin, E. Velazquez, R. Leijenaar, S. Carvalho, R. van Stiphout, P. Granton, C. Zegers, R. Gillies, Ronald Boellard, A. Dekker, H. Aerts | 2012 | European Journal of Cancer | vol 48 | pages 441--446 | doi 10.1016/j.ejca.2011.11.036 | Semantic Scholar 9971ff92d9d09b4736228bdbd7726e2e19b9aa2d | open access http://www.ejcancer.com/article/S0959804911009993/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### aerts2014decoding
Command: python3 lookup resolve '10.1038/ncomms5006'
```
Crossref: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | Hugo J. W. L. Aerts, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Chintan Parmar, Patrick Grossmann, Sara Carvalho, Johan Bussink, Ren<latin small letter e with acute> Monshouwer, Benjamin Haibe-Kains, Derek Rietveld, Frank Hoebers, Michelle M. Rietbergen, C. Ren<latin small letter e with acute> Leemans, Andre Dekker, John Quackenbush, Robert J. Gillies, Philippe Lambin | 2014 | Nature Communications | vol 5 | no 1 | doi 10.1038/ncomms5006
OpenAlex: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | Hugo J.W.L. Aerts, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Chintan Parmar, Patrick Gro<latin small letter sharp s>mann, Sara Carvalho, Johan Bussink, Ren<latin small letter e with acute> Monshouwer, Benjamin Haibe<hyphen>Kains, Derek H. F. Rietveld, Frank J P Hoebers, Michelle M. Rietbergen, Charles Ren<latin small letter e with acute> Leemans, Andre L.A.J. Dekker, John F Quackenbush, Robert J. Gillies, Philippe Lambin | 2014 | Nature Communications | vol 5 | no 1 | pages 4006--4006 | doi 10.1038/ncomms5006 | OpenAlex W2103004421 | open access https://www.nature.com/articles/ncomms5006.pdf
Semantic Scholar: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | H. Aerts, E. Velazquez, R. Leijenaar, C. Parmar, P. Grossmann, S. Carvalho, S. Cavalho, J. Bussink, R. Monshouwer, Benjamin Haibe-Kains, D. Rietveld, F. Hoebers, M. Rietbergen, C. Leemans, A. Dekker, John Quackenbush, R. Gillies, P. Lambin | 2014 | Nature Communications | vol 5 | doi 10.1038/ncomms5006 | Semantic Scholar 3b002068646831a6f59fabb6daeb0209ed54049d | open access https://www.nature.com/articles/ncomms5006.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### vangriethuysen2017computational
Command: python3 lookup resolve '10.1158/0008-5472.CAN-17-0339'
```
Crossref: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | Joost J.M. van Griethuysen, Andriy Fedorov, Chintan Parmar, Ahmed Hosny, Nicole Aucoin, Vivek Narayan, Regina G.H. Beets-Tan, Jean-Christophe Fillion-Robin, Steve Pieper, Hugo J.W.L. Aerts | 2017 | Cancer Research | vol 77 | no 21 | pages e104--e107 | doi 10.1158/0008-5472.can-17-0339
OpenAlex: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | Joost J. M. van Griethuysen, Andriy Fedorov, Chintan Parmar, Ahmed Hosny, Nicole Aucoin, Vivek Narayan, Regina G. H. Beets<hyphen>Tan, Jean<hyphen>Christophe Fillion<hyphen>Robin, Steve Pieper, Hugo J.W.L. Aerts | 2017 | Cancer Research | vol 77 | no 21 | pages e104--e107 | doi 10.1158/0008-5472.can-17-0339 | OpenAlex W2767128594 | open access https://cancerres.aacrjournals.org/content/canres/77/21/e104.full.pdf
Semantic Scholar: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | J. V. van Griethuysen, Andrey Fedorov, C. Parmar, A. Hosny, N. Aucoin, V. Narayan, R. Beets-Tan, J. Fillion-Robin, S. Pieper, H. Aerts | 2017 | Cancer Research | vol 77 | pages e104--e107 | doi 10.1158/0008-5472.CAN-17-0339 | Semantic Scholar c53fa445bee435f567828db3a0ede0f08abdd0d5 | open access https://cancerres.aacrjournals.org/content/canres/77/21/e104.full.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zwanenburg2020image
Command: python3 lookup resolve '10.1148/radiol.2020191145'
```
Crossref: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping | Alex Zwanenburg, Martin Valli<latin small letter e with grave>res, Mahmoud A. Abdalah, Hugo J. W. L. Aerts, Vincent Andrearczyk, Aditya Apte, Saeed Ashrafinia, Spyridon Bakas, Roelof J. Beukinga, Ronald Boellaard, Marta Bogowicz, Luca Boldrini, Ir<latin small letter e with grave>ne Buvat, Gary J. R. Cook, Christos Davatzikos, Adrien Depeursinge, Marie-Charlotte Desseroit, Nicola Dinapoli, Cuong Viet Dinh, Sebastian Echegaray, Issam El Naqa, Andriy Y. Fedorov, Roberto Gatta, Robert J. Gillies, Vicky Goh, Michael G<latin small letter o with diaeresis>tz, Matthias Guckenberger, Sung Min Ha, Mathieu Hatt, Fabian Isensee, Philippe Lambin, Stefan Leger, Ralph T.H. Leijenaar, Jacopo Lenkowicz, Fiona Lippert, Are Losneg<latin small letter a with ring above>rd, Klaus H. Maier-Hein, Olivier Morin, Henning M<latin small letter u with diaeresis>ller, Sandy Napel, Christophe Nioche, Fanny Orlhac, Sarthak Pati, Elisabeth A.G. Pfaehler, Arman Rahmim, Arvind U.K. Rao, Jonas Scherer, Muhammad Musib Siddique, Nanna M. Sijtsema, Jairo Socarras Fernandez, Emiliano Spezi, Roel J.H.M. Steenbakkers, Stephanie Tanadini-Lang, Daniela Thorwarth, Esther G.C. Troost, Taman Upadhaya, Vincenzo Valentini, Lisanne V. van Dijk, Joost van Griethuysen, Floris H.P. van Velden, Philip Whybra, Christian Richter, Steffen L<latin small letter o with diaeresis>ck | 2020 | Radiology | vol 295 | no 2 | pages 328--338 | doi 10.1148/radiol.2020191145
OpenAlex: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping | Alex Zwanenburg, Martin Valli<latin small letter e with grave>res, Mahmoud A. Abdalah, Hugo J.W.L. Aerts, Vincent Andrearczyk, Aditya Apte, Saeed Ashrafinia, Spyridon Bakas, Roelof J. Beukinga, Ronald Boellaard, Marta Bogowicz, Luca Boldrini, Ir<latin small letter e with grave>ne Buvat, Gary Cook, Christos A. Davatzikos, Adrien Depeursinge, Marie-Charlotte Desseroit, N. Dinapoli, Cuong Viet Dinh, Sebastian Echegaray, Issam El Naqa, Andriy Fedorov, Roberto Gatta, Robert J. Gillies, Vicky Goh, MICHAEL A. GOETZ, Matthias G<latin small letter u with diaeresis>ckenberger, Sung Min Ha, Mathieu Hatt, Fabian Isensee, Philippe Lambin, Stefan Leger, Ralph T. H. Leijenaar, Jacopo Lenkowicz, Fiona Lippert, Are Losneg<latin small letter a with ring above>rd, Klaus Hermann Maier-Hein, Olivier Morin, Henning M<latin small letter u with diaeresis>ller, Sandy A. Napel, Christophe Nioche, Fanny Orlhac, Sarthak Pati, Elisabeth A. G. Pfaehler, Arman Rahmim, Arvind U K Rao, Jonas Scherer, Muhammad Musib Siddique, Nanna Maria Sijtsema, Jairo Socarras Fernandez, Emiliano Spezi, Roel J.H.M. Steenbakkers, Stephanie Tanadini<hyphen>Lang, Daniela Thorwarth, Esther G.C. Troost, Taman Upadhaya, Vincenzo Valentini, Lisanne Vania van Dijk, Joost J. M. van Griethuysen, Floris H. P. van Velden, P. Whybra, Christian Richter, Steffen L<latin small letter o with diaeresis>ck | 2020 | Radiology | vol 295 | no 2 | pages 328--338 | doi 10.1148/radiol.2020191145 | OpenAlex W2998789541 | open access https://research.rug.nl/files/119920642/The_Image_Biomarker_Standardization_Initiative_Standardized_Quantitative_Radiomics_for_High_Throughput_Image_based_Phenotyping.pdf
Semantic Scholar: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping. | A. Zwanenburg, M. Valli<latin small letter e with grave>res, M. Abdalah, H. Aerts, V. Andrearczyk, A. Apte, S. Ashrafinia, S. Bakas, R. Beukinga, R. Boellaard, M. Bogowicz, L. Boldrini, I. Buvat, G. Cook, C. Davatzikos, A. Depeursinge, Marie-Charlotte Desseroit, N. Dinapoli, C. Dinh, S. Echegaray, I. El Naqa, Andrey Fedorov, R. Gatta, R. Gillies, V. Goh, M. G<latin small letter o with diaeresis>tz, M. Guckenberger, Min-Ha Sung, M. Hatt, F. Isensee, P. Lambin, S. Leger, R. Leijenaar, J. Lenkowicz, F. Lippert, Are Losneg<latin small letter a with ring above>rd, Klaus Hermann Maier-Hein, O. Morin, Henning M<latin small letter u with diaeresis>ller, S. Napel, C. Nioche, F. Orlhac, Sarthak Pati, E. Pfaehler, A. Rahmim, Arvind Rao, J. Scherer, M. Siddique, N. Sijtsema, J. Socarras Fernandez, E. Spezi, R. Steenbakkers, S. Tanadini-Lang, D. Thorwarth, E. Troost, T. Upadhaya, V. Valentini, L. van Dijk, J. V. van Griethuysen, F. V. van Velden, P. Whybra, C. Richter, S. L<latin small letter o with diaeresis>ck | 2016 | Radiology | pages 191145 | doi 10.1148/radiol.2020191145 | arXiv 1612.07003 | Semantic Scholar 41dfe7b56b3009500dad81a348cd39941cdfb716 | open access https://research.rug.nl/files/119920642/The_Image_Biomarker_Standardization_Initiative_Standardized_Quantitative_Radiomics_for_High_Throughput_Image_based_Phenotyping.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### fornaconwood2020reliability
Command: python3 lookup resolve '10.1007/s00330-020-06957-9'
```
Crossref: ratio 1.00: Reliability and prognostic value of radiomic features are highly dependent on choice of feature extraction platform | Isabella Fornacon-Wood, Hitesh Mistry, Christoph J. Ackermann, Fiona Blackhall, Andrew McPartlin, Corinne Faivre-Finn, Gareth J. Price, James P. B. O<right single quotation mark>Connor | 2020 | European Radiology | vol 30 | no 11 | pages 6241--6250 | doi 10.1007/s00330-020-06957-9
OpenAlex: ratio 1.00: Reliability and prognostic value of radiomic features are highly dependent on choice of feature extraction platform | Isabella Fornacon-Wood, Hitesh B. Mistry, Christoph Jakob Ackermann, Fiona Helen Blackhall, Andrew J. McPartlin, Corinne Faivre Finn, Gareth J. Price, James P.B. O<right single quotation mark>Connor | 2020 | European Radiology | vol 30 | no 11 | pages 6241--6250 | doi 10.1007/s00330-020-06957-9 | OpenAlex W3017712284 | open access https://link.springer.com/content/pdf/10.1007/s00330-020-06957-9.pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### menze2015multimodal
Command: python3 lookup resolve '10.1109/TMI.2014.2377694'
```
Crossref: ratio 1.00: The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS) | Bjoern H. Menze, Andras Jakab, Stefan Bauer, Jayashree Kalpathy-Cramer, Keyvan Farahani, Justin Kirby, Yuliya Burren, Nicole Porz, Johannes Slotboom, Roland Wiest, Levente Lanczi, Elizabeth Gerstner, Marc-Andre Weber, Tal Arbel, Brian B. Avants, Nicholas Ayache, Patricia Buendia, D. Louis Collins, Nicolas Cordier, Jason J. Corso, Antonio Criminisi, Tilak Das, Herve Delingette, Cagatay Demiralp, Christopher R. Durst, Michel Dojat, Senan Doyle, Joana Festa, Florence Forbes, Ezequiel Geremia, Ben Glocker, Polina Golland, Xiaotao Guo, Andac Hamamci, Khan M. Iftekharuddin, Raj Jena, Nigel M. John, Ender Konukoglu, Danial Lashkari, Jose Antonio Mariz, Raphael Meier, Sergio Pereira, Doina Precup, Stephen J. Price, Tammy Riklin Raviv, Syed M. S. Reza, Michael Ryan, Duygu Sarikaya, Lawrence Schwartz, Hoo-Chang Shin, Jamie Shotton, Carlos A. Silva, Nuno Sousa, Nagesh K. Subbanna, Gabor Szekely, Thomas J. Taylor, Owen M. Thomas, Nicholas J. Tustison, Gozde Unal, Flor Vasseur, Max Wintermark, Dong Hye Ye, Liang Zhao, Binsheng Zhao, Darko Zikic, Marcel Prastawa, Mauricio Reyes, Koen Van Leemput | 2015 | IEEE Transactions on Medical Imaging | vol 34 | no 10 | pages 1993--2024 | doi 10.1109/tmi.2014.2377694
OpenAlex: ratio 1.00: The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS) | Bjoern H. Menze, Jakab Andr<latin small letter a with acute>s, Stefan Bauer, Jayashree Kalpathy<en dash>Cramer, Keyvan Farahani, Justin Kirby, Yuliya Burren, Nicole Porz, Johannes Slotboom, Roland Wiest, Levente L<latin small letter a with acute>nczi, Elizabeth Robins Gerstner, Marc<hyphen>Andr<latin small letter e with acute> Weber, Tal Arbel, Brian Avants, Nicholas Ayache, Patricia Buendia, D. Louis Collins, Nicolas Cordier, Jason J. Corso, Antonio Criminisi, Tilak Das, Herv<latin small letter e with acute> Delingette, <latin capital letter c with cedilla>a<latin small letter g with breve>atay Demiralp, Christopher R. Durst, Michel Dojat, Senan Doyle, Joana Festa, Florence Forbes, Ezequiel Geremia, Ben Glocker, Polina Golland, Xiaotao Guo, Anda<latin small letter c with cedilla> Hamamc<latin small letter dotless i>, Khan M. Iftekharuddin, R. Jena, Nigel John, Ender Konuko<latin small letter g with breve>lu, Danial Lashkari, Jos<latin small letter e with acute> Ant<latin small letter o with acute>nio Mariz, Raphael Meier, S<latin small letter e with acute>rgio Pereira, Doina Precup, Stephen John Price, Tammy Riklin Raviv, Syed M. S. Reza, Michael J. Ryan, Duygu Sar<latin small letter dotless i>kaya, Lawrence Howard Schwartz, Hoo-Chang Shin, Jamie Shotton, Carlos A. Silva, Nuno Sousa, Nagesh K. Subbanna, G<latin small letter a with acute>bor J. Sz<latin small letter e with acute>kely, Thomas J. Taylor, Owen Thomas, Nicholas James Tustison, G<latin small letter o with diaeresis>zde <latin capital letter u with diaeresis>nal, Flor Vasseur, Max Wintermark, Dong Hye Ye, Liang Zhao, Binsheng Zhao, Darko Zikic, Marcel W. Prastawa, Mauricio Reyes, Koen Van Leemput | 2014 | IEEE Transactions on Medical Imaging | vol 34 | no 10 | pages 1993--2024 | doi 10.1109/tmi.2014.2377694 | OpenAlex W1641498739 | open access https://ieeexplore.ieee.org/ielx7/42/7283692/06975210.pdf
Semantic Scholar: ratio 1.00: The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS) | Bjoern H Menze, A. Jakab, S. Bauer, Jayashree Kalpathy-Cramer, K. Farahani, J. Kirby, Y. Burren, N. Porz, J. Slotboom, R. Wiest, L. L<latin small letter a with acute>nczi, E. Gerstner, Marc-Andr<latin small letter e with acute> Weber, T. Arbel, B. Avants, N. Ayache, Patricia Buendia, D. Collins, Nicolas Cordier, J. Corso, A. Criminisi, Tilak Das, H. Delingette, <latin capital letter c with cedilla>a<latin small letter g with breve>atay Demiralp, Christopher R. Durst, M. Dojat, S. Doyle, J. Festa, F. Forbes, E. Geremia, Ben Glocker, P. Golland, Xiao-Tao Guo, A. Hamamc<latin small letter dotless i>, K. Iftekharuddin, R. Jena, Nigel M. John, E. Konukoglu, D. Lashkari, J. Mariz, R. Meier, S<latin small letter e with acute>rgio Pereira, Doina Precup, S. Price, Tammy Riklin-Raviv, Syed M. S. Reza, Michael T. Ryan, Duygu Sarikaya, L. Schwartz, Hoo-Chang Shin, J. Shotton, Carlos Alberto Silva, Nuno J. Sousa, N. Subbanna, G. Sz<latin small letter e with acute>kely, Thomas J. Taylor, Owen M. Thomas, N. Tustison, G. <latin capital letter u with diaeresis>nal, F. Vasseur, M. Wintermark, Dong Hye Ye, Liang Zhao, Bin-Sheng Zhao, Darko Zikic, M. Prastawa, M. Reyes, K. van Leemput | 2014 | IEEE Transactions on Medical Imaging | vol 34 | pages 1993--2024 | doi 10.1109/TMI.2014.2377694 | Semantic Scholar 580062407427236ced45253a2ff7df2e147a81e2 | open access https://ieeexplore.ieee.org/ielx7/42/7283692/06975210.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### isensee2021nnu
Command: python3 lookup resolve '10.1038/s41592-020-01008-z'
```
Crossref: ratio 1.00: nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation | Fabian Isensee, Paul F. Jaeger, Simon A. A. Kohl, Jens Petersen, Klaus H. Maier-Hein | 2020 | Nature Methods | vol 18 | no 2 | pages 203--211 | doi 10.1038/s41592-020-01008-z
OpenAlex: ratio 1.00: nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation | Fabian Isensee, Paul F. Jaeger, Simon A. A. Kohl, Jens Petersen, Klaus H. Maier-Hein | 2020 | Nature Methods | vol 18 | no 2 | pages 203--211 | doi 10.1038/s41592-020-01008-z | OpenAlex W3014974815 | open access https://arxiv.org/pdf/1904.08128
Semantic Scholar: ratio 1.00: nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation | F. Isensee, P. Jaeger, S. Kohl, J. Petersen, Klaus Hermann Maier-Hein | 2020 | Nature Methods | vol 18 | pages 203--211 | doi 10.1038/s41592-020-01008-z | Semantic Scholar f28e387d4229c5f690ce4570a391c0f47e7155c7 | open access https://arxiv.org/pdf/1904.08128
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### commowick2018objective
Command: python3 lookup resolve '10.1038/s41598-018-31911-7'
```
Crossref: ratio 1.00: Objective Evaluation of Multiple Sclerosis Lesion Segmentation using a Data Management and Processing Infrastructure | Olivier Commowick, Audrey Istace, Micha<latin small letter e with diaeresis>l Kain, Baptiste Laurent, Florent Leray, Mathieu Simon, Sorina Camarasu Pop, Pascal Girard, Roxana Am<latin small letter e with acute>li, Jean-Christophe Ferr<latin small letter e with acute>, Anne Kerbrat, Thomas Tourdias, Fr<latin small letter e with acute>d<latin small letter e with acute>ric Cervenansky, Tristan Glatard, J<latin small letter e with acute>r<latin small letter e with acute>my Beaumont, Senan Doyle, Florence Forbes, Jesse Knight, April Khademi, Amirreza Mahbod, Chunliang Wang, Richard McKinley, Franca Wagner, John Muschelli, Elizabeth Sweeney, Eloy Roura, Xavier Llad<latin small letter o with acute>, Michel M. Santos, Wellington P. Santos, Abel G. Silva-Filho, Xavier Tomas-Fernandez, H<latin small letter e with acute>l<latin small letter e with grave>ne Urien, Isabelle Bloch, Sergi Valverde, Mariano Cabezas, Francisco Javier Vera-Olmos, Norberto Malpica, Charles Guttmann, Sandra Vukusic, Gilles Edan, Michel Dojat, Martin Styner, Simon K. Warfield, Fran<latin small letter c with cedilla>ois Cotton, Christian Barillot | 2018 | Scientific Reports | vol 8 | no 1 | doi 10.1038/s41598-018-31911-7
OpenAlex: ratio 1.00: Objective Evaluation of Multiple Sclerosis Lesion Segmentation using a Data Management and Processing Infrastructure | Olivier Commowick, Audrey Istace, Michael Kain, Baptiste Laurent, Florent Leray, Mathieu Simon, Sorina Camarasu-Pop, Pascal Girard, Roxana Am<latin small letter e with acute>li, Jean<hyphen>Christophe Ferr<latin small letter e with acute>, Anne Kerbrat, Thomas Tourdias, Fr<latin small letter e with acute>d<latin small letter e with acute>ric Cervenansky, Tristan Glatard, J<latin small letter e with acute>r<latin small letter e with acute>my Beaumont, Senan Doyle, Florence Forbes, Jesse Knight, April Khademi, Amirreza Mahbod, Chunliang Wang, Richard McKinley, Franca Wagner, John Muschelli, Elizabeth M. Sweeney, Eloy Roura, Xavier Llad<latin small letter o with acute>, Michel M. Santos, Wellington Pinheiro dos Santos, Abel G. Silva-Filho, Xavier Tomas-Fernandez, H<latin small letter e with acute>l<latin small letter e with grave>ne Urien, Isabelle Bloch, Sergi Valverde, Mariano Cabezas, Francisco Javier Vera-Olmos, Norberto Malpica, Charles R.G. Guttmann, Sandra Vukusic, Gilles Edan, Michel Dojat, Martin Andreas Styner, Simon Keith Warfield, Fran<latin small letter c with cedilla>ois Cotton, Christian Barillot | 2018 | Scientific Reports | vol 8 | no 1 | pages 13650--13650 | doi 10.1038/s41598-018-31911-7 | OpenAlex W2849179291 | open access https://www.nature.com/articles/s41598-018-31911-7.pdf
Semantic Scholar: ratio 1.00: Objective Evaluation of Multiple Sclerosis Lesion Segmentation using a Data Management and Processing Infrastructure | O. Commowick, A. Istace, Michael Kain, B. Laurent, Florent Leray, Mathieu Simon, S. Pop, P. Girard, R. Ameli, J. Ferr<latin small letter e with acute>, A. Kerbrat, T. Tourdias, F. Cervenansky, T. Glatard, J. Beaumont, S. Doyle, F. Forbes, Jesse Knight, A. Khademi, A. Mahbod, Chun-Liang Wang, Richard McKinley, F. Wagner, J. Muschelli, E. Sweeney, E. Roura, X. Llad<latin small letter o with acute>, M. M. Santos, W. Santos, A. Silva-Filho, X. Tomas-Fernandez, H. Urien, I. Bloch, S. Valverde, M. Cabezas, Francisco Javier Vera-Olmos, Norberto Malpica, C. Guttmann, S. Vukusic, G. Edan, M. Dojat, M. Styner, S. Warfield, F. Cotton, C. Barillot | 2018 | Scientific Reports | vol 8 | doi 10.1038/s41598-018-31911-7 | Semantic Scholar 63275cef678cb6e280efcf11b527f594335c02c8 | open access https://www.nature.com/articles/s41598-018-31911-7.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wynen2025conflunet
Command: python3 lookup resolve '10.1016/j.compbiomed.2025.110919'
```
Crossref: ratio 1.00: ConfLUNet: Multiple sclerosis lesion instance segmentation in presence of confluent lesions | Maxence Wynen, Pedro M. Gordaliza, Maxime Istasse, Anna St<latin small letter o with diaeresis>lting, Pietro Maggi, Beno<latin small letter i with circumflex>t Macq, Meritxell Bach Cuadra | 2025 | Computers in Biology and Medicine | vol 197 | pages 110919 | doi 10.1016/j.compbiomed.2025.110919
OpenAlex: ratio 1.00: ConfLUNet: Multiple sclerosis lesion instance segmentation in presence of confluent lesions | Maxence Wynen, Pedro M. Gordaliza, Maxime Istasse, Anna St<latin small letter o with diaeresis>lting, Pietro Maggi, Benoit M. M. Macq, Meritxell Bach Cuadra | 2025 | Computers in Biology and Medicine | vol 197 | no Pt A | pages 110919--110919 | doi 10.1016/j.compbiomed.2025.110919 | OpenAlex W4413474688 | open access https://doi.org/10.1016/j.compbiomed.2025.110919
Semantic Scholar: ratio 1.00: ConfLUNet: Multiple sclerosis lesion instance segmentation in presence of confluent lesions | M. Wynen, P. Gordaliza, Maxime Istasse, A. St<latin small letter o with diaeresis>lting, P. Maggi, B. Macq, M. Bach Cuadra | 2025 | Comput. Biol. Medicine | vol 197 Pt A | pages 110919 | doi 10.1016/j.compbiomed.2025.110919 | arXiv 2505.22537 | Semantic Scholar 8ebf147ea359b8b4baaa260ae87588f8c68fda77 | open access https://doi.org/10.1016/j.compbiomed.2025.110919
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### klein2009evaluation
Command: python3 lookup resolve '10.1016/j.neuroimage.2008.12.037'
```
Crossref: ratio 1.00: Evaluation of 14 nonlinear deformation algorithms applied to human brain MRI registration | Arno Klein, Jesper Andersson, Babak A. Ardekani, John Ashburner, Brian Avants, Ming-Chang Chiang, Gary E. Christensen, D. Louis Collins, James Gee, Pierre Hellier, Joo Hyun Song, Mark Jenkinson, Claude Lepage, Daniel Rueckert, Paul Thompson, Tom Vercauteren, Roger P. Woods, J. John Mann, Ramin V. Parsey | 2009 | NeuroImage | vol 46 | no 3 | pages 786--802 | doi 10.1016/j.neuroimage.2008.12.037
OpenAlex: ratio 1.00: Evaluation of 14 nonlinear deformation algorithms applied to human brain MRI registration | Arno Klein, Jesper Andersson, Babak Assai Ardekani, John Ashburner, Brian Avants, Ming-Chang Chiang, Gary E. Christensen, D. Louis Collins, James C. Gee, Pierre Hellier, Joo Hyun Song, Mark Jenkinson, Claude Lepage, Daniel Rueckert, Paul M. Thompson, Tom K. Vercauteren, Roger P. Woods, J. John Mann, Ramin V. Parsey | 2009 | NeuroImage | vol 46 | no 3 | pages 786--802 | doi 10.1016/j.neuroimage.2008.12.037 | OpenAlex W2102099319 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2747506/
Semantic Scholar: ratio 1.00: Evaluation of 14 nonlinear deformation algorithms applied to human brain MRI registration | Arno Klein, J. Andersson, B. Ardekani, J. Ashburner, B. Avants, Ming-Chang Chiang, G. Christensen, D. Collins, J. Gee, P. Hellier, J. Song, M. Jenkinson, C. Lepage, D. Rueckert, P. Thompson, T. Vercauteren, R. Woods, J. Mann, R. Parsey | 2009 | NeuroImage | vol 46 | pages 786--802 | doi 10.1016/j.neuroimage.2008.12.037 | Semantic Scholar 6d2669ebc27f776d940ca95db0ad4ae455316cf2 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2747506/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dular2024extensive
Command: python3 lookup resolve '10.1016/j.compbiomed.2024.108320'
```
Crossref: ratio 1.00: Extensive T1-weighted MRI preprocessing improves generalizability of deep brain age prediction models | Lara Dular, Franjo Pernu<latin small letter s with caron>, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin | 2024 | Computers in Biology and Medicine | vol 173 | pages 108320 | doi 10.1016/j.compbiomed.2024.108320
OpenAlex: ratio 1.00: Extensive T1-weighted MRI preprocessing improves generalizability of deep brain age prediction models | Lara Dular, Franjo Pernu<latin small letter s with caron>, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin | 2024 | Computers in Biology and Medicine | vol 173 | pages 108320--108320 | doi 10.1016/j.compbiomed.2024.108320 | OpenAlex W4392983541 | open access https://doi.org/10.1016/j.compbiomed.2024.108320
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### pavic2018influence
Command: python3 lookup resolve '10.1080/0284186X.2018.1445283'
```
Crossref: ratio 1.00: Influence of inter-observer delineation variability on radiomics stability in different tumor sites | Matea Pavic, Marta Bogowicz, Xaver W<latin small letter u with diaeresis>rms, Stefan Glatz, Tobias Finazzi, Oliver Riesterer, Johannes Roesch, Leonie Rudofsky, Martina Friess, Patrick Veit-Haibach, Martin Huellner, Isabelle Opitz, Walter Weder, Thomas Frauenfelder, Matthias Guckenberger, Stephanie Tanadini-Lang | 2018 | Acta Oncologica | vol 57 | no 8 | pages 1070--1074 | doi 10.1080/0284186x.2018.1445283
OpenAlex: ratio 1.00: Influence of inter-observer delineation variability on radiomics stability in different tumor sites | Matea Pavic, Marta Bogowicz, Xaver W<latin small letter u with diaeresis>rms, Stefan Glatz, Tobias Finazzi, Oliver Riesterer, Johannes Roesch, Leonie Rudofsky, Martina Friess, Patrick Veit<hyphen>Haibach, Martin William Huellner, Isabelle Opitz, Walter Weder, Thomas Frauenfelder, Matthias G<latin small letter u with diaeresis>ckenberger, Stephanie Tanadini<hyphen>Lang | 2018 | Acta Oncologica | vol 57 | no 8 | pages 1070--1074 | doi 10.1080/0284186x.2018.1445283 | OpenAlex W2791459212 | open access https://www.tandfonline.com/doi/pdf/10.1080/0284186X.2018.1445283?needAccess=true&role=button
Semantic Scholar: ratio 1.00: Influence of inter-observer delineation variability on radiomics stability in different tumor sites | M. Pavic, M. Bogowicz, Xaver W<latin small letter u with diaeresis>rms, S. Glatz, T. Finazzi, O. Riesterer, J. Roesch, L. Rudofsky, Martina Friess, P. Veit-Haibach, M. Huellner, I. Opitz, W. Weder, T. Frauenfelder, M. Guckenberger, S. Tanadini-Lang | 2018 | Acta oncologica | vol 57 | pages 1070--1074 | doi 10.1080/0284186X.2018.1445283 | Semantic Scholar 3c0d461ba85dee05b5285335c61c071fb71ad274 | open access https://www.tandfonline.com/doi/pdf/10.1080/0284186X.2018.1445283?needAccess=true&role=button
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### poirot2022robustness
Command: python3 lookup resolve '10.1038/s41598-022-20703-9'
```
Crossref: ratio 1.00: Robustness of radiomics to variations in segmentation methods in multimodal brain MRI | M. G. Poirot, M. W. A. Caan, H. G. Ruhe, A. Bj<latin small letter o with stroke>rnerud, I. Groote, L. Reneman, H. A. Marquering | 2022 | Scientific Reports | vol 12 | no 1 | doi 10.1038/s41598-022-20703-9
OpenAlex: ratio 1.00: Robustness of radiomics to variations in segmentation methods in multimodal brain MRI | Maarten G. Poirot, Matthan W.A. Caan, Henricus Gerardus Ruh<latin small letter e with acute>, Atle Bj<latin small letter o with stroke>rnerud, Inge Rasmus Groote, Liesbeth Reneman, Henk A. Marquering | 2022 | Scientific Reports | vol 12 | no 1 | pages 16712--16712 | doi 10.1038/s41598-022-20703-9 | OpenAlex W4302292929 | open access https://www.nature.com/articles/s41598-022-20703-9.pdf
Semantic Scholar: ratio 1.00: Robustness of radiomics to variations in segmentation methods in multimodal brain MRI | M. Poirot, M. Caan, H. Ruh<latin small letter e with acute>, A. Bj<latin small letter o with stroke>rnerud, I. Groote, L. Reneman, H. Marquering | 2022 | Scientific Reports | vol 12 | doi 10.1038/s41598-022-20703-9 | Semantic Scholar 49511a491e76a4e3302e5237515669fa3be8ee08 | open access https://www.nature.com/articles/s41598-022-20703-9.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cama2025segmentation
Command: python3 lookup resolve '10.1117/1.JMI.12.5.054501'
```
Crossref: ratio 1.00: Segmentation variability and radiomics stability for predicting triple-negative breast cancer subtype using magnetic resonance imaging | Isabella Cama, Alejandro Guzm<latin small letter a with acute>n, Cristina Campi, Michele Piana, Karim Lekadir, Sara Garbarino, Oliver D<latin small letter i with acute>az | 2025 | Journal of Medical Imaging | vol 12 | no 05 | pages 1--23 | doi 10.1117/1.jmi.12.5.054501
OpenAlex: ratio 1.00: Segmentation variability and radiomics stability for predicting triple-negative breast cancer subtype using magnetic resonance imaging | Isabella Cama, Alejandro Guzm<latin small letter a with acute>n, Cristina Campi, Michele Piana, Karim Lekadir, Sara Garbarino, Oliver D<latin small letter i with acute>az | 2025 | Journal of medical imaging | vol 12 | no 05 | pages 1--23 | doi 10.1117/1.jmi.12.5.054501 | OpenAlex W4414285024 | open access https://www.spiedigitallibrary.org/journals/journal-of-medical-imaging/volume-12/issue-5/054501/Segmentation-variability-and-radiomics-stability-for-predicting-triple-negative-breast/10.1117/1.JMI.12.5.054501.pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cole2017predicting
Command: python3 lookup resolve '10.1016/j.neuroimage.2017.07.059'
```
Crossref: ratio 1.00: Predicting brain age with deep learning from raw imaging data results in a reliable and heritable biomarker | James H. Cole, Rudra P.K. Poudel, Dimosthenis Tsagkrasoulis, Matthan W.A. Caan, Claire Steves, Tim D. Spector, Giovanni Montana | 2017 | NeuroImage | vol 163 | pages 115--124 | doi 10.1016/j.neuroimage.2017.07.059
OpenAlex: ratio 1.00: Predicting brain age with deep learning from raw imaging data results in a reliable and heritable biomarker | James Howard Cole, Rudra P. K. Poudel, Dimosthenis Tsagkrasoulis, Matthan W.A. Caan, Claire J. Steves, Tim D. Spector, Giovanni Montana | 2017 | NeuroImage | vol 163 | pages 115--124 | doi 10.1016/j.neuroimage.2017.07.059 | OpenAlex W2579617530 | open access https://kclpure.kcl.ac.uk/portal/en/publications/826cf875-3cc3-4e68-bb02-f057c725a9ed
Semantic Scholar: ratio 1.00: Predicting brain age with deep learning from raw imaging data results in a reliable and heritable biomarker | J. Cole, Rudra P. K. Poudel, Dimosthenis Tsagkrasoulis, M. Caan, C. Steves, T. Spector, G. Montana | 2016 | NeuroImage | vol 163 | pages 115<en dash>124 | doi 10.1016/j.neuroimage.2017.07.059 | arXiv 1612.02572 | Semantic Scholar 5d71c918db224e21982d9eb5ab2359735466959b | open access https://kclpure.kcl.ac.uk/portal/en/publications/826cf875-3cc3-4e68-bb02-f057c725a9ed
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### hosny2018deep
Command: python3 lookup resolve '10.1371/journal.pmed.1002711'
```
Crossref: ratio 1.00: Deep learning for lung cancer prognostication: A retrospective multi-cohort radiomics study | Ahmed Hosny, Chintan Parmar, Thibaud P. Coroller, Patrick Grossmann, Roman Zeleznik, Avnish Kumar, Johan Bussink, Robert J. Gillies, Raymond H. Mak, Hugo J. W. L. Aerts | 2018 | PLOS Medicine | vol 15 | no 11 | pages e1002711 | doi 10.1371/journal.pmed.1002711
OpenAlex: ratio 1.00: Deep learning for lung cancer prognostication: A retrospective multi-cohort radiomics study | Ahmed Hosny, Chintan Parmar, Thibaud P. Coroller, Patrick Gro<latin small letter sharp s>mann, Roman Zeleznik, Avnish Kumar, Johan Bussink, Robert J. Gillies, Raymond H. Mak, Hugo J.W.L. Aerts | 2018 | PLoS Medicine | vol 15 | no 11 | pages e1002711--e1002711 | doi 10.1371/journal.pmed.1002711 | OpenAlex W2903150666 | open access https://journals.plos.org/plosmedicine/article/file?id=10.1371/journal.pmed.1002711&type=printable
Semantic Scholar: ratio 1.00: Deep learning for lung cancer prognostication: A retrospective multi-cohort radiomics study | A. Hosny, C. Parmar, T. Coroller, P. Grossmann, R. Zeleznik, Avnish Kumar, J. Bussink, R. Gillies, R. Mak, H. Aerts | 2018 | PLoS Medicine | vol 15 | doi 10.1371/journal.pmed.1002711 | Semantic Scholar 438c0a37e7545e836ee81c519cedf44f0702418f | open access https://journals.plos.org/plosmedicine/article/file?id=10.1371/journal.pmed.1002711&type=printable
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### toosi2024segmentation
Command: python3 lookup resolve '10.3390/cancers16142538'
```
Crossref: ratio 1.00: Segmentation-Free Outcome Prediction from Head and Neck Cancer PET/CT Images: Deep Learning-Based Feature Extraction from Multi-Angle Maximum Intensity Projections (MA-MIPs) | Amirhosein Toosi, Isaac Shiri, Habib Zaidi, Arman Rahmim | 2024 | Cancers | vol 16 | no 14 | pages 2538 | doi 10.3390/cancers16142538
OpenAlex: ratio 1.00: Segmentation-Free Outcome Prediction from Head and Neck Cancer PET/CT Images: Deep Learning-Based Feature Extraction from Multi-Angle Maximum Intensity Projections (MA-MIPs) | Amirhosein Toosi, Isaac Shiri, Habib Zaidi, Arman Rahmim | 2024 | Cancers | vol 16 | no 14 | pages 2538--2538 | doi 10.3390/cancers16142538 | OpenAlex W4396778312 | open access https://www.mdpi.com/2072-6694/16/14/2538/pdf?version=1721286491
Semantic Scholar: ratio 1.00: Segmentation-Free Outcome Prediction from Head and Neck Cancer PET/CT Images: Deep Learning-Based Feature Extraction from Multi-Angle Maximum Intensity Projections (MA-MIPs) | Amirhosein Toosi, I. Shiri, H. Zaidi, A. Rahmim | 2024 | Cancers | vol 16 | doi 10.3390/cancers16142538 | arXiv 2405.01756 | Semantic Scholar 274956f84276f522a0a82adaf231fa0a628238f2 | open access https://www.mdpi.com/2072-6694/16/14/2538/pdf?version=1721286491
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xue2023tractcloud
Command: python3 lookup resolve '10.1007/978-3-031-43993-3_40'
```
Crossref: ratio 1.00: TractCloud: Registration-Free Tractography Parcellation with a Novel Local-Global Streamline Point Cloud Representation | Tengfei Xue, Yuqian Chen, Chaoyi Zhang, Alexandra J. Golby, Nikos Makris, Yogesh Rathi, Weidong Cai, Fan Zhang, Lauren J. O<right single quotation mark>Donnell | 2023 | Lecture Notes in Computer Science | pages 409--419 | doi 10.1007/978-3-031-43993-3_40
OpenAlex: ratio 1.00: TractCloud: Registration-Free Tractography Parcellation with a Novel Local-Global Streamline Point Cloud Representation | Tengfei Xue, Yuqian Chen, Chaoyi Zhang, Alexandra J. Golby, Nikos Makris, Yogesh Rathi, Weidong Cai, Fan Zhang, Lauren J. O<right single quotation mark>Donnell | 2023 | Lecture notes in computer science | pages 409--419 | doi 10.1007/978-3-031-43993-3_40 | OpenAlex W4387211013 | open access https://arxiv.org/pdf/2307.09000
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

## Identifier check: theme run 1 (theme-refs-1.bib), 2026-11-19 23:14

Command: grep -n -i -E '^[[:space:]]*(doi|eprint)[[:space:]]*=' 'theme-refs-1.bib'
```
10:  doi = {10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c}
24:  doi = {10.1109/tpami.2012.254}
37:  doi = {10.1093/biomet/asaf082},
38:  eprint = {2310.09428},
53:  doi = {10.1080/01621459.2013.776499},
54:  eprint = {1203.3209},
69:  doi = {10.1007/s12561-018-9215-6},
70:  eprint = {1304.5637},
85:  doi = {10.1214/23-aoas1830}
98:  doi = {10.1007/s11222-026-10892-y},
99:  eprint = {2505.12113},
114:  doi = {10.1137/07070111x}
141:  doi = {10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b}
155:  doi = {10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y}
169:  doi = {10.1137/24m1692836},
170:  eprint = {2410.14046},
185:  doi = {10.1109/tmi.2019.2936046}
198:  doi = {10.3389/fnins.2022.861402}
211:  doi = {10.1016/j.chemolab.2021.104446}
226:  eprint = {2208.00993},
237:  eprint = {2609.23705},
252:  doi = {10.1016/j.neuroimage.2008.05.062}
265:  doi = {10.1080/01621459.2019.1585254},
266:  eprint = {1903.08871},
280:  doi = {10.1109/tbme.2018.2816519}
290:  doi = {10.64898/2026.11.12.766278}
302:  doi = {10.1007/bf02296963}
```
Exit status: 0

### bro1996multiway
Command: python3 lookup resolve '10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c'
```
Crossref: ratio 1.00: Multiway calibration. Multilinear PLS | Rasmus Bro | 1996 | Journal of Chemometrics | vol 10 | no 1 | pages 47--61 | doi 10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c
OpenAlex: ratio 1.00: Multiway calibration. Multilinear PLS | Rasmus Bro | 1996 | Journal of Chemometrics | vol 10 | no 1 | pages 47--61 | doi 10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c | OpenAlex W2155639125
Semantic Scholar: ratio 1.00: Multiway calibration. Multilinear PLS | R. Bro | 1996 | vol 10 | doi 10.1002/(SICI)1099-128X(199601)10:1<47::AID-CEM400>3.0.CO;2-C | Semantic Scholar 5d7a1f4c37d36b804183d4240a304d1539cf5551
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhao2013hopls
Command: python3 lookup resolve '10.1109/tpami.2012.254'
```
Crossref: ratio 1.00: Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method | Qibin Zhao, C. F. Caiafa, D. P. Mandic, Z. C. Chao, Y. Nagasaka, N. Fujii, Liqing Zhang, A. Cichocki | 2013 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 35 | no 7 | pages 1660--1673 | doi 10.1109/tpami.2012.254
OpenAlex: ratio 1.00: Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method | Qibin Zhao, Cesar Federico Caiafa, Danilo P. Mandic, Z. C. Chao, Yasuo Nagasaka, Naotaka Fujii, Liqing Zhang, Andrzej S Cichocki | 2012 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 35 | no 7 | pages 1660--1673 | doi 10.1109/tpami.2012.254 | OpenAlex W1967696752 | open access https://arxiv.org/pdf/1207.1230
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### park2025sparse
Command: python3 lookup resolve '10.1093/biomet/asaf082'
```
Crossref: ratio 1.00: Sparse higher-order partial least squares for simultaneous variable selection, dimension reduction and tensor denoising | Kwangmoon Park, S<latin small letter u with diaeresis>nd<latin small letter u with diaeresis>z Kele<latin small letter s with cedilla> | 2025 | Biometrika | vol 113 | no 1 | doi 10.1093/biomet/asaf082
OpenAlex: ratio 1.00: Sparse higher-order partial least squares for simultaneous variable selection, dimension reduction and tensor denoising | Kwangmoon Park, S<latin small letter u with diaeresis>nd<latin small letter u with diaeresis>z Kele<latin small letter s with cedilla> | 2025 | Biometrika | vol 113 | no 1 | doi 10.1093/biomet/asaf082 | OpenAlex W7106135362 | open access https://arxiv.org/pdf/2310.09428
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhou2013tensor
Command: python3 lookup resolve '10.1080/01621459.2013.776499'
```
Crossref: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Lexin Li, Hongtu Zhu | 2013 | Journal of the American Statistical Association | vol 108 | no 502 | pages 540--552 | doi 10.1080/01621459.2013.776499
OpenAlex: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Lexin Li, Hongtu Zhu | 2013 | Journal of the American Statistical Association | vol 108 | no 502 | pages 540--552 | doi 10.1080/01621459.2013.776499 | OpenAlex W2136002544 | open access http://europepmc.org/articles/PMC4004091
Semantic Scholar: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Le-Xin Li, Hong-Tu Zhu | 2012 | Journal of the American Statistical Association | vol 108 | pages 540--552 | doi 10.1080/01621459.2013.776499 | arXiv 1203.3209 | Semantic Scholar cae78de351d5cbd5bd7fd853cf07034ca2e6659c | open access http://europepmc.org/articles/PMC4004091
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### li2018tucker
Command: python3 lookup resolve '10.1007/s12561-018-9215-6'
```
Crossref: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiaoshan Li, Da Xu, Hua Zhou, Lexin Li | 2018 | Statistics in Biosciences | vol 10 | no 3 | pages 520--545 | doi 10.1007/s12561-018-9215-6
OpenAlex: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiaoshan Li, Da Xu, Hua Zhou, Lexin Li | 2018 | Statistics in Biosciences | vol 10 | no 3 | pages 520--545 | doi 10.1007/s12561-018-9215-6 | OpenAlex W1580176742 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8336908/
Semantic Scholar: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiao-Shan Li, Da Xu, Hua Zhou, Le-Xin Li | 2013 | Statistics in Biosciences | vol 10 | pages 520--545 | doi 10.1007/s12561-018-9215-6 | arXiv 1304.5637 | Semantic Scholar 99163e795fb486abbee830608383b6a142cdf434 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8336908/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xu2024tensor
Command: python3 lookup resolve '10.1214/23-aoas1830'
```
Crossref: ratio 1.00: Tensor regression for incomplete observations with application to longitudinal studies | Tianchen Xu, Kun Chen, Gen Li | 2024 | The Annals of Applied Statistics | vol 18 | no 2 | pages 1195--1212 | doi 10.1214/23-aoas1830
OpenAlex: ratio 1.00: Tensor regression for incomplete observations with application to longitudinal studies | Tianchen Xu, Kun Chen, Gen Li | 2024 | The Annals of Applied Statistics | vol 18 | no 2 | pages 1195--1212 | doi 10.1214/23-aoas1830 | OpenAlex W4393976093 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC11446469/pdf/nihms-2011753.pdf
Semantic Scholar: ratio 1.00: TENSOR REGRESSION FOR INCOMPLETE OBSERVATIONS WITH APPLICATION TO LONGITUDINAL STUDIES | Tianchen Xu, Kun Chen, Gen Li | 2024 | Annals of Applied Statistics | vol 18 | pages 1195--1212 | doi 10.1214/23-aoas1830 | Semantic Scholar be9610c70d40f615f5ea456b84263fbcf2419a94 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC11446469/pdf/nihms-2011753.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### huang2026shift
Command: python3 lookup resolve '10.1007/s11222-026-10892-y'
```
Crossref: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and Computing | vol 36 | no 3 | doi 10.1007/s11222-026-10892-y
OpenAlex: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and Computing | vol 36 | no 3 | doi 10.1007/s11222-026-10892-y | OpenAlex W7160305416 | open access https://link.springer.com/content/pdf/10.1007/s11222-026-10892-y.pdf
Semantic Scholar: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and computing | vol 36 | doi 10.1007/s11222-026-10892-y | Semantic Scholar 0022f9272776da223a17c89c95429f0a0c3d07cc | open access https://link.springer.com/content/pdf/10.1007/s11222-026-10892-y.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kolda2009tensor
Command: python3 lookup resolve '10.1137/07070111x'
```
Crossref: ratio 1.00: Tensor Decompositions and Applications | Tamara G. Kolda, Brett W. Bader | 2009 | SIAM Review | vol 51 | no 3 | pages 455--500 | doi 10.1137/07070111x
OpenAlex: ratio 1.00: Tensor Decompositions and Applications | Tamara G. Kolda, Brett W. Bader | 2009 | SIAM Review | vol 51 | no 3 | pages 455--500 | doi 10.1137/07070111x | OpenAlex W2024165284
Semantic Scholar: ratio 1.00: Tensor Decompositions and Applications | T. Kolda, B. Bader | 2009 | SIAM Review | vol 51 | pages 455--500 | doi 10.1137/07070111X | Semantic Scholar 87e43e9eba01a4eb03436c9946bf6aa031a5d5af
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### harshman1972parafac2
Command: python3 lookup resolve 'https://psychology.uwo.ca/faculty/harshman/wpppfac2.pdf'
```
Crossref: not found
OpenAlex: not found
Semantic Scholar: not found
arXiv: not found
```
Exit status: 0

### kiers1999parafac2
Command: python3 lookup resolve '10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b'
```
Crossref: ratio 1.00: PARAFAC2<em dash>Part I. A direct fitting algorithm for the PARAFAC2 model | Henk A. L. Kiers, Jos M. F. ten Berge, Rasmus Bro | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 275--294 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b
OpenAlex: ratio 0.99: PARAFAC2 - Part I. A direct fitting algorithm for the PARAFAC2 model | Henk A. L. Kiers, Jos M. F. ten Berge, Rasmus Bro | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 275--294 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b | OpenAlex W2167838035
Semantic Scholar: ratio 1.00: PARAFAC2<em dash>Part I. A direct fitting algorithm for the PARAFAC2 model | H. Kiers, J. T. ten Berge, R. Bro | 1999 | vol 13 | doi 10.1002/(SICI)1099-128X(199905/08)13:3/4<275::AID-CEM543>3.0.CO;2-B | Semantic Scholar a2c846e976575e84a1471fb1d042d7f5e04b3417
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bro1999parafac2
Command: python3 lookup resolve '10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y'
```
Crossref: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | Rasmus Bro, Claus A. Andersson, Henk A. L. Kiers | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 295--309 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y
OpenAlex: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | Rasmus Bro, Claus A. Andersson, Henk A. L. Kiers | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 295--309 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y | OpenAlex W1964121443
Semantic Scholar: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | R. Bro, C. Andersson, H. Kiers | 1999 | vol 13 | doi 10.1002/(SICI)1099-128X(199905/08)13:3/4<295::AID-CEM547>3.0.CO;2-Y | Semantic Scholar 0ccfc172cc3ba9ee0d9b1f00ecbcca182aca6d6e
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tang2026tensor
Command: python3 lookup resolve '10.1137/24m1692836'
```
Crossref: ratio 1.00: Tensor Decomposition with Unaligned Observations | Runshi Tang, Tamara G. Kolda, Anru R. Zhang | 2026 | SIAM Journal on Matrix Analysis and Applications | vol 47 | no 1 | pages 107--131 | doi 10.1137/24m1692836
OpenAlex: ratio 1.00: Tensor Decomposition with Unaligned Observations | Runshi Tang, Tamara G. Kolda, Anru R. Zhang | 2026 | SIAM Journal on Matrix Analysis and Applications | vol 47 | no 1 | pages 107--131 | doi 10.1137/24m1692836 | OpenAlex W7127277482 | open access https://arxiv.org/pdf/2410.14046
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kuang2020shift
Command: python3 lookup resolve '10.1109/tmi.2019.2936046'
```
Crossref: ratio 1.00: Shift-Invariant Canonical Polyadic Decomposition of Complex-Valued Multi-Subject fMRI Data With a Phase Sparsity Constraint | Li-Dan Kuang, Qiu-Hua Lin, Xiao-Feng Gong, Fengyu Cong, Yu-Ping Wang, Vince D. Calhoun | 2020 | IEEE Transactions on Medical Imaging | vol 39 | no 4 | pages 844--853 | doi 10.1109/tmi.2019.2936046
OpenAlex: ratio 1.00: Shift-Invariant Canonical Polyadic Decomposition of Complex-Valued Multi-Subject fMRI Data With a Phase Sparsity Constraint | Li<hyphen>Dan Kuang, Qiu<hyphen>Hua Lin, Xiao<hyphen>Feng Gong, Fengyu Cong, Yu<hyphen>Ping Wang, Vince D. Calhoun | 2019 | IEEE Transactions on Medical Imaging | vol 39 | no 4 | pages 844--853 | doi 10.1109/tmi.2019.2936046 | OpenAlex W2969480173 | open access https://ieeexplore.ieee.org/ielx7/42/9055242/08805171.pdf
Semantic Scholar: ratio 1.00: Shift-Invariant Canonical Polyadic Decomposition of Complex-Valued Multi-Subject fMRI Data with a Phase Sparsity Constraint | Li-Dan Kuang, Qiu-Hua Lin, Xiao-Feng Gong, F. Cong, Yu-Ping Wang, V. Calhoun | 2019 | IEEE Transactions on Medical Imaging | vol 39 | pages 844--853 | doi 10.1109/TMI.2019.2936046 | Semantic Scholar 9c6c1c29f70b6c68bf226c4998549bd97b12f8b0 | open access https://ieeexplore.ieee.org/ielx7/42/9055242/08805171.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### acar2022tracing
Command: python3 lookup resolve '10.3389/fnins.2022.861402'
```
Crossref: ratio 1.00: Tracing Evolving Networks Using Tensor Factorizations vs. ICA-Based Approaches | Evrim Acar, Marie Roald, Khondoker M. Hossain, Vince D. Calhoun, T<latin small letter u with diaeresis>lay Adali | 2022 | Frontiers in Neuroscience | vol 16 | doi 10.3389/fnins.2022.861402
OpenAlex: ratio 1.00: Tracing Evolving Networks Using Tensor Factorizations vs. ICA-Based Approaches | Evrim Acar, Marie Roald, Khondoker Murad Hossain, Vince D. Calhoun, T<latin small letter u with diaeresis>lay Adal<latin small letter dotless i> | 2022 | Frontiers in Neuroscience | vol 16 | pages 861402--861402 | doi 10.3389/fnins.2022.861402 | OpenAlex W4224320358 | open access https://doi.org/10.3389/fnins.2022.861402
Semantic Scholar: ratio 1.00: Tracing Evolving Networks Using Tensor Factorizations vs. ICA-Based Approaches | E. Acar, Marie Roald, K. M. Hossain, V. Calhoun, T. Adal<latin small letter dotless i> | 2022 | Frontiers in Neuroscience | vol 16 | doi 10.3389/fnins.2022.861402 | Semantic Scholar 62c3bab5d38f96e6571685918b001ce5b17955c9 | open access https://doi.org/10.3389/fnins.2022.861402
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yu2021local
Command: python3 lookup resolve '10.1016/j.chemolab.2021.104446'
```
Crossref: ratio 1.00: PARAFAC2 and local minima | Huiwen Yu, Rasmus Bro | 2021 | Chemometrics and Intelligent Laboratory Systems | vol 219 | pages 104446 | doi 10.1016/j.chemolab.2021.104446
OpenAlex: ratio 1.00: PARAFAC2 and local minima | Huiwen Yu, Rasmus Bro | 2021 | Chemometrics and Intelligent Laboratory Systems | vol 219 | pages 104446--104446 | doi 10.1016/j.chemolab.2021.104446 | OpenAlex W3209483728
Semantic Scholar: ratio 1.00: PARAFAC2 and local minima | Huiwen Yu, R. Bro | 2021 | Chemometrics and Intelligent Laboratory Systems | doi 10.1016/j.chemolab.2021.104446 | Semantic Scholar 848ee51beef8015f8339c003187cf2def1fea74e
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ren2023multipar
Command: python3 lookup resolve '2208.00993'
```
Crossref: not found
OpenAlex: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yifei Ren, Jian Lou, Xiong Li, Joyce C. Ho, Xiaoqian Jiang, Sivasubramanium Bhavan | 2022 | arXiv (Cornell University) | doi 10.48550/arxiv.2208.00993 | arXiv 2208.00993 | OpenAlex W4289597181 | open access https://arxiv.org/pdf/2208.00993
Semantic Scholar: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yi-Fei Ren, Jian Lou, Li Xiong, Joyce Ho, Xiaoqian Jiang, S. Bhavani | 2022 | arXiv.org | vol abs/2208.00993 | doi 10.48550/arXiv.2208.00993 | arXiv 2208.00993 | Semantic Scholar e8aa9a0fe21c23d18c872475a1f92ef9ab7cd4b7 | open access http://arxiv.org/pdf/2208.00993
arXiv: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yifei Ren, Jian Lou, Li Xiong, Joyce C Ho, Xiaoqian Jiang, Sivasubramanium Bhavani | 2022 | arXiv 2208.00993
```
Exit status: 0

### patalano2026par2cox
Command: python3 lookup resolve '2609.23705'
```
Crossref: not found
OpenAlex: ratio 1.00: PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data | Mariafrancesca Patalano, Elif Konyar, Kamran Paynabar | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2609.23705 | arXiv 2609.23705 | OpenAlex W7214014480 | open access https://arxiv.org/pdf/2609.23705
Semantic Scholar: ratio 1.00: PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data | Mariafrancesca Patalano, Elif Konyar, K. Paynabar | 2026 | arXiv 2609.23705 | Semantic Scholar 771ea4ac7c2f53c12900ccbdcb94d3e2cb5711a7
arXiv: ratio 1.00: PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data | Mariafrancesca Patalano, Elif Konyar, Kamran Paynabar | 2026 | arXiv 2609.23705
```
Exit status: 0

### morup2008shift
Command: python3 lookup resolve '10.1016/j.neuroimage.2008.05.062'
```
Crossref: ratio 1.00: Shift-invariant multilinear decomposition of neuroimaging data | Morten M<latin small letter o with stroke>rup, Lars Kai Hansen, Sidse Marie Arnfred, Lek-Heng Lim, Kristoffer Hougaard Madsen | 2008 | NeuroImage | vol 42 | no 4 | pages 1439--1450 | doi 10.1016/j.neuroimage.2008.05.062
OpenAlex: ratio 1.00: Shift-invariant multilinear decomposition of neuroimaging data | Morten M<latin small letter o with stroke>rup, Lars Kai Hansen, Sidse Arnfred, Lek<hyphen>Heng Lim, Kristoffer Hougaard Madsen | 2008 | NeuroImage | vol 42 | no 4 | pages 1439--1450 | doi 10.1016/j.neuroimage.2008.05.062 | OpenAlex W2095141632 | open access http://eprints.drcmr.dk/29/1/Shift_invariant_decomp_2008.pdf
Semantic Scholar: ratio 1.00: Shift-invariant multilinear decomposition of neuroimaging data | M. M<latin small letter o with stroke>rup, L. Hansen, S. Arnfred, Lek-Heng Lim, Kristoffer Hougaard Madsen | 2008 | NeuroImage | vol 42 4 | pages 1439--50 | doi 10.1016/j.neuroimage.2008.05.062 | Semantic Scholar b63ce62e20b4afa7b377307783f58dde6748f8a7 | open access http://eprints.drcmr.dk/29/1/Shift_invariant_decomp_2008.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tang2019individualized
Command: python3 lookup resolve '10.1080/01621459.2019.1585254'
```
Crossref: ratio 1.00: Individualized Multilayer Tensor Learning With an Application in Imaging Analysis | Xiwei Tang, Xuan Bi, Annie Qu | 2019 | Journal of the American Statistical Association | vol 115 | no 530 | pages 836--851 | doi 10.1080/01621459.2019.1585254
OpenAlex: ratio 1.00: Individualized Multilayer Tensor Learning With an Application in Imaging Analysis | Xiwei Tang, Xuan Bi, Annie Qu | 2019 | Journal of the American Statistical Association | vol 115 | no 530 | pages 836--851 | doi 10.1080/01621459.2019.1585254 | OpenAlex W2924265785 | open access https://arxiv.org/pdf/1903.08871
Semantic Scholar: ratio 1.00: Individualized Multilayer Tensor Learning With an Application in Imaging Analysis | Xi-Wei Tang, Xuan Bi, An-Nie Qu | 2019 | Journal of the American Statistical Association | vol 115 | pages 836--851 | doi 10.1080/01621459.2019.1585254 | arXiv 1903.08871 | Semantic Scholar 1c9a457259329e7a948542ae285794228f559ffa | open access https://arxiv.org/pdf/1903.08871
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### mcleod2018cardiac
Command: python3 lookup resolve '10.1109/tbme.2018.2816519'
```
Crossref: ratio 1.00: Cardiac Motion Evolution Model for Analysis of Functional Changes Using Tensor Decomposition and Cross-Sectional Data | Kristin McLeod, Kristin Tondel, Lilian Calvet, Maxime Sermesant, Xavier Pennec | 2018 | IEEE Transactions on Biomedical Engineering | vol 65 | no 12 | pages 2769--2780 | doi 10.1109/tbme.2018.2816519
OpenAlex: ratio 1.00: Cardiac Motion Evolution Model for Analysis of Functional Changes Using Tensor Decomposition and Cross-Sectional Data | Kristin McLeod, Kristin T<latin small letter o with stroke>ndel, Lilian Calvet, Maxime Sermesant, Xavier Pennec | 2018 | IEEE Transactions on Biomedical Engineering | vol 65 | no 12 | pages 2769--2780 | doi 10.1109/tbme.2018.2816519 | OpenAlex W2898333304 | open access https://inria.hal.science/hal-01736454v1/file/TBME2816519.pdf
Semantic Scholar: ratio 1.00: Cardiac Motion Evolution Model for Analysis of Functional Changes Using Tensor Decomposition and Cross-Sectional Data | K. Mcleod, Kristin T<latin small letter o with stroke>ndel, Lilian Calvet, Maxime Sermesant, X. Pennec | 2018 | IEEE Transactions on Biomedical Engineering | vol 65 | pages 2769--2780 | doi 10.1109/TBME.2018.2816519 | Semantic Scholar 733ee2c05c170b8cf66ba744efc8425403b4bfcd | open access https://inria.hal.science/hal-01736454v1/file/TBME2816519.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kralik2026identifying
Command: python3 lookup resolve '10.64898/2026.11.12.766278'
```
Crossref: ratio 1.00: Identifying aligned tensor decompositions across heterogeneous neural datasets | Mikl<latin small letter o with acute>s Kr<latin small letter a with acute>lik, Sasha Tinelli, James Kozloski, Rui Ponte Costa, Andrew Sharott, Robert L. Peach | 2026 | doi 10.64898/2026.11.12.766278
OpenAlex: ratio 1.00: Identifying aligned tensor decompositions across heterogeneous neural datasets | Mikl<latin small letter o with acute>s Andr<latin small letter a with acute>s Kr<latin small letter a with acute>lik, Sasha Tinelli, James Kozloski, Rui Ponte Costa, Andrew Sharott, Robert L. Peach | 2026 | bioRxiv (Cold Spring Harbor Laboratory) | doi 10.64898/2026.11.12.766278 | OpenAlex W7226007733 | open access https://www.biorxiv.org/content/biorxiv/early/2026/11/13/2026.11.12.766278.full.pdf
Semantic Scholar: ratio 1.00: Identifying aligned tensor decompositions across heterogeneous neural datasets | Mikl<latin small letter o with acute>s Kr<latin small letter a with acute>lik, Sasha Tinelli, J. Kozloski, Rui Ponte Costa, A. Sharott, R. Peach | 2026 | bioRxiv | doi 10.64898/2026.11.12.766278 | Semantic Scholar 05ed3766e7e6d5ee5b00e32c6ecbe3b1e6549ecd | open access https://www.biorxiv.org/content/biorxiv/early/2026/11/13/2026.11.12.766278.full.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### harshman1996uniqueness
Command: python3 lookup resolve '10.1007/bf02296963'
```
Crossref: ratio 1.00: Uniqueness Proof for a Family of Models Sharing Features of Tucker's Three-Mode Factor Analysis and PARAFAC/Candecomp | Richard A. Harshman, Margaret E. Lundy | 1996 | Psychometrika | vol 61 | no 1 | pages 133--154 | doi 10.1007/bf02296963
OpenAlex: ratio 1.00: Uniqueness Proof for a Family of Models Sharing Features of Tucker's Three-Mode Factor Analysis and PARAFAC/Candecomp | Richard A. Harshman, Margaret E. Lundy | 1996 | Psychometrika | vol 61 | no 1 | pages 133--154 | doi 10.1007/bf02296963 | OpenAlex W2101815756
Semantic Scholar: ratio 1.00: Uniqueness proof for a family of models sharing features of Tucker's three-mode factor analysis and PARAFAC/candecomp | R. Harshman, M. Lundy | 1996 | vol 61 | pages 133--154 | doi 10.1007/BF02296963 | Semantic Scholar e9ba1e7f1a6cb2d66b7baf5c25cbc355a408838f
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### harshman1972parafac2 (entry with neither a DOI nor an arXiv ID: url check)
The `resolve` call above for this entry passed its `url` as the identifier, because the session's loop read an empty DOI field wrongly; that call checks nothing and is replaced by this url check. The loop was corrected for the later checks.
Check: WebFetch of `https://psychology.uwo.ca/faculty/harshman/wpppfac2.pdf` (HTTP 200, application/pdf), first page read as an image.
What the page showed: the title "PARAFAC2: Mathematical and Technical Notes", the author "Richard A. Harshman", and the note "Harshman, R. A. (1972). PARAFAC2: Mathematical and technical notes. UCLA Working Papers in Phonetics, 22, 30-44. (University Microfilms, Ann Arbor, Michigan, No. 10,085)."
Result: the page names the entry's title; the check passes.

### Theme run 1 summary
22 entries checked: 21 by `the lookup script resolve` (exit 0 each; every one has at least one index record), 1 by its url (passes). No identifier provably fails.

## Identifier check: theme run 3 (theme-refs-3.bib), 2026-11-19 23:18

Command: grep -n -i -E '^[[:space:]]*(doi|eprint)[[:space:]]*=' 'theme-refs-3.bib'
```
8:  eprint = {1703.06114},
22:  eprint = {1810.00825},
32:  eprint = {1811.01900},
43:  doi = {10.52202/075280-1845},
44:  eprint = {2306.06529},
56:  eprint = {2307.04001},
67:  doi = {10.1109/CVPR.2017.16},
68:  eprint = {1612.00593},
79:  eprint = {1706.02413},
92:  doi = {10.1145/3326362},
93:  eprint = {1801.07829},
104:  doi = {10.1109/ICCV48922.2021.01595}
117:  eprint = {1802.04712},
130:  doi = {10.1561/2200000060},
131:  eprint = {1605.09522},
144:  eprint = {1411.2066},
157:  doi = {10.1038/s41591-019-0508-1}
169:  doi = {10.1038/s41551-020-00682-w},
170:  eprint = {2004.09666},
182:  doi = {10.1016/j.media.2020.101852},
195:  doi = {10.1038/s41598-022-12533-6}
206:  doi = {10.1007/978-3-030-87240-3_72},
207:  eprint = {2012.06875},
220:  doi = {10.1109/TNNLS.2019.2892409},
221:  eprint = {1711.08324},
236:  eprint = {1901.09006},
248:  doi = {10.52202/075280-0596},
249:  eprint = {2310.17867},
261:  eprint = {2406.06984},
272:  doi = {10.1109/ICCV48922.2021.01591}
283:  doi = {10.1088/1361-6560/ae7955},
296:  eprint = {2604.26807},
```
Exit status: 0

### zaheer2017deep
Command: python3 lookup resolve '1703.06114'
```
Crossref: not found
OpenAlex: ratio 1.00: Deep Sets | Manzil Zaheer, Satwik Kottur, Siamak Ravanbakhsh, Barnab<latin small letter a with acute>s P<latin small letter o with acute>czos, Ruslan Salakhutdinov, Alexander Johannes Smola | 2017 | arXiv (Cornell University) | doi 10.48550/arxiv.1703.06114 | arXiv 1703.06114 | OpenAlex W4299457904 | open access https://arxiv.org/pdf/1703.06114
Semantic Scholar: ratio 1.00: Deep Sets | M. Zaheer, S. Kottur, Siamak Ravanbakhsh, B. P<latin small letter o with acute>czos, R. Salakhutdinov, Alex Smola | 2017 | arXiv 1703.06114 | Semantic Scholar de4edcddc028b0088f7ee44ae6e4be261f20b6f6
arXiv: ratio 1.00: Deep Sets | Manzil Zaheer, Satwik Kottur, Siamak Ravanbakhsh, Barnabas Poczos, Ruslan Salakhutdinov, Alexander Smola | 2017 | arXiv 1703.06114
```
Exit status: 0

### lee2019set
Command: python3 lookup resolve '1810.00825'
```
Crossref: not found
OpenAlex: ratio 1.00: Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks | Juho Lee, Yoonho Lee, Jungtaek Kim, Adam R. Kosiorek, Seungjin Choi, Yee Whye Teh | 2018 | Oxford University Research Archive (ORA) (University of Oxford) | doi 10.48550/arxiv.1810.00825 | arXiv 1810.00825 | OpenAlex W2894384847 | open access https://ora.ox.ac.uk/objects/uuid:8aa5f831-66b2-46ca-89ea-7b2384064db3/files/s8k71nh51g
Semantic Scholar: DOI_MISMATCH, ratio 0.31: Set Transformer | Juho Lee, Yoonho Lee, Jungtaek Kim, Adam R. Kosiorek, Seung-Jin Choi, Y. Teh | 2018 | International Conference on Machine Learning | vol abs/1810.00825 | doi 10.48550/arXiv.1810.00825 | arXiv 1810.00825 | Semantic Scholar 512b8ef0002e0bfd0ecb5ab17d533c1762eb9786
arXiv: ratio 1.00: Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks | Juho Lee, Yoonho Lee, Jungtaek Kim, Adam R. Kosiorek, Seungjin Choi, Yee Whye Teh | 2018 | arXiv 1810.00825
```
Exit status: 0

### murphy2019janossy
Command: python3 lookup resolve '1811.01900'
```
Crossref: not found
OpenAlex: ratio 1.00: Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs | Ryan L. Murphy, Balasubramaniam Srinivasan, Vinayak Rao, Bruno Ribeiro | 2018 | arXiv (Cornell University) | doi 10.48550/arxiv.1811.01900 | arXiv 1811.01900 | OpenAlex W2899038170 | open access https://arxiv.org/pdf/1811.01900
Semantic Scholar: ratio 1.00: Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs | R. Murphy, Balasubramaniam Srinivasan, Vinayak A. Rao, Bruno Ribeiro | 2018 | International Conference on Learning Representations | vol abs/1811.01900 | doi 10.48550/arXiv.1811.01900 | arXiv 1811.01900 | Semantic Scholar de9550945b2f631c541c299114a770c4f47f9616 | open access http://arxiv.org/pdf/1811.01900
arXiv: ratio 1.00: Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs | Ryan L. Murphy, Balasubramaniam Srinivasan, Vinayak Rao, Bruno Ribeiro | 2018 | arXiv 1811.01900
```
Exit status: 0

### amir2023neural
Command: python3 lookup resolve '10.52202/075280-1845'
```
Crossref: ratio 1.00: Neural Injective Functions for Multisets, Measures and Graphs via a Finite Witness Theorem | Tal Amir, Steven Gortler, Ilai Avni, Ravina Ravina, Nadav Dym | 2023 | Advances in Neural Information Processing Systems 36 | pages 42516--42551 | doi 10.52202/075280-1845
OpenAlex: ratio 1.00: Neural Injective Functions for Multisets, Measures and Graphs via a Finite Witness Theorem | Tal Amir, Steven Gortler, Ilai Avni, Ravina Ravina, Nadav Dym | 2023 | neural information processing systems | pages 42516--42551 | doi 10.52202/075280-1845 | OpenAlex W7133227055 | open access https://arxiv.org/pdf/2306.06529
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wang2024polynomial
Command: python3 lookup resolve '2307.04001'
```
Crossref: not found
OpenAlex: ratio 1.00: Polynomial Width is Sufficient for Set Representation with High-dimensional Features | Peihao Wang, Shenghao Yang, Shu Li, Zhangyang Wang, Li, Pan | 2023 | International Conference on Learning Representations | doi 10.48550/arxiv.2307.04001 | arXiv 2307.04001 | OpenAlex W4383987642 | open access https://proceedings.iclr.cc/paper_files/paper/2024/hash/e55b33430e344a1ee23710415b1c9d87-Abstract-Conference.html
Semantic Scholar: ratio 1.00: Polynomial Width is Sufficient for Set Representation with High-dimensional Features | Pei-Hao Wang, Sheng-Hao Yang, Shu Li, Zhang-Yang Wang, Pan Li | 2023 | International Conference on Learning Representations | vol abs/2307.04001 | doi 10.48550/arXiv.2307.04001 | arXiv 2307.04001 | Semantic Scholar 2d401d97bec4b6871fa4bcfef385107b5e27bb30 | open access https://arxiv.org/pdf/2307.04001
arXiv: ratio 1.00: Polynomial Width is Sufficient for Set Representation with High-dimensional Features | Peihao Wang, Shenghao Yang, Shu Li, Zhangyang Wang, Pan Li | 2023 | arXiv 2307.04001
```
Exit status: 0

### qi2017pointnet
Command: python3 lookup resolve '10.1109/CVPR.2017.16'
```
Crossref: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | R. Qi Charles, Hao Su, Mo Kaichun, Leonidas J. Guibas | 2017 | 2017 IEEE Conference on Computer Vision and Pattern Recognition (CVPR) | pages 77--85 | doi 10.1109/cvpr.2017.16
OpenAlex: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | Raffaelli Charles, Hao Su, Kaichun Mo, Leonidas J. Guibas | 2017 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | pages 77--85 | doi 10.1109/cvpr.2017.16 | OpenAlex W2560609797
Semantic Scholar: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | R. Q. Charles, Hao Su, K. Mo, L. Guibas | 2016 | Computer Vision and Pattern Recognition | pages 77--85 | doi 10.1109/CVPR.2017.16 | arXiv 1612.00593 | Semantic Scholar d997beefc0922d97202789d2ac307c55c2c52fba
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### qi2017pointnetpp
Command: python3 lookup resolve '1706.02413'
```
Crossref: not found
OpenAlex: ratio 1.00: PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space | Charles R. Qi, Li Yi, Hao Su, Leonidas J. Guibas | 2017 | arXiv (Cornell University) | doi 10.48550/arxiv.1706.02413 | arXiv 1706.02413 | OpenAlex W2624503621 | open access https://arxiv.org/pdf/1706.02413
Semantic Scholar: ratio 1.00: PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space | C. Qi, L. Yi, Hao Su, L. Guibas | 2017 | Neural Information Processing Systems | pages 5099--5108 | doi 10.48550/arXiv.1706.02413 | arXiv 1706.02413 | Semantic Scholar 8674494bd7a076286b905912d26d47f7501c4046
arXiv: ratio 1.00: PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space | Charles R. Qi, Li Yi, Hao Su, Leonidas J. Guibas | 2017 | arXiv 1706.02413
```
Exit status: 0

### wang2019dynamic
Command: python3 lookup resolve '10.1145/3326362'
```
Crossref: ratio 1.00: Dynamic Graph CNN for Learning on Point Clouds | Yue Wang, Yongbin Sun, Ziwei Liu, Sanjay E. Sarma, Michael M. Bronstein, Justin M. Solomon | 2019 | ACM Transactions on Graphics | vol 38 | no 5 | pages 1--12 | doi 10.1145/3326362
OpenAlex: ratio 1.00: Dynamic Graph CNN for Learning on Point Clouds | Yue Wang, Yongbin Sun, Ziwei Liu, Sanjay Emani Sarma, Michael M. Bronstein, Justin Solomon | 2019 | ACM Transactions on Graphics | vol 38 | no 5 | pages 1--12 | doi 10.1145/3326362 | OpenAlex W2979750740 | open access https://dl.acm.org/doi/pdf/10.1145/3326362
Semantic Scholar: ratio 1.00: Dynamic Graph CNN for Learning on Point Clouds | Yue Wang, Yongbin Sun, Zi-Wei Liu, S. Sarma, M. Bronstein, J. Solomon | 2018 | ACM Transactions on Graphics | vol 38 | pages 1--12 | doi 10.1145/3326362 | arXiv 1801.07829 | Semantic Scholar e1799aaf23c12af6932dc0ef3dfb1638f01413d1 | open access https://dl.acm.org/doi/pdf/10.1145/3326362
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhao2021point
Command: python3 lookup resolve '10.1109/ICCV48922.2021.01595'
```
Crossref: ratio 1.00: Point Transformer | Hengshuang Zhao, Li Jiang, Jiaya Jia, Philip Torr, Vladlen Koltun | 2021 | 2021 IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16239--16248 | doi 10.1109/iccv48922.2021.01595
OpenAlex: ratio 1.00: Point Transformer | Hengshuang Zhao, Li Jiang, Jiaya Jia, Philip H. S. Torr, Vladlen Koltun | 2021 | IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16239--16248 | doi 10.1109/iccv48922.2021.01595 | OpenAlex W4214755140
Semantic Scholar: ratio 1.00: Point Transformer | Heng-Shuang Zhao, Li Jiang, Jia-Ya Jia, P. Torr, V. Koltun | 2020 | IEEE International Conference on Computer Vision | pages 16239--16248 | doi 10.1109/ICCV48922.2021.01595 | arXiv 2012.09164 | Semantic Scholar ea249d27148fff074af742f70f88aa5878d29ae6
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ilse2018attention
Command: python3 lookup resolve '1802.04712'
```
Crossref: not found
OpenAlex: ratio 1.00: Attention-based Deep Multiple Instance Learning | Maximilian Ilse, Jakub M. Tomczak, Max Welling | 2018 | arXiv (Cornell University) | doi 10.48550/arxiv.1802.04712 | arXiv 1802.04712 | OpenAlex W2785934082 | open access https://arxiv.org/pdf/1802.04712
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Attention-based Deep Multiple Instance Learning | Maximilian Ilse, Jakub M. Tomczak, Max Welling | 2018 | arXiv 1802.04712
```
Exit status: 0

### muandet2017kernel
Command: python3 lookup resolve '10.1561/2200000060'
```
Crossref: ratio 1.00: Kernel Mean Embedding of Distributions: A Review and Beyond | Krikamol Muandet, Kenji Fukumizu, Bharath Sriperumbudur, Bernhard Sch<latin small letter o with diaeresis>lkopf | 2017 | Foundations and Trends<registered sign> in Machine Learning | vol 10 | no 1-2 | pages 1--141 | doi 10.1561/2200000060
OpenAlex: ratio 1.00: Kernel Mean Embedding of Distributions: A Review and Beyond | Krikamol Muandet, Kenji Fukumizu, Bharath K. Sriperumbudur, Bernhard Sch<latin small letter o with diaeresis>lkopf | 2017 | now publishers, Inc. eBooks | vol 10 | no 1-2 | pages 1--141 | doi 10.1561/9781680832891 | OpenAlex W2418306335 | open access https://arxiv.org/pdf/1605.09522
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### szabo2016learning
Command: python3 lookup resolve '1411.2066'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning Theory for Distribution Regression | Zolt<latin small letter a with acute>n Szab<latin small letter o with acute>, Bharath K. Sriperumbudur, Barnab<latin small letter a with acute>s P<latin small letter o with acute>czos, Arthur Gretton | 2014 | arXiv (Cornell University) | vol 17 | no 1 | pages 5272--5311 | doi 10.48550/arxiv.1411.2066 | arXiv 1411.2066 | OpenAlex W1689407543 | open access https://arxiv.org/pdf/1411.2066
Semantic Scholar: ratio 1.00: Learning Theory for Distribution Regression | Z. Szab<latin small letter o with acute>, Bharath K. Sriperumbudur, B. P<latin small letter o with acute>czos, A. Gretton | 2014 | Journal of machine learning research | vol abs/1411.2066 | doi 10.48550/arXiv.1411.2066 | arXiv 1411.2066 | Semantic Scholar e215b1b54f5a1682466a0e4034984dda61d3c6f8 | open access http://arxiv.org/pdf/1411.2066
arXiv: ratio 1.00: Learning Theory for Distribution Regression | Zoltan Szabo, Bharath Sriperumbudur, Barnabas Poczos, Arthur Gretton | 2014 | arXiv 1411.2066
```
Exit status: 0

### campanella2019clinical
Command: python3 lookup resolve '10.1038/s41591-019-0508-1'
```
Crossref: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | Gabriele Campanella, Matthew G. Hanna, Luke Geneslaw, Allen Miraflor, Vitor Werneck Krauss Silva, Klaus J. Busam, Edi Brogi, Victor E. Reuter, David S. Klimstra, Thomas J. Fuchs | 2019 | Nature Medicine | vol 25 | no 8 | pages 1301--1309 | doi 10.1038/s41591-019-0508-1
OpenAlex: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | Gabriele S. V. Campanella, Matthew G. Hanna, Luke Geneslaw, Allen P. Miraflor, Vitor Werneck Krauss Silva, Klaus Johannes BUSAM, Edi Brogi, Victor E. Reuter, David S. Klimstra, Thomas J. Fuchs | 2019 | Nature Medicine | vol 25 | no 8 | pages 1301--1309 | doi 10.1038/s41591-019-0508-1 | OpenAlex W2956228567 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7418463/
Semantic Scholar: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | G. Campanella, M. Hanna, L. Geneslaw, Allen P. Miraflor, Vitor Werneck Krauss Silva, K. Busam, E. Brogi, V. Reuter, D. Klimstra, Thomas J. Fuchs | 2019 | Nature Medicine | vol 25 | pages 1301--1309 | doi 10.1038/s41591-019-0508-1 | Semantic Scholar addae423490bbe82da4fb2fc265237178686b4e8 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7418463/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### lu2021data
Command: python3 lookup resolve '10.1038/s41551-020-00682-w'
```
Crossref: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Y. Chen, Richard J. Chen, Matteo Barbieri, Faisal Mahmood | 2021 | Nature Biomedical Engineering | vol 5 | no 6 | pages 555--570 | doi 10.1038/s41551-020-00682-w
OpenAlex: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Chen, Richard J. Chen, Matteo Barbieri, Faisal Mahmood | 2021 | Nature Biomedical Engineering | vol 5 | no 6 | pages 555--570 | doi 10.1038/s41551-020-00682-w | OpenAlex W3018295606 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8711640/
Semantic Scholar: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Y. Chen, Richard J. Chen, Matteo Barbieri, Faisal Mahmood | 2020 | Nature Biomedical Engineering | vol 5 | pages 555--570 | doi 10.1038/s41551-020-00682-w | arXiv 2004.09666 | Semantic Scholar 3e358c3033908a9506e7f1e3cf29283e359f43d6 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8711640/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gutierrezbecker2021discriminative
Command: python3 lookup resolve '10.1016/j.media.2020.101852'
```
Crossref: ratio 1.00: Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks | Benjam<latin small letter i with acute>n Guti<latin small letter e with acute>rrez-Becker, Ignacio Sarasua, Christian Wachinger | 2021 | Medical Image Analysis | vol 67 | pages 101852 | doi 10.1016/j.media.2020.101852
OpenAlex: ratio 1.00: Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks | Benjam<latin small letter i with acute>n Guti<latin small letter e with acute>rrez-Becker, Ignacio Saras<latin small letter u with acute>a, Christian Wachinger | 2020 | Medical Image Analysis | vol 67 | pages 101852--101852 | doi 10.1016/j.media.2020.101852 | OpenAlex W3092480895 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841520302164
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### sarasua2022hippocampal
Command: python3 lookup resolve '10.1038/s41598-022-12533-6'
```
Crossref: ratio 1.00: Hippocampal representations for deep learning on Alzheimer<right single quotation mark>s disease | Ignacio Sarasua, Sebastian P<latin small letter o with diaeresis>lsterl, Christian Wachinger | 2022 | Scientific Reports | vol 12 | no 1 | doi 10.1038/s41598-022-12533-6
OpenAlex: ratio 1.00: Hippocampal representations for deep learning on Alzheimer<right single quotation mark>s disease | Ignacio Saras<latin small letter u with acute>a, Sebastian P<latin small letter o with diaeresis>lsterl, Christian Wachinger | 2022 | Scientific Reports | vol 12 | no 1 | pages 8619--8619 | doi 10.1038/s41598-022-12533-6 | OpenAlex W4281252270 | open access https://www.nature.com/articles/s41598-022-12533-6.pdf
Semantic Scholar: ratio 1.00: Hippocampal representations for deep learning on Alzheimer<right single quotation mark>s disease | Ignacio Saras<latin small letter u with acute>a, S. P<latin small letter o with diaeresis>lsterl, C. Wachinger | 2021 | Scientific Reports | vol 12 | doi 10.1038/s41598-022-12533-6 | Semantic Scholar 715608ba0f44ebdf22bb9a38483b40e7f515ac86 | open access https://www.nature.com/articles/s41598-022-12533-6.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2021aminn
Command: python3 lookup resolve '10.1007/978-3-030-87240-3_72'
```
Crossref: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jianan Chen, Helen M. C. Cheung, Laurent Milot, Anne L. Martel | 2021 | Lecture Notes in Computer Science | pages 752--761 | doi 10.1007/978-3-030-87240-3_72
OpenAlex: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jianan Chen, Helen Cheung, Laurent M. Milot, Anne Louise Martel | 2021 | Lecture notes in computer science | pages 752--761 | doi 10.1007/978-3-030-87240-3_72 | OpenAlex W3202344381
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### liao2019evaluate
Command: python3 lookup resolve '10.1109/TNNLS.2019.2892409'
```
Crossref: ratio 1.00: Evaluate the Malignancy of Pulmonary Nodules Using the 3-D Deep Leaky Noisy-OR Network | Fangzhou Liao, Ming Liang, Zhe Li, Xiaolin Hu, Sen Song | 2019 | IEEE Transactions on Neural Networks and Learning Systems | vol 30 | no 11 | pages 3484--3495 | doi 10.1109/tnnls.2019.2892409
OpenAlex: ratio 1.00: Evaluate the Malignancy of Pulmonary Nodules Using the 3-D Deep Leaky Noisy-OR Network | Fangzhou Liao, Ming Liang, Zhe Li, Xiaolin Hu, Sen Song | 2019 | IEEE Transactions on Neural Networks and Learning Systems | vol 30 | no 11 | pages 3484--3495 | doi 10.1109/tnnls.2019.2892409 | OpenAlex W2769848455 | open access https://arxiv.org/pdf/1711.08324
Semantic Scholar: ratio 1.00: Evaluate the Malignancy of Pulmonary Nodules Using the 3-D Deep Leaky Noisy-OR Network | Fangzhou Liao, Ming Liang, Zhe Li, Xiao-Lin Hu, Sen Song | 2017 | IEEE Transactions on Neural Networks and Learning Systems | vol 30 | pages 3484--3495 | doi 10.1109/TNNLS.2019.2892409 | arXiv 1711.08324 | Semantic Scholar 707ef87813de2c792820121c23868fab569ec559 | open access https://arxiv.org/pdf/1711.08324
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wagstaff2019limitations
Command: python3 lookup resolve '1901.09006'
```
Crossref: not found
OpenAlex: ratio 1.00: On the Limitations of Representing Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Ingmar Posner, Michael A. Osborne | 2019 | Oxford University Research Archive (ORA) (University of Oxford) | pages 6487--6494 | doi 10.48550/arxiv.1901.09006 | arXiv 1901.09006 | OpenAlex W2913668534 | open access https://ora.ox.ac.uk/objects/uuid:3d5730ad-0070-46e9-b173-5b139d122dba/files/mdb1a40b64d60b73dfda93fbcd08485f1
Semantic Scholar: ratio 1.00: On the Limitations of Representing Functions on Sets | Edward Wagstaff, F. Fuchs, Martin Engelcke, I. Posner, Michael A. Osborne | 2019 | International Conference on Machine Learning | pages 6487--6494 | doi 10.48550/arXiv.1901.09006 | arXiv 1901.09006 | Semantic Scholar bc6f7ba757b437842564cd028881a509c225ce26
arXiv: ratio 1.00: On the Limitations of Representing Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Ingmar Posner, Michael Osborne | 2019 | arXiv 1901.09006
```
Exit status: 0

### raff2023reproducibility
Command: python3 lookup resolve '10.52202/075280-0596'
```
Crossref: ratio 1.00: Reproducibility in Multiple Instance Learning: A Case For Algorithmic Unit Tests | Edward Raff, James Holt | 2023 | Advances in Neural Information Processing Systems 36 | pages 13530--13544 | doi 10.52202/075280-0596
OpenAlex: ratio 1.00: Reproducibility in Multiple Instance Learning: A Case For Algorithmic Unit Tests | Edward Raff, James Holt | 2023 | neural information processing systems | pages 13530--13544 | doi 10.52202/075280-0596 | OpenAlex W7133184161 | open access https://arxiv.org/pdf/2310.17867
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### davidson2025holder
Command: python3 lookup resolve '2406.06984'
```
Crossref: not found
OpenAlex: ratio 1.00: On the H<latin small letter o with diaeresis>lder Stability of Multiset and Graph Neural Networks | Yair Davidson, Nadav Dym | 2024 | International Conference on Learning Representations | doi 10.48550/arxiv.2406.06984 | arXiv 2406.06984 | OpenAlex W4399598149 | open access https://proceedings.iclr.cc/paper_files/paper/2025/hash/89d0d5c2f720921df93bbb8fef514571-Abstract-Conference.html
Semantic Scholar: ratio 1.00: On the H<latin small letter o with diaeresis>lder Stability of Multiset and Graph Neural Networks | Yair Davidson, Nadav Dym | 2024 | International Conference on Learning Representations | vol abs/2406.06984 | doi 10.48550/arXiv.2406.06984 | arXiv 2406.06984 | Semantic Scholar f34f42d40fea777f17a12e09ca8b8b6ddcacadc7
arXiv: ratio 1.00: On the H<latin small letter o with diaeresis>lder Stability of Multiset and Graph Neural Networks | Yair Davidson, Nadav Dym | 2024 | arXiv 2406.06984
```
Exit status: 0

### li2021closer
Command: python3 lookup resolve '10.1109/ICCV48922.2021.01591'
```
Crossref: ratio 1.00: A Closer Look at Rotation-invariant Deep Point Cloud Analysis | Feiran Li, Kent Fujiwara, Fumio Okura, Yasuyuki Matsushita | 2021 | 2021 IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16198--16207 | doi 10.1109/iccv48922.2021.01591
OpenAlex: ratio 1.00: A Closer Look at Rotation-invariant Deep Point Cloud Analysis | Feiran Li, Kent Fujiwara, Fumio Okura, Yasuyuki Matsushita | 2021 | IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16198--16207 | doi 10.1109/iccv48922.2021.01591 | OpenAlex W3203310607
Semantic Scholar: ratio 1.00: A Closer Look at Rotation-invariant Deep Point Cloud Analysis | Fei-Ran Li, Kent Fujiwara, Fumio Okura, Y. Matsushita | 2021 | IEEE International Conference on Computer Vision | pages 16198--16207 | doi 10.1109/ICCV48922.2021.01591 | Semantic Scholar cd6b56319f85d0ae9266711247ad3e22496e8ab4
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### karimzadeh2026revisiting
Command: python3 lookup resolve '10.1088/1361-6560/ae7955'
```
Crossref: ratio 1.00: Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study | Reza Karimzadeh, Setareh Hasanabadi, Maryam Cheraghi, Mehrdad Bakhshayesh Karam, Hossein Arabi, Bulat Ibragimov | 2026 | Physics in Medicine &amp; Biology | vol 71 | no 12 | pages 125014 | doi 10.1088/1361-6560/ae7955
OpenAlex: ratio 1.00: Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study | Reza Karimzadeh, Saeed Shafiee Hasanabadi, Maryam Cheraghi, Mehrdad Bakhshayesh Karam, Hossein Arabi, Bulat Ibragimov | 2026 | Physics in Medicine and Biology | vol 71 | no 12 | pages 125014--125014 | doi 10.1088/1361-6560/ae7955 | OpenAlex W7163639403 | open access https://iopscience.iop.org/article/10.1088/1361-6560/ae7955/pdf
Semantic Scholar: ratio 1.00: Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study | Reza Karimzadeh, S. Hasanabadi, Maryam Cheraghi, M. Karam, Hossein Arabi, B. Ibragimov | 2026 | Physics in Medicine and Biology | vol 71 | doi 10.1088/1361-6560/ae7955 | Semantic Scholar 74f3f1dd7f19a09b1361f61914d94094d2817f7f | open access https://iopscience.iop.org/article/10.1088/1361-6560/ae7955/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### harvey2026multi
Command: python3 lookup resolve '2604.26807'
```
Crossref: not found
OpenAlex: ratio 1.00: A Multi-Dataset Benchmark of Multiple Instance Learning for 3D Neuroimage Classification | Ethan Harvey, Dennis Johan Loevlie, Amir Ali Satani, Wansu Chen, David M. Kent, Michael C. Hughes | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2604.26807 | arXiv 2604.26807 | OpenAlex W7158475607 | open access https://arxiv.org/pdf/2604.26807
Semantic Scholar: ratio 1.00: A Multi-Dataset Benchmark of Multiple Instance Learning for 3D Neuroimage Classification | Ethan Harvey, Dennis Johan Loevlie, Amir A. Satani, Wan-Su Chen, D. Kent, M. Hughes | 2026 | arXiv.org | vol abs/2604.26807 | doi 10.48550/arXiv.2604.26807 | arXiv 2604.26807 | Semantic Scholar 602186ca3351af70e27c8ac90f158ee24f8f69ed
arXiv: ratio 1.00: A Multi-Dataset Benchmark of Multiple Instance Learning for 3D Neuroimage Classification | Ethan Harvey, Dennis Johan Loevlie, Amir Ali Satani, Wansu Chen, David M. Kent, Michael C. Hughes | 2026 | arXiv 2604.26807
```
Exit status: 0

### Theme run 3 summary
24 entries checked by `the lookup script resolve` (exit 0 each); every entry has at least one index record that matches it. Semantic Scholar printed a different title for lee2019set ("Set Transformer", ratio 0.31) beside matching Crossref/OpenAlex/arXiv records; the merge run resolves it. No identifier provably fails.

### Theme run 4 summary
26 entries checked by `the lookup script resolve` (exit 0 each); every entry has at least one index record with title ratio 1.00. No identifier provably fails.

## Identifier check: theme run 2 (theme-refs-2.bib), 2026-11-19 23:27

Command: grep -n -i -E '^[[:space:]]*(doi|eprint)[[:space:]]*=' 'theme-refs-2.bib'
```
9:  eprint = {1306.0895},
22:  doi = {10.1561/2200000073},
23:  eprint = {1803.00567},
37:  eprint = {1810.02733},
50:  doi = {10.1137/141000439},
51:  eprint = {1412.5154},
64:  doi = {10.1007/s10208-011-9093-5}
89:  eprint = {1805.09114},
101:  eprint = {2009.04266},
115:  eprint = {2106.01128},
127:  eprint = {2306.00182},
140:  doi = {10.1137/100805741}
153:  eprint = {1310.4375},
167:  eprint = {2006.02575},
180:  doi = {10.1137/21M1390062},
181:  eprint = {2101.01100},
194:  doi = {10.1137/17M1140431},
195:  eprint = {1708.01955},
208:  doi = {10.1609/aaai.v34i04.6120},
209:  eprint = {1911.08530},
223:  eprint = {2102.06555},
234:  doi = {10.52202/068431-0857},
235:  eprint = {2205.15733},
249:  eprint = {2202.03813},
259:  eprint = {2006.12065},
272:  doi = {10.1093/imaiai/iaac023},
273:  eprint = {2008.09165},
282:  eprint = {2510.22033},
295:  doi = {10.1007/978-3-319-19992-4_20},
296:  eprint = {1503.08596},
308:  doi = {10.1007/978-3-030-20351-1_18}
318:  doi = {10.52202/068431-1584},
319:  eprint = {2206.09398},
331:  doi = {10.1016/j.neuroimage.2021.118683}
342:  doi = {10.1007/978-3-319-19992-4_32}
354:  doi = {10.1073/pnas.1917405117}
365:  doi = {10.3389/fonc.2025.1700447}
373:  eprint = {2605.20883},
386:  doi = {10.1016/j.compmedimag.2022.102129}
395:  doi = {10.64898/2026.05.21.726781},
406:  doi = {10.1109/ICCV.2017.29}
418:  doi = {10.1007/978-3-030-00931-1_53}
```
Exit status: 0

### cuturi2013sinkhorn
Command: python3 lookup resolve '1306.0895'
```
Crossref: not found
OpenAlex: ratio 1.00: Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances | Marco Cuturi | 2013 | arXiv (Cornell University) | doi 10.48550/arxiv.1306.0895 | arXiv 1306.0895 | OpenAlex W1511358834 | open access https://arxiv.org/pdf/1306.0895
Semantic Scholar: ratio 0.89: Sinkhorn Distances: Lightspeed Computation of Optimal Transport | Marco Cuturi | 2013 | Neural Information Processing Systems | pages 2292--2300 | arXiv 1306.0895 | Semantic Scholar 0080118b0eb02af581ff32b85a1bb6aed7081f45
arXiv: ratio 1.00: Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances | Marco Cuturi | 2013 | arXiv 1306.0895
```
Exit status: 0

### peyre2019computational
Command: python3 lookup resolve '10.1561/2200000073'
```
Crossref: ratio 1.00: Computational Optimal Transport with Applications to Data Sciences | Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2019 | Foundations and Trends<registered sign> in Machine Learning | vol 11 | no 5-6 | pages 355--607 | doi 10.1561/2200000073
OpenAlex: ratio 1.00: Computational Optimal Transport with Applications to Data Sciences | Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2019 | Foundations and Trends<registered sign> in Machine Learning | vol 11 | no 5-6 | pages 355--607 | doi 10.1561/2200000073 | OpenAlex W3039256091
Semantic Scholar: DOI_MISMATCH, ratio 0.64: Computational Optimal Transport | G. Peyr<latin small letter e with acute>, Marco Cuturi | 2018 | Found. Trends Mach. Learn. | vol 11 | pages 355--607 | doi 10.1561/2200000073 | arXiv 1803.00567 | Semantic Scholar 8e51d68250db5637cd6bc1de98a99396441399b2 | open access https://arxiv.org/pdf/1803.00567
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### genevay2019sample
Command: python3 lookup resolve '1810.02733'
```
Crossref: not found
OpenAlex: ratio 1.00: Sample Complexity of Sinkhorn divergences | Aude Genevay, L<latin small letter e with acute>na<latin small letter i with diaeresis>c Chizat, Francis Bach, Marco Cuturi, Gabriel Peyr<latin small letter e with acute> | 2018 | arXiv (Cornell University) | doi 10.48550/arxiv.1810.02733 | arXiv 1810.02733 | OpenAlex W2895248218 | open access https://arxiv.org/pdf/1810.02733
Semantic Scholar: ratio 1.00: Sample Complexity of Sinkhorn Divergences | A. Genevay, L<latin small letter e with acute>na<latin small letter i with diaeresis>c Chizat, F. Bach, Marco Cuturi, G. Peyr<latin small letter e with acute> | 2018 | International Conference on Artificial Intelligence and Statistics | pages 1574--1583 | arXiv 1810.02733 | Semantic Scholar dd5e54b08b2c1520d179e88cd524e9bd4fe1f6ab
arXiv: ratio 1.00: Sample Complexity of Sinkhorn divergences | Aude Genevay, L<latin small letter e with acute>naic Chizat, Francis Bach, Marco Cuturi, Gabriel Peyr<latin small letter e with acute> | 2018 | arXiv 1810.02733
```
Exit status: 0

### benamou2015iterative
Command: python3 lookup resolve '10.1137/141000439'
```
Crossref: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | Jean-David Benamou, Guillaume Carlier, Marco Cuturi, Luca Nenna, Gabriel Peyr<latin small letter e with acute> | 2015 | SIAM Journal on Scientific Computing | vol 37 | no 2 | pages A1111--A1138 | doi 10.1137/141000439
OpenAlex: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | Jean<hyphen>David Benamou, Guillaume Carlier, Marco Cuturi, Luca Nenna, Gabriel Peyr<latin small letter e with acute> | 2015 | SIAM Journal on Scientific Computing | vol 37 | no 2 | pages A1111--A1138 | doi 10.1137/141000439 | OpenAlex W2036996178 | open access https://arxiv.org/pdf/1412.5154
Semantic Scholar: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | J. Benamou, G. Carlier, Marco Cuturi, Luca Nenna, G. Peyr<latin small letter e with acute> | 2014 | SIAM Journal on Scientific Computing | vol 37 | doi 10.1137/141000439 | arXiv 1412.5154 | Semantic Scholar d3831561301ef27a6ba0d3c68d30bdf0f27eef63 | open access https://arxiv.org/pdf/1412.5154
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### memoli2011gromov
Command: python3 lookup resolve '10.1007/s10208-011-9093-5'
```
Crossref: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | Facundo M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | vol 11 | no 4 | pages 417--487 | doi 10.1007/s10208-011-9093-5
OpenAlex: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | Facundo M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | vol 11 | no 4 | pages 417--487 | doi 10.1007/s10208-011-9093-5 | OpenAlex W2027842533
Semantic Scholar: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | F. M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | vol 11 | pages 417--487 | doi 10.1007/s10208-011-9093-5 | Semantic Scholar 03a4f1c1975237a5e1e501dd26811b4ce55a35a9
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### peyre2016gromov
No DOI and no arXiv ID; url: https://proceedings.mlr.press/v48/peyre16.html. Checked by WebFetch of the url (recorded below by the session).

### vayer2019optimal
Command: python3 lookup resolve '1805.09114'
```
Crossref: not found
OpenAlex: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, La<latin small letter e with diaeresis>titia Chapel, R<latin small letter e with acute>mi Flamary, Romain Tavenard, Nicolas Courty | 2018 | HAL | pages 1--16 | doi 10.48550/arxiv.1805.09114 | arXiv 1805.09114 | OpenAlex W2911397097 | open access http://arxiv.org/pdf/1805.09114
Semantic Scholar: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, L. Chapel, R<latin small letter e with acute>mi Flamary, R. Tavenard, N. Courty | 2018 | International Conference on Machine Learning | pages 6275--6284 | arXiv 1805.09114 | Semantic Scholar 6f9de3cd77ac32ce00da3ba6b71e2360b5b2a81c
arXiv: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, Laetitia Chapel, R<latin small letter e with acute>mi Flamary, Romain Tavenard, Nicolas Courty | 2018 | arXiv 1805.09114
```
Exit status: 0

### sejourne2021unbalanced
Command: python3 lookup resolve '2009.04266'
```
Crossref: not found
OpenAlex: ratio 1.00: The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation | Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois<hyphen>Xavier Vialard, Gabriel Peyr<latin small letter e with acute> | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2009.04266 | arXiv 2009.04266 | OpenAlex W3084165997 | open access https://arxiv.org/pdf/2009.04266
Semantic Scholar: ratio 1.00: The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation | Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, G. Peyr<latin small letter e with acute> | 2020 | Neural Information Processing Systems | pages 8766--8779 | arXiv 2009.04266 | Semantic Scholar a772118cb42eaa6648a435db201cf9b2090b4648
arXiv: ratio 1.00: The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation | Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, Gabriel Peyr<latin small letter e with acute> | 2020 | arXiv 2009.04266
```
Exit status: 0

### scetbon2022linear
Command: python3 lookup resolve '2106.01128'
```
Crossref: not found
OpenAlex: ratio 1.00: Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs | Meyer Scetbon, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2106.01128 | arXiv 2106.01128 | OpenAlex W3169502490 | open access https://arxiv.org/pdf/2106.01128
Semantic Scholar: ratio 1.00: Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs | Meyer Scetbon, G. Peyr<latin small letter e with acute>, Marco Cuturi | 2021 | International Conference on Machine Learning | pages 19347--19365 | doi 10.48550/arXiv.2106.01128 | arXiv 2106.01128 | Semantic Scholar f54fd960e51f27f3484546eb84c481c4c055b882 | open access http://arxiv.org/pdf/2106.01128
arXiv: ratio 1.00: Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs | Meyer Scetbon, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2021 | arXiv 2106.01128
```
Exit status: 0

### rioux2024entropic
Command: python3 lookup resolve '2306.00182'
```
Crossref: not found
OpenAlex: ratio 1.00: Entropic Gromov-Wasserstein Distances: Stability and Algorithms | Gabriel Rioux, Ziv Goldfeld, Kengo Kato | 2023 | arXiv (Cornell University) | doi 10.48550/arxiv.2306.00182 | arXiv 2306.00182 | OpenAlex W4379251962 | open access https://arxiv.org/pdf/2306.00182
Semantic Scholar: ratio 0.79: Entropic Gromov-Wasserstein Distances: Stability, Algorithms, and Distributional Limits | G. Rioux, Ziv Goldfeld, Kengo Kato | 2023 | arXiv 2306.00182 | Semantic Scholar d0026df4c83798d4945781b521db15165aaf4a06
arXiv: ratio 1.00: Entropic Gromov-Wasserstein Distances: Stability and Algorithms | Gabriel Rioux, Ziv Goldfeld, Kengo Kato | 2023 | arXiv 2306.00182
```
Exit status: 0

### agueh2011barycenters
Command: python3 lookup resolve '10.1137/100805741'
```
Crossref: ratio 1.00: Barycenters in the Wasserstein Space | Martial Agueh, Guillaume Carlier | 2011 | SIAM Journal on Mathematical Analysis | vol 43 | no 2 | pages 904--924 | doi 10.1137/100805741
OpenAlex: ratio 1.00: Barycenters in the Wasserstein Space | Martial Agueh, Guillaume Carlier | 2011 | SIAM Journal on Mathematical Analysis | vol 43 | no 2 | pages 904--924 | doi 10.1137/100805741 | OpenAlex W1968333723 | open access https://hal.archives-ouvertes.fr/hal-00637399/document
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cuturi2014fast
Command: python3 lookup resolve '1310.4375'
```
Crossref: not found
OpenAlex: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, Arnaud Doucet | 2013 | Oxford University Research Archive (ORA) (University of Oxford) | pages 685--693 | doi 10.48550/arxiv.1310.4375 | arXiv 1310.4375 | OpenAlex W1629559917 | open access https://ora.ox.ac.uk/objects/uuid:176f66e9-3fef-4847-b638-ace71b630ec5/files/mc3fe93fd63587cb3242319d64cbb87a5
Semantic Scholar: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, A. Doucet | 2013 | International Conference on Machine Learning | pages 685--693 | arXiv 1310.4375 | Semantic Scholar c697fd0b73ec7aaeb2e75cb89cf4b8b020dd9556
arXiv: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, Arnaud Doucet | 2013 | arXiv 1310.4375
```
Exit status: 0

### janati2020debiased
Command: python3 lookup resolve '2006.02575'
```
Crossref: not found
OpenAlex: ratio 1.00: Debiased Sinkhorn barycenters | Hicham Janati, Marco Cuturi, Alexandre Gramfort | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.02575 | arXiv 2006.02575 | OpenAlex W3033657060 | open access https://arxiv.org/pdf/2006.02575
Semantic Scholar: ratio 1.00: Debiased Sinkhorn barycenters | Hicham Janati, Marco Cuturi, Alexandre Gramfort | 2020 | International Conference on Machine Learning | vol abs/2006.02575 | doi 10.48550/arXiv.2006.02575 | arXiv 2006.02575 | Semantic Scholar 5b717940bc8d0010b300b40fe2f1b16fb0b9ec46
arXiv: ratio 1.00: Debiased Sinkhorn barycenters | Hicham Janati, Marco Cuturi, Alexandre Gramfort | 2020 | arXiv 2006.02575
```
Exit status: 0

### altschuler2022wasserstein
Command: python3 lookup resolve '10.1137/21M1390062'
```
Crossref: ratio 1.00: Wasserstein Barycenters Are NP-Hard to Compute | Jason M. Altschuler, Enric Boix-Adser<latin small letter a with grave> | 2022 | SIAM Journal on Mathematics of Data Science | vol 4 | no 1 | pages 179--203 | doi 10.1137/21m1390062
OpenAlex: ratio 1.00: Wasserstein Barycenters Are NP-Hard to Compute | Jason M. Altschuler, Enric Boix-Adser<latin small letter a with grave> | 2022 | SIAM Journal on Mathematics of Data Science | vol 4 | no 1 | pages 179--203 | doi 10.1137/21m1390062 | OpenAlex W3120790515 | open access https://arxiv.org/pdf/2101.01100
Semantic Scholar: ratio 1.00: Wasserstein barycenters are NP-hard to compute | Jason M. Altschuler, Enric Boix-Adser<latin small letter a with grave> | 2021 | SIAM Journal on Mathematics of Data Science | vol abs/2101.01100 | doi 10.1137/21M1390062 | arXiv 2101.01100 | Semantic Scholar 6e2fc220a6921c59f3e99c7cfc3b142b9939502c | open access https://arxiv.org/pdf/2101.01100
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### schmitz2018wasserstein
Command: python3 lookup resolve '10.1137/17M1140431'
```
Crossref: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning | Morgan A. Schmitz, Matthieu Heitz, Nicolas Bonneel, Fred Ngol<latin small letter e with grave>, David Coeurjolly, Marco Cuturi, Gabriel Peyr<latin small letter e with acute>, Jean-Luc Starck | 2018 | SIAM Journal on Imaging Sciences | vol 11 | no 1 | pages 643--678 | doi 10.1137/17m1140431
OpenAlex: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning | Morgan A. Schmitz, Matthieu Heitz, Nicolas Bonneel, Fred Ngol<latin small letter e with grave> Mboula, David C<latin small ligature oe>urjolly, Marco Cuturi, Gabriel Peyr<latin small letter e with acute>, Jean<hyphen>Luc Starck | 2018 | SIAM Journal on Imaging Sciences | vol 11 | no 1 | pages 643--678 | doi 10.1137/17m1140431 | OpenAlex W2744110160 | open access https://arxiv.org/pdf/1708.01955
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xu2020gromov
Command: python3 lookup resolve '10.1609/aaai.v34i04.6120'
```
Crossref: ratio 1.00: Gromov-Wasserstein Factorization Models for Graph Clustering | Hongtengl Xu | 2020 | Proceedings of the AAAI Conference on Artificial Intelligence | vol 34 | no 04 | pages 6478--6485 | doi 10.1609/aaai.v34i04.6120
OpenAlex: ratio 1.00: Gromov-Wasserstein Factorization Models for Graph Clustering | Hongtengl Xu | 2020 | Proceedings of the AAAI Conference on Artificial Intelligence | vol 34 | no 04 | pages 6478--6485 | doi 10.1609/aaai.v34i04.6120 | OpenAlex W2996858319 | open access https://doi.org/10.1609/aaai.v34i04.6120
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### vincentcuaz2021online
Command: python3 lookup resolve '2102.06555'
```
Crossref: not found
OpenAlex: ratio 1.00: Online Graph Dictionary Learning | C<latin small letter e with acute>dric Vincent-Cuaz, Titouan Vayer, R<latin small letter e with acute>mi Flamary, Marco Corneli, Nicolas Courty | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2102.06555 | arXiv 2102.06555 | OpenAlex W3131640093 | open access https://arxiv.org/pdf/2102.06555
Semantic Scholar: ratio 1.00: Online Graph Dictionary Learning | C<latin small letter e with acute>dric Vincent-Cuaz, Titouan Vayer, R<latin small letter e with acute>mi Flamary, M. Corneli, N. Courty | 2021 | International Conference on Machine Learning | vol abs/2102.06555 | doi 10.48550/arXiv.2102.06555 | arXiv 2102.06555 | Semantic Scholar 9e9017a874024e3f7d8ff5a3aff171afb52beccc
arXiv: ratio 1.00: Online Graph Dictionary Learning | C<latin small letter e with acute>dric Vincent-Cuaz, Titouan Vayer, R<latin small letter e with acute>mi Flamary, Marco Corneli, Nicolas Courty | 2021 | arXiv 2102.06555
```
Exit status: 0

### vincentcuaz2022template
Command: python3 lookup resolve '10.52202/068431-0857'
```
Crossref: ratio 1.00: Template Based Graph Neural Network with Optimal Transport Distances | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli, Titouan Vayer, Nicolas Courty | 2022 | Advances in Neural Information Processing Systems 35 | pages 11800--11814 | doi 10.52202/068431-0857
OpenAlex: ratio 1.00: Template Based Graph Neural Network with Optimal Transport Distances | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli, Titouan Vayer, Nicolas Courty | 2022 | neural information processing systems | pages 11800--11814 | doi 10.52202/068431-0857 | OpenAlex W7133234998
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### brogatmotte2022learning
Command: python3 lookup resolve '2202.03813'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters | Luc Brogat-Motte, R<latin small letter e with acute>mi Flamary, C<latin small letter e with acute>line Brouard, Juho Rousu, Florence d<right single quotation mark>Alch<latin small letter e with acute><en dash>Buc | 2022 | arXiv (Cornell University) | vol 162 | doi 10.48550/arxiv.2202.03813 | arXiv 2202.03813 | OpenAlex W4221153250 | open access https://arxiv.org/pdf/2202.03813
Semantic Scholar: ratio 1.00: Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters | Luc Brogat-Motte, R<latin small letter e with acute>mi Flamary, C<latin small letter e with acute>line Brouard, Juho Rousu, Florence d'Alch<latin small letter e with acute>-Buc | 2022 | International Conference on Machine Learning | vol abs/2202.03813 | doi 10.48550/arXiv.2202.03813 | arXiv 2202.03813 | Semantic Scholar 1a9e5a6a4da5f882ef04f8bb936701220a642ec0 | open access https://arxiv.org/pdf/2202.03813
arXiv: ratio 1.00: Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters | Luc Brogat-Motte, R<latin small letter e with acute>mi Flamary, C<latin small letter e with acute>line Brouard, Juho Rousu, Florence d'Alch<latin small letter e with acute>-Buc | 2022 | arXiv 2202.03813
```
Exit status: 0

### mialon2021trainable
Command: python3 lookup resolve '2006.12065'
```
Crossref: not found
OpenAlex: ratio 1.00: A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, Dexiong Chen, Alexandre d<right single quotation mark>Aspremont, Julien Mairal | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.12065 | arXiv 2006.12065 | OpenAlex W3127760629 | open access https://arxiv.org/pdf/2006.12065
Semantic Scholar: ratio 0.89: An Optimal Transport Kernel for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, De-Xiong Chen, A. d'Aspremont, Julien Mairal | 2020 | arXiv.org | vol abs/2006.12065 | doi 10.48550/arXiv.2006.12065 | arXiv 2006.12065 | Semantic Scholar 74bc260a893479cdada738017037c7bde4283d45 | open access http://arxiv.org/pdf/2006.12065
arXiv: ratio 1.00: A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, Dexiong Chen, Alexandre d'Aspremont, Julien Mairal | 2020 | arXiv 2006.12065
```
Exit status: 0

### moosmuller2023linear
Command: python3 lookup resolve '10.1093/imaiai/iaac023'
```
Crossref: ratio 1.00: Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations | Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2022 | Information and Inference: A Journal of the IMA | vol 12 | no 1 | pages 363--389 | doi 10.1093/imaiai/iaac023
OpenAlex: ratio 1.00: Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations | Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2022 | Information and Inference A Journal of the IMA | vol 12 | no 1 | pages 363--389 | doi 10.1093/imaiai/iaac023 | OpenAlex W3165102544 | open access https://arxiv.org/pdf/2008.09165
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wang2025linearized
Command: python3 lookup resolve '2510.22033'
```
Crossref: not found
OpenAlex: ratio 1.00: Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | Wang, Tianxiang, Ke, Yingtong, Dhananjay Bhaskar, Krishnaswamy, Smita, Alexander Cloninger | 2025 | arXiv (Cornell University) | doi 10.48550/arxiv.2510.22033 | arXiv 2510.22033 | OpenAlex W7101579638 | open access https://arxiv.org/pdf/2510.22033
Semantic Scholar: ratio 1.00: Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | Tian-Xiang Wang, Yingtong Ke, Dhananjay Bhaskar, Smita Krishnaswamy, Alexander Cloninger | 2025 | arXiv.org | vol abs/2510.22033 | doi 10.48550/arXiv.2510.22033 | arXiv 2510.22033 | Semantic Scholar e0e8e29e4579991ec2c07a8baf7624de32135e77
arXiv: ratio 1.00: Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | Tianxiang Wang, Yingtong Ke, Dhananjay Bhaskar, Smita Krishnaswamy, Alexander Cloninger | 2025 | arXiv 2510.22033
```
Exit status: 0

### gramfort2015fast
Command: python3 lookup resolve '10.1007/978-3-319-19992-4_20'
```
Crossref: ratio 1.00: Fast Optimal Transport Averaging of Neuroimaging Data | A. Gramfort, G. Peyr<latin small letter e with acute>, M. Cuturi | 2015 | Lecture Notes in Computer Science | pages 261--272 | doi 10.1007/978-3-319-19992-4_20
OpenAlex: ratio 1.00: Fast Optimal Transport Averaging of Neuroimaging Data | Alexandre Gramfort, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2015 | Lecture notes in computer science | vol 24 | pages 261--272 | doi 10.1007/978-3-319-19992-4_20 | OpenAlex W2111725927 | open access https://arxiv.org/pdf/1503.08596
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bazeille2019local
Command: python3 lookup resolve '10.1007/978-3-030-20351-1_18'
```
Crossref: ratio 1.00: Local Optimal Transport for Functional Brain Template Estimation | T. Bazeille, H. Richard, H. Janati, B. Thirion | 2019 | Lecture Notes in Computer Science | pages 237--248 | doi 10.1007/978-3-030-20351-1_18
OpenAlex: ratio 1.00: Local Optimal Transport for Functional Brain Template Estimation | Thomas Bazeille, H. Richard, Hicham Janati, Bertrand Thirion | 2019 | Lecture notes in computer science | pages 237--248 | doi 10.1007/978-3-030-20351-1_18 | OpenAlex W2946207497 | open access https://hal.archives-ouvertes.fr/hal-02278663/file/Local_optimal_transport_for_functional_brain_template_estimation.pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### thual2022aligning
Command: python3 lookup resolve '10.52202/068431-1584'
```
Crossref: ratio 1.00: Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein | Alexis Thual, Quang Huy Tran, Tatiana Zemskova, Nicolas Courty, R<latin small letter e with acute>mi Flamary, Stanislas Dehaene, Bertrand Thirion | 2022 | Advances in Neural Information Processing Systems 35 | pages 21792--21804 | doi 10.52202/068431-1584
OpenAlex: ratio 1.00: Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein | Alexis Thual, Quang Huy Tran, Tatiana Zemskova, Nicolas Courty, R<latin small letter e with acute>mi Flamary, Stanislas Dehaene, Bertrand Thirion | 2022 | neural information processing systems | pages 21792--21804 | doi 10.52202/068431-1584 | OpenAlex W7133227349
Semantic Scholar: ratio 1.00: Aligning individual brains with fused unbalanced Gromov Wasserstein | Alexis Thual, Quang-Huy Tran, <cyrillic capital letter te>. <cyrillic capital letter pe>. <cyrillic capital letter ze><cyrillic small letter ie><cyrillic small letter em><cyrillic small letter es><cyrillic small letter ka><cyrillic small letter o><cyrillic small letter ve><cyrillic small letter a>, N. Courty, R<latin small letter e with acute>mi Flamary, S. Dehaene, B. Thirion | 2022 | Neural Information Processing Systems | doi 10.52202/068431-1584 | arXiv 2206.09398 | Semantic Scholar d67dcbf457ce55336f5c6c5c4c996ca3fda0d477
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bazeille2021empirical
Command: python3 lookup resolve '10.1016/j.neuroimage.2021.118683'
```
Crossref: ratio 1.00: An empirical evaluation of functional alignment using inter-subject decoding | Thomas Bazeille, Elizabeth DuPre, Hugo Richard, Jean-Baptiste Poline, Bertrand Thirion | 2021 | NeuroImage | vol 245 | pages 118683 | doi 10.1016/j.neuroimage.2021.118683
OpenAlex: ratio 1.00: An empirical evaluation of functional alignment using inter-subject decoding | Thomas Bazeille, Elizabeth DuPr<latin small letter e with acute>, Hugo Richard, Jean<hyphen>Baptiste Poline, Bertrand Thirion | 2021 | NeuroImage | vol 245 | pages 118683--118683 | doi 10.1016/j.neuroimage.2021.118683 | OpenAlex W3208323570 | open access https://www.sciencedirect.com/science/article/pii/S1053811921009563/pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### su2015shape
Command: python3 lookup resolve '10.1007/978-3-319-19992-4_32'
```
Crossref: ratio 1.00: Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis | Zhengyu Su, Wei Zeng, Yalin Wang, Zhong-Lin Lu, Xianfeng Gu | 2015 | Lecture Notes in Computer Science | pages 411--423 | doi 10.1007/978-3-319-19992-4_32
OpenAlex: ratio 1.00: Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis | Zhengyu Su, Wei Zeng, Yalin Wang, Zhong<hyphen>Lin Lu, Xianfeng David Gu | 2015 | Lecture notes in computer science | vol 24 | pages 411--423 | doi 10.1007/978-3-319-19992-4_32 | OpenAlex W1919720529 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4527322
Semantic Scholar: ratio 1.00: Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis | Zhengyu Su, W. Zeng, Y. Wang, Zhong-Lin Lu, X. Gu | 2015 | Information Processing in Medical Imaging | vol 24 | pages 411--423 | doi 10.1007/978-3-319-19992-4_32 | Semantic Scholar b2ef0bf744cddba8fa7008fbc7818f845966cca7 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4527322
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kundu2020enabling
Command: python3 lookup resolve '10.1073/pnas.1917405117'
```
Crossref: ratio 1.00: Enabling early detection of osteoarthritis from presymptomatic cartilage texture maps via transport-based learning | Shinjini Kundu, Beth G. Ashinsky, Mustapha Bouhrara, Erik B. Dam, Shadpour Demehri, Mohammad Shifat-E-Rabbi, Richard G. Spencer, Kenneth L. Urish, Gustavo K. Rohde | 2020 | Proceedings of the National Academy of Sciences | vol 117 | no 40 | pages 24709--24719 | doi 10.1073/pnas.1917405117
OpenAlex: ratio 1.00: Enabling early detection of osteoarthritis from presymptomatic cartilage texture maps via transport-based learning | Shinjini Kundu, Beth G. Ashinsky, Mustapha Bouhrara, Erik B. Dam, Shadpour Demehri, Mohammad Shifat<hyphen>E<hyphen>Rabbi, Richard G. S. Spencer, Kenneth L. Urish, Gustavo Kunde Rohde | 2020 | Proceedings of the National Academy of Sciences | vol 117 | no 40 | pages 24709--24719 | doi 10.1073/pnas.1917405117 | OpenAlex W3087326040 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7547154/
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gong2026robust
Command: python3 lookup resolve '10.3389/fonc.2025.1700447'
```
Crossref: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Hanying Gong, Jie Luo, Shufan Mao, Yanchen Gong, Yu Lu, Jian Ding, Xiang Zhu | 2026 | Frontiers in Oncology | vol 15 | doi 10.3389/fonc.2025.1700447
OpenAlex: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Hanying Gong, Jun Luo, Shufan Mao, Yanchen Gong, Yu Lu, Jian Ding, Xiang Zhu | 2026 | Frontiers in Oncology | vol 15 | pages 1700447--1700447 | doi 10.3389/fonc.2025.1700447 | OpenAlex W7126042104 | open access https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1700447/pdf
Semantic Scholar: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Han-Ying Gong, Jie Luo, Shufan Mao, Yanan Gong, Yu Lu, Jian Ding, Xiang Zhu | 2026 | Frontiers in Oncology | vol 15 | doi 10.3389/fonc.2025.1700447 | Semantic Scholar 6a61c6836e5159c5e80d457fa948bd2ab017feb3 | open access https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1700447/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### mazelet2026learning
Command: python3 lookup resolve '2605.20883'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2605.20883 | arXiv 2605.20883 | OpenAlex W7161973664 | open access https://arxiv.org/pdf/2605.20883
Semantic Scholar: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv.org | vol abs/2605.20883 | doi 10.48550/arXiv.2605.20883 | arXiv 2605.20883 | Semantic Scholar 932daed15a6e652d64deee16cde7602386c7e063
arXiv: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv 2605.20883
```
Exit status: 0

### belkhatir2022wasserstein
Command: python3 lookup resolve '10.1016/j.compmedimag.2022.102129'
```
Crossref: ratio 1.00: Wasserstein-based texture analysis in radiomic studies | Zehor Belkhatir, Ra<latin small letter u with acute>l San Jos<latin small letter e with acute> Est<latin small letter e with acute>par, Allen R. Tannenbaum | 2022 | Computerized Medical Imaging and Graphics | vol 102 | pages 102129 | doi 10.1016/j.compmedimag.2022.102129
OpenAlex: ratio 1.00: Wasserstein-based texture analysis in radiomic studies | Zehor Belkhatir, Ra<latin small letter u with acute>l San Jo<latin small letter s with acute>e Est<latin small letter e with acute>par, Allen Tannenbaum | 2022 | Computerized Medical Imaging and Graphics | vol 102 | pages 102129--102129 | doi 10.1016/j.compmedimag.2022.102129 | OpenAlex W4306767793 | open access https://www.sciencedirect.com/science/article/pii/S0895611122000994/pdf
Semantic Scholar: ratio 1.00: Wasserstein-based texture analysis in radiomic studies | Z. Belkhatir, Ra<latin small letter u with acute>l San Jos<latin small letter e with acute> Est<latin small letter e with acute>par, A. Tannenbaum | 2022 | Comput. Medical Imaging Graph. | vol 102 | pages 102129 | doi 10.1016/j.compmedimag.2022.102129 | Semantic Scholar 6371fe7d39af4b20ccc6e76fad7448a7ebded86d | open access https://www.sciencedirect.com/science/article/pii/S0895611122000994/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### barbarant2026functional
Command: python3 lookup resolve '10.64898/2026.05.21.726781'
```
Crossref: ratio 1.00: Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders | Pierre-Louis Barbarant, Florent Meyniel, Bertrand Thirion | 2026 | doi 10.64898/2026.05.21.726781
OpenAlex: ratio 1.00: Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders | Pierre-Louis Barbarant, Florent Meyniel, Bertrand Thirion | 2026 | bioRxiv (Cold Spring Harbor Laboratory) | doi 10.64898/2026.05.21.726781 | OpenAlex W7162393221 | open access https://doi.org/10.64898/2026.05.21.726781
Semantic Scholar: ratio 1.00: Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders | Pierre-Louis Barbarant, F. Meyniel, Bertrand Thirion | 2026 | bioRxiv | doi 10.64898/2026.05.21.726781 | Semantic Scholar a7be9d88b1f97a6f7b7df169d4a269bde4ff7811 | open access https://doi.org/10.64898/2026.05.21.726781
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### mi2017optimal
Command: python3 lookup resolve '10.1109/ICCV.2017.29'
```
Crossref: ratio 1.00: An Optimal Transportation Based Univariate Neuroimaging Index | Liang Mi, Wen Zhang, Junwei Zhang, Yonghui Fan, Dhruman Goradia, Kewei Chen, Eric M. Reiman, Xianfeng Gu, Yalin Wang | 2017 | 2017 IEEE International Conference on Computer Vision (ICCV) | pages 182--191 | doi 10.1109/iccv.2017.29
OpenAlex: ratio 1.00: An Optimal Transportation Based Univariate Neuroimaging Index | Liang Mi, Wen Zhang, Junwei Zhang, Yonghui Fan, Dhruman D. Goradia, Kewei Chen, Eric M. Reiman, Xianfeng David Gu, Yalin Wang | 2017 | IEEE/CVF International Conference on Computer Vision (ICCV) | vol 2017 | pages 182--191 | doi 10.1109/iccv.2017.29 | OpenAlex W2779794151 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/5719504
Semantic Scholar: ratio 1.00: An Optimal Transportation based Univariate Neuroimaging Index | Liang Mi, Wen Zhang, Junwei Zhang, Yonghui Fan, Dhruman D. Goradia, K. Chen, E. Reiman, X. Gu, Y. Wang | 2017 | IEEE International Conference on Computer Vision | vol 2017 | pages 182--191 | doi 10.1109/ICCV.2017.29 | Semantic Scholar e2b05f3cf4b2238175eaef2ef464c360ee9bbbba | open access https://www.ncbi.nlm.nih.gov/pmc/articles/5719504
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gerber2018exploratory
Command: python3 lookup resolve '10.1007/978-3-030-00931-1_53'
```
Crossref: ratio 1.00: Exploratory Population Analysis with Unbalanced Optimal Transport | Samuel Gerber, Marc Niethammer, Martin Styner, Stephen Aylward | 2018 | Lecture Notes in Computer Science | pages 464--472 | doi 10.1007/978-3-030-00931-1_53
OpenAlex: ratio 1.00: Exploratory Population Analysis with Unbalanced Optimal Transport | Samuel Gerber, Marc Niethammer, Martin Andreas Styner, Stephen Aylward | 2018 | Lecture notes in computer science | vol 11072 | pages 464--472 | doi 10.1007/978-3-030-00931-1_53 | OpenAlex W2891515476 | open access https://link.springer.com/content/pdf/10.1007/978-3-030-00931-1_53.pdf
Semantic Scholar: ratio 1.00: Exploratory Population Analysis with Unbalanced Optimal Transport | Samuel Gerber, M. Niethammer, M. Styner, S. Aylward | 2018 | International Conference on Medical Image Computing and Computer-Assisted Intervention | vol 11072 | pages 464--472 | doi 10.1007/978-3-030-00931-1_53 | Semantic Scholar c6a3d4e4b42d25e1a3008b5f8c7e439b404b886a | open access https://link.springer.com/content/pdf/10.1007/978-3-030-00931-1_53.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### peyre2016gromov (url check)
Check: WebFetch of `https://proceedings.mlr.press/v48/peyre16.html` (HTTP 200, text/html).
What the page showed: the title "Gromov-Wasserstein Averaging of Kernel and Distance Matrices", the authors "Gabriel Peyre, Marco Cuturi, Justin Solomon", and "Proceedings of The 33rd International Conference on Machine Learning, PMLR 48:2664-2672, 2016."
Result: the page names the entry's title; the check passes.

### Theme run 2 summary
34 entries checked: 33 by `the lookup script resolve` (exit 0 each; every one has at least one index record that matches it), 1 by its url (passes). Titles that an index prints differently from the entry, for the merge run to resolve: peyre2019computational (Semantic Scholar "Computational Optimal Transport", ratio 0.64), rioux2024entropic (Semantic Scholar ratio 0.79), cuturi2013sinkhorn and mialon2021trainable (Semantic Scholar ratio 0.89). No identifier provably fails.

### Titles printed differently from their entries, all theme runs
- theme 1: kiers1999parafac2 (OpenAlex ratio 0.99).
- theme 2: as listed above.
- theme 3: lee2019set (Semantic Scholar "Set Transformer", ratio 0.31).

## Literature review item 4: checks of review.md and refs.bib (2026-11-20 01:31)

Command: grep -c '^@' refs.bib
```
288
```
Exit status: 0

Command: LC_ALL=C grep -n '[^ -~]' refs.bib
```
```
Exit status: 1

Command: duplicate DOI or eprint check
```
```
Exit status: 0

Note: the instructions literature review item 4 prints the program <titles> with the field $0 written as the mode name; the session ran it with $0, the whole input line, which is the program's evident meaning.

Command: awk -f titles.awk refs.bib | wc -l
```
     288
```

Command: awk -f titles.awk refs.bib | sed 's/^[^=]*=//' | tr 'A-Z' 'a-z' | tr -cd 'a-z0-9
' | sort | uniq -d
```
```
Exit status: 0

Command: comm -3 of the keys review.md cites and the keys of refs.bib
```
```
Exit status: 0

Command: keys of refs.bib that are not plain identifiers
```
```
Exit status: 0

## Identifier check: merged refs.bib (literature review item 4) (refs.bib), 2026-11-20 01:32

Command: grep -n -i -E '^[[:space:]]*(doi|eprint)[[:space:]]*=' 'refs.bib'
```
10:  doi = {10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c}
24:  doi = {10.1109/tpami.2012.254}
37:  doi = {10.1093/biomet/asaf082},
38:  eprint = {2310.09428},
53:  doi = {10.1080/01621459.2013.776499},
54:  eprint = {1203.3209},
69:  doi = {10.1007/s12561-018-9215-6},
70:  eprint = {1304.5637},
85:  doi = {10.1214/23-aoas1830}
98:  doi = {10.1007/s11222-026-10892-y},
99:  eprint = {2505.12113},
114:  doi = {10.1137/07070111x}
141:  doi = {10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b}
155:  doi = {10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y}
169:  doi = {10.1137/24m1692836},
170:  eprint = {2410.14046},
185:  doi = {10.1109/tmi.2019.2936046}
198:  doi = {10.3389/fnins.2022.861402}
211:  doi = {10.1016/j.chemolab.2021.104446}
226:  eprint = {2208.00993},
237:  eprint = {2609.23705},
252:  doi = {10.1016/j.neuroimage.2008.05.062}
265:  doi = {10.1080/01621459.2019.1585254},
266:  eprint = {1903.08871},
280:  doi = {10.1109/tbme.2018.2816519}
290:  doi = {10.64898/2026.11.12.766278}
302:  doi = {10.1007/bf02296963}
313:  eprint = {1306.0895},
326:  doi = {10.1561/2200000073},
327:  eprint = {1803.00567},
341:  eprint = {1810.02733},
354:  doi = {10.1137/141000439},
355:  eprint = {1412.5154},
368:  doi = {10.1007/s10208-011-9093-5}
393:  eprint = {1805.09114},
405:  eprint = {2009.04266},
419:  eprint = {2106.01128},
432:  eprint = {2306.00182},
445:  doi = {10.1137/100805741}
458:  eprint = {1310.4375},
472:  eprint = {2006.02575},
485:  doi = {10.1137/21M1390062},
486:  eprint = {2101.01100},
499:  doi = {10.1137/17M1140431},
500:  eprint = {1708.01955},
513:  doi = {10.1609/aaai.v34i04.6120},
514:  eprint = {1911.08530},
528:  eprint = {2102.06555},
539:  doi = {10.52202/068431-0857},
540:  eprint = {2205.15733},
554:  eprint = {2202.03813},
564:  eprint = {2006.12065},
577:  doi = {10.1093/imaiai/iaac023},
578:  eprint = {2008.09165},
587:  eprint = {2510.22033},
600:  doi = {10.1007/978-3-319-19992-4_20},
601:  eprint = {1503.08596},
613:  doi = {10.1007/978-3-030-20351-1_18}
623:  doi = {10.52202/068431-1584},
624:  eprint = {2206.09398},
636:  doi = {10.1016/j.neuroimage.2021.118683}
647:  doi = {10.1007/978-3-319-19992-4_32}
659:  doi = {10.1073/pnas.1917405117}
670:  doi = {10.3389/fonc.2025.1700447}
678:  eprint = {2605.20883},
691:  doi = {10.1016/j.compmedimag.2022.102129}
700:  doi = {10.64898/2026.05.21.726781},
711:  doi = {10.1109/ICCV.2017.29}
723:  doi = {10.1007/978-3-030-00931-1_53}
733:  eprint = {1703.06114},
747:  eprint = {1810.00825},
757:  eprint = {1811.01900},
768:  doi = {10.52202/075280-1845},
769:  eprint = {2306.06529},
781:  eprint = {2307.04001},
792:  doi = {10.1109/CVPR.2017.16},
793:  eprint = {1612.00593},
804:  eprint = {1706.02413},
817:  doi = {10.1145/3326362},
818:  eprint = {1801.07829},
829:  doi = {10.1109/ICCV48922.2021.01595}
842:  eprint = {1802.04712},
855:  doi = {10.1561/2200000060},
856:  eprint = {1605.09522},
869:  eprint = {1411.2066},
882:  doi = {10.1038/s41591-019-0508-1}
894:  doi = {10.1038/s41551-020-00682-w},
895:  eprint = {2004.09666},
907:  doi = {10.1016/j.media.2020.101852},
920:  doi = {10.1038/s41598-022-12533-6}
931:  doi = {10.1007/978-3-030-87240-3_72},
932:  eprint = {2012.06875},
945:  doi = {10.1109/TNNLS.2019.2892409},
946:  eprint = {1711.08324},
961:  eprint = {1901.09006},
973:  doi = {10.52202/075280-0596},
974:  eprint = {2310.17867},
986:  eprint = {2406.06984},
997:  doi = {10.1109/ICCV48922.2021.01591}
1008:  doi = {10.1088/1361-6560/ae7955},
1021:  eprint = {2604.26807},
1034:  doi = {10.1016/j.media.2007.06.004}
1046:  doi = {10.1016/j.neuroimage.2004.07.068}
1058:  doi = {10.1109/TMI.2019.2897538}
1068:  eprint = {1908.02738},
1079:  doi = {10.1109/CVPR52734.2025.02878}
1091:  doi = {10.1006/nimg.2000.0582}
1103:  doi = {10.1038/nn1050}
1115:  doi = {10.1109/TMI.2012.2236651}
1127:  doi = {10.1016/j.ejca.2011.11.036}
1139:  doi = {10.1038/ncomms5006}
1151:  doi = {10.1158/0008-5472.CAN-17-0339}
1163:  doi = {10.1148/radiol.2020191145}
1175:  doi = {10.1007/s00330-020-06957-9}
1187:  doi = {10.1109/TMI.2014.2377694}
1199:  doi = {10.1038/s41592-020-01008-z}
1211:  doi = {10.1038/s41598-018-31911-7}
1222:  doi = {10.1016/j.compbiomed.2025.110919}
1234:  doi = {10.1016/j.neuroimage.2008.12.037}
1245:  doi = {10.1016/j.compbiomed.2024.108320}
1257:  doi = {10.1080/0284186X.2018.1445283}
1269:  doi = {10.1038/s41598-022-20703-9}
1281:  doi = {10.1117/1.JMI.12.5.054501}
1292:  doi = {10.1016/j.neuroimage.2017.07.059},
1293:  eprint = {1612.02572},
1306:  doi = {10.1371/journal.pmed.1002711}
1318:  doi = {10.3390/cancers16142538},
1319:  eprint = {2405.01756},
1331:  doi = {10.1007/978-3-031-43993-3_40},
1332:  eprint = {2307.09000},
1343:  doi = {10.1145/3368555.3384464}
1353:  doi = {10.1145/3394486.3403213}
1365:  doi = {10.1214/23-aoas1858}
1377:  doi = {10.1038/s41598-023-46747-z}
1386:  eprint = {2611.03608},
1395:  eprint = {1810.08278},
1408:  doi = {10.1007/s11263-012-0566-z},
1418:  eprint = {2006.09430},
1427:  eprint = {1906.01277},
1440:  doi = {10.1109/tpami.2024.3409772}
1451:  doi = {10.1016/j.neuroimage.2017.11.006},
1452:  eprint = {1705.04919},
1467:  doi = {10.1126/sciadv.adl5307}
1478:  doi = {10.1016/j.media.2023.102864},
1489:  eprint = {2401.01460},
1500:  doi = {10.52202/079017-4374},
1501:  eprint = {2408.11370},
1513:  doi = {10.1016/j.media.2025.103538},
1524:  eprint = {2303.05978},
1536:  doi = {10.1016/j.patcog.2023.109351},
1537:  eprint = {2203.04711},
1550:  doi = {10.1080/01621459.2021.1956937}
1561:  doi = {10.1007/978-3-030-32248-9_71},
1562:  eprint = {2107.02010},
1573:  doi = {10.1109/cvpr.2016.546}
1582:  doi = {10.1038/s41746-026-03323-9}
1592:  doi = {10.1109/tcds.2026.3722535}
1604:  doi = {10.1109/tpami.2015.2408346}
1616:  doi = {10.1145/2897824.2925903}
1636:  doi = {10.1002/cyto.a.24918}
1646:  doi = {10.52202/079017-1948}
1654:  eprint = {2106.00908},
1666:  doi = {10.34133/bmef.0276}
1674:  eprint = {2107.01959},
1685:  doi = {10.1109/ijcnn69854.2026.11729839}
1693:  eprint = {2208.12401},
1702:  eprint = {1511.06391},
1711:  eprint = {1901.06082},
1728:  eprint = {2405.16519},
1737:  eprint = {2110.03336},
1746:  eprint = {2206.11925},
1755:  eprint = {1904.01962},
1764:  eprint = {2306.05553},
1775:  doi = {10.1109/iccv.2019.00443}
1786:  doi = {10.1016/j.media.2023.102813}
1797:  doi = {10.1016/j.media.2020.101789},
1798:  eprint = {2009.11169},
1809:  eprint = {1705.04293},
1819:  doi = {10.1101/2021.04.13.439702}
1828:  eprint = {2610.41328},
1840:  doi = {10.1007/978-3-030-87237-3_33},
1841:  eprint = {2107.13048},
1851:  eprint = {2608.15970},
1863:  doi = {10.1109/access.2026.3751717}
1873:  doi = {10.1109/isbi45749.2020.9098722}
1885:  doi = {10.1002/mp.15539}
1897:  doi = {10.1109/tmi.2020.2996256}
1907:  doi = {10.1109/bibm49941.2020.9313417}
1918:  doi = {10.1007/978-3-030-87234-2_74},
1919:  eprint = {2107.07805},
1931:  doi = {10.1016/j.compbiomed.2022.106168},
1944:  doi = {10.1016/j.cmpb.2023.107872},
1958:  doi = {10.34067/kid.0000000668}
1968:  doi = {10.1109/icip51287.2024.10647287}
1980:  doi = {10.1007/s00330-026-12601-9}
1992:  doi = {10.1016/j.ynirp.2026.100418}
2003:  doi = {10.1016/j.media.2024.103120},
2017:  doi = {10.1136/neurintsurg-2022-018655}
2028:  doi = {10.3389/fphys.2021.644349}
2039:  doi = {10.1016/j.compbiomed.2025.110965}
2051:  doi = {10.1007/s11548-025-03527-6},
2065:  doi = {10.1109/jbhi.2024.3495035}
2076:  doi = {10.1016/j.compmedimag.2025.102587}
2086:  doi = {10.1109/embc40787.2023.10340878}
2098:  doi = {10.1016/j.cels.2025.101229}
2109:  doi = {10.1016/j.compmedimag.2021.101939},
2123:  doi = {10.1038/s41598-022-22313-x}
2132:  doi = {10.1109/isbi48211.2021.9433948},
2133:  eprint = {2104.10047},
2145:  doi = {10.1007/978-3-030-60365-6_17},
2146:  eprint = {2008.06098},
2158:  doi = {10.1016/j.compbiomed.2024.109192}
2167:  doi = {10.64898/2026.11.12.766227}
2178:  doi = {10.1016/j.media.2019.01.001},
2192:  doi = {10.1109/tmi.2022.3213983}
2203:  doi = {10.1016/j.media.2026.104175},
2217:  doi = {10.1109/tmi.2014.2330355}
2228:  doi = {10.1162/imag.a.1048}
2240:  doi = {10.1002/hbm.22297}
2251:  doi = {10.3389/fnimg.2022.977491}
2263:  doi = {10.1038/s41598-026-63646-1}
2275:  doi = {10.1109/tpami.2025.3609521}
2286:  doi = {10.1016/j.media.2022.102383}
2298:  doi = {10.1109/tmi.2025.3605194}
2309:  doi = {10.1162/imag_a_00197}
2320:  doi = {10.1007/978-3-031-43993-3_25},
2321:  eprint = {2303.12148},
2333:  doi = {10.3389/fnimg.2025.1573816}
2345:  doi = {10.1148/radiol.231319}
2357:  doi = {10.1088/2057-1976/ac8e6f}
2368:  doi = {10.1016/j.nicl.2016.11.020}
2380:  doi = {10.1007/s00234-025-03834-4},
2393:  doi = {10.1007/978-3-031-72114-4_47},
2394:  eprint = {2404.09556},
2406:  doi = {10.1007/978-3-031-43901-8_17},
2407:  eprint = {2412.07156},
2420:  doi = {10.1593/tlo.13844}
2432:  doi = {10.1038/s41598-018-36938-4}
2444:  doi = {10.1038/s41598-020-69534-6}
2456:  doi = {10.1038/s41598-020-70940-z}
2468:  doi = {10.3390/diagnostics12020247}
2480:  doi = {10.3390/jcm11247334}
2491:  doi = {10.1016/j.ejrad.2020.109031},
2505:  doi = {10.1038/s41598-022-16520-9}
2517:  doi = {10.3390/diagnostics13243640}
2528:  doi = {10.1016/j.phro.2023.100530}
2540:  doi = {10.1038/s41598-024-58551-4}
2552:  doi = {10.3109/0284186x.2013.812798}
2564:  doi = {10.18383/j.tom.2016.00235}
2576:  doi = {10.1371/journal.pone.0102107}
2588:  doi = {10.1002/mp.13624}
2600:  doi = {10.1002/mp.12925}
2612:  doi = {10.21037/qims.2019.03.02}
2621:  doi = {10.1088/1361-6560/aebf1b}
2633:  doi = {10.1148/radiol.231442}
2644:  doi = {10.1016/j.neuroimage.2022.118871}
2655:  doi = {10.1200/cci.21.00096}
2667:  doi = {10.2967/jnumed.123.267048}
2679:  doi = {10.3390/biotech14040087}
2691:  doi = {10.1158/2767-9764.crc-22-0152}
2702:  doi = {10.1007/978-3-031-43895-0_50},
2703:  eprint = {2307.11017},
2715:  doi = {10.1007/978-3-031-43907-0_47},
2726:  eprint = {2609.09424},
2738:  doi = {10.1016/j.neuroimage.2020.116703}
2749:  doi = {10.1007/978-3-032-05182-0_43},
2750:  eprint = {2506.20741},
2763:  doi = {10.1007/s10851-025-01261-x}
2775:  doi = {10.1109/tpami.2023.3314661},
2776:  eprint = {2212.06339},
2789:  doi = {10.1002/cyto.a.22602}
2801:  doi = {10.4103/jpi.jpi_84_16}
2813:  doi = {10.1117/1.jmi.13.1.014507}
2825:  doi = {10.3390/diagnostics16213632}
2835:  doi = {10.1109/embc46164.2021.9631044}
2845:  doi = {10.1109/embc.2019.8856372}
2857:  doi = {10.1007/s12021-020-09459-7},
2871:  doi = {10.1007/s00415-026-13664-w},
2884:  doi = {10.1007/978-3-642-38868-2_15},
2885:  eprint = {1303.7390},
2899:  doi = {10.1007/978-3-319-59050-9_3},
2912:  doi = {10.1007/978-3-319-59050-9_2},
2913:  eprint = {1703.01232},
2925:  doi = {10.1007/978-3-030-78191-0_13},
2926:  eprint = {2104.00637},
2940:  doi = {10.1007/978-3-031-34048-2_24},
2941:  eprint = {2302.03830},
2955:  doi = {10.1007/978-3-031-96625-5_5},
2956:  eprint = {2503.05031},
2970:  doi = {10.1016/j.patcog.2017.08.026},
2971:  eprint = {1610.02501},
2984:  doi = {10.1073/pnas.1319779111}
3000:  eprint = {1202.6504},
3012:  doi = {10.1016/j.radonc.2018.10.027}
3024:  doi = {10.1109/tmi.2011.2163944}
3032:  eprint = {1906.02795},
3045:  doi = {10.1109/jbhi.2017.2652449}
3054:  eprint = {2006.04804},
3065:  doi = {10.1109/cvpr.2016.568}
3076:  doi = {10.1073/pnas.1408792111}
3088:  doi = {10.1016/j.neuroimage.2011.01.050},
3102:  doi = {10.1016/j.neuroimage.2010.06.013},
3115:  doi = {10.1016/j.neucom.2020.08.030}
3125:  doi = {10.1109/cvpr52733.2024.01099}
3137:  doi = {10.1093/bioadv/vbaf060}
3147:  doi = {10.1145/3637528.3671696}
3157:  doi = {10.52202/079017-1420}
3169:  doi = {10.1038/s41598-025-32093-9}
3177:  eprint = {2502.04907},
3186:  eprint = {2505.24403},
3196:  eprint = {2506.02203},
3206:  eprint = {2412.16715},
3216:  eprint = {2602.07260},
3225:  eprint = {2410.16669},
3238:  doi = {10.1002/pro6.70056}
3250:  doi = {10.18372/1990-5548.88.20980}
3259:  eprint = {2605.30089},
3269:  eprint = {2607.28423},
3279:  eprint = {2609.17906},
3290:  doi = {10.1109/cpee71962.2026.11768023}
3302:  doi = {10.3390/bioengineering12080813}
3314:  doi = {10.1007/s10851-026-01327-4}
3324:  doi = {10.1117/12.3027015}
3335:  doi = {10.1016/j.ejrai.2026.100091}
3344:  eprint = {2508.21523},
3356:  doi = {10.1016/j.phro.2026.100907}
3365:  eprint = {2607.23626},
3375:  doi = {10.21203/rs.3.rs-10382441/v1}
3386:  doi = {10.1162/imag.a.1343}
```
Exit status: 0

### bro1996multiway
Command: python3 lookup resolve '10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c'
```
Crossref: ratio 1.00: Multiway calibration. Multilinear PLS | Rasmus Bro | 1996 | Journal of Chemometrics | vol 10 | no 1 | pages 47--61 | doi 10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c
OpenAlex: ratio 1.00: Multiway calibration. Multilinear PLS | Rasmus Bro | 1996 | Journal of Chemometrics | vol 10 | no 1 | pages 47--61 | doi 10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c | OpenAlex W2155639125
Semantic Scholar: ratio 1.00: Multiway calibration. Multilinear PLS | R. Bro | 1996 | vol 10 | doi 10.1002/(SICI)1099-128X(199601)10:1<47::AID-CEM400>3.0.CO;2-C | Semantic Scholar 5d7a1f4c37d36b804183d4240a304d1539cf5551
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhao2013hopls
Command: python3 lookup resolve '10.1109/tpami.2012.254'
```
Crossref: ratio 1.00: Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method | Qibin Zhao, C. F. Caiafa, D. P. Mandic, Z. C. Chao, Y. Nagasaka, N. Fujii, Liqing Zhang, A. Cichocki | 2013 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 35 | no 7 | pages 1660--1673 | doi 10.1109/tpami.2012.254
OpenAlex: ratio 1.00: Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method | Qibin Zhao, Cesar Federico Caiafa, Danilo P. Mandic, Z. C. Chao, Yasuo Nagasaka, Naotaka Fujii, Liqing Zhang, Andrzej S Cichocki | 2012 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 35 | no 7 | pages 1660--1673 | doi 10.1109/tpami.2012.254 | OpenAlex W1967696752 | open access https://arxiv.org/pdf/1207.1230
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### park2025sparse
Command: python3 lookup resolve '10.1093/biomet/asaf082'
```
Crossref: ratio 1.00: Sparse higher-order partial least squares for simultaneous variable selection, dimension reduction and tensor denoising | Kwangmoon Park, S<latin small letter u with diaeresis>nd<latin small letter u with diaeresis>z Kele<latin small letter s with cedilla> | 2025 | Biometrika | vol 113 | no 1 | doi 10.1093/biomet/asaf082
OpenAlex: ratio 1.00: Sparse higher-order partial least squares for simultaneous variable selection, dimension reduction and tensor denoising | Kwangmoon Park, S<latin small letter u with diaeresis>nd<latin small letter u with diaeresis>z Kele<latin small letter s with cedilla> | 2025 | Biometrika | vol 113 | no 1 | doi 10.1093/biomet/asaf082 | OpenAlex W7106135362 | open access https://arxiv.org/pdf/2310.09428
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhou2013tensor
Command: python3 lookup resolve '10.1080/01621459.2013.776499'
```
Crossref: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Lexin Li, Hongtu Zhu | 2013 | Journal of the American Statistical Association | vol 108 | no 502 | pages 540--552 | doi 10.1080/01621459.2013.776499
OpenAlex: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Lexin Li, Hongtu Zhu | 2013 | Journal of the American Statistical Association | vol 108 | no 502 | pages 540--552 | doi 10.1080/01621459.2013.776499 | OpenAlex W2136002544 | open access http://europepmc.org/articles/PMC4004091
Semantic Scholar: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Le-Xin Li, Hong-Tu Zhu | 2012 | Journal of the American Statistical Association | vol 108 | pages 540--552 | doi 10.1080/01621459.2013.776499 | arXiv 1203.3209 | Semantic Scholar cae78de351d5cbd5bd7fd853cf07034ca2e6659c | open access http://europepmc.org/articles/PMC4004091
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### li2018tucker
Command: python3 lookup resolve '10.1007/s12561-018-9215-6'
```
Crossref: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiaoshan Li, Da Xu, Hua Zhou, Lexin Li | 2018 | Statistics in Biosciences | vol 10 | no 3 | pages 520--545 | doi 10.1007/s12561-018-9215-6
OpenAlex: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiaoshan Li, Da Xu, Hua Zhou, Lexin Li | 2018 | Statistics in Biosciences | vol 10 | no 3 | pages 520--545 | doi 10.1007/s12561-018-9215-6 | OpenAlex W1580176742 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8336908/
Semantic Scholar: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiao-Shan Li, Da Xu, Hua Zhou, Le-Xin Li | 2013 | Statistics in Biosciences | vol 10 | pages 520--545 | doi 10.1007/s12561-018-9215-6 | arXiv 1304.5637 | Semantic Scholar 99163e795fb486abbee830608383b6a142cdf434 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8336908/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xu2024tensor
Command: python3 lookup resolve '10.1214/23-aoas1830'
```
Crossref: ratio 1.00: Tensor regression for incomplete observations with application to longitudinal studies | Tianchen Xu, Kun Chen, Gen Li | 2024 | The Annals of Applied Statistics | vol 18 | no 2 | pages 1195--1212 | doi 10.1214/23-aoas1830
OpenAlex: ratio 1.00: Tensor regression for incomplete observations with application to longitudinal studies | Tianchen Xu, Kun Chen, Gen Li | 2024 | The Annals of Applied Statistics | vol 18 | no 2 | pages 1195--1212 | doi 10.1214/23-aoas1830 | OpenAlex W4393976093 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC11446469/pdf/nihms-2011753.pdf
Semantic Scholar: ratio 1.00: TENSOR REGRESSION FOR INCOMPLETE OBSERVATIONS WITH APPLICATION TO LONGITUDINAL STUDIES | Tianchen Xu, Kun Chen, Gen Li | 2024 | Annals of Applied Statistics | vol 18 | pages 1195--1212 | doi 10.1214/23-aoas1830 | Semantic Scholar be9610c70d40f615f5ea456b84263fbcf2419a94 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC11446469/pdf/nihms-2011753.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### huang2026shift
Command: python3 lookup resolve '10.1007/s11222-026-10892-y'
```
Crossref: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and Computing | vol 36 | no 3 | doi 10.1007/s11222-026-10892-y
OpenAlex: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and Computing | vol 36 | no 3 | doi 10.1007/s11222-026-10892-y | OpenAlex W7160305416 | open access https://link.springer.com/content/pdf/10.1007/s11222-026-10892-y.pdf
Semantic Scholar: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and computing | vol 36 | doi 10.1007/s11222-026-10892-y | Semantic Scholar 0022f9272776da223a17c89c95429f0a0c3d07cc | open access https://link.springer.com/content/pdf/10.1007/s11222-026-10892-y.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kolda2009tensor
Command: python3 lookup resolve '10.1137/07070111x'
```
Crossref: ratio 1.00: Tensor Decompositions and Applications | Tamara G. Kolda, Brett W. Bader | 2009 | SIAM Review | vol 51 | no 3 | pages 455--500 | doi 10.1137/07070111x
OpenAlex: ratio 1.00: Tensor Decompositions and Applications | Tamara G. Kolda, Brett W. Bader | 2009 | SIAM Review | vol 51 | no 3 | pages 455--500 | doi 10.1137/07070111x | OpenAlex W2024165284
Semantic Scholar: ratio 1.00: Tensor Decompositions and Applications | T. Kolda, B. Bader | 2009 | SIAM Review | vol 51 | pages 455--500 | doi 10.1137/07070111X | Semantic Scholar 87e43e9eba01a4eb03436c9946bf6aa031a5d5af
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### harshman1972parafac2
No DOI and no arXiv ID; url: https://psychology.uwo.ca/faculty/harshman/wpppfac2.pdf. Checked by WebFetch of the url (recorded below by the session).

### kiers1999parafac2
Command: python3 lookup resolve '10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b'
```
Crossref: ratio 1.00: PARAFAC2<em dash>Part I. A direct fitting algorithm for the PARAFAC2 model | Henk A. L. Kiers, Jos M. F. ten Berge, Rasmus Bro | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 275--294 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b
OpenAlex: ratio 0.99: PARAFAC2 - Part I. A direct fitting algorithm for the PARAFAC2 model | Henk A. L. Kiers, Jos M. F. ten Berge, Rasmus Bro | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 275--294 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b | OpenAlex W2167838035
Semantic Scholar: ratio 1.00: PARAFAC2<em dash>Part I. A direct fitting algorithm for the PARAFAC2 model | H. Kiers, J. T. ten Berge, R. Bro | 1999 | vol 13 | doi 10.1002/(SICI)1099-128X(199905/08)13:3/4<275::AID-CEM543>3.0.CO;2-B | Semantic Scholar a2c846e976575e84a1471fb1d042d7f5e04b3417
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bro1999parafac2
Command: python3 lookup resolve '10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y'
```
Crossref: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | Rasmus Bro, Claus A. Andersson, Henk A. L. Kiers | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 295--309 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y
OpenAlex: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | Rasmus Bro, Claus A. Andersson, Henk A. L. Kiers | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 295--309 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y | OpenAlex W1964121443
Semantic Scholar: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | R. Bro, C. Andersson, H. Kiers | 1999 | vol 13 | doi 10.1002/(SICI)1099-128X(199905/08)13:3/4<295::AID-CEM547>3.0.CO;2-Y | Semantic Scholar 0ccfc172cc3ba9ee0d9b1f00ecbcca182aca6d6e
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tang2026tensor
Command: python3 lookup resolve '10.1137/24m1692836'
```
Crossref: ratio 1.00: Tensor Decomposition with Unaligned Observations | Runshi Tang, Tamara G. Kolda, Anru R. Zhang | 2026 | SIAM Journal on Matrix Analysis and Applications | vol 47 | no 1 | pages 107--131 | doi 10.1137/24m1692836
OpenAlex: ratio 1.00: Tensor Decomposition with Unaligned Observations | Runshi Tang, Tamara G. Kolda, Anru R. Zhang | 2026 | SIAM Journal on Matrix Analysis and Applications | vol 47 | no 1 | pages 107--131 | doi 10.1137/24m1692836 | OpenAlex W7127277482 | open access https://arxiv.org/pdf/2410.14046
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kuang2020shift
Command: python3 lookup resolve '10.1109/tmi.2019.2936046'
```
Crossref: ratio 1.00: Shift-Invariant Canonical Polyadic Decomposition of Complex-Valued Multi-Subject fMRI Data With a Phase Sparsity Constraint | Li-Dan Kuang, Qiu-Hua Lin, Xiao-Feng Gong, Fengyu Cong, Yu-Ping Wang, Vince D. Calhoun | 2020 | IEEE Transactions on Medical Imaging | vol 39 | no 4 | pages 844--853 | doi 10.1109/tmi.2019.2936046
OpenAlex: ratio 1.00: Shift-Invariant Canonical Polyadic Decomposition of Complex-Valued Multi-Subject fMRI Data With a Phase Sparsity Constraint | Li<hyphen>Dan Kuang, Qiu<hyphen>Hua Lin, Xiao<hyphen>Feng Gong, Fengyu Cong, Yu<hyphen>Ping Wang, Vince D. Calhoun | 2019 | IEEE Transactions on Medical Imaging | vol 39 | no 4 | pages 844--853 | doi 10.1109/tmi.2019.2936046 | OpenAlex W2969480173 | open access https://ieeexplore.ieee.org/ielx7/42/9055242/08805171.pdf
Semantic Scholar: ratio 1.00: Shift-Invariant Canonical Polyadic Decomposition of Complex-Valued Multi-Subject fMRI Data with a Phase Sparsity Constraint | Li-Dan Kuang, Qiu-Hua Lin, Xiao-Feng Gong, F. Cong, Yu-Ping Wang, V. Calhoun | 2019 | IEEE Transactions on Medical Imaging | vol 39 | pages 844--853 | doi 10.1109/TMI.2019.2936046 | Semantic Scholar 9c6c1c29f70b6c68bf226c4998549bd97b12f8b0 | open access https://ieeexplore.ieee.org/ielx7/42/9055242/08805171.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### acar2022tracing
Command: python3 lookup resolve '10.3389/fnins.2022.861402'
```
Crossref: ratio 1.00: Tracing Evolving Networks Using Tensor Factorizations vs. ICA-Based Approaches | Evrim Acar, Marie Roald, Khondoker M. Hossain, Vince D. Calhoun, T<latin small letter u with diaeresis>lay Adali | 2022 | Frontiers in Neuroscience | vol 16 | doi 10.3389/fnins.2022.861402
OpenAlex: ratio 1.00: Tracing Evolving Networks Using Tensor Factorizations vs. ICA-Based Approaches | Evrim Acar, Marie Roald, Khondoker Murad Hossain, Vince D. Calhoun, T<latin small letter u with diaeresis>lay Adal<latin small letter dotless i> | 2022 | Frontiers in Neuroscience | vol 16 | pages 861402--861402 | doi 10.3389/fnins.2022.861402 | OpenAlex W4224320358 | open access https://doi.org/10.3389/fnins.2022.861402
Semantic Scholar: ratio 1.00: Tracing Evolving Networks Using Tensor Factorizations vs. ICA-Based Approaches | E. Acar, Marie Roald, K. M. Hossain, V. Calhoun, T. Adal<latin small letter dotless i> | 2022 | Frontiers in Neuroscience | vol 16 | doi 10.3389/fnins.2022.861402 | Semantic Scholar 62c3bab5d38f96e6571685918b001ce5b17955c9 | open access https://doi.org/10.3389/fnins.2022.861402
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yu2021local
Command: python3 lookup resolve '10.1016/j.chemolab.2021.104446'
```
Crossref: ratio 1.00: PARAFAC2 and local minima | Huiwen Yu, Rasmus Bro | 2021 | Chemometrics and Intelligent Laboratory Systems | vol 219 | pages 104446 | doi 10.1016/j.chemolab.2021.104446
OpenAlex: ratio 1.00: PARAFAC2 and local minima | Huiwen Yu, Rasmus Bro | 2021 | Chemometrics and Intelligent Laboratory Systems | vol 219 | pages 104446--104446 | doi 10.1016/j.chemolab.2021.104446 | OpenAlex W3209483728
Semantic Scholar: ratio 1.00: PARAFAC2 and local minima | Huiwen Yu, R. Bro | 2021 | Chemometrics and Intelligent Laboratory Systems | doi 10.1016/j.chemolab.2021.104446 | Semantic Scholar 848ee51beef8015f8339c003187cf2def1fea74e
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ren2023multipar
Command: python3 lookup resolve '2208.00993'
```
Crossref: not found
OpenAlex: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yifei Ren, Jian Lou, Xiong Li, Joyce C. Ho, Xiaoqian Jiang, Sivasubramanium Bhavan | 2022 | arXiv (Cornell University) | doi 10.48550/arxiv.2208.00993 | arXiv 2208.00993 | OpenAlex W4289597181 | open access https://arxiv.org/pdf/2208.00993
Semantic Scholar: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yi-Fei Ren, Jian Lou, Li Xiong, Joyce Ho, Xiaoqian Jiang, S. Bhavani | 2022 | arXiv.org | vol abs/2208.00993 | doi 10.48550/arXiv.2208.00993 | arXiv 2208.00993 | Semantic Scholar e8aa9a0fe21c23d18c872475a1f92ef9ab7cd4b7 | open access http://arxiv.org/pdf/2208.00993
arXiv: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yifei Ren, Jian Lou, Li Xiong, Joyce C Ho, Xiaoqian Jiang, Sivasubramanium Bhavani | 2022 | arXiv 2208.00993
```
Exit status: 0

### patalano2026par2cox
Command: python3 lookup resolve '2609.23705'
```
Crossref: not found
OpenAlex: ratio 1.00: PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data | Mariafrancesca Patalano, Elif Konyar, Kamran Paynabar | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2609.23705 | arXiv 2609.23705 | OpenAlex W7214014480 | open access https://arxiv.org/pdf/2609.23705
Semantic Scholar: ratio 1.00: PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data | Mariafrancesca Patalano, Elif Konyar, K. Paynabar | 2026 | arXiv 2609.23705 | Semantic Scholar 771ea4ac7c2f53c12900ccbdcb94d3e2cb5711a7
arXiv: ratio 1.00: PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data | Mariafrancesca Patalano, Elif Konyar, Kamran Paynabar | 2026 | arXiv 2609.23705
```
Exit status: 0

### morup2008shift
Command: python3 lookup resolve '10.1016/j.neuroimage.2008.05.062'
```
Crossref: ratio 1.00: Shift-invariant multilinear decomposition of neuroimaging data | Morten M<latin small letter o with stroke>rup, Lars Kai Hansen, Sidse Marie Arnfred, Lek-Heng Lim, Kristoffer Hougaard Madsen | 2008 | NeuroImage | vol 42 | no 4 | pages 1439--1450 | doi 10.1016/j.neuroimage.2008.05.062
OpenAlex: ratio 1.00: Shift-invariant multilinear decomposition of neuroimaging data | Morten M<latin small letter o with stroke>rup, Lars Kai Hansen, Sidse Arnfred, Lek<hyphen>Heng Lim, Kristoffer Hougaard Madsen | 2008 | NeuroImage | vol 42 | no 4 | pages 1439--1450 | doi 10.1016/j.neuroimage.2008.05.062 | OpenAlex W2095141632 | open access http://eprints.drcmr.dk/29/1/Shift_invariant_decomp_2008.pdf
Semantic Scholar: ratio 1.00: Shift-invariant multilinear decomposition of neuroimaging data | M. M<latin small letter o with stroke>rup, L. Hansen, S. Arnfred, Lek-Heng Lim, Kristoffer Hougaard Madsen | 2008 | NeuroImage | vol 42 4 | pages 1439--50 | doi 10.1016/j.neuroimage.2008.05.062 | Semantic Scholar b63ce62e20b4afa7b377307783f58dde6748f8a7 | open access http://eprints.drcmr.dk/29/1/Shift_invariant_decomp_2008.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tang2019individualized
Command: python3 lookup resolve '10.1080/01621459.2019.1585254'
```
Crossref: ratio 1.00: Individualized Multilayer Tensor Learning With an Application in Imaging Analysis | Xiwei Tang, Xuan Bi, Annie Qu | 2019 | Journal of the American Statistical Association | vol 115 | no 530 | pages 836--851 | doi 10.1080/01621459.2019.1585254
OpenAlex: ratio 1.00: Individualized Multilayer Tensor Learning With an Application in Imaging Analysis | Xiwei Tang, Xuan Bi, Annie Qu | 2019 | Journal of the American Statistical Association | vol 115 | no 530 | pages 836--851 | doi 10.1080/01621459.2019.1585254 | OpenAlex W2924265785 | open access https://arxiv.org/pdf/1903.08871
Semantic Scholar: ratio 1.00: Individualized Multilayer Tensor Learning With an Application in Imaging Analysis | Xi-Wei Tang, Xuan Bi, An-Nie Qu | 2019 | Journal of the American Statistical Association | vol 115 | pages 836--851 | doi 10.1080/01621459.2019.1585254 | arXiv 1903.08871 | Semantic Scholar 1c9a457259329e7a948542ae285794228f559ffa | open access https://arxiv.org/pdf/1903.08871
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### mcleod2018cardiac
Command: python3 lookup resolve '10.1109/tbme.2018.2816519'
```
Crossref: ratio 1.00: Cardiac Motion Evolution Model for Analysis of Functional Changes Using Tensor Decomposition and Cross-Sectional Data | Kristin McLeod, Kristin Tondel, Lilian Calvet, Maxime Sermesant, Xavier Pennec | 2018 | IEEE Transactions on Biomedical Engineering | vol 65 | no 12 | pages 2769--2780 | doi 10.1109/tbme.2018.2816519
OpenAlex: ratio 1.00: Cardiac Motion Evolution Model for Analysis of Functional Changes Using Tensor Decomposition and Cross-Sectional Data | Kristin McLeod, Kristin T<latin small letter o with stroke>ndel, Lilian Calvet, Maxime Sermesant, Xavier Pennec | 2018 | IEEE Transactions on Biomedical Engineering | vol 65 | no 12 | pages 2769--2780 | doi 10.1109/tbme.2018.2816519 | OpenAlex W2898333304 | open access https://inria.hal.science/hal-01736454v1/file/TBME2816519.pdf
Semantic Scholar: ratio 1.00: Cardiac Motion Evolution Model for Analysis of Functional Changes Using Tensor Decomposition and Cross-Sectional Data | K. Mcleod, Kristin T<latin small letter o with stroke>ndel, Lilian Calvet, Maxime Sermesant, X. Pennec | 2018 | IEEE Transactions on Biomedical Engineering | vol 65 | pages 2769--2780 | doi 10.1109/TBME.2018.2816519 | Semantic Scholar 733ee2c05c170b8cf66ba744efc8425403b4bfcd | open access https://inria.hal.science/hal-01736454v1/file/TBME2816519.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kralik2026identifying
Command: python3 lookup resolve '10.64898/2026.11.12.766278'
```
Crossref: ratio 1.00: Identifying aligned tensor decompositions across heterogeneous neural datasets | Mikl<latin small letter o with acute>s Kr<latin small letter a with acute>lik, Sasha Tinelli, James Kozloski, Rui Ponte Costa, Andrew Sharott, Robert L. Peach | 2026 | doi 10.64898/2026.11.12.766278
OpenAlex: ratio 1.00: Identifying aligned tensor decompositions across heterogeneous neural datasets | Mikl<latin small letter o with acute>s Andr<latin small letter a with acute>s Kr<latin small letter a with acute>lik, Sasha Tinelli, James Kozloski, Rui Ponte Costa, Andrew Sharott, Robert L. Peach | 2026 | bioRxiv (Cold Spring Harbor Laboratory) | doi 10.64898/2026.11.12.766278 | OpenAlex W7226007733 | open access https://www.biorxiv.org/content/biorxiv/early/2026/11/13/2026.11.12.766278.full.pdf
Semantic Scholar: ratio 1.00: Identifying aligned tensor decompositions across heterogeneous neural datasets | Mikl<latin small letter o with acute>s Kr<latin small letter a with acute>lik, Sasha Tinelli, J. Kozloski, Rui Ponte Costa, A. Sharott, R. Peach | 2026 | bioRxiv | doi 10.64898/2026.11.12.766278 | Semantic Scholar 05ed3766e7e6d5ee5b00e32c6ecbe3b1e6549ecd | open access https://www.biorxiv.org/content/biorxiv/early/2026/11/13/2026.11.12.766278.full.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### harshman1996uniqueness
Command: python3 lookup resolve '10.1007/bf02296963'
```
Crossref: ratio 1.00: Uniqueness Proof for a Family of Models Sharing Features of Tucker's Three-Mode Factor Analysis and PARAFAC/Candecomp | Richard A. Harshman, Margaret E. Lundy | 1996 | Psychometrika | vol 61 | no 1 | pages 133--154 | doi 10.1007/bf02296963
OpenAlex: ratio 1.00: Uniqueness Proof for a Family of Models Sharing Features of Tucker's Three-Mode Factor Analysis and PARAFAC/Candecomp | Richard A. Harshman, Margaret E. Lundy | 1996 | Psychometrika | vol 61 | no 1 | pages 133--154 | doi 10.1007/bf02296963 | OpenAlex W2101815756
Semantic Scholar: ratio 1.00: Uniqueness proof for a family of models sharing features of Tucker's three-mode factor analysis and PARAFAC/candecomp | R. Harshman, M. Lundy | 1996 | vol 61 | pages 133--154 | doi 10.1007/BF02296963 | Semantic Scholar e9ba1e7f1a6cb2d66b7baf5c25cbc355a408838f
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cuturi2013sinkhorn
Command: python3 lookup resolve '1306.0895'
```
Crossref: not found
OpenAlex: ratio 1.00: Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances | Marco Cuturi | 2013 | arXiv (Cornell University) | doi 10.48550/arxiv.1306.0895 | arXiv 1306.0895 | OpenAlex W1511358834 | open access https://arxiv.org/pdf/1306.0895
Semantic Scholar: ratio 0.89: Sinkhorn Distances: Lightspeed Computation of Optimal Transport | Marco Cuturi | 2013 | Neural Information Processing Systems | pages 2292--2300 | arXiv 1306.0895 | Semantic Scholar 0080118b0eb02af581ff32b85a1bb6aed7081f45
arXiv: ratio 1.00: Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances | Marco Cuturi | 2013 | arXiv 1306.0895
```
Exit status: 0

### peyre2019computational
Command: python3 lookup resolve '10.1561/2200000073'
```
Crossref: ratio 1.00: Computational Optimal Transport with Applications to Data Sciences | Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2019 | Foundations and Trends<registered sign> in Machine Learning | vol 11 | no 5-6 | pages 355--607 | doi 10.1561/2200000073
OpenAlex: ratio 1.00: Computational Optimal Transport with Applications to Data Sciences | Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2019 | Foundations and Trends<registered sign> in Machine Learning | vol 11 | no 5-6 | pages 355--607 | doi 10.1561/2200000073 | OpenAlex W3039256091
Semantic Scholar: DOI_MISMATCH, ratio 0.64: Computational Optimal Transport | G. Peyr<latin small letter e with acute>, Marco Cuturi | 2018 | Found. Trends Mach. Learn. | vol 11 | pages 355--607 | doi 10.1561/2200000073 | arXiv 1803.00567 | Semantic Scholar 8e51d68250db5637cd6bc1de98a99396441399b2 | open access https://arxiv.org/pdf/1803.00567
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### genevay2019sample
Command: python3 lookup resolve '1810.02733'
```
Crossref: not found
OpenAlex: ratio 1.00: Sample Complexity of Sinkhorn divergences | Aude Genevay, L<latin small letter e with acute>na<latin small letter i with diaeresis>c Chizat, Francis Bach, Marco Cuturi, Gabriel Peyr<latin small letter e with acute> | 2018 | arXiv (Cornell University) | doi 10.48550/arxiv.1810.02733 | arXiv 1810.02733 | OpenAlex W2895248218 | open access https://arxiv.org/pdf/1810.02733
Semantic Scholar: ratio 1.00: Sample Complexity of Sinkhorn Divergences | A. Genevay, L<latin small letter e with acute>na<latin small letter i with diaeresis>c Chizat, F. Bach, Marco Cuturi, G. Peyr<latin small letter e with acute> | 2018 | International Conference on Artificial Intelligence and Statistics | pages 1574--1583 | arXiv 1810.02733 | Semantic Scholar dd5e54b08b2c1520d179e88cd524e9bd4fe1f6ab
arXiv: ratio 1.00: Sample Complexity of Sinkhorn divergences | Aude Genevay, L<latin small letter e with acute>naic Chizat, Francis Bach, Marco Cuturi, Gabriel Peyr<latin small letter e with acute> | 2018 | arXiv 1810.02733
```
Exit status: 0

### benamou2015iterative
Command: python3 lookup resolve '10.1137/141000439'
```
Crossref: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | Jean-David Benamou, Guillaume Carlier, Marco Cuturi, Luca Nenna, Gabriel Peyr<latin small letter e with acute> | 2015 | SIAM Journal on Scientific Computing | vol 37 | no 2 | pages A1111--A1138 | doi 10.1137/141000439
OpenAlex: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | Jean<hyphen>David Benamou, Guillaume Carlier, Marco Cuturi, Luca Nenna, Gabriel Peyr<latin small letter e with acute> | 2015 | SIAM Journal on Scientific Computing | vol 37 | no 2 | pages A1111--A1138 | doi 10.1137/141000439 | OpenAlex W2036996178 | open access https://arxiv.org/pdf/1412.5154
Semantic Scholar: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | J. Benamou, G. Carlier, Marco Cuturi, Luca Nenna, G. Peyr<latin small letter e with acute> | 2014 | SIAM Journal on Scientific Computing | vol 37 | doi 10.1137/141000439 | arXiv 1412.5154 | Semantic Scholar d3831561301ef27a6ba0d3c68d30bdf0f27eef63 | open access https://arxiv.org/pdf/1412.5154
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### memoli2011gromov
Command: python3 lookup resolve '10.1007/s10208-011-9093-5'
```
Crossref: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | Facundo M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | vol 11 | no 4 | pages 417--487 | doi 10.1007/s10208-011-9093-5
OpenAlex: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | Facundo M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | vol 11 | no 4 | pages 417--487 | doi 10.1007/s10208-011-9093-5 | OpenAlex W2027842533
Semantic Scholar: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | F. M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | vol 11 | pages 417--487 | doi 10.1007/s10208-011-9093-5 | Semantic Scholar 03a4f1c1975237a5e1e501dd26811b4ce55a35a9
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### peyre2016gromov
No DOI and no arXiv ID; url: https://proceedings.mlr.press/v48/peyre16.html. Checked by WebFetch of the url (recorded below by the session).

### vayer2019optimal
Command: python3 lookup resolve '1805.09114'
```
Crossref: not found
OpenAlex: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, La<latin small letter e with diaeresis>titia Chapel, R<latin small letter e with acute>mi Flamary, Romain Tavenard, Nicolas Courty | 2018 | HAL | pages 1--16 | doi 10.48550/arxiv.1805.09114 | arXiv 1805.09114 | OpenAlex W2911397097 | open access http://arxiv.org/pdf/1805.09114
Semantic Scholar: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, L. Chapel, R<latin small letter e with acute>mi Flamary, R. Tavenard, N. Courty | 2018 | International Conference on Machine Learning | pages 6275--6284 | arXiv 1805.09114 | Semantic Scholar 6f9de3cd77ac32ce00da3ba6b71e2360b5b2a81c
arXiv: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, Laetitia Chapel, R<latin small letter e with acute>mi Flamary, Romain Tavenard, Nicolas Courty | 2018 | arXiv 1805.09114
```
Exit status: 0

### sejourne2021unbalanced
Command: python3 lookup resolve '2009.04266'
```
Crossref: not found
OpenAlex: ratio 1.00: The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation | Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois<hyphen>Xavier Vialard, Gabriel Peyr<latin small letter e with acute> | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2009.04266 | arXiv 2009.04266 | OpenAlex W3084165997 | open access https://arxiv.org/pdf/2009.04266
Semantic Scholar: ratio 1.00: The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation | Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, G. Peyr<latin small letter e with acute> | 2020 | Neural Information Processing Systems | pages 8766--8779 | arXiv 2009.04266 | Semantic Scholar a772118cb42eaa6648a435db201cf9b2090b4648
arXiv: ratio 1.00: The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation | Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, Gabriel Peyr<latin small letter e with acute> | 2020 | arXiv 2009.04266
```
Exit status: 0

### scetbon2022linear
Command: python3 lookup resolve '2106.01128'
```
Crossref: not found
OpenAlex: ratio 1.00: Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs | Meyer Scetbon, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2106.01128 | arXiv 2106.01128 | OpenAlex W3169502490 | open access https://arxiv.org/pdf/2106.01128
Semantic Scholar: ratio 1.00: Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs | Meyer Scetbon, G. Peyr<latin small letter e with acute>, Marco Cuturi | 2021 | International Conference on Machine Learning | pages 19347--19365 | doi 10.48550/arXiv.2106.01128 | arXiv 2106.01128 | Semantic Scholar f54fd960e51f27f3484546eb84c481c4c055b882 | open access http://arxiv.org/pdf/2106.01128
arXiv: ratio 1.00: Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs | Meyer Scetbon, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2021 | arXiv 2106.01128
```
Exit status: 0

### rioux2024entropic
Command: python3 lookup resolve '2306.00182'
```
Crossref: not found
OpenAlex: ratio 1.00: Entropic Gromov-Wasserstein Distances: Stability and Algorithms | Gabriel Rioux, Ziv Goldfeld, Kengo Kato | 2023 | arXiv (Cornell University) | doi 10.48550/arxiv.2306.00182 | arXiv 2306.00182 | OpenAlex W4379251962 | open access https://arxiv.org/pdf/2306.00182
Semantic Scholar: ratio 0.79: Entropic Gromov-Wasserstein Distances: Stability, Algorithms, and Distributional Limits | G. Rioux, Ziv Goldfeld, Kengo Kato | 2023 | arXiv 2306.00182 | Semantic Scholar d0026df4c83798d4945781b521db15165aaf4a06
arXiv: ratio 1.00: Entropic Gromov-Wasserstein Distances: Stability and Algorithms | Gabriel Rioux, Ziv Goldfeld, Kengo Kato | 2023 | arXiv 2306.00182
```
Exit status: 0

### agueh2011barycenters
Command: python3 lookup resolve '10.1137/100805741'
```
Crossref: ratio 1.00: Barycenters in the Wasserstein Space | Martial Agueh, Guillaume Carlier | 2011 | SIAM Journal on Mathematical Analysis | vol 43 | no 2 | pages 904--924 | doi 10.1137/100805741
OpenAlex: ratio 1.00: Barycenters in the Wasserstein Space | Martial Agueh, Guillaume Carlier | 2011 | SIAM Journal on Mathematical Analysis | vol 43 | no 2 | pages 904--924 | doi 10.1137/100805741 | OpenAlex W1968333723 | open access https://hal.archives-ouvertes.fr/hal-00637399/document
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cuturi2014fast
Command: python3 lookup resolve '1310.4375'
```
Crossref: not found
OpenAlex: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, Arnaud Doucet | 2013 | Oxford University Research Archive (ORA) (University of Oxford) | pages 685--693 | doi 10.48550/arxiv.1310.4375 | arXiv 1310.4375 | OpenAlex W1629559917 | open access https://ora.ox.ac.uk/objects/uuid:176f66e9-3fef-4847-b638-ace71b630ec5/files/mc3fe93fd63587cb3242319d64cbb87a5
Semantic Scholar: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, A. Doucet | 2013 | International Conference on Machine Learning | pages 685--693 | arXiv 1310.4375 | Semantic Scholar c697fd0b73ec7aaeb2e75cb89cf4b8b020dd9556
arXiv: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, Arnaud Doucet | 2013 | arXiv 1310.4375
```
Exit status: 0

### janati2020debiased
Command: python3 lookup resolve '2006.02575'
```
Crossref: not found
OpenAlex: ratio 1.00: Debiased Sinkhorn barycenters | Hicham Janati, Marco Cuturi, Alexandre Gramfort | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.02575 | arXiv 2006.02575 | OpenAlex W3033657060 | open access https://arxiv.org/pdf/2006.02575
Semantic Scholar: ratio 1.00: Debiased Sinkhorn barycenters | Hicham Janati, Marco Cuturi, Alexandre Gramfort | 2020 | International Conference on Machine Learning | vol abs/2006.02575 | doi 10.48550/arXiv.2006.02575 | arXiv 2006.02575 | Semantic Scholar 5b717940bc8d0010b300b40fe2f1b16fb0b9ec46
arXiv: ratio 1.00: Debiased Sinkhorn barycenters | Hicham Janati, Marco Cuturi, Alexandre Gramfort | 2020 | arXiv 2006.02575
```
Exit status: 0

### altschuler2022wasserstein
Command: python3 lookup resolve '10.1137/21M1390062'
```
Crossref: ratio 1.00: Wasserstein Barycenters Are NP-Hard to Compute | Jason M. Altschuler, Enric Boix-Adser<latin small letter a with grave> | 2022 | SIAM Journal on Mathematics of Data Science | vol 4 | no 1 | pages 179--203 | doi 10.1137/21m1390062
OpenAlex: ratio 1.00: Wasserstein Barycenters Are NP-Hard to Compute | Jason M. Altschuler, Enric Boix-Adser<latin small letter a with grave> | 2022 | SIAM Journal on Mathematics of Data Science | vol 4 | no 1 | pages 179--203 | doi 10.1137/21m1390062 | OpenAlex W3120790515 | open access https://arxiv.org/pdf/2101.01100
Semantic Scholar: ratio 1.00: Wasserstein barycenters are NP-hard to compute | Jason M. Altschuler, Enric Boix-Adser<latin small letter a with grave> | 2021 | SIAM Journal on Mathematics of Data Science | vol abs/2101.01100 | doi 10.1137/21M1390062 | arXiv 2101.01100 | Semantic Scholar 6e2fc220a6921c59f3e99c7cfc3b142b9939502c | open access https://arxiv.org/pdf/2101.01100
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### schmitz2018wasserstein
Command: python3 lookup resolve '10.1137/17M1140431'
```
Crossref: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning | Morgan A. Schmitz, Matthieu Heitz, Nicolas Bonneel, Fred Ngol<latin small letter e with grave>, David Coeurjolly, Marco Cuturi, Gabriel Peyr<latin small letter e with acute>, Jean-Luc Starck | 2018 | SIAM Journal on Imaging Sciences | vol 11 | no 1 | pages 643--678 | doi 10.1137/17m1140431
OpenAlex: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning | Morgan A. Schmitz, Matthieu Heitz, Nicolas Bonneel, Fred Ngol<latin small letter e with grave> Mboula, David C<latin small ligature oe>urjolly, Marco Cuturi, Gabriel Peyr<latin small letter e with acute>, Jean<hyphen>Luc Starck | 2018 | SIAM Journal on Imaging Sciences | vol 11 | no 1 | pages 643--678 | doi 10.1137/17m1140431 | OpenAlex W2744110160 | open access https://arxiv.org/pdf/1708.01955
Semantic Scholar: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-based unsupervised non-linear dictionary learning | M. Schmitz, Matthieu Heitz, Nicolas Bonneel, Fred Ngol<latin small letter e with grave> Mboula, D. Coeurjolly, Marco Cuturi, G. Peyr<latin small letter e with acute>, Jean-Luc Starck | 2017 | SIAM Journal of Imaging Sciences | vol 11 | pages 643--678 | doi 10.1137/17M1140431 | arXiv 1708.01955 | Semantic Scholar fd3d9ad8cecbb201a1ca82338681c92ca6174839 | open access https://arxiv.org/pdf/1708.01955
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xu2020gromov
Command: python3 lookup resolve '10.1609/aaai.v34i04.6120'
```
Crossref: ratio 1.00: Gromov-Wasserstein Factorization Models for Graph Clustering | Hongtengl Xu | 2020 | Proceedings of the AAAI Conference on Artificial Intelligence | vol 34 | no 04 | pages 6478--6485 | doi 10.1609/aaai.v34i04.6120
OpenAlex: ratio 1.00: Gromov-Wasserstein Factorization Models for Graph Clustering | Hongtengl Xu | 2020 | Proceedings of the AAAI Conference on Artificial Intelligence | vol 34 | no 04 | pages 6478--6485 | doi 10.1609/aaai.v34i04.6120 | OpenAlex W2996858319 | open access https://doi.org/10.1609/aaai.v34i04.6120
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### vincentcuaz2021online
Command: python3 lookup resolve '2102.06555'
```
Crossref: not found
OpenAlex: ratio 1.00: Online Graph Dictionary Learning | C<latin small letter e with acute>dric Vincent-Cuaz, Titouan Vayer, R<latin small letter e with acute>mi Flamary, Marco Corneli, Nicolas Courty | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2102.06555 | arXiv 2102.06555 | OpenAlex W3131640093 | open access https://arxiv.org/pdf/2102.06555
Semantic Scholar: ratio 1.00: Online Graph Dictionary Learning | C<latin small letter e with acute>dric Vincent-Cuaz, Titouan Vayer, R<latin small letter e with acute>mi Flamary, M. Corneli, N. Courty | 2021 | International Conference on Machine Learning | vol abs/2102.06555 | doi 10.48550/arXiv.2102.06555 | arXiv 2102.06555 | Semantic Scholar 9e9017a874024e3f7d8ff5a3aff171afb52beccc
arXiv: ratio 1.00: Online Graph Dictionary Learning | C<latin small letter e with acute>dric Vincent-Cuaz, Titouan Vayer, R<latin small letter e with acute>mi Flamary, Marco Corneli, Nicolas Courty | 2021 | arXiv 2102.06555
```
Exit status: 0

### vincentcuaz2022template
Command: python3 lookup resolve '10.52202/068431-0857'
```
Crossref: ratio 1.00: Template Based Graph Neural Network with Optimal Transport Distances | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli, Titouan Vayer, Nicolas Courty | 2022 | Advances in Neural Information Processing Systems 35 | pages 11800--11814 | doi 10.52202/068431-0857
OpenAlex: ratio 1.00: Template Based Graph Neural Network with Optimal Transport Distances | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli, Titouan Vayer, Nicolas Courty | 2022 | neural information processing systems | pages 11800--11814 | doi 10.52202/068431-0857 | OpenAlex W7133234998
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### brogatmotte2022learning
Command: python3 lookup resolve '2202.03813'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters | Luc Brogat-Motte, R<latin small letter e with acute>mi Flamary, C<latin small letter e with acute>line Brouard, Juho Rousu, Florence d<right single quotation mark>Alch<latin small letter e with acute><en dash>Buc | 2022 | arXiv (Cornell University) | vol 162 | doi 10.48550/arxiv.2202.03813 | arXiv 2202.03813 | OpenAlex W4221153250 | open access https://arxiv.org/pdf/2202.03813
Semantic Scholar: ratio 1.00: Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters | Luc Brogat-Motte, R<latin small letter e with acute>mi Flamary, C<latin small letter e with acute>line Brouard, Juho Rousu, Florence d'Alch<latin small letter e with acute>-Buc | 2022 | International Conference on Machine Learning | vol abs/2202.03813 | doi 10.48550/arXiv.2202.03813 | arXiv 2202.03813 | Semantic Scholar 1a9e5a6a4da5f882ef04f8bb936701220a642ec0 | open access https://arxiv.org/pdf/2202.03813
arXiv: ratio 1.00: Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters | Luc Brogat-Motte, R<latin small letter e with acute>mi Flamary, C<latin small letter e with acute>line Brouard, Juho Rousu, Florence d'Alch<latin small letter e with acute>-Buc | 2022 | arXiv 2202.03813
```
Exit status: 0

### mialon2021trainable
Command: python3 lookup resolve '2006.12065'
```
Crossref: not found
OpenAlex: ratio 1.00: A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, Dexiong Chen, Alexandre d<right single quotation mark>Aspremont, Julien Mairal | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.12065 | arXiv 2006.12065 | OpenAlex W3127760629 | open access https://arxiv.org/pdf/2006.12065
Semantic Scholar: ratio 0.89: An Optimal Transport Kernel for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, De-Xiong Chen, A. d'Aspremont, Julien Mairal | 2020 | arXiv.org | vol abs/2006.12065 | doi 10.48550/arXiv.2006.12065 | arXiv 2006.12065 | Semantic Scholar 74bc260a893479cdada738017037c7bde4283d45 | open access http://arxiv.org/pdf/2006.12065
arXiv: ratio 1.00: A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, Dexiong Chen, Alexandre d'Aspremont, Julien Mairal | 2020 | arXiv 2006.12065
```
Exit status: 0

### moosmuller2023linear
Command: python3 lookup resolve '10.1093/imaiai/iaac023'
```
Crossref: ratio 1.00: Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations | Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2022 | Information and Inference: A Journal of the IMA | vol 12 | no 1 | pages 363--389 | doi 10.1093/imaiai/iaac023
OpenAlex: ratio 1.00: Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations | Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2022 | Information and Inference A Journal of the IMA | vol 12 | no 1 | pages 363--389 | doi 10.1093/imaiai/iaac023 | OpenAlex W3165102544 | open access https://arxiv.org/pdf/2008.09165
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wang2025linearized
Command: python3 lookup resolve '2510.22033'
```
Crossref: not found
OpenAlex: ratio 1.00: Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | Wang, Tianxiang, Ke, Yingtong, Dhananjay Bhaskar, Krishnaswamy, Smita, Alexander Cloninger | 2025 | arXiv (Cornell University) | doi 10.48550/arxiv.2510.22033 | arXiv 2510.22033 | OpenAlex W7101579638 | open access https://arxiv.org/pdf/2510.22033
Semantic Scholar: ratio 1.00: Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | Tian-Xiang Wang, Yingtong Ke, Dhananjay Bhaskar, Smita Krishnaswamy, Alexander Cloninger | 2025 | arXiv.org | vol abs/2510.22033 | doi 10.48550/arXiv.2510.22033 | arXiv 2510.22033 | Semantic Scholar e0e8e29e4579991ec2c07a8baf7624de32135e77
arXiv: ratio 1.00: Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | Tianxiang Wang, Yingtong Ke, Dhananjay Bhaskar, Smita Krishnaswamy, Alexander Cloninger | 2025 | arXiv 2510.22033
```
Exit status: 0

### gramfort2015fast
Command: python3 lookup resolve '10.1007/978-3-319-19992-4_20'
```
Crossref: ratio 1.00: Fast Optimal Transport Averaging of Neuroimaging Data | A. Gramfort, G. Peyr<latin small letter e with acute>, M. Cuturi | 2015 | Lecture Notes in Computer Science | pages 261--272 | doi 10.1007/978-3-319-19992-4_20
OpenAlex: ratio 1.00: Fast Optimal Transport Averaging of Neuroimaging Data | Alexandre Gramfort, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2015 | Lecture notes in computer science | vol 24 | pages 261--272 | doi 10.1007/978-3-319-19992-4_20 | OpenAlex W2111725927 | open access https://arxiv.org/pdf/1503.08596
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bazeille2019local
Command: python3 lookup resolve '10.1007/978-3-030-20351-1_18'
```
Crossref: ratio 1.00: Local Optimal Transport for Functional Brain Template Estimation | T. Bazeille, H. Richard, H. Janati, B. Thirion | 2019 | Lecture Notes in Computer Science | pages 237--248 | doi 10.1007/978-3-030-20351-1_18
OpenAlex: ratio 1.00: Local Optimal Transport for Functional Brain Template Estimation | Thomas Bazeille, H. Richard, Hicham Janati, Bertrand Thirion | 2019 | Lecture notes in computer science | pages 237--248 | doi 10.1007/978-3-030-20351-1_18 | OpenAlex W2946207497 | open access https://hal.archives-ouvertes.fr/hal-02278663/file/Local_optimal_transport_for_functional_brain_template_estimation.pdf
Semantic Scholar: ratio 1.00: Local Optimal Transport for Functional Brain Template Estimation | Thomas Bazeille, Hugo Richard, Hicham Janati, B. Thirion | 2019 | Information Processing in Medical Imaging | pages 237--248 | doi 10.1007/978-3-030-20351-1_18 | Semantic Scholar d74eab8206cafbbc10ff4fb1ad038f81c2f1a0ec | open access https://hal.archives-ouvertes.fr/hal-02278663/file/Local_optimal_transport_for_functional_brain_template_estimation.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### thual2022aligning
Command: python3 lookup resolve '10.52202/068431-1584'
```
Crossref: ratio 1.00: Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein | Alexis Thual, Quang Huy Tran, Tatiana Zemskova, Nicolas Courty, R<latin small letter e with acute>mi Flamary, Stanislas Dehaene, Bertrand Thirion | 2022 | Advances in Neural Information Processing Systems 35 | pages 21792--21804 | doi 10.52202/068431-1584
OpenAlex: ratio 1.00: Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein | Alexis Thual, Quang Huy Tran, Tatiana Zemskova, Nicolas Courty, R<latin small letter e with acute>mi Flamary, Stanislas Dehaene, Bertrand Thirion | 2022 | neural information processing systems | pages 21792--21804 | doi 10.52202/068431-1584 | OpenAlex W7133227349
Semantic Scholar: ratio 1.00: Aligning individual brains with fused unbalanced Gromov Wasserstein | Alexis Thual, Quang-Huy Tran, <cyrillic capital letter te>. <cyrillic capital letter pe>. <cyrillic capital letter ze><cyrillic small letter ie><cyrillic small letter em><cyrillic small letter es><cyrillic small letter ka><cyrillic small letter o><cyrillic small letter ve><cyrillic small letter a>, N. Courty, R<latin small letter e with acute>mi Flamary, S. Dehaene, B. Thirion | 2022 | Neural Information Processing Systems | doi 10.52202/068431-1584 | arXiv 2206.09398 | Semantic Scholar d67dcbf457ce55336f5c6c5c4c996ca3fda0d477
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bazeille2021empirical
Command: python3 lookup resolve '10.1016/j.neuroimage.2021.118683'
```
Crossref: ratio 1.00: An empirical evaluation of functional alignment using inter-subject decoding | Thomas Bazeille, Elizabeth DuPre, Hugo Richard, Jean-Baptiste Poline, Bertrand Thirion | 2021 | NeuroImage | vol 245 | pages 118683 | doi 10.1016/j.neuroimage.2021.118683
OpenAlex: ratio 1.00: An empirical evaluation of functional alignment using inter-subject decoding | Thomas Bazeille, Elizabeth DuPr<latin small letter e with acute>, Hugo Richard, Jean<hyphen>Baptiste Poline, Bertrand Thirion | 2021 | NeuroImage | vol 245 | pages 118683--118683 | doi 10.1016/j.neuroimage.2021.118683 | OpenAlex W3208323570 | open access https://www.sciencedirect.com/science/article/pii/S1053811921009563/pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### su2015shape
Command: python3 lookup resolve '10.1007/978-3-319-19992-4_32'
```
Crossref: ratio 1.00: Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis | Zhengyu Su, Wei Zeng, Yalin Wang, Zhong-Lin Lu, Xianfeng Gu | 2015 | Lecture Notes in Computer Science | pages 411--423 | doi 10.1007/978-3-319-19992-4_32
OpenAlex: ratio 1.00: Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis | Zhengyu Su, Wei Zeng, Yalin Wang, Zhong<hyphen>Lin Lu, Xianfeng David Gu | 2015 | Lecture notes in computer science | vol 24 | pages 411--423 | doi 10.1007/978-3-319-19992-4_32 | OpenAlex W1919720529 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4527322
Semantic Scholar: ratio 1.00: Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis | Zhengyu Su, W. Zeng, Y. Wang, Zhong-Lin Lu, X. Gu | 2015 | Information Processing in Medical Imaging | vol 24 | pages 411--423 | doi 10.1007/978-3-319-19992-4_32 | Semantic Scholar b2ef0bf744cddba8fa7008fbc7818f845966cca7 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4527322
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kundu2020enabling
Command: python3 lookup resolve '10.1073/pnas.1917405117'
```
Crossref: ratio 1.00: Enabling early detection of osteoarthritis from presymptomatic cartilage texture maps via transport-based learning | Shinjini Kundu, Beth G. Ashinsky, Mustapha Bouhrara, Erik B. Dam, Shadpour Demehri, Mohammad Shifat-E-Rabbi, Richard G. Spencer, Kenneth L. Urish, Gustavo K. Rohde | 2020 | Proceedings of the National Academy of Sciences | vol 117 | no 40 | pages 24709--24719 | doi 10.1073/pnas.1917405117
OpenAlex: ratio 1.00: Enabling early detection of osteoarthritis from presymptomatic cartilage texture maps via transport-based learning | Shinjini Kundu, Beth G. Ashinsky, Mustapha Bouhrara, Erik B. Dam, Shadpour Demehri, Mohammad Shifat<hyphen>E<hyphen>Rabbi, Richard G. S. Spencer, Kenneth L. Urish, Gustavo Kunde Rohde | 2020 | Proceedings of the National Academy of Sciences | vol 117 | no 40 | pages 24709--24719 | doi 10.1073/pnas.1917405117 | OpenAlex W3087326040 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7547154/
Semantic Scholar: ratio 1.00: Enabling early detection of osteoarthritis from presymptomatic cartilage texture maps via transport-based learning | Shinjini Kundu, B. Ashinsky, M. Bouhrara, E. Dam, S. Demehri, Mohammad Shifat-E.-Rabbi, R. Spencer, K. Urish, G. Rohde | 2020 | Proceedings of the National Academy of Sciences of the United States of America | vol 117 | pages 24709--24719 | doi 10.1073/pnas.1917405117 | Semantic Scholar 7b2bd3768f328cff5664e48b4b13be3fc67211c9 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7547154/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gong2026robust
Command: python3 lookup resolve '10.3389/fonc.2025.1700447'
```
Crossref: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Hanying Gong, Jie Luo, Shufan Mao, Yanchen Gong, Yu Lu, Jian Ding, Xiang Zhu | 2026 | Frontiers in Oncology | vol 15 | doi 10.3389/fonc.2025.1700447
OpenAlex: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Hanying Gong, Jun Luo, Shufan Mao, Yanchen Gong, Yu Lu, Jian Ding, Xiang Zhu | 2026 | Frontiers in Oncology | vol 15 | pages 1700447--1700447 | doi 10.3389/fonc.2025.1700447 | OpenAlex W7126042104 | open access https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1700447/pdf
Semantic Scholar: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Han-Ying Gong, Jie Luo, Shufan Mao, Yanan Gong, Yu Lu, Jian Ding, Xiang Zhu | 2026 | Frontiers in Oncology | vol 15 | doi 10.3389/fonc.2025.1700447 | Semantic Scholar 6a61c6836e5159c5e80d457fa948bd2ab017feb3 | open access https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1700447/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### mazelet2026learning
Command: python3 lookup resolve '2605.20883'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2605.20883 | arXiv 2605.20883 | OpenAlex W7161973664 | open access https://arxiv.org/pdf/2605.20883
Semantic Scholar: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv.org | vol abs/2605.20883 | doi 10.48550/arXiv.2605.20883 | arXiv 2605.20883 | Semantic Scholar 932daed15a6e652d64deee16cde7602386c7e063
arXiv: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv 2605.20883
```
Exit status: 0

### belkhatir2022wasserstein
Command: python3 lookup resolve '10.1016/j.compmedimag.2022.102129'
```
Crossref: ratio 1.00: Wasserstein-based texture analysis in radiomic studies | Zehor Belkhatir, Ra<latin small letter u with acute>l San Jos<latin small letter e with acute> Est<latin small letter e with acute>par, Allen R. Tannenbaum | 2022 | Computerized Medical Imaging and Graphics | vol 102 | pages 102129 | doi 10.1016/j.compmedimag.2022.102129
OpenAlex: ratio 1.00: Wasserstein-based texture analysis in radiomic studies | Zehor Belkhatir, Ra<latin small letter u with acute>l San Jo<latin small letter s with acute>e Est<latin small letter e with acute>par, Allen Tannenbaum | 2022 | Computerized Medical Imaging and Graphics | vol 102 | pages 102129--102129 | doi 10.1016/j.compmedimag.2022.102129 | OpenAlex W4306767793 | open access https://www.sciencedirect.com/science/article/pii/S0895611122000994/pdf
Semantic Scholar: ratio 1.00: Wasserstein-based texture analysis in radiomic studies | Z. Belkhatir, Ra<latin small letter u with acute>l San Jos<latin small letter e with acute> Est<latin small letter e with acute>par, A. Tannenbaum | 2022 | Comput. Medical Imaging Graph. | vol 102 | pages 102129 | doi 10.1016/j.compmedimag.2022.102129 | Semantic Scholar 6371fe7d39af4b20ccc6e76fad7448a7ebded86d | open access https://www.sciencedirect.com/science/article/pii/S0895611122000994/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### barbarant2026functional
Command: python3 lookup resolve '10.64898/2026.05.21.726781'
```
Crossref: ratio 1.00: Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders | Pierre-Louis Barbarant, Florent Meyniel, Bertrand Thirion | 2026 | doi 10.64898/2026.05.21.726781
OpenAlex: ratio 1.00: Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders | Pierre-Louis Barbarant, Florent Meyniel, Bertrand Thirion | 2026 | bioRxiv (Cold Spring Harbor Laboratory) | doi 10.64898/2026.05.21.726781 | OpenAlex W7162393221 | open access https://doi.org/10.64898/2026.05.21.726781
Semantic Scholar: ratio 1.00: Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders | Pierre-Louis Barbarant, F. Meyniel, Bertrand Thirion | 2026 | bioRxiv | doi 10.64898/2026.05.21.726781 | Semantic Scholar a7be9d88b1f97a6f7b7df169d4a269bde4ff7811 | open access https://doi.org/10.64898/2026.05.21.726781
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### mi2017optimal
Command: python3 lookup resolve '10.1109/ICCV.2017.29'
```
Crossref: ratio 1.00: An Optimal Transportation Based Univariate Neuroimaging Index | Liang Mi, Wen Zhang, Junwei Zhang, Yonghui Fan, Dhruman Goradia, Kewei Chen, Eric M. Reiman, Xianfeng Gu, Yalin Wang | 2017 | 2017 IEEE International Conference on Computer Vision (ICCV) | pages 182--191 | doi 10.1109/iccv.2017.29
OpenAlex: ratio 1.00: An Optimal Transportation Based Univariate Neuroimaging Index | Liang Mi, Wen Zhang, Junwei Zhang, Yonghui Fan, Dhruman D. Goradia, Kewei Chen, Eric M. Reiman, Xianfeng David Gu, Yalin Wang | 2017 | IEEE/CVF International Conference on Computer Vision (ICCV) | vol 2017 | pages 182--191 | doi 10.1109/iccv.2017.29 | OpenAlex W2779794151 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/5719504
Semantic Scholar: ratio 1.00: An Optimal Transportation based Univariate Neuroimaging Index | Liang Mi, Wen Zhang, Junwei Zhang, Yonghui Fan, Dhruman D. Goradia, K. Chen, E. Reiman, X. Gu, Y. Wang | 2017 | IEEE International Conference on Computer Vision | vol 2017 | pages 182--191 | doi 10.1109/ICCV.2017.29 | Semantic Scholar e2b05f3cf4b2238175eaef2ef464c360ee9bbbba | open access https://www.ncbi.nlm.nih.gov/pmc/articles/5719504
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gerber2018exploratory
Command: python3 lookup resolve '10.1007/978-3-030-00931-1_53'
```
Crossref: ratio 1.00: Exploratory Population Analysis with Unbalanced Optimal Transport | Samuel Gerber, Marc Niethammer, Martin Styner, Stephen Aylward | 2018 | Lecture Notes in Computer Science | pages 464--472 | doi 10.1007/978-3-030-00931-1_53
OpenAlex: ratio 1.00: Exploratory Population Analysis with Unbalanced Optimal Transport | Samuel Gerber, Marc Niethammer, Martin Andreas Styner, Stephen Aylward | 2018 | Lecture notes in computer science | vol 11072 | pages 464--472 | doi 10.1007/978-3-030-00931-1_53 | OpenAlex W2891515476 | open access https://link.springer.com/content/pdf/10.1007/978-3-030-00931-1_53.pdf
Semantic Scholar: ratio 1.00: Exploratory Population Analysis with Unbalanced Optimal Transport | Samuel Gerber, M. Niethammer, M. Styner, S. Aylward | 2018 | International Conference on Medical Image Computing and Computer-Assisted Intervention | vol 11072 | pages 464--472 | doi 10.1007/978-3-030-00931-1_53 | Semantic Scholar c6a3d4e4b42d25e1a3008b5f8c7e439b404b886a | open access https://link.springer.com/content/pdf/10.1007/978-3-030-00931-1_53.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zaheer2017deep
Command: python3 lookup resolve '1703.06114'
```
Crossref: not found
OpenAlex: ratio 1.00: Deep Sets | Manzil Zaheer, Satwik Kottur, Siamak Ravanbakhsh, Barnab<latin small letter a with acute>s P<latin small letter o with acute>czos, Ruslan Salakhutdinov, Alexander Johannes Smola | 2017 | arXiv (Cornell University) | doi 10.48550/arxiv.1703.06114 | arXiv 1703.06114 | OpenAlex W4299457904 | open access https://arxiv.org/pdf/1703.06114
Semantic Scholar: ratio 1.00: Deep Sets | M. Zaheer, S. Kottur, Siamak Ravanbakhsh, B. P<latin small letter o with acute>czos, R. Salakhutdinov, Alex Smola | 2017 | arXiv 1703.06114 | Semantic Scholar de4edcddc028b0088f7ee44ae6e4be261f20b6f6
arXiv: ratio 1.00: Deep Sets | Manzil Zaheer, Satwik Kottur, Siamak Ravanbakhsh, Barnabas Poczos, Ruslan Salakhutdinov, Alexander Smola | 2017 | arXiv 1703.06114
```
Exit status: 0

### lee2019set
Command: python3 lookup resolve '1810.00825'
```
Crossref: not found
OpenAlex: ratio 1.00: Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks | Juho Lee, Yoonho Lee, Jungtaek Kim, Adam R. Kosiorek, Seungjin Choi, Yee Whye Teh | 2018 | Oxford University Research Archive (ORA) (University of Oxford) | doi 10.48550/arxiv.1810.00825 | arXiv 1810.00825 | OpenAlex W2894384847 | open access https://ora.ox.ac.uk/objects/uuid:8aa5f831-66b2-46ca-89ea-7b2384064db3/files/s8k71nh51g
Semantic Scholar: DOI_MISMATCH, ratio 0.31: Set Transformer | Juho Lee, Yoonho Lee, Jungtaek Kim, Adam R. Kosiorek, Seung-Jin Choi, Y. Teh | 2018 | International Conference on Machine Learning | vol abs/1810.00825 | doi 10.48550/arXiv.1810.00825 | arXiv 1810.00825 | Semantic Scholar 512b8ef0002e0bfd0ecb5ab17d533c1762eb9786
arXiv: ratio 1.00: Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks | Juho Lee, Yoonho Lee, Jungtaek Kim, Adam R. Kosiorek, Seungjin Choi, Yee Whye Teh | 2018 | arXiv 1810.00825
```
Exit status: 0

### murphy2019janossy
Command: python3 lookup resolve '1811.01900'
```
Crossref: not found
OpenAlex: ratio 1.00: Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs | Ryan L. Murphy, Balasubramaniam Srinivasan, Vinayak Rao, Bruno Ribeiro | 2018 | arXiv (Cornell University) | doi 10.48550/arxiv.1811.01900 | arXiv 1811.01900 | OpenAlex W2899038170 | open access https://arxiv.org/pdf/1811.01900
Semantic Scholar: ratio 1.00: Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs | R. Murphy, Balasubramaniam Srinivasan, Vinayak A. Rao, Bruno Ribeiro | 2018 | International Conference on Learning Representations | vol abs/1811.01900 | doi 10.48550/arXiv.1811.01900 | arXiv 1811.01900 | Semantic Scholar de9550945b2f631c541c299114a770c4f47f9616 | open access http://arxiv.org/pdf/1811.01900
arXiv: ratio 1.00: Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs | Ryan L. Murphy, Balasubramaniam Srinivasan, Vinayak Rao, Bruno Ribeiro | 2018 | arXiv 1811.01900
```
Exit status: 0

### amir2023neural
Command: python3 lookup resolve '10.52202/075280-1845'
```
Crossref: ratio 1.00: Neural Injective Functions for Multisets, Measures and Graphs via a Finite Witness Theorem | Tal Amir, Steven Gortler, Ilai Avni, Ravina Ravina, Nadav Dym | 2023 | Advances in Neural Information Processing Systems 36 | pages 42516--42551 | doi 10.52202/075280-1845
OpenAlex: ratio 1.00: Neural Injective Functions for Multisets, Measures and Graphs via a Finite Witness Theorem | Tal Amir, Steven Gortler, Ilai Avni, Ravina Ravina, Nadav Dym | 2023 | neural information processing systems | pages 42516--42551 | doi 10.52202/075280-1845 | OpenAlex W7133227055 | open access https://arxiv.org/pdf/2306.06529
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wang2024polynomial
Command: python3 lookup resolve '2307.04001'
```
Crossref: not found
OpenAlex: ratio 1.00: Polynomial Width is Sufficient for Set Representation with High-dimensional Features | Peihao Wang, Shenghao Yang, Shu Li, Zhangyang Wang, Li, Pan | 2023 | International Conference on Learning Representations | doi 10.48550/arxiv.2307.04001 | arXiv 2307.04001 | OpenAlex W4383987642 | open access https://proceedings.iclr.cc/paper_files/paper/2024/hash/e55b33430e344a1ee23710415b1c9d87-Abstract-Conference.html
Semantic Scholar: ratio 1.00: Polynomial Width is Sufficient for Set Representation with High-dimensional Features | Pei-Hao Wang, Sheng-Hao Yang, Shu Li, Zhang-Yang Wang, Pan Li | 2023 | International Conference on Learning Representations | vol abs/2307.04001 | doi 10.48550/arXiv.2307.04001 | arXiv 2307.04001 | Semantic Scholar 2d401d97bec4b6871fa4bcfef385107b5e27bb30 | open access https://arxiv.org/pdf/2307.04001
arXiv: ratio 1.00: Polynomial Width is Sufficient for Set Representation with High-dimensional Features | Peihao Wang, Shenghao Yang, Shu Li, Zhangyang Wang, Pan Li | 2023 | arXiv 2307.04001
```
Exit status: 0

### qi2017pointnet
Command: python3 lookup resolve '10.1109/CVPR.2017.16'
```
Crossref: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | R. Qi Charles, Hao Su, Mo Kaichun, Leonidas J. Guibas | 2017 | 2017 IEEE Conference on Computer Vision and Pattern Recognition (CVPR) | pages 77--85 | doi 10.1109/cvpr.2017.16
OpenAlex: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | Raffaelli Charles, Hao Su, Kaichun Mo, Leonidas J. Guibas | 2017 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | pages 77--85 | doi 10.1109/cvpr.2017.16 | OpenAlex W2560609797
Semantic Scholar: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | R. Q. Charles, Hao Su, K. Mo, L. Guibas | 2016 | Computer Vision and Pattern Recognition | pages 77--85 | doi 10.1109/CVPR.2017.16 | arXiv 1612.00593 | Semantic Scholar d997beefc0922d97202789d2ac307c55c2c52fba
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### qi2017pointnetpp
Command: python3 lookup resolve '1706.02413'
```
Crossref: not found
OpenAlex: ratio 1.00: PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space | Charles R. Qi, Li Yi, Hao Su, Leonidas J. Guibas | 2017 | arXiv (Cornell University) | doi 10.48550/arxiv.1706.02413 | arXiv 1706.02413 | OpenAlex W2624503621 | open access https://arxiv.org/pdf/1706.02413
Semantic Scholar: ratio 1.00: PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space | C. Qi, L. Yi, Hao Su, L. Guibas | 2017 | Neural Information Processing Systems | pages 5099--5108 | doi 10.48550/arXiv.1706.02413 | arXiv 1706.02413 | Semantic Scholar 8674494bd7a076286b905912d26d47f7501c4046
arXiv: ratio 1.00: PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space | Charles R. Qi, Li Yi, Hao Su, Leonidas J. Guibas | 2017 | arXiv 1706.02413
```
Exit status: 0

### wang2019dynamic
Command: python3 lookup resolve '10.1145/3326362'
```
Crossref: ratio 1.00: Dynamic Graph CNN for Learning on Point Clouds | Yue Wang, Yongbin Sun, Ziwei Liu, Sanjay E. Sarma, Michael M. Bronstein, Justin M. Solomon | 2019 | ACM Transactions on Graphics | vol 38 | no 5 | pages 1--12 | doi 10.1145/3326362
OpenAlex: ratio 1.00: Dynamic Graph CNN for Learning on Point Clouds | Yue Wang, Yongbin Sun, Ziwei Liu, Sanjay Emani Sarma, Michael M. Bronstein, Justin Solomon | 2019 | ACM Transactions on Graphics | vol 38 | no 5 | pages 1--12 | doi 10.1145/3326362 | OpenAlex W2979750740 | open access https://dl.acm.org/doi/pdf/10.1145/3326362
Semantic Scholar: ratio 1.00: Dynamic Graph CNN for Learning on Point Clouds | Yue Wang, Yongbin Sun, Zi-Wei Liu, S. Sarma, M. Bronstein, J. Solomon | 2018 | ACM Transactions on Graphics | vol 38 | pages 1--12 | doi 10.1145/3326362 | arXiv 1801.07829 | Semantic Scholar e1799aaf23c12af6932dc0ef3dfb1638f01413d1 | open access https://dl.acm.org/doi/pdf/10.1145/3326362
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhao2021point
Command: python3 lookup resolve '10.1109/ICCV48922.2021.01595'
```
Crossref: ratio 1.00: Point Transformer | Hengshuang Zhao, Li Jiang, Jiaya Jia, Philip Torr, Vladlen Koltun | 2021 | 2021 IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16239--16248 | doi 10.1109/iccv48922.2021.01595
OpenAlex: ratio 1.00: Point Transformer | Hengshuang Zhao, Li Jiang, Jiaya Jia, Philip H. S. Torr, Vladlen Koltun | 2021 | IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16239--16248 | doi 10.1109/iccv48922.2021.01595 | OpenAlex W4214755140
Semantic Scholar: ratio 1.00: Point Transformer | Heng-Shuang Zhao, Li Jiang, Jia-Ya Jia, P. Torr, V. Koltun | 2020 | IEEE International Conference on Computer Vision | pages 16239--16248 | doi 10.1109/ICCV48922.2021.01595 | arXiv 2012.09164 | Semantic Scholar ea249d27148fff074af742f70f88aa5878d29ae6
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ilse2018attention
Command: python3 lookup resolve '1802.04712'
```
Crossref: not found
OpenAlex: ratio 1.00: Attention-based Deep Multiple Instance Learning | Maximilian Ilse, Jakub M. Tomczak, Max Welling | 2018 | arXiv (Cornell University) | doi 10.48550/arxiv.1802.04712 | arXiv 1802.04712 | OpenAlex W2785934082 | open access https://arxiv.org/pdf/1802.04712
Semantic Scholar: not found
arXiv: ratio 1.00: Attention-based Deep Multiple Instance Learning | Maximilian Ilse, Jakub M. Tomczak, Max Welling | 2018 | arXiv 1802.04712
```
Exit status: 0

### muandet2017kernel
Command: python3 lookup resolve '10.1561/2200000060'
```
Crossref: ratio 1.00: Kernel Mean Embedding of Distributions: A Review and Beyond | Krikamol Muandet, Kenji Fukumizu, Bharath Sriperumbudur, Bernhard Sch<latin small letter o with diaeresis>lkopf | 2017 | Foundations and Trends<registered sign> in Machine Learning | vol 10 | no 1-2 | pages 1--141 | doi 10.1561/2200000060
OpenAlex: ratio 1.00: Kernel Mean Embedding of Distributions: A Review and Beyond | Krikamol Muandet, Kenji Fukumizu, Bharath K. Sriperumbudur, Bernhard Sch<latin small letter o with diaeresis>lkopf | 2017 | now publishers, Inc. eBooks | vol 10 | no 1-2 | pages 1--141 | doi 10.1561/9781680832891 | OpenAlex W2418306335 | open access https://arxiv.org/pdf/1605.09522
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### szabo2016learning
Command: python3 lookup resolve '1411.2066'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning Theory for Distribution Regression | Zolt<latin small letter a with acute>n Szab<latin small letter o with acute>, Bharath K. Sriperumbudur, Barnab<latin small letter a with acute>s P<latin small letter o with acute>czos, Arthur Gretton | 2014 | arXiv (Cornell University) | vol 17 | no 1 | pages 5272--5311 | doi 10.48550/arxiv.1411.2066 | arXiv 1411.2066 | OpenAlex W1689407543 | open access https://arxiv.org/pdf/1411.2066
Semantic Scholar: ratio 1.00: Learning Theory for Distribution Regression | Z. Szab<latin small letter o with acute>, Bharath K. Sriperumbudur, B. P<latin small letter o with acute>czos, A. Gretton | 2014 | Journal of machine learning research | vol abs/1411.2066 | doi 10.48550/arXiv.1411.2066 | arXiv 1411.2066 | Semantic Scholar e215b1b54f5a1682466a0e4034984dda61d3c6f8 | open access http://arxiv.org/pdf/1411.2066
arXiv: ratio 1.00: Learning Theory for Distribution Regression | Zoltan Szabo, Bharath Sriperumbudur, Barnabas Poczos, Arthur Gretton | 2014 | arXiv 1411.2066
```
Exit status: 0

### campanella2019clinical
Command: python3 lookup resolve '10.1038/s41591-019-0508-1'
```
Crossref: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | Gabriele Campanella, Matthew G. Hanna, Luke Geneslaw, Allen Miraflor, Vitor Werneck Krauss Silva, Klaus J. Busam, Edi Brogi, Victor E. Reuter, David S. Klimstra, Thomas J. Fuchs | 2019 | Nature Medicine | vol 25 | no 8 | pages 1301--1309 | doi 10.1038/s41591-019-0508-1
OpenAlex: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | Gabriele S. V. Campanella, Matthew G. Hanna, Luke Geneslaw, Allen P. Miraflor, Vitor Werneck Krauss Silva, Klaus Johannes BUSAM, Edi Brogi, Victor E. Reuter, David S. Klimstra, Thomas J. Fuchs | 2019 | Nature Medicine | vol 25 | no 8 | pages 1301--1309 | doi 10.1038/s41591-019-0508-1 | OpenAlex W2956228567 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7418463/
Semantic Scholar: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | G. Campanella, M. Hanna, L. Geneslaw, Allen P. Miraflor, Vitor Werneck Krauss Silva, K. Busam, E. Brogi, V. Reuter, D. Klimstra, Thomas J. Fuchs | 2019 | Nature Medicine | vol 25 | pages 1301--1309 | doi 10.1038/s41591-019-0508-1 | Semantic Scholar addae423490bbe82da4fb2fc265237178686b4e8 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7418463/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### lu2021data
Command: python3 lookup resolve '10.1038/s41551-020-00682-w'
```
Crossref: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Y. Chen, Richard J. Chen, Matteo Barbieri, Faisal Mahmood | 2021 | Nature Biomedical Engineering | vol 5 | no 6 | pages 555--570 | doi 10.1038/s41551-020-00682-w
OpenAlex: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Chen, Richard J. Chen, Matteo Barbieri, Faisal Mahmood | 2021 | Nature Biomedical Engineering | vol 5 | no 6 | pages 555--570 | doi 10.1038/s41551-020-00682-w | OpenAlex W3018295606 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8711640/
Semantic Scholar: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Y. Chen, Richard J. Chen, Matteo Barbieri, Faisal Mahmood | 2020 | Nature Biomedical Engineering | vol 5 | pages 555--570 | doi 10.1038/s41551-020-00682-w | arXiv 2004.09666 | Semantic Scholar 3e358c3033908a9506e7f1e3cf29283e359f43d6 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8711640/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gutierrezbecker2021discriminative
Command: python3 lookup resolve '10.1016/j.media.2020.101852'
```
Crossref: ratio 1.00: Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks | Benjam<latin small letter i with acute>n Guti<latin small letter e with acute>rrez-Becker, Ignacio Sarasua, Christian Wachinger | 2021 | Medical Image Analysis | vol 67 | pages 101852 | doi 10.1016/j.media.2020.101852
OpenAlex: ratio 1.00: Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks | Benjam<latin small letter i with acute>n Guti<latin small letter e with acute>rrez-Becker, Ignacio Saras<latin small letter u with acute>a, Christian Wachinger | 2020 | Medical Image Analysis | vol 67 | pages 101852--101852 | doi 10.1016/j.media.2020.101852 | OpenAlex W3092480895 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841520302164
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### sarasua2022hippocampal
Command: python3 lookup resolve '10.1038/s41598-022-12533-6'
```
Crossref: ratio 1.00: Hippocampal representations for deep learning on Alzheimer<right single quotation mark>s disease | Ignacio Sarasua, Sebastian P<latin small letter o with diaeresis>lsterl, Christian Wachinger | 2022 | Scientific Reports | vol 12 | no 1 | doi 10.1038/s41598-022-12533-6
OpenAlex: ratio 1.00: Hippocampal representations for deep learning on Alzheimer<right single quotation mark>s disease | Ignacio Saras<latin small letter u with acute>a, Sebastian P<latin small letter o with diaeresis>lsterl, Christian Wachinger | 2022 | Scientific Reports | vol 12 | no 1 | pages 8619--8619 | doi 10.1038/s41598-022-12533-6 | OpenAlex W4281252270 | open access https://www.nature.com/articles/s41598-022-12533-6.pdf
Semantic Scholar: ratio 1.00: Hippocampal representations for deep learning on Alzheimer<right single quotation mark>s disease | Ignacio Saras<latin small letter u with acute>a, S. P<latin small letter o with diaeresis>lsterl, C. Wachinger | 2021 | Scientific Reports | vol 12 | doi 10.1038/s41598-022-12533-6 | Semantic Scholar 715608ba0f44ebdf22bb9a38483b40e7f515ac86 | open access https://www.nature.com/articles/s41598-022-12533-6.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2021aminn
Command: python3 lookup resolve '10.1007/978-3-030-87240-3_72'
```
Crossref: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jianan Chen, Helen M. C. Cheung, Laurent Milot, Anne L. Martel | 2021 | Lecture Notes in Computer Science | pages 752--761 | doi 10.1007/978-3-030-87240-3_72
OpenAlex: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jianan Chen, Helen Cheung, Laurent M. Milot, Anne Louise Martel | 2021 | Lecture notes in computer science | pages 752--761 | doi 10.1007/978-3-030-87240-3_72 | OpenAlex W3202344381
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### liao2019evaluate
Command: python3 lookup resolve '10.1109/TNNLS.2019.2892409'
```
Crossref: ratio 1.00: Evaluate the Malignancy of Pulmonary Nodules Using the 3-D Deep Leaky Noisy-OR Network | Fangzhou Liao, Ming Liang, Zhe Li, Xiaolin Hu, Sen Song | 2019 | IEEE Transactions on Neural Networks and Learning Systems | vol 30 | no 11 | pages 3484--3495 | doi 10.1109/tnnls.2019.2892409
OpenAlex: ratio 1.00: Evaluate the Malignancy of Pulmonary Nodules Using the 3-D Deep Leaky Noisy-OR Network | Fangzhou Liao, Ming Liang, Zhe Li, Xiaolin Hu, Sen Song | 2019 | IEEE Transactions on Neural Networks and Learning Systems | vol 30 | no 11 | pages 3484--3495 | doi 10.1109/tnnls.2019.2892409 | OpenAlex W2769848455 | open access https://arxiv.org/pdf/1711.08324
Semantic Scholar: ratio 1.00: Evaluate the Malignancy of Pulmonary Nodules Using the 3-D Deep Leaky Noisy-OR Network | Fangzhou Liao, Ming Liang, Zhe Li, Xiao-Lin Hu, Sen Song | 2017 | IEEE Transactions on Neural Networks and Learning Systems | vol 30 | pages 3484--3495 | doi 10.1109/TNNLS.2019.2892409 | arXiv 1711.08324 | Semantic Scholar 707ef87813de2c792820121c23868fab569ec559 | open access https://arxiv.org/pdf/1711.08324
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wagstaff2019limitations
Command: python3 lookup resolve '1901.09006'
```
Crossref: not found
OpenAlex: ratio 1.00: On the Limitations of Representing Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Ingmar Posner, Michael A. Osborne | 2019 | Oxford University Research Archive (ORA) (University of Oxford) | pages 6487--6494 | doi 10.48550/arxiv.1901.09006 | arXiv 1901.09006 | OpenAlex W2913668534 | open access https://ora.ox.ac.uk/objects/uuid:3d5730ad-0070-46e9-b173-5b139d122dba/files/mdb1a40b64d60b73dfda93fbcd08485f1
Semantic Scholar: ratio 1.00: On the Limitations of Representing Functions on Sets | Edward Wagstaff, F. Fuchs, Martin Engelcke, I. Posner, Michael A. Osborne | 2019 | International Conference on Machine Learning | pages 6487--6494 | doi 10.48550/arXiv.1901.09006 | arXiv 1901.09006 | Semantic Scholar bc6f7ba757b437842564cd028881a509c225ce26
arXiv: ratio 1.00: On the Limitations of Representing Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Ingmar Posner, Michael Osborne | 2019 | arXiv 1901.09006
```
Exit status: 0

### raff2023reproducibility
Command: python3 lookup resolve '10.52202/075280-0596'
```
Crossref: ratio 1.00: Reproducibility in Multiple Instance Learning: A Case For Algorithmic Unit Tests | Edward Raff, James Holt | 2023 | Advances in Neural Information Processing Systems 36 | pages 13530--13544 | doi 10.52202/075280-0596
OpenAlex: ratio 1.00: Reproducibility in Multiple Instance Learning: A Case For Algorithmic Unit Tests | Edward Raff, James Holt | 2023 | neural information processing systems | pages 13530--13544 | doi 10.52202/075280-0596 | OpenAlex W7133184161 | open access https://arxiv.org/pdf/2310.17867
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### davidson2025holder
Command: python3 lookup resolve '2406.06984'
```
Crossref: not found
OpenAlex: ratio 1.00: On the H<latin small letter o with diaeresis>lder Stability of Multiset and Graph Neural Networks | Yair Davidson, Nadav Dym | 2024 | International Conference on Learning Representations | doi 10.48550/arxiv.2406.06984 | arXiv 2406.06984 | OpenAlex W4399598149 | open access https://proceedings.iclr.cc/paper_files/paper/2025/hash/89d0d5c2f720921df93bbb8fef514571-Abstract-Conference.html
Semantic Scholar: ratio 1.00: On the H<latin small letter o with diaeresis>lder Stability of Multiset and Graph Neural Networks | Yair Davidson, Nadav Dym | 2024 | International Conference on Learning Representations | vol abs/2406.06984 | doi 10.48550/arXiv.2406.06984 | arXiv 2406.06984 | Semantic Scholar f34f42d40fea777f17a12e09ca8b8b6ddcacadc7
arXiv: ratio 1.00: On the H<latin small letter o with diaeresis>lder Stability of Multiset and Graph Neural Networks | Yair Davidson, Nadav Dym | 2024 | arXiv 2406.06984
```
Exit status: 0

### li2021closer
Command: python3 lookup resolve '10.1109/ICCV48922.2021.01591'
```
Crossref: ratio 1.00: A Closer Look at Rotation-invariant Deep Point Cloud Analysis | Feiran Li, Kent Fujiwara, Fumio Okura, Yasuyuki Matsushita | 2021 | 2021 IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16198--16207 | doi 10.1109/iccv48922.2021.01591
OpenAlex: ratio 1.00: A Closer Look at Rotation-invariant Deep Point Cloud Analysis | Feiran Li, Kent Fujiwara, Fumio Okura, Yasuyuki Matsushita | 2021 | IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16198--16207 | doi 10.1109/iccv48922.2021.01591 | OpenAlex W3203310607
Semantic Scholar: ratio 1.00: A Closer Look at Rotation-invariant Deep Point Cloud Analysis | Fei-Ran Li, Kent Fujiwara, Fumio Okura, Y. Matsushita | 2021 | IEEE International Conference on Computer Vision | pages 16198--16207 | doi 10.1109/ICCV48922.2021.01591 | Semantic Scholar cd6b56319f85d0ae9266711247ad3e22496e8ab4
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### karimzadeh2026revisiting
Command: python3 lookup resolve '10.1088/1361-6560/ae7955'
```
Crossref: ratio 1.00: Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study | Reza Karimzadeh, Setareh Hasanabadi, Maryam Cheraghi, Mehrdad Bakhshayesh Karam, Hossein Arabi, Bulat Ibragimov | 2026 | Physics in Medicine &amp; Biology | vol 71 | no 12 | pages 125014 | doi 10.1088/1361-6560/ae7955
OpenAlex: ratio 1.00: Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study | Reza Karimzadeh, Saeed Shafiee Hasanabadi, Maryam Cheraghi, Mehrdad Bakhshayesh Karam, Hossein Arabi, Bulat Ibragimov | 2026 | Physics in Medicine and Biology | vol 71 | no 12 | pages 125014--125014 | doi 10.1088/1361-6560/ae7955 | OpenAlex W7163639403 | open access https://iopscience.iop.org/article/10.1088/1361-6560/ae7955/pdf
Semantic Scholar: ratio 1.00: Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study | Reza Karimzadeh, S. Hasanabadi, Maryam Cheraghi, M. Karam, Hossein Arabi, B. Ibragimov | 2026 | Physics in Medicine and Biology | vol 71 | doi 10.1088/1361-6560/ae7955 | Semantic Scholar 74f3f1dd7f19a09b1361f61914d94094d2817f7f | open access https://iopscience.iop.org/article/10.1088/1361-6560/ae7955/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### harvey2026multi
Command: python3 lookup resolve '2604.26807'
```
Crossref: not found
OpenAlex: ratio 1.00: A Multi-Dataset Benchmark of Multiple Instance Learning for 3D Neuroimage Classification | Ethan Harvey, Dennis Johan Loevlie, Amir Ali Satani, Wansu Chen, David M. Kent, Michael C. Hughes | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2604.26807 | arXiv 2604.26807 | OpenAlex W7158475607 | open access https://arxiv.org/pdf/2604.26807
Semantic Scholar: ratio 1.00: A Multi-Dataset Benchmark of Multiple Instance Learning for 3D Neuroimage Classification | Ethan Harvey, Dennis Johan Loevlie, Amir A. Satani, Wan-Su Chen, D. Kent, M. Hughes | 2026 | arXiv.org | vol abs/2604.26807 | doi 10.48550/arXiv.2604.26807 | arXiv 2604.26807 | Semantic Scholar 602186ca3351af70e27c8ac90f158ee24f8f69ed
arXiv: ratio 1.00: A Multi-Dataset Benchmark of Multiple Instance Learning for 3D Neuroimage Classification | Ethan Harvey, Dennis Johan Loevlie, Amir Ali Satani, Wansu Chen, David M. Kent, Michael C. Hughes | 2026 | arXiv 2604.26807
```
Exit status: 0

### avants2008symmetric
Command: python3 lookup resolve '10.1016/j.media.2007.06.004'
```
Crossref: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | B AVANTS, C EPSTEIN, M GROSSMAN, J GEE | 2008 | Medical Image Analysis | vol 12 | no 1 | pages 26--41 | doi 10.1016/j.media.2007.06.004
OpenAlex: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | Brian Avants, Charles L. Epstein, Murray Grossman, James C. Gee | 2007 | Medical Image Analysis | vol 12 | no 1 | pages 26--41 | doi 10.1016/j.media.2007.06.004 | OpenAlex W1970928383 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2276735/
Semantic Scholar: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | B. Avants, C. Epstein, M. Grossman, J. Gee | 2008 | Medical Image Anal. | vol 12 1 | pages 26--41 | doi 10.1016/j.media.2007.06.004 | Semantic Scholar 66b498a54843e14270b75f0c3c8fc65a0b2e1e98 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2276735/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### joshi2004unbiased
Command: python3 lookup resolve '10.1016/j.neuroimage.2004.07.068'
```
Crossref: ratio 1.00: Unbiased diffeomorphic atlas construction for computational anatomy | S. Joshi, Brad Davis, Matthieu Jomier, Guido Gerig | 2004 | NeuroImage | vol 23 | pages S151--S160 | doi 10.1016/j.neuroimage.2004.07.068
OpenAlex: ratio 1.00: Unbiased diffeomorphic atlas construction for computational anatomy | Sarang C. Joshi, Brad C. Davis, Matthieu Jomier, Guido Gerig | 2004 | NeuroImage | vol 23 | pages S151--S160 | doi 10.1016/j.neuroimage.2004.07.068 | OpenAlex W2121014637
Semantic Scholar: ratio 1.00: Unbiased diffeomorphic atlas construction for computational anatomy. | S. Joshi, B. Davis, Matthieu Jomier, G. Gerig | 2004 | NeuroImage | vol 23 Suppl 1 | pages S151--60 | doi 10.1016/J.NEUROIMAGE.2004.07.068 | Semantic Scholar ad7d62a47c7c1a61828112cce4aa9e8566558da9
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### balakrishnan2019voxelmorph
Command: python3 lookup resolve '10.1109/TMI.2019.2897538'
```
Crossref: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | Guha Balakrishnan, Amy Zhao, Mert R. Sabuncu, John Guttag, Adrian V. Dalca | 2019 | IEEE Transactions on Medical Imaging | vol 38 | no 8 | pages 1788--1800 | doi 10.1109/tmi.2019.2897538
OpenAlex: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | Guha Balakrishnan, Amy Zhao, Mert Rory Sabuncu, John V. Guttag, Adrian Vasile Dalca | 2019 | IEEE Transactions on Medical Imaging | vol 38 | no 8 | pages 1788--1800 | doi 10.1109/tmi.2019.2897538 | OpenAlex W2891631795 | open access https://arxiv.org/pdf/1809.05231
Semantic Scholar: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | G. Balakrishnan, Amy Zhao, M. Sabuncu, J. Guttag, Adrian V. Dalca | 2018 | IEEE Transactions on Medical Imaging | vol 38 | pages 1788--1800 | doi 10.1109/TMI.2019.2897538 | arXiv 1809.05231 | Semantic Scholar 6a88c8abd298b5e9ea7485f41a6a1b1e43b16d5f | open access https://arxiv.org/pdf/1809.05231
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dalca2019learning
Command: python3 lookup resolve '1908.02738'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning Conditional Deformable Templates with Convolutional Networks | Adrian Vasile Dalca, Marianne Rakic, John V. Guttag, Mert Rory Sabuncu | 2019 | arXiv (Cornell University) | vol 32 | pages 804--816 | doi 10.48550/arxiv.1908.02738 | arXiv 1908.02738 | OpenAlex W2965946035 | open access https://arxiv.org/pdf/1908.02738
Semantic Scholar: ratio 1.00: Learning Conditional Deformable Templates with Convolutional Networks | Adrian V. Dalca, Marianne Rakic, J. Guttag, M. Sabuncu | 2019 | Neural Information Processing Systems | vol abs/1908.02738 | doi 10.48550/arXiv.1908.02738 | arXiv 1908.02738 | Semantic Scholar 17c5e70bce680af4498f4fe2b5f2c64bdeb35053
arXiv: ratio 1.00: Learning Conditional Deformable Templates with Convolutional Networks | Adrian V. Dalca, Marianne Rakic, John Guttag, Mert R. Sabuncu | 2019 | arXiv 1908.02738
```
Exit status: 0

### abulnaga2025multimorph
Command: python3 lookup resolve '10.1109/CVPR52734.2025.02878'
```
Crossref: ratio 1.00: MultiMorph: On-Demand Atlas Construction | S. Mazdak Abulnaga, Andrew Hoopes, Neel Dey, Malte Hoffmann, Bruce Fischl, John Guttag, Adrian Dalca | 2025 | 2025 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR) | pages 30906--30917 | doi 10.1109/cvpr52734.2025.02878
OpenAlex: ratio 1.00: MultiMorph: On-Demand Atlas Construction | S. Mazdak Abulnaga, Andrew Hoopes, Neel Dey, Malte Hoffmann, Bruce R. Fischl, John V. Guttag, Adrian Vasile Dalca | 2025 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | vol 2025 | pages 30906--30917 | doi 10.1109/cvpr52734.2025.02878 | OpenAlex W4413145966 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13089913/pdf/nihms-2154554.pdf
Semantic Scholar: ratio 1.00: MultiMorph: On-demand Atlas Construction | S. M. Abulnaga, Andrew Hoopes, Neel Dey, Malte Hoffmann, Marianne Rakic, B. Fischl, J. Guttag, Adrian V. Dalca | 2025 | Computer Vision and Pattern Recognition | vol 2025 | pages 30906--30917 | doi 10.1109/CVPR52734.2025.02878 | arXiv 2504.00247 | Semantic Scholar 999d94690f9529d4cac842bf8a683de76cdbead3 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13089913/pdf/nihms-2154554.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ashburner2000voxel
Command: python3 lookup resolve '10.1006/nimg.2000.0582'
```
Crossref: ratio 1.00: Voxel-Based Morphometry<em dash>The Methods | John Ashburner, Karl J. Friston | 2000 | NeuroImage | vol 11 | no 6 | pages 805--821 | doi 10.1006/nimg.2000.0582
OpenAlex: ratio 1.00: Voxel-Based Morphometry<em dash>The Methods | John Ashburner, Karl John Friston | 2000 | NeuroImage | vol 11 | no 6 | pages 805--821 | doi 10.1006/nimg.2000.0582 | OpenAlex W2119848633
Semantic Scholar: ratio 1.00: Voxel-based morphometry--the methods. | J. Ashburner, Karl J. Friston | 2000 | NeuroImage | vol 11 6 Pt 1 | pages 805--21 | doi 10.1006/NIMG.2000.0582 | Semantic Scholar 236cb915a1724c4b9ec3e53cfed64ce169358cda | open access http://www.stat.wisc.edu/~mchung/teaching/MIA/reading/VBM.ashburner.2000.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bates2003voxel
Command: python3 lookup resolve '10.1038/nn1050'
```
Crossref: ratio 1.00: Voxel-based lesion<en dash>symptom mapping | Elizabeth Bates, Stephen M. Wilson, Ayse Pinar Saygin, Frederic Dick, Martin I. Sereno, Robert T. Knight, Nina F. Dronkers | 2003 | Nature Neuroscience | vol 6 | no 5 | pages 448--450 | doi 10.1038/nn1050
OpenAlex: ratio 1.00: Voxel-based lesion<en dash>symptom mapping | Elizabeth A. Bates, Stephen M. Wilson, Ay<latin small letter s with cedilla>e P<latin small letter dotless i>nar Sayg<latin small letter dotless i>n, Frederic Dick, Martin I. Sereno, Robert Thomas Knight, Nina F. Dronkers | 2003 | Nature Neuroscience | vol 6 | no 5 | pages 448--450 | doi 10.1038/nn1050 | OpenAlex W2153857579
Semantic Scholar: ratio 1.00: Voxel-based lesion<en dash>symptom mapping | E. Bates, S. Wilson, A. Saygin, F. Dick, M. Sereno, R. Knight, N. Dronkers | 2003 | Nature Neuroscience | vol 6 | pages 448--450 | doi 10.1038/nn1050 | Semantic Scholar bc690f553f329b497307f309738c6671ce25e733
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### simpson2013ensemble
Command: python3 lookup resolve '10.1109/TMI.2012.2236651'
```
Crossref: ratio 1.00: Ensemble Learning Incorporating Uncertain Registration | I. J. A. Simpson, M. W. Woolrich, J. L. R. Andersson, A. R. Groves, J. A. Schnabel | 2013 | IEEE Transactions on Medical Imaging | vol 32 | no 4 | pages 748--756 | doi 10.1109/tmi.2012.2236651
OpenAlex: ratio 1.00: Ensemble Learning Incorporating Uncertain Registration | Ivor Simpson, Mark W. Woolrich, Jesper Andersson, Adrian R. Groves, Julia A. Schnabel | 2012 | IEEE Transactions on Medical Imaging | vol 32 | no 4 | pages 748--756 | doi 10.1109/tmi.2012.2236651 | OpenAlex W1978054149
Semantic Scholar: ratio 1.00: Ensemble Learning Incorporating Uncertain Registration | Ivor J. A. Simpson, M. Woolrich, J. Andersson, A. Groves, J. Schnabel | 2013 | IEEE Transactions on Medical Imaging | vol 32 | pages 748--756 | doi 10.1109/TMI.2012.2236651 | Semantic Scholar a413da35e1ad87124e2befc6b6e35878ff658b59 | open access http://www0.cs.ucl.ac.uk/staff/I.Simpson/papers/ISimpsonTMI2013.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### lambin2012radiomics
Command: python3 lookup resolve '10.1016/j.ejca.2011.11.036'
```
Crossref: ratio 1.00: Radiomics: Extracting more information from medical images using advanced feature analysis | Philippe Lambin, Emmanuel Rios-Velazquez, Ralph Leijenaar, Sara Carvalho, Ruud G.P.M. van Stiphout, Patrick Granton, Catharina M.L. Zegers, Robert Gillies, Ronald Boellard, Andr<latin small letter e with acute> Dekker, Hugo J.W.L. Aerts | 2012 | European Journal of Cancer | vol 48 | no 4 | pages 441--446 | doi 10.1016/j.ejca.2011.11.036
OpenAlex: ratio 1.00: Radiomics: Extracting more information from medical images using advanced feature analysis | Philippe Lambin, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Sara Carvalho, Ruud G.P.M. van Stiphout, Patrick Vincent Granton, Catharina M.L. Zegers, Robert J. Gillies, Ronald Boellaard, Andre L.A.J. Dekker, Hugo J.W.L. Aerts | 2012 | European Journal of Cancer | vol 48 | no 4 | pages 441--446 | doi 10.1016/j.ejca.2011.11.036 | OpenAlex W2128739912 | open access http://www.ejcancer.com/article/S0959804911009993/pdf
Semantic Scholar: ratio 1.00: Radiomics: Extracting more information from medical images using advanced feature analysis | P. Lambin, E. Velazquez, R. Leijenaar, S. Carvalho, R. van Stiphout, P. Granton, C. Zegers, R. Gillies, Ronald Boellard, A. Dekker, H. Aerts | 2012 | European Journal of Cancer | vol 48 | pages 441--446 | doi 10.1016/j.ejca.2011.11.036 | Semantic Scholar 9971ff92d9d09b4736228bdbd7726e2e19b9aa2d | open access http://www.ejcancer.com/article/S0959804911009993/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### aerts2014decoding
Command: python3 lookup resolve '10.1038/ncomms5006'
```
Crossref: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | Hugo J. W. L. Aerts, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Chintan Parmar, Patrick Grossmann, Sara Carvalho, Johan Bussink, Ren<latin small letter e with acute> Monshouwer, Benjamin Haibe-Kains, Derek Rietveld, Frank Hoebers, Michelle M. Rietbergen, C. Ren<latin small letter e with acute> Leemans, Andre Dekker, John Quackenbush, Robert J. Gillies, Philippe Lambin | 2014 | Nature Communications | vol 5 | no 1 | doi 10.1038/ncomms5006
OpenAlex: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | Hugo J.W.L. Aerts, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Chintan Parmar, Patrick Gro<latin small letter sharp s>mann, Sara Carvalho, Johan Bussink, Ren<latin small letter e with acute> Monshouwer, Benjamin Haibe<hyphen>Kains, Derek H. F. Rietveld, Frank J P Hoebers, Michelle M. Rietbergen, Charles Ren<latin small letter e with acute> Leemans, Andre L.A.J. Dekker, John F Quackenbush, Robert J. Gillies, Philippe Lambin | 2014 | Nature Communications | vol 5 | no 1 | pages 4006--4006 | doi 10.1038/ncomms5006 | OpenAlex W2103004421 | open access https://www.nature.com/articles/ncomms5006.pdf
Semantic Scholar: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | H. Aerts, E. Velazquez, R. Leijenaar, C. Parmar, P. Grossmann, S. Carvalho, S. Cavalho, J. Bussink, R. Monshouwer, Benjamin Haibe-Kains, D. Rietveld, F. Hoebers, M. Rietbergen, C. Leemans, A. Dekker, John Quackenbush, R. Gillies, P. Lambin | 2014 | Nature Communications | vol 5 | doi 10.1038/ncomms5006 | Semantic Scholar 3b002068646831a6f59fabb6daeb0209ed54049d | open access https://www.nature.com/articles/ncomms5006.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### vangriethuysen2017computational
Command: python3 lookup resolve '10.1158/0008-5472.CAN-17-0339'
```
Crossref: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | Joost J.M. van Griethuysen, Andriy Fedorov, Chintan Parmar, Ahmed Hosny, Nicole Aucoin, Vivek Narayan, Regina G.H. Beets-Tan, Jean-Christophe Fillion-Robin, Steve Pieper, Hugo J.W.L. Aerts | 2017 | Cancer Research | vol 77 | no 21 | pages e104--e107 | doi 10.1158/0008-5472.can-17-0339
OpenAlex: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | Joost J. M. van Griethuysen, Andriy Fedorov, Chintan Parmar, Ahmed Hosny, Nicole Aucoin, Vivek Narayan, Regina G. H. Beets<hyphen>Tan, Jean<hyphen>Christophe Fillion<hyphen>Robin, Steve Pieper, Hugo J.W.L. Aerts | 2017 | Cancer Research | vol 77 | no 21 | pages e104--e107 | doi 10.1158/0008-5472.can-17-0339 | OpenAlex W2767128594 | open access https://cancerres.aacrjournals.org/content/canres/77/21/e104.full.pdf
Semantic Scholar: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | J. V. van Griethuysen, Andrey Fedorov, C. Parmar, A. Hosny, N. Aucoin, V. Narayan, R. Beets-Tan, J. Fillion-Robin, S. Pieper, H. Aerts | 2017 | Cancer Research | vol 77 | pages e104--e107 | doi 10.1158/0008-5472.CAN-17-0339 | Semantic Scholar c53fa445bee435f567828db3a0ede0f08abdd0d5 | open access https://cancerres.aacrjournals.org/content/canres/77/21/e104.full.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zwanenburg2020image
Command: python3 lookup resolve '10.1148/radiol.2020191145'
```
Crossref: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping | Alex Zwanenburg, Martin Valli<latin small letter e with grave>res, Mahmoud A. Abdalah, Hugo J. W. L. Aerts, Vincent Andrearczyk, Aditya Apte, Saeed Ashrafinia, Spyridon Bakas, Roelof J. Beukinga, Ronald Boellaard, Marta Bogowicz, Luca Boldrini, Ir<latin small letter e with grave>ne Buvat, Gary J. R. Cook, Christos Davatzikos, Adrien Depeursinge, Marie-Charlotte Desseroit, Nicola Dinapoli, Cuong Viet Dinh, Sebastian Echegaray, Issam El Naqa, Andriy Y. Fedorov, Roberto Gatta, Robert J. Gillies, Vicky Goh, Michael G<latin small letter o with diaeresis>tz, Matthias Guckenberger, Sung Min Ha, Mathieu Hatt, Fabian Isensee, Philippe Lambin, Stefan Leger, Ralph T.H. Leijenaar, Jacopo Lenkowicz, Fiona Lippert, Are Losneg<latin small letter a with ring above>rd, Klaus H. Maier-Hein, Olivier Morin, Henning M<latin small letter u with diaeresis>ller, Sandy Napel, Christophe Nioche, Fanny Orlhac, Sarthak Pati, Elisabeth A.G. Pfaehler, Arman Rahmim, Arvind U.K. Rao, Jonas Scherer, Muhammad Musib Siddique, Nanna M. Sijtsema, Jairo Socarras Fernandez, Emiliano Spezi, Roel J.H.M. Steenbakkers, Stephanie Tanadini-Lang, Daniela Thorwarth, Esther G.C. Troost, Taman Upadhaya, Vincenzo Valentini, Lisanne V. van Dijk, Joost van Griethuysen, Floris H.P. van Velden, Philip Whybra, Christian Richter, Steffen L<latin small letter o with diaeresis>ck | 2020 | Radiology | vol 295 | no 2 | pages 328--338 | doi 10.1148/radiol.2020191145
OpenAlex: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping | Alex Zwanenburg, Martin Valli<latin small letter e with grave>res, Mahmoud A. Abdalah, Hugo J.W.L. Aerts, Vincent Andrearczyk, Aditya Apte, Saeed Ashrafinia, Spyridon Bakas, Roelof J. Beukinga, Ronald Boellaard, Marta Bogowicz, Luca Boldrini, Ir<latin small letter e with grave>ne Buvat, Gary Cook, Christos A. Davatzikos, Adrien Depeursinge, Marie-Charlotte Desseroit, N. Dinapoli, Cuong Viet Dinh, Sebastian Echegaray, Issam El Naqa, Andriy Fedorov, Roberto Gatta, Robert J. Gillies, Vicky Goh, MICHAEL A. GOETZ, Matthias G<latin small letter u with diaeresis>ckenberger, Sung Min Ha, Mathieu Hatt, Fabian Isensee, Philippe Lambin, Stefan Leger, Ralph T. H. Leijenaar, Jacopo Lenkowicz, Fiona Lippert, Are Losneg<latin small letter a with ring above>rd, Klaus Hermann Maier-Hein, Olivier Morin, Henning M<latin small letter u with diaeresis>ller, Sandy A. Napel, Christophe Nioche, Fanny Orlhac, Sarthak Pati, Elisabeth A. G. Pfaehler, Arman Rahmim, Arvind U K Rao, Jonas Scherer, Muhammad Musib Siddique, Nanna Maria Sijtsema, Jairo Socarras Fernandez, Emiliano Spezi, Roel J.H.M. Steenbakkers, Stephanie Tanadini<hyphen>Lang, Daniela Thorwarth, Esther G.C. Troost, Taman Upadhaya, Vincenzo Valentini, Lisanne Vania van Dijk, Joost J. M. van Griethuysen, Floris H. P. van Velden, P. Whybra, Christian Richter, Steffen L<latin small letter o with diaeresis>ck | 2020 | Radiology | vol 295 | no 2 | pages 328--338 | doi 10.1148/radiol.2020191145 | OpenAlex W2998789541 | open access https://research.rug.nl/files/119920642/The_Image_Biomarker_Standardization_Initiative_Standardized_Quantitative_Radiomics_for_High_Throughput_Image_based_Phenotyping.pdf
Semantic Scholar: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping. | A. Zwanenburg, M. Valli<latin small letter e with grave>res, M. Abdalah, H. Aerts, V. Andrearczyk, A. Apte, S. Ashrafinia, S. Bakas, R. Beukinga, R. Boellaard, M. Bogowicz, L. Boldrini, I. Buvat, G. Cook, C. Davatzikos, A. Depeursinge, Marie-Charlotte Desseroit, N. Dinapoli, C. Dinh, S. Echegaray, I. El Naqa, Andrey Fedorov, R. Gatta, R. Gillies, V. Goh, M. G<latin small letter o with diaeresis>tz, M. Guckenberger, Min-Ha Sung, M. Hatt, F. Isensee, P. Lambin, S. Leger, R. Leijenaar, J. Lenkowicz, F. Lippert, Are Losneg<latin small letter a with ring above>rd, Klaus Hermann Maier-Hein, O. Morin, Henning M<latin small letter u with diaeresis>ller, S. Napel, C. Nioche, F. Orlhac, Sarthak Pati, E. Pfaehler, A. Rahmim, Arvind Rao, J. Scherer, M. Siddique, N. Sijtsema, J. Socarras Fernandez, E. Spezi, R. Steenbakkers, S. Tanadini-Lang, D. Thorwarth, E. Troost, T. Upadhaya, V. Valentini, L. van Dijk, J. V. van Griethuysen, F. V. van Velden, P. Whybra, C. Richter, S. L<latin small letter o with diaeresis>ck | 2016 | Radiology | pages 191145 | doi 10.1148/radiol.2020191145 | arXiv 1612.07003 | Semantic Scholar 41dfe7b56b3009500dad81a348cd39941cdfb716 | open access https://research.rug.nl/files/119920642/The_Image_Biomarker_Standardization_Initiative_Standardized_Quantitative_Radiomics_for_High_Throughput_Image_based_Phenotyping.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### fornaconwood2020reliability
Command: python3 lookup resolve '10.1007/s00330-020-06957-9'
```
Crossref: ratio 1.00: Reliability and prognostic value of radiomic features are highly dependent on choice of feature extraction platform | Isabella Fornacon-Wood, Hitesh Mistry, Christoph J. Ackermann, Fiona Blackhall, Andrew McPartlin, Corinne Faivre-Finn, Gareth J. Price, James P. B. O<right single quotation mark>Connor | 2020 | European Radiology | vol 30 | no 11 | pages 6241--6250 | doi 10.1007/s00330-020-06957-9
OpenAlex: ratio 1.00: Reliability and prognostic value of radiomic features are highly dependent on choice of feature extraction platform | Isabella Fornacon-Wood, Hitesh B. Mistry, Christoph Jakob Ackermann, Fiona Helen Blackhall, Andrew J. McPartlin, Corinne Faivre Finn, Gareth J. Price, James P.B. O<right single quotation mark>Connor | 2020 | European Radiology | vol 30 | no 11 | pages 6241--6250 | doi 10.1007/s00330-020-06957-9 | OpenAlex W3017712284 | open access https://link.springer.com/content/pdf/10.1007/s00330-020-06957-9.pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### menze2015multimodal
Command: python3 lookup resolve '10.1109/TMI.2014.2377694'
```
Crossref: ratio 1.00: The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS) | Bjoern H. Menze, Andras Jakab, Stefan Bauer, Jayashree Kalpathy-Cramer, Keyvan Farahani, Justin Kirby, Yuliya Burren, Nicole Porz, Johannes Slotboom, Roland Wiest, Levente Lanczi, Elizabeth Gerstner, Marc-Andre Weber, Tal Arbel, Brian B. Avants, Nicholas Ayache, Patricia Buendia, D. Louis Collins, Nicolas Cordier, Jason J. Corso, Antonio Criminisi, Tilak Das, Herve Delingette, Cagatay Demiralp, Christopher R. Durst, Michel Dojat, Senan Doyle, Joana Festa, Florence Forbes, Ezequiel Geremia, Ben Glocker, Polina Golland, Xiaotao Guo, Andac Hamamci, Khan M. Iftekharuddin, Raj Jena, Nigel M. John, Ender Konukoglu, Danial Lashkari, Jose Antonio Mariz, Raphael Meier, Sergio Pereira, Doina Precup, Stephen J. Price, Tammy Riklin Raviv, Syed M. S. Reza, Michael Ryan, Duygu Sarikaya, Lawrence Schwartz, Hoo-Chang Shin, Jamie Shotton, Carlos A. Silva, Nuno Sousa, Nagesh K. Subbanna, Gabor Szekely, Thomas J. Taylor, Owen M. Thomas, Nicholas J. Tustison, Gozde Unal, Flor Vasseur, Max Wintermark, Dong Hye Ye, Liang Zhao, Binsheng Zhao, Darko Zikic, Marcel Prastawa, Mauricio Reyes, Koen Van Leemput | 2015 | IEEE Transactions on Medical Imaging | vol 34 | no 10 | pages 1993--2024 | doi 10.1109/tmi.2014.2377694
OpenAlex: ratio 1.00: The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS) | Bjoern H. Menze, Jakab Andr<latin small letter a with acute>s, Stefan Bauer, Jayashree Kalpathy<en dash>Cramer, Keyvan Farahani, Justin Kirby, Yuliya Burren, Nicole Porz, Johannes Slotboom, Roland Wiest, Levente L<latin small letter a with acute>nczi, Elizabeth Robins Gerstner, Marc<hyphen>Andr<latin small letter e with acute> Weber, Tal Arbel, Brian Avants, Nicholas Ayache, Patricia Buendia, D. Louis Collins, Nicolas Cordier, Jason J. Corso, Antonio Criminisi, Tilak Das, Herv<latin small letter e with acute> Delingette, <latin capital letter c with cedilla>a<latin small letter g with breve>atay Demiralp, Christopher R. Durst, Michel Dojat, Senan Doyle, Joana Festa, Florence Forbes, Ezequiel Geremia, Ben Glocker, Polina Golland, Xiaotao Guo, Anda<latin small letter c with cedilla> Hamamc<latin small letter dotless i>, Khan M. Iftekharuddin, R. Jena, Nigel John, Ender Konuko<latin small letter g with breve>lu, Danial Lashkari, Jos<latin small letter e with acute> Ant<latin small letter o with acute>nio Mariz, Raphael Meier, S<latin small letter e with acute>rgio Pereira, Doina Precup, Stephen John Price, Tammy Riklin Raviv, Syed M. S. Reza, Michael J. Ryan, Duygu Sar<latin small letter dotless i>kaya, Lawrence Howard Schwartz, Hoo-Chang Shin, Jamie Shotton, Carlos A. Silva, Nuno Sousa, Nagesh K. Subbanna, G<latin small letter a with acute>bor J. Sz<latin small letter e with acute>kely, Thomas J. Taylor, Owen Thomas, Nicholas James Tustison, G<latin small letter o with diaeresis>zde <latin capital letter u with diaeresis>nal, Flor Vasseur, Max Wintermark, Dong Hye Ye, Liang Zhao, Binsheng Zhao, Darko Zikic, Marcel W. Prastawa, Mauricio Reyes, Koen Van Leemput | 2014 | IEEE Transactions on Medical Imaging | vol 34 | no 10 | pages 1993--2024 | doi 10.1109/tmi.2014.2377694 | OpenAlex W1641498739 | open access https://ieeexplore.ieee.org/ielx7/42/7283692/06975210.pdf
Semantic Scholar: ratio 1.00: The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS) | Bjoern H Menze, A. Jakab, S. Bauer, Jayashree Kalpathy-Cramer, K. Farahani, J. Kirby, Y. Burren, N. Porz, J. Slotboom, R. Wiest, L. L<latin small letter a with acute>nczi, E. Gerstner, Marc-Andr<latin small letter e with acute> Weber, T. Arbel, B. Avants, N. Ayache, Patricia Buendia, D. Collins, Nicolas Cordier, J. Corso, A. Criminisi, Tilak Das, H. Delingette, <latin capital letter c with cedilla>a<latin small letter g with breve>atay Demiralp, Christopher R. Durst, M. Dojat, S. Doyle, J. Festa, F. Forbes, E. Geremia, Ben Glocker, P. Golland, Xiao-Tao Guo, A. Hamamc<latin small letter dotless i>, K. Iftekharuddin, R. Jena, Nigel M. John, E. Konukoglu, D. Lashkari, J. Mariz, R. Meier, S<latin small letter e with acute>rgio Pereira, Doina Precup, S. Price, Tammy Riklin-Raviv, Syed M. S. Reza, Michael T. Ryan, Duygu Sarikaya, L. Schwartz, Hoo-Chang Shin, J. Shotton, Carlos Alberto Silva, Nuno J. Sousa, N. Subbanna, G. Sz<latin small letter e with acute>kely, Thomas J. Taylor, Owen M. Thomas, N. Tustison, G. <latin capital letter u with diaeresis>nal, F. Vasseur, M. Wintermark, Dong Hye Ye, Liang Zhao, Bin-Sheng Zhao, Darko Zikic, M. Prastawa, M. Reyes, K. van Leemput | 2014 | IEEE Transactions on Medical Imaging | vol 34 | pages 1993--2024 | doi 10.1109/TMI.2014.2377694 | Semantic Scholar 580062407427236ced45253a2ff7df2e147a81e2 | open access https://ieeexplore.ieee.org/ielx7/42/7283692/06975210.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### isensee2021nnu
Command: python3 lookup resolve '10.1038/s41592-020-01008-z'
```
Crossref: ratio 1.00: nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation | Fabian Isensee, Paul F. Jaeger, Simon A. A. Kohl, Jens Petersen, Klaus H. Maier-Hein | 2020 | Nature Methods | vol 18 | no 2 | pages 203--211 | doi 10.1038/s41592-020-01008-z
OpenAlex: ratio 1.00: nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation | Fabian Isensee, Paul F. Jaeger, Simon A. A. Kohl, Jens Petersen, Klaus H. Maier-Hein | 2020 | Nature Methods | vol 18 | no 2 | pages 203--211 | doi 10.1038/s41592-020-01008-z | OpenAlex W3014974815 | open access https://arxiv.org/pdf/1904.08128
Semantic Scholar: ratio 1.00: nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation | F. Isensee, P. Jaeger, S. Kohl, J. Petersen, Klaus Hermann Maier-Hein | 2020 | Nature Methods | vol 18 | pages 203--211 | doi 10.1038/s41592-020-01008-z | Semantic Scholar f28e387d4229c5f690ce4570a391c0f47e7155c7 | open access https://arxiv.org/pdf/1904.08128
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### commowick2018objective
Command: python3 lookup resolve '10.1038/s41598-018-31911-7'
```
Crossref: ratio 1.00: Objective Evaluation of Multiple Sclerosis Lesion Segmentation using a Data Management and Processing Infrastructure | Olivier Commowick, Audrey Istace, Micha<latin small letter e with diaeresis>l Kain, Baptiste Laurent, Florent Leray, Mathieu Simon, Sorina Camarasu Pop, Pascal Girard, Roxana Am<latin small letter e with acute>li, Jean-Christophe Ferr<latin small letter e with acute>, Anne Kerbrat, Thomas Tourdias, Fr<latin small letter e with acute>d<latin small letter e with acute>ric Cervenansky, Tristan Glatard, J<latin small letter e with acute>r<latin small letter e with acute>my Beaumont, Senan Doyle, Florence Forbes, Jesse Knight, April Khademi, Amirreza Mahbod, Chunliang Wang, Richard McKinley, Franca Wagner, John Muschelli, Elizabeth Sweeney, Eloy Roura, Xavier Llad<latin small letter o with acute>, Michel M. Santos, Wellington P. Santos, Abel G. Silva-Filho, Xavier Tomas-Fernandez, H<latin small letter e with acute>l<latin small letter e with grave>ne Urien, Isabelle Bloch, Sergi Valverde, Mariano Cabezas, Francisco Javier Vera-Olmos, Norberto Malpica, Charles Guttmann, Sandra Vukusic, Gilles Edan, Michel Dojat, Martin Styner, Simon K. Warfield, Fran<latin small letter c with cedilla>ois Cotton, Christian Barillot | 2018 | Scientific Reports | vol 8 | no 1 | doi 10.1038/s41598-018-31911-7
OpenAlex: ratio 1.00: Objective Evaluation of Multiple Sclerosis Lesion Segmentation using a Data Management and Processing Infrastructure | Olivier Commowick, Audrey Istace, Michael Kain, Baptiste Laurent, Florent Leray, Mathieu Simon, Sorina Camarasu-Pop, Pascal Girard, Roxana Am<latin small letter e with acute>li, Jean<hyphen>Christophe Ferr<latin small letter e with acute>, Anne Kerbrat, Thomas Tourdias, Fr<latin small letter e with acute>d<latin small letter e with acute>ric Cervenansky, Tristan Glatard, J<latin small letter e with acute>r<latin small letter e with acute>my Beaumont, Senan Doyle, Florence Forbes, Jesse Knight, April Khademi, Amirreza Mahbod, Chunliang Wang, Richard McKinley, Franca Wagner, John Muschelli, Elizabeth M. Sweeney, Eloy Roura, Xavier Llad<latin small letter o with acute>, Michel M. Santos, Wellington Pinheiro dos Santos, Abel G. Silva-Filho, Xavier Tomas-Fernandez, H<latin small letter e with acute>l<latin small letter e with grave>ne Urien, Isabelle Bloch, Sergi Valverde, Mariano Cabezas, Francisco Javier Vera-Olmos, Norberto Malpica, Charles R.G. Guttmann, Sandra Vukusic, Gilles Edan, Michel Dojat, Martin Andreas Styner, Simon Keith Warfield, Fran<latin small letter c with cedilla>ois Cotton, Christian Barillot | 2018 | Scientific Reports | vol 8 | no 1 | pages 13650--13650 | doi 10.1038/s41598-018-31911-7 | OpenAlex W2849179291 | open access https://www.nature.com/articles/s41598-018-31911-7.pdf
Semantic Scholar: ratio 1.00: Objective Evaluation of Multiple Sclerosis Lesion Segmentation using a Data Management and Processing Infrastructure | O. Commowick, A. Istace, Michael Kain, B. Laurent, Florent Leray, Mathieu Simon, S. Pop, P. Girard, R. Ameli, J. Ferr<latin small letter e with acute>, A. Kerbrat, T. Tourdias, F. Cervenansky, T. Glatard, J. Beaumont, S. Doyle, F. Forbes, Jesse Knight, A. Khademi, A. Mahbod, Chun-Liang Wang, Richard McKinley, F. Wagner, J. Muschelli, E. Sweeney, E. Roura, X. Llad<latin small letter o with acute>, M. M. Santos, W. Santos, A. Silva-Filho, X. Tomas-Fernandez, H. Urien, I. Bloch, S. Valverde, M. Cabezas, Francisco Javier Vera-Olmos, Norberto Malpica, C. Guttmann, S. Vukusic, G. Edan, M. Dojat, M. Styner, S. Warfield, F. Cotton, C. Barillot | 2018 | Scientific Reports | vol 8 | doi 10.1038/s41598-018-31911-7 | Semantic Scholar 63275cef678cb6e280efcf11b527f594335c02c8 | open access https://www.nature.com/articles/s41598-018-31911-7.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wynen2025conflunet
Command: python3 lookup resolve '10.1016/j.compbiomed.2025.110919'
```
Crossref: ratio 1.00: ConfLUNet: Multiple sclerosis lesion instance segmentation in presence of confluent lesions | Maxence Wynen, Pedro M. Gordaliza, Maxime Istasse, Anna St<latin small letter o with diaeresis>lting, Pietro Maggi, Beno<latin small letter i with circumflex>t Macq, Meritxell Bach Cuadra | 2025 | Computers in Biology and Medicine | vol 197 | pages 110919 | doi 10.1016/j.compbiomed.2025.110919
OpenAlex: ratio 1.00: ConfLUNet: Multiple sclerosis lesion instance segmentation in presence of confluent lesions | Maxence Wynen, Pedro M. Gordaliza, Maxime Istasse, Anna St<latin small letter o with diaeresis>lting, Pietro Maggi, Benoit M. M. Macq, Meritxell Bach Cuadra | 2025 | Computers in Biology and Medicine | vol 197 | no Pt A | pages 110919--110919 | doi 10.1016/j.compbiomed.2025.110919 | OpenAlex W4413474688 | open access https://doi.org/10.1016/j.compbiomed.2025.110919
Semantic Scholar: ratio 1.00: ConfLUNet: Multiple sclerosis lesion instance segmentation in presence of confluent lesions | M. Wynen, P. Gordaliza, Maxime Istasse, A. St<latin small letter o with diaeresis>lting, P. Maggi, B. Macq, M. Bach Cuadra | 2025 | Comput. Biol. Medicine | vol 197 Pt A | pages 110919 | doi 10.1016/j.compbiomed.2025.110919 | arXiv 2505.22537 | Semantic Scholar 8ebf147ea359b8b4baaa260ae87588f8c68fda77 | open access https://doi.org/10.1016/j.compbiomed.2025.110919
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### klein2009evaluation
Command: python3 lookup resolve '10.1016/j.neuroimage.2008.12.037'
```
Crossref: ratio 1.00: Evaluation of 14 nonlinear deformation algorithms applied to human brain MRI registration | Arno Klein, Jesper Andersson, Babak A. Ardekani, John Ashburner, Brian Avants, Ming-Chang Chiang, Gary E. Christensen, D. Louis Collins, James Gee, Pierre Hellier, Joo Hyun Song, Mark Jenkinson, Claude Lepage, Daniel Rueckert, Paul Thompson, Tom Vercauteren, Roger P. Woods, J. John Mann, Ramin V. Parsey | 2009 | NeuroImage | vol 46 | no 3 | pages 786--802 | doi 10.1016/j.neuroimage.2008.12.037
OpenAlex: ratio 1.00: Evaluation of 14 nonlinear deformation algorithms applied to human brain MRI registration | Arno Klein, Jesper Andersson, Babak Assai Ardekani, John Ashburner, Brian Avants, Ming-Chang Chiang, Gary E. Christensen, D. Louis Collins, James C. Gee, Pierre Hellier, Joo Hyun Song, Mark Jenkinson, Claude Lepage, Daniel Rueckert, Paul M. Thompson, Tom K. Vercauteren, Roger P. Woods, J. John Mann, Ramin V. Parsey | 2009 | NeuroImage | vol 46 | no 3 | pages 786--802 | doi 10.1016/j.neuroimage.2008.12.037 | OpenAlex W2102099319 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2747506/
Semantic Scholar: ratio 1.00: Evaluation of 14 nonlinear deformation algorithms applied to human brain MRI registration | Arno Klein, J. Andersson, B. Ardekani, J. Ashburner, B. Avants, Ming-Chang Chiang, G. Christensen, D. Collins, J. Gee, P. Hellier, J. Song, M. Jenkinson, C. Lepage, D. Rueckert, P. Thompson, T. Vercauteren, R. Woods, J. Mann, R. Parsey | 2009 | NeuroImage | vol 46 | pages 786--802 | doi 10.1016/j.neuroimage.2008.12.037 | Semantic Scholar 6d2669ebc27f776d940ca95db0ad4ae455316cf2 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2747506/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dular2024extensive
Command: python3 lookup resolve '10.1016/j.compbiomed.2024.108320'
```
Crossref: ratio 1.00: Extensive T1-weighted MRI preprocessing improves generalizability of deep brain age prediction models | Lara Dular, Franjo Pernu<latin small letter s with caron>, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin | 2024 | Computers in Biology and Medicine | vol 173 | pages 108320 | doi 10.1016/j.compbiomed.2024.108320
OpenAlex: ratio 1.00: Extensive T1-weighted MRI preprocessing improves generalizability of deep brain age prediction models | Lara Dular, Franjo Pernu<latin small letter s with caron>, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin | 2024 | Computers in Biology and Medicine | vol 173 | pages 108320--108320 | doi 10.1016/j.compbiomed.2024.108320 | OpenAlex W4392983541 | open access https://doi.org/10.1016/j.compbiomed.2024.108320
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### pavic2018influence
Command: python3 lookup resolve '10.1080/0284186X.2018.1445283'
```
Crossref: ratio 1.00: Influence of inter-observer delineation variability on radiomics stability in different tumor sites | Matea Pavic, Marta Bogowicz, Xaver W<latin small letter u with diaeresis>rms, Stefan Glatz, Tobias Finazzi, Oliver Riesterer, Johannes Roesch, Leonie Rudofsky, Martina Friess, Patrick Veit-Haibach, Martin Huellner, Isabelle Opitz, Walter Weder, Thomas Frauenfelder, Matthias Guckenberger, Stephanie Tanadini-Lang | 2018 | Acta Oncologica | vol 57 | no 8 | pages 1070--1074 | doi 10.1080/0284186x.2018.1445283
OpenAlex: ratio 1.00: Influence of inter-observer delineation variability on radiomics stability in different tumor sites | Matea Pavic, Marta Bogowicz, Xaver W<latin small letter u with diaeresis>rms, Stefan Glatz, Tobias Finazzi, Oliver Riesterer, Johannes Roesch, Leonie Rudofsky, Martina Friess, Patrick Veit<hyphen>Haibach, Martin William Huellner, Isabelle Opitz, Walter Weder, Thomas Frauenfelder, Matthias G<latin small letter u with diaeresis>ckenberger, Stephanie Tanadini<hyphen>Lang | 2018 | Acta Oncologica | vol 57 | no 8 | pages 1070--1074 | doi 10.1080/0284186x.2018.1445283 | OpenAlex W2791459212 | open access https://www.tandfonline.com/doi/pdf/10.1080/0284186X.2018.1445283?needAccess=true&role=button
Semantic Scholar: ratio 1.00: Influence of inter-observer delineation variability on radiomics stability in different tumor sites | M. Pavic, M. Bogowicz, Xaver W<latin small letter u with diaeresis>rms, S. Glatz, T. Finazzi, O. Riesterer, J. Roesch, L. Rudofsky, Martina Friess, P. Veit-Haibach, M. Huellner, I. Opitz, W. Weder, T. Frauenfelder, M. Guckenberger, S. Tanadini-Lang | 2018 | Acta oncologica | vol 57 | pages 1070--1074 | doi 10.1080/0284186X.2018.1445283 | Semantic Scholar 3c0d461ba85dee05b5285335c61c071fb71ad274 | open access https://www.tandfonline.com/doi/pdf/10.1080/0284186X.2018.1445283?needAccess=true&role=button
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### poirot2022robustness
Command: python3 lookup resolve '10.1038/s41598-022-20703-9'
```
Crossref: ratio 1.00: Robustness of radiomics to variations in segmentation methods in multimodal brain MRI | M. G. Poirot, M. W. A. Caan, H. G. Ruhe, A. Bj<latin small letter o with stroke>rnerud, I. Groote, L. Reneman, H. A. Marquering | 2022 | Scientific Reports | vol 12 | no 1 | doi 10.1038/s41598-022-20703-9
OpenAlex: ratio 1.00: Robustness of radiomics to variations in segmentation methods in multimodal brain MRI | Maarten G. Poirot, Matthan W.A. Caan, Henricus Gerardus Ruh<latin small letter e with acute>, Atle Bj<latin small letter o with stroke>rnerud, Inge Rasmus Groote, Liesbeth Reneman, Henk A. Marquering | 2022 | Scientific Reports | vol 12 | no 1 | pages 16712--16712 | doi 10.1038/s41598-022-20703-9 | OpenAlex W4302292929 | open access https://www.nature.com/articles/s41598-022-20703-9.pdf
Semantic Scholar: ratio 1.00: Robustness of radiomics to variations in segmentation methods in multimodal brain MRI | M. Poirot, M. Caan, H. Ruh<latin small letter e with acute>, A. Bj<latin small letter o with stroke>rnerud, I. Groote, L. Reneman, H. Marquering | 2022 | Scientific Reports | vol 12 | doi 10.1038/s41598-022-20703-9 | Semantic Scholar 49511a491e76a4e3302e5237515669fa3be8ee08 | open access https://www.nature.com/articles/s41598-022-20703-9.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cama2025segmentation
Command: python3 lookup resolve '10.1117/1.JMI.12.5.054501'
```
Crossref: ratio 1.00: Segmentation variability and radiomics stability for predicting triple-negative breast cancer subtype using magnetic resonance imaging | Isabella Cama, Alejandro Guzm<latin small letter a with acute>n, Cristina Campi, Michele Piana, Karim Lekadir, Sara Garbarino, Oliver D<latin small letter i with acute>az | 2025 | Journal of Medical Imaging | vol 12 | no 05 | pages 1--23 | doi 10.1117/1.jmi.12.5.054501
OpenAlex: ratio 1.00: Segmentation variability and radiomics stability for predicting triple-negative breast cancer subtype using magnetic resonance imaging | Isabella Cama, Alejandro Guzm<latin small letter a with acute>n, Cristina Campi, Michele Piana, Karim Lekadir, Sara Garbarino, Oliver D<latin small letter i with acute>az | 2025 | Journal of medical imaging | vol 12 | no 05 | pages 1--23 | doi 10.1117/1.jmi.12.5.054501 | OpenAlex W4414285024 | open access https://www.spiedigitallibrary.org/journals/journal-of-medical-imaging/volume-12/issue-5/054501/Segmentation-variability-and-radiomics-stability-for-predicting-triple-negative-breast/10.1117/1.JMI.12.5.054501.pdf
Semantic Scholar: ratio 1.00: Segmentation variability and radiomics stability for predicting triple-negative breast cancer subtype using magnetic resonance imaging | Isabella Cama, Alejandro Guzm<latin small letter a with acute>n, C. Campi, M. Piana, K. Lekadir, S. Garbarino, Oliver D<latin small letter i with acute>az | 2025 | Journal of Medical Imaging | vol 12 | doi 10.1117/1.JMI.12.5.054501 | arXiv 2504.01692 | Semantic Scholar 770d0547cc2734a58f88107a469cd72771e76d21 | open access https://www.spiedigitallibrary.org/journals/journal-of-medical-imaging/volume-12/issue-5/054501/Segmentation-variability-and-radiomics-stability-for-predicting-triple-negative-breast/10.1117/1.JMI.12.5.054501.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cole2017predicting
Command: python3 lookup resolve '10.1016/j.neuroimage.2017.07.059'
```
Crossref: ratio 1.00: Predicting brain age with deep learning from raw imaging data results in a reliable and heritable biomarker | James H. Cole, Rudra P.K. Poudel, Dimosthenis Tsagkrasoulis, Matthan W.A. Caan, Claire Steves, Tim D. Spector, Giovanni Montana | 2017 | NeuroImage | vol 163 | pages 115--124 | doi 10.1016/j.neuroimage.2017.07.059
OpenAlex: ratio 1.00: Predicting brain age with deep learning from raw imaging data results in a reliable and heritable biomarker | James Howard Cole, Rudra P. K. Poudel, Dimosthenis Tsagkrasoulis, Matthan W.A. Caan, Claire J. Steves, Tim D. Spector, Giovanni Montana | 2017 | NeuroImage | vol 163 | pages 115--124 | doi 10.1016/j.neuroimage.2017.07.059 | OpenAlex W2579617530 | open access https://kclpure.kcl.ac.uk/portal/en/publications/826cf875-3cc3-4e68-bb02-f057c725a9ed
Semantic Scholar: ratio 1.00: Predicting brain age with deep learning from raw imaging data results in a reliable and heritable biomarker | J. Cole, Rudra P. K. Poudel, Dimosthenis Tsagkrasoulis, M. Caan, C. Steves, T. Spector, G. Montana | 2016 | NeuroImage | vol 163 | pages 115<en dash>124 | doi 10.1016/j.neuroimage.2017.07.059 | arXiv 1612.02572 | Semantic Scholar 5d71c918db224e21982d9eb5ab2359735466959b | open access https://kclpure.kcl.ac.uk/portal/en/publications/826cf875-3cc3-4e68-bb02-f057c725a9ed
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### hosny2018deep
Command: python3 lookup resolve '10.1371/journal.pmed.1002711'
```
Crossref: ratio 1.00: Deep learning for lung cancer prognostication: A retrospective multi-cohort radiomics study | Ahmed Hosny, Chintan Parmar, Thibaud P. Coroller, Patrick Grossmann, Roman Zeleznik, Avnish Kumar, Johan Bussink, Robert J. Gillies, Raymond H. Mak, Hugo J. W. L. Aerts | 2018 | PLOS Medicine | vol 15 | no 11 | pages e1002711 | doi 10.1371/journal.pmed.1002711
OpenAlex: ratio 1.00: Deep learning for lung cancer prognostication: A retrospective multi-cohort radiomics study | Ahmed Hosny, Chintan Parmar, Thibaud P. Coroller, Patrick Gro<latin small letter sharp s>mann, Roman Zeleznik, Avnish Kumar, Johan Bussink, Robert J. Gillies, Raymond H. Mak, Hugo J.W.L. Aerts | 2018 | PLoS Medicine | vol 15 | no 11 | pages e1002711--e1002711 | doi 10.1371/journal.pmed.1002711 | OpenAlex W2903150666 | open access https://journals.plos.org/plosmedicine/article/file?id=10.1371/journal.pmed.1002711&type=printable
Semantic Scholar: ratio 1.00: Deep learning for lung cancer prognostication: A retrospective multi-cohort radiomics study | A. Hosny, C. Parmar, T. Coroller, P. Grossmann, R. Zeleznik, Avnish Kumar, J. Bussink, R. Gillies, R. Mak, H. Aerts | 2018 | PLoS Medicine | vol 15 | doi 10.1371/journal.pmed.1002711 | Semantic Scholar 438c0a37e7545e836ee81c519cedf44f0702418f | open access https://journals.plos.org/plosmedicine/article/file?id=10.1371/journal.pmed.1002711&type=printable
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### toosi2024segmentation
Command: python3 lookup resolve '10.3390/cancers16142538'
```
Crossref: ratio 1.00: Segmentation-Free Outcome Prediction from Head and Neck Cancer PET/CT Images: Deep Learning-Based Feature Extraction from Multi-Angle Maximum Intensity Projections (MA-MIPs) | Amirhosein Toosi, Isaac Shiri, Habib Zaidi, Arman Rahmim | 2024 | Cancers | vol 16 | no 14 | pages 2538 | doi 10.3390/cancers16142538
OpenAlex: ratio 1.00: Segmentation-Free Outcome Prediction from Head and Neck Cancer PET/CT Images: Deep Learning-Based Feature Extraction from Multi-Angle Maximum Intensity Projections (MA-MIPs) | Amirhosein Toosi, Isaac Shiri, Habib Zaidi, Arman Rahmim | 2024 | Cancers | vol 16 | no 14 | pages 2538--2538 | doi 10.3390/cancers16142538 | OpenAlex W4396778312 | open access https://www.mdpi.com/2072-6694/16/14/2538/pdf?version=1721286491
Semantic Scholar: ratio 1.00: Segmentation-Free Outcome Prediction from Head and Neck Cancer PET/CT Images: Deep Learning-Based Feature Extraction from Multi-Angle Maximum Intensity Projections (MA-MIPs) | Amirhosein Toosi, I. Shiri, H. Zaidi, A. Rahmim | 2024 | Cancers | vol 16 | doi 10.3390/cancers16142538 | arXiv 2405.01756 | Semantic Scholar 274956f84276f522a0a82adaf231fa0a628238f2 | open access https://www.mdpi.com/2072-6694/16/14/2538/pdf?version=1721286491
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xue2023tractcloud
Command: python3 lookup resolve '10.1007/978-3-031-43993-3_40'
```
Crossref: ratio 1.00: TractCloud: Registration-Free Tractography Parcellation with a Novel Local-Global Streamline Point Cloud Representation | Tengfei Xue, Yuqian Chen, Chaoyi Zhang, Alexandra J. Golby, Nikos Makris, Yogesh Rathi, Weidong Cai, Fan Zhang, Lauren J. O<right single quotation mark>Donnell | 2023 | Lecture Notes in Computer Science | pages 409--419 | doi 10.1007/978-3-031-43993-3_40
OpenAlex: ratio 1.00: TractCloud: Registration-Free Tractography Parcellation with a Novel Local-Global Streamline Point Cloud Representation | Tengfei Xue, Yuqian Chen, Chaoyi Zhang, Alexandra J. Golby, Nikos Makris, Yogesh Rathi, Weidong Cai, Fan Zhang, Lauren J. O<right single quotation mark>Donnell | 2023 | Lecture notes in computer science | pages 409--419 | doi 10.1007/978-3-031-43993-3_40 | OpenAlex W4387211013 | open access https://arxiv.org/pdf/2307.09000
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### afshar2020taste
Command: python3 lookup resolve '10.1145/3368555.3384464'
```
Crossref: ratio 1.00: TASTE | Ardavan Afshar, Ioakeim Perros, Haesun Park, Christopher deFilippi, Xiaowei Yan, Walter Stewart, Joyce Ho, Jimeng Sun | 2020 | Proceedings of the ACM Conference on Health, Inference, and Learning | pages 193--203 | doi 10.1145/3368555.3384464
OpenAlex: DOI_MISMATCH, ratio 0.11: TASTE: temporal and static tensor factorization for phenotyping electronic health records | Ardavan Afshar, Ioakeim Perros, Haesun Park, Christopher R. deFilippi, Xiaowei Sherry Yan, Walter F. Stewart, Joyce C. Ho, Jimeng Sun | 2020 | ACM Conference on Health, Inference, and Learning (CHIL) | vol 2020 | pages 193--203 | doi 10.1145/3368555.3384464 | OpenAlex W3012523953 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7924914/
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yin2020logpar
Command: python3 lookup resolve '10.1145/3394486.3403213'
```
Crossref: ratio 1.00: LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values | Kejing Yin, Ardavan Afshar, Joyce C. Ho, William K. Cheung, Chao Zhang, Jimeng Sun | 2020 | Proceedings of the 26th ACM SIGKDD International Conference on Knowledge Discovery &amp; Data Mining | pages 1625--1635 | doi 10.1145/3394486.3403213
OpenAlex: ratio 1.00: LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values | Kejing Yin, Ardavan Afshar, Joyce C. Ho, William K. Cheung, Chao Zhang, Jimeng Sun | 2020 | ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD) | vol 2020 | pages 1625--1635 | doi 10.1145/3394486.3403213 | OpenAlex W3080327921 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8186437/
Semantic Scholar: ratio 1.00: LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values | Kejing Yin, Ardavan Afshar, Joyce Ho, W. Cheung, Chao Zhang, Ji-Meng Sun | 2020 | Knowledge Discovery and Data Mining | vol 2020 | pages 1625--1635 | doi 10.1145/3394486.3403213 | Semantic Scholar 6f6d2b257ca9d7073da28ed66884fb53fa08295d | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8186437/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### consagra2024continuous
Command: python3 lookup resolve '10.1214/23-aoas1858'
```
Crossref: ratio 1.00: Continuous and atlas-free analysis of brain structural connectivity | William Consagra, Martin Cole, Xing Qiu, Zhengwu Zhang | 2024 | The Annals of Applied Statistics | vol 18 | no 3 | pages 1815--1839 | doi 10.1214/23-aoas1858
OpenAlex: ratio 1.00: Continuous and atlas-free analysis of brain structural connectivity | William Consagra, Martin Cole, Xing Qiu, Zhengwu Zhang | 2024 | The Annals of Applied Statistics | vol 18 | no 3 | pages 1815--1839 | doi 10.1214/23-aoas1858 | OpenAlex W4401373869 | open access https://arxiv.org/pdf/2308.05738
Semantic Scholar: ratio 1.00: Continuous and atlas-free analysis of brain structural connectivity | W. Consagra, Martin Cole, Xing Qiu, Zheng-Wu Zhang | 2023 | Annals of Applied Statistics | doi 10.1214/23-aoas1858 | arXiv 2308.05738 | Semantic Scholar 837fe3446662de9ad8edd77fedacf8bbf33ea83f | open access https://arxiv.org/pdf/2308.05738
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kovacs2023addressing
Command: python3 lookup resolve '10.1038/s41598-023-46747-z'
```
Crossref: ratio 1.00: Addressing image misalignments in multi-parametric prostate MRI for enhanced computer-aided diagnosis of prostate cancer | Balint Kovacs, Nils Netzer, Michael Baumgartner, Adrian Schrader, Fabian Isensee, Cedric Wei<latin small letter sharp s>er, Ivo Wolf, Magdalena G<latin small letter o with diaeresis>rtz, Paul F. Jaeger, Victoria Sch<latin small letter u with diaeresis>tz, Ralf Floca, Regula Gnirs, Albrecht Stenzinger, Markus Hohenfellner, Heinz-Peter Schlemmer, David Bonekamp, Klaus H. Maier-Hein | 2023 | Scientific Reports | vol 13 | no 1 | doi 10.1038/s41598-023-46747-z
OpenAlex: ratio 1.00: Addressing image misalignments in multi-parametric prostate MRI for enhanced computer-aided diagnosis of prostate cancer | B<latin small letter a with acute>lint Kov<latin small letter a with grave>cs, Nils Netzer, Michael Baumgartner, Adrian Schrader, Fabian Isensee, Cedric Wei<latin small letter sharp s>er, Ivo Wolf, Magdalena G<latin small letter o with diaeresis>rtz, Paul F. Jaeger, V Sch<latin small letter u with diaeresis>tz, Ralf Omar Floca, Regula Gnirs, Albrecht Stenzinger, Markus Hohenfellner, Heinz<hyphen>Peter Schlemmer, David Bonekamp, Klaus Hermann Maier-Hein | 2023 | Scientific Reports | vol 13 | no 1 | pages 19805--19805 | doi 10.1038/s41598-023-46747-z | OpenAlex W4388627300 | open access https://www.nature.com/articles/s41598-023-46747-z.pdf
Semantic Scholar: ratio 1.00: Addressing image misalignments in multi-parametric prostate MRI for enhanced computer-aided diagnosis of prostate cancer | B<latin small letter a with acute>lint Kov<latin small letter a with acute>cs, N. Netzer, M. Baumgartner, Adrian Schrader, F. Isensee, Cedric Wei<latin small letter sharp s>er, I. Wolf, M. G<latin small letter o with diaeresis>rtz, P. Jaeger, V. Sch<latin small letter u with diaeresis>tz, R. Floca, R. Gnirs, A. Stenzinger, M. Hohenfellner, H. Schlemmer, D. Bonekamp, K. Maier-Hein | 2023 | Scientific Reports | vol 13 | doi 10.1038/s41598-023-46747-z | Semantic Scholar 8e5b6ccace875c5bb3e7a48d82cc046bbe1d6309 | open access https://www.nature.com/articles/s41598-023-46747-z.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ghosal2026penalized
Command: python3 lookup resolve '2611.03608'
```
Crossref: not found
OpenAlex: ratio 1.00: Penalized Cox Regression with Graph-Structured Distribution-Valued Predictors | Rahul Ghosal, Dhrubajyoti Ghosh, Yuanzhen Yue, Arkaprava Roy | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2611.03608 | arXiv 2611.03608 | OpenAlex W7225161204 | open access https://arxiv.org/pdf/2611.03608
Semantic Scholar: ratio 1.00: Penalized Cox Regression with Graph-Structured Distribution-Valued Predictors | R. Ghosal, Dhrubajyoti Ghosh, Yuan-Zheng Yue, Arkaprava Roy | 2026 | arXiv 2611.03608 | Semantic Scholar 4b2f89da752259cb3d69450107275d8e7aa9002f
arXiv: ratio 1.00: Penalized Cox Regression with Graph-Structured Distribution-Valued Predictors | Rahul Ghosal, Dhrubajyoti Ghosh, Yuanzhen Yue, Arkaprava Roy | 2026 | arXiv 2611.03608
```
Exit status: 0

### feydy2019interpolating
Command: python3 lookup resolve '1810.08278'
```
Crossref: not found
OpenAlex: ratio 1.00: Interpolating between Optimal Transport and MMD using Sinkhorn Divergences | Jean Feydy, Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois<hyphen>Xavier Vialard, <cyrillic capital letter sha><cyrillic small letter u><cyrillic small letter en>-<cyrillic small letter i><cyrillic small letter che><cyrillic small letter i> <cyrillic capital letter a><cyrillic small letter em><cyrillic small letter a><cyrillic small letter er><cyrillic small letter i>, A. Trouv<latin small letter e with acute>, Gabriel Peyr<latin small letter e with acute> | 2018 | arXiv (Cornell University) | vol 89 | pages 2681--2690 | doi 10.48550/arxiv.1810.08278 | arXiv 1810.08278 | OpenAlex W2897105053 | open access https://arxiv.org/pdf/1810.08278
Semantic Scholar: ratio 1.00: Interpolating between Optimal Transport and MMD using Sinkhorn Divergences | J. Feydy, Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, S. Amari, A. Trouv<latin small letter e with acute>, G. Peyr<latin small letter e with acute> | 2018 | International Conference on Artificial Intelligence and Statistics | pages 2681--2690 | arXiv 1810.08278 | Semantic Scholar dafb021ba04731669e9473477688345ef4962e63
arXiv: ratio 1.00: Interpolating between Optimal Transport and MMD using Sinkhorn Divergences | Jean Feydy, Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, Shun-ichi Amari, Alain Trouv<latin small letter e with acute>, Gabriel Peyr<latin small letter e with acute> | 2018 | arXiv 1810.08278
```
Exit status: 0

### wang2013linear
Command: python3 lookup resolve '10.1007/s11263-012-0566-z'
```
Crossref: ratio 1.00: A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images | Wei Wang, Dejan Slep<latin small letter c with caron>ev, Saurav Basu, John A. Ozolek, Gustavo K. Rohde | 2012 | International Journal of Computer Vision | vol 101 | no 2 | pages 254--269 | doi 10.1007/s11263-012-0566-z
OpenAlex: ratio 1.00: A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images | Wei Wang, Dejan Slep<latin small letter c with caron>ev, Saurav Basu, John A. Ozolek, Gustavo Kunde Rohde | 2012 | International Journal of Computer Vision | vol 101 | no 2 | pages 254--269 | doi 10.1007/s11263-012-0566-z | OpenAlex W2094100343 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC3667970/
Semantic Scholar: ratio 1.00: A linear optimal transportation framework for quantifying and visualizing variations in sets of images | Wei Wang, D. Slep<latin small letter c with caron>ev, Saurav Basu, J. Ozolek, G. Rohde | 2012 | International Journal of Computer Vision | vol 101 | pages 254--269 | doi 10.1007/s11263-012-0566-z | Semantic Scholar 3b1f93716ef525f2b47dcc2faec8292a686e1086 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC3667970/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kolouri2021wasserstein
Command: python3 lookup resolve '2006.09430'
```
Crossref: not found
OpenAlex: ratio 1.00: Wasserstein Embedding for Graph Learning | Soheil Kolouri, Navid Naderializadeh, Gustavo Kunde Rohde, Hoffmann, Heiko | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.09430 | arXiv 2006.09430 | OpenAlex W3036694079 | open access https://arxiv.org/pdf/2006.09430
Semantic Scholar: ratio 1.00: Wasserstein Embedding for Graph Learning | Soheil Kolouri, Navid Naderializadeh, G. Rohde, Heiko Hoffmann | 2020 | International Conference on Learning Representations | vol abs/2006.09430 | doi 10.48550/arXiv.2006.09430 | arXiv 2006.09430 | Semantic Scholar b00e92cf883050461f545f3f3e4cf376c07bb1a2
arXiv: ratio 1.00: Wasserstein Embedding for Graph Learning | Soheil Kolouri, Navid Naderializadeh, Gustavo K. Rohde, Heiko Hoffmann | 2020 | arXiv 2006.09430
```
Exit status: 0

### togninalli2019wasserstein
Command: python3 lookup resolve '1906.01277'
```
Crossref: not found
OpenAlex: ratio 1.00: Wasserstein Weisfeiler-Lehman Graph Kernels | Matteo Togninalli, Elisabetta Ghisu, Felipe Llinares-L<latin small letter o with acute>pez, Bastian Rieck, Karsten Michael Borgwardt | 2019 | arXiv (Cornell University) | vol 32 | pages 6439--6449 | doi 10.3929/ethz-b-000420933 | OpenAlex W2970823238 | open access https://arxiv.org/pdf/1906.01277
Semantic Scholar: ratio 1.00: Wasserstein Weisfeiler-Lehman Graph Kernels | Matteo Togninalli, M. Ghisu, F. Llinares-L<latin small letter o with acute>pez, Bastian Alexander Rieck, Karsten M. Borgwardt | 2019 | Neural Information Processing Systems | pages 6436--6446 | doi 10.48550/arXiv.1906.01277 | arXiv 1906.01277 | Semantic Scholar 081a05b34be9d604f85ca4e5582daa753370b960
arXiv: ratio 1.00: Wasserstein Weisfeiler-Lehman Graph Kernels | Matteo Togninalli, Elisabetta Ghisu, Felipe Llinares-L<latin small letter o with acute>pez, Bastian Rieck, Karsten Borgwardt | 2019 | arXiv 1906.01277
```
Exit status: 0

### zhang2024wasserstein
Command: python3 lookup resolve '10.1109/tpami.2024.3409772'
```
Crossref: ratio 1.00: Wasserstein Discriminant Dictionary Learning for Graph Representation | Tong Zhang, Guangbu Liu, Zhen Cui, Wei Liu, Wenming Zheng, Jian Yang | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 46 | no 12 | pages 8619--8635 | doi 10.1109/tpami.2024.3409772
OpenAlex: ratio 1.00: Wasserstein Discriminant Dictionary Learning for Graph Representation | Tong Zhang, Guangbu Liu, Zhen Cui, Wei Liu, Wenming Zheng, Jian Jun Yang | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 46 | no 12 | pages 8619--8635 | doi 10.1109/tpami.2024.3409772 | OpenAlex W4399373692
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kundu2018discovery
Command: python3 lookup resolve '10.1016/j.neuroimage.2017.11.006'
```
Crossref: ratio 1.00: Discovery and visualization of structural biomarkers from MRI using transport-based morphometry | Shinjini Kundu, Soheil Kolouri, Kirk I. Erickson, Arthur F. Kramer, Edward McAuley, Gustavo K. Rohde | 2018 | NeuroImage | vol 167 | pages 256--275 | doi 10.1016/j.neuroimage.2017.11.006
OpenAlex: ratio 1.00: Discovery and visualization of structural biomarkers from MRI using transport-based morphometry | Shinjini Kundu, Soheil Kolouri, Kirk I. Erickson, Arthur F. Kramer, Edward McAuley, Gustavo Kunde Rohde | 2017 | NeuroImage | vol 167 | pages 256--275 | doi 10.1016/j.neuroimage.2017.11.006 | OpenAlex W2616032077 | open access https://www.sciencedirect.com/science/article/am/pii/S1053811917309151
Semantic Scholar: ratio 1.00: Discovery and visualization of structural biomarkers from MRI using transport-based morphometry | Shinjini Kundu, Soheil Kolouri, K. Erickson, A. Kramer, E. McAuley, G. Rohde | 2017 | NeuroImage | vol 167 | pages 256--275 | doi 10.1016/j.neuroimage.2017.11.006 | arXiv 1705.04919 | Semantic Scholar 62185e836dbff2641cf33e57b9d73ce2bca25a08 | open access https://www.sciencedirect.com/science/article/am/pii/S1053811917309151
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kundu2024discovering
Command: python3 lookup resolve '10.1126/sciadv.adl5307'
```
Crossref: ratio 1.00: Discovering the gene-brain-behavior link in autism via generative machine learning | Shinjini Kundu, Haris Sair, Elliott H. Sherr, Pratik Mukherjee, Gustavo K. Rohde | 2024 | Science Advances | vol 10 | no 24 | doi 10.1126/sciadv.adl5307
OpenAlex: ratio 1.00: Discovering the gene-brain-behavior link in autism via generative machine learning | Shinjini Kundu, Haris Iqbal Sair, Elliott H. Sherr, Pratik Mukherjee, Gustavo Kunde Rohde | 2024 | Science Advances | vol 10 | no 24 | pages eadl5307--eadl5307 | doi 10.1126/sciadv.adl5307 | OpenAlex W4399562726 | open access https://www.science.org/doi/pdf/10.1126/sciadv.adl5307?download=true
Semantic Scholar: ratio 1.00: Discovering the gene-brain-behavior link in autism via generative machine learning | Shinjini Kundu, H. Sair, E. Sherr, Pratik Mukherjee, G. Rohde | 2024 | Science Advances | vol 10 | doi 10.1126/sciadv.adl5307 | Semantic Scholar 50ac7c00ee8782d44fa96c24af2ef8c7a6748597 | open access https://www.science.org/doi/pdf/10.1126/sciadv.adl5307?download=true
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dadashkarimi2023cross
Command: python3 lookup resolve '10.1016/j.media.2023.102864'
```
Crossref: ratio 1.00: Cross Atlas Remapping via Optimal Transport (CAROT): Creating connectomes for different atlases when raw data is not available | Javid Dadashkarimi, Amin Karbasi, Qinghao Liang, Matthew Rosenblatt, Stephanie Noble, Maya Foster, Raimundo Rodriguez, Brendan Adkinson, Jean Ye, Huili Sun, Chris Camp, Michael Farruggia, Link Tejavibulya, Wei Dai, Rongtao Jiang, Angeliki Pollatou, Dustin Scheinost | 2023 | Medical Image Analysis | vol 88 | pages 102864 | doi 10.1016/j.media.2023.102864
OpenAlex: ratio 0.95: Cross Atlas Remapping via Optimal Transport (CAROT): Creating connectomes for any atlas when raw data is not available | Javid Dadashkarimi, Amin Karbasi, Qinghao Liang, Matthew Rosenblatt, Stephanie Noble, Maya L. Foster, Raimundo X. Rodriguez, Brendan D. Adkinson, Jean Ye, Huili Sun, Chris Camp, Michael Farruggia, Link Tejavibulya, Wei Dai, Rongtao Jiang, Angeliki Pollatou, Dustin Scheinost | 2022 | Medical Image Analysis | vol 88 | pages 102864--102864 | doi 10.1016/j.media.2023.102864 | OpenAlex W4379879414 | open access https://www.sciencedirect.com/science/article/am/pii/S136184152300124X
Semantic Scholar: ratio 1.00: Cross Atlas Remapping via Optimal Transport (CAROT): Creating connectomes for different atlases when raw data is not available | J. Dadashkarimi, Amin Karbasi, Qing-Hao Liang, M. Rosenblatt, S. Noble, Maya L. Foster, R. Rodriguez, B. Adkinson, Jean Ye, Hui-Li Sun, C. Camp, Michael C. Farruggia, Link Tejavibulya, Wei Dai, Rong-Tao Jiang, A. Pollatou, D. Scheinost | 2023 | Medical Image Anal. | vol 88 | pages 102864--102864 | doi 10.1016/j.media.2023.102864 | Semantic Scholar cea68dc22bbea44c66cadd0c2d1d2bce2dbc60bf | open access https://www.sciencedirect.com/science/article/am/pii/S136184152300124X
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### mahan2024point
Command: python3 lookup resolve '2401.01460'
```
Crossref: not found
OpenAlex: ratio 1.00: Point Cloud Classification via Deep Set Linearized Optimal Transport | Scott P. Mahan, Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2024 | arXiv (Cornell University) | doi 10.48550/arxiv.2401.01460 | arXiv 2401.01460 | OpenAlex W4390601194 | open access https://arxiv.org/pdf/2401.01460
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Point Cloud Classification via Deep Set Linearized Optimal Transport | Scott Mahan, Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2024 | arXiv 2401.01460
```
Exit status: 0

### wang2024graph
Command: python3 lookup resolve '10.52202/079017-4374'
```
Crossref: ratio 1.00: Graph Classification via Reference Distribution Learning: Theory and Practice | Zixiao Wang, Jicong Fan | 2024 | Advances in Neural Information Processing Systems 37 | pages 137698--137740 | doi 10.52202/079017-4374
OpenAlex: ratio 1.00: Graph Classification via Reference Distribution Learning: Theory and Practice | Zixiao Wang, Jicong Fan | 2024 | neural information processing systems | pages 137698--137740 | doi 10.52202/079017-4374 | OpenAlex W4415800566 | open access https://arxiv.org/pdf/2408.11370
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kwon2025graph
Command: python3 lookup resolve '10.1016/j.media.2025.103538'
```
Crossref: ratio 1.00: Graph-based prototype inverse-projection for identifying cortical sulcal pattern abnormalities in congenital heart disease | Hyeokjin Kwon, Seungyeon Son, Sarah U. Morton, David Wypij, John Cleveland, Caitlin K Rollins, Hao Huang, Elizabeth Goldmuntz, Ashok Panigrahy, Nina H. Thomas, Wendy K. Chung, Evdokia Anagnostou, Ami Norris-Brilliant, Bruce D. Gelb, Patrick McQuillen, George A. Porter, Martin Tristani-Firouzi, Mark W. Russell, Amy E. Roberts, Jane W. Newburger, P. Ellen Grant, Jong-Min Lee, Kiho Im | 2025 | Medical Image Analysis | vol 102 | pages 103538 | doi 10.1016/j.media.2025.103538
OpenAlex: ratio 1.00: Graph-based prototype inverse-projection for identifying cortical sulcal pattern abnormalities in congenital heart disease | Hyeokjin Kwon, Seungyeon Son, Sarah U. Morton, David Wypij, John Cleveland, Caitlin K. Rollins, Hao Huang, Elizabeth Goldmuntz, Ashok Panigrahy, Nina H. Thomas, Wendy K. Chung, Evdokia A. Anagnostou, Ami Norris<hyphen>Brilliant, Bruce D. Gelb, Patrick S. McQuillen, George A. Porter, Martin Tristani<hyphen>Firouzi, Mark W. W. Russell, Amy E. Roberts, Jane W. Newburger, Patricia Ellen Grant, Jongmin Lee, Kiho Im | 2025 | Medical Image Analysis | vol 102 | pages 103538--103538 | doi 10.1016/j.media.2025.103538 | OpenAlex W4408052092 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841525000854
Semantic Scholar: ratio 1.00: Graph-based Prototype Inverse-Projection for Identifying Cortical Sulcal Pattern Abnormalities in Congenital Heart Disease | Hyeokjin Kwon, Seoung-Yeon Son, S. Morton, D. Wypij, J. Cleveland, C. Rollins, Hao Huang, E. Goldmuntz, A. Panigrahy, Nina H. Thomas, Wendy K. Chung, Evdokia Anagnoustou, A. Norris-Brilliant, B. Gelb, P. McQuillen, G. Porter, M. Tristani-Firouzi, M. W. Russell, Amy E. Roberts, J. Newburger, P. Grant, J. Lee, K. Im | 2025 | Medical Image Analysis | vol 102 | pages 103538--103538 | doi 10.1016/j.media.2025.103538 | Semantic Scholar 90e07a0cb2eb884681c367b0b014566b9558f800 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841525000854
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### aramayo2023uncovering
Command: python3 lookup resolve '2303.05978'
```
Crossref: not found
OpenAlex: ratio 1.00: Uncovering Challenges of Solving the Continuous Gromov-Wasserstein Problem | Carrasco, Xavier Aramayo, Maksim Nekrashevich, Mokrov, Petr, Evgeny Vladimirovich Burnaev, Alexander Andreevich Korotin | 2023 | arXiv (Cornell University) | doi 10.48550/arxiv.2303.05978 | arXiv 2303.05978 | OpenAlex W4324106608 | open access https://arxiv.org/pdf/2303.05978
Semantic Scholar: ratio 1.00: Uncovering Challenges of Solving the Continuous Gromov-Wasserstein Problem | Xavier Aramayo Carrasco, Maksim Nekrashevich, Petr Mokrov, Evgeny Burnaev, Alexander Korotin | 2023 | arXiv 2303.05978 | Semantic Scholar 121ec595c83fde7065b78559d7b78e230718e6b4
arXiv: ratio 1.00: Uncovering Challenges of Solving the Continuous Gromov-Wasserstein Problem | Xavier Aramayo Carrasco, Maksim Nekrashevich, Petr Mokrov, Evgeny Burnaev, Alexander Korotin | 2023 | arXiv 2303.05978
```
Exit status: 0

### nguyen2023linear
Command: python3 lookup resolve '10.1016/j.patcog.2023.109351'
```
Crossref: ratio 1.00: On a linear fused Gromov-Wasserstein distance for graph structured data | Dai Hai Nguyen, Koji Tsuda | 2023 | Pattern Recognition | vol 138 | pages 109351 | doi 10.1016/j.patcog.2023.109351
OpenAlex: ratio 1.00: On a linear fused Gromov-Wasserstein distance for graph structured data | Hai Nguyen, Koji Tsuda | 2023 | Pattern Recognition | vol 138 | no 109351 | pages 109351--109351 | doi 10.1016/j.patcog.2023.109351 | OpenAlex W4317932208 | open access https://www.sciencedirect.com/science/article/am/pii/S0031320323000523
Semantic Scholar: ratio 1.00: On a linear fused Gromov-Wasserstein distance for graph structured data | Dai Hai Nguyen, K. Tsuda | 2022 | Pattern Recognition | vol abs/2203.04711 | doi 10.1016/j.patcog.2023.109351 | arXiv 2203.04711 | Semantic Scholar 2230cec2ca3405545da0f61287bbb949395a56c5 | open access https://www.sciencedirect.com/science/article/am/pii/S0031320323000523
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2023wasserstein
Command: python3 lookup resolve '10.1080/01621459.2021.1956937'
```
Crossref: ratio 1.00: Wasserstein Regression | Yaqing Chen, Zhenhua Lin, Hans-Georg M<latin small letter u with diaeresis>ller | 2021 | Journal of the American Statistical Association | vol 118 | no 542 | pages 869--882 | doi 10.1080/01621459.2021.1956937
OpenAlex: ratio 1.00: Wasserstein Regression | Yaqing Chen, Zhenhua Lin, Hans<hyphen>Georg M<latin small letter u with diaeresis>ller | 2021 | Journal of the American Statistical Association | vol 118 | no 542 | pages 869--882 | doi 10.1080/01621459.2021.1956937 | OpenAlex W4205465859 | open access https://arxiv.org/pdf/2006.09660
Semantic Scholar: ratio 1.00: Wasserstein Regression | Ya-Qing Chen, Zhen-Hua Lin, Hans-Georg M<latin small letter u with diaeresis>ller | 2020 | Journal of the American Statistical Association | vol 118 | pages 869--882 | doi 10.1080/01621459.2021.1956937 | arXiv 2006.09660 | Semantic Scholar 99d884a6f8dbe34c9d19aaf0ea0da41c46efa9bc | open access https://arxiv.org/pdf/2006.09660
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### feydy2019fast
Command: python3 lookup resolve '10.1007/978-3-030-32248-9_71'
```
Crossref: ratio 1.00: Fast and Scalable Optimal Transport for Brain Tractograms | Jean Feydy, Pierre Roussillon, Alain Trouv<latin small letter e with acute>, Pietro Gori | 2019 | Lecture Notes in Computer Science | pages 636--644 | doi 10.1007/978-3-030-32248-9_71
OpenAlex: ratio 1.00: Fast and Scalable Optimal Transport for Brain Tractograms | Jean Feydy, Pierre Roussillon, A. Trouv<latin small letter e with acute>, Pietro Gori | 2019 | Lecture notes in computer science | pages 636--644 | doi 10.1007/978-3-030-32248-9_71 | OpenAlex W2979675031 | open access https://telecom-paris.hal.science/hal-02264177/document
Semantic Scholar: ratio 1.00: Fast and Scalable Optimal Transport for Brain Tractograms | J. Feydy, Pierre Roussillon, A. Trouv<latin small letter e with acute>, P. Gori | 2019 | International Conference on Medical Image Computing and Computer-Assisted Intervention | pages 636--644 | doi 10.1007/978-3-030-32248-9_71 | arXiv 2107.02010 | Semantic Scholar 03dbb41cfd71fa0ad998aa8ee21b9396a400e5ab | open access https://telecom-paris.hal.science/hal-02264177/document
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### shi2016shape
Command: python3 lookup resolve '10.1109/cvpr.2016.546'
```
Crossref: ratio 1.00: Shape Analysis with Hyperbolic Wasserstein Distance | Jie Shi, Wen Zhang, Yalin Wang | 2016 | 2016 IEEE Conference on Computer Vision and Pattern Recognition (CVPR) | pages 5051--5061 | doi 10.1109/cvpr.2016.546
OpenAlex: ratio 1.00: Shape Analysis with Hyperbolic Wasserstein Distance | Jie Shi, Wen Zhang, Yalin Wang | 2016 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | vol 2016 | pages 5051--5061 | doi 10.1109/cvpr.2016.546 | OpenAlex W2420237017 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC5383000/
Semantic Scholar: ratio 1.00: Shape Analysis with Hyperbolic Wasserstein Distance | Jie Shi, Wen Zhang, Y. Wang | 2016 | Computer Vision and Pattern Recognition | vol 2016 | pages 5051--5061 | doi 10.1109/CVPR.2016.546 | Semantic Scholar 76470fb3b2e7fda802b0a81e374489bfd9356f87 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC5383000/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yan2026gwdro
Command: python3 lookup resolve '10.1038/s41746-026-03323-9'
```
Crossref: ratio 1.00: GWDRO-Lung: Gromov<en dash>Wasserstein distributionally robust learning for calibrated pulmonary nodule malignancy prediction across imaging cohorts | Yubo Yan, An Yan, Wen Li, Jianlong Bu, Jinfeng Ning | 2026 | npj Digital Medicine | doi 10.1038/s41746-026-03323-9
OpenAlex: ratio 1.00: GWDRO-Lung: Gromov<en dash>Wasserstein distributionally robust learning for calibrated pulmonary nodule malignancy prediction across imaging cohorts | Yubo Yan, An Yan, Wen Li, Jianlong Bu, Jinfeng Ning | 2026 | npj Digital Medicine | doi 10.1038/s41746-026-03323-9 | OpenAlex W7222822304 | open access https://www.nature.com/articles/s41746-026-03323-9_reference.pdf
Semantic Scholar: ratio 1.00: GWDRO-Lung: Gromov<en dash>Wasserstein distributionally robust learning for calibrated pulmonary nodule malignancy prediction across imaging cohorts | Yu-Bo Yan, An Yan, Wen Li, Jian-Long Bu, J. Ning | 2026 | npj Digital Medicine | doi 10.1038/s41746-026-03323-9 | Semantic Scholar efb10a6338c77f5535e696393a10eaad8c00ecb9 | open access https://www.nature.com/articles/s41746-026-03323-9_reference.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### peng2026wasserstein
Command: python3 lookup resolve '10.1109/tcds.2026.3722535'
```
Crossref: ratio 1.00: Wasserstein Graph Topological Learning for Brain Network Classification | Yi Peng, Donghai Guan, Shengrong Li, Zhiqiang Zhang, Qi Zhu | 2026 | IEEE Transactions on Cognitive and Developmental Systems | pages 1--14 | doi 10.1109/tcds.2026.3722535
OpenAlex: ratio 1.00: Wasserstein Graph Topological Learning for Brain Network Classification | Yi Peng, Donghai Guan, Shengrong Li, Zhiqiang Zhang, Qi Zhu | 2026 | IEEE Transactions on Cognitive and Developmental Systems | pages 1--14 | doi 10.1109/tcds.2026.3722535 | OpenAlex W7202164716 | open access https://doi.org/10.1109/tcds.2026.3722535
Semantic Scholar: ratio 1.00: Wasserstein Graph Topological Learning for Brain Network Classification | Yi Peng, Dong-Hai Guan, Sheng-Rong Li, Zhi-Qiang Zhang, Qi Zhu | 2026 | IEEE Transactions on Cognitive and Developmental Systems | doi 10.1109/tcds.2026.3722535 | Semantic Scholar b0e441fc80d32526fcc14ce7c7a28a29c18706ee | open access https://doi.org/10.1109/tcds.2026.3722535
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### su2015optimal
Command: python3 lookup resolve '10.1109/tpami.2015.2408346'
```
Crossref: ratio 1.00: Optimal Mass Transport for Shape Matching and Comparison | Zhengyu Su, Yalin Wang, Rui Shi, Wei Zeng, Jian Sun, Feng Luo, Xianfeng Gu | 2015 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 37 | no 11 | pages 2246--2259 | doi 10.1109/tpami.2015.2408346
OpenAlex: ratio 1.00: Optimal Mass Transport for Shape Matching and Comparison | Zhengyu Su, Yalin Wang, Rui Shi, Wei Zeng, Jian Sun, Feng Luo, Xianfeng David Gu | 2015 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 37 | no 11 | pages 2246--2259 | doi 10.1109/tpami.2015.2408346 | OpenAlex W2024849762 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4602172
Semantic Scholar: ratio 1.00: Optimal Mass Transport for Shape Matching and Comparison | Zhengyu Su, Y. Wang, Rui Shi, W. Zeng, Jian Sun, F. Luo, X. Gu | 2015 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 37 | pages 2246--2259 | doi 10.1109/TPAMI.2015.2408346 | Semantic Scholar e69a57639e0a2c30c3127b67092b5535c719440f | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4602172
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### solomon2016entropic
Command: python3 lookup resolve '10.1145/2897824.2925903'
```
Crossref: ratio 1.00: Entropic metric alignment for correspondence problems | Justin Solomon, Gabriel Peyr<latin small letter e with acute>, Vladimir G. Kim, Suvrit Sra | 2016 | ACM Transactions on Graphics | vol 35 | no 4 | pages 1--13 | doi 10.1145/2897824.2925903
OpenAlex: ratio 1.00: Entropic metric alignment for correspondence problems | Justin Solomon, Gabriel Peyr<latin small letter e with acute>, Vladimir G. Kim, Suvrit Sra | 2016 | ACM Transactions on Graphics | vol 35 | no 4 | pages 1--13 | doi 10.1145/2897824.2925903 | OpenAlex W2474265885 | open access http://dl.acm.org/ft_gateway.cfm?id=2925903&type=pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### naderializadeh2021pooling
No DOI and no arXiv ID; url: https://proceedings.neurips.cc/paper/2021/hash/1bc2029a8851ad344a8d503930dfd7f7-Abstract.html. Checked by WebFetch of the url (recorded below by the session).

### gachon2025low
Command: python3 lookup resolve '10.1002/cyto.a.24918'
```
Crossref: ratio 1.00: Low Dimensional Representation of Multi<hyphen>Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia | Erell Gachon, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot, Elsa Cazelles, Audrey Bidet, Jean<hyphen>Philippe Vial, Pierre<hyphen>Yves Dumas, Aguirre Mimoun | 2025 | Cytometry Part A | vol 107 | no 2 | pages 126--139 | doi 10.1002/cyto.a.24918
OpenAlex: ratio 1.00: Low Dimensional Representation of Multi<hyphen>Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia | Erell Gachon, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot, Elsa Cazelles, Audrey Bidet, Jean Vial, Pierre<hyphen>Yves Dumas, Aguirre Mimoun | 2025 | Cytometry Part A | vol 107 | no 2 | pages 126--139 | doi 10.1002/cyto.a.24918 | OpenAlex W4408161545 | open access https://doi.org/10.1002/cyto.a.24918
Semantic Scholar: ratio 1.00: Low Dimensional Representation of Multi<hyphen>Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia | E. Gachon, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot, Elsa Cazelles, A. Bidet, J. Vial, P. Dumas, A. Mimoun | 2024 | Cytometry Part A | vol 107 | doi 10.1002/cyto.a.24918 | arXiv 2407.17329 | Semantic Scholar eeda175edefd8c88a47f023d8f5b659a634e7fb5 | open access https://doi.org/10.1002/cyto.a.24918
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ma2024canonicalization
Command: python3 lookup resolve '10.52202/079017-1948'
```
Crossref: ratio 1.00: A Canonicalization Perspective on Invariant and Equivariant Learning | George Ma, Yifei Wang, Derek Lim, Stefanie Jegelka, Yisen Wang | 2024 | Advances in Neural Information Processing Systems 37 | pages 60936--60979 | doi 10.52202/079017-1948
OpenAlex: ratio 1.00: A Canonicalization Perspective on Invariant and Equivariant Learning | George Ma, Yifei Wang, Derek Lim, Stefanie Jegelka, Yifei Wang | 2024 | neural information processing systems | pages 60936--60979 | doi 10.52202/079017-1948 | OpenAlex W4415797454 | open access https://arxiv.org/pdf/2405.18378
Semantic Scholar: ratio 1.00: A Canonicalization Perspective on Invariant and Equivariant Learning | George Ma, Yi-Fei Wang, D. Lim, S. Jegelka, Yi-Sen Wang | 2024 | Neural Information Processing Systems | doi 10.52202/079017-1948 | arXiv 2405.18378 | Semantic Scholar 04e6d88d5b8d3833c49ead761a8bc466534f8f17 | open access https://arxiv.org/pdf/2405.18378
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### shao2021transmil
Command: python3 lookup resolve '2106.00908'
```
Crossref: not found
OpenAlex: ratio 1.00: TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification | Zhuchen Shao, Hao Bian, Chen Yang, Wang, Yifeng, Jian Zhang, Xiangyang Ji, Yongbing Zhang | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2106.00908 | arXiv 2106.00908 | OpenAlex W3193968034 | open access https://arxiv.org/pdf/2106.00908
Semantic Scholar: ratio 0.99: TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classication | Zhucheng Shao, Hao Bian, Yang Chen, Yifeng Wang, Jian Zhang, Xiang-Yang Ji, Yong-Bing Zhang | 2021 | Neural Information Processing Systems | vol abs/2106.00908 | doi 10.48550/arXiv.2106.00908 | arXiv 2106.00908 | Semantic Scholar 2153963d19b21e64e55295b69de81d99aadac465 | open access https://arxiv.org/pdf/2106.00908
arXiv: ratio 1.00: TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification | Zhuchen Shao, Hao Bian, Yang Chen, Yifeng Wang, Jian Zhang, Xiangyang Ji, Yongbing Zhang | 2021 | arXiv 2106.00908
```
Exit status: 0

### liu2026three
Command: python3 lookup resolve '10.34133/bmef.0276'
```
Crossref: ratio 1.00: Three-Dimensional Point-Cloud Learning for Patient-Specific Deep Brain Stimulation Motor Response Prediction in Parkinson Disease | Kaiming Liu, Yinghao Zhu, Ru Wang, Zihao Liu, Gongyi Zhu, Zice Wang, Minyan Ge, Bo Shen, Yimin Sun, Fengtao Liu, Jue Zhao, Narasimha M. Beeraka, Virak Sorn, Haiyin Wang, Vladimir N. Nikolenko, Jianjun Wu, Shumao Xu | 2026 | BME Frontiers | vol 7 | doi 10.34133/bmef.0276
OpenAlex: ratio 1.00: Three-Dimensional Point-Cloud Learning for Patient-Specific Deep Brain Stimulation Motor Response Prediction in Parkinson Disease | K Liu, Yinghao Zhu, Ru Wang, Zihao Liu, Gongyi Zhu, Zice Wang, Minyan Ge, Bo Shen, Yimin Sun, FengTao Liu, Jue Zhao, Narasimha Murthy Beeraka, Virak Sorn, Haiyin Wang, Vladimir N. Nikolenko, Jianjun Wu, Shumao Xu | 2026 | BME Frontiers | vol 7 | pages 0276--0276 | doi 10.34133/bmef.0276 | OpenAlex W7204692371 | open access https://doi.org/10.34133/bmef.0276
Semantic Scholar: ratio 1.00: Three-Dimensional Point-Cloud Learning for Patient-Specific Deep Brain Stimulation Motor Response Prediction in Parkinson Disease | Kaikai Liu, Ying-Hao Zhu, Ru Wang, Zi-Hao Liu, Gong-Yi Zhu, Zi-Ce Wang, Min-Yan Ge, Bo Shen, Yi-Min Sun, Feng-Tao Liu, Jue Zhao, N. Beeraka, Virak Sorn, Hai-Yin Wang, Vladimir N. Nikolenko, Jianjun Wu, Shu-Mao Xu | 2026 | BME Frontiers | vol 7 | doi 10.34133/bmef.0276 | Semantic Scholar 41b4f7f925135652280098549bc466bbf51c5376 | open access https://doi.org/10.34133/bmef.0276
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wagstaff2022universal
Command: python3 lookup resolve '2107.01959'
```
Crossref: not found
OpenAlex: ratio 1.00: Universal Approximation of Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Michael A. Osborne, Ingmar Posner | 2021 | Oxford University Research Archive (ORA) (University of Oxford) | doi 10.48550/arxiv.2107.01959 | arXiv 2107.01959 | OpenAlex W3182587796 | open access https://ora.ox.ac.uk/objects/uuid:aad96d93-d8a9-4ac4-92a3-cd7bc3e3da96/files/rm326m2506
Semantic Scholar: ratio 1.00: Universal Approximation of Functions on Sets | Edward Wagstaff, F. Fuchs, Martin Engelcke, Michael A. Osborne, I. Posner | 2021 | Journal of machine learning research | vol abs/2107.01959 | doi 10.48550/arXiv.2107.01959 | arXiv 2107.01959 | Semantic Scholar c7c625fc31168b64ed3191f916e446e08baaf9d2 | open access http://arxiv.org/pdf/2107.01959
arXiv: ratio 1.00: Universal Approximation of Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Michael A. Osborne, Ingmar Posner | 2021 | arXiv 2107.01959
```
Exit status: 0

### islam2026neuroaps
Command: python3 lookup resolve '10.1109/ijcnn69854.2026.11729839'
```
Crossref: ratio 1.00: NeuroAPS-Net: Neuro-Anatomically Aware Point Cloud Representation for Efficient Alzheimer<right single quotation mark>s Disease Classification | Towhidul Islam, Mufti Mahmud | 2026 | 2026 International Joint Conference on Neural Networks (IJCNN) | pages 1--6 | doi 10.1109/ijcnn69854.2026.11729839
OpenAlex: ratio 1.00: NeuroAPS-Net: Neuro-Anatomically Aware Point Cloud Representation for Efficient Alzheimer<right single quotation mark>s Disease Classification | Towhidul Islam, Mufti Mahmud | 2026 | International Joint Conference on Neural Networks (IJCNN) | pages 1--6 | doi 10.1109/ijcnn69854.2026.11729839 | OpenAlex W7157332953 | open access https://arxiv.org/pdf/2604.22883
Semantic Scholar: ratio 1.00: NeuroAPS-Net: Neuro-Anatomically Aware Point Cloud Representation for Efficient Alzheimer<right single quotation mark>s Disease Classification | Towhidul Islam, Mufti Mahmud | 2026 | IEEE International Joint Conference on Neural Network | pages 1--6 | doi 10.1109/IJCNN69854.2026.11729839 | arXiv 2604.22883 | Semantic Scholar f973ac98c5c51989e671300da14f9a96b1aa6348 | open access https://arxiv.org/pdf/2604.22883
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### willette2023scalable
Command: python3 lookup resolve '2208.12401'
```
Crossref: not found
OpenAlex: ratio 1.00: Scalable Set Encoding with Universal Mini-Batch Consistency and Unbiased Full Set Gradient Approximation | Jeffrey Willette, Lee, Seanie, Andreis, Bruno, Kenji Kawaguchi, Lee, Juho, Hwang, Sung Ju | 2022 | arXiv (Cornell University) | doi 10.48550/arxiv.2208.12401 | arXiv 2208.12401 | OpenAlex W4293575508 | open access https://arxiv.org/pdf/2208.12401
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Scalable Set Encoding with Universal Mini-Batch Consistency and Unbiased Full Set Gradient Approximation | Jeffrey Willette, Seanie Lee, Bruno Andreis, Kenji Kawaguchi, Juho Lee, Sung Ju Hwang | 2022 | arXiv 2208.12401
```
Exit status: 0

### vinyals2016order
Command: python3 lookup resolve '1511.06391'
```
Crossref: not found
OpenAlex: ratio 1.00: Order Matters: Sequence to sequence for sets | Oriol Vinyals, Samy Bengio, Manjunath Kudlur | 2015 | arXiv (Cornell University) | doi 10.48550/arxiv.1511.06391 | arXiv 1511.06391 | OpenAlex W2173183968 | open access https://arxiv.org/pdf/1511.06391
Semantic Scholar: ratio 1.00: Order Matters: Sequence to sequence for sets | O. Vinyals, Samy Bengio, M. Kudlur | 2015 | International Conference on Learning Representations | doi 10.48550/arXiv.1511.06391 | arXiv 1511.06391 | Semantic Scholar d01379ebb53c66a4ccf5f4959d904dcf9e161e41
arXiv: ratio 1.00: Order Matters: Sequence to sequence for sets | Oriol Vinyals, Samy Bengio, Manjunath Kudlur | 2015 | arXiv 1511.06391
```
Exit status: 0

### bloemreddy2020probabilistic
Command: python3 lookup resolve '1901.06082'
```
Crossref: not found
OpenAlex: ratio 1.00: Probabilistic symmetries and invariant neural networks | Benjamin Bloem-Reddy, Yee Whye Teh | 2019 | Oxford University Research Archive (ORA) (University of Oxford) | vol 21 | no 90 | pages 1--61 | doi 10.48550/arxiv.1901.06082 | arXiv 1901.06082 | OpenAlex W3038350744 | open access https://ora.ox.ac.uk/objects/uuid:2be9f9ae-8566-48d3-aa17-108a44176a34/files/sn583xv24n
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Probabilistic symmetries and invariant neural networks | Benjamin Bloem-Reddy, Yee Whye Teh | 2019 | arXiv 1901.06082
```
Exit status: 0

### maron1997framework
No DOI and no arXiv ID; url: https://proceedings.neurips.cc/paper/1997/hash/82965d4ed8150294d4330ace00821d77-Abstract.html. Checked by WebFetch of the url (recorded below by the session).

### amir2025fourier
Command: python3 lookup resolve '2405.16519'
```
Crossref: not found
OpenAlex: ratio 1.00: Fourier Sliced-Wasserstein Embedding for Multisets and Measures | Tal Amir, Nadav Dym | 2024 | International Conference on Learning Representations | doi 10.48550/arxiv.2405.16519 | arXiv 2405.16519 | OpenAlex W4399115724 | open access https://proceedings.iclr.cc/paper_files/paper/2025/hash/3dbb8b6b5576b85afb3037e9630812dc-Abstract-Conference.html
Semantic Scholar: ratio 1.00: Fourier Sliced-Wasserstein Embedding for Multisets and Measures | Tal Amir, Nadav Dym | 2024 | International Conference on Learning Representations | vol abs/2504.02544 | doi 10.48550/arXiv.2504.02544 | arXiv 2504.02544 | Semantic Scholar d69bdfb1e898ea9356618c7e20269a7cda4e151e
arXiv: ratio 1.00: Fourier Sliced-Wasserstein Embedding for Multisets and Measures | Tal Amir, Nadav Dym | 2024 | arXiv 2405.16519
```
Exit status: 0

### puny2022frame
Command: python3 lookup resolve '2110.03336'
```
Crossref: not found
OpenAlex: ratio 1.00: Frame Averaging for Invariant and Equivariant Network Design | Omri Puny, Matan Atzmon, Heli Ben-Hamu, Ishan Misra, Aditya Grover, Smith, Edward J., Yaron Lipman | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2110.03336 | arXiv 2110.03336 | OpenAlex W3204723935 | open access https://arxiv.org/pdf/2110.03336
Semantic Scholar: ratio 1.00: Frame Averaging for Invariant and Equivariant Network Design | Omri Puny, Matan Atzmon, Heli Ben-Hamu, Ishan Misra, Aditya Grover, Edward James Smith, Y. Lipman | 2021 | International Conference on Learning Representations | vol abs/2110.03336 | doi 10.48550/arXiv.2110.03336 | arXiv 2110.03336 | Semantic Scholar c5f3ce9c1a9b64ecd093c40b42cffe1819d6092f | open access http://arxiv.org/pdf/2110.03336
arXiv: ratio 1.00: Frame Averaging for Invariant and Equivariant Network Design | Omri Puny, Matan Atzmon, Heli Ben-Hamu, Ishan Misra, Aditya Grover, Edward J. Smith, Yaron Lipman | 2021 | arXiv 2110.03336
```
Exit status: 0

### zhang2022set
Command: python3 lookup resolve '2206.11925'
```
Crossref: not found
OpenAlex: ratio 1.00: Set Norm and Equivariant Skip Connections: Putting the Deep in Deep Sets | Lily Zhang, Veronica Tozzo, John M. Higgins, Rajesh Ranganath | 2022 | PubMed | vol 162 | pages 26559--26574 | doi 10.48550/arxiv.2206.11925 | arXiv 2206.11925 | OpenAlex W4386272587 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC10465016/pdf/nihms-1900325.pdf
Semantic Scholar: ratio 1.00: Set Norm and Equivariant Skip Connections: Putting the Deep in Deep Sets | Lily H. Zhang, V. Tozzo, J. Higgins, Rajesh Ranganath | 2022 | International Conference on Machine Learning | vol 162 | pages 26559--26574 | doi 10.48550/arXiv.2206.11925 | arXiv 2206.11925 | Semantic Scholar e873895dde7483deae0aa85b69c5062f42b2f392 | open access http://arxiv.org/pdf/2206.11925
arXiv: ratio 1.00: Set Norm and Equivariant Skip Connections: Putting the Deep in Deep Sets | Lily H. Zhang, Veronica Tozzo, John M. Higgins, Rajesh Ranganath | 2022 | arXiv 2206.11925
```
Exit status: 0

### skianis2020rep
Command: python3 lookup resolve '1904.01962'
```
Crossref: not found
OpenAlex: ratio 1.00: Rep the Set: Neural Networks for Learning Set Representations | Konstantinos Skianis, Giannis Nikolentzos, Stratis Limnios, Michalis Vazirgiannis | 2019 | arXiv (Cornell University) | pages 1410--1420 | doi 10.48550/arxiv.1904.01962 | arXiv 1904.01962 | OpenAlex W3037646323 | open access https://arxiv.org/pdf/1904.01962
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: Rep the Set: Neural Networks for Learning Set Representations | Konstantinos Skianis, Giannis Nikolentzos, Stratis Limnios, Michalis Vazirgiannis | 2019 | arXiv 1904.01962
```
Exit status: 0

### kothapalli2024equivariant
Command: python3 lookup resolve '2306.05553'
```
Crossref: not found
OpenAlex: ratio 1.00: Equivariant vs. Invariant Layers: A Comparison of Backbone and Pooling for Point Cloud Classification | Abihith Kothapalli, Ashkan Shahbazi, Xinran Liu, Robert Sheng, Soheil Kolouri | 2023 | arXiv (Cornell University) | doi 10.48550/arxiv.2306.05553 | arXiv 2306.05553 | OpenAlex W4380352321 | open access https://arxiv.org/pdf/2306.05553
Semantic Scholar: ratio 1.00: Equivariant vs. Invariant Layers: A Comparison of Backbone and Pooling for Point Cloud Classification | Abihith Kothapalli, Ashkan Shahbazi, Xin-Ran Liu, Robert Sheng, Soheil Kolouri | 2023 | GRaM | vol abs/2306.05553 | doi 10.48550/arXiv.2306.05553 | arXiv 2306.05553 | Semantic Scholar 8843ba92df447d9b001219884b2d12c9bf015dd0 | open access http://arxiv.org/pdf/2306.05553
arXiv: ratio 1.00: Equivariant vs. Invariant Layers: A Comparison of Backbone and Pooling for Point Cloud Classification | Abihith Kothapalli, Ashkan Shahbazi, Xinran Liu, Robert Sheng, Soheil Kolouri | 2023 | arXiv 2306.05553
```
Exit status: 0

### prokudin2019efficient
Command: python3 lookup resolve '10.1109/iccv.2019.00443'
```
Crossref: ratio 1.00: Efficient Learning on Point Clouds With Basis Point Sets | Sergey Prokudin, Christoph Lassner, Javier Romero | 2019 | 2019 IEEE/CVF International Conference on Computer Vision (ICCV) | pages 4331--4340 | doi 10.1109/iccv.2019.00443
OpenAlex: ratio 1.00: Efficient Learning on Point Clouds With Basis Point Sets | Sergey Prokudin, Christoph Lassner, Javier Romero | 2019 | IEEE/CVF International Conference on Computer Vision (ICCV) | pages 4331--4340 | doi 10.1109/iccv.2019.00443 | OpenAlex W2969694596
Semantic Scholar: ratio 1.00: Efficient Learning on Point Clouds With Basis Point Sets | S. Prokudin, Christoph Lassner, J. Romero | 2019 | IEEE International Conference on Computer Vision | pages 4331--4340 | doi 10.1109/ICCV.2019.00443 | arXiv 1908.09186 | Semantic Scholar 4502a2773c9a6851ad1fb57904e84c8b0572ba95
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### oner2023distribution
Command: python3 lookup resolve '10.1016/j.media.2023.102813'
```
Crossref: ratio 1.00: Distribution based MIL pooling filters: Experiments on a lymph node metastases dataset | Mustafa Umit Oner, Jared Marc Song Kye-Jet, Hwee Kuan Lee, Wing-Kin Sung | 2023 | Medical Image Analysis | vol 87 | pages 102813 | doi 10.1016/j.media.2023.102813
OpenAlex: ratio 1.00: Distribution based MIL pooling filters: Experiments on a lymph node metastases dataset | Mustafa <latin capital letter u with diaeresis>mit <latin capital letter o with diaeresis>ner, Jared Marc Song Kye-Jet, Hwee Kuan Lee, Wing-Kin Ken Sung | 2023 | Medical Image Analysis | vol 87 | pages 102813--102813 | doi 10.1016/j.media.2023.102813 | OpenAlex W4366490797 | open access https://doi.org/10.1016/j.media.2023.102813
Semantic Scholar: ratio 1.00: Distribution based MIL pooling filters: Experiments on a lymph node metastases dataset | Mustafa Umit Oner, Jared Marc Song Kye-Jet, Hwee Kuan Lee, Wing-Kin Sung | 2023 | Medical Image Anal. | vol 87 | pages 102813 | doi 10.1016/j.media.2023.102813 | Semantic Scholar 2379a795e2eb260ae2eeb71c826048ee3f0c789c | open access https://doi.org/10.1016/j.media.2023.102813
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yao2020whole
Command: python3 lookup resolve '10.1016/j.media.2020.101789'
```
Crossref: ratio 1.00: Whole slide images based cancer survival prediction using attention guided deep multiple instance learning networks | Jiawen Yao, Xinliang Zhu, Jitendra Jonnagaddala, Nicholas Hawkins, Junzhou Huang | 2020 | Medical Image Analysis | vol 65 | pages 101789 | doi 10.1016/j.media.2020.101789
OpenAlex: ratio 1.00: Whole slide images based cancer survival prediction using attention guided deep multiple instance learning networks | Jiawen Yao, Xinliang Zhu, Jitendra Jonnagaddala, Nicholas John Hawkins, Junzhou Huang | 2020 | Medical Image Analysis | vol 65 | pages 101789--101789 | doi 10.1016/j.media.2020.101789 | OpenAlex W3043535018 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841520301535
Semantic Scholar: ratio 1.00: Whole slide images based cancer survival prediction using attention guided deep multiple instance learning networks | Jiawen Yao, Xin-Liang Zhu, Jitendra Jonnagaddala, N. Hawkins, Jun-Zhou Huang | 2020 | Medical Image Anal. | vol 65 | pages 101789 | doi 10.1016/j.media.2020.101789 | arXiv 2009.11169 | Semantic Scholar f0c24d4ba514081a7bc77905e3e12998937ba68b | open access https://www.sciencedirect.com/science/article/am/pii/S1361841520301535
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### law2018bayesian
Command: python3 lookup resolve '1705.04293'
```
Crossref: not found
OpenAlex: ratio 1.00: Bayesian Approaches to Distribution Regression | Ho Chung Leon Law, Danica J. Sutherland, Dino Sejdinovi<latin small letter c with acute>, Seth R Flaxman | 2017 | arXiv (Cornell University) | pages 1167--1176 | doi 10.48550/arxiv.1705.04293 | arXiv 1705.04293 | OpenAlex W2613950051 | open access https://arxiv.org/pdf/1705.04293
Semantic Scholar: ratio 1.00: Bayesian Approaches to Distribution Regression | Ho Chung Leon Law, Danica J. Sutherland, D. Sejdinovic, S. Flaxman | 2017 | International Conference on Artificial Intelligence and Statistics | pages 1167--1176 | arXiv 1705.04293 | Semantic Scholar f35f56b7048a74244ab0530e4bc705cc71125862
arXiv: ratio 1.00: Bayesian Approaches to Distribution Regression | Ho Chung Leon Law, Danica J. Sutherland, Dino Sejdinovic, Seth Flaxman | 2017 | arXiv 1705.04293
```
Exit status: 0

### yi2021cytoset
Command: python3 lookup resolve '10.1101/2021.04.13.439702'
```
Crossref: ratio 1.00: CytoSet: Predicting clinical outcomes via set-modeling of cytometry data | Haidong Yi, Natalie Stanley | 2021 | doi 10.1101/2021.04.13.439702
OpenAlex: ratio 1.00: CytoSet: Predicting clinical outcomes via set-modeling of cytometry data | Haidong Yi, Natalie Stanley | 2021 | bioRxiv (Cold Spring Harbor Laboratory) | doi 10.1101/2021.04.13.439702 | OpenAlex W3155049638 | open access https://www.biorxiv.org/content/biorxiv/early/2021/07/02/2021.04.13.439702.full.pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### vanchhay2026foundation
Command: python3 lookup resolve '2610.41328'
```
Crossref: not found
OpenAlex: ratio 1.00: With foundation-model features, aggregator complexity does not improve cross-hospital discrimination in gastric whole-slide image classification | Nheng Vanchhay, Ali Hussain, Khan Ziaullah, Moon-Il Joo, Md Ariful Islam Mozumder, Rashedul Islam Sumon, Wonae Lee, Min-Sun Cho, Hyeong-Chan Shin, Yujun Park, Baek Hwan Cho, Nam-Hoon Cho, Heejung An, HeungKook Choi, Haeyoun Kang, Hyunki Kim, Hee Cheol Kim | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2610.41328 | arXiv 2610.41328 | OpenAlex W7225120190 | open access https://arxiv.org/pdf/2610.41328
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: With foundation-model features, aggregator complexity does not improve cross-hospital discrimination in gastric whole-slide image classification | Nheng Vanchhay, Ali Hussain, Khan Ziaullah, Moon-Il Joo, Md Ariful Islam Mozumder, Rashedul Islam Sumon, Won-Ae Lee, Min-Sun Cho, Hyeong-Chan Shin, Yujun Park, Baek Hwan Cho, Nam-Hoon Cho, Heejung An, Heung-Kook Choi, Haeyoun Kang, Hyunki Kim, Hee Cheol Kim | 2026 | arXiv 2610.41328
```
Exit status: 0

### chen2021whole
Command: python3 lookup resolve '10.1007/978-3-030-87237-3_33'
```
Crossref: ratio 1.00: Whole Slide Images are 2D Point Clouds: Context-Aware Survival Prediction Using Patch-Based Graph Convolutional Networks | Richard J. Chen, Ming Y. Lu, Muhammad Shaban, Chengkuan Chen, Tiffany Y. Chen, Drew F. K. Williamson, Faisal Mahmood | 2021 | Lecture Notes in Computer Science | pages 339--349 | doi 10.1007/978-3-030-87237-3_33
OpenAlex: ratio 1.00: Whole Slide Images are 2D Point Clouds: Context-Aware Survival Prediction Using Patch-Based Graph Convolutional Networks | Richard J. Chen, Ming Y. Lu, Muhammad Shaban, Chengkuan Chen, Tiffany Chen, Drew F. K. Williamson, Faisal Mahmood | 2021 | Lecture notes in computer science | pages 339--349 | doi 10.1007/978-3-030-87237-3_33 | OpenAlex W3185545942 | open access https://arxiv.org/pdf/2107.13048
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yuan2026bagshift
Command: python3 lookup resolve '2608.15970'
```
Crossref: not found
OpenAlex: ratio 1.00: BagShift: Measuring How Patch Selection Changes the Evidence Seen by Whole-Slide MIL | Ruicheng Yuan, Zhenxuan Zhang, Liwei Hu, Anbang Wang, Haijie Xu, Jiawei Luo, Guang Yang | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2608.15970 | arXiv 2608.15970 | OpenAlex W7203684208 | open access https://arxiv.org/pdf/2608.15970
Semantic Scholar: ratio 1.00: BagShift: Measuring How Patch Selection Changes the Evidence Seen by Whole-Slide MIL | Rui Yuan, Zhen-Xuan Zhang, Li-Wei Hu, An-Bang Wang, Hai-Jie Xu, Jia-Wei Luo, Guang Yang | 2026 | arXiv.org | vol abs/2608.15970 | doi 10.48550/arXiv.2608.15970 | arXiv 2608.15970 | Semantic Scholar 90ca815745f97464cdb57d850cb4260d4f01555e
arXiv: ratio 1.00: BagShift: Measuring How Patch Selection Changes the Evidence Seen by Whole-Slide MIL | Ruicheng Yuan, Zhenxuan Zhang, Liwei Hu, Anbang Wang, Haijie Xu, Jiawei Luo, Guang Yang | 2026 | arXiv 2608.15970
```
Exit status: 0

### kag2026attention
Command: python3 lookup resolve '10.1109/access.2026.3751717'
```
Crossref: ratio 1.00: Attention Is Not Localization: A Leakage-Free, End-to-End Evaluation of Weakly-Supervised and Supervised Breast-Lesion Localization in Mammography | Hitesh Kag, Madhu Shukla, Dinesh Kumar | 2026 | IEEE Access | vol 14 | pages 176532--176552 | doi 10.1109/access.2026.3751717
OpenAlex: ratio 1.00: Attention Is Not Localization: A Leakage-Free, End-to-End Evaluation of Weakly-Supervised and Supervised Breast-Lesion Localization in Mammography | Hitesh Kag, Madhu Shukla, Dinesh Kumar | 2026 | IEEE Access | vol 14 | pages 176532--176552 | doi 10.1109/access.2026.3751717 | OpenAlex W7225657118 | open access https://doi.org/10.1109/access.2026.3751717
Semantic Scholar: ratio 1.00: Attention Is Not Localization: A Leakage-Free, End-to-End Evaluation of Weakly-Supervised and Supervised Breast-Lesion Localization in Mammography | Hitesh Kag, Madhu Shukla, Dinesh Kumar | 2026 | IEEE Access | vol 14 | pages 176532--176552 | doi 10.1109/ACCESS.2026.3751717 | Semantic Scholar 448cadc9f1f1c740b8958f2feed7028dac2e616c | open access https://doi.org/10.1109/access.2026.3751717
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yang2020relational
Command: python3 lookup resolve '10.1109/isbi45749.2020.9098722'
```
Crossref: ratio 1.00: Relational Learning Between Multiple Pulmonary Nodules via Deep Set Attention Transformers | Jiancheng Yang, Haoran Deng, Xiaoyang Huang, Bingbing Ni, Yi Xu | 2020 | 2020 IEEE 17th International Symposium on Biomedical Imaging (ISBI) | pages 1875--1878 | doi 10.1109/isbi45749.2020.9098722
OpenAlex: ratio 1.00: Relational Learning Between Multiple Pulmonary Nodules via Deep Set Attention Transformers | Jiancheng Yang, Haoran Deng, Xiaoyang Huang, Bingbing Ni, Yi Xin Xu | 2020 | IEEE International Symposium on Biomedical Imaging (ISBI) | pages 1875--1878 | doi 10.1109/isbi45749.2020.9098722 | OpenAlex W3026063058 | open access https://arxiv.org/pdf/2004.05640
Semantic Scholar: ratio 1.00: Relational Learning Between Multiple Pulmonary Nodules via Deep Set Attention Transformers | Jiancheng Yang, Haoran Deng, Xiaoyang Huang, Bing-Bing Ni, Yi Xu | 2020 | IEEE International Symposium on Biomedical Imaging | pages 1875--1878 | doi 10.1109/ISBI45749.2020.9098722 | arXiv 2004.05640 | Semantic Scholar eb6c8dff05cd71299453eb4a9c80fb20613970b6 | open access https://arxiv.org/pdf/2004.05640
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2022lung
Command: python3 lookup resolve '10.1002/mp.15539'
```
Crossref: ratio 1.00: Lung cancer diagnosis using deep attention<hyphen>based multiple instance learning and radiomics | Junhua Chen, Haiyan Zeng, Chong Zhang, Zhenwei Shi, Andre Dekker, Leonard Wee, Inigo Bermejo | 2022 | Medical Physics | vol 49 | no 5 | pages 3134--3143 | doi 10.1002/mp.15539
OpenAlex: ratio 1.00: Lung cancer diagnosis using deep attention<hyphen>based multiple instance learning and radiomics | Junhua Chen, Haiyan Zeng, Chong Zhang, Zhenwei Shi, Andre L.A.J. Dekker, Leonard Wee, I<latin small letter n with tilde>igo Bermejo | 2022 | Medical Physics | vol 49 | no 5 | pages 3134--3143 | doi 10.1002/mp.15539 | OpenAlex W4212862206 | open access https://doi.org/10.1002/mp.15539
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### han2020accurate
Command: python3 lookup resolve '10.1109/tmi.2020.2996256'
```
Crossref: ratio 1.00: Accurate Screening of COVID-19 Using Attention-Based Deep 3D Multiple Instance Learning | Zhongyi Han, Benzheng Wei, Yanfei Hong, Tianyang Li, Jinyu Cong, Xue Zhu, Haifeng Wei, Wei Zhang | 2020 | IEEE Transactions on Medical Imaging | vol 39 | no 8 | pages 2584--2594 | doi 10.1109/tmi.2020.2996256
OpenAlex: ratio 1.00: Accurate Screening of COVID-19 Using Attention-Based Deep 3D Multiple Instance Learning | Zhongyi Han, Benzheng Wei, Yanfei Hong, Tianyang Li, Jinyu Cong, Xue Li Zhu, Haifeng Wei, Wei Zhang | 2020 | IEEE Transactions on Medical Imaging | vol 39 | no 8 | pages 2584--2594 | doi 10.1109/tmi.2020.2996256 | OpenAlex W3026931681
Semantic Scholar: ratio 1.00: Accurate Screening of COVID-19 Using Attention-Based Deep 3D Multiple Instance Learning | Zhongyi Han, Benzheng Wei, Yanfei Hong, Tianyang Li, J. Cong, Xue Zhu, Hai-Feng Wei, Wei Zhang | 2020 | IEEE Transactions on Medical Imaging | vol 39 | pages 2584--2594 | doi 10.1109/TMI.2020.2996256 | Semantic Scholar 3da67830920c0c240add66874962fedf25024f98
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wang2020hierarchical
Command: python3 lookup resolve '10.1109/bibm49941.2020.9313417'
```
Crossref: ratio 1.00: Hierarchical Attention-Based Multiple Instance Learning Network for Patient-Level Lung Cancer Diagnosis | Qingfeng Wang, Ying Zhou, Jun Huang, Zhiqin Liu, Ling Li, Weiyun Xu, Jie-Zhi Cheng | 2020 | 2020 IEEE International Conference on Bioinformatics and Biomedicine (BIBM) | pages 1156--1160 | doi 10.1109/bibm49941.2020.9313417
OpenAlex: ratio 1.00: Hierarchical Attention-Based Multiple Instance Learning Network for Patient-Level Lung Cancer Diagnosis | Qingfeng Wang, Ying Zhou, Jun Huang, Zhiqin Liu, Ling Li, Wei-Yun Xu, Jie<hyphen>Zhi Cheng | 2020 | IEEE International Conference on Bioinformatics and Biomedicine (BIBM) | pages 1156--1160 | doi 10.1109/bibm49941.2020.9313417 | OpenAlex W3129124420
Semantic Scholar: ratio 1.00: Hierarchical Attention-Based Multiple Instance Learning Network for Patient-Level Lung Cancer Diagnosis | Qing-Feng Wang, Ying Zhou, Jun Huang, Zhi-Qin Liu, Ling Li, Wei-Yun Xu, Jie-Zhi Cheng | 2020 | IEEE International Conference on Bioinformatics and Biomedicine | pages 1156--1160 | doi 10.1109/BIBM49941.2020.9313417 | Semantic Scholar 569cb6e8dc5eafd6ccd838f715cb5aefdebcad89
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### qaiser2021multiple
Command: python3 lookup resolve '10.1007/978-3-030-87234-2_74'
```
Crossref: ratio 1.00: Multiple Instance Learning with Auxiliary Task Weighting for Multiple Myeloma Classification | Talha Qaiser, Stefan Winzeck, Theodore Barfoot, Tara Barwick, Simon J. Doran, Martin F. Kaiser, Linda Wedlake, Nina Tunariu, Dow-Mu Koh, Christina Messiou, Andrea Rockall, Ben Glocker | 2021 | Lecture Notes in Computer Science | pages 786--796 | doi 10.1007/978-3-030-87234-2_74
OpenAlex: ratio 1.00: Multiple Instance Learning with Auxiliary Task Weighting for Multiple Myeloma Classification | Talha Qaiser, Stefan Winzeck, Theodore Barfoot, Tara D. Barwick, Simon Doran, Martin Kaiser, Linda J. Wedlake, Nina Tunariu, Dow<hyphen>Mu Koh, Christina Messiou, Andrea Rockall, Ben Glocker | 2021 | Lecture notes in computer science | pages 786--796 | doi 10.1007/978-3-030-87234-2_74 | OpenAlex W3201930041 | open access https://arxiv.org/pdf/2107.07805
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### shao2022patient
Command: python3 lookup resolve '10.1016/j.compbiomed.2022.106168'
```
Crossref: ratio 1.00: Patient-level grading prediction of prostate cancer from mp-MRI via GMINet | Lizhi Shao, Zhenyu Liu, Jiangang Liu, Ye Yan, Kai Sun, Xiangyu Liu, Jian Lu, Jie Tian | 2022 | Computers in Biology and Medicine | vol 150 | pages 106168 | doi 10.1016/j.compbiomed.2022.106168
OpenAlex: ratio 1.00: Patient-level grading prediction of prostate cancer from mp-MRI via GMINet | Lizhi Shao, Zhenyu Liu, Jiangang Liu, Ye Yan, Kai Sun, Xiangyu Liu, Jian Guo Lu, Jie Tian | 2022 | Computers in Biology and Medicine | vol 150 | pages 106168--106168 | doi 10.1016/j.compbiomed.2022.106168 | OpenAlex W4302009754
Semantic Scholar: ratio 1.00: Patient-level grading prediction of prostate cancer from mp-MRI via GMINet | Lizhi Shao, Zhen-Yu Liu, Jian-Gang Liu, Ye Yan, Kai Sun, Xiang-Yu Liu, Jian Lu, Jie Tian | 2022 | Comput. Biol. Medicine | vol 150 | pages 106168 | doi 10.1016/j.compbiomed.2022.106168 | Semantic Scholar c669ffda567ec908686df1ee0b70bc5f08ee9c28
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xu2024hybrid
Command: python3 lookup resolve '10.1016/j.cmpb.2023.107872'
```
Crossref: ratio 1.00: A hybrid few-shot multiple-instance learning model predicting the aggressiveness of lymphoma in PET/CT images | Caiwen Xu, Jie Feng, Yong Yue, Wanjun Cheng, Dianning He, Shouliang Qi, Guojun Zhang | 2024 | Computer Methods and Programs in Biomedicine | vol 243 | pages 107872 | doi 10.1016/j.cmpb.2023.107872
OpenAlex: ratio 1.00: A hybrid few-shot multiple-instance learning model predicting the aggressiveness of lymphoma in PET/CT images | Caiwen Xu, Jie Feng, Yong Yue, Wanjun Cheng, Dianning He, Shouliang Qi, Guojun Zhang | 2023 | Computer Methods and Programs in Biomedicine | vol 243 | pages 107872--107872 | doi 10.1016/j.cmpb.2023.107872 | OpenAlex W4387709474
Semantic Scholar: ratio 1.00: A hybrid few-shot multiple-instance learning model predicting the aggressiveness of lymphoma in PET/CT images | Caiwen Xu, Jie Feng, Yong Yue, Wanjun Cheng, Dianning He, Shou-Liang Qi, Guo-Jun Zhang | 2023 | Comput. Methods Programs Biomed. | vol 243 | pages 107872 | doi 10.1016/j.cmpb.2023.107872 | Semantic Scholar a26876a071cdb44ba6da2338a326e0ca88e7ad28
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zare2025permutation
Command: python3 lookup resolve '10.34067/kid.0000000668'
```
Crossref: ratio 1.00: Permutation-Invariant Cascaded Attentional Set Operator for Computational Nephropathology | Samira Zare, Huy Q. Vo, Nicola Altini, Vitoantonio Bevilacqua, Michele Rossini, Francesco Pesce, Loreto Gesualdo, S<latin small letter a with acute>ndor Turkevi-Nagy, Jan Ulrich Becker, Chandra Mohan, Hien Van Nguyen | 2025 | Kidney360 | vol 6 | no 3 | pages 441--450 | doi 10.34067/kid.0000000668
OpenAlex: ratio 1.00: Permutation-Invariant Cascaded Attentional Set Operator for Computational Nephropathology | Samira Zare, Huy Q. Vo, Nicola Altini, Vitoantonio Bevilacqua, Michele Rossini, Francesco Pesce, Loreto Gesualdo, S<latin small letter a with acute>ndor T<latin small letter u with acute>rkevi-Nagy, Jan Ulrich Becker, Chandra Mohan, Hien Van Nguyen | 2025 | Kidney360 | vol 6 | no 3 | pages 441--450 | doi 10.34067/kid.0000000668 | OpenAlex W4408102739 | open access https://doi.org/10.34067/kid.0000000668
Semantic Scholar: ratio 1.00: Permutation-Invariant Cascaded Attentional Set Operator for Computational Nephropathology | Samira Zare, H. Vo, Nicola Altini, V. Bevilacqua, M. Rossini, F. Pesce, L. Gesualdo, S<latin small letter a with acute>ndor Turkevi-Nagy, J. Becker, Chandra Mohan, Hien Van Nguyen | 2025 | Kidney360 | vol 6 | pages 441--450 | doi 10.34067/KID.0000000668 | Semantic Scholar 848eda6617e1f66499750de79e0eb986822f8e85 | open access https://doi.org/10.34067/kid.0000000668
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### collenne2024reset
Command: python3 lookup resolve '10.1109/icip51287.2024.10647287'
```
Crossref: ratio 1.00: Reset: A Residual Set-Transformer Approach to Tackle the Ugly-Duckling Sign in Melanoma Detection | Jules Collenne, Rabah Iguernaissi, S<latin small letter e with acute>verine Dubuisson, Djamal Merad | 2024 | 2024 IEEE International Conference on Image Processing (ICIP) | pages 3186--3191 | doi 10.1109/icip51287.2024.10647287
OpenAlex: ratio 1.00: Reset: A Residual Set-Transformer Approach to Tackle the Ugly-Duckling Sign in Melanoma Detection | Jules Collenne, Rabah Iguernaissi, S<latin small letter e with acute>verine Dubuisson, Djamal Merad | 2024 | Proceedings - International Conference on Image Processing | pages 3186--3191 | doi 10.1109/icip51287.2024.10647287 | OpenAlex W4402916094 | open access https://amu.hal.science/hal-05595262v1/document
Semantic Scholar: ratio 1.00: Reset: A Residual Set-Transformer Approach to Tackle the Ugly-Duckling Sign in Melanoma Detection | J. Collenne, R. Iguernaissi, S<latin small letter e with acute>verine Dubuisson, Djamel Merad | 2024 | International Conference on Information Photonics | pages 3186--3191 | doi 10.1109/icip51287.2024.10647287 | Semantic Scholar b21969fc68f85e46257c13385b070066600f8740 | open access https://amu.hal.science/hal-05595262v1/document
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### sanchez2026quality
Command: python3 lookup resolve '10.1007/s00330-026-12601-9'
```
Crossref: ratio 1.00: Quality over quantity: biopsy-anchored CT radiogenomics models outperform all-lesion training in a multi-tumour cohort despite a smaller sample size | Diana Ivonne Rodr<latin small letter i with acute>guez S<latin small letter a with acute>nchez, Julian Middelkoop, Thera Vanneste, Olga Maxouri, Stephan Ursprung, Sajjad Rostami, Nino Bogveradze, Kalina Chupetlovska, Francesca Castagnoli, Federica Landolfi, Eun Kyoung Hong, Andrea Delli Pizzi, Nicolo Gennaro, Warissara Jutidamrongphan, Liliana Petrychenko, Petur Snaebjornsson, Zuhir Bodalal, Regina Beets-Tan | 2026 | European Radiology | vol 36 | no 10 | pages 7473--7489 | doi 10.1007/s00330-026-12601-9
OpenAlex: ratio 1.00: Quality over quantity: biopsy-anchored CT radiogenomics models outperform all-lesion training in a multi-tumour cohort despite a smaller sample size | Diana Ivonne Rodr<latin small letter i with acute>guez S<latin small letter a with acute>nchez, Julian Middelkoop, Thera Vanneste, Olga Maxouri, Stephan Ursprung, Sajjad Rostami, Nino Bogveradze, Kalina Chupetlovska, Francesca Castagnoli, Federica Landolfi, Eun Kyoung Hong, Andrea Delli Pizzi, Nicol<latin small letter o with grave> Gennaro, Warissara Jutidamrongphan, Liliana Petrychenko, Petur Snaebjornsson, Zuhir Bodalal, Regina G. H. Beets<hyphen>Tan | 2026 | European Radiology | vol 36 | no 10 | pages 7473--7489 | doi 10.1007/s00330-026-12601-9 | OpenAlex W7161445842 | open access https://link.springer.com/content/pdf/10.1007/s00330-026-12601-9.pdf
Semantic Scholar: ratio 1.00: Quality over quantity: biopsy-anchored CT radiogenomics models outperform all-lesion training in a multi-tumour cohort despite a smaller sample size | D. I. Rodr<latin small letter i with acute>guez S<latin small letter a with acute>nchez, Julian Middelkoop, T. Vanneste, O. Maxouri, S. Ursprung, S. Rostami, N. Bogveradze, K. Chupetlovska, F. Castagnoli, F. Landolfi, Eun Kyoung Hong, Andrea Delli Pizzi, N. Gennaro, W. Jutidamrongphan, L. Petrychenko, P. Snaebjornsson, Z. Bodalal, R. Beets-Tan | 2026 | European Radiology | vol 36 | pages 7473--7489 | doi 10.1007/s00330-026-12601-9 | Semantic Scholar d352fb101cd8e110ec54b11d603aa1a0351137ea | open access https://link.springer.com/content/pdf/10.1007/s00330-026-12601-9.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gacheva2026multiple
Command: python3 lookup resolve '10.1016/j.ynirp.2026.100418'
```
Crossref: ratio 1.00: Multiple instance learning for differentiating neoplastic and non-neoplastic brain lesions using MR spectroscopy | Iskra Gacheva, Diyuan Lu, Gerhard Kurz, Jochen Triesch, Elke Hattingen, Nenad Polomac | 2026 | NeuroImage: Reports | vol 6 | no 4 | pages 100418 | doi 10.1016/j.ynirp.2026.100418
OpenAlex: ratio 1.00: Multiple instance learning for differentiating neoplastic and non-neoplastic brain lesions using MR spectroscopy | Iskra Gacheva, Diyuan Lu, Gerhard Kurz, Jochen Triesch, Elke Hattingen, Nenad Polomac | 2026 | Neuroimage Reports | vol 6 | no 4 | pages 100418--100418 | doi 10.1016/j.ynirp.2026.100418 | OpenAlex W7222783581 | open access https://doi.org/10.1016/j.ynirp.2026.100418
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2024tractgeonet
Command: python3 lookup resolve '10.1016/j.media.2024.103120'
```
Crossref: ratio 1.00: TractGeoNet: A geometric deep learning framework for pointwise analysis of tract microstructure to predict language assessment performance | Yuqian Chen, Leo R. Zekelman, Chaoyi Zhang, Tengfei Xue, Yang Song, Nikos Makris, Yogesh Rathi, Alexandra J. Golby, Weidong Cai, Fan Zhang, Lauren J. O'Donnell | 2024 | Medical Image Analysis | vol 94 | pages 103120 | doi 10.1016/j.media.2024.103120
OpenAlex: ratio 1.00: TractGeoNet: A geometric deep learning framework for pointwise analysis of tract microstructure to predict language assessment performance | Yuqian Chen, Leo Zekelman, Chaoyi Zhang, Tengfei Xue, Yang Song, Nikos Makris, Yogesh Rathi, Alexandra J. Golby, Weidong Cai, Fan Zhang, Lauren J. O<right single quotation mark>Donnell | 2024 | Medical Image Analysis | vol 94 | pages 103120--103120 | doi 10.1016/j.media.2024.103120 | OpenAlex W4392123044 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841524000458
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### luo2023prediction
Command: python3 lookup resolve '10.1136/neurintsurg-2022-018655'
```
Crossref: ratio 1.00: Prediction of cerebral aneurysm rupture using a point cloud neural network | Xiaoyuan Luo, Jienan Wang, Xinmei Liang, Lei Yan, XinHua Chen, Jian He, Jing Luo, Bing Zhao, Guangchen He, Manning Wang, Yueqi Zhu | 2022 | Journal of NeuroInterventional Surgery | vol 15 | no 4 | pages 380--386 | doi 10.1136/neurintsurg-2022-018655
OpenAlex: ratio 1.00: Prediction of cerebral aneurysm rupture using a point cloud neural network | Xiaoyuan Luo, Jienan Wang, Xinmei Liang, Lei Yan, XinHua Chen, Jian He, Jing Luo, Bing Zhao, Guangchen He, Manning Wang, Yueqi Zhu | 2022 | Journal of NeuroInterventional Surgery | vol 15 | no 4 | pages 380--386 | doi 10.1136/neurintsurg-2022-018655 | OpenAlex W4223459101
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bizjak2021deep
Command: python3 lookup resolve '10.3389/fphys.2021.644349'
```
Crossref: ratio 1.00: Deep Shape Features for Predicting Future Intracranial Aneurysm Growth | <latin capital letter z with caron>iga Bizjak, Franjo Pernu<latin small letter s with caron>, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin | 2021 | Frontiers in Physiology | vol 12 | doi 10.3389/fphys.2021.644349
OpenAlex: ratio 1.00: Deep Shape Features for Predicting Future Intracranial Aneurysm Growth | <latin capital letter z with caron>iga Bizjak, Franjo Pernu<latin small letter s with caron>, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin | 2021 | Frontiers in Physiology | vol 12 | pages 644349--644349 | doi 10.3389/fphys.2021.644349 | OpenAlex W3186101700 | open access https://www.frontiersin.org/articles/10.3389/fphys.2021.644349/pdf
Semantic Scholar: ratio 1.00: Deep Shape Features for Predicting Future Intracranial Aneurysm Growth | <latin capital letter z with caron>. Bizjak, F. Pernus, <latin capital letter z with caron>. <latin capital letter s with caron>piclin | 2021 | Frontiers in Physiology | vol 12 | doi 10.3389/fphys.2021.644349 | Semantic Scholar a861be9bb61c53a6cce17ff10b848e9aeb545d74 | open access https://www.frontiersin.org/articles/10.3389/fphys.2021.644349/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### choi2025prediction
Command: python3 lookup resolve '10.1016/j.compbiomed.2025.110965'
```
Crossref: ratio 1.00: Prediction of intracranial aneurysm rupture from computed tomography angiography using an automated artificial intelligence framework | June Ho Choi, Jannik Sobisch, Minwoo Kim, Jung Cheol Park, Jae Sung Ahn, Byung Duk Kwun, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin, <latin capital letter z with caron>iga Bizjak, Wonhyoung Park | 2025 | Computers in Biology and Medicine | vol 197 | pages 110965 | doi 10.1016/j.compbiomed.2025.110965
OpenAlex: ratio 1.00: Prediction of intracranial aneurysm rupture from computed tomography angiography using an automated artificial intelligence framework | June Ho Choi, Jannik Sobisch, Min-Woo Kim, Jung Cheol Park, Jae Sung Ahn, Byung Duk Kwun, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin, <latin capital letter z with caron>iga Bizjak, Wonhyoung Park | 2025 | Computers in Biology and Medicine | vol 197 | no Pt A | pages 110965--110965 | doi 10.1016/j.compbiomed.2025.110965 | OpenAlex W4414031971 | open access https://doi.org/10.1016/j.compbiomed.2025.110965
Semantic Scholar: ratio 1.00: Prediction of intracranial aneurysm rupture from computed tomography angiography using an automated artificial intelligence framework | J. Choi, J. Sobisch, Minwoo Kim, J. Park, J. Ahn, B. Kwun, <latin capital letter z with caron>. <latin capital letter s with caron>piclin, <latin capital letter z with caron>. Bizjak, Wonhyoung Park | 2025 | Comput. Biol. Medicine | vol 197 Pt A | pages 110965 | doi 10.1016/j.compbiomed.2025.110965 | Semantic Scholar 1a460825134426ef4228e1d1e1ba671948dff4e7 | open access https://doi.org/10.1016/j.compbiomed.2025.110965
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dole2025enhancing
Command: python3 lookup resolve '10.1007/s11548-025-03527-6'
```
Crossref: ratio 1.00: Enhancing airway obstruction diagnosis with multimodal 3D shape analysis | Lucie Dole, Claudia Trindade Mattos, Jonas Bianchi, Heesoo Oh, Karine Evangelista, Jos<latin small letter e with acute> Valladares Neto, Sergio Luiz Mota-J<latin small letter u with acute>nior, Lucia Cevidanes, Juan Carlos Prieto | 2025 | International Journal of Computer Assisted Radiology and Surgery | vol 21 | no 3 | pages 529--538 | doi 10.1007/s11548-025-03527-6
OpenAlex: ratio 1.00: Enhancing airway obstruction diagnosis with multimodal 3D shape analysis | Lucie Dole, Cl<latin small letter a with acute>udia Trindade Mattos, Jonas Bianchi, Heesoo Oh, Karine Evangelista, Jos<latin small letter e with acute> Valladares Neto, Sergio Luiz Mota J<latin small letter u with acute>nior, Luc<latin small letter i with acute>a Cevidanes, Juan Carlos Prieto | 2025 | International Journal of Computer Assisted Radiology and Surgery | vol 21 | no 3 | pages 529--538 | doi 10.1007/s11548-025-03527-6 | OpenAlex W4415153925
Semantic Scholar: ratio 1.00: Enhancing airway obstruction diagnosis with multimodal 3D shape analysis | Lucie Dole, Claudia Mattos, J. Bianchi, Heesoo Oh, K. Evangelista, J. Valladares-Neto, S. Mota-J<latin small letter u with acute>nior, L. Cevidanes, J. Prieto | 2025 | International Journal of Computer Assisted Radiology and Surgery | doi 10.1007/s11548-025-03527-6 | Semantic Scholar d9a20c5f934301dfa0f62997fb0290e15cbd5df5
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yang2025pointchd
Command: python3 lookup resolve '10.1109/jbhi.2024.3495035'
```
Crossref: ratio 1.00: PointCHD: A Point Cloud Benchmark for Congenital Heart Disease Classification and Segmentation | Dinghao Yang, Wei Gao | 2025 | IEEE Journal of Biomedical and Health Informatics | vol 29 | no 4 | pages 2683--2694 | doi 10.1109/jbhi.2024.3495035
OpenAlex: ratio 1.00: PointCHD: A Point Cloud Benchmark for Congenital Heart Disease Classification and Segmentation | Dinghao Yang, Wei Gao | 2024 | IEEE Journal of Biomedical and Health Informatics | vol 29 | no 4 | pages 2683--2694 | doi 10.1109/jbhi.2024.3495035 | OpenAlex W4404179127
Semantic Scholar: ratio 1.00: PointCHD: A Point Cloud Benchmark for Congenital Heart Disease Classification and Segmentation | Dinghao Yang, Wei Gao | 2024 | IEEE journal of biomedical and health informatics | vol 29 | pages 2683--2694 | doi 10.1109/JBHI.2024.3495035 | Semantic Scholar 8a37e921aa94c13e7f1279f446773ee3e36ca8b4
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### beetz20253d
Command: python3 lookup resolve '10.1016/j.compmedimag.2025.102587'
```
Crossref: ratio 1.00: 3D cardiac shape analysis with variational point cloud autoencoders for myocardial infarction prediction and virtual heart synthesis | Marcel Beetz, Abhirup Banerjee, Lei Li, Julia Camps, Blanca Rodriguez, Vicente Grau | 2025 | Computerized Medical Imaging and Graphics | vol 124 | pages 102587 | doi 10.1016/j.compmedimag.2025.102587
OpenAlex: ratio 1.00: 3D cardiac shape analysis with variational point cloud autoencoders for myocardial infarction prediction and virtual heart synthesis | Marcel Beetz, Abhirup Banerjee, Lei Li, Juli<latin small letter a with grave> Camps, Blanca Rodr<latin small letter i with acute>guez, Vicente Grau | 2025 | Computerized Medical Imaging and Graphics | vol 124 | pages 102587--102587 | doi 10.1016/j.compmedimag.2025.102587 | OpenAlex W4411450327 | open access https://doi.org/10.1016/j.compmedimag.2025.102587
Semantic Scholar: ratio 1.00: 3D cardiac shape analysis with variational point cloud autoencoders for myocardial infarction prediction and virtual heart synthesis | M. Beetz, Abhirup Banerjee, Lei Li, J. Camps, Blanca Rodr<latin small letter i with acute>guez, V. Grau | 2025 | Comput. Medical Imaging Graph. | vol 124 | pages 102587--102587 | doi 10.1016/j.compmedimag.2025.102587 | Semantic Scholar 19efb94a9ff456272b5113158419a15b3b35868c | open access https://doi.org/10.1016/j.compmedimag.2025.102587
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### beetz20233d
Command: python3 lookup resolve '10.1109/embc40787.2023.10340878'
```
Crossref: ratio 1.00: 3D Shape-Based Myocardial Infarction Prediction Using Point Cloud Classification Networks | Marcel Beetz, Yilong Yang, Abhirup Banerjee, Lei Li, Vicente Grau | 2023 | 2023 45th Annual International Conference of the IEEE Engineering in Medicine &amp; Biology Society (EMBC) | pages 1--4 | doi 10.1109/embc40787.2023.10340878
OpenAlex: ratio 1.00: 3D Shape-Based Myocardial Infarction Prediction Using Point Cloud Classification Networks | Marcel Beetz, Yilong Yang, Abhirup Banerjee, Lei Li, Vicente Grau | 2023 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC) | vol 2023 | pages 1--4 | doi 10.1109/embc40787.2023.10340878 | OpenAlex W4389542902 | open access https://ora.ox.ac.uk/objects/uuid:3d74cf55-6626-4af7-a261-45927118be4a/files/s8049g6327
Semantic Scholar: ratio 1.00: 3D Shape-Based Myocardial Infarction Prediction Using Point Cloud Classification Networks | M. Beetz, Yi-Lun Yang, Abhirup Banerjee, Lei Li, V. Grau | 2023 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society | pages 1--4 | doi 10.1109/EMBC40787.2023.10340878 | arXiv 2307.07298 | Semantic Scholar 10b31aca484ae85a975c6c853b0f7455fc637b82 | open access https://ora.ox.ac.uk/objects/uuid:3d74cf55-6626-4af7-a261-45927118be4a/files/s8049g6327
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### devries2025geometric
Command: python3 lookup resolve '10.1016/j.cels.2025.101229'
```
Crossref: ratio 1.00: Geometric deep learning and multiple-instance learning for 3D cell-shape profiling | Matt De Vries, Lucas G. Dent, Nathan Curry, Leo Rowe-Brown, Vicky Bousgouni, Olga Fourkioti, Reed Naidoo, Hugh Sparks, Adam Tyson, Chris Dunsby, Chris Bakal | 2025 | Cell Systems | vol 16 | no 3 | pages 101229 | doi 10.1016/j.cels.2025.101229
OpenAlex: ratio 1.00: Geometric deep learning and multiple-instance learning for 3D cell-shape profiling | Matt De Vries, Lucas Dent, Nathan Curry, Leo Rowe-Brown, Vicky Bousgouni, Olga Fourkioti, Reed Naidoo, Hugh Sparks, Adam L. Tyson, Christopher W. Dunsby, Chris Bakal | 2025 | Cell Systems | vol 16 | no 3 | pages 101229--101229 | doi 10.1016/j.cels.2025.101229 | OpenAlex W4408591508 | open access https://doi.org/10.1016/j.cels.2025.101229
Semantic Scholar: ratio 1.00: Geometric deep learning and multiple-instance learning for 3D cell-shape profiling. | Matt De Vries, Lucas G. Dent, Nathan Curry, L. Rowe-Brown, V. Bousgouni, Olga Fourkioti, Reed Naidoo, H. Sparks, Adam L. Tyson, C. Dunsby, C. Bakal | 2025 | Cell Systems | vol 16 3 | pages 101229 | doi 10.1016/j.cels.2025.101229 | Semantic Scholar d16984905e8122b6c3127cf3a78370f6abe0af17 | open access https://doi.org/10.1016/j.cels.2025.101229
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### besson2021geometric
Command: python3 lookup resolve '10.1016/j.compmedimag.2021.101939'
```
Crossref: ratio 1.00: Geometric deep learning on brain shape predicts sex and age | Pierre Besson, Todd Parrish, Aggelos K. Katsaggelos, S. Kathleen Bandt | 2021 | Computerized Medical Imaging and Graphics | vol 91 | pages 101939 | doi 10.1016/j.compmedimag.2021.101939
OpenAlex: ratio 1.00: Geometric deep learning on brain shape predicts sex and age | Pierre Besson, Todd B. Parrish, Aggelos K. Katsaggelos, S. Kathleen Bandt | 2021 | Computerized Medical Imaging and Graphics | vol 91 | pages 101939--101939 | doi 10.1016/j.compmedimag.2021.101939 | OpenAlex W3165181154 | open access https://www.biorxiv.org/content/biorxiv/early/2020/06/29/2020.06.29.177543.full.pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wu2022multicohort
Command: python3 lookup resolve '10.1038/s41598-022-22313-x'
```
Crossref: ratio 1.00: A multicohort geometric deep learning study of age dependent cortical and subcortical morphologic interactions for fluid intelligence prediction | Yunan Wu, Pierre Besson, Emanuel A. Azcona, S. Kathleen Bandt, Todd B. Parrish, Hans C. Breiter, Aggelos K. Katsaggelos | 2022 | Scientific Reports | vol 12 | no 1 | doi 10.1038/s41598-022-22313-x
OpenAlex: ratio 1.00: A multicohort geometric deep learning study of age dependent cortical and subcortical morphologic interactions for fluid intelligence prediction | Yunan Wu, Pierre Besson, Emanuel A. Azcona, S. Kathleen Bandt, Todd B. Parrish, Hans C. Breiter, Aggelos K. Katsaggelos | 2022 | Scientific Reports | vol 12 | no 1 | pages 17760--17760 | doi 10.1038/s41598-022-22313-x | OpenAlex W4307138778 | open access https://www.nature.com/articles/s41598-022-22313-x.pdf
Semantic Scholar: ratio 1.00: A multicohort geometric deep learning study of age dependent cortical and subcortical morphologic interactions for fluid intelligence prediction | Yu-Nan Wu, P. Besson, Emanuel A. Azcona, S. Bandt, T. Parrish, H. Breiter, A. Katsaggelos | 2022 | Scientific Reports | vol 12 | doi 10.1038/s41598-022-22313-x | Semantic Scholar ec61a11d62904968c7f7c5bbab3fcf9c92572761 | open access https://www.nature.com/articles/s41598-022-22313-x.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### sarasua2021geometric
Command: python3 lookup resolve '10.1109/isbi48211.2021.9433948'
```
Crossref: ratio 1.00: Geometric Deep Learning on Anatomical Meshes for the Prediction of Alzheimer<right single quotation mark>s Disease | Ignacio Sarasua, Jonwong Lee, Christian Wachinger | 2021 | 2021 IEEE 18th International Symposium on Biomedical Imaging (ISBI) | doi 10.1109/isbi48211.2021.9433948
OpenAlex: ratio 1.00: Geometric Deep Learning on Anatomical Meshes for the Prediction of Alzheimer<right single quotation mark>s Disease | Ignacio Saras<latin small letter u with acute>a, Jonwong Lee, Christian Wachinger | 2021 | IEEE International Symposium on Biomedical Imaging (ISBI) | doi 10.1109/isbi48211.2021.9433948 | OpenAlex W3153231516 | open access https://arxiv.org/pdf/2104.10047
Semantic Scholar: ratio 1.00: Geometric Deep Learning on Anatomical Meshes for the Prediction of Alzheimer<right single quotation mark>s Disease | Ignacio Saras<latin small letter u with acute>a, Jonwon Lee, C. Wachinger | 2021 | IEEE International Symposium on Biomedical Imaging | pages 1356--1359 | doi 10.1109/ISBI48211.2021.9433948 | arXiv 2104.10047 | Semantic Scholar 62b3ba25d406727e1456afd7960f7b7cf15899ed | open access https://arxiv.org/pdf/2104.10047
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### vosylius2020geometric
Command: python3 lookup resolve '10.1007/978-3-030-60365-6_17'
```
Crossref: ratio 1.00: Geometric Deep Learning for Post-Menstrual Age Prediction Based on the Neonatal White Matter Cortical Surface | Vitalis Vosylius, Andy Wang, Cemlyn Waters, Alexey Zakharov, Francis Ward, Loic Le Folgoc, John Cupitt, Antonios Makropoulos, Andreas Schuh, Daniel Rueckert, Amir Alansary | 2020 | Lecture Notes in Computer Science | pages 174--186 | doi 10.1007/978-3-030-60365-6_17
OpenAlex: ratio 1.00: Geometric Deep Learning for Post-Menstrual Age Prediction Based on the Neonatal White Matter Cortical Surface | Vitalis Vosylius, Andy Yu-Der Wang, Cemlyn Waters, Alexey Zakharov, Francis Rhys Ward, Lo<latin small letter i with diaeresis>c Le Folgoc, John Cupitt, Antonios Makropoulos, Andreas Schuh, Daniel Rueckert, Amir Alansary | 2020 | Lecture notes in computer science | pages 174--186 | doi 10.1007/978-3-030-60365-6_17 | OpenAlex W3049720528 | open access https://arxiv.org/pdf/2008.06098
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### jia20243d
Command: python3 lookup resolve '10.1016/j.compbiomed.2024.109192'
```
Crossref: ratio 1.00: Using 3D point cloud and graph-based neural networks to improve the estimation of pulmonary function tests from chest CT | Jingnan Jia, Bo Yu, Prerak Mody, Maarten K. Ninaber, Anne A. Schouffoer, Jeska K. de Vries-Bouwstra, Lucia J.M. Kroft, Marius Staring, Berend C. Stoel | 2024 | Computers in Biology and Medicine | vol 182 | pages 109192 | doi 10.1016/j.compbiomed.2024.109192
OpenAlex: ratio 1.00: Using 3D point cloud and graph-based neural networks to improve the estimation of pulmonary function tests from chest CT | Jingnan Jia, Bo Yu, Prerak Mody, Maarten K. Ninaber, Anne A. Schouffoer, Jeska Kirsten De Vries-Bouwstra, Lucia J.M. Kroft, Marius Staring, Berend C. Stoel | 2024 | Computers in Biology and Medicine | vol 182 | pages 109192--109192 | doi 10.1016/j.compbiomed.2024.109192 | OpenAlex W4402900165 | open access https://doi.org/10.1016/j.compbiomed.2024.109192
Semantic Scholar: ratio 1.00: Using 3D point cloud and graph-based neural networks to improve the estimation of pulmonary function tests from chest CT | Jing-Nan Jia, Bo Yu, Prerak Mody, M. Ninaber, A. Schouffoer, J. de Vries-Bouwstra, L. Kroft, M. Staring, B. Stoel | 2024 | Comput. Biol. Medicine | vol 182 | pages 109192 | doi 10.1016/j.compbiomed.2024.109192 | Semantic Scholar b816c213b4af31cb05708d28a9c8f30eb19d9a1f | open access https://doi.org/10.1016/j.compbiomed.2024.109192
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2026screening
Command: python3 lookup resolve '10.64898/2026.11.12.766227'
```
Crossref: ratio 1.00: From Screening to Differential Diagnosis: Benchmarking 3D Facial Representations Across Craniofacial Conditions | Tingting Chen, Mian Umair Ahsan, Justin Cotney, Eric C. Liao, Kai Wang | 2026 | doi 10.64898/2026.11.12.766227
OpenAlex: ratio 1.00: From Screening to Differential Diagnosis: Benchmarking 3D Facial Representations Across Craniofacial Conditions | Tingting Chen, Mian Umair Ahsan, Justin L. Cotney, Eric Chien-Wei Liao, Kai Wang | 2026 | bioRxiv (Cold Spring Harbor Laboratory) | doi 10.64898/2026.11.12.766227 | OpenAlex W7233561349 | open access https://www.biorxiv.org/content/biorxiv/early/2026/11/14/2026.11.12.766227.full.pdf
Semantic Scholar: ratio 1.00: From Screening to Differential Diagnosis: Benchmarking 3D Facial Representations Across Craniofacial Conditions | Ting-Ting Chen, Mian Umair Ahsan, J. Cotney, E. Liao, Kai Wang | 2026 | bioRxiv | doi 10.64898/2026.11.12.766227 | Semantic Scholar 16d7181e2a09749ca16f1b9798068144a0179c2d | open access https://www.biorxiv.org/content/biorxiv/early/2026/11/14/2026.11.12.766227.full.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ravikumar2019generalised
Command: python3 lookup resolve '10.1016/j.media.2019.01.001'
```
Crossref: ratio 1.00: Generalised coherent point drift for group-wise multi-dimensional analysis of diffusion brain MRI data | Nishant Ravikumar, Ali Gooya, Leandro Beltrachini, Alejandro F. Frangi, Zeike A. Taylor | 2019 | Medical Image Analysis | vol 53 | pages 47--63 | doi 10.1016/j.media.2019.01.001
OpenAlex: ratio 1.00: Generalised coherent point drift for group-wise multi-dimensional analysis of diffusion brain MRI data | Nishant Ravikumar, Ali Gooya, Leandro Beltrachini, Alejandro Federico Frangi, Zeike A. Taylor | 2019 | Medical Image Analysis | vol 53 | pages 47--63 | doi 10.1016/j.media.2019.01.001 | OpenAlex W2909443694 | open access https://orca.cardiff.ac.uk/id/eprint/118318/
Semantic Scholar: ratio 1.00: Generalised coherent point drift for group<hyphen>wise multi<hyphen>dimensional analysis of diffusion brain MRI data | N. Ravikumar, A. Gooya, L. Beltrachini, Alejandro F Frangi, Z. Taylor | 2019 | Medical Image Anal. | vol 53 | pages 47<en dash>63 | doi 10.1016/j.media.2019.01.001 | Semantic Scholar ff506be8d5b401bf4b915bf2239d8c266893c61e | open access https://orca.cardiff.ac.uk/id/eprint/118318/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### hering2023learn2reg
Command: python3 lookup resolve '10.1109/tmi.2022.3213983'
```
Crossref: ratio 1.00: Learn2Reg: Comprehensive Multi-Task Medical Image Registration Challenge, Dataset and Evaluation in the Era of Deep Learning | Alessa Hering, Lasse Hansen, Tony C. W. Mok, Albert C. S. Chung, Hanna Siebert, Stephanie Hager, Annkristin Lange, Sven Kuckertz, Stefan Heldmann, Wei Shao, Sulaiman Vesal, Mirabela Rusu, Geoffrey Sonn, Theo Estienne, Maria Vakalopoulou, Luyi Han, Yunzhi Huang, Pew-Thian Yap, Mikael Brudfors, Yael Balbastre, Samuel Joutard, Marc Modat, Gal Lifshitz, Dan Raviv, Jinxin Lv, Qiang Li, Vincent Jaouen, Dimitris Visvikis, Constance Fourcade, Mathieu Rubeaux, Wentao Pan, Zhe Xu, Bailiang Jian, Francesca De Benetti, Marek Wodzinski, Niklas Gunnarsson, Jens Sjolund, Daniel Grzech, Huaqi Qiu, Zeju Li, Alexander Thorley, Jinming Duan, Christoph Grosbrohmer, Andrew Hoopes, Ingerid Reinertsen, Yiming Xiao, Bennett Landman, Yuankai Huo, Keelin Murphy, Nikolas Lessmann, Bram van Ginneken, Adrian V. Dalca, Mattias P. Heinrich | 2023 | IEEE Transactions on Medical Imaging | vol 42 | no 3 | pages 697--712 | doi 10.1109/tmi.2022.3213983
OpenAlex: ratio 1.00: Learn2Reg: Comprehensive Multi-Task Medical Image Registration Challenge, Dataset and Evaluation in the Era of Deep Learning | Alessa Hering, Lasse Hansen, Tony C. W. Mok, Albert C. S. Chung, Hanna Siebert, Stephanie H<latin small letter a with diaeresis>ger, Annkristin Lange, Sven Kuckertz, Stefan Heldmann, Wei Shao, Sulaiman Vesal, Mirabela Rusu, Geoffrey A. Sonn, Th<latin small letter e with acute>o Estienne, Maria Vakalopoulou, Luyi Han, Yunzhi Huang, Pew<hyphen>Thian Yap, Mikael Brudfors, Ya<latin small letter e with diaeresis>l Balbastre, Samuel Joutard, Marc Modat, Gal Lifshitz, Dan Raviv, Jinxin Lv, Qiang Li, Vincent Jaouen, Dimitris Visvikis, Constance Fourcade, Mathieu Rubeaux, Wentao Pan, Zhe Xu, Bailiang Jian, Francesca De Benetti, Marek Wodzi<latin small letter n with acute>ski, Niklas Gunnarsson, Jens Sjolund, Daniel Grzech, Huaqi Qiu, Zeju Li, Alexander Thorley, Jinming Duan, Christoph Grosbrohmer, Andrew Hoopes, Ingerid Reinertsen, Yiming Xiao, Bennett A. Landman, Yuankai Huo, Keelin Murphy, Nikolas Le<latin small letter sharp s>mann, Bram van Ginneken, Adrian Vasile Dalca, Mattias P. Heinrich<pop directional formatting> | 2022 | IEEE Transactions on Medical Imaging | vol 42 | no 3 | pages 697--712 | doi 10.1109/tmi.2022.3213983 | OpenAlex W4200630926 | open access https://ieeexplore.ieee.org/ielx7/42/10057585/09925717.pdf
Semantic Scholar: ratio 1.00: Learn2Reg: Comprehensive Multi-Task Medical Image Registration Challenge, Dataset and Evaluation in the Era of Deep Learning | A. Hering, Lasse Hansen, Tony C. W. Mok, Albert C. S. Chung, Hanna Siebert, Stephanie H<latin small letter a with diaeresis>ger, Annkristin Lange, Sven Kuckertz, S. Heldmann, Wei Shao, Sulaiman Vesal, M. Rusu, G. Sonn, T. Estienne, M. Vakalopoulou, Lu-Yi Han, Yunzhi Huang, P. Yap, Mikael Brudfors, Ya<latin small letter e with diaeresis>l Balbastre, Samuel Joutard, M. Modat, Gal Lifshitz, D. Raviv, Jinxin Lv, Qiang Li, V. Jaouen, D. Visvikis, C. Fourcade, M. Rubeaux, Wen-Qian Pan, Zhe Xu, Bai-Liang Jian, F. De Benetti, M. Wodzi<latin small letter n with acute>ski, Niklas Gunnarsson, Jens Sj<latin small letter o with diaeresis>lund, Daniel Grzech, Hua-Qi Qiu, Ze-Ju Li, Alexander J H Thorley, Jin-Ming Duan, Christoph Gro<latin small letter sharp s>br<latin small letter o with diaeresis>hmer, Andrew Hoopes, I. Reinertsen, Yi-Ming Xiao, B. Landman, Yuan-Kai Huo, K. Murphy, N. Lessmann, B. van Ginneken, Adrian V. Dalca, M. Heinrich | 2021 | IEEE Transactions on Medical Imaging | vol 42 | pages 697--712 | doi 10.1109/TMI.2022.3213983 | arXiv 2112.04489 | Semantic Scholar 2e09fa7387659a79f41d809ce40d32cc8c847bb7 | open access https://ieeexplore.ieee.org/ielx7/42/10057585/09925717.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2026lumir
Command: python3 lookup resolve '10.1016/j.media.2026.104175'
```
Crossref: ratio 1.00: Beyond the LUMIR challenge: The pathway to foundational registration models | Junyu Chen, Shuwen Wei, Joel Honkamaa, Pekka Marttinen, Hang Zhang, Min Liu, Yichao Zhou, Zuopeng Tan, Zhuoyuan Wang, Yi Wang, Hongchao Zhou, Shunbo Hu, Yi Zhang, Qian Tao, Lukas F<latin small letter o with diaeresis>rner, Thomas Wendler, Bailiang Jian, Benedikt Wiestler, Tim Hable, Jin Kim, Dan Ruan, Frederic Madesta, Thilo Sentker, Wiebke Heyer, Lianrui Zuo, Yuwei Dai, Jing Wu, Jerry L. Prince, Harrison Bai, Yong Du, Yihao Liu, Alessa Hering, Reuben Dorent, Lasse Hansen, Mattias P. Heinrich, Aaron Carass | 2026 | Medical Image Analysis | vol 113 | pages 104175 | doi 10.1016/j.media.2026.104175
OpenAlex: ratio 1.00: Beyond the LUMIR challenge: The pathway to foundational registration models | Junyu Chen, Shuwen Wei, Joel Honkamaa, Pekka Marttinen, Hang Zhang, Min Liu, Yichao Zhou, Zuopeng Tan, Zhuoyuan Wang, Yi Wang, Hongchao Zhou, Shunbo Hu, Yi Zhang, Qian Tao, Lukas F<latin small letter o with diaeresis>rner, Thomas Wendler, Bailiang Jian, Benedikt Wiestler, Tim Hable, Jin Kim, Dan Ruan, Frederic Madesta, Thilo Sentker, Wiebke Heyer, Lianrui Zuo, Yuwei Dai, Jing Wu, Jerry L. Prince, Harrison Xiao Bai, Yong Du, Yihao Liu, Alessa Hering, Reuben Dorent, Lasse Hansen, Mattias P. Heinrich<pop directional formatting>, Aaron Carass | 2026 | Medical Image Analysis | vol 113 | pages 104175--104175 | doi 10.1016/j.media.2026.104175 | OpenAlex W4414856305 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13419986/pdf/nihms-2193568.pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ou2014comparative
Command: python3 lookup resolve '10.1109/tmi.2014.2330355'
```
Crossref: ratio 1.00: Comparative Evaluation of Registration Algorithms in Different Brain Databases With Varying Difficulty: Results and Insights | Yangming Ou, Hamed Akbari, Michel Bilello, Xiao Da, Christos Davatzikos | 2014 | IEEE Transactions on Medical Imaging | vol 33 | no 10 | pages 2039--2065 | doi 10.1109/tmi.2014.2330355
OpenAlex: ratio 1.00: Comparative Evaluation of Registration Algorithms in Different Brain Databases With Varying Difficulty: Results and Insights | Yangming Ou, Hamed Akbari, Michel Bilello, Xiao Da, Christos A. Davatzikos | 2014 | IEEE Transactions on Medical Imaging | vol 33 | no 10 | pages 2039--2065 | doi 10.1109/tmi.2014.2330355 | OpenAlex W2067178115 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4371548
Semantic Scholar: ratio 1.00: Comparative Evaluation of Registration Algorithms in Different Brain Databases With Varying Difficulty: Results and Insights | Yang-Ming Ou, H. Akbari, M. Bilello, Xiao Da, C. Davatzikos | 2014 | IEEE Transactions on Medical Imaging | vol 33 | pages 2039--2065 | doi 10.1109/TMI.2014.2330355 | Semantic Scholar dcb8fff21c255ca1dfeb10a0a1bfba87e231280b | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4371548
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### miller2025comparison
Command: python3 lookup resolve '10.1162/imag.a.1048'
```
Crossref: ratio 1.00: Comparison of brain normalization software and lesion compensation techniques in chronic perinatal stroke imaging | Gillian N. Miller, Clara J. Steeby, Jorge Ortega-M<latin small letter a with acute>rquez, Alberto Castro Palacin, Carrie Chui, Kenda Alhadid, Alyssa W. Sullivan, Aaron D. Boes, Patricia L. Musolino, Alexander L. Cohen | 2025 | Imaging Neuroscience | vol 3 | doi 10.1162/imag.a.1048
OpenAlex: ratio 1.00: Comparison of brain normalization software and lesion compensation techniques in chronic perinatal stroke imaging | Gillian N. Miller, Clara J. Steeby, Jorge Ortega-M<latin small letter a with acute>rquez, Alberto Castro Palacin, Carrie Chui, Kenda Alhadid, Alyssa W. Sullivan, Aaron D. Boes, Patricia Leonor Musolino, Alexander L. Cohen | 2025 | Imaging Neuroscience | vol 3 | doi 10.1162/imag.a.1048 | OpenAlex W7105881710 | open access https://direct.mit.edu/imag/article-pdf/doi/10.1162/IMAG.a.1048/2565674/imag.a.1048.pdf
Semantic Scholar: ratio 1.00: Comparison of brain normalization software and lesion compensation techniques in chronic perinatal stroke imaging | Gillian N. Miller, Clara J. Steeby, Jorge Ortega-M<latin small letter a with acute>rquez, Alberto Castro Palacin, Carrie Chui, K. Alhadid, Alyssa W. Sullivan, A. Boes, P. Musolino, A. L. Cohen | 2025 | Imaging neuroscience | vol 3 | doi 10.1162/IMAG.a.1048 | Semantic Scholar aa1caafef850b41805dbb2a4bdc86342f7c8c1a4 | open access https://direct.mit.edu/imag/article-pdf/doi/10.1162/IMAG.a.1048/2565674/imag.a.1048.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### marchewka2014influence
Command: python3 lookup resolve '10.1002/hbm.22297'
```
Crossref: ratio 1.00: Influence of magnetic field strength and image registration strategy on voxel<hyphen>based morphometry in a study of Alzheimer's disease | Artur Marchewka, Ferath Kherif, Gunnar Krueger, Anna Grabowska, Richard Frackowiak, Bogdan Draganski, The Alzheimer's Disease Neuroimaging Initiative | 2013 | Human Brain Mapping | vol 35 | no 5 | pages 1865--1874 | doi 10.1002/hbm.22297
OpenAlex: ratio 1.00: Influence of magnetic field strength and image registration strategy on voxel<hyphen>based morphometry in a study of Alzheimer's disease | Artur Marchewka, Ferath Kherif, Gunnar Kr<latin small letter u with diaeresis>ger, Anna Grabowska, Richard S. J. Frackowiak, Bogdan Draganski, The Alzheimer's Disease Neuroimaging Initiative | 2013 | Human Brain Mapping | vol 35 | no 5 | pages 1865--1874 | doi 10.1002/hbm.22297 | OpenAlex W1588835084 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC6869431/
Semantic Scholar: ratio 1.00: Influence of magnetic field strength and image registration strategy on voxel<hyphen>based morphometry in a study of Alzheimer's disease | A. Marchewka, Ferath Kherif, G. Krueger, A. Grabowska, Richard S. J. Frackowiak, Bogdan Draganski | 2014 | Human Brain Mapping | vol 35 | doi 10.1002/hbm.22297 | Semantic Scholar 65fb79df77834a5246b6f9bcfd0caabc21865fef | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC6869431/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### canalini2022quantitative
Command: python3 lookup resolve '10.3389/fnimg.2022.977491'
```
Crossref: ratio 1.00: Quantitative evaluation of the influence of multiple MRI sequences and of pathological tissues on the registration of longitudinal data acquired during brain tumor treatment | Luca Canalini, Jan Klein, Diana Waldmannstetter, Florian Kofler, Stefano Cerri, Alessa Hering, Stefan Heldmann, Sarah Schlaeger, Bjoern H. Menze, Benedikt Wiestler, Jan Kirschke, Horst K. Hahn | 2022 | Frontiers in Neuroimaging | vol 1 | doi 10.3389/fnimg.2022.977491
OpenAlex: ratio 1.00: Quantitative evaluation of the influence of multiple MRI sequences and of pathological tissues on the registration of longitudinal data acquired during brain tumor treatment | Luca Canalini, Jan Klein, Diana Waldmannstetter, Florian Kofler, Stefano Cerri, Alessa Hering, Stefan Heldmann, Sarah Schlaeger, Bjoern H. Menze, Benedikt Wiestler, Jan Stefan Kirschke, Horst Karl Hahn | 2022 | Frontiers in Neuroimaging | vol 1 | pages 977491--977491 | doi 10.3389/fnimg.2022.977491 | OpenAlex W4296483344 | open access https://www.frontiersin.org/articles/10.3389/fnimg.2022.977491/pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### iglesias2026accuracy
Command: python3 lookup resolve '10.1038/s41598-026-63646-1'
```
Crossref: ratio 1.00: On the accuracy of nonlinear image registration in portable low-field 3D brain MRI | J. Eugenio Iglesias, Ian P. Johnson, Jonathan Williams-Ramirez, Dina Zemlyanker, Lin Tian, Karthik Gopinath, Mark Olchanyi, Ava D. Farnan, Amelia Demopoulos, Matthew S. Rosen, Kevin N. Sheth, Adam de Havenon, W. Taylor Kimberly, Annabel Sorby-Adams | 2026 | Scientific Reports | vol 16 | no 1 | doi 10.1038/s41598-026-63646-1
OpenAlex: ratio 1.00: On the accuracy of nonlinear image registration in portable low-field 3D brain MRI | J. Eugenio Iglesias, Ian Johnson, Jonathan Williams-Ramirez, Dina Zemlyanker, Lin Tian, Karthik Kuduva Gopinath, Mark Olchanyi, Ava Farnan, Amelia Demopoulos, Matthew Scott Rosen, Kevin Navin Sheth, Adam de Havenon, William Taylor Kimberly, Annabel J Sorby-Adams, Alzheimer<right single quotation mark>s Disease Neuroimaging Initiative | 2026 | Scientific Reports | vol 16 | no 1 | pages 34965--34965 | doi 10.1038/s41598-026-63646-1 | OpenAlex W7171855754 | open access https://www.nature.com/articles/s41598-026-63646-1_reference.pdf
Semantic Scholar: ratio 1.00: On the accuracy of nonlinear image registration in portable low-field 3D brain MRI | J. Iglesias, I. Johnson, Jonathan Williams Ramirez, Dina Zemlyanker, Lin Tian, K. Gopinath, Mark D. Olchanyi, Ava Farnan, Amelia Demopoulos, M. Rosen, K. Sheth, A. de Havenon, W. Kimberly, A. Sorby-Adams | 2026 | Scientific Reports | vol 16 | doi 10.1038/s41598-026-63646-1 | Semantic Scholar 934c4c1f7834deb43e881dffd182698575a5e39a | open access https://www.nature.com/articles/s41598-026-63646-1_reference.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### luo2026bayesian
Command: python3 lookup resolve '10.1109/tpami.2025.3609521'
```
Crossref: ratio 1.00: Bayesian Unsupervised Disentanglement of Anatomy and Geometry for Deep Groupwise Image Registration | Xinzhe Luo, Xin Wang, Linda Shapiro, Chun Yuan, Jianfeng Feng, Xiahai Zhuang | 2026 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 48 | no 1 | pages 711--729 | doi 10.1109/tpami.2025.3609521
OpenAlex: ratio 1.00: Bayesian Unsupervised Disentanglement of Anatomy and Geometry for Deep Groupwise Image Registration | Xinzhe Luo, Xin Wang, Linda G. Shapiro, Chun Yuan, Jianfeng Feng, Xiahai Zhuang | 2025 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 48 | no 1 | pages 711--729 | doi 10.1109/tpami.2025.3609521 | OpenAlex W4414161593 | open access https://arxiv.org/pdf/2401.02141
Semantic Scholar: ratio 1.00: Bayesian Unsupervised Disentanglement of Anatomy and Geometry for Deep Groupwise Image Registration | Xinzhe Luo, Xin Wang, Linda Shapiro, Chun Yuan, Jianfeng Feng, X. Zhuang | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 48 | pages 711--729 | doi 10.1109/TPAMI.2025.3609521 | arXiv 2401.02141 | Semantic Scholar 859caf85e584907199ffa45e6bd2faab8d25cd1a | open access https://arxiv.org/pdf/2401.02141
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### sinclair2022atlas
Command: python3 lookup resolve '10.1016/j.media.2022.102383'
```
Crossref: ratio 1.00: Atlas-ISTN: Joint segmentation, registration and atlas construction with image-and-spatial transformer networks | Matthew Sinclair, Andreas Schuh, Karl Hahn, Kersten Petersen, Ying Bai, James Batten, Michiel Schaap, Ben Glocker | 2022 | Medical Image Analysis | vol 78 | pages 102383 | doi 10.1016/j.media.2022.102383
OpenAlex: ratio 1.00: Atlas-ISTN: Joint segmentation, registration and atlas construction with image-and-spatial transformer networks | Matthew Sinclair, Andreas Schuh, Karl Hahn, Kersten Petersen, Ying Bai, James Batten, Michiel Schaap, Ben Glocker | 2022 | Medical Image Analysis | vol 78 | pages 102383--102383 | doi 10.1016/j.media.2022.102383 | OpenAlex W3116516133 | open access https://www.sciencedirect.com/science/article/pii/S1361841522000354/pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dannecker2026cinema
Command: python3 lookup resolve '10.1109/tmi.2025.3605194'
```
Crossref: ratio 1.00: CINeMA: Conditional Implicit Neural Multi-Modal Atlas for a Spatio-Temporal Representation of the Perinatal Brain | Maik Dannecker, Vasiliki Sideri-Lampretsa, Sophie Starck, Angeline Mihailov, Mathieu Milh, Nadine Girard, Guillaume Auzias, Daniel Rueckert | 2026 | IEEE Transactions on Medical Imaging | vol 45 | no 2 | pages 738--750 | doi 10.1109/tmi.2025.3605194
OpenAlex: ratio 1.00: CINeMA: Conditional Implicit Neural Multi-Modal Atlas for a Spatio-Temporal Representation of the Perinatal Brain | Maik Dannecker, Vasiliki Sideri<hyphen>Lampretsa, Sophie Starck, Angeline Mihailov, Mathieu Milh, Nadine J Girard, Guillaume Auzias, Daniel Rueckert | 2025 | IEEE Transactions on Medical Imaging | vol 45 | no 2 | pages 738--750 | doi 10.1109/tmi.2025.3605194 | OpenAlex W4413967162 | open access https://doi.org/10.1109/tmi.2025.3605194
Semantic Scholar: ratio 1.00: CINeMA: Conditional Implicit Neural Multi-Modal Atlas for a Spatio-Temporal Representation of the Perinatal Brain | Maik Dannecker, Vasiliki Sideri-Lampretsa, Sophie Starck, A. Mihailov, M. Milh, N. Girard, G. Auzias, Daniel Rueckert | 2025 | IEEE Transactions on Medical Imaging | vol 45 | pages 738--750 | doi 10.1109/TMI.2025.3605194 | arXiv 2506.09668 | Semantic Scholar c537f6ba427cc0bf0b538323fe1bb33295cbac0b | open access https://doi.org/10.1109/tmi.2025.3605194
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### hoffmann2024anatomy
Command: python3 lookup resolve '10.1162/imag_a_00197'
```
Crossref: ratio 1.00: Anatomy-aware and acquisition-agnostic joint registration with SynthMorph | Malte Hoffmann, Andrew Hoopes, Douglas N. Greve, Bruce Fischl, Adrian V. Dalca | 2024 | Imaging Neuroscience | vol 2 | doi 10.1162/imag_a_00197
OpenAlex: ratio 1.00: Anatomy-aware and acquisition-agnostic joint registration with SynthMorph | Malte Hoffmann, Andrew Hoopes, Douglas N. Greve, Bruce R. Fischl, Adrian Vasile Dalca | 2024 | Imaging Neuroscience | vol 2 | pages 1--33 | doi 10.1162/imag_a_00197 | OpenAlex W4399498869 | open access https://doi.org/10.1162/imag_a_00197
Semantic Scholar: ratio 1.00: Anatomy-aware and acquisition-agnostic joint registration with SynthMorph | Malte Hoffmann, Andrew Hoopes, D. Greve, B. Fischl, Adrian V. Dalca | 2023 | Imaging Neuroscience | vol 2 | doi 10.1162/imag_a_00197 | arXiv 2301.11329 | Semantic Scholar 8469ad8f0211b438cb4b5a8bcf9d1e6e923c37e4 | open access https://doi.org/10.1162/imag_a_00197
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### he2023neural
Command: python3 lookup resolve '10.1007/978-3-031-43993-3_25'
```
Crossref: ratio 1.00: Neural Pre-processing: A Learning Framework for End-to-End Brain MRI Pre-processing | Xinzi He, Alan Q. Wang, Mert R. Sabuncu | 2023 | Lecture Notes in Computer Science | pages 258--267 | doi 10.1007/978-3-031-43993-3_25
OpenAlex: ratio 1.00: Neural Pre-processing: A Learning Framework for End-to-End Brain MRI Pre-processing | Xinzi He, Alan Q. Wang, Mert Rory Sabuncu | 2023 | Lecture notes in computer science | pages 258--267 | doi 10.1007/978-3-031-43993-3_25 | OpenAlex W4387210968 | open access https://arxiv.org/pdf/2303.12148
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tilwani2025benchmarking
Command: python3 lookup resolve '10.3389/fnimg.2025.1573816'
```
Crossref: ratio 1.00: Benchmarking machine learning models in lesion-symptom mapping for predicting language outcomes in stroke survivors | Deepa Tilwani, Christian O'Reilly, Nicholas Riccardi, Valerie L. Shalin, Dirk-Bart den Ouden, Julius Fridriksson, Svetlana V. Shinkareva, Amit P. Sheth, Rutvik H. Desai | 2025 | Frontiers in Neuroimaging | vol 4 | doi 10.3389/fnimg.2025.1573816
OpenAlex: ratio 1.00: Benchmarking machine learning models in lesion-symptom mapping for predicting language outcomes in stroke survivors | Deepa Tilwani, Christian O<right single quotation mark>Reilly, Nicholas Riccardi, Valerie L. Shalin, Dirk<hyphen>Bart den Ouden, Svetlana V. Shinkareva, Julius Fridriksson, Amit Sheth, Rutvik H. Desai | 2025 | Frontiers in Neuroimaging | vol 4 | pages 1573816--1573816 | doi 10.3389/fnimg.2025.1573816 | OpenAlex W4410905407 | open access https://www.frontiersin.org/journals/neuroimaging/articles/10.3389/fnimg.2025.1573816/pdf
Semantic Scholar: ratio 1.00: Benchmarking machine learning models in lesion-symptom mapping for predicting language outcomes in stroke survivors | Deepa Tilwani, Christian O'Reilly, Nicholas Riccardi, V. Shalin, D. den Ouden, J. Fridriksson, S. Shinkareva, Amit P. Sheth, Rutvik H. Desai | 2025 | Frontiers in Neuroimaging | vol 4 | doi 10.3389/fnimg.2025.1573816 | Semantic Scholar de74c7cda2eb3ba9c144f69a4a80ff334827ea08 | open access https://www.frontiersin.org/journals/neuroimaging/articles/10.3389/fnimg.2025.1573816/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### whybra2024image
Command: python3 lookup resolve '10.1148/radiol.231319'
```
Crossref: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Convolutional Filters for Reproducible Radiomics and Enhanced Clinical Insights | Philip Whybra, Alex Zwanenburg, Vincent Andrearczyk, Roger Schaer, Aditya P. Apte, Alexandre Ayotte, Bhakti Baheti, Spyridon Bakas, Andrea Bettinelli, Ronald Boellaard, Luca Boldrini, Ir<latin small letter e with grave>ne Buvat, Gary J. R. Cook, Florian Dietsche, Nicola Dinapoli, Hubert S. Gabry<latin small letter s with acute>, Vicky Goh, Matthias Guckenberger, Mathieu Hatt, Mahdi Hosseinzadeh, Aditi Iyer, Jacopo Lenkowicz, Mahdi A. L. Loutfi, Steffen L<latin small letter o with diaeresis>ck, Francesca Marturano, Olivier Morin, Christophe Nioche, Fanny Orlhac, Sarthak Pati, Arman Rahmim, Seyed Masoud Rezaeijo, Christopher G. Rookyard, Mohammad R. Salmanpour, Andreas Schindele, Isaac Shiri, Emiliano Spezi, Stephanie Tanadini-Lang, Florent Tixier, Taman Upadhaya, Vincenzo Valentini, Joost J. M. van Griethuysen, Fereshteh Yousefirizi, Habib Zaidi, Henning M<latin small letter u with diaeresis>ller, Martin Valli<latin small letter e with grave>res, Adrien Depeursinge | 2024 | Radiology | vol 310 | no 2 | doi 10.1148/radiol.231319
OpenAlex: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Convolutional Filters for Reproducible Radiomics and Enhanced Clinical Insights | P. Whybra, Alex Zwanenburg, Vincent Andrearczyk, Roger Schaer, Aditya Apte, Alexandre Ayotte, Bhakti Baheti, Spyridon Bakas, Andrea Bettinelli, Ronald Boellaard, Luca Boldrini, Ir<latin small letter e with grave>ne Buvat, Gary Cook, Florian Dietsche, N. Dinapoli, Hubert Szymon Gabry<latin small letter s with acute>, Vicky Goh, Matthias G<latin small letter u with diaeresis>ckenberger, Mathieu Hatt, Mahdi Hosseinzadeh, Aditi Iyer, Jacopo Lenkowicz, Mahdi Ait Lhaj Loutfi, Steffen L<latin small letter o with diaeresis>ck, Francesca Marturano, Olivier Morin, Christophe Nioche, Fanny Orlhac, Sarthak Pati, Arman Rahmim, Seyed Masoud Rezaeijo, Christopher G Rookyard, Mohammad R. Salmanpour, Andreas Schindele, Isaac Shiri, Emiliano Spezi, Stephanie Tanadini<hyphen>Lang, Florent Tixier, Taman Upadhaya, Vincenzo Valentini, Joost J. M. van Griethuysen, Fereshteh Yousefirizi, Habib Zaidi, Henning M<latin small letter u with diaeresis>ller, Martin Valli<latin small letter e with grave>res, Adrien Depeursinge | 2024 | Radiology | vol 310 | no 2 | pages e231319--e231319 | doi 10.1148/radiol.231319 | OpenAlex W4391577343 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC10902595/pdf/radiol.231319.pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### paquier2022radiomics
Command: python3 lookup resolve '10.1088/2057-1976/ac8e6f'
```
Crossref: ratio 1.00: Radiomics software comparison using digital phantom and patient data: IBSI-compliance does not guarantee concordance of feature values | Zelda Paquier, Shih-Li Chao, Ana<latin small letter i with diaeresis>s Acquisto, Chifra Fenton, Thomas Guiot, Jennifer Dhont, Hugo Levillain, Akos Gulyban, Maria Antonietta Bali, Nick Reynaert | 2022 | Biomedical Physics &amp; Engineering Express | vol 8 | no 6 | pages 065008 | doi 10.1088/2057-1976/ac8e6f
OpenAlex: ratio 1.00: Radiomics software comparison using digital phantom and patient data: IBSI-compliance does not guarantee concordance of feature values | Zelda Paquier, Shih<hyphen>Li Chao, Ana<latin small letter i with diaeresis>s Acquisto, Chifra Fenton, Thomas Guiot, Jennifer Dhont, Hugo Levillain, <latin capital letter a with acute>kos Gulyb<latin small letter a with acute>n, Maria Antonietta Bali, Nick Reynaert | 2022 | Biomedical Physics & Engineering Express | vol 8 | no 6 | pages 065008--065008 | doi 10.1088/2057-1976/ac8e6f | OpenAlex W4294215059 | open access https://iopscience.iop.org/article/10.1088/2057-1976/ac8e6f/pdf
Semantic Scholar: ratio 1.00: Radiomics software comparison using digital phantom and patient data: IBSI-compliance does not guarantee concordance of feature values | Z. Paquier, Shih-Li Chao, Ana<latin small letter i with diaeresis>s Acquisto, Chifra Fenton, T. Guiot, J. Dhont, H. Levillain, <latin capital letter a with acute>. Gulyb<latin small letter a with acute>n, M. Bali, N. Reynaert | 2022 | Biomedical engineering and physics express | vol 8 | doi 10.1088/2057-1976/ac8e6f | Semantic Scholar 59d371f2a72e3dd33fc00ea5164b04c08240341c | open access https://iopscience.iop.org/article/10.1088/2057-1976/ac8e6f/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### egger2017mri
Command: python3 lookup resolve '10.1016/j.nicl.2016.11.020'
```
Crossref: ratio 1.00: MRI FLAIR lesion segmentation in multiple sclerosis: Does automated segmentation hold up with manual annotation? | Christine Egger, Roland Opfer, Chenyu Wang, Timo Kepp, Maria Pia Sormani, Lothar Spies, Michael Barnett, Sven Schippling | 2017 | NeuroImage: Clinical | vol 13 | pages 264--270 | doi 10.1016/j.nicl.2016.11.020
OpenAlex: ratio 1.00: MRI FLAIR lesion segmentation in multiple sclerosis: Does automated segmentation hold up with manual annotation? | Christine Egger, Roland Opfer, Chenyu Wang, Timo Kepp, Maria Pia Sormani, Lothar Spies, Michael Harry Barnett, Sven Schippling | 2016 | NeuroImage Clinical | vol 13 | pages 264--270 | doi 10.1016/j.nicl.2016.11.020 | OpenAlex W2549949175 | open access https://www.sciencedirect.com/science/article/pii/S2213158216302285/pdf
Semantic Scholar: ratio 1.00: MRI FLAIR lesion segmentation in multiple sclerosis: Does automated segmentation hold up with manual annotation? | C. Egger, R. Opfer, C. Wang, Timo Kepp, M. Sormani, L. Spies, M. Barnett, S. Schippling | 2016 | NeuroImage: Clinical | vol 13 | pages 264--270 | doi 10.1016/j.nicl.2016.11.020 | Semantic Scholar 8611112d0c105f752e239fe8729e652f8ee52ce3 | open access https://www.sciencedirect.com/science/article/pii/S2213158216302285/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### hindsholm2025prospective
Command: python3 lookup resolve '10.1007/s00234-025-03834-4'
```
Crossref: ratio 1.00: Prospective clinical evaluation of automatic lesion assessment in patients with multiple sclerosis | Amalie Monberg Hindsholm, Annika Reynberg Langkilde, Jonathan Frederik Carlsen, Dorthea N<latin small letter o with stroke>rregaard, Thomas Axelsen, Aya Bakhtyar Baram, Natalia Grundtvig, Abdullah Shafique, Jette Lautrup Frederiksen, Flemming Littrup Andersen, Henrik BW Larsson, Adam Espe Hansen, Martin Lundsgaard Hansen, Claes N<latin small letter o with stroke>hr Ladefoged, Ulrich Lindberg | 2025 | Neuroradiology | vol 67 | no 12 | pages 3623--3635 | doi 10.1007/s00234-025-03834-4
OpenAlex: ratio 1.00: Prospective clinical evaluation of automatic lesion assessment in patients with multiple sclerosis | Amalie Monberg Hindsholm, Annika Reynberg Langkilde, Jonathan Frederik Carlsen, Dorthea N<latin small letter o with stroke>rregaard, Thomas Axelsen, Aya Bakhtyar Baram, Natalia Grundtvig, Abdullah Shafique, Jette Lautrup Frederiksen, Flemming Littrup Andersen, Henrik B. W. Larsson, Adam Espe Hansen, Martin Lundsgaard Hansen, Claes N<latin small letter o with stroke>hr Ladefoged, Ulrich Lindberg | 2025 | Neuroradiology | vol 67 | no 12 | pages 3623--3635 | doi 10.1007/s00234-025-03834-4 | OpenAlex W4416137509
Semantic Scholar: ratio 1.00: Prospective clinical evaluation of automatic lesion assessment in patients with multiple sclerosis | A. Hindsholm, A. Langkilde, J. Carlsen, Dorthea N<latin small letter o with stroke>rregaard, Thomas Axelsen, A. Baram, Natalia Grundtvig, Abdullah Shafique, J. Frederiksen, F. Andersen, H. Larsson, A. E. Hansen, Martin Lundsgaard Hansen, C. Ladefoged, U. Lindberg | 2025 | Neuroradiology | vol 67 | pages 3623--3635 | doi 10.1007/s00234-025-03834-4 | Semantic Scholar c6e3f30dc5973f043b226254100c57a802abc342
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### isensee2024nnu
Command: python3 lookup resolve '10.1007/978-3-031-72114-4_47'
```
Crossref: ratio 1.00: nnU-Net Revisited: A Call for Rigorous Validation in 3D Medical Image Segmentation | Fabian Isensee, Tassilo Wald, Constantin Ulrich, Michael Baumgartner, Saikat Roy, Klaus Maier-Hein, Paul F. J<latin small letter a with diaeresis>ger | 2024 | Lecture Notes in Computer Science | pages 488--498 | doi 10.1007/978-3-031-72114-4_47
OpenAlex: ratio 1.00: nnU-Net Revisited: A Call for Rigorous Validation in 3D Medical Image Segmentation | Fabian Isensee, Tassilo Wald, Constantin Ulrich, Michael Baumgartner, Saikat Roy, Klaus Hermann Maier-Hein, Paul F. J<latin small letter a with diaeresis>ger | 2024 | Lecture notes in computer science | pages 488--498 | doi 10.1007/978-3-031-72114-4_47 | OpenAlex W4403067601 | open access https://arxiv.org/pdf/2404.09556
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### qiu2023qcresunet
Command: python3 lookup resolve '10.1007/978-3-031-43901-8_17'
```
Crossref: ratio 1.00: QCResUNet: Joint Subject-Level and Voxel-Level Prediction of Segmentation Quality | Peijie Qiu, Satrajit Chakrabarty, Phuc Nguyen, Soumyendu Sekhar Ghosh, Aristeidis Sotiras | 2023 | Lecture Notes in Computer Science | pages 173--182 | doi 10.1007/978-3-031-43901-8_17
OpenAlex: ratio 1.00: QCResUNet: Joint Subject-Level and Voxel-Level Prediction of Segmentation Quality | Peijie Qiu, Satrajit Chakrabarty, Phuc Nguyen, Soumyendu Sekhar Ghosh, Aristeidis Sotiras | 2023 | Lecture notes in computer science | pages 173--182 | doi 10.1007/978-3-031-43901-8_17 | OpenAlex W4387211381
Semantic Scholar: ratio 1.00: QCResUNet: Joint Subject-Level and Voxel-Level Prediction of Segmentation Quality | Pei-Jie Qiu, Satrajit Chakrabarty, Phuc Nguyen, S. Ghosh, Aristeidis Sotiras | 2023 | International Conference on Medical Image Computing and Computer-Assisted Intervention | pages 173--182 | doi 10.1007/978-3-031-43901-8_17 | Semantic Scholar a474499555555fed84b06819f0964394c6679985
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### balagurunathan2014reproducibility
Command: python3 lookup resolve '10.1593/tlo.13844'
```
Crossref: ratio 1.00: Reproducibility and Prognosis of Quantitative Features Extracted from CT Images | Yoganand Balagurunathan, Yuhua Gu, Hua Wang, Virendra Kumar, Olya Grove, Sam Hawkins, Jongphil Kim, Dmitry B. Goldgof, Lawrence O. Hall, Robert A. Gatenby, Robert J. Gillies | 2014 | Translational Oncology | vol 7 | no 1 | pages 72--87 | doi 10.1593/tlo.13844
OpenAlex: ratio 1.00: Reproducibility and Prognosis of Quantitative Features Extracted from CT Images | Yoganand Balagurunathan, Yuhua Gu, Hua Wang, Virendra Kumar, Olya Grove, S.K. Hawkins, Jongphil Kim, Dmitry B. Goldgof, Lawrence Hall, Robert A. Gatenby, Robert J. Gillies | 2014 | Translational Oncology | vol 7 | no 1 | pages 72--87 | doi 10.1593/tlo.13844 | OpenAlex W2062744135 | open access https://www.sciencedirect.com/science/article/pii/S1936523314800107/pdf
Semantic Scholar: ratio 1.00: Reproducibility and Prognosis of Quantitative Features Extracted from CT Images. | Y. Balagurunathan, Yuhua Gu, Hua Wang, Virendra Kumar, O. Grove, S. Hawkins, Jongphil Kim, Dmitry Goldgof, L. Hall, R. Gatenby, R. Gillies | 2014 | Translational Oncology | vol 7 1 | pages 72--87 | doi 10.1593/TLO.13844 | Semantic Scholar 32229d6f8dc57e9c13f9c17566a8aaadccb10a27 | open access https://www.sciencedirect.com/science/article/pii/S1936523314800107/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zwanenburg2019assessing
Command: python3 lookup resolve '10.1038/s41598-018-36938-4'
```
Crossref: ratio 1.00: Assessing robustness of radiomic features by image perturbation | Alex Zwanenburg, Stefan Leger, Linda Agolli, Karoline Pilz, Esther G. C. Troost, Christian Richter, Steffen L<latin small letter o with diaeresis>ck | 2019 | Scientific Reports | vol 9 | no 1 | doi 10.1038/s41598-018-36938-4
OpenAlex: ratio 1.00: Assessing robustness of radiomic features by image perturbation | Alex Zwanenburg, Stefan Leger, Linda Agolli, Karoline Pilz, Esther G.C. Troost, Christian Richter, Steffen L<latin small letter o with diaeresis>ck | 2019 | Scientific Reports | vol 9 | no 1 | pages 614--614 | doi 10.1038/s41598-018-36938-4 | OpenAlex W2807998518 | open access https://www.nature.com/articles/s41598-018-36938-4.pdf
Semantic Scholar: ratio 1.00: Assessing robustness of radiomic features by image perturbation | A. Zwanenburg, S. Leger, L. Agolli, K. Pilz, E. Troost, C. Richter, S. L<latin small letter o with diaeresis>ck | 2018 | Scientific Reports | vol 9 | doi 10.1038/s41598-018-36938-4 | arXiv 1806.06719 | Semantic Scholar 820b04ea5faa4dc291c05592610cf69604e00361 | open access https://www.nature.com/articles/s41598-018-36938-4.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### haarburger2020radiomics
Command: python3 lookup resolve '10.1038/s41598-020-69534-6'
```
Crossref: ratio 1.00: Radiomics feature reproducibility under inter-rater variability in segmentations of CT images | Christoph Haarburger, Gustav M<latin small letter u with diaeresis>ller-Franzes, Leon Weninger, Christiane Kuhl, Daniel Truhn, Dorit Merhof | 2020 | Scientific Reports | vol 10 | no 1 | doi 10.1038/s41598-020-69534-6
OpenAlex: ratio 1.00: Radiomics feature reproducibility under inter-rater variability in segmentations of CT images | Christoph Haarburger, Gustav Anton M<latin small letter u with diaeresis>ller<hyphen>Franzes, Leon Weninger, Christiane Katharina Kuhl, Daniel Truhn, Dorit Merhof | 2020 | Scientific Reports | vol 10 | no 1 | pages 12688--12688 | doi 10.1038/s41598-020-69534-6 | OpenAlex W3046015102 | open access https://www.nature.com/articles/s41598-020-69534-6.pdf
Semantic Scholar: ratio 1.00: Radiomics feature reproducibility under inter-rater variability in segmentations of CT images | Christoph Haarburger, Gustav M<latin small letter u with diaeresis>ller-Franzes, Leon Weninger, C. Kuhl, D. Truhn, D. Merhof | 2020 | Scientific Reports | vol 10 | doi 10.1038/s41598-020-69534-6 | Semantic Scholar b873f7669b28c2af698c958c65b4f3568081c97b | open access https://www.nature.com/articles/s41598-020-69534-6.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### granzier2020mri
Command: python3 lookup resolve '10.1038/s41598-020-70940-z'
```
Crossref: ratio 1.00: MRI-based radiomics in breast cancer: feature robustness with respect to inter-observer segmentation variability | R. W. Y. Granzier, N. M. H. Verbakel, A. Ibrahim, J. E. van Timmeren, T. J. A. van Nijnatten, R. T. H. Leijenaar, M. B. I. Lobbes, M. L. Smidt, H. C. Woodruff | 2020 | Scientific Reports | vol 10 | no 1 | doi 10.1038/s41598-020-70940-z
OpenAlex: ratio 1.00: MRI-based radiomics in breast cancer: feature robustness with respect to inter-observer segmentation variability | Ren<latin small letter e with acute>e W. Y. Granzier, N. M. H. Verbakel, Abdalla Ibrahim, Janita E. van Timmeren, Thiemo J. A. van Nijnatten, Ralph T. H. Leijenaar, Marc B. I. Lobbes, Marjolein L. Smidt, Henry C. Woodruff | 2020 | Scientific Reports | vol 10 | no 1 | pages 14163--14163 | doi 10.1038/s41598-020-70940-z | OpenAlex W3081173912 | open access https://www.nature.com/articles/s41598-020-70940-z.pdf
Semantic Scholar: ratio 1.00: MRI-based radiomics in breast cancer: feature robustness with respect to inter-observer segmentation variability | R. Granzier, N. J. Verbakel, A. Ibrahim, J. V. van Timmeren, T. V. van Nijnatten, R. Leijenaar, M. Lobbes, M. Smidt, H. Woodruff | 2020 | Scientific Reports | vol 10 | doi 10.1038/s41598-020-70940-z | Semantic Scholar ca9d51b7c7d7ff1f2b5760a6ecd2c25243451cbf | open access https://www.nature.com/articles/s41598-020-70940-z.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### mullerfranzes2022reliability
Command: python3 lookup resolve '10.3390/diagnostics12020247'
```
Crossref: ratio 1.00: Reliability as a Precondition for Trust<em dash>Segmentation Reliability Analysis of Radiomic Features Improves Survival Prediction | Gustav M<latin small letter u with diaeresis>ller-Franzes, Sven Nebelung, Justus Schock, Christoph Haarburger, Firas Khader, Federico Pedersoli, Maximilian Schulze-Hagen, Christiane Kuhl, Daniel Truhn | 2022 | Diagnostics | vol 12 | no 2 | pages 247 | doi 10.3390/diagnostics12020247
OpenAlex: ratio 1.00: Reliability as a Precondition for Trust<em dash>Segmentation Reliability Analysis of Radiomic Features Improves Survival Prediction | Gustav Anton M<latin small letter u with diaeresis>ller<hyphen>Franzes, Sven Nebelung, Justus Schock, Christoph Haarburger, Firas Khader, Federico Pedersoli, Maximilian Franz Schulze-Hagen, Christiane Katharina Kuhl, Daniel Truhn | 2022 | Diagnostics | vol 12 | no 2 | pages 247--247 | doi 10.3390/diagnostics12020247 | OpenAlex W4205268553 | open access https://www.mdpi.com/2075-4418/12/2/247/pdf?version=1642679507
Semantic Scholar: ratio 1.00: Reliability as a Precondition for Trust<em dash>Segmentation Reliability Analysis of Radiomic Features Improves Survival Prediction | Gustav M<latin small letter u with diaeresis>ller-Franzes, S. Nebelung, J. Schock, Christoph Haarburger, F. Khader, F. Pedersoli, M. Schulze-Hagen, C. Kuhl, D. Truhn | 2022 | Diagnostics | vol 12 | doi 10.3390/diagnostics12020247 | Semantic Scholar 2e864fa8842e2587fd42a098c503f4cb949c729e | open access https://www.mdpi.com/2075-4418/12/2/247/pdf?version=1642679507
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ferrante2022application
Command: python3 lookup resolve '10.3390/jcm11247334'
```
Crossref: ratio 1.00: Application of nnU-Net for Automatic Segmentation of Lung Lesions on CT Images and Its Implication for Radiomic Models | Matteo Ferrante, Lisa Rinaldi, Francesca Botta, Xiaobin Hu, Andreas Dolp, Marta Minotti, Francesca De Piano, Gianluigi Funicelli, Stefania Volpe, Federica Bellerba, Paolo De Marco, Sara Raimondi, Stefania Rizzo, Kuangyu Shi, Marta Cremonesi, Barbara A. Jereczek-Fossa, Lorenzo Spaggiari, Filippo De Marinis, Roberto Orecchia, Daniela Origgi | 2022 | Journal of Clinical Medicine | vol 11 | no 24 | pages 7334 | doi 10.3390/jcm11247334
OpenAlex: ratio 1.00: Application of nnU-Net for Automatic Segmentation of Lung Lesions on CT Images and Its Implication for Radiomic Models | Matteo Ferrante, Lisa M. Rinaldi, Francesca Botta, Xiaobin Hu, Andreas Dolp, Marta Minotti, Francesca De Piano, Gianluigi Funicelli, Stefania Volpe, Federica Bellerba, P. De Marco, Sara Raimondi, Stefania Rizzo, Kuangyu Shi, Marta Cremonesi, Barbara Alicja Jereczek<hyphen>Fossa, Lorenzo Spaggiari, Filippo de Marinis, Roberto Orecchia, Daniela Origgi | 2022 | Journal of Clinical Medicine | vol 11 | no 24 | pages 7334--7334 | doi 10.3390/jcm11247334 | OpenAlex W4312127612 | open access https://www.mdpi.com/2077-0383/11/24/7334/pdf?version=1670918624
Semantic Scholar: ratio 1.00: Application of nnU-Net for Automatic Segmentation of Lung Lesions on CT Images and Its Implication for Radiomic Models | M. Ferrante, L. Rinaldi, F. Botta, Xiao-Bin Hu, Andreas Dolp, M. Minotti, F. De Piano, G. Funicelli, S. Volpe, F. Bellerba, P. De Marco, S. Raimondi, S. Rizzo, Kuangyu Shi, M. Cremonesi, B. Jereczek-Fossa, L. Spaggiari, F. de Marinis, R. Orecchia, D. Origgi | 2022 | Journal of Clinical Medicine | vol 11 | doi 10.3390/jcm11247334 | Semantic Scholar 363a778e6163e3dd0669e981ed1e7628a8999f77 | open access https://www.mdpi.com/2077-0383/11/24/7334/pdf?version=1670918624
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### choi2020idh1
Command: python3 lookup resolve '10.1016/j.ejrad.2020.109031'
```
Crossref: ratio 1.00: IDH1 mutation prediction using MR-based radiomics in glioblastoma: comparison between manual and fully automated deep learning-based approach of tumor segmentation | Yangsean Choi, Yoonho Nam, Youn Soo Lee, Jiwoong Kim, Kook-Jin Ahn, Jinhee Jang, Na-Young Shin, Bum-Soo Kim, Sin-Soo Jeon | 2020 | European Journal of Radiology | vol 128 | pages 109031 | doi 10.1016/j.ejrad.2020.109031
OpenAlex: ratio 1.00: IDH1 mutation prediction using MR-based radiomics in glioblastoma: comparison between manual and fully automated deep learning-based approach of tumor segmentation | Yangsean Choi, Yoonho Nam, Youn Soo Lee, Jiwoong Kim, Kook Jin Ahn, Jinhee Jang, Na<hyphen>Young Shin, Bum<hyphen>Soo Kim, Sin-Soo Jeon | 2020 | European Journal of Radiology | vol 128 | pages 109031--109031 | doi 10.1016/j.ejrad.2020.109031 | OpenAlex W3023279341
Semantic Scholar: ratio 1.00: IDH1 mutation prediction using MR-based radiomics in glioblastoma: comparison between manual and fully automated deep learning-based approach of tumor segmentation. | Yangsean Choi, Y. Nam, Youn Soo Lee, Jiwoong Kim, K. Ahn, J. Jang, Na-Young Shin, B. Kim, S. Jeon | 2020 | European Journal of Radiology | vol 128 | pages 109031 | doi 10.1016/j.ejrad.2020.109031 | Semantic Scholar f9cfca055ffa528228fa9f0607edea331ed62c60
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kothari2022impact
Command: python3 lookup resolve '10.1038/s41598-022-16520-9'
```
Crossref: ratio 1.00: The impact of inter-observer variation in delineation on robustness of radiomics features in non-small cell lung cancer | Gargi Kothari, Beverley Woon, Cameron J. Patrick, James Korte, Leonard Wee, Gerard G. Hanna, Tomas Kron, Nicholas Hardcastle, Shankar Siva | 2022 | Scientific Reports | vol 12 | no 1 | doi 10.1038/s41598-022-16520-9
OpenAlex: ratio 1.00: The impact of inter-observer variation in delineation on robustness of radiomics features in non-small cell lung cancer | Gargi Kothari, Beverley Woon, Cameron James Patrick, James C. Korte, Leonard Wee, Gerard G. Hanna, Tomas Kron, Nicholas Hardcastle, Shankar Siva | 2022 | Scientific Reports | vol 12 | no 1 | pages 12822--12822 | doi 10.1038/s41598-022-16520-9 | OpenAlex W4288067243 | open access https://www.nature.com/articles/s41598-022-16520-9.pdf
Semantic Scholar: ratio 1.00: The impact of inter-observer variation in delineation on robustness of radiomics features in non-small cell lung cancer | G. Kothari, B. Woon, C. Patrick, J. Korte, L. Wee, G. Hanna, T. Kron, N. Hardcastle, S. Siva | 2022 | Scientific Reports | vol 12 | doi 10.1038/s41598-022-16520-9 | Semantic Scholar 5a3fc5f4af0e8de2cb0c553f0d8aa8482964db44 | open access https://www.nature.com/articles/s41598-022-16520-9.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### pasini2023critical
Command: python3 lookup resolve '10.3390/diagnostics13243640'
```
Crossref: ratio 1.00: A Critical Analysis of the Robustness of Radiomics to Variations in Segmentation Methods in 18F-PSMA-1007 PET Images of Patients Affected by Prostate Cancer | Giovanni Pasini, Giorgio Russo, Cristina Mantarro, Fabiano Bini, Selene Richiusa, Lucrezia Morgante, Albert Comelli, Giorgio Russo, Maria Sabini, Sebastiano Cosentino, Franco Marinozzi, Massimo Ippolito, Alessandro Stefano | 2023 | Diagnostics | vol 13 | no 24 | pages 3640 | doi 10.3390/diagnostics13243640
OpenAlex: ratio 1.00: A Critical Analysis of the Robustness of Radiomics to Variations in Segmentation Methods in 18F-PSMA-1007 PET Images of Patients Affected by Prostate Cancer | Giovanni Pasini, Giorgio Ivan Russo, Cristina Mantarro, Fabiano Bini, Selene Richiusa, Lucrezia Morgante, Albert Comelli, Giorgio Ivan Russo, MARIA GABRIELLA SABINI, Sebastiano Cosentino, Franco Marinozzi, Massimo Ippolito, Alessandro Stefano | 2023 | Diagnostics | vol 13 | no 24 | pages 3640--3640 | doi 10.3390/diagnostics13243640 | OpenAlex W4389574046 | open access https://www.mdpi.com/2075-4418/13/24/3640/pdf?version=1702351212
Semantic Scholar: ratio 1.00: A Critical Analysis of the Robustness of Radiomics to Variations in Segmentation Methods in 18F-PSMA-1007 PET Images of Patients Affected by Prostate Cancer | G. Pasini, G. Russo, Cristina Mantarro, F. Bini, S. Richiusa, Lucrezia Morgante, A. Comelli, G. Russo, M. G. Sabini, S. Cosentino, F. Marinozzi, M. Ippolito, A. Stefano | 2023 | Diagnostics | vol 13 | doi 10.3390/diagnostics13243640 | Semantic Scholar b3011bbb3d2bbd32cb6c94484b46b5bee12217d9 | open access https://www.mdpi.com/2075-4418/13/24/3640/pdf?version=1702351212
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dutta2024robustness
Command: python3 lookup resolve '10.1016/j.phro.2023.100530'
```
Crossref: ratio 1.00: Robustness of magnetic resonance imaging and positron emission tomography radiomic features in prostate cancer: Impact on recurrence prediction after radiation therapy | Arpita Dutta, Joseph Chan, Annette Haworth, David J. Dubowitz, Andrew Kneebone, Hayley M. Reynolds | 2024 | Physics and Imaging in Radiation Oncology | vol 29 | pages 100530 | doi 10.1016/j.phro.2023.100530
OpenAlex: ratio 1.00: Robustness of magnetic resonance imaging and positron emission tomography radiomic features in prostate cancer: Impact on recurrence prediction after radiation therapy | Arpita Dutta, Joseph C. Y. Chan, Annette Haworth, David J. Dubowitz, Andrew B. Kneebone, Hayley M. Reynolds | 2023 | Physics and Imaging in Radiation Oncology | vol 29 | pages 100530--100530 | doi 10.1016/j.phro.2023.100530 | OpenAlex W4390463252 | open access http://www.phiro.science/article/S2405631623001215/pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### louis2024identification
Command: python3 lookup resolve '10.1038/s41598-024-58551-4'
```
Crossref: ratio 1.00: Identification of CT radiomic features robust to acquisition and segmentation variations for improved prediction of radiotherapy-treated lung cancer patient recurrence | Thomas Louis, Fran<latin small letter c with cedilla>ois Lucia, Fran<latin small letter c with cedilla>ois Cousin, Carole Mievis, Nicolas Jansen, Bernard Duysinx, Romain Le Pennec, Dimitris Visvikis, Malik Nebbache, Martin Rehn, Mohamed Hamya, Margaux Geier, Pierre-Yves Salaun, Ulrike Schick, Mathieu Hatt, Philippe Coucke, Pierre Lovinfosse, Roland Hustinx | 2024 | Scientific Reports | vol 14 | no 1 | doi 10.1038/s41598-024-58551-4
OpenAlex: ratio 1.00: Identification of CT radiomic features robust to acquisition and segmentation variations for improved prediction of radiotherapy-treated lung cancer patient recurrence | Thomas Louis, Fran<latin small letter c with cedilla>ois Lucia, Fran<latin small letter c with cedilla>ois Cousin, Carole Mievis, Nicolas Jansen, Bernard Duysinx, Romain Le Pennec, Dimitris Visvikis, Malik Nebbache, Martin Rehn, Mohamed Hamya, Margaux Geier, Pierre<hyphen>Yves Sala<latin small letter u with diaeresis>n, Ulrike Schick, Mathieu Hatt, Philippe Antoine Coucke, Pierre Lovinfosse, Roland Hustinx | 2024 | Scientific Reports | vol 14 | no 1 | pages 9028--9028 | doi 10.1038/s41598-024-58551-4 | OpenAlex W4394963056 | open access https://www.nature.com/articles/s41598-024-58551-4.pdf
Semantic Scholar: ratio 1.00: Identification of CT radiomic features robust to acquisition and segmentation variations for improved prediction of radiotherapy-treated lung cancer patient recurrence | T. Louis, F. Lucia, F. Cousin, C. Mievis, Nicolas Jansen, B. Duysinx, R. Le Pennec, D. Visvikis, M. Nebbache, M. Rehn, M. Hamya, M. Geier, P. Salaun, U. Schick, M. Hatt, P. Coucke, P. Lovinfosse, R. Hustinx | 2024 | Scientific Reports | vol 14 | doi 10.1038/s41598-024-58551-4 | Semantic Scholar 35aeecdec09188b102355eb7bdfd234e31198b8c | open access https://www.nature.com/articles/s41598-024-58551-4.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### leijenaar2013stability
Command: python3 lookup resolve '10.3109/0284186x.2013.812798'
```
Crossref: ratio 1.00: Stability of FDG-PET Radiomics features: An integrated analysis of test-retest and inter-observer variability | Ralph T. H. Leijenaar, Sara Carvalho, Emmanuel Rios Velazquez, Wouter J. C. van Elmpt, Chintan Parmar, Otto S. Hoekstra, Corneline J. Hoekstra, Ronald Boellaard, Andr<latin small letter e with acute> L. A. J. Dekker, Robert J. Gillies, Hugo J. W. L. Aerts, Philippe Lambin | 2013 | Acta Oncologica | vol 52 | no 7 | pages 1391--1397 | doi 10.3109/0284186x.2013.812798
OpenAlex: ratio 1.00: Stability of FDG-PET Radiomics features: An integrated analysis of test-retest and inter-observer variability | Ralph T. H. Leijenaar, Sara Carvalho, Emmanuel Rios Velazquez, Wouter van Elmpt, Chintan Parmar, Otto S. Hoekstra, Corneline J. Hoekstra, Ronald Boellaard, Andre L.A.J. Dekker, Robert J. Gillies, Hugo J.W.L. Aerts, Philippe Lambin | 2013 | Acta Oncologica | vol 52 | no 7 | pages 1391--1397 | doi 10.3109/0284186x.2013.812798 | OpenAlex W2089588713 | open access https://www.tandfonline.com/doi/pdf/10.3109/0284186X.2013.812798?needAccess=true
Semantic Scholar: ratio 1.00: Stability of FDG-PET Radiomics features: An integrated analysis of test-retest and inter-observer variability | R. Leijenaar, S. Carvalho, E. Velazquez, W. van Elmpt, C. Parmar, O. Hoekstra, C. Hoekstra, R. Boellaard, A. Dekker, R. Gillies, H. Aerts, P. Lambin | 2013 | Acta oncologica | vol 52 | pages 1391--1397 | doi 10.3109/0284186X.2013.812798 | Semantic Scholar 25cb862e40fe53ecee040b6d559fad66c1bd698b | open access https://www.tandfonline.com/doi/pdf/10.3109/0284186X.2013.812798?needAccess=true
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kalpathycramer2016radiomics
Command: python3 lookup resolve '10.18383/j.tom.2016.00235'
```
Crossref: ratio 1.00: Radiomics of Lung Nodules: A Multi-Institutional Study of Robustness and Agreement of Quantitative Imaging Features | Jayashree Kalpathy-Cramer, Artem Mamomov, Binsheng Zhao, Lin Lu, Dmitry Cherezov, Sandy Napel, Sebastian Echegaray, Daniel Rubin, Michael McNitt-Gray, Pechin Lo, Jessica C. Sieren, Johanna Uthoff, Samantha K. N. Dilger, Brandan Driscoll, Ivan Yeung, Lubomir Hadjiiski, Kenny Cha, Yoganand Balagurunathan, Robert Gillies, Dmitry Goldgof | 2016 | Tomography | vol 2 | no 4 | pages 430--437 | doi 10.18383/j.tom.2016.00235
OpenAlex: ratio 1.00: Radiomics of Lung Nodules: A Multi-Institutional Study of Robustness and Agreement of Quantitative Imaging Features | Jayashree Kalpathy<en dash>Cramer, Artem Mamomov, Binsheng Zhao, Lin L<latin small letter u with diaeresis>, Dmitry Cherezov, Sandy A. Napel, Sebastian Echegaray, Daniel L. Rubin, Michael F. McNitt<hyphen>Gray, Pechin Lo, Jessica C. Sieren, Johanna Uthoff, Samantha K. N. Dilger, Brandan Driscoll, Ivan W. T. Yeung, Lubomir M. Hadjiiski, Kenny Cha, Yoganand Balagurunathan, Robert J. Gillies, Dmitry B. Goldgof | 2016 | Tomography | vol 2 | no 4 | pages 430--437 | doi 10.18383/j.tom.2016.00235 | OpenAlex W2586281702 | open access https://www.mdpi.com/2379-139X/2/4/430/pdf?version=1622990172
Semantic Scholar: ratio 1.00: Radiomics of Lung Nodules: A Multi-Institutional Study of Robustness and Agreement of Quantitative Imaging Features | Jayashree Kalpathy-Cramer, Artem Mamomov, Bin-Sheng Zhao, Lin Lu, D. Cherezov, S. Napel, S. Echegaray, D. Rubin, M. McNitt-Gray, P. Lo, J. Sieren, J. Uthoff, Samantha K. N. Dilger, Brandan Driscoll, I. Yeung, L. Hadjiiski, Kenny H. Cha, Y. Balagurunathan, R. Gillies, D. Goldgof | 2016 | Tomography | vol 2 | pages 430--437 | doi 10.18383/j.tom.2016.00235 | Semantic Scholar 4e32c5b8276aec69856cb9be1a4eb62f411c942b | open access https://www.mdpi.com/2379-139X/2/4/430/pdf?version=1622990172
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### parmar2014robust
Command: python3 lookup resolve '10.1371/journal.pone.0102107'
```
Crossref: ratio 1.00: Robust Radiomics Feature Quantification Using Semiautomatic Volumetric Segmentation | Chintan Parmar, Emmanuel Rios Velazquez, Ralph Leijenaar, Mohammed Jermoumi, Sara Carvalho, Raymond H. Mak, Sushmita Mitra, B. Uma Shankar, Ron Kikinis, Benjamin Haibe-Kains, Philippe Lambin, Hugo J. W. L. Aerts | 2014 | PLoS ONE | vol 9 | no 7 | pages e102107 | doi 10.1371/journal.pone.0102107
OpenAlex: ratio 1.00: Robust Radiomics Feature Quantification Using Semiautomatic Volumetric Segmentation | Chintan Parmar, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Mohammed Jermoumi, Sara Carvalho, Raymond H. Mak, Sushmita Mitra, B. Uma Shankar, Ron Kikinis, Benjamin Haibe<hyphen>Kains, Philippe Lambin, Hugo J.W.L. Aerts | 2014 | PLoS ONE | vol 9 | no 7 | pages e102107--e102107 | doi 10.1371/journal.pone.0102107 | OpenAlex W2052507258 | open access https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0102107&type=printable
Semantic Scholar: ratio 1.00: Robust Radiomics Feature Quantification Using Semiautomatic Volumetric Segmentation | C. Parmar, E. Velazquez, R. Leijenaar, M. Jermoumi, S. Carvalho, R. Mak, S. Mitra, B. Shankar, R. Kikinis, Benjamin Haibe-Kains, P. Lambin, H. Aerts | 2014 | PLoS ONE | vol 9 | doi 10.1371/journal.pone.0102107 | Semantic Scholar 18292001f06b3fe7fe622df696351d8ceff793e2 | open access https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0102107&type=printable
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tixier2019reliability
Command: python3 lookup resolve '10.1002/mp.13624'
```
Crossref: ratio 1.00: Reliability of tumor segmentation in glioblastoma: Impact on the robustness of MRI<hyphen>radiomic features | Florent Tixier, Hyemin Um, Robert J Young, Harini Veeraraghavan | 2019 | Medical Physics | vol 46 | no 8 | pages 3582--3591 | doi 10.1002/mp.13624
OpenAlex: ratio 1.00: Reliability of tumor segmentation in glioblastoma: Impact on the robustness of MRI<hyphen>radiomic features | Florent Tixier, Hyemin Um, Robert J. Young, Harini Veeraraghavan | 2019 | Medical Physics | vol 46 | no 8 | pages 3582--3591 | doi 10.1002/mp.13624 | OpenAlex W2946875611 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC6692188/
Semantic Scholar: ratio 1.00: Reliability of tumor segmentation in glioblastoma: impact on the robustness of MRI-radiomic features | F. Tixier, Hyemin Um, R. Young, H. Veeraraghavan | 2019 | Medical Physics (Lancaster) | vol 46 | pages 3582--3591 | doi 10.1002/mp.13624 | Semantic Scholar caaf1eeed36b0adeacbdbb1820e7b64bcd9b5c14 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC6692188/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### saha2018breast
Command: python3 lookup resolve '10.1002/mp.12925'
```
Crossref: ratio 1.00: Breast cancer <scp>MRI</scp> radiomics: An overview of algorithmic features and impact of inter<hyphen>reader variability in annotating tumors | Ashirbani Saha, Michael R. Harowicz, Maciej A. Mazurowski | 2018 | Medical Physics | vol 45 | no 7 | pages 3076--3085 | doi 10.1002/mp.12925
OpenAlex: ratio 0.98: Breast cancer MRI radiomics: An overview of algorithmic features and impact of inter<hyphen>reader variability in annotating tumors | Ashirbani Saha, Michael R. Harowicz, Maciej A. Mazurowski | 2018 | Medical Physics | vol 45 | no 7 | pages 3076--3085 | doi 10.1002/mp.12925 | OpenAlex W2802305998 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/6446907
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### qiu2019reproducibility
Command: python3 lookup resolve '10.21037/qims.2019.03.02'
```
Crossref: ratio 1.00: Reproducibility and non-redundancy of radiomic features extracted from arterial phase CT scans in hepatocellular carcinoma patients: impact of tumor segmentation variability | Qingtao Qiu, Jinghao Duan, Zuyun Duan, Xiangjuan Meng, Changsheng Ma, Jian Zhu, Jie Lu, Tonghai Liu, Yong Yin | 2019 | Quantitative Imaging in Medicine and Surgery | vol 9 | no 3 | pages 453--464 | doi 10.21037/qims.2019.03.02
OpenAlex: ratio 1.00: Reproducibility and non-redundancy of radiomic features extracted from arterial phase CT scans in hepatocellular carcinoma patients: impact of tumor segmentation variability | Qingtao Qiu, Jinghao Duan, Zuyun Duan, Xiangjuan Meng, Changsheng Ma, Jian Zhu, Jie Lu, Tonghai Liu, Yong Yin | 2019 | Quantitative Imaging in Medicine and Surgery | vol 9 | no 3 | pages 453--464 | doi 10.21037/qims.2019.03.02 | OpenAlex W2921137012 | open access https://doi.org/10.21037/qims.2019.03.02
Semantic Scholar: ratio 1.00: Reproducibility and non-redundancy of radiomic features extracted from arterial phase CT scans in hepatocellular carcinoma patients: impact of tumor segmentation variability. | Qingtao Qiu, J. Duan, Zuyun Duan, Xiang-Juan Meng, Chang-Sheng Ma, Jian Zhu, Jie Lu, Tong-Hai Liu, Yong Yin | 2019 | Quantitative Imaging in Medicine and Surgery | vol 9 3 | pages 453--464 | doi 10.21037/QIMS.2019.03.02 | Semantic Scholar bfb531afc982fe8d70e4ca2368fa6266070443ff | open access https://doi.org/10.21037/qims.2019.03.02
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### arachchige2026segmentation
Command: python3 lookup resolve '10.1088/1361-6560/aebf1b'
```
Crossref: ratio 1.00: Segmentation-perturbation propagation in pretrained foundation-model embeddings versus IBSI-aligned radiomics for radiologist-assessed lung-nodule malignancy classification on the LIDC-IDRI cohort | Iran Chamika Kumarananda Wanni Arachchige | 2026 | Physics in Medicine &amp; Biology | doi 10.1088/1361-6560/aebf1b
OpenAlex: ratio 1.00: Segmentation-perturbation propagation in pretrained foundation-model embeddings versus IBSI-aligned radiomics for radiologist-assessed lung-nodule malignancy classification on the LIDC-IDRI cohort | Wanni Arachchige Iran Chamika Kumarananda | 2026 | Physics in Medicine and Biology | doi 10.1088/1361-6560/aebf1b | OpenAlex W7225416965 | open access https://iopscience.iop.org/article/10.1088/1361-6560/aebf1b/pdf
Semantic Scholar: ratio 1.00: Segmentation-perturbation propagation in pretrained foundation-model embeddings versus IBSI-aligned radiomics for radiologist-assessed lung-nodule malignancy classification on the LIDC-IDRI cohort. | Iran Chamika Kumarananda Wanni Arachchige | 2026 | Physics in Medicine and Biology | doi 10.1088/1361-6560/aebf1b | Semantic Scholar 5fb132e7a9618a1ced3f5c566d2bfaf766227984 | open access https://iopscience.iop.org/article/10.1088/1361-6560/aebf1b/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### fan2024amyloidpetnet
Command: python3 lookup resolve '10.1148/radiol.231442'
```
Crossref: ratio 1.00: AmyloidPETNet: Classification of Amyloid Positivity in Brain PET Imaging Using End-to-End Deep Learning | Shuyang Fan, Maria Rosana Ponisio, Pan Xiao, Sung Min Ha, Satrajit Chakrabarty, John J. Lee, Shaney Flores, Pamela LaMontagne, Brian Gordon, Cyrus A. Raji, Daniel S. Marcus, Arash Nazeri, Beau M. Ances, Randall J. Bateman, John C. Morris, Tammie L. S. Benzinger, Aristeidis Sotiras, for the Alzheimer's Disease Neuroimaging Initiative | 2024 | Radiology | vol 311 | no 3 | doi 10.1148/radiol.231442
OpenAlex: ratio 1.00: AmyloidPETNet: Classification of Amyloid Positivity in Brain PET Imaging Using End-to-End Deep Learning | Shuyang Fan, Maria Rosana Ponisio, Pan Xiao, Sung Min Ha, Satrajit Chakrabarty, John J. Lee, Shaney E. Flores, Pamela LaMontagne, Brian Andrew Gordon, Cyrus A. Raji, Daniel S. Marcus, Arash Nazeri, Beau M. Ances, Randall John Bateman, John C. Morris, Tammie L.S. Benzinger, Aristeidis Sotiras, Alzheimer<right single quotation mark>s Disease Neuroimaging Initiative | 2024 | Radiology | vol 311 | no 3 | pages e231442--e231442 | doi 10.1148/radiol.231442 | OpenAlex W4399538499 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC11211958/pdf/radiol.231442.pdf
Semantic Scholar: ratio 1.00: AmyloidPETNet: Classification of Amyloid Positivity in Brain PET Imaging Using End-to-End Deep Learning. | Shawn Fan, M. Ponisio, Pan Xiao, Sungmin Ha, Satrajit Chakrabarty, John J. Lee, S. Flores, P. LaMontagne, B. Gordon, C. Raji, D. Marcus, A. Nazeri, B. Ances, R. Bateman, John C. Morris, T. Benzinger, Aristeidis Sotiras | 2024 | Radiology | vol 311 3 | pages e231442 | doi 10.1148/radiol.231442 | Semantic Scholar 704bd5bb416c0ab29d210da4b9b41de64d8b2ba2 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC11211958/pdf/radiol.231442.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wood2022accurate
Command: python3 lookup resolve '10.1016/j.neuroimage.2022.118871'
```
Crossref: ratio 1.00: Accurate brain<hyphen>age models for routine clinical MRI examinations | David A. Wood, Sina Kafiabadi, Ayisha Al Busaidi, Emily Guilhem, Antanas Montvila, Jeremy Lynch, Matthew Townend, Siddharth Agarwal, Asif Mazumder, Gareth J. Barker, Sebastien Ourselin, James H. Cole, Thomas C. Booth | 2022 | NeuroImage | vol 249 | pages 118871 | doi 10.1016/j.neuroimage.2022.118871
OpenAlex: ratio 1.00: Accurate brain<hyphen>age models for routine clinical MRI examinations | David A. Wood, Sina Kafiabadi, Ayisha Al Busaidi, Emily Guilhem, Antanas Montvila, Jeremy Lynch, Matthew Townend, Siddharth Agarwal, Asif Mazumder, Gareth J. Barker, S<latin small letter e with acute>bastien Ourselin, James Howard Cole, Thomas Calvert Booth | 2022 | NeuroImage | vol 249 | pages 118871--118871 | doi 10.1016/j.neuroimage.2022.118871 | OpenAlex W4206370218 | open access https://www.sciencedirect.com/science/article/pii/S1053811922000015/pdf
Semantic Scholar: ratio 1.00: Accurate brain-age models for routine clinical MRI examinations | D. Wood, Sina Kafiabadi, A. Al Busaidi, Emily Guilhem, A. Montvila, J. Lynch, Matthew Townend, Siddharth Agarwal, Asif Mazumder, G. Barker, S. Ourselin, James H. Cole, T. Booth | 2022 | NeuroImage | pages 118871 | doi 10.1016/j.neuroimage.2022.118871 | Semantic Scholar 9499acf1d9a7d40dc96201d501798d8f4fc8c3f6 | open access https://www.sciencedirect.com/science/article/pii/S1053811922000015/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### torres2021end
Command: python3 lookup resolve '10.1200/cci.21.00096'
```
Crossref: ratio 1.00: End-to-End Non<en dash>Small-Cell Lung Cancer Prognostication Using Deep Learning Applied to Pretreatment Computed Tomography | Felipe Soares Torres, Shazia Akbar, Srinivas Raman, Kazuhiro Yasufuku, Carola Schmidt, Ahmed Hosny, Felix Baldauf-Lenschen, Natasha B. Leighl | 2021 | JCO Clinical Cancer Informatics | no 5 | pages 1141--1150 | doi 10.1200/cci.21.00096
OpenAlex: ratio 1.00: End-to-End Non<en dash>Small-Cell Lung Cancer Prognostication Using Deep Learning Applied to Pretreatment Computed Tomography | Felipe Soares Torres, Shazia Akbar, Srinivas Raman, Kazuhiro Yasufuku, Carola Schmidt, Ahmed Hosny, Felix Baldauf-Lenschen, Natasha B. Leighl | 2021 | JCO Clinical Cancer Informatics | vol 5 | no 5 | pages 1141--1150 | doi 10.1200/cci.21.00096 | OpenAlex W3214593633 | open access https://ascopubs.org/doi/pdfdirect/10.1200/CCI.21.00096?role=tab
Semantic Scholar: ratio 1.00: End-to-End Non-Small-Cell Lung Cancer Prognostication Using Deep Learning Applied to Pretreatment Computed Tomography. | F. Torres, Shazia Akbar, S. Raman, K. Yasufuku, Carola Schmidt, A. Hosny, F. Baldauf-Lenschen, N. Leighl | 2021 | JCO Clinical Cancer Informatics | vol 5 | pages 1141--1150 | doi 10.1200/CCI.21.00096 | Semantic Scholar b217f24223116c5b68935efb6ab466d08d8843c8 | open access https://ascopubs.org/doi/pdfdirect/10.1200/CCI.21.00096?role=tab
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### leung2024deep
Command: python3 lookup resolve '10.2967/jnumed.123.267048'
```
Crossref: ratio 1.00: Deep Semisupervised Transfer Learning for Fully Automated Whole-Body Tumor Quantification and Prognosis of Cancer on PET/CT | Kevin H. Leung, Steven P. Rowe, Moe S. Sadaghiani, Jeffrey P. Leal, Esther Mena, Peter L. Choyke, Yong Du, Martin G. Pomper | 2024 | Journal of Nuclear Medicine | vol 65 | no 4 | pages 643--650 | doi 10.2967/jnumed.123.267048
OpenAlex: ratio 1.00: Deep Semisupervised Transfer Learning for Fully Automated Whole-Body Tumor Quantification and Prognosis of Cancer on PET/CT | Kevin Leung, Steven P. Rowe, Moe S. Sadaghiani, Jeffrey P. Leal, Esther Mena, Peter L. Choyke, Yong Du, Martin G. Pomper | 2024 | Journal of Nuclear Medicine | vol 65 | no 4 | pages 643--650 | doi 10.2967/jnumed.123.267048 | OpenAlex W4392283342 | open access https://jnm.snmjournals.org/content/jnumed/65/4/643.full.pdf
Semantic Scholar: ratio 1.00: Deep Semisupervised Transfer Learning for Fully Automated Whole-Body Tumor Quantification and Prognosis of Cancer on PET/CT | K. H. Leung, S. Rowe, M. Sadaghiani, Jeffrey P. Leal, E. Mena, P. Choyke, Yong Du, M. Pomper | 2024 | Journal of Nuclear Medicine | vol 65 | pages 643--650 | doi 10.2967/jnumed.123.267048 | Semantic Scholar 7d6b0812f7a7758fa4581961d9783a6659fca3d5 | open access https://jnm.snmjournals.org/content/jnumed/65/4/643.full.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tran2025comparing
Command: python3 lookup resolve '10.3390/biotech14040087'
```
Crossref: ratio 1.00: Comparing Handcrafted Radiomics Versus Latent Deep Learning Features of Admission Head CT for Hemorrhagic Stroke Outcome Prediction | Anh T. Tran, Junhao Wen, Gaby Abou Karam, Dorin Zeevi, Adnan I. Qureshi, Ajay Malhotra, Shahram Majidi, Niloufar Valizadeh, Santosh B. Murthy, Mert R. Sabuncu, David Roh, Guido J. Falcone, Kevin N. Sheth, Seyedmehdi Payabvash | 2025 | BioTech | vol 14 | no 4 | pages 87 | doi 10.3390/biotech14040087
OpenAlex: ratio 1.00: Comparing Handcrafted Radiomics Versus Latent Deep Learning Features of Admission Head CT for Hemorrhagic Stroke Outcome Prediction | Anh T. Tran, Junhao Wen, Gaby Abou Karam, Dorin Zeevi, Adnan Iqbal Qureshi, Ajay Malhotra, Shahram Majidi, Niloufar Valizadeh, Santosh B. Murthy, Mert Rory Sabuncu, David Jinou Roh, Guido J. Falcone, Kevin N. Sheth, Seyedmehdi Payabvash | 2025 | BioTech | vol 14 | no 4 | pages 87--87 | doi 10.3390/biotech14040087 | OpenAlex W4415823320 | open access https://www.mdpi.com/2673-6284/14/4/87/pdf?version=1762065619
Semantic Scholar: ratio 1.00: Comparing Handcrafted Radiomics Versus Latent Deep Learning Features of Admission Head CT for Hemorrhagic Stroke Outcome Prediction | Anh T. Tran, Jun-Hao Wen, Gaby Abou Karam, Dorin Zeevi, Adnan I. Qureshi, Ajay Malhotra, S. Majidi, N. Valizadeh, Santosh B. Murthy, M. Sabuncu, D. Roh, G. Falcone, K. Sheth, S. Payabvash | 2025 | BioTech | vol 14 | doi 10.3390/biotech14040087 | Semantic Scholar a8d45de6efff914f4f689de902f8fcfbcaf1bb8d | open access https://www.mdpi.com/2673-6284/14/4/87/pdf?version=1762065619
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kazmierski2023multi
Command: python3 lookup resolve '10.1158/2767-9764.crc-22-0152'
```
Crossref: ratio 1.00: Multi-institutional Prognostic Modeling in Head and Neck Cancer: Evaluating Impact and Generalizability of Deep Learning and Radiomics | Michal Kazmierski, Mattea Welch, Sejin Kim, Chris McIntosh, Katrina Rey-McIntyre, Shao Hui Huang, Tirth Patel, Tony Tadic, Michael Milosevic, Fei-Fei Liu, Adam Ryczkowski, Joanna Kazmierska, Zezhong Ye, Deborah Plana, Hugo J.W.L. Aerts, Benjamin H. Kann, Scott V. Bratman, Andrew J. Hope, Benjamin Haibe-Kains | 2023 | Cancer Research Communications | vol 3 | no 6 | pages 1140--1151 | doi 10.1158/2767-9764.crc-22-0152
OpenAlex: ratio 1.00: Multi-institutional Prognostic Modeling in Head and Neck Cancer: Evaluating Impact and Generalizability of Deep Learning and Radiomics | Michal Kazmierski, Mattea L. Welch, Sejin Kim, Chris McIntosh, Katrina Rey<hyphen>McIntyre, Shao Hui Huang, Tirth Patel, Tony Tadic, Michael Milosevic, Fei<hyphen>Fei Liu, Adam Ryczkowski, Joanna Ka<latin small letter z with acute>mierska, Zezhong Ye, Deborah Plana, Hugo J.W.L. Aerts, Benjamin Harris Kann, Scott Victor Bratman, Andrew J. Hope, Benjamin Haibe<hyphen>Kains | 2023 | Cancer Research Communications | vol 3 | no 6 | pages 1140--1151 | doi 10.1158/2767-9764.crc-22-0152 | OpenAlex W4379798163 | open access https://aacrjournals.org/cancerrescommun/article-pdf/doi/10.1158/2767-9764.CRC-22-0152/3339476/crc-22-0152.pdf
Semantic Scholar: ratio 1.00: Multi-institutional Prognostic Modeling in Head and Neck Cancer: Evaluating Impact and Generalizability of Deep Learning and Radiomics | M. Kazmierski, M. Welch, Sejin Kim, C. Mcintosh, K. Rey-McIntyre, Shao H. Huang, T. Patel, T. Tadic, M. Milosevic, Fei Liu, A. Ryczkowski, J. Kazmierska, Ze-Zhong Ye, D. Plana, H. Aerts, B. Kann, S. Bratman, A. Hope, Benjamin Haibe-Kains | 2023 | Cancer Research Communications | vol 3 | pages 1140--1151 | doi 10.1158/2767-9764.CRC-22-0152 | Semantic Scholar 3887ca65b091ea876b192bc465aa6300e661104c | open access https://aacrjournals.org/cancerrescommun/article-pdf/doi/10.1158/2767-9764.CRC-22-0152/3339476/crc-22-0152.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### beetz2023multi
Command: python3 lookup resolve '10.1007/978-3-031-43895-0_50'
```
Crossref: ratio 1.00: Multi-objective Point Cloud Autoencoders for Explainable Myocardial Infarction Prediction | Marcel Beetz, Abhirup Banerjee, Vicente Grau | 2023 | Lecture Notes in Computer Science | pages 532--542 | doi 10.1007/978-3-031-43895-0_50
OpenAlex: ratio 1.00: Multi-objective Point Cloud Autoencoders for Explainable Myocardial Infarction Prediction | Marcel Beetz, Abhirup Banerjee, Vicente Grau | 2023 | Lecture notes in computer science | pages 532--542 | doi 10.1007/978-3-031-43895-0_50 | OpenAlex W4387211052 | open access https://arxiv.org/pdf/2307.11017
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### adams2023point
Command: python3 lookup resolve '10.1007/978-3-031-43907-0_47'
```
Crossref: ratio 1.00: Can Point Cloud Networks Learn Statistical Shape Models of Anatomies? | Jadie Adams, Shireen Y. Elhabian | 2023 | Lecture Notes in Computer Science | pages 486--496 | doi 10.1007/978-3-031-43907-0_47
OpenAlex: ratio 1.00: Can Point Cloud Networks Learn Statistical Shape Models of Anatomies? | Jadie Adams, Shireen Elhabian | 2023 | Lecture notes in computer science | vol 14220 | pages 486--496 | doi 10.1007/978-3-031-43907-0_47 | OpenAlex W4387211200 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC11534086/pdf/nihms-2028754.pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### benveniste2026longitudinal
Command: python3 lookup resolve '2609.09424'
```
Crossref: not found
OpenAlex: ratio 1.00: Longitudinal tracking of multiple sclerosis lesions in the spinal cord: A validation study | Pierre<hyphen>Louis Benveniste, Julian McGinnis, Shannon Kolind, Larry D. Lynd, SA Morrow, Jiwon Oh, Alexandre Prat, Alice J. Schabas, Penelope S. Smyth, Roger Tam, Anthony Traboulsee, Mark M<latin small letter u with diaeresis>hlau, Herv<latin small letter e with acute> Lombaert, Julien Cohen<hyphen>Adad | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2609.09424 | arXiv 2609.09424 | OpenAlex W7212138292 | open access https://arxiv.org/pdf/2609.09424
Semantic Scholar: ratio 1.00: Longitudinal tracking of multiple sclerosis lesions in the spinal cord: A validation study | Pierre-Louis Benveniste, Julian McGinnis, S. Kolind, L. Lynd, S. Morrow, J. Oh, Alexandre Prat, A. Schabas, Penelope Smyth, R. Tam, A. Traboulsee, M. M<latin small letter u with diaeresis>hlau, H. Lombaert, Julien Cohen-Adad | 2026 | arXiv.org | vol abs/2609.09424 | doi 10.48550/arXiv.2609.09424 | arXiv 2609.09424 | Semantic Scholar 65dae8cce1423ebb3c66118133edf2cbeb3eee39
arXiv: ratio 1.00: Longitudinal tracking of multiple sclerosis lesions in the spinal cord: A validation study | Pierre-Louis Benveniste, Julian McGinnis, Shannon Kolind, Larry D. Lynd, Sarah A. Morrow, Jiwon Oh, Alexandre Prat, Alice Schabas, Penelope Smyth, Roger Tam, Anthony Traboulsee, Mark M<latin small letter u with diaeresis>hlau, Herve Lombaert, Julien Cohen-Adad | 2026 | arXiv 2609.09424
```
Exit status: 0

### siless2020registration
Command: python3 lookup resolve '10.1016/j.neuroimage.2020.116703'
```
Crossref: ratio 1.00: Registration-free analysis of diffusion MRI tractography data across subjects through the human lifespan | Viviana Siless, Juliet Y. Davidow, Jared Nielsen, Qiuyun Fan, Trey Hedden, Marisa Hollinshead, Elizabeth Beam, Constanza M. Vidal Bustamante, Megan C. Garrad, Rosario Santillana, Emily E. Smith, Aya Hamadeh, Jenna Snyder, Michelle K. Drews, Koene R.A. Van Dijk, Margaret Sheridan, Leah H. Somerville, Anastasia Yendiki | 2020 | NeuroImage | vol 214 | pages 116703 | doi 10.1016/j.neuroimage.2020.116703
OpenAlex: ratio 1.00: Registration-free analysis of diffusion MRI tractography data across subjects through the human lifespan | Viviana Siless, Juliet Y. Davidow, Jared Allen Nielsen, Qiuyun Fan, Trey Hedden, Marisa O. Hollinshead, Elizabeth Beam, Constanza M. Vidal Bustamante, Megan C. Garrad, Rosario M. Santillana, Emily E. Smith, Aya Hamadeh, Jenna Snyder, Michelle K. Drews, Koene R. A. Van Dijk, Margaret A. Sheridan, Leah H. Somerville, Anastasia Yendiki | 2020 | NeuroImage | vol 214 | pages 116703--116703 | doi 10.1016/j.neuroimage.2020.116703 | OpenAlex W3009225680 | open access https://www.sciencedirect.com/science/article/pii/S1053811920301907/pdf
Semantic Scholar: ratio 1.00: Registration-free analysis of diffusion MRI tractography data across subjects through the human lifespan | V. Siless, Juliet Y. Davidow, J. Nielsen, Q. Fan, T. Hedden, Marisa O. Hollinshead, Elizabeth Beam, Constanza M. Vidal Bustamante, Megan C. Garrad, Rosario M. Santillana, E. E. Smith, Aya Hamadeh, Jenna Snyder, Michelle K. Drews, K. V. van Dijk, M. Sheridan, L. Somerville, A. Yendiki | 2020 | NeuroImage | vol 214 | pages 116703--116703 | doi 10.1016/j.neuroimage.2020.116703 | Semantic Scholar 8a23cf1f9ce755790b974779d3eee5e02eb4ea47 | open access https://www.sciencedirect.com/science/article/pii/S1053811920301907/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ren2026otsurv
Command: python3 lookup resolve '10.1007/978-3-032-05182-0_43'
```
Crossref: ratio 1.00: OTSurv: A Novel Multiple Instance Learning Framework for Survival Prediction with Heterogeneity-Aware Optimal Transport | Qin Ren, Yifan Wang, Ruogu Fang, Haibin Ling, Chenyu You | 2025 | Lecture Notes in Computer Science | pages 439--449 | doi 10.1007/978-3-032-05182-0_43
OpenAlex: ratio 1.00: OTSurv: A Novel Multiple Instance Learning Framework for Survival Prediction with Heterogeneity-Aware Optimal Transport | Qin Ren, Yifan Wang, Ruogu Fang, Haibin Ling, Chenyu You | 2025 | Lecture notes in computer science | pages 439--449 | doi 10.1007/978-3-032-05182-0_43 | OpenAlex W4414316006 | open access https://arxiv.org/pdf/2506.20741
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### shifaterabbi2025linear
Command: python3 lookup resolve '10.1007/s10851-025-01261-x'
```
Crossref: ratio 1.00: Linear Optimal Transport Subspaces for Point Set Classification | Mohammad Shifat-E-Rabbi, Naqib Sad Pathan, Shiying Li, Yan Zhuang, Abu Hasnat Mohammad Rubaiyat, Gustavo K. Rohde | 2025 | Journal of Mathematical Imaging and Vision | vol 67 | no 4 | doi 10.1007/s10851-025-01261-x
OpenAlex: ratio 1.00: Linear Optimal Transport Subspaces for Point Set Classification | Mohammad Shifat<hyphen>E<hyphen>Rabbi, Naqib Sad Pathan, Shiying Li, Yan Zhuang, Abu Hasnat Mohammad Rubaiyat, Gustavo Kunde Rohde | 2025 | Journal of Mathematical Imaging and Vision | vol 67 | no 4 | doi 10.1007/s10851-025-01261-x | OpenAlex W4412438080 | open access https://www.researchsquare.com/article/rs-4106387/latest.pdf
Semantic Scholar: ratio 1.00: Linear Optimal Transport Subspaces for Point Set Classification | Mohammad Shifat-E.-Rabbi, Naqib Sad Pathan, Shi-Ying Li, Yan Zhuang, A. Rubaiyat, G. Rohde | 2025 | Journal of Mathematical Imaging and Vision | vol 67 | doi 10.1007/s10851-025-01261-x | Semantic Scholar 86d841a3ee340dcea113d278c1dfbbfbbe8c4ce9 | open access https://www.researchsquare.com/article/rs-4106387/latest.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xu2023regularized
Command: python3 lookup resolve '10.1109/tpami.2023.3314661'
```
Crossref: ratio 1.00: Regularized Optimal Transport Layers for Generalized Global Pooling Operations | Hongteng Xu, Minjie Cheng | 2023 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 45 | no 12 | pages 15426--15444 | doi 10.1109/tpami.2023.3314661
OpenAlex: ratio 1.00: Regularized Optimal Transport Layers for Generalized Global Pooling Operations | Hongteng Xu, Minjie Cheng | 2023 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 45 | no 12 | pages 15426--15444 | doi 10.1109/tpami.2023.3314661 | OpenAlex W4386634627 | open access https://ieeexplore.ieee.org/ielx7/34/4359286/10247589.pdf
Semantic Scholar: ratio 1.00: Regularized Optimal Transport Layers for Generalized Global Pooling Operations | Hongteng Xu, Min-Jie Cheng | 2022 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 45 | pages 15426--15444 | doi 10.1109/TPAMI.2023.3314661 | arXiv 2212.06339 | Semantic Scholar 0f422f1904f3e1b3e966bd61b3a27334a540f91d | open access https://ieeexplore.ieee.org/ielx7/34/4359286/10247589.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tosun2015detection
Command: python3 lookup resolve '10.1002/cyto.a.22602'
```
Crossref: ratio 1.00: Detection of malignant mesothelioma using nuclear structure of mesothelial cells in effusion cytology specimens | Akif Burak Tosun, Oleksandr Yergiyev, Soheil Kolouri, Jan F. Silverman, Gustavo K. Rohde | 2015 | Cytometry Part A | vol 87 | no 4 | pages 326--333 | doi 10.1002/cyto.a.22602
OpenAlex: ratio 1.00: Detection of malignant mesothelioma using nuclear structure of mesothelial cells in effusion cytology specimens | Akif Burak Tosun, Oleksandr Yergiyev, Soheil Kolouri, Jan F. Silverman, Gustavo Kunde Rohde | 2015 | Cytometry Part A | vol 87 | no 4 | pages 326--333 | doi 10.1002/cyto.a.22602 | OpenAlex W2096720629 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC4683592/
Semantic Scholar: ratio 1.00: Detection of Malignant Mesothelioma Using Nuclear Structure of Mesothelial Cells in Effusion Cytology Specimens | A. B. Tosun, Oleksandr Yergiyev, Soheil Kolouri, J. Silverman, G. Rohde | 2015 | Cytometry Part A | vol 87 | pages 326--333 | doi 10.1002/cyto.a.22602 | Semantic Scholar 58e5c5e4e333552e58bf88a1a38be2c1c3919099 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC4683592/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### hanna2017predictive
Command: python3 lookup resolve '10.4103/jpi.jpi_84_16'
```
Crossref: ratio 1.00: Predictive Nuclear Chromatin Characteristics of Melanoma and Dysplastic Nevi | Matthew G. Hanna, Chi Liu, Gustavo K. Rohde, Rajendra Singh | 2017 | Journal of Pathology Informatics | vol 8 | no 1 | pages 15 | doi 10.4103/jpi.jpi_84_16
OpenAlex: ratio 1.00: Predictive Nuclear Chromatin Characteristics of Melanoma and Dysplastic Nevi | Matthew G. Hanna, Chi Liu, Gustavo Kunde Rohde, Rajendra Singh | 2017 | Journal of Pathology Informatics | vol 8 | no 1 | pages 15--15 | doi 10.4103/jpi.jpi_84_16 | OpenAlex W2606888570 | open access https://www.sciencedirect.com/science/article/pii/S2153353922004199/pdf
Semantic Scholar: ratio 1.00: Predictive Nuclear Chromatin Characteristics of Melanoma and Dysplastic Nevi | M. Hanna, Chi Liu, G. Rohde, Rajendra Singh | 2017 | Journal of Pathology Informatics | vol 8 | doi 10.4103/jpi.jpi_84_16 | Semantic Scholar c3d9592ff6faf88c04612f4e3c06a954ff492f06 | open access https://www.sciencedirect.com/science/article/pii/S2153353922004199/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### engelson2026deep
Command: python3 lookup resolve '10.1117/1.jmi.13.1.014507'
```
Crossref: ratio 1.00: Deep learning-based mediastinal lymph node assessment on PET/CT images without pixel-level annotations | Sofija Engelson, Yannic Elser, Malte Maria Sieren, Jan Ehrhardt, Julia Andresen, Stefanie Schierholz, Tobias Keck, Daniel Dr<latin small letter o with diaeresis>mann, J<latin small letter o with diaeresis>rg Barkhausen, Heinz Handels | 2026 | Journal of Medical Imaging | vol 13 | no 01 | pages 1--18 | doi 10.1117/1.jmi.13.1.014507
OpenAlex: ratio 1.00: Deep learning-based mediastinal lymph node assessment on PET/CT images without pixel-level annotations | Sofija Engelson, Yannic Elser, Malte Maria Sieren, Jan Ehrhardt, Julia Andresen, Stefanie Schierholz, Tobias Keck, Daniel Dr<latin small letter o with diaeresis>mann, J<latin small letter o with diaeresis>rg Barkhausen, Heinz Handels | 2026 | Journal of medical imaging | vol 13 | no 01 | pages 1--18 | doi 10.1117/1.jmi.13.1.014507 | OpenAlex W7130380527 | open access https://doi.org/10.1117/1.jmi.13.1.014507
Semantic Scholar: ratio 1.00: Deep learning-based mediastinal lymph node assessment on PET/CT images without pixel-level annotations | S. Engelson, Y. Elser, M. Sieren, J. Ehrhardt, J. Andresen, S. Schierholz, T. Keck, D. Dr<latin small letter o with diaeresis>mann, J. Barkhausen, H. Handels | 2026 | Journal of Medical Imaging | vol 13 | pages 014507--014507 | doi 10.1117/1.JMI.13.1.014507 | Semantic Scholar c667bb24a735e34dc2e8952996445dd3767ff10e | open access https://doi.org/10.1117/1.jmi.13.1.014507
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### pandilova2026multi
Command: python3 lookup resolve '10.3390/diagnostics16213632'
```
Crossref: ratio 1.00: Multi-Reference Evaluation of Deep Learning Tumour Segmentation in Multi-Sequence Nasopharyngeal Carcinoma MRI | Ema Pandilova, Marko Petrov, Ivan Chorbev, Ivan Kitanovski, Aleksandar Stojmenski, Dimitar Trajanov | 2026 | Diagnostics | vol 16 | no 21 | pages 3632 | doi 10.3390/diagnostics16213632
OpenAlex: ratio 1.00: Multi-Reference Evaluation of Deep Learning Tumour Segmentation in Multi-Sequence Nasopharyngeal Carcinoma MRI | Ema Pandilova, Marko Petrov, Ivan Chorbev, Ivan Kitanovski, Aleksandar Stojmenski, Dimitar Trajanov | 2026 | Diagnostics | vol 16 | no 21 | pages 3632--3632 | doi 10.3390/diagnostics16213632 | OpenAlex W7225199136 | open access https://doi.org/10.3390/diagnostics16213632
Semantic Scholar: ratio 1.00: Multi-Reference Evaluation of Deep Learning Tumour Segmentation in Multi-Sequence Nasopharyngeal Carcinoma MRI | Ema Pandilova, M. Petrov, Ivan Chorbev, Ivan Kitanovski, A. Stojmenski, D. Trajanov | 2026 | Diagnostics | vol 16 | doi 10.3390/diagnostics16213632 | Semantic Scholar 11865414de0237cc576d028cba31c081470eea1f | open access https://doi.org/10.3390/diagnostics16213632
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### fujibayashi2021nonlinear
Command: python3 lookup resolve '10.1109/embc46164.2021.9631044'
```
Crossref: ratio 1.00: Nonlinear registration as an effective preprocessing technique for Deep learning based classification of disease | Daiki Fujibayashi, Hiromasa Sakaguchi, Ilya Ardakani, Akihiro Okuno | 2021 | 2021 43rd Annual International Conference of the IEEE Engineering in Medicine &amp; Biology Society (EMBC) | pages 3245--3250 | doi 10.1109/embc46164.2021.9631044
OpenAlex: ratio 1.00: Nonlinear registration as an effective preprocessing technique for Deep learning based classification of disease | Daiki Fujibayashi, Hiromasa Sakaguchi, Ilya Ardakani, Akihiro Okuno | 2021 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC) | vol 2021 | pages 3245--3250 | doi 10.1109/embc46164.2021.9631044 | OpenAlex W4200157821 | open access https://ieeexplore.ieee.org/ielx7/9629355/9629471/09631044.pdf
Semantic Scholar: ratio 1.00: Nonlinear registration as an effective preprocessing technique for Deep learning based classification of disease | Daiki Fujibayashi, Hiromasa Sakaguchi, Ilya Ardakani, Akihiro Okuno | 2021 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society | pages 3245--3250 | doi 10.1109/EMBC46164.2021.9631044 | Semantic Scholar 0a41eb10eb27b59600a66ac88cabfa34a918fd17 | open access https://ieeexplore.ieee.org/ielx7/9629355/9629471/09631044.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### perezngonzalez2019automatic
Command: python3 lookup resolve '10.1109/embc.2019.8856372'
```
Crossref: ratio 1.00: Automatic Classification of Alzheimer<right single quotation mark>s Disease based on CPD Brain Point Cloud Registration for Feature Extraction | Jorge PereznGonzalez, Cristian Azamar, Omar PinanRamirez | 2019 | 2019 41st Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC) | pages 812--815 | doi 10.1109/embc.2019.8856372
OpenAlex: ratio 1.00: Automatic Classification of Alzheimer<right single quotation mark>s Disease based on CPD Brain Point Cloud Registration for Feature Extraction | Jorge P<latin small letter e with acute>rez-Gonz<latin small letter a with acute>lez, Cristian Azamar, Omar PinanRamirez | 2019 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC) | vol 2019 | pages 812--815 | doi 10.1109/embc.2019.8856372 | OpenAlex W2979415761
Semantic Scholar: ratio 1.00: Automatic Classification of Alzheimer<right single quotation mark>s Disease based on CPD Brain Point Cloud Registration for Feature Extraction | J. Perez-Gonzalez, Cristian Azamar, O. Pi<latin small letter n with tilde>a-Ram<latin small letter i with acute>rez | 2019 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society | pages 812--815 | doi 10.1109/EMBC.2019.8856372 | Semantic Scholar f11596f06d2e76e70b20e8adeb81a21c69127349
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tu2020computing
Command: python3 lookup resolve '10.1007/s12021-020-09459-7'
```
Crossref: ratio 1.00: Computing Univariate Neurodegenerative Biomarkers with Volumetric Optimal Transportation: A Pilot Study | The Alzheimer<right single quotation mark>s Disease Neuroimaging Initiative, Yanshuai Tu, Liang Mi, Wen Zhang, Haomeng Zhang, Junwei Zhang, Yonghui Fan, Dhruman Goradia, Kewei Chen, Richard J. Caselli, Eric M. Reiman, Xianfeng Gu, Yalin Wang | 2020 | Neuroinformatics | vol 18 | no 4 | pages 531--548 | doi 10.1007/s12021-020-09459-7
OpenAlex: ratio 1.00: Computing Univariate Neurodegenerative Biomarkers with Volumetric Optimal Transportation: A Pilot Study | The Alzheimer<right single quotation mark>s Disease Neuroimaging Initiative, Yanshuai Tu, Liang Mi, Wen Zhang, Haomeng Zhang, Junwei Zhang, Yonghui Fan, Dhruman D. Goradia, Kewei Chen, Richard J. Caselli, Eric M. Reiman, Xianfeng David Gu, Yalin Wang | 2020 | Neuroinformatics | vol 18 | no 4 | pages 531--548 | doi 10.1007/s12021-020-09459-7 | OpenAlex W3014941342 | open access http://europepmc.org/pmc/articles/PMC7502473
Semantic Scholar: ratio 1.00: COMPUTING UNIVARIATE NEURODEGENERATIVE BIOMARKERS WITH VOLUMETRIC OPTIMAL TRANSPORTATION: A PILOT STUDY | Yanshuai Tu, Liang Mi, Wen Zhang, Haomeng Zhang, Junwei Zhang, Yonghui Fan, Dhruman D. Goradia, K. Chen, R. Caselli, E. Reiman, X. Gu, Y. Wang | 2020 | Neuroinformatics | vol 18 | pages 531--548 | doi 10.1007/s12021-020-09459-7 | Semantic Scholar ba70451d5b3a69045be33016323831945eb45658 | open access http://europepmc.org/pmc/articles/PMC7502473
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xiong2026integrating
Command: python3 lookup resolve '10.1007/s00415-026-13664-w'
```
Crossref: ratio 1.00: Integrating standard and native spaces for radiomics and brain network analysis in Alzheimer<right single quotation mark>s disease diagnosis and prognosis | Diaohan Xiong, Mengjiao Liu, Zefeng Liu, Junping Wang | 2026 | Journal of Neurology | vol 273 | no 2 | doi 10.1007/s00415-026-13664-w
OpenAlex: ratio 1.00: Integrating standard and native spaces for radiomics and brain network analysis in Alzheimer<right single quotation mark>s disease diagnosis and prognosis | Diaohan Xiong, Ming Liu, Zefeng Liu, Junping Wang | 2026 | Journal of Neurology | vol 273 | no 2 | pages 124--124 | doi 10.1007/s00415-026-13664-w | OpenAlex W7128396807
Semantic Scholar: ratio 1.00: Integrating standard and native spaces for radiomics and brain network analysis in Alzheimer<right single quotation mark>s disease diagnosis and prognosis | Diao-Han Xiong, Mengjia Liu, Ze-Feng Liu, Junping Wang | 2026 | Journal of Neurology | vol 273 | doi 10.1007/s00415-026-13664-w | Semantic Scholar 32f15ef221082a033f2bee46c74f029d1c43bce2
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### feragen2013geometric
Command: python3 lookup resolve '10.1007/978-3-642-38868-2_15'
```
Crossref: ratio 1.00: Geometric Tree Kernels: Classification of COPD from Airway Tree Geometry | Aasa Feragen, Jens Petersen, Dominik Grimm, Asger Dirksen, Jesper Holst Pedersen, Karsten Borgwardt, Marleen de Bruijne | 2013 | Lecture Notes in Computer Science | pages 171--183 | doi 10.1007/978-3-642-38868-2_15
OpenAlex: ratio 1.00: Geometric Tree Kernels: Classification of COPD from Airway Tree Geometry | Aasa Feragen, Jens Petersen, Dominik G. Grimm, Asger Dirksen, Jesper Holst Pedersen, Karsten Michael Borgwardt, Marleen de Bruijne | 2013 | Lecture notes in computer science | vol 23 | pages 171--183 | doi 10.1007/978-3-642-38868-2_15 | OpenAlex W2135074746 | open access https://researchprofiles.ku.dk/da/publications/87bcaaa1-4dc8-4079-8a7e-2b057507b632
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### awate2017kernel
Command: python3 lookup resolve '10.1007/978-3-319-59050-9_3'
```
Crossref: ratio 1.00: Kernel Methods for Riemannian Analysis of Robust Descriptors of the Cerebral Cortex | Suyash P. Awate, Richard M. Leahy, Anand A. Joshi | 2017 | Lecture Notes in Computer Science | pages 28--40 | doi 10.1007/978-3-319-59050-9_3
OpenAlex: ratio 1.00: Kernel Methods for Riemannian Analysis of Robust Descriptors of the Cerebral Cortex | Suyash P. Awate, Richard M. Leahy, Anand A. Joshi | 2017 | Lecture notes in computer science | vol 10265 | pages 28--40 | doi 10.1007/978-3-319-59050-9_3 | OpenAlex W2619477447 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC5794037/
Semantic Scholar: ratio 1.00: Kernel Methods for Riemannian Analysis of Robust Descriptors of the Cerebral Cortex | Suyash P. Awate, R. Leahy, Anand A. Joshi | 2017 | Information Processing in Medical Imaging | vol 10265 | pages 28--40 | doi 10.1007/978-3-319-59050-9_3 | Semantic Scholar 0d5730b6171843c526f3065a8265d86f469c3665 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC5794037/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### devilliers2017inconsistency
Command: python3 lookup resolve '10.1007/978-3-319-59050-9_2'
```
Crossref: ratio 1.00: Inconsistency of Template Estimation with the Fr<latin small letter e with acute>chet Mean in Quotient Space | Lo<latin small letter i with diaeresis>c Devilliers, Xavier Pennec, St<latin small letter e with acute>phanie Allassonni<latin small letter e with grave>re | 2017 | Lecture Notes in Computer Science | pages 16--27 | doi 10.1007/978-3-319-59050-9_2
OpenAlex: ratio 1.00: Inconsistency of Template Estimation with the Fr<latin small letter e with acute>chet Mean in Quotient Space | Lo<latin small letter i with diaeresis>c Devilliers, Xavier Pennec, St<latin small letter e with acute>phanie Allassonni<latin small letter e with grave>re | 2017 | Lecture notes in computer science | vol 10265 | pages 16--27 | doi 10.1007/978-3-319-59050-9_2 | OpenAlex W2592069770 | open access https://arxiv.org/pdf/1703.01232
Semantic Scholar: ratio 1.00: Inconsistency of Template Estimation with the Fr<latin small letter e with acute>chet Mean in Quotient Space | L. Devilliers, X. Pennec, S. Allassonni<latin small letter e with grave>re | 2017 | Information Processing in Medical Imaging | pages 16--27 | doi 10.1007/978-3-319-59050-9_2 | arXiv 1703.01232 | Semantic Scholar c61ca0ded806097c152f5e2694d46591e86dd395 | open access https://arxiv.org/pdf/1703.01232
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhang2021cortical
Command: python3 lookup resolve '10.1007/978-3-030-78191-0_13'
```
Crossref: ratio 1.00: Cortical Morphometry Analysis Based on Worst Transportation Theory | Min Zhang, Dongsheng An, Na Lei, Jianfeng Wu, Tong Zhao, Xiaoyin Xu, Yalin Wang, Xianfeng Gu | 2021 | Lecture Notes in Computer Science | pages 163--176 | doi 10.1007/978-3-030-78191-0_13
OpenAlex: ratio 1.00: Cortical Morphometry Analysis Based on Worst Transportation Theory | Min Zhang, Dongsheng An, Na Lei, Jianfeng Wu, <cyrillic capital letter te><cyrillic small letter o><cyrillic small letter en><cyrillic small letter ghe> <cyrillic capital letter zhe><cyrillic small letter a><cyrillic small letter o>, Xiaoyin Xu, Yalin Wang, Xianfeng David Gu | 2021 | Lecture notes in computer science | vol 12729 | pages 163--176 | doi 10.1007/978-3-030-78191-0_13 | OpenAlex W3176309875 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8291742/
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### farazi2023tetcnn
Command: python3 lookup resolve '10.1007/978-3-031-34048-2_24'
```
Crossref: ratio 1.00: TetCNN: Convolutional Neural Networks on Tetrahedral Meshes | Mohammad Farazi, Zhangsihao Yang, Wenhui Zhu, Peijie Qiu, Yalin Wang | 2023 | Lecture Notes in Computer Science | pages 303--315 | doi 10.1007/978-3-031-34048-2_24
OpenAlex: ratio 1.00: TetCNN: Convolutional Neural Networks on Tetrahedral Meshes | Mohammad Farazi, Zhangsihao Yang, Wenhui Zhu, Peijie Qiu, Yalin Wang | 2023 | Lecture notes in computer science | vol 13939 | pages 303--315 | doi 10.1007/978-3-031-34048-2_24 | OpenAlex W4379660269 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC10765307/pdf/nihms-1954948.pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2026enhancing
Command: python3 lookup resolve '10.1007/978-3-031-96625-5_5'
```
Crossref: ratio 1.00: Enhancing Alzheimer<right single quotation mark>s Diagnosis: Leveraging Anatomical Landmarks in Graph Convolutional Neural Networks on Tetrahedral Meshes | Yanxi Chen, Mohammad Farazi, Zhangsihao Yang, Yonghui Fan, Nicholas Ashton, Eric M. Reiman, Yi Su, Yalin Wang | 2025 | Lecture Notes in Computer Science | pages 65--78 | doi 10.1007/978-3-031-96625-5_5
OpenAlex: ratio 1.00: Enhancing Alzheimer<right single quotation mark>s Diagnosis: Leveraging Anatomical Landmarks in Graph Convolutional Neural Networks on Tetrahedral Meshes | Yanxi Chen, Mohammad Farazi, Zhangsihao Yang, Yonghui Fan, Nicholas James Ashton, Eric M. Reiman, Yi Su, Yalin Wang | 2025 | Lecture notes in computer science | vol 15830 | pages 65--78 | doi 10.1007/978-3-031-96625-5_5 | OpenAlex W4413003260 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC12965764/
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wang2018revisiting
Command: python3 lookup resolve '10.1016/j.patcog.2017.08.026'
```
Crossref: ratio 1.00: Revisiting multiple instance neural networks | Xinggang Wang, Yongluan Yan, Peng Tang, Xiang Bai, Wenyu Liu | 2018 | Pattern Recognition | vol 74 | pages 15--24 | doi 10.1016/j.patcog.2017.08.026
OpenAlex: ratio 1.00: Revisiting multiple instance neural networks | Xinggang Wang, Yongluan Yan, Peng Tang, Xiang Bai, Wenyu Liu | 2017 | Pattern Recognition | vol 74 | pages 15--24 | doi 10.1016/j.patcog.2017.08.026 | OpenAlex W2531897166 | open access https://arxiv.org/pdf/1610.02501
Semantic Scholar: ratio 1.00: Revisiting multiple instance neural networks | Xing-Gang Wang, Yongluan Yan, Peng Tang, Xiang Bai, Wen-Yu Liu | 2016 | Pattern Recognition | vol abs/1610.02501 | doi 10.1016/j.patcog.2017.08.026 | arXiv 1610.02501 | Semantic Scholar 0820ccfdba775c304bedb9c3d82ee8758e0a416b | open access https://arxiv.org/pdf/1610.02501
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### basu2014detecting
Command: python3 lookup resolve '10.1073/pnas.1319779111'
```
Crossref: ratio 1.00: Detecting and visualizing cell phenotype differences from microscopy images using transport-based morphometry | Saurav Basu, Soheil Kolouri, Gustavo K. Rohde | 2014 | Proceedings of the National Academy of Sciences | vol 111 | no 9 | pages 3448--3453 | doi 10.1073/pnas.1319779111
OpenAlex: ratio 1.00: Detecting and visualizing cell phenotype differences from microscopy images using transport-based morphometry | Saurav Basu, Soheil Kolouri, Gustavo Kunde Rohde | 2014 | Proceedings of the National Academy of Sciences | vol 111 | no 9 | pages 3448--3453 | doi 10.1073/pnas.1319779111 | OpenAlex W2114589114 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/3948221
Semantic Scholar: ratio 1.00: Detecting and visualizing cell phenotype differences from microscopy images using transport-based morphometry | Saurav Basu, Soheil Kolouri, G. Rohde | 2014 | Proceedings of the National Academy of Sciences of the United States of America | vol 111 | pages 3448--3453 | doi 10.1073/pnas.1319779111 | Semantic Scholar e420c2863ad46f7ce5923955957cad13439401a8 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/3948221
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kusner2015word
No DOI and no arXiv ID; url: https://proceedings.mlr.press/v37/kusnerb15.html. Checked by WebFetch of the url (recorded below by the session).

### muandet2012learning
Command: python3 lookup resolve '1202.6504'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning from Distributions via Support Measure Machines | Krikamol Muandet, Kenji Fukumizu, Francesco Dinuzzo, Bernhard Sch<latin small letter o with diaeresis>lkopf | 2012 | arXiv (Cornell University) | vol 25 | pages 10--18 | doi 10.48550/arxiv.1202.6504 | arXiv 1202.6504 | OpenAlex W2136440798 | open access https://arxiv.org/pdf/1202.6504
Semantic Scholar: ratio 1.00: Learning from Distributions via Support Measure Machines | Krikamol Muandet, K. Fukumizu, Francesco Dinuzzo, B. Sch<latin small letter o with diaeresis>lkopf | 2012 | Neural Information Processing Systems | pages 10--18 | doi 10.48550/arXiv.1202.6504 | arXiv 1202.6504 | Semantic Scholar 9239696d0dc5b029e0946e4b84a1515cb31d2e6b | open access http://arxiv.org/pdf/1202.6504
arXiv: ratio 1.00: Learning from Distributions via Support Measure Machines | Krikamol Muandet, Kenji Fukumizu, Francesco Dinuzzo, Bernhard Sch<latin small letter o with diaeresis>lkopf | 2012 | arXiv 1202.6504
```
Exit status: 0

### welch2019vulnerabilities
Command: python3 lookup resolve '10.1016/j.radonc.2018.10.027'
```
Crossref: ratio 1.00: Vulnerabilities of radiomic signature development: The need for safeguards | Mattea L. Welch, Chris McIntosh, Benjamin Haibe-Kains, Michael F. Milosevic, Leonard Wee, Andre Dekker, Shao Hui Huang, Thomas G. Purdie, Brian O'Sullivan, Hugo J.W.L. Aerts, David A. Jaffray | 2019 | Radiotherapy and Oncology | vol 130 | pages 2--9 | doi 10.1016/j.radonc.2018.10.027
OpenAlex: ratio 1.00: Vulnerabilities of radiomic signature development: The need for safeguards | Mattea L. Welch, Chris McIntosh, Benjamin Haibe<hyphen>Kains, Michael Milosevic, Leonard Wee, Andre L.A.J. Dekker, Shao Hui Huang, Thomas G. Purdie, Brian O<right single quotation mark>Sullivan, Hugo J.W.L. Aerts, David Anthony Jaffray | 2018 | Radiotherapy and Oncology | vol 130 | pages 2--9 | doi 10.1016/j.radonc.2018.10.027 | OpenAlex W2899847761 | open access https://doi.org/10.1016/j.radonc.2018.10.027
Semantic Scholar: ratio 1.00: Vulnerabilities of radiomic signature development: The need for safeguards. | M. Welch, C. Mcintosh, Benjamin Haibe-Kains, M. Milosevic, L. Wee, A. Dekker, Shao H. Huang, T. Purdie, B. O'Sullivan, H. Aerts, D. Jaffray | 2019 | Radiotherapy and Oncology | vol 130 | pages 2--9 | doi 10.1016/j.radonc.2018.10.027 | Semantic Scholar 3f7af0209e67980368294397b65358ae355b99bd | open access https://doi.org/10.1016/j.radonc.2018.10.027
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### rohlfing2012image
Command: python3 lookup resolve '10.1109/tmi.2011.2163944'
```
Crossref: ratio 1.00: Image Similarity and Tissue Overlaps as Surrogates for Image Registration Accuracy: Widely Used but Unreliable | T. Rohlfing | 2012 | IEEE Transactions on Medical Imaging | vol 31 | no 2 | pages 153--163 | doi 10.1109/tmi.2011.2163944
OpenAlex: ratio 1.00: Image Similarity and Tissue Overlaps as Surrogates for Image Registration Accuracy: Widely Used but Unreliable | Torsten Rohlfing | 2011 | IEEE Transactions on Medical Imaging | vol 31 | no 2 | pages 153--163 | doi 10.1109/tmi.2011.2163944 | OpenAlex W2054902886 | open access http://europepmc.org/articles/PMC3274625
Semantic Scholar: ratio 1.00: Image Similarity and Tissue Overlaps as Surrogates for Image Registration Accuracy: Widely Used but Unreliable | T. Rohlfing | 2011 | IEEE Transactions on Medical Imaging | vol 31 | pages 153--163 | doi 10.1109/TMI.2011.2163944 | Semantic Scholar 9e503d524a8eaa0d60e698ee0f974a6dac8fbe4a | open access http://europepmc.org/articles/PMC3274625
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhang2020fspool
Command: python3 lookup resolve '1906.02795'
```
Crossref: not found
OpenAlex: ratio 1.00: FSPool: Learning Set Representations with Featurewise Sort Pooling | Yan Zhang, Jonathon S. Hare, Adam Pr<latin small letter u with diaeresis>gel<hyphen>Bennett | 2019 | arXiv (Cornell University) | doi 10.48550/arxiv.1906.02795 | arXiv 1906.02795 | OpenAlex W2994687091 | open access https://arxiv.org/pdf/1906.02795
Semantic Scholar: ratio 1.00: FSPool: Learning Set Representations with Featurewise Sort Pooling | Yan Zhang, Jonathon S. Hare, A. Pr<latin small letter u with diaeresis>gel-Bennett | 2019 | International Conference on Learning Representations | vol abs/1906.02795 | doi 10.48550/arXiv.1906.02795 | arXiv 1906.02795 | Semantic Scholar 07d01345dd30f1400e41d5124ff74e2b0d655040
arXiv: ratio 1.00: FSPool: Learning Set Representations with Featurewise Sort Pooling | Yan Zhang, Jonathon Hare, Adam Pr<latin small letter u with diaeresis>gel-Bennett | 2019 | arXiv 1906.02795
```
Exit status: 0

### suinesiaputra2018statistical
Command: python3 lookup resolve '10.1109/jbhi.2017.2652449'
```
Crossref: ratio 1.00: Statistical Shape Modeling of the Left Ventricle: Myocardial Infarct Classification Challenge | Avan Suinesiaputra, Jan Dhooge, Nicolas Duchateau, Jan Ehrhardt, Alejandro F. Frangi, Ali Gooya, Vicente Grau, Karim Lekadir, Allen Lu, Anirban Mukhopadhyay, Ilkay Oksuz, Pierre Ablin, Nripesh Parajuli, Xavier Pennec, Marco Pereanez, Catarina Pinto, Paolo Piras, Marc-Michel Rohe, Daniel Rueckert, Dennis Saring, Maxime Sermesant, Kaleem Siddiqi, Xenia Alba, Mahdi Tabassian, Luciano Teresi, Sotirios A. Tsaftaris, Matthias Wilms, Alistair A. Young, Xingyu Zhang, Pau Medrano-Gracia, Martino Alessandrini, Jack Allen, Wenjia Bai, Serkan Cimen, Peter Claes, Brett R. Cowan | 2018 | IEEE Journal of Biomedical and Health Informatics | vol 22 | no 2 | pages 503--515 | doi 10.1109/jbhi.2017.2652449
OpenAlex: ratio 1.00: Statistical Shape Modeling of the Left Ventricle: Myocardial Infarct Classification Challenge | Avan Suinesiaputra, Jan D<right single quotation mark>hooge, Nicol<latin small letter a with acute>s Duchateau, Jan Ehrhardt, Alejandro Federico Frangi, Ali Gooya, Vicente Grau, Karim Lekadir, Allen Lu, Anirban Mukhopadhyay, <latin capital letter i with dot above>lkay <latin capital letter o with diaeresis>ks<latin small letter u with diaeresis>z, Pierre Ablin, Nripesh Parajuli, Xavier Pennec, Marco Perea<latin small letter n with tilde>ez, Catarina Pinto, Paolo Piras, Marc-Michel Roh<latin small letter e with acute>, Daniel Rueckert, Dennis S<latin small letter a with diaeresis>ring, Maxime Sermesant, Kaleem Siddiqi, X<latin small letter e with grave>nia Alb<latin small letter a with grave>, Mahdi Tabassian, Luciano Teresi, Sotirios A. Tsaftaris, Matthias Wilms, Alistair A. Young, Xing-Yu Zhang, Pau Medrano<minus sign>Gracia, Martino Alessandrini, Jack Allen, Wenjia Bai, Serkan <latin capital letter c with cedilla>imen, Peter D. Claes, Brett R. Cowan | 2017 | IEEE Journal of Biomedical and Health Informatics | vol 22 | no 2 | pages 503--515 | doi 10.1109/jbhi.2017.2652449 | OpenAlex W2575820504 | open access https://hdl.handle.net/20.500.11820/bd4a7509-a028-408a-bb0f-b3adc7d089c5
Semantic Scholar: ratio 1.00: Statistical shape modeling of the left ventricle: myocardial infarct classification challenge | Avan Suinesiaputra, Pierre Ablin, X<latin small letter e with grave>nia Alb<latin small letter a with grave>, M. Alessandrini, Jack Allen, Wenjia Bai, Serkan <latin capital letter c with cedilla>imen, P. Claes, B. Cowan, J. Dhooge, N. Duchateau, J. Ehrhardt, Alejandro F Frangi, A. Gooya, V. Grau, K. Lekadir, A. Lu, A. Mukhopadhyay, I. <latin capital letter o with diaeresis>ks<latin small letter u with diaeresis>z, N. Parajuli, X. Pennec, Marco Perea<latin small letter n with tilde>ez, C. Pinto, P. Piras, Marc-Michel Roh<latin small letter e with acute>, D. Rueckert, D. S<latin small letter a with diaeresis>ring, Maxime Sermesant, Kaleem Siddiqi, Mahdi Tabassian, L. Teresi, S. Tsaftaris, M. Wilms, A. Young, Xingyu Zhang, P. Medrano-Gracia | 2017 | IEEE journal of biomedical and health informatics | vol 22 | pages 503--515 | doi 10.1109/JBHI.2017.2652449 | Semantic Scholar dca119f54619e36f56a4f2c0b3ec42cd5c5f0eeb | open access https://hdl.handle.net/20.500.11820/bd4a7509-a028-408a-bb0f-b3adc7d089c5
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2020optimal
Command: python3 lookup resolve '2006.04804'
```
Crossref: not found
OpenAlex: ratio 1.00: Optimal Transport Graph Neural Networks | Benson Chen, Gary B<latin small letter e with acute>cigneul, Octavian-Eugen Ganea, Regina Barzilay, Tommi Jaakkola | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.04804 | arXiv 2006.04804 | OpenAlex W3034902920 | open access https://arxiv.org/pdf/2006.04804
Semantic Scholar: ratio 1.00: Optimal Transport Graph Neural Networks | Gary B<latin small letter e with acute>cigneul, O. Ganea, Benson Chen, R. Barzilay, T. Jaakkola | 2020 | arXiv.org | vol abs/2006.04804 | doi 10.48550/arXiv.2006.04804 | arXiv 2006.04804 | Semantic Scholar b1855cdc5a18d99107843d5884048f804c8f2585
arXiv: ratio 1.00: Optimal Transport Graph Neural Networks | Benson Chen, Gary B<latin small letter e with acute>cigneul, Octavian-Eugen Ganea, Regina Barzilay, Tommi Jaakkola | 2020 | arXiv 2006.04804
```
Exit status: 0

### kolouri2016sliced
Command: python3 lookup resolve '10.1109/cvpr.2016.568'
```
Crossref: ratio 1.00: Sliced Wasserstein Kernels for Probability Distributions | Soheil Kolouri, Yang Zou, Gustavo K. Rohde | 2016 | 2016 IEEE Conference on Computer Vision and Pattern Recognition (CVPR) | pages 5258--5267 | doi 10.1109/cvpr.2016.568
OpenAlex: ratio 1.00: Sliced Wasserstein Kernels for Probability Distributions | Soheil Kolouri, Yang Zou, Gustavo Kunde Rohde | 2016 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | pages 5258--5267 | doi 10.1109/cvpr.2016.568 | OpenAlex W2226906430 | open access https://arxiv.org/pdf/1511.03198
Semantic Scholar: ratio 1.00: Sliced Wasserstein Kernels for Probability Distributions | Soheil Kolouri, Yang Zou, G. Rohde | 2015 | Computer Vision and Pattern Recognition | pages 5258--5267 | doi 10.1109/CVPR.2016.568 | arXiv 1511.03198 | Semantic Scholar bb12329fb5beaed74fa6c9c201ee2c8b7ba3c885 | open access https://arxiv.org/pdf/1511.03198
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bruggner2014automated
Command: python3 lookup resolve '10.1073/pnas.1408792111'
```
Crossref: ratio 1.00: Automated identification of stratifying signatures in cellular subpopulations | Robert V. Bruggner, Bernd Bodenmiller, David L. Dill, Robert J. Tibshirani, Garry P. Nolan | 2014 | Proceedings of the National Academy of Sciences | vol 111 | no 26 | doi 10.1073/pnas.1408792111
OpenAlex: ratio 1.00: Automated identification of stratifying signatures in cellular subpopulations | Robert V. Bruggner, Bernd Bodenmiller, David L. Dill, Robert John Tibshirani, Garry P. Nolan | 2014 | Proceedings of the National Academy of Sciences | vol 111 | no 26 | pages E2770--E2777 | doi 10.1073/pnas.1408792111 | OpenAlex W2143451223 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC4084463/
Semantic Scholar: ratio 1.00: Automated identification of stratifying signatures in cellular subpopulations | R. Bruggner, B. Bodenmiller, D. Dill, R. Tibshirani, G. Nolan | 2014 | Proceedings of the National Academy of Sciences of the United States of America | vol 111 | pages E2770--E2777 | doi 10.1073/pnas.1408792111 | Semantic Scholar 815807099a01003640f2b8ce67d36e8b3fea07b5 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC4084463/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### costafreda2011automated
Command: python3 lookup resolve '10.1016/j.neuroimage.2011.01.050'
```
Crossref: ratio 1.00: Automated hippocampal shape analysis predicts the onset of dementia in mild cognitive impairment | Sergi G. Costafreda, Ivo D. Dinov, Zhuowen Tu, Yonggang Shi, Cheng-Yi Liu, Iwona Kloszewska, Patrizia Mecocci, Hilkka Soininen, Magda Tsolaki, Bruno Vellas, Lars-Olof Wahlund, Christian Spenger, Arthur W. Toga, Simon Lovestone, Andrew Simmons | 2011 | NeuroImage | vol 56 | no 1 | pages 212--219 | doi 10.1016/j.neuroimage.2011.01.050
OpenAlex: ratio 1.00: Automated hippocampal shape analysis predicts the onset of dementia in mild cognitive impairment | Sergi G. Costafreda, Ivo D. Dinov, Zhuowen Tu, Yonggang Shi, Cheng-Yi Liu, Iwona K<latin small letter l with stroke>oszewska, Patrizia Mecocci, Hilkka S. Soininen, Magda Tsolaki, Bruno J. Vellas, Lars<hyphen>Olof Wahlund, Christian Spenger, Arthur W. Toga, Simon Lovestone, Andrew Simmons | 2011 | NeuroImage | vol 56 | no 1 | pages 212--219 | doi 10.1016/j.neuroimage.2011.01.050 | OpenAlex W2154758450 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/3066277
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cuingnet2011automatic
Command: python3 lookup resolve '10.1016/j.neuroimage.2010.06.013'
```
Crossref: ratio 1.00: Automatic classification of patients with Alzheimer's disease from structural MRI: A comparison of ten methods using the ADNI database | R<latin small letter e with acute>mi Cuingnet, Emilie Gerardin, J<latin small letter e with acute>r<latin small letter o with circumflex>me Tessieras, Guillaume Auzias, St<latin small letter e with acute>phane Leh<latin small letter e with acute>ricy, Marie-Odile Habert, Marie Chupin, Habib Benali, Olivier Colliot | 2011 | NeuroImage | vol 56 | no 2 | pages 766--781 | doi 10.1016/j.neuroimage.2010.06.013
OpenAlex: ratio 1.00: Automatic classification of patients with Alzheimer's disease from structural MRI: A comparison of ten methods using the ADNI database | R<latin small letter e with acute>mi Cuingnet, Emilie G<latin small letter e with acute>rardin, J<latin small letter e with acute>r<latin small letter o with circumflex>me Tessieras, Guillaume Auzias, St<latin small letter e with acute>phane Leh<latin small letter e with acute>ricy, Marie<hyphen>Odile Habert, Marie Chupin, Habib Benali, Olivier Colliot | 2010 | NeuroImage | vol 56 | no 2 | pages 766--781 | doi 10.1016/j.neuroimage.2010.06.013 | OpenAlex W2153171432 | open access https://inria.hal.science/hal-00795739
Semantic Scholar: ratio 1.00: Automatic classification of patients with Alzheimer's disease from structural MRI: A comparison of ten methods using the ADNI database | R<latin small letter e with acute>mi Cuingnet, <latin capital letter e with acute>milie Gerardin, J<latin small letter e with acute>r<latin small letter o with circumflex>me Tessieras, G. Auzias, S. Leh<latin small letter e with acute>ricy, M. Habert, M. Chupin, H. Benali, O. Colliot | 2011 | NeuroImage | vol 56 2 | pages 766--81 | doi 10.1016/j.neuroimage.2010.06.013 | Semantic Scholar 4d2f54dfe3d5be7b1a9330389e490ee4219018ed | open access https://inria.hal.science/hal-00795739
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chang2020automatic
Command: python3 lookup resolve '10.1016/j.neucom.2020.08.030'
```
Crossref: ratio 1.00: Automatic cardiac MRI segmentation and permutation-invariant pathology classification using deep neural networks and point clouds | Yakun Chang, Cheolkon Jung | 2020 | Neurocomputing | vol 418 | pages 270--279 | doi 10.1016/j.neucom.2020.08.030
OpenAlex: ratio 1.00: Automatic cardiac MRI segmentation and permutation-invariant pathology classification using deep neural networks and point clouds | Yakun Chang, Cheolkon Jung | 2020 | Neurocomputing | vol 418 | pages 270--279 | doi 10.1016/j.neucom.2020.08.030 | OpenAlex W3082127558
Semantic Scholar: ratio 1.00: Automatic cardiac MRI segmentation and permutation-invariant pathology classification using deep neural networks and point clouds | Yakun Chang, C. Jung | 2020 | Neurocomputing | vol 418 | pages 270--279 | doi 10.1016/j.neucom.2020.08.030 | Semantic Scholar 8b31278fb1307c2a895d825dc793bd48edba8c28
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### song2024morphological
Command: python3 lookup resolve '10.1109/cvpr52733.2024.01099'
```
Crossref: ratio 1.00: Morphological Prototyping for Unsupervised Slide Representation Learning in Computational Pathology | Andrew H. Song, Richard J. Chen, Tong Ding, Drew F.K. Williamson, Guillaume Jaume, Faisal Mahmood | 2024 | 2024 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR) | pages 11566--11578 | doi 10.1109/cvpr52733.2024.01099
OpenAlex: ratio 1.00: Morphological Prototyping for Unsupervised Slide Representation Learning in Computational Pathology | Andrew H. Song, Richard J. Chen, Tong Ding, Drew F. K. Williamson, Guillaume Jaume, Faisal Mahmood | 2024 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | pages 11566--11578 | doi 10.1109/cvpr52733.2024.01099 | OpenAlex W4402733589 | open access https://arxiv.org/pdf/2405.11643
Semantic Scholar: ratio 1.00: Morphological Prototyping for Unsupervised Slide Representation Learning in Computational Pathology | Andrew H. Song, Richard J. Chen, Tong Ding, Drew F. K. Williamson, G. Jaume, F. Mahmood | 2024 | Computer Vision and Pattern Recognition | pages 11566--11578 | doi 10.1109/CVPR52733.2024.01099 | arXiv 2405.11643 | Semantic Scholar ba43b5d0df763e5b4f28425a77def6b8e8e2567a | open access https://arxiv.org/pdf/2405.11643
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### naderializadeh2024aggregating
Command: python3 lookup resolve '10.1093/bioadv/vbaf060'
```
Crossref: ratio 1.00: Aggregating residue-level protein language model embeddings with optimal transport | Navid NaderiAlizadeh, Rohit Singh | 2024 | Bioinformatics Advances | vol 5 | no 1 | doi 10.1093/bioadv/vbaf060
OpenAlex: ratio 1.00: Aggregating residue-level protein language model embeddings with optimal transport | Navid Naderializadeh, Rohit Singh | 2024 | Bioinformatics Advances | vol 5 | no 1 | pages vbaf060--vbaf060 | doi 10.1093/bioadv/vbaf060 | OpenAlex W4408717486 | open access https://doi.org/10.1093/bioadv/vbaf060
Semantic Scholar: ratio 1.00: Aggregating residue-level protein language model embeddings with optimal transport | Navid Naderializadeh, Rohit Singh | 2024 | bioRxiv | vol 5 | doi 10.1093/bioadv/vbaf060 | Semantic Scholar 0c580c0146688ef0d20aff9bc00c77bfd2ab1d0d | open access https://doi.org/10.1093/bioadv/vbaf060
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### qian2024reimagining
Command: python3 lookup resolve '10.1145/3637528.3671696'
```
Crossref: ratio 1.00: Reimagining Graph Classification from a Prototype View with Optimal Transport: Algorithm and Theorem | Chen Qian, Huayi Tang, Hong Liang, Yong Liu | 2024 | Proceedings of the 30th ACM SIGKDD Conference on Knowledge Discovery and Data Mining | pages 2444--2454 | doi 10.1145/3637528.3671696
OpenAlex: ratio 1.00: Reimagining Graph Classification from a Prototype View with Optimal Transport: Algorithm and Theorem | Chen Qian, Huayi Tang, Hong Liang, Yong Liu | 2024 | ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD) | pages 2444--2454 | doi 10.1145/3637528.3671696 | OpenAlex W4401863353 | open access https://dl.acm.org/doi/pdf/10.1145/3637528.3671696
Semantic Scholar: ratio 1.00: Reimagining Graph Classification from a Prototype View with Optimal Transport: Algorithm and Theorem | Chen Qian, Huayi Tang, Hongsi Liang, Yong Liu | 2024 | Knowledge Discovery and Data Mining | doi 10.1145/3637528.3671696 | Semantic Scholar 462fcce248422d4c67b4408ef2ae34f5c360dc4e | open access https://dl.acm.org/doi/pdf/10.1145/3637528.3671696
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kachaiev2024learning
Command: python3 lookup resolve '10.52202/079017-1420'
```
Crossref: ratio 1.00: Learning to Embed Distributions via Maximum Kernel Entropy | Oleksii Kachaiev, Stefano Recanatesi | 2024 | Advances in Neural Information Processing Systems 37 | pages 44710--44734 | doi 10.52202/079017-1420
OpenAlex: ratio 1.00: Learning to Embed Distributions via Maximum Kernel Entropy | Oleksii Kachaiev, Stefano Recanatesi | 2024 | neural information processing systems | pages 44710--44734 | doi 10.52202/079017-1420 | OpenAlex W4415797707 | open access https://arxiv.org/pdf/2408.00549
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ding2026application
Command: python3 lookup resolve '10.1038/s41598-025-32093-9'
```
Crossref: ratio 1.00: Application and characterization of the multiple instance learning framework in flow cytometry | Zhiyuan Ding, Alexander Baras | 2026 | Scientific Reports | vol 16 | no 1 | doi 10.1038/s41598-025-32093-9
OpenAlex: ratio 1.00: Application and characterization of the multiple instance learning framework in flow cytometry | Zhiyuan Ding, Alexander Spyridon Baras | 2026 | Scientific Reports | vol 16 | no 1 | pages 2380--2380 | doi 10.1038/s41598-025-32093-9 | OpenAlex W7123341370 | open access https://www.nature.com/articles/s41598-025-32093-9_reference.pdf
Semantic Scholar: ratio 1.00: Application and characterization of the multiple instance learning framework in flow cytometry | Zhi-Yuan Ding, A. Baras | 2025 | bioRxiv | vol 16 | doi 10.1038/s41598-025-32093-9 | Semantic Scholar b93a8944980e56f42ba804a4bcd49a7e1ca5d570 | open access https://www.nature.com/articles/s41598-025-32093-9_reference.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gachon2026scalable
Command: python3 lookup resolve '2502.04907'
```
Crossref: not found
OpenAlex: ratio 1.00: Scalable Learning from Probability Measures with Mean Measure Quantization | Erell Gachon, Elsa Cazelles, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot | 2025 | Transactions on machine learning research | doi 10.48550/arxiv.2502.04907 | arXiv 2502.04907 | OpenAlex W4407310041 | open access https://openreview.net/forum?id=eA4cQkY7Ug
Semantic Scholar: ratio 1.00: Scalable Learning from Probability Measures with Mean Measure Quantization | E. Gachon, Elsa Cazelles, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot | 2025 | Trans. Mach. Learn. Res. | vol 2026 | arXiv 2502.04907 | Semantic Scholar 71a4510715ee81fa63630aa1d78488f2a4023560
arXiv: ratio 1.00: Scalable Learning from Probability Measures with Mean Measure Quantization | Erell Gachon, Elsa Cazelles, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot | 2025 | arXiv 2502.04907
```
Exit status: 0

### nikolentzos2025lipschitz
Command: python3 lookup resolve '2505.24403'
```
Crossref: not found
OpenAlex: ratio 1.00: On the Lipschitz Continuity of Set Aggregation Functions and Neural Networks for Sets | Giannis Nikolentzos, Konstantinos Skianis | 2025 | International Conference on Learning Representations | doi 10.48550/arxiv.2505.24403 | arXiv 2505.24403 | OpenAlex W4414857215 | open access https://proceedings.iclr.cc/paper_files/paper/2026/hash/d9336f158d53f42537f25ab57db7aa06-Abstract-Conference.html
Semantic Scholar: ratio 1.00: On the Lipschitz Continuity of Set Aggregation Functions and Neural Networks for Sets | Giannis Nikolentzos, Konstantinos Skianis | 2025 | International Conference on Learning Representations | vol abs/2505.24403 | doi 10.48550/arXiv.2505.24403 | arXiv 2505.24403 | Semantic Scholar b52adae4ed46bea231f4c7a582b9697ae4f9eabb
arXiv: ratio 1.00: On the Lipschitz Continuity of Set Aggregation Functions and Neural Networks for Sets | Giannis Nikolentzos, Konstantinos Skianis | 2025 | arXiv 2505.24403
```
Exit status: 0

### naderializadeh2025constrained
Command: python3 lookup resolve '2506.02203'
```
Crossref: not found
OpenAlex: ratio 1.00: Constrained Sliced Wasserstein Embedding | Navid Naderializadeh, Darian Salehi, Xinran Liu, Soheil Kolouri | 2025 | arXiv (Cornell University) | doi 10.48550/arxiv.2506.02203 | arXiv 2506.02203 | OpenAlex W4415130775 | open access https://arxiv.org/pdf/2506.02203
Semantic Scholar: ratio 1.00: Constrained Sliced Wasserstein Embedding | Navid Naderializadeh, Darian Salehi, Xin-Ran Liu, Soheil Kolouri | 2025 | arXiv.org | vol abs/2506.02203 | doi 10.48550/arXiv.2506.02203 | arXiv 2506.02203 | Semantic Scholar 9332873da91f9c7dc9462a0eeb4d7a5b0b5981b1
arXiv: ratio 1.00: Constrained Sliced Wasserstein Embedding | Navid NaderiAlizadeh, Darian Salehi, Xinran Liu, Soheil Kolouri | 2025 | arXiv 2506.02203
```
Exit status: 0

### yang2024histopathology
Command: python3 lookup resolve '2412.16715'
```
Crossref: not found
OpenAlex: ratio 1.00: From Histopathology Images to Cell Clouds: Learning Slide Representations with Hierarchical Cell Transformer | Zijiang Yang, Zhongwei Qiu, Tiancheng Lin, Hanqing Chao, Wanxing Chang, Yelin Yang, Yunshuo Zhang, Wenpei Jiao, Yixuan Shen, Wenbin Liu, Dongmei Fu, Dakai Jin, Ke Yan, Le L<latin small letter u with diaeresis>, Hui Jiang, Yun Bian | 2024 | arXiv (Cornell University) | doi 10.48550/arxiv.2412.16715 | arXiv 2412.16715 | OpenAlex W4405766380 | open access https://arxiv.org/pdf/2412.16715
Semantic Scholar: ratio 1.00: From Histopathology Images to Cell Clouds: Learning Slide Representations with Hierarchical Cell Transformer | Zi-Jiang Yang, Zhong-Wei Qiu, Tian-Cheng Lin, Hanqing Chao, Wan-Xing Chang, Ye-Lin Yang, Yun-Shuo Zhang, Wenpei Jiao, Yi-Xuan Shen, Wen-Bin Liu, Dong-yang Fu, Da-Kai Jin, Ke Yan, Le Lu, Hui Jiang, Yun Bian | 2024 | arXiv.org | vol abs/2412.16715 | doi 10.48550/arXiv.2412.16715 | arXiv 2412.16715 | Semantic Scholar 1a62bd089d6a7cef39e1187a4ab8fffdec96a3e6
arXiv: ratio 1.00: From Histopathology Images to Cell Clouds: Learning Slide Representations with Hierarchical Cell Transformer | Zijiang Yang, Zhongwei Qiu, Tiancheng Lin, Hanqing Chao, Wanxing Chang, Yelin Yang, Yunshuo Zhang, Wenpei Jiao, Yixuan Shen, Wenbin Liu, Dongmei Fu, Dakai Jin, Ke Yan, Le Lu, Hui Jiang, Yun Bian | 2024 | arXiv 2412.16715
```
Exit status: 0

### kan20263d
Command: python3 lookup resolve '2602.07260'
```
Crossref: not found
OpenAlex: ratio 1.00: 3D Transport-based Morphometry (3D-TBM) for medical image analysis | Hongyu Kan, Kristofor E. Pas, Iv<latin small letter a with acute>n Medri, Naqib Sad Pathan, Natasha T. Ironside, Shinjini Kundu, Jingjia He, Gustavo Kunde Rohde | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2602.07260 | arXiv 2602.07260 | OpenAlex W7128494666 | open access https://arxiv.org/pdf/2602.07260
Semantic Scholar: ratio 1.00: 3D Transport-based Morphometry (3D-TBM) for medical image analysis | Hong-Yu Kan, Kristofor E. Pas, I. Medri, Naqib Sad Pathan, N. Ironside, Shinjini Kundu, Jing He, G. Rohde | 2026 | arXiv.org | vol abs/2602.07260 | doi 10.48550/arXiv.2602.07260 | arXiv 2602.07260 | Semantic Scholar 45a213fbac447ec477e960da6d0700d554bf35e0
arXiv: ratio 1.00: 3D Transport-based Morphometry (3D-TBM) for medical image analysis | Hongyu Kan, Kristofor Pas, Ivan Medri, Naqib Sad Pathan, Natasha Ironside, Shinjini Kundu, Jingjia He, Gustavo Kunde Rohde | 2026 | arXiv 2602.07260
```
Exit status: 0

### bai2025linear
Command: python3 lookup resolve '2410.16669'
```
Crossref: not found
OpenAlex: ratio 1.00: Linear Partial Gromov-Wasserstein Embedding | Yikun Bai, Abihith Kothapalli, Hengrong Du, Roc<latin small letter i with acute>o D<latin small letter i with acute>az Mart<latin small letter i with acute>n, Soheil Kolouri | 2024 | International Conference on Learning Representations | doi 10.48550/arxiv.2410.16669 | arXiv 2410.16669 | OpenAlex W4404350002 | open access https://proceedings.iclr.cc/paper_files/paper/2025/hash/064ae24cdbb3eaacc801ee7f4fe0e4f2-Abstract-Conference.html
Semantic Scholar: ratio 1.00: Linear Partial Gromov-Wasserstein Embedding | Yi-Kun Bai, Abihith Kothapalli, Heng-Rong Du, R. D<latin small letter i with acute>az Mart<latin small letter i with acute>n, Soheil Kolouri | 2024 | International Conference on Learning Representations | vol abs/2410.16669 | doi 10.48550/arXiv.2410.16669 | arXiv 2410.16669 | Semantic Scholar 35b52d2d94cacbb3760ae5736bad5b7bf04365f8
arXiv: ratio 1.00: Linear Partial Gromov-Wasserstein Embedding | Yikun Bai, Abihith Kothapalli, Hengrong Du, Rocio Diaz Martin, Soheil Kolouri | 2024 | arXiv 2410.16669
```
Exit status: 0

### wang2026segmentation
Command: python3 lookup resolve '10.1002/pro6.70056'
```
Crossref: ratio 1.00: Segmentation influence on the generalizability of the overall survival models in CT<hyphen>based oropharyngeal carcinoma patients | Yongqiang Wang, Xuhua Xiao, Jiang Zhang, Xinzhi Teng, Bing Li, Kangdong Liu, Jing Cai, Hong Ge | 2026 | Precision Radiation Oncology | vol 10 | no 1 | pages 7--18 | doi 10.1002/pro6.70056
OpenAlex: ratio 1.00: Segmentation influence on the generalizability of the overall survival models in CT<hyphen>based oropharyngeal carcinoma patients | Yongqiang Wang, Xuhua Xiao, Jiang Zhang, Xinzhi Teng, Bing Li, Kangdong Liu, Jing Cai, Hong Ge | 2026 | Precision Radiation Oncology | vol 10 | no 1 | pages 7--18 | doi 10.1002/pro6.70056 | OpenAlex W7139927511 | open access https://doi.org/10.1002/pro6.70056
Semantic Scholar: ratio 1.00: Segmentation influence on the generalizability of the overall survival models in CT<hyphen>based oropharyngeal carcinoma patients | Yong-Qiang Wang, Xu-Hua Xiao, Jiang Zhang, X. Teng, Bing Li, Kang-Dong Liu, Jing Cai, Hong Ge | 2026 | Precision Radiation Oncology | vol 10 | pages 7--18 | doi 10.1002/pro6.70056 | Semantic Scholar babb4712e48e12560c529f0eed0ac5847bd445b2 | open access https://doi.org/10.1002/pro6.70056
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### sineglazov2026impact
Command: python3 lookup resolve '10.18372/1990-5548.88.20980'
```
Crossref: ratio 1.00: Impact of Automated Segmentation on Radiomics-based Growth Prediction of Vestibular Schwannoma | Victor Sineglazov, Maksym Shevchenko | 2026 | Electronics and Control Systems | vol 2 | no 88 | pages 156--163 | doi 10.18372/1990-5548.88.20980
OpenAlex: ratio 1.00: Impact of Automated Segmentation on Radiomics-based Growth Prediction of Vestibular Schwannoma | Victor M. Sineglazov, Maksym Shevchenko | 2026 | Electronics and Control Systems | vol 2 | no 88 | pages 156--163 | doi 10.18372/1990-5548.88.20980 | OpenAlex W7155208374 | open access http://jrnl.kai.edu.ua/index.php/ESU/article/download/20980/28003
Semantic Scholar: ratio 1.00: Impact of Automated Segmentation on Radiomics-based Growth Prediction of Vestibular Schwannoma | V. Sineglazov, M. Shevchenko | 2026 | Electronics and Control Systems | doi 10.18372/1990-5548.88.20980 | Semantic Scholar 488fe391829804711c779cc02a13c861c2e26bbb | open access http://jrnl.kai.edu.ua/index.php/ESU/article/download/20980/28003
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2026distributionally
Command: python3 lookup resolve '2605.30089'
```
Crossref: not found
OpenAlex: ratio 1.00: Distributionally Robust Set Representation Learning Under Inference-Time Element Corruption | Yankai Chen, Hanrong Zhang, Bowei He, Philip S. Yu, Xue Liu | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2605.30089 | arXiv 2605.30089 | OpenAlex W7162788245 | open access https://arxiv.org/pdf/2605.30089
Semantic Scholar: ratio 1.00: Distributionally Robust Set Representation Learning Under Inference-Time Element Corruption | Yan-Kai Chen, Han-Rong Zhang, Bo-Wei He, Philip S. Yu, Xue Liu | 2026 | arXiv.org | vol abs/2605.30089 | doi 10.48550/arXiv.2605.30089 | arXiv 2605.30089 | Semantic Scholar 73a9aaba9b254af64ec2994d503cac21248e8d85
arXiv: ratio 1.00: Distributionally Robust Set Representation Learning Under Inference-Time Element Corruption | Yankai Chen, Hanrong Zhang, Bowei He, Philip S. Yu, Xue Liu | 2026 | arXiv 2605.30089
```
Exit status: 0

### scott2026negative
Command: python3 lookup resolve '2607.28423'
```
Crossref: not found
OpenAlex: ratio 1.00: Negative controls reveal volume-driven confounding in radiomics and imaging foundation model features | Katy L. Scott, Sejin Kim, Joshua Siraj, Caryn Geady, Matthew Boccalon, Mattea Welch, Mogtaba Alim, Andrew J. Hope, Benjamin Haibe<hyphen>Kains | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2607.28423 | arXiv 2607.28423 | OpenAlex W7171984506 | open access https://arxiv.org/pdf/2607.28423
Semantic Scholar: ratio 1.00: Negative controls reveal volume-driven confounding in radiomics and imaging foundation model features | K. Scott, Sejin Kim, J. Siraj, C. Geady, M. Boccalon, M. Welch, M. Alim, A. Hope, B. Haibe-Kains | 2026 | arXiv.org | vol abs/2607.28423 | doi 10.48550/arXiv.2607.28423 | arXiv 2607.28423 | Semantic Scholar d08208c58c5689b46262d55d5700edd130e55d8e
arXiv: ratio 1.00: Negative controls reveal volume-driven confounding in radiomics and imaging foundation model features | Katy L. Scott, Sejin Kim, Joshua Siraj, Caryn Geady, Matthew Boccalon, Mattea Welch, Mogtaba Alim, Andrew J. Hope, Benjamin Haibe-Kains | 2026 | arXiv 2607.28423
```
Exit status: 0

### pathan2026flowlot
Command: python3 lookup resolve '2609.17906'
```
Crossref: not found
OpenAlex: ratio 1.00: FlowLOT: Linearized Optimal Transport for Flow Cytometry Analysis | Naqib Sad Pathan, Mohammad Shifat<hyphen>E<hyphen>Rabbi, Kristofor E. Pas, Iv<latin small letter a with acute>n Medri, Bartek Rajwa, Gustavo Kunde Rohde | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2609.17906 | arXiv 2609.17906 | OpenAlex W7213563752 | open access https://arxiv.org/pdf/2609.17906
Semantic Scholar: ratio 1.00: FlowLOT: Linearized Optimal Transport for Flow Cytometry Analysis. | Naqib Sad Pathan, Mohammad Shifat-E.-Rabbi, Kristofor E. Pas, I. Medri, Bartek Rajwa, G. Rohde | 2026 | arXiv.org | arXiv 2609.17906 | Semantic Scholar faa21763f8cd65dd6f102b1b312c68b2ce82a61d
arXiv: ratio 1.00: FlowLOT: Linearized Optimal Transport for Flow Cytometry Analysis | Naqib Sad Pathan, Mohammad Shifat-E-Rabbi, Kristofor E. Pas, Ivan Medri, Bartek Rajwa, Gustavo K. Rohde | 2026 | arXiv 2609.17906
```
Exit status: 0

### ciszewski2026decision
Command: python3 lookup resolve '10.1109/cpee71962.2026.11768023'
```
Crossref: ratio 1.00: Decision Stability Under Segmentation Uncertainty in CT Radiomics | Jakub Ciszewski, Rados<latin small letter l with stroke>aw Roszczyk, Krzysztof Siwek | 2026 | 2026 27th International Conference on Computational Problems of Electrical Engineering (CPEE) | pages 1--6 | doi 10.1109/cpee71962.2026.11768023
OpenAlex: ratio 1.00: Decision Stability Under Segmentation Uncertainty in CT Radiomics | Jakub Ciszewski, Rados<latin small letter l with stroke>aw Roszczyk, Krzysztof Siwek | 2026 | International Conference on Computational Problems of Electrical Engineering (CPEE) | pages 1--6 | doi 10.1109/cpee71962.2026.11768023 | OpenAlex W7225403232 | open access https://doi.org/10.1109/cpee71962.2026.11768023
Semantic Scholar: ratio 1.00: Decision Stability Under Segmentation Uncertainty in CT Radiomics | Jakub Ciszewski, Rados<latin small letter l with stroke>aw Roszczyk, K. Siwek | 2026 | 2026 27th International Conference on Computational Problems of Electrical Engineering (CPEE) | pages 1--6 | doi 10.1109/CPEE71962.2026.11768023 | Semantic Scholar b1b85a28534ae290b8c6eae6abd3d03f85d623c7 | open access https://doi.org/10.1109/cpee71962.2026.11768023
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### peng2025ct
Command: python3 lookup resolve '10.3390/bioengineering12080813'
```
Crossref: ratio 1.00: CT-Based Habitat Radiomics Combining Multi-Instance Learning for Early Prediction of Post-Neoadjuvant Lymph Node Metastasis in Esophageal Squamous Cell Carcinoma | Qinghe Peng, Shumin Zhou, Runzhe Chen, Jinghui Pan, Xin Yang, Jinlong Du, Hongdong Liu, Hao Jiang, Xiaoyan Huang, Haojiang Li, Li Chen | 2025 | Bioengineering | vol 12 | no 8 | pages 813 | doi 10.3390/bioengineering12080813
OpenAlex: ratio 1.00: CT-Based Habitat Radiomics Combining Multi-Instance Learning for Early Prediction of Post-Neoadjuvant Lymph Node Metastasis in Esophageal Squamous Cell Carcinoma | Qinghe Peng, Shumin Zhou, Runzhe Chen, Jinghui Pan, Xiao Yang, Jinlong Du, Hongdong Liu, Hao Jiang, Xiaoyan Huang, Haojiang Li, Li Chen | 2025 | Bioengineering | vol 12 | no 8 | pages 813--813 | doi 10.3390/bioengineering12080813 | OpenAlex W4412701515 | open access https://www.mdpi.com/2306-5354/12/8/813/pdf?version=1753714973
Semantic Scholar: ratio 1.00: CT-Based Habitat Radiomics Combining Multi-Instance Learning for Early Prediction of Post-Neoadjuvant Lymph Node Metastasis in Esophageal Squamous Cell Carcinoma | Qing-He Peng, Shumin Zhou, Run-Zhe Chen, Jing-Hui Pan, Xin Yang, Jinlong Du, Hong-Dong Liu, Hao Jiang, Xiao-Yan Huang, Hao-Jiang Li, Li Chen | 2025 | Bioengineering | vol 12 | doi 10.3390/bioengineering12080813 | Semantic Scholar 5ab0994fc3d02df365ad07070895463bdebb7568 | open access https://www.mdpi.com/2306-5354/12/8/813/pdf?version=1753714973
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### beckmann2026generalizations
Command: python3 lookup resolve '10.1007/s10851-026-01327-4'
```
Crossref: ratio 1.00: Generalizations of the Normalized Radon Cumulative Distribution Transform for Limited Data Recognition | Matthias Beckmann, Robert Beinert, Jonas Bresch | 2026 | Journal of Mathematical Imaging and Vision | vol 68 | no 4 | doi 10.1007/s10851-026-01327-4
OpenAlex: ratio 1.00: Generalizations of the Normalized Radon Cumulative Distribution Transform for Limited Data Recognition | Matthias Beckmann, Robert Beinert, Jonas Bresch | 2026 | Journal of Mathematical Imaging and Vision | vol 68 | no 4 | doi 10.1007/s10851-026-01327-4 | OpenAlex W7169788024 | open access https://link.springer.com/content/pdf/10.1007/s10851-026-01327-4.pdf
Semantic Scholar: ratio 1.00: Generalizations of the Normalized Radon Cumulative Distribution Transform for Limited Data Recognition | Matthias Beckmann, Robert Beinert, Jonas Bresch | 2025 | Journal of Mathematical Imaging and Vision | vol 68 | doi 10.1007/s10851-026-01327-4 | arXiv 2512.08099 | Semantic Scholar 30f8beadb85f992c72fe2f8e2fc9016233915ec5 | open access https://link.springer.com/content/pdf/10.1007/s10851-026-01327-4.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cama2024study
Command: python3 lookup resolve '10.1117/12.3027015'
```
Crossref: ratio 1.00: A study on the role of radiomics feature stability in predicting breast cancer subtypes | Isabella Cama, Alejandro Guzman, Sara Garbarino, Cristina Campi, Karim Lekadir, Oliver Diaz | 2024 | 17th International Workshop on Breast Imaging (IWBI 2024) | pages 75 | doi 10.1117/12.3027015
OpenAlex: ratio 1.00: A study on the role of radiomics feature stability in predicting breast cancer subtypes | Isabella Cama, Alejandro Guzm<latin small letter a with acute>n, Sara Garbarino, Cristina Campi, Karim Lekadir, Oliver D<latin small letter i with acute>az | 2024 | International Workshop on Breast Imaging (IWBI) | pages 75--75 | doi 10.1117/12.3027015 | OpenAlex W4399117286
Semantic Scholar: ratio 1.00: A study on the role of radiomics feature stability in predicting breast cancer subtypes | Isabella Cama, Alejandro Guzm<latin small letter a with acute>n, S. Garbarino, C. Campi, K. Lekadir, Oliver D<latin small letter i with acute>az | 2024 | International Workshop on Breast Imaging | vol 13174 | pages 131741O--131741O--10 | doi 10.1117/12.3027015 | Semantic Scholar 198828b134403d75fdbdf40b3e0d701b4c40bf80
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### francischello2026influence
Command: python3 lookup resolve '10.1016/j.ejrai.2026.100091'
```
Crossref: ratio 1.00: The influence of annotators' experience on radiomics-based machine learning performance in colorectal liver metastases characterization: Impact and mitigation strategy | Roberto Francischello, Salvatore Claudio Fanni, Francesca Pia Caputo, Gayane Aghakhanyan, Giacomo Aringhieri, Lorenzo Faggioni, Riccardo Lencioni, Emanuele Neri, Dania Cioni | 2026 | European Journal of Radiology Artificial Intelligence | vol 6 | pages 100091 | doi 10.1016/j.ejrai.2026.100091
OpenAlex: ratio 1.00: The influence of annotators' experience on radiomics-based machine learning performance in colorectal liver metastases characterization: Impact and mitigation strategy | Roberto Francischello, Salvatore Claudio Fanni, Francesca Pia Caputo, Gayan<latin small letter e with grave> Aghakhanyan, Giacomo Aringhieri, Lorenzo Faggioni, Riccardo Antonio Lencioni, Emanuele Neri, Dania Cioni | 2026 | European Journal of Radiology Artificial Intelligence | vol 6 | pages 100091--100091 | doi 10.1016/j.ejrai.2026.100091 | OpenAlex W7141978071 | open access https://www.ejrai.com/article/S3050-5771(26)00022-8/pdf
Semantic Scholar: ratio 1.00: The Influence of Annotators' Experience on Radiomics-based Machine Learning Performance in Colorectal Liver Metastases Characterization: Impact and Mitigation Strategy | R. Francischello, S. Fanni, F. P. Caputo, G. Aghakhanyan, G. Aringhieri, L. Faggioni, R. Lencioni, E. Neri, D. Cioni | 2026 | European Journal of Radiology Artificial Intelligence | doi 10.1016/j.ejrai.2026.100091 | Semantic Scholar 4a8c7ef6df7078d6e3bc864c8d292a3dcda0622f | open access https://www.ejrai.com/article/S3050-5771(26)00022-8/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### li2025quantile
Command: python3 lookup resolve '2508.21523'
```
Crossref: not found
OpenAlex: ratio 1.00: Quantile Function-Based Models for Neuroimaging Classification Using Wasserstein Regression | Li, Jie, Gary G. R. Green, Zhang, Jian | 2025 | arXiv (Cornell University) | doi 10.48550/arxiv.2508.21523 | arXiv 2508.21523 | OpenAlex W4416008766 | open access https://arxiv.org/pdf/2508.21523
Semantic Scholar: ratio 1.00: Quantile Function-Based Models for Neuroimaging Classification Using Wasserstein Regression | Jie Li, G. Green, Jian Zhang | 2025 | arXiv 2508.21523 | Semantic Scholar acbda047df7ad37134382d45341f8876acabe993
arXiv: ratio 1.00: Quantile Function-Based Models for Neuroimaging Classification Using Wasserstein Regression | Jie Li, Gary Green, Jian Zhang | 2025 | arXiv 2508.21523
```
Exit status: 0

### choi2026tumor
Command: python3 lookup resolve '10.1016/j.phro.2026.100907'
```
Crossref: ratio 1.00: Tumor-conditioned inter-patient registration using planning computed tomography for voxel-based analysis to predict radiation pneumonitis in lung cancer patients | Chloe Min Seo Choi, Jue Jiang, Nikhil P. Mankuzhy, Nishant Nadkarni, Sudharsan Madhavan, Abraham J. Wu, Joseph O. Deasy, Maria Thor, Andreas Rimner, Harini Veeraraghavan | 2026 | Physics and Imaging in Radiation Oncology | vol 37 | pages 100907 | doi 10.1016/j.phro.2026.100907
OpenAlex: ratio 1.00: Tumor-conditioned inter-patient registration using planning computed tomography for voxel-based analysis to predict radiation pneumonitis in lung cancer patients | Chloe Min Seo Choi, Jue Jiang, Nikhil P. Mankuzhy, Nishant Nadkarni, Sudharsan Madhavan, Abraham Jing-Ching Wu, Joseph O. Deasy, Maria Thor, Andreas Rimner, Harini Veeraraghavan | 2026 | Physics and Imaging in Radiation Oncology | vol 37 | pages 100907--100907 | doi 10.1016/j.phro.2026.100907 | OpenAlex W7124836704 | open access https://www.phiro.science/article/S2405-6316(26)00007-2/pdf
Semantic Scholar: ratio 1.00: Tumor-conditioned inter-patient registration using planning computed tomography for voxel-based analysis to predict radiation pneumonitis in lung cancer patients | C. Choi, Jue Jiang, N. Mankuzhy, Nishant Nadkarni, Sudharsan Madhavan, Abraham J. Wu, J. Deasy, M. Thor, A. Rimner, H. Veeraraghavan | 2026 | Physics and Imaging in Radiation Oncology | vol 37 | doi 10.1016/j.phro.2026.100907 | Semantic Scholar ac894704ad97088d249215017e7907b9159576a6 | open access https://www.phiro.science/article/S2405-6316(26)00007-2/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### miteva2026segmentation
Command: python3 lookup resolve '2607.23626'
```
Crossref: not found
OpenAlex: ratio 1.00: Segmentation Robustness and Predictive Utility in Glioblastoma Radiomics: Evidence for a Trade-off in Survival Modelling | Mariya Miteva, Maria Nisheva-Pavlova | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2607.23626 | arXiv 2607.23626 | OpenAlex W7171553421 | open access https://arxiv.org/pdf/2607.23626
Semantic Scholar: ratio 1.00: Segmentation Robustness and Predictive Utility in Glioblastoma Radiomics: Evidence for a Trade-off in Survival Modelling | Mariya Miteva, M. Nisheva-Pavlova | 2026 | arXiv.org | vol abs/2607.23626 | doi 10.48550/arXiv.2607.23626 | arXiv 2607.23626 | Semantic Scholar b72a8cc78180e49d34b9b1b4eb34bd2db56ab903
arXiv: ratio 1.00: Segmentation Robustness and Predictive Utility in Glioblastoma Radiomics: Evidence for a Trade-off in Survival Modelling | Mariya Miteva, Maria Nisheva-Pavlova | 2026 | arXiv 2607.23626
```
Exit status: 0

### ahmadi2026hippocampal
Command: python3 lookup resolve '10.21203/rs.3.rs-10382441/v1'
```
Crossref: ratio 1.00: Hippocampal surface analysis using discrete Ricci flow and Riemannian metrics for the diagnosis of Alzheimer's disease | Fatemeh Ahmadi, Behroz Bidabad | 2026 | doi 10.21203/rs.3.rs-10382441/v1
OpenAlex: ratio 1.00: Hippocampal surface analysis using discrete Ricci flow and Riemannian metrics for the diagnosis of Alzheimer's disease | Fatemeh Ahmadi, Behroz Bidabad | 2026 | Research Square | doi 10.21203/rs.3.rs-10382441/v1 | OpenAlex W7213550078 | open access https://www.researchsquare.com/article/rs-10382441/latest.pdf
Semantic Scholar: ratio 1.00: Hippocampal surface analysis using discrete Ricci flow and Riemannian metrics for the diagnosis of Alzheimer<right single quotation mark>s disease | Fatemeh Ahmadi, B. Bidabad | 2026 | Research Square | doi 10.21203/rs.3.rs-10382441/v1 | Semantic Scholar 277202d8b64a88b120d00213cdf34ceebcb07153 | open access https://www.researchsquare.com/article/rs-10382441/latest.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tang2026metabolic
Command: python3 lookup resolve '10.1162/imag.a.1343'
```
Crossref: ratio 1.00: Metabolic connectivity alterations in amyotrophic lateral sclerosis: Individual network analysis based on Wasserstein distances | Chunmeng Tang, Joke De Vocht, Philip Van Damme, Koen Van Laere, Michel Koole | 2026 | Imaging Neuroscience | vol 4 | doi 10.1162/imag.a.1343
OpenAlex: ratio 1.00: Metabolic connectivity alterations in amyotrophic lateral sclerosis: Individual network analysis based on Wasserstein distances | Chunmeng Tang, Joke De Vocht, Philip Van Damme, Koen Van Laere, Michel J. B. Koole | 2026 | Imaging Neuroscience | vol 4 | doi 10.1162/imag.a.1343 | OpenAlex W7196987648 | open access https://doi.org/10.1162/imag.a.1343
Semantic Scholar: ratio 1.00: Metabolic connectivity alterations in amyotrophic lateral sclerosis: Individual network analysis based on Wasserstein distances | Chun-Meng Tang, Joke de Vocht, P. van Damme, K. Van Laere, M. Koole | 2026 | Imaging neuroscience | vol 4 | doi 10.1162/IMAG.a.1343 | Semantic Scholar f74187f0fcc999d10fdfad5b32e5b2d6bfdfd3f7 | open access https://doi.org/10.1162/imag.a.1343
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wiers2026geometry
No DOI and no arXiv ID; url: https://proceedings.mlr.press/v315/wiers26a.html. Checked by WebFetch of the url (recorded below by the session).

### url checks of the merged refs.bib (entries with neither a DOI nor an arXiv ID)
Each url read with WebFetch (HTTP 200 each); the Harshman PDF's first page read with `pdftotext -f 1 -l 1`.
- naderializadeh2021pooling: page title "Pooling by Sliced-Wasserstein Embedding"; NeurIPS 34 (2021). Passes.
- maron1997framework: page title "A Framework for Multiple-Instance Learning"; NIPS 10 (1997). Passes.
- kusner2015word: page title "From Word Embeddings To Document Distances"; PMLR 37:957-966, 2015. Passes.
- wiers2026geometry: page title "Geometry-Aware Cardiac MRI Representation Learning with Equivariant Neural Fields"; PMLR 315:3641-3658, 2026. Passes.
- peyre2016gromov: page title "Gromov-Wasserstein Averaging of Kernel and Distance Matrices"; PMLR 48:2664-2672, 2016. Passes.
- harshman1972parafac2: first page "PARAFAC2: Mathematical and Technical Notes", with the note giving UCLA Working Papers in Phonetics, 22, 30-44. Passes.

### Merged refs.bib summary
288 entries: 282 checked by `the lookup script resolve` (exit 0 each; every one has at least one index record that matches it), 6 by their url (each passes). No identifier provably fails.
A title an index prints that differs from its entry and is not among the six the merge run decided: afshar2020taste (the entry's title is "TASTE"; OpenAlex prints "TASTE: temporal and static tensor factorization for phenotyping electronic health records").

## Identifier check: merged refs.bib after the send-back (refs.bib), 2026-11-20 02:44

Command: grep -n -i -E '^[[:space:]]*(doi|eprint)[[:space:]]*=' 'refs.bib'
```
10:  doi = {10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c}
24:  doi = {10.1109/tpami.2012.254}
37:  doi = {10.1093/biomet/asaf082},
38:  eprint = {2310.09428},
53:  doi = {10.1080/01621459.2013.776499},
54:  eprint = {1203.3209},
69:  doi = {10.1007/s12561-018-9215-6},
70:  eprint = {1304.5637},
85:  doi = {10.1214/23-aoas1830}
98:  doi = {10.1007/s11222-026-10892-y},
99:  eprint = {2505.12113},
114:  doi = {10.1137/07070111x}
141:  doi = {10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b}
155:  doi = {10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y}
169:  doi = {10.1137/24m1692836},
170:  eprint = {2410.14046},
185:  doi = {10.1109/tmi.2019.2936046}
198:  doi = {10.3389/fnins.2022.861402}
211:  doi = {10.1016/j.chemolab.2021.104446}
226:  eprint = {2208.00993},
237:  eprint = {2609.23705},
252:  doi = {10.1016/j.neuroimage.2008.05.062}
265:  doi = {10.1080/01621459.2019.1585254},
266:  eprint = {1903.08871},
280:  doi = {10.1109/tbme.2018.2816519}
290:  doi = {10.64898/2026.11.12.766278}
302:  doi = {10.1007/bf02296963}
313:  eprint = {1306.0895},
326:  doi = {10.1561/2200000073},
327:  eprint = {1803.00567},
341:  eprint = {1810.02733},
354:  doi = {10.1137/141000439},
355:  eprint = {1412.5154},
368:  doi = {10.1007/s10208-011-9093-5}
393:  eprint = {1805.09114},
405:  eprint = {2009.04266},
419:  eprint = {2106.01128},
432:  eprint = {2306.00182},
445:  doi = {10.1137/100805741}
458:  eprint = {1310.4375},
472:  eprint = {2006.02575},
485:  doi = {10.1137/21M1390062},
486:  eprint = {2101.01100},
499:  doi = {10.1137/17M1140431},
500:  eprint = {1708.01955},
513:  doi = {10.1609/aaai.v34i04.6120},
514:  eprint = {1911.08530},
528:  eprint = {2102.06555},
539:  doi = {10.52202/068431-0857},
540:  eprint = {2205.15733},
554:  eprint = {2202.03813},
564:  eprint = {2006.12065},
577:  doi = {10.1093/imaiai/iaac023},
578:  eprint = {2008.09165},
587:  eprint = {2510.22033},
600:  doi = {10.1007/978-3-319-19992-4_20},
601:  eprint = {1503.08596},
613:  doi = {10.1007/978-3-030-20351-1_18}
623:  doi = {10.52202/068431-1584},
624:  eprint = {2206.09398},
636:  doi = {10.1016/j.neuroimage.2021.118683}
647:  doi = {10.1007/978-3-319-19992-4_32}
659:  doi = {10.1073/pnas.1917405117}
670:  doi = {10.3389/fonc.2025.1700447}
678:  eprint = {2605.20883},
691:  doi = {10.1016/j.compmedimag.2022.102129}
700:  doi = {10.64898/2026.05.21.726781},
711:  doi = {10.1109/ICCV.2017.29}
723:  doi = {10.1007/978-3-030-00931-1_53}
733:  eprint = {1703.06114},
747:  eprint = {1810.00825},
757:  eprint = {1811.01900},
768:  doi = {10.52202/075280-1845},
769:  eprint = {2306.06529},
781:  eprint = {2307.04001},
792:  doi = {10.1109/CVPR.2017.16},
793:  eprint = {1612.00593},
804:  eprint = {1706.02413},
817:  doi = {10.1145/3326362},
818:  eprint = {1801.07829},
829:  doi = {10.1109/ICCV48922.2021.01595}
842:  eprint = {1802.04712},
855:  doi = {10.1561/2200000060},
856:  eprint = {1605.09522},
869:  eprint = {1411.2066},
882:  doi = {10.1038/s41591-019-0508-1}
894:  doi = {10.1038/s41551-020-00682-w},
895:  eprint = {2004.09666},
907:  doi = {10.1016/j.media.2020.101852},
920:  doi = {10.1038/s41598-022-12533-6}
931:  doi = {10.1007/978-3-030-87240-3_72},
932:  eprint = {2012.06875},
945:  doi = {10.1109/TNNLS.2019.2892409},
946:  eprint = {1711.08324},
961:  eprint = {1901.09006},
973:  doi = {10.52202/075280-0596},
974:  eprint = {2310.17867},
986:  eprint = {2406.06984},
997:  doi = {10.1109/ICCV48922.2021.01591}
1008:  doi = {10.1088/1361-6560/ae7955},
1021:  eprint = {2604.26807},
1034:  doi = {10.1016/j.media.2007.06.004}
1046:  doi = {10.1016/j.neuroimage.2004.07.068}
1058:  doi = {10.1109/TMI.2019.2897538}
1068:  eprint = {1908.02738},
1079:  doi = {10.1109/CVPR52734.2025.02878}
1091:  doi = {10.1006/nimg.2000.0582}
1103:  doi = {10.1038/nn1050}
1115:  doi = {10.1109/TMI.2012.2236651}
1127:  doi = {10.1016/j.ejca.2011.11.036}
1139:  doi = {10.1038/ncomms5006}
1151:  doi = {10.1158/0008-5472.CAN-17-0339}
1163:  doi = {10.1148/radiol.2020191145}
1175:  doi = {10.1007/s00330-020-06957-9}
1187:  doi = {10.1109/TMI.2014.2377694}
1199:  doi = {10.1038/s41592-020-01008-z}
1211:  doi = {10.1038/s41598-018-31911-7}
1222:  doi = {10.1016/j.compbiomed.2025.110919}
1234:  doi = {10.1016/j.neuroimage.2008.12.037}
1245:  doi = {10.1016/j.compbiomed.2024.108320}
1257:  doi = {10.1080/0284186X.2018.1445283}
1269:  doi = {10.1038/s41598-022-20703-9}
1281:  doi = {10.1117/1.JMI.12.5.054501}
1292:  doi = {10.1016/j.neuroimage.2017.07.059},
1293:  eprint = {1612.02572},
1306:  doi = {10.1371/journal.pmed.1002711}
1318:  doi = {10.3390/cancers16142538},
1319:  eprint = {2405.01756},
1331:  doi = {10.1007/978-3-031-43993-3_40},
1332:  eprint = {2307.09000},
1343:  doi = {10.1145/3368555.3384464}
1353:  doi = {10.1145/3394486.3403213}
1365:  doi = {10.1214/23-aoas1858}
1377:  doi = {10.1038/s41598-023-46747-z}
1386:  eprint = {2611.03608},
1395:  eprint = {1810.08278},
1408:  doi = {10.1007/s11263-012-0566-z},
1418:  eprint = {2006.09430},
1427:  eprint = {1906.01277},
1440:  doi = {10.1109/tpami.2024.3409772}
1451:  doi = {10.1016/j.neuroimage.2017.11.006},
1452:  eprint = {1705.04919},
1467:  doi = {10.1126/sciadv.adl5307}
1478:  doi = {10.1016/j.media.2023.102864},
1489:  eprint = {2401.01460},
1500:  doi = {10.52202/079017-4374},
1501:  eprint = {2408.11370},
1513:  doi = {10.1016/j.media.2025.103538},
1524:  eprint = {2303.05978},
1536:  doi = {10.1016/j.patcog.2023.109351},
1537:  eprint = {2203.04711},
1550:  doi = {10.1080/01621459.2021.1956937}
1561:  doi = {10.1007/978-3-030-32248-9_71},
1562:  eprint = {2107.02010},
1573:  doi = {10.1109/cvpr.2016.546}
1582:  doi = {10.1038/s41746-026-03323-9}
1592:  doi = {10.1109/tcds.2026.3722535}
1604:  doi = {10.1109/tpami.2015.2408346}
1616:  doi = {10.1145/2897824.2925903}
1636:  doi = {10.1002/cyto.a.24918}
1646:  doi = {10.52202/079017-1948}
1654:  eprint = {2106.00908},
1666:  doi = {10.34133/bmef.0276}
1674:  eprint = {2107.01959},
1685:  doi = {10.1109/ijcnn69854.2026.11729839}
1693:  eprint = {2208.12401},
1702:  eprint = {1511.06391},
1711:  eprint = {1901.06082},
1728:  eprint = {2405.16519},
1737:  eprint = {2110.03336},
1746:  eprint = {2206.11925},
1755:  eprint = {1904.01962},
1764:  eprint = {2306.05553},
1775:  doi = {10.1109/iccv.2019.00443}
1786:  doi = {10.1016/j.media.2023.102813}
1797:  doi = {10.1016/j.media.2020.101789},
1798:  eprint = {2009.11169},
1809:  eprint = {1705.04293},
1819:  doi = {10.1101/2021.04.13.439702}
1828:  eprint = {2610.41328},
1840:  doi = {10.1007/978-3-030-87237-3_33},
1841:  eprint = {2107.13048},
1851:  eprint = {2608.15970},
1863:  doi = {10.1109/access.2026.3751717}
1873:  doi = {10.1109/isbi45749.2020.9098722}
1885:  doi = {10.1002/mp.15539}
1897:  doi = {10.1109/tmi.2020.2996256}
1907:  doi = {10.1109/bibm49941.2020.9313417}
1918:  doi = {10.1007/978-3-030-87234-2_74},
1919:  eprint = {2107.07805},
1931:  doi = {10.1016/j.compbiomed.2022.106168},
1944:  doi = {10.1016/j.cmpb.2023.107872},
1958:  doi = {10.34067/kid.0000000668}
1968:  doi = {10.1109/icip51287.2024.10647287}
1980:  doi = {10.1007/s00330-026-12601-9}
1992:  doi = {10.1016/j.ynirp.2026.100418}
2003:  doi = {10.1016/j.media.2024.103120},
2017:  doi = {10.1136/neurintsurg-2022-018655}
2028:  doi = {10.3389/fphys.2021.644349}
2039:  doi = {10.1016/j.compbiomed.2025.110965}
2051:  doi = {10.1007/s11548-025-03527-6},
2065:  doi = {10.1109/jbhi.2024.3495035}
2076:  doi = {10.1016/j.compmedimag.2025.102587}
2086:  doi = {10.1109/embc40787.2023.10340878}
2098:  doi = {10.1016/j.cels.2025.101229}
2109:  doi = {10.1016/j.compmedimag.2021.101939},
2123:  doi = {10.1038/s41598-022-22313-x}
2132:  doi = {10.1109/isbi48211.2021.9433948},
2133:  eprint = {2104.10047},
2145:  doi = {10.1007/978-3-030-60365-6_17},
2146:  eprint = {2008.06098},
2158:  doi = {10.1016/j.compbiomed.2024.109192}
2167:  doi = {10.64898/2026.11.12.766227}
2178:  doi = {10.1016/j.media.2019.01.001},
2192:  doi = {10.1109/tmi.2022.3213983}
2203:  doi = {10.1016/j.media.2026.104175},
2217:  doi = {10.1109/tmi.2014.2330355}
2228:  doi = {10.1162/imag.a.1048}
2240:  doi = {10.1002/hbm.22297}
2251:  doi = {10.3389/fnimg.2022.977491}
2263:  doi = {10.1038/s41598-026-63646-1}
2275:  doi = {10.1109/tpami.2025.3609521}
2286:  doi = {10.1016/j.media.2022.102383}
2298:  doi = {10.1109/tmi.2025.3605194}
2309:  doi = {10.1162/imag_a_00197}
2320:  doi = {10.1007/978-3-031-43993-3_25},
2321:  eprint = {2303.12148},
2333:  doi = {10.3389/fnimg.2025.1573816}
2345:  doi = {10.1148/radiol.231319}
2357:  doi = {10.1088/2057-1976/ac8e6f}
2368:  doi = {10.1016/j.nicl.2016.11.020}
2380:  doi = {10.1007/s00234-025-03834-4},
2393:  doi = {10.1007/978-3-031-72114-4_47},
2394:  eprint = {2404.09556},
2406:  doi = {10.1007/978-3-031-43901-8_17},
2407:  eprint = {2412.07156},
2420:  doi = {10.1593/tlo.13844}
2432:  doi = {10.1038/s41598-018-36938-4}
2444:  doi = {10.1038/s41598-020-69534-6}
2456:  doi = {10.1038/s41598-020-70940-z}
2468:  doi = {10.3390/diagnostics12020247}
2480:  doi = {10.3390/jcm11247334}
2491:  doi = {10.1016/j.ejrad.2020.109031},
2505:  doi = {10.1038/s41598-022-16520-9}
2517:  doi = {10.3390/diagnostics13243640}
2528:  doi = {10.1016/j.phro.2023.100530}
2540:  doi = {10.1038/s41598-024-58551-4}
2552:  doi = {10.3109/0284186x.2013.812798}
2564:  doi = {10.18383/j.tom.2016.00235}
2576:  doi = {10.1371/journal.pone.0102107}
2588:  doi = {10.1002/mp.13624}
2600:  doi = {10.1002/mp.12925}
2612:  doi = {10.21037/qims.2019.03.02}
2621:  doi = {10.1088/1361-6560/aebf1b}
2633:  doi = {10.1148/radiol.231442}
2644:  doi = {10.1016/j.neuroimage.2022.118871}
2655:  doi = {10.1200/cci.21.00096}
2667:  doi = {10.2967/jnumed.123.267048}
2679:  doi = {10.3390/biotech14040087}
2691:  doi = {10.1158/2767-9764.crc-22-0152}
2702:  doi = {10.1007/978-3-031-43895-0_50},
2703:  eprint = {2307.11017},
2715:  doi = {10.1007/978-3-031-43907-0_47},
2726:  eprint = {2609.09424},
2738:  doi = {10.1016/j.neuroimage.2020.116703}
2749:  doi = {10.1007/978-3-032-05182-0_43},
2750:  eprint = {2506.20741},
2763:  doi = {10.1007/s10851-025-01261-x}
2775:  doi = {10.1109/tpami.2023.3314661},
2776:  eprint = {2212.06339},
2789:  doi = {10.1002/cyto.a.22602}
2801:  doi = {10.4103/jpi.jpi_84_16}
2813:  doi = {10.1117/1.jmi.13.1.014507}
2825:  doi = {10.3390/diagnostics16213632}
2835:  doi = {10.1109/embc46164.2021.9631044}
2845:  doi = {10.1109/embc.2019.8856372}
2857:  doi = {10.1007/s12021-020-09459-7},
2871:  doi = {10.1007/s00415-026-13664-w},
2884:  doi = {10.1007/978-3-642-38868-2_15},
2885:  eprint = {1303.7390},
2899:  doi = {10.1007/978-3-319-59050-9_3},
2912:  doi = {10.1007/978-3-319-59050-9_2},
2913:  eprint = {1703.01232},
2925:  doi = {10.1007/978-3-030-78191-0_13},
2926:  eprint = {2104.00637},
2940:  doi = {10.1007/978-3-031-34048-2_24},
2941:  eprint = {2302.03830},
2955:  doi = {10.1007/978-3-031-96625-5_5},
2956:  eprint = {2503.05031},
2970:  doi = {10.1016/j.patcog.2017.08.026},
2971:  eprint = {1610.02501},
2984:  doi = {10.1073/pnas.1319779111}
3000:  eprint = {1202.6504},
3012:  doi = {10.1016/j.radonc.2018.10.027}
3024:  doi = {10.1109/tmi.2011.2163944}
3032:  eprint = {1906.02795},
3045:  doi = {10.1109/jbhi.2017.2652449}
3054:  eprint = {2006.04804},
3065:  doi = {10.1109/cvpr.2016.568}
3076:  doi = {10.1073/pnas.1408792111}
3088:  doi = {10.1016/j.neuroimage.2011.01.050},
3102:  doi = {10.1016/j.neuroimage.2010.06.013},
3115:  doi = {10.1016/j.neucom.2020.08.030}
3125:  doi = {10.1109/cvpr52733.2024.01099}
3137:  doi = {10.1093/bioadv/vbaf060}
3147:  doi = {10.1145/3637528.3671696}
3157:  doi = {10.52202/079017-1420}
3169:  doi = {10.1038/s41598-025-32093-9}
3177:  eprint = {2502.04907},
3186:  eprint = {2505.24403},
3196:  eprint = {2506.02203},
3206:  eprint = {2412.16715},
3216:  eprint = {2602.07260},
3225:  eprint = {2410.16669},
3238:  doi = {10.1002/pro6.70056}
3250:  doi = {10.18372/1990-5548.88.20980}
3259:  eprint = {2605.30089},
3269:  eprint = {2607.28423},
3279:  eprint = {2609.17906},
3290:  doi = {10.1109/cpee71962.2026.11768023}
3302:  doi = {10.3390/bioengineering12080813}
3314:  doi = {10.1007/s10851-026-01327-4}
3324:  doi = {10.1117/12.3027015}
3335:  doi = {10.1016/j.ejrai.2026.100091}
3344:  eprint = {2508.21523},
3356:  doi = {10.1016/j.phro.2026.100907}
3365:  eprint = {2607.23626},
3375:  doi = {10.21203/rs.3.rs-10382441/v1}
3386:  doi = {10.1162/imag.a.1343}
3409:  doi = {10.1007/978-3-319-93764-9_9}
3431:  doi = {10.1007/978-3-030-30487-4_35}
3442:  doi = {10.1007/978-3-030-41964-6_43}
3453:  doi = {10.1007/s10444-023-10054-y}
3464:  doi = {10.1007/978-3-031-43993-3_29}
3475:  doi = {10.1007/978-3-032-05182-0_29}
3486:  doi = {10.1007/978-3-030-20351-1_4}
3497:  doi = {10.1007/978-3-030-20351-1_7}
3508:  doi = {10.1007/978-3-031-34048-2_25},
3509:  eprint = {2206.02377},
3522:  doi = {10.1016/s0004-3702(96)00034-3}
3533:  doi = {10.1007/978-3-319-51237-2_2}
3543:  doi = {10.1109/iccv51701.2025.02062}
3554:  doi = {10.1007/978-3-032-37679-4_28}
3563:  doi = {10.2139/ssrn.7135982}
```
Exit status: 0

### bro1996multiway
Command: python3 lookup resolve '10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c'
```
Crossref: ratio 1.00: Multiway calibration. Multilinear PLS | Rasmus Bro | 1996 | Journal of Chemometrics | vol 10 | no 1 | pages 47--61 | doi 10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c
OpenAlex: ratio 1.00: Multiway calibration. Multilinear PLS | Rasmus Bro | 1996 | Journal of Chemometrics | vol 10 | no 1 | pages 47--61 | doi 10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c | OpenAlex W2155639125
Semantic Scholar: ratio 1.00: Multiway calibration. Multilinear PLS | R. Bro | 1996 | vol 10 | doi 10.1002/(SICI)1099-128X(199601)10:1<47::AID-CEM400>3.0.CO;2-C | Semantic Scholar 5d7a1f4c37d36b804183d4240a304d1539cf5551
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhao2013hopls
Command: python3 lookup resolve '10.1109/tpami.2012.254'
```
Crossref: ratio 1.00: Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method | Qibin Zhao, C. F. Caiafa, D. P. Mandic, Z. C. Chao, Y. Nagasaka, N. Fujii, Liqing Zhang, A. Cichocki | 2013 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 35 | no 7 | pages 1660--1673 | doi 10.1109/tpami.2012.254
OpenAlex: ratio 1.00: Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method | Qibin Zhao, Cesar Federico Caiafa, Danilo P. Mandic, Z. C. Chao, Yasuo Nagasaka, Naotaka Fujii, Liqing Zhang, Andrzej S Cichocki | 2012 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 35 | no 7 | pages 1660--1673 | doi 10.1109/tpami.2012.254 | OpenAlex W1967696752 | open access https://arxiv.org/pdf/1207.1230
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### park2025sparse
Command: python3 lookup resolve '10.1093/biomet/asaf082'
```
Crossref: ratio 1.00: Sparse higher-order partial least squares for simultaneous variable selection, dimension reduction and tensor denoising | Kwangmoon Park, S<latin small letter u with diaeresis>nd<latin small letter u with diaeresis>z Kele<latin small letter s with cedilla> | 2025 | Biometrika | vol 113 | no 1 | doi 10.1093/biomet/asaf082
OpenAlex: ratio 1.00: Sparse higher-order partial least squares for simultaneous variable selection, dimension reduction and tensor denoising | Kwangmoon Park, S<latin small letter u with diaeresis>nd<latin small letter u with diaeresis>z Kele<latin small letter s with cedilla> | 2025 | Biometrika | vol 113 | no 1 | doi 10.1093/biomet/asaf082 | OpenAlex W7106135362 | open access https://arxiv.org/pdf/2310.09428
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhou2013tensor
Command: python3 lookup resolve '10.1080/01621459.2013.776499'
```
Crossref: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Lexin Li, Hongtu Zhu | 2013 | Journal of the American Statistical Association | vol 108 | no 502 | pages 540--552 | doi 10.1080/01621459.2013.776499
OpenAlex: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Lexin Li, Hongtu Zhu | 2013 | Journal of the American Statistical Association | vol 108 | no 502 | pages 540--552 | doi 10.1080/01621459.2013.776499 | OpenAlex W2136002544 | open access http://europepmc.org/articles/PMC4004091
Semantic Scholar: ratio 1.00: Tensor Regression with Applications in Neuroimaging Data Analysis | Hua Zhou, Le-Xin Li, Hong-Tu Zhu | 2012 | Journal of the American Statistical Association | vol 108 | pages 540--552 | doi 10.1080/01621459.2013.776499 | arXiv 1203.3209 | Semantic Scholar cae78de351d5cbd5bd7fd853cf07034ca2e6659c | open access http://europepmc.org/articles/PMC4004091
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### li2018tucker
Command: python3 lookup resolve '10.1007/s12561-018-9215-6'
```
Crossref: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiaoshan Li, Da Xu, Hua Zhou, Lexin Li | 2018 | Statistics in Biosciences | vol 10 | no 3 | pages 520--545 | doi 10.1007/s12561-018-9215-6
OpenAlex: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiaoshan Li, Da Xu, Hua Zhou, Lexin Li | 2018 | Statistics in Biosciences | vol 10 | no 3 | pages 520--545 | doi 10.1007/s12561-018-9215-6 | OpenAlex W1580176742 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8336908/
Semantic Scholar: ratio 1.00: Tucker Tensor Regression and Neuroimaging Analysis | Xiao-Shan Li, Da Xu, Hua Zhou, Le-Xin Li | 2013 | Statistics in Biosciences | vol 10 | pages 520--545 | doi 10.1007/s12561-018-9215-6 | arXiv 1304.5637 | Semantic Scholar 99163e795fb486abbee830608383b6a142cdf434 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8336908/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xu2024tensor
Command: python3 lookup resolve '10.1214/23-aoas1830'
```
Crossref: ratio 1.00: Tensor regression for incomplete observations with application to longitudinal studies | Tianchen Xu, Kun Chen, Gen Li | 2024 | The Annals of Applied Statistics | vol 18 | no 2 | pages 1195--1212 | doi 10.1214/23-aoas1830
OpenAlex: ratio 1.00: Tensor regression for incomplete observations with application to longitudinal studies | Tianchen Xu, Kun Chen, Gen Li | 2024 | The Annals of Applied Statistics | vol 18 | no 2 | pages 1195--1212 | doi 10.1214/23-aoas1830 | OpenAlex W4393976093 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC11446469/pdf/nihms-2011753.pdf
Semantic Scholar: ratio 1.00: TENSOR REGRESSION FOR INCOMPLETE OBSERVATIONS WITH APPLICATION TO LONGITUDINAL STUDIES | Tianchen Xu, Kun Chen, Gen Li | 2024 | Annals of Applied Statistics | vol 18 | pages 1195--1212 | doi 10.1214/23-aoas1830 | Semantic Scholar be9610c70d40f615f5ea456b84263fbcf2419a94 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC11446469/pdf/nihms-2011753.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### huang2026shift
Command: python3 lookup resolve '10.1007/s11222-026-10892-y'
```
Crossref: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and Computing | vol 36 | no 3 | doi 10.1007/s11222-026-10892-y
OpenAlex: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and Computing | vol 36 | no 3 | doi 10.1007/s11222-026-10892-y | OpenAlex W7160305416 | open access https://link.springer.com/content/pdf/10.1007/s11222-026-10892-y.pdf
Semantic Scholar: ratio 1.00: Shift-aware sparse kronecker tensor classification | Hsin-Hsiung Huang, Yuh-Haur Chen, Teng Zhang | 2026 | Statistics and computing | vol 36 | doi 10.1007/s11222-026-10892-y | Semantic Scholar 0022f9272776da223a17c89c95429f0a0c3d07cc | open access https://link.springer.com/content/pdf/10.1007/s11222-026-10892-y.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kolda2009tensor
Command: python3 lookup resolve '10.1137/07070111x'
```
Crossref: ratio 1.00: Tensor Decompositions and Applications | Tamara G. Kolda, Brett W. Bader | 2009 | SIAM Review | vol 51 | no 3 | pages 455--500 | doi 10.1137/07070111x
OpenAlex: ratio 1.00: Tensor Decompositions and Applications | Tamara G. Kolda, Brett W. Bader | 2009 | SIAM Review | vol 51 | no 3 | pages 455--500 | doi 10.1137/07070111x | OpenAlex W2024165284
Semantic Scholar: ratio 1.00: Tensor Decompositions and Applications | T. Kolda, B. Bader | 2009 | SIAM Review | vol 51 | pages 455--500 | doi 10.1137/07070111X | Semantic Scholar 87e43e9eba01a4eb03436c9946bf6aa031a5d5af
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### harshman1972parafac2
No DOI and no arXiv ID; url: https://psychology.uwo.ca/faculty/harshman/wpppfac2.pdf. Checked by WebFetch of the url (recorded below by the session).

### kiers1999parafac2
Command: python3 lookup resolve '10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b'
```
Crossref: ratio 1.00: PARAFAC2<em dash>Part I. A direct fitting algorithm for the PARAFAC2 model | Henk A. L. Kiers, Jos M. F. ten Berge, Rasmus Bro | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 275--294 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b
OpenAlex: ratio 0.99: PARAFAC2 - Part I. A direct fitting algorithm for the PARAFAC2 model | Henk A. L. Kiers, Jos M. F. ten Berge, Rasmus Bro | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 275--294 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b | OpenAlex W2167838035
Semantic Scholar: ratio 1.00: PARAFAC2<em dash>Part I. A direct fitting algorithm for the PARAFAC2 model | H. Kiers, J. T. ten Berge, R. Bro | 1999 | vol 13 | doi 10.1002/(SICI)1099-128X(199905/08)13:3/4<275::AID-CEM543>3.0.CO;2-B | Semantic Scholar a2c846e976575e84a1471fb1d042d7f5e04b3417
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bro1999parafac2
Command: python3 lookup resolve '10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y'
```
Crossref: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | Rasmus Bro, Claus A. Andersson, Henk A. L. Kiers | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 295--309 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y
OpenAlex: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | Rasmus Bro, Claus A. Andersson, Henk A. L. Kiers | 1999 | Journal of Chemometrics | vol 13 | no 3-4 | pages 295--309 | doi 10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y | OpenAlex W1964121443
Semantic Scholar: ratio 1.00: PARAFAC2<em dash>Part II. Modeling chromatographic data with retention time shifts | R. Bro, C. Andersson, H. Kiers | 1999 | vol 13 | doi 10.1002/(SICI)1099-128X(199905/08)13:3/4<295::AID-CEM547>3.0.CO;2-Y | Semantic Scholar 0ccfc172cc3ba9ee0d9b1f00ecbcca182aca6d6e
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tang2026tensor
Command: python3 lookup resolve '10.1137/24m1692836'
```
Crossref: ratio 1.00: Tensor Decomposition with Unaligned Observations | Runshi Tang, Tamara G. Kolda, Anru R. Zhang | 2026 | SIAM Journal on Matrix Analysis and Applications | vol 47 | no 1 | pages 107--131 | doi 10.1137/24m1692836
OpenAlex: ratio 1.00: Tensor Decomposition with Unaligned Observations | Runshi Tang, Tamara G. Kolda, Anru R. Zhang | 2026 | SIAM Journal on Matrix Analysis and Applications | vol 47 | no 1 | pages 107--131 | doi 10.1137/24m1692836 | OpenAlex W7127277482 | open access https://arxiv.org/pdf/2410.14046
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kuang2020shift
Command: python3 lookup resolve '10.1109/tmi.2019.2936046'
```
Crossref: ratio 1.00: Shift-Invariant Canonical Polyadic Decomposition of Complex-Valued Multi-Subject fMRI Data With a Phase Sparsity Constraint | Li-Dan Kuang, Qiu-Hua Lin, Xiao-Feng Gong, Fengyu Cong, Yu-Ping Wang, Vince D. Calhoun | 2020 | IEEE Transactions on Medical Imaging | vol 39 | no 4 | pages 844--853 | doi 10.1109/tmi.2019.2936046
OpenAlex: ratio 1.00: Shift-Invariant Canonical Polyadic Decomposition of Complex-Valued Multi-Subject fMRI Data With a Phase Sparsity Constraint | Li<hyphen>Dan Kuang, Qiu<hyphen>Hua Lin, Xiao<hyphen>Feng Gong, Fengyu Cong, Yu<hyphen>Ping Wang, Vince D. Calhoun | 2019 | IEEE Transactions on Medical Imaging | vol 39 | no 4 | pages 844--853 | doi 10.1109/tmi.2019.2936046 | OpenAlex W2969480173 | open access https://ieeexplore.ieee.org/ielx7/42/9055242/08805171.pdf
Semantic Scholar: ratio 1.00: Shift-Invariant Canonical Polyadic Decomposition of Complex-Valued Multi-Subject fMRI Data with a Phase Sparsity Constraint | Li-Dan Kuang, Qiu-Hua Lin, Xiao-Feng Gong, F. Cong, Yu-Ping Wang, V. Calhoun | 2019 | IEEE Transactions on Medical Imaging | vol 39 | pages 844--853 | doi 10.1109/TMI.2019.2936046 | Semantic Scholar 9c6c1c29f70b6c68bf226c4998549bd97b12f8b0 | open access https://ieeexplore.ieee.org/ielx7/42/9055242/08805171.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### acar2022tracing
Command: python3 lookup resolve '10.3389/fnins.2022.861402'
```
Crossref: ratio 1.00: Tracing Evolving Networks Using Tensor Factorizations vs. ICA-Based Approaches | Evrim Acar, Marie Roald, Khondoker M. Hossain, Vince D. Calhoun, T<latin small letter u with diaeresis>lay Adali | 2022 | Frontiers in Neuroscience | vol 16 | doi 10.3389/fnins.2022.861402
OpenAlex: ratio 1.00: Tracing Evolving Networks Using Tensor Factorizations vs. ICA-Based Approaches | Evrim Acar, Marie Roald, Khondoker Murad Hossain, Vince D. Calhoun, T<latin small letter u with diaeresis>lay Adal<latin small letter dotless i> | 2022 | Frontiers in Neuroscience | vol 16 | pages 861402--861402 | doi 10.3389/fnins.2022.861402 | OpenAlex W4224320358 | open access https://doi.org/10.3389/fnins.2022.861402
Semantic Scholar: ratio 1.00: Tracing Evolving Networks Using Tensor Factorizations vs. ICA-Based Approaches | E. Acar, Marie Roald, K. M. Hossain, V. Calhoun, T. Adal<latin small letter dotless i> | 2022 | Frontiers in Neuroscience | vol 16 | doi 10.3389/fnins.2022.861402 | Semantic Scholar 62c3bab5d38f96e6571685918b001ce5b17955c9 | open access https://doi.org/10.3389/fnins.2022.861402
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yu2021local
Command: python3 lookup resolve '10.1016/j.chemolab.2021.104446'
```
Crossref: ratio 1.00: PARAFAC2 and local minima | Huiwen Yu, Rasmus Bro | 2021 | Chemometrics and Intelligent Laboratory Systems | vol 219 | pages 104446 | doi 10.1016/j.chemolab.2021.104446
OpenAlex: ratio 1.00: PARAFAC2 and local minima | Huiwen Yu, Rasmus Bro | 2021 | Chemometrics and Intelligent Laboratory Systems | vol 219 | pages 104446--104446 | doi 10.1016/j.chemolab.2021.104446 | OpenAlex W3209483728
Semantic Scholar: ratio 1.00: PARAFAC2 and local minima | Huiwen Yu, R. Bro | 2021 | Chemometrics and Intelligent Laboratory Systems | doi 10.1016/j.chemolab.2021.104446 | Semantic Scholar 848ee51beef8015f8339c003187cf2def1fea74e
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ren2023multipar
Command: python3 lookup resolve '2208.00993'
```
Crossref: not found
OpenAlex: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yifei Ren, Jian Lou, Xiong Li, Joyce C. Ho, Xiaoqian Jiang, Sivasubramanium Bhavan | 2022 | arXiv (Cornell University) | doi 10.48550/arxiv.2208.00993 | arXiv 2208.00993 | OpenAlex W4289597181 | open access https://arxiv.org/pdf/2208.00993
Semantic Scholar: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yi-Fei Ren, Jian Lou, Li Xiong, Joyce Ho, Xiaoqian Jiang, S. Bhavani | 2022 | arXiv.org | vol abs/2208.00993 | doi 10.48550/arXiv.2208.00993 | arXiv 2208.00993 | Semantic Scholar e8aa9a0fe21c23d18c872475a1f92ef9ab7cd4b7 | open access http://arxiv.org/pdf/2208.00993
arXiv: ratio 1.00: MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning | Yifei Ren, Jian Lou, Li Xiong, Joyce C Ho, Xiaoqian Jiang, Sivasubramanium Bhavani | 2022 | arXiv 2208.00993
```
Exit status: 0

### patalano2026par2cox
Command: python3 lookup resolve '2609.23705'
```
Crossref: not found
OpenAlex: ratio 1.00: PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data | Mariafrancesca Patalano, Elif Konyar, Kamran Paynabar | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2609.23705 | arXiv 2609.23705 | OpenAlex W7214014480 | open access https://arxiv.org/pdf/2609.23705
Semantic Scholar: ratio 1.00: PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data | Mariafrancesca Patalano, Elif Konyar, K. Paynabar | 2026 | arXiv 2609.23705 | Semantic Scholar 771ea4ac7c2f53c12900ccbdcb94d3e2cb5711a7
arXiv: ratio 1.00: PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data | Mariafrancesca Patalano, Elif Konyar, Kamran Paynabar | 2026 | arXiv 2609.23705
```
Exit status: 0

### morup2008shift
Command: python3 lookup resolve '10.1016/j.neuroimage.2008.05.062'
```
Crossref: ratio 1.00: Shift-invariant multilinear decomposition of neuroimaging data | Morten M<latin small letter o with stroke>rup, Lars Kai Hansen, Sidse Marie Arnfred, Lek-Heng Lim, Kristoffer Hougaard Madsen | 2008 | NeuroImage | vol 42 | no 4 | pages 1439--1450 | doi 10.1016/j.neuroimage.2008.05.062
OpenAlex: ratio 1.00: Shift-invariant multilinear decomposition of neuroimaging data | Morten M<latin small letter o with stroke>rup, Lars Kai Hansen, Sidse Arnfred, Lek<hyphen>Heng Lim, Kristoffer Hougaard Madsen | 2008 | NeuroImage | vol 42 | no 4 | pages 1439--1450 | doi 10.1016/j.neuroimage.2008.05.062 | OpenAlex W2095141632 | open access http://eprints.drcmr.dk/29/1/Shift_invariant_decomp_2008.pdf
Semantic Scholar: ratio 1.00: Shift-invariant multilinear decomposition of neuroimaging data | M. M<latin small letter o with stroke>rup, L. Hansen, S. Arnfred, Lek-Heng Lim, Kristoffer Hougaard Madsen | 2008 | NeuroImage | vol 42 4 | pages 1439--50 | doi 10.1016/j.neuroimage.2008.05.062 | Semantic Scholar b63ce62e20b4afa7b377307783f58dde6748f8a7 | open access http://eprints.drcmr.dk/29/1/Shift_invariant_decomp_2008.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tang2019individualized
Command: python3 lookup resolve '10.1080/01621459.2019.1585254'
```
Crossref: ratio 1.00: Individualized Multilayer Tensor Learning With an Application in Imaging Analysis | Xiwei Tang, Xuan Bi, Annie Qu | 2019 | Journal of the American Statistical Association | vol 115 | no 530 | pages 836--851 | doi 10.1080/01621459.2019.1585254
OpenAlex: ratio 1.00: Individualized Multilayer Tensor Learning With an Application in Imaging Analysis | Xiwei Tang, Xuan Bi, Annie Qu | 2019 | Journal of the American Statistical Association | vol 115 | no 530 | pages 836--851 | doi 10.1080/01621459.2019.1585254 | OpenAlex W2924265785 | open access https://arxiv.org/pdf/1903.08871
Semantic Scholar: ratio 1.00: Individualized Multilayer Tensor Learning With an Application in Imaging Analysis | Xi-Wei Tang, Xuan Bi, An-Nie Qu | 2019 | Journal of the American Statistical Association | vol 115 | pages 836--851 | doi 10.1080/01621459.2019.1585254 | arXiv 1903.08871 | Semantic Scholar 1c9a457259329e7a948542ae285794228f559ffa | open access https://arxiv.org/pdf/1903.08871
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### mcleod2018cardiac
Command: python3 lookup resolve '10.1109/tbme.2018.2816519'
```
Crossref: ratio 1.00: Cardiac Motion Evolution Model for Analysis of Functional Changes Using Tensor Decomposition and Cross-Sectional Data | Kristin McLeod, Kristin Tondel, Lilian Calvet, Maxime Sermesant, Xavier Pennec | 2018 | IEEE Transactions on Biomedical Engineering | vol 65 | no 12 | pages 2769--2780 | doi 10.1109/tbme.2018.2816519
OpenAlex: ratio 1.00: Cardiac Motion Evolution Model for Analysis of Functional Changes Using Tensor Decomposition and Cross-Sectional Data | Kristin McLeod, Kristin T<latin small letter o with stroke>ndel, Lilian Calvet, Maxime Sermesant, Xavier Pennec | 2018 | IEEE Transactions on Biomedical Engineering | vol 65 | no 12 | pages 2769--2780 | doi 10.1109/tbme.2018.2816519 | OpenAlex W2898333304 | open access https://inria.hal.science/hal-01736454v1/file/TBME2816519.pdf
Semantic Scholar: ratio 1.00: Cardiac Motion Evolution Model for Analysis of Functional Changes Using Tensor Decomposition and Cross-Sectional Data | K. Mcleod, Kristin T<latin small letter o with stroke>ndel, Lilian Calvet, Maxime Sermesant, X. Pennec | 2018 | IEEE Transactions on Biomedical Engineering | vol 65 | pages 2769--2780 | doi 10.1109/TBME.2018.2816519 | Semantic Scholar 733ee2c05c170b8cf66ba744efc8425403b4bfcd | open access https://inria.hal.science/hal-01736454v1/file/TBME2816519.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kralik2026identifying
Command: python3 lookup resolve '10.64898/2026.11.12.766278'
```
Crossref: ratio 1.00: Identifying aligned tensor decompositions across heterogeneous neural datasets | Mikl<latin small letter o with acute>s Kr<latin small letter a with acute>lik, Sasha Tinelli, James Kozloski, Rui Ponte Costa, Andrew Sharott, Robert L. Peach | 2026 | doi 10.64898/2026.11.12.766278
OpenAlex: ratio 1.00: Identifying aligned tensor decompositions across heterogeneous neural datasets | Mikl<latin small letter o with acute>s Andr<latin small letter a with acute>s Kr<latin small letter a with acute>lik, Sasha Tinelli, James Kozloski, Rui Ponte Costa, Andrew Sharott, Robert L. Peach | 2026 | bioRxiv (Cold Spring Harbor Laboratory) | doi 10.64898/2026.11.12.766278 | OpenAlex W7226007733 | open access https://www.biorxiv.org/content/biorxiv/early/2026/11/13/2026.11.12.766278.full.pdf
Semantic Scholar: ratio 1.00: Identifying aligned tensor decompositions across heterogeneous neural datasets | Mikl<latin small letter o with acute>s Kr<latin small letter a with acute>lik, Sasha Tinelli, J. Kozloski, Rui Ponte Costa, A. Sharott, R. Peach | 2026 | bioRxiv | doi 10.64898/2026.11.12.766278 | Semantic Scholar 05ed3766e7e6d5ee5b00e32c6ecbe3b1e6549ecd | open access https://www.biorxiv.org/content/biorxiv/early/2026/11/13/2026.11.12.766278.full.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### harshman1996uniqueness
Command: python3 lookup resolve '10.1007/bf02296963'
```
Crossref: ratio 1.00: Uniqueness Proof for a Family of Models Sharing Features of Tucker's Three-Mode Factor Analysis and PARAFAC/Candecomp | Richard A. Harshman, Margaret E. Lundy | 1996 | Psychometrika | vol 61 | no 1 | pages 133--154 | doi 10.1007/bf02296963
OpenAlex: ratio 1.00: Uniqueness Proof for a Family of Models Sharing Features of Tucker's Three-Mode Factor Analysis and PARAFAC/Candecomp | Richard A. Harshman, Margaret E. Lundy | 1996 | Psychometrika | vol 61 | no 1 | pages 133--154 | doi 10.1007/bf02296963 | OpenAlex W2101815756
Semantic Scholar: ratio 1.00: Uniqueness proof for a family of models sharing features of Tucker's three-mode factor analysis and PARAFAC/candecomp | R. Harshman, M. Lundy | 1996 | vol 61 | pages 133--154 | doi 10.1007/BF02296963 | Semantic Scholar e9ba1e7f1a6cb2d66b7baf5c25cbc355a408838f
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cuturi2013sinkhorn
Command: python3 lookup resolve '1306.0895'
```
Crossref: not found
OpenAlex: ratio 1.00: Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances | Marco Cuturi | 2013 | arXiv (Cornell University) | doi 10.48550/arxiv.1306.0895 | arXiv 1306.0895 | OpenAlex W1511358834 | open access https://arxiv.org/pdf/1306.0895
Semantic Scholar: ratio 0.89: Sinkhorn Distances: Lightspeed Computation of Optimal Transport | Marco Cuturi | 2013 | Neural Information Processing Systems | pages 2292--2300 | arXiv 1306.0895 | Semantic Scholar 0080118b0eb02af581ff32b85a1bb6aed7081f45
arXiv: ratio 1.00: Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances | Marco Cuturi | 2013 | arXiv 1306.0895
```
Exit status: 0

### peyre2019computational
Command: python3 lookup resolve '10.1561/2200000073'
```
Crossref: ratio 1.00: Computational Optimal Transport with Applications to Data Sciences | Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2019 | Foundations and Trends<registered sign> in Machine Learning | vol 11 | no 5-6 | pages 355--607 | doi 10.1561/2200000073
OpenAlex: ratio 1.00: Computational Optimal Transport with Applications to Data Sciences | Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2019 | Foundations and Trends<registered sign> in Machine Learning | vol 11 | no 5-6 | pages 355--607 | doi 10.1561/2200000073 | OpenAlex W3039256091
Semantic Scholar: DOI_MISMATCH, ratio 0.64: Computational Optimal Transport | G. Peyr<latin small letter e with acute>, Marco Cuturi | 2018 | Found. Trends Mach. Learn. | vol 11 | pages 355--607 | doi 10.1561/2200000073 | arXiv 1803.00567 | Semantic Scholar 8e51d68250db5637cd6bc1de98a99396441399b2 | open access https://arxiv.org/pdf/1803.00567
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### genevay2019sample
Command: python3 lookup resolve '1810.02733'
```
Crossref: not found
OpenAlex: ratio 1.00: Sample Complexity of Sinkhorn divergences | Aude Genevay, L<latin small letter e with acute>na<latin small letter i with diaeresis>c Chizat, Francis Bach, Marco Cuturi, Gabriel Peyr<latin small letter e with acute> | 2018 | arXiv (Cornell University) | doi 10.48550/arxiv.1810.02733 | arXiv 1810.02733 | OpenAlex W2895248218 | open access https://arxiv.org/pdf/1810.02733
Semantic Scholar: ratio 1.00: Sample Complexity of Sinkhorn Divergences | A. Genevay, L<latin small letter e with acute>na<latin small letter i with diaeresis>c Chizat, F. Bach, Marco Cuturi, G. Peyr<latin small letter e with acute> | 2018 | International Conference on Artificial Intelligence and Statistics | pages 1574--1583 | arXiv 1810.02733 | Semantic Scholar dd5e54b08b2c1520d179e88cd524e9bd4fe1f6ab
arXiv: ratio 1.00: Sample Complexity of Sinkhorn divergences | Aude Genevay, L<latin small letter e with acute>naic Chizat, Francis Bach, Marco Cuturi, Gabriel Peyr<latin small letter e with acute> | 2018 | arXiv 1810.02733
```
Exit status: 0

### benamou2015iterative
Command: python3 lookup resolve '10.1137/141000439'
```
Crossref: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | Jean-David Benamou, Guillaume Carlier, Marco Cuturi, Luca Nenna, Gabriel Peyr<latin small letter e with acute> | 2015 | SIAM Journal on Scientific Computing | vol 37 | no 2 | pages A1111--A1138 | doi 10.1137/141000439
OpenAlex: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | Jean<hyphen>David Benamou, Guillaume Carlier, Marco Cuturi, Luca Nenna, Gabriel Peyr<latin small letter e with acute> | 2015 | SIAM Journal on Scientific Computing | vol 37 | no 2 | pages A1111--A1138 | doi 10.1137/141000439 | OpenAlex W2036996178 | open access https://arxiv.org/pdf/1412.5154
Semantic Scholar: ratio 1.00: Iterative Bregman Projections for Regularized Transportation Problems | J. Benamou, G. Carlier, Marco Cuturi, Luca Nenna, G. Peyr<latin small letter e with acute> | 2014 | SIAM Journal on Scientific Computing | vol 37 | doi 10.1137/141000439 | arXiv 1412.5154 | Semantic Scholar d3831561301ef27a6ba0d3c68d30bdf0f27eef63 | open access https://arxiv.org/pdf/1412.5154
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### memoli2011gromov
Command: python3 lookup resolve '10.1007/s10208-011-9093-5'
```
Crossref: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | Facundo M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | vol 11 | no 4 | pages 417--487 | doi 10.1007/s10208-011-9093-5
OpenAlex: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | Facundo M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | vol 11 | no 4 | pages 417--487 | doi 10.1007/s10208-011-9093-5 | OpenAlex W2027842533
Semantic Scholar: ratio 1.00: Gromov<en dash>Wasserstein Distances and the Metric Approach to Object Matching | F. M<latin small letter e with acute>moli | 2011 | Foundations of Computational Mathematics | vol 11 | pages 417--487 | doi 10.1007/s10208-011-9093-5 | Semantic Scholar 03a4f1c1975237a5e1e501dd26811b4ce55a35a9
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### peyre2016gromov
No DOI and no arXiv ID; url: https://proceedings.mlr.press/v48/peyre16.html. Checked by WebFetch of the url (recorded below by the session).

### vayer2019optimal
Command: python3 lookup resolve '1805.09114'
```
Crossref: not found
OpenAlex: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, La<latin small letter e with diaeresis>titia Chapel, R<latin small letter e with acute>mi Flamary, Romain Tavenard, Nicolas Courty | 2018 | HAL | pages 1--16 | doi 10.48550/arxiv.1805.09114 | arXiv 1805.09114 | OpenAlex W2911397097 | open access http://arxiv.org/pdf/1805.09114
Semantic Scholar: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, L. Chapel, R<latin small letter e with acute>mi Flamary, R. Tavenard, N. Courty | 2018 | International Conference on Machine Learning | pages 6275--6284 | arXiv 1805.09114 | Semantic Scholar 6f9de3cd77ac32ce00da3ba6b71e2360b5b2a81c
arXiv: ratio 1.00: Optimal Transport for structured data with application on graphs | Titouan Vayer, Laetitia Chapel, R<latin small letter e with acute>mi Flamary, Romain Tavenard, Nicolas Courty | 2018 | arXiv 1805.09114
```
Exit status: 0

### sejourne2021unbalanced
Command: python3 lookup resolve '2009.04266'
```
Crossref: not found
OpenAlex: ratio 1.00: The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation | Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois<hyphen>Xavier Vialard, Gabriel Peyr<latin small letter e with acute> | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2009.04266 | arXiv 2009.04266 | OpenAlex W3084165997 | open access https://arxiv.org/pdf/2009.04266
Semantic Scholar: ratio 1.00: The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation | Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, G. Peyr<latin small letter e with acute> | 2020 | Neural Information Processing Systems | pages 8766--8779 | arXiv 2009.04266 | Semantic Scholar a772118cb42eaa6648a435db201cf9b2090b4648
arXiv: ratio 1.00: The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation | Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, Gabriel Peyr<latin small letter e with acute> | 2020 | arXiv 2009.04266
```
Exit status: 0

### scetbon2022linear
Command: python3 lookup resolve '2106.01128'
```
Crossref: not found
OpenAlex: ratio 1.00: Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs | Meyer Scetbon, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2106.01128 | arXiv 2106.01128 | OpenAlex W3169502490 | open access https://arxiv.org/pdf/2106.01128
Semantic Scholar: ratio 1.00: Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs | Meyer Scetbon, G. Peyr<latin small letter e with acute>, Marco Cuturi | 2021 | International Conference on Machine Learning | pages 19347--19365 | doi 10.48550/arXiv.2106.01128 | arXiv 2106.01128 | Semantic Scholar f54fd960e51f27f3484546eb84c481c4c055b882 | open access http://arxiv.org/pdf/2106.01128
arXiv: ratio 1.00: Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs | Meyer Scetbon, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2021 | arXiv 2106.01128
```
Exit status: 0

### rioux2024entropic
Command: python3 lookup resolve '2306.00182'
```
Crossref: not found
OpenAlex: ratio 1.00: Entropic Gromov-Wasserstein Distances: Stability and Algorithms | Gabriel Rioux, Ziv Goldfeld, Kengo Kato | 2023 | arXiv (Cornell University) | doi 10.48550/arxiv.2306.00182 | arXiv 2306.00182 | OpenAlex W4379251962 | open access https://arxiv.org/pdf/2306.00182
Semantic Scholar: ratio 0.79: Entropic Gromov-Wasserstein Distances: Stability, Algorithms, and Distributional Limits | G. Rioux, Ziv Goldfeld, Kengo Kato | 2023 | arXiv 2306.00182 | Semantic Scholar d0026df4c83798d4945781b521db15165aaf4a06
arXiv: ratio 1.00: Entropic Gromov-Wasserstein Distances: Stability and Algorithms | Gabriel Rioux, Ziv Goldfeld, Kengo Kato | 2023 | arXiv 2306.00182
```
Exit status: 0

### agueh2011barycenters
Command: python3 lookup resolve '10.1137/100805741'
```
Crossref: ratio 1.00: Barycenters in the Wasserstein Space | Martial Agueh, Guillaume Carlier | 2011 | SIAM Journal on Mathematical Analysis | vol 43 | no 2 | pages 904--924 | doi 10.1137/100805741
OpenAlex: ratio 1.00: Barycenters in the Wasserstein Space | Martial Agueh, Guillaume Carlier | 2011 | SIAM Journal on Mathematical Analysis | vol 43 | no 2 | pages 904--924 | doi 10.1137/100805741 | OpenAlex W1968333723 | open access https://hal.archives-ouvertes.fr/hal-00637399/document
Semantic Scholar: ratio 1.00: Barycenters in the Wasserstein Space | M. Agueh, G. Carlier | 2011 | SIAM Journal on Mathematical Analysis | vol 43 | pages 904--924 | doi 10.1137/100805741 | Semantic Scholar 751ee5e11cb826a315d8737f6a5f34423d95fae9 | open access https://hal.archives-ouvertes.fr/hal-00637399/document
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cuturi2014fast
Command: python3 lookup resolve '1310.4375'
```
Crossref: not found
OpenAlex: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, Arnaud Doucet | 2013 | Oxford University Research Archive (ORA) (University of Oxford) | pages 685--693 | doi 10.48550/arxiv.1310.4375 | arXiv 1310.4375 | OpenAlex W1629559917 | open access https://ora.ox.ac.uk/objects/uuid:176f66e9-3fef-4847-b638-ace71b630ec5/files/mc3fe93fd63587cb3242319d64cbb87a5
Semantic Scholar: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, A. Doucet | 2013 | International Conference on Machine Learning | pages 685--693 | arXiv 1310.4375 | Semantic Scholar c697fd0b73ec7aaeb2e75cb89cf4b8b020dd9556
arXiv: ratio 1.00: Fast Computation of Wasserstein Barycenters | Marco Cuturi, Arnaud Doucet | 2013 | arXiv 1310.4375
```
Exit status: 0

### janati2020debiased
Command: python3 lookup resolve '2006.02575'
```
Crossref: not found
OpenAlex: ratio 1.00: Debiased Sinkhorn barycenters | Hicham Janati, Marco Cuturi, Alexandre Gramfort | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.02575 | arXiv 2006.02575 | OpenAlex W3033657060 | open access https://arxiv.org/pdf/2006.02575
Semantic Scholar: ratio 1.00: Debiased Sinkhorn barycenters | Hicham Janati, Marco Cuturi, Alexandre Gramfort | 2020 | International Conference on Machine Learning | vol abs/2006.02575 | doi 10.48550/arXiv.2006.02575 | arXiv 2006.02575 | Semantic Scholar 5b717940bc8d0010b300b40fe2f1b16fb0b9ec46
arXiv: ratio 1.00: Debiased Sinkhorn barycenters | Hicham Janati, Marco Cuturi, Alexandre Gramfort | 2020 | arXiv 2006.02575
```
Exit status: 0

### altschuler2022wasserstein
Command: python3 lookup resolve '10.1137/21M1390062'
```
Crossref: ratio 1.00: Wasserstein Barycenters Are NP-Hard to Compute | Jason M. Altschuler, Enric Boix-Adser<latin small letter a with grave> | 2022 | SIAM Journal on Mathematics of Data Science | vol 4 | no 1 | pages 179--203 | doi 10.1137/21m1390062
OpenAlex: ratio 1.00: Wasserstein Barycenters Are NP-Hard to Compute | Jason M. Altschuler, Enric Boix-Adser<latin small letter a with grave> | 2022 | SIAM Journal on Mathematics of Data Science | vol 4 | no 1 | pages 179--203 | doi 10.1137/21m1390062 | OpenAlex W3120790515 | open access https://arxiv.org/pdf/2101.01100
Semantic Scholar: ratio 1.00: Wasserstein barycenters are NP-hard to compute | Jason M. Altschuler, Enric Boix-Adser<latin small letter a with grave> | 2021 | SIAM Journal on Mathematics of Data Science | vol abs/2101.01100 | doi 10.1137/21M1390062 | arXiv 2101.01100 | Semantic Scholar 6e2fc220a6921c59f3e99c7cfc3b142b9939502c | open access https://arxiv.org/pdf/2101.01100
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### schmitz2018wasserstein
Command: python3 lookup resolve '10.1137/17M1140431'
```
Crossref: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning | Morgan A. Schmitz, Matthieu Heitz, Nicolas Bonneel, Fred Ngol<latin small letter e with grave>, David Coeurjolly, Marco Cuturi, Gabriel Peyr<latin small letter e with acute>, Jean-Luc Starck | 2018 | SIAM Journal on Imaging Sciences | vol 11 | no 1 | pages 643--678 | doi 10.1137/17m1140431
OpenAlex: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning | Morgan A. Schmitz, Matthieu Heitz, Nicolas Bonneel, Fred Ngol<latin small letter e with grave> Mboula, David C<latin small ligature oe>urjolly, Marco Cuturi, Gabriel Peyr<latin small letter e with acute>, Jean<hyphen>Luc Starck | 2018 | SIAM Journal on Imaging Sciences | vol 11 | no 1 | pages 643--678 | doi 10.1137/17m1140431 | OpenAlex W2744110160 | open access https://arxiv.org/pdf/1708.01955
Semantic Scholar: ratio 1.00: Wasserstein Dictionary Learning: Optimal Transport-based unsupervised non-linear dictionary learning | M. Schmitz, Matthieu Heitz, Nicolas Bonneel, Fred Ngol<latin small letter e with grave> Mboula, D. Coeurjolly, Marco Cuturi, G. Peyr<latin small letter e with acute>, Jean-Luc Starck | 2017 | SIAM Journal of Imaging Sciences | vol 11 | pages 643--678 | doi 10.1137/17M1140431 | arXiv 1708.01955 | Semantic Scholar fd3d9ad8cecbb201a1ca82338681c92ca6174839 | open access https://arxiv.org/pdf/1708.01955
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xu2020gromov
Command: python3 lookup resolve '10.1609/aaai.v34i04.6120'
```
Crossref: ratio 1.00: Gromov-Wasserstein Factorization Models for Graph Clustering | Hongtengl Xu | 2020 | Proceedings of the AAAI Conference on Artificial Intelligence | vol 34 | no 04 | pages 6478--6485 | doi 10.1609/aaai.v34i04.6120
OpenAlex: ratio 1.00: Gromov-Wasserstein Factorization Models for Graph Clustering | Hongtengl Xu | 2020 | Proceedings of the AAAI Conference on Artificial Intelligence | vol 34 | no 04 | pages 6478--6485 | doi 10.1609/aaai.v34i04.6120 | OpenAlex W2996858319 | open access https://doi.org/10.1609/aaai.v34i04.6120
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### vincentcuaz2021online
Command: python3 lookup resolve '2102.06555'
```
Crossref: not found
OpenAlex: ratio 1.00: Online Graph Dictionary Learning | C<latin small letter e with acute>dric Vincent-Cuaz, Titouan Vayer, R<latin small letter e with acute>mi Flamary, Marco Corneli, Nicolas Courty | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2102.06555 | arXiv 2102.06555 | OpenAlex W3131640093 | open access https://arxiv.org/pdf/2102.06555
Semantic Scholar: ratio 1.00: Online Graph Dictionary Learning | C<latin small letter e with acute>dric Vincent-Cuaz, Titouan Vayer, R<latin small letter e with acute>mi Flamary, M. Corneli, N. Courty | 2021 | International Conference on Machine Learning | vol abs/2102.06555 | doi 10.48550/arXiv.2102.06555 | arXiv 2102.06555 | Semantic Scholar 9e9017a874024e3f7d8ff5a3aff171afb52beccc
arXiv: ratio 1.00: Online Graph Dictionary Learning | C<latin small letter e with acute>dric Vincent-Cuaz, Titouan Vayer, R<latin small letter e with acute>mi Flamary, Marco Corneli, Nicolas Courty | 2021 | arXiv 2102.06555
```
Exit status: 0

### vincentcuaz2022template
Command: python3 lookup resolve '10.52202/068431-0857'
```
Crossref: ratio 1.00: Template Based Graph Neural Network with Optimal Transport Distances | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli, Titouan Vayer, Nicolas Courty | 2022 | Advances in Neural Information Processing Systems 35 | pages 11800--11814 | doi 10.52202/068431-0857
OpenAlex: ratio 1.00: Template Based Graph Neural Network with Optimal Transport Distances | C<latin small letter e with acute>dric Vincent-Cuaz, R<latin small letter e with acute>mi Flamary, Marco Corneli, Titouan Vayer, Nicolas Courty | 2022 | neural information processing systems | pages 11800--11814 | doi 10.52202/068431-0857 | OpenAlex W7133234998
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### brogatmotte2022learning
Command: python3 lookup resolve '2202.03813'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters | Luc Brogat-Motte, R<latin small letter e with acute>mi Flamary, C<latin small letter e with acute>line Brouard, Juho Rousu, Florence d<right single quotation mark>Alch<latin small letter e with acute><en dash>Buc | 2022 | arXiv (Cornell University) | vol 162 | doi 10.48550/arxiv.2202.03813 | arXiv 2202.03813 | OpenAlex W4221153250 | open access https://arxiv.org/pdf/2202.03813
Semantic Scholar: ratio 1.00: Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters | Luc Brogat-Motte, R<latin small letter e with acute>mi Flamary, C<latin small letter e with acute>line Brouard, Juho Rousu, Florence d'Alch<latin small letter e with acute>-Buc | 2022 | International Conference on Machine Learning | vol abs/2202.03813 | doi 10.48550/arXiv.2202.03813 | arXiv 2202.03813 | Semantic Scholar 1a9e5a6a4da5f882ef04f8bb936701220a642ec0 | open access https://arxiv.org/pdf/2202.03813
arXiv: ratio 1.00: Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters | Luc Brogat-Motte, R<latin small letter e with acute>mi Flamary, C<latin small letter e with acute>line Brouard, Juho Rousu, Florence d'Alch<latin small letter e with acute>-Buc | 2022 | arXiv 2202.03813
```
Exit status: 0

### mialon2021trainable
Command: python3 lookup resolve '2006.12065'
```
Crossref: not found
OpenAlex: ratio 1.00: A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, Dexiong Chen, Alexandre d<right single quotation mark>Aspremont, Julien Mairal | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.12065 | arXiv 2006.12065 | OpenAlex W3127760629 | open access https://arxiv.org/pdf/2006.12065
Semantic Scholar: ratio 0.89: An Optimal Transport Kernel for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, De-Xiong Chen, A. d'Aspremont, Julien Mairal | 2020 | arXiv.org | vol abs/2006.12065 | doi 10.48550/arXiv.2006.12065 | arXiv 2006.12065 | Semantic Scholar 74bc260a893479cdada738017037c7bde4283d45 | open access http://arxiv.org/pdf/2006.12065
arXiv: ratio 1.00: A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention | Gr<latin small letter e with acute>goire Mialon, Dexiong Chen, Alexandre d'Aspremont, Julien Mairal | 2020 | arXiv 2006.12065
```
Exit status: 0

### moosmuller2023linear
Command: python3 lookup resolve '10.1093/imaiai/iaac023'
```
Crossref: ratio 1.00: Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations | Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2022 | Information and Inference: A Journal of the IMA | vol 12 | no 1 | pages 363--389 | doi 10.1093/imaiai/iaac023
OpenAlex: ratio 1.00: Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations | Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2022 | Information and Inference A Journal of the IMA | vol 12 | no 1 | pages 363--389 | doi 10.1093/imaiai/iaac023 | OpenAlex W3165102544 | open access https://arxiv.org/pdf/2008.09165
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wang2025linearized
Command: python3 lookup resolve '2510.22033'
```
Crossref: not found
OpenAlex: ratio 1.00: Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | Wang, Tianxiang, Ke, Yingtong, Dhananjay Bhaskar, Krishnaswamy, Smita, Alexander Cloninger | 2025 | arXiv (Cornell University) | doi 10.48550/arxiv.2510.22033 | arXiv 2510.22033 | OpenAlex W7101579638 | open access https://arxiv.org/pdf/2510.22033
Semantic Scholar: ratio 1.00: Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | Tian-Xiang Wang, Yingtong Ke, Dhananjay Bhaskar, Smita Krishnaswamy, Alexander Cloninger | 2025 | arXiv.org | vol abs/2510.22033 | doi 10.48550/arXiv.2510.22033 | arXiv 2510.22033 | Semantic Scholar e0e8e29e4579991ec2c07a8baf7624de32135e77
arXiv: ratio 1.00: Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | Tianxiang Wang, Yingtong Ke, Dhananjay Bhaskar, Smita Krishnaswamy, Alexander Cloninger | 2025 | arXiv 2510.22033
```
Exit status: 0

### gramfort2015fast
Command: python3 lookup resolve '10.1007/978-3-319-19992-4_20'
```
Crossref: ratio 1.00: Fast Optimal Transport Averaging of Neuroimaging Data | A. Gramfort, G. Peyr<latin small letter e with acute>, M. Cuturi | 2015 | Lecture Notes in Computer Science | pages 261--272 | doi 10.1007/978-3-319-19992-4_20
OpenAlex: ratio 1.00: Fast Optimal Transport Averaging of Neuroimaging Data | Alexandre Gramfort, Gabriel Peyr<latin small letter e with acute>, Marco Cuturi | 2015 | Lecture notes in computer science | vol 24 | pages 261--272 | doi 10.1007/978-3-319-19992-4_20 | OpenAlex W2111725927 | open access https://arxiv.org/pdf/1503.08596
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bazeille2019local
Command: python3 lookup resolve '10.1007/978-3-030-20351-1_18'
```
Crossref: ratio 1.00: Local Optimal Transport for Functional Brain Template Estimation | T. Bazeille, H. Richard, H. Janati, B. Thirion | 2019 | Lecture Notes in Computer Science | pages 237--248 | doi 10.1007/978-3-030-20351-1_18
OpenAlex: ratio 1.00: Local Optimal Transport for Functional Brain Template Estimation | Thomas Bazeille, H. Richard, Hicham Janati, Bertrand Thirion | 2019 | Lecture notes in computer science | pages 237--248 | doi 10.1007/978-3-030-20351-1_18 | OpenAlex W2946207497 | open access https://hal.archives-ouvertes.fr/hal-02278663/file/Local_optimal_transport_for_functional_brain_template_estimation.pdf
Semantic Scholar: ratio 1.00: Local Optimal Transport for Functional Brain Template Estimation | Thomas Bazeille, Hugo Richard, Hicham Janati, B. Thirion | 2019 | Information Processing in Medical Imaging | pages 237--248 | doi 10.1007/978-3-030-20351-1_18 | Semantic Scholar d74eab8206cafbbc10ff4fb1ad038f81c2f1a0ec | open access https://hal.archives-ouvertes.fr/hal-02278663/file/Local_optimal_transport_for_functional_brain_template_estimation.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### thual2022aligning
Command: python3 lookup resolve '10.52202/068431-1584'
```
Crossref: ratio 1.00: Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein | Alexis Thual, Quang Huy Tran, Tatiana Zemskova, Nicolas Courty, R<latin small letter e with acute>mi Flamary, Stanislas Dehaene, Bertrand Thirion | 2022 | Advances in Neural Information Processing Systems 35 | pages 21792--21804 | doi 10.52202/068431-1584
OpenAlex: ratio 1.00: Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein | Alexis Thual, Quang Huy Tran, Tatiana Zemskova, Nicolas Courty, R<latin small letter e with acute>mi Flamary, Stanislas Dehaene, Bertrand Thirion | 2022 | neural information processing systems | pages 21792--21804 | doi 10.52202/068431-1584 | OpenAlex W7133227349
Semantic Scholar: ratio 1.00: Aligning individual brains with fused unbalanced Gromov Wasserstein | Alexis Thual, Quang-Huy Tran, <cyrillic capital letter te>. <cyrillic capital letter pe>. <cyrillic capital letter ze><cyrillic small letter ie><cyrillic small letter em><cyrillic small letter es><cyrillic small letter ka><cyrillic small letter o><cyrillic small letter ve><cyrillic small letter a>, N. Courty, R<latin small letter e with acute>mi Flamary, S. Dehaene, B. Thirion | 2022 | Neural Information Processing Systems | doi 10.52202/068431-1584 | arXiv 2206.09398 | Semantic Scholar d67dcbf457ce55336f5c6c5c4c996ca3fda0d477
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bazeille2021empirical
Command: python3 lookup resolve '10.1016/j.neuroimage.2021.118683'
```
Crossref: ratio 1.00: An empirical evaluation of functional alignment using inter-subject decoding | Thomas Bazeille, Elizabeth DuPre, Hugo Richard, Jean-Baptiste Poline, Bertrand Thirion | 2021 | NeuroImage | vol 245 | pages 118683 | doi 10.1016/j.neuroimage.2021.118683
OpenAlex: ratio 1.00: An empirical evaluation of functional alignment using inter-subject decoding | Thomas Bazeille, Elizabeth DuPr<latin small letter e with acute>, Hugo Richard, Jean<hyphen>Baptiste Poline, Bertrand Thirion | 2021 | NeuroImage | vol 245 | pages 118683--118683 | doi 10.1016/j.neuroimage.2021.118683 | OpenAlex W3208323570 | open access https://www.sciencedirect.com/science/article/pii/S1053811921009563/pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### su2015shape
Command: python3 lookup resolve '10.1007/978-3-319-19992-4_32'
```
Crossref: ratio 1.00: Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis | Zhengyu Su, Wei Zeng, Yalin Wang, Zhong-Lin Lu, Xianfeng Gu | 2015 | Lecture Notes in Computer Science | pages 411--423 | doi 10.1007/978-3-319-19992-4_32
OpenAlex: ratio 1.00: Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis | Zhengyu Su, Wei Zeng, Yalin Wang, Zhong<hyphen>Lin Lu, Xianfeng David Gu | 2015 | Lecture notes in computer science | vol 24 | pages 411--423 | doi 10.1007/978-3-319-19992-4_32 | OpenAlex W1919720529 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4527322
Semantic Scholar: ratio 1.00: Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis | Zhengyu Su, W. Zeng, Y. Wang, Zhong-Lin Lu, X. Gu | 2015 | Information Processing in Medical Imaging | vol 24 | pages 411--423 | doi 10.1007/978-3-319-19992-4_32 | Semantic Scholar b2ef0bf744cddba8fa7008fbc7818f845966cca7 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4527322
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kundu2020enabling
Command: python3 lookup resolve '10.1073/pnas.1917405117'
```
Crossref: ratio 1.00: Enabling early detection of osteoarthritis from presymptomatic cartilage texture maps via transport-based learning | Shinjini Kundu, Beth G. Ashinsky, Mustapha Bouhrara, Erik B. Dam, Shadpour Demehri, Mohammad Shifat-E-Rabbi, Richard G. Spencer, Kenneth L. Urish, Gustavo K. Rohde | 2020 | Proceedings of the National Academy of Sciences | vol 117 | no 40 | pages 24709--24719 | doi 10.1073/pnas.1917405117
OpenAlex: ratio 1.00: Enabling early detection of osteoarthritis from presymptomatic cartilage texture maps via transport-based learning | Shinjini Kundu, Beth G. Ashinsky, Mustapha Bouhrara, Erik B. Dam, Shadpour Demehri, Mohammad Shifat<hyphen>E<hyphen>Rabbi, Richard G. S. Spencer, Kenneth L. Urish, Gustavo Kunde Rohde | 2020 | Proceedings of the National Academy of Sciences | vol 117 | no 40 | pages 24709--24719 | doi 10.1073/pnas.1917405117 | OpenAlex W3087326040 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7547154/
Semantic Scholar: ratio 1.00: Enabling early detection of osteoarthritis from presymptomatic cartilage texture maps via transport-based learning | Shinjini Kundu, B. Ashinsky, M. Bouhrara, E. Dam, S. Demehri, Mohammad Shifat-E.-Rabbi, R. Spencer, K. Urish, G. Rohde | 2020 | Proceedings of the National Academy of Sciences of the United States of America | vol 117 | pages 24709--24719 | doi 10.1073/pnas.1917405117 | Semantic Scholar 7b2bd3768f328cff5664e48b4b13be3fc67211c9 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7547154/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gong2026robust
Command: python3 lookup resolve '10.3389/fonc.2025.1700447'
```
Crossref: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Hanying Gong, Jie Luo, Shufan Mao, Yanchen Gong, Yu Lu, Jian Ding, Xiang Zhu | 2026 | Frontiers in Oncology | vol 15 | doi 10.3389/fonc.2025.1700447
OpenAlex: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Hanying Gong, Jun Luo, Shufan Mao, Yanchen Gong, Yu Lu, Jian Ding, Xiang Zhu | 2026 | Frontiers in Oncology | vol 15 | pages 1700447--1700447 | doi 10.3389/fonc.2025.1700447 | OpenAlex W7126042104 | open access https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1700447/pdf
Semantic Scholar: ratio 1.00: Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence | Han-Ying Gong, Jie Luo, Shufan Mao, Yanan Gong, Yu Lu, Jian Ding, Xiang Zhu | 2026 | Frontiers in Oncology | vol 15 | doi 10.3389/fonc.2025.1700447 | Semantic Scholar 6a61c6836e5159c5e80d457fa948bd2ab017feb3 | open access https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1700447/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### mazelet2026learning
Command: python3 lookup resolve '2605.20883'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2605.20883 | arXiv 2605.20883 | OpenAlex W7161973664 | open access https://arxiv.org/pdf/2605.20883
Semantic Scholar: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv.org | vol abs/2605.20883 | doi 10.48550/arXiv.2605.20883 | arXiv 2605.20883 | Semantic Scholar 932daed15a6e652d64deee16cde7602386c7e063
arXiv: ratio 1.00: Learning fMRI activations dictionaries across individual geometries via optimal transport | Sonia Mazelet, R<latin small letter e with acute>mi Flamary, Bertrand Thirion | 2026 | arXiv 2605.20883
```
Exit status: 0

### belkhatir2022wasserstein
Command: python3 lookup resolve '10.1016/j.compmedimag.2022.102129'
```
Crossref: ratio 1.00: Wasserstein-based texture analysis in radiomic studies | Zehor Belkhatir, Ra<latin small letter u with acute>l San Jos<latin small letter e with acute> Est<latin small letter e with acute>par, Allen R. Tannenbaum | 2022 | Computerized Medical Imaging and Graphics | vol 102 | pages 102129 | doi 10.1016/j.compmedimag.2022.102129
OpenAlex: ratio 1.00: Wasserstein-based texture analysis in radiomic studies | Zehor Belkhatir, Ra<latin small letter u with acute>l San Jo<latin small letter s with acute>e Est<latin small letter e with acute>par, Allen Tannenbaum | 2022 | Computerized Medical Imaging and Graphics | vol 102 | pages 102129--102129 | doi 10.1016/j.compmedimag.2022.102129 | OpenAlex W4306767793 | open access https://www.sciencedirect.com/science/article/pii/S0895611122000994/pdf
Semantic Scholar: ratio 1.00: Wasserstein-based texture analysis in radiomic studies | Z. Belkhatir, Ra<latin small letter u with acute>l San Jos<latin small letter e with acute> Est<latin small letter e with acute>par, A. Tannenbaum | 2022 | Comput. Medical Imaging Graph. | vol 102 | pages 102129 | doi 10.1016/j.compmedimag.2022.102129 | Semantic Scholar 6371fe7d39af4b20ccc6e76fad7448a7ebded86d | open access https://www.sciencedirect.com/science/article/pii/S0895611122000994/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### barbarant2026functional
Command: python3 lookup resolve '10.64898/2026.05.21.726781'
```
Crossref: ratio 1.00: Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders | Pierre-Louis Barbarant, Florent Meyniel, Bertrand Thirion | 2026 | doi 10.64898/2026.05.21.726781
OpenAlex: ratio 1.00: Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders | Pierre-Louis Barbarant, Florent Meyniel, Bertrand Thirion | 2026 | bioRxiv (Cold Spring Harbor Laboratory) | doi 10.64898/2026.05.21.726781 | OpenAlex W7162393221 | open access https://doi.org/10.64898/2026.05.21.726781
Semantic Scholar: ratio 1.00: Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders | Pierre-Louis Barbarant, F. Meyniel, Bertrand Thirion | 2026 | bioRxiv | doi 10.64898/2026.05.21.726781 | Semantic Scholar a7be9d88b1f97a6f7b7df169d4a269bde4ff7811 | open access https://doi.org/10.64898/2026.05.21.726781
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### mi2017optimal
Command: python3 lookup resolve '10.1109/ICCV.2017.29'
```
Crossref: ratio 1.00: An Optimal Transportation Based Univariate Neuroimaging Index | Liang Mi, Wen Zhang, Junwei Zhang, Yonghui Fan, Dhruman Goradia, Kewei Chen, Eric M. Reiman, Xianfeng Gu, Yalin Wang | 2017 | 2017 IEEE International Conference on Computer Vision (ICCV) | pages 182--191 | doi 10.1109/iccv.2017.29
OpenAlex: ratio 1.00: An Optimal Transportation Based Univariate Neuroimaging Index | Liang Mi, Wen Zhang, Junwei Zhang, Yonghui Fan, Dhruman D. Goradia, Kewei Chen, Eric M. Reiman, Xianfeng David Gu, Yalin Wang | 2017 | IEEE/CVF International Conference on Computer Vision (ICCV) | vol 2017 | pages 182--191 | doi 10.1109/iccv.2017.29 | OpenAlex W2779794151 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/5719504
Semantic Scholar: ratio 1.00: An Optimal Transportation based Univariate Neuroimaging Index | Liang Mi, Wen Zhang, Junwei Zhang, Yonghui Fan, Dhruman D. Goradia, K. Chen, E. Reiman, X. Gu, Y. Wang | 2017 | IEEE International Conference on Computer Vision | vol 2017 | pages 182--191 | doi 10.1109/ICCV.2017.29 | Semantic Scholar e2b05f3cf4b2238175eaef2ef464c360ee9bbbba | open access https://www.ncbi.nlm.nih.gov/pmc/articles/5719504
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gerber2018exploratory
Command: python3 lookup resolve '10.1007/978-3-030-00931-1_53'
```
Crossref: ratio 1.00: Exploratory Population Analysis with Unbalanced Optimal Transport | Samuel Gerber, Marc Niethammer, Martin Styner, Stephen Aylward | 2018 | Lecture Notes in Computer Science | pages 464--472 | doi 10.1007/978-3-030-00931-1_53
OpenAlex: ratio 1.00: Exploratory Population Analysis with Unbalanced Optimal Transport | Samuel Gerber, Marc Niethammer, Martin Andreas Styner, Stephen Aylward | 2018 | Lecture notes in computer science | vol 11072 | pages 464--472 | doi 10.1007/978-3-030-00931-1_53 | OpenAlex W2891515476 | open access https://link.springer.com/content/pdf/10.1007/978-3-030-00931-1_53.pdf
Semantic Scholar: ratio 1.00: Exploratory Population Analysis with Unbalanced Optimal Transport | Samuel Gerber, M. Niethammer, M. Styner, S. Aylward | 2018 | International Conference on Medical Image Computing and Computer-Assisted Intervention | vol 11072 | pages 464--472 | doi 10.1007/978-3-030-00931-1_53 | Semantic Scholar c6a3d4e4b42d25e1a3008b5f8c7e439b404b886a | open access https://link.springer.com/content/pdf/10.1007/978-3-030-00931-1_53.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zaheer2017deep
Command: python3 lookup resolve '1703.06114'
```
Crossref: not found
OpenAlex: ratio 1.00: Deep Sets | Manzil Zaheer, Satwik Kottur, Siamak Ravanbakhsh, Barnab<latin small letter a with acute>s P<latin small letter o with acute>czos, Ruslan Salakhutdinov, Alexander Johannes Smola | 2017 | arXiv (Cornell University) | doi 10.48550/arxiv.1703.06114 | arXiv 1703.06114 | OpenAlex W4299457904 | open access https://arxiv.org/pdf/1703.06114
Semantic Scholar: ratio 1.00: Deep Sets | M. Zaheer, S. Kottur, Siamak Ravanbakhsh, B. P<latin small letter o with acute>czos, R. Salakhutdinov, Alex Smola | 2017 | arXiv 1703.06114 | Semantic Scholar de4edcddc028b0088f7ee44ae6e4be261f20b6f6
arXiv: ratio 1.00: Deep Sets | Manzil Zaheer, Satwik Kottur, Siamak Ravanbakhsh, Barnabas Poczos, Ruslan Salakhutdinov, Alexander Smola | 2017 | arXiv 1703.06114
```
Exit status: 0

### lee2019set
Command: python3 lookup resolve '1810.00825'
```
Crossref: not found
OpenAlex: ratio 1.00: Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks | Juho Lee, Yoonho Lee, Jungtaek Kim, Adam R. Kosiorek, Seungjin Choi, Yee Whye Teh | 2018 | Oxford University Research Archive (ORA) (University of Oxford) | doi 10.48550/arxiv.1810.00825 | arXiv 1810.00825 | OpenAlex W2894384847 | open access https://ora.ox.ac.uk/objects/uuid:8aa5f831-66b2-46ca-89ea-7b2384064db3/files/s8k71nh51g
Semantic Scholar: DOI_MISMATCH, ratio 0.31: Set Transformer | Juho Lee, Yoonho Lee, Jungtaek Kim, Adam R. Kosiorek, Seung-Jin Choi, Y. Teh | 2018 | International Conference on Machine Learning | vol abs/1810.00825 | doi 10.48550/arXiv.1810.00825 | arXiv 1810.00825 | Semantic Scholar 512b8ef0002e0bfd0ecb5ab17d533c1762eb9786
arXiv: ratio 1.00: Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks | Juho Lee, Yoonho Lee, Jungtaek Kim, Adam R. Kosiorek, Seungjin Choi, Yee Whye Teh | 2018 | arXiv 1810.00825
```
Exit status: 0

### murphy2019janossy
Command: python3 lookup resolve '1811.01900'
```
Crossref: not found
OpenAlex: ratio 1.00: Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs | Ryan L. Murphy, Balasubramaniam Srinivasan, Vinayak Rao, Bruno Ribeiro | 2018 | arXiv (Cornell University) | doi 10.48550/arxiv.1811.01900 | arXiv 1811.01900 | OpenAlex W2899038170 | open access https://arxiv.org/pdf/1811.01900
Semantic Scholar: ratio 1.00: Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs | R. Murphy, Balasubramaniam Srinivasan, Vinayak A. Rao, Bruno Ribeiro | 2018 | International Conference on Learning Representations | vol abs/1811.01900 | doi 10.48550/arXiv.1811.01900 | arXiv 1811.01900 | Semantic Scholar de9550945b2f631c541c299114a770c4f47f9616 | open access http://arxiv.org/pdf/1811.01900
arXiv: ratio 1.00: Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs | Ryan L. Murphy, Balasubramaniam Srinivasan, Vinayak Rao, Bruno Ribeiro | 2018 | arXiv 1811.01900
```
Exit status: 0

### amir2023neural
Command: python3 lookup resolve '10.52202/075280-1845'
```
Crossref: ratio 1.00: Neural Injective Functions for Multisets, Measures and Graphs via a Finite Witness Theorem | Tal Amir, Steven Gortler, Ilai Avni, Ravina Ravina, Nadav Dym | 2023 | Advances in Neural Information Processing Systems 36 | pages 42516--42551 | doi 10.52202/075280-1845
OpenAlex: ratio 1.00: Neural Injective Functions for Multisets, Measures and Graphs via a Finite Witness Theorem | Tal Amir, Steven Gortler, Ilai Avni, Ravina Ravina, Nadav Dym | 2023 | neural information processing systems | pages 42516--42551 | doi 10.52202/075280-1845 | OpenAlex W7133227055 | open access https://arxiv.org/pdf/2306.06529
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wang2024polynomial
Command: python3 lookup resolve '2307.04001'
```
Crossref: not found
OpenAlex: ratio 1.00: Polynomial Width is Sufficient for Set Representation with High-dimensional Features | Peihao Wang, Shenghao Yang, Shu Li, Zhangyang Wang, Li, Pan | 2023 | International Conference on Learning Representations | doi 10.48550/arxiv.2307.04001 | arXiv 2307.04001 | OpenAlex W4383987642 | open access https://proceedings.iclr.cc/paper_files/paper/2024/hash/e55b33430e344a1ee23710415b1c9d87-Abstract-Conference.html
Semantic Scholar: ratio 1.00: Polynomial Width is Sufficient for Set Representation with High-dimensional Features | Pei-Hao Wang, Sheng-Hao Yang, Shu Li, Zhang-Yang Wang, Pan Li | 2023 | International Conference on Learning Representations | vol abs/2307.04001 | doi 10.48550/arXiv.2307.04001 | arXiv 2307.04001 | Semantic Scholar 2d401d97bec4b6871fa4bcfef385107b5e27bb30 | open access https://arxiv.org/pdf/2307.04001
arXiv: ratio 1.00: Polynomial Width is Sufficient for Set Representation with High-dimensional Features | Peihao Wang, Shenghao Yang, Shu Li, Zhangyang Wang, Pan Li | 2023 | arXiv 2307.04001
```
Exit status: 0

### qi2017pointnet
Command: python3 lookup resolve '10.1109/CVPR.2017.16'
```
Crossref: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | R. Qi Charles, Hao Su, Mo Kaichun, Leonidas J. Guibas | 2017 | 2017 IEEE Conference on Computer Vision and Pattern Recognition (CVPR) | pages 77--85 | doi 10.1109/cvpr.2017.16
OpenAlex: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | Raffaelli Charles, Hao Su, Kaichun Mo, Leonidas J. Guibas | 2017 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | pages 77--85 | doi 10.1109/cvpr.2017.16 | OpenAlex W2560609797
Semantic Scholar: ratio 1.00: PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation | R. Q. Charles, Hao Su, K. Mo, L. Guibas | 2016 | Computer Vision and Pattern Recognition | pages 77--85 | doi 10.1109/CVPR.2017.16 | arXiv 1612.00593 | Semantic Scholar d997beefc0922d97202789d2ac307c55c2c52fba
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### qi2017pointnetpp
Command: python3 lookup resolve '1706.02413'
```
Crossref: not found
OpenAlex: ratio 1.00: PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space | Charles R. Qi, Li Yi, Hao Su, Leonidas J. Guibas | 2017 | arXiv (Cornell University) | doi 10.48550/arxiv.1706.02413 | arXiv 1706.02413 | OpenAlex W2624503621 | open access https://arxiv.org/pdf/1706.02413
Semantic Scholar: ratio 1.00: PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space | C. Qi, L. Yi, Hao Su, L. Guibas | 2017 | Neural Information Processing Systems | pages 5099--5108 | doi 10.48550/arXiv.1706.02413 | arXiv 1706.02413 | Semantic Scholar 8674494bd7a076286b905912d26d47f7501c4046
arXiv: ratio 1.00: PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space | Charles R. Qi, Li Yi, Hao Su, Leonidas J. Guibas | 2017 | arXiv 1706.02413
```
Exit status: 0

### wang2019dynamic
Command: python3 lookup resolve '10.1145/3326362'
```
Crossref: ratio 1.00: Dynamic Graph CNN for Learning on Point Clouds | Yue Wang, Yongbin Sun, Ziwei Liu, Sanjay E. Sarma, Michael M. Bronstein, Justin M. Solomon | 2019 | ACM Transactions on Graphics | vol 38 | no 5 | pages 1--12 | doi 10.1145/3326362
OpenAlex: ratio 1.00: Dynamic Graph CNN for Learning on Point Clouds | Yue Wang, Yongbin Sun, Ziwei Liu, Sanjay Emani Sarma, Michael M. Bronstein, Justin Solomon | 2019 | ACM Transactions on Graphics | vol 38 | no 5 | pages 1--12 | doi 10.1145/3326362 | OpenAlex W2979750740 | open access https://dl.acm.org/doi/pdf/10.1145/3326362
Semantic Scholar: ratio 1.00: Dynamic Graph CNN for Learning on Point Clouds | Yue Wang, Yongbin Sun, Zi-Wei Liu, S. Sarma, M. Bronstein, J. Solomon | 2018 | ACM Transactions on Graphics | vol 38 | pages 1--12 | doi 10.1145/3326362 | arXiv 1801.07829 | Semantic Scholar e1799aaf23c12af6932dc0ef3dfb1638f01413d1 | open access https://dl.acm.org/doi/pdf/10.1145/3326362
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhao2021point
Command: python3 lookup resolve '10.1109/ICCV48922.2021.01595'
```
Crossref: ratio 1.00: Point Transformer | Hengshuang Zhao, Li Jiang, Jiaya Jia, Philip Torr, Vladlen Koltun | 2021 | 2021 IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16239--16248 | doi 10.1109/iccv48922.2021.01595
OpenAlex: ratio 1.00: Point Transformer | Hengshuang Zhao, Li Jiang, Jiaya Jia, Philip H. S. Torr, Vladlen Koltun | 2021 | IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16239--16248 | doi 10.1109/iccv48922.2021.01595 | OpenAlex W4214755140
Semantic Scholar: ratio 1.00: Point Transformer | Heng-Shuang Zhao, Li Jiang, Jia-Ya Jia, P. Torr, V. Koltun | 2020 | IEEE International Conference on Computer Vision | pages 16239--16248 | doi 10.1109/ICCV48922.2021.01595 | arXiv 2012.09164 | Semantic Scholar ea249d27148fff074af742f70f88aa5878d29ae6
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ilse2018attention
Command: python3 lookup resolve '1802.04712'
```
Crossref: not found
OpenAlex: ratio 1.00: Attention-based Deep Multiple Instance Learning | Maximilian Ilse, Jakub M. Tomczak, Max Welling | 2018 | arXiv (Cornell University) | doi 10.48550/arxiv.1802.04712 | arXiv 1802.04712 | OpenAlex W2785934082 | open access https://arxiv.org/pdf/1802.04712
Semantic Scholar: not found
arXiv: ratio 1.00: Attention-based Deep Multiple Instance Learning | Maximilian Ilse, Jakub M. Tomczak, Max Welling | 2018 | arXiv 1802.04712
```
Exit status: 0

### muandet2017kernel
Command: python3 lookup resolve '10.1561/2200000060'
```
Crossref: ratio 1.00: Kernel Mean Embedding of Distributions: A Review and Beyond | Krikamol Muandet, Kenji Fukumizu, Bharath Sriperumbudur, Bernhard Sch<latin small letter o with diaeresis>lkopf | 2017 | Foundations and Trends<registered sign> in Machine Learning | vol 10 | no 1-2 | pages 1--141 | doi 10.1561/2200000060
OpenAlex: ratio 1.00: Kernel Mean Embedding of Distributions: A Review and Beyond | Krikamol Muandet, Kenji Fukumizu, Bharath K. Sriperumbudur, Bernhard Sch<latin small letter o with diaeresis>lkopf | 2017 | now publishers, Inc. eBooks | vol 10 | no 1-2 | pages 1--141 | doi 10.1561/9781680832891 | OpenAlex W2418306335 | open access https://arxiv.org/pdf/1605.09522
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### szabo2016learning
Command: python3 lookup resolve '1411.2066'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning Theory for Distribution Regression | Zolt<latin small letter a with acute>n Szab<latin small letter o with acute>, Bharath K. Sriperumbudur, Barnab<latin small letter a with acute>s P<latin small letter o with acute>czos, Arthur Gretton | 2014 | arXiv (Cornell University) | vol 17 | no 1 | pages 5272--5311 | doi 10.48550/arxiv.1411.2066 | arXiv 1411.2066 | OpenAlex W1689407543 | open access https://arxiv.org/pdf/1411.2066
Semantic Scholar: ratio 1.00: Learning Theory for Distribution Regression | Z. Szab<latin small letter o with acute>, Bharath K. Sriperumbudur, B. P<latin small letter o with acute>czos, A. Gretton | 2014 | Journal of machine learning research | vol abs/1411.2066 | doi 10.48550/arXiv.1411.2066 | arXiv 1411.2066 | Semantic Scholar e215b1b54f5a1682466a0e4034984dda61d3c6f8 | open access http://arxiv.org/pdf/1411.2066
arXiv: ratio 1.00: Learning Theory for Distribution Regression | Zoltan Szabo, Bharath Sriperumbudur, Barnabas Poczos, Arthur Gretton | 2014 | arXiv 1411.2066
```
Exit status: 0

### campanella2019clinical
Command: python3 lookup resolve '10.1038/s41591-019-0508-1'
```
Crossref: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | Gabriele Campanella, Matthew G. Hanna, Luke Geneslaw, Allen Miraflor, Vitor Werneck Krauss Silva, Klaus J. Busam, Edi Brogi, Victor E. Reuter, David S. Klimstra, Thomas J. Fuchs | 2019 | Nature Medicine | vol 25 | no 8 | pages 1301--1309 | doi 10.1038/s41591-019-0508-1
OpenAlex: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | Gabriele S. V. Campanella, Matthew G. Hanna, Luke Geneslaw, Allen P. Miraflor, Vitor Werneck Krauss Silva, Klaus Johannes BUSAM, Edi Brogi, Victor E. Reuter, David S. Klimstra, Thomas J. Fuchs | 2019 | Nature Medicine | vol 25 | no 8 | pages 1301--1309 | doi 10.1038/s41591-019-0508-1 | OpenAlex W2956228567 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7418463/
Semantic Scholar: ratio 1.00: Clinical-grade computational pathology using weakly supervised deep learning on whole slide images | G. Campanella, M. Hanna, L. Geneslaw, Allen P. Miraflor, Vitor Werneck Krauss Silva, K. Busam, E. Brogi, V. Reuter, D. Klimstra, Thomas J. Fuchs | 2019 | Nature Medicine | vol 25 | pages 1301--1309 | doi 10.1038/s41591-019-0508-1 | Semantic Scholar addae423490bbe82da4fb2fc265237178686b4e8 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7418463/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### lu2021data
Command: python3 lookup resolve '10.1038/s41551-020-00682-w'
```
Crossref: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Y. Chen, Richard J. Chen, Matteo Barbieri, Faisal Mahmood | 2021 | Nature Biomedical Engineering | vol 5 | no 6 | pages 555--570 | doi 10.1038/s41551-020-00682-w
OpenAlex: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Chen, Richard J. Chen, Matteo Barbieri, Faisal Mahmood | 2021 | Nature Biomedical Engineering | vol 5 | no 6 | pages 555--570 | doi 10.1038/s41551-020-00682-w | OpenAlex W3018295606 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8711640/
Semantic Scholar: ratio 1.00: Data-efficient and weakly supervised computational pathology on whole-slide images | Ming Y. Lu, Drew F. K. Williamson, Tiffany Y. Chen, Richard J. Chen, Matteo Barbieri, Faisal Mahmood | 2020 | Nature Biomedical Engineering | vol 5 | pages 555--570 | doi 10.1038/s41551-020-00682-w | arXiv 2004.09666 | Semantic Scholar 3e358c3033908a9506e7f1e3cf29283e359f43d6 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8711640/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gutierrezbecker2021discriminative
Command: python3 lookup resolve '10.1016/j.media.2020.101852'
```
Crossref: ratio 1.00: Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks | Benjam<latin small letter i with acute>n Guti<latin small letter e with acute>rrez-Becker, Ignacio Sarasua, Christian Wachinger | 2021 | Medical Image Analysis | vol 67 | pages 101852 | doi 10.1016/j.media.2020.101852
OpenAlex: ratio 1.00: Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks | Benjam<latin small letter i with acute>n Guti<latin small letter e with acute>rrez-Becker, Ignacio Saras<latin small letter u with acute>a, Christian Wachinger | 2020 | Medical Image Analysis | vol 67 | pages 101852--101852 | doi 10.1016/j.media.2020.101852 | OpenAlex W3092480895 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841520302164
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### sarasua2022hippocampal
Command: python3 lookup resolve '10.1038/s41598-022-12533-6'
```
Crossref: ratio 1.00: Hippocampal representations for deep learning on Alzheimer<right single quotation mark>s disease | Ignacio Sarasua, Sebastian P<latin small letter o with diaeresis>lsterl, Christian Wachinger | 2022 | Scientific Reports | vol 12 | no 1 | doi 10.1038/s41598-022-12533-6
OpenAlex: ratio 1.00: Hippocampal representations for deep learning on Alzheimer<right single quotation mark>s disease | Ignacio Saras<latin small letter u with acute>a, Sebastian P<latin small letter o with diaeresis>lsterl, Christian Wachinger | 2022 | Scientific Reports | vol 12 | no 1 | pages 8619--8619 | doi 10.1038/s41598-022-12533-6 | OpenAlex W4281252270 | open access https://www.nature.com/articles/s41598-022-12533-6.pdf
Semantic Scholar: ratio 1.00: Hippocampal representations for deep learning on Alzheimer<right single quotation mark>s disease | Ignacio Saras<latin small letter u with acute>a, S. P<latin small letter o with diaeresis>lsterl, C. Wachinger | 2021 | Scientific Reports | vol 12 | doi 10.1038/s41598-022-12533-6 | Semantic Scholar 715608ba0f44ebdf22bb9a38483b40e7f515ac86 | open access https://www.nature.com/articles/s41598-022-12533-6.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2021aminn
Command: python3 lookup resolve '10.1007/978-3-030-87240-3_72'
```
Crossref: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jianan Chen, Helen M. C. Cheung, Laurent Milot, Anne L. Martel | 2021 | Lecture Notes in Computer Science | pages 752--761 | doi 10.1007/978-3-030-87240-3_72
OpenAlex: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jianan Chen, Helen Cheung, Laurent M. Milot, Anne Louise Martel | 2021 | Lecture notes in computer science | pages 752--761 | doi 10.1007/978-3-030-87240-3_72 | OpenAlex W3202344381
Semantic Scholar: ratio 1.00: AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases | Jia-Nan Chen, H. Cheung, L. Milot, Anne L. Martel | 2020 | International Conference on Medical Image Computing and Computer-Assisted Intervention | pages 752--761 | doi 10.1007/978-3-030-87240-3_72 | arXiv 2012.06875 | Semantic Scholar 6ede03256f54d773b3ba822e4824a8f0416b18a1
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### liao2019evaluate
Command: python3 lookup resolve '10.1109/TNNLS.2019.2892409'
```
Crossref: ratio 1.00: Evaluate the Malignancy of Pulmonary Nodules Using the 3-D Deep Leaky Noisy-OR Network | Fangzhou Liao, Ming Liang, Zhe Li, Xiaolin Hu, Sen Song | 2019 | IEEE Transactions on Neural Networks and Learning Systems | vol 30 | no 11 | pages 3484--3495 | doi 10.1109/tnnls.2019.2892409
OpenAlex: ratio 1.00: Evaluate the Malignancy of Pulmonary Nodules Using the 3-D Deep Leaky Noisy-OR Network | Fangzhou Liao, Ming Liang, Zhe Li, Xiaolin Hu, Sen Song | 2019 | IEEE Transactions on Neural Networks and Learning Systems | vol 30 | no 11 | pages 3484--3495 | doi 10.1109/tnnls.2019.2892409 | OpenAlex W2769848455 | open access https://arxiv.org/pdf/1711.08324
Semantic Scholar: ratio 1.00: Evaluate the Malignancy of Pulmonary Nodules Using the 3-D Deep Leaky Noisy-OR Network | Fangzhou Liao, Ming Liang, Zhe Li, Xiao-Lin Hu, Sen Song | 2017 | IEEE Transactions on Neural Networks and Learning Systems | vol 30 | pages 3484--3495 | doi 10.1109/TNNLS.2019.2892409 | arXiv 1711.08324 | Semantic Scholar 707ef87813de2c792820121c23868fab569ec559 | open access https://arxiv.org/pdf/1711.08324
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wagstaff2019limitations
Command: python3 lookup resolve '1901.09006'
```
Crossref: not found
OpenAlex: ratio 1.00: On the Limitations of Representing Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Ingmar Posner, Michael A. Osborne | 2019 | Oxford University Research Archive (ORA) (University of Oxford) | pages 6487--6494 | doi 10.48550/arxiv.1901.09006 | arXiv 1901.09006 | OpenAlex W2913668534 | open access https://ora.ox.ac.uk/objects/uuid:3d5730ad-0070-46e9-b173-5b139d122dba/files/mdb1a40b64d60b73dfda93fbcd08485f1
Semantic Scholar: ratio 1.00: On the Limitations of Representing Functions on Sets | Edward Wagstaff, F. Fuchs, Martin Engelcke, I. Posner, Michael A. Osborne | 2019 | International Conference on Machine Learning | pages 6487--6494 | doi 10.48550/arXiv.1901.09006 | arXiv 1901.09006 | Semantic Scholar bc6f7ba757b437842564cd028881a509c225ce26
arXiv: ratio 1.00: On the Limitations of Representing Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Ingmar Posner, Michael Osborne | 2019 | arXiv 1901.09006
```
Exit status: 0

### raff2023reproducibility
Command: python3 lookup resolve '10.52202/075280-0596'
```
Crossref: ratio 1.00: Reproducibility in Multiple Instance Learning: A Case For Algorithmic Unit Tests | Edward Raff, James Holt | 2023 | Advances in Neural Information Processing Systems 36 | pages 13530--13544 | doi 10.52202/075280-0596
OpenAlex: ratio 1.00: Reproducibility in Multiple Instance Learning: A Case For Algorithmic Unit Tests | Edward Raff, James Holt | 2023 | neural information processing systems | pages 13530--13544 | doi 10.52202/075280-0596 | OpenAlex W7133184161 | open access https://arxiv.org/pdf/2310.17867
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### davidson2025holder
Command: python3 lookup resolve '2406.06984'
```
Crossref: not found
OpenAlex: ratio 1.00: On the H<latin small letter o with diaeresis>lder Stability of Multiset and Graph Neural Networks | Yair Davidson, Nadav Dym | 2024 | International Conference on Learning Representations | doi 10.48550/arxiv.2406.06984 | arXiv 2406.06984 | OpenAlex W4399598149 | open access https://proceedings.iclr.cc/paper_files/paper/2025/hash/89d0d5c2f720921df93bbb8fef514571-Abstract-Conference.html
Semantic Scholar: ratio 1.00: On the H<latin small letter o with diaeresis>lder Stability of Multiset and Graph Neural Networks | Yair Davidson, Nadav Dym | 2024 | International Conference on Learning Representations | vol abs/2406.06984 | doi 10.48550/arXiv.2406.06984 | arXiv 2406.06984 | Semantic Scholar f34f42d40fea777f17a12e09ca8b8b6ddcacadc7
arXiv: ratio 1.00: On the H<latin small letter o with diaeresis>lder Stability of Multiset and Graph Neural Networks | Yair Davidson, Nadav Dym | 2024 | arXiv 2406.06984
```
Exit status: 0

### li2021closer
Command: python3 lookup resolve '10.1109/ICCV48922.2021.01591'
```
Crossref: ratio 1.00: A Closer Look at Rotation-invariant Deep Point Cloud Analysis | Feiran Li, Kent Fujiwara, Fumio Okura, Yasuyuki Matsushita | 2021 | 2021 IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16198--16207 | doi 10.1109/iccv48922.2021.01591
OpenAlex: ratio 1.00: A Closer Look at Rotation-invariant Deep Point Cloud Analysis | Feiran Li, Kent Fujiwara, Fumio Okura, Yasuyuki Matsushita | 2021 | IEEE/CVF International Conference on Computer Vision (ICCV) | pages 16198--16207 | doi 10.1109/iccv48922.2021.01591 | OpenAlex W3203310607
Semantic Scholar: ratio 1.00: A Closer Look at Rotation-invariant Deep Point Cloud Analysis | Fei-Ran Li, Kent Fujiwara, Fumio Okura, Y. Matsushita | 2021 | IEEE International Conference on Computer Vision | pages 16198--16207 | doi 10.1109/ICCV48922.2021.01591 | Semantic Scholar cd6b56319f85d0ae9266711247ad3e22496e8ab4
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### karimzadeh2026revisiting
Command: python3 lookup resolve '10.1088/1361-6560/ae7955'
```
Crossref: ratio 1.00: Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study | Reza Karimzadeh, Setareh Hasanabadi, Maryam Cheraghi, Mehrdad Bakhshayesh Karam, Hossein Arabi, Bulat Ibragimov | 2026 | Physics in Medicine &amp; Biology | vol 71 | no 12 | pages 125014 | doi 10.1088/1361-6560/ae7955
OpenAlex: ratio 1.00: Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study | Reza Karimzadeh, Saeed Shafiee Hasanabadi, Maryam Cheraghi, Mehrdad Bakhshayesh Karam, Hossein Arabi, Bulat Ibragimov | 2026 | Physics in Medicine and Biology | vol 71 | no 12 | pages 125014--125014 | doi 10.1088/1361-6560/ae7955 | OpenAlex W7163639403 | open access https://iopscience.iop.org/article/10.1088/1361-6560/ae7955/pdf
Semantic Scholar: ratio 1.00: Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study | Reza Karimzadeh, S. Hasanabadi, Maryam Cheraghi, M. Karam, Hossein Arabi, B. Ibragimov | 2026 | Physics in Medicine and Biology | vol 71 | doi 10.1088/1361-6560/ae7955 | Semantic Scholar 74f3f1dd7f19a09b1361f61914d94094d2817f7f | open access https://iopscience.iop.org/article/10.1088/1361-6560/ae7955/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### harvey2026multi
Command: python3 lookup resolve '2604.26807'
```
Crossref: not found
OpenAlex: ratio 1.00: A Multi-Dataset Benchmark of Multiple Instance Learning for 3D Neuroimage Classification | Ethan Harvey, Dennis Johan Loevlie, Amir Ali Satani, Wansu Chen, David M. Kent, Michael C. Hughes | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2604.26807 | arXiv 2604.26807 | OpenAlex W7158475607 | open access https://arxiv.org/pdf/2604.26807
Semantic Scholar: ratio 1.00: A Multi-Dataset Benchmark of Multiple Instance Learning for 3D Neuroimage Classification | Ethan Harvey, Dennis Johan Loevlie, Amir A. Satani, Wan-Su Chen, D. Kent, M. Hughes | 2026 | arXiv.org | vol abs/2604.26807 | doi 10.48550/arXiv.2604.26807 | arXiv 2604.26807 | Semantic Scholar 602186ca3351af70e27c8ac90f158ee24f8f69ed
arXiv: ratio 1.00: A Multi-Dataset Benchmark of Multiple Instance Learning for 3D Neuroimage Classification | Ethan Harvey, Dennis Johan Loevlie, Amir Ali Satani, Wansu Chen, David M. Kent, Michael C. Hughes | 2026 | arXiv 2604.26807
```
Exit status: 0

### avants2008symmetric
Command: python3 lookup resolve '10.1016/j.media.2007.06.004'
```
Crossref: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | B AVANTS, C EPSTEIN, M GROSSMAN, J GEE | 2008 | Medical Image Analysis | vol 12 | no 1 | pages 26--41 | doi 10.1016/j.media.2007.06.004
OpenAlex: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | Brian Avants, Charles L. Epstein, Murray Grossman, James C. Gee | 2007 | Medical Image Analysis | vol 12 | no 1 | pages 26--41 | doi 10.1016/j.media.2007.06.004 | OpenAlex W1970928383 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2276735/
Semantic Scholar: ratio 1.00: Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain | B. Avants, C. Epstein, M. Grossman, J. Gee | 2008 | Medical Image Anal. | vol 12 1 | pages 26--41 | doi 10.1016/j.media.2007.06.004 | Semantic Scholar 66b498a54843e14270b75f0c3c8fc65a0b2e1e98 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2276735/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### joshi2004unbiased
Command: python3 lookup resolve '10.1016/j.neuroimage.2004.07.068'
```
Crossref: ratio 1.00: Unbiased diffeomorphic atlas construction for computational anatomy | S. Joshi, Brad Davis, Matthieu Jomier, Guido Gerig | 2004 | NeuroImage | vol 23 | pages S151--S160 | doi 10.1016/j.neuroimage.2004.07.068
OpenAlex: ratio 1.00: Unbiased diffeomorphic atlas construction for computational anatomy | Sarang C. Joshi, Brad C. Davis, Matthieu Jomier, Guido Gerig | 2004 | NeuroImage | vol 23 | pages S151--S160 | doi 10.1016/j.neuroimage.2004.07.068 | OpenAlex W2121014637
Semantic Scholar: ratio 1.00: Unbiased diffeomorphic atlas construction for computational anatomy. | S. Joshi, B. Davis, Matthieu Jomier, G. Gerig | 2004 | NeuroImage | vol 23 Suppl 1 | pages S151--60 | doi 10.1016/J.NEUROIMAGE.2004.07.068 | Semantic Scholar ad7d62a47c7c1a61828112cce4aa9e8566558da9
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### balakrishnan2019voxelmorph
Command: python3 lookup resolve '10.1109/TMI.2019.2897538'
```
Crossref: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | Guha Balakrishnan, Amy Zhao, Mert R. Sabuncu, John Guttag, Adrian V. Dalca | 2019 | IEEE Transactions on Medical Imaging | vol 38 | no 8 | pages 1788--1800 | doi 10.1109/tmi.2019.2897538
OpenAlex: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | Guha Balakrishnan, Amy Zhao, Mert Rory Sabuncu, John V. Guttag, Adrian Vasile Dalca | 2019 | IEEE Transactions on Medical Imaging | vol 38 | no 8 | pages 1788--1800 | doi 10.1109/tmi.2019.2897538 | OpenAlex W2891631795 | open access https://arxiv.org/pdf/1809.05231
Semantic Scholar: ratio 1.00: VoxelMorph: A Learning Framework for Deformable Medical Image Registration | G. Balakrishnan, Amy Zhao, M. Sabuncu, J. Guttag, Adrian V. Dalca | 2018 | IEEE Transactions on Medical Imaging | vol 38 | pages 1788--1800 | doi 10.1109/TMI.2019.2897538 | arXiv 1809.05231 | Semantic Scholar 6a88c8abd298b5e9ea7485f41a6a1b1e43b16d5f | open access https://arxiv.org/pdf/1809.05231
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dalca2019learning
Command: python3 lookup resolve '1908.02738'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning Conditional Deformable Templates with Convolutional Networks | Adrian Vasile Dalca, Marianne Rakic, John V. Guttag, Mert Rory Sabuncu | 2019 | arXiv (Cornell University) | vol 32 | pages 804--816 | doi 10.48550/arxiv.1908.02738 | arXiv 1908.02738 | OpenAlex W2965946035 | open access https://arxiv.org/pdf/1908.02738
Semantic Scholar: ratio 1.00: Learning Conditional Deformable Templates with Convolutional Networks | Adrian V. Dalca, Marianne Rakic, J. Guttag, M. Sabuncu | 2019 | Neural Information Processing Systems | vol abs/1908.02738 | doi 10.48550/arXiv.1908.02738 | arXiv 1908.02738 | Semantic Scholar 17c5e70bce680af4498f4fe2b5f2c64bdeb35053
arXiv: ratio 1.00: Learning Conditional Deformable Templates with Convolutional Networks | Adrian V. Dalca, Marianne Rakic, John Guttag, Mert R. Sabuncu | 2019 | arXiv 1908.02738
```
Exit status: 0

### abulnaga2025multimorph
Command: python3 lookup resolve '10.1109/CVPR52734.2025.02878'
```
Crossref: ratio 1.00: MultiMorph: On-Demand Atlas Construction | S. Mazdak Abulnaga, Andrew Hoopes, Neel Dey, Malte Hoffmann, Bruce Fischl, John Guttag, Adrian Dalca | 2025 | 2025 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR) | pages 30906--30917 | doi 10.1109/cvpr52734.2025.02878
OpenAlex: ratio 1.00: MultiMorph: On-Demand Atlas Construction | S. Mazdak Abulnaga, Andrew Hoopes, Neel Dey, Malte Hoffmann, Bruce R. Fischl, John V. Guttag, Adrian Vasile Dalca | 2025 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | vol 2025 | pages 30906--30917 | doi 10.1109/cvpr52734.2025.02878 | OpenAlex W4413145966 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13089913/pdf/nihms-2154554.pdf
Semantic Scholar: ratio 1.00: MultiMorph: On-demand Atlas Construction | S. M. Abulnaga, Andrew Hoopes, Neel Dey, Malte Hoffmann, Marianne Rakic, B. Fischl, J. Guttag, Adrian V. Dalca | 2025 | Computer Vision and Pattern Recognition | vol 2025 | pages 30906--30917 | doi 10.1109/CVPR52734.2025.02878 | arXiv 2504.00247 | Semantic Scholar 999d94690f9529d4cac842bf8a683de76cdbead3 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13089913/pdf/nihms-2154554.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ashburner2000voxel
Command: python3 lookup resolve '10.1006/nimg.2000.0582'
```
Crossref: ratio 1.00: Voxel-Based Morphometry<em dash>The Methods | John Ashburner, Karl J. Friston | 2000 | NeuroImage | vol 11 | no 6 | pages 805--821 | doi 10.1006/nimg.2000.0582
OpenAlex: ratio 1.00: Voxel-Based Morphometry<em dash>The Methods | John Ashburner, Karl John Friston | 2000 | NeuroImage | vol 11 | no 6 | pages 805--821 | doi 10.1006/nimg.2000.0582 | OpenAlex W2119848633
Semantic Scholar: ratio 1.00: Voxel-based morphometry--the methods. | J. Ashburner, Karl J. Friston | 2000 | NeuroImage | vol 11 6 Pt 1 | pages 805--21 | doi 10.1006/NIMG.2000.0582 | Semantic Scholar 236cb915a1724c4b9ec3e53cfed64ce169358cda | open access http://www.stat.wisc.edu/~mchung/teaching/MIA/reading/VBM.ashburner.2000.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bates2003voxel
Command: python3 lookup resolve '10.1038/nn1050'
```
Crossref: ratio 1.00: Voxel-based lesion<en dash>symptom mapping | Elizabeth Bates, Stephen M. Wilson, Ayse Pinar Saygin, Frederic Dick, Martin I. Sereno, Robert T. Knight, Nina F. Dronkers | 2003 | Nature Neuroscience | vol 6 | no 5 | pages 448--450 | doi 10.1038/nn1050
OpenAlex: ratio 1.00: Voxel-based lesion<en dash>symptom mapping | Elizabeth A. Bates, Stephen M. Wilson, Ay<latin small letter s with cedilla>e P<latin small letter dotless i>nar Sayg<latin small letter dotless i>n, Frederic Dick, Martin I. Sereno, Robert Thomas Knight, Nina F. Dronkers | 2003 | Nature Neuroscience | vol 6 | no 5 | pages 448--450 | doi 10.1038/nn1050 | OpenAlex W2153857579
Semantic Scholar: ratio 1.00: Voxel-based lesion<en dash>symptom mapping | E. Bates, S. Wilson, A. Saygin, F. Dick, M. Sereno, R. Knight, N. Dronkers | 2003 | Nature Neuroscience | vol 6 | pages 448--450 | doi 10.1038/nn1050 | Semantic Scholar bc690f553f329b497307f309738c6671ce25e733
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### simpson2013ensemble
Command: python3 lookup resolve '10.1109/TMI.2012.2236651'
```
Crossref: ratio 1.00: Ensemble Learning Incorporating Uncertain Registration | I. J. A. Simpson, M. W. Woolrich, J. L. R. Andersson, A. R. Groves, J. A. Schnabel | 2013 | IEEE Transactions on Medical Imaging | vol 32 | no 4 | pages 748--756 | doi 10.1109/tmi.2012.2236651
OpenAlex: ratio 1.00: Ensemble Learning Incorporating Uncertain Registration | Ivor Simpson, Mark W. Woolrich, Jesper Andersson, Adrian R. Groves, Julia A. Schnabel | 2012 | IEEE Transactions on Medical Imaging | vol 32 | no 4 | pages 748--756 | doi 10.1109/tmi.2012.2236651 | OpenAlex W1978054149
Semantic Scholar: ratio 1.00: Ensemble Learning Incorporating Uncertain Registration | Ivor J. A. Simpson, M. Woolrich, J. Andersson, A. Groves, J. Schnabel | 2013 | IEEE Transactions on Medical Imaging | vol 32 | pages 748--756 | doi 10.1109/TMI.2012.2236651 | Semantic Scholar a413da35e1ad87124e2befc6b6e35878ff658b59 | open access http://www0.cs.ucl.ac.uk/staff/I.Simpson/papers/ISimpsonTMI2013.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### lambin2012radiomics
Command: python3 lookup resolve '10.1016/j.ejca.2011.11.036'
```
Crossref: ratio 1.00: Radiomics: Extracting more information from medical images using advanced feature analysis | Philippe Lambin, Emmanuel Rios-Velazquez, Ralph Leijenaar, Sara Carvalho, Ruud G.P.M. van Stiphout, Patrick Granton, Catharina M.L. Zegers, Robert Gillies, Ronald Boellard, Andr<latin small letter e with acute> Dekker, Hugo J.W.L. Aerts | 2012 | European Journal of Cancer | vol 48 | no 4 | pages 441--446 | doi 10.1016/j.ejca.2011.11.036
OpenAlex: ratio 1.00: Radiomics: Extracting more information from medical images using advanced feature analysis | Philippe Lambin, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Sara Carvalho, Ruud G.P.M. van Stiphout, Patrick Vincent Granton, Catharina M.L. Zegers, Robert J. Gillies, Ronald Boellaard, Andre L.A.J. Dekker, Hugo J.W.L. Aerts | 2012 | European Journal of Cancer | vol 48 | no 4 | pages 441--446 | doi 10.1016/j.ejca.2011.11.036 | OpenAlex W2128739912 | open access http://www.ejcancer.com/article/S0959804911009993/pdf
Semantic Scholar: ratio 1.00: Radiomics: Extracting more information from medical images using advanced feature analysis | P. Lambin, E. Velazquez, R. Leijenaar, S. Carvalho, R. van Stiphout, P. Granton, C. Zegers, R. Gillies, Ronald Boellard, A. Dekker, H. Aerts | 2012 | European Journal of Cancer | vol 48 | pages 441--446 | doi 10.1016/j.ejca.2011.11.036 | Semantic Scholar 9971ff92d9d09b4736228bdbd7726e2e19b9aa2d | open access http://www.ejcancer.com/article/S0959804911009993/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### aerts2014decoding
Command: python3 lookup resolve '10.1038/ncomms5006'
```
Crossref: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | Hugo J. W. L. Aerts, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Chintan Parmar, Patrick Grossmann, Sara Carvalho, Johan Bussink, Ren<latin small letter e with acute> Monshouwer, Benjamin Haibe-Kains, Derek Rietveld, Frank Hoebers, Michelle M. Rietbergen, C. Ren<latin small letter e with acute> Leemans, Andre Dekker, John Quackenbush, Robert J. Gillies, Philippe Lambin | 2014 | Nature Communications | vol 5 | no 1 | doi 10.1038/ncomms5006
OpenAlex: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | Hugo J.W.L. Aerts, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Chintan Parmar, Patrick Gro<latin small letter sharp s>mann, Sara Carvalho, Johan Bussink, Ren<latin small letter e with acute> Monshouwer, Benjamin Haibe<hyphen>Kains, Derek H. F. Rietveld, Frank J P Hoebers, Michelle M. Rietbergen, Charles Ren<latin small letter e with acute> Leemans, Andre L.A.J. Dekker, John F Quackenbush, Robert J. Gillies, Philippe Lambin | 2014 | Nature Communications | vol 5 | no 1 | pages 4006--4006 | doi 10.1038/ncomms5006 | OpenAlex W2103004421 | open access https://www.nature.com/articles/ncomms5006.pdf
Semantic Scholar: ratio 1.00: Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach | H. Aerts, E. Velazquez, R. Leijenaar, C. Parmar, P. Grossmann, S. Carvalho, S. Cavalho, J. Bussink, R. Monshouwer, Benjamin Haibe-Kains, D. Rietveld, F. Hoebers, M. Rietbergen, C. Leemans, A. Dekker, John Quackenbush, R. Gillies, P. Lambin | 2014 | Nature Communications | vol 5 | doi 10.1038/ncomms5006 | Semantic Scholar 3b002068646831a6f59fabb6daeb0209ed54049d | open access https://www.nature.com/articles/ncomms5006.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### vangriethuysen2017computational
Command: python3 lookup resolve '10.1158/0008-5472.CAN-17-0339'
```
Crossref: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | Joost J.M. van Griethuysen, Andriy Fedorov, Chintan Parmar, Ahmed Hosny, Nicole Aucoin, Vivek Narayan, Regina G.H. Beets-Tan, Jean-Christophe Fillion-Robin, Steve Pieper, Hugo J.W.L. Aerts | 2017 | Cancer Research | vol 77 | no 21 | pages e104--e107 | doi 10.1158/0008-5472.can-17-0339
OpenAlex: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | Joost J. M. van Griethuysen, Andriy Fedorov, Chintan Parmar, Ahmed Hosny, Nicole Aucoin, Vivek Narayan, Regina G. H. Beets<hyphen>Tan, Jean<hyphen>Christophe Fillion<hyphen>Robin, Steve Pieper, Hugo J.W.L. Aerts | 2017 | Cancer Research | vol 77 | no 21 | pages e104--e107 | doi 10.1158/0008-5472.can-17-0339 | OpenAlex W2767128594 | open access https://cancerres.aacrjournals.org/content/canres/77/21/e104.full.pdf
Semantic Scholar: ratio 1.00: Computational Radiomics System to Decode the Radiographic Phenotype | J. V. van Griethuysen, Andrey Fedorov, C. Parmar, A. Hosny, N. Aucoin, V. Narayan, R. Beets-Tan, J. Fillion-Robin, S. Pieper, H. Aerts | 2017 | Cancer Research | vol 77 | pages e104--e107 | doi 10.1158/0008-5472.CAN-17-0339 | Semantic Scholar c53fa445bee435f567828db3a0ede0f08abdd0d5 | open access https://cancerres.aacrjournals.org/content/canres/77/21/e104.full.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zwanenburg2020image
Command: python3 lookup resolve '10.1148/radiol.2020191145'
```
Crossref: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping | Alex Zwanenburg, Martin Valli<latin small letter e with grave>res, Mahmoud A. Abdalah, Hugo J. W. L. Aerts, Vincent Andrearczyk, Aditya Apte, Saeed Ashrafinia, Spyridon Bakas, Roelof J. Beukinga, Ronald Boellaard, Marta Bogowicz, Luca Boldrini, Ir<latin small letter e with grave>ne Buvat, Gary J. R. Cook, Christos Davatzikos, Adrien Depeursinge, Marie-Charlotte Desseroit, Nicola Dinapoli, Cuong Viet Dinh, Sebastian Echegaray, Issam El Naqa, Andriy Y. Fedorov, Roberto Gatta, Robert J. Gillies, Vicky Goh, Michael G<latin small letter o with diaeresis>tz, Matthias Guckenberger, Sung Min Ha, Mathieu Hatt, Fabian Isensee, Philippe Lambin, Stefan Leger, Ralph T.H. Leijenaar, Jacopo Lenkowicz, Fiona Lippert, Are Losneg<latin small letter a with ring above>rd, Klaus H. Maier-Hein, Olivier Morin, Henning M<latin small letter u with diaeresis>ller, Sandy Napel, Christophe Nioche, Fanny Orlhac, Sarthak Pati, Elisabeth A.G. Pfaehler, Arman Rahmim, Arvind U.K. Rao, Jonas Scherer, Muhammad Musib Siddique, Nanna M. Sijtsema, Jairo Socarras Fernandez, Emiliano Spezi, Roel J.H.M. Steenbakkers, Stephanie Tanadini-Lang, Daniela Thorwarth, Esther G.C. Troost, Taman Upadhaya, Vincenzo Valentini, Lisanne V. van Dijk, Joost van Griethuysen, Floris H.P. van Velden, Philip Whybra, Christian Richter, Steffen L<latin small letter o with diaeresis>ck | 2020 | Radiology | vol 295 | no 2 | pages 328--338 | doi 10.1148/radiol.2020191145
OpenAlex: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping | Alex Zwanenburg, Martin Valli<latin small letter e with grave>res, Mahmoud A. Abdalah, Hugo J.W.L. Aerts, Vincent Andrearczyk, Aditya Apte, Saeed Ashrafinia, Spyridon Bakas, Roelof J. Beukinga, Ronald Boellaard, Marta Bogowicz, Luca Boldrini, Ir<latin small letter e with grave>ne Buvat, Gary Cook, Christos A. Davatzikos, Adrien Depeursinge, Marie-Charlotte Desseroit, N. Dinapoli, Cuong Viet Dinh, Sebastian Echegaray, Issam El Naqa, Andriy Fedorov, Roberto Gatta, Robert J. Gillies, Vicky Goh, MICHAEL A. GOETZ, Matthias G<latin small letter u with diaeresis>ckenberger, Sung Min Ha, Mathieu Hatt, Fabian Isensee, Philippe Lambin, Stefan Leger, Ralph T. H. Leijenaar, Jacopo Lenkowicz, Fiona Lippert, Are Losneg<latin small letter a with ring above>rd, Klaus Hermann Maier-Hein, Olivier Morin, Henning M<latin small letter u with diaeresis>ller, Sandy A. Napel, Christophe Nioche, Fanny Orlhac, Sarthak Pati, Elisabeth A. G. Pfaehler, Arman Rahmim, Arvind U K Rao, Jonas Scherer, Muhammad Musib Siddique, Nanna Maria Sijtsema, Jairo Socarras Fernandez, Emiliano Spezi, Roel J.H.M. Steenbakkers, Stephanie Tanadini<hyphen>Lang, Daniela Thorwarth, Esther G.C. Troost, Taman Upadhaya, Vincenzo Valentini, Lisanne Vania van Dijk, Joost J. M. van Griethuysen, Floris H. P. van Velden, P. Whybra, Christian Richter, Steffen L<latin small letter o with diaeresis>ck | 2020 | Radiology | vol 295 | no 2 | pages 328--338 | doi 10.1148/radiol.2020191145 | OpenAlex W2998789541 | open access https://research.rug.nl/files/119920642/The_Image_Biomarker_Standardization_Initiative_Standardized_Quantitative_Radiomics_for_High_Throughput_Image_based_Phenotyping.pdf
Semantic Scholar: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping. | A. Zwanenburg, M. Valli<latin small letter e with grave>res, M. Abdalah, H. Aerts, V. Andrearczyk, A. Apte, S. Ashrafinia, S. Bakas, R. Beukinga, R. Boellaard, M. Bogowicz, L. Boldrini, I. Buvat, G. Cook, C. Davatzikos, A. Depeursinge, Marie-Charlotte Desseroit, N. Dinapoli, C. Dinh, S. Echegaray, I. El Naqa, Andrey Fedorov, R. Gatta, R. Gillies, V. Goh, M. G<latin small letter o with diaeresis>tz, M. Guckenberger, Min-Ha Sung, M. Hatt, F. Isensee, P. Lambin, S. Leger, R. Leijenaar, J. Lenkowicz, F. Lippert, Are Losneg<latin small letter a with ring above>rd, Klaus Hermann Maier-Hein, O. Morin, Henning M<latin small letter u with diaeresis>ller, S. Napel, C. Nioche, F. Orlhac, Sarthak Pati, E. Pfaehler, A. Rahmim, Arvind Rao, J. Scherer, M. Siddique, N. Sijtsema, J. Socarras Fernandez, E. Spezi, R. Steenbakkers, S. Tanadini-Lang, D. Thorwarth, E. Troost, T. Upadhaya, V. Valentini, L. van Dijk, J. V. van Griethuysen, F. V. van Velden, P. Whybra, C. Richter, S. L<latin small letter o with diaeresis>ck | 2016 | Radiology | pages 191145 | doi 10.1148/radiol.2020191145 | arXiv 1612.07003 | Semantic Scholar 41dfe7b56b3009500dad81a348cd39941cdfb716 | open access https://research.rug.nl/files/119920642/The_Image_Biomarker_Standardization_Initiative_Standardized_Quantitative_Radiomics_for_High_Throughput_Image_based_Phenotyping.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### fornaconwood2020reliability
Command: python3 lookup resolve '10.1007/s00330-020-06957-9'
```
Crossref: ratio 1.00: Reliability and prognostic value of radiomic features are highly dependent on choice of feature extraction platform | Isabella Fornacon-Wood, Hitesh Mistry, Christoph J. Ackermann, Fiona Blackhall, Andrew McPartlin, Corinne Faivre-Finn, Gareth J. Price, James P. B. O<right single quotation mark>Connor | 2020 | European Radiology | vol 30 | no 11 | pages 6241--6250 | doi 10.1007/s00330-020-06957-9
OpenAlex: ratio 1.00: Reliability and prognostic value of radiomic features are highly dependent on choice of feature extraction platform | Isabella Fornacon-Wood, Hitesh B. Mistry, Christoph Jakob Ackermann, Fiona Helen Blackhall, Andrew J. McPartlin, Corinne Faivre Finn, Gareth J. Price, James P.B. O<right single quotation mark>Connor | 2020 | European Radiology | vol 30 | no 11 | pages 6241--6250 | doi 10.1007/s00330-020-06957-9 | OpenAlex W3017712284 | open access https://link.springer.com/content/pdf/10.1007/s00330-020-06957-9.pdf
Semantic Scholar: ratio 1.00: Reliability and prognostic value of radiomic features are highly dependent on choice of feature extraction platform | I. Fornacon-Wood, H. Mistry, C. Ackermann, F. Blackhall, A. McPartlin, C. Faivre-Finn, G. Price, J. O'Connor | 2020 | European Radiology | vol 30 | pages 6241--6250 | doi 10.1007/s00330-020-06957-9 | Semantic Scholar a74f107faa81160d928780b12dcb3101edf20f98 | open access https://link.springer.com/content/pdf/10.1007/s00330-020-06957-9.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### menze2015multimodal
Command: python3 lookup resolve '10.1109/TMI.2014.2377694'
```
Crossref: ratio 1.00: The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS) | Bjoern H. Menze, Andras Jakab, Stefan Bauer, Jayashree Kalpathy-Cramer, Keyvan Farahani, Justin Kirby, Yuliya Burren, Nicole Porz, Johannes Slotboom, Roland Wiest, Levente Lanczi, Elizabeth Gerstner, Marc-Andre Weber, Tal Arbel, Brian B. Avants, Nicholas Ayache, Patricia Buendia, D. Louis Collins, Nicolas Cordier, Jason J. Corso, Antonio Criminisi, Tilak Das, Herve Delingette, Cagatay Demiralp, Christopher R. Durst, Michel Dojat, Senan Doyle, Joana Festa, Florence Forbes, Ezequiel Geremia, Ben Glocker, Polina Golland, Xiaotao Guo, Andac Hamamci, Khan M. Iftekharuddin, Raj Jena, Nigel M. John, Ender Konukoglu, Danial Lashkari, Jose Antonio Mariz, Raphael Meier, Sergio Pereira, Doina Precup, Stephen J. Price, Tammy Riklin Raviv, Syed M. S. Reza, Michael Ryan, Duygu Sarikaya, Lawrence Schwartz, Hoo-Chang Shin, Jamie Shotton, Carlos A. Silva, Nuno Sousa, Nagesh K. Subbanna, Gabor Szekely, Thomas J. Taylor, Owen M. Thomas, Nicholas J. Tustison, Gozde Unal, Flor Vasseur, Max Wintermark, Dong Hye Ye, Liang Zhao, Binsheng Zhao, Darko Zikic, Marcel Prastawa, Mauricio Reyes, Koen Van Leemput | 2015 | IEEE Transactions on Medical Imaging | vol 34 | no 10 | pages 1993--2024 | doi 10.1109/tmi.2014.2377694
OpenAlex: ratio 1.00: The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS) | Bjoern H. Menze, Jakab Andr<latin small letter a with acute>s, Stefan Bauer, Jayashree Kalpathy<en dash>Cramer, Keyvan Farahani, Justin Kirby, Yuliya Burren, Nicole Porz, Johannes Slotboom, Roland Wiest, Levente L<latin small letter a with acute>nczi, Elizabeth Robins Gerstner, Marc<hyphen>Andr<latin small letter e with acute> Weber, Tal Arbel, Brian Avants, Nicholas Ayache, Patricia Buendia, D. Louis Collins, Nicolas Cordier, Jason J. Corso, Antonio Criminisi, Tilak Das, Herv<latin small letter e with acute> Delingette, <latin capital letter c with cedilla>a<latin small letter g with breve>atay Demiralp, Christopher R. Durst, Michel Dojat, Senan Doyle, Joana Festa, Florence Forbes, Ezequiel Geremia, Ben Glocker, Polina Golland, Xiaotao Guo, Anda<latin small letter c with cedilla> Hamamc<latin small letter dotless i>, Khan M. Iftekharuddin, R. Jena, Nigel John, Ender Konuko<latin small letter g with breve>lu, Danial Lashkari, Jos<latin small letter e with acute> Ant<latin small letter o with acute>nio Mariz, Raphael Meier, S<latin small letter e with acute>rgio Pereira, Doina Precup, Stephen John Price, Tammy Riklin Raviv, Syed M. S. Reza, Michael J. Ryan, Duygu Sar<latin small letter dotless i>kaya, Lawrence Howard Schwartz, Hoo-Chang Shin, Jamie Shotton, Carlos A. Silva, Nuno Sousa, Nagesh K. Subbanna, G<latin small letter a with acute>bor J. Sz<latin small letter e with acute>kely, Thomas J. Taylor, Owen Thomas, Nicholas James Tustison, G<latin small letter o with diaeresis>zde <latin capital letter u with diaeresis>nal, Flor Vasseur, Max Wintermark, Dong Hye Ye, Liang Zhao, Binsheng Zhao, Darko Zikic, Marcel W. Prastawa, Mauricio Reyes, Koen Van Leemput | 2014 | IEEE Transactions on Medical Imaging | vol 34 | no 10 | pages 1993--2024 | doi 10.1109/tmi.2014.2377694 | OpenAlex W1641498739 | open access https://ieeexplore.ieee.org/ielx7/42/7283692/06975210.pdf
Semantic Scholar: ratio 1.00: The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS) | Bjoern H Menze, A. Jakab, S. Bauer, Jayashree Kalpathy-Cramer, K. Farahani, J. Kirby, Y. Burren, N. Porz, J. Slotboom, R. Wiest, L. L<latin small letter a with acute>nczi, E. Gerstner, Marc-Andr<latin small letter e with acute> Weber, T. Arbel, B. Avants, N. Ayache, Patricia Buendia, D. Collins, Nicolas Cordier, J. Corso, A. Criminisi, Tilak Das, H. Delingette, <latin capital letter c with cedilla>a<latin small letter g with breve>atay Demiralp, Christopher R. Durst, M. Dojat, S. Doyle, J. Festa, F. Forbes, E. Geremia, Ben Glocker, P. Golland, Xiao-Tao Guo, A. Hamamc<latin small letter dotless i>, K. Iftekharuddin, R. Jena, Nigel M. John, E. Konukoglu, D. Lashkari, J. Mariz, R. Meier, S<latin small letter e with acute>rgio Pereira, Doina Precup, S. Price, Tammy Riklin-Raviv, Syed M. S. Reza, Michael T. Ryan, Duygu Sarikaya, L. Schwartz, Hoo-Chang Shin, J. Shotton, Carlos Alberto Silva, Nuno J. Sousa, N. Subbanna, G. Sz<latin small letter e with acute>kely, Thomas J. Taylor, Owen M. Thomas, N. Tustison, G. <latin capital letter u with diaeresis>nal, F. Vasseur, M. Wintermark, Dong Hye Ye, Liang Zhao, Bin-Sheng Zhao, Darko Zikic, M. Prastawa, M. Reyes, K. van Leemput | 2014 | IEEE Transactions on Medical Imaging | vol 34 | pages 1993--2024 | doi 10.1109/TMI.2014.2377694 | Semantic Scholar 580062407427236ced45253a2ff7df2e147a81e2 | open access https://ieeexplore.ieee.org/ielx7/42/7283692/06975210.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### isensee2021nnu
Command: python3 lookup resolve '10.1038/s41592-020-01008-z'
```
Crossref: ratio 1.00: nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation | Fabian Isensee, Paul F. Jaeger, Simon A. A. Kohl, Jens Petersen, Klaus H. Maier-Hein | 2020 | Nature Methods | vol 18 | no 2 | pages 203--211 | doi 10.1038/s41592-020-01008-z
OpenAlex: ratio 1.00: nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation | Fabian Isensee, Paul F. Jaeger, Simon A. A. Kohl, Jens Petersen, Klaus H. Maier-Hein | 2020 | Nature Methods | vol 18 | no 2 | pages 203--211 | doi 10.1038/s41592-020-01008-z | OpenAlex W3014974815 | open access https://arxiv.org/pdf/1904.08128
Semantic Scholar: ratio 1.00: nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation | F. Isensee, P. Jaeger, S. Kohl, J. Petersen, Klaus Hermann Maier-Hein | 2020 | Nature Methods | vol 18 | pages 203--211 | doi 10.1038/s41592-020-01008-z | Semantic Scholar f28e387d4229c5f690ce4570a391c0f47e7155c7 | open access https://arxiv.org/pdf/1904.08128
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### commowick2018objective
Command: python3 lookup resolve '10.1038/s41598-018-31911-7'
```
Crossref: ratio 1.00: Objective Evaluation of Multiple Sclerosis Lesion Segmentation using a Data Management and Processing Infrastructure | Olivier Commowick, Audrey Istace, Micha<latin small letter e with diaeresis>l Kain, Baptiste Laurent, Florent Leray, Mathieu Simon, Sorina Camarasu Pop, Pascal Girard, Roxana Am<latin small letter e with acute>li, Jean-Christophe Ferr<latin small letter e with acute>, Anne Kerbrat, Thomas Tourdias, Fr<latin small letter e with acute>d<latin small letter e with acute>ric Cervenansky, Tristan Glatard, J<latin small letter e with acute>r<latin small letter e with acute>my Beaumont, Senan Doyle, Florence Forbes, Jesse Knight, April Khademi, Amirreza Mahbod, Chunliang Wang, Richard McKinley, Franca Wagner, John Muschelli, Elizabeth Sweeney, Eloy Roura, Xavier Llad<latin small letter o with acute>, Michel M. Santos, Wellington P. Santos, Abel G. Silva-Filho, Xavier Tomas-Fernandez, H<latin small letter e with acute>l<latin small letter e with grave>ne Urien, Isabelle Bloch, Sergi Valverde, Mariano Cabezas, Francisco Javier Vera-Olmos, Norberto Malpica, Charles Guttmann, Sandra Vukusic, Gilles Edan, Michel Dojat, Martin Styner, Simon K. Warfield, Fran<latin small letter c with cedilla>ois Cotton, Christian Barillot | 2018 | Scientific Reports | vol 8 | no 1 | doi 10.1038/s41598-018-31911-7
OpenAlex: ratio 1.00: Objective Evaluation of Multiple Sclerosis Lesion Segmentation using a Data Management and Processing Infrastructure | Olivier Commowick, Audrey Istace, Michael Kain, Baptiste Laurent, Florent Leray, Mathieu Simon, Sorina Camarasu-Pop, Pascal Girard, Roxana Am<latin small letter e with acute>li, Jean<hyphen>Christophe Ferr<latin small letter e with acute>, Anne Kerbrat, Thomas Tourdias, Fr<latin small letter e with acute>d<latin small letter e with acute>ric Cervenansky, Tristan Glatard, J<latin small letter e with acute>r<latin small letter e with acute>my Beaumont, Senan Doyle, Florence Forbes, Jesse Knight, April Khademi, Amirreza Mahbod, Chunliang Wang, Richard McKinley, Franca Wagner, John Muschelli, Elizabeth M. Sweeney, Eloy Roura, Xavier Llad<latin small letter o with acute>, Michel M. Santos, Wellington Pinheiro dos Santos, Abel G. Silva-Filho, Xavier Tomas-Fernandez, H<latin small letter e with acute>l<latin small letter e with grave>ne Urien, Isabelle Bloch, Sergi Valverde, Mariano Cabezas, Francisco Javier Vera-Olmos, Norberto Malpica, Charles R.G. Guttmann, Sandra Vukusic, Gilles Edan, Michel Dojat, Martin Andreas Styner, Simon Keith Warfield, Fran<latin small letter c with cedilla>ois Cotton, Christian Barillot | 2018 | Scientific Reports | vol 8 | no 1 | pages 13650--13650 | doi 10.1038/s41598-018-31911-7 | OpenAlex W2849179291 | open access https://www.nature.com/articles/s41598-018-31911-7.pdf
Semantic Scholar: ratio 1.00: Objective Evaluation of Multiple Sclerosis Lesion Segmentation using a Data Management and Processing Infrastructure | O. Commowick, A. Istace, Michael Kain, B. Laurent, Florent Leray, Mathieu Simon, S. Pop, P. Girard, R. Ameli, J. Ferr<latin small letter e with acute>, A. Kerbrat, T. Tourdias, F. Cervenansky, T. Glatard, J. Beaumont, S. Doyle, F. Forbes, Jesse Knight, A. Khademi, A. Mahbod, Chun-Liang Wang, Richard McKinley, F. Wagner, J. Muschelli, E. Sweeney, E. Roura, X. Llad<latin small letter o with acute>, M. M. Santos, W. Santos, A. Silva-Filho, X. Tomas-Fernandez, H. Urien, I. Bloch, S. Valverde, M. Cabezas, Francisco Javier Vera-Olmos, Norberto Malpica, C. Guttmann, S. Vukusic, G. Edan, M. Dojat, M. Styner, S. Warfield, F. Cotton, C. Barillot | 2018 | Scientific Reports | vol 8 | doi 10.1038/s41598-018-31911-7 | Semantic Scholar 63275cef678cb6e280efcf11b527f594335c02c8 | open access https://www.nature.com/articles/s41598-018-31911-7.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wynen2025conflunet
Command: python3 lookup resolve '10.1016/j.compbiomed.2025.110919'
```
Crossref: ratio 1.00: ConfLUNet: Multiple sclerosis lesion instance segmentation in presence of confluent lesions | Maxence Wynen, Pedro M. Gordaliza, Maxime Istasse, Anna St<latin small letter o with diaeresis>lting, Pietro Maggi, Beno<latin small letter i with circumflex>t Macq, Meritxell Bach Cuadra | 2025 | Computers in Biology and Medicine | vol 197 | pages 110919 | doi 10.1016/j.compbiomed.2025.110919
OpenAlex: ratio 1.00: ConfLUNet: Multiple sclerosis lesion instance segmentation in presence of confluent lesions | Maxence Wynen, Pedro M. Gordaliza, Maxime Istasse, Anna St<latin small letter o with diaeresis>lting, Pietro Maggi, Benoit M. M. Macq, Meritxell Bach Cuadra | 2025 | Computers in Biology and Medicine | vol 197 | no Pt A | pages 110919--110919 | doi 10.1016/j.compbiomed.2025.110919 | OpenAlex W4413474688 | open access https://doi.org/10.1016/j.compbiomed.2025.110919
Semantic Scholar: ratio 1.00: ConfLUNet: Multiple sclerosis lesion instance segmentation in presence of confluent lesions | M. Wynen, P. Gordaliza, Maxime Istasse, A. St<latin small letter o with diaeresis>lting, P. Maggi, B. Macq, M. Bach Cuadra | 2025 | Comput. Biol. Medicine | vol 197 Pt A | pages 110919 | doi 10.1016/j.compbiomed.2025.110919 | arXiv 2505.22537 | Semantic Scholar 8ebf147ea359b8b4baaa260ae87588f8c68fda77 | open access https://doi.org/10.1016/j.compbiomed.2025.110919
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### klein2009evaluation
Command: python3 lookup resolve '10.1016/j.neuroimage.2008.12.037'
```
Crossref: ratio 1.00: Evaluation of 14 nonlinear deformation algorithms applied to human brain MRI registration | Arno Klein, Jesper Andersson, Babak A. Ardekani, John Ashburner, Brian Avants, Ming-Chang Chiang, Gary E. Christensen, D. Louis Collins, James Gee, Pierre Hellier, Joo Hyun Song, Mark Jenkinson, Claude Lepage, Daniel Rueckert, Paul Thompson, Tom Vercauteren, Roger P. Woods, J. John Mann, Ramin V. Parsey | 2009 | NeuroImage | vol 46 | no 3 | pages 786--802 | doi 10.1016/j.neuroimage.2008.12.037
OpenAlex: ratio 1.00: Evaluation of 14 nonlinear deformation algorithms applied to human brain MRI registration | Arno Klein, Jesper Andersson, Babak Assai Ardekani, John Ashburner, Brian Avants, Ming-Chang Chiang, Gary E. Christensen, D. Louis Collins, James C. Gee, Pierre Hellier, Joo Hyun Song, Mark Jenkinson, Claude Lepage, Daniel Rueckert, Paul M. Thompson, Tom K. Vercauteren, Roger P. Woods, J. John Mann, Ramin V. Parsey | 2009 | NeuroImage | vol 46 | no 3 | pages 786--802 | doi 10.1016/j.neuroimage.2008.12.037 | OpenAlex W2102099319 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2747506/
Semantic Scholar: ratio 1.00: Evaluation of 14 nonlinear deformation algorithms applied to human brain MRI registration | Arno Klein, J. Andersson, B. Ardekani, J. Ashburner, B. Avants, Ming-Chang Chiang, G. Christensen, D. Collins, J. Gee, P. Hellier, J. Song, M. Jenkinson, C. Lepage, D. Rueckert, P. Thompson, T. Vercauteren, R. Woods, J. Mann, R. Parsey | 2009 | NeuroImage | vol 46 | pages 786--802 | doi 10.1016/j.neuroimage.2008.12.037 | Semantic Scholar 6d2669ebc27f776d940ca95db0ad4ae455316cf2 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC2747506/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dular2024extensive
Command: python3 lookup resolve '10.1016/j.compbiomed.2024.108320'
```
Crossref: ratio 1.00: Extensive T1-weighted MRI preprocessing improves generalizability of deep brain age prediction models | Lara Dular, Franjo Pernu<latin small letter s with caron>, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin | 2024 | Computers in Biology and Medicine | vol 173 | pages 108320 | doi 10.1016/j.compbiomed.2024.108320
OpenAlex: ratio 1.00: Extensive T1-weighted MRI preprocessing improves generalizability of deep brain age prediction models | Lara Dular, Franjo Pernu<latin small letter s with caron>, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin | 2024 | Computers in Biology and Medicine | vol 173 | pages 108320--108320 | doi 10.1016/j.compbiomed.2024.108320 | OpenAlex W4392983541 | open access https://doi.org/10.1016/j.compbiomed.2024.108320
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### pavic2018influence
Command: python3 lookup resolve '10.1080/0284186X.2018.1445283'
```
Crossref: ratio 1.00: Influence of inter-observer delineation variability on radiomics stability in different tumor sites | Matea Pavic, Marta Bogowicz, Xaver W<latin small letter u with diaeresis>rms, Stefan Glatz, Tobias Finazzi, Oliver Riesterer, Johannes Roesch, Leonie Rudofsky, Martina Friess, Patrick Veit-Haibach, Martin Huellner, Isabelle Opitz, Walter Weder, Thomas Frauenfelder, Matthias Guckenberger, Stephanie Tanadini-Lang | 2018 | Acta Oncologica | vol 57 | no 8 | pages 1070--1074 | doi 10.1080/0284186x.2018.1445283
OpenAlex: ratio 1.00: Influence of inter-observer delineation variability on radiomics stability in different tumor sites | Matea Pavic, Marta Bogowicz, Xaver W<latin small letter u with diaeresis>rms, Stefan Glatz, Tobias Finazzi, Oliver Riesterer, Johannes Roesch, Leonie Rudofsky, Martina Friess, Patrick Veit<hyphen>Haibach, Martin William Huellner, Isabelle Opitz, Walter Weder, Thomas Frauenfelder, Matthias G<latin small letter u with diaeresis>ckenberger, Stephanie Tanadini<hyphen>Lang | 2018 | Acta Oncologica | vol 57 | no 8 | pages 1070--1074 | doi 10.1080/0284186x.2018.1445283 | OpenAlex W2791459212 | open access https://www.tandfonline.com/doi/pdf/10.1080/0284186X.2018.1445283?needAccess=true&role=button
Semantic Scholar: ratio 1.00: Influence of inter-observer delineation variability on radiomics stability in different tumor sites | M. Pavic, M. Bogowicz, Xaver W<latin small letter u with diaeresis>rms, S. Glatz, T. Finazzi, O. Riesterer, J. Roesch, L. Rudofsky, Martina Friess, P. Veit-Haibach, M. Huellner, I. Opitz, W. Weder, T. Frauenfelder, M. Guckenberger, S. Tanadini-Lang | 2018 | Acta oncologica | vol 57 | pages 1070--1074 | doi 10.1080/0284186X.2018.1445283 | Semantic Scholar 3c0d461ba85dee05b5285335c61c071fb71ad274 | open access https://www.tandfonline.com/doi/pdf/10.1080/0284186X.2018.1445283?needAccess=true&role=button
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### poirot2022robustness
Command: python3 lookup resolve '10.1038/s41598-022-20703-9'
```
Crossref: ratio 1.00: Robustness of radiomics to variations in segmentation methods in multimodal brain MRI | M. G. Poirot, M. W. A. Caan, H. G. Ruhe, A. Bj<latin small letter o with stroke>rnerud, I. Groote, L. Reneman, H. A. Marquering | 2022 | Scientific Reports | vol 12 | no 1 | doi 10.1038/s41598-022-20703-9
OpenAlex: ratio 1.00: Robustness of radiomics to variations in segmentation methods in multimodal brain MRI | Maarten G. Poirot, Matthan W.A. Caan, Henricus Gerardus Ruh<latin small letter e with acute>, Atle Bj<latin small letter o with stroke>rnerud, Inge Rasmus Groote, Liesbeth Reneman, Henk A. Marquering | 2022 | Scientific Reports | vol 12 | no 1 | pages 16712--16712 | doi 10.1038/s41598-022-20703-9 | OpenAlex W4302292929 | open access https://www.nature.com/articles/s41598-022-20703-9.pdf
Semantic Scholar: ratio 1.00: Robustness of radiomics to variations in segmentation methods in multimodal brain MRI | M. Poirot, M. Caan, H. Ruh<latin small letter e with acute>, A. Bj<latin small letter o with stroke>rnerud, I. Groote, L. Reneman, H. Marquering | 2022 | Scientific Reports | vol 12 | doi 10.1038/s41598-022-20703-9 | Semantic Scholar 49511a491e76a4e3302e5237515669fa3be8ee08 | open access https://www.nature.com/articles/s41598-022-20703-9.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cama2025segmentation
Command: python3 lookup resolve '10.1117/1.JMI.12.5.054501'
```
Crossref: ratio 1.00: Segmentation variability and radiomics stability for predicting triple-negative breast cancer subtype using magnetic resonance imaging | Isabella Cama, Alejandro Guzm<latin small letter a with acute>n, Cristina Campi, Michele Piana, Karim Lekadir, Sara Garbarino, Oliver D<latin small letter i with acute>az | 2025 | Journal of Medical Imaging | vol 12 | no 05 | pages 1--23 | doi 10.1117/1.jmi.12.5.054501
OpenAlex: ratio 1.00: Segmentation variability and radiomics stability for predicting triple-negative breast cancer subtype using magnetic resonance imaging | Isabella Cama, Alejandro Guzm<latin small letter a with acute>n, Cristina Campi, Michele Piana, Karim Lekadir, Sara Garbarino, Oliver D<latin small letter i with acute>az | 2025 | Journal of medical imaging | vol 12 | no 05 | pages 1--23 | doi 10.1117/1.jmi.12.5.054501 | OpenAlex W4414285024 | open access https://www.spiedigitallibrary.org/journals/journal-of-medical-imaging/volume-12/issue-5/054501/Segmentation-variability-and-radiomics-stability-for-predicting-triple-negative-breast/10.1117/1.JMI.12.5.054501.pdf
Semantic Scholar: ratio 1.00: Segmentation variability and radiomics stability for predicting triple-negative breast cancer subtype using magnetic resonance imaging | Isabella Cama, Alejandro Guzm<latin small letter a with acute>n, C. Campi, M. Piana, K. Lekadir, S. Garbarino, Oliver D<latin small letter i with acute>az | 2025 | Journal of Medical Imaging | vol 12 | doi 10.1117/1.JMI.12.5.054501 | arXiv 2504.01692 | Semantic Scholar 770d0547cc2734a58f88107a469cd72771e76d21 | open access https://www.spiedigitallibrary.org/journals/journal-of-medical-imaging/volume-12/issue-5/054501/Segmentation-variability-and-radiomics-stability-for-predicting-triple-negative-breast/10.1117/1.JMI.12.5.054501.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cole2017predicting
Command: python3 lookup resolve '10.1016/j.neuroimage.2017.07.059'
```
Crossref: ratio 1.00: Predicting brain age with deep learning from raw imaging data results in a reliable and heritable biomarker | James H. Cole, Rudra P.K. Poudel, Dimosthenis Tsagkrasoulis, Matthan W.A. Caan, Claire Steves, Tim D. Spector, Giovanni Montana | 2017 | NeuroImage | vol 163 | pages 115--124 | doi 10.1016/j.neuroimage.2017.07.059
OpenAlex: ratio 1.00: Predicting brain age with deep learning from raw imaging data results in a reliable and heritable biomarker | James Howard Cole, Rudra P. K. Poudel, Dimosthenis Tsagkrasoulis, Matthan W.A. Caan, Claire J. Steves, Tim D. Spector, Giovanni Montana | 2017 | NeuroImage | vol 163 | pages 115--124 | doi 10.1016/j.neuroimage.2017.07.059 | OpenAlex W2579617530 | open access https://kclpure.kcl.ac.uk/portal/en/publications/826cf875-3cc3-4e68-bb02-f057c725a9ed
Semantic Scholar: ratio 1.00: Predicting brain age with deep learning from raw imaging data results in a reliable and heritable biomarker | J. Cole, Rudra P. K. Poudel, Dimosthenis Tsagkrasoulis, M. Caan, C. Steves, T. Spector, G. Montana | 2016 | NeuroImage | vol 163 | pages 115<en dash>124 | doi 10.1016/j.neuroimage.2017.07.059 | arXiv 1612.02572 | Semantic Scholar 5d71c918db224e21982d9eb5ab2359735466959b | open access https://kclpure.kcl.ac.uk/portal/en/publications/826cf875-3cc3-4e68-bb02-f057c725a9ed
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### hosny2018deep
Command: python3 lookup resolve '10.1371/journal.pmed.1002711'
```
Crossref: ratio 1.00: Deep learning for lung cancer prognostication: A retrospective multi-cohort radiomics study | Ahmed Hosny, Chintan Parmar, Thibaud P. Coroller, Patrick Grossmann, Roman Zeleznik, Avnish Kumar, Johan Bussink, Robert J. Gillies, Raymond H. Mak, Hugo J. W. L. Aerts | 2018 | PLOS Medicine | vol 15 | no 11 | pages e1002711 | doi 10.1371/journal.pmed.1002711
OpenAlex: ratio 1.00: Deep learning for lung cancer prognostication: A retrospective multi-cohort radiomics study | Ahmed Hosny, Chintan Parmar, Thibaud P. Coroller, Patrick Gro<latin small letter sharp s>mann, Roman Zeleznik, Avnish Kumar, Johan Bussink, Robert J. Gillies, Raymond H. Mak, Hugo J.W.L. Aerts | 2018 | PLoS Medicine | vol 15 | no 11 | pages e1002711--e1002711 | doi 10.1371/journal.pmed.1002711 | OpenAlex W2903150666 | open access https://journals.plos.org/plosmedicine/article/file?id=10.1371/journal.pmed.1002711&type=printable
Semantic Scholar: ratio 1.00: Deep learning for lung cancer prognostication: A retrospective multi-cohort radiomics study | A. Hosny, C. Parmar, T. Coroller, P. Grossmann, R. Zeleznik, Avnish Kumar, J. Bussink, R. Gillies, R. Mak, H. Aerts | 2018 | PLoS Medicine | vol 15 | doi 10.1371/journal.pmed.1002711 | Semantic Scholar 438c0a37e7545e836ee81c519cedf44f0702418f | open access https://journals.plos.org/plosmedicine/article/file?id=10.1371/journal.pmed.1002711&type=printable
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### toosi2024segmentation
Command: python3 lookup resolve '10.3390/cancers16142538'
```
Crossref: ratio 1.00: Segmentation-Free Outcome Prediction from Head and Neck Cancer PET/CT Images: Deep Learning-Based Feature Extraction from Multi-Angle Maximum Intensity Projections (MA-MIPs) | Amirhosein Toosi, Isaac Shiri, Habib Zaidi, Arman Rahmim | 2024 | Cancers | vol 16 | no 14 | pages 2538 | doi 10.3390/cancers16142538
OpenAlex: ratio 1.00: Segmentation-Free Outcome Prediction from Head and Neck Cancer PET/CT Images: Deep Learning-Based Feature Extraction from Multi-Angle Maximum Intensity Projections (MA-MIPs) | Amirhosein Toosi, Isaac Shiri, Habib Zaidi, Arman Rahmim | 2024 | Cancers | vol 16 | no 14 | pages 2538--2538 | doi 10.3390/cancers16142538 | OpenAlex W4396778312 | open access https://www.mdpi.com/2072-6694/16/14/2538/pdf?version=1721286491
Semantic Scholar: ratio 1.00: Segmentation-Free Outcome Prediction from Head and Neck Cancer PET/CT Images: Deep Learning-Based Feature Extraction from Multi-Angle Maximum Intensity Projections (MA-MIPs) | Amirhosein Toosi, I. Shiri, H. Zaidi, A. Rahmim | 2024 | Cancers | vol 16 | doi 10.3390/cancers16142538 | arXiv 2405.01756 | Semantic Scholar 274956f84276f522a0a82adaf231fa0a628238f2 | open access https://www.mdpi.com/2072-6694/16/14/2538/pdf?version=1721286491
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xue2023tractcloud
Command: python3 lookup resolve '10.1007/978-3-031-43993-3_40'
```
Crossref: ratio 1.00: TractCloud: Registration-Free Tractography Parcellation with a Novel Local-Global Streamline Point Cloud Representation | Tengfei Xue, Yuqian Chen, Chaoyi Zhang, Alexandra J. Golby, Nikos Makris, Yogesh Rathi, Weidong Cai, Fan Zhang, Lauren J. O<right single quotation mark>Donnell | 2023 | Lecture Notes in Computer Science | pages 409--419 | doi 10.1007/978-3-031-43993-3_40
OpenAlex: ratio 1.00: TractCloud: Registration-Free Tractography Parcellation with a Novel Local-Global Streamline Point Cloud Representation | Tengfei Xue, Yuqian Chen, Chaoyi Zhang, Alexandra J. Golby, Nikos Makris, Yogesh Rathi, Weidong Cai, Fan Zhang, Lauren J. O<right single quotation mark>Donnell | 2023 | Lecture notes in computer science | pages 409--419 | doi 10.1007/978-3-031-43993-3_40 | OpenAlex W4387211013 | open access https://arxiv.org/pdf/2307.09000
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### afshar2020taste
Command: python3 lookup resolve '10.1145/3368555.3384464'
```
Crossref: ratio 1.00: TASTE | Ardavan Afshar, Ioakeim Perros, Haesun Park, Christopher deFilippi, Xiaowei Yan, Walter Stewart, Joyce Ho, Jimeng Sun | 2020 | Proceedings of the ACM Conference on Health, Inference, and Learning | pages 193--203 | doi 10.1145/3368555.3384464
OpenAlex: DOI_MISMATCH, ratio 0.11: TASTE: temporal and static tensor factorization for phenotyping electronic health records | Ardavan Afshar, Ioakeim Perros, Haesun Park, Christopher R. deFilippi, Xiaowei Sherry Yan, Walter F. Stewart, Joyce C. Ho, Jimeng Sun | 2020 | ACM Conference on Health, Inference, and Learning (CHIL) | vol 2020 | pages 193--203 | doi 10.1145/3368555.3384464 | OpenAlex W3012523953 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7924914/
Semantic Scholar: DOI_MISMATCH, ratio 0.11: TASTE: Temporal and Static Tensor Factorization for Phenotyping Electronic Health Records | Ardavan Afshar, Ioakeim Perros, Haesun Park, C. Defilippi, Xiao-Wei Yan, W. Stewart, Joyce Ho, Ji-Meng Sun | 2019 | ACM Conference on Health, Inference, and Learning | vol 2020 | pages 193--203 | doi 10.1145/3368555.3384464 | arXiv 1911.05843 | Semantic Scholar ea3afc644347bb0f923e6daeaeb68c726c1f8381 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC7924914/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yin2020logpar
Command: python3 lookup resolve '10.1145/3394486.3403213'
```
Crossref: ratio 1.00: LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values | Kejing Yin, Ardavan Afshar, Joyce C. Ho, William K. Cheung, Chao Zhang, Jimeng Sun | 2020 | Proceedings of the 26th ACM SIGKDD International Conference on Knowledge Discovery &amp; Data Mining | pages 1625--1635 | doi 10.1145/3394486.3403213
OpenAlex: ratio 1.00: LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values | Kejing Yin, Ardavan Afshar, Joyce C. Ho, William K. Cheung, Chao Zhang, Jimeng Sun | 2020 | ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD) | vol 2020 | pages 1625--1635 | doi 10.1145/3394486.3403213 | OpenAlex W3080327921 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8186437/
Semantic Scholar: ratio 1.00: LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values | Kejing Yin, Ardavan Afshar, Joyce Ho, W. Cheung, Chao Zhang, Ji-Meng Sun | 2020 | Knowledge Discovery and Data Mining | vol 2020 | pages 1625--1635 | doi 10.1145/3394486.3403213 | Semantic Scholar 6f6d2b257ca9d7073da28ed66884fb53fa08295d | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8186437/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### consagra2024continuous
Command: python3 lookup resolve '10.1214/23-aoas1858'
```
Crossref: ratio 1.00: Continuous and atlas-free analysis of brain structural connectivity | William Consagra, Martin Cole, Xing Qiu, Zhengwu Zhang | 2024 | The Annals of Applied Statistics | vol 18 | no 3 | pages 1815--1839 | doi 10.1214/23-aoas1858
OpenAlex: ratio 1.00: Continuous and atlas-free analysis of brain structural connectivity | William Consagra, Martin Cole, Xing Qiu, Zhengwu Zhang | 2024 | The Annals of Applied Statistics | vol 18 | no 3 | pages 1815--1839 | doi 10.1214/23-aoas1858 | OpenAlex W4401373869 | open access https://arxiv.org/pdf/2308.05738
Semantic Scholar: ratio 1.00: Continuous and atlas-free analysis of brain structural connectivity | W. Consagra, Martin Cole, Xing Qiu, Zheng-Wu Zhang | 2023 | Annals of Applied Statistics | doi 10.1214/23-aoas1858 | arXiv 2308.05738 | Semantic Scholar 837fe3446662de9ad8edd77fedacf8bbf33ea83f | open access https://arxiv.org/pdf/2308.05738
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kovacs2023addressing
Command: python3 lookup resolve '10.1038/s41598-023-46747-z'
```
Crossref: ratio 1.00: Addressing image misalignments in multi-parametric prostate MRI for enhanced computer-aided diagnosis of prostate cancer | Balint Kovacs, Nils Netzer, Michael Baumgartner, Adrian Schrader, Fabian Isensee, Cedric Wei<latin small letter sharp s>er, Ivo Wolf, Magdalena G<latin small letter o with diaeresis>rtz, Paul F. Jaeger, Victoria Sch<latin small letter u with diaeresis>tz, Ralf Floca, Regula Gnirs, Albrecht Stenzinger, Markus Hohenfellner, Heinz-Peter Schlemmer, David Bonekamp, Klaus H. Maier-Hein | 2023 | Scientific Reports | vol 13 | no 1 | doi 10.1038/s41598-023-46747-z
OpenAlex: ratio 1.00: Addressing image misalignments in multi-parametric prostate MRI for enhanced computer-aided diagnosis of prostate cancer | B<latin small letter a with acute>lint Kov<latin small letter a with grave>cs, Nils Netzer, Michael Baumgartner, Adrian Schrader, Fabian Isensee, Cedric Wei<latin small letter sharp s>er, Ivo Wolf, Magdalena G<latin small letter o with diaeresis>rtz, Paul F. Jaeger, V Sch<latin small letter u with diaeresis>tz, Ralf Omar Floca, Regula Gnirs, Albrecht Stenzinger, Markus Hohenfellner, Heinz<hyphen>Peter Schlemmer, David Bonekamp, Klaus Hermann Maier-Hein | 2023 | Scientific Reports | vol 13 | no 1 | pages 19805--19805 | doi 10.1038/s41598-023-46747-z | OpenAlex W4388627300 | open access https://www.nature.com/articles/s41598-023-46747-z.pdf
Semantic Scholar: ratio 1.00: Addressing image misalignments in multi-parametric prostate MRI for enhanced computer-aided diagnosis of prostate cancer | B<latin small letter a with acute>lint Kov<latin small letter a with acute>cs, N. Netzer, M. Baumgartner, Adrian Schrader, F. Isensee, Cedric Wei<latin small letter sharp s>er, I. Wolf, M. G<latin small letter o with diaeresis>rtz, P. Jaeger, V. Sch<latin small letter u with diaeresis>tz, R. Floca, R. Gnirs, A. Stenzinger, M. Hohenfellner, H. Schlemmer, D. Bonekamp, K. Maier-Hein | 2023 | Scientific Reports | vol 13 | doi 10.1038/s41598-023-46747-z | Semantic Scholar 8e5b6ccace875c5bb3e7a48d82cc046bbe1d6309 | open access https://www.nature.com/articles/s41598-023-46747-z.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ghosal2026penalized
Command: python3 lookup resolve '2611.03608'
```
Crossref: not found
OpenAlex: ratio 1.00: Penalized Cox Regression with Graph-Structured Distribution-Valued Predictors | Rahul Ghosal, Dhrubajyoti Ghosh, Yuanzhen Yue, Arkaprava Roy | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2611.03608 | arXiv 2611.03608 | OpenAlex W7225161204 | open access https://arxiv.org/pdf/2611.03608
Semantic Scholar: ratio 1.00: Penalized Cox Regression with Graph-Structured Distribution-Valued Predictors | R. Ghosal, Dhrubajyoti Ghosh, Yuan-Zheng Yue, Arkaprava Roy | 2026 | arXiv 2611.03608 | Semantic Scholar 4b2f89da752259cb3d69450107275d8e7aa9002f
arXiv: ratio 1.00: Penalized Cox Regression with Graph-Structured Distribution-Valued Predictors | Rahul Ghosal, Dhrubajyoti Ghosh, Yuanzhen Yue, Arkaprava Roy | 2026 | arXiv 2611.03608
```
Exit status: 0

### feydy2019interpolating
Command: python3 lookup resolve '1810.08278'
```
Crossref: not found
OpenAlex: ratio 1.00: Interpolating between Optimal Transport and MMD using Sinkhorn Divergences | Jean Feydy, Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois<hyphen>Xavier Vialard, <cyrillic capital letter sha><cyrillic small letter u><cyrillic small letter en>-<cyrillic small letter i><cyrillic small letter che><cyrillic small letter i> <cyrillic capital letter a><cyrillic small letter em><cyrillic small letter a><cyrillic small letter er><cyrillic small letter i>, A. Trouv<latin small letter e with acute>, Gabriel Peyr<latin small letter e with acute> | 2018 | arXiv (Cornell University) | vol 89 | pages 2681--2690 | doi 10.48550/arxiv.1810.08278 | arXiv 1810.08278 | OpenAlex W2897105053 | open access https://arxiv.org/pdf/1810.08278
Semantic Scholar: ratio 1.00: Interpolating between Optimal Transport and MMD using Sinkhorn Divergences | J. Feydy, Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, S. Amari, A. Trouv<latin small letter e with acute>, G. Peyr<latin small letter e with acute> | 2018 | International Conference on Artificial Intelligence and Statistics | pages 2681--2690 | arXiv 1810.08278 | Semantic Scholar dafb021ba04731669e9473477688345ef4962e63
arXiv: ratio 1.00: Interpolating between Optimal Transport and MMD using Sinkhorn Divergences | Jean Feydy, Thibault S<latin small letter e with acute>journ<latin small letter e with acute>, Fran<latin small letter c with cedilla>ois-Xavier Vialard, Shun-ichi Amari, Alain Trouv<latin small letter e with acute>, Gabriel Peyr<latin small letter e with acute> | 2018 | arXiv 1810.08278
```
Exit status: 0

### wang2013linear
Command: python3 lookup resolve '10.1007/s11263-012-0566-z'
```
Crossref: ratio 1.00: A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images | Wei Wang, Dejan Slep<latin small letter c with caron>ev, Saurav Basu, John A. Ozolek, Gustavo K. Rohde | 2012 | International Journal of Computer Vision | vol 101 | no 2 | pages 254--269 | doi 10.1007/s11263-012-0566-z
OpenAlex: ratio 1.00: A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images | Wei Wang, Dejan Slep<latin small letter c with caron>ev, Saurav Basu, John A. Ozolek, Gustavo Kunde Rohde | 2012 | International Journal of Computer Vision | vol 101 | no 2 | pages 254--269 | doi 10.1007/s11263-012-0566-z | OpenAlex W2094100343 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC3667970/
Semantic Scholar: ratio 1.00: A linear optimal transportation framework for quantifying and visualizing variations in sets of images | Wei Wang, D. Slep<latin small letter c with caron>ev, Saurav Basu, J. Ozolek, G. Rohde | 2012 | International Journal of Computer Vision | vol 101 | pages 254--269 | doi 10.1007/s11263-012-0566-z | Semantic Scholar 3b1f93716ef525f2b47dcc2faec8292a686e1086 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC3667970/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kolouri2021wasserstein
Command: python3 lookup resolve '2006.09430'
```
Crossref: not found
OpenAlex: ratio 1.00: Wasserstein Embedding for Graph Learning | Soheil Kolouri, Navid Naderializadeh, Gustavo Kunde Rohde, Hoffmann, Heiko | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.09430 | arXiv 2006.09430 | OpenAlex W3036694079 | open access https://arxiv.org/pdf/2006.09430
Semantic Scholar: ratio 1.00: Wasserstein Embedding for Graph Learning | Soheil Kolouri, Navid Naderializadeh, G. Rohde, Heiko Hoffmann | 2020 | International Conference on Learning Representations | vol abs/2006.09430 | doi 10.48550/arXiv.2006.09430 | arXiv 2006.09430 | Semantic Scholar b00e92cf883050461f545f3f3e4cf376c07bb1a2
arXiv: ratio 1.00: Wasserstein Embedding for Graph Learning | Soheil Kolouri, Navid Naderializadeh, Gustavo K. Rohde, Heiko Hoffmann | 2020 | arXiv 2006.09430
```
Exit status: 0

### togninalli2019wasserstein
Command: python3 lookup resolve '1906.01277'
```
Crossref: not found
OpenAlex: ratio 1.00: Wasserstein Weisfeiler-Lehman Graph Kernels | Matteo Togninalli, Elisabetta Ghisu, Felipe Llinares-L<latin small letter o with acute>pez, Bastian Rieck, Karsten Michael Borgwardt | 2019 | arXiv (Cornell University) | vol 32 | pages 6439--6449 | doi 10.3929/ethz-b-000420933 | OpenAlex W2970823238 | open access https://arxiv.org/pdf/1906.01277
Semantic Scholar: ratio 1.00: Wasserstein Weisfeiler-Lehman Graph Kernels | Matteo Togninalli, M. Ghisu, F. Llinares-L<latin small letter o with acute>pez, Bastian Alexander Rieck, Karsten M. Borgwardt | 2019 | Neural Information Processing Systems | pages 6436--6446 | doi 10.48550/arXiv.1906.01277 | arXiv 1906.01277 | Semantic Scholar 081a05b34be9d604f85ca4e5582daa753370b960
arXiv: ratio 1.00: Wasserstein Weisfeiler-Lehman Graph Kernels | Matteo Togninalli, Elisabetta Ghisu, Felipe Llinares-L<latin small letter o with acute>pez, Bastian Rieck, Karsten Borgwardt | 2019 | arXiv 1906.01277
```
Exit status: 0

### zhang2024wasserstein
Command: python3 lookup resolve '10.1109/tpami.2024.3409772'
```
Crossref: ratio 1.00: Wasserstein Discriminant Dictionary Learning for Graph Representation | Tong Zhang, Guangbu Liu, Zhen Cui, Wei Liu, Wenming Zheng, Jian Yang | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 46 | no 12 | pages 8619--8635 | doi 10.1109/tpami.2024.3409772
OpenAlex: ratio 1.00: Wasserstein Discriminant Dictionary Learning for Graph Representation | Tong Zhang, Guangbu Liu, Zhen Cui, Wei Liu, Wenming Zheng, Jian Jun Yang | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 46 | no 12 | pages 8619--8635 | doi 10.1109/tpami.2024.3409772 | OpenAlex W4399373692
Semantic Scholar: ratio 1.00: Wasserstein Discriminant Dictionary Learning for Graph Representation | Tong Zhang, Guangbu Liu, Zhen Cui, Wei Liu, Wen-Ming Zheng, Jian Yang | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 46 | pages 8619--8635 | doi 10.1109/TPAMI.2024.3409772 | Semantic Scholar 9ce07ee913a43b79c2b8d8edfff420869ac4b203
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kundu2018discovery
Command: python3 lookup resolve '10.1016/j.neuroimage.2017.11.006'
```
Crossref: ratio 1.00: Discovery and visualization of structural biomarkers from MRI using transport-based morphometry | Shinjini Kundu, Soheil Kolouri, Kirk I. Erickson, Arthur F. Kramer, Edward McAuley, Gustavo K. Rohde | 2018 | NeuroImage | vol 167 | pages 256--275 | doi 10.1016/j.neuroimage.2017.11.006
OpenAlex: ratio 1.00: Discovery and visualization of structural biomarkers from MRI using transport-based morphometry | Shinjini Kundu, Soheil Kolouri, Kirk I. Erickson, Arthur F. Kramer, Edward McAuley, Gustavo Kunde Rohde | 2017 | NeuroImage | vol 167 | pages 256--275 | doi 10.1016/j.neuroimage.2017.11.006 | OpenAlex W2616032077 | open access https://www.sciencedirect.com/science/article/am/pii/S1053811917309151
Semantic Scholar: ratio 1.00: Discovery and visualization of structural biomarkers from MRI using transport-based morphometry | Shinjini Kundu, Soheil Kolouri, K. Erickson, A. Kramer, E. McAuley, G. Rohde | 2017 | NeuroImage | vol 167 | pages 256--275 | doi 10.1016/j.neuroimage.2017.11.006 | arXiv 1705.04919 | Semantic Scholar 62185e836dbff2641cf33e57b9d73ce2bca25a08 | open access https://www.sciencedirect.com/science/article/am/pii/S1053811917309151
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kundu2024discovering
Command: python3 lookup resolve '10.1126/sciadv.adl5307'
```
Crossref: ratio 1.00: Discovering the gene-brain-behavior link in autism via generative machine learning | Shinjini Kundu, Haris Sair, Elliott H. Sherr, Pratik Mukherjee, Gustavo K. Rohde | 2024 | Science Advances | vol 10 | no 24 | doi 10.1126/sciadv.adl5307
OpenAlex: ratio 1.00: Discovering the gene-brain-behavior link in autism via generative machine learning | Shinjini Kundu, Haris Iqbal Sair, Elliott H. Sherr, Pratik Mukherjee, Gustavo Kunde Rohde | 2024 | Science Advances | vol 10 | no 24 | pages eadl5307--eadl5307 | doi 10.1126/sciadv.adl5307 | OpenAlex W4399562726 | open access https://www.science.org/doi/pdf/10.1126/sciadv.adl5307?download=true
Semantic Scholar: ratio 1.00: Discovering the gene-brain-behavior link in autism via generative machine learning | Shinjini Kundu, H. Sair, E. Sherr, Pratik Mukherjee, G. Rohde | 2024 | Science Advances | vol 10 | doi 10.1126/sciadv.adl5307 | Semantic Scholar 50ac7c00ee8782d44fa96c24af2ef8c7a6748597 | open access https://www.science.org/doi/pdf/10.1126/sciadv.adl5307?download=true
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dadashkarimi2023cross
Command: python3 lookup resolve '10.1016/j.media.2023.102864'
```
Crossref: ratio 1.00: Cross Atlas Remapping via Optimal Transport (CAROT): Creating connectomes for different atlases when raw data is not available | Javid Dadashkarimi, Amin Karbasi, Qinghao Liang, Matthew Rosenblatt, Stephanie Noble, Maya Foster, Raimundo Rodriguez, Brendan Adkinson, Jean Ye, Huili Sun, Chris Camp, Michael Farruggia, Link Tejavibulya, Wei Dai, Rongtao Jiang, Angeliki Pollatou, Dustin Scheinost | 2023 | Medical Image Analysis | vol 88 | pages 102864 | doi 10.1016/j.media.2023.102864
OpenAlex: ratio 0.95: Cross Atlas Remapping via Optimal Transport (CAROT): Creating connectomes for any atlas when raw data is not available | Javid Dadashkarimi, Amin Karbasi, Qinghao Liang, Matthew Rosenblatt, Stephanie Noble, Maya L. Foster, Raimundo X. Rodriguez, Brendan D. Adkinson, Jean Ye, Huili Sun, Chris Camp, Michael Farruggia, Link Tejavibulya, Wei Dai, Rongtao Jiang, Angeliki Pollatou, Dustin Scheinost | 2022 | Medical Image Analysis | vol 88 | pages 102864--102864 | doi 10.1016/j.media.2023.102864 | OpenAlex W4379879414 | open access https://www.sciencedirect.com/science/article/am/pii/S136184152300124X
Semantic Scholar: ratio 1.00: Cross Atlas Remapping via Optimal Transport (CAROT): Creating connectomes for different atlases when raw data is not available | J. Dadashkarimi, Amin Karbasi, Qing-Hao Liang, M. Rosenblatt, S. Noble, Maya L. Foster, R. Rodriguez, B. Adkinson, Jean Ye, Hui-Li Sun, C. Camp, Michael C. Farruggia, Link Tejavibulya, Wei Dai, Rong-Tao Jiang, A. Pollatou, D. Scheinost | 2023 | Medical Image Anal. | vol 88 | pages 102864--102864 | doi 10.1016/j.media.2023.102864 | Semantic Scholar cea68dc22bbea44c66cadd0c2d1d2bce2dbc60bf | open access https://www.sciencedirect.com/science/article/am/pii/S136184152300124X
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### mahan2024point
Command: python3 lookup resolve '2401.01460'
```
Crossref: not found
OpenAlex: ratio 1.00: Point Cloud Classification via Deep Set Linearized Optimal Transport | Scott P. Mahan, Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2024 | arXiv (Cornell University) | doi 10.48550/arxiv.2401.01460 | arXiv 2401.01460 | OpenAlex W4390601194 | open access https://arxiv.org/pdf/2401.01460
Semantic Scholar: ratio 1.00: Point Cloud Classification via Deep Set Linearized Optimal Transport | Scott Mahan, Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2024 | arXiv.org | vol abs/2401.01460 | doi 10.48550/arXiv.2401.01460 | arXiv 2401.01460 | Semantic Scholar cd9333c9ca648d0c10dfa02982268ebef06fa4f1
arXiv: ratio 1.00: Point Cloud Classification via Deep Set Linearized Optimal Transport | Scott Mahan, Caroline Moosm<latin small letter u with diaeresis>ller, Alexander Cloninger | 2024 | arXiv 2401.01460
```
Exit status: 0

### wang2024graph
Command: python3 lookup resolve '10.52202/079017-4374'
```
Crossref: ratio 1.00: Graph Classification via Reference Distribution Learning: Theory and Practice | Zixiao Wang, Jicong Fan | 2024 | Advances in Neural Information Processing Systems 37 | pages 137698--137740 | doi 10.52202/079017-4374
OpenAlex: ratio 1.00: Graph Classification via Reference Distribution Learning: Theory and Practice | Zixiao Wang, Jicong Fan | 2024 | neural information processing systems | pages 137698--137740 | doi 10.52202/079017-4374 | OpenAlex W4415800566 | open access https://arxiv.org/pdf/2408.11370
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kwon2025graph
Command: python3 lookup resolve '10.1016/j.media.2025.103538'
```
Crossref: ratio 1.00: Graph-based prototype inverse-projection for identifying cortical sulcal pattern abnormalities in congenital heart disease | Hyeokjin Kwon, Seungyeon Son, Sarah U. Morton, David Wypij, John Cleveland, Caitlin K Rollins, Hao Huang, Elizabeth Goldmuntz, Ashok Panigrahy, Nina H. Thomas, Wendy K. Chung, Evdokia Anagnostou, Ami Norris-Brilliant, Bruce D. Gelb, Patrick McQuillen, George A. Porter, Martin Tristani-Firouzi, Mark W. Russell, Amy E. Roberts, Jane W. Newburger, P. Ellen Grant, Jong-Min Lee, Kiho Im | 2025 | Medical Image Analysis | vol 102 | pages 103538 | doi 10.1016/j.media.2025.103538
OpenAlex: ratio 1.00: Graph-based prototype inverse-projection for identifying cortical sulcal pattern abnormalities in congenital heart disease | Hyeokjin Kwon, Seungyeon Son, Sarah U. Morton, David Wypij, John Cleveland, Caitlin K. Rollins, Hao Huang, Elizabeth Goldmuntz, Ashok Panigrahy, Nina H. Thomas, Wendy K. Chung, Evdokia A. Anagnostou, Ami Norris<hyphen>Brilliant, Bruce D. Gelb, Patrick S. McQuillen, George A. Porter, Martin Tristani<hyphen>Firouzi, Mark W. W. Russell, Amy E. Roberts, Jane W. Newburger, Patricia Ellen Grant, Jongmin Lee, Kiho Im | 2025 | Medical Image Analysis | vol 102 | pages 103538--103538 | doi 10.1016/j.media.2025.103538 | OpenAlex W4408052092 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841525000854
Semantic Scholar: ratio 1.00: Graph-based Prototype Inverse-Projection for Identifying Cortical Sulcal Pattern Abnormalities in Congenital Heart Disease | Hyeokjin Kwon, Seoung-Yeon Son, S. Morton, D. Wypij, J. Cleveland, C. Rollins, Hao Huang, E. Goldmuntz, A. Panigrahy, Nina H. Thomas, Wendy K. Chung, Evdokia Anagnoustou, A. Norris-Brilliant, B. Gelb, P. McQuillen, G. Porter, M. Tristani-Firouzi, M. W. Russell, Amy E. Roberts, J. Newburger, P. Grant, J. Lee, K. Im | 2025 | Medical Image Analysis | vol 102 | pages 103538--103538 | doi 10.1016/j.media.2025.103538 | Semantic Scholar 90e07a0cb2eb884681c367b0b014566b9558f800 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841525000854
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### aramayo2023uncovering
Command: python3 lookup resolve '2303.05978'
```
Crossref: not found
OpenAlex: ratio 1.00: Uncovering Challenges of Solving the Continuous Gromov-Wasserstein Problem | Carrasco, Xavier Aramayo, Maksim Nekrashevich, Mokrov, Petr, Evgeny Vladimirovich Burnaev, Alexander Andreevich Korotin | 2023 | arXiv (Cornell University) | doi 10.48550/arxiv.2303.05978 | arXiv 2303.05978 | OpenAlex W4324106608 | open access https://arxiv.org/pdf/2303.05978
Semantic Scholar: ratio 1.00: Uncovering Challenges of Solving the Continuous Gromov-Wasserstein Problem | Xavier Aramayo Carrasco, Maksim Nekrashevich, Petr Mokrov, Evgeny Burnaev, Alexander Korotin | 2023 | arXiv 2303.05978 | Semantic Scholar 121ec595c83fde7065b78559d7b78e230718e6b4
arXiv: ratio 1.00: Uncovering Challenges of Solving the Continuous Gromov-Wasserstein Problem | Xavier Aramayo Carrasco, Maksim Nekrashevich, Petr Mokrov, Evgeny Burnaev, Alexander Korotin | 2023 | arXiv 2303.05978
```
Exit status: 0

### nguyen2023linear
Command: python3 lookup resolve '10.1016/j.patcog.2023.109351'
```
Crossref: ratio 1.00: On a linear fused Gromov-Wasserstein distance for graph structured data | Dai Hai Nguyen, Koji Tsuda | 2023 | Pattern Recognition | vol 138 | pages 109351 | doi 10.1016/j.patcog.2023.109351
OpenAlex: ratio 1.00: On a linear fused Gromov-Wasserstein distance for graph structured data | Hai Nguyen, Koji Tsuda | 2023 | Pattern Recognition | vol 138 | no 109351 | pages 109351--109351 | doi 10.1016/j.patcog.2023.109351 | OpenAlex W4317932208 | open access https://www.sciencedirect.com/science/article/am/pii/S0031320323000523
Semantic Scholar: ratio 1.00: On a linear fused Gromov-Wasserstein distance for graph structured data | Dai Hai Nguyen, K. Tsuda | 2022 | Pattern Recognition | vol abs/2203.04711 | doi 10.1016/j.patcog.2023.109351 | arXiv 2203.04711 | Semantic Scholar 2230cec2ca3405545da0f61287bbb949395a56c5 | open access https://www.sciencedirect.com/science/article/am/pii/S0031320323000523
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2023wasserstein
Command: python3 lookup resolve '10.1080/01621459.2021.1956937'
```
Crossref: ratio 1.00: Wasserstein Regression | Yaqing Chen, Zhenhua Lin, Hans-Georg M<latin small letter u with diaeresis>ller | 2021 | Journal of the American Statistical Association | vol 118 | no 542 | pages 869--882 | doi 10.1080/01621459.2021.1956937
OpenAlex: ratio 1.00: Wasserstein Regression | Yaqing Chen, Zhenhua Lin, Hans<hyphen>Georg M<latin small letter u with diaeresis>ller | 2021 | Journal of the American Statistical Association | vol 118 | no 542 | pages 869--882 | doi 10.1080/01621459.2021.1956937 | OpenAlex W4205465859 | open access https://arxiv.org/pdf/2006.09660
Semantic Scholar: ratio 1.00: Wasserstein Regression | Ya-Qing Chen, Zhen-Hua Lin, Hans-Georg M<latin small letter u with diaeresis>ller | 2020 | Journal of the American Statistical Association | vol 118 | pages 869--882 | doi 10.1080/01621459.2021.1956937 | arXiv 2006.09660 | Semantic Scholar 99d884a6f8dbe34c9d19aaf0ea0da41c46efa9bc | open access https://arxiv.org/pdf/2006.09660
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### feydy2019fast
Command: python3 lookup resolve '10.1007/978-3-030-32248-9_71'
```
Crossref: ratio 1.00: Fast and Scalable Optimal Transport for Brain Tractograms | Jean Feydy, Pierre Roussillon, Alain Trouv<latin small letter e with acute>, Pietro Gori | 2019 | Lecture Notes in Computer Science | pages 636--644 | doi 10.1007/978-3-030-32248-9_71
OpenAlex: ratio 1.00: Fast and Scalable Optimal Transport for Brain Tractograms | Jean Feydy, Pierre Roussillon, A. Trouv<latin small letter e with acute>, Pietro Gori | 2019 | Lecture notes in computer science | pages 636--644 | doi 10.1007/978-3-030-32248-9_71 | OpenAlex W2979675031 | open access https://telecom-paris.hal.science/hal-02264177/document
Semantic Scholar: ratio 1.00: Fast and Scalable Optimal Transport for Brain Tractograms | J. Feydy, Pierre Roussillon, A. Trouv<latin small letter e with acute>, P. Gori | 2019 | International Conference on Medical Image Computing and Computer-Assisted Intervention | pages 636--644 | doi 10.1007/978-3-030-32248-9_71 | arXiv 2107.02010 | Semantic Scholar 03dbb41cfd71fa0ad998aa8ee21b9396a400e5ab | open access https://telecom-paris.hal.science/hal-02264177/document
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### shi2016shape
Command: python3 lookup resolve '10.1109/cvpr.2016.546'
```
Crossref: ratio 1.00: Shape Analysis with Hyperbolic Wasserstein Distance | Jie Shi, Wen Zhang, Yalin Wang | 2016 | 2016 IEEE Conference on Computer Vision and Pattern Recognition (CVPR) | pages 5051--5061 | doi 10.1109/cvpr.2016.546
OpenAlex: ratio 1.00: Shape Analysis with Hyperbolic Wasserstein Distance | Jie Shi, Wen Zhang, Yalin Wang | 2016 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | vol 2016 | pages 5051--5061 | doi 10.1109/cvpr.2016.546 | OpenAlex W2420237017 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC5383000/
Semantic Scholar: ratio 1.00: Shape Analysis with Hyperbolic Wasserstein Distance | Jie Shi, Wen Zhang, Y. Wang | 2016 | Computer Vision and Pattern Recognition | vol 2016 | pages 5051--5061 | doi 10.1109/CVPR.2016.546 | Semantic Scholar 76470fb3b2e7fda802b0a81e374489bfd9356f87 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC5383000/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yan2026gwdro
Command: python3 lookup resolve '10.1038/s41746-026-03323-9'
```
Crossref: ratio 1.00: GWDRO-Lung: Gromov<en dash>Wasserstein distributionally robust learning for calibrated pulmonary nodule malignancy prediction across imaging cohorts | Yubo Yan, An Yan, Wen Li, Jianlong Bu, Jinfeng Ning | 2026 | npj Digital Medicine | doi 10.1038/s41746-026-03323-9
OpenAlex: ratio 1.00: GWDRO-Lung: Gromov<en dash>Wasserstein distributionally robust learning for calibrated pulmonary nodule malignancy prediction across imaging cohorts | Yubo Yan, An Yan, Wen Li, Jianlong Bu, Jinfeng Ning | 2026 | npj Digital Medicine | doi 10.1038/s41746-026-03323-9 | OpenAlex W7222822304 | open access https://www.nature.com/articles/s41746-026-03323-9_reference.pdf
Semantic Scholar: ratio 1.00: GWDRO-Lung: Gromov<en dash>Wasserstein distributionally robust learning for calibrated pulmonary nodule malignancy prediction across imaging cohorts | Yu-Bo Yan, An Yan, Wen Li, Jian-Long Bu, J. Ning | 2026 | npj Digital Medicine | doi 10.1038/s41746-026-03323-9 | Semantic Scholar efb10a6338c77f5535e696393a10eaad8c00ecb9 | open access https://www.nature.com/articles/s41746-026-03323-9_reference.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### peng2026wasserstein
Command: python3 lookup resolve '10.1109/tcds.2026.3722535'
```
Crossref: ratio 1.00: Wasserstein Graph Topological Learning for Brain Network Classification | Yi Peng, Donghai Guan, Shengrong Li, Zhiqiang Zhang, Qi Zhu | 2026 | IEEE Transactions on Cognitive and Developmental Systems | pages 1--14 | doi 10.1109/tcds.2026.3722535
OpenAlex: ratio 1.00: Wasserstein Graph Topological Learning for Brain Network Classification | Yi Peng, Donghai Guan, Shengrong Li, Zhiqiang Zhang, Qi Zhu | 2026 | IEEE Transactions on Cognitive and Developmental Systems | pages 1--14 | doi 10.1109/tcds.2026.3722535 | OpenAlex W7202164716 | open access https://doi.org/10.1109/tcds.2026.3722535
Semantic Scholar: ratio 1.00: Wasserstein Graph Topological Learning for Brain Network Classification | Yi Peng, Dong-Hai Guan, Sheng-Rong Li, Zhi-Qiang Zhang, Qi Zhu | 2026 | IEEE Transactions on Cognitive and Developmental Systems | doi 10.1109/tcds.2026.3722535 | Semantic Scholar b0e441fc80d32526fcc14ce7c7a28a29c18706ee | open access https://doi.org/10.1109/tcds.2026.3722535
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### su2015optimal
Command: python3 lookup resolve '10.1109/tpami.2015.2408346'
```
Crossref: ratio 1.00: Optimal Mass Transport for Shape Matching and Comparison | Zhengyu Su, Yalin Wang, Rui Shi, Wei Zeng, Jian Sun, Feng Luo, Xianfeng Gu | 2015 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 37 | no 11 | pages 2246--2259 | doi 10.1109/tpami.2015.2408346
OpenAlex: ratio 1.00: Optimal Mass Transport for Shape Matching and Comparison | Zhengyu Su, Yalin Wang, Rui Shi, Wei Zeng, Jian Sun, Feng Luo, Xianfeng David Gu | 2015 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 37 | no 11 | pages 2246--2259 | doi 10.1109/tpami.2015.2408346 | OpenAlex W2024849762 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4602172
Semantic Scholar: ratio 1.00: Optimal Mass Transport for Shape Matching and Comparison | Zhengyu Su, Y. Wang, Rui Shi, W. Zeng, Jian Sun, F. Luo, X. Gu | 2015 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 37 | pages 2246--2259 | doi 10.1109/TPAMI.2015.2408346 | Semantic Scholar e69a57639e0a2c30c3127b67092b5535c719440f | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4602172
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### solomon2016entropic
Command: python3 lookup resolve '10.1145/2897824.2925903'
```
Crossref: ratio 1.00: Entropic metric alignment for correspondence problems | Justin Solomon, Gabriel Peyr<latin small letter e with acute>, Vladimir G. Kim, Suvrit Sra | 2016 | ACM Transactions on Graphics | vol 35 | no 4 | pages 1--13 | doi 10.1145/2897824.2925903
OpenAlex: ratio 1.00: Entropic metric alignment for correspondence problems | Justin Solomon, Gabriel Peyr<latin small letter e with acute>, Vladimir G. Kim, Suvrit Sra | 2016 | ACM Transactions on Graphics | vol 35 | no 4 | pages 1--13 | doi 10.1145/2897824.2925903 | OpenAlex W2474265885 | open access http://dl.acm.org/ft_gateway.cfm?id=2925903&type=pdf
Semantic Scholar: ratio 1.00: Entropic metric alignment for correspondence problems | J. Solomon, G. Peyr<latin small letter e with acute>, Vladimir G. Kim, Suvrit Sra | 2016 | ACM Transactions on Graphics | vol 35 | pages 1--13 | doi 10.1145/2897824.2925903 | Semantic Scholar 5e72c983087e830225712b394eb60b7e1977f4a4 | open access http://dl.acm.org/ft_gateway.cfm?id=2925903&type=pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### naderializadeh2021pooling
No DOI and no arXiv ID; url: https://proceedings.neurips.cc/paper/2021/hash/1bc2029a8851ad344a8d503930dfd7f7-Abstract.html. Checked by WebFetch of the url (recorded below by the session).

### gachon2025low
Command: python3 lookup resolve '10.1002/cyto.a.24918'
```
Crossref: ratio 1.00: Low Dimensional Representation of Multi<hyphen>Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia | Erell Gachon, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot, Elsa Cazelles, Audrey Bidet, Jean<hyphen>Philippe Vial, Pierre<hyphen>Yves Dumas, Aguirre Mimoun | 2025 | Cytometry Part A | vol 107 | no 2 | pages 126--139 | doi 10.1002/cyto.a.24918
OpenAlex: ratio 1.00: Low Dimensional Representation of Multi<hyphen>Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia | Erell Gachon, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot, Elsa Cazelles, Audrey Bidet, Jean Vial, Pierre<hyphen>Yves Dumas, Aguirre Mimoun | 2025 | Cytometry Part A | vol 107 | no 2 | pages 126--139 | doi 10.1002/cyto.a.24918 | OpenAlex W4408161545 | open access https://doi.org/10.1002/cyto.a.24918
Semantic Scholar: ratio 1.00: Low Dimensional Representation of Multi<hyphen>Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia | E. Gachon, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot, Elsa Cazelles, A. Bidet, J. Vial, P. Dumas, A. Mimoun | 2024 | Cytometry Part A | vol 107 | doi 10.1002/cyto.a.24918 | arXiv 2407.17329 | Semantic Scholar eeda175edefd8c88a47f023d8f5b659a634e7fb5 | open access https://doi.org/10.1002/cyto.a.24918
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ma2024canonicalization
Command: python3 lookup resolve '10.52202/079017-1948'
```
Crossref: ratio 1.00: A Canonicalization Perspective on Invariant and Equivariant Learning | George Ma, Yifei Wang, Derek Lim, Stefanie Jegelka, Yisen Wang | 2024 | Advances in Neural Information Processing Systems 37 | pages 60936--60979 | doi 10.52202/079017-1948
OpenAlex: ratio 1.00: A Canonicalization Perspective on Invariant and Equivariant Learning | George Ma, Yifei Wang, Derek Lim, Stefanie Jegelka, Yifei Wang | 2024 | neural information processing systems | pages 60936--60979 | doi 10.52202/079017-1948 | OpenAlex W4415797454 | open access https://arxiv.org/pdf/2405.18378
Semantic Scholar: ratio 1.00: A Canonicalization Perspective on Invariant and Equivariant Learning | George Ma, Yi-Fei Wang, D. Lim, S. Jegelka, Yi-Sen Wang | 2024 | Neural Information Processing Systems | doi 10.52202/079017-1948 | arXiv 2405.18378 | Semantic Scholar 04e6d88d5b8d3833c49ead761a8bc466534f8f17 | open access https://arxiv.org/pdf/2405.18378
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### shao2021transmil
Command: python3 lookup resolve '2106.00908'
```
Crossref: not found
OpenAlex: ratio 1.00: TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification | Zhuchen Shao, Hao Bian, Chen Yang, Wang, Yifeng, Jian Zhang, Xiangyang Ji, Yongbing Zhang | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2106.00908 | arXiv 2106.00908 | OpenAlex W3193968034 | open access https://arxiv.org/pdf/2106.00908
Semantic Scholar: ratio 0.99: TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classication | Zhucheng Shao, Hao Bian, Yang Chen, Yifeng Wang, Jian Zhang, Xiang-Yang Ji, Yong-Bing Zhang | 2021 | Neural Information Processing Systems | vol abs/2106.00908 | doi 10.48550/arXiv.2106.00908 | arXiv 2106.00908 | Semantic Scholar 2153963d19b21e64e55295b69de81d99aadac465 | open access https://arxiv.org/pdf/2106.00908
arXiv: ratio 1.00: TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification | Zhuchen Shao, Hao Bian, Yang Chen, Yifeng Wang, Jian Zhang, Xiangyang Ji, Yongbing Zhang | 2021 | arXiv 2106.00908
```
Exit status: 0

### liu2026three
Command: python3 lookup resolve '10.34133/bmef.0276'
```
Crossref: ratio 1.00: Three-Dimensional Point-Cloud Learning for Patient-Specific Deep Brain Stimulation Motor Response Prediction in Parkinson Disease | Kaiming Liu, Yinghao Zhu, Ru Wang, Zihao Liu, Gongyi Zhu, Zice Wang, Minyan Ge, Bo Shen, Yimin Sun, Fengtao Liu, Jue Zhao, Narasimha M. Beeraka, Virak Sorn, Haiyin Wang, Vladimir N. Nikolenko, Jianjun Wu, Shumao Xu | 2026 | BME Frontiers | vol 7 | doi 10.34133/bmef.0276
OpenAlex: ratio 1.00: Three-Dimensional Point-Cloud Learning for Patient-Specific Deep Brain Stimulation Motor Response Prediction in Parkinson Disease | K Liu, Yinghao Zhu, Ru Wang, Zihao Liu, Gongyi Zhu, Zice Wang, Minyan Ge, Bo Shen, Yimin Sun, FengTao Liu, Jue Zhao, Narasimha Murthy Beeraka, Virak Sorn, Haiyin Wang, Vladimir N. Nikolenko, Jianjun Wu, Shumao Xu | 2026 | BME Frontiers | vol 7 | pages 0276--0276 | doi 10.34133/bmef.0276 | OpenAlex W7204692371 | open access https://doi.org/10.34133/bmef.0276
Semantic Scholar: ratio 1.00: Three-Dimensional Point-Cloud Learning for Patient-Specific Deep Brain Stimulation Motor Response Prediction in Parkinson Disease | Kaikai Liu, Ying-Hao Zhu, Ru Wang, Zi-Hao Liu, Gong-Yi Zhu, Zi-Ce Wang, Min-Yan Ge, Bo Shen, Yi-Min Sun, Feng-Tao Liu, Jue Zhao, N. Beeraka, Virak Sorn, Hai-Yin Wang, Vladimir N. Nikolenko, Jianjun Wu, Shu-Mao Xu | 2026 | BME Frontiers | vol 7 | doi 10.34133/bmef.0276 | Semantic Scholar 41b4f7f925135652280098549bc466bbf51c5376 | open access https://doi.org/10.34133/bmef.0276
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wagstaff2022universal
Command: python3 lookup resolve '2107.01959'
```
Crossref: not found
OpenAlex: ratio 1.00: Universal Approximation of Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Michael A. Osborne, Ingmar Posner | 2021 | Oxford University Research Archive (ORA) (University of Oxford) | doi 10.48550/arxiv.2107.01959 | arXiv 2107.01959 | OpenAlex W3182587796 | open access https://ora.ox.ac.uk/objects/uuid:aad96d93-d8a9-4ac4-92a3-cd7bc3e3da96/files/rm326m2506
Semantic Scholar: ratio 1.00: Universal Approximation of Functions on Sets | Edward Wagstaff, F. Fuchs, Martin Engelcke, Michael A. Osborne, I. Posner | 2021 | Journal of machine learning research | vol abs/2107.01959 | doi 10.48550/arXiv.2107.01959 | arXiv 2107.01959 | Semantic Scholar c7c625fc31168b64ed3191f916e446e08baaf9d2 | open access http://arxiv.org/pdf/2107.01959
arXiv: ratio 1.00: Universal Approximation of Functions on Sets | Edward Wagstaff, Fabian B. Fuchs, Martin Engelcke, Michael A. Osborne, Ingmar Posner | 2021 | arXiv 2107.01959
```
Exit status: 0

### islam2026neuroaps
Command: python3 lookup resolve '10.1109/ijcnn69854.2026.11729839'
```
Crossref: ratio 1.00: NeuroAPS-Net: Neuro-Anatomically Aware Point Cloud Representation for Efficient Alzheimer<right single quotation mark>s Disease Classification | Towhidul Islam, Mufti Mahmud | 2026 | 2026 International Joint Conference on Neural Networks (IJCNN) | pages 1--6 | doi 10.1109/ijcnn69854.2026.11729839
OpenAlex: ratio 1.00: NeuroAPS-Net: Neuro-Anatomically Aware Point Cloud Representation for Efficient Alzheimer<right single quotation mark>s Disease Classification | Towhidul Islam, Mufti Mahmud | 2026 | International Joint Conference on Neural Networks (IJCNN) | pages 1--6 | doi 10.1109/ijcnn69854.2026.11729839 | OpenAlex W7157332953 | open access https://arxiv.org/pdf/2604.22883
Semantic Scholar: ratio 1.00: NeuroAPS-Net: Neuro-Anatomically Aware Point Cloud Representation for Efficient Alzheimer<right single quotation mark>s Disease Classification | Towhidul Islam, Mufti Mahmud | 2026 | IEEE International Joint Conference on Neural Network | pages 1--6 | doi 10.1109/IJCNN69854.2026.11729839 | arXiv 2604.22883 | Semantic Scholar f973ac98c5c51989e671300da14f9a96b1aa6348 | open access https://arxiv.org/pdf/2604.22883
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### willette2023scalable
Command: python3 lookup resolve '2208.12401'
```
Crossref: not found
OpenAlex: ratio 1.00: Scalable Set Encoding with Universal Mini-Batch Consistency and Unbiased Full Set Gradient Approximation | Jeffrey Willette, Lee, Seanie, Andreis, Bruno, Kenji Kawaguchi, Lee, Juho, Hwang, Sung Ju | 2022 | arXiv (Cornell University) | doi 10.48550/arxiv.2208.12401 | arXiv 2208.12401 | OpenAlex W4293575508 | open access https://arxiv.org/pdf/2208.12401
Semantic Scholar: ratio 1.00: Scalable Set Encoding with Universal Mini-Batch Consistency and Unbiased Full Set Gradient Approximation | Jeffrey Willette, Seanie Lee, Bruno Andreis, Kenji Kawaguchi, Juho Lee, S. Hwang | 2022 | International Conference on Machine Learning | pages 37008--37041 | arXiv 2208.12401 | Semantic Scholar 61f458fb4d8b3be5cbd26d2fbb11002b5757d9c5
arXiv: ratio 1.00: Scalable Set Encoding with Universal Mini-Batch Consistency and Unbiased Full Set Gradient Approximation | Jeffrey Willette, Seanie Lee, Bruno Andreis, Kenji Kawaguchi, Juho Lee, Sung Ju Hwang | 2022 | arXiv 2208.12401
```
Exit status: 0

### vinyals2016order
Command: python3 lookup resolve '1511.06391'
```
Crossref: not found
OpenAlex: ratio 1.00: Order Matters: Sequence to sequence for sets | Oriol Vinyals, Samy Bengio, Manjunath Kudlur | 2015 | arXiv (Cornell University) | doi 10.48550/arxiv.1511.06391 | arXiv 1511.06391 | OpenAlex W2173183968 | open access https://arxiv.org/pdf/1511.06391
Semantic Scholar: ratio 1.00: Order Matters: Sequence to sequence for sets | O. Vinyals, Samy Bengio, M. Kudlur | 2015 | International Conference on Learning Representations | doi 10.48550/arXiv.1511.06391 | arXiv 1511.06391 | Semantic Scholar d01379ebb53c66a4ccf5f4959d904dcf9e161e41
arXiv: ratio 1.00: Order Matters: Sequence to sequence for sets | Oriol Vinyals, Samy Bengio, Manjunath Kudlur | 2015 | arXiv 1511.06391
```
Exit status: 0

### bloemreddy2020probabilistic
Command: python3 lookup resolve '1901.06082'
```
Crossref: not found
OpenAlex: ratio 1.00: Probabilistic symmetries and invariant neural networks | Benjamin Bloem-Reddy, Yee Whye Teh | 2019 | Oxford University Research Archive (ORA) (University of Oxford) | vol 21 | no 90 | pages 1--61 | doi 10.48550/arxiv.1901.06082 | arXiv 1901.06082 | OpenAlex W3038350744 | open access https://ora.ox.ac.uk/objects/uuid:2be9f9ae-8566-48d3-aa17-108a44176a34/files/sn583xv24n
Semantic Scholar: ratio 0.96: Probabilistic symmetry and invariant neural networks | Benjamin Bloem-Reddy, Y. Teh | 2019 | arXiv.org | vol abs/1901.06082 | doi 10.48550/arXiv.1901.06082 | arXiv 1901.06082 | Semantic Scholar fa7af221e7773033fed816f0fe29209cb4ed4283
arXiv: ratio 1.00: Probabilistic symmetries and invariant neural networks | Benjamin Bloem-Reddy, Yee Whye Teh | 2019 | arXiv 1901.06082
```
Exit status: 0

### maron1997framework
No DOI and no arXiv ID; url: https://proceedings.neurips.cc/paper/1997/hash/82965d4ed8150294d4330ace00821d77-Abstract.html. Checked by WebFetch of the url (recorded below by the session).

### amir2025fourier
Command: python3 lookup resolve '2405.16519'
```
Crossref: not found
OpenAlex: ratio 1.00: Fourier Sliced-Wasserstein Embedding for Multisets and Measures | Tal Amir, Nadav Dym | 2024 | International Conference on Learning Representations | doi 10.48550/arxiv.2405.16519 | arXiv 2405.16519 | OpenAlex W4399115724 | open access https://proceedings.iclr.cc/paper_files/paper/2025/hash/3dbb8b6b5576b85afb3037e9630812dc-Abstract-Conference.html
Semantic Scholar: ratio 1.00: Fourier Sliced-Wasserstein Embedding for Multisets and Measures | Tal Amir, Nadav Dym | 2024 | International Conference on Learning Representations | vol abs/2504.02544 | doi 10.48550/arXiv.2504.02544 | arXiv 2504.02544 | Semantic Scholar d69bdfb1e898ea9356618c7e20269a7cda4e151e
arXiv: ratio 1.00: Fourier Sliced-Wasserstein Embedding for Multisets and Measures | Tal Amir, Nadav Dym | 2024 | arXiv 2405.16519
```
Exit status: 0

### puny2022frame
Command: python3 lookup resolve '2110.03336'
```
Crossref: not found
OpenAlex: ratio 1.00: Frame Averaging for Invariant and Equivariant Network Design | Omri Puny, Matan Atzmon, Heli Ben-Hamu, Ishan Misra, Aditya Grover, Smith, Edward J., Yaron Lipman | 2021 | arXiv (Cornell University) | doi 10.48550/arxiv.2110.03336 | arXiv 2110.03336 | OpenAlex W3204723935 | open access https://arxiv.org/pdf/2110.03336
Semantic Scholar: ratio 1.00: Frame Averaging for Invariant and Equivariant Network Design | Omri Puny, Matan Atzmon, Heli Ben-Hamu, Ishan Misra, Aditya Grover, Edward James Smith, Y. Lipman | 2021 | International Conference on Learning Representations | vol abs/2110.03336 | doi 10.48550/arXiv.2110.03336 | arXiv 2110.03336 | Semantic Scholar c5f3ce9c1a9b64ecd093c40b42cffe1819d6092f | open access http://arxiv.org/pdf/2110.03336
arXiv: ratio 1.00: Frame Averaging for Invariant and Equivariant Network Design | Omri Puny, Matan Atzmon, Heli Ben-Hamu, Ishan Misra, Aditya Grover, Edward J. Smith, Yaron Lipman | 2021 | arXiv 2110.03336
```
Exit status: 0

### zhang2022set
Command: python3 lookup resolve '2206.11925'
```
Crossref: not found
OpenAlex: ratio 1.00: Set Norm and Equivariant Skip Connections: Putting the Deep in Deep Sets | Lily Zhang, Veronica Tozzo, John M. Higgins, Rajesh Ranganath | 2022 | PubMed | vol 162 | pages 26559--26574 | doi 10.48550/arxiv.2206.11925 | arXiv 2206.11925 | OpenAlex W4386272587 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC10465016/pdf/nihms-1900325.pdf
Semantic Scholar: ratio 1.00: Set Norm and Equivariant Skip Connections: Putting the Deep in Deep Sets | Lily H. Zhang, V. Tozzo, J. Higgins, Rajesh Ranganath | 2022 | International Conference on Machine Learning | vol 162 | pages 26559--26574 | doi 10.48550/arXiv.2206.11925 | arXiv 2206.11925 | Semantic Scholar e873895dde7483deae0aa85b69c5062f42b2f392 | open access http://arxiv.org/pdf/2206.11925
arXiv: ratio 1.00: Set Norm and Equivariant Skip Connections: Putting the Deep in Deep Sets | Lily H. Zhang, Veronica Tozzo, John M. Higgins, Rajesh Ranganath | 2022 | arXiv 2206.11925
```
Exit status: 0

### skianis2020rep
Command: python3 lookup resolve '1904.01962'
```
Crossref: not found
OpenAlex: ratio 1.00: Rep the Set: Neural Networks for Learning Set Representations | Konstantinos Skianis, Giannis Nikolentzos, Stratis Limnios, Michalis Vazirgiannis | 2019 | arXiv (Cornell University) | pages 1410--1420 | doi 10.48550/arxiv.1904.01962 | arXiv 1904.01962 | OpenAlex W3037646323 | open access https://arxiv.org/pdf/1904.01962
Semantic Scholar: ratio 1.00: Rep the Set: Neural Networks for Learning Set Representations | Konstantinos Skianis, Giannis Nikolentzos, Stratis Limnios, M. Vazirgiannis | 2019 | International Conference on Artificial Intelligence and Statistics | vol abs/1904.01962 | doi 10.48550/arXiv.1904.01962 | arXiv 1904.01962 | Semantic Scholar ac1d8a294303c04973df00731e32ac6b9af8c6db
arXiv: ratio 1.00: Rep the Set: Neural Networks for Learning Set Representations | Konstantinos Skianis, Giannis Nikolentzos, Stratis Limnios, Michalis Vazirgiannis | 2019 | arXiv 1904.01962
```
Exit status: 0

### kothapalli2024equivariant
Command: python3 lookup resolve '2306.05553'
```
Crossref: not found
OpenAlex: ratio 1.00: Equivariant vs. Invariant Layers: A Comparison of Backbone and Pooling for Point Cloud Classification | Abihith Kothapalli, Ashkan Shahbazi, Xinran Liu, Robert Sheng, Soheil Kolouri | 2023 | arXiv (Cornell University) | doi 10.48550/arxiv.2306.05553 | arXiv 2306.05553 | OpenAlex W4380352321 | open access https://arxiv.org/pdf/2306.05553
Semantic Scholar: ratio 1.00: Equivariant vs. Invariant Layers: A Comparison of Backbone and Pooling for Point Cloud Classification | Abihith Kothapalli, Ashkan Shahbazi, Xin-Ran Liu, Robert Sheng, Soheil Kolouri | 2023 | GRaM | vol abs/2306.05553 | doi 10.48550/arXiv.2306.05553 | arXiv 2306.05553 | Semantic Scholar 8843ba92df447d9b001219884b2d12c9bf015dd0 | open access http://arxiv.org/pdf/2306.05553
arXiv: ratio 1.00: Equivariant vs. Invariant Layers: A Comparison of Backbone and Pooling for Point Cloud Classification | Abihith Kothapalli, Ashkan Shahbazi, Xinran Liu, Robert Sheng, Soheil Kolouri | 2023 | arXiv 2306.05553
```
Exit status: 0

### prokudin2019efficient
Command: python3 lookup resolve '10.1109/iccv.2019.00443'
```
Crossref: ratio 1.00: Efficient Learning on Point Clouds With Basis Point Sets | Sergey Prokudin, Christoph Lassner, Javier Romero | 2019 | 2019 IEEE/CVF International Conference on Computer Vision (ICCV) | pages 4331--4340 | doi 10.1109/iccv.2019.00443
OpenAlex: ratio 1.00: Efficient Learning on Point Clouds With Basis Point Sets | Sergey Prokudin, Christoph Lassner, Javier Romero | 2019 | IEEE/CVF International Conference on Computer Vision (ICCV) | pages 4331--4340 | doi 10.1109/iccv.2019.00443 | OpenAlex W2969694596
Semantic Scholar: ratio 1.00: Efficient Learning on Point Clouds With Basis Point Sets | S. Prokudin, Christoph Lassner, J. Romero | 2019 | IEEE International Conference on Computer Vision | pages 4331--4340 | doi 10.1109/ICCV.2019.00443 | arXiv 1908.09186 | Semantic Scholar 4502a2773c9a6851ad1fb57904e84c8b0572ba95
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### oner2023distribution
Command: python3 lookup resolve '10.1016/j.media.2023.102813'
```
Crossref: ratio 1.00: Distribution based MIL pooling filters: Experiments on a lymph node metastases dataset | Mustafa Umit Oner, Jared Marc Song Kye-Jet, Hwee Kuan Lee, Wing-Kin Sung | 2023 | Medical Image Analysis | vol 87 | pages 102813 | doi 10.1016/j.media.2023.102813
OpenAlex: ratio 1.00: Distribution based MIL pooling filters: Experiments on a lymph node metastases dataset | Mustafa <latin capital letter u with diaeresis>mit <latin capital letter o with diaeresis>ner, Jared Marc Song Kye-Jet, Hwee Kuan Lee, Wing-Kin Ken Sung | 2023 | Medical Image Analysis | vol 87 | pages 102813--102813 | doi 10.1016/j.media.2023.102813 | OpenAlex W4366490797 | open access https://doi.org/10.1016/j.media.2023.102813
Semantic Scholar: ratio 1.00: Distribution based MIL pooling filters: Experiments on a lymph node metastases dataset | Mustafa Umit Oner, Jared Marc Song Kye-Jet, Hwee Kuan Lee, Wing-Kin Sung | 2023 | Medical Image Anal. | vol 87 | pages 102813 | doi 10.1016/j.media.2023.102813 | Semantic Scholar 2379a795e2eb260ae2eeb71c826048ee3f0c789c | open access https://doi.org/10.1016/j.media.2023.102813
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yao2020whole
Command: python3 lookup resolve '10.1016/j.media.2020.101789'
```
Crossref: ratio 1.00: Whole slide images based cancer survival prediction using attention guided deep multiple instance learning networks | Jiawen Yao, Xinliang Zhu, Jitendra Jonnagaddala, Nicholas Hawkins, Junzhou Huang | 2020 | Medical Image Analysis | vol 65 | pages 101789 | doi 10.1016/j.media.2020.101789
OpenAlex: ratio 1.00: Whole slide images based cancer survival prediction using attention guided deep multiple instance learning networks | Jiawen Yao, Xinliang Zhu, Jitendra Jonnagaddala, Nicholas John Hawkins, Junzhou Huang | 2020 | Medical Image Analysis | vol 65 | pages 101789--101789 | doi 10.1016/j.media.2020.101789 | OpenAlex W3043535018 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841520301535
Semantic Scholar: ratio 1.00: Whole slide images based cancer survival prediction using attention guided deep multiple instance learning networks | Jiawen Yao, Xin-Liang Zhu, Jitendra Jonnagaddala, N. Hawkins, Jun-Zhou Huang | 2020 | Medical Image Anal. | vol 65 | pages 101789 | doi 10.1016/j.media.2020.101789 | arXiv 2009.11169 | Semantic Scholar f0c24d4ba514081a7bc77905e3e12998937ba68b | open access https://www.sciencedirect.com/science/article/am/pii/S1361841520301535
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### law2018bayesian
Command: python3 lookup resolve '1705.04293'
```
Crossref: not found
OpenAlex: ratio 1.00: Bayesian Approaches to Distribution Regression | Ho Chung Leon Law, Danica J. Sutherland, Dino Sejdinovi<latin small letter c with acute>, Seth R Flaxman | 2017 | arXiv (Cornell University) | pages 1167--1176 | doi 10.48550/arxiv.1705.04293 | arXiv 1705.04293 | OpenAlex W2613950051 | open access https://arxiv.org/pdf/1705.04293
Semantic Scholar: ratio 1.00: Bayesian Approaches to Distribution Regression | Ho Chung Leon Law, Danica J. Sutherland, D. Sejdinovic, S. Flaxman | 2017 | International Conference on Artificial Intelligence and Statistics | pages 1167--1176 | arXiv 1705.04293 | Semantic Scholar f35f56b7048a74244ab0530e4bc705cc71125862
arXiv: ratio 1.00: Bayesian Approaches to Distribution Regression | Ho Chung Leon Law, Danica J. Sutherland, Dino Sejdinovic, Seth Flaxman | 2017 | arXiv 1705.04293
```
Exit status: 0

### yi2021cytoset
Command: python3 lookup resolve '10.1101/2021.04.13.439702'
```
Crossref: ratio 1.00: CytoSet: Predicting clinical outcomes via set-modeling of cytometry data | Haidong Yi, Natalie Stanley | 2021 | doi 10.1101/2021.04.13.439702
OpenAlex: ratio 1.00: CytoSet: Predicting clinical outcomes via set-modeling of cytometry data | Haidong Yi, Natalie Stanley | 2021 | bioRxiv (Cold Spring Harbor Laboratory) | doi 10.1101/2021.04.13.439702 | OpenAlex W3155049638 | open access https://www.biorxiv.org/content/biorxiv/early/2021/07/02/2021.04.13.439702.full.pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### vanchhay2026foundation
Command: python3 lookup resolve '2610.41328'
```
Crossref: not found
OpenAlex: ratio 1.00: With foundation-model features, aggregator complexity does not improve cross-hospital discrimination in gastric whole-slide image classification | Nheng Vanchhay, Ali Hussain, Khan Ziaullah, Moon-Il Joo, Md Ariful Islam Mozumder, Rashedul Islam Sumon, Wonae Lee, Min-Sun Cho, Hyeong-Chan Shin, Yujun Park, Baek Hwan Cho, Nam-Hoon Cho, Heejung An, HeungKook Choi, Haeyoun Kang, Hyunki Kim, Hee Cheol Kim | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2610.41328 | arXiv 2610.41328 | OpenAlex W7225120190 | open access https://arxiv.org/pdf/2610.41328
Semantic Scholar: ratio 1.00: With foundation-model features, aggregator complexity does not improve cross-hospital discrimination in gastric whole-slide image classification | Nheng Vanchhay, Ali Hussain, Khan Ziaullah, Moon-Il Joo, Md Ariful Islam Mozumder, Rashedul Islam Sumon, Wonae Lee, Min-Sun Cho, H. Shin, Yujun Park, B. Cho, N. Cho, H. An, H. Choi, Haeyoun Kang, Hyunki Kim, Hee-Cheol Kim | 2026 | arXiv 2610.41328 | Semantic Scholar 44cabc2a132ba44c04d3d9041630f8e071cc037c
arXiv: ratio 1.00: With foundation-model features, aggregator complexity does not improve cross-hospital discrimination in gastric whole-slide image classification | Nheng Vanchhay, Ali Hussain, Khan Ziaullah, Moon-Il Joo, Md Ariful Islam Mozumder, Rashedul Islam Sumon, Won-Ae Lee, Min-Sun Cho, Hyeong-Chan Shin, Yujun Park, Baek Hwan Cho, Nam-Hoon Cho, Heejung An, Heung-Kook Choi, Haeyoun Kang, Hyunki Kim, Hee Cheol Kim | 2026 | arXiv 2610.41328
```
Exit status: 0

### chen2021whole
Command: python3 lookup resolve '10.1007/978-3-030-87237-3_33'
```
Crossref: ratio 1.00: Whole Slide Images are 2D Point Clouds: Context-Aware Survival Prediction Using Patch-Based Graph Convolutional Networks | Richard J. Chen, Ming Y. Lu, Muhammad Shaban, Chengkuan Chen, Tiffany Y. Chen, Drew F. K. Williamson, Faisal Mahmood | 2021 | Lecture Notes in Computer Science | pages 339--349 | doi 10.1007/978-3-030-87237-3_33
OpenAlex: ratio 1.00: Whole Slide Images are 2D Point Clouds: Context-Aware Survival Prediction Using Patch-Based Graph Convolutional Networks | Richard J. Chen, Ming Y. Lu, Muhammad Shaban, Chengkuan Chen, Tiffany Chen, Drew F. K. Williamson, Faisal Mahmood | 2021 | Lecture notes in computer science | pages 339--349 | doi 10.1007/978-3-030-87237-3_33 | OpenAlex W3185545942 | open access https://arxiv.org/pdf/2107.13048
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yuan2026bagshift
Command: python3 lookup resolve '2608.15970'
```
Crossref: not found
OpenAlex: ratio 1.00: BagShift: Measuring How Patch Selection Changes the Evidence Seen by Whole-Slide MIL | Ruicheng Yuan, Zhenxuan Zhang, Liwei Hu, Anbang Wang, Haijie Xu, Jiawei Luo, Guang Yang | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2608.15970 | arXiv 2608.15970 | OpenAlex W7203684208 | open access https://arxiv.org/pdf/2608.15970
Semantic Scholar: ratio 1.00: BagShift: Measuring How Patch Selection Changes the Evidence Seen by Whole-Slide MIL | Rui Yuan, Zhen-Xuan Zhang, Li-Wei Hu, An-Bang Wang, Hai-Jie Xu, Jia-Wei Luo, Guang Yang | 2026 | arXiv.org | vol abs/2608.15970 | doi 10.48550/arXiv.2608.15970 | arXiv 2608.15970 | Semantic Scholar 90ca815745f97464cdb57d850cb4260d4f01555e
arXiv: ratio 1.00: BagShift: Measuring How Patch Selection Changes the Evidence Seen by Whole-Slide MIL | Ruicheng Yuan, Zhenxuan Zhang, Liwei Hu, Anbang Wang, Haijie Xu, Jiawei Luo, Guang Yang | 2026 | arXiv 2608.15970
```
Exit status: 0

### kag2026attention
Command: python3 lookup resolve '10.1109/access.2026.3751717'
```
Crossref: ratio 1.00: Attention Is Not Localization: A Leakage-Free, End-to-End Evaluation of Weakly-Supervised and Supervised Breast-Lesion Localization in Mammography | Hitesh Kag, Madhu Shukla, Dinesh Kumar | 2026 | IEEE Access | vol 14 | pages 176532--176552 | doi 10.1109/access.2026.3751717
OpenAlex: ratio 1.00: Attention Is Not Localization: A Leakage-Free, End-to-End Evaluation of Weakly-Supervised and Supervised Breast-Lesion Localization in Mammography | Hitesh Kag, Madhu Shukla, Dinesh Kumar | 2026 | IEEE Access | vol 14 | pages 176532--176552 | doi 10.1109/access.2026.3751717 | OpenAlex W7225657118 | open access https://doi.org/10.1109/access.2026.3751717
Semantic Scholar: ratio 1.00: Attention Is Not Localization: A Leakage-Free, End-to-End Evaluation of Weakly-Supervised and Supervised Breast-Lesion Localization in Mammography | Hitesh Kag, Madhu Shukla, Dinesh Kumar | 2026 | IEEE Access | vol 14 | pages 176532--176552 | doi 10.1109/ACCESS.2026.3751717 | Semantic Scholar 448cadc9f1f1c740b8958f2feed7028dac2e616c | open access https://doi.org/10.1109/access.2026.3751717
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yang2020relational
Command: python3 lookup resolve '10.1109/isbi45749.2020.9098722'
```
Crossref: ratio 1.00: Relational Learning Between Multiple Pulmonary Nodules via Deep Set Attention Transformers | Jiancheng Yang, Haoran Deng, Xiaoyang Huang, Bingbing Ni, Yi Xu | 2020 | 2020 IEEE 17th International Symposium on Biomedical Imaging (ISBI) | pages 1875--1878 | doi 10.1109/isbi45749.2020.9098722
OpenAlex: ratio 1.00: Relational Learning Between Multiple Pulmonary Nodules via Deep Set Attention Transformers | Jiancheng Yang, Haoran Deng, Xiaoyang Huang, Bingbing Ni, Yi Xin Xu | 2020 | IEEE International Symposium on Biomedical Imaging (ISBI) | pages 1875--1878 | doi 10.1109/isbi45749.2020.9098722 | OpenAlex W3026063058 | open access https://arxiv.org/pdf/2004.05640
Semantic Scholar: ratio 1.00: Relational Learning Between Multiple Pulmonary Nodules via Deep Set Attention Transformers | Jiancheng Yang, Haoran Deng, Xiaoyang Huang, Bing-Bing Ni, Yi Xu | 2020 | IEEE International Symposium on Biomedical Imaging | pages 1875--1878 | doi 10.1109/ISBI45749.2020.9098722 | arXiv 2004.05640 | Semantic Scholar eb6c8dff05cd71299453eb4a9c80fb20613970b6 | open access https://arxiv.org/pdf/2004.05640
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2022lung
Command: python3 lookup resolve '10.1002/mp.15539'
```
Crossref: ratio 1.00: Lung cancer diagnosis using deep attention<hyphen>based multiple instance learning and radiomics | Junhua Chen, Haiyan Zeng, Chong Zhang, Zhenwei Shi, Andre Dekker, Leonard Wee, Inigo Bermejo | 2022 | Medical Physics | vol 49 | no 5 | pages 3134--3143 | doi 10.1002/mp.15539
OpenAlex: ratio 1.00: Lung cancer diagnosis using deep attention<hyphen>based multiple instance learning and radiomics | Junhua Chen, Haiyan Zeng, Chong Zhang, Zhenwei Shi, Andre L.A.J. Dekker, Leonard Wee, I<latin small letter n with tilde>igo Bermejo | 2022 | Medical Physics | vol 49 | no 5 | pages 3134--3143 | doi 10.1002/mp.15539 | OpenAlex W4212862206 | open access https://doi.org/10.1002/mp.15539
Semantic Scholar: ratio 1.00: Lung cancer diagnosis using deep attention<hyphen>based multiple instance learning and radiomics | Junhua Chen, H. Zeng, Chong Zhang, Zhen-Wei Shi, A. Dekker, L. Wee, I. Bermejo | 2021 | Medical Physics (Lancaster) | vol 49 | pages 3134--3143 | doi 10.1002/mp.15539 | arXiv 2104.14655 | Semantic Scholar 7631da3fd06db47f74c3907a3b28418c26f24151 | open access https://doi.org/10.1002/mp.15539
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### han2020accurate
Command: python3 lookup resolve '10.1109/tmi.2020.2996256'
```
Crossref: ratio 1.00: Accurate Screening of COVID-19 Using Attention-Based Deep 3D Multiple Instance Learning | Zhongyi Han, Benzheng Wei, Yanfei Hong, Tianyang Li, Jinyu Cong, Xue Zhu, Haifeng Wei, Wei Zhang | 2020 | IEEE Transactions on Medical Imaging | vol 39 | no 8 | pages 2584--2594 | doi 10.1109/tmi.2020.2996256
OpenAlex: ratio 1.00: Accurate Screening of COVID-19 Using Attention-Based Deep 3D Multiple Instance Learning | Zhongyi Han, Benzheng Wei, Yanfei Hong, Tianyang Li, Jinyu Cong, Xue Li Zhu, Haifeng Wei, Wei Zhang | 2020 | IEEE Transactions on Medical Imaging | vol 39 | no 8 | pages 2584--2594 | doi 10.1109/tmi.2020.2996256 | OpenAlex W3026931681
Semantic Scholar: ratio 1.00: Accurate Screening of COVID-19 Using Attention-Based Deep 3D Multiple Instance Learning | Zhongyi Han, Benzheng Wei, Yanfei Hong, Tianyang Li, J. Cong, Xue Zhu, Hai-Feng Wei, Wei Zhang | 2020 | IEEE Transactions on Medical Imaging | vol 39 | pages 2584--2594 | doi 10.1109/TMI.2020.2996256 | Semantic Scholar 3da67830920c0c240add66874962fedf25024f98
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wang2020hierarchical
Command: python3 lookup resolve '10.1109/bibm49941.2020.9313417'
```
Crossref: ratio 1.00: Hierarchical Attention-Based Multiple Instance Learning Network for Patient-Level Lung Cancer Diagnosis | Qingfeng Wang, Ying Zhou, Jun Huang, Zhiqin Liu, Ling Li, Weiyun Xu, Jie-Zhi Cheng | 2020 | 2020 IEEE International Conference on Bioinformatics and Biomedicine (BIBM) | pages 1156--1160 | doi 10.1109/bibm49941.2020.9313417
OpenAlex: ratio 1.00: Hierarchical Attention-Based Multiple Instance Learning Network for Patient-Level Lung Cancer Diagnosis | Qingfeng Wang, Ying Zhou, Jun Huang, Zhiqin Liu, Ling Li, Wei-Yun Xu, Jie<hyphen>Zhi Cheng | 2020 | IEEE International Conference on Bioinformatics and Biomedicine (BIBM) | pages 1156--1160 | doi 10.1109/bibm49941.2020.9313417 | OpenAlex W3129124420
Semantic Scholar: ratio 1.00: Hierarchical Attention-Based Multiple Instance Learning Network for Patient-Level Lung Cancer Diagnosis | Qing-Feng Wang, Ying Zhou, Jun Huang, Zhi-Qin Liu, Ling Li, Wei-Yun Xu, Jie-Zhi Cheng | 2020 | IEEE International Conference on Bioinformatics and Biomedicine | pages 1156--1160 | doi 10.1109/BIBM49941.2020.9313417 | Semantic Scholar 569cb6e8dc5eafd6ccd838f715cb5aefdebcad89
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### qaiser2021multiple
Command: python3 lookup resolve '10.1007/978-3-030-87234-2_74'
```
Crossref: ratio 1.00: Multiple Instance Learning with Auxiliary Task Weighting for Multiple Myeloma Classification | Talha Qaiser, Stefan Winzeck, Theodore Barfoot, Tara Barwick, Simon J. Doran, Martin F. Kaiser, Linda Wedlake, Nina Tunariu, Dow-Mu Koh, Christina Messiou, Andrea Rockall, Ben Glocker | 2021 | Lecture Notes in Computer Science | pages 786--796 | doi 10.1007/978-3-030-87234-2_74
OpenAlex: ratio 1.00: Multiple Instance Learning with Auxiliary Task Weighting for Multiple Myeloma Classification | Talha Qaiser, Stefan Winzeck, Theodore Barfoot, Tara D. Barwick, Simon Doran, Martin Kaiser, Linda J. Wedlake, Nina Tunariu, Dow<hyphen>Mu Koh, Christina Messiou, Andrea Rockall, Ben Glocker | 2021 | Lecture notes in computer science | pages 786--796 | doi 10.1007/978-3-030-87234-2_74 | OpenAlex W3201930041 | open access https://arxiv.org/pdf/2107.07805
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### shao2022patient
Command: python3 lookup resolve '10.1016/j.compbiomed.2022.106168'
```
Crossref: ratio 1.00: Patient-level grading prediction of prostate cancer from mp-MRI via GMINet | Lizhi Shao, Zhenyu Liu, Jiangang Liu, Ye Yan, Kai Sun, Xiangyu Liu, Jian Lu, Jie Tian | 2022 | Computers in Biology and Medicine | vol 150 | pages 106168 | doi 10.1016/j.compbiomed.2022.106168
OpenAlex: ratio 1.00: Patient-level grading prediction of prostate cancer from mp-MRI via GMINet | Lizhi Shao, Zhenyu Liu, Jiangang Liu, Ye Yan, Kai Sun, Xiangyu Liu, Jian Guo Lu, Jie Tian | 2022 | Computers in Biology and Medicine | vol 150 | pages 106168--106168 | doi 10.1016/j.compbiomed.2022.106168 | OpenAlex W4302009754
Semantic Scholar: ratio 1.00: Patient-level grading prediction of prostate cancer from mp-MRI via GMINet | Lizhi Shao, Zhen-Yu Liu, Jian-Gang Liu, Ye Yan, Kai Sun, Xiang-Yu Liu, Jian Lu, Jie Tian | 2022 | Comput. Biol. Medicine | vol 150 | pages 106168 | doi 10.1016/j.compbiomed.2022.106168 | Semantic Scholar c669ffda567ec908686df1ee0b70bc5f08ee9c28
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xu2024hybrid
Command: python3 lookup resolve '10.1016/j.cmpb.2023.107872'
```
Crossref: ratio 1.00: A hybrid few-shot multiple-instance learning model predicting the aggressiveness of lymphoma in PET/CT images | Caiwen Xu, Jie Feng, Yong Yue, Wanjun Cheng, Dianning He, Shouliang Qi, Guojun Zhang | 2024 | Computer Methods and Programs in Biomedicine | vol 243 | pages 107872 | doi 10.1016/j.cmpb.2023.107872
OpenAlex: ratio 1.00: A hybrid few-shot multiple-instance learning model predicting the aggressiveness of lymphoma in PET/CT images | Caiwen Xu, Jie Feng, Yong Yue, Wanjun Cheng, Dianning He, Shouliang Qi, Guojun Zhang | 2023 | Computer Methods and Programs in Biomedicine | vol 243 | pages 107872--107872 | doi 10.1016/j.cmpb.2023.107872 | OpenAlex W4387709474
Semantic Scholar: ratio 1.00: A hybrid few-shot multiple-instance learning model predicting the aggressiveness of lymphoma in PET/CT images | Caiwen Xu, Jie Feng, Yong Yue, Wanjun Cheng, Dianning He, Shou-Liang Qi, Guo-Jun Zhang | 2023 | Comput. Methods Programs Biomed. | vol 243 | pages 107872 | doi 10.1016/j.cmpb.2023.107872 | Semantic Scholar a26876a071cdb44ba6da2338a326e0ca88e7ad28
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zare2025permutation
Command: python3 lookup resolve '10.34067/kid.0000000668'
```
Crossref: ratio 1.00: Permutation-Invariant Cascaded Attentional Set Operator for Computational Nephropathology | Samira Zare, Huy Q. Vo, Nicola Altini, Vitoantonio Bevilacqua, Michele Rossini, Francesco Pesce, Loreto Gesualdo, S<latin small letter a with acute>ndor Turkevi-Nagy, Jan Ulrich Becker, Chandra Mohan, Hien Van Nguyen | 2025 | Kidney360 | vol 6 | no 3 | pages 441--450 | doi 10.34067/kid.0000000668
OpenAlex: ratio 1.00: Permutation-Invariant Cascaded Attentional Set Operator for Computational Nephropathology | Samira Zare, Huy Q. Vo, Nicola Altini, Vitoantonio Bevilacqua, Michele Rossini, Francesco Pesce, Loreto Gesualdo, S<latin small letter a with acute>ndor T<latin small letter u with acute>rkevi-Nagy, Jan Ulrich Becker, Chandra Mohan, Hien Van Nguyen | 2025 | Kidney360 | vol 6 | no 3 | pages 441--450 | doi 10.34067/kid.0000000668 | OpenAlex W4408102739 | open access https://doi.org/10.34067/kid.0000000668
Semantic Scholar: ratio 1.00: Permutation-Invariant Cascaded Attentional Set Operator for Computational Nephropathology | Samira Zare, H. Vo, Nicola Altini, V. Bevilacqua, M. Rossini, F. Pesce, L. Gesualdo, S<latin small letter a with acute>ndor Turkevi-Nagy, J. Becker, Chandra Mohan, Hien Van Nguyen | 2025 | Kidney360 | vol 6 | pages 441--450 | doi 10.34067/KID.0000000668 | Semantic Scholar 848eda6617e1f66499750de79e0eb986822f8e85 | open access https://doi.org/10.34067/kid.0000000668
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### collenne2024reset
Command: python3 lookup resolve '10.1109/icip51287.2024.10647287'
```
Crossref: ratio 1.00: Reset: A Residual Set-Transformer Approach to Tackle the Ugly-Duckling Sign in Melanoma Detection | Jules Collenne, Rabah Iguernaissi, S<latin small letter e with acute>verine Dubuisson, Djamal Merad | 2024 | 2024 IEEE International Conference on Image Processing (ICIP) | pages 3186--3191 | doi 10.1109/icip51287.2024.10647287
OpenAlex: ratio 1.00: Reset: A Residual Set-Transformer Approach to Tackle the Ugly-Duckling Sign in Melanoma Detection | Jules Collenne, Rabah Iguernaissi, S<latin small letter e with acute>verine Dubuisson, Djamal Merad | 2024 | Proceedings - International Conference on Image Processing | pages 3186--3191 | doi 10.1109/icip51287.2024.10647287 | OpenAlex W4402916094 | open access https://amu.hal.science/hal-05595262v1/document
Semantic Scholar: ratio 1.00: Reset: A Residual Set-Transformer Approach to Tackle the Ugly-Duckling Sign in Melanoma Detection | J. Collenne, R. Iguernaissi, S<latin small letter e with acute>verine Dubuisson, Djamel Merad | 2024 | International Conference on Information Photonics | pages 3186--3191 | doi 10.1109/icip51287.2024.10647287 | Semantic Scholar b21969fc68f85e46257c13385b070066600f8740 | open access https://amu.hal.science/hal-05595262v1/document
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### sanchez2026quality
Command: python3 lookup resolve '10.1007/s00330-026-12601-9'
```
Crossref: ratio 1.00: Quality over quantity: biopsy-anchored CT radiogenomics models outperform all-lesion training in a multi-tumour cohort despite a smaller sample size | Diana Ivonne Rodr<latin small letter i with acute>guez S<latin small letter a with acute>nchez, Julian Middelkoop, Thera Vanneste, Olga Maxouri, Stephan Ursprung, Sajjad Rostami, Nino Bogveradze, Kalina Chupetlovska, Francesca Castagnoli, Federica Landolfi, Eun Kyoung Hong, Andrea Delli Pizzi, Nicolo Gennaro, Warissara Jutidamrongphan, Liliana Petrychenko, Petur Snaebjornsson, Zuhir Bodalal, Regina Beets-Tan | 2026 | European Radiology | vol 36 | no 10 | pages 7473--7489 | doi 10.1007/s00330-026-12601-9
OpenAlex: ratio 1.00: Quality over quantity: biopsy-anchored CT radiogenomics models outperform all-lesion training in a multi-tumour cohort despite a smaller sample size | Diana Ivonne Rodr<latin small letter i with acute>guez S<latin small letter a with acute>nchez, Julian Middelkoop, Thera Vanneste, Olga Maxouri, Stephan Ursprung, Sajjad Rostami, Nino Bogveradze, Kalina Chupetlovska, Francesca Castagnoli, Federica Landolfi, Eun Kyoung Hong, Andrea Delli Pizzi, Nicol<latin small letter o with grave> Gennaro, Warissara Jutidamrongphan, Liliana Petrychenko, Petur Snaebjornsson, Zuhir Bodalal, Regina G. H. Beets<hyphen>Tan | 2026 | European Radiology | vol 36 | no 10 | pages 7473--7489 | doi 10.1007/s00330-026-12601-9 | OpenAlex W7161445842 | open access https://link.springer.com/content/pdf/10.1007/s00330-026-12601-9.pdf
Semantic Scholar: ratio 1.00: Quality over quantity: biopsy-anchored CT radiogenomics models outperform all-lesion training in a multi-tumour cohort despite a smaller sample size | D. I. Rodr<latin small letter i with acute>guez S<latin small letter a with acute>nchez, Julian Middelkoop, T. Vanneste, O. Maxouri, S. Ursprung, S. Rostami, N. Bogveradze, K. Chupetlovska, F. Castagnoli, F. Landolfi, Eun Kyoung Hong, Andrea Delli Pizzi, N. Gennaro, W. Jutidamrongphan, L. Petrychenko, P. Snaebjornsson, Z. Bodalal, R. Beets-Tan | 2026 | European Radiology | vol 36 | pages 7473--7489 | doi 10.1007/s00330-026-12601-9 | Semantic Scholar d352fb101cd8e110ec54b11d603aa1a0351137ea | open access https://link.springer.com/content/pdf/10.1007/s00330-026-12601-9.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gacheva2026multiple
Command: python3 lookup resolve '10.1016/j.ynirp.2026.100418'
```
Crossref: ratio 1.00: Multiple instance learning for differentiating neoplastic and non-neoplastic brain lesions using MR spectroscopy | Iskra Gacheva, Diyuan Lu, Gerhard Kurz, Jochen Triesch, Elke Hattingen, Nenad Polomac | 2026 | NeuroImage: Reports | vol 6 | no 4 | pages 100418 | doi 10.1016/j.ynirp.2026.100418
OpenAlex: ratio 1.00: Multiple instance learning for differentiating neoplastic and non-neoplastic brain lesions using MR spectroscopy | Iskra Gacheva, Diyuan Lu, Gerhard Kurz, Jochen Triesch, Elke Hattingen, Nenad Polomac | 2026 | Neuroimage Reports | vol 6 | no 4 | pages 100418--100418 | doi 10.1016/j.ynirp.2026.100418 | OpenAlex W7222783581 | open access https://doi.org/10.1016/j.ynirp.2026.100418
Semantic Scholar: ratio 1.00: Multiple instance learning for differentiating neoplastic and non-neoplastic brain lesions using MR spectroscopy | I. Gacheva, D. Lu, G. Kurz, J. Triesch, E. Hattingen, N. Polomac | 2026 | Neuroimage: Reports | vol 6 | doi 10.1016/j.ynirp.2026.100418 | Semantic Scholar ed0adae582beda0105d9ca40c6bef68c84ae3b42 | open access https://doi.org/10.1016/j.ynirp.2026.100418
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2024tractgeonet
Command: python3 lookup resolve '10.1016/j.media.2024.103120'
```
Crossref: ratio 1.00: TractGeoNet: A geometric deep learning framework for pointwise analysis of tract microstructure to predict language assessment performance | Yuqian Chen, Leo R. Zekelman, Chaoyi Zhang, Tengfei Xue, Yang Song, Nikos Makris, Yogesh Rathi, Alexandra J. Golby, Weidong Cai, Fan Zhang, Lauren J. O'Donnell | 2024 | Medical Image Analysis | vol 94 | pages 103120 | doi 10.1016/j.media.2024.103120
OpenAlex: ratio 1.00: TractGeoNet: A geometric deep learning framework for pointwise analysis of tract microstructure to predict language assessment performance | Yuqian Chen, Leo Zekelman, Chaoyi Zhang, Tengfei Xue, Yang Song, Nikos Makris, Yogesh Rathi, Alexandra J. Golby, Weidong Cai, Fan Zhang, Lauren J. O<right single quotation mark>Donnell | 2024 | Medical Image Analysis | vol 94 | pages 103120--103120 | doi 10.1016/j.media.2024.103120 | OpenAlex W4392123044 | open access https://www.sciencedirect.com/science/article/am/pii/S1361841524000458
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### luo2023prediction
Command: python3 lookup resolve '10.1136/neurintsurg-2022-018655'
```
Crossref: ratio 1.00: Prediction of cerebral aneurysm rupture using a point cloud neural network | Xiaoyuan Luo, Jienan Wang, Xinmei Liang, Lei Yan, XinHua Chen, Jian He, Jing Luo, Bing Zhao, Guangchen He, Manning Wang, Yueqi Zhu | 2022 | Journal of NeuroInterventional Surgery | vol 15 | no 4 | pages 380--386 | doi 10.1136/neurintsurg-2022-018655
OpenAlex: ratio 1.00: Prediction of cerebral aneurysm rupture using a point cloud neural network | Xiaoyuan Luo, Jienan Wang, Xinmei Liang, Lei Yan, XinHua Chen, Jian He, Jing Luo, Bing Zhao, Guangchen He, Manning Wang, Yueqi Zhu | 2022 | Journal of NeuroInterventional Surgery | vol 15 | no 4 | pages 380--386 | doi 10.1136/neurintsurg-2022-018655 | OpenAlex W4223459101
Semantic Scholar: ratio 1.00: Prediction of cerebral aneurysm rupture using a point cloud neural network | Xiao Luo, Jienan Wang, Xinmei Liang, Lei Yan, Xinhua Chen, Jian He, Jing Luo, B. Zhao, Guangchen He, Man-Ning Wang, Yue-Qi Zhu | 2022 | Journal of NeuroInterventional Surgery | vol 15 | pages 380--386 | doi 10.1136/neurintsurg-2022-018655 | Semantic Scholar 3dfffe1855570c15945685d768b3c0d62e4aa130
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bizjak2021deep
Command: python3 lookup resolve '10.3389/fphys.2021.644349'
```
Crossref: ratio 1.00: Deep Shape Features for Predicting Future Intracranial Aneurysm Growth | <latin capital letter z with caron>iga Bizjak, Franjo Pernu<latin small letter s with caron>, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin | 2021 | Frontiers in Physiology | vol 12 | doi 10.3389/fphys.2021.644349
OpenAlex: ratio 1.00: Deep Shape Features for Predicting Future Intracranial Aneurysm Growth | <latin capital letter z with caron>iga Bizjak, Franjo Pernu<latin small letter s with caron>, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin | 2021 | Frontiers in Physiology | vol 12 | pages 644349--644349 | doi 10.3389/fphys.2021.644349 | OpenAlex W3186101700 | open access https://www.frontiersin.org/articles/10.3389/fphys.2021.644349/pdf
Semantic Scholar: ratio 1.00: Deep Shape Features for Predicting Future Intracranial Aneurysm Growth | <latin capital letter z with caron>. Bizjak, F. Pernus, <latin capital letter z with caron>. <latin capital letter s with caron>piclin | 2021 | Frontiers in Physiology | vol 12 | doi 10.3389/fphys.2021.644349 | Semantic Scholar a861be9bb61c53a6cce17ff10b848e9aeb545d74 | open access https://www.frontiersin.org/articles/10.3389/fphys.2021.644349/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### choi2025prediction
Command: python3 lookup resolve '10.1016/j.compbiomed.2025.110965'
```
Crossref: ratio 1.00: Prediction of intracranial aneurysm rupture from computed tomography angiography using an automated artificial intelligence framework | June Ho Choi, Jannik Sobisch, Minwoo Kim, Jung Cheol Park, Jae Sung Ahn, Byung Duk Kwun, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin, <latin capital letter z with caron>iga Bizjak, Wonhyoung Park | 2025 | Computers in Biology and Medicine | vol 197 | pages 110965 | doi 10.1016/j.compbiomed.2025.110965
OpenAlex: ratio 1.00: Prediction of intracranial aneurysm rupture from computed tomography angiography using an automated artificial intelligence framework | June Ho Choi, Jannik Sobisch, Min-Woo Kim, Jung Cheol Park, Jae Sung Ahn, Byung Duk Kwun, <latin capital letter z with caron>iga <latin capital letter s with caron>piclin, <latin capital letter z with caron>iga Bizjak, Wonhyoung Park | 2025 | Computers in Biology and Medicine | vol 197 | no Pt A | pages 110965--110965 | doi 10.1016/j.compbiomed.2025.110965 | OpenAlex W4414031971 | open access https://doi.org/10.1016/j.compbiomed.2025.110965
Semantic Scholar: ratio 1.00: Prediction of intracranial aneurysm rupture from computed tomography angiography using an automated artificial intelligence framework | J. Choi, J. Sobisch, Minwoo Kim, J. Park, J. Ahn, B. Kwun, <latin capital letter z with caron>. <latin capital letter s with caron>piclin, <latin capital letter z with caron>. Bizjak, Wonhyoung Park | 2025 | Comput. Biol. Medicine | vol 197 Pt A | pages 110965 | doi 10.1016/j.compbiomed.2025.110965 | Semantic Scholar 1a460825134426ef4228e1d1e1ba671948dff4e7 | open access https://doi.org/10.1016/j.compbiomed.2025.110965
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dole2025enhancing
Command: python3 lookup resolve '10.1007/s11548-025-03527-6'
```
Crossref: ratio 1.00: Enhancing airway obstruction diagnosis with multimodal 3D shape analysis | Lucie Dole, Claudia Trindade Mattos, Jonas Bianchi, Heesoo Oh, Karine Evangelista, Jos<latin small letter e with acute> Valladares Neto, Sergio Luiz Mota-J<latin small letter u with acute>nior, Lucia Cevidanes, Juan Carlos Prieto | 2025 | International Journal of Computer Assisted Radiology and Surgery | vol 21 | no 3 | pages 529--538 | doi 10.1007/s11548-025-03527-6
OpenAlex: ratio 1.00: Enhancing airway obstruction diagnosis with multimodal 3D shape analysis | Lucie Dole, Cl<latin small letter a with acute>udia Trindade Mattos, Jonas Bianchi, Heesoo Oh, Karine Evangelista, Jos<latin small letter e with acute> Valladares Neto, Sergio Luiz Mota J<latin small letter u with acute>nior, Luc<latin small letter i with acute>a Cevidanes, Juan Carlos Prieto | 2025 | International Journal of Computer Assisted Radiology and Surgery | vol 21 | no 3 | pages 529--538 | doi 10.1007/s11548-025-03527-6 | OpenAlex W4415153925
Semantic Scholar: ratio 1.00: Enhancing airway obstruction diagnosis with multimodal 3D shape analysis | Lucie Dole, Claudia Mattos, J. Bianchi, Heesoo Oh, K. Evangelista, J. Valladares-Neto, S. Mota-J<latin small letter u with acute>nior, L. Cevidanes, J. Prieto | 2025 | International Journal of Computer Assisted Radiology and Surgery | doi 10.1007/s11548-025-03527-6 | Semantic Scholar d9a20c5f934301dfa0f62997fb0290e15cbd5df5
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yang2025pointchd
Command: python3 lookup resolve '10.1109/jbhi.2024.3495035'
```
Crossref: ratio 1.00: PointCHD: A Point Cloud Benchmark for Congenital Heart Disease Classification and Segmentation | Dinghao Yang, Wei Gao | 2025 | IEEE Journal of Biomedical and Health Informatics | vol 29 | no 4 | pages 2683--2694 | doi 10.1109/jbhi.2024.3495035
OpenAlex: ratio 1.00: PointCHD: A Point Cloud Benchmark for Congenital Heart Disease Classification and Segmentation | Dinghao Yang, Wei Gao | 2024 | IEEE Journal of Biomedical and Health Informatics | vol 29 | no 4 | pages 2683--2694 | doi 10.1109/jbhi.2024.3495035 | OpenAlex W4404179127
Semantic Scholar: ratio 1.00: PointCHD: A Point Cloud Benchmark for Congenital Heart Disease Classification and Segmentation | Dinghao Yang, Wei Gao | 2024 | IEEE journal of biomedical and health informatics | vol 29 | pages 2683--2694 | doi 10.1109/JBHI.2024.3495035 | Semantic Scholar 8a37e921aa94c13e7f1279f446773ee3e36ca8b4
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### beetz20253d
Command: python3 lookup resolve '10.1016/j.compmedimag.2025.102587'
```
Crossref: ratio 1.00: 3D cardiac shape analysis with variational point cloud autoencoders for myocardial infarction prediction and virtual heart synthesis | Marcel Beetz, Abhirup Banerjee, Lei Li, Julia Camps, Blanca Rodriguez, Vicente Grau | 2025 | Computerized Medical Imaging and Graphics | vol 124 | pages 102587 | doi 10.1016/j.compmedimag.2025.102587
OpenAlex: ratio 1.00: 3D cardiac shape analysis with variational point cloud autoencoders for myocardial infarction prediction and virtual heart synthesis | Marcel Beetz, Abhirup Banerjee, Lei Li, Juli<latin small letter a with grave> Camps, Blanca Rodr<latin small letter i with acute>guez, Vicente Grau | 2025 | Computerized Medical Imaging and Graphics | vol 124 | pages 102587--102587 | doi 10.1016/j.compmedimag.2025.102587 | OpenAlex W4411450327 | open access https://doi.org/10.1016/j.compmedimag.2025.102587
Semantic Scholar: ratio 1.00: 3D cardiac shape analysis with variational point cloud autoencoders for myocardial infarction prediction and virtual heart synthesis | M. Beetz, Abhirup Banerjee, Lei Li, J. Camps, Blanca Rodr<latin small letter i with acute>guez, V. Grau | 2025 | Comput. Medical Imaging Graph. | vol 124 | pages 102587--102587 | doi 10.1016/j.compmedimag.2025.102587 | Semantic Scholar 19efb94a9ff456272b5113158419a15b3b35868c | open access https://doi.org/10.1016/j.compmedimag.2025.102587
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### beetz20233d
Command: python3 lookup resolve '10.1109/embc40787.2023.10340878'
```
Crossref: ratio 1.00: 3D Shape-Based Myocardial Infarction Prediction Using Point Cloud Classification Networks | Marcel Beetz, Yilong Yang, Abhirup Banerjee, Lei Li, Vicente Grau | 2023 | 2023 45th Annual International Conference of the IEEE Engineering in Medicine &amp; Biology Society (EMBC) | pages 1--4 | doi 10.1109/embc40787.2023.10340878
OpenAlex: ratio 1.00: 3D Shape-Based Myocardial Infarction Prediction Using Point Cloud Classification Networks | Marcel Beetz, Yilong Yang, Abhirup Banerjee, Lei Li, Vicente Grau | 2023 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC) | vol 2023 | pages 1--4 | doi 10.1109/embc40787.2023.10340878 | OpenAlex W4389542902 | open access https://ora.ox.ac.uk/objects/uuid:3d74cf55-6626-4af7-a261-45927118be4a/files/s8049g6327
Semantic Scholar: ratio 1.00: 3D Shape-Based Myocardial Infarction Prediction Using Point Cloud Classification Networks | M. Beetz, Yi-Lun Yang, Abhirup Banerjee, Lei Li, V. Grau | 2023 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society | pages 1--4 | doi 10.1109/EMBC40787.2023.10340878 | arXiv 2307.07298 | Semantic Scholar 10b31aca484ae85a975c6c853b0f7455fc637b82 | open access https://ora.ox.ac.uk/objects/uuid:3d74cf55-6626-4af7-a261-45927118be4a/files/s8049g6327
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### devries2025geometric
Command: python3 lookup resolve '10.1016/j.cels.2025.101229'
```
Crossref: ratio 1.00: Geometric deep learning and multiple-instance learning for 3D cell-shape profiling | Matt De Vries, Lucas G. Dent, Nathan Curry, Leo Rowe-Brown, Vicky Bousgouni, Olga Fourkioti, Reed Naidoo, Hugh Sparks, Adam Tyson, Chris Dunsby, Chris Bakal | 2025 | Cell Systems | vol 16 | no 3 | pages 101229 | doi 10.1016/j.cels.2025.101229
OpenAlex: ratio 1.00: Geometric deep learning and multiple-instance learning for 3D cell-shape profiling | Matt De Vries, Lucas Dent, Nathan Curry, Leo Rowe-Brown, Vicky Bousgouni, Olga Fourkioti, Reed Naidoo, Hugh Sparks, Adam L. Tyson, Christopher W. Dunsby, Chris Bakal | 2025 | Cell Systems | vol 16 | no 3 | pages 101229--101229 | doi 10.1016/j.cels.2025.101229 | OpenAlex W4408591508 | open access https://doi.org/10.1016/j.cels.2025.101229
Semantic Scholar: ratio 1.00: Geometric deep learning and multiple-instance learning for 3D cell-shape profiling. | Matt De Vries, Lucas G. Dent, Nathan Curry, L. Rowe-Brown, V. Bousgouni, Olga Fourkioti, Reed Naidoo, H. Sparks, Adam L. Tyson, C. Dunsby, C. Bakal | 2025 | Cell Systems | vol 16 3 | pages 101229 | doi 10.1016/j.cels.2025.101229 | Semantic Scholar d16984905e8122b6c3127cf3a78370f6abe0af17 | open access https://doi.org/10.1016/j.cels.2025.101229
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### besson2021geometric
Command: python3 lookup resolve '10.1016/j.compmedimag.2021.101939'
```
Crossref: ratio 1.00: Geometric deep learning on brain shape predicts sex and age | Pierre Besson, Todd Parrish, Aggelos K. Katsaggelos, S. Kathleen Bandt | 2021 | Computerized Medical Imaging and Graphics | vol 91 | pages 101939 | doi 10.1016/j.compmedimag.2021.101939
OpenAlex: ratio 1.00: Geometric deep learning on brain shape predicts sex and age | Pierre Besson, Todd B. Parrish, Aggelos K. Katsaggelos, S. Kathleen Bandt | 2021 | Computerized Medical Imaging and Graphics | vol 91 | pages 101939--101939 | doi 10.1016/j.compmedimag.2021.101939 | OpenAlex W3165181154 | open access https://www.biorxiv.org/content/biorxiv/early/2020/06/29/2020.06.29.177543.full.pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wu2022multicohort
Command: python3 lookup resolve '10.1038/s41598-022-22313-x'
```
Crossref: ratio 1.00: A multicohort geometric deep learning study of age dependent cortical and subcortical morphologic interactions for fluid intelligence prediction | Yunan Wu, Pierre Besson, Emanuel A. Azcona, S. Kathleen Bandt, Todd B. Parrish, Hans C. Breiter, Aggelos K. Katsaggelos | 2022 | Scientific Reports | vol 12 | no 1 | doi 10.1038/s41598-022-22313-x
OpenAlex: ratio 1.00: A multicohort geometric deep learning study of age dependent cortical and subcortical morphologic interactions for fluid intelligence prediction | Yunan Wu, Pierre Besson, Emanuel A. Azcona, S. Kathleen Bandt, Todd B. Parrish, Hans C. Breiter, Aggelos K. Katsaggelos | 2022 | Scientific Reports | vol 12 | no 1 | pages 17760--17760 | doi 10.1038/s41598-022-22313-x | OpenAlex W4307138778 | open access https://www.nature.com/articles/s41598-022-22313-x.pdf
Semantic Scholar: ratio 1.00: A multicohort geometric deep learning study of age dependent cortical and subcortical morphologic interactions for fluid intelligence prediction | Yu-Nan Wu, P. Besson, Emanuel A. Azcona, S. Bandt, T. Parrish, H. Breiter, A. Katsaggelos | 2022 | Scientific Reports | vol 12 | doi 10.1038/s41598-022-22313-x | Semantic Scholar ec61a11d62904968c7f7c5bbab3fcf9c92572761 | open access https://www.nature.com/articles/s41598-022-22313-x.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### sarasua2021geometric
Command: python3 lookup resolve '10.1109/isbi48211.2021.9433948'
```
Crossref: ratio 1.00: Geometric Deep Learning on Anatomical Meshes for the Prediction of Alzheimer<right single quotation mark>s Disease | Ignacio Sarasua, Jonwong Lee, Christian Wachinger | 2021 | 2021 IEEE 18th International Symposium on Biomedical Imaging (ISBI) | doi 10.1109/isbi48211.2021.9433948
OpenAlex: ratio 1.00: Geometric Deep Learning on Anatomical Meshes for the Prediction of Alzheimer<right single quotation mark>s Disease | Ignacio Saras<latin small letter u with acute>a, Jonwong Lee, Christian Wachinger | 2021 | IEEE International Symposium on Biomedical Imaging (ISBI) | doi 10.1109/isbi48211.2021.9433948 | OpenAlex W3153231516 | open access https://arxiv.org/pdf/2104.10047
Semantic Scholar: ratio 1.00: Geometric Deep Learning on Anatomical Meshes for the Prediction of Alzheimer<right single quotation mark>s Disease | Ignacio Saras<latin small letter u with acute>a, Jonwon Lee, C. Wachinger | 2021 | IEEE International Symposium on Biomedical Imaging | pages 1356--1359 | doi 10.1109/ISBI48211.2021.9433948 | arXiv 2104.10047 | Semantic Scholar 62b3ba25d406727e1456afd7960f7b7cf15899ed | open access https://arxiv.org/pdf/2104.10047
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### vosylius2020geometric
Command: python3 lookup resolve '10.1007/978-3-030-60365-6_17'
```
Crossref: ratio 1.00: Geometric Deep Learning for Post-Menstrual Age Prediction Based on the Neonatal White Matter Cortical Surface | Vitalis Vosylius, Andy Wang, Cemlyn Waters, Alexey Zakharov, Francis Ward, Loic Le Folgoc, John Cupitt, Antonios Makropoulos, Andreas Schuh, Daniel Rueckert, Amir Alansary | 2020 | Lecture Notes in Computer Science | pages 174--186 | doi 10.1007/978-3-030-60365-6_17
OpenAlex: ratio 1.00: Geometric Deep Learning for Post-Menstrual Age Prediction Based on the Neonatal White Matter Cortical Surface | Vitalis Vosylius, Andy Yu-Der Wang, Cemlyn Waters, Alexey Zakharov, Francis Rhys Ward, Lo<latin small letter i with diaeresis>c Le Folgoc, John Cupitt, Antonios Makropoulos, Andreas Schuh, Daniel Rueckert, Amir Alansary | 2020 | Lecture notes in computer science | pages 174--186 | doi 10.1007/978-3-030-60365-6_17 | OpenAlex W3049720528 | open access https://arxiv.org/pdf/2008.06098
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### jia20243d
Command: python3 lookup resolve '10.1016/j.compbiomed.2024.109192'
```
Crossref: ratio 1.00: Using 3D point cloud and graph-based neural networks to improve the estimation of pulmonary function tests from chest CT | Jingnan Jia, Bo Yu, Prerak Mody, Maarten K. Ninaber, Anne A. Schouffoer, Jeska K. de Vries-Bouwstra, Lucia J.M. Kroft, Marius Staring, Berend C. Stoel | 2024 | Computers in Biology and Medicine | vol 182 | pages 109192 | doi 10.1016/j.compbiomed.2024.109192
OpenAlex: ratio 1.00: Using 3D point cloud and graph-based neural networks to improve the estimation of pulmonary function tests from chest CT | Jingnan Jia, Bo Yu, Prerak Mody, Maarten K. Ninaber, Anne A. Schouffoer, Jeska Kirsten De Vries-Bouwstra, Lucia J.M. Kroft, Marius Staring, Berend C. Stoel | 2024 | Computers in Biology and Medicine | vol 182 | pages 109192--109192 | doi 10.1016/j.compbiomed.2024.109192 | OpenAlex W4402900165 | open access https://doi.org/10.1016/j.compbiomed.2024.109192
Semantic Scholar: ratio 1.00: Using 3D point cloud and graph-based neural networks to improve the estimation of pulmonary function tests from chest CT | Jing-Nan Jia, Bo Yu, Prerak Mody, M. Ninaber, A. Schouffoer, J. de Vries-Bouwstra, L. Kroft, M. Staring, B. Stoel | 2024 | Comput. Biol. Medicine | vol 182 | pages 109192 | doi 10.1016/j.compbiomed.2024.109192 | Semantic Scholar b816c213b4af31cb05708d28a9c8f30eb19d9a1f | open access https://doi.org/10.1016/j.compbiomed.2024.109192
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2026screening
Command: python3 lookup resolve '10.64898/2026.11.12.766227'
```
Crossref: ratio 1.00: From Screening to Differential Diagnosis: Benchmarking 3D Facial Representations Across Craniofacial Conditions | Tingting Chen, Mian Umair Ahsan, Justin Cotney, Eric C. Liao, Kai Wang | 2026 | doi 10.64898/2026.11.12.766227
OpenAlex: ratio 1.00: From Screening to Differential Diagnosis: Benchmarking 3D Facial Representations Across Craniofacial Conditions | Tingting Chen, Mian Umair Ahsan, Justin L. Cotney, Eric Chien-Wei Liao, Kai Wang | 2026 | bioRxiv (Cold Spring Harbor Laboratory) | doi 10.64898/2026.11.12.766227 | OpenAlex W7233561349 | open access https://www.biorxiv.org/content/biorxiv/early/2026/11/14/2026.11.12.766227.full.pdf
Semantic Scholar: ratio 1.00: From Screening to Differential Diagnosis: Benchmarking 3D Facial Representations Across Craniofacial Conditions | Ting-Ting Chen, Mian Umair Ahsan, J. Cotney, E. Liao, Kai Wang | 2026 | bioRxiv | doi 10.64898/2026.11.12.766227 | Semantic Scholar 16d7181e2a09749ca16f1b9798068144a0179c2d | open access https://www.biorxiv.org/content/biorxiv/early/2026/11/14/2026.11.12.766227.full.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ravikumar2019generalised
Command: python3 lookup resolve '10.1016/j.media.2019.01.001'
```
Crossref: ratio 1.00: Generalised coherent point drift for group-wise multi-dimensional analysis of diffusion brain MRI data | Nishant Ravikumar, Ali Gooya, Leandro Beltrachini, Alejandro F. Frangi, Zeike A. Taylor | 2019 | Medical Image Analysis | vol 53 | pages 47--63 | doi 10.1016/j.media.2019.01.001
OpenAlex: ratio 1.00: Generalised coherent point drift for group-wise multi-dimensional analysis of diffusion brain MRI data | Nishant Ravikumar, Ali Gooya, Leandro Beltrachini, Alejandro Federico Frangi, Zeike A. Taylor | 2019 | Medical Image Analysis | vol 53 | pages 47--63 | doi 10.1016/j.media.2019.01.001 | OpenAlex W2909443694 | open access https://orca.cardiff.ac.uk/id/eprint/118318/
Semantic Scholar: ratio 1.00: Generalised coherent point drift for group<hyphen>wise multi<hyphen>dimensional analysis of diffusion brain MRI data | N. Ravikumar, A. Gooya, L. Beltrachini, Alejandro F Frangi, Z. Taylor | 2019 | Medical Image Anal. | vol 53 | pages 47<en dash>63 | doi 10.1016/j.media.2019.01.001 | Semantic Scholar ff506be8d5b401bf4b915bf2239d8c266893c61e | open access https://orca.cardiff.ac.uk/id/eprint/118318/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### hering2023learn2reg
Command: python3 lookup resolve '10.1109/tmi.2022.3213983'
```
Crossref: ratio 1.00: Learn2Reg: Comprehensive Multi-Task Medical Image Registration Challenge, Dataset and Evaluation in the Era of Deep Learning | Alessa Hering, Lasse Hansen, Tony C. W. Mok, Albert C. S. Chung, Hanna Siebert, Stephanie Hager, Annkristin Lange, Sven Kuckertz, Stefan Heldmann, Wei Shao, Sulaiman Vesal, Mirabela Rusu, Geoffrey Sonn, Theo Estienne, Maria Vakalopoulou, Luyi Han, Yunzhi Huang, Pew-Thian Yap, Mikael Brudfors, Yael Balbastre, Samuel Joutard, Marc Modat, Gal Lifshitz, Dan Raviv, Jinxin Lv, Qiang Li, Vincent Jaouen, Dimitris Visvikis, Constance Fourcade, Mathieu Rubeaux, Wentao Pan, Zhe Xu, Bailiang Jian, Francesca De Benetti, Marek Wodzinski, Niklas Gunnarsson, Jens Sjolund, Daniel Grzech, Huaqi Qiu, Zeju Li, Alexander Thorley, Jinming Duan, Christoph Grosbrohmer, Andrew Hoopes, Ingerid Reinertsen, Yiming Xiao, Bennett Landman, Yuankai Huo, Keelin Murphy, Nikolas Lessmann, Bram van Ginneken, Adrian V. Dalca, Mattias P. Heinrich | 2023 | IEEE Transactions on Medical Imaging | vol 42 | no 3 | pages 697--712 | doi 10.1109/tmi.2022.3213983
OpenAlex: ratio 1.00: Learn2Reg: Comprehensive Multi-Task Medical Image Registration Challenge, Dataset and Evaluation in the Era of Deep Learning | Alessa Hering, Lasse Hansen, Tony C. W. Mok, Albert C. S. Chung, Hanna Siebert, Stephanie H<latin small letter a with diaeresis>ger, Annkristin Lange, Sven Kuckertz, Stefan Heldmann, Wei Shao, Sulaiman Vesal, Mirabela Rusu, Geoffrey A. Sonn, Th<latin small letter e with acute>o Estienne, Maria Vakalopoulou, Luyi Han, Yunzhi Huang, Pew<hyphen>Thian Yap, Mikael Brudfors, Ya<latin small letter e with diaeresis>l Balbastre, Samuel Joutard, Marc Modat, Gal Lifshitz, Dan Raviv, Jinxin Lv, Qiang Li, Vincent Jaouen, Dimitris Visvikis, Constance Fourcade, Mathieu Rubeaux, Wentao Pan, Zhe Xu, Bailiang Jian, Francesca De Benetti, Marek Wodzi<latin small letter n with acute>ski, Niklas Gunnarsson, Jens Sjolund, Daniel Grzech, Huaqi Qiu, Zeju Li, Alexander Thorley, Jinming Duan, Christoph Grosbrohmer, Andrew Hoopes, Ingerid Reinertsen, Yiming Xiao, Bennett A. Landman, Yuankai Huo, Keelin Murphy, Nikolas Le<latin small letter sharp s>mann, Bram van Ginneken, Adrian Vasile Dalca, Mattias P. Heinrich<pop directional formatting> | 2022 | IEEE Transactions on Medical Imaging | vol 42 | no 3 | pages 697--712 | doi 10.1109/tmi.2022.3213983 | OpenAlex W4200630926 | open access https://ieeexplore.ieee.org/ielx7/42/10057585/09925717.pdf
Semantic Scholar: ratio 1.00: Learn2Reg: Comprehensive Multi-Task Medical Image Registration Challenge, Dataset and Evaluation in the Era of Deep Learning | A. Hering, Lasse Hansen, Tony C. W. Mok, Albert C. S. Chung, Hanna Siebert, Stephanie H<latin small letter a with diaeresis>ger, Annkristin Lange, Sven Kuckertz, S. Heldmann, Wei Shao, Sulaiman Vesal, M. Rusu, G. Sonn, T. Estienne, M. Vakalopoulou, Lu-Yi Han, Yunzhi Huang, P. Yap, Mikael Brudfors, Ya<latin small letter e with diaeresis>l Balbastre, Samuel Joutard, M. Modat, Gal Lifshitz, D. Raviv, Jinxin Lv, Qiang Li, V. Jaouen, D. Visvikis, C. Fourcade, M. Rubeaux, Wen-Qian Pan, Zhe Xu, Bai-Liang Jian, F. De Benetti, M. Wodzi<latin small letter n with acute>ski, Niklas Gunnarsson, Jens Sj<latin small letter o with diaeresis>lund, Daniel Grzech, Hua-Qi Qiu, Ze-Ju Li, Alexander J H Thorley, Jin-Ming Duan, Christoph Gro<latin small letter sharp s>br<latin small letter o with diaeresis>hmer, Andrew Hoopes, I. Reinertsen, Yi-Ming Xiao, B. Landman, Yuan-Kai Huo, K. Murphy, N. Lessmann, B. van Ginneken, Adrian V. Dalca, M. Heinrich | 2021 | IEEE Transactions on Medical Imaging | vol 42 | pages 697--712 | doi 10.1109/TMI.2022.3213983 | arXiv 2112.04489 | Semantic Scholar 2e09fa7387659a79f41d809ce40d32cc8c847bb7 | open access https://ieeexplore.ieee.org/ielx7/42/10057585/09925717.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2026lumir
Command: python3 lookup resolve '10.1016/j.media.2026.104175'
```
Crossref: ratio 1.00: Beyond the LUMIR challenge: The pathway to foundational registration models | Junyu Chen, Shuwen Wei, Joel Honkamaa, Pekka Marttinen, Hang Zhang, Min Liu, Yichao Zhou, Zuopeng Tan, Zhuoyuan Wang, Yi Wang, Hongchao Zhou, Shunbo Hu, Yi Zhang, Qian Tao, Lukas F<latin small letter o with diaeresis>rner, Thomas Wendler, Bailiang Jian, Benedikt Wiestler, Tim Hable, Jin Kim, Dan Ruan, Frederic Madesta, Thilo Sentker, Wiebke Heyer, Lianrui Zuo, Yuwei Dai, Jing Wu, Jerry L. Prince, Harrison Bai, Yong Du, Yihao Liu, Alessa Hering, Reuben Dorent, Lasse Hansen, Mattias P. Heinrich, Aaron Carass | 2026 | Medical Image Analysis | vol 113 | pages 104175 | doi 10.1016/j.media.2026.104175
OpenAlex: ratio 1.00: Beyond the LUMIR challenge: The pathway to foundational registration models | Junyu Chen, Shuwen Wei, Joel Honkamaa, Pekka Marttinen, Hang Zhang, Min Liu, Yichao Zhou, Zuopeng Tan, Zhuoyuan Wang, Yi Wang, Hongchao Zhou, Shunbo Hu, Yi Zhang, Qian Tao, Lukas F<latin small letter o with diaeresis>rner, Thomas Wendler, Bailiang Jian, Benedikt Wiestler, Tim Hable, Jin Kim, Dan Ruan, Frederic Madesta, Thilo Sentker, Wiebke Heyer, Lianrui Zuo, Yuwei Dai, Jing Wu, Jerry L. Prince, Harrison Xiao Bai, Yong Du, Yihao Liu, Alessa Hering, Reuben Dorent, Lasse Hansen, Mattias P. Heinrich<pop directional formatting>, Aaron Carass | 2026 | Medical Image Analysis | vol 113 | pages 104175--104175 | doi 10.1016/j.media.2026.104175 | OpenAlex W4414856305 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC13419986/pdf/nihms-2193568.pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ou2014comparative
Command: python3 lookup resolve '10.1109/tmi.2014.2330355'
```
Crossref: ratio 1.00: Comparative Evaluation of Registration Algorithms in Different Brain Databases With Varying Difficulty: Results and Insights | Yangming Ou, Hamed Akbari, Michel Bilello, Xiao Da, Christos Davatzikos | 2014 | IEEE Transactions on Medical Imaging | vol 33 | no 10 | pages 2039--2065 | doi 10.1109/tmi.2014.2330355
OpenAlex: ratio 1.00: Comparative Evaluation of Registration Algorithms in Different Brain Databases With Varying Difficulty: Results and Insights | Yangming Ou, Hamed Akbari, Michel Bilello, Xiao Da, Christos A. Davatzikos | 2014 | IEEE Transactions on Medical Imaging | vol 33 | no 10 | pages 2039--2065 | doi 10.1109/tmi.2014.2330355 | OpenAlex W2067178115 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4371548
Semantic Scholar: ratio 1.00: Comparative Evaluation of Registration Algorithms in Different Brain Databases With Varying Difficulty: Results and Insights | Yang-Ming Ou, H. Akbari, M. Bilello, Xiao Da, C. Davatzikos | 2014 | IEEE Transactions on Medical Imaging | vol 33 | pages 2039--2065 | doi 10.1109/TMI.2014.2330355 | Semantic Scholar dcb8fff21c255ca1dfeb10a0a1bfba87e231280b | open access https://www.ncbi.nlm.nih.gov/pmc/articles/4371548
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### miller2025comparison
Command: python3 lookup resolve '10.1162/imag.a.1048'
```
Crossref: ratio 1.00: Comparison of brain normalization software and lesion compensation techniques in chronic perinatal stroke imaging | Gillian N. Miller, Clara J. Steeby, Jorge Ortega-M<latin small letter a with acute>rquez, Alberto Castro Palacin, Carrie Chui, Kenda Alhadid, Alyssa W. Sullivan, Aaron D. Boes, Patricia L. Musolino, Alexander L. Cohen | 2025 | Imaging Neuroscience | vol 3 | doi 10.1162/imag.a.1048
OpenAlex: ratio 1.00: Comparison of brain normalization software and lesion compensation techniques in chronic perinatal stroke imaging | Gillian N. Miller, Clara J. Steeby, Jorge Ortega-M<latin small letter a with acute>rquez, Alberto Castro Palacin, Carrie Chui, Kenda Alhadid, Alyssa W. Sullivan, Aaron D. Boes, Patricia Leonor Musolino, Alexander L. Cohen | 2025 | Imaging Neuroscience | vol 3 | doi 10.1162/imag.a.1048 | OpenAlex W7105881710 | open access https://direct.mit.edu/imag/article-pdf/doi/10.1162/IMAG.a.1048/2565674/imag.a.1048.pdf
Semantic Scholar: ratio 1.00: Comparison of brain normalization software and lesion compensation techniques in chronic perinatal stroke imaging | Gillian N. Miller, Clara J. Steeby, Jorge Ortega-M<latin small letter a with acute>rquez, Alberto Castro Palacin, Carrie Chui, K. Alhadid, Alyssa W. Sullivan, A. Boes, P. Musolino, A. L. Cohen | 2025 | Imaging neuroscience | vol 3 | doi 10.1162/IMAG.a.1048 | Semantic Scholar aa1caafef850b41805dbb2a4bdc86342f7c8c1a4 | open access https://direct.mit.edu/imag/article-pdf/doi/10.1162/IMAG.a.1048/2565674/imag.a.1048.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### marchewka2014influence
Command: python3 lookup resolve '10.1002/hbm.22297'
```
Crossref: ratio 1.00: Influence of magnetic field strength and image registration strategy on voxel<hyphen>based morphometry in a study of Alzheimer's disease | Artur Marchewka, Ferath Kherif, Gunnar Krueger, Anna Grabowska, Richard Frackowiak, Bogdan Draganski, The Alzheimer's Disease Neuroimaging Initiative | 2013 | Human Brain Mapping | vol 35 | no 5 | pages 1865--1874 | doi 10.1002/hbm.22297
OpenAlex: ratio 1.00: Influence of magnetic field strength and image registration strategy on voxel<hyphen>based morphometry in a study of Alzheimer's disease | Artur Marchewka, Ferath Kherif, Gunnar Kr<latin small letter u with diaeresis>ger, Anna Grabowska, Richard S. J. Frackowiak, Bogdan Draganski, The Alzheimer's Disease Neuroimaging Initiative | 2013 | Human Brain Mapping | vol 35 | no 5 | pages 1865--1874 | doi 10.1002/hbm.22297 | OpenAlex W1588835084 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC6869431/
Semantic Scholar: ratio 1.00: Influence of magnetic field strength and image registration strategy on voxel<hyphen>based morphometry in a study of Alzheimer's disease | A. Marchewka, Ferath Kherif, G. Krueger, A. Grabowska, Richard S. J. Frackowiak, Bogdan Draganski | 2014 | Human Brain Mapping | vol 35 | doi 10.1002/hbm.22297 | Semantic Scholar 65fb79df77834a5246b6f9bcfd0caabc21865fef | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC6869431/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### canalini2022quantitative
Command: python3 lookup resolve '10.3389/fnimg.2022.977491'
```
Crossref: ratio 1.00: Quantitative evaluation of the influence of multiple MRI sequences and of pathological tissues on the registration of longitudinal data acquired during brain tumor treatment | Luca Canalini, Jan Klein, Diana Waldmannstetter, Florian Kofler, Stefano Cerri, Alessa Hering, Stefan Heldmann, Sarah Schlaeger, Bjoern H. Menze, Benedikt Wiestler, Jan Kirschke, Horst K. Hahn | 2022 | Frontiers in Neuroimaging | vol 1 | doi 10.3389/fnimg.2022.977491
OpenAlex: ratio 1.00: Quantitative evaluation of the influence of multiple MRI sequences and of pathological tissues on the registration of longitudinal data acquired during brain tumor treatment | Luca Canalini, Jan Klein, Diana Waldmannstetter, Florian Kofler, Stefano Cerri, Alessa Hering, Stefan Heldmann, Sarah Schlaeger, Bjoern H. Menze, Benedikt Wiestler, Jan Stefan Kirschke, Horst Karl Hahn | 2022 | Frontiers in Neuroimaging | vol 1 | pages 977491--977491 | doi 10.3389/fnimg.2022.977491 | OpenAlex W4296483344 | open access https://www.frontiersin.org/articles/10.3389/fnimg.2022.977491/pdf
Semantic Scholar: ratio 1.00: Quantitative evaluation of the influence of multiple MRI sequences and of pathological tissues on the registration of longitudinal data acquired during brain tumor treatment | Luca Canalini, J. Klein, Diana Waldmannstetter, F. Kofler, Stefano Cerri, A. Hering, S. Heldmann, S. Schlaeger, Bjoern H Menze, B. Wiestler, J. Kirschke, H. Hahn | 2022 | Frontiers in Neuroimaging | vol 1 | doi 10.3389/fnimg.2022.977491 | Semantic Scholar 8b1d1960bb137aa6a7161d7f60d31527621665e8 | open access https://www.frontiersin.org/articles/10.3389/fnimg.2022.977491/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### iglesias2026accuracy
Command: python3 lookup resolve '10.1038/s41598-026-63646-1'
```
Crossref: ratio 1.00: On the accuracy of nonlinear image registration in portable low-field 3D brain MRI | J. Eugenio Iglesias, Ian P. Johnson, Jonathan Williams-Ramirez, Dina Zemlyanker, Lin Tian, Karthik Gopinath, Mark Olchanyi, Ava D. Farnan, Amelia Demopoulos, Matthew S. Rosen, Kevin N. Sheth, Adam de Havenon, W. Taylor Kimberly, Annabel Sorby-Adams | 2026 | Scientific Reports | vol 16 | no 1 | doi 10.1038/s41598-026-63646-1
OpenAlex: ratio 1.00: On the accuracy of nonlinear image registration in portable low-field 3D brain MRI | J. Eugenio Iglesias, Ian Johnson, Jonathan Williams-Ramirez, Dina Zemlyanker, Lin Tian, Karthik Kuduva Gopinath, Mark Olchanyi, Ava Farnan, Amelia Demopoulos, Matthew Scott Rosen, Kevin Navin Sheth, Adam de Havenon, William Taylor Kimberly, Annabel J Sorby-Adams, Alzheimer<right single quotation mark>s Disease Neuroimaging Initiative | 2026 | Scientific Reports | vol 16 | no 1 | pages 34965--34965 | doi 10.1038/s41598-026-63646-1 | OpenAlex W7171855754 | open access https://www.nature.com/articles/s41598-026-63646-1_reference.pdf
Semantic Scholar: ratio 1.00: On the accuracy of nonlinear image registration in portable low-field 3D brain MRI | J. Iglesias, I. Johnson, Jonathan Williams Ramirez, Dina Zemlyanker, Lin Tian, K. Gopinath, Mark D. Olchanyi, Ava Farnan, Amelia Demopoulos, M. Rosen, K. Sheth, A. de Havenon, W. Kimberly, A. Sorby-Adams | 2026 | Scientific Reports | vol 16 | doi 10.1038/s41598-026-63646-1 | Semantic Scholar 934c4c1f7834deb43e881dffd182698575a5e39a | open access https://www.nature.com/articles/s41598-026-63646-1_reference.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### luo2026bayesian
Command: python3 lookup resolve '10.1109/tpami.2025.3609521'
```
Crossref: ratio 1.00: Bayesian Unsupervised Disentanglement of Anatomy and Geometry for Deep Groupwise Image Registration | Xinzhe Luo, Xin Wang, Linda Shapiro, Chun Yuan, Jianfeng Feng, Xiahai Zhuang | 2026 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 48 | no 1 | pages 711--729 | doi 10.1109/tpami.2025.3609521
OpenAlex: ratio 1.00: Bayesian Unsupervised Disentanglement of Anatomy and Geometry for Deep Groupwise Image Registration | Xinzhe Luo, Xin Wang, Linda G. Shapiro, Chun Yuan, Jianfeng Feng, Xiahai Zhuang | 2025 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 48 | no 1 | pages 711--729 | doi 10.1109/tpami.2025.3609521 | OpenAlex W4414161593 | open access https://arxiv.org/pdf/2401.02141
Semantic Scholar: ratio 1.00: Bayesian Unsupervised Disentanglement of Anatomy and Geometry for Deep Groupwise Image Registration | Xinzhe Luo, Xin Wang, Linda Shapiro, Chun Yuan, Jianfeng Feng, X. Zhuang | 2024 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 48 | pages 711--729 | doi 10.1109/TPAMI.2025.3609521 | arXiv 2401.02141 | Semantic Scholar 859caf85e584907199ffa45e6bd2faab8d25cd1a | open access https://arxiv.org/pdf/2401.02141
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### sinclair2022atlas
Command: python3 lookup resolve '10.1016/j.media.2022.102383'
```
Crossref: ratio 1.00: Atlas-ISTN: Joint segmentation, registration and atlas construction with image-and-spatial transformer networks | Matthew Sinclair, Andreas Schuh, Karl Hahn, Kersten Petersen, Ying Bai, James Batten, Michiel Schaap, Ben Glocker | 2022 | Medical Image Analysis | vol 78 | pages 102383 | doi 10.1016/j.media.2022.102383
OpenAlex: ratio 1.00: Atlas-ISTN: Joint segmentation, registration and atlas construction with image-and-spatial transformer networks | Matthew Sinclair, Andreas Schuh, Karl Hahn, Kersten Petersen, Ying Bai, James Batten, Michiel Schaap, Ben Glocker | 2022 | Medical Image Analysis | vol 78 | pages 102383--102383 | doi 10.1016/j.media.2022.102383 | OpenAlex W3116516133 | open access https://www.sciencedirect.com/science/article/pii/S1361841522000354/pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dannecker2026cinema
Command: python3 lookup resolve '10.1109/tmi.2025.3605194'
```
Crossref: ratio 1.00: CINeMA: Conditional Implicit Neural Multi-Modal Atlas for a Spatio-Temporal Representation of the Perinatal Brain | Maik Dannecker, Vasiliki Sideri-Lampretsa, Sophie Starck, Angeline Mihailov, Mathieu Milh, Nadine Girard, Guillaume Auzias, Daniel Rueckert | 2026 | IEEE Transactions on Medical Imaging | vol 45 | no 2 | pages 738--750 | doi 10.1109/tmi.2025.3605194
OpenAlex: ratio 1.00: CINeMA: Conditional Implicit Neural Multi-Modal Atlas for a Spatio-Temporal Representation of the Perinatal Brain | Maik Dannecker, Vasiliki Sideri<hyphen>Lampretsa, Sophie Starck, Angeline Mihailov, Mathieu Milh, Nadine J Girard, Guillaume Auzias, Daniel Rueckert | 2025 | IEEE Transactions on Medical Imaging | vol 45 | no 2 | pages 738--750 | doi 10.1109/tmi.2025.3605194 | OpenAlex W4413967162 | open access https://doi.org/10.1109/tmi.2025.3605194
Semantic Scholar: ratio 1.00: CINeMA: Conditional Implicit Neural Multi-Modal Atlas for a Spatio-Temporal Representation of the Perinatal Brain | Maik Dannecker, Vasiliki Sideri-Lampretsa, Sophie Starck, A. Mihailov, M. Milh, N. Girard, G. Auzias, Daniel Rueckert | 2025 | IEEE Transactions on Medical Imaging | vol 45 | pages 738--750 | doi 10.1109/TMI.2025.3605194 | arXiv 2506.09668 | Semantic Scholar c537f6ba427cc0bf0b538323fe1bb33295cbac0b | open access https://doi.org/10.1109/tmi.2025.3605194
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### hoffmann2024anatomy
Command: python3 lookup resolve '10.1162/imag_a_00197'
```
Crossref: ratio 1.00: Anatomy-aware and acquisition-agnostic joint registration with SynthMorph | Malte Hoffmann, Andrew Hoopes, Douglas N. Greve, Bruce Fischl, Adrian V. Dalca | 2024 | Imaging Neuroscience | vol 2 | doi 10.1162/imag_a_00197
OpenAlex: ratio 1.00: Anatomy-aware and acquisition-agnostic joint registration with SynthMorph | Malte Hoffmann, Andrew Hoopes, Douglas N. Greve, Bruce R. Fischl, Adrian Vasile Dalca | 2024 | Imaging Neuroscience | vol 2 | pages 1--33 | doi 10.1162/imag_a_00197 | OpenAlex W4399498869 | open access https://doi.org/10.1162/imag_a_00197
Semantic Scholar: ratio 1.00: Anatomy-aware and acquisition-agnostic joint registration with SynthMorph | Malte Hoffmann, Andrew Hoopes, D. Greve, B. Fischl, Adrian V. Dalca | 2023 | Imaging Neuroscience | vol 2 | doi 10.1162/imag_a_00197 | arXiv 2301.11329 | Semantic Scholar 8469ad8f0211b438cb4b5a8bcf9d1e6e923c37e4 | open access https://doi.org/10.1162/imag_a_00197
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### he2023neural
Command: python3 lookup resolve '10.1007/978-3-031-43993-3_25'
```
Crossref: ratio 1.00: Neural Pre-processing: A Learning Framework for End-to-End Brain MRI Pre-processing | Xinzi He, Alan Q. Wang, Mert R. Sabuncu | 2023 | Lecture Notes in Computer Science | pages 258--267 | doi 10.1007/978-3-031-43993-3_25
OpenAlex: ratio 1.00: Neural Pre-processing: A Learning Framework for End-to-End Brain MRI Pre-processing | Xinzi He, Alan Q. Wang, Mert Rory Sabuncu | 2023 | Lecture notes in computer science | pages 258--267 | doi 10.1007/978-3-031-43993-3_25 | OpenAlex W4387210968 | open access https://arxiv.org/pdf/2303.12148
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tilwani2025benchmarking
Command: python3 lookup resolve '10.3389/fnimg.2025.1573816'
```
Crossref: ratio 1.00: Benchmarking machine learning models in lesion-symptom mapping for predicting language outcomes in stroke survivors | Deepa Tilwani, Christian O'Reilly, Nicholas Riccardi, Valerie L. Shalin, Dirk-Bart den Ouden, Julius Fridriksson, Svetlana V. Shinkareva, Amit P. Sheth, Rutvik H. Desai | 2025 | Frontiers in Neuroimaging | vol 4 | doi 10.3389/fnimg.2025.1573816
OpenAlex: ratio 1.00: Benchmarking machine learning models in lesion-symptom mapping for predicting language outcomes in stroke survivors | Deepa Tilwani, Christian O<right single quotation mark>Reilly, Nicholas Riccardi, Valerie L. Shalin, Dirk<hyphen>Bart den Ouden, Svetlana V. Shinkareva, Julius Fridriksson, Amit Sheth, Rutvik H. Desai | 2025 | Frontiers in Neuroimaging | vol 4 | pages 1573816--1573816 | doi 10.3389/fnimg.2025.1573816 | OpenAlex W4410905407 | open access https://www.frontiersin.org/journals/neuroimaging/articles/10.3389/fnimg.2025.1573816/pdf
Semantic Scholar: ratio 1.00: Benchmarking machine learning models in lesion-symptom mapping for predicting language outcomes in stroke survivors | Deepa Tilwani, Christian O'Reilly, Nicholas Riccardi, V. Shalin, D. den Ouden, J. Fridriksson, S. Shinkareva, Amit P. Sheth, Rutvik H. Desai | 2025 | Frontiers in Neuroimaging | vol 4 | doi 10.3389/fnimg.2025.1573816 | Semantic Scholar de74c7cda2eb3ba9c144f69a4a80ff334827ea08 | open access https://www.frontiersin.org/journals/neuroimaging/articles/10.3389/fnimg.2025.1573816/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### whybra2024image
Command: python3 lookup resolve '10.1148/radiol.231319'
```
Crossref: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Convolutional Filters for Reproducible Radiomics and Enhanced Clinical Insights | Philip Whybra, Alex Zwanenburg, Vincent Andrearczyk, Roger Schaer, Aditya P. Apte, Alexandre Ayotte, Bhakti Baheti, Spyridon Bakas, Andrea Bettinelli, Ronald Boellaard, Luca Boldrini, Ir<latin small letter e with grave>ne Buvat, Gary J. R. Cook, Florian Dietsche, Nicola Dinapoli, Hubert S. Gabry<latin small letter s with acute>, Vicky Goh, Matthias Guckenberger, Mathieu Hatt, Mahdi Hosseinzadeh, Aditi Iyer, Jacopo Lenkowicz, Mahdi A. L. Loutfi, Steffen L<latin small letter o with diaeresis>ck, Francesca Marturano, Olivier Morin, Christophe Nioche, Fanny Orlhac, Sarthak Pati, Arman Rahmim, Seyed Masoud Rezaeijo, Christopher G. Rookyard, Mohammad R. Salmanpour, Andreas Schindele, Isaac Shiri, Emiliano Spezi, Stephanie Tanadini-Lang, Florent Tixier, Taman Upadhaya, Vincenzo Valentini, Joost J. M. van Griethuysen, Fereshteh Yousefirizi, Habib Zaidi, Henning M<latin small letter u with diaeresis>ller, Martin Valli<latin small letter e with grave>res, Adrien Depeursinge | 2024 | Radiology | vol 310 | no 2 | doi 10.1148/radiol.231319
OpenAlex: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Convolutional Filters for Reproducible Radiomics and Enhanced Clinical Insights | P. Whybra, Alex Zwanenburg, Vincent Andrearczyk, Roger Schaer, Aditya Apte, Alexandre Ayotte, Bhakti Baheti, Spyridon Bakas, Andrea Bettinelli, Ronald Boellaard, Luca Boldrini, Ir<latin small letter e with grave>ne Buvat, Gary Cook, Florian Dietsche, N. Dinapoli, Hubert Szymon Gabry<latin small letter s with acute>, Vicky Goh, Matthias G<latin small letter u with diaeresis>ckenberger, Mathieu Hatt, Mahdi Hosseinzadeh, Aditi Iyer, Jacopo Lenkowicz, Mahdi Ait Lhaj Loutfi, Steffen L<latin small letter o with diaeresis>ck, Francesca Marturano, Olivier Morin, Christophe Nioche, Fanny Orlhac, Sarthak Pati, Arman Rahmim, Seyed Masoud Rezaeijo, Christopher G Rookyard, Mohammad R. Salmanpour, Andreas Schindele, Isaac Shiri, Emiliano Spezi, Stephanie Tanadini<hyphen>Lang, Florent Tixier, Taman Upadhaya, Vincenzo Valentini, Joost J. M. van Griethuysen, Fereshteh Yousefirizi, Habib Zaidi, Henning M<latin small letter u with diaeresis>ller, Martin Valli<latin small letter e with grave>res, Adrien Depeursinge | 2024 | Radiology | vol 310 | no 2 | pages e231319--e231319 | doi 10.1148/radiol.231319 | OpenAlex W4391577343 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC10902595/pdf/radiol.231319.pdf
Semantic Scholar: ratio 1.00: The Image Biomarker Standardization Initiative: Standardized Convolutional Filters for Reproducible Radiomics and Enhanced Clinical Insights. | P. Whybra, A. Zwanenburg, V. Andrearczyk, Roger Schaer, Aditya Apte, A. Ayotte, B. Baheti, S. Bakas, A. Bettinelli, R. Boellaard, L. Boldrini, I. Buvat, G. Cook, Florian Dietsche, N. Dinapoli, H. Gabry<latin small letter s with acute>, V. Goh, M. Guckenberger, M. Hatt, Mahdi Hosseinzadeh, A. Iyer, J. Lenkowicz, M. A. L. Loutfi, S. L<latin small letter o with diaeresis>ck, F. Marturano, O. Morin, C. Nioche, F. Orlhac, Sarthak Pati, A. Rahmim, S. M. Rezaeijo, Chris Rookyard, M. Salmanpour, A. Schindele, I. Shiri, E. Spezi, S. Tanadini-Lang, F. Tixier, T. Upadhaya, V. Valentini, J. V. van Griethuysen, F. Yousefirizi, H. Zaidi, H. M<latin small letter u with diaeresis>ller, M. Valli<latin small letter e with grave>res, A. Depeursinge | 2024 | Radiology | vol 310 2 | pages e231319 | doi 10.1148/radiol.231319 | Semantic Scholar 8f68d9908bfc68d4b43321b0b6c9e7656570fd90 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC10902595/pdf/radiol.231319.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### paquier2022radiomics
Command: python3 lookup resolve '10.1088/2057-1976/ac8e6f'
```
Crossref: ratio 1.00: Radiomics software comparison using digital phantom and patient data: IBSI-compliance does not guarantee concordance of feature values | Zelda Paquier, Shih-Li Chao, Ana<latin small letter i with diaeresis>s Acquisto, Chifra Fenton, Thomas Guiot, Jennifer Dhont, Hugo Levillain, Akos Gulyban, Maria Antonietta Bali, Nick Reynaert | 2022 | Biomedical Physics &amp; Engineering Express | vol 8 | no 6 | pages 065008 | doi 10.1088/2057-1976/ac8e6f
OpenAlex: ratio 1.00: Radiomics software comparison using digital phantom and patient data: IBSI-compliance does not guarantee concordance of feature values | Zelda Paquier, Shih<hyphen>Li Chao, Ana<latin small letter i with diaeresis>s Acquisto, Chifra Fenton, Thomas Guiot, Jennifer Dhont, Hugo Levillain, <latin capital letter a with acute>kos Gulyb<latin small letter a with acute>n, Maria Antonietta Bali, Nick Reynaert | 2022 | Biomedical Physics & Engineering Express | vol 8 | no 6 | pages 065008--065008 | doi 10.1088/2057-1976/ac8e6f | OpenAlex W4294215059 | open access https://iopscience.iop.org/article/10.1088/2057-1976/ac8e6f/pdf
Semantic Scholar: ratio 1.00: Radiomics software comparison using digital phantom and patient data: IBSI-compliance does not guarantee concordance of feature values | Z. Paquier, Shih-Li Chao, Ana<latin small letter i with diaeresis>s Acquisto, Chifra Fenton, T. Guiot, J. Dhont, H. Levillain, <latin capital letter a with acute>. Gulyb<latin small letter a with acute>n, M. Bali, N. Reynaert | 2022 | Biomedical engineering and physics express | vol 8 | doi 10.1088/2057-1976/ac8e6f | Semantic Scholar 59d371f2a72e3dd33fc00ea5164b04c08240341c | open access https://iopscience.iop.org/article/10.1088/2057-1976/ac8e6f/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### egger2017mri
Command: python3 lookup resolve '10.1016/j.nicl.2016.11.020'
```
Crossref: ratio 1.00: MRI FLAIR lesion segmentation in multiple sclerosis: Does automated segmentation hold up with manual annotation? | Christine Egger, Roland Opfer, Chenyu Wang, Timo Kepp, Maria Pia Sormani, Lothar Spies, Michael Barnett, Sven Schippling | 2017 | NeuroImage: Clinical | vol 13 | pages 264--270 | doi 10.1016/j.nicl.2016.11.020
OpenAlex: ratio 1.00: MRI FLAIR lesion segmentation in multiple sclerosis: Does automated segmentation hold up with manual annotation? | Christine Egger, Roland Opfer, Chenyu Wang, Timo Kepp, Maria Pia Sormani, Lothar Spies, Michael Harry Barnett, Sven Schippling | 2016 | NeuroImage Clinical | vol 13 | pages 264--270 | doi 10.1016/j.nicl.2016.11.020 | OpenAlex W2549949175 | open access https://www.sciencedirect.com/science/article/pii/S2213158216302285/pdf
Semantic Scholar: ratio 1.00: MRI FLAIR lesion segmentation in multiple sclerosis: Does automated segmentation hold up with manual annotation? | C. Egger, R. Opfer, C. Wang, Timo Kepp, M. Sormani, L. Spies, M. Barnett, S. Schippling | 2016 | NeuroImage: Clinical | vol 13 | pages 264--270 | doi 10.1016/j.nicl.2016.11.020 | Semantic Scholar 8611112d0c105f752e239fe8729e652f8ee52ce3 | open access https://www.sciencedirect.com/science/article/pii/S2213158216302285/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### hindsholm2025prospective
Command: python3 lookup resolve '10.1007/s00234-025-03834-4'
```
Crossref: ratio 1.00: Prospective clinical evaluation of automatic lesion assessment in patients with multiple sclerosis | Amalie Monberg Hindsholm, Annika Reynberg Langkilde, Jonathan Frederik Carlsen, Dorthea N<latin small letter o with stroke>rregaard, Thomas Axelsen, Aya Bakhtyar Baram, Natalia Grundtvig, Abdullah Shafique, Jette Lautrup Frederiksen, Flemming Littrup Andersen, Henrik BW Larsson, Adam Espe Hansen, Martin Lundsgaard Hansen, Claes N<latin small letter o with stroke>hr Ladefoged, Ulrich Lindberg | 2025 | Neuroradiology | vol 67 | no 12 | pages 3623--3635 | doi 10.1007/s00234-025-03834-4
OpenAlex: ratio 1.00: Prospective clinical evaluation of automatic lesion assessment in patients with multiple sclerosis | Amalie Monberg Hindsholm, Annika Reynberg Langkilde, Jonathan Frederik Carlsen, Dorthea N<latin small letter o with stroke>rregaard, Thomas Axelsen, Aya Bakhtyar Baram, Natalia Grundtvig, Abdullah Shafique, Jette Lautrup Frederiksen, Flemming Littrup Andersen, Henrik B. W. Larsson, Adam Espe Hansen, Martin Lundsgaard Hansen, Claes N<latin small letter o with stroke>hr Ladefoged, Ulrich Lindberg | 2025 | Neuroradiology | vol 67 | no 12 | pages 3623--3635 | doi 10.1007/s00234-025-03834-4 | OpenAlex W4416137509
Semantic Scholar: ratio 1.00: Prospective clinical evaluation of automatic lesion assessment in patients with multiple sclerosis | A. Hindsholm, A. Langkilde, J. Carlsen, Dorthea N<latin small letter o with stroke>rregaard, Thomas Axelsen, A. Baram, Natalia Grundtvig, Abdullah Shafique, J. Frederiksen, F. Andersen, H. Larsson, A. E. Hansen, Martin Lundsgaard Hansen, C. Ladefoged, U. Lindberg | 2025 | Neuroradiology | vol 67 | pages 3623--3635 | doi 10.1007/s00234-025-03834-4 | Semantic Scholar c6e3f30dc5973f043b226254100c57a802abc342
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### isensee2024nnu
Command: python3 lookup resolve '10.1007/978-3-031-72114-4_47'
```
Crossref: ratio 1.00: nnU-Net Revisited: A Call for Rigorous Validation in 3D Medical Image Segmentation | Fabian Isensee, Tassilo Wald, Constantin Ulrich, Michael Baumgartner, Saikat Roy, Klaus Maier-Hein, Paul F. J<latin small letter a with diaeresis>ger | 2024 | Lecture Notes in Computer Science | pages 488--498 | doi 10.1007/978-3-031-72114-4_47
OpenAlex: ratio 1.00: nnU-Net Revisited: A Call for Rigorous Validation in 3D Medical Image Segmentation | Fabian Isensee, Tassilo Wald, Constantin Ulrich, Michael Baumgartner, Saikat Roy, Klaus Hermann Maier-Hein, Paul F. J<latin small letter a with diaeresis>ger | 2024 | Lecture notes in computer science | pages 488--498 | doi 10.1007/978-3-031-72114-4_47 | OpenAlex W4403067601 | open access https://arxiv.org/pdf/2404.09556
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### qiu2023qcresunet
Command: python3 lookup resolve '10.1007/978-3-031-43901-8_17'
```
Crossref: ratio 1.00: QCResUNet: Joint Subject-Level and Voxel-Level Prediction of Segmentation Quality | Peijie Qiu, Satrajit Chakrabarty, Phuc Nguyen, Soumyendu Sekhar Ghosh, Aristeidis Sotiras | 2023 | Lecture Notes in Computer Science | pages 173--182 | doi 10.1007/978-3-031-43901-8_17
OpenAlex: ratio 1.00: QCResUNet: Joint Subject-Level and Voxel-Level Prediction of Segmentation Quality | Peijie Qiu, Satrajit Chakrabarty, Phuc Nguyen, Soumyendu Sekhar Ghosh, Aristeidis Sotiras | 2023 | Lecture notes in computer science | pages 173--182 | doi 10.1007/978-3-031-43901-8_17 | OpenAlex W4387211381
Semantic Scholar: ratio 1.00: QCResUNet: Joint Subject-Level and Voxel-Level Prediction of Segmentation Quality | Pei-Jie Qiu, Satrajit Chakrabarty, Phuc Nguyen, S. Ghosh, Aristeidis Sotiras | 2023 | International Conference on Medical Image Computing and Computer-Assisted Intervention | pages 173--182 | doi 10.1007/978-3-031-43901-8_17 | Semantic Scholar a474499555555fed84b06819f0964394c6679985
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### balagurunathan2014reproducibility
Command: python3 lookup resolve '10.1593/tlo.13844'
```
Crossref: ratio 1.00: Reproducibility and Prognosis of Quantitative Features Extracted from CT Images | Yoganand Balagurunathan, Yuhua Gu, Hua Wang, Virendra Kumar, Olya Grove, Sam Hawkins, Jongphil Kim, Dmitry B. Goldgof, Lawrence O. Hall, Robert A. Gatenby, Robert J. Gillies | 2014 | Translational Oncology | vol 7 | no 1 | pages 72--87 | doi 10.1593/tlo.13844
OpenAlex: ratio 1.00: Reproducibility and Prognosis of Quantitative Features Extracted from CT Images | Yoganand Balagurunathan, Yuhua Gu, Hua Wang, Virendra Kumar, Olya Grove, S.K. Hawkins, Jongphil Kim, Dmitry B. Goldgof, Lawrence Hall, Robert A. Gatenby, Robert J. Gillies | 2014 | Translational Oncology | vol 7 | no 1 | pages 72--87 | doi 10.1593/tlo.13844 | OpenAlex W2062744135 | open access https://www.sciencedirect.com/science/article/pii/S1936523314800107/pdf
Semantic Scholar: ratio 1.00: Reproducibility and Prognosis of Quantitative Features Extracted from CT Images. | Y. Balagurunathan, Yuhua Gu, Hua Wang, Virendra Kumar, O. Grove, S. Hawkins, Jongphil Kim, Dmitry Goldgof, L. Hall, R. Gatenby, R. Gillies | 2014 | Translational Oncology | vol 7 1 | pages 72--87 | doi 10.1593/TLO.13844 | Semantic Scholar 32229d6f8dc57e9c13f9c17566a8aaadccb10a27 | open access https://www.sciencedirect.com/science/article/pii/S1936523314800107/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zwanenburg2019assessing
Command: python3 lookup resolve '10.1038/s41598-018-36938-4'
```
Crossref: ratio 1.00: Assessing robustness of radiomic features by image perturbation | Alex Zwanenburg, Stefan Leger, Linda Agolli, Karoline Pilz, Esther G. C. Troost, Christian Richter, Steffen L<latin small letter o with diaeresis>ck | 2019 | Scientific Reports | vol 9 | no 1 | doi 10.1038/s41598-018-36938-4
OpenAlex: ratio 1.00: Assessing robustness of radiomic features by image perturbation | Alex Zwanenburg, Stefan Leger, Linda Agolli, Karoline Pilz, Esther G.C. Troost, Christian Richter, Steffen L<latin small letter o with diaeresis>ck | 2019 | Scientific Reports | vol 9 | no 1 | pages 614--614 | doi 10.1038/s41598-018-36938-4 | OpenAlex W2807998518 | open access https://www.nature.com/articles/s41598-018-36938-4.pdf
Semantic Scholar: ratio 1.00: Assessing robustness of radiomic features by image perturbation | A. Zwanenburg, S. Leger, L. Agolli, K. Pilz, E. Troost, C. Richter, S. L<latin small letter o with diaeresis>ck | 2018 | Scientific Reports | vol 9 | doi 10.1038/s41598-018-36938-4 | arXiv 1806.06719 | Semantic Scholar 820b04ea5faa4dc291c05592610cf69604e00361 | open access https://www.nature.com/articles/s41598-018-36938-4.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### haarburger2020radiomics
Command: python3 lookup resolve '10.1038/s41598-020-69534-6'
```
Crossref: ratio 1.00: Radiomics feature reproducibility under inter-rater variability in segmentations of CT images | Christoph Haarburger, Gustav M<latin small letter u with diaeresis>ller-Franzes, Leon Weninger, Christiane Kuhl, Daniel Truhn, Dorit Merhof | 2020 | Scientific Reports | vol 10 | no 1 | doi 10.1038/s41598-020-69534-6
OpenAlex: ratio 1.00: Radiomics feature reproducibility under inter-rater variability in segmentations of CT images | Christoph Haarburger, Gustav Anton M<latin small letter u with diaeresis>ller<hyphen>Franzes, Leon Weninger, Christiane Katharina Kuhl, Daniel Truhn, Dorit Merhof | 2020 | Scientific Reports | vol 10 | no 1 | pages 12688--12688 | doi 10.1038/s41598-020-69534-6 | OpenAlex W3046015102 | open access https://www.nature.com/articles/s41598-020-69534-6.pdf
Semantic Scholar: ratio 1.00: Radiomics feature reproducibility under inter-rater variability in segmentations of CT images | Christoph Haarburger, Gustav M<latin small letter u with diaeresis>ller-Franzes, Leon Weninger, C. Kuhl, D. Truhn, D. Merhof | 2020 | Scientific Reports | vol 10 | doi 10.1038/s41598-020-69534-6 | Semantic Scholar b873f7669b28c2af698c958c65b4f3568081c97b | open access https://www.nature.com/articles/s41598-020-69534-6.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### granzier2020mri
Command: python3 lookup resolve '10.1038/s41598-020-70940-z'
```
Crossref: ratio 1.00: MRI-based radiomics in breast cancer: feature robustness with respect to inter-observer segmentation variability | R. W. Y. Granzier, N. M. H. Verbakel, A. Ibrahim, J. E. van Timmeren, T. J. A. van Nijnatten, R. T. H. Leijenaar, M. B. I. Lobbes, M. L. Smidt, H. C. Woodruff | 2020 | Scientific Reports | vol 10 | no 1 | doi 10.1038/s41598-020-70940-z
OpenAlex: ratio 1.00: MRI-based radiomics in breast cancer: feature robustness with respect to inter-observer segmentation variability | Ren<latin small letter e with acute>e W. Y. Granzier, N. M. H. Verbakel, Abdalla Ibrahim, Janita E. van Timmeren, Thiemo J. A. van Nijnatten, Ralph T. H. Leijenaar, Marc B. I. Lobbes, Marjolein L. Smidt, Henry C. Woodruff | 2020 | Scientific Reports | vol 10 | no 1 | pages 14163--14163 | doi 10.1038/s41598-020-70940-z | OpenAlex W3081173912 | open access https://www.nature.com/articles/s41598-020-70940-z.pdf
Semantic Scholar: ratio 1.00: MRI-based radiomics in breast cancer: feature robustness with respect to inter-observer segmentation variability | R. Granzier, N. J. Verbakel, A. Ibrahim, J. V. van Timmeren, T. V. van Nijnatten, R. Leijenaar, M. Lobbes, M. Smidt, H. Woodruff | 2020 | Scientific Reports | vol 10 | doi 10.1038/s41598-020-70940-z | Semantic Scholar ca9d51b7c7d7ff1f2b5760a6ecd2c25243451cbf | open access https://www.nature.com/articles/s41598-020-70940-z.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### mullerfranzes2022reliability
Command: python3 lookup resolve '10.3390/diagnostics12020247'
```
Crossref: ratio 1.00: Reliability as a Precondition for Trust<em dash>Segmentation Reliability Analysis of Radiomic Features Improves Survival Prediction | Gustav M<latin small letter u with diaeresis>ller-Franzes, Sven Nebelung, Justus Schock, Christoph Haarburger, Firas Khader, Federico Pedersoli, Maximilian Schulze-Hagen, Christiane Kuhl, Daniel Truhn | 2022 | Diagnostics | vol 12 | no 2 | pages 247 | doi 10.3390/diagnostics12020247
OpenAlex: ratio 1.00: Reliability as a Precondition for Trust<em dash>Segmentation Reliability Analysis of Radiomic Features Improves Survival Prediction | Gustav Anton M<latin small letter u with diaeresis>ller<hyphen>Franzes, Sven Nebelung, Justus Schock, Christoph Haarburger, Firas Khader, Federico Pedersoli, Maximilian Franz Schulze-Hagen, Christiane Katharina Kuhl, Daniel Truhn | 2022 | Diagnostics | vol 12 | no 2 | pages 247--247 | doi 10.3390/diagnostics12020247 | OpenAlex W4205268553 | open access https://www.mdpi.com/2075-4418/12/2/247/pdf?version=1642679507
Semantic Scholar: ratio 1.00: Reliability as a Precondition for Trust<em dash>Segmentation Reliability Analysis of Radiomic Features Improves Survival Prediction | Gustav M<latin small letter u with diaeresis>ller-Franzes, S. Nebelung, J. Schock, Christoph Haarburger, F. Khader, F. Pedersoli, M. Schulze-Hagen, C. Kuhl, D. Truhn | 2022 | Diagnostics | vol 12 | doi 10.3390/diagnostics12020247 | Semantic Scholar 2e864fa8842e2587fd42a098c503f4cb949c729e | open access https://www.mdpi.com/2075-4418/12/2/247/pdf?version=1642679507
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ferrante2022application
Command: python3 lookup resolve '10.3390/jcm11247334'
```
Crossref: ratio 1.00: Application of nnU-Net for Automatic Segmentation of Lung Lesions on CT Images and Its Implication for Radiomic Models | Matteo Ferrante, Lisa Rinaldi, Francesca Botta, Xiaobin Hu, Andreas Dolp, Marta Minotti, Francesca De Piano, Gianluigi Funicelli, Stefania Volpe, Federica Bellerba, Paolo De Marco, Sara Raimondi, Stefania Rizzo, Kuangyu Shi, Marta Cremonesi, Barbara A. Jereczek-Fossa, Lorenzo Spaggiari, Filippo De Marinis, Roberto Orecchia, Daniela Origgi | 2022 | Journal of Clinical Medicine | vol 11 | no 24 | pages 7334 | doi 10.3390/jcm11247334
OpenAlex: ratio 1.00: Application of nnU-Net for Automatic Segmentation of Lung Lesions on CT Images and Its Implication for Radiomic Models | Matteo Ferrante, Lisa M. Rinaldi, Francesca Botta, Xiaobin Hu, Andreas Dolp, Marta Minotti, Francesca De Piano, Gianluigi Funicelli, Stefania Volpe, Federica Bellerba, P. De Marco, Sara Raimondi, Stefania Rizzo, Kuangyu Shi, Marta Cremonesi, Barbara Alicja Jereczek<hyphen>Fossa, Lorenzo Spaggiari, Filippo de Marinis, Roberto Orecchia, Daniela Origgi | 2022 | Journal of Clinical Medicine | vol 11 | no 24 | pages 7334--7334 | doi 10.3390/jcm11247334 | OpenAlex W4312127612 | open access https://www.mdpi.com/2077-0383/11/24/7334/pdf?version=1670918624
Semantic Scholar: ratio 1.00: Application of nnU-Net for Automatic Segmentation of Lung Lesions on CT Images and Its Implication for Radiomic Models | M. Ferrante, L. Rinaldi, F. Botta, Xiao-Bin Hu, Andreas Dolp, M. Minotti, F. De Piano, G. Funicelli, S. Volpe, F. Bellerba, P. De Marco, S. Raimondi, S. Rizzo, Kuangyu Shi, M. Cremonesi, B. Jereczek-Fossa, L. Spaggiari, F. de Marinis, R. Orecchia, D. Origgi | 2022 | Journal of Clinical Medicine | vol 11 | doi 10.3390/jcm11247334 | Semantic Scholar 363a778e6163e3dd0669e981ed1e7628a8999f77 | open access https://www.mdpi.com/2077-0383/11/24/7334/pdf?version=1670918624
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### choi2020idh1
Command: python3 lookup resolve '10.1016/j.ejrad.2020.109031'
```
Crossref: ratio 1.00: IDH1 mutation prediction using MR-based radiomics in glioblastoma: comparison between manual and fully automated deep learning-based approach of tumor segmentation | Yangsean Choi, Yoonho Nam, Youn Soo Lee, Jiwoong Kim, Kook-Jin Ahn, Jinhee Jang, Na-Young Shin, Bum-Soo Kim, Sin-Soo Jeon | 2020 | European Journal of Radiology | vol 128 | pages 109031 | doi 10.1016/j.ejrad.2020.109031
OpenAlex: ratio 1.00: IDH1 mutation prediction using MR-based radiomics in glioblastoma: comparison between manual and fully automated deep learning-based approach of tumor segmentation | Yangsean Choi, Yoonho Nam, Youn Soo Lee, Jiwoong Kim, Kook Jin Ahn, Jinhee Jang, Na<hyphen>Young Shin, Bum<hyphen>Soo Kim, Sin-Soo Jeon | 2020 | European Journal of Radiology | vol 128 | pages 109031--109031 | doi 10.1016/j.ejrad.2020.109031 | OpenAlex W3023279341
Semantic Scholar: ratio 1.00: IDH1 mutation prediction using MR-based radiomics in glioblastoma: comparison between manual and fully automated deep learning-based approach of tumor segmentation. | Yangsean Choi, Y. Nam, Youn Soo Lee, Jiwoong Kim, K. Ahn, J. Jang, Na-Young Shin, B. Kim, S. Jeon | 2020 | European Journal of Radiology | vol 128 | pages 109031 | doi 10.1016/j.ejrad.2020.109031 | Semantic Scholar f9cfca055ffa528228fa9f0607edea331ed62c60
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kothari2022impact
Command: python3 lookup resolve '10.1038/s41598-022-16520-9'
```
Crossref: ratio 1.00: The impact of inter-observer variation in delineation on robustness of radiomics features in non-small cell lung cancer | Gargi Kothari, Beverley Woon, Cameron J. Patrick, James Korte, Leonard Wee, Gerard G. Hanna, Tomas Kron, Nicholas Hardcastle, Shankar Siva | 2022 | Scientific Reports | vol 12 | no 1 | doi 10.1038/s41598-022-16520-9
OpenAlex: ratio 1.00: The impact of inter-observer variation in delineation on robustness of radiomics features in non-small cell lung cancer | Gargi Kothari, Beverley Woon, Cameron James Patrick, James C. Korte, Leonard Wee, Gerard G. Hanna, Tomas Kron, Nicholas Hardcastle, Shankar Siva | 2022 | Scientific Reports | vol 12 | no 1 | pages 12822--12822 | doi 10.1038/s41598-022-16520-9 | OpenAlex W4288067243 | open access https://www.nature.com/articles/s41598-022-16520-9.pdf
Semantic Scholar: ratio 1.00: The impact of inter-observer variation in delineation on robustness of radiomics features in non-small cell lung cancer | G. Kothari, B. Woon, C. Patrick, J. Korte, L. Wee, G. Hanna, T. Kron, N. Hardcastle, S. Siva | 2022 | Scientific Reports | vol 12 | doi 10.1038/s41598-022-16520-9 | Semantic Scholar 5a3fc5f4af0e8de2cb0c553f0d8aa8482964db44 | open access https://www.nature.com/articles/s41598-022-16520-9.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### pasini2023critical
Command: python3 lookup resolve '10.3390/diagnostics13243640'
```
Crossref: ratio 1.00: A Critical Analysis of the Robustness of Radiomics to Variations in Segmentation Methods in 18F-PSMA-1007 PET Images of Patients Affected by Prostate Cancer | Giovanni Pasini, Giorgio Russo, Cristina Mantarro, Fabiano Bini, Selene Richiusa, Lucrezia Morgante, Albert Comelli, Giorgio Russo, Maria Sabini, Sebastiano Cosentino, Franco Marinozzi, Massimo Ippolito, Alessandro Stefano | 2023 | Diagnostics | vol 13 | no 24 | pages 3640 | doi 10.3390/diagnostics13243640
OpenAlex: ratio 1.00: A Critical Analysis of the Robustness of Radiomics to Variations in Segmentation Methods in 18F-PSMA-1007 PET Images of Patients Affected by Prostate Cancer | Giovanni Pasini, Giorgio Ivan Russo, Cristina Mantarro, Fabiano Bini, Selene Richiusa, Lucrezia Morgante, Albert Comelli, Giorgio Ivan Russo, MARIA GABRIELLA SABINI, Sebastiano Cosentino, Franco Marinozzi, Massimo Ippolito, Alessandro Stefano | 2023 | Diagnostics | vol 13 | no 24 | pages 3640--3640 | doi 10.3390/diagnostics13243640 | OpenAlex W4389574046 | open access https://www.mdpi.com/2075-4418/13/24/3640/pdf?version=1702351212
Semantic Scholar: ratio 1.00: A Critical Analysis of the Robustness of Radiomics to Variations in Segmentation Methods in 18F-PSMA-1007 PET Images of Patients Affected by Prostate Cancer | G. Pasini, G. Russo, Cristina Mantarro, F. Bini, S. Richiusa, Lucrezia Morgante, A. Comelli, G. Russo, M. G. Sabini, S. Cosentino, F. Marinozzi, M. Ippolito, A. Stefano | 2023 | Diagnostics | vol 13 | doi 10.3390/diagnostics13243640 | Semantic Scholar b3011bbb3d2bbd32cb6c94484b46b5bee12217d9 | open access https://www.mdpi.com/2075-4418/13/24/3640/pdf?version=1702351212
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dutta2024robustness
Command: python3 lookup resolve '10.1016/j.phro.2023.100530'
```
Crossref: ratio 1.00: Robustness of magnetic resonance imaging and positron emission tomography radiomic features in prostate cancer: Impact on recurrence prediction after radiation therapy | Arpita Dutta, Joseph Chan, Annette Haworth, David J. Dubowitz, Andrew Kneebone, Hayley M. Reynolds | 2024 | Physics and Imaging in Radiation Oncology | vol 29 | pages 100530 | doi 10.1016/j.phro.2023.100530
OpenAlex: ratio 1.00: Robustness of magnetic resonance imaging and positron emission tomography radiomic features in prostate cancer: Impact on recurrence prediction after radiation therapy | Arpita Dutta, Joseph C. Y. Chan, Annette Haworth, David J. Dubowitz, Andrew B. Kneebone, Hayley M. Reynolds | 2023 | Physics and Imaging in Radiation Oncology | vol 29 | pages 100530--100530 | doi 10.1016/j.phro.2023.100530 | OpenAlex W4390463252 | open access http://www.phiro.science/article/S2405631623001215/pdf
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### louis2024identification
Command: python3 lookup resolve '10.1038/s41598-024-58551-4'
```
Crossref: ratio 1.00: Identification of CT radiomic features robust to acquisition and segmentation variations for improved prediction of radiotherapy-treated lung cancer patient recurrence | Thomas Louis, Fran<latin small letter c with cedilla>ois Lucia, Fran<latin small letter c with cedilla>ois Cousin, Carole Mievis, Nicolas Jansen, Bernard Duysinx, Romain Le Pennec, Dimitris Visvikis, Malik Nebbache, Martin Rehn, Mohamed Hamya, Margaux Geier, Pierre-Yves Salaun, Ulrike Schick, Mathieu Hatt, Philippe Coucke, Pierre Lovinfosse, Roland Hustinx | 2024 | Scientific Reports | vol 14 | no 1 | doi 10.1038/s41598-024-58551-4
OpenAlex: ratio 1.00: Identification of CT radiomic features robust to acquisition and segmentation variations for improved prediction of radiotherapy-treated lung cancer patient recurrence | Thomas Louis, Fran<latin small letter c with cedilla>ois Lucia, Fran<latin small letter c with cedilla>ois Cousin, Carole Mievis, Nicolas Jansen, Bernard Duysinx, Romain Le Pennec, Dimitris Visvikis, Malik Nebbache, Martin Rehn, Mohamed Hamya, Margaux Geier, Pierre<hyphen>Yves Sala<latin small letter u with diaeresis>n, Ulrike Schick, Mathieu Hatt, Philippe Antoine Coucke, Pierre Lovinfosse, Roland Hustinx | 2024 | Scientific Reports | vol 14 | no 1 | pages 9028--9028 | doi 10.1038/s41598-024-58551-4 | OpenAlex W4394963056 | open access https://www.nature.com/articles/s41598-024-58551-4.pdf
Semantic Scholar: ratio 1.00: Identification of CT radiomic features robust to acquisition and segmentation variations for improved prediction of radiotherapy-treated lung cancer patient recurrence | T. Louis, F. Lucia, F. Cousin, C. Mievis, Nicolas Jansen, B. Duysinx, R. Le Pennec, D. Visvikis, M. Nebbache, M. Rehn, M. Hamya, M. Geier, P. Salaun, U. Schick, M. Hatt, P. Coucke, P. Lovinfosse, R. Hustinx | 2024 | Scientific Reports | vol 14 | doi 10.1038/s41598-024-58551-4 | Semantic Scholar 35aeecdec09188b102355eb7bdfd234e31198b8c | open access https://www.nature.com/articles/s41598-024-58551-4.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### leijenaar2013stability
Command: python3 lookup resolve '10.3109/0284186x.2013.812798'
```
Crossref: ratio 1.00: Stability of FDG-PET Radiomics features: An integrated analysis of test-retest and inter-observer variability | Ralph T. H. Leijenaar, Sara Carvalho, Emmanuel Rios Velazquez, Wouter J. C. van Elmpt, Chintan Parmar, Otto S. Hoekstra, Corneline J. Hoekstra, Ronald Boellaard, Andr<latin small letter e with acute> L. A. J. Dekker, Robert J. Gillies, Hugo J. W. L. Aerts, Philippe Lambin | 2013 | Acta Oncologica | vol 52 | no 7 | pages 1391--1397 | doi 10.3109/0284186x.2013.812798
OpenAlex: ratio 1.00: Stability of FDG-PET Radiomics features: An integrated analysis of test-retest and inter-observer variability | Ralph T. H. Leijenaar, Sara Carvalho, Emmanuel Rios Velazquez, Wouter van Elmpt, Chintan Parmar, Otto S. Hoekstra, Corneline J. Hoekstra, Ronald Boellaard, Andre L.A.J. Dekker, Robert J. Gillies, Hugo J.W.L. Aerts, Philippe Lambin | 2013 | Acta Oncologica | vol 52 | no 7 | pages 1391--1397 | doi 10.3109/0284186x.2013.812798 | OpenAlex W2089588713 | open access https://www.tandfonline.com/doi/pdf/10.3109/0284186X.2013.812798?needAccess=true
Semantic Scholar: ratio 1.00: Stability of FDG-PET Radiomics features: An integrated analysis of test-retest and inter-observer variability | R. Leijenaar, S. Carvalho, E. Velazquez, W. van Elmpt, C. Parmar, O. Hoekstra, C. Hoekstra, R. Boellaard, A. Dekker, R. Gillies, H. Aerts, P. Lambin | 2013 | Acta oncologica | vol 52 | pages 1391--1397 | doi 10.3109/0284186X.2013.812798 | Semantic Scholar 25cb862e40fe53ecee040b6d559fad66c1bd698b | open access https://www.tandfonline.com/doi/pdf/10.3109/0284186X.2013.812798?needAccess=true
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kalpathycramer2016radiomics
Command: python3 lookup resolve '10.18383/j.tom.2016.00235'
```
Crossref: ratio 1.00: Radiomics of Lung Nodules: A Multi-Institutional Study of Robustness and Agreement of Quantitative Imaging Features | Jayashree Kalpathy-Cramer, Artem Mamomov, Binsheng Zhao, Lin Lu, Dmitry Cherezov, Sandy Napel, Sebastian Echegaray, Daniel Rubin, Michael McNitt-Gray, Pechin Lo, Jessica C. Sieren, Johanna Uthoff, Samantha K. N. Dilger, Brandan Driscoll, Ivan Yeung, Lubomir Hadjiiski, Kenny Cha, Yoganand Balagurunathan, Robert Gillies, Dmitry Goldgof | 2016 | Tomography | vol 2 | no 4 | pages 430--437 | doi 10.18383/j.tom.2016.00235
OpenAlex: ratio 1.00: Radiomics of Lung Nodules: A Multi-Institutional Study of Robustness and Agreement of Quantitative Imaging Features | Jayashree Kalpathy<en dash>Cramer, Artem Mamomov, Binsheng Zhao, Lin L<latin small letter u with diaeresis>, Dmitry Cherezov, Sandy A. Napel, Sebastian Echegaray, Daniel L. Rubin, Michael F. McNitt<hyphen>Gray, Pechin Lo, Jessica C. Sieren, Johanna Uthoff, Samantha K. N. Dilger, Brandan Driscoll, Ivan W. T. Yeung, Lubomir M. Hadjiiski, Kenny Cha, Yoganand Balagurunathan, Robert J. Gillies, Dmitry B. Goldgof | 2016 | Tomography | vol 2 | no 4 | pages 430--437 | doi 10.18383/j.tom.2016.00235 | OpenAlex W2586281702 | open access https://www.mdpi.com/2379-139X/2/4/430/pdf?version=1622990172
Semantic Scholar: ratio 1.00: Radiomics of Lung Nodules: A Multi-Institutional Study of Robustness and Agreement of Quantitative Imaging Features | Jayashree Kalpathy-Cramer, Artem Mamomov, Bin-Sheng Zhao, Lin Lu, D. Cherezov, S. Napel, S. Echegaray, D. Rubin, M. McNitt-Gray, P. Lo, J. Sieren, J. Uthoff, Samantha K. N. Dilger, Brandan Driscoll, I. Yeung, L. Hadjiiski, Kenny H. Cha, Y. Balagurunathan, R. Gillies, D. Goldgof | 2016 | Tomography | vol 2 | pages 430--437 | doi 10.18383/j.tom.2016.00235 | Semantic Scholar 4e32c5b8276aec69856cb9be1a4eb62f411c942b | open access https://www.mdpi.com/2379-139X/2/4/430/pdf?version=1622990172
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### parmar2014robust
Command: python3 lookup resolve '10.1371/journal.pone.0102107'
```
Crossref: ratio 1.00: Robust Radiomics Feature Quantification Using Semiautomatic Volumetric Segmentation | Chintan Parmar, Emmanuel Rios Velazquez, Ralph Leijenaar, Mohammed Jermoumi, Sara Carvalho, Raymond H. Mak, Sushmita Mitra, B. Uma Shankar, Ron Kikinis, Benjamin Haibe-Kains, Philippe Lambin, Hugo J. W. L. Aerts | 2014 | PLoS ONE | vol 9 | no 7 | pages e102107 | doi 10.1371/journal.pone.0102107
OpenAlex: ratio 1.00: Robust Radiomics Feature Quantification Using Semiautomatic Volumetric Segmentation | Chintan Parmar, Emmanuel Rios Velazquez, Ralph T. H. Leijenaar, Mohammed Jermoumi, Sara Carvalho, Raymond H. Mak, Sushmita Mitra, B. Uma Shankar, Ron Kikinis, Benjamin Haibe<hyphen>Kains, Philippe Lambin, Hugo J.W.L. Aerts | 2014 | PLoS ONE | vol 9 | no 7 | pages e102107--e102107 | doi 10.1371/journal.pone.0102107 | OpenAlex W2052507258 | open access https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0102107&type=printable
Semantic Scholar: ratio 1.00: Robust Radiomics Feature Quantification Using Semiautomatic Volumetric Segmentation | C. Parmar, E. Velazquez, R. Leijenaar, M. Jermoumi, S. Carvalho, R. Mak, S. Mitra, B. Shankar, R. Kikinis, Benjamin Haibe-Kains, P. Lambin, H. Aerts | 2014 | PLoS ONE | vol 9 | doi 10.1371/journal.pone.0102107 | Semantic Scholar 18292001f06b3fe7fe622df696351d8ceff793e2 | open access https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0102107&type=printable
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tixier2019reliability
Command: python3 lookup resolve '10.1002/mp.13624'
```
Crossref: ratio 1.00: Reliability of tumor segmentation in glioblastoma: Impact on the robustness of MRI<hyphen>radiomic features | Florent Tixier, Hyemin Um, Robert J Young, Harini Veeraraghavan | 2019 | Medical Physics | vol 46 | no 8 | pages 3582--3591 | doi 10.1002/mp.13624
OpenAlex: ratio 1.00: Reliability of tumor segmentation in glioblastoma: Impact on the robustness of MRI<hyphen>radiomic features | Florent Tixier, Hyemin Um, Robert J. Young, Harini Veeraraghavan | 2019 | Medical Physics | vol 46 | no 8 | pages 3582--3591 | doi 10.1002/mp.13624 | OpenAlex W2946875611 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC6692188/
Semantic Scholar: ratio 1.00: Reliability of tumor segmentation in glioblastoma: impact on the robustness of MRI-radiomic features | F. Tixier, Hyemin Um, R. Young, H. Veeraraghavan | 2019 | Medical Physics (Lancaster) | vol 46 | pages 3582--3591 | doi 10.1002/mp.13624 | Semantic Scholar caaf1eeed36b0adeacbdbb1820e7b64bcd9b5c14 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC6692188/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### saha2018breast
Command: python3 lookup resolve '10.1002/mp.12925'
```
Crossref: ratio 1.00: Breast cancer <scp>MRI</scp> radiomics: An overview of algorithmic features and impact of inter<hyphen>reader variability in annotating tumors | Ashirbani Saha, Michael R. Harowicz, Maciej A. Mazurowski | 2018 | Medical Physics | vol 45 | no 7 | pages 3076--3085 | doi 10.1002/mp.12925
OpenAlex: ratio 0.98: Breast cancer MRI radiomics: An overview of algorithmic features and impact of inter<hyphen>reader variability in annotating tumors | Ashirbani Saha, Michael R. Harowicz, Maciej A. Mazurowski | 2018 | Medical Physics | vol 45 | no 7 | pages 3076--3085 | doi 10.1002/mp.12925 | OpenAlex W2802305998 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/6446907
Semantic Scholar: ratio 0.98: Breast cancer MRI radiomics: An overview of algorithmic features and impact of inter-reader variability in annotating tumors | Ashirbani Saha, M. Harowicz, M. Mazurowski | 2018 | Medical Physics (Lancaster) | vol 45 | pages 3076--3085 | doi 10.1002/mp.12925 | Semantic Scholar 649860c9c08aa7d04519c86a99e8958cc6cac7b9 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/6446907
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### qiu2019reproducibility
Command: python3 lookup resolve '10.21037/qims.2019.03.02'
```
Crossref: ratio 1.00: Reproducibility and non-redundancy of radiomic features extracted from arterial phase CT scans in hepatocellular carcinoma patients: impact of tumor segmentation variability | Qingtao Qiu, Jinghao Duan, Zuyun Duan, Xiangjuan Meng, Changsheng Ma, Jian Zhu, Jie Lu, Tonghai Liu, Yong Yin | 2019 | Quantitative Imaging in Medicine and Surgery | vol 9 | no 3 | pages 453--464 | doi 10.21037/qims.2019.03.02
OpenAlex: ratio 1.00: Reproducibility and non-redundancy of radiomic features extracted from arterial phase CT scans in hepatocellular carcinoma patients: impact of tumor segmentation variability | Qingtao Qiu, Jinghao Duan, Zuyun Duan, Xiangjuan Meng, Changsheng Ma, Jian Zhu, Jie Lu, Tonghai Liu, Yong Yin | 2019 | Quantitative Imaging in Medicine and Surgery | vol 9 | no 3 | pages 453--464 | doi 10.21037/qims.2019.03.02 | OpenAlex W2921137012 | open access https://doi.org/10.21037/qims.2019.03.02
Semantic Scholar: ratio 1.00: Reproducibility and non-redundancy of radiomic features extracted from arterial phase CT scans in hepatocellular carcinoma patients: impact of tumor segmentation variability. | Qingtao Qiu, J. Duan, Zuyun Duan, Xiang-Juan Meng, Chang-Sheng Ma, Jian Zhu, Jie Lu, Tong-Hai Liu, Yong Yin | 2019 | Quantitative Imaging in Medicine and Surgery | vol 9 3 | pages 453--464 | doi 10.21037/QIMS.2019.03.02 | Semantic Scholar bfb531afc982fe8d70e4ca2368fa6266070443ff | open access https://doi.org/10.21037/qims.2019.03.02
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### arachchige2026segmentation
Command: python3 lookup resolve '10.1088/1361-6560/aebf1b'
```
Crossref: ratio 1.00: Segmentation-perturbation propagation in pretrained foundation-model embeddings versus IBSI-aligned radiomics for radiologist-assessed lung-nodule malignancy classification on the LIDC-IDRI cohort | Iran Chamika Kumarananda Wanni Arachchige | 2026 | Physics in Medicine &amp; Biology | doi 10.1088/1361-6560/aebf1b
OpenAlex: ratio 1.00: Segmentation-perturbation propagation in pretrained foundation-model embeddings versus IBSI-aligned radiomics for radiologist-assessed lung-nodule malignancy classification on the LIDC-IDRI cohort | Wanni Arachchige Iran Chamika Kumarananda | 2026 | Physics in Medicine and Biology | doi 10.1088/1361-6560/aebf1b | OpenAlex W7225416965 | open access https://iopscience.iop.org/article/10.1088/1361-6560/aebf1b/pdf
Semantic Scholar: ratio 1.00: Segmentation-perturbation propagation in pretrained foundation-model embeddings versus IBSI-aligned radiomics for radiologist-assessed lung-nodule malignancy classification on the LIDC-IDRI cohort. | Iran Chamika Kumarananda Wanni Arachchige | 2026 | Physics in Medicine and Biology | doi 10.1088/1361-6560/aebf1b | Semantic Scholar 5fb132e7a9618a1ced3f5c566d2bfaf766227984 | open access https://iopscience.iop.org/article/10.1088/1361-6560/aebf1b/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### fan2024amyloidpetnet
Command: python3 lookup resolve '10.1148/radiol.231442'
```
Crossref: ratio 1.00: AmyloidPETNet: Classification of Amyloid Positivity in Brain PET Imaging Using End-to-End Deep Learning | Shuyang Fan, Maria Rosana Ponisio, Pan Xiao, Sung Min Ha, Satrajit Chakrabarty, John J. Lee, Shaney Flores, Pamela LaMontagne, Brian Gordon, Cyrus A. Raji, Daniel S. Marcus, Arash Nazeri, Beau M. Ances, Randall J. Bateman, John C. Morris, Tammie L. S. Benzinger, Aristeidis Sotiras, for the Alzheimer's Disease Neuroimaging Initiative | 2024 | Radiology | vol 311 | no 3 | doi 10.1148/radiol.231442
OpenAlex: ratio 1.00: AmyloidPETNet: Classification of Amyloid Positivity in Brain PET Imaging Using End-to-End Deep Learning | Shuyang Fan, Maria Rosana Ponisio, Pan Xiao, Sung Min Ha, Satrajit Chakrabarty, John J. Lee, Shaney E. Flores, Pamela LaMontagne, Brian Andrew Gordon, Cyrus A. Raji, Daniel S. Marcus, Arash Nazeri, Beau M. Ances, Randall John Bateman, John C. Morris, Tammie L.S. Benzinger, Aristeidis Sotiras, Alzheimer<right single quotation mark>s Disease Neuroimaging Initiative | 2024 | Radiology | vol 311 | no 3 | pages e231442--e231442 | doi 10.1148/radiol.231442 | OpenAlex W4399538499 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC11211958/pdf/radiol.231442.pdf
Semantic Scholar: ratio 1.00: AmyloidPETNet: Classification of Amyloid Positivity in Brain PET Imaging Using End-to-End Deep Learning. | Shawn Fan, M. Ponisio, Pan Xiao, Sungmin Ha, Satrajit Chakrabarty, John J. Lee, S. Flores, P. LaMontagne, B. Gordon, C. Raji, D. Marcus, A. Nazeri, B. Ances, R. Bateman, John C. Morris, T. Benzinger, Aristeidis Sotiras | 2024 | Radiology | vol 311 3 | pages e231442 | doi 10.1148/radiol.231442 | Semantic Scholar 704bd5bb416c0ab29d210da4b9b41de64d8b2ba2 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC11211958/pdf/radiol.231442.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wood2022accurate
Command: python3 lookup resolve '10.1016/j.neuroimage.2022.118871'
```
Crossref: ratio 1.00: Accurate brain<hyphen>age models for routine clinical MRI examinations | David A. Wood, Sina Kafiabadi, Ayisha Al Busaidi, Emily Guilhem, Antanas Montvila, Jeremy Lynch, Matthew Townend, Siddharth Agarwal, Asif Mazumder, Gareth J. Barker, Sebastien Ourselin, James H. Cole, Thomas C. Booth | 2022 | NeuroImage | vol 249 | pages 118871 | doi 10.1016/j.neuroimage.2022.118871
OpenAlex: ratio 1.00: Accurate brain<hyphen>age models for routine clinical MRI examinations | David A. Wood, Sina Kafiabadi, Ayisha Al Busaidi, Emily Guilhem, Antanas Montvila, Jeremy Lynch, Matthew Townend, Siddharth Agarwal, Asif Mazumder, Gareth J. Barker, S<latin small letter e with acute>bastien Ourselin, James Howard Cole, Thomas Calvert Booth | 2022 | NeuroImage | vol 249 | pages 118871--118871 | doi 10.1016/j.neuroimage.2022.118871 | OpenAlex W4206370218 | open access https://www.sciencedirect.com/science/article/pii/S1053811922000015/pdf
Semantic Scholar: ratio 1.00: Accurate brain-age models for routine clinical MRI examinations | D. Wood, Sina Kafiabadi, A. Al Busaidi, Emily Guilhem, A. Montvila, J. Lynch, Matthew Townend, Siddharth Agarwal, Asif Mazumder, G. Barker, S. Ourselin, James H. Cole, T. Booth | 2022 | NeuroImage | pages 118871 | doi 10.1016/j.neuroimage.2022.118871 | Semantic Scholar 9499acf1d9a7d40dc96201d501798d8f4fc8c3f6 | open access https://www.sciencedirect.com/science/article/pii/S1053811922000015/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### torres2021end
Command: python3 lookup resolve '10.1200/cci.21.00096'
```
Crossref: ratio 1.00: End-to-End Non<en dash>Small-Cell Lung Cancer Prognostication Using Deep Learning Applied to Pretreatment Computed Tomography | Felipe Soares Torres, Shazia Akbar, Srinivas Raman, Kazuhiro Yasufuku, Carola Schmidt, Ahmed Hosny, Felix Baldauf-Lenschen, Natasha B. Leighl | 2021 | JCO Clinical Cancer Informatics | no 5 | pages 1141--1150 | doi 10.1200/cci.21.00096
OpenAlex: ratio 1.00: End-to-End Non<en dash>Small-Cell Lung Cancer Prognostication Using Deep Learning Applied to Pretreatment Computed Tomography | Felipe Soares Torres, Shazia Akbar, Srinivas Raman, Kazuhiro Yasufuku, Carola Schmidt, Ahmed Hosny, Felix Baldauf-Lenschen, Natasha B. Leighl | 2021 | JCO Clinical Cancer Informatics | vol 5 | no 5 | pages 1141--1150 | doi 10.1200/cci.21.00096 | OpenAlex W3214593633 | open access https://ascopubs.org/doi/pdfdirect/10.1200/CCI.21.00096?role=tab
Semantic Scholar: ratio 1.00: End-to-End Non-Small-Cell Lung Cancer Prognostication Using Deep Learning Applied to Pretreatment Computed Tomography. | F. Torres, Shazia Akbar, S. Raman, K. Yasufuku, Carola Schmidt, A. Hosny, F. Baldauf-Lenschen, N. Leighl | 2021 | JCO Clinical Cancer Informatics | vol 5 | pages 1141--1150 | doi 10.1200/CCI.21.00096 | Semantic Scholar b217f24223116c5b68935efb6ab466d08d8843c8 | open access https://ascopubs.org/doi/pdfdirect/10.1200/CCI.21.00096?role=tab
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### leung2024deep
Command: python3 lookup resolve '10.2967/jnumed.123.267048'
```
Crossref: ratio 1.00: Deep Semisupervised Transfer Learning for Fully Automated Whole-Body Tumor Quantification and Prognosis of Cancer on PET/CT | Kevin H. Leung, Steven P. Rowe, Moe S. Sadaghiani, Jeffrey P. Leal, Esther Mena, Peter L. Choyke, Yong Du, Martin G. Pomper | 2024 | Journal of Nuclear Medicine | vol 65 | no 4 | pages 643--650 | doi 10.2967/jnumed.123.267048
OpenAlex: ratio 1.00: Deep Semisupervised Transfer Learning for Fully Automated Whole-Body Tumor Quantification and Prognosis of Cancer on PET/CT | Kevin Leung, Steven P. Rowe, Moe S. Sadaghiani, Jeffrey P. Leal, Esther Mena, Peter L. Choyke, Yong Du, Martin G. Pomper | 2024 | Journal of Nuclear Medicine | vol 65 | no 4 | pages 643--650 | doi 10.2967/jnumed.123.267048 | OpenAlex W4392283342 | open access https://jnm.snmjournals.org/content/jnumed/65/4/643.full.pdf
Semantic Scholar: ratio 1.00: Deep Semisupervised Transfer Learning for Fully Automated Whole-Body Tumor Quantification and Prognosis of Cancer on PET/CT | K. H. Leung, S. Rowe, M. Sadaghiani, Jeffrey P. Leal, E. Mena, P. Choyke, Yong Du, M. Pomper | 2024 | Journal of Nuclear Medicine | vol 65 | pages 643--650 | doi 10.2967/jnumed.123.267048 | Semantic Scholar 7d6b0812f7a7758fa4581961d9783a6659fca3d5 | open access https://jnm.snmjournals.org/content/jnumed/65/4/643.full.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tran2025comparing
Command: python3 lookup resolve '10.3390/biotech14040087'
```
Crossref: ratio 1.00: Comparing Handcrafted Radiomics Versus Latent Deep Learning Features of Admission Head CT for Hemorrhagic Stroke Outcome Prediction | Anh T. Tran, Junhao Wen, Gaby Abou Karam, Dorin Zeevi, Adnan I. Qureshi, Ajay Malhotra, Shahram Majidi, Niloufar Valizadeh, Santosh B. Murthy, Mert R. Sabuncu, David Roh, Guido J. Falcone, Kevin N. Sheth, Seyedmehdi Payabvash | 2025 | BioTech | vol 14 | no 4 | pages 87 | doi 10.3390/biotech14040087
OpenAlex: ratio 1.00: Comparing Handcrafted Radiomics Versus Latent Deep Learning Features of Admission Head CT for Hemorrhagic Stroke Outcome Prediction | Anh T. Tran, Junhao Wen, Gaby Abou Karam, Dorin Zeevi, Adnan Iqbal Qureshi, Ajay Malhotra, Shahram Majidi, Niloufar Valizadeh, Santosh B. Murthy, Mert Rory Sabuncu, David Jinou Roh, Guido J. Falcone, Kevin N. Sheth, Seyedmehdi Payabvash | 2025 | BioTech | vol 14 | no 4 | pages 87--87 | doi 10.3390/biotech14040087 | OpenAlex W4415823320 | open access https://www.mdpi.com/2673-6284/14/4/87/pdf?version=1762065619
Semantic Scholar: ratio 1.00: Comparing Handcrafted Radiomics Versus Latent Deep Learning Features of Admission Head CT for Hemorrhagic Stroke Outcome Prediction | Anh T. Tran, Jun-Hao Wen, Gaby Abou Karam, Dorin Zeevi, Adnan I. Qureshi, Ajay Malhotra, S. Majidi, N. Valizadeh, Santosh B. Murthy, M. Sabuncu, D. Roh, G. Falcone, K. Sheth, S. Payabvash | 2025 | BioTech | vol 14 | doi 10.3390/biotech14040087 | Semantic Scholar a8d45de6efff914f4f689de902f8fcfbcaf1bb8d | open access https://www.mdpi.com/2673-6284/14/4/87/pdf?version=1762065619
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kazmierski2023multi
Command: python3 lookup resolve '10.1158/2767-9764.crc-22-0152'
```
Crossref: ratio 1.00: Multi-institutional Prognostic Modeling in Head and Neck Cancer: Evaluating Impact and Generalizability of Deep Learning and Radiomics | Michal Kazmierski, Mattea Welch, Sejin Kim, Chris McIntosh, Katrina Rey-McIntyre, Shao Hui Huang, Tirth Patel, Tony Tadic, Michael Milosevic, Fei-Fei Liu, Adam Ryczkowski, Joanna Kazmierska, Zezhong Ye, Deborah Plana, Hugo J.W.L. Aerts, Benjamin H. Kann, Scott V. Bratman, Andrew J. Hope, Benjamin Haibe-Kains | 2023 | Cancer Research Communications | vol 3 | no 6 | pages 1140--1151 | doi 10.1158/2767-9764.crc-22-0152
OpenAlex: ratio 1.00: Multi-institutional Prognostic Modeling in Head and Neck Cancer: Evaluating Impact and Generalizability of Deep Learning and Radiomics | Michal Kazmierski, Mattea L. Welch, Sejin Kim, Chris McIntosh, Katrina Rey<hyphen>McIntyre, Shao Hui Huang, Tirth Patel, Tony Tadic, Michael Milosevic, Fei<hyphen>Fei Liu, Adam Ryczkowski, Joanna Ka<latin small letter z with acute>mierska, Zezhong Ye, Deborah Plana, Hugo J.W.L. Aerts, Benjamin Harris Kann, Scott Victor Bratman, Andrew J. Hope, Benjamin Haibe<hyphen>Kains | 2023 | Cancer Research Communications | vol 3 | no 6 | pages 1140--1151 | doi 10.1158/2767-9764.crc-22-0152 | OpenAlex W4379798163 | open access https://aacrjournals.org/cancerrescommun/article-pdf/doi/10.1158/2767-9764.CRC-22-0152/3339476/crc-22-0152.pdf
Semantic Scholar: ratio 1.00: Multi-institutional Prognostic Modeling in Head and Neck Cancer: Evaluating Impact and Generalizability of Deep Learning and Radiomics | M. Kazmierski, M. Welch, Sejin Kim, C. Mcintosh, K. Rey-McIntyre, Shao H. Huang, T. Patel, T. Tadic, M. Milosevic, Fei Liu, A. Ryczkowski, J. Kazmierska, Ze-Zhong Ye, D. Plana, H. Aerts, B. Kann, S. Bratman, A. Hope, Benjamin Haibe-Kains | 2023 | Cancer Research Communications | vol 3 | pages 1140--1151 | doi 10.1158/2767-9764.CRC-22-0152 | Semantic Scholar 3887ca65b091ea876b192bc465aa6300e661104c | open access https://aacrjournals.org/cancerrescommun/article-pdf/doi/10.1158/2767-9764.CRC-22-0152/3339476/crc-22-0152.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### beetz2023multi
Command: python3 lookup resolve '10.1007/978-3-031-43895-0_50'
```
Crossref: ratio 1.00: Multi-objective Point Cloud Autoencoders for Explainable Myocardial Infarction Prediction | Marcel Beetz, Abhirup Banerjee, Vicente Grau | 2023 | Lecture Notes in Computer Science | pages 532--542 | doi 10.1007/978-3-031-43895-0_50
OpenAlex: ratio 1.00: Multi-objective Point Cloud Autoencoders for Explainable Myocardial Infarction Prediction | Marcel Beetz, Abhirup Banerjee, Vicente Grau | 2023 | Lecture notes in computer science | pages 532--542 | doi 10.1007/978-3-031-43895-0_50 | OpenAlex W4387211052 | open access https://arxiv.org/pdf/2307.11017
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### adams2023point
Command: python3 lookup resolve '10.1007/978-3-031-43907-0_47'
```
Crossref: ratio 1.00: Can Point Cloud Networks Learn Statistical Shape Models of Anatomies? | Jadie Adams, Shireen Y. Elhabian | 2023 | Lecture Notes in Computer Science | pages 486--496 | doi 10.1007/978-3-031-43907-0_47
OpenAlex: ratio 1.00: Can Point Cloud Networks Learn Statistical Shape Models of Anatomies? | Jadie Adams, Shireen Elhabian | 2023 | Lecture notes in computer science | vol 14220 | pages 486--496 | doi 10.1007/978-3-031-43907-0_47 | OpenAlex W4387211200 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC11534086/pdf/nihms-2028754.pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### benveniste2026longitudinal
Command: python3 lookup resolve '2609.09424'
```
Crossref: not found
OpenAlex: ratio 1.00: Longitudinal tracking of multiple sclerosis lesions in the spinal cord: A validation study | Pierre<hyphen>Louis Benveniste, Julian McGinnis, Shannon Kolind, Larry D. Lynd, SA Morrow, Jiwon Oh, Alexandre Prat, Alice J. Schabas, Penelope S. Smyth, Roger Tam, Anthony Traboulsee, Mark M<latin small letter u with diaeresis>hlau, Herv<latin small letter e with acute> Lombaert, Julien Cohen<hyphen>Adad | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2609.09424 | arXiv 2609.09424 | OpenAlex W7212138292 | open access https://arxiv.org/pdf/2609.09424
Semantic Scholar: ratio 1.00: Longitudinal tracking of multiple sclerosis lesions in the spinal cord: A validation study | Pierre-Louis Benveniste, Julian McGinnis, S. Kolind, L. Lynd, S. Morrow, J. Oh, Alexandre Prat, A. Schabas, Penelope Smyth, R. Tam, A. Traboulsee, M. M<latin small letter u with diaeresis>hlau, H. Lombaert, Julien Cohen-Adad | 2026 | arXiv.org | vol abs/2609.09424 | doi 10.48550/arXiv.2609.09424 | arXiv 2609.09424 | Semantic Scholar 65dae8cce1423ebb3c66118133edf2cbeb3eee39
arXiv: ratio 1.00: Longitudinal tracking of multiple sclerosis lesions in the spinal cord: A validation study | Pierre-Louis Benveniste, Julian McGinnis, Shannon Kolind, Larry D. Lynd, Sarah A. Morrow, Jiwon Oh, Alexandre Prat, Alice Schabas, Penelope Smyth, Roger Tam, Anthony Traboulsee, Mark M<latin small letter u with diaeresis>hlau, Herve Lombaert, Julien Cohen-Adad | 2026 | arXiv 2609.09424
```
Exit status: 0

### siless2020registration
Command: python3 lookup resolve '10.1016/j.neuroimage.2020.116703'
```
Crossref: ratio 1.00: Registration-free analysis of diffusion MRI tractography data across subjects through the human lifespan | Viviana Siless, Juliet Y. Davidow, Jared Nielsen, Qiuyun Fan, Trey Hedden, Marisa Hollinshead, Elizabeth Beam, Constanza M. Vidal Bustamante, Megan C. Garrad, Rosario Santillana, Emily E. Smith, Aya Hamadeh, Jenna Snyder, Michelle K. Drews, Koene R.A. Van Dijk, Margaret Sheridan, Leah H. Somerville, Anastasia Yendiki | 2020 | NeuroImage | vol 214 | pages 116703 | doi 10.1016/j.neuroimage.2020.116703
OpenAlex: ratio 1.00: Registration-free analysis of diffusion MRI tractography data across subjects through the human lifespan | Viviana Siless, Juliet Y. Davidow, Jared Allen Nielsen, Qiuyun Fan, Trey Hedden, Marisa O. Hollinshead, Elizabeth Beam, Constanza M. Vidal Bustamante, Megan C. Garrad, Rosario M. Santillana, Emily E. Smith, Aya Hamadeh, Jenna Snyder, Michelle K. Drews, Koene R. A. Van Dijk, Margaret A. Sheridan, Leah H. Somerville, Anastasia Yendiki | 2020 | NeuroImage | vol 214 | pages 116703--116703 | doi 10.1016/j.neuroimage.2020.116703 | OpenAlex W3009225680 | open access https://www.sciencedirect.com/science/article/pii/S1053811920301907/pdf
Semantic Scholar: ratio 1.00: Registration-free analysis of diffusion MRI tractography data across subjects through the human lifespan | V. Siless, Juliet Y. Davidow, J. Nielsen, Q. Fan, T. Hedden, Marisa O. Hollinshead, Elizabeth Beam, Constanza M. Vidal Bustamante, Megan C. Garrad, Rosario M. Santillana, E. E. Smith, Aya Hamadeh, Jenna Snyder, Michelle K. Drews, K. V. van Dijk, M. Sheridan, L. Somerville, A. Yendiki | 2020 | NeuroImage | vol 214 | pages 116703--116703 | doi 10.1016/j.neuroimage.2020.116703 | Semantic Scholar 8a23cf1f9ce755790b974779d3eee5e02eb4ea47 | open access https://www.sciencedirect.com/science/article/pii/S1053811920301907/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ren2026otsurv
Command: python3 lookup resolve '10.1007/978-3-032-05182-0_43'
```
Crossref: ratio 1.00: OTSurv: A Novel Multiple Instance Learning Framework for Survival Prediction with Heterogeneity-Aware Optimal Transport | Qin Ren, Yifan Wang, Ruogu Fang, Haibin Ling, Chenyu You | 2025 | Lecture Notes in Computer Science | pages 439--449 | doi 10.1007/978-3-032-05182-0_43
OpenAlex: ratio 1.00: OTSurv: A Novel Multiple Instance Learning Framework for Survival Prediction with Heterogeneity-Aware Optimal Transport | Qin Ren, Yifan Wang, Ruogu Fang, Haibin Ling, Chenyu You | 2025 | Lecture notes in computer science | pages 439--449 | doi 10.1007/978-3-032-05182-0_43 | OpenAlex W4414316006 | open access https://arxiv.org/pdf/2506.20741
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### shifaterabbi2025linear
Command: python3 lookup resolve '10.1007/s10851-025-01261-x'
```
Crossref: ratio 1.00: Linear Optimal Transport Subspaces for Point Set Classification | Mohammad Shifat-E-Rabbi, Naqib Sad Pathan, Shiying Li, Yan Zhuang, Abu Hasnat Mohammad Rubaiyat, Gustavo K. Rohde | 2025 | Journal of Mathematical Imaging and Vision | vol 67 | no 4 | doi 10.1007/s10851-025-01261-x
OpenAlex: ratio 1.00: Linear Optimal Transport Subspaces for Point Set Classification | Mohammad Shifat<hyphen>E<hyphen>Rabbi, Naqib Sad Pathan, Shiying Li, Yan Zhuang, Abu Hasnat Mohammad Rubaiyat, Gustavo Kunde Rohde | 2025 | Journal of Mathematical Imaging and Vision | vol 67 | no 4 | doi 10.1007/s10851-025-01261-x | OpenAlex W4412438080 | open access https://www.researchsquare.com/article/rs-4106387/latest.pdf
Semantic Scholar: ratio 1.00: Linear Optimal Transport Subspaces for Point Set Classification | Mohammad Shifat-E.-Rabbi, Naqib Sad Pathan, Shi-Ying Li, Yan Zhuang, A. Rubaiyat, G. Rohde | 2025 | Journal of Mathematical Imaging and Vision | vol 67 | doi 10.1007/s10851-025-01261-x | Semantic Scholar 86d841a3ee340dcea113d278c1dfbbfbbe8c4ce9 | open access https://www.researchsquare.com/article/rs-4106387/latest.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xu2023regularized
Command: python3 lookup resolve '10.1109/tpami.2023.3314661'
```
Crossref: ratio 1.00: Regularized Optimal Transport Layers for Generalized Global Pooling Operations | Hongteng Xu, Minjie Cheng | 2023 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 45 | no 12 | pages 15426--15444 | doi 10.1109/tpami.2023.3314661
OpenAlex: ratio 1.00: Regularized Optimal Transport Layers for Generalized Global Pooling Operations | Hongteng Xu, Minjie Cheng | 2023 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 45 | no 12 | pages 15426--15444 | doi 10.1109/tpami.2023.3314661 | OpenAlex W4386634627 | open access https://ieeexplore.ieee.org/ielx7/34/4359286/10247589.pdf
Semantic Scholar: ratio 1.00: Regularized Optimal Transport Layers for Generalized Global Pooling Operations | Hongteng Xu, Min-Jie Cheng | 2022 | IEEE Transactions on Pattern Analysis and Machine Intelligence | vol 45 | pages 15426--15444 | doi 10.1109/TPAMI.2023.3314661 | arXiv 2212.06339 | Semantic Scholar 0f422f1904f3e1b3e966bd61b3a27334a540f91d | open access https://ieeexplore.ieee.org/ielx7/34/4359286/10247589.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tosun2015detection
Command: python3 lookup resolve '10.1002/cyto.a.22602'
```
Crossref: ratio 1.00: Detection of malignant mesothelioma using nuclear structure of mesothelial cells in effusion cytology specimens | Akif Burak Tosun, Oleksandr Yergiyev, Soheil Kolouri, Jan F. Silverman, Gustavo K. Rohde | 2015 | Cytometry Part A | vol 87 | no 4 | pages 326--333 | doi 10.1002/cyto.a.22602
OpenAlex: ratio 1.00: Detection of malignant mesothelioma using nuclear structure of mesothelial cells in effusion cytology specimens | Akif Burak Tosun, Oleksandr Yergiyev, Soheil Kolouri, Jan F. Silverman, Gustavo Kunde Rohde | 2015 | Cytometry Part A | vol 87 | no 4 | pages 326--333 | doi 10.1002/cyto.a.22602 | OpenAlex W2096720629 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC4683592/
Semantic Scholar: ratio 1.00: Detection of Malignant Mesothelioma Using Nuclear Structure of Mesothelial Cells in Effusion Cytology Specimens | A. B. Tosun, Oleksandr Yergiyev, Soheil Kolouri, J. Silverman, G. Rohde | 2015 | Cytometry Part A | vol 87 | pages 326--333 | doi 10.1002/cyto.a.22602 | Semantic Scholar 58e5c5e4e333552e58bf88a1a38be2c1c3919099 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC4683592/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### hanna2017predictive
Command: python3 lookup resolve '10.4103/jpi.jpi_84_16'
```
Crossref: ratio 1.00: Predictive Nuclear Chromatin Characteristics of Melanoma and Dysplastic Nevi | Matthew G. Hanna, Chi Liu, Gustavo K. Rohde, Rajendra Singh | 2017 | Journal of Pathology Informatics | vol 8 | no 1 | pages 15 | doi 10.4103/jpi.jpi_84_16
OpenAlex: ratio 1.00: Predictive Nuclear Chromatin Characteristics of Melanoma and Dysplastic Nevi | Matthew G. Hanna, Chi Liu, Gustavo Kunde Rohde, Rajendra Singh | 2017 | Journal of Pathology Informatics | vol 8 | no 1 | pages 15--15 | doi 10.4103/jpi.jpi_84_16 | OpenAlex W2606888570 | open access https://www.sciencedirect.com/science/article/pii/S2153353922004199/pdf
Semantic Scholar: ratio 1.00: Predictive Nuclear Chromatin Characteristics of Melanoma and Dysplastic Nevi | M. Hanna, Chi Liu, G. Rohde, Rajendra Singh | 2017 | Journal of Pathology Informatics | vol 8 | doi 10.4103/jpi.jpi_84_16 | Semantic Scholar c3d9592ff6faf88c04612f4e3c06a954ff492f06 | open access https://www.sciencedirect.com/science/article/pii/S2153353922004199/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### engelson2026deep
Command: python3 lookup resolve '10.1117/1.jmi.13.1.014507'
```
Crossref: ratio 1.00: Deep learning-based mediastinal lymph node assessment on PET/CT images without pixel-level annotations | Sofija Engelson, Yannic Elser, Malte Maria Sieren, Jan Ehrhardt, Julia Andresen, Stefanie Schierholz, Tobias Keck, Daniel Dr<latin small letter o with diaeresis>mann, J<latin small letter o with diaeresis>rg Barkhausen, Heinz Handels | 2026 | Journal of Medical Imaging | vol 13 | no 01 | pages 1--18 | doi 10.1117/1.jmi.13.1.014507
OpenAlex: ratio 1.00: Deep learning-based mediastinal lymph node assessment on PET/CT images without pixel-level annotations | Sofija Engelson, Yannic Elser, Malte Maria Sieren, Jan Ehrhardt, Julia Andresen, Stefanie Schierholz, Tobias Keck, Daniel Dr<latin small letter o with diaeresis>mann, J<latin small letter o with diaeresis>rg Barkhausen, Heinz Handels | 2026 | Journal of medical imaging | vol 13 | no 01 | pages 1--18 | doi 10.1117/1.jmi.13.1.014507 | OpenAlex W7130380527 | open access https://doi.org/10.1117/1.jmi.13.1.014507
Semantic Scholar: ratio 1.00: Deep learning-based mediastinal lymph node assessment on PET/CT images without pixel-level annotations | S. Engelson, Y. Elser, M. Sieren, J. Ehrhardt, J. Andresen, S. Schierholz, T. Keck, D. Dr<latin small letter o with diaeresis>mann, J. Barkhausen, H. Handels | 2026 | Journal of Medical Imaging | vol 13 | pages 014507--014507 | doi 10.1117/1.JMI.13.1.014507 | Semantic Scholar c667bb24a735e34dc2e8952996445dd3767ff10e | open access https://doi.org/10.1117/1.jmi.13.1.014507
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### pandilova2026multi
Command: python3 lookup resolve '10.3390/diagnostics16213632'
```
Crossref: ratio 1.00: Multi-Reference Evaluation of Deep Learning Tumour Segmentation in Multi-Sequence Nasopharyngeal Carcinoma MRI | Ema Pandilova, Marko Petrov, Ivan Chorbev, Ivan Kitanovski, Aleksandar Stojmenski, Dimitar Trajanov | 2026 | Diagnostics | vol 16 | no 21 | pages 3632 | doi 10.3390/diagnostics16213632
OpenAlex: ratio 1.00: Multi-Reference Evaluation of Deep Learning Tumour Segmentation in Multi-Sequence Nasopharyngeal Carcinoma MRI | Ema Pandilova, Marko Petrov, Ivan Chorbev, Ivan Kitanovski, Aleksandar Stojmenski, Dimitar Trajanov | 2026 | Diagnostics | vol 16 | no 21 | pages 3632--3632 | doi 10.3390/diagnostics16213632 | OpenAlex W7225199136 | open access https://doi.org/10.3390/diagnostics16213632
Semantic Scholar: ratio 1.00: Multi-Reference Evaluation of Deep Learning Tumour Segmentation in Multi-Sequence Nasopharyngeal Carcinoma MRI | Ema Pandilova, M. Petrov, Ivan Chorbev, Ivan Kitanovski, A. Stojmenski, D. Trajanov | 2026 | Diagnostics | vol 16 | doi 10.3390/diagnostics16213632 | Semantic Scholar 11865414de0237cc576d028cba31c081470eea1f | open access https://doi.org/10.3390/diagnostics16213632
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### fujibayashi2021nonlinear
Command: python3 lookup resolve '10.1109/embc46164.2021.9631044'
```
Crossref: ratio 1.00: Nonlinear registration as an effective preprocessing technique for Deep learning based classification of disease | Daiki Fujibayashi, Hiromasa Sakaguchi, Ilya Ardakani, Akihiro Okuno | 2021 | 2021 43rd Annual International Conference of the IEEE Engineering in Medicine &amp; Biology Society (EMBC) | pages 3245--3250 | doi 10.1109/embc46164.2021.9631044
OpenAlex: ratio 1.00: Nonlinear registration as an effective preprocessing technique for Deep learning based classification of disease | Daiki Fujibayashi, Hiromasa Sakaguchi, Ilya Ardakani, Akihiro Okuno | 2021 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC) | vol 2021 | pages 3245--3250 | doi 10.1109/embc46164.2021.9631044 | OpenAlex W4200157821 | open access https://ieeexplore.ieee.org/ielx7/9629355/9629471/09631044.pdf
Semantic Scholar: ratio 1.00: Nonlinear registration as an effective preprocessing technique for Deep learning based classification of disease | Daiki Fujibayashi, Hiromasa Sakaguchi, Ilya Ardakani, Akihiro Okuno | 2021 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society | pages 3245--3250 | doi 10.1109/EMBC46164.2021.9631044 | Semantic Scholar 0a41eb10eb27b59600a66ac88cabfa34a918fd17 | open access https://ieeexplore.ieee.org/ielx7/9629355/9629471/09631044.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### perezngonzalez2019automatic
Command: python3 lookup resolve '10.1109/embc.2019.8856372'
```
Crossref: ratio 1.00: Automatic Classification of Alzheimer<right single quotation mark>s Disease based on CPD Brain Point Cloud Registration for Feature Extraction | Jorge PereznGonzalez, Cristian Azamar, Omar PinanRamirez | 2019 | 2019 41st Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC) | pages 812--815 | doi 10.1109/embc.2019.8856372
OpenAlex: ratio 1.00: Automatic Classification of Alzheimer<right single quotation mark>s Disease based on CPD Brain Point Cloud Registration for Feature Extraction | Jorge P<latin small letter e with acute>rez-Gonz<latin small letter a with acute>lez, Cristian Azamar, Omar PinanRamirez | 2019 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC) | vol 2019 | pages 812--815 | doi 10.1109/embc.2019.8856372 | OpenAlex W2979415761
Semantic Scholar: ratio 1.00: Automatic Classification of Alzheimer<right single quotation mark>s Disease based on CPD Brain Point Cloud Registration for Feature Extraction | J. Perez-Gonzalez, Cristian Azamar, O. Pi<latin small letter n with tilde>a-Ram<latin small letter i with acute>rez | 2019 | Annual International Conference of the IEEE Engineering in Medicine and Biology Society | pages 812--815 | doi 10.1109/EMBC.2019.8856372 | Semantic Scholar f11596f06d2e76e70b20e8adeb81a21c69127349
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tu2020computing
Command: python3 lookup resolve '10.1007/s12021-020-09459-7'
```
Crossref: ratio 1.00: Computing Univariate Neurodegenerative Biomarkers with Volumetric Optimal Transportation: A Pilot Study | The Alzheimer<right single quotation mark>s Disease Neuroimaging Initiative, Yanshuai Tu, Liang Mi, Wen Zhang, Haomeng Zhang, Junwei Zhang, Yonghui Fan, Dhruman Goradia, Kewei Chen, Richard J. Caselli, Eric M. Reiman, Xianfeng Gu, Yalin Wang | 2020 | Neuroinformatics | vol 18 | no 4 | pages 531--548 | doi 10.1007/s12021-020-09459-7
OpenAlex: ratio 1.00: Computing Univariate Neurodegenerative Biomarkers with Volumetric Optimal Transportation: A Pilot Study | The Alzheimer<right single quotation mark>s Disease Neuroimaging Initiative, Yanshuai Tu, Liang Mi, Wen Zhang, Haomeng Zhang, Junwei Zhang, Yonghui Fan, Dhruman D. Goradia, Kewei Chen, Richard J. Caselli, Eric M. Reiman, Xianfeng David Gu, Yalin Wang | 2020 | Neuroinformatics | vol 18 | no 4 | pages 531--548 | doi 10.1007/s12021-020-09459-7 | OpenAlex W3014941342 | open access http://europepmc.org/pmc/articles/PMC7502473
Semantic Scholar: ratio 1.00: COMPUTING UNIVARIATE NEURODEGENERATIVE BIOMARKERS WITH VOLUMETRIC OPTIMAL TRANSPORTATION: A PILOT STUDY | Yanshuai Tu, Liang Mi, Wen Zhang, Haomeng Zhang, Junwei Zhang, Yonghui Fan, Dhruman D. Goradia, K. Chen, R. Caselli, E. Reiman, X. Gu, Y. Wang | 2020 | Neuroinformatics | vol 18 | pages 531--548 | doi 10.1007/s12021-020-09459-7 | Semantic Scholar ba70451d5b3a69045be33016323831945eb45658 | open access http://europepmc.org/pmc/articles/PMC7502473
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### xiong2026integrating
Command: python3 lookup resolve '10.1007/s00415-026-13664-w'
```
Crossref: ratio 1.00: Integrating standard and native spaces for radiomics and brain network analysis in Alzheimer<right single quotation mark>s disease diagnosis and prognosis | Diaohan Xiong, Mengjiao Liu, Zefeng Liu, Junping Wang | 2026 | Journal of Neurology | vol 273 | no 2 | doi 10.1007/s00415-026-13664-w
OpenAlex: ratio 1.00: Integrating standard and native spaces for radiomics and brain network analysis in Alzheimer<right single quotation mark>s disease diagnosis and prognosis | Diaohan Xiong, Ming Liu, Zefeng Liu, Junping Wang | 2026 | Journal of Neurology | vol 273 | no 2 | pages 124--124 | doi 10.1007/s00415-026-13664-w | OpenAlex W7128396807
Semantic Scholar: ratio 1.00: Integrating standard and native spaces for radiomics and brain network analysis in Alzheimer<right single quotation mark>s disease diagnosis and prognosis | Diao-Han Xiong, Mengjia Liu, Ze-Feng Liu, Junping Wang | 2026 | Journal of Neurology | vol 273 | doi 10.1007/s00415-026-13664-w | Semantic Scholar 32f15ef221082a033f2bee46c74f029d1c43bce2
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### feragen2013geometric
Command: python3 lookup resolve '10.1007/978-3-642-38868-2_15'
```
Crossref: ratio 1.00: Geometric Tree Kernels: Classification of COPD from Airway Tree Geometry | Aasa Feragen, Jens Petersen, Dominik Grimm, Asger Dirksen, Jesper Holst Pedersen, Karsten Borgwardt, Marleen de Bruijne | 2013 | Lecture Notes in Computer Science | pages 171--183 | doi 10.1007/978-3-642-38868-2_15
OpenAlex: ratio 1.00: Geometric Tree Kernels: Classification of COPD from Airway Tree Geometry | Aasa Feragen, Jens Petersen, Dominik G. Grimm, Asger Dirksen, Jesper Holst Pedersen, Karsten Michael Borgwardt, Marleen de Bruijne | 2013 | Lecture notes in computer science | vol 23 | pages 171--183 | doi 10.1007/978-3-642-38868-2_15 | OpenAlex W2135074746 | open access https://researchprofiles.ku.dk/da/publications/87bcaaa1-4dc8-4079-8a7e-2b057507b632
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### awate2017kernel
Command: python3 lookup resolve '10.1007/978-3-319-59050-9_3'
```
Crossref: ratio 1.00: Kernel Methods for Riemannian Analysis of Robust Descriptors of the Cerebral Cortex | Suyash P. Awate, Richard M. Leahy, Anand A. Joshi | 2017 | Lecture Notes in Computer Science | pages 28--40 | doi 10.1007/978-3-319-59050-9_3
OpenAlex: ratio 1.00: Kernel Methods for Riemannian Analysis of Robust Descriptors of the Cerebral Cortex | Suyash P. Awate, Richard M. Leahy, Anand A. Joshi | 2017 | Lecture notes in computer science | vol 10265 | pages 28--40 | doi 10.1007/978-3-319-59050-9_3 | OpenAlex W2619477447 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC5794037/
Semantic Scholar: ratio 1.00: Kernel Methods for Riemannian Analysis of Robust Descriptors of the Cerebral Cortex | Suyash P. Awate, R. Leahy, Anand A. Joshi | 2017 | Information Processing in Medical Imaging | vol 10265 | pages 28--40 | doi 10.1007/978-3-319-59050-9_3 | Semantic Scholar 0d5730b6171843c526f3065a8265d86f469c3665 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC5794037/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### devilliers2017inconsistency
Command: python3 lookup resolve '10.1007/978-3-319-59050-9_2'
```
Crossref: ratio 1.00: Inconsistency of Template Estimation with the Fr<latin small letter e with acute>chet Mean in Quotient Space | Lo<latin small letter i with diaeresis>c Devilliers, Xavier Pennec, St<latin small letter e with acute>phanie Allassonni<latin small letter e with grave>re | 2017 | Lecture Notes in Computer Science | pages 16--27 | doi 10.1007/978-3-319-59050-9_2
OpenAlex: ratio 1.00: Inconsistency of Template Estimation with the Fr<latin small letter e with acute>chet Mean in Quotient Space | Lo<latin small letter i with diaeresis>c Devilliers, Xavier Pennec, St<latin small letter e with acute>phanie Allassonni<latin small letter e with grave>re | 2017 | Lecture notes in computer science | vol 10265 | pages 16--27 | doi 10.1007/978-3-319-59050-9_2 | OpenAlex W2592069770 | open access https://arxiv.org/pdf/1703.01232
Semantic Scholar: ratio 1.00: Inconsistency of Template Estimation with the Fr<latin small letter e with acute>chet Mean in Quotient Space | L. Devilliers, X. Pennec, S. Allassonni<latin small letter e with grave>re | 2017 | Information Processing in Medical Imaging | pages 16--27 | doi 10.1007/978-3-319-59050-9_2 | arXiv 1703.01232 | Semantic Scholar c61ca0ded806097c152f5e2694d46591e86dd395 | open access https://arxiv.org/pdf/1703.01232
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhang2021cortical
Command: python3 lookup resolve '10.1007/978-3-030-78191-0_13'
```
Crossref: ratio 1.00: Cortical Morphometry Analysis Based on Worst Transportation Theory | Min Zhang, Dongsheng An, Na Lei, Jianfeng Wu, Tong Zhao, Xiaoyin Xu, Yalin Wang, Xianfeng Gu | 2021 | Lecture Notes in Computer Science | pages 163--176 | doi 10.1007/978-3-030-78191-0_13
OpenAlex: ratio 1.00: Cortical Morphometry Analysis Based on Worst Transportation Theory | Min Zhang, Dongsheng An, Na Lei, Jianfeng Wu, <cyrillic capital letter te><cyrillic small letter o><cyrillic small letter en><cyrillic small letter ghe> <cyrillic capital letter zhe><cyrillic small letter a><cyrillic small letter o>, Xiaoyin Xu, Yalin Wang, Xianfeng David Gu | 2021 | Lecture notes in computer science | vol 12729 | pages 163--176 | doi 10.1007/978-3-030-78191-0_13 | OpenAlex W3176309875 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC8291742/
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### farazi2023tetcnn
Command: python3 lookup resolve '10.1007/978-3-031-34048-2_24'
```
Crossref: ratio 1.00: TetCNN: Convolutional Neural Networks on Tetrahedral Meshes | Mohammad Farazi, Zhangsihao Yang, Wenhui Zhu, Peijie Qiu, Yalin Wang | 2023 | Lecture Notes in Computer Science | pages 303--315 | doi 10.1007/978-3-031-34048-2_24
OpenAlex: ratio 1.00: TetCNN: Convolutional Neural Networks on Tetrahedral Meshes | Mohammad Farazi, Zhangsihao Yang, Wenhui Zhu, Peijie Qiu, Yalin Wang | 2023 | Lecture notes in computer science | vol 13939 | pages 303--315 | doi 10.1007/978-3-031-34048-2_24 | OpenAlex W4379660269 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC10765307/pdf/nihms-1954948.pdf
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2026enhancing
Command: python3 lookup resolve '10.1007/978-3-031-96625-5_5'
```
Crossref: ratio 1.00: Enhancing Alzheimer<right single quotation mark>s Diagnosis: Leveraging Anatomical Landmarks in Graph Convolutional Neural Networks on Tetrahedral Meshes | Yanxi Chen, Mohammad Farazi, Zhangsihao Yang, Yonghui Fan, Nicholas Ashton, Eric M. Reiman, Yi Su, Yalin Wang | 2025 | Lecture Notes in Computer Science | pages 65--78 | doi 10.1007/978-3-031-96625-5_5
OpenAlex: ratio 1.00: Enhancing Alzheimer<right single quotation mark>s Diagnosis: Leveraging Anatomical Landmarks in Graph Convolutional Neural Networks on Tetrahedral Meshes | Yanxi Chen, Mohammad Farazi, Zhangsihao Yang, Yonghui Fan, Nicholas James Ashton, Eric M. Reiman, Yi Su, Yalin Wang | 2025 | Lecture notes in computer science | vol 15830 | pages 65--78 | doi 10.1007/978-3-031-96625-5_5 | OpenAlex W4413003260 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC12965764/
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wang2018revisiting
Command: python3 lookup resolve '10.1016/j.patcog.2017.08.026'
```
Crossref: ratio 1.00: Revisiting multiple instance neural networks | Xinggang Wang, Yongluan Yan, Peng Tang, Xiang Bai, Wenyu Liu | 2018 | Pattern Recognition | vol 74 | pages 15--24 | doi 10.1016/j.patcog.2017.08.026
OpenAlex: ratio 1.00: Revisiting multiple instance neural networks | Xinggang Wang, Yongluan Yan, Peng Tang, Xiang Bai, Wenyu Liu | 2017 | Pattern Recognition | vol 74 | pages 15--24 | doi 10.1016/j.patcog.2017.08.026 | OpenAlex W2531897166 | open access https://arxiv.org/pdf/1610.02501
Semantic Scholar: ratio 1.00: Revisiting multiple instance neural networks | Xing-Gang Wang, Yongluan Yan, Peng Tang, Xiang Bai, Wen-Yu Liu | 2016 | Pattern Recognition | vol abs/1610.02501 | doi 10.1016/j.patcog.2017.08.026 | arXiv 1610.02501 | Semantic Scholar 0820ccfdba775c304bedb9c3d82ee8758e0a416b | open access https://arxiv.org/pdf/1610.02501
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### basu2014detecting
Command: python3 lookup resolve '10.1073/pnas.1319779111'
```
Crossref: ratio 1.00: Detecting and visualizing cell phenotype differences from microscopy images using transport-based morphometry | Saurav Basu, Soheil Kolouri, Gustavo K. Rohde | 2014 | Proceedings of the National Academy of Sciences | vol 111 | no 9 | pages 3448--3453 | doi 10.1073/pnas.1319779111
OpenAlex: ratio 1.00: Detecting and visualizing cell phenotype differences from microscopy images using transport-based morphometry | Saurav Basu, Soheil Kolouri, Gustavo Kunde Rohde | 2014 | Proceedings of the National Academy of Sciences | vol 111 | no 9 | pages 3448--3453 | doi 10.1073/pnas.1319779111 | OpenAlex W2114589114 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/3948221
Semantic Scholar: ratio 1.00: Detecting and visualizing cell phenotype differences from microscopy images using transport-based morphometry | Saurav Basu, Soheil Kolouri, G. Rohde | 2014 | Proceedings of the National Academy of Sciences of the United States of America | vol 111 | pages 3448--3453 | doi 10.1073/pnas.1319779111 | Semantic Scholar e420c2863ad46f7ce5923955957cad13439401a8 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/3948221
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kusner2015word
No DOI and no arXiv ID; url: https://proceedings.mlr.press/v37/kusnerb15.html. Checked by WebFetch of the url (recorded below by the session).

### muandet2012learning
Command: python3 lookup resolve '1202.6504'
```
Crossref: not found
OpenAlex: ratio 1.00: Learning from Distributions via Support Measure Machines | Krikamol Muandet, Kenji Fukumizu, Francesco Dinuzzo, Bernhard Sch<latin small letter o with diaeresis>lkopf | 2012 | arXiv (Cornell University) | vol 25 | pages 10--18 | doi 10.48550/arxiv.1202.6504 | arXiv 1202.6504 | OpenAlex W2136440798 | open access https://arxiv.org/pdf/1202.6504
Semantic Scholar: ratio 1.00: Learning from Distributions via Support Measure Machines | Krikamol Muandet, K. Fukumizu, Francesco Dinuzzo, B. Sch<latin small letter o with diaeresis>lkopf | 2012 | Neural Information Processing Systems | pages 10--18 | doi 10.48550/arXiv.1202.6504 | arXiv 1202.6504 | Semantic Scholar 9239696d0dc5b029e0946e4b84a1515cb31d2e6b | open access http://arxiv.org/pdf/1202.6504
arXiv: ratio 1.00: Learning from Distributions via Support Measure Machines | Krikamol Muandet, Kenji Fukumizu, Francesco Dinuzzo, Bernhard Sch<latin small letter o with diaeresis>lkopf | 2012 | arXiv 1202.6504
```
Exit status: 0

### welch2019vulnerabilities
Command: python3 lookup resolve '10.1016/j.radonc.2018.10.027'
```
Crossref: ratio 1.00: Vulnerabilities of radiomic signature development: The need for safeguards | Mattea L. Welch, Chris McIntosh, Benjamin Haibe-Kains, Michael F. Milosevic, Leonard Wee, Andre Dekker, Shao Hui Huang, Thomas G. Purdie, Brian O'Sullivan, Hugo J.W.L. Aerts, David A. Jaffray | 2019 | Radiotherapy and Oncology | vol 130 | pages 2--9 | doi 10.1016/j.radonc.2018.10.027
OpenAlex: ratio 1.00: Vulnerabilities of radiomic signature development: The need for safeguards | Mattea L. Welch, Chris McIntosh, Benjamin Haibe<hyphen>Kains, Michael Milosevic, Leonard Wee, Andre L.A.J. Dekker, Shao Hui Huang, Thomas G. Purdie, Brian O<right single quotation mark>Sullivan, Hugo J.W.L. Aerts, David Anthony Jaffray | 2018 | Radiotherapy and Oncology | vol 130 | pages 2--9 | doi 10.1016/j.radonc.2018.10.027 | OpenAlex W2899847761 | open access https://doi.org/10.1016/j.radonc.2018.10.027
Semantic Scholar: ratio 1.00: Vulnerabilities of radiomic signature development: The need for safeguards. | M. Welch, C. Mcintosh, Benjamin Haibe-Kains, M. Milosevic, L. Wee, A. Dekker, Shao H. Huang, T. Purdie, B. O'Sullivan, H. Aerts, D. Jaffray | 2019 | Radiotherapy and Oncology | vol 130 | pages 2--9 | doi 10.1016/j.radonc.2018.10.027 | Semantic Scholar 3f7af0209e67980368294397b65358ae355b99bd | open access https://doi.org/10.1016/j.radonc.2018.10.027
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### rohlfing2012image
Command: python3 lookup resolve '10.1109/tmi.2011.2163944'
```
Crossref: ratio 1.00: Image Similarity and Tissue Overlaps as Surrogates for Image Registration Accuracy: Widely Used but Unreliable | T. Rohlfing | 2012 | IEEE Transactions on Medical Imaging | vol 31 | no 2 | pages 153--163 | doi 10.1109/tmi.2011.2163944
OpenAlex: ratio 1.00: Image Similarity and Tissue Overlaps as Surrogates for Image Registration Accuracy: Widely Used but Unreliable | Torsten Rohlfing | 2011 | IEEE Transactions on Medical Imaging | vol 31 | no 2 | pages 153--163 | doi 10.1109/tmi.2011.2163944 | OpenAlex W2054902886 | open access http://europepmc.org/articles/PMC3274625
Semantic Scholar: ratio 1.00: Image Similarity and Tissue Overlaps as Surrogates for Image Registration Accuracy: Widely Used but Unreliable | T. Rohlfing | 2011 | IEEE Transactions on Medical Imaging | vol 31 | pages 153--163 | doi 10.1109/TMI.2011.2163944 | Semantic Scholar 9e503d524a8eaa0d60e698ee0f974a6dac8fbe4a | open access http://europepmc.org/articles/PMC3274625
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhang2020fspool
Command: python3 lookup resolve '1906.02795'
```
Crossref: not found
OpenAlex: ratio 1.00: FSPool: Learning Set Representations with Featurewise Sort Pooling | Yan Zhang, Jonathon S. Hare, Adam Pr<latin small letter u with diaeresis>gel<hyphen>Bennett | 2019 | arXiv (Cornell University) | doi 10.48550/arxiv.1906.02795 | arXiv 1906.02795 | OpenAlex W2994687091 | open access https://arxiv.org/pdf/1906.02795
Semantic Scholar: ratio 1.00: FSPool: Learning Set Representations with Featurewise Sort Pooling | Yan Zhang, Jonathon S. Hare, A. Pr<latin small letter u with diaeresis>gel-Bennett | 2019 | International Conference on Learning Representations | vol abs/1906.02795 | doi 10.48550/arXiv.1906.02795 | arXiv 1906.02795 | Semantic Scholar 07d01345dd30f1400e41d5124ff74e2b0d655040
arXiv: ratio 1.00: FSPool: Learning Set Representations with Featurewise Sort Pooling | Yan Zhang, Jonathon Hare, Adam Pr<latin small letter u with diaeresis>gel-Bennett | 2019 | arXiv 1906.02795
```
Exit status: 0

### suinesiaputra2018statistical
Command: python3 lookup resolve '10.1109/jbhi.2017.2652449'
```
Crossref: ratio 1.00: Statistical Shape Modeling of the Left Ventricle: Myocardial Infarct Classification Challenge | Avan Suinesiaputra, Jan Dhooge, Nicolas Duchateau, Jan Ehrhardt, Alejandro F. Frangi, Ali Gooya, Vicente Grau, Karim Lekadir, Allen Lu, Anirban Mukhopadhyay, Ilkay Oksuz, Pierre Ablin, Nripesh Parajuli, Xavier Pennec, Marco Pereanez, Catarina Pinto, Paolo Piras, Marc-Michel Rohe, Daniel Rueckert, Dennis Saring, Maxime Sermesant, Kaleem Siddiqi, Xenia Alba, Mahdi Tabassian, Luciano Teresi, Sotirios A. Tsaftaris, Matthias Wilms, Alistair A. Young, Xingyu Zhang, Pau Medrano-Gracia, Martino Alessandrini, Jack Allen, Wenjia Bai, Serkan Cimen, Peter Claes, Brett R. Cowan | 2018 | IEEE Journal of Biomedical and Health Informatics | vol 22 | no 2 | pages 503--515 | doi 10.1109/jbhi.2017.2652449
OpenAlex: ratio 1.00: Statistical Shape Modeling of the Left Ventricle: Myocardial Infarct Classification Challenge | Avan Suinesiaputra, Jan D<right single quotation mark>hooge, Nicol<latin small letter a with acute>s Duchateau, Jan Ehrhardt, Alejandro Federico Frangi, Ali Gooya, Vicente Grau, Karim Lekadir, Allen Lu, Anirban Mukhopadhyay, <latin capital letter i with dot above>lkay <latin capital letter o with diaeresis>ks<latin small letter u with diaeresis>z, Pierre Ablin, Nripesh Parajuli, Xavier Pennec, Marco Perea<latin small letter n with tilde>ez, Catarina Pinto, Paolo Piras, Marc-Michel Roh<latin small letter e with acute>, Daniel Rueckert, Dennis S<latin small letter a with diaeresis>ring, Maxime Sermesant, Kaleem Siddiqi, X<latin small letter e with grave>nia Alb<latin small letter a with grave>, Mahdi Tabassian, Luciano Teresi, Sotirios A. Tsaftaris, Matthias Wilms, Alistair A. Young, Xing-Yu Zhang, Pau Medrano<minus sign>Gracia, Martino Alessandrini, Jack Allen, Wenjia Bai, Serkan <latin capital letter c with cedilla>imen, Peter D. Claes, Brett R. Cowan | 2017 | IEEE Journal of Biomedical and Health Informatics | vol 22 | no 2 | pages 503--515 | doi 10.1109/jbhi.2017.2652449 | OpenAlex W2575820504 | open access https://hdl.handle.net/20.500.11820/bd4a7509-a028-408a-bb0f-b3adc7d089c5
Semantic Scholar: ratio 1.00: Statistical shape modeling of the left ventricle: myocardial infarct classification challenge | Avan Suinesiaputra, Pierre Ablin, X<latin small letter e with grave>nia Alb<latin small letter a with grave>, M. Alessandrini, Jack Allen, Wenjia Bai, Serkan <latin capital letter c with cedilla>imen, P. Claes, B. Cowan, J. Dhooge, N. Duchateau, J. Ehrhardt, Alejandro F Frangi, A. Gooya, V. Grau, K. Lekadir, A. Lu, A. Mukhopadhyay, I. <latin capital letter o with diaeresis>ks<latin small letter u with diaeresis>z, N. Parajuli, X. Pennec, Marco Perea<latin small letter n with tilde>ez, C. Pinto, P. Piras, Marc-Michel Roh<latin small letter e with acute>, D. Rueckert, D. S<latin small letter a with diaeresis>ring, Maxime Sermesant, Kaleem Siddiqi, Mahdi Tabassian, L. Teresi, S. Tsaftaris, M. Wilms, A. Young, Xingyu Zhang, P. Medrano-Gracia | 2017 | IEEE journal of biomedical and health informatics | vol 22 | pages 503--515 | doi 10.1109/JBHI.2017.2652449 | Semantic Scholar dca119f54619e36f56a4f2c0b3ec42cd5c5f0eeb | open access https://hdl.handle.net/20.500.11820/bd4a7509-a028-408a-bb0f-b3adc7d089c5
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2020optimal
Command: python3 lookup resolve '2006.04804'
```
Crossref: not found
OpenAlex: ratio 1.00: Optimal Transport Graph Neural Networks | Benson Chen, Gary B<latin small letter e with acute>cigneul, Octavian-Eugen Ganea, Regina Barzilay, Tommi Jaakkola | 2020 | arXiv (Cornell University) | doi 10.48550/arxiv.2006.04804 | arXiv 2006.04804 | OpenAlex W3034902920 | open access https://arxiv.org/pdf/2006.04804
Semantic Scholar: ratio 1.00: Optimal Transport Graph Neural Networks | Gary B<latin small letter e with acute>cigneul, O. Ganea, Benson Chen, R. Barzilay, T. Jaakkola | 2020 | arXiv.org | vol abs/2006.04804 | doi 10.48550/arXiv.2006.04804 | arXiv 2006.04804 | Semantic Scholar b1855cdc5a18d99107843d5884048f804c8f2585
arXiv: ratio 1.00: Optimal Transport Graph Neural Networks | Benson Chen, Gary B<latin small letter e with acute>cigneul, Octavian-Eugen Ganea, Regina Barzilay, Tommi Jaakkola | 2020 | arXiv 2006.04804
```
Exit status: 0

### kolouri2016sliced
Command: python3 lookup resolve '10.1109/cvpr.2016.568'
```
Crossref: ratio 1.00: Sliced Wasserstein Kernels for Probability Distributions | Soheil Kolouri, Yang Zou, Gustavo K. Rohde | 2016 | 2016 IEEE Conference on Computer Vision and Pattern Recognition (CVPR) | pages 5258--5267 | doi 10.1109/cvpr.2016.568
OpenAlex: ratio 1.00: Sliced Wasserstein Kernels for Probability Distributions | Soheil Kolouri, Yang Zou, Gustavo Kunde Rohde | 2016 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | pages 5258--5267 | doi 10.1109/cvpr.2016.568 | OpenAlex W2226906430 | open access https://arxiv.org/pdf/1511.03198
Semantic Scholar: ratio 1.00: Sliced Wasserstein Kernels for Probability Distributions | Soheil Kolouri, Yang Zou, G. Rohde | 2015 | Computer Vision and Pattern Recognition | pages 5258--5267 | doi 10.1109/CVPR.2016.568 | arXiv 1511.03198 | Semantic Scholar bb12329fb5beaed74fa6c9c201ee2c8b7ba3c885 | open access https://arxiv.org/pdf/1511.03198
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bruggner2014automated
Command: python3 lookup resolve '10.1073/pnas.1408792111'
```
Crossref: ratio 1.00: Automated identification of stratifying signatures in cellular subpopulations | Robert V. Bruggner, Bernd Bodenmiller, David L. Dill, Robert J. Tibshirani, Garry P. Nolan | 2014 | Proceedings of the National Academy of Sciences | vol 111 | no 26 | doi 10.1073/pnas.1408792111
OpenAlex: ratio 1.00: Automated identification of stratifying signatures in cellular subpopulations | Robert V. Bruggner, Bernd Bodenmiller, David L. Dill, Robert John Tibshirani, Garry P. Nolan | 2014 | Proceedings of the National Academy of Sciences | vol 111 | no 26 | pages E2770--E2777 | doi 10.1073/pnas.1408792111 | OpenAlex W2143451223 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC4084463/
Semantic Scholar: ratio 1.00: Automated identification of stratifying signatures in cellular subpopulations | R. Bruggner, B. Bodenmiller, D. Dill, R. Tibshirani, G. Nolan | 2014 | Proceedings of the National Academy of Sciences of the United States of America | vol 111 | pages E2770--E2777 | doi 10.1073/pnas.1408792111 | Semantic Scholar 815807099a01003640f2b8ce67d36e8b3fea07b5 | open access https://pmc.ncbi.nlm.nih.gov/articles/PMC4084463/
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### costafreda2011automated
Command: python3 lookup resolve '10.1016/j.neuroimage.2011.01.050'
```
Crossref: ratio 1.00: Automated hippocampal shape analysis predicts the onset of dementia in mild cognitive impairment | Sergi G. Costafreda, Ivo D. Dinov, Zhuowen Tu, Yonggang Shi, Cheng-Yi Liu, Iwona Kloszewska, Patrizia Mecocci, Hilkka Soininen, Magda Tsolaki, Bruno Vellas, Lars-Olof Wahlund, Christian Spenger, Arthur W. Toga, Simon Lovestone, Andrew Simmons | 2011 | NeuroImage | vol 56 | no 1 | pages 212--219 | doi 10.1016/j.neuroimage.2011.01.050
OpenAlex: ratio 1.00: Automated hippocampal shape analysis predicts the onset of dementia in mild cognitive impairment | Sergi G. Costafreda, Ivo D. Dinov, Zhuowen Tu, Yonggang Shi, Cheng-Yi Liu, Iwona K<latin small letter l with stroke>oszewska, Patrizia Mecocci, Hilkka S. Soininen, Magda Tsolaki, Bruno J. Vellas, Lars<hyphen>Olof Wahlund, Christian Spenger, Arthur W. Toga, Simon Lovestone, Andrew Simmons | 2011 | NeuroImage | vol 56 | no 1 | pages 212--219 | doi 10.1016/j.neuroimage.2011.01.050 | OpenAlex W2154758450 | open access https://www.ncbi.nlm.nih.gov/pmc/articles/3066277
Semantic Scholar: ratio 1.00: Automated hippocampal shape analysis predicts the onset of dementia in Mild Cognitive Impairment | S. Costafreda, I. Dinov, Zhuo-Wen Tu, Yong-Gang Shi, Cheng-Yi Liu, I. Kloszewska, P. Mecocci, H. Soininen, M. Tsolaki, B. Vellas, L. Wahlund, C. Spenger, A. Toga, S. Lovestone, A. Simmons | 2011 | NeuroImage | vol 56 | pages 212--219 | doi 10.1016/j.neuroimage.2011.01.050 | Semantic Scholar 5611d44b385b8c66fce81cef5d652ebbec4f28ae | open access https://www.ncbi.nlm.nih.gov/pmc/articles/3066277
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cuingnet2011automatic
Command: python3 lookup resolve '10.1016/j.neuroimage.2010.06.013'
```
Crossref: ratio 1.00: Automatic classification of patients with Alzheimer's disease from structural MRI: A comparison of ten methods using the ADNI database | R<latin small letter e with acute>mi Cuingnet, Emilie Gerardin, J<latin small letter e with acute>r<latin small letter o with circumflex>me Tessieras, Guillaume Auzias, St<latin small letter e with acute>phane Leh<latin small letter e with acute>ricy, Marie-Odile Habert, Marie Chupin, Habib Benali, Olivier Colliot | 2011 | NeuroImage | vol 56 | no 2 | pages 766--781 | doi 10.1016/j.neuroimage.2010.06.013
OpenAlex: ratio 1.00: Automatic classification of patients with Alzheimer's disease from structural MRI: A comparison of ten methods using the ADNI database | R<latin small letter e with acute>mi Cuingnet, Emilie G<latin small letter e with acute>rardin, J<latin small letter e with acute>r<latin small letter o with circumflex>me Tessieras, Guillaume Auzias, St<latin small letter e with acute>phane Leh<latin small letter e with acute>ricy, Marie<hyphen>Odile Habert, Marie Chupin, Habib Benali, Olivier Colliot | 2010 | NeuroImage | vol 56 | no 2 | pages 766--781 | doi 10.1016/j.neuroimage.2010.06.013 | OpenAlex W2153171432 | open access https://inria.hal.science/hal-00795739
Semantic Scholar: ratio 1.00: Automatic classification of patients with Alzheimer's disease from structural MRI: A comparison of ten methods using the ADNI database | R<latin small letter e with acute>mi Cuingnet, <latin capital letter e with acute>milie Gerardin, J<latin small letter e with acute>r<latin small letter o with circumflex>me Tessieras, G. Auzias, S. Leh<latin small letter e with acute>ricy, M. Habert, M. Chupin, H. Benali, O. Colliot | 2011 | NeuroImage | vol 56 2 | pages 766--81 | doi 10.1016/j.neuroimage.2010.06.013 | Semantic Scholar 4d2f54dfe3d5be7b1a9330389e490ee4219018ed | open access https://inria.hal.science/hal-00795739
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chang2020automatic
Command: python3 lookup resolve '10.1016/j.neucom.2020.08.030'
```
Crossref: ratio 1.00: Automatic cardiac MRI segmentation and permutation-invariant pathology classification using deep neural networks and point clouds | Yakun Chang, Cheolkon Jung | 2020 | Neurocomputing | vol 418 | pages 270--279 | doi 10.1016/j.neucom.2020.08.030
OpenAlex: ratio 1.00: Automatic cardiac MRI segmentation and permutation-invariant pathology classification using deep neural networks and point clouds | Yakun Chang, Cheolkon Jung | 2020 | Neurocomputing | vol 418 | pages 270--279 | doi 10.1016/j.neucom.2020.08.030 | OpenAlex W3082127558
Semantic Scholar: ratio 1.00: Automatic cardiac MRI segmentation and permutation-invariant pathology classification using deep neural networks and point clouds | Yakun Chang, C. Jung | 2020 | Neurocomputing | vol 418 | pages 270--279 | doi 10.1016/j.neucom.2020.08.030 | Semantic Scholar 8b31278fb1307c2a895d825dc793bd48edba8c28
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### song2024morphological
Command: python3 lookup resolve '10.1109/cvpr52733.2024.01099'
```
Crossref: ratio 1.00: Morphological Prototyping for Unsupervised Slide Representation Learning in Computational Pathology | Andrew H. Song, Richard J. Chen, Tong Ding, Drew F.K. Williamson, Guillaume Jaume, Faisal Mahmood | 2024 | 2024 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR) | pages 11566--11578 | doi 10.1109/cvpr52733.2024.01099
OpenAlex: ratio 1.00: Morphological Prototyping for Unsupervised Slide Representation Learning in Computational Pathology | Andrew H. Song, Richard J. Chen, Tong Ding, Drew F. K. Williamson, Guillaume Jaume, Faisal Mahmood | 2024 | IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings - IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings | pages 11566--11578 | doi 10.1109/cvpr52733.2024.01099 | OpenAlex W4402733589 | open access https://arxiv.org/pdf/2405.11643
Semantic Scholar: ratio 1.00: Morphological Prototyping for Unsupervised Slide Representation Learning in Computational Pathology | Andrew H. Song, Richard J. Chen, Tong Ding, Drew F. K. Williamson, G. Jaume, F. Mahmood | 2024 | Computer Vision and Pattern Recognition | pages 11566--11578 | doi 10.1109/CVPR52733.2024.01099 | arXiv 2405.11643 | Semantic Scholar ba43b5d0df763e5b4f28425a77def6b8e8e2567a | open access https://arxiv.org/pdf/2405.11643
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### naderializadeh2024aggregating
Command: python3 lookup resolve '10.1093/bioadv/vbaf060'
```
Crossref: ratio 1.00: Aggregating residue-level protein language model embeddings with optimal transport | Navid NaderiAlizadeh, Rohit Singh | 2024 | Bioinformatics Advances | vol 5 | no 1 | doi 10.1093/bioadv/vbaf060
OpenAlex: ratio 1.00: Aggregating residue-level protein language model embeddings with optimal transport | Navid Naderializadeh, Rohit Singh | 2024 | Bioinformatics Advances | vol 5 | no 1 | pages vbaf060--vbaf060 | doi 10.1093/bioadv/vbaf060 | OpenAlex W4408717486 | open access https://doi.org/10.1093/bioadv/vbaf060
Semantic Scholar: ratio 1.00: Aggregating residue-level protein language model embeddings with optimal transport | Navid Naderializadeh, Rohit Singh | 2024 | bioRxiv | vol 5 | doi 10.1093/bioadv/vbaf060 | Semantic Scholar 0c580c0146688ef0d20aff9bc00c77bfd2ab1d0d | open access https://doi.org/10.1093/bioadv/vbaf060
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### qian2024reimagining
Command: python3 lookup resolve '10.1145/3637528.3671696'
```
Crossref: ratio 1.00: Reimagining Graph Classification from a Prototype View with Optimal Transport: Algorithm and Theorem | Chen Qian, Huayi Tang, Hong Liang, Yong Liu | 2024 | Proceedings of the 30th ACM SIGKDD Conference on Knowledge Discovery and Data Mining | pages 2444--2454 | doi 10.1145/3637528.3671696
OpenAlex: ratio 1.00: Reimagining Graph Classification from a Prototype View with Optimal Transport: Algorithm and Theorem | Chen Qian, Huayi Tang, Hong Liang, Yong Liu | 2024 | ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD) | pages 2444--2454 | doi 10.1145/3637528.3671696 | OpenAlex W4401863353 | open access https://dl.acm.org/doi/pdf/10.1145/3637528.3671696
Semantic Scholar: ratio 1.00: Reimagining Graph Classification from a Prototype View with Optimal Transport: Algorithm and Theorem | Chen Qian, Huayi Tang, Hongsi Liang, Yong Liu | 2024 | Knowledge Discovery and Data Mining | doi 10.1145/3637528.3671696 | Semantic Scholar 462fcce248422d4c67b4408ef2ae34f5c360dc4e | open access https://dl.acm.org/doi/pdf/10.1145/3637528.3671696
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### kachaiev2024learning
Command: python3 lookup resolve '10.52202/079017-1420'
```
Crossref: ratio 1.00: Learning to Embed Distributions via Maximum Kernel Entropy | Oleksii Kachaiev, Stefano Recanatesi | 2024 | Advances in Neural Information Processing Systems 37 | pages 44710--44734 | doi 10.52202/079017-1420
OpenAlex: ratio 1.00: Learning to Embed Distributions via Maximum Kernel Entropy | Oleksii Kachaiev, Stefano Recanatesi | 2024 | neural information processing systems | pages 44710--44734 | doi 10.52202/079017-1420 | OpenAlex W4415797707 | open access https://arxiv.org/pdf/2408.00549
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### ding2026application
Command: python3 lookup resolve '10.1038/s41598-025-32093-9'
```
Crossref: ratio 1.00: Application and characterization of the multiple instance learning framework in flow cytometry | Zhiyuan Ding, Alexander Baras | 2026 | Scientific Reports | vol 16 | no 1 | doi 10.1038/s41598-025-32093-9
OpenAlex: ratio 1.00: Application and characterization of the multiple instance learning framework in flow cytometry | Zhiyuan Ding, Alexander Spyridon Baras | 2026 | Scientific Reports | vol 16 | no 1 | pages 2380--2380 | doi 10.1038/s41598-025-32093-9 | OpenAlex W7123341370 | open access https://www.nature.com/articles/s41598-025-32093-9_reference.pdf
Semantic Scholar: ratio 1.00: Application and characterization of the multiple instance learning framework in flow cytometry | Zhi-Yuan Ding, A. Baras | 2025 | bioRxiv | vol 16 | doi 10.1038/s41598-025-32093-9 | Semantic Scholar b93a8944980e56f42ba804a4bcd49a7e1ca5d570 | open access https://www.nature.com/articles/s41598-025-32093-9_reference.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gachon2026scalable
Command: python3 lookup resolve '2502.04907'
```
Crossref: not found
OpenAlex: ratio 1.00: Scalable Learning from Probability Measures with Mean Measure Quantization | Erell Gachon, Elsa Cazelles, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot | 2025 | Transactions on machine learning research | doi 10.48550/arxiv.2502.04907 | arXiv 2502.04907 | OpenAlex W4407310041 | open access https://openreview.net/forum?id=eA4cQkY7Ug
Semantic Scholar: ratio 1.00: Scalable Learning from Probability Measures with Mean Measure Quantization | E. Gachon, Elsa Cazelles, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot | 2025 | Trans. Mach. Learn. Res. | vol 2026 | arXiv 2502.04907 | Semantic Scholar 71a4510715ee81fa63630aa1d78488f2a4023560
arXiv: ratio 1.00: Scalable Learning from Probability Measures with Mean Measure Quantization | Erell Gachon, Elsa Cazelles, J<latin small letter e with acute>r<latin small letter e with acute>mie Bigot | 2025 | arXiv 2502.04907
```
Exit status: 0

### nikolentzos2025lipschitz
Command: python3 lookup resolve '2505.24403'
```
Crossref: not found
OpenAlex: ratio 1.00: On the Lipschitz Continuity of Set Aggregation Functions and Neural Networks for Sets | Giannis Nikolentzos, Konstantinos Skianis | 2025 | International Conference on Learning Representations | doi 10.48550/arxiv.2505.24403 | arXiv 2505.24403 | OpenAlex W4414857215 | open access https://proceedings.iclr.cc/paper_files/paper/2026/hash/d9336f158d53f42537f25ab57db7aa06-Abstract-Conference.html
Semantic Scholar: ratio 1.00: On the Lipschitz Continuity of Set Aggregation Functions and Neural Networks for Sets | Giannis Nikolentzos, Konstantinos Skianis | 2025 | International Conference on Learning Representations | vol abs/2505.24403 | doi 10.48550/arXiv.2505.24403 | arXiv 2505.24403 | Semantic Scholar b52adae4ed46bea231f4c7a582b9697ae4f9eabb
arXiv: ratio 1.00: On the Lipschitz Continuity of Set Aggregation Functions and Neural Networks for Sets | Giannis Nikolentzos, Konstantinos Skianis | 2025 | arXiv 2505.24403
```
Exit status: 0

### naderializadeh2025constrained
Command: python3 lookup resolve '2506.02203'
```
Crossref: not found
OpenAlex: ratio 1.00: Constrained Sliced Wasserstein Embedding | Navid Naderializadeh, Darian Salehi, Xinran Liu, Soheil Kolouri | 2025 | arXiv (Cornell University) | doi 10.48550/arxiv.2506.02203 | arXiv 2506.02203 | OpenAlex W4415130775 | open access https://arxiv.org/pdf/2506.02203
Semantic Scholar: ratio 1.00: Constrained Sliced Wasserstein Embedding | Navid Naderializadeh, Darian Salehi, Xin-Ran Liu, Soheil Kolouri | 2025 | arXiv.org | vol abs/2506.02203 | doi 10.48550/arXiv.2506.02203 | arXiv 2506.02203 | Semantic Scholar 9332873da91f9c7dc9462a0eeb4d7a5b0b5981b1
arXiv: ratio 1.00: Constrained Sliced Wasserstein Embedding | Navid NaderiAlizadeh, Darian Salehi, Xinran Liu, Soheil Kolouri | 2025 | arXiv 2506.02203
```
Exit status: 0

### yang2024histopathology
Command: python3 lookup resolve '2412.16715'
```
Crossref: not found
OpenAlex: ratio 1.00: From Histopathology Images to Cell Clouds: Learning Slide Representations with Hierarchical Cell Transformer | Zijiang Yang, Zhongwei Qiu, Tiancheng Lin, Hanqing Chao, Wanxing Chang, Yelin Yang, Yunshuo Zhang, Wenpei Jiao, Yixuan Shen, Wenbin Liu, Dongmei Fu, Dakai Jin, Ke Yan, Le L<latin small letter u with diaeresis>, Hui Jiang, Yun Bian | 2024 | arXiv (Cornell University) | doi 10.48550/arxiv.2412.16715 | arXiv 2412.16715 | OpenAlex W4405766380 | open access https://arxiv.org/pdf/2412.16715
Semantic Scholar: ratio 1.00: From Histopathology Images to Cell Clouds: Learning Slide Representations with Hierarchical Cell Transformer | Zi-Jiang Yang, Zhong-Wei Qiu, Tian-Cheng Lin, Hanqing Chao, Wan-Xing Chang, Ye-Lin Yang, Yun-Shuo Zhang, Wenpei Jiao, Yi-Xuan Shen, Wen-Bin Liu, Dong-yang Fu, Da-Kai Jin, Ke Yan, Le Lu, Hui Jiang, Yun Bian | 2024 | arXiv.org | vol abs/2412.16715 | doi 10.48550/arXiv.2412.16715 | arXiv 2412.16715 | Semantic Scholar 1a62bd089d6a7cef39e1187a4ab8fffdec96a3e6
arXiv: ratio 1.00: From Histopathology Images to Cell Clouds: Learning Slide Representations with Hierarchical Cell Transformer | Zijiang Yang, Zhongwei Qiu, Tiancheng Lin, Hanqing Chao, Wanxing Chang, Yelin Yang, Yunshuo Zhang, Wenpei Jiao, Yixuan Shen, Wenbin Liu, Dongmei Fu, Dakai Jin, Ke Yan, Le Lu, Hui Jiang, Yun Bian | 2024 | arXiv 2412.16715
```
Exit status: 0

### kan20263d
Command: python3 lookup resolve '2602.07260'
```
Crossref: not found
OpenAlex: ratio 1.00: 3D Transport-based Morphometry (3D-TBM) for medical image analysis | Hongyu Kan, Kristofor E. Pas, Iv<latin small letter a with acute>n Medri, Naqib Sad Pathan, Natasha T. Ironside, Shinjini Kundu, Jingjia He, Gustavo Kunde Rohde | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2602.07260 | arXiv 2602.07260 | OpenAlex W7128494666 | open access https://arxiv.org/pdf/2602.07260
Semantic Scholar: ratio 1.00: 3D Transport-based Morphometry (3D-TBM) for medical image analysis | Hong-Yu Kan, Kristofor E. Pas, I. Medri, Naqib Sad Pathan, N. Ironside, Shinjini Kundu, Jing He, G. Rohde | 2026 | arXiv.org | vol abs/2602.07260 | doi 10.48550/arXiv.2602.07260 | arXiv 2602.07260 | Semantic Scholar 45a213fbac447ec477e960da6d0700d554bf35e0
arXiv: ratio 1.00: 3D Transport-based Morphometry (3D-TBM) for medical image analysis | Hongyu Kan, Kristofor Pas, Ivan Medri, Naqib Sad Pathan, Natasha Ironside, Shinjini Kundu, Jingjia He, Gustavo Kunde Rohde | 2026 | arXiv 2602.07260
```
Exit status: 0

### bai2025linear
Command: python3 lookup resolve '2410.16669'
```
Crossref: not found
OpenAlex: ratio 1.00: Linear Partial Gromov-Wasserstein Embedding | Yikun Bai, Abihith Kothapalli, Hengrong Du, Roc<latin small letter i with acute>o D<latin small letter i with acute>az Mart<latin small letter i with acute>n, Soheil Kolouri | 2024 | International Conference on Learning Representations | doi 10.48550/arxiv.2410.16669 | arXiv 2410.16669 | OpenAlex W4404350002 | open access https://proceedings.iclr.cc/paper_files/paper/2025/hash/064ae24cdbb3eaacc801ee7f4fe0e4f2-Abstract-Conference.html
Semantic Scholar: ratio 1.00: Linear Partial Gromov-Wasserstein Embedding | Yi-Kun Bai, Abihith Kothapalli, Heng-Rong Du, R. D<latin small letter i with acute>az Mart<latin small letter i with acute>n, Soheil Kolouri | 2024 | International Conference on Learning Representations | vol abs/2410.16669 | doi 10.48550/arXiv.2410.16669 | arXiv 2410.16669 | Semantic Scholar 35b52d2d94cacbb3760ae5736bad5b7bf04365f8
arXiv: ratio 1.00: Linear Partial Gromov-Wasserstein Embedding | Yikun Bai, Abihith Kothapalli, Hengrong Du, Rocio Diaz Martin, Soheil Kolouri | 2024 | arXiv 2410.16669
```
Exit status: 0

### wang2026segmentation
Command: python3 lookup resolve '10.1002/pro6.70056'
```
Crossref: ratio 1.00: Segmentation influence on the generalizability of the overall survival models in CT<hyphen>based oropharyngeal carcinoma patients | Yongqiang Wang, Xuhua Xiao, Jiang Zhang, Xinzhi Teng, Bing Li, Kangdong Liu, Jing Cai, Hong Ge | 2026 | Precision Radiation Oncology | vol 10 | no 1 | pages 7--18 | doi 10.1002/pro6.70056
OpenAlex: ratio 1.00: Segmentation influence on the generalizability of the overall survival models in CT<hyphen>based oropharyngeal carcinoma patients | Yongqiang Wang, Xuhua Xiao, Jiang Zhang, Xinzhi Teng, Bing Li, Kangdong Liu, Jing Cai, Hong Ge | 2026 | Precision Radiation Oncology | vol 10 | no 1 | pages 7--18 | doi 10.1002/pro6.70056 | OpenAlex W7139927511 | open access https://doi.org/10.1002/pro6.70056
Semantic Scholar: ratio 1.00: Segmentation influence on the generalizability of the overall survival models in CT<hyphen>based oropharyngeal carcinoma patients | Yong-Qiang Wang, Xu-Hua Xiao, Jiang Zhang, X. Teng, Bing Li, Kang-Dong Liu, Jing Cai, Hong Ge | 2026 | Precision Radiation Oncology | vol 10 | pages 7--18 | doi 10.1002/pro6.70056 | Semantic Scholar babb4712e48e12560c529f0eed0ac5847bd445b2 | open access https://doi.org/10.1002/pro6.70056
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### sineglazov2026impact
Command: python3 lookup resolve '10.18372/1990-5548.88.20980'
```
Crossref: ratio 1.00: Impact of Automated Segmentation on Radiomics-based Growth Prediction of Vestibular Schwannoma | Victor Sineglazov, Maksym Shevchenko | 2026 | Electronics and Control Systems | vol 2 | no 88 | pages 156--163 | doi 10.18372/1990-5548.88.20980
OpenAlex: ratio 1.00: Impact of Automated Segmentation on Radiomics-based Growth Prediction of Vestibular Schwannoma | Victor M. Sineglazov, Maksym Shevchenko | 2026 | Electronics and Control Systems | vol 2 | no 88 | pages 156--163 | doi 10.18372/1990-5548.88.20980 | OpenAlex W7155208374 | open access http://jrnl.kai.edu.ua/index.php/ESU/article/download/20980/28003
Semantic Scholar: ratio 1.00: Impact of Automated Segmentation on Radiomics-based Growth Prediction of Vestibular Schwannoma | V. Sineglazov, M. Shevchenko | 2026 | Electronics and Control Systems | doi 10.18372/1990-5548.88.20980 | Semantic Scholar 488fe391829804711c779cc02a13c861c2e26bbb | open access http://jrnl.kai.edu.ua/index.php/ESU/article/download/20980/28003
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chen2026distributionally
Command: python3 lookup resolve '2605.30089'
```
Crossref: not found
OpenAlex: ratio 1.00: Distributionally Robust Set Representation Learning Under Inference-Time Element Corruption | Yankai Chen, Hanrong Zhang, Bowei He, Philip S. Yu, Xue Liu | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2605.30089 | arXiv 2605.30089 | OpenAlex W7162788245 | open access https://arxiv.org/pdf/2605.30089
Semantic Scholar: ratio 1.00: Distributionally Robust Set Representation Learning Under Inference-Time Element Corruption | Yan-Kai Chen, Han-Rong Zhang, Bo-Wei He, Philip S. Yu, Xue Liu | 2026 | arXiv.org | vol abs/2605.30089 | doi 10.48550/arXiv.2605.30089 | arXiv 2605.30089 | Semantic Scholar 73a9aaba9b254af64ec2994d503cac21248e8d85
arXiv: ratio 1.00: Distributionally Robust Set Representation Learning Under Inference-Time Element Corruption | Yankai Chen, Hanrong Zhang, Bowei He, Philip S. Yu, Xue Liu | 2026 | arXiv 2605.30089
```
Exit status: 0

### scott2026negative
Command: python3 lookup resolve '2607.28423'
```
Crossref: not found
OpenAlex: ratio 1.00: Negative controls reveal volume-driven confounding in radiomics and imaging foundation model features | Katy L. Scott, Sejin Kim, Joshua Siraj, Caryn Geady, Matthew Boccalon, Mattea Welch, Mogtaba Alim, Andrew J. Hope, Benjamin Haibe<hyphen>Kains | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2607.28423 | arXiv 2607.28423 | OpenAlex W7171984506 | open access https://arxiv.org/pdf/2607.28423
Semantic Scholar: ratio 1.00: Negative controls reveal volume-driven confounding in radiomics and imaging foundation model features | K. Scott, Sejin Kim, J. Siraj, C. Geady, M. Boccalon, M. Welch, M. Alim, A. Hope, B. Haibe-Kains | 2026 | arXiv.org | vol abs/2607.28423 | doi 10.48550/arXiv.2607.28423 | arXiv 2607.28423 | Semantic Scholar d08208c58c5689b46262d55d5700edd130e55d8e
arXiv: ratio 1.00: Negative controls reveal volume-driven confounding in radiomics and imaging foundation model features | Katy L. Scott, Sejin Kim, Joshua Siraj, Caryn Geady, Matthew Boccalon, Mattea Welch, Mogtaba Alim, Andrew J. Hope, Benjamin Haibe-Kains | 2026 | arXiv 2607.28423
```
Exit status: 0

### pathan2026flowlot
Command: python3 lookup resolve '2609.17906'
```
Crossref: not found
OpenAlex: ratio 1.00: FlowLOT: Linearized Optimal Transport for Flow Cytometry Analysis | Naqib Sad Pathan, Mohammad Shifat<hyphen>E<hyphen>Rabbi, Kristofor E. Pas, Iv<latin small letter a with acute>n Medri, Bartek Rajwa, Gustavo Kunde Rohde | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2609.17906 | arXiv 2609.17906 | OpenAlex W7213563752 | open access https://arxiv.org/pdf/2609.17906
Semantic Scholar: ratio 1.00: FlowLOT: Linearized Optimal Transport for Flow Cytometry Analysis. | Naqib Sad Pathan, Mohammad Shifat-E.-Rabbi, Kristofor E. Pas, I. Medri, Bartek Rajwa, G. Rohde | 2026 | arXiv.org | arXiv 2609.17906 | Semantic Scholar faa21763f8cd65dd6f102b1b312c68b2ce82a61d
arXiv: ratio 1.00: FlowLOT: Linearized Optimal Transport for Flow Cytometry Analysis | Naqib Sad Pathan, Mohammad Shifat-E-Rabbi, Kristofor E. Pas, Ivan Medri, Bartek Rajwa, Gustavo K. Rohde | 2026 | arXiv 2609.17906
```
Exit status: 0

### ciszewski2026decision
Command: python3 lookup resolve '10.1109/cpee71962.2026.11768023'
```
Crossref: ratio 1.00: Decision Stability Under Segmentation Uncertainty in CT Radiomics | Jakub Ciszewski, Rados<latin small letter l with stroke>aw Roszczyk, Krzysztof Siwek | 2026 | 2026 27th International Conference on Computational Problems of Electrical Engineering (CPEE) | pages 1--6 | doi 10.1109/cpee71962.2026.11768023
OpenAlex: ratio 1.00: Decision Stability Under Segmentation Uncertainty in CT Radiomics | Jakub Ciszewski, Rados<latin small letter l with stroke>aw Roszczyk, Krzysztof Siwek | 2026 | International Conference on Computational Problems of Electrical Engineering (CPEE) | pages 1--6 | doi 10.1109/cpee71962.2026.11768023 | OpenAlex W7225403232 | open access https://doi.org/10.1109/cpee71962.2026.11768023
Semantic Scholar: ratio 1.00: Decision Stability Under Segmentation Uncertainty in CT Radiomics | Jakub Ciszewski, Rados<latin small letter l with stroke>aw Roszczyk, K. Siwek | 2026 | 2026 27th International Conference on Computational Problems of Electrical Engineering (CPEE) | pages 1--6 | doi 10.1109/CPEE71962.2026.11768023 | Semantic Scholar b1b85a28534ae290b8c6eae6abd3d03f85d623c7 | open access https://doi.org/10.1109/cpee71962.2026.11768023
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### peng2025ct
Command: python3 lookup resolve '10.3390/bioengineering12080813'
```
Crossref: ratio 1.00: CT-Based Habitat Radiomics Combining Multi-Instance Learning for Early Prediction of Post-Neoadjuvant Lymph Node Metastasis in Esophageal Squamous Cell Carcinoma | Qinghe Peng, Shumin Zhou, Runzhe Chen, Jinghui Pan, Xin Yang, Jinlong Du, Hongdong Liu, Hao Jiang, Xiaoyan Huang, Haojiang Li, Li Chen | 2025 | Bioengineering | vol 12 | no 8 | pages 813 | doi 10.3390/bioengineering12080813
OpenAlex: ratio 1.00: CT-Based Habitat Radiomics Combining Multi-Instance Learning for Early Prediction of Post-Neoadjuvant Lymph Node Metastasis in Esophageal Squamous Cell Carcinoma | Qinghe Peng, Shumin Zhou, Runzhe Chen, Jinghui Pan, Xiao Yang, Jinlong Du, Hongdong Liu, Hao Jiang, Xiaoyan Huang, Haojiang Li, Li Chen | 2025 | Bioengineering | vol 12 | no 8 | pages 813--813 | doi 10.3390/bioengineering12080813 | OpenAlex W4412701515 | open access https://www.mdpi.com/2306-5354/12/8/813/pdf?version=1753714973
Semantic Scholar: ratio 1.00: CT-Based Habitat Radiomics Combining Multi-Instance Learning for Early Prediction of Post-Neoadjuvant Lymph Node Metastasis in Esophageal Squamous Cell Carcinoma | Qing-He Peng, Shumin Zhou, Run-Zhe Chen, Jing-Hui Pan, Xin Yang, Jinlong Du, Hong-Dong Liu, Hao Jiang, Xiao-Yan Huang, Hao-Jiang Li, Li Chen | 2025 | Bioengineering | vol 12 | doi 10.3390/bioengineering12080813 | Semantic Scholar 5ab0994fc3d02df365ad07070895463bdebb7568 | open access https://www.mdpi.com/2306-5354/12/8/813/pdf?version=1753714973
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### beckmann2026generalizations
Command: python3 lookup resolve '10.1007/s10851-026-01327-4'
```
Crossref: ratio 1.00: Generalizations of the Normalized Radon Cumulative Distribution Transform for Limited Data Recognition | Matthias Beckmann, Robert Beinert, Jonas Bresch | 2026 | Journal of Mathematical Imaging and Vision | vol 68 | no 4 | doi 10.1007/s10851-026-01327-4
OpenAlex: ratio 1.00: Generalizations of the Normalized Radon Cumulative Distribution Transform for Limited Data Recognition | Matthias Beckmann, Robert Beinert, Jonas Bresch | 2026 | Journal of Mathematical Imaging and Vision | vol 68 | no 4 | doi 10.1007/s10851-026-01327-4 | OpenAlex W7169788024 | open access https://link.springer.com/content/pdf/10.1007/s10851-026-01327-4.pdf
Semantic Scholar: ratio 1.00: Generalizations of the Normalized Radon Cumulative Distribution Transform for Limited Data Recognition | Matthias Beckmann, Robert Beinert, Jonas Bresch | 2025 | Journal of Mathematical Imaging and Vision | vol 68 | doi 10.1007/s10851-026-01327-4 | arXiv 2512.08099 | Semantic Scholar 30f8beadb85f992c72fe2f8e2fc9016233915ec5 | open access https://link.springer.com/content/pdf/10.1007/s10851-026-01327-4.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### cama2024study
Command: python3 lookup resolve '10.1117/12.3027015'
```
Crossref: ratio 1.00: A study on the role of radiomics feature stability in predicting breast cancer subtypes | Isabella Cama, Alejandro Guzman, Sara Garbarino, Cristina Campi, Karim Lekadir, Oliver Diaz | 2024 | 17th International Workshop on Breast Imaging (IWBI 2024) | pages 75 | doi 10.1117/12.3027015
OpenAlex: ratio 1.00: A study on the role of radiomics feature stability in predicting breast cancer subtypes | Isabella Cama, Alejandro Guzm<latin small letter a with acute>n, Sara Garbarino, Cristina Campi, Karim Lekadir, Oliver D<latin small letter i with acute>az | 2024 | International Workshop on Breast Imaging (IWBI) | pages 75--75 | doi 10.1117/12.3027015 | OpenAlex W4399117286
Semantic Scholar: ratio 1.00: A study on the role of radiomics feature stability in predicting breast cancer subtypes | Isabella Cama, Alejandro Guzm<latin small letter a with acute>n, S. Garbarino, C. Campi, K. Lekadir, Oliver D<latin small letter i with acute>az | 2024 | International Workshop on Breast Imaging | vol 13174 | pages 131741O--131741O--10 | doi 10.1117/12.3027015 | Semantic Scholar 198828b134403d75fdbdf40b3e0d701b4c40bf80
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### francischello2026influence
Command: python3 lookup resolve '10.1016/j.ejrai.2026.100091'
```
Crossref: ratio 1.00: The influence of annotators' experience on radiomics-based machine learning performance in colorectal liver metastases characterization: Impact and mitigation strategy | Roberto Francischello, Salvatore Claudio Fanni, Francesca Pia Caputo, Gayane Aghakhanyan, Giacomo Aringhieri, Lorenzo Faggioni, Riccardo Lencioni, Emanuele Neri, Dania Cioni | 2026 | European Journal of Radiology Artificial Intelligence | vol 6 | pages 100091 | doi 10.1016/j.ejrai.2026.100091
OpenAlex: ratio 1.00: The influence of annotators' experience on radiomics-based machine learning performance in colorectal liver metastases characterization: Impact and mitigation strategy | Roberto Francischello, Salvatore Claudio Fanni, Francesca Pia Caputo, Gayan<latin small letter e with grave> Aghakhanyan, Giacomo Aringhieri, Lorenzo Faggioni, Riccardo Antonio Lencioni, Emanuele Neri, Dania Cioni | 2026 | European Journal of Radiology Artificial Intelligence | vol 6 | pages 100091--100091 | doi 10.1016/j.ejrai.2026.100091 | OpenAlex W7141978071 | open access https://www.ejrai.com/article/S3050-5771(26)00022-8/pdf
Semantic Scholar: ratio 1.00: The Influence of Annotators' Experience on Radiomics-based Machine Learning Performance in Colorectal Liver Metastases Characterization: Impact and Mitigation Strategy | R. Francischello, S. Fanni, F. P. Caputo, G. Aghakhanyan, G. Aringhieri, L. Faggioni, R. Lencioni, E. Neri, D. Cioni | 2026 | European Journal of Radiology Artificial Intelligence | doi 10.1016/j.ejrai.2026.100091 | Semantic Scholar 4a8c7ef6df7078d6e3bc864c8d292a3dcda0622f | open access https://www.ejrai.com/article/S3050-5771(26)00022-8/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### li2025quantile
Command: python3 lookup resolve '2508.21523'
```
Crossref: not found
OpenAlex: ratio 1.00: Quantile Function-Based Models for Neuroimaging Classification Using Wasserstein Regression | Li, Jie, Gary G. R. Green, Zhang, Jian | 2025 | arXiv (Cornell University) | doi 10.48550/arxiv.2508.21523 | arXiv 2508.21523 | OpenAlex W4416008766 | open access https://arxiv.org/pdf/2508.21523
Semantic Scholar: ratio 1.00: Quantile Function-Based Models for Neuroimaging Classification Using Wasserstein Regression | Jie Li, G. Green, Jian Zhang | 2025 | arXiv 2508.21523 | Semantic Scholar acbda047df7ad37134382d45341f8876acabe993
arXiv: ratio 1.00: Quantile Function-Based Models for Neuroimaging Classification Using Wasserstein Regression | Jie Li, Gary Green, Jian Zhang | 2025 | arXiv 2508.21523
```
Exit status: 0

### choi2026tumor
Command: python3 lookup resolve '10.1016/j.phro.2026.100907'
```
Crossref: ratio 1.00: Tumor-conditioned inter-patient registration using planning computed tomography for voxel-based analysis to predict radiation pneumonitis in lung cancer patients | Chloe Min Seo Choi, Jue Jiang, Nikhil P. Mankuzhy, Nishant Nadkarni, Sudharsan Madhavan, Abraham J. Wu, Joseph O. Deasy, Maria Thor, Andreas Rimner, Harini Veeraraghavan | 2026 | Physics and Imaging in Radiation Oncology | vol 37 | pages 100907 | doi 10.1016/j.phro.2026.100907
OpenAlex: ratio 1.00: Tumor-conditioned inter-patient registration using planning computed tomography for voxel-based analysis to predict radiation pneumonitis in lung cancer patients | Chloe Min Seo Choi, Jue Jiang, Nikhil P. Mankuzhy, Nishant Nadkarni, Sudharsan Madhavan, Abraham Jing-Ching Wu, Joseph O. Deasy, Maria Thor, Andreas Rimner, Harini Veeraraghavan | 2026 | Physics and Imaging in Radiation Oncology | vol 37 | pages 100907--100907 | doi 10.1016/j.phro.2026.100907 | OpenAlex W7124836704 | open access https://www.phiro.science/article/S2405-6316(26)00007-2/pdf
Semantic Scholar: ratio 1.00: Tumor-conditioned inter-patient registration using planning computed tomography for voxel-based analysis to predict radiation pneumonitis in lung cancer patients | C. Choi, Jue Jiang, N. Mankuzhy, Nishant Nadkarni, Sudharsan Madhavan, Abraham J. Wu, J. Deasy, M. Thor, A. Rimner, H. Veeraraghavan | 2026 | Physics and Imaging in Radiation Oncology | vol 37 | doi 10.1016/j.phro.2026.100907 | Semantic Scholar ac894704ad97088d249215017e7907b9159576a6 | open access https://www.phiro.science/article/S2405-6316(26)00007-2/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### miteva2026segmentation
Command: python3 lookup resolve '2607.23626'
```
Crossref: not found
OpenAlex: ratio 1.00: Segmentation Robustness and Predictive Utility in Glioblastoma Radiomics: Evidence for a Trade-off in Survival Modelling | Mariya Miteva, Maria Nisheva-Pavlova | 2026 | arXiv (Cornell University) | doi 10.48550/arxiv.2607.23626 | arXiv 2607.23626 | OpenAlex W7171553421 | open access https://arxiv.org/pdf/2607.23626
Semantic Scholar: ratio 1.00: Segmentation Robustness and Predictive Utility in Glioblastoma Radiomics: Evidence for a Trade-off in Survival Modelling | Mariya Miteva, M. Nisheva-Pavlova | 2026 | arXiv.org | vol abs/2607.23626 | doi 10.48550/arXiv.2607.23626 | arXiv 2607.23626 | Semantic Scholar b72a8cc78180e49d34b9b1b4eb34bd2db56ab903
arXiv: ratio 1.00: Segmentation Robustness and Predictive Utility in Glioblastoma Radiomics: Evidence for a Trade-off in Survival Modelling | Mariya Miteva, Maria Nisheva-Pavlova | 2026 | arXiv 2607.23626
```
Exit status: 0

### ahmadi2026hippocampal
Command: python3 lookup resolve '10.21203/rs.3.rs-10382441/v1'
```
Crossref: ratio 1.00: Hippocampal surface analysis using discrete Ricci flow and Riemannian metrics for the diagnosis of Alzheimer's disease | Fatemeh Ahmadi, Behroz Bidabad | 2026 | doi 10.21203/rs.3.rs-10382441/v1
OpenAlex: ratio 1.00: Hippocampal surface analysis using discrete Ricci flow and Riemannian metrics for the diagnosis of Alzheimer's disease | Fatemeh Ahmadi, Behroz Bidabad | 2026 | Research Square | doi 10.21203/rs.3.rs-10382441/v1 | OpenAlex W7213550078 | open access https://www.researchsquare.com/article/rs-10382441/latest.pdf
Semantic Scholar: ratio 1.00: Hippocampal surface analysis using discrete Ricci flow and Riemannian metrics for the diagnosis of Alzheimer<right single quotation mark>s disease | Fatemeh Ahmadi, B. Bidabad | 2026 | Research Square | doi 10.21203/rs.3.rs-10382441/v1 | Semantic Scholar 277202d8b64a88b120d00213cdf34ceebcb07153 | open access https://www.researchsquare.com/article/rs-10382441/latest.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### tang2026metabolic
Command: python3 lookup resolve '10.1162/imag.a.1343'
```
Crossref: ratio 1.00: Metabolic connectivity alterations in amyotrophic lateral sclerosis: Individual network analysis based on Wasserstein distances | Chunmeng Tang, Joke De Vocht, Philip Van Damme, Koen Van Laere, Michel Koole | 2026 | Imaging Neuroscience | vol 4 | doi 10.1162/imag.a.1343
OpenAlex: ratio 1.00: Metabolic connectivity alterations in amyotrophic lateral sclerosis: Individual network analysis based on Wasserstein distances | Chunmeng Tang, Joke De Vocht, Philip Van Damme, Koen Van Laere, Michel J. B. Koole | 2026 | Imaging Neuroscience | vol 4 | doi 10.1162/imag.a.1343 | OpenAlex W7196987648 | open access https://doi.org/10.1162/imag.a.1343
Semantic Scholar: ratio 1.00: Metabolic connectivity alterations in amyotrophic lateral sclerosis: Individual network analysis based on Wasserstein distances | Chun-Meng Tang, Joke de Vocht, P. van Damme, K. Van Laere, M. Koole | 2026 | Imaging neuroscience | vol 4 | doi 10.1162/IMAG.a.1343 | Semantic Scholar f74187f0fcc999d10fdfad5b32e5b2d6bfdfd3f7 | open access https://doi.org/10.1162/imag.a.1343
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wiers2026geometry
No DOI and no arXiv ID; url: https://proceedings.mlr.press/v315/wiers26a.html. Checked by WebFetch of the url (recorded below by the session).

### cohen2018nonnegative
Command: python3 lookup resolve '10.1007/978-3-319-93764-9_9'
```
Crossref: ratio 1.00: Nonnegative PARAFAC2: A Flexible Coupling Approach | Jeremy E. Cohen, Rasmus Bro | 2018 | Lecture Notes in Computer Science | pages 89--98 | doi 10.1007/978-3-319-93764-9_9
OpenAlex: ratio 1.00: Nonnegative PARAFAC2: A Flexible Coupling Approach | J<latin small letter e with acute>r<latin small letter e with acute>my E. Cohen, Rasmus Bro | 2018 | Lecture notes in computer science | pages 89--98 | doi 10.1007/978-3-319-93764-9_9 | OpenAlex W2785676486 | open access https://arxiv.org/pdf/1802.05035.pdf
Semantic Scholar: ratio 1.00: Nonnegative PARAFAC2: A Flexible Coupling Approach | Jeremy E. Cohen, R. Bro | 2018 | Latent Variable Analysis and Signal Separation | pages 89--98 | doi 10.1007/978-3-319-93764-9_9 | arXiv 1802.05035 | Semantic Scholar 4fac615c6cf7a1e915683d485e48f72767d110f2 | open access https://arxiv.org/pdf/1802.05035.pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### bueno2021representation
No DOI and no arXiv ID; url: https://proceedings.neurips.cc/paper_files/paper/2021/hash/8ea1e4f9f24c38f168d538c9cfc50a14-Abstract.html. Checked by WebFetch of the url (recorded below by the session).

### soelch2019deep
Command: python3 lookup resolve '10.1007/978-3-030-30487-4_35'
```
Crossref: ratio 1.00: On Deep Set Learning and the Choice of Aggregations | Maximilian Soelch, Adnan Akhundov, Patrick van der Smagt, Justin Bayer | 2019 | Lecture Notes in Computer Science | pages 444--457 | doi 10.1007/978-3-030-30487-4_35
OpenAlex: ratio 1.00: On Deep Set Learning and the Choice of Aggregations | Maximilian Soelch, Adnan Akhundov, Patrick van der Smagt, Justin Bayer | 2019 | Lecture notes in computer science | pages 444--457 | doi 10.1007/978-3-030-30487-4_35 | OpenAlex W2921091570 | open access https://arxiv.org/pdf/1903.07348
Semantic Scholar: ratio 1.00: On Deep Set Learning and the Choice of Aggregations | Maximilian Soelch, Adnan Akhundov, Patrick van der Smagt, Justin Bayer | 2019 | International Conference on Artificial Neural Networks | pages 444--457 | doi 10.1007/978-3-030-30487-4_35 | arXiv 1903.07348 | Semantic Scholar e71cd818b64ad5db39010969603a107b794fdcff | open access https://arxiv.org/pdf/1903.07348
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zamorski2020comparison
Command: python3 lookup resolve '10.1007/978-3-030-41964-6_43'
```
Crossref: ratio 1.00: Comparison of Aggregation Functions for 3D Point Clouds Classification | Maciej Zamorski, Maciej Zi<latin small letter e with ogonek>ba, Jerzy <latin capital letter s with acute>wi<latin small letter a with ogonek>tek | 2020 | Lecture Notes in Computer Science | pages 504--513 | doi 10.1007/978-3-030-41964-6_43
OpenAlex: ratio 1.00: Comparison of Aggregation Functions for 3D Point Clouds Classification | Maciej Zamorski, Maciej Zi<latin small letter e with ogonek>ba, Jerzy <latin capital letter s with acute>wi<latin small letter a with ogonek>tek | 2020 | Lecture notes in computer science | pages 504--513 | doi 10.1007/978-3-030-41964-6_43 | OpenAlex W3009896209
Semantic Scholar: ratio 1.00: Comparison of Aggregation Functions for 3D Point Clouds Classification | M. Zamorski, Maciej Zi<latin small letter e with cedilla>ba, J. <latin capital letter s with acute>wi<latin small letter a with ogonek>tek | 2020 | Asian Conference on Intelligent Information and Database Systems | pages 504--513 | doi 10.1007/978-3-030-41964-6_43 | Semantic Scholar 21ff26bf71cd7e613fe4a1c6bf2c908f1f58cd87
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### yu2023deep
Command: python3 lookup resolve '10.1007/s10444-023-10054-y'
```
Crossref: ratio 1.00: Deep learning theory of distribution regression with CNNs | Zhan Yu, Ding-Xuan Zhou | 2023 | Advances in Computational Mathematics | vol 49 | no 4 | doi 10.1007/s10444-023-10054-y
OpenAlex: ratio 1.00: Deep learning theory of distribution regression with CNNs | Zhan Yu, Ding<hyphen>Xuan Zhou | 2023 | Advances in Computational Mathematics | vol 49 | no 4 | doi 10.1007/s10444-023-10054-y | OpenAlex W4383549954
Semantic Scholar: ratio 1.00: Deep learning theory of distribution regression with CNNs | Zhan Yu, Ding-Xuan Zhou | 2023 | Advances in Computational Mathematics | vol 49 | pages 1--40 | doi 10.1007/s10444-023-10054-y | Semantic Scholar ead224f27dda39fe7e344772ea5a62435d5bde1c
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### hu2023overall
Command: python3 lookup resolve '10.1007/978-3-031-43993-3_29'
```
Crossref: ratio 1.00: Overall Survival Time Prediction of Glioblastoma on Preoperative MRI Using Lesion Network Mapping | Xingcan Hu, Li Xiao, Xiaoyan Sun, Feng Wu | 2023 | Lecture Notes in Computer Science | pages 298--307 | doi 10.1007/978-3-031-43993-3_29
OpenAlex: ratio 1.00: Overall Survival Time Prediction of Glioblastoma on Preoperative MRI Using Lesion Network Mapping | Xingcan Hu, Li Xiao, Xiaoyan Sun, Feng Wu | 2023 | Lecture notes in computer science | pages 298--307 | doi 10.1007/978-3-031-43993-3_29 | OpenAlex W4387210941
Semantic Scholar: ratio 1.00: Overall Survival Time Prediction of Glioblastoma on Preoperative MRI Using Lesion Network Mapping | Xing-Can Hu, Li Xiao, Xiao-Yan Sun, Feng Wu | 2023 | International Conference on Medical Image Computing and Computer-Assisted Intervention | pages 298--307 | doi 10.1007/978-3-031-43993-3_29 | Semantic Scholar 286de6740188df4e1bfece1eefbe44f1ab500d8d
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### liu2025lesion
Command: python3 lookup resolve '10.1007/978-3-032-05182-0_29'
```
Crossref: ratio 1.00: Lesion-Centered Vision Transformer for Stroke Outcome Prediction from Image and Clinical Data | Mingtian Liu, Nima Hatami, Laura Mechtouff, Tae-Hee Cho, Carole Lartizien, Carole Frindel | 2025 | Lecture Notes in Computer Science | pages 291--301 | doi 10.1007/978-3-032-05182-0_29
OpenAlex: ratio 1.00: Lesion-Centered Vision Transformer for Stroke Outcome Prediction from Image and Clinical Data | Mingtian Liu, Nima Hatami, Laura Mechtouff, Tae<hyphen>Hee Cho, Carole Lartizien, Carole Frindel | 2025 | Lecture notes in computer science | vol 15974 | pages 291--301 | doi 10.1007/978-3-032-05182-0_29 | OpenAlex W4414370831 | open access https://hal.science/hal-05303811v1/document
Semantic Scholar: ratio 1.00: Lesion-Centered Vision Transformer for Stroke Outcome Prediction from Image and Clinical Data | Mingtian Liu, Nima Hatami, L. Mechtouff, T. Cho, C. Lartizien, C. Frindel | 2025 | International Conference on Medical Image Computing and Computer-Assisted Intervention | pages 291--301 | doi 10.1007/978-3-032-05182-0_29 | Semantic Scholar 08527a55983dd62d0e0f2809b76ccfd6275fb9f1 | open access https://hal.science/hal-05303811v1/document
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### chauvin2019analyzing
Command: python3 lookup resolve '10.1007/978-3-030-20351-1_4'
```
Crossref: ratio 1.00: Analyzing Brain Morphology on the Bag-of-Features Manifold | Laurent Chauvin, Kuldeep Kumar, Christian Desrosiers, Jacques De Guise, William Wells, Matthew Toews | 2019 | Lecture Notes in Computer Science | pages 45--56 | doi 10.1007/978-3-030-20351-1_4
OpenAlex: ratio 1.00: Analyzing Brain Morphology on the Bag-of-Features Manifold | Laurent Chauvin, Kuldeep Kumar, Christian Desrosiers, Jacques A. de Guise, William M. Wells, Matthew Toews | 2019 | Lecture notes in computer science | pages 45--56 | doi 10.1007/978-3-030-20351-1_4 | OpenAlex W2946059286
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### gopinath2019adaptive
Command: python3 lookup resolve '10.1007/978-3-030-20351-1_7'
```
Crossref: ratio 1.00: Adaptive Graph Convolution Pooling for Brain Surface Analysis | Karthik Gopinath, Christian Desrosiers, Herve Lombaert | 2019 | Lecture Notes in Computer Science | pages 86--98 | doi 10.1007/978-3-030-20351-1_7
OpenAlex: ratio 1.00: Adaptive Graph Convolution Pooling for Brain Surface Analysis | Karthik Kuduva Gopinath, Christian Desrosiers, Herv<latin small letter e with acute> Lombaert | 2019 | Lecture notes in computer science | pages 86--98 | doi 10.1007/978-3-030-20351-1_7 | OpenAlex W2946157752
Semantic Scholar: ratio 1.00: Adaptive Graph Convolution Pooling for Brain Surface Analysis | K. Gopinath, C. Desrosiers, H. Lombaert | 2019 | Information Processing in Medical Imaging | pages 86--98 | doi 10.1007/978-3-030-20351-1_7 | Semantic Scholar d2503369c70d8e71307be07b7867643e2bac834c
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### wang2023bingo
Command: python3 lookup resolve '10.1007/978-3-031-34048-2_25'
```
Crossref: ratio 1.00: BInGo: Bayesian Intrinsic Groupwise Registration via Explicit Hierarchical Disentanglement | Xin Wang, Xinzhe Luo, Xiahai Zhuang | 2023 | Lecture Notes in Computer Science | pages 319--331 | doi 10.1007/978-3-031-34048-2_25
OpenAlex: ratio 1.00: BInGo: Bayesian Intrinsic Groupwise Registration via Explicit Hierarchical Disentanglement | Xin Wang, Xinzhe Luo, Xiahai Zhuang | 2023 | Lecture notes in computer science | pages 319--331 | doi 10.1007/978-3-031-34048-2_25 | OpenAlex W4379660264 | open access https://arxiv.org/pdf/2206.02377
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### dietterich1997solving
Command: python3 lookup resolve '10.1016/s0004-3702(96)00034-3'
```
Crossref: ratio 1.00: Solving the multiple instance problem with axis-parallel rectangles | Thomas G. Dietterich, Richard H. Lathrop, Tom<latin small letter a with acute>s Lozano-P<latin small letter e with acute>rez | 1997 | Artificial Intelligence | vol 89 | no 1-2 | pages 31--71 | doi 10.1016/s0004-3702(96)00034-3
OpenAlex: ratio 1.00: Solving the multiple instance problem with axis-parallel rectangles | Thomas G. Dietterich, Richard H. Lathrop, Tom<latin small letter a with acute>s Lozano<hyphen>P<latin small letter e with acute>rez | 1997 | Artificial Intelligence | vol 89 | no 1-2 | pages 31--71 | doi 10.1016/s0004-3702(96)00034-3 | OpenAlex W2110119381 | open access https://www.sciencedirect.com/science/article/pii/S0004370296000343/pdf
Semantic Scholar: ratio 1.00: Solving the Multiple Instance Problem with Axis-Parallel Rectangles | Thomas G. Dietterich, R. Lathrop, Tomas Lozano-Perez | 1997 | Artificial Intelligence | vol 89 | pages 31--71 | doi 10.1016/S0004-3702(96)00034-3 | Semantic Scholar 1c7d38f68fe1150895a186e30b60c02dd89a676a | open access https://www.sciencedirect.com/science/article/pii/S0004370296000343/pdf
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### shakeri2016deep
Command: python3 lookup resolve '10.1007/978-3-319-51237-2_2'
```
Crossref: ratio 1.00: Deep Spectral-Based Shape Features for Alzheimer<right single quotation mark>s Disease Classification | for the Alzheimer<right single quotation mark>s Disease Neuroimaging Initiative, Mahsa Shakeri, Herve Lombaert, Shashank Tripathi, Samuel Kadoury | 2016 | Lecture Notes in Computer Science | pages 15--24 | doi 10.1007/978-3-319-51237-2_2
OpenAlex: ratio 1.00: Deep Spectral-Based Shape Features for Alzheimer<right single quotation mark>s Disease Classification | Alzheimer<right single quotation mark>s Disease Neuroimaging Initiative, Mahsa Shakeri, Herv<latin small letter e with acute> Lombaert, Shashank Tripathi, Samuel Kadoury | 2016 | Lecture notes in computer science | pages 15--24 | doi 10.1007/978-3-319-51237-2_2 | OpenAlex W2560108548
Semantic Scholar: ratio 1.00: Deep Spectral-Based Shape Features for Alzheimer's Disease Classification | Mahsa Shakeri, H. Lombaert, Shashank Tripathi, S. Kadoury | 2016 | SeSAMI@MICCAI | pages 15--24 | doi 10.1007/978-3-319-51237-2_2 | Semantic Scholar 33b37fec2091aeb2746e8bc8c07c107c8fdc9838
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### devries2025interpretable
Command: python3 lookup resolve '10.1109/iccv51701.2025.02062'
```
Crossref: ratio 1.00: Interpretable Point Cloud Classification Using Multiple Instance Learning | Matt De Vries, Reed Naidoo, Olga Fourkioti, Lucas G Dent, Nathan Curry, Chris Dunsby, Chris Bakal | 2025 | 2025 IEEE/CVF International Conference on Computer Vision (ICCV) | pages 22209--22220 | doi 10.1109/iccv51701.2025.02062
OpenAlex: ratio 1.00: Interpretable Point Cloud Classification Using Multiple Instance Learning | Matt De Vries, Reed Naidoo, Olga Fourkioti, Lucas Dent, Nathan Curry, Christopher W. Dunsby, Chris Bakal | 2025 | IEEE/CVF International Conference on Computer Vision (ICCV) | pages 22209--22220 | doi 10.1109/iccv51701.2025.02062 | OpenAlex W7160105336
Semantic Scholar: ratio 1.00: Interpretable Point Cloud Classification Using Multiple Instance Learning | Matt De Vries, Reed Naidoo, Olga Fourkioti, Lucas G. Dent, Nathan Curry, C. Dunsby, C. Bakal | 2025 | IEEE International Conference on Computer Vision | pages 22209--22220 | doi 10.1109/ICCV51701.2025.02062 | Semantic Scholar 9acb96cbb2582a8481eba3b98d3571e2f043b5e9
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### iporrerivas2026benchmarking
Command: python3 lookup resolve '10.1007/978-3-032-37679-4_28'
```
Crossref: ratio 1.00: Benchmarking Geometric Deep Learning for Hippocampal Shape Analysis | Ariel Iporre-Rivas, Nico Scherf, Gerik Scheuermann, Christofer Meinecke | 2026 | Lecture Notes in Computer Science | pages 494--511 | doi 10.1007/978-3-032-37679-4_28
OpenAlex: ratio 1.00: Benchmarking Geometric Deep Learning for Hippocampal Shape Analysis | Ariel Iporre-Rivas, Nico Scherf, Gerik Scheuermann, Christofer Meinecke | 2026 | Lecture notes in computer science | pages 494--511 | doi 10.1007/978-3-032-37679-4_28 | OpenAlex W7222799108
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

### zhang2026deep
Command: python3 lookup resolve '10.2139/ssrn.7135982'
```
Crossref: ratio 1.00: Deep Learning with Multiple Instance Learning Aids Cervical Lymph Node Detection and Metastasis Prediction in Laryngeal Cancer on Contrast-Enhanced CT | Qian Zhang, Yuming Qiao, Shiwen Li, Wencan Wang, Xinyu Li, Wenfeng Wei, Huajie Yue, Qi Zhang, Qiaojun Qu, Lingqian Zhang, Bin Wang, Jianxin Zhang, Zengyu Jiang, Hua Zhang, Lingjie Wang | 2026 | doi 10.2139/ssrn.7135982
OpenAlex: ratio 1.00: Deep Learning with Multiple Instance Learning Aids Cervical Lymph Node Detection and Metastasis Prediction in Laryngeal Cancer on Contrast-Enhanced CT | Qian Zhang, Yuming Qiao, <cjk unified ideograph-674e><cjk unified ideograph-4e16><cjk unified ideograph-6587>, Wencan Wang, Xinyu Li, Wenfeng Wei, Huajie Yue, Qi Zhang, Qiaojun Qu, Lingqian Zhang, Bin Wang, Jianxin Zhang, Zengyu Jiang, Hua Zhang, Lingjie Wang | 2026 | SSRN Electronic Journal | doi 10.2139/ssrn.7135982 | OpenAlex W7170175242 | open access https://doi.org/10.2139/ssrn.7135982
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
```
Exit status: 0

## Item 4 checks after the merge run's send-back (2026-11-20)

These run on the rewritten `review.md` and `refs.bib`. `refs.bib` did not change after the identifier check above: `cmp refs.bib` against the copy taken before that check printed nothing.

- `grep -c '^@' refs.bib`: 303.
- `LC_ALL=C grep -n '[^ -~]' review.md refs.bib`: nothing printed, exit status 1.
- Duplicate DOIs and eprints (`grep -i -E '^[[:space:]]*(doi|eprint)[[:space:]]*=' refs.bib | ... | sort | uniq -d`): nothing printed.
- Titles: `awk -f titles.awk refs.bib | wc -l` gives 303. The duplicate title check (titles normalised to lowercase letters and digits, then `sort | uniq -d`) printed nothing.
- Duplicate keys (`grep '^@' refs.bib | ... | sort | uniq -d`): nothing printed.
- Key set: `comm -3` of the keys cited in the brackets of `review.md` against the keys of `refs.bib` printed nothing. 303 keys are cited.
- Key form (`grep -v -E '^[a-z]+[0-9]{4}[a-z0-9]*$'` on the bib keys): nothing printed.
- Every entry holds a doi, an eprint or a url: the awk check printed nothing.
- Identifier check: the section "Identifier check: merged refs.bib after the send-back" above holds 303 entries. The 296 with a DOI or an arXiv ID all ended with exit status 0, and each has at least one source at ratio 1.00 (`awk` over the section printed only the seven url entries). Six of the seven url entries had their url checks earlier in this file: harshman1972parafac2, peyre2016gromov, naderializadeh2021pooling, maron1997framework, kusner2015word and wiers2026geometry.
- url check, bueno2021representation: the web-fetch subagent read https://proceedings.neurips.cc/paper_files/paper/2021/hash/8ea1e4f9f24c38f168d538c9cfc50a14-Abstract.html with HTTP 200. The page gives the title "On the Representation Power of Set Pooling Networks", the authors Christian Bueno and Alan Hylton, and "Advances in Neural Information Processing Systems 34 (NeurIPS 2021)". All three match the entry. Pass.
- Records whose title differs from the entry, among the new resolve results. afshar2020taste: Crossref gives "TASTE" (the rest of the title is in its subtitle field), while OpenAlex and Semantic Scholar give the full title the entry now carries. The lookup reports these two as DOI_MISMATCH at ratio 0.11. The DOI 10.1145/3368555.3384464 resolves at Crossref, so the identifier passes. The other ratios below 1.00 are case or punctuation variants of the same titles (kiers1999parafac2, cuturi2013sinkhorn, rioux2024entropic, mialon2021trainable, dadashkarimi2023cross, shao2021transmil, bloemreddy2020probabilistic, saha2018breast), or a Semantic Scholar record of another version (peyre2019computational, lee2019set). For each of them Crossref, or arXiv for an arXiv ID, matches at ratio 1.00.
- Annotation headings against the entry titles. The headings of the Annotated Bibliography (the text after "(year). ") were compared with the `refs.bib` titles, normalised to lowercase letters and digits. Three headings were short (afshar2020taste, choi2026tumor, francischello2026influence), and the merge run corrected them. The comparison run again: 303 headings, none differing.
- Exclusions read: the Excluded and Dropped Sources section of `review.md` (line 5832 on) gives a ground for each exclusion. Three exclusions rest on no abstract or text being readable: SCREAM (doi 10.1016/j.chemolab.2013.09.012), the Engineering Applications of AI 2026 paper and the Information Fusion 2026 paper. Each lists the routes tried and their results (query table rows A-PM, A-ELS, A-WEB, A-KU). No exclusion rests on an identifier that failed to resolve.
- The Synthesis Analysis (lines 5668 to 5807 of `review.md`) counts 7,737 words by `wc -w`, within the 9,000-word bound of the Length row.

Under strict DOI checking, no identifier fails.
