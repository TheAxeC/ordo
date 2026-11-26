# The npm scripts

Every script of `package.json`, run as `npm run <script>` from the repository root (`npm test` for `test`). Install Node.js 24 and run `npm install` first.

| Script                | Runs                                                         | What it does                                                                                                                              |
| --------------------- | ------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `dev`                 | `vite dev`                                                   | Starts the browser build's development server on `127.0.0.1`                                                                              |
| `build`               | `vite build`                                                 | Builds the browser build with adapter-node into `build/`                                                                                  |
| `build:desktop`       | `cross-env OFFICIUM_DESKTOP=1 vite build`                    | Builds the interface with adapter-static into `build/`, for the desktop application                                                       |
| `build:oculus`        | `vite build --config vite.oculus.config.ts`                  | Builds the oculus app into `.oculus/apps/officium/`                                                                                       |
| `tauri`               | `tauri`                                                      | The Tauri command line, for any of its commands                                                                                           |
| `tauri:dev`           | `tauri dev`                                                  | Starts `npm run dev` and opens the desktop application on it                                                                              |
| `tauri:build`         | `tauri build`                                                | Builds the public desktop application and its packages, after `npm run build:desktop`                                                     |
| `tauri:build:private` | `tauri build --config src-tauri/tauri.private.conf.json`     | Builds a personal desktop application that bundles `rituals/`                                                                             |
| `preview`             | `vite preview`                                               | Serves the output of `npm run build`                                                                                                      |
| `check`               | `svelte-kit sync && svelte-check --tsconfig ./tsconfig.json` | Generates SvelteKit's types and checks the TypeScript and Svelte files                                                                    |
| `lint`                | `eslint .`                                                   | Lints the repository with `eslint.config.js`                                                                                              |
| `test`                | `vitest run`                                                 | Runs the vitest cases under `tests/`: data, reader, server, oculus, architecture, privacy                                                 |
| `test:browser`        | `playwright test`                                            | Runs Playwright in Chrome: the app on `npm run dev` on 127.0.0.1:8793, and the oculus build served through routes under the oculus policy |
| `format`              | `prettier --write .`                                         | Formats the repository with `.prettierrc`                                                                                                 |
| `format:check`        | `prettier --check .`                                         | Checks that every file Prettier formats is formatted                                                                                      |

## The checks before a change is called verified

`npm test`, `npm run test:browser`, `npm run check`, `npm run lint`, `npm run build`, `npm run format:check` and `npm run build:oculus`, each run from the repository root and each exiting 0. `npm run test:browser` builds the oculus app itself before its oculus cases, and starts its own server on port 8793.

The privacy test in `npm test` requires `/rituals/`, `/AGENTS.md` and `/CLAUDE.md` to stay in `.gitignore`, and fails when Git reports a tracked path below `rituals/`. The two Rust tests in `src-tauri/src/library.rs` are run by none of these scripts.
