## Draft Body

### An interpretable block-term tensor network for incident atrial fibrillation prediction from the sinus-rhythm 12-lead ECG and clinical risk factors

Running title: Interpretable block-term tensor network for incident AF

Authors, affiliations, ORCID identifiers and corresponding author: [GAP-AUTH]. Filled by the author list, author order, affiliations, ORCID identifiers and corresponding-author contact that the authors supply.

#### Abstract

**Background:** Deep learning models predict incident atrial fibrillation (AF) from a sinus-rhythm 12-lead ECG, but their evidence is not readable, and their post-hoc explanations are seldom tested for faithfulness.

**Methods:** This retrospective study used MIMIC-IV-ECG linked to the MIMIC-IV hospital module, with each patient's earliest AF-naive sinus-rhythm ECG. The outcome was the first hospital-coded AF or flutter (ICD-10 I48, ICD-9 427.31 or 427.32) after a 30-day blanking window. The block-term tensor network (BTTN) projects a log-spectrogram tensor onto 12 learned frequency-by-lead blocks, followed by a nonlinear temporal stage and head trained with a Cox partial-likelihood loss. A linear clinical term with age, sex and seven ECG measurements bypasses the block layer. BTTN was compared with a clinical model, a CNN and linear block-term regression in repeated five-fold cross-validation with patient-bootstrap 95% confidence intervals (CIs). Five faithfulness analyses were pre-specified.

**Results:** Of 151,941 patients with an eligible index ECG, 1,855 developed AF within one year and 41,770 were controls. In the 9,275-patient comparison set, BTTN + clinical had the highest point AUROC, 0.7776 (95% CI 0.7664 to 0.7888), against 0.7597 (0.7488 to 0.7713) for the clinical model and 0.735 (0.7226 to 0.7469) for the CNN. ECG-only BTTN reached 0.7397 (0.7275 to 0.7517). One survival model reached 0.745 (0.735 to 0.755) at five years against 0.731 for a clinical Cox model. Observed one-year AF rose from 0.55% to 11.4% across risk deciles.<!--evidence:E1,E5,E6,E9d,E15,E10,E12,E13,E35,E40,E41-->

**Conclusions:** The fused interpretable model reached the highest point AUROC of the models compared, with ECG evidence readable by construction. Faithfulness of the signatures is assessed by five pre-specified analyses ([GAP-FT1 to GAP-FT5], filled by their ICD-coded results).

**Keywords:** atrial fibrillation; electrocardiogram; tensor decomposition; interpretable machine learning; survival analysis; MIMIC-IV

#### 1. Introduction

##### 1.1 AF burden and the case for risk-targeted screening

The incidence and prevalence of atrial fibrillation (AF) rise with population ageing, and reviews of AF epidemiology treat risk prediction, together with modifiable risk factors and prognosis, as an active field that includes eHealth and artificial intelligence developments [kornej2020]<!--ref:kornej2020--><!--anchor:section:Abstract-->. Targeted screening depends on risk prediction. Noseworthy and colleagues tested this in a prospective non-randomised trial of 1,003 patients who were stratified by an ECG-based risk score and monitored for up to 30 days [noseworthy2022]<!--ref:noseworthy2022--><!--anchor:section:Abstract-->. AF was detected in 7.6% of high-risk and 1.6% of low-risk patients, and in the high-risk group AI-guided screening raised detection from 3.6% under usual care to 10.6% [noseworthy2022]<!--ref:noseworthy2022--><!--anchor:section:Abstract-->. A score that ranks patients well therefore raises the yield of each monitored patient.

The 12-lead ECG is a natural input for such a score. It is recorded routinely, and sinus-rhythm markers such as P-wave duration are associated with later AF [nielsen2015]<!--ref:nielsen2015--><!--anchor:section:Abstract-->. This paper asks how to build a risk model from one such recording whose ECG evidence can be read and checked.

##### 1.2 Clinical risk scores and AI-ECG models for incident AF

Clinical risk models set a high standard. The Framingham AF risk score reached a C statistic of 0.78 [schnabel2009]<!--ref:schnabel2009--><!--anchor:section:Abstract-->, and the CHARGE-AF model, developed in pooled cohorts of 18,556 participants, reached a five-year C-statistic of 0.765 that adding ECG variables did not meaningfully change [alonso2013]<!--ref:alonso2013--><!--anchor:section:Abstract-->. Deep models applied to the sinus-rhythm ECG have reached similar or higher discrimination for related tasks. A CNN identified patients with AF during sinus rhythm with an AUC of 0.87, a task of identifying concurrent or recent AF [attia2019]<!--ref:attia2019--><!--anchor:section:Abstract-->. A deep network predicted new-onset AF within one year with an AUROC of 0.85 [raghunath2021]<!--ref:raghunath2021--><!--anchor:section:Abstract-->. A model trained on 669,782 sinus-rhythm ECGs predicted five-year incident AF or flutter with an AUC of 0.78 internally and 0.77 in MIMIC-IV, used only as an external test set [jabbour2024]<!--ref:jabbour2024--><!--anchor:section:Abstract-->, and a model trained on ECGs of United States veterans flagged AF within 31 days with an AUROC of 0.86 [yuan2023]<!--ref:yuan2023--><!--anchor:section:Abstract-->.

ECG and clinical information carry partly separate signal. Khurshid and colleagues reported five-year AUROCs of 0.802, 0.823 and 0.838 for CHARGE-AF, an ECG model and their combination at one hospital, and 0.732, 0.705 and 0.746 in UK Biobank, and called the two approaches complementary [khurshid2022]<!--ref:khurshid2022--><!--anchor:section:Abstract-->. Christopoulos and colleagues found C statistics of 0.69, 0.69 and 0.72 for AI-ECG, CHARGE-AF and their combination [christopoulos2020]<!--ref:christopoulos2020--><!--anchor:section:Abstract-->. Biton and colleagues reported that combining engineered ECG features, learned representations and clinical data raised five-year AF AUROC to 0.909, against 0.839 for the best single modality [biton2021]<!--ref:biton2021--><!--anchor:section:Abstract-->. A clinical risk-factor model is therefore a strong comparator, and fusion of ECG and clinical information is the design these studies favour.

##### 1.3 The interpretability gap

The incident-AF models above are deep networks trained end to end on the ECG [attia2019]<!--ref:attia2019--><!--anchor:section:Abstract-->[raghunath2021]<!--ref:raghunath2021--><!--anchor:section:Abstract-->[jabbour2024]<!--ref:jabbour2024--><!--anchor:section:Abstract-->, and their internal evidence is not designed to be read. Where the sources reviewed offer an explanation for an ECG model, it is computed after training: LIME for a 12-lead ECG CNN [hughes2021]<!--ref:hughes2021--><!--anchor:section:Abstract-->, Grad-CAM heat maps for an ECG network [storas2023]<!--ref:storas2023--><!--anchor:section:Abstract-->, and SHAP values for AF risk models built on clinical and ECG-derived variables [matsuo2026]<!--ref:matsuo2026--><!--anchor:section:Abstract-->. In these sources none of the explanations was tested for faithfulness to the model it describes, and physicians who reviewed the Grad-CAM heat maps found that they gave no meaningful information [storas2023]<!--ref:storas2023--><!--anchor:section:Abstract-->.

Post-hoc attributions have known failure modes. Some saliency methods produce maps that are independent of both the model parameters and the training data [adebayo2018]<!--ref:adebayo2018--><!--anchor:section:Abstract-->, and under removal and retraining many popular importance estimates did no better than random importance [hooker2019]<!--ref:hooker2019--><!--anchor:section:Abstract-->. Rudin argued that high-stakes decisions such as those in health care should use models that are interpretable by design [rudin2019]<!--ref:rudin2019--><!--anchor:section:Abstract-->. Ghassemi and colleagues took a more sceptical view: current explainability methods are unlikely to deliver the trust and transparency expected for decisions about individual patients, and rigorous internal and external validation should take their place [ghassemi2021]<!--ref:ghassemi2021--><!--anchor:section:Abstract-->.

The two positions meet at one requirement. A model called interpretable needs a test of that claim, and the test has to state how far the readout follows the model's computation. This paper builds the requirement into its design. The model is interpretable by construction in a stated and limited sense, and its signatures are submitted to pre-specified faithfulness tests.

##### 1.4 Aim and contributions

The research question is whether an interpretable block-term tensor network (BTTN), whose ECG evidence passes through readable frequency-and-lead block signatures and is fused with age, sex and ECG intervals, can predict incident AF from one sinus-rhythm 12-lead ECG in MIMIC-IV-ECG on hospital-coded diagnosis labels more accurately than a clinical risk-factor model and a CNN, and whether those signatures are faithful. The paper makes four contributions. First, it defines BTTN, a block-term factorisation of the ECG spectral tensor into frequency and lead factors, trained end to end with a nonlinear temporal stage and head under a Cox partial-likelihood loss. Second, it adds clinical risk factors through a linear clinical term on the log-risk that bypasses the block layer. Third, it compares BTTN with a clinical model, a CNN and a linear block-term regressor on one ICD-coded MIMIC-IV-ECG cohort with shared folds. Fourth, it specifies a five-part faithfulness protocol. Section 2 reviews the block-term and interpretability literatures behind these contributions, and Sections 3 to 5 give the methods, results and discussion.

#### 2. Related work

##### 2.1 Block-term tensor models and tensor regression

