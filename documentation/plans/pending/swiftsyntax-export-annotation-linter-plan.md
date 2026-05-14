# SwiftSyntax Export Annotation Linter Plan

## Goal

Rewrite FishyJoes' misplaced export-annotation diagnostic linter to use
SwiftSyntax instead of the current conservative line/regular-expression source
scanner.

This is a targeted step toward the broader Sourcery replacement work. It should
improve source-accurate diagnostics for FishyJoes annotation placement without
changing generation semantics. FishyJoes must still generate bindings only from
declaration-attached annotations in the binding model it currently receives.
The SwiftSyntax linter may warn about source intent, but it must not recover by
exporting declarations from orphan comments.

Related plan:

- `documentation/plans/pending/fishyjoes-export-annotation-diagnostics-plan.md`

This plan supersedes that plan's dependency-free scanner recommendation for the
linter implementation only. It does not supersede the rule that attached
declaration metadata remains the source of truth for generated APIs.

## Background

The existing linter in `Sources/FishyJoesCore/ExportAnnotationDiagnostics.swift`
was written to catch cases where a developer wrote a FishyJoes annotation in
Swift source but Sourcery did not attach that comment to the intended
declaration. It scans lines, tracks simple block-comment state, uses regular
expressions for declarations, and compares raw source annotations with
Sourcery-attached annotation inventory.

That implementation made the silent omission visible, but it is intentionally
limited:

- It approximates Swift declaration structure with regexes.
- It has to infer whether a comment is immediately before a declaration.
- Multi-line declarations and attributes require fragile manual tracking.
- Function signatures, property declarations, enum cases, extensions, and
  nested declarations are richer than the scanner can safely model.
- It cannot use precise syntax trivia ranges for comments and declarations.

SwiftSyntax is a better fit for this linter because the linter's job is
source-accurate syntax and trivia inspection, not semantic type resolution.

## Non-Goals

- Do not replace Sourcery or the FishyJoes declaration model in this plan.
- Do not change generated API behavior based on unattached comments.
- Do not add SourceKit extraction as part of this linter rewrite.
- Do not edit generated bindings directly.
- Do not delete existing tests without explicit user approval.
- Do not add mocks, fakes, or monkeypatch-based tests.
- Do not weaken or rewrite library source to make diagnostics pass.

## Design Principles

1. **Generation remains metadata-driven.**
   Existing generation should continue to rely on attached annotation metadata
   from the current binding model. The linter only reports suspicious source
   placement.

2. **SwiftSyntax owns source structure.**
   Source traversal should use `SwiftParser`/`SwiftSyntax` nodes and trivia,
   not declaration regexes.

3. **Diagnostics are conservative but precise.**
   Valid annotation placement must not warn. Invalid annotation placement should
   point to the exact file and line, include the annotation, and name the
   nearest intended declaration when SwiftSyntax can identify it confidently.

4. **The implementation should be reusable for SourceKit migration.**
   The linter should produce a small FishyJoes-owned source annotation model,
   not expose SwiftSyntax nodes throughout translator logic.

5. **Toolchain coupling must be explicit.**
   FishyJoes currently uses `swift-tools-version: 6.2`. The SwiftSyntax package
   version must be chosen to match the supported Swift toolchain and recorded in
   the implementation commit.

## Proposed Architecture

Add a SwiftSyntax-backed source annotation collector inside `FishyJoesCore`.

Suggested types:

```swift
struct SourceExportAnnotation {
    let filePath: String
    let lineNumber: Int
    let rawAnnotationText: String
    let kind: ExportAnnotation.Kind?
    let exportName: String?
    let attachment: Attachment
}

enum Attachment {
    case attached(to: SourceDeclaration)
    case misplaced(nearestDeclaration: SourceDeclaration?)
    case malformed(nearestDeclaration: SourceDeclaration?)
}

struct SourceDeclaration {
    let kind: Kind
    let displayName: String
    let lineNumber: Int
}
```

The collector should parse each Swift source file with SwiftSyntax and inspect
leading trivia for declaration syntax nodes that can validly carry FishyJoes
annotations:

