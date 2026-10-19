# Figures

The visualization agent reads this page to decide which figures a paper needs, to draw them from the project's data, to check them and to write the trace of each. It writes the scripts and the images in `figures/` of the run folder and the trace in `figures.md`. It changes no manuscript file. The draft writer adds the figures by a patch after the first draft.

## What the agent reads

- `config.md`: Venue, Venue limits, Citation style, Materials in hand and the Notes.
- The project's results data and statistical output that the Materials in hand row names, as CSV files, tables or described data.
- `outline.md`, for the places where it calls for a figure, and `arguments.md`, for evidence that a figure would show better than a sentence.
- The main `.tex`, when it exists, for the Results section and the claims that need a figure.
- Under "figures in parallel" no `.tex` exists when the agent runs. Check 9 then compares the plotted values with the data file and with the numbers `arguments.md` states, and the trace lists under "Claims in the manuscript" the claims of `arguments.md` that lean on the figure, each by its sub-argument number. The integrity check compares them with the manuscript, as its "The figures and the tables" says.
- The names of the files in the manuscript's folder and in its `figures/` folder, which the session puts in the prompt.
- The language of the scripts is Python, unless the Notes of `config.md` ask for R.

## Whether to draw a figure

The agent lists the quantitative results of the Results section that a figure would show better than a sentence or a table. It draws no figure for these cases:

| Case | What the agent does |
|---|---|
| Fewer than 3 data points | States the result in text, or suggests a table. |
| A single percentage or mean | States it in the text. |
| A chart that needs more than 2 sentences to explain | Suggests a table. |
| Data already in a table of the paper | Draws no second form of it. |
| All values identical | Reports the result as text. |
| One category only | Reports it as descriptive text, since no comparison is possible. |

- A dataset with missing values is drawn after the agent notes the missing values in the caption and says how it handled them. A value is omitted or interpolated, and an interpolation is disclosed.
- A data range that is too narrow gets an adjusted axis scale that the axis label states. An axis is never truncated without disclosure.
- Every figure shows only values the project's data hold. The agent never invents a data point to fill a chart.
- When the only source of a figure is a table or a sentence of the manuscript, the script holds the numbers copied from it.
- In that case the trace names the section and the table as the source.
- The result of this stage is the list of figure candidates, each with the result it shows. A candidate whose chart type is ambiguous goes to the user in the report.

## Choosing the chart

| The data | The question | Chart | Avoid |
|---|---|---|---|
| Categories and values, 7 categories or fewer | Compare magnitudes | Bar chart | Pie chart |
| Categories and values, more than 7 categories | Compare magnitudes | Horizontal bar chart | Pie chart |
| Categories, values and groups | Compare across groups | Grouped bar chart | 3D bar chart |
| Proportions that sum to 100 percent | Show composition | Stacked bar chart | Pie chart |
| One continuous variable in one group | Show the distribution | Histogram with a density curve | |
| One continuous variable in 2 to 5 groups | Compare distributions | Boxplot, or violin plot to show the shape | A bar chart of means only |
| Two continuous variables | Show the relationship | Scatter plot with a regression line | |
| A time series of 1 series | Show the trend | Line chart | A bar chart |
| A time series of 2 to 5 series | Show the trends | Multi-line chart | |
| A time series of more than 5 series | Show the trends | Small multiples, as faceted line charts | A chart of many crossing lines |
| A correlation matrix | Show relationships among many variables | Heatmap | A scatter plot matrix |
| Effect sizes with confidence intervals | Summarize a meta-analysis | Forest plot | A bar chart |
| Effect sizes with standard errors | Check publication bias | Funnel plot | |
| Concepts and relationships | Map a framework | Network graph or concept map | |
| Geographic data | Show spatial patterns | Choropleth map | |

- When none of these fits, the agent takes the simplest chart that conveys the message.
- Templates for the bar chart, boxplot, line chart, scatter plot, forest plot, heatmap, funnel plot and grouped bar chart stand under "The scripts". The other charts follow the same standards.