A block-term decomposition writes a higher-order tensor as a sum of terms with specified mode-n ranks, and it contains the canonical polyadic (CP) and Tucker decompositions as special cases [delathauwer2008]<!--ref:delathauwer2008--><!--anchor:section:Abstract-->. This paper uses the notation of Kolda and Bader for mode-n products and these decompositions [kolda2009]<!--ref:kolda2009--><!--anchor:section:Abstract-->. Supervised multilinear regression builds on this structure. Higher-order partial least squares predicts a tensor from a tensor through a sum of Tucker blocks fitted by deflation [zhao2013]<!--ref:zhao2013--><!--anchor:section:Abstract-->, and a fast variant reached comparable accuracy at lower cost [camarrone2019]<!--ref:camarrone2019--><!--anchor:section:Abstract-->. Block-term tensor regression (BTTR) with automatic component extraction predicted single-finger trajectories from intracranial recordings [faes2024]<!--ref:faes2024--><!--anchor:section:Abstract-->, and an extended form based on recursive Tucker decomposition predicted finger movement and coactivation [faes2022]<!--ref:faes2022--><!--anchor:section:Abstract-->. These models are linear in the input, and BTTR serves in this study as the linear comparator.

Block terms have also been read as physiological components. Hunyadi and colleagues decomposed wavelet-transformed EEG with rank-(Lr, Lr, 1) block terms to capture seizure patterns [hunyadi2014]<!--ref:hunyadi2014--><!--anchor:section:Abstract-->, and Goulart and colleagues estimated block-term structure jointly with its parameters to extract atrial activity from the ECG during AF [goulart2020]<!--ref:goulart2020--><!--anchor:section:Abstract-->. Both are unsupervised decompositions. Kim and colleagues fitted a supervised CP factorisation of diagnosis-by-prescription tensors on MIMIC-III that gave readable phenotypes and predicted intensive care mortality [kim2017]<!--ref:kim2017--><!--anchor:section:Abstract-->. Van Den Kerchove and colleagues proposed block-term tensor discriminant analysis, which extracts supervised block-term features from EEG for a separate classifier [vandenkerchove2025]<!--ref:vandenkerchove2025--><!--anchor:section:Abstract-->.

In the sources reviewed, block terms inside neural networks served to compress weights. Block-term decompositions reduced the parameters of recurrent networks [ye2018]<!--ref:ye2018--><!--anchor:section:Abstract--> and of fully connected layers [li2017btnets]<!--ref:li2017btnets--><!--anchor:section:Abstract-->, and Ye and colleagues approximated the weight matrices of CNNs and recurrent networks with low-rank block-term tensors under the name block-term tensor neural networks [ye2020]<!--ref:ye2020--><!--anchor:section:Abstract-->. BTTN shares the name and differs in mechanism. It factorises the input tensor into frequency and lead factors that lie on the predictive path, and its block terms define how the input is read. Dooms and colleagues combined multilinear tensor-network structure with deep network capacity for weight-based interpretability of image models [dooms2025]<!--ref:dooms2025--><!--anchor:section:Abstract-->, without a clinical outcome or physiological signatures. To our knowledge, and within the literature searched for this study, no prior model trains a block-term input factorisation end to end with a nonlinear head and a survival objective for a clinical outcome.

##### 2.2 Interpretable by design and faithfulness evaluation

Interpretable-by-design models place a readable representation on the predictive path. Concept bottleneck models first predict human-specified concepts and then the label, and they reached accuracy competitive with end-to-end models on x-ray grading and bird identification while allowing concepts to be corrected at test time [koh2020]<!--ref:koh2020--><!--anchor:section:Abstract-->. B-cos networks make the whole network reduce to one input-dependent linear transform that summarises its computation, with ImageNet accuracy similar to standard architectures [bohle2022]<!--ref:bohle2022--><!--anchor:section:Abstract-->. On the tasks studied, a readable intermediate layer was compatible with competitive accuracy.

A readable layer that feeds a flexible predictor has a known weakness. Mahinpei and colleagues showed that learned concept representations leak information beyond the predefined concepts and that common mitigations only partly remove it [mahinpei2021]<!--ref:mahinpei2021--><!--anchor:section:Abstract-->. Havasi and colleagues found that training the label predictor on soft concept probabilities improves accuracy but lets information leak, which corrupts concept predictions and weakens intervention [havasi2022]<!--ref:havasi2022--><!--anchor:section:Abstract-->. For BTTN the corresponding question is whether the nonlinear temporal stage and head use information that the readable block projections do not expose. A test of this question has to read the block projections without the head, so that the head's capacity cannot enter the readout.

Faithfulness is the property such tests measure. Jacovi and Goldberg separated faithfulness, the degree to which an interpretation reflects the model's reasoning, from plausibility to a human reader, and argued for a graded notion of faithfulness [jacovi2020]<!--ref:jacovi2020--><!--anchor:section:Abstract-->. Two families of tests follow from this literature. Randomisation tests check whether an explanation changes when model parameters or training labels are randomised [adebayo2018]<!--ref:adebayo2018--><!--anchor:section:Abstract-->. Removal tests check whether deleting the features that an explanation ranks as important degrades a model more than deleting others [hooker2019]<!--ref:hooker2019--><!--anchor:section:Abstract-->. Integrated Gradients, an attribution method built on axioms of sensitivity and implementation invariance [sundararajan2017]<!--ref:sundararajan2017--><!--anchor:section:Abstract-->, represents the explanations computed after training that these tests were designed to check. Time-frequency inputs give the ECG a frequency axis to which a readout can refer, and a 2D CNN on time-frequency maps of 12-lead ECGs classified eight arrhythmias [jeong2021]<!--ref:jeong2021--><!--anchor:section:Abstract-->, a detection task on the current rhythm. In the sources reviewed, no study combines a supervised, survival-trained block-term input factorisation with measured faithfulness for a clinical outcome. Section 3 defines the cohort, the model and the tests that address this combination.

#### 3. Methods

##### 3.1 Study design, data sources and reporting

This is a retrospective development and internal validation study of a prognostic model with repeated patient-level cross-validation. ECGs came from MIMIC-IV-ECG version 1.0, which holds about 800,000 diagnostic 12-lead ECGs from nearly 160,000 patients, each 10 seconds long and sampled at 500 Hz, matched to the MIMIC-IV clinical database [gow2023]<!--ref:gow2023--><!--anchor:section:Abstract-->. Diagnoses, admissions and patient records came from the hospital module of MIMIC-IV, which is drawn from records of Beth Israel Deaconess Medical Center [johnson2023]<!--ref:johnson2023--><!--anchor:section:Abstract-->. Both resources are hosted on PhysioNet [goldberger2000]<!--ref:goldberger2000--><!--anchor:section:Abstract-->. Each patient contributed one ECG, the index ECG defined below, so every analysis is at the patient level and a resample of rows is a resample of patients. Reporting follows the TRIPOD+AI statement for prediction models that use regression or machine learning [collins2024]<!--ref:collins2024--><!--anchor:section:Abstract-->, and the completed checklist is supplementary material. The analysis code, which fixes every setting stated in this section, is released with the paper (Data availability). Ethics approval and data access are described in the Ethics statement.

##### 3.2 Cohort and outcome definition

The index ECG of each patient was the earliest ECG whose machine report read sinus rhythm, did not mention AF or atrial flutter, and did not describe a paced, junctional, atrial tachycardia, supraventricular tachycardia, wandering or ectopic atrial rhythm. The outcome was the first hospital-coded AF or flutter, that is, the first admission carrying ICD-10 code I48 (AF and flutter) or, for older admissions, ICD-9 code 427.31 or 427.32, dated by the admission time. Patients with prevalent or concurrent AF were excluded, that is, those with an outcome date or an AF-reading ECG no later than 30 days after the index ECG. This blanking window separates incident prediction from identification of AF that is already present.

In the one-year binary cohort, cases had an outcome more than 30 and at most 365 days after the index ECG. Controls had no outcome code at any time and at least 365 days of follow-up, which ended at the later of the last ECG and the date of death. In the survival cohort, an event was any outcome after the blanking window, and patients without an outcome were censored at the end of follow-up, with at least 365 days required. To bound computation, each cohort file holds at most 4,000 cases and 16,000 controls, sampled at random. For the one-year model comparison, all cases were kept and controls were subsampled at four per case.

Nine covariates entered the clinical models and the clinical term: age, sex, and seven machine measurements of the index ECG (RR interval, P-wave duration, QRS duration, QT interval, and the P, QRS and T axes). P-wave duration is an established predictor of AF [nielsen2015]<!--ref:nielsen2015--><!--anchor:section:Abstract-->. To check for differential follow-up, the shares of controls with any later ECG and with a latest later ECG that did not read AF were computed.

##### 3.3 ECG preprocessing and spectral tensor

Each lead was filtered with a second-order Butterworth high-pass filter at 0.5 Hz and a notch filter at 50 Hz (quality factor 30), both applied forward and backward, and denoised by soft thresholding of a level-3 sym4 wavelet decomposition. The signal was decimated from 500 to 250 Hz with zero-phase anti-aliasing, centred, and scaled per lead to unit maximum absolute amplitude. For each lead, a magnitude spectrogram was computed with a 128-sample window and a 32-sample hop. Frequencies up to 40 Hz were kept, magnitudes were transformed as log(1 + x), and the time axis was resampled to 40 frames. Each recording thus gives a frequency x time x lead tensor, standardised by its own mean and standard deviation. At 250 Hz a 128-sample window spaces the frequency bins about 1.95 Hz apart (derived from these settings). A spectrogram tolerates shifts in beat timing, so the tensor needs no beat detection or alignment, and its frequency and lead modes are the axes along which the BTTN factors are read. Time-frequency 12-lead representations have served as CNN inputs for arrhythmia detection [jeong2021]<!--ref:jeong2021--><!--anchor:section:Abstract-->.

