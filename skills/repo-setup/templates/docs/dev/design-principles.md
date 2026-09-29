# Design principles

A design ruling decides what is built. It never exempts the code: every line is written to the standards pages, so that people can read, use and maintain it. A principle without a concrete form is a slogan. The concrete form below is the rule, and a check enforces it where one exists.

- **Single responsibility.** One module owns one subject, and a class keeps one invariant. A file holds one subject. A member reaches another subject's state through that subject's interface.
- **Separation of concerns, high cohesion, low coupling.** The code is layered, and a layer sees only the layers below it: <the layers, top down>. A module reaches only the modules it declares as dependencies. A forwarder, a member whose whole body is a call to the same member elsewhere, is deleted.
- **Open for extension, closed for modification.** A new view, backend, key or command is registered at an extension point, such as a registry or an interface. The code that consumes it is left unchanged.
- **Substitutability.** Every implementation of an interface honours the whole contract. No member is defaulted to a silent no-op. A failure is reported as `docs/dev/coding-standards/common.md` says, never through a flag that means two things.
- **Interface segregation.** Each subject has one small interface. A caller depends on the interface it uses. An interface holds only members that a production caller uses.
- **Dependency inversion.** A module depends on interfaces that the layers below it declare, and names no concrete type of a layer above it. Collaborators are passed in explicitly, as a context parameter, a constructor argument or a function parameter.
- **No globals.** The code has no singleton, no global logger, no `getInstance()` and no mutable state at module or class level. An exception is an ADR the user rules on, and it sets no precedent for another.
- **Do not repeat yourself.** Each rule has one body. A computation written twice is folded to one home, and the other place calls it. A table the build can derive is generated. A rule in prose is stated once and cited from everywhere else. The comment rule, for one, is the change standard's rule "No history in code or comments" (`docs/dev/change-standard.md`).
- **Keep it simple.** The plain shape comes first: a value type over a builder, and a plain function over a generic one. A direct call is preferred over an indirect one where the callee is known. A mechanism is justified from the repository's own goals (<the goals>), never from what another project does.
- **You are not going to need it.** Nothing is added for a caller that does not exist. A member, parameter, option or file whose only user is a test is deleted with its test. A public member exists because a caller calls it, and it is documented where that caller reads. A future need is recorded as a roadmap entry, and no code is written for it.

A principle that a check of the repository enforces names that check: <the checks>. A principle without a check is checked by reading at review.
