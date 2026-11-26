# Step 8 rerun: /handbook on officium on v11.2.1, stop 2, The drafts

Agent a026bf3a9b73b7a04, claude-opus-5-5.

**Stop: The drafts**

Scratch folder: `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/handbook.GSPK2U`

- `drafts/` holds every drafted file at its repository path.
- `docs/user/diagrams/` holds the three `.svg` files drawn there.
- `utils/` holds the engine and the diagram file the drawings were made with.
- `check/` holds the copy of the working tree that Steps 8 ran on.
- `manual.html` is the page built in the copy.
- `README.diff` is the diff of the README draft against the current README.

Nothing is written in `/Users/axelfaes/workspace/officium`. After the last run there, `git status --short` still shows only the owner's four changes (`.agents/building.md`, `.agents/plan.yaml`, `.gitignore`, `tests/privacy.test.ts`), and `ls docs utils` printed `No such file or directory` for both.

The pages carry no list of source files. The source files of each page's claims are given below, under the page.

The drafts hold one question. It is under "Questions" below, and in the draft of `docs/user/manual/desktop.md`.

## 1. README.md: exists, brought up to date (340 lines)

The full draft is `drafts/README.md`. Every change from the current README is in this diff. `diff -u` shows every line outside these hunks as unchanged: the whole "YAML structure" section (current lines 75 to 284), the rest of "Desktop application" and "Run in oculus", and "License".

```diff
@@ -1,11 +1,17 @@
 # Officium
 
-Officium is a local reader for studying structured documents. It keeps the complete document visible while indexing and highlighting the spoken passages and assigned actions of a selected role. It also supports ordered study material made from explanatory text, prompts, and question-and-answer pairs.
+Officium is a local reader for studying structured documents. It keeps the complete document visible while indexing and highlighting the spoken passages and assigned actions of a selected role. It also supports ordered study material made from explanatory text, prompts, and question-and-answer pairs. It runs in a browser, as a desktop application for macOS, Windows, and Linux, and as an app in the oculus workbench.
 
 The public repository contains the application, schema validator, tests, and fictional examples. Personal documents remain in an ignored local library and are never required to build the public application.
 
+## What it looks like
+
 ![Officium showing a fictional training script with role-based navigation](assets/officium-reader.png)
 
+The three builds share the views, the reader and the data code under `src/lib/`; each build only finds the library and opens the source PDF in its own way:
+
+![The three builds of Officium over the shared view, reader and data code](docs/user/diagrams/architecture.svg)
+
 ## Run
@@ -17,9 +23,18 @@
 Open the address printed by Vite. The browser version loads personal documents from `rituals/` when they exist and otherwise loads the fictional documents from `examples/rituals/`.
 
+To run the built browser server instead of the development server:
+
+```sh
+npm run build
+node build
+```
+
+`npm run build` writes the server to `build/` with the Node adapter, and `node build` runs `build/index.js`. [The browser manual](docs/user/manual/browser.md) gives the address, the endpoints and where a refused document is reported.
+
 ## Desktop application
 
-Officium uses Tauri to build native applications for macOS, Windows, and Linux while retaining the Svelte interface. Install the current stable Rust toolchain and the platform prerequisites listed by Tauri, then run:
+Officium uses Tauri to build native applications for macOS, Windows, and Linux while retaining the Svelte interface. Install the current stable Rust toolchain (1.77.2 or later) and the platform prerequisites listed by Tauri, then run:
@@ -53,24 +68,15 @@
 A changed app asks for approval again, unless it was approved with "Keep approved while I edit". Run `npm run build:oculus` again after changing the interface.
 
-## Publishing to a WordPress membership site (planned)
-  (the whole section, moved unchanged to after "Verify", see below)
+[The desktop manual](docs/user/manual/desktop.md) and [the oculus manual](docs/user/manual/oculus.md) give each build in full.
 
 ## Add personal documents
 ...
-When at least one valid document exists below `rituals/`, Officium shows only those personal documents. Without personal documents, it shows the fictional examples.
+When `rituals/` holds at least one document, the browser build and the oculus app show only the personal documents, and a document the validator refuses stops the library from loading until it is corrected. Without personal documents, they show the fictional examples.
@@ -282,6 +288,18 @@
     Second line.
 ```
 
+[The document format reference](docs/user/reference/document-format.md) lists every key with its type and whether it is required, and [the library manual](docs/user/manual/library.md) gives each error the validator reports.
+
+## Where to look
+
+- [docs/README.md](docs/README.md): the documentation index, with the manual pages, the reference pages, the feature map and the commands that rebuild the generated files. `docs/user/manual.html` holds the same pages in one file for reading offline.
+- `src/lib/data/`: the document model and the validator every build uses.
+- `src/lib/reader/` and `src/lib/views/`: the contribution and question index, the reading position and the Svelte views.
+- `src/routes/`: the browser build's page and its endpoints. `src-tauri/` and `src/lib/desktop/`: the desktop application. `src/oculus/` and `src/lib/oculus/`: the oculus app.
+- `config/text.yml`: every string the interface shows.
+- `examples/rituals/`: the fictional documents, the format reference for your own.
+- `tests/`: the vitest suites by layer (`data/`, `reader/`, `server/`, `oculus/`, with `architecture.test.ts` and `privacy.test.ts`), and the Playwright suites under `tests/browser/`.
+
 ## Verify
