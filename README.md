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

## Updating fishyjoes

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

Install openjdk, mint, and npm:
```
brew install openjdk@11 mint npm
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

1. In a new git repository, named `YourAwesomeLibrary-bindings`:
```
mint run --executable fishy-joes cricut/FishyJoes package-init
```
Fill in a few details about the swift target and bindings repo when asked

2. Annotate swift source symbols that you want exported. e.g.
```swift
/// <!-- FishyJoes.exportReference(Foo) -->
public struct Foo {
   ...

   /// <!-- FishyJoes.export(bazFrom) -->
   func baz(from:)
}
```

3. Modify/create the test files at `node-test/*.test.ts` to exercise your library in typescript

4. generate, build and test!
`swift run fishy-joes --wasm --nodejs generate build test`

5. Modify and probably rename the test files in `kotlin/src/test/**/*.kt` to exercise your library in kotlin

6. generate, build and test!
`swift run fishy-joes --kotlin-fast generate build test`

7. Publish!

[Tutorial by Matt](https://cricut-my.sharepoint.com/personal/mstoker_cricut_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fmstoker%5Fcricut%5Fcom%2FDocuments%2FRecordings%2FClient%20Enablement%20Demos%2D20220505%5F145944%2DMeeting%20Recording%2Emp4&parent=%2Fpersonal%2Fmstoker%5Fcricut%5Fcom%2FDocuments%2FRecordings&ga=1)