## The standards of a figure

### Size and resolution

| Context | Width | Height | Resolution |
|---|---|---|---|
| Single column | 3.3 in (84 mm) | Proportional | 300 dpi |
| 1.5 columns | 5.0 in (127 mm) | Proportional | 300 dpi |
| Double column or full page | 6.9 in (175 mm) | Proportional | 300 dpi |
| Presentation or poster | 10.0 in (254 mm) | Proportional | 150 dpi |

- The widths of the venue's template replace these when the Venue limits row or the template states them.
- The aspect ratio is 4:3 for most charts, 16:9 for trend lines, and 1:1 for heatmaps and network graphs.
- A figure too wide for a single column takes the double column width, and the caption says so.
- The agent saves every figure as a PDF and as a PNG at the resolution above. A venue that requires EPS also gets the `savefig` call for EPS.

### Type

| Element | Size | Family |
|---|---|---|
| Axis labels | 9 to 10 pt | Sans-serif such as Arial or Helvetica |
| Axis tick labels | 8 to 9 pt | Sans-serif |
| Title inside the figure | 10 to 12 pt, bold | Sans-serif |
| Legend text | 8 to 9 pt | Sans-serif |
| Annotation text | 8 pt | Sans-serif |

- No text in the final figure is smaller than 8 pt.
- A figure with non-Latin labels uses a font that has the glyphs, and the agent reads the rendered image before it reports.

### Colour

Viridis, for continuous data, perceptually uniform and safe for colour-blind readers:

```
#440154, #46327E, #365C8D, #277F8E, #1FA187, #4AC16D, #9FDA3A, #FDE725
```

Cividis, for a publication where colour-blind access matters most:

```
#00204D, #00336F, #39486B, #5F5D6A, #7B7463, #9A8C4F, #BBA634, #DEC000, #FFE945
```

Categorical, with at most 8 categories:

| Name | Hex | Use |
|---|---|---|
| Blue | `#0077BB` | Group 1 or the baseline |
| Cyan | `#33BBEE` | Group 2 |
| Teal | `#009988` | Group 3 |
| Orange | `#EE7733` | Group 4 or a highlight |
| Red | `#CC3311` | Group 5 or an alert |
| Magenta | `#EE3377` | Group 6 |
| Grey | `#BBBBBB` | A reference or a missing value |
| Black | `#000000` | An outline or text |

Diverging, for correlations and differences: negative `#2166AC`, zero `#F7F7F7`, positive `#B2182B`.

- Red against green is never the only difference between two groups.
- Colour is paired with a shape, a pattern or a label when it encodes a category.
- The contrast against the background is at least 3:1.
- A figure printed in grayscale still tells its groups apart by pattern or label.
- A rainbow colour map is never used.

### Pitfalls

| Pitfall | Why it is wrong | Correct approach |
|---|---|---|
| 3D charts | Perspective distorts values. | A flat 2D chart. |
| Pie charts | Angles and areas are hard to compare. | A bar chart. |
| Dual y-axes | The scales are arbitrary and imply a correlation. | Two separate panels. |
| A truncated y-axis | It exaggerates small differences. | Start at 0, or mark the break clearly. |
| Missing error bars | They hide the uncertainty. | Add error bars and say in the caption whether they show the SD, the SE or a 95% CI. |
| Chart junk | Decoration lowers the data-ink share. | Remove everything that shows no data. |
| Histogram bins of unequal width | They distort the frequencies. | Equal bins. |
| Overlapping labels | They are unreadable at print size. | Rotate, abbreviate, or use fewer categories. |
| More than 8 colours | They cannot be told apart at print size. | Group the categories or use facets. |
| A legend far from the data | The reader scans back and forth. | Place the legend inside the plot area or label the data directly. |
| A distorted aspect ratio | It exaggerates or hides a trend. | 4:3, or 16:9 for a time series. |

## The scripts

