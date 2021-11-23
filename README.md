# FishyJoes

Generates bindings for (some) swift library code that can be called from TypeScript and Kotlin.

## Pretty pictures

[![Generation process](https://lucid.app/publicSegments/view/eaa9f26a-fbab-4b07-856d-dbcfb5722eec/image.png)](https://lucid.app/lucidchart/cac16522-9201-4b7d-9c23-1ad5bc83c8b5/edit)

[![FishyJoesCore](https://lucid.app/publicSegments/view/8d45425b-0134-4142-adb0-ac1bf4c0d50f/image.png)](https://lucid.app/lucidchart/cac16522-9201-4b7d-9c23-1ad5bc83c8b5/edit)

## Usage
In a dedicated repo, e.g. "CriSVG-bindings":

0. prerequesites (macOS):

Install openjdk:
```
brew install openjdk@11
```

Install swift-wasm toolchain:
```
curl -Lo swift-wasm.pkg https://github.com/swiftwasm/swift/releases/download/swift-wasm-5.4.0-RELEASE/swift-wasm-5.4.0-RELEASE-macos_x86_64.pkg
sudo installer -pkg swift-wasm.pkg -target /
```

Install swift-android toolchain:
```
curl -Lo swift-android-toolchain.tar.gz https://github.com/vgorloff/swift-everywhere-toolchain/releases/download/1.0.66/swift-android-toolchain.tar.gz
sudo mkdir -p /Library/Developer/Toolchains
sudo tar -xf swift-android-toolchain.tar.gz -C /Library/Developer/Toolchains/
```

1. create `fishy-joes.yaml` in the root, with contents:
```yaml
---
module: YourLibrary
publishRepository: github.com/You/YourLibrary-bindings
```

2. Update Package.swift to have at least the following elements (yeah, it's ugly):
```swift
// swift-tools-version:5.3

import PackageDescription
import Foundation

let wasmCompatibleOnly = ProcessInfo.processInfo.environment["WASM_ONLY"] == "1"

let package = Package(
    name: "YourLibrary-bindings",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "YourLibrary-wasm",
            targets: ["NodeInterface"]
        ),
    ] + (wasmCompatibleOnly ? [] : [
             .library(
                 name: "YourLibrary-node",
                 type: .dynamic,
                 targets: ["NodeInterface"]
             ),
             .library(
                 name: "YourLibrary-java",
                 type: .dynamic,
                 targets: ["JavaInterface"]
             )
         ]),
    dependencies: [
        .package(url: "https://github.com/cricut/FishyJoes", .branch("main")),
    ],
    targets: [
        .target(
            name: "NodeInterface",
            dependencies: [
                "YourLibrary",
                .product(name: "FishyJoesNodeRuntime", package: "FishyJoes"),
            ],
            path: "Sources/Generated/NodeInterface",
            resources: [
                .copy("YourLibrary.d.ts"),
            ]
        ),
    ] + (wasmCompatibleOnly ? [
             .target(
                 name: "DummyMain",
                 dependencies: [
                     "NodeInterface",
                 ]
             ),
         ] : [
             .target(
                 name: "JavaInterface",
                 dependencies: [
                     .product(name: "YourLibrary", package: "YourLibrary"),
                     .product(name: "FishyJoesJavaRuntime", package: "FishyJoes"),
                 ],
                 path: "Sources/Generated/JavaInterface",
                 linkerSettings: [
                     .unsafeFlags(["-Xlinker", "--export=napi_register_module_v1"], .when(platforms: [.wasi])),
                 ]
             ),
         ])
)
```

3. Create an empty file for the DummyMain target at `Sources/DummyMain/main.swift`

4. Create a package.json at the root
```json
{
  "name": "YourLibrary",
  "version": "0.0.1",
  "dependencies": {
    "@wasmer/wasi": "^0.12.0",
    "@wasmer/wasmfs": "^0.12.0",
    "buffer": "^5.7.1",
    "process": "^0.11.10",
    "util": "^0.11.1"
  },
  "devDependencies": {
    "@types/node": "^14.14.31",
    "node-addon-api": "^3.1.0",
    "ts-loader": "^9.2.5",
    "ts-node": "^10.2.0",
    "typescript": "^4.3.5"
  },
  "scripts": {
    "compile-test": "tsc -m esnext output/test/test.ts"
  }
}
```

5. Run `npm install`

6. Create a node test file at `node-test/test.ts`
```
import(`${MODULE_PATH}/YourLibrary.js`).then(({ YourLibrary }) => {
    console.log(YourLibrary);
    // Sanity checking code here
})
```

7. Annotate swift source symbols that you want exported. e.g.
```swift
/// <!-- FishyJoes.exportReference(Foo) -->
public struct Foo {
   ...

   /// <!-- FishyJoes.export(bazFrom) -->
   func baz(from:)
}
```

8. generate, build and test!
`swift run fishy-joes --wasm --nodejs generate build test`

9. Steal the `kotlin` directory from CriGeo-bindings, because I don't remember how I made it.

10. Get lazy writing documentation and just start recommending copy-paste

11. generate, build and test!
`swift run fishy-joes --kotlin-mac-only generate build test`

12. Steal the `.github/workflows` from CriGeo-bindings too and adapt to suit your needs

13. Publish!
