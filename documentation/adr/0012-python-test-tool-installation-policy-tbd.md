# 0012. Python test-tool installation policy remains TBD

* **Status:** Proposed
* **Date:** 2026-04-28
* **Deciders:** Project leads

## Context and problem statement

`PythonPhases.testPhase` installs Python support tooling before running the
generated Python test phase. Today it uses `pip install --user
--break-system-packages` for pinned tools such as `ruff`, `mypy`, and the
editable `fishyjoes_python` runtime. That works in local and CI-style runs,
especially when `HOME` is redirected into the worktree, but the installation
location is a policy choice rather than an inherent requirement.

## Decision

**Do not change Python tool installation behavior in the current hardening
plan; choose the long-term policy in a later ADR.**

The current phase remains responsible for installing the tools it needs. A
future decision should choose whether the canonical path continues to use
`--user`, creates a generated-output virtual environment, or requires tools to
be preinstalled and fails with setup instructions.

## Consequences

### Positive
- The current Python test phase remains reproducible while higher-priority
  parity work proceeds.
- The installation policy can be decided with dedicated evidence instead of
  being folded into unrelated runtime/template refactors.

### Negative
- Local runs may continue to create worktree-local user-site artifacts when
  `HOME` is redirected.
- Contributors still need to understand that the current phase mutates the
  chosen Python user environment.

### Neutral
- This ADR records an explicit TBD, not a permanent endorsement of the current
  installation strategy.

## Alternatives considered

**Keep `--user --break-system-packages` permanently.** Simple and matches the
current phase, but it may be too invasive for contributor machines.

**Create a generated-output virtual environment.** Cleaner isolation, but adds
venv lifecycle, cache, and path management to every Python phase run.

**Require preinstalled tools.** Least invasive for the phase, but weaker for
reproducibility and harder for new contributors.

## Related

- [`documentation/plans/implemented/python-support-current-audit-plan.md`](../plans/implemented/python-support-current-audit-plan.md)
  — records this as a deferred implementation decision.
- `Sources/FishyJoesExecute/Phases/PythonPhases.swift` — current install
  behavior.
