# HTML Report Format

The architectural review is rendered as a single self-contained HTML file in the OS temp directory. The file loads nothing from the network: every style stands in one `<style>` element of the file, and every diagram is inline SVG or built from `div` elements. Inline SVG handles graph-shaped diagrams, and hand-built divs handle the more editorial visuals (mass diagrams, cross-sections). Mix the two: don't lean on one pattern for everything, it'll start to look generic. The module names in the examples of this page are made up.

## Scaffold

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Architecture review for {{repo name}}</title>
    <style>
      /* the whole stylesheet of the report: page, cards, badges, diagrams */
      body { margin: 0; background: #fafaf9; color: #0f172a; font-family: ui-sans-serif, system-ui, sans-serif; line-height: 1.5; }
      main { max-width: 64rem; margin: 0 auto; padding: 3rem 1.5rem; }
      main > * + * { margin-top: 3rem; }
      h1, h2, h3 { font-family: ui-serif, Georgia, serif; margin: 0 0 0.5rem; }
      .legend { display: flex; flex-wrap: wrap; gap: 1rem; font-size: 0.875rem; color: #475569; }
      #candidates > * + * { margin-top: 2.5rem; }
      .card { background: #ffffff; border: 1px solid #e2e8f0; border-radius: 0.5rem; padding: 1.5rem; }
      .card > * + * { margin-top: 1rem; }
      .badges { display: flex; flex-wrap: wrap; gap: 0.5rem; }
      .badge, .tag { border-radius: 9999px; padding: 0.125rem 0.75rem; font-size: 0.75rem; font-weight: 600; }
      .badge.strong { background: #d1fae5; color: #065f46; }
      .badge.explore { background: #fef3c7; color: #92400e; }
      .badge.speculative { background: #e2e8f0; color: #334155; }
      .tag { background: #f1f5f9; color: #475569; }
      .rule { font-size: 0.875rem; }
      .rule .default { color: #92400e; }
      .files { font-family: ui-monospace, Menlo, monospace; font-size: 0.875rem; list-style: none; padding: 0; }
      .before-after { display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; }
      .diagram { position: relative; height: 320px; border: 1px solid #e2e8f0; border-radius: 0.5rem; background: #ffffff; padding: 1rem; box-sizing: border-box; overflow: hidden; }
      .diagram svg { width: 100%; height: 100%; }
      .label { font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.05em; }
      .module { border: 1px solid #64748b; border-radius: 0.25rem; padding: 0.5rem; background: #ffffff; }
      .deep { border: 3px solid #0f172a; background: linear-gradient(135deg, #0f172a, #1e293b); color: #f8fafc; }
      .faded { opacity: 0.4; }
      .band { height: 3rem; border-left: 4px solid #64748b; padding-left: 0.75rem; display: flex; align-items: center; }
      .band.thick { height: 9rem; border-left-color: #059669; }
      .seam { stroke: #64748b; stroke-dasharray: 4 4; border-top: 2px dashed #64748b; }
      .leak { stroke: #dc2626; color: #dc2626; }
      .wins { padding-left: 1.25rem; }
      .adr { background: #fffbeb; border: 1px solid #fcd34d; border-radius: 0.25rem; padding: 0.5rem 0.75rem; font-size: 0.875rem; }
      .top { border-width: 2px; border-color: #059669; padding: 2rem; }
    </style>
  </head>
  <body>
    <main>
      <header>...</header>
      <section id="candidates">...</section>
      <section id="top-recommendation">...</section>
    </main>
  </body>
</html>
```

## Header

Repo name, date, and a compact legend: solid box = module, dashed line = seam, red arrow = leakage, thick dark box = deep module. One line names each subject of standards page that applies to the repository and that its pages lack, and `/codebase-design standards` as the way to fill it. A subject that does not apply, such as the UI standard in a repository with no user interface, is not named. No introduction paragraph. Straight into the candidates.

## Candidate card

The diagrams carry the weight. Prose is sparse, plain, and uses the glossary terms of `references/vocabulary.md` without ceremony.

Each candidate is one `<article class="card">`:

- **Title**: short, names the deepening (e.g. "Collapse the Order intake pipeline").
- **Badge row**: recommendation strength (`Strong` = emerald, `Worth exploring` = amber, `Speculative` = slate, the classes `badge strong`, `badge explore` and `badge speculative`), plus a tag for the dependency category (`in-process`, `local-substitutable`, `ports & adapters`, `mock`).
- **Rule**: the standards page and the rule the candidate breaks, the rule named as the page names it. A rule that comes from a default page says so, in the class `default`.
- **Files**: monospaced list, the class `files`, each file with its lines.
- **Before / After diagram**: the centrepiece. Two columns, side by side, the class `before-after`. See patterns below.
- **Problem**: one sentence. What hurts.
- **Solution**: one sentence. What changes.
- **Wins**: bullets, at most 6 words each. e.g. "Tests hit one interface", "Pricing logic stops leaking", "Delete 4 shallow wrappers".
- **ADR callout** (if applicable): one line in an amber-tinted box, the class `adr`.

No paragraphs of explanation. If the diagram needs a paragraph to be understood, redraw the diagram.

## Diagram patterns

Pick the pattern that fits the candidate. Mix them. Don't make every diagram look the same: a report of one repeated pattern reads as generic.

### Inline SVG graph (the workhorse for dependencies / call flow)

Use an inline SVG graph when the point is "X calls Y calls Z, and look at the mess." Wrap it in a `diagram` box so it doesn't feel parachuted in. Draw each module as a `<rect>` with a `<text>` label and each call as a `<line>` or `<path>` with an arrow head from one `<marker>`. Colour leakage edges red with the class `leak` and draw the deep module dark. A sequence drawn the same way, one lifeline per module, works well for "before: 6 round-trips, after: 1."

```html
<div class="diagram">
  <svg viewBox="0 0 520 120" role="img" aria-label="OrderHandler calls OrderValidator calls OrderRepo, which leaks to PricingClient">
    <defs>
      <marker id="head" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
        <path d="M0,0 L8,4 L0,8 z" fill="#64748b" stroke="none" />
      </marker>
    </defs>
    <g fill="#ffffff" stroke="#64748b">
      <rect x="10" y="40" width="110" height="40" rx="4" />
      <rect x="140" y="40" width="110" height="40" rx="4" />
      <rect x="270" y="40" width="110" height="40" rx="4" class="leak" />
      <rect x="400" y="40" width="110" height="40" rx="4" class="leak" />
    </g>
    <g font-size="11" text-anchor="middle" fill="#0f172a">
      <text x="65" y="64">OrderHandler</text>
      <text x="195" y="64">OrderValidator</text>
      <text x="325" y="64">OrderRepo</text>
      <text x="455" y="64">PricingClient</text>
    </g>
    <g stroke="#64748b" marker-end="url(#head)">
      <line x1="120" y1="60" x2="140" y2="60" />
      <line x1="250" y1="60" x2="270" y2="60" />
      <line x1="380" y1="60" x2="400" y2="60" class="leak seam" stroke-width="2" />
    </g>
  </svg>
</div>
```

### Hand-built boxes-and-arrows (when an SVG graph does not carry the weight)

Modules as `<div>`s with borders and labels, the class `module`. Arrows as inline SVG `<line>` or `<path>` elements positioned absolutely over the `diagram` box, which is the relative container. Reach for this when you want the "after" diagram to feel like one thick-bordered deep module, the class `deep`, with greyed-out internals, the class `faded`.

### Cross-section (good for layered shallowness)

Stack horizontal bands, the class `band`, to show layers a call passes through. Before: 6 thin layers each doing nothing. After: 1 thick band, the classes `band thick`, labelled with the consolidated responsibility.

### Mass diagram (good for "interface as wide as implementation")

Two rectangles per module: one for interface surface area, one for implementation. Before: interface rectangle is nearly as tall as the implementation rectangle (shallow). After: interface rectangle is short, implementation rectangle is tall (deep).

### Call-graph collapse

Before: a tree of function calls rendered as nested boxes. After: the same tree collapsed into one box, with the now-internal calls shown faded inside it.

## Style guidance

- Lean editorial, not corporate-dashboard. Generous whitespace. Serif optional for headings (the scaffold sets a serif that works well with the stone and slate greys).
- Colour sparingly: one accent (emerald or indigo) plus red for leakage and amber for warnings.
- Keep diagrams ~320px tall so before/after sits comfortably side by side without scrolling.
- Use the class `label` (small, uppercase, widely spaced) for module labels inside diagrams, so they read as schematic, not as UI.
- The file holds no script and names no address to load from: no `<script>`, no `<link>`, no `@import`, no web font and no image fetched by address. The report is static, with no app code and no interactivity.
- An inline `<svg>` carries no `xmlns` attribute, which HTML does not need.
- A style the scaffold lacks is added to the one `<style>` element.

## Top recommendation section

One larger card, the classes `card top`: the candidate's name, one sentence on why, and an anchor link to its card. It holds nothing else.

## Tone

Plain English, concise, but the architectural nouns and verbs come straight from `references/vocabulary.md`. Concision is not an excuse to drift.

**Use exactly:** module, interface, implementation, depth, deep, shallow, seam, adapter, leverage, locality.

**Never substitute:** component, service or unit for module, API or signature for interface, boundary for seam, and layer or wrapper for module, when you mean module.

**Phrasings that fit the style:**

- "Order intake module is shallow: interface nearly matches the implementation."
- "Pricing leaks across the seam."
- "Deepen: one interface, one place to test."
- "Two adapters justify the seam: HTTP in prod, in-memory in tests."

**Wins bullets** name the gain in glossary terms: *"locality: bugs concentrate in one module"*, *"leverage: one interface, N call sites"*, *"interface shrinks, implementation absorbs the wrappers"*. Don't write *"easier to maintain"* or *"cleaner code"*, because those terms aren't in the glossary and don't earn their place.

No hedging, no throat-clearing, no "it's worth noting that...". If a sentence could be a bullet, make it a bullet. If a bullet could be cut, cut it. If a term isn't in the glossary of `references/vocabulary.md`, reach for one that is before inventing a new one.
