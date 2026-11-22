# Checks

## Steps 12, before the citation compliance agent: cite-keys

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' cite-keys '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/main.tex' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib'

exit status: 0
```

## Steps 12, before the citation compliance agent: check-urls

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' check-urls '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/main.tex' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib'
sslclustering2025: 200 https://doi.org/10.48550/arXiv.2501.18452, ratio 1.00 against OpenAlex
lookingbeyond2026: 200 https://doi.org/10.48550/arXiv.2601.21830, ratio 1.00 against OpenAlex
hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH
dechazal2004: 202 https://doi.org/10.1109/TBME.2004.827359, ratio 1.00 against Crossref
mitbih2001: 202 https://doi.org/10.1109/51.932724, ratio 1.00 against Crossref
wavelettensorecg2018: 200 https://doi.org/10.1016/j.knosys.2018.09.001, ratio 1.00 against Crossref
clocs2021: no identifier
threekg2021: no identifier
mehari2022ssl: 200 https://doi.org/10.1016/j.compbiomed.2021.105114, ratio 1.00 against Crossref
hubertecg2024: 200 https://doi.org/10.1101/2024.11.14.24317328, ratio 0.98 against Crossref
ecgfounder2024: 200 https://doi.org/10.48550/arXiv.2410.04133, ratio 0.75 against OpenAlex
hubertarabie1985: 200 https://doi.org/10.1007/BF01908075, ratio 1.00 against Crossref
vinh2010: no identifier
rousseeuw1987: 200 https://doi.org/10.1016/0377-0427(87)90125-7, ratio 1.00 against Crossref
ptbxl2020: 200 https://doi.org/10.1038/s41597-020-0495-6, ratio 1.00 against Crossref
physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH
neurokit2021: 200 https://doi.org/10.3758/s13428-020-01516-y, ratio 1.00 against Crossref
clifford2017af: 200 https://doi.org/10.22489/CinC.2017.065-469, ratio 1.00 against Crossref
sklearn2011: no identifier
hdbscan2013: 404 https://doi.org/10.1007/978-3-642-37456-2%5C_14, doi not found in Crossref, OpenAlex or Semantic Scholar
fedavg2017: no identifier
exit status: 1
```

## Steps 12, after the citation compliance patches

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' cite-keys '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/main.tex' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib'

