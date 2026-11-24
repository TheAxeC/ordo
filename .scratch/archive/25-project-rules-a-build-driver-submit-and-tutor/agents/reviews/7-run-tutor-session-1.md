# Gate run, step 7: agent a79672ea3d3b4f41c

The first `/tutor pixel art` session has ended where the skill ends it: Teaching item 10, which gives the learner the lesson's path. The workspace now holds the mission, the resources, one lesson, its reference sheet, the glossary and one learning record. One write went outside the workspace: a test script at `gate/pg-check.js`, the workspace's parent folder. I deleted it in the same session, and `ls` of that folder afterwards showed only its sub-folders. Nothing under /Users/axelfaes/workspace or ~/.claude was changed.

I invoked the skill through the Skill tool (`skill: tutor`, `args: pixel art`), and it loaded. The call has no `explain`, so the skill ran in Teaching mode. All work happened in /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/tutor-pixel-art.

## Stops and answers

There was one stop: the mission interview (Teaching item 2). I asked five questions in one message: why, what success looks like, the starting point, constraints, and what is out of scope. The answers I was given:
1. Why: a small top-down 2D exploration game, made as a hobby, with sprites drawn by the learner instead of bought asset packs.
2. Success: a 16x16 player character that reads at 3x zoom, in four facing directions, plus a 16x16 tileset (grass, path, water, a tree) in one palette of at most 16 colours.
3. Starting point: programs for a living, has never drawn, has used no tool; a free tool, no budget.
4. Constraints: about 2 hours a week, sessions of 30 minutes or less, no deadline, short exercises the learner can check alone, reading before video.
5. Out of scope: animation, isometric art, selling work.

The skill had no further stop. Item 3 (mission change) did not apply, and items 4 to 10 have no stop. The session's last words to the learner were: "Your first lesson is at lessons/0001-clean-one-pixel-lines.html, with its reference sheet at reference/clean-lines.html."

## What I did in the run
- **Item 1:** the workspace was empty (`find . | sort` printed `.`).
- **Item 4:** I fetched and read these sources on the topic: Lospec's "Pixel Art Outlines Tutorial" (skeddles), Derek Yu's "Pixel Art Tutorial: Basics", the Pixel Joint "The Pixel Art Tutorial" (cure), FrostDrive's Clip Studio tips page, an Aseprite Community thread, the Slynyrd Pixelblog catalogue with entries 5, 20 and 22, the Pixelorama README and site, and the Lospec palette list. Medium (Pixel Grimoire) and opengameart returned HTTP 403, so they are not used.
- **Items 5 and 6:** the lesson teaches clean one-pixel lines (no doubles, identical segments for straight lines, segment lengths that only shrink towards the diagonal on curves). It has three parts:
  - a six-question recall quiz that mixes straight and curved lines;
  - three drawing tasks in the browser, each with automatic feedback: a 2:1 line, a 3:1 line, and a quarter circle that the page mirrors into a 16x16 circle at 3x zoom;
  - a redraw of the circle in Pixelorama.
- **The checker:** I ran the checker in `assets/pixelgrid.js` under node on the lesson's own solutions and on every quiz grid. Each gave the verdict the lesson expects: the two clean solutions passed, the jaggy and lump variants failed, and each quiz grid got its stated flaw. `node --check` passed on both asset scripts and on the lesson's inline script. I have not seen the pages rendered in a browser.

## `find . -type f | sort`
```
./assets/pixelgrid.js
./assets/quiz.js
./assets/style.css
./learning-records/0001-starting-point.md
./lessons/0001-clean-one-pixel-lines.html
./MISSION.md
./NOTES.md
./reference/clean-lines.html
./reference/GLOSSARY.md
./RESOURCES.md
```

## MISSION.md (full text)
```
# Mission: Pixel art

## Why
Draw the sprites for my own small top-down 2D exploration game, a hobby project, instead of using bought asset packs.

## Success looks like
- A 16x16 player character that reads clearly at 3x zoom, drawn in four facing directions (up, down, left, right).
- A small 16x16 terrain tileset: grass, path, water and a tree.
- The character and the tiles share one palette of at most 16 colours and look like they belong together.

## Constraints
- About two hours a week, in sessions of 30 minutes or less; no deadline.
- Starting point: programs for a living; has never drawn seriously, on paper or digitally; has used no pixel art tool.
- A free tool only; no budget.
- Short exercises the learner can do and check alone; reading before video.

## Out of scope
- Animation.
- Isometric art.
- Selling work.
```

## learning-records/0001-starting-point.md (full text)
```
# Starting point: no drawing experience, a programmer

The learner programs for a living and has never drawn seriously, on paper or digitally, and has used no pixel art tool. Lessons start from the first principles of placing pixels and assume no art vocabulary, but can lean on grids, counts and rules, which a programmer reads easily.

**Evidence**: stated by the learner in the mission interview of the first session.

**Implications**: lesson 1 teaches clean one-pixel lines before colour, shading or form; the tool is Pixelorama, chosen because it is free, as the learner asked.
```