@@ -294,8 +312,29 @@
 npm run build:oculus
 ```
 
-The privacy test checks the ignore rule and fails when Git reports a tracked path below `rituals/`.
+| Command                | What it checks                                                                                                        |
+| ---------------------- | --------------------------------------------------------------------------------------------------------------------- |
+| `npm test`             | vitest over `tests/`: data, reader, server, oculus, architecture, and privacy                                         |
+| `npm run test:browser` | Playwright in Chrome: the app on `npm run dev` at 127.0.0.1:8793, and the oculus build served under the oculus policy |
+| `npm run check`        | `svelte-kit sync` and `svelte-check`                                                                                  |
+| `npm run lint`         | `eslint .`                                                                                                            |
+| `npm run build`        | `vite build` with the Node adapter                                                                                    |
+| `npm run format:check` | `prettier --check .`                                                                                                  |
+| `npm run build:oculus` | `vite build` of the oculus app into `.oculus/apps/officium/`                                                          |
 
+The privacy test checks the ignore rule and fails when Git reports a tracked path below `rituals/`. The architecture test fails when a file of the data layer imports reader, view or server code, when a file of the reader imports view or server code, or when a TypeScript, JavaScript, Svelte, CSS, YAML or Markdown file outside the generated folders reaches 1,000 lines.
+
+## Publishing to a WordPress membership site (planned)
+  (the current section, word for word: its opening paragraph, its four numbered steps and its closing paragraph)
+
 ## License
```

**Where each fact of the current README went.** Every fact stays in the README.
- The opening two paragraphs stay as they are; one sentence is added to the first.
- The image moved under the new "What it looks like".
- "Run" is kept. The built server was added.
- "Desktop application" is kept. The Rust version and a link to the desktop manual were added. Its facts are also in `docs/user/manual/desktop.md`, and the signing secrets are also in `docs/user/reference/environment.md`.
- "Run in oculus" is kept, with a link added. Its facts are also in `docs/user/manual/oculus.md`.
- "Publishing to a WordPress membership site (planned)" moved unchanged to after "Verify". It is also the `planned` row of the feature map.
- "Add personal documents" is kept. One sentence is brought up to date: the current sentence says "valid document", but one refused document stops the whole library from loading (`src/lib/server/catalogue.ts` `loadCorpus`, `src/lib/oculus/library.ts` `loadCorpus`). The facts are also in `docs/user/manual/library.md`.
- "YAML structure" is kept unchanged, with a link line added. Its keys are also in `docs/user/reference/document-format.md`.
- "Verify" is kept. A table of what each command checks (from `.agents/building.md`) and the architecture test sentence were added.
- "License" is unchanged.

**Sources of its claims:**
- Opening: `README.md`, `src-tauri/tauri.*.conf.json`, `src/oculus/`.
- Architecture image: `src/lib/`, `tests/architecture.test.ts`.
- Built server: `package.json`, `svelte.config.js`, the answer known already.
- Rust 1.77.2: `src-tauri/Cargo.toml` `rust-version`.
- The changed personal-documents sentence: `src/lib/server/catalogue.ts`, `src/lib/oculus/library.ts`.
- Where to look: `git ls-files`.
- Verify table: `.agents/building.md`, `package.json`.
- Architecture test sentence: `tests/architecture.test.ts`.
- License: `LICENSE`.

## 2. docs/README.md: new (44 lines)

