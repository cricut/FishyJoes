# Python Keyword Identifier Plan

## Problem

The clean CriCanvas `3.12.2` Python flow generates bindings and builds the
native dylibs, then fails at `python3 -m compileall` because Swift parameter
labels are emitted directly as Python parameter identifiers.

Observed in
`/private/tmp/cricanvas-fishyjoes-checks/python-latest/bindings/python/generated/src/cricut_cricanvas/CanvasState.py`:

```python
def insertProtobufImage(self, from: builtins.bytes, ...) -> GraphicInsertResult:
```

`from` is a Python keyword, so the generated file is syntactically invalid.
A quick scan found four generated methods in `CanvasState.py` with the same
problem:

- `insertProtobufImage`
- `insertProtobufGraphic`
- `insertProtobufGraphicFromIndex`
- `insertProtobufImageFromIndex`

## Goal

Generated Python must never emit invalid Python identifiers for parameters,
locals, method names, fields, class aliases, or module-level names. Swift names
that collide with Python keywords must be sanitized deterministically while
preserving the underlying Swift/IOTA symbol names and call ordering.

For the CriCanvas failure, the generated signature should use a valid Python
identifier such as `from_`, and the emitted runtime call should pass that same
sanitized variable to the original IOTA symbol:

```python
def insertProtobufImage(self, from_: builtins.bytes, ...) -> GraphicInsertResult:
    return _get_runtime().call_symbol(
        "__iota_CriCanvas_CanvasState_insertProtobufImage",
        "object",
        ("object", self),
        ("object", from_),
        ...
    )
```

## Non-Goals

- Do not rename Swift symbols or generated IOTA setup names.
- Do not edit generated Python files directly.
- Do not change public Swift annotations to avoid Python keywords. The
  generator must handle valid Swift APIs that are not valid Python APIs.
- Do not delete or weaken existing Python tests.

## Proposed Design

Add a single Python identifier sanitizer in FishyJoesCore and require every
Python emitter path to use it for Python source identifiers.

Rules:

1. If a name is a Python keyword, append `_`.
2. If a name is a Python soft keyword that is unsafe in the target syntactic
   position, append `_`.
3. If a name is not a valid Python identifier, normalize it to a valid
   identifier using the existing project naming conventions.
4. If sanitization creates a collision inside the same scope, append a stable
   numeric suffix such as `_2`, `_3`.
5. Keep the original Swift/API label in documentation text and symbol metadata;
   only Python source identifiers are sanitized.

Prefer a small utility on or near `PythonClass`, for example:

```swift
struct PythonIdentifier {
    static func sourceName(_ raw: String, used: inout Set<String>) -> String
}
```

Each `PythonClass.Method.Parameter` should retain both:

- the original Swift label/native name used for docs and IOTA ordering,
- the sanitized Python source identifier used in signatures and method bodies.

This avoids re-sanitizing at each render site and makes it harder for a
signature and call body to drift.

## Red/Green TDD Plan

### Step 1: Unit Regression for Keyword Parameters

**Red:** Add a generator test with a Swift-exported method whose parameter
label is `from`. Assert the generated Python fragment parses with `ast.parse`
and contains `from_`, not `from`, in the Python signature and call body.
Today this fails with invalid syntax.

**Green:** Add the identifier sanitizer and apply it to
`PythonTranslator.python(method:of:context:)` when constructing
`PythonClass.Method.Parameter`.

**Verify:** Run the focused Swift generator test.

### Step 2: Preserve IOTA Symbol Routing

**Red:** Extend the test to assert the generated call still invokes the
original IOTA symbol and preserves parameter order. The emitted Python variable
name may be `from_`, but the symbol remains
`__iota_<Module>_<Type>_<Method>`.

**Green:** Ensure `PythonProductClass` renders call arguments from the
sanitized source identifier while keeping `method.nativeName` and the
translated FFI metadata unchanged.

**Verify:** Run Python generator tests.

### Step 3: Scope Collision Handling

**Red:** Add a fixture with parameters that would collide after sanitization,
for example `from` and `from_`. Assert the emitted signature is deterministic
and valid, such as `from_` and `from_2`.

**Green:** Track used names per method parameter list and assign stable
deduplicated identifiers.

**Verify:** Run generator tests and `ast.parse` validation.

### Step 4: Broaden Identifier Coverage

**Red:** Add checks for other Python-emitted source identifiers that can come
from Swift names:

- stored dataclass fields,
- computed property accessors,
- enum case helpers,
- protocol witness parameters,
- callback parameter locals if generated.

Only add cases that map to real Python source identifiers; doc-only labels do
not need sanitization.

**Green:** Route each emitter path through the shared sanitizer.

**Verify:** Run the full FishyJoesCore test suite.

### Step 5: Full Clean Integration

**Red:** Rerun the clean CriCanvas `3.12.2` Python flow against current
FishyJoes. It should previously fail at `compileall` on `from`.

**Green:** Rerun the same flow after the fix:

```bash
FISHYJOES=1 \
swift run --disable-sandbox --manifest-cache local -- \
  fishy-joes --python generate build test
```

**Verify:** Confirm `compileall` passes. Then continue through Ruff, mypy, and
real-runtime unittest. Any later failures should be recorded separately with
exact output after the syntax issue is fixed.

## Implementation Notes

- Likely code areas:
  - `Sources/FishyJoesCore/Translators/PythonTranslator.swift`
  - `Sources/FishyJoesCore/Unparse/PythonClass.swift`
  - `Sources/FishyJoesCore/Unparse/PythonProductClass.swift`
  - Python generator tests under `Tests/FishyJoesCoreTests/`
- Use Swift's data model to carry original and sanitized names. Avoid
  post-processing generated source text.
- Use Python's keyword set as data in Swift. Include current hard keywords:
  `False`, `None`, `True`, `and`, `as`, `assert`, `async`, `await`, `break`,
  `class`, `continue`, `def`, `del`, `elif`, `else`, `except`, `finally`,
  `for`, `from`, `global`, `if`, `import`, `in`, `is`, `lambda`, `nonlocal`,
  `not`, `or`, `pass`, `raise`, `return`, `try`, `while`, `with`, `yield`.
- Consider `match`, `case`, and `_` as soft-keyword/grammar-sensitive names.
  They may be valid in some positions, but sanitizing them everywhere is
  simpler and avoids future grammar surprises.
- Keep `builtins.<type>` qualification unchanged; this plan concerns source
  identifiers, not annotation type names.

## Definition of Done

- New red tests fail before implementation and pass after it.
- Generated Python for keyword parameters is syntactically valid.
- Sanitized Python identifiers are used consistently in signatures, bodies,
  dataclass fields, property methods, and helper locals.
- IOTA symbol names, setup names, and argument ordering remain unchanged.
- Clean CriCanvas `3.12.2` Python flow advances past `compileall`.
- No generated Python files are edited by hand.
