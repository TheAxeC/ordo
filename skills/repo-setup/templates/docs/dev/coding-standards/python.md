# Coding standards: Python

This page adds to `docs/dev/coding-standards/common.md` and `docs/dev/design-principles.md`, and repeats neither.

## Language and tooling

- The code runs on Python <3.10> or newer, set as `requires-python` in `pyproject.toml`.
- ruff formats and lints every module from its section of `pyproject.toml`, with a line length of <100>.
- ruff's starting selection is the rule groups `E`, `F`, `W`, `I`, `B`, `UP`, `SIM`, `N`, `PTH`, `ANN` and `BLE`, and the rule `S602`.
- pyright type-checks every module with `typeCheckingMode = "standard"`.

## Naming

- Modules and functions are `snake_case`, classes `PascalCase` and module constants `SCREAMING_CASE`.
- A name private to its module starts with `_`.
- ruff's `N802`, `N801` and `N999` fail a function name, a class name or a package's module name in another naming style.
- A top-level module name, a module constant and the `_` prefix are checked by reading.

## Typing

- Every function and method annotates each parameter and its return type. ruff's `ANN` rules fail a missing annotation.
- Annotations use the built-in generics (`list[str]`, `dict[str, int]`) and `X | None`. ruff's `UP006` and `UP045` fail `List[str]` and `Optional[X]`.
- `Any` appears only on a value parsed from outside, and the code narrows it before use. ruff's `ANN401` fails it in a signature.

## Errors

- A failure raises a specific exception class: a built-in one, or the module's own subclass of `Exception`.
- A handler names the exception class it catches. ruff's `E722` fails a bare `except:`.
- An `except Exception` handler re-raises the failure, or logs it with `log.exception` or `exc_info=True`. ruff's `BLE001` fails any other `except Exception`.
- `contextlib.suppress(Exception)` swallows a failure the same way, and is checked by reading.
- A command-line script catches the exception classes it expects, prints the error to stderr and exits non-zero.

## Module layout

- Module-level code only defines: imports, constants, functions and classes.
- Work starts under `if __name__ == "__main__":` or in an entry point.
- Imports sit at the top of the module, grouped standard library, third-party, then first-party. ruff's `E402` fails a late import, and `I001` fails an unsorted import block.

## Files and processes

- A path is a `pathlib.Path`. ruff's `PTH` rules fail an `os.path` call or a built-in `open()` where a `Path` method serves.
- A file is opened with an explicit `encoding="utf-8"`.
- A subprocess runs with a list of arguments. ruff's `S602` fails `shell=True`.
