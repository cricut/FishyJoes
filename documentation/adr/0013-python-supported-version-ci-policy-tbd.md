# 0013. Python supported-version CI policy remains TBD

* **Status:** Proposed
* **Date:** 2026-04-28
* **Deciders:** Project leads

## Context and problem statement

The Python runtime is documented as CPython-only and supports Python 3.11+.
Generated package metadata advertises support for current CPython minors
through 3.14. The repository needs a CI policy that defines which supported
minors are actively exercised, but that decision is separate from the current
runtime/template hardening work.

## Decision

**Do not add or change the Python-version CI matrix in the current hardening
plan; decide the supported-minor test policy in a later ADR.**

The implementation work in this pass should preserve the documented CPython
3.11+ contract and avoid introducing version-specific behavior unless it is
covered by explicit tests.

## Consequences

### Positive
- The current plan can focus on parity, runtime correctness, and generator
  structure without also changing CI scope.
- A future CI policy can be evaluated against real runtime/tool availability
  across Python minors.

### Negative
- A single local Python version can still miss regressions in another supported
  minor until the matrix policy is resolved.
- Version-specific behavior remains a risk area that needs explicit attention
  in future work.

### Neutral
- This ADR does not change the minimum supported Python version.

## Alternatives considered

**Test every supported minor now.** Strongest signal, but may require CI images
and dependency work outside the scope of this plan.

**Test only the newest CPython.** Fast and simple, but weakens confidence in the
documented 3.11+ contract.

**Test oldest and newest supported minors.** A likely future compromise, but it
still needs CI evidence and project agreement.

## Related

- [`documentation/plans/implemented/python-support-current-audit-plan.md`](../plans/implemented/python-support-current-audit-plan.md)
  — records this as a deferred implementation decision.
- [`documentation/adr/0003-python-cpython-only.md`](0003-python-cpython-only.md)
  — records the CPython-only runtime scope.
- [`documentation/adr/0004-python-min-version-3.11.md`](0004-python-min-version-3.11.md)
  — records the minimum Python version.
