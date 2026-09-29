# Coding standards: TypeScript

This page adds to `docs/dev/coding-standards/common.md` and `docs/dev/design-principles.md`, and repeats neither.

## Language and tooling

- `tsconfig.json` sets `"strict": true`.
- ESLint runs from a flat config with `@eslint/js` recommended and typescript-eslint's `strictTypeChecked` and `stylisticTypeChecked`. It has type information through `projectService: true`.
- The config sets `reportUnusedDisableDirectives: 'error'`, which fails an unused disable comment.
- A rule turned off in the config names why beside it.
- A disable comment at a site names its reason.
- Prettier formats every source file from a `.prettierrc` with `tabWidth: 4`, `useTabs: false`, `singleQuote: true`, `trailingComma: "none"` and a `printWidth` of <100>.

## Types

- A shape is declared with `type`. `@typescript-eslint/consistent-type-definitions`, set to `type`, fails an `interface`.
- An `interface` stays only where declaration merging needs one, with a disable comment saying so.
- A value parsed from outside is `unknown` and is narrowed before use. `@typescript-eslint/no-explicit-any` fails an `any`.
- `@typescript-eslint/no-non-null-assertion` fails a non-null assertion `!`.

## Names and unused values

- Types are `PascalCase`, functions and variables `camelCase`, and constants <SCREAMING_CASE or camelCase>.
- A binding the syntax needs and the code does not read is named with a leading `_`. The config sets `@typescript-eslint/no-unused-vars` with `argsIgnorePattern: '^_'` and `varsIgnorePattern: '^_'`. That rule passes such a name and fails every other unused binding.

## Errors and promises

- Every promise is awaited, returned or marked `void`. `@typescript-eslint/no-floating-promises` fails a promise left with no handler. A promise ended by `.catch` passes it and is checked by reading.
- A thrown value is an `Error` or a subclass of it. `@typescript-eslint/only-throw-error` fails a thrown value of another type. A thrown `any` or `unknown` value passes it and is checked by reading.
- A `catch` block handles the failure it catches. Core `no-empty` fails an empty one.

## Modules

- The code is ES modules only. `no-var` fails a `var`.
- A module exports named values. A default export stays only where a named one cannot serve.
- The module graph has no import cycle, and <the import-cycle check> fails one.

## Svelte and SvelteKit

This section holds only in a repository that uses Svelte or SvelteKit.

- eslint-plugin-svelte's `flat/recommended` lints `.svelte` files. `svelte-eslint-parser` parses them, with the TypeScript parser inside script blocks.
- `prettier-plugin-svelte` formats `.svelte` files.
- `svelte/prefer-const` replaces the core `prefer-const`, with `excludedRunes` set to `$derived`, `$props` and `$state`. A rune declaration is a `let` by construction.
- `svelte/comment-directive`, set with `reportUnusedDisableDirectives: true`, fails an unused disable comment in markup.
- An async handler on a control is allowed: `@typescript-eslint/no-misused-promises` runs with `checksVoidReturn: false`.
- A component file stays under <600> lines, and <the size check> fails the verify list at <540>. The limit for other files is in `docs/dev/coding-standards/common.md`.
- A view draws its controls with the repository's shared components. Under <the views folder>, `svelte/no-restricted-html-elements` fails a raw `button`, `input`, `select` or `textarea`.
- A route reaches the server's objects through the request's locals (`event.locals`), never through a module global. The no-globals rule itself is in `docs/dev/design-principles.md`.
