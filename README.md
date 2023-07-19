<p align="center"><img src="documentation/logo.png" alt="FishyJoes" width="265" height="265"/></p>

# Status

[![Build & test](https://github.com/cricut/FishyJoes/actions/workflows/unit-tests.yaml/badge.svg?branch=main)](https://github.com/cricut/FishyJoes/actions/workflows/unit-tests.yaml)
[![Integration tests](https://github.com/cricut/FishyJoes/actions/workflows/integration-tests.yaml/badge.svg?branch=main)](https://github.com/cricut/FishyJoes/actions/workflows/integration-tests.yaml)

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

1. Optional, if need to test on android emulators/devices) Install Docker:

   1. `brew install rancher`
   2. create missing folder on macOS: `sudo mkdir -p /private/etc/sudoers.d`
   3. open "Rancher Desktop.app"
   4. click "accept"
   5. enter password to finish install
   6. authenticate with your github PAT: `nerdctl login ghcr.io`

2. In a new git repository, named `YourAwesomeLibrary-bindings`:
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