- Each figure has one script in `figures/` of the run folder, named like the figure, such as `figure_01.py`.
- The script reads the project's data from its file, with the path written in the script. It holds no number of its own, except numbers copied from a manuscript table under "Whether to draw a figure".
- The script is self-contained and has comments, so that it runs again without change.
- The agent runs the script itself, from the run folder, with `python3 'figures/figure_01.py'` or `Rscript 'figures/figure_01.R'`. A path or value the prompt gives reaches the command as one argument in single quotes.
- The script writes `figures/figure_01.pdf` and `figures/figure_01.png`, relative to the run folder.
- The file names in the templates, such as `data/bars.csv`, stand for the project's data files.
- A script that fails because a library is missing is not changed to work around it. The agent writes the figure in `figures.md` under "Not drawn", with the library's name and the error as printed, and goes on with the next figure.

### Python with matplotlib

Every script starts with this block:

```python
import csv

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np

matplotlib.rcParams.update({
    'font.family': 'sans-serif',
    'font.sans-serif': ['Arial', 'Helvetica', 'DejaVu Sans'],
    'font.size': 9,
    'axes.titlesize': 11,
    'axes.labelsize': 10,
    'xtick.labelsize': 8,
    'ytick.labelsize': 8,
    'legend.fontsize': 8,
    'figure.dpi': 300,
    'savefig.dpi': 300,
    'savefig.bbox': 'tight',
    'axes.spines.top': False,
    'axes.spines.right': False,
})

CB = ['#0077BB', '#33BBEE', '#009988', '#EE7733', '#CC3311', '#EE3377', '#BBBBBB', '#000000']


def read_columns(path):
    with open(path, newline='') as f:
        rows = list(csv.DictReader(f))
    return {key: [row[key] for row in rows] for key in rows[0]}
```

The body follows. Each body names the columns it reads.

Bar chart, columns `group`, `value`, `se`:

```python
cols = read_columns('data/bars.csv')
groups = cols['group']
values = [float(v) for v in cols['value']]
errors = [float(v) for v in cols['se']]

fig, ax = plt.subplots(figsize=(6.9, 4.5))
ax.bar(groups, values, yerr=errors, capsize=4, color=CB[:len(groups)], edgecolor='black', linewidth=0.5)
ax.set_xlabel('Group')
ax.set_ylabel('Score (points)')
ax.set_ylim(0, max(v + e for v, e in zip(values, errors)) * 1.1)
fig.savefig('figures/figure_01.pdf')
fig.savefig('figures/figure_01.png')
```

Boxplot, columns `group`, `value`:

```python
cols = read_columns('data/scores.csv')
order = list(dict.fromkeys(cols['group']))
data = [[float(v) for g, v in zip(cols['group'], cols['value']) if g == name] for name in order]

fig, ax = plt.subplots(figsize=(6.9, 4.5))
bp = ax.boxplot(data, patch_artist=True, widths=0.6, medianprops=dict(color='black', linewidth=1.5))
for patch, color in zip(bp['boxes'], CB):
    patch.set_facecolor(color)
    patch.set_alpha(0.7)
ax.set_xticks(range(1, len(order) + 1))
ax.set_xticklabels(order)
ax.set_xlabel('Group')
ax.set_ylabel('Score (points)')
fig.savefig('figures/figure_02.pdf')
fig.savefig('figures/figure_02.png')
```

Line chart, columns `x`, `series`, `y`:

```python
cols = read_columns('data/trend.csv')
names = list(dict.fromkeys(cols['series']))
markers = ['o', 's', '^', 'D', 'v']

fig, ax = plt.subplots(figsize=(6.9, 4.5))
for i, name in enumerate(names):
    points = [(float(x), float(y)) for x, s, y in zip(cols['x'], cols['series'], cols['y']) if s == name]
    xs, ys = zip(*points)
    ax.plot(xs, ys, marker=markers[i % len(markers)], color=CB[i], label=name, linewidth=1.5, markersize=5)
ax.set_xlabel('Year')
ax.set_ylabel('Count (n)')
ax.legend(frameon=False)
fig.savefig('figures/figure_03.pdf')
fig.savefig('figures/figure_03.png')
```

