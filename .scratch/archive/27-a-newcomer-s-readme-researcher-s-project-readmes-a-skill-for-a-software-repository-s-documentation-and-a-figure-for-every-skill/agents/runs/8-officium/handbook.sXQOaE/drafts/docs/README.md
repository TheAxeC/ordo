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