##### 3.4 BTTN model and training

BTTN has four parts: a block-term layer, a temporal stage, a head and a survival loss (Figure 1). Let $\mathcal{X} \in \mathbb{R}^{F \times T \times L}$ be the spectral tensor with $F$ frequency bins, $T = 40$ time frames and $L = 12$ leads. The block-term layer has $K = 12$ blocks. Block $k$ holds a frequency factor $A_k \in \mathbb{R}^{F \times 3}$ and a lead factor $C_k \in \mathbb{R}^{L \times 2}$ and projects the tensor onto them with mode products in the notation of Kolda and Bader [kolda2009]<!--ref:kolda2009--><!--anchor:section:Abstract-->:

$$\mathcal{Z}_k = \mathcal{X} \times_1 A_k^\top \times_3 C_k^\top \in \mathbb{R}^{3 \times T \times 2}.$$

Each block yields six channels over time, and the 12 blocks yield 72 channels. The layer has no time factor and no learned core tensor. It is a set of block terms in the sense of De Lathauwer [delathauwer2008]<!--ref:delathauwer2008--><!--anchor:section:Abstract--> restricted to the frequency and lead modes, and time is left to the temporal stage. Every later computation receives only these 72 channels, so the frequency and lead directions available to the model are the columns of $A_k$ and $C_k$.

The temporal stage applies grouped one-dimensional convolutions along time to each channel, with kernel sizes 3, 7 and 15 and six filters per channel and kernel size, followed by batch normalisation and a rectified linear unit. The sequences are pooled over time by a learned softmax attention and by max pooling, and the two pooled vectors are concatenated. The head applies batch normalisation and dropout (rate 0.4), then a multilayer perceptron with hidden layers of 256 and 128 units, and outputs a scalar ECG log-risk.

BTTN was trained with the negative Cox partial log-likelihood [cox1972]<!--ref:cox1972--><!--anchor:section:Abstract-->, as in DeepSurv [katzman2018]<!--ref:katzman2018--><!--anchor:section:Abstract-->, computed within each mini-batch so that a patient's risk set is the batch members with an equal or longer time, in the spirit of the sampled risk sets of Kvamme and colleagues [kvamme2019]<!--ref:kvamme2019--><!--anchor:section:Abstract-->. Cases contributed their time to the outcome and controls their follow-up time. Inputs were standardised per lead with training-fold statistics. Optimisation used Adam with learning rate 2 x 10^-3, weight decay 10^-4, a cosine schedule, batches of 512 and at most 120 epochs. In each training fold, 15% of patients were held out for early stopping on validation AUROC with patience 16, and the best state was restored. Three models with different seeds were trained per fold and their risks averaged.

Two readouts are interpretable without the head. The block scores are the 72 projected channels averaged over time, a multilinear function of the input. The block signature of block $k$ is the frequency x lead map $A_k C_k^\top$, formed from the first two columns of $A_k$ and both columns of $C_k$. The temporal stage and the head are nonlinear and are not interpretable by design, which is why Section 3.8 tests faithfulness.

For BTTN + SSL and BTTN + SSL + clinical, the block-term layer and temporal stage were first pretrained without labels with a SimCLR-style contrastive objective [chen2020simclr]<!--ref:chen2020simclr--><!--anchor:section:Abstract--> (NT-Xent loss, temperature 0.2) on 30,000 ECGs sampled one per patient from MIMIC-IV-ECG, for 60 epochs. Views were formed by time masking, frequency masking, lead dropout, additive noise and a small roll along time. The pretrained weights initialised BTTN before supervised training. The pool was not restricted to patients outside the study cohorts, and no labels entered pretraining. Contrastive pretraining has been adapted to cardiac signals [kiyasseh2021]<!--ref:kiyasseh2021--><!--anchor:section:Abstract--> and to 12-lead ECGs [mehari2022]<!--ref:mehari2022--><!--anchor:section:Abstract-->.

[GAP-FIG1] **Figure 1.** Model schematic: the spectral tensor, the block factors $A_k$ and $C_k$ without a core tensor, the grouped temporal convolutions with attention and max pooling, the MLP head, the additive clinical term on the nine covariates and the Cox loss. Filled by rendering the corrected schematic plotting script delivered with the code.

##### 3.5 Clinical fusion term

BTTN + clinical adds a linear clinical term to the ECG log-risk,

$$\eta = h(\mathcal{X}) + w^\top c,$$

where $h(\mathcal{X})$ is the head output and $c$ is the vector of the nine covariates of Section 3.2, standardised with training-fold means and standard deviations, with missing values set to the training mean. The term has no bias. Its weights $w$ were initialised from a class-balanced logistic regression of the one-year label on the covariates of the training patients and were excluded from weight decay, so that training does not shrink this initialisation. Because the clinical term is added after the head, it enters neither the block-term layer nor the block scores. The block factors therefore remain the only path for ECG evidence, and the block scores of BTTN + clinical are computed exactly as for BTTN. The factor values themselves are learned jointly with the clinical term, so they can differ between the two models while the structure stays the same.

##### 3.6 Comparators

Six comparators were trained on the same cohort, folds and spectral tensor as BTTN + clinical, so that the seven models of the one-year comparison differ only in the model. The clinical model was a logistic regression on the nine covariates with median imputation, standardisation and balanced class weights, in the role that clinical risk scores play as baselines for AF prediction [schnabel2009]<!--ref:schnabel2009--><!--anchor:section:Abstract-->[alonso2013]<!--ref:alonso2013--><!--anchor:section:Abstract-->[khurshid2022]<!--ref:khurshid2022--><!--anchor:section:Abstract-->. Linear BTTR was block-term tensor regression with automatic component extraction [faes2024]<!--ref:faes2024--><!--anchor:section:Abstract-->, in the implementation of the authors' group, fitted to the label coded as -1 and +1 with up to eight blocks. It belongs to the linear lineage of Section 2.1 [camarrone2019]<!--ref:camarrone2019--><!--anchor:section:Abstract-->[faes2022]<!--ref:faes2022--><!--anchor:section:Abstract-->.

The CNN, the reference architecture of AI-ECG work [attia2019]<!--ref:attia2019--><!--anchor:section:Abstract-->[raghunath2021]<!--ref:raghunath2021--><!--anchor:section:Abstract-->, received the same tensor with frequency and lead flattened into channels. It had three convolutional layers with 32, 64 and 64 filters and kernel sizes 7, 5 and 3, each with batch normalisation and a rectified linear unit, max pooling after the first two, average pooling after the third, and dropout. Like BTTN, it was trained with early stopping on validation AUROC and a three-model ensemble per fold, here with class-weighted binary cross-entropy. ECG-only BTTN, BTTN + SSL and BTTN + SSL + clinical complete the set. In the multi-horizon analysis the clinical comparator was a Cox model with penalty 0.1 on the same covariates and median imputation, called the clinical Cox model below.

##### 3.7 Evaluation protocol and statistics

In the one-year comparison, stratified five-fold cross-validation was repeated with five seeds, each drawing new folds, and each patient's out-of-fold scores were averaged over seeds. AUROC, the probability that a random case is ranked above a random control [hanley1982]<!--ref:hanley1982--><!--anchor:section:Abstract-->, was computed in 2,000 patient-bootstrap resamples of the averaged scores and is reported as the mean over resamples with the 2.5th and 97.5th percentiles as the 95% CI [carpenter2000]<!--ref:carpenter2000--><!--anchor:section:Abstract-->. With one ECG per patient, this is a patient-level bootstrap. Comparisons are reported as point estimates with CIs, and the paired patient-bootstrap distribution of AUROC differences (2,000 resamples) against the clinical model and the CNN is held at [GAP-C4] in Section 4.2.

The multi-horizon analysis used the survival cohort with five-fold cross-validation stratified by event. One BTTN and one BTTN + clinical were trained on continuous time, and AUROC was read from the same out-of-fold risk at four horizons, with cases having an event by the horizon, controls an event or censoring after it, and earlier censoring excluded. The 90-day horizon counts outcomes from day 31 to day 120. CIs for the BTTN models came from 2,000 patient-bootstrap resamples. Discrimination over time is reported as these horizon AUROCs, and no concordance index is reported.

Calibration and clinical utility were assessed at one year on the multi-horizon scores, with probabilities from two-fold cross-fitted Platt scaling: reliability curve and Brier score [vancalster2019]<!--ref:vancalster2019--><!--anchor:section:Abstract-->, decision curve [vickers2006]<!--ref:vickers2006--><!--anchor:section:Abstract-->, and sensitivity and specificity when flagging the top 5%, 10%, 20% and 30% of patients. Positive predictive value (PPV) and the number needed to monitor (1 / PPV) were recomputed at the one-year incidence of the eligible cohort, 1,855 / (1,855 + 41,770).<!--evidence:E5,E6--> Observed one-year AF rates were tabulated by decile of BTTN + clinical risk.

##### 3.8 Faithfulness analyses

Faithfulness is the degree to which a readout of BTTN agrees with the model's own computation, measured in degrees [jacovi2020]<!--ref:jacovi2020--><!--anchor:section:Abstract-->. All five analyses use the one-year comparison set and ECG-only BTTN trained as in Section 3.4, as single models in the probes, intervention test and block-structure ablation, with five folds and three seeds where cross-validated.

