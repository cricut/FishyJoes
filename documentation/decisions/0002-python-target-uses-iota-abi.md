# 0002. Python Target Uses Iota ABI

## Status

Accepted

## Context

FishyJoes already has the Iota ABI for non-JNI language targets. C# and Dart use
the shared Iota runtime model: an `Env`, callback maps, per-type setup
functions, and generated Swift `@_cdecl` shims.

Python needs a high-quality native user experience, but it should not create a
separate Swift ABI surface for every exported method or copy Kotlin's JNI
implementation shape.

## Options Considered

- Reuse Iota.
  This keeps Python aligned with C# and Dart, preserves the shared Swift runtime
  model, and focuses Python work on host-language runtime and generator quality.
- Copy Kotlin's JNI architecture.
  This would provide a known language target to imitate, but it would make
  Python a second non-Iota implementation and duplicate the FFI surface that
  Iota exists to centralize.
- Create Python-specific Swift `@_cdecl` exports.
  This could optimize individual Python cases, but it would fork the ABI and
  make every exported Swift feature an additional N-language maintenance burden.
- Build a brand-new shared ABI.
  This may be attractive long term, but it is larger than adding Python and
  would risk destabilizing existing C# and Dart users.

## Decision

The Python language target is an Iota target. It will reuse the existing Iota
callback-table ABI and the generated Swift Iota shims.

Python-specific work belongs in the Python runtime, generated Python wrappers,
generated cffi declarations, build phases, and small shared Iota runtime
additions that are useful across Iota hosts.

Do not introduce Python-specific exported Swift method variants. Do not port JNI
loading, JNI external declarations, or Kotlin runtime scaffolding.

## Tradeoffs

Python inherits Iota's existing shape, including setup callbacks and opaque
foreign references, even where a Python-only ABI might be simpler.

Some Python ergonomics must be created in generated wrappers and runtime helper
classes rather than by changing Swift exports.

Iota improvements must remain backward compatible with C# and Dart.

## Consequences

Python shares the same Swift-side behavior as C# and Dart.

Future Iota ABI improvements can benefit multiple host languages instead of
creating a Python-only branch of the runtime.

The Python generator must verify actual Iota symbol names and must not infer
symbols from Kotlin/JNI declarations.
