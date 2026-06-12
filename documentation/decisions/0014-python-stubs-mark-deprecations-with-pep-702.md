# 0014. Python Stubs Mark Deprecations With PEP 702

## Status

Accepted

## Context

Generated Python wrappers already warn at runtime when deprecated API is used
(`warnings.warn(..., DeprecationWarning, stacklevel=2)` via
`_native.warn_deprecated`). That surfaces deprecations during execution, but
editors show nothing while the code is being written: a user only discovers
the deprecation after running.

PEP 702 defines `@deprecated`, understood by pyright/Pylance (strikethrough
rendering plus diagnostics) and mypy. `typing_extensions` provides it for the
supported Python 3.11 floor. Stub files are never executed, so a decorator
emitted only into `.pyi` adds no runtime dependency.

## Options Considered

- Runtime warnings only (status quo).
  Editors stay silent; users find deprecations at run time.
- Apply `@deprecated` in generated `.py` wrappers.
  Makes `typing_extensions` a runtime dependency of every generated package
  and changes runtime behavior (the decorator wraps the callable); the
  existing `warn_deprecated` calls already cover the runtime side.
- Emit `@deprecated` only into `.pyi` stubs.
  Editor-visible deprecations with zero runtime impact; complements the
  existing runtime warning rather than replacing it.

## Decision

Generated `.pyi` stubs decorate deprecated function-shaped members (methods,
method-shaped fields, property getters) with PEP 702
`@deprecated("<message>")`, importing it from `typing_extensions` only in
stubs that need it. Runtime deprecation behavior is unchanged: generated
`.py` wrappers keep `warnings.warn` on call/access.

Deprecated static properties cannot carry a decorator as plain `ClassVar`
attributes, so their stubs model them as deprecated properties on a
synthesized metaclass (`class _XMeta(type)` with `@property @deprecated`
getters, mirroring the metaclass the runtime wrappers already use for
settable statics). pyright and mypy both report class-level attribute access
through metaclass properties as deprecated, and the attribute's revealed
type is unchanged. Simple enums are exempt (their stub already rides
`enum.EnumMeta`); a deprecated static on a simple enum keeps `ClassVar` and
runtime warnings only.

## Tradeoffs

- Two deprecation surfaces (runtime warning + stub marker) generated from the
  same metadata; they cannot drift because both come from the translated
  deprecation message.
- `typing_extensions` becomes a type-checking-time expectation for stub
  consumers; checkers bundle or resolve it without a runtime install.
- Attribute-shaped deprecations remain editor-invisible until PEP 702 (or
  checkers) grow attribute support.

## Consequences

- Deprecated generated API renders struck-through with a diagnostic in
  pyright/Pylance-based editors before any code runs.
- The deprecation message users see in the editor is exactly the Swift
  `@available(*, deprecated, message:)` text.