*Control probes.* A logistic regression on the block scores of training patients was evaluated on the test fold. Block scores exclude the temporal stage and head, so the probe cannot use the head's capacity, the leakage route described for concept models [mahinpei2021]<!--ref:mahinpei2021--><!--anchor:section:Abstract-->[havasi2022]<!--ref:havasi2022--><!--anchor:section:Abstract-->. The same probe was fitted to four controls, following the logic of randomisation checks [adebayo2018]<!--ref:adebayo2018--><!--anchor:section:Abstract-->: (i) the raw flattened tensor, (ii) the 64-dimensional penultimate CNN features, (iii) a fixed random projection to the block-score dimension, and (iv) block scores of the label-blind self-supervised encoder. Probes are reported as AUROC with CI and as recovery, probe AUROC divided by full BTTN AUROC on the same folds.

*Intervention test.* On a held-out fold, frequency bins and leads were ranked by the AUROC drop when each was set to zero alone. The top-n and, as a control, bottom-n axes were then zeroed cumulatively and full-model AUROC recorded, following removal-based testing [hooker2019]<!--ref:hooker2019--><!--anchor:section:Abstract-->.

*Block-structure ablation.* The block-term layer was replaced by rank-one CP blocks or by a full-rank frequency x lead projection of the same width, downstream unchanged, recording full AUROC and probe recovery.

*Block-count sweep.* $K$ was set to 4, 8, 12, 16 and 24, with AUROC reported as mean and standard deviation over seeds.

*Substrate map.* On a held-out 20% split, a three-model ensemble gave occlusion importance per frequency bin and per lead and the mean absolute block signature.

##### 3.9 External analyses

Two independent datasets without dated outcomes test whether the method and its signatures transfer, through identification or detection of AF, a different task from incident prediction. CODE-15 is a stratified 15% sample of the CODE study of the Telehealth Network of Minas Gerais, with 345,779 exams from 233,770 patients and an AF flag per exam [ribeiro2021code15]<!--ref:ribeiro2021code15--><!--anchor:section:Description-->[ribeiro2020]<!--ref:ribeiro2020--><!--anchor:section:Abstract-->. With one exam per patient and at most 6,000 patients per class, controls were exams of patients never flagged with AF, and cases were non-AF exams of patients with an AF exam elsewhere (identification) or AF exams (detection). PTB-XL holds 21,837 records from 18,885 patients with cardiologist-annotated diagnostic statements [wagner2020]<!--ref:wagner2020--><!--anchor:section:Abstract-->, from which a class-balanced detection task of AF or flutter against sinus rhythm was formed. BTTN with the same architecture and a binary cross-entropy loss was evaluated by five-fold cross-validated AUROC, and its frequency and lead occlusion importances were compared with the MIMIC-IV substrate map.

#### 4. Results

##### 4.1 Cohort

Of 151,941 patients with an eligible sinus-rhythm index ECG, 14,469 met the criterion for prevalent or concurrent AF, 88,945 had no outcome and under 365 days of follow-up, and 7,481 had their first outcome after one year (Table 1). These counts overlap and are not subtracted in sequence. The eligible one-year cohort comprised 1,855 cases and 41,770 controls (43,625 patients), and the survival cohort 8,775 patients with an incident outcome and the same controls (50,545 patients). Incident outcomes numbered 1,855 by one year, 2,828 by two years and 5,262 by five years. Controls had a median follow-up of 1,601 days (interquartile range 880 to 2,559). Of the one-year controls, 98.1% had at least one later ECG and 96.5% had a latest later ECG that did not read AF.<!--evidence:E1,E2,E3a,E3b,E4,E9b,E7,E7b,E8,E9-->

The one-year cohort file held all 1,855 cases and 16,000 controls. The one-year comparison set comprised the 1,855 cases and 7,420 controls, 9,275 patients at a prevalence of 0.20 (derived from four controls per case). The survival cohort file held 4,000 events and 16,000 censored patients. Baseline characteristics by outcome: [GAP-T1] (Table 1), filled by descriptive statistics of age, sex and the seven ECG measurements by outcome in the one-year and survival cohort files.<!--evidence:E9d,E9e-->

**Table 1.** Cohort derivation and follow-up for ICD-coded outcomes.<!--evidence:E1,E2,E3a,E3b,E4,E7,E7b,E8,E9,E9b,E9d,E9e-->

| Quantity | One-year binary cohort | Survival cohort |
|---|---|---|
| Patients with an eligible sinus-rhythm index ECG | 151,941 | 151,941 |
| Meeting the prevalent or concurrent AF criterion | 14,469 | 14,469 |
| No outcome and follow-up below 365 days | 88,945 | 88,945 |
| First outcome after 365 days | 7,481 | not applicable |
| Cases (one-year) or patients with an incident outcome (survival) | 1,855 | 8,775 |
| Controls | 41,770 | 41,770 |
| Total | 43,625 | 50,545 |
| Incident outcomes by 1, 2 and 5 years | 1,855; 2,828; 5,262 | 1,855; 2,828; 5,262 |
| Control follow-up, median (IQR), days | 1,601 (880 to 2,559) | 1,601 (880 to 2,559) |
| Controls with any later ECG | 98.1% | 98.1% |
| Controls whose latest later ECG did not read AF | 96.5% | 96.5% |
| Cohort file used for modelling | 1,855 cases, 16,000 controls | 4,000 events, 16,000 censored |
| Analysis set | 9,275 (1,855 cases, 7,420 controls; derived) | 20,000 |
| Baseline characteristics by outcome | [GAP-T1] | [GAP-T1] |

Note: Exclusion counts are patients meeting each criterion and overlap. IQR, interquartile range. The comparison set size and its 7,420 controls are derived from four controls per case. [GAP-T1] is filled by descriptive statistics of age, sex and the seven ECG measurements by outcome.

##### 4.2 One-year discrimination

Table 2 gives the AUROC of the seven models in the one-year comparison set. BTTN + clinical had the highest point AUROC, 0.7776 (95% CI 0.7664 to 0.7888), and BTTN + SSL + clinical reached 0.7775 (0.7664 to 0.7885). The clinical model reached 0.7597 (0.7488 to 0.7713) and the CNN 0.735 (0.7226 to 0.7469).<!--evidence:E15,E16,E10,E12-->

Against the clinical model, BTTN + clinical had a higher point AUROC with overlapping 95% CIs, which share the interval from 0.7664 to 0.7713. Both models use the same nine covariates, and BTTN + clinical adds the BTTN log-risk to them, so this comparison isolates what the ECG pathway adds. Overlap of two marginal CIs on the same patients neither shows nor excludes a paired difference. Against the CNN, the 95% CIs do not overlap, the lower bound of 0.7664 lying above the CNN's upper bound of 0.7469. This comparison has unequal inputs, since the CNN receives no covariates.<!--evidence:E15,E10,E12-->

The like-for-like ECG comparison is between ECG-only BTTN and the CNN on the same tensor, folds and patients. ECG-only BTTN reached 0.7397 (0.7275 to 0.7517) against 0.735 for the CNN, with overlapping CIs. BTTN thus reached discrimination comparable to the CNN, with a point AUROC at least as high, while all of its ECG evidence passes through the 12 frequency-by-lead block projections.<!--evidence:E13,E12-->

Linear BTTR on the same tensor reached 0.5967 (0.5824 to 0.6115), with a CI that does not overlap that of ECG-only BTTN. The trained nonlinear block-term network thus raised discrimination from the value of linear block-term regression to the range of the CNN on the same input.<!--evidence:E11,E13,E12-->

BTTN + SSL reached 0.7414 (0.7292 to 0.7536) and BTTN + SSL + clinical 0.7775, at the level of BTTN and BTTN + clinical. The headline model, BTTN + clinical, uses no pretraining.<!--evidence:E14,E16-->

ECG-only BTTN had a lower point AUROC than the clinical model, 0.7397 against 0.7597, with CIs overlapping between 0.7488 and 0.7517. Seven of the nine clinical covariates are machine measurements of the same index ECG, so the clinical model is itself a strong ECG-informed comparator.<!--evidence:E13,E10-->

Paired patient-bootstrap AUROC differences: [GAP-C4], filled by the mean differences with 95% CIs for BTTN + clinical minus the clinical model, BTTN + clinical minus the CNN and BTTN minus the CNN, saved from the one-year comparison run on the ICD-coded cohort.

**Table 2.** One-year discrimination of seven models on the ICD-coded comparison set (9,275 patients, 1,855 cases).<!--evidence:E10,E11,E12,E13,E14,E15,E16,E17,E9d-->

| Model | ECG input | Clinical covariates | Self-supervised pretraining | AUROC | 95% CI | Paired difference vs clinical model and vs CNN |
|---|---|---|---|---|---|---|
| Clinical model (logistic regression) | none | nine | no | 0.7597 | 0.7488 to 0.7713 | [GAP-C4] |
| Linear BTTR | spectral tensor | none | no | 0.5967 | 0.5824 to 0.6115 | [GAP-C4] |
| CNN | spectral tensor | none | no | 0.735 | 0.7226 to 0.7469 | [GAP-C4] |
| BTTN | spectral tensor | none | no | 0.7397 | 0.7275 to 0.7517 | [GAP-C4] |
| BTTN + SSL | spectral tensor | none | yes | 0.7414 | 0.7292 to 0.7536 | [GAP-C4] |
| BTTN + clinical | spectral tensor | nine | no | 0.7776 | 0.7664 to 0.7888 | [GAP-C4] |
| BTTN + SSL + clinical | spectral tensor | nine | yes | 0.7775 | 0.7664 to 0.7885 | [GAP-C4] |

