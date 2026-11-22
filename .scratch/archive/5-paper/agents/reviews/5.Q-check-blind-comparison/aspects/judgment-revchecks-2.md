I compared both changes against `refs.bib`, the saved pages and the code under `input/code/`. Change 2 fixes a real factual error in two places; Change 1 is only a wording point.

## Change 1 (data-availability sentence)

**Better version: version 2, by a small margin.** Both versions say the same things: PTB-XL v1.0.3, MIT-BIH v1.0.0, both public on PhysioNet, cited as `physionet2000`, `ptbxl2020` and `mitbih2001`. The saved PhysioNet pages confirm the version numbers:
- `pages/page-016` has the title "PTB-XL, a large publicly available electrocardiography dataset v1.0.3".
- `pages/page-015` has the title "MIT-BIH Arrhythmia Database v1.0.0".

`physionet2000` is the 2000 Circulation paper on PhysioBank, PhysioToolkit and PhysioNet (`refs.bib` line 15). It can support "public on PhysioNet". It cannot document the 2022 and 2005 version releases. A grep of `refs.bib` finds no entry for the PhysioNet dataset DOIs (10.13026/kfzx-aw45, 10.13026/C2F305).

- **Version 1** puts the citation in the same sentence as the version numbers. A reader could take it as the source for those numbers.
- **Version 2** moves the citation into a separate sentence, about the databases being public on PhysioNet and described in the two dataset papers. That is what the cited sources hold.

**Does it matter?** It is a minor wording point. Neither version states anything false, and neither introduces an error.

## Change 2 (PTB-XL paragraph, place 1; MIT-BIH paragraph, place 2)

**Better version: version 1, at both places.** The two versions differ in who made the signals single-precision floating point.

- **Version 1** says the study did it: "We represented each record as ... single-precision floating-point values", and "we represented its two-lead signals in physical units, with single-precision floating-point values".
- **Version 2** says it is how the cited data is distributed or stored: "distributed in the WFDB format: a 10 s, 12-lead signal in physical units, stored as single-precision floating-point values". The MIT-BIH paragraph likewise says "whose two-lead signals were taken in physical units and stored as single-precision floating-point values".

The sources contradict version 2:
- The PTB-XL paper (`ptbxl2020`, `pages/page-007`) says "the original 16 bit binary data ... remained unchanged". It adds that WFDB provides "conversion to physical units", so the stored data is not in physical units.
- The PTB-XL PhysioNet page (`pages/page-016`, line 628) says "The waveform files are stored in WaveForm DataBase (WFDB) format with 16 bit precision at a resolution of 1 <micro sign>V/LSB".
- The MIT-BIH PhysioNet page (`pages/page-015`, line 544) says the recordings "were digitized at 360 samples per second per channel with 11-bit resolution".

The code agrees with version 1. The study reads the records with `wfdb.rdsamp` or `rdrecord(...).p_signal` and then converts them to single precision itself:
- `input/code/core/data.py:68` and `input/code/experiments/benchmark.py:63` use `sig.astype(np.float32)`.
- `input/code/core/data.py:104` and `input/code/experiments/mitbih_bench.py:40` use `rec.p_signal.astype(np.float32)`.

So the conversion to physical units and to single precision is a step the study takes after reading the files. The files themselves hold integers.

**Does it matter?** Yes. This corrects a claim the sources do not hold, at both places. Version 2 introduces an error: it credits the cited datasets with a storage format that their own documentation contradicts. A referee who knows PhysioNet or WFDB would notice it. A reader trying to reproduce the work would also be misled about where the conversion happens. Version 1 introduces no error.

None of the saved pages used here was a stub. Pages 007, 015 and 016 each held enough text to decide.

## Verdict

The better versions fix one real error that a referee or reader would care about: Change 2, at both of its places. The other change, Change 1, is a minor improvement in where the citation sits. Taking the better version in each change makes the cited claims more accurate.
