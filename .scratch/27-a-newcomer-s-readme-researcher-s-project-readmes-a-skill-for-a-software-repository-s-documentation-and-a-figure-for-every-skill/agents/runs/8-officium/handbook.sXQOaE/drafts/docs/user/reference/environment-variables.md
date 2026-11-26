# The environment variables

## Of the build

| Variable           | Type         | Default | Effect                                                                                                                                                                            | Defined in         |
| ------------------ | ------------ | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------ |
| `OFFICIUM_DESKTOP` | `1` or unset | unset   | `1` builds the interface with `@sveltejs/adapter-static` and the fallback page `index.html`, for the desktop application; any other value builds it with `@sveltejs/adapter-node` | `svelte.config.js` |

`npm run build:desktop` sets it with `cross-env OFFICIUM_DESKTOP=1`, and `npm run tauri:build` and `npm run tauri:build:private` run that script first, as `src-tauri/tauri.conf.json` says in `beforeBuildCommand`.

## The signing secrets of the build workflow

`.github/workflows/desktop-build.yml` reads these repository secrets into the environment of each job. Each is optional: a platform whose secrets are absent gets unsigned packages. Signing credentials never belong in the repository.

| Secret                         | Platform | Used for                                                                                   |
| ------------------------------ | -------- | ------------------------------------------------------------------------------------------ |
| `APPLE_CERTIFICATE`            | macOS    | Signing and notarization                                                                   |
| `APPLE_CERTIFICATE_PASSWORD`   | macOS    | Signing and notarization                                                                   |
| `APPLE_SIGNING_IDENTITY`       | macOS    | Signing and notarization                                                                   |
| `APPLE_ID`                     | macOS    | Signing and notarization                                                                   |
| `APPLE_PASSWORD`               | macOS    | Signing and notarization                                                                   |
| `APPLE_TEAM_ID`                | macOS    | Signing and notarization                                                                   |
| `WINDOWS_CERTIFICATE`          | Windows  | Authenticode signing: the certificate as base64, imported into the job's certificate store |
| `WINDOWS_CERTIFICATE_PASSWORD` | Windows  | Authenticode signing: the certificate's password                                           |
| `WINDOWS_TIMESTAMP_URL`        | Windows  | Authenticode signing: the timestamp server; without it nothing is signed                   |
| `LINUX_GPG_PRIVATE_KEY`        | Linux    | AppImage and RPM signing: the key imported with `gpg`                                      |
| `LINUX_GPG_KEY_ID`             | Linux    | AppImage and RPM signing: the key to sign with                                             |
| `LINUX_GPG_PASSPHRASE`         | Linux    | AppImage and RPM signing: the key's passphrase                                             |