Note: AUROC is the mean over 2,000 patient-bootstrap resamples of out-of-fold scores averaged over five seeds of five-fold cross-validation, with percentile 95% CI. The nine covariates are age, sex, RR interval, P-wave duration, QRS duration, QT interval and the P, QRS and T axes. Model names map to the labels of the released results file as follows: clinical model, "clinical (age/sex + ECG intervals)"; linear BTTR, "plain BTTR (spectral)"; CNN, "CNN (black-box)"; BTTN, "conv-BTTN (ECG-only)"; BTTN + SSL, "conv-BTTN + SSL"; BTTN + clinical, "conv-BTTN + clinical"; BTTN + SSL + clinical, "conv-BTTN + SSL + clinical (full)". [GAP-C4] is filled by paired patient-bootstrap AUROC differences from the saved one-year comparison run.

##### 4.3 Multi-horizon discrimination from one survival model

Table 3 reports AUROC at four horizons from one survival BTTN and one BTTN + clinical survival model, each trained once, and from the clinical Cox model. The BTTN + clinical survival model had a higher point AUROC than the clinical Cox model at every horizon: 0.723 (0.701 to 0.745) against 0.71 at 90 days after blanking, 0.727 (0.711 to 0.743) against 0.711 at one year, 0.74 (0.727 to 0.753) against 0.727 at two years, and 0.745 (0.735 to 0.755) against 0.731 at five years. The results file holds no CI for the clinical Cox model. ECG-only survival BTTN ranged from 0.658 to 0.676 across horizons, and adding the clinical term raised the point AUROC at each horizon, to between 0.723 and 0.745. One trained model thus gives risk at 90 days and at one, two and five years without retraining.<!--evidence:E20,E21,E22,E24,E25,E27,E28,E34,E35-->

Tables 2 and 3 use different analysis sets and different clinical comparators. Table 2 is the one-year case-control set of 9,275 patients with a logistic clinical model. Table 3 is the survival set, in which the one-year evaluation includes 19,986 patients with 838 cases, with a penalised clinical Cox model. Their one-year values are therefore not comparable across the two tables, and each table compares models only within its own set.<!--evidence:E23,E10,E25-->

**Table 3.** AUROC at four horizons from one survival model, survival cohort (4,000 events, 16,000 censored).<!--evidence:E20,E21,E22,E23,E24,E25,E26,E27,E28,E33,E34,E35,E9e-->

| Horizon | Patients evaluated | Cases | BTTN (95% CI) | BTTN + clinical (95% CI) | Clinical Cox model |
|---|---|---|---|---|---|
| 90-day onset after blanking | 20,000 | 410 | 0.658 (0.632 to 0.684) | 0.723 (0.701 to 0.745) | 0.71 |
| 1 year | 19,986 | 838 | 0.666 (0.647 to 0.684) | 0.727 (0.711 to 0.743) | 0.711 |
| 2 years | 16,982 | 1,299 | 0.674 (0.659 to 0.688) | 0.74 (0.727 to 0.753) | 0.727 |
| 5 years | 11,007 | 2,425 | 0.676 (0.665 to 0.687) | 0.745 (0.735 to 0.755) | 0.731 |

Note: AUROC is computed on out-of-fold risk from five-fold cross-validation, with percentile 95% CIs from 2,000 patient-bootstrap resamples for the BTTN models. No CI is available for the clinical Cox model. Cases had an outcome by the horizon, controls were outcome-free beyond it, and patients censored before it were excluded. The 90-day horizon counts outcomes from day 31 to day 120. Values are not comparable with Table 2 (different analysis set and clinical comparator).

##### 4.4 Calibration, clinical utility and risk stratification

Figure 2 shows calibration, decision curves and the risk gradient at one year, and Table 4 lists operating points. After cross-fitted Platt scaling, the Brier scores were 0.039 for BTTN + clinical, 0.0396 for BTTN and 0.0398 for the clinical model. With a one-year event rate near 0.04 in this set (Figure 2c), the Brier score is dominated by the event rate, so the scores are read together with the reliability curves and are not used to rank the models.<!--evidence:E36,E42-->

Flagging the top 10% of patients by BTTN + clinical risk gave sensitivity 0.272, specificity 0.908, a PPV recalibrated to the cohort incidence of 11.6% (0.1155) and a number needed to monitor of 8.7. The same flag rate with the clinical model gave sensitivity 0.24, specificity 0.906, PPV 10.2% (0.1019) and a number needed to monitor of 9.8. The eligible cohort's one-year incidence is 0.0425 (derived from 1,855 / 43,625), so the PPV of BTTN + clinical at this flag rate is about 2.7 times the incidence (derived). Table 4 gives the full grid at 5%, 10%, 20% and 30%.<!--evidence:E37,E38,E5,E6,E4-->

Observed one-year AF rose from 0.55% in the lowest decile of BTTN + clinical risk to 11.4% in the highest, a gradient of about twentyfold (derived ratio 20.7). In the decision curve, the three models had net benefit above the treat-all and treat-none strategies at low thresholds, and the curves converged towards zero at higher thresholds.<!--evidence:E40,E41,E42-->

![Figure 2. One-year calibration, decision curve and risk gradient.](../../code/results/clin_eval.png)

<!--evidence:E42-->**Figure 2.** One-year calibration, clinical utility and risk gradient of the survival models after two-fold cross-fitted Platt scaling (source file `code/results/clin_eval.png`). (a) Reliability curves by decile of predicted risk for BTTN + clinical, BTTN and the clinical Cox model, with Brier scores in the legend rounded to three decimals. (b) Decision curves of net benefit across threshold probabilities, with treat-all and treat-none strategies. (c) Observed one-year AF rate by decile of BTTN + clinical risk, with the dashed line at the one-year event rate of the evaluation set.

**Table 4.** One-year operating points of the survival models after cross-fitted Platt scaling.<!--evidence:E39,E23,E5,E6-->

| Model | AUROC (95% CI) | Flagged | Sensitivity | Specificity | PPV at cohort incidence | Number needed to monitor | Brier score |
|---|---|---|---|---|---|---|---|
| BTTN + clinical | 0.726 (0.710 to 0.742) | 5% | 0.154 | 0.955 | 0.1307 | 7.7 | 0.039 |
| BTTN + clinical | 0.726 (0.710 to 0.742) | 10% | 0.272 | 0.908 | 0.1155 | 8.7 | 0.039 |
| BTTN + clinical | 0.726 (0.710 to 0.742) | 20% | 0.461 | 0.811 | 0.0978 | 10.2 | 0.039 |
| BTTN + clinical | 0.726 (0.710 to 0.742) | 30% | 0.6 | 0.713 | 0.085 | 11.8 | 0.039 |
| BTTN | 0.666 (0.647 to 0.683) | 5% | 0.123 | 0.953 | 0.1044 | 9.6 | 0.0396 |
| BTTN | 0.666 (0.647 to 0.683) | 10% | 0.232 | 0.906 | 0.0983 | 10.2 | 0.0396 |
| BTTN | 0.666 (0.647 to 0.683) | 20% | 0.387 | 0.808 | 0.0821 | 12.2 | 0.0396 |
| BTTN | 0.666 (0.647 to 0.683) | 30% | 0.514 | 0.709 | 0.0729 | 13.7 | 0.0396 |
| Clinical Cox model | 0.708 (0.692 to 0.725) | 5% | 0.129 | 0.953 | 0.1094 | 9.1 | 0.0398 |
| Clinical Cox model | 0.708 (0.692 to 0.725) | 10% | 0.24 | 0.906 | 0.1019 | 9.8 | 0.0398 |
| Clinical Cox model | 0.708 (0.692 to 0.725) | 20% | 0.428 | 0.81 | 0.091 | 11.0 | 0.0398 |
| Clinical Cox model | 0.708 (0.692 to 0.725) | 30% | 0.574 | 0.712 | 0.0813 | 12.3 | 0.0398 |

Note: Evaluation set is the one-year at-risk subset of the survival cohort (19,986 patients, 838 cases). AUROC here is the mean over 2,000 patient-bootstrap resamples of the calibrated probabilities and differs slightly from Table 3. Flagged is the share of the evaluation set flagged as high risk. PPV and number needed to monitor are recomputed from sensitivity and specificity at the eligible cohort's one-year incidence, 1,855 / (1,855 + 41,770). Decile rates in the text are rounded to 0.55% and 11.4%.

##### 4.5 Faithfulness of the block signatures

The block scores that the probes read are computed from the block-term layer alone and exclude the temporal stage, the head and the clinical term by construction (Sections 3.4 and 3.5). The five analyses of Section 3.8 are held at the placeholders below until their ICD-coded results are available.

- Control-probe results: [GAP-FT1] (Table 5), filled by the AUROCs, CIs and recoveries of the five probe sources from a run whose log records the 9,275-patient ICD-coded comparison set.
- Intervention curve: [GAP-FT2] (Figure 4), filled by the top-n and bottom-n removal curves from a run on the ICD-coded comparison set.
- Block-structure ablation: [GAP-FT3] (Table 6), filled by full AUROC and probe recovery of the block-term, CP and full-rank variants from a run on the ICD-coded comparison set.
- Block-count sweep: [GAP-FT4] (Table 6), filled by the mean and standard deviation of AUROC for K = 4, 8, 12, 16 and 24 from a run on the ICD-coded comparison set.
- Substrate map: [GAP-FT5] (Figure 3), filled by the frequency and lead occlusion importances and the mean block signature from a run on the ICD-coded comparison set.

[GAP-FT1] **Table 5.** Control probes: AUROC (95% CI) and recovery for probes on the block scores, the raw flattened tensor, the CNN penultimate features, a matched-dimension random projection and the label-blind block scores. Filled by the faithfulness-controls output of a run established as using the ICD-coded comparison set.

