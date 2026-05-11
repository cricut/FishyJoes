# Status

[![Build & test](https://github.com/cricut/FishyJoes/actions/workflows/unit-tests.yaml/badge.svg?branch=main)](https://github.com/cricut/FishyJoes/actions/workflows/unit-tests.yaml)
[![Integration tests](https://github.com/cricut/FishyJoes/actions/workflows/integration-tests.yaml/badge.svg?branch=main)](https://github.com/cricut/FishyJoes/actions/workflows/integration-tests.yaml)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=cricut_FishyJoes&metric=coverage&token=79e3bcd46a5eb309f9f0b2e8a5214fce0ce9bcb7)](https://sonarcloud.io/summary/new_code?id=cricut_FishyJoes)

Maintainer: Cricut Inc. (Front-end Enablement Team)

# Description

Bindings generator for Swift library code so it can be called from TypeScript, Kotlin, C#, and Dart.

[What FishyJoes Can and Cannot Do](documentation/cans-and-cannots.md)

# Getting Started

TODO: EmojiExplorer example

A system is set up if running the following command succeeds when run in the same directory as Package.swift: 

`swift run fishy-joes generate build test --wasm --kotlin-fast --c-sharp --dart --debug`

# Export Annotations

Bindings are only generated for Swift types which have been annotated for export. Examples of exports are given below:

```swift
// Export a Swift named type for use in foreign languages
//
// The way the type is expressed is based on the Swift type (class, struct, enum, protocol)
// * Class types are exported by-reference; foreign type only stores a Swift instance pointer
// * Structure types are exported member-wise; foreign type stores copies of stored properties
// * Enumeration types are exported case-wise; foreign outer type defines each case
// * Protocol types are exported using a compatible foreign language mechanism

/// <!-- FishyJoes.export(DesiredForeignTypeNameForClass) -->
public class SomeClassType { /* properties or methods must be exported individually */ }

/// <!-- FishyJoes.export(DesiredForeignTypeNameForStruct) -->
public struct SomeStructType { /* needs a public initializer taking all stored properties */ }

/// <!-- FishyJoes.export(DesiredForeignTypeNameForEnum) -->
public enum SomeEnumType { /* cases are exported; methods must be exported individually */ }

/// <!-- FishyJoes.export(DesiredForeignTypeNameForProtocol) -->
public protocol SomeProtocolType { /* defined properties & methods appear in foreign type */ }

// Export a value type by reference; stored properties & methods must be exported individually
/// <!-- FishyJoes.exportReference(DesiredForeignTypeName) -->
public struct SomeSwiftType {
    // Export a property of a type (the type of the property must also be exported)
    /// <!-- FishyJoes.export(desiredForeignPropertyName) -->
    public someProperty: SomeOtherSwiftType

    // Export an initializer of a type (creates a type-level method on the foreign type)
    /// <!-- FishyJoes.export(desiredForeignTypeLevelMethodName) -->
    public init(parameter: SomeOtherSwiftType) { /* ... */ }

    // Export a method of a type (types of the parameters & return type must also be exported)
    /// <!-- FishyJoes.export(desiredForeignMethodName) -->
    public func someMethod(parameter: SomeOtherSwiftType) -> YetAnotherSwiftType { /* ... */ }

    // Export a method that uses a generic, which requires mapping the generic to a type
    /// <!-- FishyJoes.export(someGenericMethod, generic: [G: [SomeTypeSatisfyingG]) -->
    public func someGenericMethod<G: Generic>(parameter: G) { /* ... */ }

    // Export a method, then add parameters with defaults later, without breaking interface
    /// <!-- FishyJoes.export(someMethodThatChanges, compatibilityOrder: [newParamTwo]) -->
    public func someMethodThatChanges(paramOne: Int, newParamTwo: SomeOtherSwiftType? = nil) {}

    // Export a method omitting one or more parameters that have default values
    /// <!-- FishyJoes.export(someMethodWithOptionals, omitParameters: [defaultedParam]) -->
    public func someMethodWithOptionals(param: Int, defaultedParam: Int? = nil) { /* ... */ }

    // Export a method overriding a method of a base type; annotates it in the foreign language
    /// <!-- FishyJoes.export(someExistingMethod, isOverride) -->
    public func someExistingMethod() { /* ... */ }

    // Export a method that never returns, annotating it as such in languages that support it
    /// <!-- FishyJoes.export(kill, noReturn) -->
    public func kill() { fatalError("Process killed") }

    // Export a method with a different name for C# than other foreign languages
    // The annotation can also be used on property and type exports
    // This example would export as "AbcMethod" in C# without the annotation
    /// <!-- FishyJoes.export(abcMethod, cSharp: ABCMethod) -->
    public func abcMethod() { /* ... */ }
}
```

## License

Copyright 2026 Cricut, Inc. and the Cricut project contributors. Licensed under
[Apache License v2.0](http://www.apache.org/licenses/LICENSE-2.0) and the
[Contributor License Agreement](CONTRIBUTOR-AGREEMENT.md)
