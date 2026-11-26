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