```markdown
# The documentation of Officium

Each page of the documentation, by kind. [The README](../README.md) is the place to start.

## The manual

- [user/manual/reader.md](user/manual/reader.md): the reader all builds share, its index, its controls and the reading position.
- [user/manual/library.md](user/manual/library.md): the library, which folder each build reads, how documents are found and checked, and every error.
- [user/manual/browser.md](user/manual/browser.md): the browser build, its development server, the built server and its endpoints.
- [user/manual/desktop.md](user/manual/desktop.md): the desktop application, its packages, its library folder and its CI build.
- [user/manual/oculus.md](user/manual/oculus.md): the oculus app, its build, what it reads and keeps through the bridge.

## The reference

- [user/reference/document-format.md](user/reference/document-format.md): every key of a library document, with its type and its allowed values.
- [user/reference/endpoints.md](user/reference/endpoints.md): the four endpoints of the browser build's server.
- [user/reference/npm-scripts.md](user/reference/npm-scripts.md): every npm script of `package.json`.
- [user/reference/text-catalogue.md](user/reference/text-catalogue.md): every key of `config/text.yml`.
- [user/reference/environment.md](user/reference/environment.md): the environment variables and the secrets of the desktop workflow.

## The feature map

- [user/feature-map/README.md](user/feature-map/README.md): each capability, grouped by part, with its status and its test.

## The diagrams

- [user/diagrams/architecture.svg](user/diagrams/architecture.svg): the three builds over the shared view, reader and data code.
- [user/diagrams/document-loading.svg](user/diagrams/document-loading.svg): the path of a library document to the reader.
- [user/diagrams/desktop-library-choice.svg](user/diagrams/desktop-library-choice.svg): the order in which the desktop application picks its library.

## The pages in one file

[user/manual.html](user/manual.html) holds the README and every Markdown page above in one HTML file, a tab per page, for reading offline.

## Rebuilding the generated files

Run each from the repository root, with Python 3.10 or later:

```sh
python3 utils/diagrams.py
python3 utils/manual.py . README.md docs/README.md docs/user/manual/reader.md docs/user/manual/library.md docs/user/manual/browser.md docs/user/manual/desktop.md docs/user/manual/oculus.md docs/user/reference/document-format.md docs/user/reference/endpoints.md docs/user/reference/npm-scripts.md docs/user/reference/text-catalogue.md docs/user/reference/environment.md docs/user/feature-map/README.md
```

`utils/diagrams.py` draws the diagrams with `utils/figures.py` into `docs/user/diagrams/`. `utils/manual.py` writes `docs/user/manual.html`; run it again after a change to any page.
```

Sources: the run's own pages; the head comments of `templates/figures.py` (Python 3.10) and `templates/manual.py` (its run line).

## 3. docs/user/manual/reader.md: new (55 lines)

The full text is `drafts/docs/user/manual/reader.md`. Its sections:
- The header: the Document selector, Rol, Bibliotheek (desktop only), the progress `3 van 12 bijdragen`, and the index button Bijdragen/Vragen/Sluiten.
- The index: contributions are speeches by the role and actions assigned to it. Directions and text are never contributions. A catechism indexes its pairs and prompts. Each item shows `p. <printed>` or `PDF <pdf page>`. An empty role shows `Voor deze functie zijn geen bijdragen vastgelegd.`
- Moving through the document: Vorige/Volgende with `3 / 12`. With no current item, Volgende goes to the first item and Vorige to the last. Sectie appears when there is more than one section. The header stays fixed.
- The document: the kinds Gesproken tekst/Handeling/Regie/Toelichting, the badge Bijdrage, and images inline or block. Catechism blocks show Toelichting/Vraag/Antwoord.
- The source link, per build: browser `/api/source/<id>#page=<n>` in a new tab; desktop opens the default application; oculus opens the file viewer at the page.
- The reading position: restored on the next start, with the role falling back to the first role and a stale item dropped. It is stored in the browser storage key `officium.reader.v1` as `{"version": 1, documentId, roleId, itemId}`, and in the oculus bridge state per tab.
- Example: `Demonstratiescript` with `Voorzitter`, then `Demonstratiecatechismus`.

Sources:
- `src/lib/views/Reader.svelte`, `Navigation.svelte`, `RitualDocument.svelte`, `CatechismDocument.svelte` and `SourceLink.svelte`.
- `src/lib/reader/contributions.ts` and `src/lib/reader/state.ts`.
- `config/text.yml`.
- `src/routes/+page.svelte` and `src/oculus/App.svelte`.
- `src-tauri/src/library.rs` `open_source`.
- `examples/rituals/demonstration-ritual.yaml` and `examples/rituals/demonstration-catechism.yaml`.
- `tests/browser/reader.spec.ts` and `tests/reader/contributions.test.ts`.

## 4. docs/user/manual/library.md: new (87 lines)

The full text is `drafts/docs/user/manual/library.md`. It embeds `../diagrams/document-loading.svg`. Its sections:
- Which library a build reads: browser and oculus read `rituals/` and fall back to `examples/rituals/`. Paths are relative to `rituals/` or `examples/`. The desktop application reads its remembered, bundled or picked folder. `rituals/` is ignored by Git.
- How a build finds the documents: a folder with `document.yaml` is one directory document; otherwise each `.yaml` or `.yml` file is a standalone document. Browser and oculus skip symbolic links. The desktop application skips `sources/` and `assets/`. Documents are ordered by order, then title.
- How a document is checked, in five steps: parse; validate; section paths (the `sections/<name>.yaml` form in browser and oculus, dot-segment and escape checks in desktop); the images, plus the source PDF in browser and oculus, plus the symbolic-link containment check in browser; unique id and order.
- Errors:
  - The message form `<document path>: <field>: <message>`, with an example built from the README's fictional `training-session` document.
  - A table of all 19 validator and section messages.
  - The missing-file and duplicate-document messages.
  - One refused document stops the whole library from loading.
  - In the browser build, the message is logged in the terminal of `npm run dev` or `node build`, and the page shows De bibliotheek kon niet worden geladen with `HTTP <status>` (answer known already 2). The desktop application and the oculus app show the message itself.
