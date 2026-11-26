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
