# Step 8: /handbook on officium, stop 2, The drafts

Agent ab642d67e3b49ae76, round 2: 294239 tokens, 46 tool uses, 12 min 29 s (cumulative for the agent).

The `/handbook` run on /Users/axelfaes/workspace/officium is at its second stop, "The drafts". Nothing is written in officium yet. `git status --short --untracked-files=all` there shows only the user's four changes (`.agents/building.md`, `.agents/plan.yaml`, `.gitignore`, `tests/privacy.test.ts`), and the run touched none of them.

Every answer from the first stop is applied:
- the kinds as confirmed;
- the paths of `references/kinds.md` (`git check-ignore -v docs/x.md` exits 1);
- the accepted reading of the pages that belong to no kind;
- the README's "YAML structure" section kept, with a pointer to `docs/user/reference/document-format.md`.

Scratch folder (Steps 7, made with `mktemp -d`): /Users/axelfaes/workspace/ordo/.scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/runs/8-officium/handbook.sXQOaE

Inside it:
- the drafts, under `drafts/<path>`;
- the engine copy `utils/figures.py` and `utils/manual.py`, each identical to its template (`cmp -s` exit 0);
- the diagram draft `utils/diagrams.py`;
- the two `.svg` files under `docs/user/diagrams/`;
- a preview build of the one-page manual at `preview/manual.html`.

Every draft has no non-ASCII character (`LC_ALL=C grep -rn '[^ -~]'` prints nothing). Every Markdown draft passes Prettier with the repository's options (`--tab-width 4 --single-quote --print-width 100 --trailing-comma none --check` prints "All matched files use Prettier code style!").

# The drafts

How sources are shown: each page below is the exact text that would be written. Each claim's source file is listed after the page, section by section. The source lists are not written into the files.

---

## 1. `README.md` (exists, brought up to date)

### Changes from the file it replaces
- New core section "What it looks like". The existing screenshot moves into it from below the opening, and the paragraph and image for `docs/user/diagrams/parts.svg` are added.
- "Desktop application": one sentence added that points at `docs/user/manual/desktop.md`.
- "Add personal documents": "The `source.file` and `answer_image` paths" becomes "The `source.file`, `answer_image` and image `file` paths", because `relativeImage` in `src/lib/data/validate.ts` applies to content images too. One sentence added that points at `docs/user/manual/library.md`.
- "YAML structure": one sentence added that points at `docs/user/reference/document-format.md`. The rest of the section is unchanged.
- "Verify": a lead line and the command table from `.agents/building.md` (its "What it checks" column) added. "The privacy test checks the ignore rule and fails when..." becomes the exact rule: `/rituals/`, `/AGENTS.md`, `/CLAUDE.md`.
- New core section "Where to look". It lists the folders and the tests, and holds the "Officium rules" of `.agents/change-standard.md`.
- "Publishing to a WordPress membership site (planned)" is unchanged in text. It moves from after "Run in oculus" to after "Where to look", so the built parts come first.
- "Opening", "Run", "Run in oculus" and "License" are unchanged.

### Where each fact of the old page went
Every sentence, table and code block of the old README stands in the draft. They stay in their own sections except the screenshot (now under "What it looks like") and the WordPress section (now after "Where to look"). The facts of the pages that belong to no kind go here:
- the command table of `.agents/building.md` and its privacy-test sentence go into "Verify";
- the "Officium rules" of `.agents/change-standard.md` go into "Where to look": four spaces, under 1,000 lines, the layer direction, strings and colours, real data only under `rituals/`, and the public repository building without `rituals/`.

### The draft

````markdown
# Officium

Officium is a local reader for studying structured documents. It keeps the complete document visible while indexing and highlighting the spoken passages and assigned actions of a selected role. It also supports ordered study material made from explanatory text, prompts, and question-and-answer pairs.

The public repository contains the application, schema validator, tests, and fictional examples. Personal documents remain in an ignored local library and are never required to build the public application.

## What it looks like

![Officium showing a fictional training script with role-based navigation](assets/officium-reader.png)

Officium has three builds that share one data layer, one set of reader functions and one set of views. Each build reads the library in its own way and hands the documents to the same code:

![The parts of Officium: the library folder, the browser, desktop and oculus builds, the data layer, the reader functions and the views](docs/user/diagrams/parts.svg)

## Run

Install Node.js 24, then run:

```sh
npm install
npm run dev
```

Open the address printed by Vite. The browser version loads personal documents from `rituals/` when they exist and otherwise loads the fictional documents from `examples/rituals/`.

## Desktop application

Officium uses Tauri to build native applications for macOS, Windows, and Linux while retaining the Svelte interface. Install the current stable Rust toolchain and the platform prerequisites listed by Tauri, then run:

```sh
npm run tauri:dev
```

The first desktop launch opens a native directory picker. Select the local document-library directory. Officium remembers that directory for later launches. The `Bibliotheek` button selects a different directory, and source links open the corresponding PDF in the operating system's default application.

Build the public application without personal documents:

```sh
npm run tauri:build
```

Build a personal application containing the ignored local library:

```sh
npm run tauri:build:private
```

Bundled personal files are ordinary application resources and are not encrypted. Do not distribute a personal build. The public build never includes the local library.

Platform-specific configuration produces `.app` and `.dmg` bundles on macOS, NSIS and MSI installers on Windows, and AppImage, DEB, and RPM packages on Linux. `.github/workflows/desktop-build.yml` builds all three operating systems, including Apple Silicon and Intel macOS targets.

The workflow signs packages when the corresponding repository secrets exist and otherwise produces unsigned artifacts. Apple signing and notarization use `APPLE_CERTIFICATE`, `APPLE_CERTIFICATE_PASSWORD`, `APPLE_SIGNING_IDENTITY`, `APPLE_ID`, `APPLE_PASSWORD`, and `APPLE_TEAM_ID`. Windows Authenticode signing uses `WINDOWS_CERTIFICATE`, `WINDOWS_CERTIFICATE_PASSWORD`, and `WINDOWS_TIMESTAMP_URL`. Linux AppImage and RPM signing use `LINUX_GPG_PRIVATE_KEY`, `LINUX_GPG_KEY_ID`, and `LINUX_GPG_PASSPHRASE`. Signing credentials never belong in the repository.

The desktop manual, `docs/user/manual/desktop.md`, gives the start-up order, the builds and the workflow in full.

## Run in oculus

Officium runs as an app in the oculus workbench when this folder is a folder of the oculus workspace. Run `npm run build:oculus`, which writes the app to `.oculus/apps/officium/`; Git, Prettier and ESLint ignore that folder. Oculus finds the app while it runs and lists it in its view catalogue, and the first open asks for your approval.

The app reads the library through oculus's file bridge, from `rituals/` and, without personal documents, from `examples/rituals/`, so the library is the one in this folder and there is no library picker. A source button opens the PDF in oculus's file viewer at the PDF page of its entry. The reading position is kept per oculus tab, and the colours follow the oculus theme.

A changed app asks for approval again, unless it was approved with "Keep approved while I edit". Run `npm run build:oculus` again after changing the interface.

## Add personal documents

Create `rituals/` at the repository root and put source PDFs in `rituals/sources/`. The whole `rituals/` directory is ignored by Git. The `source.file`, `answer_image` and image `file` paths are relative to this directory and must remain inside it.

Use the fictional files under `examples/rituals/` as format references. Do not place personal content under `examples/` or another tracked directory.

When at least one valid document exists below `rituals/`, Officium shows only those personal documents. Without personal documents, it shows the fictional examples.

The library manual, `docs/user/manual/library.md`, says how each build finds the documents and what it refuses.

## YAML structure

This section gives the format with its examples; `docs/user/reference/document-format.md` gives every key with its type, its rule, the message the validator prints when the rule is broken, and the source file that defines it.