exit status: 0
```

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' check-urls '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/main.tex' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib'
sslclustering2025: 200 https://doi.org/10.48550/arXiv.2501.18452, ratio 1.00 against OpenAlex
lookingbeyond2026: 200 https://doi.org/10.48550/arXiv.2601.21830, ratio 1.00 against OpenAlex
hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH
dechazal2004: 202 https://doi.org/10.1109/TBME.2004.827359, ratio 1.00 against Crossref
mitbih2001: 202 https://doi.org/10.1109/51.932724, ratio 1.00 against Crossref
wavelettensorecg2018: 200 https://doi.org/10.1016/j.knosys.2018.09.001, ratio 1.00 against Crossref
clocs2021: no identifier
threekg2021: no identifier
mehari2022ssl: 200 https://doi.org/10.1016/j.compbiomed.2021.105114, ratio 1.00 against Crossref
hubertecg2024: 403 https://doi.org/10.1101/2024.11.14.24317328, ratio 0.98 against Crossref
ecgfounder2024: 200 https://doi.org/10.48550/arXiv.2410.04133, ratio 0.75 against OpenAlex
hubertarabie1985: 200 https://doi.org/10.1007/BF01908075, ratio 1.00 against Crossref
vinh2010: no identifier
rousseeuw1987: 200 https://doi.org/10.1016/0377-0427(87)90125-7, ratio 1.00 against Crossref
ptbxl2020: 200 https://doi.org/10.1038/s41597-020-0495-6, ratio 1.00 against Crossref
physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH
neurokit2021: 200 https://doi.org/10.3758/s13428-020-01516-y, ratio 1.00 against Crossref
clifford2017af: 200 https://doi.org/10.22489/CinC.2017.065-469, ratio 1.00 against Crossref
sklearn2011: no identifier
hdbscan2013: 200 https://doi.org/10.1007/978-3-642-37456-2_14, ratio 1.00 against Crossref
fedavg2017: no identifier
exit status: 1
```

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' quote-check '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/paper-runs/revision-2026-11-15/citation-report.md' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib' '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/tmp.vgIN3Lla7l'
line 213: sslclustering2025, sec. 3: found
line 214: sslclustering2025, sec. 3: found
line 215: lookingbeyond2026, sec. 3.2: found
line 216: lookingbeyond2026, sec. 3: found
line 217: lookingbeyond2026, sec. 3.1: found
line 218: lookingbeyond2026, sec. 3.4: found
line 219: lookingbeyond2026, sec. 3.4: found
line 220: lookingbeyond2026, sec. 4: found
line 221: lookingbeyond2026, sec. 2: found
line 222: lookingbeyond2026, sec. 6: found
line 223: lookingbeyond2026, sec. 5: found
line 224: ptbxl2020, p. 1: found
line 225: ptbxl2020, Methods: found
line 226: ptbxl2020, ref. 5: found
line 227: clocs2021, p. 1: found
line 228: threekg2021, sec. 1: found
line 229: mehari2022ssl, sec. 1: found
line 230: hubertecg2024, p. 1: found
line 231: hubertecg2024, Methods: found
line 232: hubertecg2024, architecture table, BASE: found
line 233: hubertecg2024, Supplementary Information: found
line 234: hubertecg2024, Code availability: found
line 235: ecgfounder2024, summary, Methods: found
line 236: ecgfounder2024, Methods: found
line 237: ecgfounder2024, Methods: found
line 238: ecgfounder2024, Methods: found
line 239: ecgfounder2024, Supplement: found
line 240: ecgfounder2024, Supplement S7: found
line 241: neurokit2021, p. 1691: found
line 242: neurokit2021, table 1: found
line 243: clifford2017af, sec. 1: found
line 244: clifford2017af, p. 1: found
line 245: sklearn2011, p. 2825: found
line 246: fedavg2017, sec. 2: found
exit status: 0
```

## Steps 12, after the second citation compliance start (no patch written)

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' cite-keys '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/main.tex' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib'

exit status: 0
```

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' check-urls '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/main.tex' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib'
sslclustering2025: 200 https://doi.org/10.48550/arXiv.2501.18452, ratio 1.00 against OpenAlex
lookingbeyond2026: 200 https://doi.org/10.48550/arXiv.2601.21830, ratio 1.00 against OpenAlex
hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH
dechazal2004: 202 https://doi.org/10.1109/TBME.2004.827359, ratio 1.00 against Crossref
mitbih2001: 202 https://doi.org/10.1109/51.932724, ratio 1.00 against Crossref
wavelettensorecg2018: 200 https://doi.org/10.1016/j.knosys.2018.09.001, ratio 1.00 against Crossref
clocs2021: no identifier
threekg2021: no identifier
mehari2022ssl: 200 https://doi.org/10.1016/j.compbiomed.2021.105114, ratio 1.00 against Crossref
hubertecg2024: 403 https://doi.org/10.1101/2024.11.14.24317328, ratio 0.98 against Crossref
ecgfounder2024: 200 https://doi.org/10.48550/arXiv.2410.04133, ratio 0.75 against OpenAlex
hubertarabie1985: 200 https://doi.org/10.1007/BF01908075, ratio 1.00 against Crossref
vinh2010: no identifier
rousseeuw1987: 200 https://doi.org/10.1016/0377-0427(87)90125-7, ratio 1.00 against Crossref
ptbxl2020: 200 https://doi.org/10.1038/s41597-020-0495-6, ratio 1.00 against Crossref
physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH
neurokit2021: 200 https://doi.org/10.3758/s13428-020-01516-y, ratio 1.00 against Crossref
clifford2017af: 200 https://doi.org/10.22489/CinC.2017.065-469, ratio 1.00 against Crossref
sklearn2011: no identifier
hdbscan2013: 200 https://doi.org/10.1007/978-3-642-37456-2_14, ratio 1.00 against Crossref
fedavg2017: no identifier
exit status: 1
```

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' quote-check '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/paper-runs/revision-2026-11-15/citation-report.md' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib' '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/tmp.vgIN3Lla7l'
line 244: clifford2017af, p. 1: found
line 245: sklearn2011, p. 2825: found
line 246: fedavg2017, sec. 2: found
exit status: 0
```

