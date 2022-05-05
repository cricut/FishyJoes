<p align="center"><img src="documentation/logo.png" alt="FishyJoes" width="265" height="265"/></p>

# Status

[![Build & test](https://github.com/cricut/FishyJoes/actions/workflows/unit-tests.yaml/badge.svg?branch=main)](https://github.com/cricut/FishyJoes/actions/workflows/unit-tests.yaml)
[![Integration tests](https://github.com/cricut/FishyJoes/actions/workflows/integration-tests.yaml/badge.svg?branch=main)](https://github.com/cricut/FishyJoes/actions/workflows/integration-tests.yaml)

# Maintainer

Client Enablement

# Description

Generates bindings for (some) swift library code that can be called from TypeScript and Kotlin.

## Pretty pictures

[![Generation process](https://lucid.app/publicSegments/view/eaa9f26a-fbab-4b07-856d-dbcfb5722eec/image.png)](https://lucid.app/lucidchart/cac16522-9201-4b7d-9c23-1ad5bc83c8b5/edit)

[![FishyJoesCore](https://lucid.app/publicSegments/view/8d45425b-0134-4142-adb0-ac1bf4c0d50f/image.png)](https://lucid.app/lucidchart/cac16522-9201-4b7d-9c23-1ad5bc83c8b5/edit)

## Usage

0. prerequesites (macOS):

Install openjdk:
```
brew install openjdk@11
```

Install swift-wasm toolchain:
```
curl -Lo swift-wasm.pkg https://github.com/swiftwasm/swift/releases/download/swift-wasm-5.6.0-RELEASE/swift-wasm-5.6.0-RELEASE-macos_x86_64.pkg
sudo installer -pkg swift-wasm.pkg -target /
```

Install swift-android toolchain:
```
curl -Lo swift-android-toolchain.tar.gz https://github.com/vgorloff/swift-everywhere-toolchain/releases/download/1.0.66/swift-android-toolchain.tar.gz
sudo mkdir -p /Library/Developer/Toolchains
sudo tar -xf swift-android-toolchain.tar.gz -C /Library/Developer/Toolchains/
```

1. Clone a template repo named e.g. "YourModule-bindings" if generating for a repo named "YourModule" from https://github.com/cricut/FishyJoes-bindings-template

rename directory `kotlin/src/test/kotlin/com/cricut/__MODULE_NAME__BUT_LOWERCASED_BECAUSE_THAT_IS_JAVA_CONVENTION_APPRENTLY__` to your lowercase module name, e.g. yourmodule

replace occurances of string `__MODULE_NAME__BUT_LOWERCASED_BECAUSE_THAT_IS_JAVA_CONVENTION_APPRENTLY__` with the same, lowercased name in
 - kotlin/gradle.properties
 - kotlin/src/test/kotlin/com/cricut/{newname}/TestsGoHere.kt

replace `__MODULE_NAME__` with your repo name (e.g. "YourModule") in the following files:
 - node-test/test.ts
 - kotlin/build.gradle.kts
 - package.json
 - Package.swift
 - fishy-joes.yaml

replace `__MODULE_VERSION__` with the version of the swift package you want to export in:
 - Package.swift

2. Run `npm install`

3. Annotate swift source symbols that you want exported. e.g.
```swift
/// <!-- FishyJoes.exportReference(Foo) -->
public struct Foo {
   ...

   /// <!-- FishyJoes.export(bazFrom) -->
   func baz(from:)
}
```

4. Modify the test file at `node-test/test.ts` to exercise your library in typescript

5. generate, build and test!
`swift run fishy-joes --wasm --nodejs generate build test`

6. Modify and probably rename the test file `TestsGoHere.kt` to exercise your library in kotlin

7. generate, build and test!
`swift run fishy-joes --kotlin-fast generate build test`

8. Publish!