- nominal type declarations: `struct`, `class`, `enum`, `protocol`, `actor`
- function and initializer declarations
- variable declarations
- enum case declarations
- extension member declarations where annotations are valid today

The linter should then compare:

- SwiftSyntax source annotations and their source attachment classification
- existing attached annotation inventory from the current binding model

The comparison still matters because generation currently depends on the
binding model. A SwiftSyntax-attached comment that the current binding model did
not receive should be diagnosed as a model/parser mismatch, not silently used
for generation.

## Dependency Plan

Add SwiftSyntax dependencies only to the target that needs source linting.

Candidate packages/modules:

- `SwiftSyntax`
- `SwiftParser`

Before implementation, choose the package version that matches FishyJoes'
supported Swift 6.2 toolchain. Do not guess by copying a random version from an
unrelated project. Verify with `swift build` before committing.

Expected package impact:

- Add `apple/swift-syntax` to `Package.swift`.
- Add the needed products to `FishyJoesCore` or a new small internal linter
  target if that keeps compile-time impact contained.
- Avoid exposing SwiftSyntax types in public translator APIs.

## Implementation Plan

### 1. Preserve Current Behavior With Focused Baseline Tests

Before changing the implementation, run the focused diagnostics tests:

```bash
swift test --disable-sandbox --filter FishyJoesCoreTests/ExportAnnotationDiagnosticsTests
```

If the test filter syntax differs locally, use the smallest available
`FishyJoesCoreTests` filter that includes `ExportAnnotationDiagnosticsTests`.

Record the current expected diagnostics behavior:

- valid method annotation: no warning
- valid property annotation: no warning
- valid type annotation: no warning
- malformed FishyJoes annotation: parse warning
- annotation inside a function body: misplaced warning
- annotation between declaration header and body: misplaced warning
- multiline function declaration placement
- active documentation block comments such as `/** ... */`

### 2. Add Red Tests For SwiftSyntax-Only Gaps

Add tests that the regex scanner either cannot handle well or handles only by
fragile approximation:

- Annotation above a declaration with multiple attributes.
- Annotation above a multi-line generic function signature.
- Annotation above a multi-line variable declaration.
- Annotation above an enum case with associated values.
- Annotation between an attribute and the declaration it was meant for.
- Annotation in trailing trivia after a declaration line.
- Annotation in a regular non-documentation block comment: no diagnostic.
- Annotation in an active documentation block comment immediately above a
  declaration: no diagnostic if the current binding model also reports it
  attached.
- Annotation in a function body doc comment: diagnostic with nearest enclosing
  or preceding declaration when available.
- Annotation in nested declaration contexts.

These tests should fail before the SwiftSyntax collector is implemented.

### 3. Introduce A SwiftSyntax Source Collector

Implement a syntax visitor that:

- Parses source with `Parser.parse(source:)`.
- Walks declarations and records their leading trivia.
- Extracts FishyJoes annotation comments from active documentation trivia.
- Computes file/line positions through `SourceLocationConverter`.
- Builds `SourceExportAnnotation` records.
- Records declaration display names using syntax structure rather than regex.
- Classifies comments that are inside function bodies, trailing trivia, or
  otherwise not leading documentation for a declaration as misplaced.

Keep the collector independent from `SourceryDataModel` so it can survive the
larger SourceKit migration.

### 4. Keep Attached Metadata Cross-Check

Retain the existing `attachedAnnotations(in:)` inventory while Sourcery remains
the active declaration provider.

The final diagnostic rules should be:

- Source annotation attached by SwiftSyntax and represented in attached
  metadata: no diagnostic.
- Source annotation attached by SwiftSyntax but missing from attached metadata:
  diagnostic for binding-model mismatch or ignored annotation.
- Source annotation not attached by SwiftSyntax to a valid declaration:
  misplaced diagnostic.
- Source annotation with malformed FishyJoes syntax:
  malformed diagnostic.
- Non-FishyJoes comments: ignored.

This protects against both source placement errors and future extractor
regressions.

### 5. Replace Regex Scanner Internals

Remove the regex declaration/line-scanner path only after the SwiftSyntax
collector passes the current and new tests.