- Example: the README's `training-session` directory layout.

Sources:
- `src/lib/data/validate.ts`, `parse.ts`, `sections.ts` and `order.ts`.
- `src/lib/server/catalogue.ts`, `src/lib/oculus/library.ts` and `src-tauri/src/library.rs`.
- `src/routes/+page.svelte` line 41, `src/oculus/App.svelte` and `config/text.yml`.
- `tests/oculus/library.test.ts` (skipping links, the missing-source message).
- `tests/privacy.test.ts`.
- `README.md`, "YAML structure".

## 5. docs/user/manual/browser.md: new (55 lines)

The full text is `drafts/docs/user/manual/browser.md`. Its sections:
- Run the development server: `npm run dev` serves on 127.0.0.1, port 5173 unless taken.
- Run the built server:
  - `npm run build` then `node build`, which runs `build/index.js`. The Node adapter is used unless `OFFICIUM_DESKTOP=1`.
  - The server listens on `HOST` and `PORT`, by default `0.0.0.0` and `3000`. `0.0.0.0` accepts connections from the network, so the page gives `HOST=127.0.0.1 node build` to keep a personal library on the machine.
  - Run it from the repository root, since the library is read relative to the working directory.
- What the server serves: a table of the 4 endpoints. The library is read again on each request.
- Errors: a refused document is logged in the server terminal and the page shows `HTTP <status>`; `404` Bronbestand niet gevonden. / Afbeelding niet gevonden.; the empty-library screen.
- Example: `HOST=127.0.0.1 PORT=8080 node build`.

Sources:
- `package.json`, `vite.config.ts` (`server.host`), `svelte.config.js`.
- `node_modules/vite/dist/node` (`DEFAULT_DEV_PORT = 5173`, `--strictPort` off by default), `src-tauri/tauri.conf.json` `devUrl`.
- `node_modules/@sveltejs/adapter-node/files/index.js` lines 11 and 12 (`env('HOST', '0.0.0.0')`, `env('PORT', ... '3000')`), version 5.5.7.
- `src/lib/server/catalogue.ts` (`process.cwd()`), `src/routes/api/*/+server.ts`, `src/routes/+layout.ts` (`ssr = false`), `src/routes/+page.svelte`, `config/text.yml`.
- Answers known already 1 and 2.

## 6. docs/user/manual/desktop.md: new (88 lines)

The full text is `drafts/docs/user/manual/desktop.md`. It embeds `../diagrams/desktop-library-choice.svg`. Its sections:
- What it needs: Node.js 24 and Rust 1.77.2 or later.
- Run it during development: `npm run tauri:dev` opens a window of 1280 by 800, at least 900 by 600, on 127.0.0.1:5173.
- Build the packages:
  - `npm run tauri:build`, which runs `npm run build:desktop` (static adapter).
  - A table of platforms: macOS `.app` and `.dmg` for 10.15 or later; Windows NSIS and MSI with the WebView2 bootstrapper; Linux AppImage, DEB and RPM.
  - A private build: `npm run tauri:build:private` bundles `rituals/`, which is not encrypted; do not distribute it.
- How it picks its library: remembered, then bundled, then the picker. A folder is remembered only when it loads, in `settings.json` under the key `ritual-library`. Bibliotheek changes the folder. Documents are found below the folder except in `sources/` and `assets/`.
- The source link: opens the PDF in the default application, only a `.pdf` inside the folder.
- Errors: a table of 9 messages.
- Building in CI: the triggers (by hand, or a `v*` tag), 4 targets, `npm ci`, `npm test`, `npm run check` and `npm run lint` before the build, the artifact `officium-<target>`, signing when the secrets exist, and `src-tauri/tauri.signing.conf.json`, which Git ignores.
- Example: choose the repository's `examples/` folder on the first launch.
- The question below.

Sources:
- `src-tauri/Cargo.toml`, `src-tauri/tauri.conf.json`, `tauri.macos.conf.json`, `tauri.windows.conf.json`, `tauri.linux.conf.json` and `tauri.private.conf.json`.
- `package.json`, `svelte.config.js`.
- `src/lib/desktop/library.ts`, `src/routes/+page.svelte`, `src-tauri/src/library.rs`, `src-tauri/src/lib.rs`, `config/text.yml`.
- `.github/workflows/desktop-build.yml`, `.gitignore`.
- `README.md`, "Desktop application".

## 7. docs/user/manual/oculus.md: new (50 lines)

