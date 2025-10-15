import ArgumentParser
import FishyJoesCore
import Foundation
import SourceryDataModel
import swsh

public class CodeGen: ParsableCommand {
    @Flag(name: .shortAndLong, help: "suppress verbose output")
    var quiet = false

    @Flag(name: [.long, .customLong("node-js")], inversion: .prefixedNo, help: "Generate a NodeJS N-API based node package")
    var nodejs = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Web-assembly based node package")
    var wasm = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Kotlin package")
    var kotlin = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Kotlin package without android support (much faster)")
    var kotlinFast = false

    @Flag(name: [.long, .customLong("C🗡️")], inversion: .prefixedNo, help: "Generate a C# Package")
    var cSharp = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Dart package")
    var dart = false

    @Flag(name: [.long, .customLong("wasmopt")], inversion: .prefixedNo, help: "Additional wasm optimizations (takes some time)")
    var wasmOpt = true

    @Flag(name: .long, help: "build macOS libraries for both x64_64 and arm64")
    var fat = false

    @Flag(name: .long, help: "Build library in debug mode")
    var debug = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Use swiftly to select correct toolchain version when building for relevant platforms (wasm and android currently)")
    var swiftly = true

    @Option(name: .long, help: "Update version number of generated package.")
    var version: String?

    @Flag(name: .long, help: #"Disable parallelism for swift build. (If you get a "FishyJoesCommonRuntime-Swift.h" or "TestAPI-Swift.h" file not found error, try this option)"#)
    var disableParallelism = false

    enum BuildStep: String, CaseIterable, ExpressibleByArgument {
        case generate, build, test, pack
    }

    let codeCoveragePath = ProcessInfo.processInfo.environment["FISHYJOES_COVERAGE_PATH"]

    @Argument(
        help: """
            one or more of:
             - generate: run sourcery code-generation step
             - build: compile generated bindings into a dynamic library
             - test: execute the library test suite for each specified language target
             - pack: create a package of the appropriate type for each specified language target

            """
    )
    var buildStep: [BuildStep] = [.generate]

    enum CodingKeys: CodingKey {
        case quiet
        case nodejs
        case wasm
        case kotlin
        case kotlinFast
        case cSharp
        case dart
        case wasmOpt
        case version
        case buildStep
        case debug
        case swiftly
        case fat
        case disableParallelism
    }

    var config: FishyJoesConfig!
    var packageInfo: SwiftPackage!

    lazy var buildConfig: BuildConfiguration = {
        // the "module-bindings" subdirectory is needed to avoid this: https://stackoverflow.com/a/71759561
        let swiftBindingsRoot = "bindings/swift-interfaces/generated/\(config.module)-bindings"

        // Assemble a build configuration from passed arguments
        let localPathsNeeded = packageInfo.dependencyMap.entries.values.map(\.localPath)

        var injectedDependencies: [String: PackageDotSwiftDependency.Dependency] = [
            "FishyJoes": .init(from: fishyJoesDependency)
        ]

        for moduleName in config.requiredModules {
            guard let dependency = packageInfo.dependencyMap[moduleName] else {
                fatalError("Couldn't find module \(moduleName) in Package.swift")
            }

            // Sadly, this needs to be an absolute path because it may by used by several `Package.swift`s in different directories.
            let repoRoot = URL(fileURLWithPath: dependency.localPath).path

            injectedDependencies[moduleName] = PackageDotSwiftDependency.Dependency(from: dependency)
            injectedDependencies["\(moduleName)-bindings"] = .local(
                path: "\(repoRoot)/bindings/swift-interfaces/generated/\(moduleName)-bindings"
            )
        }
        injectedDependencies[config.module] = .local(path: URL(fileURLWithPath: ".").path)

        return BuildConfiguration(
            packagePath: swiftBindingsRoot,
            scratchPath: ".build/bindings",
            debug: debug,
            fat: fat,
            codeCoveragePath: codeCoveragePath,
            disableSwiftly: !swiftly,
            disableParallelism: disableParallelism,
            injectedSwiftDependencies: injectedDependencies
        )
    }()

    lazy var fishyJoesDependency: SwiftPackage.Dependency = {
        guard let fishyJoesDependency = packageInfo.dependencyMap["FishyJoes"] else {
            Log.error("Couldn't locate FishyJoes dependency in Package.swift")
            fatalError()
        }
        printAndFlush("Found FishyJoes at: \(fishyJoesDependency.localPath)")
        return fishyJoesDependency
    }()

    var platforms: [Platform] = []

    public required init() {}
}

extension CodeGen {
    public func validate() throws {
        ExternalCommand.verbose = !quiet

        guard cmd("test", "-f", "Package.swift").runBool() else {
            throw ValidationError("No Package.swift found in current directory. fishy-joes must be run in the root of the bindings package")
        }

        config = try FishyJoesConfig.readFromFile(basePath: ".")

        // Parse swift package information from the Package.swift file for the bindings module
        let packageJSON = try cmd("swift", "package", "dump-package").runData()
        do {
            packageInfo = try JSONDecoder().decode(SwiftPackage.self, from: packageJSON)
        } catch let error {
            Log.error("Couldn't parse swift package: \(error)")
            fatalError()
        }

        if wasm {
            platforms.append(.wasm)
        }
        if nodejs {
            platforms.append(.node)
        }
        if kotlin || kotlinFast {
            platforms.append(.kotlinSystem)
        }
        if kotlin && !kotlinFast {
            platforms.append(contentsOf: Platform.AndroidArchitecture.allCases.map(Platform.kotlinAndroid))
        }
        if cSharp {
            platforms.append(.cSharp)
        }
        if dart {
            platforms.append(.dart)
        }

        if !Set(buildStep).isDisjoint(with: [.build, .test, .pack]) && platforms.isEmpty {
            throw ValidationError("Must specify at least one platform when building, testing, or packing")
        }
    }