[From here to the end of "Question-and-answer blocks" the text is the old README's, byte for byte: `diff` shows no change in these lines. That covers the paragraph on standalone and directory documents, "Common document keys" with its table and the paragraph on section order, "Role-based document directory" with its tree, the `document.yaml` example, the role table and the role-reference sentence, "Sections and entries" with the section example, the kind table, the entry-key table, the `content` example, the content-part table and its paragraph, and the standalone sentence, and "Question-and-answer blocks" with its example, the block-type table, the block paragraph and the block-scalar example.]

## Verify

Every command runs from the repository root:

```sh
npm test
npm run test:browser
npm run check
npm run lint
npm run build
npm run format:check
npm run build:oculus
```

| Command                | What it checks                                                                                                                       |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `npm test`             | vitest over `tests/`: data, reader, server, oculus, architecture, privacy                                                            |
| `npm run test:browser` | Playwright in Chrome: the app on `npm run dev` on 127.0.0.1:8793, and the oculus build served through routes under the oculus policy |
| `npm run check`        | `svelte-kit sync` and `svelte-check`                                                                                                 |
| `npm run lint`         | `eslint .`                                                                                                                           |
| `npm run build`        | `vite build` with adapter-node                                                                                                       |
| `npm run format:check` | `prettier --check .`                                                                                                                 |
| `npm run build:oculus` | `vite build` of the oculus app into `.oculus/apps/officium/`                                                                         |

The privacy test requires `/rituals/`, `/AGENTS.md` and `/CLAUDE.md` to stay in `.gitignore`, and fails when Git reports a tracked path below `rituals/`.

## Where to look

- `docs/README.md`: the documentation index, with the manual pages, the reference pages, the feature map, the diagrams and the one-page `docs/user/manual.html`.
- `src/lib/data/`: the document model, the YAML parser and the validator, shared by every build.
- `src/lib/reader/`: the contribution and question index and the saved reading position.
- `src/lib/views/`: the Svelte views of the reader.
- `src/routes/`: the browser build's page and its four endpoints under `src/routes/api/`.
- `src-tauri/`: the desktop shell, with the library commands in `src-tauri/src/library.rs`.
- `src/oculus/`: the oculus app, its manifest `src/oculus/public/app.yml` and its theme `src/oculus/theme.css`.
- `config/text.yml`: every string the interface shows.
- `examples/`: the fictional documents and their source PDFs.
- `tests/`: 44 vitest cases in 10 files, and 13 Playwright cases in `tests/browser/`. The two Rust tests in `src-tauri/src/library.rs` are run by no npm script and no workflow.

The code keeps these rules:

- Four spaces for indentation. Each handwritten source file stays below 1,000 lines, which `tests/architecture.test.ts` checks.
- The data layer imports no reader or view code. The reader imports the validated data model and no Svelte component or server filesystem code. Views receive validated documents and use reader functions. `tests/architecture.test.ts` checks the first two.
- User-facing strings live in `config/text.yml` and interface colours in `src/app.css`; the oculus build maps oculus's theme tokens onto those colours in `src/oculus/theme.css`. The one exception for strings is `src/oculus/public/app.yml`, whose `title` and `description` oculus reads from the manifest.
- Real documents live only under the ignored `rituals/` directory, and tracked examples are fictional. The public repository builds without `rituals/`.

## Publishing to a WordPress membership site (planned)

[The old section's text, unchanged: its opening paragraph, the four numbered steps, and the paragraph on who can read the exported library.]

## License

Officium is available under the [MIT License](LICENSE).
````

The two bracketed lines stand for passages whose text is the old README's, unchanged. The full file is at `drafts/README.md` in the scratch folder.

### Sources
- Opening: `README.md` (old), `.oculus/project.yml`.
- What it looks like: `assets/officium-reader.png`, `README.md`. The three-builds sentence: `package.json` (`build`, `build:desktop`, `build:oculus`), `src/lib/server/catalogue.ts`, `src/lib/desktop/library.ts`, `src/lib/oculus/library.ts`, `src/lib/views/Reader.svelte`.
- Run, Desktop application, Run in oculus, YAML structure, WordPress, License: `README.md` (old).
- The image `file` path rule: `src/lib/data/validate.ts` (`relativeImage`).
- Verify: `package.json`, `.agents/building.md` (table and privacy sentence), `tests/privacy.test.ts`.
- Where to look:
  - folders: `git ls-files`;
  - "four endpoints": `src/routes/api/`;
  - 44 vitest cases in 10 files: `grep -c "^\s*it("` over `tests/` gives total 44;
  - 13 Playwright cases: `grep -c "^test("` gives 8 + 5;
  - two Rust tests: `grep "#\[test\]" src-tauri/src/library.rs` gives 2;
  - "run by no npm script and no workflow": `package.json`, `.github/workflows/desktop-build.yml`.
- The code rules: `.agents/change-standard.md` ("Officium rules"), `tests/architecture.test.ts`.

---

## 2. `docs/user/manual/reader.md` (new)

````markdown
# The reader

The reader is the interface every build of Officium shows: the browser build, the desktop application and the oculus app. It shows one document of the library at a time, whole, and indexes the parts of it a reader studies: for a role-based document (`document_type: ritual`) the spoken passages and actions of the selected role, and for a question-and-answer document (`document_type: catechism`) its questions and prompts. The interface text is Dutch and comes from `config/text.yml`; the labels below are the ones that file holds.

## The header

- **Document**: a selector of every document of the library, in the order of their `order` keys. Selecting a document selects its first role and its first section.
- **Rol**: a selector of the roles of a role-based document, in the order of its `roles` list. It is shown only for a role-based document, and the first role is selected when a document is opened.
- **Bibliotheek**: a button that chooses another library folder. Only the desktop application shows it.
- The progress: the place of the current item in the index, as "3 van 7 bijdragen" for a role-based document or "3 van 7 vragen" for a question-and-answer document, and 0 before an item is selected. It is hidden on a window 760 pixels wide or narrower.
- **Bijdragen** or **Vragen**: the button that opens and closes the index, shown only on a window 760 pixels wide or narrower. On such a window the index is hidden until this button opens it, and the button then reads **Sluiten**. On a wider window the index stands beside the document.

## The index

For a role-based document the index lists, in document order, each `speech` entry whose `speaker` is the selected role and each `action` entry whose `roles` hold it. A `direction` or a `text` entry is never listed, and neither is a speech by another role that names the selected role. For a question-and-answer document the index lists each `pair` and each `prompt` block; a `text` block stays in the document only.

Each item shows its section's title, its text (the question for a pair) and its page: "p. 12" when the entry has a `printed_page`, and "PDF 14" from its `pdf_page` when it has none. When the selected role has no contribution, the index reads "Voor deze functie zijn geen bijdragen vastgelegd."

Selecting an item makes it the current item, scrolls the document to it and closes the index on a narrow window.

## Moving through the document

- The arrow buttons **Vorige** and **Volgende** above the document move to the previous and the next item of the index, and show the place as "3 / 7". Before an item is selected, **Volgende** moves to the first item.
- **Sectie**: a selector of the document's sections, shown when the document has more than one. Selecting a section scrolls the document to it.
- The header and the arrow buttons stay in place while the document scrolls.

## The document

Each section is shown under its title, with every entry or block in its order. A role-based entry is labelled by its kind: **Gesproken tekst** for a speech, with the speaker's role label beside the text; **Handeling** for an action, with the labels of its roles; **Regie** for a direction; and **Toelichting** for a text entry. An entry of the selected role carries the badge **Bijdrage** and is highlighted, and the current item is marked. A question-and-answer block shows **Vraag** with its question or prompt and, for a pair, **Antwoord** with the answer text or the answer image. Images of a `content` list are drawn in the text flow (`display: inline`) or centred on their own line (`display: block`).

## The source link

Each entry and block shows its page as a source link. What the link does depends on the build:

- In the browser build it opens `/api/source/<document id>#page=<pdf_page>` in a new tab.
- In the desktop application it opens the document's PDF in the operating system's default application. The command that opens it, `open_source` in `src-tauri/src/library.rs`, takes the file and no page.
- In the oculus app it opens the PDF in oculus's file viewer at the entry's `pdf_page`.

## The reading position

The reader keeps the selected document, the selected role and the current item, and restores them when the reader opens again. The browser build and the desktop application keep them in the browser storage of the window under the key `officium.reader.v1`, as `{"version": 1, "documentId": ..., "roleId": ..., "itemId": ...}`. The oculus app keeps them through the oculus bridge, per oculus tab. A kept document that no longer exists opens the first document instead; a kept role that the document no longer holds selects its first role; a kept item that the index no longer holds leaves no item selected.

## The library screen

When the library is loading, the reader shows "Bibliotheek laden...". When the library holds no document, or cannot be loaded, it shows the library screen instead of the reader:

- with no document and no error: "Kies uw documentenmap" and, in the desktop application, the button **Kies documentenmap**; the oculus app says that no documents were found in `rituals/` or `examples/rituals/` of its folder;
- with an error: "De bibliotheek kon niet worden geladen" and the error message.

## Colours

The browser build and the desktop application use the colours of `src/app.css`, with a dark palette when the system asks for a dark colour scheme. The oculus app maps oculus's theme tokens onto those colours in `src/oculus/theme.css`, so it follows the oculus theme whatever the system scheme.

## An example

Run `npm run dev` with no `rituals/` folder and open the address Vite prints. The reader opens the fictional role-based document "Demonstratiescript" of `examples/rituals/demonstration-ritual.yaml` with its first role selected. Selecting the role **Spreker** in **Rol** lists one contribution, the speech of the section "Overweging", and **Volgende** makes it the current item.

## Where its code lives

- `src/lib/views/Reader.svelte`: the header, the arrow buttons, the section selector and the saved position; `Navigation.svelte`, `RitualDocument.svelte`, `CatechismDocument.svelte` and `SourceLink.svelte` beside it.
- `src/lib/reader/contributions.ts`: which entries and blocks the index lists.
- `src/lib/reader/state.ts`: the stored form of the reading position.

The data layer imports no reader or view code, and the reader imports the validated data model and no Svelte component or server filesystem code; `tests/architecture.test.ts` checks both. Views receive validated documents and use reader functions. Every string a view shows comes from `config/text.yml`, whose keys `docs/user/reference/text-catalogue.md` lists.
````

### Sources
- Opening: `src/lib/views/Reader.svelte`, `src/lib/reader/contributions.ts`, `config/text.yml`.
- The header: `src/lib/views/Reader.svelte` (`selectDocument`, `firstRole`, the progress, `index-toggle`); `src/app.css` (`@media (max-width: 760px)`: `.index-toggle` and `.navigation.open` shown, `.header-progress` hidden); `src/routes/+page.svelte` (`onchangelibrary` only when desktop).
- The index: `src/lib/reader/contributions.ts`, `src/lib/views/Navigation.svelte`, `tests/reader/contributions.test.ts`, `config/text.yml` (`reader.empty`).
- Moving: `src/lib/views/Reader.svelte` (`move`, `selectSection`, `sections.length > 1`), `tests/browser/reader.spec.ts` (scroll test).
- The document: `src/lib/views/RitualDocument.svelte`, `src/lib/views/CatechismDocument.svelte`, `config/text.yml`.
- The source link: `src/lib/views/SourceLink.svelte`, `src-tauri/src/library.rs` (`open_source`), `src/oculus/App.svelte`.
- The reading position: `src/lib/reader/state.ts`, `src/lib/views/Reader.svelte` (`onMount`, `validRole`), `src/oculus/App.svelte`.
- The library screen: `src/routes/+page.svelte`, `src/oculus/App.svelte`, `config/text.yml`.
- Colours: `src/app.css` (`prefers-color-scheme: dark`), `src/oculus/theme.css`, `tests/browser/oculus.spec.ts`.
- An example: `examples/rituals/demonstration-ritual.yaml` (role `speaker`, label Spreker, one speech `speaker-reflects` in section "Overweging").
- Where its code lives: `git ls-files src/lib`, `.agents/change-standard.md` ("Officium rules"), `tests/architecture.test.ts`.

---

## 3. `docs/user/manual/library.md` (new)

````markdown
# The library

The library is the set of YAML documents Officium reads, with their source PDFs and images. A library is either the personal library under `rituals/`, which Git ignores, or the fictional example library under `examples/`, which the repository holds. This page says how each build finds the documents, which library it shows and what it refuses. The format of a document is in `docs/user/reference/document-format.md`.

## The two libraries

| Library  | Documents under     | Source PDFs and images relative to | Tracked by Git |
| -------- | ------------------- | ---------------------------------- | -------------- |
| Personal | `rituals/`          | `rituals/`                         | No             |
| Examples | `examples/rituals/` | `examples/`                        | Yes            |

The browser build and the oculus app show the personal library when it holds at least one document, and the example library otherwise; they never show both. The desktop application reads the folder it was given instead, as `docs/user/manual/desktop.md` says, and the `source.file`, `answer_image` and image `file` paths of its documents are relative to that folder.

Real documents live only under `rituals/`. A test, an example, the source code and the documentation hold fictional text only, and the public repository builds without `rituals/`. `tests/privacy.test.ts` requires `/rituals/` to stay in `.gitignore` and fails when Git tracks a path below `rituals/`.

## A personal library

```text
rituals/
    sources/
        training-session.pdf
        review-questions.pdf
    assets/
        arrangement.png
    training-session/
        document.yaml
        sections/
            opening.yaml
            closing.yaml
    review-questions.yaml
```

Here `training-session/` is a directory document and `review-questions.yaml` a standalone document. `source.file: sources/training-session.pdf` and `answer_image: assets/arrangement.png` name files relative to `rituals/`.

## How the documents are found

Each build walks the library's document folder and its subfolders:

- A folder that holds a `document.yaml` is one directory document. Its sections are the files its `sections` list names, in that order, and every other file and folder inside it is not read as a document.
- In any other folder, each file ending in `.yaml` or `.yml` is one standalone document, and each subfolder is walked in turn.
- The desktop application does not walk folders named `sources` or `assets`.
- The oculus app does not read an entry that is a link.

The documents are then sorted by their `order` key, and two documents with the same `id` or the same `order` refuse the whole library.

![The path of a document: found, parsed, validated, its paths checked, ordered and shown, or refused to the library screen](../diagrams/document-path.svg)

## What a library refuses

A document that breaks a rule of the format refuses the whole library, and the reader shows the library screen with the error, as `docs/user/manual/reader.md` says. The message names the document's path, the field and the rule, as `<document path>: <field>: <message>`:

```text
rituals/training-session/document.yaml: sections[0].entries[2].speaker: unknown role 'reader'
rituals/review-questions.yaml: source.file: file does not exist: sources/review-questions.pdf
duplicate document order '10'
```

The paths a document names are checked as well:

- In every build, the validator refuses a `source.file`, `answer_image` or image `file` path that starts with `/` or holds a `.` or `..` segment.
- The browser build also refuses such a path when it resolves, through a link, to a place outside the library ("path escapes the corpus root" or "resolved path escapes the corpus root"), and the desktop application when it leaves the chosen folder ("library path leaves the selected directory").
- A missing source PDF is refused when the library loads in the browser build and the oculus app ("file does not exist"). The desktop application does not check the PDF when the library loads; a source link to a missing PDF then opens nothing, and the reader shows no message, since `src/routes/+page.svelte` does not catch the error of the `open_source` command.
- In the browser build and the oculus app, a section path of a directory document must have the form `sections/<name>.yaml` ("expected a path shaped like 'sections/opening.yaml'"), and the browser build refuses one that does not exist ("file does not exist: sections/<name>.yaml"). The desktop application accepts any relative section path inside the chosen folder without `.` or `..` segments.

The validator's messages are listed with their keys in `docs/user/reference/document-format.md`.

## When a change is seen

- The browser build reads the library again for every request to its endpoints, so a changed document is seen when the page is reloaded.
- The desktop application reads the library when it starts and when a folder is chosen with **Bibliotheek**.
- The oculus app reads the library when its tab opens.

## Where its code lives

- `src/lib/server/catalogue.ts`: the browser build's library, read from the file system on the server.
- `src-tauri/src/library.rs`: the desktop application's commands that read the folder, its images and its PDFs.
- `src/lib/oculus/library.ts`: the oculus app's library, read through the oculus file bridge.
- `src/lib/data/`: the parser, the validator and the order checks that every build uses.
````

### Sources
- The two libraries: `src/lib/server/catalogue.ts` (`loadCatalogue`, `corpus`), `src/lib/oculus/library.ts` (`personalCorpus`, `exampleCorpus`), `src/lib/desktop/library.ts`, `.gitignore`.
- Real documents and privacy: `.agents/change-standard.md` ("Officium rules"), `tests/privacy.test.ts`.
- A personal library: the layout follows `README.md` ("Add personal documents", "YAML structure"); the tree is made up.
- How found: `src/lib/server/catalogue.ts` (`documentDefinitions`), `src-tauri/src/library.rs` (`collect_documents`, which skips `sources` and `assets`), `src/lib/oculus/library.ts` (`findDefinitions`, `isType`), `tests/oculus/library.test.ts` ("skips an entry that is a link"), `src/lib/data/order.ts`.
- What it refuses: `src/lib/data/validate.ts`, `src/lib/server/catalogue.ts` (`safeAssetPath`, `listedSectionPaths`), `src-tauri/src/library.rs` (`safe_child`, `safe_file`, `read_composed_document`), `src/lib/oculus/library.ts` (`requireSource`), `src/lib/data/sections.ts`, `src/lib/desktop/library.ts` (calls `parseDocumentParts` with no section-name check), `src/routes/+page.svelte` (`openSource` with no catch).
- When a change is seen: `src/routes/api/*/+server.ts` (each calls `loadCatalogue` or `findDocument`), `src/routes/+page.svelte` (`onMount`, `selectLibrary`), `src/oculus/App.svelte` (`onMount`).

---

## 4. `docs/user/manual/browser.md` (new)

````markdown
# The browser build

The browser build runs Officium as a SvelteKit application on a Node server. The server reads the library from the repository folder and serves it to the reader in the browser through four endpoints. It is the build to use for working on Officium and for reading a library without installing the desktop application.

## Running it

Install Node.js 24, then, from the repository root:

```sh
npm install
npm run dev
```

`npm run dev` starts the Vite development server on the address `127.0.0.1`, which `vite.config.ts` sets, and prints the address with its port. Open that address in a browser. The reader shows the personal library under `rituals/` when it holds a document, and the fictional examples under `examples/rituals/` otherwise, as `docs/user/manual/library.md` says.

The server reads the library from the folder it is started in, so `npm run dev` runs from the repository root.

## Building it

```sh
npm run build
npm run preview
```

`npm run build` builds the application with `@sveltejs/adapter-node`, the adapter `svelte.config.js` selects when `OFFICIUM_DESKTOP` is not `1`, into `build/`, which Git ignores. `npm run preview` serves that build with Vite's preview server.

Question: no file of the repository gives the command that runs the built server on its own (adapter-node's output in `build/`). Which command, if any, should this page give?

## How the page gets the library

The page renders in the browser only: `src/routes/+layout.ts` sets `ssr = false`. When it opens, it requests `GET /api/catalogue`, which returns every document of the library as validated JSON. A source link points at `GET /api/source/<document id>#page=<pdf_page>`, and the images of a document are served by `GET /api/entry-image/...` and `GET /api/answer-image/...`. `docs/user/reference/endpoints.md` lists the endpoints with their answers and errors.

Every request to an endpoint reads the library again, so a changed document is seen when the page is reloaded.

## Its errors

- When `GET /api/catalogue` does not answer with a success, the library screen shows "De bibliotheek kon niet worden geladen" and `HTTP <status>`, such as `HTTP 500`.
- A source PDF or an image the endpoints cannot find is answered with 404 and "Bronbestand niet gevonden." or "Afbeelding niet gevonden.".

Question: the validator's message for a refused document (`<document path>: <field>: <message>`) is thrown on the server, and the page shows only the HTTP status. No file of the repository says where the message itself appears. Where should this page tell a user to look for it?

## Where its code lives

- `src/routes/+page.svelte`: the page, which loads the catalogue and shows the reader or the library screen.
- `src/routes/api/`: the four endpoints.
- `src/lib/server/catalogue.ts`: the library read from the file system.
````

### Sources
- Running it: `README.md` ("Run"), `package.json` (`dev`), `vite.config.ts` (`server.host`), `src/lib/server/catalogue.ts` (`process.cwd()`).
- Building it: `package.json` (`build`, `preview`), `svelte.config.js`, `.gitignore` (`build/`).
- How the page gets the library: `src/routes/+layout.ts`, `src/routes/+page.svelte`, `src/lib/views/SourceLink.svelte`, `src/lib/views/RitualDocument.svelte`, `src/lib/views/CatechismDocument.svelte`, `src/routes/api/`.
- Its errors: `src/routes/+page.svelte` (`HTTP ${response.status}`), `src/routes/api/*/+server.ts`.

---

## 5. `docs/user/manual/desktop.md` (new)

````markdown
# The desktop application

The desktop application runs Officium as a native application for macOS, Windows and Linux, built with Tauri around the same Svelte interface. It reads a library folder the user chooses on the computer, or a library bundled into a personal build, and opens source PDFs in the operating system's default application.

## What it needs

- Node.js 24 and `npm install`, as for the browser build.
- The current stable Rust toolchain; `src-tauri/Cargo.toml` names Rust 1.77.2 as the oldest version it builds with.
- The platform prerequisites listed by Tauri.

## Running it while working on it

```sh
npm run tauri:dev
```

This starts `npm run dev`, as `src-tauri/tauri.conf.json` says in `beforeDevCommand`, and opens the application window on `http://127.0.0.1:5173`. The window opens at 1280 by 800 pixels and can be made no smaller than 900 by 600.

## Choosing the library

When the application starts it opens, in this order:

1. the folder it remembers from an earlier start;
2. otherwise, the library bundled into a personal build;
3. otherwise, the library screen with the button **Kies documentenmap**, which opens a native folder picker.

A folder chosen with the picker is remembered once it has loaded without an error, in the application's settings file `settings.json` under the key `ritual-library`. The **Bibliotheek** button in the header opens the picker again to choose another folder.

The chosen folder is the library root: the documents are found in it as `docs/user/manual/library.md` says, and every `source.file`, `answer_image` and image `file` path is relative to it. A folder with no document shows "Geen YAML-documenten gevonden.".

A source link opens the document's PDF in the operating system's default application. The application reads only PNG, JPEG and WebP files as images ("only PNG, JPEG, and WebP library assets can be read") and opens only a PDF as a source ("source path must refer to a PDF").

## Building it

Build the public application, without personal documents:

```sh
npm run tauri:build
```

Build a personal application that holds the ignored `rituals/` folder:

```sh
npm run tauri:build:private
```

Both builds first run `npm run build:desktop`, which builds the interface with `@sveltejs/adapter-static` into `build/`, selected by `OFFICIUM_DESKTOP=1`. The personal build adds `src-tauri/tauri.private.conf.json`, which copies `rituals/` into the application's resources as `rituals/`; the application then opens that library when it remembers no folder.

Bundled personal files are ordinary application resources and are not encrypted. Do not distribute a personal build. The public build never includes the local library.

| Platform | Packages                | Configuration                                                                                             |
| -------- | ----------------------- | --------------------------------------------------------------------------------------------------------- |
| macOS    | `.app` and `.dmg`       | `src-tauri/tauri.macos.conf.json`, macOS 10.15 or later                                                   |
| Windows  | NSIS and MSI installers | `src-tauri/tauri.windows.conf.json`, which installs the WebView2 runtime with its downloaded bootstrapper |
| Linux    | AppImage, DEB and RPM   | `src-tauri/tauri.linux.conf.json`                                                                         |

## The build workflow

`.github/workflows/desktop-build.yml` builds the public application on GitHub Actions when it is started by hand or when a tag starting with `v` is pushed. It builds four targets: Apple Silicon and Intel macOS, Windows x86-64 and Linux x86-64 on Ubuntu 22.04. Each job runs `npm ci`, `npm test`, `npm run check` and `npm run lint`, then the Tauri build, and uploads the packages as the workflow artifact `officium-<target>`.

The workflow signs packages when the corresponding repository secrets exist and otherwise produces unsigned artifacts. Apple signing and notarization use `APPLE_CERTIFICATE`, `APPLE_CERTIFICATE_PASSWORD`, `APPLE_SIGNING_IDENTITY`, `APPLE_ID`, `APPLE_PASSWORD`, and `APPLE_TEAM_ID`. Windows Authenticode signing uses `WINDOWS_CERTIFICATE`, `WINDOWS_CERTIFICATE_PASSWORD`, and `WINDOWS_TIMESTAMP_URL`; the Windows signing configuration is written to `src-tauri/tauri.signing.conf.json`, which Git ignores. Linux AppImage and RPM signing use `LINUX_GPG_PRIVATE_KEY`, `LINUX_GPG_KEY_ID`, and `LINUX_GPG_PASSPHRASE`. Signing credentials never belong in the repository. `docs/user/reference/environment-variables.md` lists the secrets.

## Its errors

A library that cannot be loaded shows the library screen with "De bibliotheek kon niet worden geladen" and the message, such as a validator message (`<document path>: <field>: <message>`), "the selected ritual library is not a directory" or "library paths must be relative and may not contain dot segments".

## Where its code lives

- `src/lib/desktop/library.ts`: the interface side, which calls the commands and parses the documents.
- `src-tauri/src/library.rs`: the commands `bundled_library_path`, `load_library`, `read_library_file` and `open_source`, and the two Rust tests of the library walk and the path check.
- `src-tauri/src/lib.rs`: the application, with the dialog, store and opener plugins.
````

### Sources
- What it needs: `README.md` ("Run", "Desktop application"), `src-tauri/Cargo.toml` (`rust-version = "1.77.2"`).
- Running it: `package.json` (`tauri:dev`), `src-tauri/tauri.conf.json` (`beforeDevCommand`, `devUrl`, `windows`).
- Choosing the library: `src/routes/+page.svelte` (`onMount` order, `selectLibrary`, the `'Geen YAML-documenten gevonden.'` string), `src/lib/desktop/library.ts` (`settings.json`, `ritual-library`), `src-tauri/src/library.rs` (`bundled_library_path`, `read_library_file`, `open_source` and their messages), `README.md` ("Desktop application").
- Building it: `package.json`, `src-tauri/tauri.conf.json` (`beforeBuildCommand`), `svelte.config.js`, `src-tauri/tauri.private.conf.json`, `src-tauri/tauri.macos.conf.json`, `src-tauri/tauri.windows.conf.json`, `src-tauri/tauri.linux.conf.json`, `README.md`.
- The build workflow: `.github/workflows/desktop-build.yml`, `.gitignore` (`/src-tauri/tauri.signing.conf.json`), `README.md`.
- Its errors: `src/routes/+page.svelte`, `src-tauri/src/library.rs` (`canonical_directory`, `safe_child`).
- Where its code lives: `src/lib/desktop/library.ts`, `src-tauri/src/library.rs`, `src-tauri/src/lib.rs`.

---

## 6. `docs/user/manual/oculus.md` (new)

````markdown
# The oculus app

The oculus app runs Officium's reader as an app in the oculus workbench, in an oculus tab, when this folder is a folder of the oculus workspace. It reads the library of this folder through oculus's file bridge, keeps the reading position per oculus tab, opens source PDFs in oculus's file viewer and follows the oculus theme.

## Building and opening it

```sh
npm run build:oculus
```

This builds the app with `vite.oculus.config.ts` into `.oculus/apps/officium/`, which Git, Prettier and ESLint ignore. Oculus finds the app while it runs and lists it in its view catalogue, and the first open asks for your approval. A changed app asks for approval again, unless it was approved with "Keep approved while I edit". Run `npm run build:oculus` again after changing the interface.

Oculus reads the app's name, title and description from its manifest, `src/oculus/public/app.yml`:

```yaml
name: officium
title: Officium
description: Reads the documents of the officium library from this folder.
glyph: page
bridge: 1
```

The app's address has the form `/apps/@<root>/<name>/<key>/`, and the app takes the folder it reads from the `<root>` part. An address of another form is refused with "expected an address of the form /apps/@<root>/<name>/<key>/".

## The library

The app reads `rituals/` of this folder and, when it holds no document, `examples/rituals/`, through the bridge, so the library is the one in this folder and there is no library picker. The documents are found as `docs/user/manual/library.md` says. The images of a document are read through the bridge and put into the page as `data:` addresses.

## The source button

A source button opens the PDF in oculus's file viewer at the PDF page of its entry. It asks the bridge to open the file `<library>/<source.file>` of this folder, such as `examples/sources/demonstration-ritual.pdf`, with the entry's `pdf_page`.

## The reading position and the theme

The reading position (the document, the role and the current item) is kept through the bridge for each oculus tab, so no file is written into this folder. The colours follow the oculus theme: `src/oculus/theme.css` maps the tokens oculus paints on the page onto the palette of `src/app.css`.

## Its errors

- A library that cannot be read shows the library screen with the folder and oculus's refusal, such as `rituals: failed:500`.
- A folder that holds no document shows "Er zijn geen documenten gevonden in rituals/ of examples/rituals/ van deze map."
- A source the bridge does not open shows the notice "Het bronbestand kon niet worden geopend: <refusal>" above the reader, with a **Sluiten** button.
- A reading position the bridge does not keep shows the notice "De leespositie kon niet worden bewaard: <refusal>".

## Where its code lives

- `src/oculus/`: the app's page, `App.svelte`, its manifest and its theme.
- `src/lib/oculus/`: the address, the connection to the bridge module `/apps/-/oculus.js`, and the library read through the bridge.
- `tests/browser/oculus.spec.ts`: the built app served under the oculus policy with a stand-in bridge.
````

### Sources
- Opening and building: `README.md` ("Run in oculus"), `package.json` (`build:oculus`), `vite.oculus.config.ts`, `.gitignore`, `.prettierignore`, `eslint.config.js`, `.agents/change-standard.md` ("Officium rules": `.oculus/apps/officium/` generated and ignored).
- Manifest: `src/oculus/public/app.yml`, `.agents/change-standard.md` (strings exception).
- Address: `src/lib/oculus/address.ts`, `tests/oculus/address.test.ts`.
- Library and images: `src/lib/oculus/library.ts` (`loadOculusLibrary`, `imageUrl`), `README.md`.
- Source button: `src/lib/oculus/library.ts` (`sourcePlace`), `src/oculus/App.svelte`, `tests/browser/oculus.spec.ts`.
- Position and theme: `src/oculus/App.svelte`, `src/oculus/theme.css`, `.scratch/archive/1-run-officium-as-an-oculus-root-app/plan.md` (Ruling D: no file written into the repository; the plan ledger itself is unchanged).
- Errors: `src/oculus/App.svelte`, `src/lib/oculus/library.ts` (`listDirectory`), `config/text.yml`, `tests/browser/oculus.spec.ts`.
- Code: `src/lib/oculus/connect.ts` (`/apps/-/oculus.js`).

---

## 7. `docs/user/reference/document-format.md` (new)

````markdown
# The document format

Every key of an Officium document, with its type, whether it is required, its rule and the message the validator prints when the rule is broken. The validator is `src/lib/data/validate.ts`, and the section paths of a directory document are checked by `src/lib/data/sections.ts`. The README's "YAML structure" section gives the format with complete examples.

A message is printed as `<document path>: <field>: <message>`, where the field is the path of the key in the document, such as `sections[0].entries[2].speaker`. The two library-wide messages, for a duplicate `id` or `order`, carry no path. No key has a default: a key that is not required is left out when it has no value.

## The two forms of a document

- A standalone document is one YAML file, ending in `.yaml` or `.yml`, that holds every key below, with its sections inline.
- A directory document is a folder that holds `document.yaml`. The manifest holds every key below, and its `sections` list names the section files, each one section object. The sections are read in the order of that list.

## Values

| Name             | Rule                                                                                                                                               | Message                                                            |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| identifier       | A string of lowercase ASCII letters and digits in runs joined by single hyphens, such as `opening-speech`                                          | `expected a lowercase ASCII identifier`                            |
| nonempty string  | A string that holds a character other than white space                                                                                             | `expected a nonempty string`                                       |
| positive integer | An integer of 1 or more                                                                                                                            | `expected a positive integer`                                      |
| object           | A YAML mapping                                                                                                                                     | `expected an object`                                               |
| list             | A YAML sequence                                                                                                                                    | `expected an array`                                                |
| nonempty list    | A list with at least one item                                                                                                                      | `must not be empty`                                                |
| PDF path         | A path relative to the library root, not starting with `/`, with no `.` or `..` segment, ending in `.pdf`                                          | `expected a relative PDF path without dot segments`                |
| image path       | A path relative to the library root, not starting with `/`, with no `.` or `..` segment, ending in `.png`, `.jpg`, `.jpeg` or `.webp`, in any case | `expected a relative PNG, JPEG, or WebP path without dot segments` |

## The document

| Key              | Type                   | Required          | Rule                                                                                                   | Message on a break                     |
| ---------------- | ---------------------- | ----------------- | ------------------------------------------------------------------------------------------------------ | -------------------------------------- |
| `schema_version` | integer                | Yes               | The integer `1`                                                                                        | `expected 1`                           |
| `id`             | identifier             | Yes               | Unique in the library                                                                                  | `duplicate document identifier '<id>'` |
| `order`          | positive integer       | Yes               | Unique in the library; the library is sorted by it, then by title                                      | `duplicate document order '<order>'`   |
| `document_type`  | string                 | Yes               | `ritual` or `catechism`                                                                                | `expected 'ritual' or 'catechism'`     |
| `title`          | nonempty string        | Yes               | Shown in the document selector and above the document                                                  |                                        |
| `language`       | nonempty string        | Yes               | A language identifier such as `en` or `nl`                                                             |                                        |
| `source`         | object                 | Yes               | Holds `file`                                                                                           |                                        |
| `source.file`    | PDF path               | Yes               | The source PDF; the browser build and the oculus app also require the file to exist                    | `file does not exist: <path>`          |
| `roles`          | nonempty list of roles | Yes, for `ritual` | Role identifiers are unique                                                                            | `duplicate identifier '<id>'`          |
| `sections`       | nonempty list          | Yes               | Section objects in a standalone file, section-file paths in a manifest; section identifiers are unique | `duplicate identifier '<id>'`          |

Every entry or block identifier is unique across the whole document: `duplicate identifier '<id>'`.

## A section-file path

A path in the `sections` list of `document.yaml`.

| Rule                                                                                                  | Message                                               |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| The list exists and holds at least one path                                                           | `expected a non-empty list of section file paths`     |
| The path has the form `sections/<name>.yaml`, the name of lowercase ASCII letters, digits and hyphens | `expected a path shaped like 'sections/opening.yaml'` |
| The file exists, checked by the browser build                                                         | `file does not exist: sections/<name>.yaml`           |

The desktop application checks only that the path is relative, has no `.` or `..` segment and stays inside the chosen folder; `docs/user/manual/library.md` gives the difference.

## A role

| Key     | Type            | Required | Rule                                        |
| ------- | --------------- | -------- | ------------------------------------------- |
| `id`    | identifier      | Yes      | Unique among the document's roles           |
| `label` | nonempty string | Yes      | The role name shown in the **Rol** selector |

## A section of a role-based document

| Key       | Type            | Required | Rule                                                   |
| --------- | --------------- | -------- | ------------------------------------------------------ |
| `id`      | identifier      | Yes      | Unique among the sections                              |
| `title`   | nonempty string | Yes      | Shown above the section and in the **Sectie** selector |
| `entries` | nonempty list   | Yes      | The entries, in reading order                          |

## An entry

| Key                   | Type                         | Required                            | Rule                                                                                       | Message on a break                                   |
| --------------------- | ---------------------------- | ----------------------------------- | ------------------------------------------------------------------------------------------ | ---------------------------------------------------- |
| `id`                  | identifier                   | Yes                                 | Unique in the document                                                                     | `duplicate identifier '<id>'`                        |
| `kind`                | string                       | Yes                                 | `speech`, `action`, `direction` or `text`                                                  | `expected speech, action, direction, or text`        |
| `speaker`             | identifier                   | Yes, for `speech`                   | A role of the document                                                                     | `unknown role '<id>'`                                |
| `roles`               | nonempty list of identifiers | Yes, for `action`                   | Each a role of the document, none twice                                                    | `unknown role '<id>'`, `duplicate identifier '<id>'` |
| `text`                | nonempty string              | Exactly one of `text` and `content` |                                                                                            | `expected exactly one of text or content`            |
| `content`             | nonempty list of parts       | Exactly one of `text` and `content` | At least one text part                                                                     | `expected at least one text part`                    |
| `source`              | object                       | Yes                                 | Holds `pdf_page`                                                                           |                                                      |
| `source.pdf_page`     | positive integer             | Yes                                 | The physical page of the source PDF                                                        |                                                      |
| `source.printed_page` | nonempty string              | No                                  | The page label printed in the document; shown as "p. <label>" in place of "PDF <pdf_page>" |                                                      |

An entry of `content` is indexed and labelled by the text of its text parts, joined by single spaces.

## A content part

| Key       | Type            | Required         | Rule                                                       | Message on a break             |
| --------- | --------------- | ---------------- | ---------------------------------------------------------- | ------------------------------ |
| `type`    | string          | Yes              | `text` or `image`                                          | `expected 'text' or 'image'`   |
| `text`    | nonempty string | Yes, for `text`  |                                                            |                                |
| `file`    | image path      | Yes, for `image` | Relative to the library root                               |                                |
| `alt`     | nonempty string | Yes, for `image` | The image's description                                    |                                |
| `display` | string          | Yes, for `image` | `inline` in the text flow, `block` centred on its own line | `expected 'inline' or 'block'` |

## A section of a question-and-answer document

| Key      | Type            | Required | Rule                                                   |
| -------- | --------------- | -------- | ------------------------------------------------------ |
| `id`     | identifier      | Yes      | Unique among the sections                              |
| `title`  | nonempty string | Yes      | Shown above the section and in the **Sectie** selector |
| `blocks` | nonempty list   | Yes      | The blocks, in reading order                           |

## A block

| Key                   | Type             | Required                                               | Rule                                   | Message on a break                               |
| --------------------- | ---------------- | ------------------------------------------------------ | -------------------------------------- | ------------------------------------------------ |
| `id`                  | identifier       | Yes                                                    | Unique in the document                 | `duplicate identifier '<id>'`                    |
| `type`                | string           | Yes                                                    | `text`, `prompt` or `pair`             | `expected text, prompt, or pair`                 |
| `text`                | nonempty string  | Yes, for `text` and `prompt`                           |                                        |                                                  |
| `question`            | nonempty string  | Yes, for `pair`                                        |                                        |                                                  |
| `answer`              | nonempty string  | Exactly one of `answer` and `answer_image`, for `pair` |                                        | `expected exactly one of answer or answer_image` |
| `answer_image`        | image path       | Exactly one of `answer` and `answer_image`, for `pair` | Relative to the library root           | `expected exactly one of answer or answer_image` |
| `source.pdf_page`     | positive integer | Yes                                                    | The physical page of the source PDF    |                                                  |
| `source.printed_page` | nonempty string  | No                                                     | The page label printed in the document |                                                  |

## Where it is defined

- `src/lib/data/validate.ts`: every rule above but the section-file paths and the library-wide uniqueness.
- `src/lib/data/sections.ts`: the section-file paths of a manifest.
- `src/lib/data/order.ts`: the unique `id` and `order` across the library, and the sort.
- `src/lib/data/model.ts`: the validated document, the shape `GET /api/catalogue` returns.
````

### Sources
- Every rule and message: `src/lib/data/validate.ts` (`identifier`, `nonemptyString`, `positiveInteger`, `record`, `array`, `requireNonempty`, `requireUnique`, `documentSource`, `relativeImage`, `ritualEntry`, `ritualContent`, `catechismBlock`, `knownRole`, `integer`).
- Section-file paths: `src/lib/data/sections.ts`, `src/lib/server/catalogue.ts` (`listedSectionPaths`), `src-tauri/src/library.rs` (`safe_child`).
- Library-wide uniqueness and sort: `src/lib/data/order.ts`.
- Missing file: `src/lib/server/catalogue.ts`, `src/lib/oculus/library.ts`.
- Display labels "p." and "PDF": `src/lib/views/SourceLink.svelte`, `config/text.yml`.
- `.yaml` or `.yml`: `src/lib/server/catalogue.ts`, `src/lib/oculus/library.ts`, `src-tauri/src/library.rs`.

---

## 8. `docs/user/reference/endpoints.md` (new)

````markdown
# The endpoints of the browser build

The browser build's server answers four `GET` endpoints, each under `src/routes/api/`. Each reads the library again for every request, as `docs/user/manual/library.md` says. The desktop application and the oculus app use none of them.

| Endpoint                                     | Answer                                                                                              | Headers                                                                                                                 | Error                                                                        | Defined in                                                        |
| -------------------------------------------- | --------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `/api/catalogue`                             | JSON: the list of validated documents of the library, sorted by `order`                             | Written by SvelteKit's `json` helper                                                                                    | A refused library fails the request                                          | `src/routes/api/catalogue/+server.ts`                             |
| `/api/source/<document>`                     | The source PDF of the document with that `id`                                                       | `content-type: application/pdf`, `content-disposition: inline; filename="<id>.pdf"`, `cache-control: private, no-store` | 404, `Bronbestand niet gevonden.`                                            | `src/routes/api/source/[document]/+server.ts`                     |
| `/api/answer-image/<document>/<block>`       | The `answer_image` of the pair block with that `id`                                                 | `content-type` from the extension (`image/png`, `image/jpeg` or `image/webp`), `cache-control: private, no-store`       | 404, `Afbeelding niet gevonden.`                                             | `src/routes/api/answer-image/[document]/[block]/+server.ts`       |
| `/api/entry-image/<document>/<entry>/<part>` | The image `file` of the content part at index `<part>`, counted from 0, of the entry with that `id` | `content-type` from the extension, `cache-control: private, no-store`                                                   | 404, `Afbeelding niet gevonden.`, also for a `<part>` that is not an integer | `src/routes/api/entry-image/[document]/[entry]/[part]/+server.ts` |

## The catalogue's JSON

Each document of `/api/catalogue` has the shape of `OfficiumDocument` in `src/lib/data/model.ts`: the keys of the YAML in camel case (`schemaVersion`, `documentType`, `pdfPage`, `printedPage`, `answerImage`), with the `type` of a block read as `kind`, and every entry of a role-based document carrying both its `text` and its `content` list. An entry written with `text` gets a `content` list of one text part, and an entry written with `content` gets a `text` of its text parts joined by single spaces.

A shortened example, from `examples/rituals/demonstration-catechism.yaml`:

```json
[
    {
        "schemaVersion": 1,
        "id": "demonstration-catechism",
        "order": 20,
        "title": "Demonstratiecatechismus",
        "language": "nl",
        "source": { "file": "sources/demonstration-catechism.pdf" },
        "documentType": "catechism",
        "sections": [
            {
                "id": "reading",
                "title": "Lezen en herinneren",
                "blocks": [
                    {
                        "id": "purpose",
                        "source": { "pdfPage": 1, "printedPage": "1" },
                        "kind": "pair",
                        "question": "Waarom lezen wij een tekst meer dan eenmaal?",
                        "answer": "Omdat herhaling de volgorde, de verbanden en de bedoeling beter zichtbaar maakt."
                    }
                ]
            }
        ]
    }
]
```
````

### Sources
- The four routes and their headers and errors: the four `+server.ts` files named in the table. Reading the library on each request: `src/lib/server/catalogue.ts` (`findDocument` calls `loadCatalogue`).
- The JSON shape: `src/lib/data/model.ts`, `src/lib/data/validate.ts` (key order of `common`, `catechismBlock`, `ritualEntry`).
- The example: `examples/rituals/demonstration-catechism.yaml`, shortened by hand and not produced by a run of the server.

---

## 9. `docs/user/reference/npm-scripts.md` (new)

````markdown
# The npm scripts

Every script of `package.json`, run as `npm run <script>` from the repository root (`npm test` for `test`). Install Node.js 24 and run `npm install` first.

| Script                | Runs                                                         | What it does                                                                                                                              |
| --------------------- | ------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `dev`                 | `vite dev`                                                   | Starts the browser build's development server on `127.0.0.1`                                                                              |
| `build`               | `vite build`                                                 | Builds the browser build with adapter-node into `build/`                                                                                  |
| `build:desktop`       | `cross-env OFFICIUM_DESKTOP=1 vite build`                    | Builds the interface with adapter-static into `build/`, for the desktop application                                                       |
| `build:oculus`        | `vite build --config vite.oculus.config.ts`                  | Builds the oculus app into `.oculus/apps/officium/`                                                                                       |
| `tauri`               | `tauri`                                                      | The Tauri command line, for any of its commands                                                                                           |
| `tauri:dev`           | `tauri dev`                                                  | Starts `npm run dev` and opens the desktop application on it                                                                              |
| `tauri:build`         | `tauri build`                                                | Builds the public desktop application and its packages, after `npm run build:desktop`                                                     |
| `tauri:build:private` | `tauri build --config src-tauri/tauri.private.conf.json`     | Builds a personal desktop application that bundles `rituals/`                                                                             |
| `preview`             | `vite preview`                                               | Serves the output of `npm run build`                                                                                                      |
| `check`               | `svelte-kit sync && svelte-check --tsconfig ./tsconfig.json` | Generates SvelteKit's types and checks the TypeScript and Svelte files                                                                    |
| `lint`                | `eslint .`                                                   | Lints the repository with `eslint.config.js`                                                                                              |
| `test`                | `vitest run`                                                 | Runs the vitest cases under `tests/`: data, reader, server, oculus, architecture, privacy                                                 |
| `test:browser`        | `playwright test`                                            | Runs Playwright in Chrome: the app on `npm run dev` on 127.0.0.1:8793, and the oculus build served through routes under the oculus policy |
| `format`              | `prettier --write .`                                         | Formats the repository with `.prettierrc`                                                                                                 |
| `format:check`        | `prettier --check .`                                         | Checks that every file Prettier formats is formatted                                                                                      |

## The checks before a change is called verified

`npm test`, `npm run test:browser`, `npm run check`, `npm run lint`, `npm run build`, `npm run format:check` and `npm run build:oculus`, each run from the repository root and each exiting 0. `npm run test:browser` builds the oculus app itself before its oculus cases, and starts its own server on port 8793.

The privacy test in `npm test` requires `/rituals/`, `/AGENTS.md` and `/CLAUDE.md` to stay in `.gitignore`, and fails when Git reports a tracked path below `rituals/`. The two Rust tests in `src-tauri/src/library.rs` are run by none of these scripts.
````

### Sources
- `package.json` (the 15 scripts); `.agents/building.md` (the "What it checks" column, the order of the checks, the privacy sentence as the user now has it); `.agents/change-standard.md` ("Before a change is reported as verified, every command in the commands block above passes").
- `vite.config.ts`, `svelte.config.js`, `vite.oculus.config.ts`, `src-tauri/tauri.conf.json`, `src-tauri/tauri.private.conf.json`.
- `playwright.config.ts` (port 8793, `webServer`); `tests/browser/oculus.spec.ts` (`beforeAll` runs `npm run build:oculus`); `tests/privacy.test.ts`; `src-tauri/src/library.rs`.

---

## 10. `docs/user/reference/text-catalogue.md` (new)

````markdown
# The text catalogue

`config/text.yml` holds every string the interface shows, as one key and its text per line. `validateTextCatalog` in `src/lib/data/text.ts` reads it when the page loads and requires each of the 34 keys below to hold a nonempty string; a key that is missing or empty stops the page with `config/text.yml: <key>: expected a nonempty string`. A key the file holds beyond these is ignored. Translating the interface means changing the texts of this file.

The one exception is `src/oculus/public/app.yml`, whose `title` and `description` oculus reads from the app's manifest, as `docs/user/manual/oculus.md` says.

| Key                     | Text                                                                            | Shown by                                                                          |
| ----------------------- | ------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `app.title`             | Officium                                                                        | `src/lib/views/Reader.svelte`, `src/oculus/App.svelte`, `src/routes/+page.svelte` |
| `app.subtitle`          | Gestructureerde documenten bestuderen met behoud van de volledige context.      | `src/routes/+page.svelte`                                                         |
| `library.choose`        | Kies documentenmap                                                              | `src/routes/+page.svelte`                                                         |
| `library.change`        | Bibliotheek                                                                     | `src/lib/views/Reader.svelte`                                                     |
| `library.loading`       | Bibliotheek laden...                                                            | `src/oculus/App.svelte`, `src/routes/+page.svelte`                                |
| `library.none_title`    | Kies uw documentenmap                                                           | `src/oculus/App.svelte`, `src/routes/+page.svelte`                                |
| `library.none_body`     | Selecteer de map die de documenten, bronnen en afbeeldingen bevat.              | `src/routes/+page.svelte`                                                         |
| `library.error_title`   | De bibliotheek kon niet worden geladen                                          | `src/oculus/App.svelte`, `src/routes/+page.svelte`                                |
| `oculus.none_body`      | Er zijn geen documenten gevonden in rituals/ of examples/rituals/ van deze map. | `src/oculus/App.svelte`                                                           |
| `oculus.source_failed`  | Het bronbestand kon niet worden geopend                                         | `src/oculus/App.svelte`                                                           |
| `oculus.state_failed`   | De leespositie kon niet worden bewaard                                          | `src/oculus/App.svelte`                                                           |
| `reader.document`       | Document                                                                        | `src/lib/views/Reader.svelte`                                                     |
| `reader.role`           | Rol                                                                             | `src/lib/views/Reader.svelte`                                                     |
| `reader.ritual`         | Script                                                                          | `src/lib/views/RitualDocument.svelte`                                             |
| `reader.catechism`      | Studiegids                                                                      | `src/lib/views/CatechismDocument.svelte`                                          |
| `reader.contributions`  | Bijdragen                                                                       | `src/lib/views/Navigation.svelte`, `src/lib/views/Reader.svelte`                  |
| `reader.questions`      | Vragen                                                                          | `src/lib/views/Navigation.svelte`, `src/lib/views/Reader.svelte`                  |
| `reader.close`          | Sluiten                                                                         | `src/lib/views/Reader.svelte`, `src/oculus/App.svelte`                            |
| `reader.of`             | van                                                                             | `src/lib/views/Reader.svelte`                                                     |
| `reader.previous`       | Vorige                                                                          | `src/lib/views/Reader.svelte`                                                     |
| `reader.next`           | Volgende                                                                        | `src/lib/views/Reader.svelte`                                                     |
| `reader.source`         | Bron                                                                            | `src/lib/views/SourceLink.svelte`                                                 |
| `reader.page`           | Pagina                                                                          | No view; the key is required but no file under `src/` reads it                    |
| `reader.page_short`     | p.                                                                              | `src/lib/views/Navigation.svelte`, `src/lib/views/SourceLink.svelte`              |
| `reader.pdf_page_short` | PDF                                                                             | `src/lib/views/Navigation.svelte`, `src/lib/views/SourceLink.svelte`              |
| `reader.section`        | Sectie                                                                          | `src/lib/views/Reader.svelte`                                                     |
| `reader.speech`         | Gesproken tekst                                                                 | `src/lib/views/RitualDocument.svelte`                                             |
| `reader.action`         | Handeling                                                                       | `src/lib/views/RitualDocument.svelte`                                             |
| `reader.direction`      | Regie                                                                           | `src/lib/views/RitualDocument.svelte`                                             |
| `reader.text`           | Toelichting                                                                     | `src/lib/views/CatechismDocument.svelte`, `src/lib/views/RitualDocument.svelte`   |
| `reader.contribution`   | Bijdrage                                                                        | `src/lib/views/RitualDocument.svelte`                                             |
| `reader.question`       | Vraag                                                                           | `src/lib/views/CatechismDocument.svelte`                                          |
| `reader.answer`         | Antwoord                                                                        | `src/lib/views/CatechismDocument.svelte`                                          |
| `reader.empty`          | Voor deze functie zijn geen bijdragen vastgelegd.                               | `src/lib/views/Navigation.svelte`                                                 |
````

### Sources
- `src/lib/data/text.ts` (`textKeys`, 34 entries: `grep -c "^    '"` prints 34; `validateTextCatalog` and its message).
- `config/text.yml` (each text, 34 lines, no extra key).
- "Shown by": `grep -rlF "'<key>'" src --include='*.svelte'` for each key; `reader.page` returns no file.
- The exception: `.agents/change-standard.md` ("Officium rules"), `src/oculus/public/app.yml`.

---

## 11. `docs/user/reference/environment-variables.md` (new)

````markdown
# The environment variables

## Of the build

| Variable           | Type         | Default | Effect                                                                                                                                                                            | Defined in         |
| ------------------ | ------------ | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------ |
| `OFFICIUM_DESKTOP` | `1` or unset | unset   | `1` builds the interface with `@sveltejs/adapter-static` and the fallback page `index.html`, for the desktop application; any other value builds it with `@sveltejs/adapter-node` | `svelte.config.js` |

`npm run build:desktop` sets it with `cross-env OFFICIUM_DESKTOP=1`, and `npm run tauri:build` and `npm run tauri:build:private` run that script first, as `src-tauri/tauri.conf.json` says in `beforeBuildCommand`.

## The signing secrets of the build workflow

`.github/workflows/desktop-build.yml` reads these repository secrets into the environment of each job. Each is optional: a platform whose secrets are absent gets unsigned packages. Signing credentials never belong in the repository.

| Secret                         | Platform | Used for                                                                                   |
| ------------------------------ | -------- | ------------------------------------------------------------------------------------------ |
| `APPLE_CERTIFICATE`            | macOS    | Signing and notarization                                                                   |
| `APPLE_CERTIFICATE_PASSWORD`   | macOS    | Signing and notarization                                                                   |
| `APPLE_SIGNING_IDENTITY`       | macOS    | Signing and notarization                                                                   |
| `APPLE_ID`                     | macOS    | Signing and notarization                                                                   |
| `APPLE_PASSWORD`               | macOS    | Signing and notarization                                                                   |
| `APPLE_TEAM_ID`                | macOS    | Signing and notarization                                                                   |
| `WINDOWS_CERTIFICATE`          | Windows  | Authenticode signing: the certificate as base64, imported into the job's certificate store |
| `WINDOWS_CERTIFICATE_PASSWORD` | Windows  | Authenticode signing: the certificate's password                                           |
| `WINDOWS_TIMESTAMP_URL`        | Windows  | Authenticode signing: the timestamp server; without it nothing is signed                   |
| `LINUX_GPG_PRIVATE_KEY`        | Linux    | AppImage and RPM signing: the key imported with `gpg`                                      |
| `LINUX_GPG_KEY_ID`             | Linux    | AppImage and RPM signing: the key to sign with                                             |
| `LINUX_GPG_PASSPHRASE`         | Linux    | AppImage and RPM signing: the key's passphrase                                             |
````

### Sources
- `svelte.config.js`, `package.json`, `src-tauri/tauri.conf.json`.
- `.github/workflows/desktop-build.yml` (the `env` block; the Windows step runs only when `WINDOWS_CERTIFICATE` and `WINDOWS_TIMESTAMP_URL` are set; the Linux step runs `gpg --batch --import`).
- `README.md` ("Desktop application": unsigned artifacts, credentials never in the repository).

---

## 12. `docs/user/feature-map/README.md` (new)

````markdown
# The feature map

Each capability of Officium, grouped by part, with its status and the files that show it. A capability `works` when the code holds it and a test covers it, is `partial` when the code holds part of it, and is `planned` when the documentation names it and no code holds it.

Question: several capabilities of the desktop application are held by the code with no test that covers them. The three statuses do not name that case; they are marked below as "in the code, no test". Which status should they carry?

## The reader

| Capability                                                                     | Status | Files                                                                                                   |
| ------------------------------------------------------------------------------ | ------ | ------------------------------------------------------------------------------------------------------- |
| The whole document stays visible, with the selected role's entries highlighted | works  | `src/lib/views/RitualDocument.svelte`; `tests/browser/reader.spec.ts`, `tests/browser/oculus.spec.ts`   |
| An index of the selected role's speeches and actions, in document order        | works  | `src/lib/reader/contributions.ts`; `tests/reader/contributions.test.ts`                                 |
| An index of the questions and prompts of a question-and-answer document        | works  | `src/lib/reader/contributions.ts`; `tests/reader/contributions.test.ts`, `tests/browser/reader.spec.ts` |
| Previous and next item                                                         | works  | `src/lib/views/Reader.svelte`; `tests/browser/reader.spec.ts`                                           |
| A jump to a section                                                            | works  | `src/lib/views/Reader.svelte`; `tests/browser/reader.spec.ts`                                           |
| The header and the arrow buttons stay in place while the document scrolls      | works  | `src/app.css`; `tests/browser/reader.spec.ts`                                                           |
| The index opened and closed by a button on a narrow window                     | works  | `src/app.css`, `src/lib/views/Reader.svelte`; `tests/browser/reader.spec.ts`                            |
| A source link per entry, with the printed page or the PDF page                 | works  | `src/lib/views/SourceLink.svelte`; `tests/browser/reader.spec.ts`                                       |
| The reading position kept and restored                                         | works  | `src/lib/reader/state.ts`; `tests/reader/state.test.ts`, `tests/browser/oculus.spec.ts`                 |
| Every interface string from `config/text.yml`                                  | works  | `src/lib/data/text.ts`; the Dutch labels the browser tests select by                                    |

## The library and its format

| Capability                                                                       | Status | Files                                                                                                                                                                                                                                                                                          |
| -------------------------------------------------------------------------------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Validation of every document, with messages that name the document and the field | works  | `src/lib/data/validate.ts`; `tests/data/validate.test.ts`                                                                                                                                                                                                                                      |
| Directory documents, with their sections in the manifest's order                 | works  | `src/lib/data/sections.ts`, `src/lib/server/catalogue.ts`, `src/lib/oculus/library.ts`, `src-tauri/src/library.rs`; `tests/data/sections.test.ts`, `tests/server/catalogue.test.ts`, `tests/oculus/library.test.ts`, the Rust test `loads_standalone_and_composed_documents_in_manifest_order` |
| Images inside entries and as answers                                             | works  | `src/lib/data/validate.ts`, `src/lib/data/images.ts`; `tests/data/validate.test.ts`, `tests/server/catalogue.test.ts`, `tests/oculus/library.test.ts`                                                                                                                                          |
| The library sorted by `order`, with a duplicate `id` or `order` refused          | works  | `src/lib/data/order.ts`; `tests/data/order.test.ts`                                                                                                                                                                                                                                            |
| The personal library shown in place of the examples when it holds a document     | works  | `src/lib/server/catalogue.ts`, `src/lib/oculus/library.ts`; `tests/server/catalogue.test.ts`, `tests/oculus/library.test.ts`                                                                                                                                                                   |
| Paths that leave the library refused                                             | works  | `src/lib/data/validate.ts`, `src/lib/server/catalogue.ts`, `src-tauri/src/library.rs`; `tests/data/validate.test.ts`, `tests/oculus/library.test.ts`, the Rust test `rejects_paths_that_leave_the_library`                                                                                     |
| No path below `rituals/` tracked by Git                                          | works  | `.gitignore`; `tests/privacy.test.ts`                                                                                                                                                                                                                                                          |

## The browser build

| Capability                                            | Status | Files                                                                                                                                                                                                                                                              |
| ----------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| The catalogue and the source PDF served by the server | works  | `src/routes/api/catalogue/+server.ts`, `src/routes/api/source/[document]/+server.ts`; `tests/browser/reader.spec.ts`                                                                                                                                               |
| Entry and answer images served by the server          | works  | `src/routes/api/entry-image/[document]/[entry]/[part]/+server.ts`, `src/routes/api/answer-image/[document]/[block]/+server.ts`; `tests/server/catalogue.test.ts` covers the lookups `findEntryImage` and `findAnswerImage`, and no test requests the two endpoints |

## The desktop application

| Capability                                                              | Status               | Files                                                                                                  |
| ----------------------------------------------------------------------- | -------------------- | ------------------------------------------------------------------------------------------------------ |
| The library read from a chosen folder                                   | works                | `src-tauri/src/library.rs`, `src/lib/desktop/library.ts`; the Rust tests in `src-tauri/src/library.rs` |
| The folder picker, the remembered folder and the **Bibliotheek** button | in the code, no test | `src/lib/desktop/library.ts`, `src/routes/+page.svelte`                                                |
| Source PDFs opened in the operating system's default application        | in the code, no test | `src-tauri/src/library.rs` (`open_source`)                                                             |
| A personal build that bundles `rituals/`                                | in the code, no test | `src-tauri/tauri.private.conf.json`, `src-tauri/src/library.rs` (`bundled_library_path`)               |
| Packages for macOS, Windows and Linux, built and signed by the workflow | in the code, no test | `src-tauri/tauri.*.conf.json`, `.github/workflows/desktop-build.yml`                                   |

## The oculus app

| Capability                                                                       | Status | Files                                                                                                                                                                                                    |
| -------------------------------------------------------------------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Officium runs as an oculus root app, reading the library through the file bridge | works  | `src/oculus/`, `src/lib/oculus/`; `tests/oculus/library.test.ts`, `tests/oculus/address.test.ts`, `tests/browser/oculus.spec.ts`; done as entry 1 of `.agents/roadmap.md`, checked by the user in oculus |
| Source PDFs opened in oculus's file viewer at the entry's page                   | works  | `src/oculus/App.svelte`, `src/lib/oculus/library.ts`; `tests/browser/oculus.spec.ts`, `tests/oculus/library.test.ts`                                                                                     |
| The reading position kept per oculus tab                                         | works  | `src/oculus/App.svelte`; `tests/browser/oculus.spec.ts`                                                                                                                                                  |
| The colours follow the oculus theme                                              | works  | `src/oculus/theme.css`; `tests/browser/oculus.spec.ts`                                                                                                                                                   |
| A notice when the bridge refuses to open a source or keep the position           | works  | `src/oculus/App.svelte`; `tests/browser/oculus.spec.ts`                                                                                                                                                  |

## The code

| Capability                                                                                              | Status | Files                        |
| ------------------------------------------------------------------------------------------------------- | ------ | ---------------------------- |
| The layer direction: data imports no reader, view or server code, and the reader no view or server code | works  | `tests/architecture.test.ts` |
| Every handwritten source file below 1,000 lines                                                         | works  | `tests/architecture.test.ts` |

## Planned

| Capability                                                                                                                                                                     | Status  | Files                                                                      |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------- | -------------------------------------------------------------------------- |
| Publishing to a WordPress membership site: an export of the library, a WordPress plugin with the four endpoints for logged-in members, and a static build that reads from them | planned | The README's section "Publishing to a WordPress membership site (planned)" |
````

### Sources
Each row names its files and tests. Where facts came from:
- the test names: the `it(` and `test(` titles read in each test file;
- the Rust test names: `src-tauri/src/library.rs`;
- roadmap entry 1: `.agents/roadmap.md` ("Done", entry 1, per the accepted ruling);
- the planned row: `README.md`;
- the statuses: the definitions in `references/kinds.md`.

---

## 13. `docs/README.md` (new, the documentation index)

````markdown
# Officium's documentation

Each page of Officium's documentation, grouped by kind, with what it holds. The README at the repository root, `README.md`, says what Officium is and how to run it.

## Manual pages

- `docs/user/manual/reader.md`: the reader every build shows: the selectors, the index, moving through a document, the source link, the reading position and the library screen.
- `docs/user/manual/library.md`: the personal and example libraries, how each build finds the documents, what a library refuses and when a change is seen.
- `docs/user/manual/browser.md`: the browser build on its Node server: running it, building it and its errors.
- `docs/user/manual/desktop.md`: the desktop application: choosing the library, the public and personal builds, the packages and the build workflow.
- `docs/user/manual/oculus.md`: the oculus app: building and opening it, its library, the source button, the reading position, the theme and its errors.

## Reference pages

- `docs/user/reference/document-format.md`: every key of a document, with its type, its rule and the validator's message.
- `docs/user/reference/endpoints.md`: the four endpoints of the browser build and the catalogue's JSON.
- `docs/user/reference/npm-scripts.md`: every script of `package.json` and the checks before a change is called verified.
- `docs/user/reference/text-catalogue.md`: every key of `config/text.yml`, with its text and the views that show it.
- `docs/user/reference/environment-variables.md`: `OFFICIUM_DESKTOP` and the signing secrets of the build workflow.

## The feature map

- `docs/user/feature-map/README.md`: each capability of Officium by part, with its status and the files and tests that show it.

## Diagrams

- `docs/user/diagrams/parts.svg`: the three builds, where each reads the library, and the shared data, reader and view code. The README shows it.
- `docs/user/diagrams/document-path.svg`: the path of a document from its YAML file to the reader, and the library screen for a refused document. `docs/user/manual/library.md` shows it.

The diagrams are drawn by `utils/diagrams.py` with the drawing engine `utils/figures.py`.

## The one-page manual

- `docs/user/manual.html`: every page above and the README in one HTML page, one tab per page, readable offline. It is built by `utils/manual.py`.

## Rebuilding the generated files

Run from the repository root, with Python 3.10 or later:

```sh
python3 utils/diagrams.py
python3 utils/manual.py . README.md docs/README.md docs/user/manual/reader.md docs/user/manual/library.md docs/user/manual/browser.md docs/user/manual/desktop.md docs/user/manual/oculus.md docs/user/reference/document-format.md docs/user/reference/endpoints.md docs/user/reference/npm-scripts.md docs/user/reference/text-catalogue.md docs/user/reference/environment-variables.md docs/user/feature-map/README.md
```

`python3 utils/diagrams.py` writes the two diagrams under `docs/user/diagrams/`, and `python3 utils/manual.py` writes `docs/user/manual.html`, with the tabs in the order the command names the pages. Run the second command again after changing any page it names.
````

### Sources
- The pages of this run.
- `templates/figures.py` (needs Python 3.10) and `templates/manual.py` (head comment: tabs in the order given, writes `docs/user/manual.html`, offline).
- `references/kinds.md` ("The documentation index", tab order README first, the index second).
- There is no API tool line, since the API pages are left out.

---

## 14. The diagrams: `utils/diagrams.py` (new) and its `.svg` files

### The draft

````python
"""Draw the diagrams of this repository's documentation as SVG files.

Writes each diagram at its path under docs/user/diagrams/:

- parts.svg: the three builds of Officium, where each reads the library, and the shared data,
  reader and view code they hand the documents to.
- document-path.svg: the path of a document from its YAML file to the reader, and the library
  screen that shows a document refused on the way.

Every box, arrow and label is written in this file; the script reads no other input. The
drawing engine is utils/figures.py beside this file, imported with sys.dont_write_bytecode set
so that no __pycache__ folder is written.

Run, from the repository root: python3 utils/diagrams.py
The script finds the repository root from its own location, so it runs from any directory.

Errors, each printed to stderr as "error: <message>":

- the drawing engine not found, or a name this script imports missing from it: the message
  names the engine's path and the ImportError;
- a diagram the engine refuses, each FigureError its head comment lists: the engine's message.

Exit status: 0 every file written and verified, 1 an error above.
"""

import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
OUT = ROOT / "docs" / "user" / "diagrams"

sys.dont_write_bytecode = True
sys.path.insert(0, str(HERE))
try:
    from figures import (
        Edge,
        FigureError,
        Kind,
        Legend,
        Node,
        Panel,
        Style,
        compose,
        describe,
        graph,
        with_kinds,
        write_figures,
    )
except ImportError as error:
    print(
        f"error: the drawing engine utils/figures.py cannot be imported: {error}",
        file=sys.stderr,
    )
    sys.exit(1)

PART = Style("#ffffff", "#64748b", "", "#0f172a", 1.5, False)
OUTSIDE = Style("#eceff3", "#64748b", "6 4", "#0f172a", 1.5, False)
REFUSAL = Style("#fff1e6", "#b45309", "", "#7c2d12", 2, False)
KINDS = with_kinds(
    {
        "part": Kind(PART, "part of Officium"),
        "outside": Kind(OUTSIDE, "files outside the code"),
        "refusal": Kind(REFUSAL, "what the user sees on a refusal"),
    }
)


def parts() -> tuple[str, str]:
    nodes = (
        Node('library', 'Library folder: rituals/ or examples/rituals/', 'outside'),
        Node('server', 'Browser build: Node server, src/lib/server/', 'part'),
        Node('desktop', 'Desktop build: Tauri, src-tauri/src/library.rs', 'part'),
        Node('oculus', 'Oculus build: file bridge, src/lib/oculus/', 'part'),
        Node('data', 'Data layer: parse and validate, src/lib/data/', 'part'),
        Node('reader', 'Reader functions: src/lib/reader/', 'part'),
        Node('views', 'Views: src/lib/views/Reader.svelte', 'part'),
    )
    edges = (
        Edge('library', 'server'),
        Edge('library', 'desktop'),
        Edge('library', 'oculus'),
        Edge('server', 'data'),
        Edge('desktop', 'data'),
        Edge('oculus', 'data'),
        Edge('data', 'reader', 'documents'),
        Edge('reader', 'views', 'index items'),
    )
    panels = [Panel('', graph(nodes, edges))]
    legend = (
        Legend('outside', 'Dashed grey box: files the user keeps, outside the code'),
        Legend('part', 'Solid box: a part of Officium'),
    )
    title = 'The parts of Officium'
    label = describe(title, panels, KINDS)
    return 'parts.svg', compose('parts.svg', label, panels, legend, '', KINDS)


def document_path() -> tuple[str, str]:
    nodes = (
        Node('find', 'Find each document: a document.yaml folder or a .yaml file', 'part'),
        Node('parse', 'Parse the YAML, src/lib/data/parse.ts', 'part'),
        Node('validate', 'Validate the fields, src/lib/data/validate.ts', 'part'),
        Node('paths', 'Check the images, and in the browser and oculus builds the PDF, lie in the library', 'part'),
        Node('order', 'Check unique id and order, then sort, src/lib/data/order.ts', 'part'),
        Node('show', 'The reader shows the documents', 'part'),
        Node('refused', 'Library screen: the load error', 'refusal'),
    )
    edges = (
        Edge('find', 'parse'),
        Edge('parse', 'validate'),
        Edge('validate', 'paths'),
        Edge('paths', 'order'),
        Edge('order', 'show'),
        Edge('validate', 'refused', 'refused', 'dotted'),
    )
    panels = [Panel('', graph(nodes, edges))]
    legend = (
        Legend('part', 'Solid box: a step of loading the library'),
        Legend('refusal', 'Orange box: what the reader shows when a step refuses'),
        Legend('dotted', 'Dotted arrow: taken only when a step refuses'),
    )
    title = 'The path of a document'
    note = 'Any step that refuses leads to the library screen; the arrow shows validation.'
    label = describe(title, panels, KINDS)
    return 'document-path.svg', compose(
        'document-path.svg', label, panels, legend, note, KINDS
    )


def diagrams() -> tuple[tuple[str, str], ...]:
    return (parts(), document_path())


def main() -> int:
    try:
        lines = write_figures(OUT, diagrams(), ROOT)
    except FigureError as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    for line in lines:
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main())
````

### The run and the drawn files
- The draft was written as `<scratch>/utils/diagrams.py` beside the engine `<scratch>/utils/figures.py`, a copy of `templates/figures.py`.
- `python3 <scratch>/utils/diagrams.py` printed the two lines below and exited 0. No diagram was refused, so none is left out.
  - `wrote docs/user/diagrams/parts.svg (7616 bytes)`
  - `wrote docs/user/diagrams/document-path.svg (8466 bytes)`
- `LC_ALL=C grep -n '[^ -~]'` on the draft prints nothing, so no label needed changing to ASCII.
- The drawn files:
  - /Users/axelfaes/workspace/ordo/.scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/runs/8-officium/handbook.sXQOaE/docs/user/diagrams/parts.svg
  - /Users/axelfaes/workspace/ordo/.scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/runs/8-officium/handbook.sXQOaE/docs/user/diagrams/document-path.svg

### Sources of the graphs
- `parts.svg`:
  - the three builds: `package.json`;
  - the server: `src/lib/server/catalogue.ts`;
  - the desktop: `src-tauri/src/library.rs` with `src/lib/desktop/library.ts`;
  - the oculus build: `src/lib/oculus/library.ts`;
  - all three into `src/lib/data/parse.ts`;
  - data to reader to views: `src/lib/reader/contributions.ts`, `src/lib/views/Reader.svelte`, `tests/architecture.test.ts`.
- `document-path.svg`:
  - the walk: `catalogue.ts` `documentDefinitions`, `library.rs` `collect_documents`, oculus `findDefinitions`;
  - parse: `parse.ts`;
  - validate: `validate.ts`;
  - path checks: `catalogue.ts` `safeAssetPath`, oculus `requireSource` and `imageUrl`, desktop `read_library_file`;
  - order: `order.ts`;
  - the refusal: the library screen of `src/routes/+page.svelte` and `src/oculus/App.svelte`.

---

## 15. The files the run copies
- `utils/figures.py`: new, a copy of `templates/figures.py`. There was no copy in the repository, so there was no first-stop question.
- `utils/manual.py`: new, a copy of `templates/manual.py`, for the same reason.

The run writes `docs/user/manual.html` at Steps 9 with the command in `docs/README.md`. A preview built from these drafts with that command exited 0 and printed `wrote docs/user/manual.html (94546 bytes)`. The preview is at /Users/axelfaes/workspace/ordo/.scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/runs/8-officium/handbook.sXQOaE/preview/manual.html

## 16. The commit of Steps 10

Message:

```
Write Officium's documentation: the README brought up to date, the manual and reference pages, the feature map, the diagrams and manual.html
```

Paths, each named in `git add --` and `git commit --`:
- `README.md`
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
- `docs/user/reference/environment-variables.md`
- `docs/user/feature-map/README.md`
- `docs/user/diagrams/parts.svg`
- `docs/user/diagrams/document-path.svg`
- `docs/user/manual.html`
- `utils/diagrams.py`
- `utils/figures.py`
- `utils/manual.py`

The user's four changes (`.agents/building.md`, `.agents/plan.yaml`, `.gitignore`, `tests/privacy.test.ts`) are not named and stay out of the commit. Nothing is pushed.

## 17. Questions of the drafts

1. `docs/user/manual/browser.md`, "Building it": which command, if any, runs the built adapter-node server? No file gives one.
2. `docs/user/manual/browser.md`, "Its errors": where should a user look for the validator's message when the browser build refuses a document? The page shows only `HTTP <status>`, and no file says where the message appears.
3. `docs/user/feature-map/README.md`: some desktop capabilities are in the code with no test, and the three statuses do not name that case. Which status should they carry?
4. `npm run format:check` will fail on `docs/user/manual.html`, and these drafts give it no fix. Prettier checks HTML files, and the preview build fails that check (`prettier --check docs/user/manual.html` prints "[warn] docs/user/manual.html ... Code style issues found"). `.prettierignore` does not list `docs/`. The Markdown drafts pass, and Prettier does not read `.svg` or `.py`. Steps 9 writes no file the approved drafts do not hold, so the skill cannot fix this on its own. The options:
   - add a draft of `.prettierignore` with the line `docs/user/manual.html`, which would then be written and committed with the rest;
   - leave `manual.html` out of the run;
   - write it as it is and accept a red `npm run format:check`.
5. The source lists above are shown in this stop only and are not written into the pages. Say so if they should be kept in the files.

The run resumes when each draft is approved, corrected or left out, and each question is answered. A corrected draft is shown again.

---

For you, outside the stop. Two findings about the skill:
- **Generated files and the repository's own checks.** The skill has no step for a generated file the repository's checks reject: `manual.html` against `prettier --check .`. It also has no way to propose an edit to a file outside the kinds, such as `.prettierignore`.
- **Claims that reach every build at once.** `references/kinds.md` defines `works` as code plus test and gives no status for code with no test. Rereading the drafts against the code before this stop found several claims that held for one build and not another, all corrected in the drafts above: the desktop's section-path rule, its missing-PDF handling, which messages carry a path, and the narrow-window header. Each claim of a page that covers several builds needs checking against each build's code.

Nothing of the repository was sent to any outside service. Prettier was run from officium's `node_modules` on the scratch copies only.