The full text is `drafts/docs/user/manual/oculus.md`. Its sections:
- Build it: `npm run build:oculus` writes `.oculus/apps/officium/` with relative asset paths and no inline script; Git, Prettier and ESLint ignore it. A table gives the manifest `src/oculus/public/app.yml`.
- Open it: approval, and "Keep approved while I edit". The address form is `/apps/@<root>/<name>/<key>/`, and the bridge loads from `/apps/-/oculus.js`.
- What it reads and keeps:
  - The library through the bridge, with images put into the page.
  - The source link opens the file viewer at the page.
  - The reading position is kept per tab, with no file written and no browser storage used.
  - The colours follow the oculus theme through `src/oculus/theme.css`.
- Errors: a table of 5 messages; a notice has a Sluiten button.
- Example: the first open of the app on the examples.

Sources:
- `vite.oculus.config.ts`, `src/oculus/App.svelte`, `src/oculus/public/app.yml`, `src/oculus/theme.css`.
- `src/lib/oculus/address.ts`, `connect.ts` and `library.ts`.
- `config/text.yml`, `.gitignore`, `.prettierignore`, `eslint.config.js`.
- `tests/browser/oculus.spec.ts`.
- `README.md`, "Run in oculus".
- `.scratch/archive/1-run-officium-as-an-oculus-root-app/plan.md`, Goal.

## 8. docs/user/reference/document-format.md: new (108 lines)

The full text is `drafts/docs/user/reference/document-format.md`. Every key of the format is in a table with its type, whether it is required and its allowed values:
- the document: 9 keys;
- a role: 2;
- a section: 4;
- an entry: 7;
- a content part: 5;
- a block: 7;
- a source page: 2.

The page also states:
- the identifier pattern `^[a-z0-9]+(?:-[a-z0-9]+)*$`;
- that no key has a default;
- that a key the format does not name is ignored;
- the form of a section-file path;
- what the paths are relative to.

Its example is a standalone catechism document, taken from the README's example.

Sources: `src/lib/data/validate.ts`, `src/lib/data/sections.ts`, `src/lib/data/model.ts`, `README.md` "YAML structure".

## 9. docs/user/reference/endpoints.md: new (39 lines)

The full text is `drafts/docs/user/reference/endpoints.md`. It holds:
- a table of the 4 endpoints with the file that defines each;
- a table of the headers: `application/json`; `application/pdf` with `content-disposition: inline; filename="<document>.pdf"`; the image types by extension; `cache-control: private, no-store`;
- the keys of the catalogue's JSON;
- a table of the `404` errors;
- an example with `curl` against `npm run dev`.

Sources: `src/routes/api/catalogue/+server.ts`, `src/routes/api/source/[document]/+server.ts`, `src/routes/api/answer-image/[document]/[block]/+server.ts`, `src/routes/api/entry-image/[document]/[entry]/[part]/+server.ts`, `src/lib/server/catalogue.ts`, `src/lib/data/model.ts`, `src/lib/data/validate.ts`.

## 10. docs/user/reference/npm-scripts.md: new (32 lines)

The full text is `drafts/docs/user/reference/npm-scripts.md`. It holds:
- a table of all 15 scripts, each with what it runs and what it does;
- the verify sentence;
- the example `npm run build` and `node build`, which serves on `0.0.0.0:3000`.

Sources: `package.json`, `.agents/building.md`, `.agents/change-standard.md` "Officium rules", `vite.config.ts`, `playwright.config.ts`, `vite.oculus.config.ts`, `src-tauri/tauri.conf.json`, `node_modules/@sveltejs/adapter-node/files/index.js`.

## 11. docs/user/reference/text-catalogue.md: new (54 lines)

The full text is `drafts/docs/user/reference/text-catalogue.md`. It holds:
- How the file is checked: `config/text.yml: <key>: expected a nonempty string` and `config/text.yml: expected a mapping`. A key the list does not name is ignored. The file is read into the page at build time.
- A table of all 34 keys, each with its value and where it is shown. The value column was generated from `config/text.yml`, and the generator asserted that the key set equals the list.
- `reader.page` is shown by no view. `grep -rn` finds it only in `src/lib/data/text.ts`.
- The Dutch lowercasing in `src/lib/views/Reader.svelte`.
- The messages that are not in the catalogue.
- Example: `reader.role: Functie`.

Sources: `config/text.yml`, `src/lib/data/text.ts`, `src/routes/+page.svelte`, `src/oculus/App.svelte`, `src/lib/views/*.svelte`.

## 12. docs/user/reference/environment.md: new (36 lines)

The full text is `drafts/docs/user/reference/environment.md`. It holds:
- a table of `OFFICIUM_DESKTOP`, `HOST` and `PORT`, each with its default;
- a table of the 12 workflow secrets with their platforms (names only; no value is shown);
- the condition that Windows signs only when `WINDOWS_TIMESTAMP_URL` is set too;
- the example `HOST=127.0.0.1 PORT=8080 node build`.

