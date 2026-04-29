# Python Ergonomic Aliases Plan

## Context

The correctness plan in [`python-keyword-identifier-plan.md`](../implemented/python-keyword-identifier-plan.md) should land first.
It makes generated Python syntactically valid and safe by sanitizing source
identifiers such as Swift's `from` label into Python identifiers such as
`from_`.

This plan is a later ergonomics pass. Its goal is to make generated Python feel
natural to Python users without breaking existing Swift-shaped generated APIs.

## Problem

Generated Python currently mirrors Swift member names. This is useful for
fidelity and cross-language lookup, but it does not feel idiomatic in Python:

```python
state.insertProtobufImage(from_=data, canvasPosition=position, ...)
settings.supportsNestedTextFeatures
```

Python users expect snake_case method and property names:

```python
state.insert_protobuf_image(from_=data, canvas_position=position, ...)
settings.supports_nested_text_features
```

FishyJoes can generate these aliases automatically because the generator
already owns the method, property, parameter, and class metadata.

## Goal

Allow generated Python consumers to use Swift-shaped camelCase names and
Pythonic snake_case names interchangeably.

The existing camelCase API remains canonical and stable. The snake_case API is
generated as thin forwarding aliases, never as duplicate runtime logic.

## Non-Goals

- Do not remove camelCase names.
- Do not change IOTA symbol names, setup names, or argument order.
- Do not hand-edit generated Python.
- Do not make Python diverge semantically from Swift or the other IOTA targets.
- Do not land this before keyword-safe identifiers are implemented and verified.

## Proposed Design

### Member Aliases

For every public generated Python method, derive a snake_case alias:

```python
def insertProtobufImage(self, from_: builtins.bytes, ...) -> GraphicInsertResult:
    ...

def insert_protobuf_image(self, from_: builtins.bytes, ...) -> GraphicInsertResult:
    return self.insertProtobufImage(from_=from_, ...)
```

For every public generated property, derive a snake_case forwarding property:

```python
@property
def canvasSettings(self) -> CanvasSettings:
    ...

@property
def canvas_settings(self) -> CanvasSettings:
    return self.canvasSettings
```

For settable properties:

```python
@canvas_settings.setter
def canvas_settings(self, value: CanvasSettings) -> None:
    self.canvasSettings = value
```

### Parameter Aliases

Do not initially support both camelCase and snake_case keyword argument names
for the same method. Supporting both parameter spellings is possible, but it
adds a larger compatibility surface because Python functions cannot directly
declare both without duplicate positional/keyword handling.

Initial behavior:

- Method/property names get snake_case aliases.
- Parameter names remain whatever the correctness plan emits, including
  `from_` for keywords and current camelCase labels such as `canvasPosition`.

Future optional behavior:

- Generate keyword-only `**kwargs` adapter aliases that accept snake_case
  parameter names and translate them to canonical names.
- Only do this after deciding how strict the generated API should be about
  unexpected or duplicate keyword arguments.

### Name Derivation

Use a deterministic Swift/camelCase to snake_case converter:

- `insertProtobufImage` -> `insert_protobuf_image`
- `canvasSettings` -> `canvas_settings`
- `URLValue` -> `url_value`
- `HTMLParserMode` -> `html_parser_mode`
- `_Unstable_ArtworkClassification` remains class-level naming and is out of
  scope unless class aliases are explicitly added later.

The converter must be shared by all Python generator paths that create aliases.

### Collision Policy

Before emitting aliases for a class, compute every generated member name in
that class:

- canonical method names,
- canonical property names,
- generated helper names,
- proposed snake_case aliases.

If a proposed alias collides with an existing canonical member or another
alias, do not silently overwrite.

Preferred behavior:

1. Omit only the colliding alias.
2. Emit a FishyJoes generation warning naming the class, canonical member, and
   skipped alias.
3. Add a generated source comment near the canonical member explaining the
   alias was skipped due to collision.

Failing generation is stricter, but likely too disruptive for large existing
libraries with real-world naming collisions. Warnings plus no overwrite preserve
correctness while still adding aliases wherever safe.

## Red/Green TDD Plan

### Step 1: Method Alias Generation

**Red:** Add a generator test for a method named `insertProtobufImage`. Assert
the generated Python contains both `insertProtobufImage` and
`insert_protobuf_image`, and that the alias body forwards to the canonical
method.

**Green:** Implement snake_case alias derivation and method alias rendering in
the Python class emitter.

**Verify:** Run the focused FishyJoesCore test.

### Step 2: Property Alias Generation

**Red:** Add generator tests for read-only and settable properties. Assert
snake_case properties forward to the canonical properties and setters.

**Green:** Add property alias rendering with no duplicate IOTA calls.

**Verify:** Run Python generator tests.

### Step 3: Collision Handling

**Red:** Add a fixture with two members whose snake_case aliases would collide,
for example `fooBar` and `foo_bar`. Assert the canonical members remain and the
colliding alias is skipped with a diagnostic.

**Green:** Add per-class alias collision analysis and warning emission.

**Verify:** Run generator tests and inspect the warning text.

### Step 4: Real Runtime Integration

**Red:** Add a TestAPI Python integration test that calls the same real Swift
method through both spellings and asserts the same observable result.

**Green:** Regenerate TestAPI Python bindings and run the real Python
integration suite.

**Verify:** No fakes or mocks. The test must load the real IOTA runtime and
call real generated bindings.

### Step 5: External Library Validation

After TestAPI passes, rerun a clean real-library flow such as CriCanvas or
CriGeo and verify:

```bash
FISHYJOES=1 swift run -- fishy-joes --python generate build test
```

Then run a small import/use script that exercises both spellings for at least
one generated class.

## Documentation Updates

Update generated Python README/template text to describe:

- camelCase names are preserved for Swift parity,
- snake_case aliases are generated where they do not collide,
- keyword labels use the trailing underscore convention, e.g. `from_`,
- aliases are forwarding wrappers over the canonical generated API.

## Implementation Notes

- Likely code areas:
  - `Sources/FishyJoesCore/Unparse/PythonClass.swift`
  - `Sources/FishyJoesCore/Unparse/PythonProductClass.swift`
  - `Sources/FishyJoesCore/Translators/PythonTranslator.swift`
  - generated Python README template under
    `Sources/FishyJoesExecute/Resources/bindings-template/python/`
- Reuse the identifier sanitizer from the correctness plan.
- Keep alias generation source-level only. Runtime registration should not know
  about aliases.
- Forward using keyword arguments in alias bodies to make parameter mapping
  explicit and robust after keyword sanitization.

## Definition of Done

- Existing camelCase generated Python remains usable.
- Safe snake_case aliases are generated for public methods and properties.
- Alias bodies forward to canonical members and do not call IOTA symbols
  directly.
- Collisions are handled deterministically without overwriting members.
- Real-runtime integration tests prove both spellings work.
- Clean external-library Python flow still passes compileall, Ruff, mypy, and
  unittest after the correctness plan has landed.