Scatter plot with a regression line, columns `x`, `y`:

```python
cols = read_columns('data/pairs.csv')
x = np.array([float(v) for v in cols['x']])
y = np.array([float(v) for v in cols['y']])
slope, intercept = np.polyfit(x, y, 1)
r = np.corrcoef(x, y)[0, 1]
x_line = np.linspace(x.min(), x.max(), 100)

fig, ax = plt.subplots(figsize=(6.9, 5.5))
ax.scatter(x, y, color=CB[0], alpha=0.6, edgecolors='black', linewidth=0.3, s=30)
ax.plot(x_line, slope * x_line + intercept, color=CB[4], linewidth=1.5,
        label=f'y = {slope:.2f}x + {intercept:.2f}, r = {r:.2f}')
ax.set_xlabel('Predictor (units)')
ax.set_ylabel('Outcome (units)')
ax.legend(frameon=False, loc='lower right')
fig.savefig('figures/figure_04.pdf')
fig.savefig('figures/figure_04.png')
```

Forest plot, columns `study`, `effect`, `ci_lower`, `ci_upper`, with the pooled result in the row named `Overall`:

```python
cols = read_columns('data/effects.csv')
studies = cols['study']
effects = [float(v) for v in cols['effect']]
lower = [float(v) for v in cols['ci_lower']]
upper = [float(v) for v in cols['ci_upper']]

fig, ax = plt.subplots(figsize=(6.9, 4.0))
for i, study in enumerate(studies):
    overall = study == 'Overall'
    ax.errorbar(effects[i], i, xerr=[[effects[i] - lower[i]], [upper[i] - effects[i]]],
                fmt='D' if overall else 'o', color=CB[4] if overall else CB[0],
                markersize=8 if overall else 6, capsize=3, linewidth=1.2)
ax.axvline(x=0, color='grey', linestyle='--', linewidth=0.8)
ax.set_yticks(range(len(studies)))
ax.set_yticklabels(studies)
ax.invert_yaxis()
ax.set_xlabel('Effect size')
fig.savefig('figures/figure_05.pdf')
fig.savefig('figures/figure_05.png')
```

Correlation heatmap, a header `variable` followed by one column per variable, one row per variable in the same order:

```python
from matplotlib.colors import LinearSegmentedColormap

cols = read_columns('data/corr.csv')
labels = cols['variable']
corr = np.array([[float(cols[name][i]) for name in labels] for i in range(len(labels))])
shown = np.ma.masked_where(np.triu(np.ones_like(corr, dtype=bool), k=1), corr)
cmap = LinearSegmentedColormap.from_list('diverging', ['#2166AC', '#F7F7F7', '#B2182B'])

fig, ax = plt.subplots(figsize=(5.5, 5.0))
image = ax.imshow(shown, cmap=cmap, vmin=-1, vmax=1)
ax.set_xticks(range(len(labels)))
ax.set_xticklabels(labels, rotation=45, ha='right')
ax.set_yticks(range(len(labels)))
ax.set_yticklabels(labels)
for i in range(len(labels)):
    for j in range(i + 1):
        ax.text(j, i, f'{corr[i, j]:.2f}', ha='center', va='center', fontsize=8)
fig.colorbar(image, ax=ax, shrink=0.8, label='r')
fig.savefig('figures/figure_06.pdf')
fig.savefig('figures/figure_06.png')
```

Funnel plot, columns `effect`, `se`:

