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