    public func run() throws {
        // Locate dependency bindings modules required by this bindings module
        var dependencyBindingsPaths: [String: String] = [config.module: "."]
        for moduleName in config.requiredModules {
            guard let dependencyPath = packageInfo.dependencyMap[moduleName]?.localPath else {
                fatalError("Couldn't locate \(moduleName) in Package.swift, but it's required by fishyjoes.json")
            }
            let dependencySourcesPath = "\(dependencyPath)/bindings"
            dependencyBindingsPaths[moduleName] = dependencySourcesPath
        }
        // "bindings/swift-interfaces/generated/\(config.module)-bindings"
        let swiftBindingsRoot = buildConfig.packagePath

        // Whenever any code generation takes place, generate for every language and platform
        let generationPhases: [any Phases] = Platform.allCases.map(phases(for:))

        // MARK: - Generate Step
        if buildStep.contains(.generate) {
            #if os(Windows)
            if true { // supresses a unreachable code warning
                fatalError("Code generation step is not supported on Windows. Generate source code on another platform then use steps 'build', 'test', or 'pack'")
            }
            #endif

            // Locate sources to translate
            let translateeSources: String
            translateeSources = "Sources/"

            // Locate dependency module configuration files
            let fishyJoesModuleFiles: [String: String] = Dictionary(
                uniqueKeysWithValues: dependencyBindingsPaths.compactMap {
                    $0.key == config.module ? nil : ($0.key, "\($0.value)/swift-interfaces/generated/\($0.key).fishyjoesmodule")
                }
            )

            // Create / clean directories used by Sourcery to generate Swift and foreign language code files for the translated foreign languages
            let generatedSwiftTargets = ["WasmMainShim", "IotaInterface", "NodeInterface", "JavaInterface", "CommonInterface"]
            let sourceLocations = generatedSwiftTargets.map {
                "\(swiftBindingsRoot)/Sources/\($0)"
            } + [
                "bindings/swift-interfaces/generated/NodeNativeShim",
                "bindings/ts/generated",
                "bindings/ts/tests/generated",
                "bindings/kotlin/generated/src/main/kotlin/com/cricut/\(config.module.lowercased())",
                "bindings/c-sharp/generated/Cricut.\(config.module)",
                "bindings/dart/generated/lib/src",
            ]
            try cmd("rm", "-rf", "bindings/swift-interfaces/generated").run()
            try cmd("rm", "-rf", "bindings/kotlin/generated").run()
            try cmd("rm", "-rf", "bindings/c-sharp/generated").run()
            try cmd("rm", "-rf", "bindings/dart/generated").run()
            try cmd("mkdir", arguments: ["-p"] + sourceLocations).run()
            for target in generatedSwiftTargets {
                try cmd("echo")
                    .output(overwritingFile: "\(swiftBindingsRoot)/Sources/\(target)/EmptyPlaceholder.swift")
                    .run()
            }

            let packageCustomization = try cmd("cat", "bindings/swift-interfaces/Package.part.swift").runString()
            // Create Package.swift for the bindings package

            let fragment = SourceFragment(destinationPath: nil)

            func targetDeps(_ name: String) {
                for module in config.requiredModules {
                    fragment.output(#".product(name: "\#(module)-\#(name)", package: "\#(module)-bindings"),"#)
                }
            }

            fragment.output(#"// swift-tools-version:5.10"#)
            fragment.output(#"// BEGIN GENERATED CODE"#)
            fragment.blankLine()

            fragment.output(#"import PackageDescription"#)
            fragment.output(#"import Foundation"#)
            fragment.blankLine()

            fragment.output(#"let strictConcurrencyFlags: [SwiftSetting] = []"#)
            fragment.output(#"// [.enableExperimentalFeature("StrictConcurrency"), .enableUpcomingFeature("InferSendableFromCaptures")]"#)
            fragment.blankLine()

            fragment.output(#"let env = ProcessInfo.processInfo.environment"#)
            fragment.output(#"let wasmCompatibleOnly = env["WASM_ONLY"] == "1""#)
            fragment.blankLine()

            // This enum should be kept in sync with the one PackageDotSwiftDependency.swift"#)
            fragment.outputBlock(#"enum Dependency: Codable {"#) {
                fragment.output(#"case local(path: String)"#)
                fragment.output(#"case remote(url: String, _ refSpec: RefSpec)"#)
                fragment.outputBlock(#"enum RefSpec: Codable {"#) {
                    fragment.output(#"case branch(name: String)"#)
                    fragment.output(#"case revision(name: String)"#)
                    fragment.output(#"case range(lowerBound: String, upperBound: String)"#)
                }
            }
            fragment.blankLine()

            fragment.outputBlock(#"func packageDep(_ name: String, bindings: Bool = false) -> Package.Dependency {"#) {
                fragment.output(#"let subPath = bindings ? "/bindings/swift-interfaces/generated/\(name)-bindings" : """#)
                fragment.outputBlock(#"switch env["FISHYJOES_DEPENDENCY_\(name)"] {"#) {
                    fragment.dedentedOutput(#"case .none:"#)
                    fragment.output(#"return .package(name: name, path: "../../../../../\(name)\(subPath)")"#)
                    fragment.dedentedOutput(#"case .some(let versionSpec):"#)
                    fragment.outputBlock(#"switch try! JSONDecoder().decode(Dependency.self, from: versionSpec.data(using: .utf8)!) {"#) {
                        fragment.dedentedOutput(#"case .local(let packagePath):"#)
                        fragment.output(#"return .package(name: name, path: packagePath)"#)
                        fragment.dedentedOutput(#"case let .remote(url, .branch(branch)):"#)
                        fragment.output(#"if bindings { fatalError("not supported") }"#)
                        fragment.output(#"return .package(url: url, branch: branch)"#)
                        fragment.dedentedOutput(#"case let .remote(url, .revision(revision)):"#)
                        fragment.output(#"if bindings { fatalError("not supported") }"#)
                        fragment.output(#"return .package(url: url, revision: revision)"#)
                        fragment.dedentedOutput(#"case let .remote(url, .range(lowerBound, upperBound)):"#)
                        fragment.output(#"if bindings { fatalError("not supported") }"#)
                        fragment.output(#"return .package(url: url, Version(lowerBound)!..<Version(upperBound)!)"#)
                    }
                }
            }
            fragment.blankLine()

            fragment.outputBlock(#"var package = Package("#) {
                fragment.output(#"name: "\#(config.module)-bindings","#)
                fragment.output(#"platforms: [.macOS(.v13), .iOS(.v15)],"#)
                fragment.outputBlock(#"products: ["#, newLineTerminated: false) {
                    fragment.output(#".library(name: "\#(config.module)-node", type: wasmCompatibleOnly ? nil : .dynamic, targets: ["\#(config.module)_NodeInterface"]),"#)
                }
                fragment.outputBlock(#" + ("#, closeWith: "),") {
                    fragment.outputBlock(#"wasmCompatibleOnly ? [] : ["#) {
                        fragment.output(#".library(name: "\#(config.module)-java", type: .dynamic, targets: ["\#(config.module)_JavaInterface"]),"#)
                        fragment.output(#".library(name: "\#(config.module)-iota", type: .dynamic, targets: ["\#(config.module)_IotaInterface"]),"#)
                    }
                }
                fragment.outputBlock(#"dependencies: ["#, closeWith: "],") {
                    for module in config.requiredModules {
                        fragment.output(#"packageDep("\#(module)-bindings", bindings: true),"#)
                    }
                    fragment.output(#"packageDep("\#(config.module)"),"#)
                    fragment.output(#"packageDep("FishyJoes"),"#)
                }
                fragment.outputBlock(#"targets: ["#, newLineTerminated: false) {
                    fragment.outputBlock(".target(", closeWith: "),") {
                        fragment.output(#"name: "\#(config.module)_CommonInterface","#)
                        fragment.output(#"dependencies: [.product(name: "\#(config.module)", package: "\#(config.module)")],"#)
                        fragment.output(#"path: "Sources/CommonInterface","#)
                        fragment.output(#"swiftSettings: strictConcurrencyFlags"#)
                    }
                    fragment.outputBlock(#".target("#, closeWith: "),") {
                        fragment.output(#"name: "\#(config.module)_NodeInterface","#)
                        fragment.outputBlock(#"dependencies: ["#, closeWith: "],") {
                            targetDeps("node")
                            fragment.output(#".target(name: "\#(config.module)_CommonInterface"),"#)
                            fragment.output(#".product(name: "\#(config.module)", package: "\#(config.module)"),"#)
                            fragment.output(#".product(name: "FishyJoesNodeRuntime", package: "FishyJoes"),"#)
                        }
                        fragment.output(#"path: "Sources/NodeInterface","#)
                        fragment.output(#"swiftSettings: strictConcurrencyFlags,"#)
                        fragment.outputBlock(#"linkerSettings: ["#, closeWith: #"]"#) {
                            for module in config.requiredModules {
                                fragment.output(#".linkedLibrary("\#(module)", .when(platforms: [.macOS, .linux, .windows])),"#)
                            }
                            for extraLibrary in config.extraDynamicLibraries {
                                fragment.output(#".linkedLibrary("\#(extraLibrary)", .when(platforms: [.macOS, .linux, .windows])),"#)
                            }
                        }
                    }
                }
                fragment.outputBlock(#" + ("#) {
                    fragment.outputBlock(#"wasmCompatibleOnly ? ["#, newLineTerminated: false) {
                        fragment.outputBlock(#".executableTarget("#, closeWith: "),") {
                            fragment.output(#"name: "\#(config.module)_WasmMainShim","#)
                            fragment.output(#"dependencies: [.target(name: "\#(config.module)_NodeInterface")],"#)
                            fragment.output(#"path: "Sources/WasmMainShim","#)
                            fragment.output(#"swiftSettings: [.unsafeFlags(["-warn-concurrency"])] + strictConcurrencyFlags"#)
                        }
                    }
                    fragment.outputBlock(#" : ["#) {
                        fragment.outputBlock(#".target("#, closeWith: "),") {
                            fragment.output(#"name: "\#(config.module)_JavaInterface","#)
                            fragment.outputBlock(#"dependencies: ["#, closeWith: "],") {
                                targetDeps("java")
                                fragment.output(#".target(name: "\#(config.module)_CommonInterface"),"#)
                                fragment.output(#".product(name: "\#(config.module)", package: "\#(config.module)"),"#)
                                fragment.output(#".product(name: "FishyJoesJavaRuntime", package: "FishyJoes"),"#)
                            }
                            fragment.output(#"path: "Sources/JavaInterface","#)
                            fragment.output(#"swiftSettings: strictConcurrencyFlags,"#)
                            fragment.outputBlock(#"linkerSettings: ["#, closeWith: #"]"#) {
                                for module in config.requiredModules {
                                    fragment.output(#".linkedLibrary("\#(module)"),"#)
                                }
                                for extraLibrary in config.extraDynamicLibraries {
                                    fragment.output(#".linkedLibrary("\#(extraLibrary)"),"#)
                                }
                            }
                        }
                        fragment.outputBlock(#".target("#, closeWith: "),") {
                            fragment.output(#"name: "\#(config.module)_IotaInterface","#)
                            fragment.outputBlock(#"dependencies: ["#, closeWith: "],") {
                                targetDeps("iota")
                                fragment.output(#".target(name: "\#(config.module)_CommonInterface"),"#)
                                fragment.output(#".product(name: "\#(config.module)", package: "\#(config.module)"),"#)
                                fragment.output(#".product(name: "FishyJoesIotaRuntime", package: "FishyJoes"),"#)
                            }
                            fragment.output(#"path: "Sources/IotaInterface","#)
                            fragment.output(#"swiftSettings: strictConcurrencyFlags,"#)
                            fragment.outputBlock(#"linkerSettings: ["#, closeWith: #"]"#) {
                                for module in config.requiredModules {
                                    fragment.output(#".linkedLibrary("\#(module)"),"#)
                                }
                                for extraLibrary in config.extraDynamicLibraries {
                                    fragment.output(#".linkedLibrary("\#(extraLibrary)"),"#)
                                }
                            }
                        }
                    }
                }
            }
            fragment.output(#"// END GENERATED CODE"#)
            fragment.output(#"// Below is copied from bindings/swift-interfaces/Package.part.swift"#)

            fragment.output(packageCustomization)

            try cmd("cat")
                .output(overwritingFile: "\(swiftBindingsRoot)/Package.swift")
                .input(fragment.contents).run()

            let localFishyJoesPath = packageInfo.dependencyMap["FishyJoes"]!.localPath
            let sourceryDataModelSwift = try String(
                contentsOfFile: "\(localFishyJoesPath)/Sources/SourceryDataModel/SourceryDataModel.swift"
            )

            let sourceryTemplate = """
                <%
                \(sourceryDataModelSwift)
                try SourceryTemplateContext(context).dump()
                %>
                """
            let templatePath = "\(NSTemporaryDirectory())/fishyjoes-\(UUID()).swifttemplate"
            try cmd("cat")
                .input(sourceryTemplate)
                .output(overwritingFile: templatePath)
                .run()
            defer { try? FileManager.default.removeItem(atPath: templatePath) }

            try sourceryCommand(
                [
                    quiet ? "-q" : nil,
                    "--disableCache",
                    "--parseDocumentation",
                    "--sources", translateeSources,
                    "--templates", templatePath,
                    "--output", ".build/sourcery-dump/"
                ].compactMap { $0 } + config.excludeSources.flatMap { exclude in
                    var basePath = translateeSources
                    if !basePath.hasSuffix("/") {
                        basePath += "/"
                    }
                    let path = basePath + exclude
                    return ["--exclude-sources", path]
                }
            ).run()

            // Read the sourcery dump, and do type-directed code generation
            let sourceryDump = try cmd("cat")
                .input(fromFile: ".build/sourcery-dump/sourcery-dump.json")
                .runJSON(SourceryTemplateContext.self)
            let context = FishyJoesContext(
                context: sourceryDump,
                module: config.module,
                requiredModulePaths: fishyJoesModuleFiles,
                extraDynamicLibraries: config.extraDynamicLibraries
            )

            for (path, contents) in SourceFragment.combine(fragments: context.translateAll()) {
                guard let path = path else {
                    fatalError("generated source fragment with no output path. Contents: \(contents)")
                }
                let outputPath = "bindings/\(path)"
                print("writing \(outputPath)")
                try contents.write(
                    to: URL(fileURLWithPath: outputPath),
                    atomically: false,
                    encoding: .utf8
                )
            }

            let packageInit = try FileTemplater(
                config: config,
                phasesList: generationPhases,
                swiftPackage: packageInfo,
                includeFilesNotMarkedAsGenerated: false
            )
            try packageInit.installTemplate()
            try cmd("mkdir", "-p", ".github/workflows").run()
            for workflow in try FileManager.default.contentsOfDirectory(atPath: ".github/workflows") {
                if workflow.hasPrefix("GENERATED-") {
                    try cmd("rm", ".github/workflows/\(workflow)").run()
                }
            }
            for workflow in try FileManager.default.contentsOfDirectory(atPath: "bindings/workflows") {
                if workflow.hasPrefix("GENERATED-"), workflow.hasSuffix(".yaml") {
                    try cmd("cp", "bindings/workflows/\(workflow)", ".github/workflows/\(workflow)").run()
                }
            }
        }

        // MARK: - Build Step

        let allBuildPhases = platforms.map(phases(for:))

        if buildStep.contains(.build) {
            try allBuildPhases.forEach { try $0.preBuildPhase() }
            try allBuildPhases.forEach { try $0.buildSwiftPhase() }
            try allBuildPhases.forEach { try $0.preInstallPhase() }
            try allBuildPhases.forEach { try $0.installPhase() }
            try allBuildPhases.forEach { try $0.compileHostLanguagePhase() }
        }

        // MARK: - Test Step
        if buildStep.contains(.test) {
            try allBuildPhases.forEach { try $0.preTestPhase() }
            try allBuildPhases.forEach { try $0.testPhase() }
        }

        // MARK: - Pack Step
        if buildStep.contains(.pack) {
            try allBuildPhases.forEach { try $0.packPhase() }
        }
    }

    private func sourceryCommand(_ arguments: [String]) -> Command {
        switch config.sourceryOverride {
        case .none:
            return cmd("mint", arguments: ["run", "krzysztofzablocki/Sourcery@2.3.0"] + arguments)
        case .some(.remote(let remoteSpec)):
            return cmd("mint", arguments: ["run", remoteSpec] + arguments)
        case .some(.local(let path)):
            return cmd(path ?? "sourcery", arguments: arguments)
        }
    }

    func phases(for platform: Platform) -> any Phases {
        switch platform {
        case .wasm, .node:
            return NodePhases(platform: platform, options: self)
        case .kotlinSystem, .kotlinAndroid:
            return KotlinPhases(platform: platform, options: self)
        case .cSharp:
            return CSharpPhases(platform: platform, options: self)
        case .dart:
            return DartPhases(platform: platform, options: self)
        }
    }
}
