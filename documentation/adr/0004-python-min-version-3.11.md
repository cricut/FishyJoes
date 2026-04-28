# 0004. Minimum Python version is 3.11

* **Status:** Accepted
* **Date:** 2026-04-28
* **Deciders:** Project leads

## Context and problem statement

The Python target needs a floor below which it does not even attempt to
run. Two pressures point in opposite directions: setting the floor too
low means supporting older Python releases that have already lost
upstream security maintenance; setting it too high means excluding
otherwise-current users on lagging distributions.

Python release schedule (relevant to the decision date):
- 3.9 — EOL October 2025 (already past).
- 3.10 — EOL October 2026 (will EOL within the year).
- 3.11 — EOL October 2027.
- 3.12 — EOL October 2028.

## Decision

**`requires-python = ">=3.11"`. The runtime checks this floor at import
time, and the C extension is built against the 3.11 stable ABI
(`Py_LIMITED_API = 0x030B0000`).**

3.11 is the lowest version that survives 2026 and beyond. Pinning it as
the stable-ABI target also means a single `.so` works for 3.11 / 3.12 /
3.13 / 3.14+ — the extension does not need to be rebuilt per Python
release.

## Consequences

### Positive
- One C-extension binary covers the entire supported range.
- Free use of 3.11 syntax in generated code (PEP 604 unions, parenthesised
  context managers, fine-grained tracebacks).
- Floor is documented and enforced consistently across `pyproject.toml`,
  the runtime guard (`ensure_supported_python`), and the C extension's
  `Py_LIMITED_API` macro — drift between any two would fail the
  `tests/test_python_version.py` assertions.

### Negative
- 3.10 users are excluded effective immediately, six months ahead of its
  upstream EOL. Cricut deployments that still pin 3.10 in their consumer
  environment will need to upgrade.

### Neutral
- The floor is per-target. Other languages have their own version floors
  managed in their own runtime configs.

## Alternatives considered

**`>=3.10`.** Would catch the 3.10 user population still in the wild.
Rejected: 3.10 hits EOL in October 2026, six months after this ADR was
locked. Building support that we know will be retired before the next
review cycle is wasted effort.

**`>=3.12`.** Tighter floor, fewer wheels needed, no `Py_LIMITED_API`
backporting. Rejected: 3.11 is the youngest version with a current stable
ABI we want to target, and 3.12 was newer than the deployment target
window when this was decided.

**Date-based floor (e.g. "always last two non-EOL releases").** Tempting
because it self-updates, but a moving floor invalidates wheels and forces
rebuilds on every Python release. Static floor with explicit ADR
supersession is more predictable; revisit per release.

## Related

- [ADR-0003](0003-python-cpython-only.md) — the CPython-only constraint
  that makes the stable ABI the right binding strategy.
- `python-runtime/pyproject.toml` — `requires-python` constraint.
- `python-runtime/src/fishyjoes_python/runtime.py:MIN_PYTHON_VERSION` —
  runtime guard.
- `python-runtime/setup.py` — `Py_LIMITED_API` macro.
- `python-runtime/tests/test_python_version.py` — drift-detection
  regression suite.