Sources: `svelte.config.js`, `package.json`, `node_modules/@sveltejs/adapter-node/files/index.js`, `.github/workflows/desktop-build.yml`, `README.md` "Desktop application".

## 13. docs/user/feature-map/README.md: new (75 lines)

The full text is `drafts/docs/user/feature-map/README.md`. There are 37 capabilities in six groups, each with its code and its test:

| Group                       | works | untested | planned |
| --------------------------- | ----- | -------- | ------- |
| The library and its documents | 9   | 0        | 0       |
| The reader                  | 9     | 0        | 0       |
| The browser build           | 2     | 2        | 0       |
| The desktop application     | 2     | 5        | 0       |
| The oculus app              | 7     | 0        | 0       |
| Publishing                  | 0     | 0        | 1       |

- The two untested rows of the browser build are the answer and entry image endpoints (`tests/server/catalogue.test.ts` covers only the path lookup) and `node build`.
- The five untested rows of the desktop application are choosing and remembering the folder, the bundled `rituals/`, the entry images, opening the PDF, and the packages and signing.
- The planned row is the WordPress membership site.

Answer known already 3 is applied: a capability held in full with no test is `untested`.

Sources: the code paths in each row, and the test names from `grep -nE "^\s*(describe|it|test)\(" tests -r`. Restoring the reading position is covered by `tests/browser/oculus.spec.ts` "keeps the reading position in the bridge state", which reopens the app with the saved state and asserts the role and the current item.

## 14. .prettierignore: exists, one drafted exclusion line

```diff
@@ -7,3 +7,4 @@
 src-tauri/gen/
 src-tauri/target/
 .oculus/apps/
+docs/user/manual.html
```

Every current line is kept.

## The diagram file and its drawings

The diagram file is `utils/diagrams.py`, new. It is drafted at `drafts/` and, in the scratch folder, at `utils/diagrams.py`.
- It takes the head comment, the imports and `main()` of `references/diagrams.md`, with the three diagrams named.
- It has four kinds of its own: `part` (shared code), `host` (code of one build), `outside` (outside Officium) and `ask` (a check).
- Every label is ASCII, so no label was changed to ASCII.

Its three graphs:

```python
def architecture() -> tuple[str, str]:
    nodes = (
        Node('browser', 'Browser build: SvelteKit server, src/routes/', 'host'),
        Node('desktop', 'Desktop build: Tauri, src-tauri/ and src/lib/desktop/', 'host'),
        Node('oculus', 'Oculus app: src/oculus/ and src/lib/oculus/', 'host'),
        Node('views', 'Views: src/lib/views/', 'part'),
        Node('reader', 'Reader: src/lib/reader/', 'part'),
        Node('data', 'Data: src/lib/data/', 'part'),
        Node('files', 'The library: rituals/ or examples/rituals/', 'outside'),
    )
    edges = (
        Edge('browser', 'views', 'renders'), Edge('desktop', 'views', 'renders'),
        Edge('oculus', 'views', 'renders'), Edge('views', 'reader', 'index, state'),
        Edge('reader', 'data', 'model'), Edge('browser', 'data'), Edge('desktop', 'data'),
        Edge('oculus', 'data'), Edge('data', 'files', 'parses'),
    )
    # legend: grey box the code of one build; white box code the three builds share;
    # dashed box the document files outside the code

def document_loading():
    # find (host) -> parse (part) -> validate (part) -> resolve the source PDF and the images (host)
    # -> check unique id and order (part) -> the reader shows the documents (part);
    # validate -> 'The error names the file and the field' (outside), dotted, labelled 'refused'

def desktop_library_choice():
    # start (host) -> 'Is a library folder remembered?' (ask) -yes-> load (host);
    # -no-> 'Does the build bundle rituals/?' (ask) -yes-> load; -no-> 'Show the folder picker' (host) -chosen-> load
```

`python3 <scratch>/utils/diagrams.py` exited 0 and printed:
```
wrote docs/user/diagrams/architecture.svg (8928 bytes)
wrote docs/user/diagrams/document-loading.svg (8159 bytes)
wrote docs/user/diagrams/desktop-library-choice.svg (6545 bytes)
```

The drawn files are at:
- `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/handbook.GSPK2U/docs/user/diagrams/architecture.svg`
- `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/handbook.GSPK2U/docs/user/diagrams/document-loading.svg`
- `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/handbook.GSPK2U/docs/user/diagrams/desktop-library-choice.svg`

The engine refused no diagram, so no diagram is left out.

The drawn graphs differ from the plan of the first stop in two places:
- The three arrows from the builds to Data carry no label.
- The fourth box of the loading diagram reads "Resolve the source PDF and the images in the library", because the desktop application does not check the source PDF at load.