```python
cols = read_columns('data/funnel.csv')
effects = np.array([float(v) for v in cols['effect']])
se = np.array([float(v) for v in cols['se']])
mean_effect = effects.mean()
se_range = np.linspace(0.01, se.max() * 1.1, 100)

fig, ax = plt.subplots(figsize=(6.9, 5.0))
ax.scatter(effects, se, color=CB[0], edgecolors='black', linewidth=0.3, s=40, alpha=0.7)
ax.axvline(x=mean_effect, color=CB[4], linestyle='--', linewidth=1, label=f'Mean = {mean_effect:.2f}')
ax.fill_betweenx(se_range, mean_effect - 1.96 * se_range, mean_effect + 1.96 * se_range,
                 alpha=0.1, color='grey', label='95% limits')
ax.set_xlabel('Effect size')
ax.set_ylabel('Standard error')
ax.invert_yaxis()
ax.legend(frameon=False)
fig.savefig('figures/figure_07.pdf')
fig.savefig('figures/figure_07.png')
```

Grouped bar chart, columns `category`, `group`, `value`:

```python
cols = read_columns('data/grouped.csv')
categories = list(dict.fromkeys(cols['category']))
groups = list(dict.fromkeys(cols['group']))
value = {(c, g): float(v) for c, g, v in zip(cols['category'], cols['group'], cols['value'])}
width = 0.8 / len(groups)
x = np.arange(len(categories))

fig, ax = plt.subplots(figsize=(6.9, 4.5))
for j, group in enumerate(groups):
    ax.bar(x + (j - (len(groups) - 1) / 2) * width, [value[(c, group)] for c in categories], width,
           label=group, color=CB[j], edgecolor='black', linewidth=0.5)
ax.set_xticks(x)
ax.set_xticklabels(categories)
ax.set_xlabel('Category')
ax.set_ylabel('Mean score (points)')
ax.legend(frameon=False)
fig.savefig('figures/figure_08.pdf')
fig.savefig('figures/figure_08.png')
```

### R with ggplot2

Every script starts with this block:

```r
library(ggplot2)

theme_fig <- theme_minimal(base_size = 10, base_family = "Arial") +
  theme(
    plot.title = element_text(size = 11, face = "bold", hjust = 0),
    axis.title = element_text(size = 10),
    axis.text = element_text(size = 8),
    legend.title = element_text(size = 9),
    legend.text = element_text(size = 8),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    strip.text = element_text(size = 9, face = "bold")
  )

cb_palette <- c("#0077BB", "#33BBEE", "#009988", "#EE7733", "#CC3311", "#EE3377", "#BBBBBB", "#000000")
```

Bar chart, columns `group`, `value`, `se`:

```r
df <- read.csv("data/bars.csv")
df$group <- factor(df$group, levels = unique(df$group))

ggplot(df, aes(x = group, y = value, fill = group)) +
  geom_col(color = "black", linewidth = 0.3, width = 0.7) +
  geom_errorbar(aes(ymin = value - se, ymax = value + se), width = 0.2) +
  scale_fill_manual(values = cb_palette) +
  labs(x = "Group", y = "Score (points)") +
  theme_fig +
  theme(legend.position = "none") +
  coord_cartesian(ylim = c(0, NA))

ggsave("figures/figure_01.pdf", width = 6.9, height = 4.5, units = "in", dpi = 300)
ggsave("figures/figure_01.png", width = 6.9, height = 4.5, units = "in", dpi = 300)
```

Boxplot, columns `group`, `value`:

```r
df <- read.csv("data/scores.csv")
df$group <- factor(df$group, levels = unique(df$group))

ggplot(df, aes(x = group, y = value, fill = group)) +
  geom_boxplot(alpha = 0.7, outlier.shape = 21, outlier.size = 1.5) +
  scale_fill_manual(values = cb_palette) +
  labs(x = "Group", y = "Score (points)") +
  theme_fig +
  theme(legend.position = "none")

ggsave("figures/figure_02.pdf", width = 6.9, height = 4.5, units = "in", dpi = 300)
ggsave("figures/figure_02.png", width = 6.9, height = 4.5, units = "in", dpi = 300)
```

Line chart, columns `x`, `series`, `y`:

