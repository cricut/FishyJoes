# Architecture Decisions

This directory contains Markdown Architectural Decision Records for FishyJoes.
Use a decision record when a plan depends on an architectural choice that future
work should preserve.

## When to write an ADR

Write one when:
- A choice constrains how future contributors are allowed to extend the project.
- The "obvious" path was rejected and someone will eventually try to take it again.
- A deliberate piece of tech debt was accepted instead of fixed.

Skip the ADR for:
- Plain implementation details a future change can flip without breaking anyone.
- Day-to-day implementation tracking that belongs in issues, PRs, or project boards.
- Per-target user-facing scope; that lives in each runtime's `README*.md`.

## When to supersede

Decisions evolve. When a new ADR replaces an old one:
1. Set the old ADR's status to `Superseded by ADR-NNNN`.
2. Cross-link from `Related`.
3. Keep the old ADR — the historical context matters.



Each record normally uses this structure:

- Status
- Context
- Options Considered
- Decision
- Tradeoffs
- Consequences

ADR 0006 is the explicit exception: real generated-binding tests are a hard
project rule, so that record intentionally does not consider alternatives.

## Records

- [0001. Record Architecture Decisions](0001-record-architecture-decisions.md)
- [0002. Python Target Uses Iota ABI](0002-python-target-uses-iota-abi.md)
- [0003. Python Bindings Use Generated cffi Declarations](0003-python-bindings-use-generated-cffi-declarations.md)
- [0004. Python String Exchange Uses UTF-8 Iota Setup](0004-python-string-exchange-uses-utf8-iota-setup.md)
- [0005. Python Reference Lifetime Uses Finalizers](0005-python-reference-lifetime-uses-finalizers.md)
- [0006. Python Tests Exercise Real Generated Bindings](0006-python-tests-exercise-real-generated-bindings.md)
- [0007. Python Bindings Ship As Platform Wheels](0007-python-bindings-ship-as-platform-wheels.md)
- [0008. Python Target Uses Red/Green Integration TDD](0008-python-target-uses-red-green-integration-tdd.md)
- [0009. Python cffi Declarations Define The ABI Contract](0009-python-cffi-declarations-define-the-abi-contract.md)
- [0010. Python Async Uses Explicit asyncio Loop Ownership](0010-python-async-uses-explicit-asyncio-loop-ownership.md)
- [0011. Python Packages Version And Load Native Dependencies Explicitly](0011-python-packages-version-and-load-native-dependencies-explicitly.md)
- [0012. Python UX Includes Typing And Diagnostics](0012-python-ux-includes-typing-and-diagnostics.md)

## Style

- The decision goes at the top of `## Decision` as a single sentence, then the
  rationale. Skim-reading the index page should reveal the project's spine.
- Prefer linking to source files over duplicating their content. Source-of-truth
  values (constants, configuration) stay in code; ADRs explain the *why*.