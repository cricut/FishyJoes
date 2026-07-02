# 0017. Python Typing Gates Are Owned Per Package

## Status

Proposed / In progress

## Context

The Python typing gates (mypy.stubtest, mypy --strict, pyright) originated in
the TestAPI integration suite as a single combined run: `mypy.stubtest
fishyjoes_runtime testapi` against one allowlist. That coupling has two costs:

- The binding's allowlist carries runtime residue (`fishyjoes_runtime.iota..*`,
  `fishyjoes_runtime.attributed_string..*` — classes built inside
  `create_runtime()` / `setup_attributed_string_family()` closures, which have
  no static definition for stubtest to compare). Every downstream binding that
  adopted the gate would have to repeat those runtime entries verbatim.
- Downstream generated packages (the CriLibraries) ship no typing gates at all,
  so typing regressions in their generated bindings surface only in TestAPI —
  and only for the type shapes TestAPI happens to exercise.

The runtime package itself has no test suite; its typing was only ever checked
as a side effect of the binding gate.

## Options Considered

- Keep the combined gate and copy the runtime allowlist entries into each
  downstream package's allowlist. Repeats residue everywhere, and a runtime
  typing break reports against whichever binding runs first. Rejected.
- Give python-runtime a standalone test suite plus its own CI wiring. Most
  self-contained, but adds a parallel test harness for a two-entry allowlist
  and new workflow surface. Rejected for now.
- Split ownership: the runtime is stubtested once, in the FishyJoes repository
  (TestAPI suite hosts the run; the allowlist lives with the runtime at
  `python-runtime/stubtest_allowlist.txt`), and every generated package
  gates only itself, with the generator emitting the gate test and the
  package's own allowlist residue into the generated output. Chosen.

## Decision

Typing gates are owned by the package they check:

- `fishyjoes_runtime` is gated once, in this repository —
  `test_runtime_typing.py` in the TestAPI suite runs `mypy.stubtest
  fishyjoes_runtime` with the runtime-owned allowlist
  (`python-runtime/stubtest_allowlist.txt`). The irreducible closure
  residue lives there and nowhere else.
- A generated binding is gated by generated tests: the generator emits the
  typing-gate test and the package's own allowlist residue into
  `bindings/python/generated/tests/`, computed from the translated model (a
  `None` enum case, metaclass-descriptor statics) — never observed from a
  specific downstream library's names. Generated tests run everywhere the
  hand-written `tests/` directory runs: the Python test phase discovers both,
  and the installed-wheel verification steps (this repository's workflow and
  the generated downstream workflow) must run them too — a gate that runs only
  against the source tree never checks the artifact that ships.
- Allowlists run strict (no `--ignore-unused-allowlist`): an unused entry is a
  signal the gate or the toolchain changed, and must be re-justified or
  removed, not silently tolerated. Strictness makes the checker version part
  of the gate contract, so `mypy` and `pyright` are pinned in
  `requirements-dev.txt` and moved deliberately.
- A generated package may supplement (never replace) its generated allowlist
  with a hand-written `tests/stubtest_allowlist.local.txt`, merged at run
  time. This is the escape hatch for toolchain-drift false positives:
  without it, a checker release that changes stubtest behavior would turn
  every downstream repository red simultaneously with no remedy short of a
  FishyJoes generator release.

The typed interface for the closure-built runtime classes remains each
binding's generated `_native.pyi` (`SwiftRange`, `Runtime_AttributedString*`),
which the per-package gate validates. Giving those classes a visible typed
interface in the runtime package itself (`iota.pyi`,
`attributed_string.pyi`) — so bindings import one canonical stub instead of
each declaring their own — is the documented follow-up, not part of this
decision.

## Consequences

- Downstream packages get typing regression coverage on every regeneration,
  with an allowlist that mentions only their own names.
- A runtime typing break reports exactly once, against the runtime.
- stubtest silently skips any member whose runtime value has a closure-local
  class (`create_runtime.<locals>.SwiftRange` and friends):
  `get_mypy_type_of_runtime_value` cannot resolve such a class to a static
  definition, so no comparison happens and no error is reported — identically
  on every mypy tested (1.20/2.0/2.1). Allowlist entries for such members are
  suppressions of nothing and are removed rather than carried; stub ↔ runtime
  agreement for closure-built value types is untestable by stubtest by
  construction. The stub text is still asserted by the precise-typing tests.
- Entry used-ness has been observed to flip between environments one week
  apart without a relevant source change; with strict unused handling that
  flip is loud. The pinned checker toolchain plus the supplemental local
  allowlist bound the blast radius.
- The CI matrix currently tests Python 3.11 while development venvs run
  newer interpreters; a Python-version-sensitive allowlist entry would make
  the strict gate red on one side only. No such entry exists today (the last
  one, dataclass `__replace__`, was fixed at source by making the stubs real
  dataclasses). If one appears, prefer fixing at source; failing that, the
  version-conditional entry goes in the supplemental local allowlist with a
  comment, not behind `--ignore-unused-allowlist`.