## The files the run copies

- `utils/figures.py`: new, a copy of `templates/figures.py`.
- `utils/manual.py`: new, a copy of `templates/manual.py`.

Neither exists in the repository. `cmp` found both copies in the check folder equal to their templates.

`docs/user/manual.html` is generated in the copy by `python3 utils/manual.py .` with the 13 documents in the index's order. It printed `wrote docs/user/manual.html (90479 bytes)` and is saved at `<scratch>/manual.html`.

## Steps 8: the format and lint commands on the copy

The copy is `<scratch>/check`.
- It holds the 111 files that `git ls-files -z --cached --others --exclude-standard` lists, each copied as it stands on disk, with the owner's four uncommitted changes as they stand. `cmp` found `.gitignore` equal to the repository's.
- `git init -q` was run in it.
- `node_modules` is linked from the repository.
- `PYTHONDONTWRITEBYTECODE=1` was set for every run.

**Before the run's files were put in the copy:**
- `npm run format:check` exited 0: `Checking formatting...` and `All matched files use Prettier code style!`
- `npm run lint` (`eslint .`) exited 0 with no output beyond its header.
- No failure belongs to the repository.

**After the drafts, the copies of `utils/`, the three `.svg` files and `manual.html` were put in the copy (round 1):**
- `npm run lint` exited 0.
- `npm run format:check` exited 1:
  ```
  [warn] docs/user/feature-map/README.md
  [warn] docs/user/manual.html
  [warn] docs/user/manual/browser.md
  [warn] docs/user/manual/desktop.md
  [warn] docs/user/manual/library.md
  [warn] docs/user/manual/oculus.md
  [warn] docs/user/reference/document-format.md
  [warn] docs/user/reference/endpoints.md
  [warn] docs/user/reference/environment.md
  [warn] docs/user/reference/npm-scripts.md
  [warn] docs/user/reference/text-catalogue.md
  [warn] README.md
  [warn] Code style issues found in 12 files. Run Prettier with --write to fix.
  ```

**Corrections:**
- The 11 drafted Markdown pages were corrected in their drafts, using the formatting Prettier gives with the repository's `.prettierrc`, applied in the copy and carried back to `drafts/`. A comparison with the runs of spaces and of dashes collapsed printed no difference, so the corrections change only the padding of table cells.
- `docs/user/manual.html`, which the run generates and does not draft, is answered by the drafted exclusion line `docs/user/manual.html` in `.prettierignore` (answer known already 4).
- The `.svg` files, `utils/*.py` and `manual.html` raised no lint failure.

**After the corrections (rounds 2 to 4, the last after the final two wording corrections in the README and the text catalogue):**
- `npm run format:check` exited 0: `All matched files use Prettier code style!`
- `npm run lint` exited 0.
- After the last run, `cmp` found every file of `drafts/` equal to its file in the copy.

No failure is left after the rounds of correction.

**Files written through the linked folder:** none. `find -L <scratch>/check/node_modules -type f -newer <scratch>/marker -print` printed nothing after any run of either command.

**Other checks:**
- Each drafted Markdown page is below 1,000 lines, as `tests/architecture.test.ts` requires. `wc -l` printed 340 for `README.md` and at most 108 for the others.
- `grep -nP '[^\x00-\x7F]'` over the drafts in the copy found no non-ASCII character.
- A link check over the drafts found no relative link or image whose target is missing.

## Questions

1. In `docs/user/manual/desktop.md`, at the end: the Rust tests in `src-tauri/src/library.rs` run with `cargo test` in `src-tauri/`. No script of `package.json` and no job of the workflow runs them. Should this page, and the README's "Verify", name `cargo test --manifest-path src-tauri/Cargo.toml` as a check?

## The commit of Steps 11

Message:

```
Write the documentation of Officium: the README brought up to date, the manual, the reference, the feature map, three diagrams and manual.html
```

The 22 paths, each named on the command:
- `README.md`
- `.prettierignore`
- `docs/README.md`
- `docs/user/manual/reader.md`
- `docs/user/manual/library.md`
- `docs/user/manual/browser.md`
- `docs/user/manual/desktop.md`
- `docs/user/manual/oculus.md`
- `docs/user/reference/document-format.md`
- `docs/user/reference/endpoints.md`
- `docs/user/reference/npm-scripts.md`
- `docs/user/reference/text-catalogue.md`
- `docs/user/reference/environment.md`
- `docs/user/feature-map/README.md`
- `docs/user/manual.html`
- `docs/user/diagrams/architecture.svg`
- `docs/user/diagrams/document-loading.svg`
- `docs/user/diagrams/desktop-library-choice.svg`
- `utils/figures.py`
- `utils/manual.py`
- `utils/diagrams.py`

