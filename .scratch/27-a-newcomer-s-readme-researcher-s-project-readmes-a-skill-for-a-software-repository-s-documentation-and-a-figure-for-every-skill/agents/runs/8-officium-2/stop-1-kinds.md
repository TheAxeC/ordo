# Step 8 rerun: /handbook on officium on v11.2.1, stop 1, The kinds

Agent a026bf3a9b73b7a04, claude-opus-5-5.

**Stop: The kinds**

Repository root: `/Users/axelfaes/workspace/officium`, from `git rev-parse --show-toplevel`. `git ls-files` lists 111 tracked files. The code is TypeScript and Svelte (SvelteKit 2, Svelte 5) under `src/`, plus Rust under `src-tauri/src/`. Nothing has been drafted or written, and no command read from the repository's files has run.

**Kinds the repository gets**

1. **The README**: `README.md`, exists.
   - Its own sections are kept and brought up to date: Run, Desktop application, Run in oculus, Publishing to a WordPress membership site (planned), Add personal documents, YAML structure, Verify, License.
   - "Run" stands as the build and run part of the core, and "License" as the license part.
   - New: "What it looks like" (the existing image `assets/officium-reader.png` and the diagram `architecture.svg`) and "Where to look".

2. **Manual pages**, one per part a user works with. All are new.
   - `docs/user/manual/reader.md`: the reading interface all three builds share. It covers the document and role selectors, the contribution and question index, previous and next, the section jump, source links, the mobile outline and the kept reading position (`src/lib/views/`, `src/lib/reader/`).
   - `docs/user/manual/library.md`: the document library. It covers `rituals/` against `examples/rituals/`, standalone and directory documents, how each build finds the library, and the validator's errors (`src/lib/data/`, `src/lib/server/catalogue.ts`).
   - `docs/user/manual/browser.md`: the browser build. It covers `npm run dev`, then `npm run build` and `node build`, the endpoints it serves, and where a refused document's error is shown (`src/routes/`, `svelte.config.js`).
   - `docs/user/manual/desktop.md`: the Tauri desktop app. It covers the directory picker and the remembered library, the bundled private library, the public and private builds, the packages per platform, and signing in CI (`src-tauri/`, `src/lib/desktop/library.ts`, `.github/workflows/desktop-build.yml`).
   - `docs/user/manual/oculus.md`: the oculus root app. It covers `npm run build:oculus`, approval, the file bridge, the source viewer, state per tab, the theme and `src/oculus/public/app.yml` (`src/oculus/`, `src/lib/oculus/`).

3. **Reference pages**, one per public surface. All are new.
   - `docs/user/reference/document-format.md`: the YAML document format, each key with its type, whether it is required, and its source in `src/lib/data/validate.ts` and `src/lib/data/sections.ts`.
   - `docs/user/reference/endpoints.md`: `GET /api/catalogue`, `/api/source/[document]`, `/api/answer-image/[document]/[block]` and `/api/entry-image/[document]/[entry]/[part]` (`src/routes/api/`).
   - `docs/user/reference/npm-scripts.md`: the command line, meaning the scripts of `package.json`.
   - `docs/user/reference/text-catalogue.md`: the keys of `config/text.yml` (`src/lib/data/text.ts`).
   - `docs/user/reference/environment.md`: the environment variable `OFFICIUM_DESKTOP` (`svelte.config.js`, `package.json`) and the twelve signing secrets the workflow reads (`.github/workflows/desktop-build.yml`).

4. **A feature map**: `docs/user/feature-map/README.md`, new. The product has more than ten capabilities, grouped by part, each with a status of works, untested, partial or planned, and its files and test. The WordPress publishing section of the README is `planned`.

5. **Diagrams**: `utils/diagrams.py`, new, drawn by a new `utils/figures.py` into `docs/user/diagrams/`. Three diagrams are planned:
   - `architecture.svg`: the three builds (browser server, desktop, oculus) over the shared data, reader and view layers.
   - `document-loading.svg`: the path of a document from YAML through parse, validate, the collection check and ordering to the Reader.
   - `desktop-library-choice.svg`: the order in which the desktop app picks its library: the remembered folder, then the bundled `rituals/`, then the picker.

   The product has three builds and three layers, and the text alone leaves their connections hard to follow.

6. **A one-page manual.html**: `docs/user/manual.html`, new, built by a new `utils/manual.py`. The run writes more than two Markdown pages.

7. **The documentation index**: `docs/README.md`, new.

**Kinds left out**

- **A getting-started guide.** The README's "Run" section already takes a newcomer to a first result in two commands: `npm install` and `npm run dev`, which show the fictional examples.
- **The API pages.** The public declarations carry no doc comments. `grep -rn -e '/\*\*' -e '^\s*///' src src-tauri/src | wc -l` printed 0. Officium is an application with no library API.

