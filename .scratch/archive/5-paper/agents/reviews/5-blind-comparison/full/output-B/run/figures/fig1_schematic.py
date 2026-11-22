"""Figure 1: schematic of the block-term tensor network (BTTN) as configured in the paper.

Draws the model defined in code/core/bttn.py with the input of code/core/preprocess.py
(_spectral, lines 83-105) and the clinical covariates of code/core/bench.py (CLIN_COLS,
line 30). Every label is a design fact read from those files; the figure holds no result
number and no interpretive claim. The ECG traces are a synthetic sinus-rhythm drawing,
not data.

Pure matplotlib: no torch, no data files. Writes run/figures/fig1_schematic.pdf
(vector) next to this script.

Render with:  python run/figures/fig1_schematic.py
"""
from pathlib import Path

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import Circle, FancyArrowPatch, FancyBboxPatch, Polygon, Rectangle

# APA 7.0 figure settings (references/statistical_visualization_standards.md)
matplotlib.rcParams.update({
    "font.family": "sans-serif",
    "font.sans-serif": ["Arial", "Helvetica", "DejaVu Sans"],
    "font.size": 8,
    "figure.dpi": 300,
    "savefig.dpi": 300,
    "savefig.bbox": "tight",
    "pdf.fonttype": 42,
})

# Colorblind-safe categorical palette (Tol)
BLUE, CYAN, TEAL, ORANGE = "#0077BB", "#33BBEE", "#009988", "#EE7733"
MAGENTA, GREY, BLACK = "#EE3377", "#BBBBBB", "#000000"

FS_TEXT = 8        # minimum text size (pt)
FS_TITLE = 8.5     # stage titles (pt)

OUT = Path(__file__).resolve().parent / "fig1_schematic.pdf"

# One axes over the whole figure; data units are inches (6.9 in = double column).
W_IN, H_IN = 6.9, 5.0
fig = plt.figure(figsize=(W_IN, H_IN))
ax = fig.add_axes([0, 0, 1, 1])
ax.set_xlim(0, W_IN)
ax.set_ylim(0, H_IN)
ax.set_aspect("equal")
ax.axis("off")


def stage_box(x0, y0, x1, y1, color):
    """Rounded stage frame with a light fill of the stage color."""
    ax.add_patch(FancyBboxPatch((x0, y0), x1 - x0, y1 - y0,
                                boxstyle="round,pad=0.0,rounding_size=0.05",
                                fc=color, ec=color, lw=1.0, alpha=0.12))
    ax.add_patch(FancyBboxPatch((x0, y0), x1 - x0, y1 - y0,
                                boxstyle="round,pad=0.0,rounding_size=0.05",
                                fc="none", ec=color, lw=1.0))


def text(x, y, s, size=FS_TEXT, ha="center", va="center", bold=False, color=BLACK):
    ax.text(x, y, s, ha=ha, va=va, fontsize=size,
            fontweight="bold" if bold else "normal", color=color)


def arrow(p, q, color=BLACK, lw=1.0):
    ax.add_patch(FancyArrowPatch(p, q, arrowstyle="-|>", mutation_scale=9,
                                 lw=lw, color=color, shrinkA=0, shrinkB=0))


def factor_grid(x0, y0, w, h, ncol, nrow, color):
    """Matrix drawing: nrow x ncol cells (rows = mode index, columns = rank)."""
    ax.add_patch(Rectangle((x0, y0), w, h, fc=color, ec=BLACK, lw=0.8, alpha=0.55))
    for j in range(1, ncol):
        ax.plot([x0 + j * w / ncol] * 2, [y0, y0 + h], color=BLACK, lw=0.5)
    for i in range(1, nrow):
        ax.plot([x0, x0 + w], [y0 + i * h / nrow] * 2, color=BLACK, lw=0.3)


