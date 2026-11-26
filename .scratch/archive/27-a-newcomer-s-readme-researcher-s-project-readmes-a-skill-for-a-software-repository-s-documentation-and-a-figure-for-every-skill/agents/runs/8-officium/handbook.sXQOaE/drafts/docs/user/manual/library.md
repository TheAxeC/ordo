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
