# The oculus app

The oculus app runs Officium's reader as an app in the oculus workbench, in an oculus tab, when this folder is a folder of the oculus workspace. It reads the library of this folder through oculus's file bridge, keeps the reading position per oculus tab, opens source PDFs in oculus's file viewer and follows the oculus theme.

## Building and opening it

```sh
npm run build:oculus
```

This builds the app with `vite.oculus.config.ts` into `.oculus/apps/officium/`, which Git, Prettier and ESLint ignore. Oculus finds the app while it runs and lists it in its view catalogue, and the first open asks for your approval. A changed app asks for approval again, unless it was approved with "Keep approved while I edit". Run `npm run build:oculus` again after changing the interface.

Oculus reads the app's name, title and description from its manifest, `src/oculus/public/app.yml`:

```yaml
name: officium
title: Officium
description: Reads the documents of the officium library from this folder.
glyph: page
bridge: 1
```

The app's address has the form `/apps/@<root>/<name>/<key>/`, and the app takes the folder it reads from the `<root>` part. An address of another form is refused with "expected an address of the form /apps/@<root>/<name>/<key>/".

## The library

The app reads `rituals/` of this folder and, when it holds no document, `examples/rituals/`, through the bridge, so the library is the one in this folder and there is no library picker. The documents are found as `docs/user/manual/library.md` says. The images of a document are read through the bridge and put into the page as `data:` addresses.

## The source button

A source button opens the PDF in oculus's file viewer at the PDF page of its entry. It asks the bridge to open the file `<library>/<source.file>` of this folder, such as `examples/sources/demonstration-ritual.pdf`, with the entry's `pdf_page`.

## The reading position and the theme

The reading position (the document, the role and the current item) is kept through the bridge for each oculus tab, so no file is written into this folder. The colours follow the oculus theme: `src/oculus/theme.css` maps the tokens oculus paints on the page onto the palette of `src/app.css`.

## Its errors

- A library that cannot be read shows the library screen with the folder and oculus's refusal, such as `rituals: failed:500`.
- A folder that holds no document shows "Er zijn geen documenten gevonden in rituals/ of examples/rituals/ van deze map."
- A source the bridge does not open shows the notice "Het bronbestand kon niet worden geopend: <refusal>" above the reader, with a **Sluiten** button.
- A reading position the bridge does not keep shows the notice "De leespositie kon niet worden bewaard: <refusal>".

## Where its code lives

- `src/oculus/`: the app's page, `App.svelte`, its manifest and its theme.
- `src/lib/oculus/`: the address, the connection to the bridge module `/apps/-/oculus.js`, and the library read through the bridge.
- `tests/browser/oculus.spec.ts`: the built app served under the oculus policy with a stand-in bridge.
