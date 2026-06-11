# 0013. Python Docstrings Come From Translated Metadata

## Status

Accepted

## Context

Generated Python wrappers expose runtime-callable APIs and `.pyi` stubs, but
no documentation: `help()`, `inspect.getdoc()`, and IDE hover show nothing.
FishyJoes already captures Swift documentation comments as
`documentation: [String]` metadata on translated types, fields, methods, and
enum cases, and the C#, Dart, Kotlin, and TypeScript unparsers already emit
documentation comments from that metadata. The metadata is free-form lines;
FishyJoes does not preserve structured DocC parameter/return sections.

Export annotations (`<!-- FishyJoes.export(...) -->`) live inside the same
Swift documentation comments, so the raw metadata lines include annotation
text that is meaningful to the generator but noise to a Python user.

## Options Considered

- Parse Swift source comments ad hoc in the Python translator.
  This duplicates metadata FishyJoes already carries and can drift from the
  other targets' documentation source.
- Emit docstrings only into `.py` wrappers.
  Runtime `help()` works, but many IDEs take hover text from `.pyi` stubs
  when stubs exist, so hover would stay empty.
- Emit documentation only into `.pyi` stubs.
  IDE hover works, but runtime `help()`/`inspect.getdoc()` stay empty.
- Emit into both from one shared renderer.
  Slightly more emission code, but `.py` and `.pyi` documentation cannot
  diverge, and both runtime and editor surfaces work.
- Fabricate parameter/return documentation tables from signatures.
  Rejected: the metadata does not carry structured parameter docs; invented
  structure would be noise that can silently go stale.

## Decision

Generated Python documentation is rendered by one shared helper
(`PythonDocstring`) from the existing translated `documentation` metadata and
emitted into both the generated `.py` wrappers and the generated `.pyi`
stubs.

The renderer:

- excludes export-annotation lines (`<!-- ... -->`) from docstrings;
- escapes backslashes and triple quotes so generated docstrings cannot break
  the surrounding file;
- emits nothing when a declaration carries only annotation lines, so
  undocumented API does not grow fabricated docstrings;
- preserves the metadata's free-form lines without inventing structure.

Documentation is emitted where Python can attach it at runtime: module
classes, methods, instance property getters, and static methods. Class-level
descriptor attributes (lazy static properties) cannot carry runtime
docstrings; their documentation appears in the `.pyi` stubs only.

## Tradeoffs

- Generated wrappers grow in size by the emitted docstrings. This is
  documentation users actually see; size impact on wheels is negligible.
- Free-form lines only: no structured parameter/return rendering until
  FishyJoes preserves that structure from DocC.
- Static-property documentation is editor-visible (stubs) but only partially
  runtime-visible, a consequence of the descriptor-based wrapper design.

## Consequences

- A wheel recipient can discover documented API behavior through `help()`,
  `inspect.getdoc()`, and IDE hover without access to Swift source or DocC.
- Swift documentation comments become the single source for Python docs,
  matching how the other language targets already consume the metadata.
- Generated output remains deterministic; docstring emission is a pure
  function of the translated metadata.
