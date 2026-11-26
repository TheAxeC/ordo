# The desktop application

The desktop application runs Officium as a native application for macOS, Windows and Linux, built with Tauri around the same Svelte interface. It reads a library folder the user chooses on the computer, or a library bundled into a personal build, and opens source PDFs in the operating system's default application.

## What it needs

- Node.js 24 and `npm install`, as for the browser build.
- The current stable Rust toolchain; `src-tauri/Cargo.toml` names Rust 1.77.2 as the oldest version it builds with.
- The platform prerequisites listed by Tauri.

## Running it while working on it

```sh
npm run tauri:dev
```

This starts `npm run dev`, as `src-tauri/tauri.conf.json` says in `beforeDevCommand`, and opens the application window on `http://127.0.0.1:5173`. The window opens at 1280 by 800 pixels and can be made no smaller than 900 by 600.

## Choosing the library

When the application starts it opens, in this order:

1. the folder it remembers from an earlier start;
2. otherwise, the library bundled into a personal build;
3. otherwise, the library screen with the button **Kies documentenmap**, which opens a native folder picker.

A folder chosen with the picker is remembered once it has loaded without an error, in the application's settings file `settings.json` under the key `ritual-library`. The **Bibliotheek** button in the header opens the picker again to choose another folder.

The chosen folder is the library root: the documents are found in it as `docs/user/manual/library.md` says, and every `source.file`, `answer_image` and image `file` path is relative to it. A folder with no document shows "Geen YAML-documenten gevonden.".

A source link opens the document's PDF in the operating system's default application. The application reads only PNG, JPEG and WebP files as images ("only PNG, JPEG, and WebP library assets can be read") and opens only a PDF as a source ("source path must refer to a PDF").

## Building it

Build the public application, without personal documents:

```sh
npm run tauri:build
```

Build a personal application that holds the ignored `rituals/` folder:

```sh
npm run tauri:build:private
```

Both builds first run `npm run build:desktop`, which builds the interface with `@sveltejs/adapter-static` into `build/`, selected by `OFFICIUM_DESKTOP=1`. The personal build adds `src-tauri/tauri.private.conf.json`, which copies `rituals/` into the application's resources as `rituals/`; the application then opens that library when it remembers no folder.

Bundled personal files are ordinary application resources and are not encrypted. Do not distribute a personal build. The public build never includes the local library.

| Platform | Packages                | Configuration                                                                                             |
| -------- | ----------------------- | --------------------------------------------------------------------------------------------------------- |
| macOS    | `.app` and `.dmg`       | `src-tauri/tauri.macos.conf.json`, macOS 10.15 or later                                                   |
| Windows  | NSIS and MSI installers | `src-tauri/tauri.windows.conf.json`, which installs the WebView2 runtime with its downloaded bootstrapper |
| Linux    | AppImage, DEB and RPM   | `src-tauri/tauri.linux.conf.json`                                                                         |

## The build workflow

`.github/workflows/desktop-build.yml` builds the public application on GitHub Actions when it is started by hand or when a tag starting with `v` is pushed. It builds four targets: Apple Silicon and Intel macOS, Windows x86-64 and Linux x86-64 on Ubuntu 22.04. Each job runs `npm ci`, `npm test`, `npm run check` and `npm run lint`, then the Tauri build, and uploads the packages as the workflow artifact `officium-<target>`.

The workflow signs packages when the corresponding repository secrets exist and otherwise produces unsigned artifacts. Apple signing and notarization use `APPLE_CERTIFICATE`, `APPLE_CERTIFICATE_PASSWORD`, `APPLE_SIGNING_IDENTITY`, `APPLE_ID`, `APPLE_PASSWORD`, and `APPLE_TEAM_ID`. Windows Authenticode signing uses `WINDOWS_CERTIFICATE`, `WINDOWS_CERTIFICATE_PASSWORD`, and `WINDOWS_TIMESTAMP_URL`; the Windows signing configuration is written to `src-tauri/tauri.signing.conf.json`, which Git ignores. Linux AppImage and RPM signing use `LINUX_GPG_PRIVATE_KEY`, `LINUX_GPG_KEY_ID`, and `LINUX_GPG_PASSPHRASE`. Signing credentials never belong in the repository. `docs/user/reference/environment-variables.md` lists the secrets.

## Its errors

A library that cannot be loaded shows the library screen with "De bibliotheek kon niet worden geladen" and the message, such as a validator message (`<document path>: <field>: <message>`), "the selected ritual library is not a directory" or "library paths must be relative and may not contain dot segments".

## Where its code lives

- `src/lib/desktop/library.ts`: the interface side, which calls the commands and parses the documents.
- `src-tauri/src/library.rs`: the commands `bundled_library_path`, `load_library`, `read_library_file` and `open_source`, and the two Rust tests of the library walk and the path check.
- `src-tauri/src/lib.rs`: the application, with the dialog, store and opener plugins.
