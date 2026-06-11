# 0007. Python Bindings Ship As Platform Wheels

## Status

Proposed / Implemented

## Context

Generated Python bindings contain pure Python wrapper code, cffi declarations,
and native Swift dynamic libraries. A released package must let Python users
install the binding with normal Python packaging tools while still getting the
correct native libraries for their operating system and architecture.

FishyJoes already packages native libraries for C# and Dart on macOS, Linux, and
Windows. Python should follow the same native-library model rather than invent a
custom installer.

Python 3.10 is scheduled to reach end of life in 2026. The Python target should
not launch on a version that is about to fall out of support.

## Options Considered

- Publish only source distributions.
  This is simple to produce, but it would require users to have Swift, FishyJoes,
  and native build tooling available at install time.
- Publish a pure Python wheel that discovers native libraries elsewhere.
  This keeps wheels small, but it makes installation depend on environment
  variables, search paths, or a second package manager.
- Publish platform wheels that include the generated Python package and native
  libraries.
  This matches normal Python binary distribution expectations and keeps install
  commands simple.
- Publish one universal wheel containing all operating-system libraries.
  This is convenient, but it bloats every install and makes loader behavior more
  complicated.
- Use a custom post-install downloader.
  This keeps package size down, but it makes installs less reproducible and
  harder to use in locked-down build environments.
- Always prefix generated packages with `cricut`.
  This is appropriate for Cricut-owned private modules, but FishyJoes is a
  generator and should not impose Cricut branding on libraries owned by another
  organization.
- Derive package names from module metadata, with an optional organization
  prefix.
  This keeps default output usable outside Cricut while still allowing
  Cricut-owned bindings to use Cricut naming conventions.

## Decision

Released Python bindings are standard Python distributions published as wheels.

The distribution package name and import package name are generated from package
metadata, not hard-coded to Cricut.

The default distribution package name is the normalized module name, for
example `my-library`. The default import package name is the PEP 8-compatible
module name, for example `my_library`. Projects may configure an organization
prefix when they need namespace ownership or collision avoidance, for example
`cricut-my-library` distributed as `cricut_my_library`.

The generated package contains:

- Python wrapper modules.
- `_declarations.h`.
- cffi setup/binding code.
- The module dynamic library.
- The module Iota dynamic library.
- Any configured extra dynamic libraries.

The FishyJoes Python runtime is a separate distribution, for example
`fishyjoes-runtime` or an organization-prefixed equivalent chosen by the
publisher. Generated binding packages depend on the runtime instead of vendoring
it.

Packages are published to a PyPI-compatible package index selected by the
library owner. Private libraries should publish to that owner's private Python
package index. Public libraries may publish to PyPI if the source library is
intended to be public. The architecture should not depend on a specific host
such as PyPI, Artifactory, GitHub Packages, or an internal simple-index server.

The first supported interpreter is CPython 3.11. This is one minor version above
Python 3.10, the Python branch scheduled to reach end of life in 2026. Newer
CPython versions remain supported while they are within the Python upstream
support window and the binding CI verifies them.

Because the initial runtime uses cffi ABI mode and does not compile a CPython
extension module, generated binding wheels are not tied to one CPython minor
version. A generated wheel should use a Python tag such as `py3` and an ABI tag
such as `none`, with `Requires-Python: >=3.11` constraining interpreter support.
The wheel is still platform-specific because it contains Swift dynamic
libraries.

The first supported platforms are:

- macOS, with universal2 wheels where the Swift build is produced as a fat
  arm64/x86_64 binary.
- Linux, with glibc-based wheels for the architectures FishyJoes can build and
  test. Use manylinux tags only after auditwheel/Swift runtime bundling confirms
  compliance; otherwise use internal Linux wheel tags for private distribution.
- Windows, with wheels containing `.dll` artifacts produced by the Swift Windows
  toolchain.

PyPy, musllinux/Alpine, iOS, Android, and WASM are not first-tier Python binding
targets unless separate build and integration-test coverage is added.

## Tradeoffs

Platform wheels increase CI and packaging work because each operating system and
architecture needs its own build, test, and pack job.

Using cffi ABI mode avoids a per-CPython-minor wheel matrix, but it means cffi
remains a runtime dependency and generated code must avoid Python-version-
specific implementation details that would break newer CPython releases.

Bundling native libraries makes wheels larger, but it gives users a normal
`pip install` experience and avoids relying on manually configured library
paths.

If a future optimization introduces a compiled CPython extension, that extension
must either use Python's stable ABI (`abi3`) or accept a larger per-version
wheel matrix. That is not part of the initial packaging contract.

CPython-only support narrows the first release, but it avoids claiming
compatibility with interpreters that have not been tested against cffi callbacks,
Swift dynamic libraries, and FishyJoes lifetime behavior.

Private package-index publication keeps proprietary libraries out of public
registries, but consumers need index credentials and CI configuration.

Configurable names add a small amount of generator and template complexity, but
they avoid leaking one organization's naming policy into every FishyJoes user.

## Consequences

`fishy-joes code-gen --python pack` should build wheel artifacts under
`bindings/python/dist`.

Generated `pyproject.toml` should set `requires-python = ">=3.11"` and declare a
runtime dependency on the FishyJoes Python runtime package.

FishyJoes config or package metadata needs Python naming fields for distribution
name, import package name, and optional organization prefix. Generated names must
be validated against Python packaging and import-name rules.

Python build phases need platform-specific native-library installation paths and
tests that import the wheel-installed package, not only the source tree.

Compatibility claims are tied to CI: a Python version or platform is supported
only when the generated TestAPI package builds, installs, imports, and passes
integration tests there.

Wheel compatibility should be verified as one wheel per platform/architecture
against every supported CPython minor version, not as one separately built wheel
per Python minor version.