Do not delete tests. If any old test becomes invalid because its setup assumes
scanner-specific behavior, stop and propose the change instead of deleting or
weakening it.

### 6. Wire Into Generation Unchanged

Keep the current generation integration point:

- after the declaration model is available
- before translator output is written
- through the existing warning path

Do not introduce a separate print path. If file/line warnings need better
formatting, improve the warning helper in the smallest source-level change.

### 7. Validate Against TestAPI And CriGeo

Run:

```bash
swift test --disable-sandbox --filter FishyJoesCoreTests
swift build
```

Then run the annotation linter through real generation:

```bash
FISHYJOES=1 fishy-joes code-gen --python generate
```

Use TestAPI first, then run against CriGeo to confirm the original
`normalUnitLineAt`-style misplaced annotation still produces a clear warning.
If CriGeo generation fails later for unrelated reasons, the diagnostic evidence
is still useful, but the failure must be recorded honestly.

### 8. Cross-Language Safety Check

Because this linter is language-independent, run at least the focused TestAPI
generation path that exercises all translators' shared annotation discovery.
If generated outputs change, audit the diff before accepting it.

No generated files should be edited manually.

## Test Strategy

Use real parser behavior and direct unit tests for the collector. No mocks are
needed.

Recommended layers:

- pure SwiftSyntax collector tests with inline Swift source strings
- diagnostic cross-check tests against synthetic attached annotation inventory
- existing `ExportAnnotationDiagnosticsTests`
- one real integration/generation check

Tests should assert:

- exact diagnostic count
- file path
- line number
- export name when parseable
- nearest declaration when available
- actionable message text

## Risks And Tradeoffs

### Dependency Weight

SwiftSyntax can add compile time and a sizable package dependency. The benefit
is source-correct parsing and reduced custom scanner debt. Limit the dependency
to the linter path and avoid leaking SwiftSyntax types into core translator
models.

### Toolchain Coupling

SwiftSyntax versions track Swift compiler versions closely. FishyJoes must pin
an appropriate SwiftSyntax version for Swift 6.2 and update it deliberately when
the package toolchain changes.

### Parser Versus Semantic Truth

SwiftSyntax sees source structure, not semantic type resolution. That is fine
for annotation placement. Do not use this linter as proof that a declaration is
exportable or type-supported.

### Attached Metadata Mismatch

During the Sourcery period, SwiftSyntax may classify a comment as attached while
Sourcery does not. The correct response is a diagnostic and investigation, not
using SwiftSyntax to generate that API.

### Conditional Compilation

SwiftSyntax parses source syntax without deciding the full active platform
surface. The collector should avoid claiming semantic availability from syntax
alone. If conditional compilation affects annotation diagnostics, record the
case and decide whether the linter needs build-context filtering later.

## Commit Plan

Use red/green TDD commits:

1. Add SwiftSyntax-gap tests that fail under the current scanner.
2. Add SwiftSyntax dependency and source collector to make the new tests green.
3. Replace scanner internals while preserving existing diagnostics behavior.
4. Run real generation checks and update documentation if warning text or rules
   changed.

Keep all commits local. Do not push.

## Acceptance Criteria

- Existing export-annotation diagnostics remain green.
- New SwiftSyntax-specific placement tests are green.
- Declaration matching no longer relies on regular expressions.
- Misplaced annotations report file and line information.
- Valid annotations above attributes, multi-line declarations, properties,
  enum cases, and types do not warn.
- Malformed FishyJoes annotations still warn clearly.
- Generation semantics do not change: unattached comments never create exports.
- The linter remains language-independent.
- `swift test --disable-sandbox --filter FishyJoesCoreTests` passes.
- A real TestAPI generation path passes.
- The original CriGeo-style misplaced annotation remains detectable.

## Open Questions

- Should SwiftSyntax live directly in `FishyJoesCore`, or should the linter move
  to a small internal target to isolate dependency cost?
- Should diagnostics distinguish "misplaced in source" from "SwiftSyntax sees
  it attached but the current declaration provider did not"?
- Should conditionally compiled inactive annotations be ignored now, or should
  that wait for the larger SourceKit/build-context migration?
