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