```r
df <- read.csv("data/trend.csv")
df$series <- factor(df$series, levels = unique(df$series))

ggplot(df, aes(x = x, y = y, color = series, shape = series)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2.5) +
  scale_color_manual(values = cb_palette) +
  labs(x = "Year", y = "Count (n)", color = NULL, shape = NULL) +
  theme_fig

ggsave("figures/figure_03.pdf", width = 6.9, height = 4.5, units = "in", dpi = 300)
ggsave("figures/figure_03.png", width = 6.9, height = 4.5, units = "in", dpi = 300)
```

Scatter plot with a regression line, columns `x`, `y`:

```r
df <- read.csv("data/pairs.csv")

ggplot(df, aes(x = x, y = y)) +
  geom_point(color = "#0077BB", alpha = 0.6, size = 1.5) +
  geom_smooth(method = "lm", color = "#CC3311", fill = "#CC3311", se = TRUE, linewidth = 1, alpha = 0.1) +
  labs(x = "Predictor (units)", y = "Outcome (units)") +
  theme_fig

ggsave("figures/figure_04.pdf", width = 6.9, height = 5.5, units = "in", dpi = 300)
ggsave("figures/figure_04.png", width = 6.9, height = 5.5, units = "in", dpi = 300)
```

Forest plot, columns `study`, `effect`, `ci_lower`, `ci_upper`, with the pooled result in the row named `Overall`:

```r
df <- read.csv("data/effects.csv")
df$is_overall <- df$study == "Overall"
df$study <- factor(df$study, levels = rev(df$study))

ggplot(df, aes(x = effect, y = study, xmin = ci_lower, xmax = ci_upper)) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "grey50") +
  geom_errorbarh(height = 0.2, linewidth = 0.8) +
  geom_point(aes(shape = is_overall, color = is_overall), size = 3) +
  scale_color_manual(values = c("FALSE" = "#0077BB", "TRUE" = "#CC3311")) +
  scale_shape_manual(values = c("FALSE" = 16, "TRUE" = 18)) +
  labs(x = "Effect size", y = NULL) +
  theme_fig +
  theme(legend.position = "none")

ggsave("figures/figure_05.pdf", width = 6.9, height = 4.0, units = "in", dpi = 300)
ggsave("figures/figure_05.png", width = 6.9, height = 4.0, units = "in", dpi = 300)
```

Correlation heatmap, a header `variable` followed by one column per variable, one row per variable in the same order:

```r
df <- read.csv("data/corr.csv", check.names = FALSE)
labels <- df$variable
corr <- as.matrix(df[, labels])
rownames(corr) <- labels
corr[upper.tri(corr)] <- NA
long <- data.frame(
  row = rep(labels, times = length(labels)),
  col = rep(labels, each = length(labels)),
  value = as.vector(corr)
)
long <- long[!is.na(long$value), ]
long$row <- factor(long$row, levels = rev(labels))
long$col <- factor(long$col, levels = labels)

ggplot(long, aes(x = col, y = row, fill = value)) +
  geom_tile(color = "white") +
  geom_text(aes(label = sprintf("%.2f", value)), size = 3) +
  scale_fill_gradient2(low = "#2166AC", mid = "#F7F7F7", high = "#B2182B", midpoint = 0, limits = c(-1, 1), name = "r") +
  coord_fixed() +
  labs(x = NULL, y = NULL) +
  theme_fig

ggsave("figures/figure_06.pdf", width = 5.5, height = 5.0, units = "in", dpi = 300)
ggsave("figures/figure_06.png", width = 5.5, height = 5.0, units = "in", dpi = 300)
```

Funnel plot, columns `effect`, `se`:

```r
df <- read.csv("data/funnel.csv")
mean_effect <- mean(df$effect)
band <- data.frame(se = seq(0.01, max(df$se) * 1.1, length.out = 100))
band$xmin <- mean_effect - 1.96 * band$se
band$xmax <- mean_effect + 1.96 * band$se

ggplot(df, aes(x = effect, y = se)) +
  geom_ribbon(data = band, aes(x = NULL, y = se, xmin = xmin, xmax = xmax), alpha = 0.1, fill = "grey", inherit.aes = FALSE) +
  geom_point(color = "#0077BB", size = 2, alpha = 0.7) +
  geom_vline(xintercept = mean_effect, linetype = "dashed", color = "#CC3311") +
  scale_y_reverse() +
  labs(x = "Effect size", y = "Standard error") +
  theme_fig

ggsave("figures/figure_07.pdf", width = 6.9, height = 5.0, units = "in", dpi = 300)
ggsave("figures/figure_07.png", width = 6.9, height = 5.0, units = "in", dpi = 300)
```

