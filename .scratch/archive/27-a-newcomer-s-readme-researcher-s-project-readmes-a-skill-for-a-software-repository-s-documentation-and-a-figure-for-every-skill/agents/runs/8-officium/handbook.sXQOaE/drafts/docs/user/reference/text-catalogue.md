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