# Row geometry (inches)
R1_LO, R1_HI = 2.95, 4.60      # row 1: input, tensor, block-term layer, temporal convolution
R2_LO, R2_HI = 1.45, 2.60      # row 2: pooling, MLP head, sum, Cox output
R3_LO, R3_HI = 0.10, 1.20      # row 3: clinical term
T1 = R1_HI + 0.08              # row-1 title baseline

# ---------------------------------------------------------------- row 1
# Stage 1: 12-lead sinus ECG (synthetic drawing). preprocess.py:93 iterates over the 12 leads.
x0, x1 = 0.10, 1.45
stage_box(x0, R1_LO, x1, R1_HI, BLUE)
text((x0 + x1) / 2, T1, "12-lead ECG", size=FS_TITLE, va="bottom", bold=True)
u = np.linspace(0.0, 1.0, 400)
beat = np.zeros_like(u)
for c in (0.17, 0.50, 0.83):                                   # three sinus beats
    beat += 0.15 * np.exp(-((u - (c - 0.07)) / 0.012) ** 2)    # P wave
    beat += 1.00 * np.exp(-((u - c) / 0.004) ** 2)             # QRS
    beat -= 0.20 * np.exp(-((u - (c + 0.012)) / 0.004) ** 2)  # S
    beat += 0.25 * np.exp(-((u - (c + 0.11)) / 0.020) ** 2)    # T wave
for lead in range(12):
    yb = 3.30 + lead * 0.105
    ax.plot(0.20 + u * 1.15, yb + 0.07 * beat, color=BLACK, lw=0.45)
text((x0 + x1) / 2, 3.07, "sinus rhythm")
arrow((x1, 3.78), (1.65, 3.78))

# Stage 2: log-magnitude spectrogram tensor X (F x T x L). preprocess.py:83-105.
x0, x1 = 1.65, 3.00
stage_box(x0, R1_LO, x1, R1_HI, TEAL)
text((x0 + x1) / 2, T1, "Spectrogram tensor", size=FS_TITLE, va="bottom", bold=True)
ox, oy, cw, chh, d = 2.00, 3.78, 0.50, 0.50, 0.30
sx, sy = 0.5 * d, 0.5 * d
ax.add_patch(Polygon([(ox, oy), (ox + cw, oy), (ox + cw, oy + chh), (ox, oy + chh)],
                     fc=TEAL, ec=BLACK, lw=0.8, alpha=0.45))
ax.add_patch(Polygon([(ox, oy + chh), (ox + cw, oy + chh), (ox + cw + sx, oy + chh + sy),
                      (ox + sx, oy + chh + sy)], fc=TEAL, ec=BLACK, lw=0.8, alpha=0.30))
ax.add_patch(Polygon([(ox + cw, oy), (ox + cw + sx, oy + sy), (ox + cw + sx, oy + chh + sy),
                      (ox + cw, oy + chh)], fc=TEAL, ec=BLACK, lw=0.8, alpha=0.60))
text(ox + cw / 2, oy + chh / 2, r"$\mathcal{X}$", size=10)
text(ox - 0.05, oy + chh / 2, r"$F$", ha="right")                 # frequency mode (rows)
text(ox + cw / 2, oy - 0.04, r"$T$", va="top")                    # time mode (columns)
text(ox + cw + sx / 2 + 0.06, oy + chh + sy / 2 + 0.02, r"$L$", ha="left")   # lead mode (depth)
text((x0 + x1) / 2, 3.45, "log-magnitude STFT")
text((x0 + x1) / 2, 3.31, r"$F$: 0 to 40 Hz")
text((x0 + x1) / 2, 3.17, r"$T$ = 40 time frames")
text((x0 + x1) / 2, 3.03, r"$L$ = 12 leads")
arrow((x1, 3.78), (3.20, 3.78))