Grouped bar chart, columns `category`, `group`, `value`:

```r
df <- read.csv("data/grouped.csv")
df$category <- factor(df$category, levels = unique(df$category))
df$group <- factor(df$group, levels = unique(df$group))

ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_col(position = position_dodge(0.8), width = 0.7, color = "black", linewidth = 0.3) +
  scale_fill_manual(values = cb_palette) +
  labs(x = "Category", y = "Mean score (points)", fill = NULL) +
  theme_fig

ggsave("figures/figure_08.pdf", width = 6.9, height = 4.5, units = "in", dpi = 300)
ggsave("figures/figure_08.png", width = 6.9, height = 4.5, units = "in", dpi = 300)
```

## The LaTeX environments

The draft writer copies the environment of each figure from `figures.md`. The caption stands below the figure, as the venue's template sets it.

Single figure:

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=\columnwidth]{figures/figure_01.pdf}
    \caption{Comparison of scores across three groups. Error bars show 95\% confidence intervals, $N = 1{,}247$.}
    \label{fig:group-scores}
\end{figure}
```

Several panels, with `\usepackage{subcaption}` in the preamble:

```latex
\begin{figure}[htbp]
    \centering
    \begin{subfigure}[b]{0.48\textwidth}
        \centering
        \includegraphics[width=\textwidth]{figures/figure_02a.pdf}
        \caption{Group A}
        \label{fig:dist-a}
    \end{subfigure}
    \hfill
    \begin{subfigure}[b]{0.48\textwidth}
        \centering
        \includegraphics[width=\textwidth]{figures/figure_02b.pdf}
        \caption{Group B}
        \label{fig:dist-b}
    \end{subfigure}
    \caption{Distribution of scores by group. Boxes show the median and the interquartile range, and circles show outliers.}
    \label{fig:score-distribution}
\end{figure}
```

A full-page landscape figure, with `\usepackage{pdflscape}` in the preamble:

```latex
\begin{landscape}
\begin{figure}[htbp]
    \centering
    \includegraphics[width=\linewidth]{figures/figure_wide.pdf}
    \caption{Correlation matrix of all variables.}
    \label{fig:correlation-full}