**Questions from Steps 3**

None.
- `python3 --version` printed `Python 3.13.4`, which is 3.10 or later, so the diagrams and `manual.html` can be built.
- `ls docs utils` printed `No such file or directory` for both. `utils/figures.py` and `utils/manual.py` will therefore be new copies of the templates, and there is no copy to compare.
- No API tool is needed, since the API pages are left out.

**Existing pages that belong to no kind**

- `.agents/building.md`, `.agents/change-standard.md` and `.agents/roadmap.md` are the plan skills' pages, named in `.agents/plan.yaml`. They stay at their paths, unchanged. Their facts are carried as follows:
  - building.md: its table of what each command checks goes into README "Verify" and `docs/user/reference/npm-scripts.md`. Its privacy-test sentence is already in README "Verify".
  - change-standard.md, "Officium rules":
    - The layer direction (data, then reader, then views) goes into the manual's architecture text and `architecture.svg`.
    - "User-facing strings live in `config/text.yml`" goes into `docs/user/reference/text-catalogue.md`.
    - "Real ritual data lives only under `rituals/`" is already in README "Add personal documents".
    - Its rules on how a change is made are rules for the plan's agents, not product documentation, and stay on that page alone.
  - roadmap.md: the one done entry, the oculus root app, goes into the feature map. No entry is open.
- `.scratch/archive/1-run-officium-as-an-oculus-root-app/` is a closed plan's ledger. Its user-facing facts already stand in README "Run in oculus".
- `CLAUDE.md` is git-ignored and is the owner's local file. It is not read as documentation.

**Answers known already, and where each goes**

1. **`node build`**: in `docs/user/manual/browser.md`, section "Run the built server": `npm run build` with adapter-node unless `OFFICIUM_DESKTOP` is set, then `node build`, which runs `build/index.js`. Also in the `build` row of `docs/user/reference/npm-scripts.md`.
2. **A refused document in the browser build**: in the "Errors" section of `docs/user/manual/library.md` and `docs/user/manual/browser.md`. The validator's message, with the document's path and the field, is logged in the terminal of `npm run dev` or `node build`, and the page shows `HTTP <status>` (`src/lib/server/catalogue.ts`, `src/routes/+page.svelte` line 41; the repository has no `hooks.server.ts`).
3. **A capability held in full with no test**: gets `untested` in the feature map. For example, the desktop app's library loading in `src/lib/desktop/library.ts`, and the `answer-image` and `entry-image` endpoints, which no test requests.
4. **A generated file that `prettier --check .` rejects**: answered as Steps 8 says, with a drafted line in `.prettierignore`.
5. **Source files**: the pages carry no list of source files. Each claim's source file is shown in the drafts only.
6. **`/docs/`**: no longer ignored in the working tree (the `git diff .gitignore` removes `/docs/`), so the pages stand at the paths of `references/kinds.md` given above.

**Format and lint commands**

Kept:
- `npm run format:check`, which runs `prettier --check .` (`package.json`, README "Verify", `.agents/building.md`). Its tool is installed: `test -x node_modules/.bin/prettier` succeeded. It checks Markdown and HTML too, so it reads the drafted pages and `manual.html`.
- `npm run lint`, which runs `eslint .` (`package.json`, the CI workflow, README "Verify", `.agents/building.md`). Its tool is installed: `test -x node_modules/.bin/eslint` succeeded. It writes no cache without `--cache`.

Left out:
- `npm run check`: a type check, and it runs `svelte-kit sync` first, which writes `.svelte-kit/`.
- `npm test` and `npm run test:browser`: test runs. The Playwright run also starts a dev server and builds the oculus app.
- `npm run build`, `npm run build:desktop`, `npm run build:oculus` and `npm run tauri:build`: builds.
- `npm run format`, which runs `prettier --write .`: it writes into the repository.
- Rust formatting (`cargo fmt --check`): none of the files searched names it, so it is not one of the repository's commands.

Files searched for the commands: `package.json`, `.github/workflows/desktop-build.yml`, `README.md`, `.agents/building.md`, `.agents/change-standard.md`, `src-tauri/Cargo.toml`, `eslint.config.js`, `.prettierrc`, `.prettierignore`.

**A constraint the drafts follow**

`tests/architecture.test.ts` fails on any `.md`, `.ts`, `.js`, `.yml` or `.svelte` file of 1,000 lines or more outside its list of generated folders, and `docs/` and `utils/` are not in that list. Each drafted Markdown page will be kept below 1,000 lines. `.py` and `.html` files are not counted.

Confirm the kinds, or change them.
