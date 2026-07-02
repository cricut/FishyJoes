# 0002. Python Target Uses Iota ABI

## Status

Accepted

## Context

FishyJoes targets bridge Swift and the host language in one of two shapes. In
the host-runtime shape, Swift drives the host runtime's native API: Kotlin uses
JNI and TypeScript/Node uses NAPI. In the Iota shape, the host language drives a
C ABI FFI against the shared Iota runtime model: C# and Dart bind an `Env`,
callback maps, per-type setup functions, and generated Swift `@_cdecl` shims.

Python could take either shape: CPython has a native extension API that Swift
could drive, and Python FFI libraries can drive a C ABI from the host side.
Python needs a high-quality native user experience, but it should not create a
separate Swift ABI surface for every exported method.

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

Do not introduce Python-specific exported Swift method variants. Do not port
host-runtime scaffolding (JNI/NAPI loading or external declarations) from the
Kotlin or Node targets.

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
