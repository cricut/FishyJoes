# Quarantined "duplicate-candidate" tests

This directory holds **unit tests that appear to duplicate coverage already
provided by the integration suite at
`integration-tests/TestAPI/bindings/python/tests/`**.

Tests land here when, on inspection, the contract they pin is already
exercised end-to-end against the real Swift dylibs in the integration
tier — making the unit-level version redundant rather than additive.

## Why a quarantine, not a delete

Per [feedback_never_delete_tests](../../../../../.claude/projects/-Users-antoniogermano-work-cricut-FishyJoes/memory/feedback_never_delete_tests.md):
deleting a test silently removes coverage and pre-empts the user's
judgement. Quarantining keeps the test runnable, version-controlled, and
auditable — the user can step through each one and decide:

- **Keep here, do not run.** Leave as historical reference.
- **Delete.** Confirmed redundant; reclaim the maintenance cost.
- **Move back.** Coverage gap surfaced; the unit-level pin is still load-bearing.
- **Rewrite against real runtime.** The unit value is real but the
  current implementation violates [feedback_no_mocks_real_runtime](../../../../../.claude/projects/-Users-antoniogermano-work-cricut-FishyJoes/memory/feedback_no_mocks_real_runtime.md).

## Why per-test, not per-file

A single source file often mixes duplicate-candidate tests with genuinely
unique unit-level tests. Moving the whole file would either drag
non-duplicates into the quarantine or leave duplicates behind. Each test
method (and its supporting fixtures) is moved individually; the original
file keeps everything else.

## Pytest behaviour

`unittest` discovery walks subpackages, so these tests are still
collected by `python -m unittest discover` from the `tests/` root. If you
want to skip them while triaging, run:

```
python -m unittest discover -s tests -p 'test_*.py' --top-level-directory tests
```

…then exclude `tests/duplicates/` explicitly, or use pytest's
`--ignore=tests/duplicates`.

## Current contents

- `test_iota_handle_coercion_and_release.py` — two tests from
  `tests/test_iota.py` (`test_handle_coercion`, `test_reference_release_uses_runtime`)
  plus the `FakeRuntime` helper they exclusively used. Coverage overlap:
  integration tests round-trip every IOTA reference type through the
  real runtime; the FakeRuntime-shaped unit assertions add nothing the
  integration tier doesn't already prove.