# Stage 3: block-term layer, K = 12 blocks, A_k (F x 3) and C_k (L x 2), no core tensor.
# bttn.py:43,123 (K=12, rf=3, rl=2); 65-66 (A, C); 77-83 (projection).
x0, x1 = 3.20, 5.05
stage_box(x0, R1_LO, x1, R1_HI, ORANGE)
text((x0 + x1) / 2, T1, r"Block-term layer, $K$ = 12", size=FS_TITLE, va="bottom", bold=True)
gy0, gh = 3.80, 0.55
factor_grid(3.40, gy0, 0.27, gh, ncol=3, nrow=10, color=ORANGE)    # A_k: F rows x 3 columns
text(3.535, gy0 + gh + 0.04, r"$A_k$", va="bottom", size=9)
text(3.535, gy0 - 0.04, r"$F \times 3$", va="top")
factor_grid(4.70, gy0, 0.18, gh, ncol=2, nrow=12, color=CYAN)      # C_k: 12 lead rows x 2 columns
text(4.79, gy0 + gh + 0.04, r"$C_k$", va="bottom", size=9)
text(4.79, gy0 - 0.04, r"$L \times 2$", va="top")
text(4.185, gy0 + gh / 2 + 0.08, r"$A_k$: frequency")
text(4.185, gy0 + gh / 2 - 0.08, r"$C_k$: lead")
text((x0 + x1) / 2, 3.42,
     r"$\mathcal{Z}_k = \mathcal{X} \times_1 A_k^{\top} \times_3 C_k^{\top}$", size=8.5)
text((x0 + x1) / 2, 3.22, "no core tensor")
text((x0 + x1) / 2, 3.07, r"72 channels over $T$")
arrow((x1, 3.78), (5.25, 3.78))

# Stage 4: multi-scale grouped temporal convolutions, kernels 3, 7, 15.
# bttn.py:43 (ksizes=(3, 7, 15), ct=6); 69-70 (grouped Conv1d); 93 (BatchNorm, ReLU).
x0, x1 = 5.25, 6.80
stage_box(x0, R1_LO, x1, R1_HI, BLUE)
text((x0 + x1) / 2, T1, "Temporal convolution", size=FS_TITLE, va="bottom", bold=True)
bar_x0, bar_w, n_t = 5.66, 1.05, 40
for row, ks in enumerate((3, 7, 15)):
    yb = 4.22 - row * 0.22                                     # time axis of T = 40 frames
    text(5.62, yb + 0.04, "%d" % ks, ha="right")
    ax.add_patch(Rectangle((bar_x0, yb), bar_w, 0.08, fc="white", ec=BLACK, lw=0.6))
    ax.add_patch(Rectangle((bar_x0 + 10 * bar_w / n_t, yb), ks * bar_w / n_t, 0.08,
                           fc=BLUE, ec=BLACK, lw=0.6, alpha=0.7))
text(5.33, 4.45, "kernel size", ha="left")
text((x0 + x1) / 2, 3.52, "grouped: 6 filters per")
text((x0 + x1) / 2, 3.38, "channel and kernel size")
text((x0 + x1) / 2, 3.22, "BatchNorm, ReLU")
text((x0 + x1) / 2, 3.07, r"$1296 \times T$ output")

# Connector from stage 4 (row 1) to stage 5 (row 2)
ycon = 2.78
ax.plot([(x0 + x1) / 2, (x0 + x1) / 2], [R1_LO, ycon], color=BLACK, lw=1.0)
ax.plot([(x0 + x1) / 2, 1.00], [ycon, ycon], color=BLACK, lw=1.0)
arrow((1.00, ycon), (1.00, R2_HI))

