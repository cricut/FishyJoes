# 0004. Python String Exchange Uses UTF-8 Iota Setup

## Status

Proposed / Implemented

## Context

The current Iota string setup exchanges UTF-16 code units. That works for some
hosts, but Python's native string and bytes boundary is better served by UTF-8.

Python `str` values are Unicode text, not UTF-8 byte arrays internally. However,
Python's normal C/library boundary is bytes-oriented: encode a `str` to
`bytes`, pass a `char *` plus byte length, then decode returned bytes back to
`str`. cffi also maps this style naturally.

The existing UTF-16 Iota setup would force Python to treat strings as arrays of
16-bit code units. Python would need to encode outgoing text as UTF-16, account
for byte order and code-unit counts, pass a `uint16_t` buffer, then decode
incoming `uint16_t` buffers back to `str`. Characters outside the Basic
Multilingual Plane become surrogate pairs in UTF-16, so "number of Python
characters" and "number of UTF-16 code units" diverge. That is manageable, but
it is not the natural Python boundary and creates extra conversion code.

The Python target should avoid unnecessary UTF-16 conversion without replacing
the existing string setup used by other Iota hosts.

## Options Considered

- Reuse the existing UTF-16 setup.
  This avoids any Swift runtime change, but it forces Python through a less
  natural representation. Python would need explicit UTF-16 encode/decode
  helpers, byte-order handling, code-unit length accounting, and surrogate-pair
  test coverage.
- Add a UTF-8 setup variant for Python and future hosts.
  This is a small Swift runtime addition and better matches Python's boundary
  with C libraries: Python passes UTF-8 bytes plus byte length, and decodes
  returned UTF-8 bytes into `str`.
- Replace the existing string setup with UTF-8.
  This simplifies the runtime surface long term, but it risks breaking existing
  hosts and should not be coupled to adding Python.
- Use Python object references for strings.
  This would avoid byte conversion in some cases, but it would make Swift string
  conversion depend more heavily on Python object callbacks.

## Decision

Add a shared Iota runtime setup variant named `Swift_String_utf8_setup`.

Python will use the UTF-8 setup path for normal `str` exchange. The existing
UTF-16 setup remains available for existing host runtimes.

## Tradeoffs

The Iota runtime will have two string setup paths.

The Python runtime must still test Unicode boundaries carefully because UTF-8
byte length and Python character length are not the same concept.

The UTF-8 setup still requires explicit length handling. The runtime must never
assume null-terminated strings, because Swift strings and Python strings can both
contain embedded null characters.

Keeping UTF-16 preserves compatibility but leaves some duplicated string setup
logic in the shared runtime.

## Consequences

Python string conversion can be implemented with fewer host-side encoding
steps.

Outgoing Python strings use `value.encode("utf-8")` and pass the resulting byte
buffer and byte count to Swift. Incoming Swift strings use a UTF-8 byte buffer
from Swift and decode it with `bytes.decode("utf-8")`.

The Swift runtime change is small, isolated, and backward compatible.

### Invalid UTF-8 is a hard error

A Python `str` can contain lone surrogate code points (for example `"\ud800"`)
that have no valid UTF-8 encoding. Such a value cannot cross the boundary. The
runtime rejects it explicitly: encoding an outgoing string raises a clear
`ValueError` ("String is not valid UTF-8 and cannot cross the FishyJoes
boundary: ...") rather than surfacing an opaque codec error, silently replacing
the scalar (`errors="replace"`), or passing it through (`errors="surrogatepass"`).
This keeps the boundary lossless and predictable, and matches the strict,
typed-validation philosophy used elsewhere (for example numeric range checks).
The error is raised at the string boundary and propagated to the caller; it is
not swallowed.

String tests must include ASCII, non-ASCII, emoji, combining scalars, empty
strings, and an invalid-UTF-8 (lone surrogate) value that is expected to raise.