[GAP-FT3, GAP-FT4] **Table 6.** Block-structure ablation (block-term, CP and full-rank first layers: full AUROC with 95% CI and probe recovery) and block-count sweep (K = 4, 8, 12, 16, 24: mean and standard deviation of AUROC). Filled by the block-structure ablation and block-count sweep outputs of runs on the ICD-coded comparison set.

[GAP-FT5] **Figure 3.** Substrate map: occlusion importance per frequency bin and per lead and the mean absolute block signature. Filled by the substrate-map output of a run on the ICD-coded comparison set.

[GAP-FT2] **Figure 4.** Intervention curve: full-model AUROC after cumulative removal of the top-n and bottom-n ranked frequency bins and leads. Filled by a plot of the intervention-curve output of a run on the ICD-coded comparison set.

##### 4.6 External analyses

The external analyses of Section 3.9 address whether the method and its frequency and lead signatures transfer to CODE-15 [ribeiro2021code15]<!--ref:ribeiro2021code15--><!--anchor:section:Description--> and PTB-XL [wagner2020]<!--ref:wagner2020--><!--anchor:section:Abstract-->. Neither dataset has dated outcomes, so these analyses do not test incident prediction, and the results of Sections 4.2 to 4.4 do not depend on them.

- External analyses: [GAP-X1] (Table 7 and a supplementary figure), filled by the stored five-fold cross-validated AUROCs for CODE-15 identification, CODE-15 detection and PTB-XL detection, and by the agreement of their frequency and lead occlusion importances with the MIMIC-IV substrate map.

Only cross-validated values will be reported for these tasks. An AUROC computed on the same records a model was trained on is an in-sample value and does not measure transfer. The external analyses complement the internal validation by showing whether the frequency and lead signatures recur in independently collected ECGs.

[GAP-X1] **Table 7.** External analyses: task, dataset, patients and cases, five-fold cross-validated AUROC, and agreement of frequency and lead importances with the MIMIC-IV substrate map for CODE-15 identification, CODE-15 detection and PTB-XL detection. Filled by the stored cross-validated outputs of the external analysis runs.

#### 5. Discussion

##### 5.1 Principal findings

BTTN + clinical reached the highest point AUROC of the seven models compared for one-year incident AF on ICD-coded MIMIC-IV-ECG outcomes, 0.7776 (0.7664 to 0.7888), against 0.7597 for the clinical model and 0.735 for the CNN. Its CI overlaps that of the clinical model and lies above that of the CNN, and the paired differences are held at [GAP-C4], filled by the saved paired-bootstrap output of the one-year run. ECG-only BTTN and the CNN reached comparable discrimination from the same tensor, 0.7397 and 0.735, so BTTN reached a point AUROC at least as high as the black-box network while its ECG evidence passes through readable frequency and lead projections. One BTTN + clinical survival model gave a higher point AUROC than the clinical Cox model at each of four horizons, from 0.723 at 90 days to 0.745 at five years. After recalibration its one-year Brier score was 0.039, and observed one-year AF rose from 0.55% to 11.4% across deciles of its risk. The faithfulness of the signatures is assessed by five pre-specified analyses ([GAP-FT1 to GAP-FT5], filled by their results on the ICD-coded comparison set).<!--evidence:E15,E10,E12,E13,E22,E35,E36,E40,E41-->

##### 5.2 Comparison with AI-ECG and clinical risk models

The results follow the complementarity of ECG and clinical information reported earlier. Khurshid and colleagues found the combination of CHARGE-AF and an ECG model above either alone in three cohorts [khurshid2022]<!--ref:khurshid2022--><!--anchor:section:Abstract-->, Christopoulos and colleagues reported 0.72 for the combination against 0.69 for each component [christopoulos2020]<!--ref:christopoulos2020--><!--anchor:section:Abstract-->, and Biton and colleagues obtained the highest AUROC by combining ECG features, learned representations and clinical data [biton2021]<!--ref:biton2021--><!--anchor:section:Abstract-->. Here the same direction appears at one year and at every survival horizon. The strength of the clinical model also agrees with prior work: CHARGE-AF and the Framingham score reached C statistics of 0.765 and 0.78 [alonso2013]<!--ref:alonso2013--><!--anchor:section:Abstract-->[schnabel2009]<!--ref:schnabel2009--><!--anchor:section:Abstract-->, and in UK Biobank CHARGE-AF reached 0.732 against 0.705 for the ECG model [khurshid2022]<!--ref:khurshid2022--><!--anchor:section:Abstract-->. The clinical model of this study includes seven measurements of the index ECG, among them P-wave duration [nielsen2015]<!--ref:nielsen2015--><!--anchor:section:Abstract-->, and the contribution of BTTN shows in fusion with the same covariates. Interpretable hand-crafted ECG features have predicted AF minutes ahead in a small database [hammer2022]<!--ref:hammer2022--><!--anchor:section:Abstract-->, whereas BTTN carries readable ECG evidence to horizons of one to five years.

Published AUROCs differ in task and horizon: new-onset AF within one year (0.85) [raghunath2021]<!--ref:raghunath2021--><!--anchor:section:Abstract-->, five-year AF or flutter with MIMIC-IV as an external set (0.77) [jabbour2024]<!--ref:jabbour2024--><!--anchor:section:Abstract-->, AF within 31 days (0.86) [yuan2023]<!--ref:yuan2023--><!--anchor:section:Abstract-->, and AF identified during sinus rhythm (0.87) [attia2019]<!--ref:attia2019--><!--anchor:section:Abstract-->. Cohorts, label sources and exclusion windows differ, so no ranking across studies is implied. The outcome here is a dated hospital diagnosis code, whereas foundation models have relied on labels extracted from ECG reports [nolinlapalme2026]<!--ref:nolinlapalme2026--><!--anchor:section:Abstract--> or did not state the AF label source in MIMIC-IV in the abstract [ko2026]<!--ref:ko2026--><!--anchor:section:Abstract-->. On MIMIC-IV-ECG, AF detection has reached an AUROC of 0.996 [mckeen2025]<!--ref:mckeen2025--><!--anchor:section:Abstract-->, close to the ceiling, and incident prediction after a 30-day blanking window is a harder task.

BTTN + SSL and BTTN + SSL + clinical reached 0.7414 and 0.7775, at the level of their supervised counterparts. Self-supervised gains on 12-lead ECG reported elsewhere were modest: the best self-supervised method came within 0.5% of supervised training in linear evaluation and fine-tuning added about 1% [mehari2022]<!--ref:mehari2022--><!--anchor:section:Abstract-->, and a self-supervised foundation model reached 0.742 against 0.734 for five-year AF risk [nolinlapalme2026]<!--ref:nolinlapalme2026--><!--anchor:section:Abstract-->.<!--evidence:E14,E16-->

##### 5.3 Interpretability by design and its measurement

In BTTN, every piece of ECG evidence reaches the temporal stage through the projections onto $A_k$ and $C_k$, and these factors are model parameters that can be read directly as frequency and lead profiles. This places BTTN with interpretable-by-design models [rudin2019]<!--ref:rudin2019--><!--anchor:section:Abstract-->[koh2020]<!--ref:koh2020--><!--anchor:section:Abstract-->[bohle2022]<!--ref:bohle2022--><!--anchor:section:Abstract--> and apart from explanations computed after training, such as LIME, Grad-CAM and SHAP in ECG studies [hughes2021]<!--ref:hughes2021--><!--anchor:section:Abstract-->[storas2023]<!--ref:storas2023--><!--anchor:section:Abstract-->[matsuo2026]<!--ref:matsuo2026--><!--anchor:section:Abstract-->. The clinical term adds age, sex and ECG measurements as a readable weight vector without entering the block layer, so fusion keeps the structure of the ECG pathway.

The claim made by construction is limited to which frequency and lead directions enter the model. The temporal stage and head are nonlinear and could recombine block channels in ways the factors alone do not show, which is the leakage concern raised for concept models [mahinpei2021]<!--ref:mahinpei2021--><!--anchor:section:Abstract-->[havasi2022]<!--ref:havasi2022--><!--anchor:section:Abstract-->. Ghassemi and colleagues argued that explanations of this kind risk false reassurance and that validation should take their place [ghassemi2021]<!--ref:ghassemi2021--><!--anchor:section:Abstract-->. This paper answers by measurement. The control probes, the intervention test and the ablations of Section 3.8 quantify how far the readouts track the model, and their interpretation is held at [GAP-FT1 to GAP-FT5], filled by those results on the ICD-coded comparison set.

The substrate map will be compared with established sinus-rhythm markers of AF risk: P-wave duration [nielsen2015]<!--ref:nielsen2015--><!--anchor:section:Abstract-->, P-wave terminal force in lead V1 [huang2020]<!--ref:huang2020--><!--anchor:section:Abstract-->[wolder2023]<!--ref:wolder2023--><!--anchor:section:Abstract-->, and the atrial fibrillatory rate measured on the surface ECG [bollmann2006]<!--ref:bollmann2006--><!--anchor:section:Abstract-->[platonov2014]<!--ref:platonov2014--><!--anchor:section:Abstract-->. That comparison is [GAP-FT5], filled by the substrate map from the ICD-coded comparison set read against these markers. BTTN also differs from the networks that share its name, which factorise weights for compression [ye2020]<!--ref:ye2020--><!--anchor:section:Abstract-->, and from block-term discriminant features passed to a separate classifier [vandenkerchove2025]<!--ref:vandenkerchove2025--><!--anchor:section:Abstract-->.

