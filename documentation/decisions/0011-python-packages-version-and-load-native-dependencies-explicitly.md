# 0011. Python Packages Version And Load Native Dependencies Explicitly

## Status

Accepted.

## Context

Generated Python packages depend on the FishyJoes Python runtime, the generated
Python code, the Swift module dynamic library, the module Iota dynamic library,
extra dynamic libraries, and dependency-module binding packages.

If versioning and native-library loading are implicit, users can install
incompatible generated wrappers, runtimes, and dynamic libraries that fail only
at import time or during the first FFI call.

## Options Considered

- Let package managers resolve only the generated Python package version.
  This is simple, but it does not constrain the FishyJoes runtime package or
  dependency binding packages.
- Bundle every transitive native library in every wheel.
  This makes each wheel self-contained, but it risks duplicate loads, larger
  wheels, and conflicting dependency versions.
- Load native libraries from process-global search paths.
  This is easy to implement, but it is fragile and environment-dependent.
- Version every generated package against the FishyJoes runtime ABI and load
  packaged native dependencies explicitly.
  This is more work, but it makes compatibility and diagnostics much clearer.

## Decision

Each generated Python package declares:

- Its own package version, normally derived from the Swift package version.
- The FishyJoes runtime package version range it supports.
- The Iota ABI version it was generated for.
- Exact or compatible dependency binding package requirements for required
  FishyJoes modules.

Native libraries are loaded explicitly from package resources, not from ambient
process-global search paths.

For local development, FishyJoes may build dependency binding wheels from local
sibling checkouts as a substitute for a PyPI-compatible package index. That
local substitution must be treated as temporary package-index emulation:

- It builds a dependency wheel from an isolated copy of the generated package,
  not by mutating the dependency checkout's generated tree.
- It copies the dependency's freshly built native libraries into that isolated
  package copy before wheel build.
- It installs the dependency wheel through normal `pip` wheel installation so
  tests exercise the same import, metadata, native-loader, and dependency graph
  shape that a published package index would provide.
- It must not make the downstream wheel bundle dependency native libraries.
  Published packages still depend on other generated binding packages through
  normal Python package requirements.

The loader must:

- Load dependency binding packages before the current module.
- Run dependency type setup before current module type setup.
- Avoid loading the same native library identity more than once per process.
- Detect architecture, platform, Python version, Iota ABI version, and runtime
  version mismatches with clear errors.
- Keep transitive dependency handling deterministic.

Packaging tools must repair native-library references for each platform:

- macOS wheels use delocate-style dependency repair and install names based on
  package-local paths.
- Linux wheels use auditwheel only when Swift runtime and bundled library
  dependencies satisfy manylinux policy; otherwise private-index wheels must use
  tags that honestly describe the supported platform.
- Windows wheels configure DLL loading with package-local directories before
  loading generated libraries.

## Tradeoffs

Explicit version and loader metadata increases generated package metadata and
requires more tests.

Avoiding duplicate native loads can be difficult when two dependency packages
bundle the same extra dynamic library under different versions.

Strict compatibility checks may reject some combinations that would happen to
work, but that is better than silent ABI mismatches.

## Consequences

`fishy-joes code-gen --python pack` must validate wheel metadata and native
library repair for every supported platform.

Import tests must install wheels into a clean environment and verify dependency
module loading, transitive setup order, and duplicate-load prevention.

The generated package should expose diagnostic helpers that report package
version, runtime version, Iota ABI version, platform tag, and loaded native
library paths.
