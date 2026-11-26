# Step 8: /handbook on officium, stop 1, The kinds

Agent ab642d67e3b49ae76, claude-opus-5-5, 153115 tokens, 15 tool uses, 2 min 16 s.

The `/handbook` run on /Users/axelfaes/workspace/officium is at its first stop, "The kinds". Nothing is drafted, nothing is written in officium, and no scratch folder is made yet. The skill did not refuse. Steps 1 to 4 ran as written: `git rev-parse --show-toplevel` printed /Users/axelfaes/workspace/officium with exit 0, and `git ls-files` lists 111 tracked files, among them TypeScript, Svelte and Rust sources.

The stop as the skill says to show it:

## The kinds

Officium is a Svelte and TypeScript reader with a Rust (Tauri) desktop shell. It has three builds that share one data, reader and view layer: the browser build served by Node (`npm run dev`, `npm run build`), the Tauri desktop build (`npm run tauri:*`) and the oculus app (`npm run build:oculus`). They read one YAML document format.

### Kinds the repository gets

1. **The README**: `README.md` (exists). Its own sections are kept and brought up to date: Run, Desktop application, Run in oculus, Publishing to a WordPress membership site (planned), Add personal documents, YAML structure, Verify, License. The core parts it lacks are added: "What it looks like" (the existing screenshot `assets/officium-reader.png` and the parts diagram) and "Where to look".
2. **Manual pages, one per part of the product**. The parts come from the commands of `package.json`, from `src/lib/` and from `src-tauri/`:
   - `docs/user/manual/reader.md` (new): the reading interface shared by every build, from `src/lib/views/` and `src/lib/reader/`. It covers the document and role selectors, the contributions or questions index, the previous and next step controls, the section jump, the source links and the saved reading position.
   - `docs/user/manual/library.md` (new): personal and example documents, the rule for which of them is shown, standalone and directory documents, and the path checks. Sources are `src/lib/server/catalogue.ts`, `src/lib/oculus/library.ts` and `src-tauri/src/library.rs`.
   - `docs/user/manual/browser.md` (new): the Node build, `npm run dev` and `npm run build` with adapter-node.
   - `docs/user/manual/desktop.md` (new): the Tauri app. It covers the library picker, the remembered directory, the `Bibliotheek` button, the public and private builds, the packages for each platform and CI signing.
   - `docs/user/manual/oculus.md` (new): the oculus root app. It covers the build, approval, the file bridge, the source viewer, the state kept per tab and the theme.
3. **Reference pages, one per public surface**:
   - `docs/user/reference/document-format.md` (new): the YAML document format, from `src/lib/data/validate.ts` and `src/lib/data/sections.ts`.
   - `docs/user/reference/endpoints.md` (new): the four GET endpoints of the browser build under `src/routes/api/`: catalogue, source, answer-image and entry-image.
   - `docs/user/reference/npm-scripts.md` (new): the 15 scripts of `package.json`.
   - `docs/user/reference/text-catalogue.md` (new): the 34 keys of `config/text.yml` that `src/lib/data/text.ts` requires.
   - `docs/user/reference/environment-variables.md` (new): `OFFICIUM_DESKTOP` (from `svelte.config.js`, `package.json`) and the 12 signing secrets of `.github/workflows/desktop-build.yml`.
4. **A feature map**: `docs/user/feature-map/README.md` (new). The product has more than ten capabilities, and one of them is planned and not built: the WordPress membership publishing of the README.
5. **Diagrams**: `utils/diagrams.py` (new) and the engine `utils/figures.py` (new copy of `templates/figures.py`), with:
   - `docs/user/diagrams/parts.svg`: the three builds, the shared data, reader and view layers, and where each build reads the library.
   - `docs/user/diagrams/document-path.svg`: the path of a document from YAML through parse, validate and order to the Reader.
6. **A one-page manual.html**: `docs/user/manual.html` (new), built by `utils/manual.py` (new copy of `templates/manual.py`).
7. **The documentation index**: `docs/README.md` (new).

### Kinds left out

- **A getting-started guide**: the README's "Run" already takes a newcomer to a first result. Its steps are install Node.js 24, `npm install`, `npm run dev`, then open the address, and the reader shows the fictional examples.
- **The API pages**: the public declarations carry no doc comments. `grep -rn '/\*\*\|///\|//!' src src-tauri/src` printed nothing. Because the kind is left out, no API tool was checked with `command -v`.

### Questions of Steps 3

- `python3 --version` printed `Python 3.13.4`. That is 3.10 or later, so there is no Python question.
- `utils/figures.py` and `utils/manual.py` do not exist (`ls utils` reports "No such file or directory"), so there is no copy to compare and no keep-or-replace question.
- No API tool question, since that kind is left out.

### Facts found while reading that bear on these kinds (not questions the skill's text lists)

- **`/docs/` is ignored by git.** `.gitignore` line 26 is `/docs/`, and `git check-ignore -v docs/README.md` confirms it. `tests/privacy.test.ts` line 9 requires `/docs/` to stay in `.gitignore`. Steps 10 leaves an ignored path out of the commit and names it in the last message. So, as the kinds stand, every manual page, reference page, the feature map, the index, both `.svg` files and `manual.html` would be written but not committed. The commit would hold only `README.md`, `utils/diagrams.py`, `utils/figures.py` and `utils/manual.py`. The README's "Where to look" and the parts diagram would then point at files a clone does not have.
- **The README's "YAML structure" section** is kept, because `references/kinds.md` keeps every section of the README. The document format would therefore appear both there and in `docs/user/reference/document-format.md`.
- **Existing Markdown pages that belong to no kind**: `.agents/building.md`, `.agents/change-standard.md`, `.agents/roadmap.md` and the six ledger files under `.scratch/archive/1-run-officium-as-an-oculus-root-app/`. Steps 2 says to put each of their facts into the page of the kind that holds it. My reading, which you should confirm:
  - The command table of `building.md` and its privacy-test sentence go into the README's "Verify" and into `reference/npm-scripts.md`.
  - The roadmap's done entry 1 (the oculus app) goes into the feature map as `works`.
  - The "Officium rules" section of `change-standard.md` goes into the manual and the README "Where to look". That covers the layer direction, strings in `config/text.yml`, colours in `src/app.css` and `src/oculus/theme.css`, the 1,000-line limit and the rule that real data lives only under `rituals/`.
  - The agent-process rules of `change-standard.md` and the plan ledger's history are facts no kind holds, so they stay only in their own pages. Those pages are not changed.

Nothing is drafted until you confirm the kinds or change them, and answer the points above. The one I most need is the `/docs/` ignore rule. The options are:
- keep the new paths, so the docs pages are written but stay uncommitted;
- move the documentation out of `docs/`, which `references/kinds.md` does not provide for;
- change `.gitignore`, which `tests/privacy.test.ts` forbids and which is outside this skill.

---

For you, outside the stop: run folder /Users/axelfaes/workspace/ordo/.scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/runs/8-officium/ is not created yet. Steps 7 will make its scratch folder there with `mktemp -d`. Two findings about the skill:
1. `references/kinds.md` puts every page but the README under `docs/`, and the skill has no step for a repository that ignores `docs/`. In officium that would leave most of the run uncommitted.
2. The instruction in Steps 2 to put every fact of a page that belongs to no kind into a kind's page does not say what to do with facts no kind holds, such as agent-process rules and plan ledgers.

Nothing was sent to any outside service, and nothing was written in officium.
