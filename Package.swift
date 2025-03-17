// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let strictConcurrencyFlags: [SwiftSetting] = [
    .swiftLanguageMode(.v6)
]

// Enable slow type-check warnings by opening xcode via command-line with an environment variable
// `export WARN_SLOW_TYPE_CHECKS=1 && open /Applications/Xcode.app`
let warnSlowTypeCheckFlags: [SwiftSetting] = if ProcessInfo.processInfo.environment["WARN_SLOW_TYPE_CHECKS"] == "1" {
    [
        SwiftSetting.unsafeFlags([
            "-driver-time-compilation",
            "-Xfrontend",
            "-debug-time-function-bodies",
            "-Xfrontend",
            "-debug-time-expression-type-checking",
            "-Xfrontend",
            "-warn-long-function-bodies=100",
            "-Xfrontend",
            "-warn-long-expression-type-checking=100"
        ])
    ]
} else {
    []
}

let package = Package(
    name: "ArtCanvasPod",
    defaultLocalization: "en-us",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "ArtBasicShapes", targets: ["ArtBasicShapes"]),
        .library(name: "ArtBasicShapesFeature", targets: ["ArtBasicShapesFeature"]),
        .library(name: "ArtBasicShapesLive", targets: ["ArtBasicShapesLive"]),
        .library(name: "ArtCanvas", targets: ["ArtCanvas"]),
        .library(name: "ArtCanvasFeature", targets: ["ArtCanvasFeature"]),
        .library(name: "ArtCreateLayers", targets: ["ArtCreateLayers"]),
        .library(name: "ArtImageUpload", targets: ["ArtImageUpload"]),
        .library(name: "ArtStickerize", targets: ["ArtStickerize"]),
        .library(name: "ArtText", targets: ["ArtText"]),
        .library(name: "ArtWarp", targets: ["ArtWarp"]),
        .library(name: "ArtLabs", targets: ["ArtLabs"]),
        .library(name: "ArtTemplates", targets: ["ArtTemplates"]),
        .library(name: "ArtDesignArea", targets: ["ArtDesignArea"]),
    ],
    dependencies: [
        /// Pods,
        .package(url: "https://github.com/cricut/ArtFontSearch", from: "87.0.0"),
        .package(url: "https://github.com/cricut/ArtGraphics", from: "19.0.0"),
        .package(url: "https://github.com/cricut/ArtPlatform", from: "70.0.0"),
        .package(url: "https://github.com/cricut/ArtProjectLoad", from: "84.0.0"),
        .package(url: "https://github.com/cricut/CriCanvas", exact: "0.10.24"),
        .package(url: "https://github.com/cricut/ArtSubscriptionsPod", from: "73.0.0"),
        .package(url: "https://github.com/cricut/CriSVG", from: "1.7.0"),
        .package(url: "https://github.com/cricut/CriText", from: "1.5.0"),
        /// APIs
        .package(url: "https://github.com/cricut/CanvasAPI-Swift", from: "15.0.0"),
        .package(url: "https://github.com/cricut/ContentAPI-Swift", from: "9.0.0"),
        .package(url: "https://github.com/cricut/FeedbackAPI-Swift", from: "3.0.0"),
        .package(url: "https://github.com/cricut/FontSearchAPI-Swift", from: "9.1.0"),
        .package(url: "https://github.com/cricut/ImageBackgroundAPI-Swift", from: "3.0.0"),
        .package(url: "https://github.com/cricut/ImageGenerationAPI-Swift", from: "3.1.0"),
        .package(url: "https://github.com/cricut/ImageUploadAPI-Swift", from: "3.0.0"),
        .package(url: "https://github.com/cricut/ImagesAPI-Swift", from: "14.1.0"),
        .package(url: "https://github.com/cricut/PensAPI-Swift", from: "4.0.0"),
        .package(url: "https://github.com/cricut/TemplatesAPI-Swift", from: "8.0.0"),
        .package(url: "https://github.com/cricut/UsersAPI-Swift", from: "6.0.0"),
        /// Cricut deps
        .package(url: "https://github.com/cricut/CTextFreestack", exact: "3.0.1"),
        .package(url: "https://github.com/cricut/CriPlug", .upToNextMinor(from: "0.3.0")),
        .package(url: "https://github.com/cricut/CriTrace", exact: "1.2.3"),
        .package(url: "https://github.com/cricut/shared-effects", exact: "0.0.11"),
        /// 3rd party
        .package(url: "https://github.com/TimOliver/TOCropViewController", exact: "2.7.4"),
        .package(url: "https://github.com/siteline/swiftui-introspect", from: "1.3.0")
    ],
    targets: [
        .target(
            name: "ArtBasicShapes",
            dependencies: [
                .product(name: "ArtComposableArchitectureUtilities", package: "ArtPlatform"),
                .product(name: "ArtGraphics", package: "ArtGraphics"),
                .product(name: "ArtGraphicsFeature", package: "ArtGraphics"),
                .target(name: "ArtCanvasCommon"),
            ],
            path: "ArtBasicShapes/Sources",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtBasicShapesFeature",
            dependencies: [
                .product(name: "ArtAnalytics", package: "ArtPlatform"),
                .product(name: "ArtComposableArchitectureUtilities", package: "ArtPlatform"),
                .product(name: "ArtGraphics", package: "ArtGraphics"),
                .target(name: "ArtBasicShapes"),
            ],
            path: "ArtBasicShapes/Feature/Sources",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .testTarget(
            name: "ArtBasicShapesFeatureTests",
            dependencies: [
                .target(name: "ArtBasicShapesFeature")
            ],
            path: "ArtBasicShapes/Feature/Tests",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtBasicShapesLive",
            dependencies: [
                .product(name: "ArtComposableArchitectureUtilities", package: "ArtPlatform"),
                .target(name: "ArtBasicShapes"),
            ],
            path: "ArtBasicShapes/Live/Sources",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),

        .target(
            name: "ArtCanvas",
            dependencies: [
                .product(name: "ArtComponents", package: "ArtPlatform"),
                .product(name: "ArtComposableArchitectureUtilities", package: "ArtPlatform"),
                .product(name: "ArtDeepLinking", package: "ArtPlatform"),
                .product(name: "ArtFontSearch", package: "ArtFontSearch"),
                .product(name: "ArtFontSearchFeature", package: "ArtFontSearch"),
                .product(name: "ArtGraphicComponents", package: "ArtGraphics"),
                .product(name: "ArtGraphics", package: "ArtGraphics"),
                .product(name: "ArtGraphicsFeature", package: "ArtGraphics"),
                .product(name: "ArtMachineFamilyModels", package: "ArtProjectLoad"),
                .product(name: "ArtPersistence", package: "ArtPlatform"),
                .product(name: "ArtProjectLoad", package: "ArtProjectLoad"),
                .product(name: "ArtProjectLoadPersistence", package: "ArtProjectLoad"),
                .product(name: "ArtSettings", package: "ArtPlatform"),
                .product(name: "CanvasAPI", package: "CanvasAPI-Swift"),
                .product(name: "CanvasLegacy", package: "ArtGraphics"),
                .product(name: "CanvasLegacyPersistence", package: "ArtGraphics"),
                .product(name: "CriCanvas", package: "CriCanvas"),
                .product(name: "CriText", package: "CriText"),
                .product(name: "FeedbackAPI", package: "FeedbackAPI-Swift"),
                .product(name: "ImagesAPI", package: "ImagesAPI-Swift"),
                .product(name: "PTCPreferencesClient", package: "ArtPlatform"),
                .product(name: "PensAPI", package: "PensAPI-Swift"),
                .product(name: "SwiftUIIntrospect", package: "swiftui-introspect"),
                .product(name: "TemplatesAPI", package: "TemplatesAPI-Swift"),
                .target(name: "ArtBasicShapes"),
                .target(name: "ArtBasicShapesFeature"),
                .target(name: "ArtCanvasCommon"),
                .target(name: "ArtCreateLayers"),
                .target(name: "ArtDesignArea"),
                .target(name: "ArtImageUpload"),
                .target(name: "ArtLabs"),
                .target(name: "ArtLabsLive"),
                .target(name: "ArtStickerize"),
                .target(name: "ArtTemplates"),
                .target(name: "ArtTemplatesLive"),
                .target(name: "ArtText"),
                .target(name: "ArtWarp"),
            ],
            path: "ArtCanvas/Sources/Canvas",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags,
            linkerSettings: [
                .linkedFramework("SwiftUI")
            ]
        ),
        .target(
            name: "ArtCanvasFeature",
            dependencies: [
                .product(name: "ArtFontSearchFeature", package: "ArtFontSearch"),
                .product(name: "ArtFontSearchPersistence", package: "ArtFontSearch"),
                .product(name: "ContentAPI", package: "ContentAPI-Swift"),
                .product(name: "ContentLegacy", package: "ArtGraphics"),
                .target(name: "ArtCanvas"),
                .target(name: "ArtCanvasCommonLive"),
            ],
            path: "ArtCanvas/Sources/Feature",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags,
            linkerSettings: [
                .linkedFramework("SwiftUI", .when(platforms: [.iOS, .macOS])),
                .linkedFramework("AVFoundation")
            ]
        ),
        .testTarget(
            name: "ArtCanvasTests",
            dependencies: [
                .product(name: "ArtGraphicsFeature", package: "ArtGraphics"),
                .product(name: "ArtMachineFamilyModels", package: "ArtProjectLoad"),
                .product(name: "ArtTesting", package: "ArtPlatform"),
                .target(name: "ArtCanvas"),
            ],
            path: "ArtCanvas/Tests",
            resources: [
                // CSAT Trigger based drivers
                .copy("Resources/CSAT-370a782f-26b8-4114-b38f-7eba66942f88.json"),
                // Old Satisfaction Survey
                .copy("Resources/CSAT-c051e47d-5ab3-4697-b5c3-7653af422981.json"),
                // Canvas data with text
                .copy("Resources/canvas_v5_images_960424354_cb1cb929-968b-47cf-9e85-1a3689d3b175"),
                // Canvas data without text
                .copy("Resources/canvas_v5_images_865282140_5bb0b1a4-2bc2-499e-9fda-f4e70a875cd9"),
                // Eagle image
                .copy("Resources/canvas_v5_images_312694162_00000000-0000-0000-0000-000000000000"),
                // Canvas for alignment tests
                .copy("Resources/canvas_v5_canvases_4D07D8B0-1111-1111-1111-6735199F6EA6"),
                // Canvas to test Action Bar (Nested Groups)
                .copy("Resources/canvas_v5_canvases_F70E80BD-C4CB-4BBF-9D43-AB72EB363C6A"),
                // Canvas to test Action Bar (Groups)
                .copy("Resources/canvas_v5_canvases_06D3A4FD-CA1C-4B36-8807-2119E5AF095D"),
                // Canvas to test Action Bar (Contours)
                .copy("Resources/canvas_v5_canvases_265983EA-6650-4BF4-B55A-BCE21E5B3BE4"),
                // Canvas to test the Distribute feature
                .copy("Resources/canvas_v5_canvases_02FE03C5-F1B8-42C5-B24E-3FDABFF688D2"),
                // Canvas to test the ColorSync feature (Attached Group)
                .copy("Resources/canvas_v5_canvases_D2D20972-D703-4A88-8635-9D308B5596BB"),
                // Canvas to test the ColorSync feature (Multigraphic Group)
                .copy("Resources/canvas_v5_canvases_130874F5-EDD0-4D83-BF73-7E0FEDC6B92D"),
                // Canvas to test the ColorSync feature (RegularGroupWithShapes)
                .copy("Resources/canvas_v5_canvases_447EBB64-EAC9-43FF-B084-42E51AEA964E"),
                // Canvas to test the Curve Text feature
                .copy("Resources/canvas_v5_canvases_6EDAE921-EFA0-4915-8ADB-7F854D91024B"),
                // Font data for font insertion
                .copy("Resources/fontsearch_v1_fontFamilies.json"),
                // Font file
                .copy("Resources/fontcontent_Fonts_v2_GetFontFile.json"),
                .copy("Resources/twoSquares_4A035DAD-01CB-4334-AB46-49616CC271D4"),
                .copy("Resources/CaptainVegetableNdbText_EBA2F2E0-CDBB-45A7-9727-FB68BF2685AF"),
                .copy("Resources/CaptainVegetableNoBooleanGroupCachedPathNdbText_3D324B57-FAE1-4AA8-B0FF-8FEF3CD47A53")
            ],
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtCanvasCommon",
            dependencies: [
                .product(name: "ArtComponents", package: "ArtPlatform"),
                .product(name: "ArtComposableArchitectureUtilities", package: "ArtPlatform"),
                .product(name: "FeatureFlags", package: "ArtPlatform")
            ],
            path: "ArtCanvasCommon/Sources",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtCanvasCommonLive",
            dependencies: [
                .target(name: "ArtCanvasCommon"),
                .product(name: "UsersAPI", package: "UsersAPI-Swift"),
            ],
            path: "ArtCanvasCommon/Live",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags,
            linkerSettings: [
                .linkedFramework("AVFoundation")
            ]
        ),
        .testTarget(
            name: "ArtCanvasCommonTests",
            dependencies: [
                .target(name: "ArtCanvasCommon")
            ],
            path: "ArtCanvasCommon/Tests",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtText",
            dependencies: [
                .product(name: "ArtComponents", package: "ArtPlatform"),
                .product(name: "ArtFontSearch", package: "ArtFontSearch"),
                .product(name: "ArtFontSearchFeature", package: "ArtFontSearch"),
                .product(name: "ArtFoundation", package: "ArtPlatform"),
                .product(name: "ArtGraphics", package: "ArtGraphics"),
                .product(name: "CriCanvas", package: "CriCanvas"),
                .product(name: "CriText", package: "CriText"),
                .product(name: "FontSearchAPI", package: "FontSearchAPI-Swift"),
                .product(name: "freetype", package: "CTextFreestack"),
            ],
            path: "ArtText/Sources",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags,
            linkerSettings: [
                .linkedFramework("CoreText"),
                .linkedLibrary("bz2", .when(platforms: [.iOS])),
                .linkedLibrary("z", .when(platforms: [.iOS])),
            ]
        ),
        .testTarget(
            name: "ArtTextTests",
            dependencies: [
                .product(name: "ArtFontSearch", package: "ArtFontSearch"),
                .product(name: "ArtGraphics", package: "ArtGraphics"),
                .product(name: "CriCanvas", package: "CriCanvas"),
                .target(name: "ArtText")
            ],
            path: "ArtText/Tests",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtImageUpload",
            dependencies: [
                .product(name: "ArtExternalURLClient", package: "ArtPlatform"),
                .product(name: "ArtFoundation", package: "ArtPlatform"),
                .product(name: "ArtGraphicsFeature", package: "ArtGraphics"),
                .product(name: "ArtImageSelection", package: "ArtPlatform"),
                .product(name: "ArtPurchasingFeature", package: "ArtSubscriptionsPod"),
                .product(name: "ContentAPI", package: "ContentAPI-Swift"),
                .product(name: "ContentLegacy", package: "ArtGraphics"),
                // comment out ImageMagick to run on arm64 (M1) simulator
                .product(name: "CriTrace", package: "CriTrace"),
                .product(name: "ImageBackgroundAPI", package: "ImageBackgroundAPI-Swift"),
                .product(name: "ImageUploadAPI", package: "ImageUploadAPI-Swift"),
                .product(name: "TOCropViewController", package: "TOCropViewController", condition: .when(platforms: [.iOS])),
                .target(name: "ArtCanvasCommon"),
                .target(name: "ArtCreateLayers"),
                .target(name: "ArtTextToImage"),
            ],
            path: "ArtImageUpload/Sources",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtLabs",
            dependencies: [
                .product(name: "ArtAnalytics", package: "ArtPlatform"),
                .product(name: "ArtComposableArchitectureUtilities", package: "ArtPlatform"),
                .product(name: "CriCanvas", package: "CriCanvas"),
                .product(name: "CriPlug", package: "CriPlug"),
                .product(name: "CriPlugModels", package: "CriPlug"),
                .product(name: "CriSVG", package: "CriSVG"),
                .product(name: "FeatureFlags", package: "ArtPlatform"),
                .product(name: "WasmProgram", package: "CriPlug"),
                .target(name: "ArtCanvasCommon"),
            ],
            path: "ArtLabs/Sources",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtLabsLive",
            dependencies: [
                .product(name: "WebKitProgram", package: "CriPlug"),
                .target(name: "ArtLabs"),
            ],
            path: "ArtLabs/Live",
            resources: [
                .copy("Resources/Plugins")
            ],
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .testTarget(
            name: "ArtLabsTests",
            dependencies: [
                "ArtLabs",
                .product(name: "ArtComposableArchitectureUtilities", package: "ArtPlatform"),
            ],
            path: "ArtLabs/Tests",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .testTarget(
            name: "ArtImageUploadTests",
            dependencies: [
                .target(name: "ArtCanvasCommon"),
                .target(name: "ArtImageUpload"),
            ],
            path: "ArtImageUpload/Tests",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtWarp",
            dependencies: [
                .product(name: "ArtGraphics", package: "ArtGraphics"),
                .product(name: "ArtPersistence", package: "ArtPlatform"),
                .product(name: "ArtPurchasing", package: "ArtSubscriptionsPod"),
                .product(name: "ArtPurchasingFeature", package: "ArtSubscriptionsPod"),
                .product(name: "CriCanvas", package: "CriCanvas"),
                .product(name: "SharedEffects", package: "shared-effects"),
                .target(name: "ArtCanvasCommon"),
            ],
            path: "ArtWarp/Sources",
            resources: [
                .copy("Resources/SVG/generic-warp.svg")
            ],
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .testTarget(
            name: "ArtWarpTests",
            dependencies: [
                .product(name: "ArtPurchasingFeature", package: "ArtSubscriptionsPod"),
                .target(name: "ArtWarp"),
            ],
            path: "ArtWarp/Tests",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtStickerize",
            dependencies: [
                .product(name: "ArtGraphics", package: "ArtGraphics"),
                .product(name: "ArtPurchasingFeature", package: "ArtSubscriptionsPod"),
                .product(name: "CriCanvas", package: "CriCanvas"),
                .target(name: "ArtCanvasCommon"),
            ],
            path: "ArtStickerize/Sources",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .testTarget(
            name: "ArtStickerizeTests",
            dependencies: [
                .target(name: "ArtStickerize"),
            ],
            path: "ArtStickerize/Tests",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtTemplates",
            dependencies: [
                .product(name: "ArtAnalytics", package: "ArtPlatform"),
                .product(name: "ArtComponents", package: "ArtPlatform"),
                .product(name: "ArtComposableArchitectureUtilities", package: "ArtPlatform"),
                .product(name: "ArtNetworkConnectivity", package: "ArtPlatform"),
                .product(name: "FeatureFlags", package: "ArtPlatform"),
                .product(name: "TemplatesAPI", package: "TemplatesAPI-Swift"),
                .target(name: "ArtCanvasCommon"),
            ],
            path: "ArtTemplates/Sources",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtTemplatesLive",
            dependencies: [
                .target(name: "ArtTemplates")
            ],
            path: "ArtTemplates/Live",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .testTarget(
            name: "ArtTemplatesTests",
            dependencies: [
                .target(name: "ArtTemplates")
            ],
            path: "ArtTemplates/Tests",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtTextToImage",
            dependencies: [
                .product(name: "ArtComposableArchitectureUtilities", package: "ArtPlatform"),
                .product(name: "ArtGraphics", package: "ArtGraphics"),
                .product(name: "ArtPersistence", package: "ArtPlatform"),
                .product(name: "ImageGenerationAPI", package: "ImageGenerationAPI-Swift"),
                .target(name: "ArtCreateLayers")
            ],
            path: "ArtTextToImage/Sources",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags,
            linkerSettings: [
                .linkedFramework("SwiftUI", .when(platforms: [.iOS, .macOS]))
            ]
        ),
        .target(
            name: "ArtCreateLayers",
            dependencies: [
                .product(name: "ArtComponents", package: "ArtPlatform"),
                .product(name: "ArtPurchasingFeature", package: "ArtSubscriptionsPod"),
                .product(name: "CanvasAPI", package: "CanvasAPI-Swift"),
                .product(name: "CriTrace", package: "CriTrace"),
                .target(name: "ArtCanvasCommon"),
            ],
            path: "ArtCreateLayers/Sources",
            resources: [
                .copy("Resources/create-layer-logo-dark.mp4"),
                .copy("Resources/create-layer-logo.mp4"),
                .copy("Resources/create-layers-config.json")
            ],
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags,
            linkerSettings: [
                .linkedFramework("SwiftUI", .when(platforms: [.iOS, .macOS]))
            ]
        ),
        .testTarget(
            name: "ArtCreateLayersTests",
            dependencies: [
                .target(name: "ArtCreateLayers"),
            ],
            path: "ArtCreateLayers/Tests",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .target(
            name: "ArtDesignArea",
            dependencies: [
                .product(name: "ArtAnalytics", package: "ArtPlatform"),
                .product(name: "ArtComponents", package: "ArtPlatform"),
                .product(name: "ArtComposableArchitectureUtilities", package: "ArtPlatform"),
                .product(name: "ArtGraphics", package: "ArtGraphics"),
                .product(name: "ArtGraphicsFeature", package: "ArtGraphics"),
                .product(name: "ArtNetworkConnectivity", package: "ArtPlatform"),
                .product(name: "FeatureFlags", package: "ArtPlatform"),
                .target(name: "ArtCanvasCommon"),
            ],
            path: "ArtDesignArea/Sources",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
        .testTarget(
            name: "ArtDesignAreaTests",
            dependencies: [
                .target(name: "ArtDesignArea"),
            ],
            path: "ArtDesignArea/Tests",
            swiftSettings: strictConcurrencyFlags + warnSlowTypeCheckFlags
        ),
    ],
    swiftLanguageModes: [.version("6.0")],
    cLanguageStandard: .c11,
    cxxLanguageStandard: .cxx17
)
