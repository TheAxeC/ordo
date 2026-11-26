# The kinds

`handbook` writes a repository's documentation from this fixed set of kinds and no other. Each kind below says what it holds, when a repository has a use for it, and its path. A page of a kind that exists stays at its path, and a new page goes to its kind's new path.

| Kind | New path |
|---|---|
| The README | `README.md` |
| A getting-started guide | `docs/user/guides/getting-started.md` |
| Manual pages, one per part of the product | `docs/user/manual/<part>.md` |
| Reference pages, one per public surface | `docs/user/reference/<surface>.md` |
| A feature map, each capability with its status | `docs/user/feature-map/README.md` |
| Diagrams, each a graph in the diagram file with its `.svg` | `utils/diagrams.py` and `docs/user/diagrams/<name>.svg` |
| A one-page `manual.html`, built by `utils/manual.py` | `docs/user/manual.html` |
| The API pages, from the doc comments by the language's own tool | the tool's configuration file, and the pages under `docs/user/reference/api/` |
| The documentation index | `docs/README.md` |

A `<part>`, `<surface>` or `<name>` is written in lower case, each run of characters other than letters and digits written as one `-`.

## The README

- **What it holds.** The core of the README, in this order, then the repository's own sections placed around it:
  1. `# <name>` and its opening paragraph: what the product is, what it does and who it is for, in two to four sentences.
  2. What it looks like: a diagram of the run, an example of its output, a short code sample from the tests or the examples, or an image the repository holds.
  3. Build and run, or install: the commands, taken from the build files, the manifest and the existing README, with the versions of the tools they need.
  4. Where to look: the documentation index, each folder a newcomer opens first, and where the tests stand.
  5. The license: its name, and the license file.
- **Its own sections.** Each section of the repository's own README is kept, brought up to date.
- **Their place.** Each such section is placed where it reads best around the core, which the draft shows: a "Contributing" section after "Where to look", for example.
- **A section that holds a part of the core.** A section of the repository's own that holds a part of the core, such as a "Building" section that holds the build commands, keeps its heading and stands as that part.
- **When a repository has a use for it.** Every repository: the README is never left out.

## A getting-started guide

- **What it holds.** One path from nothing to a first result a newcomer can see: what to install, the commands to build or install, the first run or the first call, what it prints, and where to go next.
- **Its commands.** Every command in it is one the build files, the scripts or the existing documentation give.
- **When a repository has a use for it.** A product a newcomer installs, builds or calls before its first result, with more steps than the README's build and run holds. It is left out when the README's build and run already takes the newcomer to a first result, as in a small library with one call.

## Manual pages

- **What they hold.** One page per part of the product a user works with, such as a command, a mode, a subsystem or a module: what the part is for, how it is used, its inputs and outputs, and its errors, each with an example.
- **When a repository has a use for them.** A product with two or more parts a user works with, each with more than the README can hold. They are left out for a product of one part.
- **The parts.** The session names the parts from the code (the commands of the entry point, the modules a user imports, the subsystems the build files list) at the first stop.

## Reference pages

- **What they hold.** One page per public surface, each entry with its type, its default and the source file that defines it: the options of a command line, the keys of a configuration file, a file format, the environment variables, the endpoints of a server.
- **When a repository has a use for them.** A product with a public surface a user writes to or reads from beyond the API the doc comments cover. They are left out when the API pages cover every public surface.
- **Not the API pages.** A public API documented in doc comments is the API pages' kind.
- **The link to the API pages.** A reference page of a product with API pages names its public API and links the API pages.

## A feature map

- **What it holds.** Each capability of the product, grouped by part, with its status and the files that show it:
  - `works`: the code holds it and a test covers it;
  - `partial`: the code holds part of it, and the entry names the part that is missing;
  - `planned`: the roadmap, an issue file or the existing documentation names it, and no code holds it.
- **When a repository has a use for it.** A product with ten or more capabilities, or with capabilities whose status a user needs to know before relying on them. It is left out of a small library whose README lists what it does.

## Diagrams

- **What they hold.** Each diagram is a graph in the diagram file `utils/diagrams.py`, drawn by the engine `utils/figures.py` into `docs/user/diagrams/<name>.svg`, in the form of `references/diagrams.md`: the parts of the product and the calls between them, the path of a request or of the data through it, or the order of a run.
- **Where they are shown.** Each diagram is shown in the page that names it, such as the README's "What it looks like" or a manual page.
- **When a repository has a use for them.** A product of three or more parts whose connections the text alone leaves hard to follow. They are left out for a product of one or two parts, and while the user's `python3` is older than 3.10, as `SKILL.md`, Steps 3, says.

## A one-page manual.html

- **What it holds.** One HTML page with a tab per Markdown page the run's kinds hold, the README first and the documentation index second, built by `utils/manual.py`, which `handbook` copies from its `templates/manual.py`, run as `python3 utils/manual.py . <document> ...` from the repository root.
- **Offline.** The page loads nothing from the network: its styles are inline, it holds no script, and an image at an `http` or `https` address, or at one that starts with `//`, is written as a link to that address, with its alt text as the link's text.
- **When a repository has a use for it.** A run that writes two or more Markdown pages, so that a reader can read the documentation offline in one file. It is left out of a run that writes the README alone, and while the user's `python3` is older than 3.9.

## The API pages

- **What they hold.** The pages the language's own tool builds from the doc comments of the public API, into `docs/user/reference/api/`.
- **What the skill writes.** The tool's configuration, and the build command in the documentation index.
- **Build output.** The pages themselves are build output, which the skill neither drafts nor commits.
- **When a repository has a use for them.** A library, or a product with a public API, whose public declarations carry doc comments. They are left out when the public declarations carry none, and when the tool is not installed, as `SKILL.md`, Steps 3, says.
- **The tools.** The session picks the tool the repository already configures, and otherwise the language's own, such as:

  | Language | Tool | Its configuration and output folder |
  |---|---|---|
  | C or C++ | Doxygen | `Doxyfile` at the root with `OUTPUT_DIRECTORY = docs/user/reference/api` |
  | TypeScript | TypeDoc | `typedoc.json` at the root with `"out": "docs/user/reference/api"` |
  | Python | pdoc | no file: the command `pdoc -o docs/user/reference/api <package>` |
  | Rust | rustdoc, through `cargo doc` | no file: the command `cargo doc --no-deps`, whose pages are copied from `target/doc/` to `docs/user/reference/api/` |

## The documentation index

- **What it holds.** Each page of the documentation, grouped by kind, with its path and one line on what it holds, and the commands that rebuild the generated files: `python3 utils/diagrams.py`, `python3 utils/manual.py . <document> ...` with the run's documents in the order of the tabs, and the API tool's build command.
- **When a repository has a use for it.** A run that writes any page beside the README. It is left out of a run that writes the README alone.