## Item 8, reference checks after the draft writer's pass on reading 1

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' cite-keys '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/main.tex' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib'

exit status: 0
```

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' check-urls '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/main.tex' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib'
sslclustering2025: 200 https://doi.org/10.48550/arXiv.2501.18452, ratio 1.00 against OpenAlex
lookingbeyond2026: 200 https://doi.org/10.48550/arXiv.2601.21830, ratio 1.00 against OpenAlex
hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH
dechazal2004: 202 https://doi.org/10.1109/TBME.2004.827359, ratio 1.00 against Crossref
mitbih2001: 202 https://doi.org/10.1109/51.932724, ratio 1.00 against Crossref
wavelettensorecg2018: 200 https://doi.org/10.1016/j.knosys.2018.09.001, ratio 1.00 against Crossref
clocs2021: no identifier
threekg2021: no identifier
mehari2022ssl: 200 https://doi.org/10.1016/j.compbiomed.2021.105114, ratio 1.00 against Crossref
hubertecg2024: 403 https://doi.org/10.1101/2024.11.14.24317328, ratio 0.98 against Crossref
ecgfounder2024: 200 https://doi.org/10.48550/arXiv.2410.04133, ratio 0.75 against OpenAlex
hubertarabie1985: 200 https://doi.org/10.1007/BF01908075, ratio 1.00 against Crossref
vinh2010: no identifier
rousseeuw1987: 200 https://doi.org/10.1016/0377-0427(87)90125-7, ratio 1.00 against Crossref
ptbxl2020: 200 https://doi.org/10.1038/s41597-020-0495-6, ratio 1.00 against Crossref
physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH
neurokit2021: 200 https://doi.org/10.3758/s13428-020-01516-y, ratio 1.00 against Crossref
clifford2017af: 200 https://doi.org/10.22489/CinC.2017.065-469, ratio 1.00 against Crossref
sklearn2011: no identifier
hdbscan2013: 200 https://doi.org/10.1007/978-3-642-37456-2_14, ratio 1.00 against Crossref
fedavg2017: no identifier
exit status: 1
```

## Item 9, reference checks after the reference fix (patch 09)

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' cite-keys '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/main.tex' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib'

exit status: 0
```

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' check-urls '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/main.tex' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib'
sslclustering2025: 200 https://doi.org/10.48550/arXiv.2501.18452, ratio 1.00 against OpenAlex
lookingbeyond2026: 200 https://doi.org/10.48550/arXiv.2601.21830, ratio 1.00 against OpenAlex
hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH
dechazal2004: 202 https://doi.org/10.1109/TBME.2004.827359, ratio 1.00 against Crossref
mitbih2001: 202 https://doi.org/10.1109/51.932724, ratio 1.00 against Crossref
wavelettensorecg2018: 200 https://doi.org/10.1016/j.knosys.2018.09.001, ratio 1.00 against Crossref
clocs2021: no identifier
threekg2021: 200 https://arxiv.org/abs/2106.04452
mehari2022ssl: 200 https://doi.org/10.1016/j.compbiomed.2021.105114, ratio 1.00 against Crossref
hubertecg2024: 403 https://doi.org/10.1101/2024.11.14.24317328, ratio 0.98 against Crossref
ecgfounder2024: 200 https://doi.org/10.48550/arXiv.2410.04133, ratio 0.75 against OpenAlex
hubertarabie1985: 200 https://doi.org/10.1007/BF01908075, ratio 1.00 against Crossref
vinh2010: no identifier
rousseeuw1987: 200 https://doi.org/10.1016/0377-0427(87)90125-7, ratio 1.00 against Crossref
ptbxl2020: 200 https://doi.org/10.1038/s41597-020-0495-6, ratio 1.00 against Crossref
physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH
neurokit2021: 200 https://doi.org/10.3758/s13428-020-01516-y, ratio 1.00 against Crossref
clifford2017af: 200 https://doi.org/10.22489/CinC.2017.065-469, ratio 1.00 against Crossref
sklearn2011: 200 https://arxiv.org/abs/1201.0490
hdbscan2013: 200 https://doi.org/10.1007/978-3-642-37456-2_14, ratio 1.00 against Crossref
fedavg2017: no identifier
exit status: 1
```

