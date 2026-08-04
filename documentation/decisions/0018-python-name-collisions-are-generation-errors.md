# 18. Python name collisions are generation errors

Date: 2026-07-08

## Status

Accepted

## Context

C# member/nested-type name conflicts are a generation error resolved by an
explicit `cSharp:` export name (PR #357 review: a generated name must not
change because a sibling was added — silent auto-renaming produces unstable
interfaces). Python had two silent counterparts:

1. **Sibling member collisions** (e.g. Swift `URL` and `Url` both snake-casing
   to `url`) were resolved by deterministically appending `_2`, `_3`, … — the
   same instability the C# rule forbids: adding a member can rename its
   neighbor.
2. **Class-scope annotation shadowing**: an associated-enum case type is bound
   as a class attribute named after the case (`Shade: ClassVar[type[...]]`).
   When an imported type shares that name, annotations inside the class body
   resolve to the attribute instead of the type, producing a stub that fails
   `mypy` (`Variable "...Shade" is not valid as a type`). C# never has this
   problem because its emitter fully qualifies every type reference.

## Decision

- **Sibling member collisions are fatal.** `resolvePythonMemberNames` dies
  when two class members (stored fields, enum cases, fields, methods) resolve
  to the same Python name. The remedy is a new `python:` export attribute —
  `/// <!-- FishyJoes.export(Url, python: title_url) -->` — whose value is a
  verbatim Python identifier (validated: not a keyword, no leading
  underscore). Per-name keyword/builtin sanitization (`class` → `class_`)
  remains, because it does not depend on siblings.
- **Method parameters and enum-case associated values keep the deterministic
  `_2` suffixing.** They have no annotation surface to rename them through, so
  a fatal would leave the library developer without a remedy.
- **Shadowed imported types are aliased, not renamed.** The stub emitter
  detects imported type names shadowed by class-body attributes and references
  them through a module-level private alias (`_Shade = Shade`), mirroring the
  existing shadowed-builtins treatment (`builtins.bytes`). Generated member
  names never start with an underscore, so the alias cannot itself be
  shadowed; stubtest ignores private module attributes, so the alias does not
  need a runtime counterpart. No public name changes, matching the C#
  fully-qualified-reference behavior.

## Consequences

- Libraries whose Swift API relied on the `_2` suffixing fail to generate
  until the colliding member gets an explicit `python:` name — an intentional
  one-time cost, same as the C# hard-error.
- `TestAPI.PythonNamingCollisions` exercises the explicit rename
  (`Url` → `title_url`); `TestAPI.ShadowBox`/`Shade` exercises the shadowing
  alias, and the per-package typing gates (ADR 0017) verify the emitted stub
  under mypy/stubtest/pyright.
