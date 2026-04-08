# Status

[![Build & test](https://github.com/cricut/FishyJoes/actions/workflows/unit-tests.yaml/badge.svg?branch=main)](https://github.com/cricut/FishyJoes/actions/workflows/unit-tests.yaml)
[![Integration tests](https://github.com/cricut/FishyJoes/actions/workflows/integration-tests.yaml/badge.svg?branch=main)](https://github.com/cricut/FishyJoes/actions/workflows/integration-tests.yaml)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=cricut_FishyJoes&metric=coverage&token=79e3bcd46a5eb309f9f0b2e8a5214fce0ce9bcb7)](https://sonarcloud.io/summary/new_code?id=cricut_FishyJoes)

# Description

Bindings generator for Swift library code so it can be called from TypeScript, Kotlin, C#, and Dart.

[What FishyJoes Can and Cannot Do](documentation/cans-and-cannots.md)

# Getting Started

[FishyJoes Hello World](https://github.com/cricut/FishyJoes/blob/main/documentation/FishyJoes%20Hello%20World.txt)

# Export Annotations

Bindings are only generated for types which have been annotated for export. Examples of exports are given below:

```swift
// Export a Swift named type for use in foreign languages
// The way that type is expressed based on the Swift type (class, struct, enum, protocol)
// * Class types are exported by-reference, with the foreign type only storing a pointer to the Swift instance
// * Structure types are exported member-wise, the foreign type storing copies of the Swift instance stored properties
// * Enumeration types are exported case-wise, with cases defined in an outer type in the foreign language
// * Protocol types cannot be exported directly, but a type implementing a protocol may be exported
/// <!-- FishyJoes.export(DesiredForeignTypeNameForClass) -->
public class SomeClassType { /* properties or methods that should also be available must be exported individually */ }
/// <!-- FishyJoes.export(DesiredForeignTypeNameForStruct) -->
public struct SomeStructType { /* must have a public initializer taking all stored properties as parameters */ }
/// <!-- FishyJoes.export(DesiredForeignTypeNameForEnum) -->
public enum SomeEnumType { /* cases are exported, but properties or methods must be exported individually */ }

// Export a structure type (or enum type) by reference, stored properties must be exported individually
/// <!-- FishyJoes.exportReference(DesiredForeignTypeName) -->
public struct SomeSwiftType {
    // Export a property of a type (the type of the property must also be exported)
    /// <!-- FishyJoes.export(desiredForeignPropertyName) -->
    public someProperty: SomeOtherSwiftType

    // Export an initializer of a type (creates a type-level method on the foreign type)
    /// <!-- FishyJoes.export(desiredForeignTypeLevelMethodName) -->
    public init(parameter: SomeOtherSwiftType) { \* ... *\ }

    // Export a method of a type (the types of the parameters & return type must also be exported)
    /// <!-- FishyJoes.export(desiredForeignMethodName) -->
    public func someMethod(parameter: SomeOtherSwiftType) -> YetAnotherSwiftType { \* ... *\ }

    // Export a method that uses a generic, which requires mapping the generic to a concrete type in order to export it
    /// <!-- FishyJoes.export(someGenericMethod, generic: [G: [SomeConcreteSwiftTypeSatisfyingG]) -->
    public func someGenericMethod<G: Generic>(parameter: G) { \* ... *\ }

    // Export a method, then add parameters with defaults later, without breaking interface
    /// <!-- FishyJoes.export(someMethodThatChanges, compatibilityOrder: [newParameterTwo]) -->
    public func someMethodThatChanges(parameterOne: Int, newParameterTwo: SomeOtherSwiftType? = nil) { \* ... *\ }

    // Export a method omitting one or more parameters that have default values from the foreign interface
    /// <!-- FishyJoes.export(someMethodWithOptionals, omitParameters: [someDefaultedParameter]) -->
    public func someMethodWithOptionals(parameter: SomeOtherSwiftType someDefaultedParameter: Int? = nil) { \* ... *\ }

    // Export a method overriding a method of a base type, annotating it as such in languages that support it
    /// <!-- FishyJoes.export(someExistingMethod, isOverride) -->
    public func someExistingMethod() { \* ... *\ }

    // Export a method that never returns, annotating it as such in languages that support it
    /// <!-- FishyJoes.export(kill, noReturn) -->
    public func kill() { fatalError("Process killed") }

    // Export a method with a different name for C# than other foreign languages
    // The annotation can also be used on property and type exports
    // This example would export as "AbcMethod" in C# without the annotation, following C# capitalization rules
    /// <!-- FishyJoes.export(abcMethod, cSharp: ABCMethod) -->
    public func abcMethod() { \* ... *\ }
}
```

## How to run on Windows (you can't generate code on Windows, but you can build and test)

0. Install VS with x64 tools:
```powershell
winget install --id Microsoft.VisualStudio.2022.Professional --exact --force --custom "--add Microsoft.VisualStudio.Component.Windows11SDK.22000 --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64"
```

1. Install swift
```powershell
winget install --id Swift.Toolchain --exact --force --architecture x64
```

2. Authenticate with github
```powershell
winget install --id GitHub.cli
gh auth login
```

3. (Optional) If building Bifrost, install vcpkg and openssl

In powershell:
```powershell
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg; .\bootstrap-vcpkg.bat; [Environment]::SetEnvironmentVariable("VCPKG_ROOT", $PWD, "User")

# (relaunch shell)

& "$env:VCPKG_ROOT\vcpkg.exe" install openssl:x64-windows-static
```

4. In "x64 Native Tools Command Prompt"
```
swift build
```

### Install Flutter version 3.19.4 x64, which comes with Dart 3.3.2
https://docs.flutter.dev/release/archive

### Install dotnet version 6.0
https://github.com/dotnet/core/blob/main/release-notes/6.0/README.md

Add `c:\Program Files\dotnet\x64` to PATH environment variable

Note: you may have to edit the c-sharp\*.sln file to use `Debug|x64` instead of `Debug|Any CPU` for it to work in the x64 native tools command prompt.

### Install Android Studio Jellyfish 2023.3.1
https://developer.android.com/studio/releases/past-releases/as-jellyfish-release-notes#android-studio-jellyfish-|-2023.3.1-patch-2-and-agp-8.4.2-june-2024

### install nvm-windows

install and select same node version as specified elsewhere with nvm

Make a ~/.npmrc file (~ is `C:\Users\<yourUserName>`). It should be in this format (fill in your github personal access token):

@cricut-plugin:registry=https://cricut.myget.org/F/cricut/npm/
always-auth=true
registry=https://registry.npmjs.org/
@cricut:registry=https://npm.pkg.github.com/
//npm.pkg.github.com/:_authToken=<put your github personal auth token here>
//registry.npmjs.org/:_authToken=<put your npm token here>

### Build fishy joes runtimes
bash .\scripts\compile-node-runtime.sh
bash .\scripts\compile-iota-runtime.sh
bash .\scripts\compile-kotlin-native-runtime.sh
cd kotlin-runtime
.\gradlew publishToMavenLocal

(you must build runtimes first before you can run tests in integration-tests\TestAPI-bindings)

### Run fishy joes
Now you should be able to run `swift run fishy-joes build test --node-js --dart --c-sharp --kotlin-fast --debug` as usual in the integration-tests\TestAPI-bindings directory.

## License

Copyright 2026 Cricut, Inc. and the Cricut project contributors. Licensed under
[Apache License v2.0](http://www.apache.org/licenses/LICENSE-2.0) and the
[Contributor License Agreement](CONTRIBUTOR-AGREEMENT.md)
