# 0006. Python Tests Exercise Real Generated Bindings

## Status

Accepted.

## Context

FishyJoes binding tests must catch real generator, runtime, and dynamic-library
wiring errors. Tests that replace runtime methods, fake symbols, or skip when
libraries are missing can report green while exercising the wrong behavior.

The Python target crosses cffi, generated Python code, Iota setup callbacks, and
Swift dynamic libraries, so fake runtime tests are especially risky.

This is a hard project rule. No alternative testing strategy is considered
acceptable for FFI-backed behavior.

## Decision

Python target tests exercise the real generated package against real built Iota
dynamic libraries.

Development follows red/green integration TDD as described in
[0008. Python Target Uses Red/Green Integration TDD](0008-python-target-uses-red-green-integration-tdd.md).

If required libraries or exported symbols are missing, tests fail loudly with a
clear build/regeneration message.

Unit tests under a handwritten Python runtime are allowed only for behavior that
cannot be reached through integration, such as pure Python value objects,
pre-FFI type guards, and internal ownership helpers. They must not mock runtime
FFI behavior.

## Tradeoffs

Integration tests require contributors to build the Swift and Python binding
artifacts before running the suite.

Failures can span Swift generator code, Python runtime code, cffi declarations,
and dynamic-library loading, so diagnostics need to be clear.

Some rare Python-only helper branches may still need focused unit tests, but
those tests must not replace real FFI behavior.

## Consequences

The main source of truth for Python target behavior is integration coverage.

Skip counts must be audited. A new Python suite should include a sentinel test
that proves the real runtime is available before feature tests run.

Implementation work may be slower, but failures will represent real user-facing
behavior instead of fake runtime behavior.
