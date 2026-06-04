# 0008. Python Target Uses Red/Green Integration TDD

## Status

Proposed / Implemented

## Context

The Python target crosses generated Python wrappers, the handwritten Python
runtime, cffi declarations, generated Swift Iota shims, and Swift dynamic
libraries. Bugs at any of those seams can pass isolated unit tests while failing
for users.

The existing TestAPI bindings already have feature-oriented integration coverage
for other languages. Python should reach parity by implementing equivalent
integration tests, not by inventing isolated Python-only tests first.

## Options Considered

- Implement runtime and generator code first, then add integration tests.
  This is faster initially, but it makes it easy to overfit the implementation
  and miss the real user-facing contract.
- Write unit tests with fake runtime objects first.
  This gives fast red/green loops, but it violates the repository rule that FFI
  behavior is tested against real code and can hide incorrect symbols.
- Port all integration tests after the target is mostly complete.
  This creates broad coverage eventually, but failures arrive too late to guide
  the architecture feature by feature.
- Use red/green integration TDD feature by feature.
  This is slower per feature, but each implementation step is driven by a real
  generated binding test that first fails for the expected reason and then
  passes against the real runtime.

## Decision

Python target implementation proceeds by red/green integration TDD.

For each feature area, add or port the equivalent TestAPI Python integration
test first. Run it against the real generated Python package and real Iota
dynamic libraries. Confirm it fails for the expected missing or incorrect
behavior. Then implement the minimum generator/runtime work to make that test
pass.

Python integration coverage should be equivalent in intent to the existing
TestAPI language tests for TypeScript, C#, and Dart. Equivalent does not mean
line-for-line translation; tests should use idiomatic Python assertions and API
shape while covering the same Swift behavior.

Unit tests are allowed only for Python-only helper behavior that cannot be
reached through integration. They do not replace the red integration test for an
FFI-backed feature.

Red/green TDD is not permission to optimize only for the narrowest failing
method. The green implementation must still preserve the Python target's
architecture goals: Iota-driven design, generated wrappers driven by FishyJoes
type metadata, maintainable abstractions, high-quality Python UX, and no
hard-coded TestAPI-specific behavior.

Before every green commit, apply a refactor gate:

- If the implementation adds a hard-coded type name, function name, symbol name,
  conversion key, or TestAPI-specific branch, stop and ask whether it is evidence
  of a missing abstraction.
- If a red test can be made green by either a local special case or a reusable
  metadata-driven model, choose the reusable model unless it conflicts with a
  higher-priority ADR or project goal.
- If investigation exposes a broader user-facing gap, do not replace it with a
  weaker test that bypasses the gap and then forget the original issue. Either
  keep the stronger red test, implement the real fix, or record the gap (for
  example as a tracked issue) with enough detail that a future slice can address it.
- When a test reveals that generated Python is awkward, invalid, unstable, or
  inconsistent with the target architecture/UX goals, treat that as an
  implementation problem in the generator/runtime. Do not downgrade the test,
  rewrite it around the current generated shape, or add ad-hoc compatibility
  code merely to pass the local assertion.
- Tests should describe the Python binding FishyJoes is supposed to generate
  for users: stable after regeneration, metadata-driven, Iota-only, idiomatic
  Python, and consistent with the accepted ADRs. If the current implementation
  cannot satisfy that contract, fix the implementation or explicitly record the
  gap for a later decision; do not let the test normalize the defect.
- If testing exposes a generated-code problem, fix the layer that caused the
  problem: the Swift translator/emitter, template, shared Python runtime, Iota
  runtime, or packaging phase as appropriate. Do not change the test to fit an
  inappropriate generated shape, and do not patch generated files directly.
- Keep the relevant ADRs in view while implementing each
  slice. A red integration test describes the next observable failure; it does
  not by itself define the correct architecture.
- Treat "least new code" as the lowest-priority goal. It must not override
  maintainability, scalability, Iota alignment, or Python user experience.

Native crash reports are part of the red/green loop when a real integration
test terminates Python, `fishy-joes`, or another tool before `unittest` can
report a failure. Use `scripts/summarize-fishyjoes-crashes.py` to inspect local
macOS crash reports instead of asking the user to paste full reports.

Crash triage must stay narrow:

- Inspect only recent allowlisted process reports, normally `Python` and
  `fishy-joes`.
- Prefer crashes from the configured build/test launcher by checking the crash report's parent,
  responsible process, or coalition fields.
- Require FishyJoes relevance through triggered frames or loaded images that
  mention FishyJoes, TestAPI, Iota, or the active checkout.
- Summarize only timestamp, incident id, exception, parent/responsible process,
  relevant frames, and FishyJoes image paths.
- Do not bulk-read unrelated DiagnosticReports files and do not commit or copy
  crash reports into the repository.

## Tradeoffs

The implementation sequence will be slower than building a large runtime first.

Some early integration tests may fail at import/setup before reaching the
feature assertion. That is acceptable only when the failure is the expected next
missing layer; otherwise the setup failure must be fixed before claiming feature
progress.

The test suite must avoid silent skips. A skipped Python integration test is not
a green TDD step unless the skip was explicitly reviewed and accepted.

Tests that avoid a known product gap are not evidence that the gap is handled.
For example, explicitly passing an enum argument proves enum conversion works,
but it does not prove that a Swift default such as `join: Join = .bevel`
translates into idiomatic generated Python. The bypassed behavior remains open
work until it is fixed or explicitly recorded as deferred.

The refactor gate may make some slices larger than the first failing assertion
suggests. That cost is acceptable when the alternative is accumulating
generator/runtime debt that would make later slices harder or less coherent.

Crash summaries omit most of the raw `.ips` detail by design. If a summary is
insufficient, inspect the specific report directly only after confirming it is
recent, launcher-matched or explicitly relevant, and tied to FishyJoes frames or
images.

## Consequences

Each plan phase needs a named red test before implementation starts.

Commits should keep test and implementation changes close enough that reviewers
can see the red/green story for the feature.

Commits should not land known hard-coded shortcuts merely because the current
integration test is green. If the green path relies on a shortcut, either
refactor before committing or explicitly record why the shortcut is consistent
with the accepted ADRs.

The Python target is complete only when the equivalent TestAPI feature matrix is
green against generated bindings and real native libraries.
