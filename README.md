<p align="center"><img src="documentation/logo.png" alt="FishyJoes" width="265" height="265"/></p>

# Status

[![Build & test](https://github.com/cricut/FishyJoes/actions/workflows/unit-tests.yaml/badge.svg?branch=main)](https://github.com/cricut/FishyJoes/actions/workflows/unit-tests.yaml)
[![Integration tests](https://github.com/cricut/FishyJoes/actions/workflows/integration-tests.yaml/badge.svg?branch=main)](https://github.com/cricut/FishyJoes/actions/workflows/integration-tests.yaml)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=cricut_FishyJoes&metric=coverage&token=79e3bcd46a5eb309f9f0b2e8a5214fce0ce9bcb7)](https://sonarcloud.io/summary/new_code?id=cricut_FishyJoes)

# Maintainer

Client Enablement

# Description

Generates bindings for (some) swift library code that can be called from TypeScript and Kotlin.

# Installing Dependencies on MacOS

The recommended way to ensure you have everything you will need for any FishyJoes project is to check that you can generate and build CriGeo-bindings:

[Everything Needed To Generate And Compile (CriGeo-bindings)](https://github.com/cricut/CriGeo-bindings/blob/main/EverythingNeededToGenerateAndCompile.md)

# FAQ
1. [What FishyJoes Can and Cannot Do](documentation/cans-and-cannots.md)
2. Was that a question?
   **No, but it was frequently asked**
3. What annotations can be made to Swift code to mark it for FishyJoes to process?
```
// Export a type member-wise, including all its properties (used for simple data objects, data lives on foreign side)
/// <!-- FishyJoes.export(DesiredForeignTypeName) -->
public struct SomeSwiftType { /* must have a public initializer taking all stored properties as parameters */ }

// Export a type by reference, properties must be exported individually (foreign side type only has a single pointer)
/// <!-- FishyJoes.exportReference(DesiredForeignTypeName) -->
public struct SomeSwiftType {
    // Export a property of a type (the type of the property must also be exported)
    /// <!-- FishyJoes.export(desiredForeignPropertyName) -->
    public someProperty: SomeOtherSwiftType

    // Export a method of a type (the types of the parameters & return type must also be exported)
    /// <!-- FishyJoes.export(desiredForeignMethodName) -->
    public func someMethod(parameter: SomeOtherSwiftType) -> YetAnotherSwiftType { \* ... *\ }

    // Export an initializer of a type (creates a type-level method on the foreign type)
    /// <!-- FishyJoes.export(desiredForeignTypeLevelMethodName) -->
    public init(parameter: SomeOtherSwiftType) { \* ... *\ }

    // Export a method that uses a generic, which requires mapping the generic to a concrete type in order to export it
    /// <!-- FishyJoes.export(someGenericMethod, generic: [G: [SomeConcreteSwiftTypeSatisfyingG]) -->
    public func someGenericMethod<G: Generic>(parameter: G) { \* ... *\ }

    // Export a method omitting one or more parameters that have default values from the foreign interface
    /// <!-- FishyJoes.export(someMethodWithOptionals, omitParameters: [someDefaultedParameter]) -->
    public func someMethodWithOptionals(parameter: SomeOtherSwiftType someDefaultedParameter: Int? = nil) { \* ... *\ }

    // Export a method, then add parameters with defaults later, without breaking interface
    /// <!-- FishyJoes.export(someMethodThatChanges, compatibilityOrder: [newParameterTwo]) -->
    public func someMethodThatChanges(parameterOne: Int, newParameterTwo: SomeOtherSwiftType? = nil) { \* ... *\ }
}

```

# Overview

## Pretty pictures

[![Generation process](https://lucid.app/publicSegments/view/eaa9f26a-fbab-4b07-856d-dbcfb5722eec/image.png)](https://lucid.app/lucidchart/cac16522-9201-4b7d-9c23-1ad5bc83c8b5/edit)

[![FishyJoesCore](https://lucid.app/publicSegments/view/8d45425b-0134-4142-adb0-ac1bf4c0d50f/image.png)](https://lucid.app/lucidchart/cac16522-9201-4b7d-9c23-1ad5bc83c8b5/edit)

## Updating fishyjoes in a bindings repo

Update `fishyJoesVersion` in Package.swift.

To see if there are difference in how FishyJoes expects the bindings repository to be structured, commit/stash any changes and run
```
swift run fishy-joes package-init
git diff
```

These are recommendations only, take or leave the changes.

## Updating exported library

0. Update version in Package.swift

1. `swift run fishy-joes generate`

2. (optional) Test locally. See pre-requisites in next section, then

```
swift run fishy-joes build test --wasm --nodejs --kotlin-fast
```

## Starting a new bindings repo

0. prerequesites (macOS):

   (See section "Installing Dependencies on MacOS" above)

   Install mint: `brew install mint`

   Note: Mint is a package manager that installs and runs Swift command line tool packages

2. Optional, if need to test on android emulators/devices) Install Docker:

   1. `brew install rancher`
   2. create missing folder on macOS: `sudo mkdir -p /private/etc/sudoers.d`
   3. open "Rancher Desktop.app"
   4. click "accept"
   5. enter password to finish install
   6. authenticate with your github PAT: `nerdctl login ghcr.io`

3. In a new git repository, named `YourAwesomeLibrary-bindings`:
```
mint run --executable fishy-joes cricut/FishyJoes package-init
```
Fill in a few details about the swift target and bindings repo when asked

3. Annotate swift source symbols that you want exported. e.g.
```swift
/// <!-- FishyJoes.exportReference(Foo) -->
public struct Foo {
   ...

   /// <!-- FishyJoes.export(bazFrom) -->
   func baz(from:)
}
```

4. Modify/create the test files at `node-test/*.test.ts` to exercise your library in typescript

5. generate, build and test!
`swift run fishy-joes --wasm --nodejs generate build test`

6. Modify and probably rename the test files in `kotlin/src/test/**/*.kt` to exercise your library in kotlin

7. generate, build and test!
`swift run fishy-joes --kotlin-fast generate build test`

8. Publish!




[Tutorial by Matt](https://cricut.sharepoint.com/:v:/r/sites/softwareteam/Shared%20Documents/Team-Enablement-Client/Cross-Platform%20Code%20Introduction.mp4?csf=1&web=1&e=vSEVMc)