## Mark-only: failures left after the reference fix

Left failing and named in the final message: hrvstandards1996 (403, DOI_MISMATCH), hubertecg2024 (403), physionet2000 (403, DOI_MISMATCH), clocs2021, vinh2010 and fedavg2017 (no identifier). The citation compliance agent and the reference fix found the three DOIs confirmed by Crossref, OpenAlex and Semantic Scholar.

## Compile 1 (Steps 11, item 10), in a copy, pdfLaTeX

```
latexmk -pdf -interaction=nonstopmode -halt-on-error 'main.tex'
exit status: 0
Overfull \hbox (4.05612pt too wide) in paragraph at lines 160--162
[]\T1/cmr/m/n/10.95 A gen-er-al-iza-tion check on a MIT-BIH beat-morphology tas
k, the dataset
 []
--
Overfull \hbox (0.50807pt too wide) in paragraph at lines 231--242
\T1/cmr/m/n/10.95 [[], []]. []Each[] [][][]an[]-[]no[]-[]tated[] [][][]beat[] [
][][]was[] [][][]seg[]-[]mented[] [][][]into[] [][][]a[] [][][]win[]-[]dow[] []
[][]of[] [][][][]ms[]
--
Overfull \hbox (5.43839pt too wide) in paragraph at lines 247--255
[]\T1/cmr/bx/n/10.95 Raw flat-ten-ing \T1/cmr/m/n/10.95 re-pro-duces the orig-i
-nal pipeline: each lead []was moving-
 []
--
Overfull \hbox (83.58578pt too wide) in paragraph at lines 480--491
 [][] 
 []

--
Overfull \hbox (29.06076pt too wide) in paragraph at lines 678--687
 [][] 
 []

--
Overfull \hbox (14.59796pt too wide) in paragraph at lines 728--738
 [][] 
 []

--
Overfull \hbox (4.77765pt too wide) in paragraph at lines 829--831
[]\T1/cmr/m/n/10.95 A sec-ond dataset and a sec-ond task type, the MIT-BIH beat
-morphology
 []
--
Overfull \hbox (2.9114pt too wide) in paragraph at lines 903--904
[][][]\T1/cmr/m/n/10.95 across[] [][][]rep[]-[]re[]-[]sen[]-[]ta[]-[]tions[] []
[][]ex[]-[]ceeded[] [][][]the[] [][][]spread[] [][][]across[] [][][]clus[]-[]te
r[]-[]ing[] [][][]al[]-[]go[]-[]rithms[] [][][]within[]
```

## Compile 2 (after compile-fix, patch 11), in a new copy, pdfLaTeX

```
latexmk -pdf -interaction=nonstopmode -halt-on-error 'main.tex'
latexmk exit 0
Overfull \hbox (2.9114pt too wide) in paragraph at lines 907--908
[][][]\T1/cmr/m/n/10.95 across[] [][][]rep[]-[]re[]-[]sen[]-[]ta[]-[]tions[] []
[][]ex[]-[]ceeded[] [][][]the[] [][][]spread[] [][][]across[] [][][]clus[]-[]te
r[]-[]ing[] [][][]al[]-[]go[]-[]rithms[] [][][]within
```