##### 5.4 Clinical implications

Targeted monitoring needs a score that concentrates future cases among few patients. Flagging the top 10% by BTTN + clinical risk captured 27.2% of one-year cases with a PPV of 11.6% at the cohort incidence, so about nine patients would be monitored per future case (number needed to monitor 8.7, against 9.8 with the clinical model). Noseworthy and colleagues found that AI-ECG risk stratification raised AF detection in high-risk patients during 30 days of monitoring [noseworthy2022]<!--ref:noseworthy2022--><!--anchor:section:Abstract-->, and Raghunath and colleagues reported a number needed to screen of 9 in a simulated deployment [raghunath2021]<!--ref:raghunath2021--><!--anchor:section:Abstract-->. Those figures come from other cohorts and definitions and serve as context only.<!--evidence:E37,E38-->

The risk gradient, from 0.55% to 11.4% across deciles, indicates that monitoring intensity could be graded by risk. A single survival model gives horizon-specific risk at 90 days and at one, two and five years (Table 3), so a monitoring programme can choose its horizon without retraining. The PPVs here are recomputed at the incidence of the eligible cohort, and a prospective study would measure them directly. Because the clinical contribution is a weight vector, the covariates that raise a given patient's clinical term can be read off, and the ECG contribution can be traced to block factors whose frequency and lead content is visible.<!--evidence:E40,E41-->

##### 5.5 Limitations

All data come from one health system, since MIMIC-IV is drawn from Beth Israel Deaconess Medical Center [johnson2023]<!--ref:johnson2023--><!--anchor:section:Abstract-->. Internal validation used repeated patient-level cross-validation with patient-bootstrap CIs, but no external cohort with dated outcomes was available. The external analyses address identification and detection, a different task, and their results are [GAP-X1], filled by the stored cross-validated external outputs. Validation in an external dated-outcome cohort is the next study needed, followed by prospective evaluation.

Outcomes are hospital diagnosis codes dated by admission time. AF diagnosed only in outpatient care or never diagnosed is missed, a coded date can lag the true onset, and code I48 includes atrial flutter, as does the outcome of Jabbour and colleagues [jabbour2024]<!--ref:jabbour2024--><!--anchor:section:Abstract-->. The 30-day blanking window and the exclusion of patients with an AF-reading ECG reduce misclassification of prevalent AF as incident, and they cannot remove it.

Control follow-up is inferred from the last ECG or the date of death. The shares of controls with a later ECG (98.1%) and with a latest later ECG that did not read AF (96.5%) support their control status without confirming the absence of AF.<!--evidence:E8,E9-->

The one-year comparison used case-control sampling with four controls per case and caps on cohort size. AUROC is a rank statistic [hanley1982]<!--ref:hanley1982--><!--anchor:section:Abstract--> and the same sample served all seven models, but PPV and number needed to monitor were recomputed at the cohort incidence and not measured.

Comparisons rest on point estimates and marginal CIs. The CIs of BTTN + clinical and the clinical model overlap, paired differences are [GAP-C4] (filled by the saved paired-bootstrap output), and no concordance index is reported because it was not stored.

Until the faithfulness analyses are available on the ICD-coded cohort ([GAP-FT1 to GAP-FT5], filled by their outputs), the interpretability claim covers the structure of the model only.

The contrastive pretraining pool of 30,000 ECGs was sampled from all MIMIC-IV-ECG patients and may include cohort patients. Pretraining used no labels, and BTTN and BTTN + clinical used no pretraining, so this affects only the SSL rows.

Preprocessing applied a 50 Hz notch, whereas the recordings come from a United States hospital with 60 Hz mains. Both frequencies lie above the 40 Hz limit of the tensor, and decimation used an anti-aliasing filter, but spectral leakage into the highest retained bins was not measured.

Baseline characteristics by outcome are [GAP-T1], filled by descriptive statistics of the cohort files.

#### 6. Conclusion

A block-term tensor network that routes all ECG evidence through 12 readable frequency-by-lead block projections, and adds age, sex and seven ECG measurements as a separate linear clinical term, reached the highest point AUROC of seven models compared for one-year incident AF from one sinus-rhythm 12-lead ECG on ICD-coded MIMIC-IV outcomes. Its AUROC was 0.7776 (95% CI 0.7664 to 0.7888), against 0.7597 (0.7488 to 0.7713) for a clinical risk-factor model and 0.735 (0.7226 to 0.7469) for a CNN on the same tensor, folds and patients. Without the clinical term, BTTN reached discrimination comparable to the CNN. Trained once as a survival model, BTTN + clinical gave a higher point AUROC than a clinical Cox model at 90 days and at one, two and five years, and its one-year risk separated deciles with observed AF rates from 0.55% to 11.4%. These results answer the accuracy half of the research question as point estimates with confidence intervals, and the paired differences are held at [GAP-C4], filled by the saved paired-bootstrap output.<!--evidence:E15,E10,E12,E40,E41-->

The interpretability of BTTN rests on its structure. The frequency and lead directions that the model can use are its block factors, the clinical contribution is a weight vector outside the block layer, and the block scores can be read without the nonlinear head. Whether these readouts track the model's computation is the second half of the research question. The faithfulness of the signatures is assessed by five pre-specified analyses ([GAP-FT1 to GAP-FT5]), filled when the control probes, the intervention curve, the two ablations and the substrate map are available on the ICD-coded cohort. Together with validation in an external cohort with dated outcomes, those analyses decide how far the readable signatures can support clinical interpretation of an individual risk estimate.

#### Declarations

**Data availability.** MIMIC-IV-ECG version 1.0 [gow2023]<!--ref:gow2023--><!--anchor:section:Abstract--> (doi:10.13026/4nqg-sb35) and the MIMIC-IV hospital module [johnson2023]<!--ref:johnson2023--><!--anchor:section:Abstract--> are available under credentialed access on PhysioNet [goldberger2000]<!--ref:goldberger2000--><!--anchor:section:Abstract-->. CODE-15 [ribeiro2021code15]<!--ref:ribeiro2021code15--><!--anchor:section:Description--> and PTB-XL [wagner2020]<!--ref:wagner2020--><!--anchor:section:Abstract--> were used for the external analyses. No raw data are redistributed. The analysis code is released under the MIT license. Repository URL or archive DOI: [GAP-REPO], filled by the public repository URL or archive DOI of the released code.

**Ethics statement.** [GAP-ETH], filled by the authors' wording on ethics approval or exemption, waiver of consent, de-identification of the data and the data use agreements for MIMIC-IV-ECG and the MIMIC-IV hospital module.

**Author contributions (CRediT).** [GAP-CREDIT], filled by the CRediT roles of each author.

**Conflicts of interest.** [GAP-COI], filled by each author's declaration of competing interests.

**Funding.** [GAP-FUND], filled by the funders and grant numbers, or a statement that no specific funding was received.

**Declaration of generative AI use.** AI agents were used for literature search, outlining and drafting of this manuscript. Authors' verification statement: [GAP-AIUSE], filled by the named authors' statement that they reviewed and edited the content and take responsibility for it.

**Supplementary material.** TRIPOD+AI checklist [collins2024]<!--ref:collins2024--><!--anchor:section:Abstract-->. Table S1, hyperparameters of preprocessing, BTTN, the clinical term and the comparators as stated in Sections 3.3 to 3.6. Supplementary figure of external frequency and lead importances: [GAP-X1], filled by the stored external importance outputs.

**References.** Generated by the formatter in Vancouver style, numbered in order of first citation, from the cited keys.

## Dimension Scores

Word-count method used in D4 and D5: the hidden citation, anchor and evidence comments (`<!--...-->`) are removed, and the whitespace-separated tokens are counted in the prose paragraphs and bullet items of Sections 1 to 6. Headings, tables, table notes, figure and table captions (including the [GAP] table and figure placeholders), display equations, the title block, the abstract, the declarations and the reference placeholder are excluded. A visible citation key such as `[attia2019]` counts as one token, as its numbered Vancouver form will. The count was produced with `sed` and `awk` on `run/draft/draft_v1.md`; no project code was run.

| Section | Outline allocation | Words | Deviation |
|---|---|---|---|
| 1 Introduction | 850 | 857 | +0.8% |
| 1.1 / 1.2 / 1.3 / 1.4 | 200 / 250 / 250 / 150 | 166 / 264 / 258 / 169 | -17.0% / +5.6% / +3.2% / +12.7% |
| 2 Related work | 700 | 741 | +5.9% |
| 2.1 / 2.2 | 350 / 350 | 373 / 368 | +6.6% / +5.1% |
| 3 Methods | 2,100 | 2,297 | +9.4% |
| 3.1 / 3.2 / 3.3 / 3.4 / 3.5 | 180 / 280 / 170 / 480 / 150 | 160 / 301 / 181 / 552 / 154 | -11.1% / +7.5% / +6.5% / +15.0% / +2.7% |
| 3.6 / 3.7 / 3.8 / 3.9 | 200 / 250 / 240 / 150 | 228 / 287 / 283 / 151 | +14.0% / +14.8% / +17.9% / +0.7% |
| 4 Results | 1,250 | 1,359 | +8.7% |
| 4.1 / 4.2 / 4.3 / 4.4 / 4.5 / 4.6 | 180 / 360 / 190 / 210 / 160 / 150 | 202 / 382 / 212 / 236 / 187 / 140 | +12.2% / +6.1% / +11.6% / +12.4% / +16.9% / -6.7% |
| 5 Discussion | 1,300 | 1,416 | +8.9% |
| 5.1 / 5.2 / 5.3 / 5.4 / 5.5 | 200 / 300 / 250 / 200 / 350 | 185 / 349 / 274 / 211 / 397 | -7.5% / +16.3% / +9.6% / +5.5% / +13.4% |
| 6 Conclusion | 300 | 290 | -3.3% |
| Body total | 6,500 | 6,960 | +7.1% |
| Abstract (not in body) | about 250 | 268 | +7.2% |

