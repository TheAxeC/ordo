# Coding standards: C++

This page adds to `docs/dev/coding-standards/common.md` and `docs/dev/design-principles.md`, and repeats neither.

## Language and tooling

- The language standard is <C++20>.
- clang-format formats every source file from a `.clang-format` in the repository. It sets a 4-space indent, braces on the same line, left-aligned pointers (`T* p`) and a column limit of <120>.
- clang-tidy runs from a `.clang-tidy` with the groups `bugprone-*`, `modernize-*`, `performance-*` and `readability-*`.
- The `.clang-tidy` turns off `modernize-use-trailing-return-type`, since the code declares return types in front.
- The `.clang-tidy` sets `readability-identifier-naming` to the naming styles under "Naming".

## Errors

- Errors are values. A fallible function returns a result type marked `[[nodiscard]]`, and the caller branches on it.
- When the repository builds with `-fno-exceptions` (<yes or no>), a throwing standard operation stays out of every path that input reaches. Each has a form that does not throw:
  - `find()` with a defined fallback in place of `.at()`.
  - `std::from_chars` in place of `std::stoi`.
  - The `std::filesystem` overloads that take a `std::error_code`.
  - A checked access (`has_value()`, `std::get_if`) in place of `optional::value()` and `std::get<>` by type.
- When the repository builds with `-fno-rtti` (<yes or no>), the code uses no `dynamic_cast` and no `typeid`.

## Construction

- A constructor establishes the class's invariant from its arguments, and the destructor releases what the class owns (RAII).
- Where the repository uses two-phase setup (<yes or no>), a constructor takes nothing and does nothing. Setup that needs a collaborator lives in `initialize`, which takes <the context type>. Teardown that touches a collaborator lives in `shutdown()`.

## Headers and includes

- A public header lives under `include/<lib>/` and ends `.hpp`. Every other header ends `.h`.
- A public header names no third-party type. It hides one behind PIMPL or an opaque handle.
- A public header names no private header of another library.
- Every header opens with `#pragma once`.
- A `.cpp` includes its own header first, then the standard library, then third-party headers, then the project's own.
- A `.cpp` that exports a symbol declares it in a header it includes itself.
- A `.cpp` defines an exported function by its qualified name (`<name>::parseConfig`). A definition that drifts from its declaration then fails at compile time.
- File names are lowercase.

## Naming

- The project has one namespace, <name>. A nested namespace exists only to avoid a real collision.
- A free function carries its module in a compound name (`parseConfig`), so the name stays flat and still says where it belongs.
- Types are `PascalCase`, and functions, methods and variables are `lowerCamelCase`. Members are `m_name`. Namespace- and file-scope `constexpr` constants are `SCREAMING_CASE`. clang-tidy's `readability-identifier-naming` warns on a name in another naming style.
- Enumerations are `enum class`. The underlying type is explicit when the value is serialised, sizes an array or crosses an ABI.
- Where the repository defines fixed-width aliases (<u32 and the like, or none>), declarations and members use them.

## API shape

- A stateful type is constructed by a static factory on the type (`Window::create(config)`). An operation on it is a member (`window.resize(size)`).
- A free function stays in two places: math on a passive value type (`dot(a, b)` on plain aggregates), and a file-local helper with internal linkage.

## `struct` and `class`

- A passive aggregate with public members and no invariant is a `struct`.
- A type that keeps an invariant is a `class` with private state.

## Members and accessors

- Member access carries no `this->`, since the `m_` prefix already marks a member.
- An accessor takes no `get` prefix (`size()`, `width()`). A mutator keeps a verb (`setWidth()`).
- An accessor is `[[nodiscard]]`, and clang-tidy's `modernize-use-nodiscard` warns on one without it.

## Containers and memory

- A sequence crosses a function boundary as `std::span` (`std::span<const T>` when it is read-only), and text as `std::string_view`.
- A map or a set on a hot path is a flat open-addressing table. The node-based `std::map`, `std::unordered_map`, `std::set` and `std::unordered_set` stay off hot paths.
- A value type with many instances on a hot path lives in an index or a pool, with no heap allocation per instance.
- When the repository is allocator-aware (<yes or no>), these rules hold as well:
  - Code under <src> calls no `new`, `delete`, `malloc` or `free`.
  - Code under <src> holds no owning container on the default allocator, `std::string` excepted.
  - Allocation goes through a memory resource passed in explicitly. The process default resource (`std::pmr::get_default_resource()`) is not used.
  - A member's resource is set in the member-initialiser list, since another constructor skips a constructor body.

## Documentation comments

- A public declaration carries a Doxygen `///` brief. `@param` and `@return` appear only where they add what the signature does not say.
- Every other comment is plain `//`, since Doxygen attaches a `///` to the next declaration.