\end{figure}
\end{landscape}
```

- The preamble needs `graphicx`, and `subcaption` for panels.
- Figures are numbered in the order of their first mention in the text, and `\ref{...}` gives the number.
- Each figure is referred to in the text, such as "As shown in Figure~\ref{fig:group-scores}, ...".
- A venue whose template sets another caption form, such as a label in bold and a title in italics, keeps its own form.
- The caption describes the figure so that it can be read without the text. It states the sample size, the meaning of the error bars and any missing values.

## The ten checks of a figure

The agent runs these checks on every figure before it reports.

| # | Check | Pass criterion | If it fails |
|---|---|---|---|
| 1 | Axis labels | Both axes have a descriptive label. | Add the label. |
| 2 | Units | Every numeric axis states its unit, such as %, n or USD. | Add the unit. |
| 3 | Legend | A chart with several series has a legend. | Add the legend. |
| 4 | Caption | A caption exists in the template's form. | Write the caption. |
| 5 | Colour | The palette is one of this page's palettes. | Replace the colours. |
| 6 | Font size | No text is smaller than 8 pt in the final output. | Increase the size. |
| 7 | Resolution | The output is 300 dpi or more. | Increase the resolution. |
| 8 | Dimensions | The width matches the column width of the context. | Resize the figure. |
| 9 | Data accuracy | Every plotted value equals the value in the source data. | Correct the script. |
| 10 | No chart junk | No 3D effect, unnecessary gridline or decoration. | Simplify. |

- Check 9 compares the plotted values with the data file and with the numbers the manuscript reports for the same quantity. The agent reads values from the script's inputs and the manuscript, and a number that differs is reported in `figures.md`.
- A figure with a pitfall from "Pitfalls" fails check 10, and the pitfall is removed in the fix passes of "The rendered figure".

## The rendered figure

After the script ran, the agent reads the PNG with the Read tool and checks what the image shows against the source data.

1. The plotted values match the source data. A bar labelled "45%" reaches about 45 percent of the axis range.
2. Every data series and every category is present.
3. Error bars and confidence intervals look right in scale.
4. Both axes are labelled with text and units.
5. The legend is present and readable, for a chart with several series.
6. The caption follows the template's form.
7. No text is smaller than 8 pt at publication size.
8. No text is truncated, overlapping or cut off at the edge.
9. No two series have colours that look the same.
10. No 3D effect, unnecessary gridline or decoration is present.

- When an item fails, the agent names the specific problem, changes the script, runs it again and reads the image again.
- At most 2 fix passes follow the first render, so a figure is rendered at most 3 times.
- The status is PASS when the first render passes, PASS_WITH_NOTES when a fix pass cleared every failure, and NEEDS_REVIEW when a failure remains after the second fix pass.
- A figure with NEEDS_REVIEW is flagged to the user in the report. A remaining issue that changes how a reader reads the figure also goes in the caption's note.
- When the Read tool cannot show the image, the status is SKIPPED with the reason.

## The trace

`figures.md` holds one entry for each figure and for each manuscript table whose data the agent produced. The integrity verification agent reads the entries.

```
## Figure 3
- Artifact: figure_03.pdf, Figure 3
- Source data: <dataset name>, <path of the data file>
- Script: figures/figure_03.py, sha256 <hash>, run with: python3 'figures/figure_03.py'
- Caption claim: <the interpretive claim the caption makes, which may be compound>
- Claims in the manuscript:
  - <claim text> (<section and paragraph>)
- Limitations:
  - <a caveat the agent knows about the figure>
- Verification: <PASS | PASS_WITH_NOTES | NEEDS_REVIEW | SKIPPED>, <number of renders>
  - Issues found: <list or none>
  - Issues fixed: <list or none>
  - Remaining issues: <list or none>
```

- All six fields are present in every entry. The Limitations field says "none" when the agent knows no caveat. The agent never invents a limitation.
- The Source data names a real file. When the source is a table or sentence of the manuscript, the entry gives the section, the paragraph and the operation instead of a file, such as "mean over 3 seeds, Results, paragraph 2".
- The hash comes from `shasum -a 256 'figures/figure_03.py'`. A source given as a manuscript table needs no script hash, and the entry says how to derive the numbers.
- A vague source such as "computed manually" or "see paper" is not enough.
- The caption claim is the claim the caption makes about the data. A compound claim stays compound, and the integrity verification agent splits it.
- The agent lists a manuscript claim under the figure only when the figure's data support it. Each listed claim cites the figure. A claim is given by its text and its place, so that it does not depend on a number that may change.
- A manuscript sentence that only points to the figure, such as "see Figure 3 for the architecture", is not listed.
- `figures.md` also holds these parts:
  - Figure numbering: each figure with its number, its script and its image file.
  - Names: for each image, the name it has in the run folder and the name it takes in the manuscript's folder.
  - The environment of each figure and its in-text sentence, for the draft writer.
  - Not drawn: each candidate the agent did not draw, with the case from "Whether to draw a figure" or the missing library and the error as printed.

## The names of the images

- An image reaches the manuscript's folder only under a name that no file there has. The agent chooses names that are in neither the manuscript's folder nor its `figures/` folder, as the prompt lists them, and writes them under "Names".
- The session copies each image to the manuscript's `figures/` folder under that name and does not overwrite a file.
- The `\includegraphics` path in the environment uses the name in the manuscript's folder.
