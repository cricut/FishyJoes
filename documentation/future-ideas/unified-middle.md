# A unified runtime?

It might be possible to provide a language-agnostic base ffi that is more aware than C of concerns like objects, dynamic types, namespaces, and ownership.

Such a runtime would be written using the existing FishyJoes techniques (NodeAPI, JNI from swift, cdecl and P/Invoke for C#, etc.) but would concentrate the language differences into a smaller codebase.

Adding a feature such as protocols would still need support in all languages (swift/C#/kotlin/TS/dart), but the swift code would be the same for all. Ideally this would turn an NxM problem into an N+M problem.

## Needs
 - match swift runtime types with foreign runtime types
 - call methods on those types
 - track lifetimes of both swift and foreign objects
   - Probably use an N-API/JNI style reference scope to clean up after a function call
 - optionally log boundary crossings for debugging
 - Enforce types at runtime (This is a pain point in current iota)
 - how much reflection should be possible?