Section 3.8 is allocated 250 words in the outline's detailed section and 240 in its word-count summary; the deviation above uses 240.

### D1: section_completeness

pass. Every heading of the approved outline is present in order: Abstract with six keywords; 1.1 to 1.4; 2.1 and 2.2; 3.1 to 3.9; 4.1 to 4.6; 5.1 to 5.5; 6. Tables 1 to 4 are written out from the admitted files, Table 5 to 7 and Figures 1, 3 and 4 are labelled [GAP] placeholders with the outline's description of their content, and Figure 2 is `code/results/clin_eval.png` with a caption. The declarations carry data availability (written, with [GAP-REPO] for the code URL), ethics [GAP-ETH], CRediT [GAP-CREDIT], conflicts of interest [GAP-COI], funding [GAP-FUND] and the AI-use disclosure with [GAP-AIUSE] for the authors' verification statement, plus the supplementary list and a reference placeholder. Every [GAP] sits where the run configuration prescribes one: authors, CRediT, funding, conflicts and ethics (`run/settings.md` "Confirmed by Axel"), paired deltas (C4), faithfulness (C2), external analyses (C3), baseline characteristics and Figure 1 (checkpoint log rulings under C6), and the repository URL and authors' AI-use verification (outline back matter). Each placeholder states in one sentence what fills it.

### D2: citation_density

warn. All 65 cited keys are in `run/search/references.bib`, checked by listing the `<!--ref:...-->` keys and comparing them with the bib keys (no cited key is outside the bib; harrell1982, hindricks2021 and yokota2014 are not cited, as the outline conditions their use on a C-index, a full-text check and a description of ACE rank estimation, none of which applies). Each source is cited only for what its annotation states; every citation carries the two-layer form `[key]<!--ref:key-->` plus an anchor `<!--anchor:section:Abstract-->` (`section:Description` for the Zenodo record of CODE-15), since each annotation was written from that part of the record. Every result paragraph and every results table carries a hidden `<!--evidence:E..-->` marker naming its evidence-map IDs, and every result number was compared with its admitted file (`table1_cis.csv` rows 2 to 8, `multihorizon_icd_spectral.csv` rows 2 to 5, `clin_eval_operating_points.csv` rows 2 to 13, `risk_strata.csv` rows 2 and 11, `cohort_accounting.csv` rows 2 to 40, label counts of the three ICD cohort files); derived values (9,275, 7,420, prevalence 0.20, incidence 0.0425, PPV about 2.7 times incidence, decile ratio 20.7, 1.95 Hz bin spacing) are labelled as derived. The score is warn and not pass because one factual statement outside the paper's results has no source in the corpus: in 5.5, the recordings come from a United States hospital "with 60 Hz mains". The argument blueprint (K8) admits this as general knowledge, and no verified source establishes it. A few design rationales are also stated without a citation (a spectrogram tolerates shifts in beat timing; the Brier score at about 4% event rate is dominated by the event rate); they are reasoning about the method and are written as such.

### D3: argument_blueprint_fidelity

pass. Claims follow the blueprint's claim-evidence-reasoning chains with its allowed wording: "highest point AUROC" (A3.1), overlapping CIs against the clinical model with paired differences at [GAP-C4] (A3.3, A3.7), non-overlapping CIs against the CNN with the unequal-input caveat (A3.2, K9), "comparable" and "at least as high" for ECG-only BTTN against the CNN (A3.4), the linear BTTR step (A3.5), the SSL rows "at the level of" their supervised counterparts (A3.6), "higher point AUROC at every horizon" with no CI for the clinical Cox model (A4.1), Brier scores not used to rank (A4.4), "PPV recalibrated to the cohort incidence" (A4.5), "about twentyfold" without "monotonic" (A4.6), and a qualitative decision curve (A4.7). A scan for "significan", "outperform", "superior", "equivalen", "no loss" and "faithful by construction" finds none; "more accurately than" appears only in the restated research question. Faithfulness and external results are held at [GAP-FT1 to GAP-FT5] and [GAP-X1] with no outcome stated in either direction. The design statements match the code lines the outline cites (block projection without core tensor, `core/bttn.py:65-66,77-83`; temporal stage and pooling, `:68-72,93-100`; head, `:152-156`; Cox loss, `:181-187`; clinical term after the head, `:133-135,176-177`; covariate standardisation and warm start, `:195-200,240-253`; nine covariates, `core/bench.py:30`; cohort rules, `core/cohort.py:22-26,103-133`; preprocessing, `core/preprocess.py:24-59,83-105`; CNN, `core/cnn.py:21-99`; SSL, `core/ssl_pretrain.py:33-117`; evaluation, `experiments/compute_table1_cis.py:14-25`, `experiments/multihorizon.py:38-114`, `experiments/clin_eval.py:20-83`; faithfulness and external scripts as listed in outline 3.8 and 3.9). Two code facts refine the outline wording: the faithfulness probes, intervention test and block-structure ablation train single ECG-only models per fold (`core/bttn.py:312-350` via `train_model`), and the block signature uses the first two columns of $A_k$ (`core/bttn.py:114-115`); the draft states both. Counter-arguments are handled where the blueprint places them: K1 in 4.2, 5.1 and 5.5; K2 in 4.2 and 5.2; K3 in 4.3; K4 in 5.5; K5 in 3.2 and 5.5; K6 in 3.4, 4.5, 5.3 and 6; K7 in 3.9, 4.6 and 5.5; K8 in 3.3 and 5.5; K9 in 4.2; K10 in 3.4 and 5.5; K11 in 3.2, 3.7 and 5.5; K12 in 4.1; K13 in 3.7 and 5.5.

### D4: total_word_count

pass. The body counts 6,960 words against the 6,500 target, a deviation of +7.1%, inside the band of 5,850 to 7,150. The method is stated above the table.

### D5: per_section_word_count

pass. All six sections lie within plus or minus 20% of their allocations (largest deviation Methods +9.4%), and every subsection also lies within plus or minus 20% (largest deviations 3.8 +17.9% and 1.1 -17.0%), as the table above shows.

### D6: acknowledged_limitations

pass. Section 5.5 states, in plain terms, every limitation listed in outline 5.5 and in the blueprint's limitation placements: one health system with no external dated-outcome cohort and external tasks that differ from incident prediction ([GAP-X1]) (K4, K7); outcome ascertainment from admission ICD codes dated by admission time, missed outpatient and undiagnosed AF, lagging coded dates and flutter in I48 (K5); control follow-up inferred from the last ECG or death with the 98.1% and 96.5% checks (outline 5.5); case-control sampling with recomputed PPV (K11); point estimates and marginal CIs, overlapping CIs against the clinical model, paired deltas [GAP-C4] and no concordance index (K1, K13); faithfulness held at [GAP-FT1 to GAP-FT5], so the interpretability claim covers structure only (K6); the SSL pool that may include cohort patients, label-free and absent from the headline model (K10); the 50 Hz notch on recordings with 60 Hz mains, the 40 Hz limit and the unmeasured leakage into the top bins (K8); baseline characteristics [GAP-T1] (K12). Future work (external dated-outcome validation and prospective evaluation) is folded into the first limitation as the outline asks.

### D7: register_consistency

pass. The draft keeps a formal third-person register for a clinical AI journal, with past tense in Methods and Results and present tense in interpretation. Checks against the writing-quality checklist: no em or en dashes and no spaced-hyphen dashes (non-ASCII scan of `draft_v1.md` returns no line); no semicolons in the prose (the only semicolons are the keyword separators and those inside Table 1 cells and the Table 2 note); none of the 25 flagged terms (scan returned no hit); no throat-clearing openers or "this section will" meta-commentary beyond the Introduction roadmap; fixed names used throughout (BTTN, BTTN + clinical, BTTN + SSL, BTTN + SSL + clinical, clinical model, clinical Cox model, CNN, linear BTTR, block factors, block scores, clinical term); paragraph lengths vary from two-sentence paragraphs (4.2, 4.5) to long argument paragraphs (2.1, 3.4). Negations in the text are factual statements of scope, and no "not X, it is Y" device is used for emphasis.

## Failure Condition Checks

### FC1

did not fire. No mandatory dimension (D1, D2, D3, D6) scores block: D1, D3 and D6 pass and D2 is warn. No must_not item is violated: every number traces to an admitted gold-label file or is a labelled derivation of admitted numbers or a code setting; nothing is taken from `RESULTS.md`, an `*ecg*` file, an undetermined-label file or an external file; no difference is called significant; no faithfulness or external outcome is stated while those results are placeholders; no result is framed as negative or null, and no dead end, provisional result, retracted analysis or attic work is mentioned.

### FC4

did not fire. Every mandatory claim the outline and blueprint require has admitted evidence or a prescribed [GAP] placeholder, so no mandatory dimension is blocked by missing inputs.

### FC2

did not fire. D4 and D5 both pass.

### FC3

fired. D2 scores warn (one general-knowledge statement about the mains frequency of the recording site has no source in the verified corpus) and no dimension scores block. Dimensions involved: D2.

### FC0

did not fire. FC3 fired, so the no-other-condition baseline does not apply.

## Writer Decision

writer_decision=accept