## Compile 3 (Steps 13, after the findings pass, patch 12), in a new temporary folder, pdfLaTeX

```
latexmk -pdf -interaction=nonstopmode -halt-on-error 'main.tex'
latexmk exit 0
Overfull \hbox (3.51573pt too wide) in paragraph at lines 167--170
[][][]\T1/cmr/m/n/10.95 and[] [][][]we[] [][][]credit[] [][][]the[] [][][]sep[]
-[]a[]-[]ra[]-[]bil[]-[]ity[]-[]ver[]-[]sus[]-[]clus[]-[]ter[]-[]abil[]-[]ity[]
 [][][]phe[]-[]nomenon[] [][][]to[] [][][]prior[] [][][]work. 
--
Overfull \hbox (0.53654pt too wide) in paragraph at lines 867--868
[][][]\T1/cmr/m/n/10.95 rather[] [][][]than[] [][][]by[] [][][]sur[]-[]vey.[] [
][][]Hu[]-[]BERT[]-[]ECG[] [][][]and[] [][][]ECG[]-[]Founder[] [][][]both[] [][
][]pub[]-[]lish[] [][][]weights[]
--
Overfull \hbox (2.9114pt too wide) in paragraph at lines 927--928
[][][]\T1/cmr/m/n/10.95 across[] [][][]rep[]-[]re[]-[]sen[]-[]ta[]-[]tions[] []
[][]ex[]-[]ceeded[] [][][]the[] [][][]spread[] [][][]across[] [][][]clus[]-[]te
r[]-[]ing[] [][][]al[]-[]go[]-[]rithms[] [][][]within
```

## Reference checks after the findings pass

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' cite-keys '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/main.tex' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib'

exit status: 0
```

```
python3 '/Users/axelfaes/.claude/skills/paper/templates/lookup.py' check-urls '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/main.tex' '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/manuscript/refs.bib'
sslclustering2025: 200 https://doi.org/10.48550/arXiv.2501.18452, ratio 1.00 against OpenAlex
lookingbeyond2026: 200 https://doi.org/10.48550/arXiv.2601.21830, ratio 1.00 against OpenAlex
hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH
dechazal2004: 202 https://doi.org/10.1109/TBME.2004.827359, ratio 1.00 against Crossref
mitbih2001: 202 https://doi.org/10.1109/51.932724, ratio 1.00 against Crossref
wavelettensorecg2018: 200 https://doi.org/10.1016/j.knosys.2018.09.001, ratio 1.00 against Crossref
clocs2021: no identifier
threekg2021: 200 https://arxiv.org/abs/2106.04452
mehari2022ssl: 200 https://doi.org/10.1016/j.compbiomed.2021.105114, ratio 1.00 against Crossref
hubertecg2024: 403 https://doi.org/10.1101/2024.11.14.24317328, ratio 0.98 against Crossref
ecgfounder2024: 200 https://doi.org/10.48550/arXiv.2410.04133, ratio 0.75 against OpenAlex
hubertarabie1985: 200 https://doi.org/10.1007/BF01908075, ratio 1.00 against Crossref
vinh2010: no identifier
rousseeuw1987: 200 https://doi.org/10.1016/0377-0427(87)90125-7, ratio 1.00 against Crossref
ptbxl2020: 200 https://doi.org/10.1038/s41597-020-0495-6, ratio 1.00 against Crossref
physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH
neurokit2021: 200 https://doi.org/10.3758/s13428-020-01516-y, ratio 1.00 against Crossref
clifford2017af: 200 https://doi.org/10.22489/CinC.2017.065-469, ratio 1.00 against Crossref
sklearn2011: 200 https://arxiv.org/abs/1201.0490
hdbscan2013: 200 https://doi.org/10.1007/978-3-642-37456-2_14, ratio 1.00 against Crossref
fedavg2017: no identifier
exit status: 1
```

