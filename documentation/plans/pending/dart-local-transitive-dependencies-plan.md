# Dart Local Transitive Dependencies Plan

## Problem

The clean CriCanvas `3.12.2` Dart flow works through generation and native
build, then fails in Dart package resolution when the root generated package
uses a local FishyJoes path but transitive generated packages still come from
Git.

Observed in `/private/tmp/cricanvas-fishyjoes-checks/dart-latest`:

```text
cricut_cricanvas depends on fishyjoes_dart from path
cricut_criraster from git depends on fishyjoes_dart from git
version solving failed
```

`bindings/dart/generated/pubspec.yaml` for CriCanvas emits:

```yaml
fishyjoes_dart:
  path: .../FishyJoes/dart-runtime
cricut_criraster:
  git:
    url: "https://github.com/cricut/CriRaster.git"
    ref: "1.4.0"
    path: "bindings/dart/generated"
```

The local SwiftPM graph already exposes generated Swift binding paths for
transitive dependencies through environment entries such as
`FISHYJOES_DEPENDENCY_CriRaster-bindings`. Dart generation does not currently
use those paths to keep the Dart package graph local and internally consistent.

## Goal

When a consumer package points FishyJoes at a local checkout, every generated
Dart package in the same local binding graph must resolve against the same
local `fishyjoes_dart` runtime source. The fully clean CriCanvas Dart flow
should reach `dart run fishyjoes_dart:setup`, `dart analyze`, and `dart test`
without a local-vs-git FishyJoes conflict.

## Non-Goals

- Do not edit generated consumer files by hand.
- Do not change CriCanvas, CriRaster, CriGeo, CriSVG, or CriText source as the
  fix. The fix belongs in FishyJoes generation/phase logic.
- Do not change release/Git dependency behavior for published package flows
  unless the local dependency graph is explicitly active.
- Do not solve unrelated Dart analyzer or runtime failures until the package
  resolver can build a coherent graph.

## Proposed Design

Teach Dart generation to prefer local generated Dart package paths for
transitive dependencies when FishyJoes already knows a dependency's generated
Swift bindings path.

For a dependency entry like:

```text
FISHYJOES_DEPENDENCY_CriRaster-bindings={"local":{"path":".../CriRaster/bindings/swift-interfaces/generated/CriRaster-bindings"}}
```

derive the sibling Dart generated package:

```text
.../CriRaster/bindings/dart/generated
```

Then emit:

```yaml
cricut_criraster:
  path: <relative path to .../CriRaster/bindings/dart/generated>
```

instead of the Git dependency when all of these are true:

1. The root generated Dart package is using local FishyJoes.
2. The dependency has a local `*-bindings` path available.
3. The sibling `bindings/dart/generated/pubspec.yaml` exists or can be
   generated as part of the dependency's existing FishyJoes binding output.

If a local binding path exists but the Dart generated package is missing, fail
with a clear message that names the dependency and expected path. Do not fall
back silently to Git, because that recreates the split FishyJoes graph.

Prefer path dependencies over `dependency_overrides` for the primary emitted
dependencies. A generated root package that directly depends on local generated
packages is simpler to reason about and mirrors the way SwiftPM receives local
`*-bindings` dependencies. If Dart pub still needs help for deeper transitive
packages, add `dependency_overrides` for `fishyjoes_dart` and each local
generated package as a second step, with tests proving it is necessary.

## Red/Green TDD Plan

### Step 1: Reproduce the Dart Pub Conflict

**Red:** Add a FishyJoesExecute test for Dart pubspec generation with:

- root module using local FishyJoes,
- transitive dependency `CriRaster`,
- local `CriRaster-bindings` path available,
- remote Swift package dependency metadata still present.

Assert that the generated root Dart `pubspec.yaml` should contain a path
dependency for `cricut_criraster`. Today it emits Git, so the test fails.

**Green:** Update Dart phase/template dependency rendering to discover the
local generated Dart package path and emit the path dependency.

**Verify:** Run the new Swift test only.

### Step 2: Preserve Release/Git Behavior

**Red:** Add a paired test where no local `*-bindings` path is available.
Assert the generated Dart dependency remains Git-based with the expected
`url`, `ref`, and `path: bindings/dart/generated`.

**Green:** Keep the new local-path behavior behind explicit local dependency
availability, not behind package name heuristics.

**Verify:** Run the Dart generation tests.

### Step 3: Fail Loudly on Incomplete Local Graphs

**Red:** Add a test where a local `CriRaster-bindings` path exists but
`bindings/dart/generated/pubspec.yaml` does not. Assert FishyJoes reports a
clear failure instead of emitting a mixed local/Git graph.

**Green:** Add validation in the Dart generation/build phase before invoking
`dart pub`.

**Verify:** Run FishyJoesExecute tests for Dart phases.

### Step 4: Full Clean Integration

**Red:** Rerun the clean CriCanvas `3.12.2` Dart flow against current
FishyJoes from a fresh temp tree. It should previously fail at Dart pub
resolution.

**Green:** Rerun the same flow after the fix:

```bash
FISHYJOES=1 GITHUB_USER=local GITHUB_TOKEN=local \
swift run --disable-sandbox --manifest-cache local -- \
  fishy-joes --dart generate build test
```

**Verify:** Confirm Dart reaches and passes setup/analyze/test. If Dart exposes
new analyzer/runtime failures after dependency resolution succeeds, record them
as separate issues with exact output.

## Implementation Notes

- Likely code areas:
  - `Sources/FishyJoesExecute/Phases/DartPhases.swift`
  - `Sources/FishyJoesExecute/SwiftPackage.swift`
  - Dart package templates under
    `Sources/FishyJoesExecute/Resources/bindings-template/dart/`
- Keep dependency path rendering centralized. Do not duplicate ad hoc
  `pubspec.yaml` string construction in multiple phases.
- Use relative paths in generated Dart `pubspec.yaml` where possible, matching
  the existing local `fishyjoes_dart` style.
- Path conversion from `*-bindings` to Dart should be structured path logic:
  locate the owning package root, then append `bindings/dart/generated`.
  Avoid brittle string replacement except for the final path normalization.

## Definition of Done

- New regression tests fail before the fix and pass after it.
- Release/Git Dart dependency generation remains unchanged.
- A missing local transitive Dart generated package fails loudly with an
  actionable message.
- Fully clean CriCanvas `3.12.2` Dart flow no longer fails with
  `fishyjoes_dart from path` vs `fishyjoes_dart from git`.
- No generated files are edited by hand.