## Lesson: lessons/0001-clean-one-pixel-lines.html (first 40 lines)
```
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Clean one-pixel lines</title>
<link rel="stylesheet" href="../assets/style.css">
<script src="../assets/pixelgrid.js"></script>
<script src="../assets/quiz.js"></script>
</head>
<body>
<main>

<nav class="course">Pixel art <U+00B7> Lesson 1 <U+00B7> Reference: <a href="../reference/clean-lines.html">Clean lines at a glance</a></nav>

<h1>Clean one-pixel lines</h1>
<p class="subtitle">About 25 minutes. By the end you will have drawn a clean 16<U+00D7>16 circle, the outline your tree canopy will start from.</p>

<p>Your character and your tiles are 16<U+00D7>16 pixels, the most common size for top-down tiles<span class="cite"><a href="#s7">7</a></span>. At that size an outline is only a few dozen pixels, and one misplaced pixel shows. This lesson teaches the one skill every outline needs: drawing a line, straight or curved, that the eye reads as smooth.</p>

<h2>Three rules</h2>

<h3>1. One pixel wide, touching corner to corner</h3>
<p>The basic line in pixel art is a single pixel wide, and its pixels connect diagonally<span class="cite"><a href="#s1">1</a></span>. An extra pixel that makes an L-shaped bend is called a <em>double</em>: a pixel the line does not need<span class="cite"><a href="#s4">4</a></span>. It thickens the line at that spot. The one exception is a sharp corner, where you may let pixels meet side to side to make a point<span class="cite"><a href="#s1">1</a></span>.</p>
<div class="figure-row">
  <figure><div id="fig-double"></div><figcaption>A double: the first pixel of the middle row makes an L.</figcaption></figure>
  <figure><div id="fig-single"></div><figcaption>Clean: remove it and the pixels touch only at corners.</figcaption></figure>
</div>

<h3>2. A straight line is made of identical segments</h3>
<p>Only horizontal, vertical and 45<U+00B0> lines are perfectly smooth on a pixel grid<span class="cite"><a href="#s3">3</a></span>. Any other straight line is a staircase of short runs, its <em>segments</em>, and it looks straight only when every segment is the same length<span class="cite"><a href="#s1">1</a></span>. So pick slopes that divide evenly: 1 pixel down for every 2 across, or every 3, or every 4<span class="cite"><a href="#s5">5</a></span>. A segment that is too long or too short makes an awkward jump<span class="cite"><a href="#s3">3</a></span>. That jump is a <em>jaggy</em>, a pixel or group of pixels out of place that interrupts the flow of the line<span class="cite"><a href="#s3">3</a></span>.</p>
<div class="figure-row">
  <figure><div id="fig-jaggy"></div><figcaption>Segments 2, 2, 3, 2: the 3 sticks out.</figcaption></figure>
  <figure><div id="fig-straight"></div><figcaption>Segments 2, 2, 2, 2: one straight line.</figcaption></figure>
</div>

<h3>3. A curve's segments change length gradually</h3>
<p>A curve follows the same idea, but its segments are not all equal. They are longest at the top, bottom and sides of a circle and get gradually shorter towards the diagonal in between<span class="cite"><a href="#s1">1</a></span>. Lengths 5, 2, 2, 1, 1 make a smooth arc. Lengths 5, 2, 1, 2, 1 put a lump in the middle<span class="cite"><a href="#s1">1</a></span>. Most graphics programs draw circles the mathematically correct way, which is the wrong way for pixel art, so you place these pixels yourself<span class="cite"><a href="#s1">1</a></span>.</p>
<div class="figure-row">
  <figure><div id="fig-lump"></div><figcaption>5, 2, 1, 2, 1: a lump where the 2 comes back.</figcaption></figure>
```

