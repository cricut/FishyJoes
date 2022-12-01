<p align="center"><img src="logo.png" alt="FishyJoes" width="132" height="132"/></p>

# FishyJoes Cans and Cannots

FishyJoes exposes a subset of swift interfaces to several other languages. This is an incomplete subset for 3 primary reasons:

1. No one has asked for it yet
2. It is not equally-representable in all languages
3. Andrew (or someone else :slightly_smiling_face:) hasn't gotten around to it yet

## Standard Types
 - :white_check_mark: Void, Int, UInt, Int64, Float, Double, String, etc.
 - :white_check_mark: tuples (named and unnamed)
 - :white_check_mark: `Data`
 - :white_check_mark: `Optional<T>`
 - :white_check_mark: `Result<T, Error>`
 - :white_check_mark: `Array<T>`
 - :white_check_mark: `Dictionary<K, V>`
 - :white_check_mark: `Set<T>`
 - Functions
    - :white_check_mark: throwing functions
    - :x: non-throwing functions
        (most languages don't have a distinction, and exceptions can be thrown anywhere)
    - :construction: async functions

## User defined types
 - :white_check_mark: Enums
   - :white_check_mark: Empty enums (exported as namespaces, usually)
   - :warning: Unnamed associated values (e.g. `case foo(Int, String)`) may look odd in other languages, and be named `foo._0`, `foo._1`
 - :white_check_mark: Structs
   - :white_check_mark: :exclamation: Default export requires struct is "Plain Old Data" (POD), meaning:
     1. Every stored variable must be public
     2. There must be a public constructor that accepts every stored field as arguments
        - (For now, these need to be named arguments occuring in the same order as the variables are declared in the struct)
   - :white_check_mark: **OR** the struct should be exported by reference:
     ```swift
     /// <!-- FishyJoes.exportReference(Thingy) -->
     public struct Thingy { ... }
     ```
 - :white_check_mark: Classes
   - :x: Inheritance I think? Never tested it, probably broken.
 - :x: Typealiases
    Maybe in the future? They work differently in different languages...
 - Generics
   - :x: Most generic types
   - :white_check_mark: Exceptions to the rule:
     - previously mentioned Optional, Result, Array, Dictionary, Set
     - exported methods may be generic as long as the generic is only exported with 1 concrete type. e.g.:
       ```swift
       /// <!-- FishyJoes.export(processCollection, generic: [C: [Int], S: String]) -->
       public func process<C: Collection, S: StringProtocol>(collection: C, name: S)
        where C.Element == Int
       ```
 - :x: Associated Types
   - Most languages don't even have these

 - :x: Protocols
   - Partial support was implemented, but never merged. Will probably implement in the future

 - :construction: Actors

## Methods
 - :white_check_mark: static methods on all types
 - :white_check_mark: instance methods on all types
 - :white_check_mark: getters and setters
 - Extensions
   - :white_check_mark: extensions to types defined in the same library
   - :x: extensions to standard library types
   - :x: extensions to types defined in a dependency
 - optional arguments
   - :white_check_mark: (most) int and double literals
   - :white_check_mark: nil
   - :white_check_mark: named, non-positional arguments
   - :x: enum cases
      Prefer using `x: TheEnum? = nil` over `x: TheEnum = .foo`

 - :x: Top level methods
 - :construction: Async

## Misc
 - :white_check_mark: documentation comments
    - :x: cross-references within the comments
 - :white_check_mark: deprecations

## WASM things
 - :white_check_mark: Swift, C, C++
 - :x: Using the file system
 - :exclamation: C libraries that use setjmp. It can be handled, but it's a huge pain. See CTextFreestack.
 - :x: Threads. Possibly emscripten could help here. Unresearched.
 - :x: Interoperation between sibling FishyJoes libraries.
   No dynamic linking in WASM yet.
