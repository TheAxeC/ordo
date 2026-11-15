# Checks

## Run 1, before the citation compliance agent

Command: `python3 /Users/axelfaes/.claude/skills/paper/templates/lookup.py cite-keys /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/main.tex /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/refs.bib`

Exit status: 0

Output: (none)

Command: `python3 /Users/axelfaes/.claude/skills/paper/templates/lookup.py check-urls /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/main.tex /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/refs.bib`

Exit status: 1

Output:

```
sslclustering2025: 200 https://doi.org/10.48550/arXiv.2501.18452, ratio 1.00 against OpenAlex
lookingbeyond2026: 200 https://doi.org/10.48550/arXiv.2601.21830, ratio 1.00 against OpenAlex
hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH
dechazal2004: 202 https://doi.org/10.1109/TBME.2004.827359, ratio 1.00 against Crossref
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
mitbih2001: 202 https://doi.org/10.1109/51.932724, ratio 1.00 against Crossref
physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH
neurokit2021: 200 https://doi.org/10.3758/s13428-020-01516-y, ratio 1.00 against Crossref
clifford2017af: 200 https://doi.org/10.22489/CinC.2017.065-469, ratio 1.00 against Crossref
sklearn2011: no identifier
hdbscan2013: 404 https://doi.org/10.1007/978-3-642-37456-2%5C_14, doi not found in Crossref, OpenAlex or Semantic Scholar
fedavg2017: no identifier
```

## Patch 02 applied to refs.bib

Check-only exit 0; apply exit 0; `cmp patches/02-refs.bib.patched refs.bib` exit 0; `shasum -a 256 refs.bib` = 77e06786afc4128b15cb0d7756181228a25d29dd1f17c37d3e3ddebe49f9b0d2, equal to output_sha256 of the apply report. Structural flags: none.

## Run 2, after the patches

Command: `python3 /Users/axelfaes/.claude/skills/paper/templates/lookup.py cite-keys /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/main.tex /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/refs.bib`

Exit status: 0

Output: (none)

Command: `python3 /Users/axelfaes/.claude/skills/paper/templates/lookup.py check-urls /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/main.tex /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/refs.bib`

Exit status: 1

Output:

```
sslclustering2025: 200 https://doi.org/10.48550/arXiv.2501.18452, ratio 1.00 against OpenAlex
lookingbeyond2026: 200 https://doi.org/10.48550/arXiv.2601.21830, ratio 1.00 against OpenAlex
hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH
dechazal2004: 202 https://doi.org/10.1109/TBME.2004.827359, ratio 1.00 against Crossref
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
mitbih2001: 202 https://doi.org/10.1109/51.932724, ratio 1.00 against Crossref
physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH
neurokit2021: 200 https://doi.org/10.3758/s13428-020-01516-y, ratio 1.00 against Crossref
clifford2017af: 200 https://doi.org/10.22489/CinC.2017.065-469, ratio 1.00 against Crossref
sklearn2011: no identifier
hdbscan2013: 200 https://doi.org/10.1007/978-3-642-37456-2_14, ratio 1.00 against Crossref
fedavg2017: no identifier
```

Command: `python3 /Users/axelfaes/.claude/skills/paper/templates/lookup.py quote-check /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/paper-runs/citation-check-2026-11-15/citation-report.md /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/refs.bib /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/tmp.kMUBjIXI1n`

Exit status: 0

Output:

```
line 158: sslclustering2025, section 3: found
line 159: sslclustering2025, section 3: found
line 160: lookingbeyond2026, section 2: found
line 161: lookingbeyond2026, section 3.1: found
line 162: lookingbeyond2026, section 3.2: found
line 163: lookingbeyond2026, section 3.4: found
line 164: lookingbeyond2026, section 5, table 4: found
line 165: lookingbeyond2026, section 6: found
line 166: lookingbeyond2026, section 5: found
line 167: dechazal2004, abstract: found
line 168: wavelettensorecg2018, abstract: found
line 169: clocs2021, full text, abstract section: found
line 170: threekg2021, full text, abstract section: found
line 171: mehari2022ssl, section II-B2: found
line 172: mehari2022ssl, abstract: found
line 173: hubertecg2024, full text, abstract section: found
line 174: hubertecg2024, supplementary information, analysis of pre-training choices: found
line 175: hubertecg2024, methods, self-supervised pre-training: found
line 176: hubertecg2024, methods, model architecture: found
line 177: hubertecg2024, supplementary table of model configurations, BASE column: found
line 178: ecgfounder2024, abstract, methods: found
line 179: ecgfounder2024, methods, fine-tuning: found
line 180: ecgfounder2024, supplementary S3.1: found
line 181: ecgfounder2024, supplementary S3.1: found
line 182: ecgfounder2024, introduction: found
line 183: vinh2010, abstract: found
line 184: vinh2010, abstract: found
line 185: rousseeuw1987, abstract: found
line 186: ptbxl2020, background and summary: found
line 187: ptbxl2020, references, item 5: found
line 188: mitbih2001, abstract: found
line 189: physionet2000, abstract: found
line 190: neurokit2021, high-level wrappers for processing and analysis: found
line 191: clifford2017af, introduction: found
line 192: clifford2017af, introduction: found
line 193: sklearn2011, section 5: found
line 194: fedavg2017, section 2: found
line 195: fedavg2017, section 2: found
```

Failing lines of run 2 under the status rules: hrvstandards1996 (403, DOI_MISMATCH) and physionet2000 (403, DOI_MISMATCH). The lines "no identifier" are flagged and do not block.

## Second start of the citation compliance agent

Manifests 03-refs.bib and 04-main.tex were made before the start. The agent wrote no patch, so both manifests were removed and the numbers 03 and 04 are not given again.

## Run 3, after the second start

Command: `python3 /Users/axelfaes/.claude/skills/paper/templates/lookup.py cite-keys /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/main.tex /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/refs.bib`

Exit status: 0

Output: (none)

Command: `python3 /Users/axelfaes/.claude/skills/paper/templates/lookup.py check-urls /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/main.tex /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/refs.bib`

Exit status: 1

Output:

```
sslclustering2025: 200 https://doi.org/10.48550/arXiv.2501.18452, ratio 1.00 against OpenAlex
lookingbeyond2026: 200 https://doi.org/10.48550/arXiv.2601.21830, ratio 1.00 against OpenAlex
hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH
dechazal2004: 202 https://doi.org/10.1109/TBME.2004.827359, ratio 1.00 against Crossref
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
mitbih2001: 202 https://doi.org/10.1109/51.932724, ratio 1.00 against Crossref
physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH
neurokit2021: 200 https://doi.org/10.3758/s13428-020-01516-y, ratio 1.00 against Crossref
clifford2017af: 200 https://doi.org/10.22489/CinC.2017.065-469, ratio 1.00 against Crossref
sklearn2011: no identifier
hdbscan2013: 200 https://doi.org/10.1007/978-3-642-37456-2_14, ratio 1.00 against Crossref
fedavg2017: no identifier
```

Command: `python3 /Users/axelfaes/.claude/skills/paper/templates/lookup.py quote-check /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/paper-runs/citation-check-2026-11-15/citation-report.md /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-3/manuscript/refs.bib /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/tmp.kMUBjIXI1n`

Exit status: 0

Output: 41 lines, each ending "found".

Failures left, mark-only: hrvstandards1996 and physionet2000 (403, DOI_MISMATCH). The report (C27) gives the DOIs as correct: Crossref stores only the short title and the publisher answers automated requests with 403.