## Reference: reference/clean-lines.html (first 40 lines)
```
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Clean lines at a glance</title>
<link rel="stylesheet" href="../assets/style.css">
<script src="../assets/pixelgrid.js"></script>
</head>
<body>
<main>

<nav class="course">Pixel art <U+00B7> Reference <U+00B7> Taught in <a href="../lessons/0001-clean-one-pixel-lines.html">Lesson 1: Clean one-pixel lines</a></nav>

<h1>Clean lines at a glance</h1>
<p class="subtitle">The rules for one-pixel lines and outlines, on one page.</p>

<h2>The rules</h2>
<table class="ref">
  <tr><th>Rule</th><th>Check</th><th>Source</th></tr>
  <tr><td>One pixel wide; pixels touch corner to corner.</td><td>No three pixels form an L inside any 2<U+00D7>2 block (a <em>double</em>).</td><td><a href="#s1">1</a>, <a href="#s3">3</a></td></tr>
  <tr><td>Sharp corners are the exception.</td><td>Pixels may meet side to side only where the outline makes a point.</td><td><a href="#s1">1</a></td></tr>
  <tr><td>A straight line is identical segments.</td><td>Count the runs: all the same length.</td><td><a href="#s1">1</a></td></tr>
  <tr><td>A curve's segments change gradually.</td><td>Longest at top, bottom and sides; only shorter towards the diagonal.</td><td><a href="#s1">1</a></td></tr>
  <tr><td>Clean up last.</td><td>Sketch roughly, then remove doubles and jaggies at the end.</td><td><a href="#s3">3</a></td></tr>
</table>

<h2>Slopes that draw cleanly</h2>
<p>Only horizontal, vertical and 45<U+00B0> lines are perfectly smooth<span class="cite"><a href="#s2">2</a></span>. Between them, use slopes whose segments are all equal: 1 down per 2, 3, 4 or more across, and the same turned upright<span class="cite"><a href="#s4">4</a></span>.</p>
<div class="figure-row">
  <figure><div id="r-1-1"></div><figcaption>1:1, segments of 1.</figcaption></figure>
  <figure><div id="r-2-1"></div><figcaption>2:1, segments of 2.</figcaption></figure>
  <figure><div id="r-3-1"></div><figcaption>3:1, segments of 3.</figcaption></figure>
  <figure><div id="r-4-1"></div><figcaption>4:1, segments of 4.</figcaption></figure>
</div>

<h2>Curves</h2>
<div class="figure-row">
  <figure><div id="r-arc"></div><figcaption>Smooth: 5, 2, 2, 1, 1.</figcaption></figure>
  <figure><div id="r-lump"></div><figcaption>Lump: 5, 2, 1, 2, 1.</figcaption></figure>
```

## Reference: reference/GLOSSARY.md (the whole file, 7 lines)
```
# Pixel Art Glossary

The terms of pixel art for drawing game sprites and tiles: lines, outlines, palettes and shading.

## Terms

No terms yet. A term is added once the learner uses it correctly; lesson 1 introduces double, jaggy and segment.
```

The workspace also holds RESOURCES.md, NOTES.md (the learner's stated preferences, as the Rules section asks) and the components assets/style.css, assets/pixelgrid.js and assets/quiz.js.

## Places where the skill's text left me without an instruction, disagreed with itself, or produced something wrong

1. **Teaching item 2 and the Stops row "The mission interview"** ("The questions on why the user wants to learn the topic"). The text does not say whether to ask the questions one at a time or together, or which questions to ask. I asked them together, one for each section of the mission-format.md template.
2. **Teaching item 2** ("Interview the user on why they want to learn the topic"). The item names only the why. The template it writes also needs "Success looks like", "Constraints" and "Out of scope", so I asked about all four.
3. **Teaching item 8 against item 7.** Item 8 says "Write the lesson as one self-contained HTML file". Item 7 says "link the lesson to it [a component in assets/]" and "every lesson links it [the shared stylesheet]". A file that links ../assets/ is not self-contained. I followed item 7 and read "self-contained" as "nothing loaded from outside the workspace". The lesson does not work if it is copied out of the workspace.
4. **Teaching item 9 against glossary-format.md.** Item 9 says "Glossaries, in particular, are an essential reference" and "Write the glossary as ... reference/GLOSSARY.md". glossary-format.md says "Add a term only when the user understands it." The learner shows no understanding before the session ends, so in a first session the two together produce a glossary with no terms. I wrote it with an empty Terms section and one line that says so. That also makes "Once a glossary exists, every lesson adheres to it" empty for now.
5. **Teaching item 10 and the end of the session.** The skill ends at "Open the lesson ... or the user is given its path". It has no stop to receive the learner's quiz or task results and no check of understanding. Because of that, learning-record trigger 1 of learning-record-format.md ("demonstrated genuine understanding") and the glossary's rule for adding terms can never fire in the session that teaches the lesson. The skill also never says when the session ends. I ended it after giving the path.
6. **The session's aim of "one lesson with its learning record" against the format page.** The skill does not tie a learning record to a lesson. The only record that "When to write a learning record" allowed in this session was trigger 2, prior knowledge disclosed in the interview. So 0001-starting-point.md records the learner's starting point, not anything learned from the lesson.
7. **Teaching item 6** ("spacing (practice spread over time)"). The skill has no means of spreading practice over time: nothing records a review date, and no later step brings a lesson's quiz back. I added nothing to schedule spacing, so the lesson has no spaced review.
8. **Teaching item 4** ("While RESOURCES.md is not well populated"). "Well populated" is given no measure. I took it to mean the resources the lesson draws on plus the ones the mission's next steps need, and listed one gap (water and path tiles) under `## Gaps`.
9. **Teaching item 8** ("recommends one primary source ...: the highest-quality, highest-trust resource found on the topic"). "The topic" can mean pixel art as a whole or the lesson's own subject. I recommended the Lospec outlines tutorial, the best source for the lesson's subject. For pixel art as a whole I would judge the Slynyrd Pixelblog the better pick for this mission.
10. **Teaching item 9** ("as HTML files except the glossary, the compressed essence of the lesson ..."). The sentence parses badly: "the compressed essence" can be read as describing the glossary. I read it as describing all the reference documents.
