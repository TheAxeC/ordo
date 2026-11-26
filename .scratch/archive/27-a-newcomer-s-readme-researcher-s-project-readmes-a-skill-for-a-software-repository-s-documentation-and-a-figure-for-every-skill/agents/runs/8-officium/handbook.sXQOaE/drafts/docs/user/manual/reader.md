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