The commit has no API pages, since that kind is left out. Before the commit, `git check-ignore` runs on each path. With `/docs/` no longer in the working tree's `.gitignore`, none of these paths is expected to be ignored.

Approve each draft, correct it, or leave it out of the run, and answer the question.

## Shown again after the orchestrator's answer

**Stop: The drafts (shown again for the two corrected drafts and the commit)**

Scratch folder: `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/handbook.GSPK2U`

Nothing is written in `/Users/axelfaes/workspace/officium`. After the runs, `git status --short` there shows only the owner's four changes (`.agents/building.md`, `.agents/plan.yaml`, `.gitignore`, `tests/privacy.test.ts`), and `ls docs utils` printed `No such file or directory` for both. `cargo test` was not run.

The answer to the drafts' question (yes) is written into the two drafts below. The drafts hold no question now. Every other draft stands as the previous stop showed it.

## 1. README.md (now 348 lines; full text at `drafts/README.md`)

This is the change from the README draft shown at the previous stop. In "Verify", between the table of commands and the paragraph on the privacy and architecture tests, it adds:

```markdown
The desktop application's Rust code is checked with:

```sh
cargo test --manifest-path src-tauri/Cargo.toml
```

No npm script and no job of the workflow runs it.
```

Source: `src-tauri/src/library.rs`, `#[cfg(test)]` at line 190 with `#[test]` functions. That no npm script and no job of the workflow runs it comes from `package.json` (scripts) and `.github/workflows/desktop-build.yml` (steps). The rest of the README draft, and its diff against the current README, are as the previous stop showed them.

## 2. docs/user/manual/desktop.md (now 94 lines; full text at `drafts/docs/user/manual/desktop.md`)

The question at the end of the page is replaced by a new last section:

```markdown
## Check the Rust code

```sh
cargo test --manifest-path src-tauri/Cargo.toml
```

This runs the Rust tests of `src-tauri/src/library.rs`, the check of the desktop application's Rust code: they load standalone and directory documents in manifest order and refuse a path that leaves the library. No npm script and no job of the workflow runs it.
```

Sources:
- `src-tauri/src/library.rs` lines 190 to 234: the tests `loads_standalone_and_composed_documents_in_manifest_order` and `rejects_paths_that_leave_the_library`.
- `package.json` and `.github/workflows/desktop-build.yml`.

The rest of the page is as the previous stop showed it.

## Steps 8, run again on the corrected drafts

- Both corrected drafts were put in the copy `<scratch>/check`.
- `docs/user/manual.html` was rebuilt there with `python3 utils/manual.py .` and the 13 documents. It exited 0 and printed `wrote docs/user/manual.html (90704 bytes)`; the copy is saved at `<scratch>/manual.html`.
- Both commands ran with `PYTHONDONTWRITEBYTECODE=1`:
  - `npm run format:check` exited 0:
    ```
    > officium@0.1.0 format:check
    > prettier --check .

    Checking formatting...
    All matched files use Prettier code style!
    ```
  - `npm run lint` exited 0:
    ```
    > officium@0.1.0 lint
    > eslint .
    ```
- Files written through the linked folder: none. `find -L <scratch>/check/node_modules -type f -newer <scratch>/marker -print` printed nothing after either run.
- No draft needed a correction in this round, and the drafted exclusion `docs/user/manual.html` in `.prettierignore` stands as before.
- After the run, `cmp` found every file of `drafts/` equal to its file in the copy.
- `LC_ALL=C grep -c '[^ -~]'` printed 0 for both corrected drafts, so they are ASCII.
- `wc -l` printed 348 for `README.md` and 94 for `docs/user/manual/desktop.md`, both below 1,000 lines as `tests/architecture.test.ts` requires.

## The commit of Steps 11 (count corrected)

Message:

```
Write the documentation of Officium: the README brought up to date, the manual, the reference, the feature map, three diagrams and manual.html
```

The 21 paths, each named on the command:
- `README.md`
- `.prettierignore`
- `docs/README.md`
- `docs/user/manual/reader.md`
- `docs/user/manual/library.md`
- `docs/user/manual/browser.md`
- `docs/user/manual/desktop.md`
- `docs/user/manual/oculus.md`
- `docs/user/reference/document-format.md`
- `docs/user/reference/endpoints.md`
- `docs/user/reference/npm-scripts.md`
- `docs/user/reference/text-catalogue.md`
- `docs/user/reference/environment.md`
- `docs/user/feature-map/README.md`
- `docs/user/manual.html`
- `docs/user/diagrams/architecture.svg`
- `docs/user/diagrams/document-loading.svg`
- `docs/user/diagrams/desktop-library-choice.svg`
- `utils/figures.py`
- `utils/manual.py`
- `utils/diagrams.py`

Before the commit, `git check-ignore -q` runs on each path, and a path git ignores is left out and named.

Approve each draft, correct it, or leave it out of the run.