# ---------------------------------------------------------------- row 2
# Stage 5: softmax attention pooling over time, concatenated with max pooling over time.
# bttn.py:72 (attention scores), 94-95 (softmax over time; max over time), 100 (concatenation).
x0, x1 = 0.10, 1.90
stage_box(x0, R2_LO, x1, R2_HI, BLUE)
text((x0 + x1) / 2, R2_HI - 0.12, "Pooling over time", size=FS_TITLE, bold=True)
ax.add_patch(Rectangle((0.20, 1.85), 0.75, 0.48, fc="white", ec=BLUE, lw=0.8))
text(0.575, 2.17, "softmax")
text(0.575, 2.02, "attention")
ax.add_patch(Rectangle((1.05, 1.85), 0.75, 0.48, fc="white", ec=BLUE, lw=0.8))
text(1.425, 2.09, "max")
text((x0 + x1) / 2, 1.70, "concatenated:")
text((x0 + x1) / 2, 1.56, "2592 features")
arrow((x1, 2.00), (2.15, 2.00))

# Stage 6: MLP head 256, 128, 1 giving the ECG log-risk. bttn.py:123 (hidden=256), 152-156.
x0, x1 = 2.15, 3.75
stage_box(x0, R2_LO, x1, R2_HI, BLUE)
text((x0 + x1) / 2, R2_HI - 0.12, "MLP head", size=FS_TITLE, bold=True)
text((x0 + x1) / 2, 2.30, "Linear 256, ReLU")
text((x0 + x1) / 2, 2.16, "Linear 128, ReLU")
text((x0 + x1) / 2, 2.02, "Linear 1")
text((x0 + x1) / 2, 1.86, "(BatchNorm, dropout)")
text((x0 + x1) / 2, 1.62, r"ECG log-risk $\eta_{\mathrm{ECG}}$")

# Sum node: eta = eta_ECG + w^T c. bttn.py:175-177.
cx, cy, r = 4.15, 2.00, 0.13
arrow((x1, 2.00), (cx - r, cy))
ax.add_patch(Circle((cx, cy), r, fc="white", ec=BLACK, lw=1.0))
text(cx, cy, "+", size=10)
arrow((cx + r, cy), (4.55, 2.00))

# Stage 7: Cox partial-likelihood loss on the summed log-risk. bttn.py:181-187, 270-271.
x0, x1 = 4.55, 6.80
stage_box(x0, R2_LO, x1, R2_HI, BLACK)
text((x0 + x1) / 2, R2_HI - 0.12, "Survival output", size=FS_TITLE, bold=True)
text((x0 + x1) / 2, 2.26,
     r"log-risk $\eta = \eta_{\mathrm{ECG}} + \mathbf{w}^{\top}\mathbf{c}$", size=8.5)
text((x0 + x1) / 2, 2.06, "Cox partial-likelihood loss")
text((x0 + x1) / 2, 1.92, "(within-batch risk sets)")
text((x0 + x1) / 2, 1.70, "one score; risk at any horizon")

# ---------------------------------------------------------------- row 3
# Clinical term: nine covariates (bench.py:30), linear map without bias (bttn.py:133),
# added after the head (bttn.py:176-177); it is not an input to the block layer.
x0, x1 = 2.90, 5.40
stage_box(x0, R3_LO, x1, R3_HI, MAGENTA)
text((x0 + x1) / 2, R3_HI - 0.12, r"Clinical covariates $\mathbf{c}$ (9)", size=FS_TITLE, bold=True)
text((x0 + x1) / 2, 0.88, "age, sex, RR,")
text((x0 + x1) / 2, 0.74, "P duration, QRS duration, QT,")
text((x0 + x1) / 2, 0.60, "P axis, QRS axis, T axis")
text((x0 + x1) / 2, 0.36, r"linear term $\mathbf{w}^{\top}\mathbf{c}$ (no bias)")
arrow((cx, R3_HI), (cx, cy - r), color=MAGENTA, lw=1.2)
text(2.78, 0.80, "added to the log-risk;", ha="right", color=MAGENTA)
text(2.78, 0.66, "not an input to the", ha="right", color=MAGENTA)
text(2.78, 0.52, "block-term layer", ha="right", color=MAGENTA)
text(2.78, 0.32, "(models with clinical term only)", ha="right", color=MAGENTA)   # bttn.py:132-133

fig.savefig(OUT, format="pdf")
print("[saved] %s" % OUT)
