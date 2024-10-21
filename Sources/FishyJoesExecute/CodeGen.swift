import ArgumentParser
import Foundation
import swsh

public struct CodeGen: ParsableCommand {
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

    @Flag(name: .long, help: "dump intermediates in DebugRepresentation")
    var dumpDebugRepresentation = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Use docker")
    var useDocker = true

    @Option(help: "Used for debugging fishy-joes code generation")
    var sourceryDumpPath: String?

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
        case useDocker
        case sourceryDumpPath
        case version
        case buildStep
        case debug
        case dumpDebugRepresentation
        case fat
        case disableParallelism
    }

    var config: FishyJoesConfig!
    var platforms: [Platform] = []

    public init() {}
}

private let ps = Platform.pathSeparator

extension CodeGen {
    public mutating func validate() throws {
        ExternalCommand.verbose = !quiet

        guard cmd("test", "-f", "Package.swift").runBool() else {
            throw ValidationError("No Package.swift found in current directory. fishy-joes must be run in the root of the bindings package")
        }

        config = try FishyJoesConfig.readFromFile(basePath: ".\(ps)")

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

    public mutating func run() throws {
        // Parse swift package information from the Package.swift file for the bindings module
        let packageJSON = try cmd("swift", "package", "dump-package").runData()
        let packageInfo: SwiftPackage
        do {
            packageInfo = try JSONDecoder().decode(SwiftPackage.self, from: packageJSON)
        } catch let error {
            fatalError("Couldn't parse swift package: \(error)")
        }
        guard let fishyJoesDependency = packageInfo.dependencyMap["FishyJoes"] else {
            fatalError("Couldn't locate FishyJoes dependency in Package.swift")
        }
        printAndFlush("Found FishyJoes at: \(fishyJoesDependency.localPath)")

        // Locate dependency bindings modules required by this bindings module
        var dependencySourcePaths: [String: String] = [config.module: "."]
        for moduleName in config.requiredModules {
            let bindingModule = "\(moduleName)-bindings"
            guard let dependencyPath = packageInfo.dependencyMap[bindingModule]?.localPath else {
                fatalError("Couldn't locate \(bindingModule) in Package.swift, but it's required by fishyjoes.json")
            }
            let dependencySourcesPath = dependencyPath + "\(ps)Sources"
            dependencySourcePaths[moduleName] = dependencySourcesPath
        }

        // Locate dependencies yaml files
        let fishyJoesYamlConfigs: [FishyJoesConfig] = try dependencySourcePaths.compactMap {
            $0.key == config.module ? nil : "\($0.value)\(ps)..\(ps)"
        }.map(FishyJoesConfig.readFromFile(basePath:))

        // MARK: - Generate Step
        if buildStep.contains(.generate) {
            #if os(Windows)
            fatalError("Code generation step is not supported on Windows. Generate source code on another platform then use steps 'build', 'test', or 'pack'")
            #endif

            // Locate sources to translate
            let translateeSources: String
            if let translateeLocalPath = packageInfo.dependencyMap[config.module]?.localPath {
                translateeSources = translateeLocalPath + "\(ps)Sources"
            } else if let targetPath = packageInfo.path(toTarget: config.module) {
                translateeSources = targetPath
            } else {
                fatalError("Couldn't locate module for translation '\(config.module)' in Package.swift")
            }

            // Locate dependency module configuration files
            let fishyJoesModuleFiles: [String] = dependencySourcePaths.compactMap {
                $0.key == config.module ? nil : "\($0.value)\(ps)Generated\(ps)\($0.key).fishyjoesmodule"
            }

            // Create / clean directories used by Sourcery to generate Swift and foreign language code files for the translated foreign languages
            let sourceLocations = [
                "Sources\(ps)Generated\(ps)CommonInterface",
                "Sources\(ps)Generated\(ps)WasmMainShim",
                "Sources\(ps)Generated\(ps)NodeNativeShim",
                "Sources\(ps)Generated\(ps)NodeInterface",
                "Sources\(ps)Generated\(ps)JavaInterface",
                "Sources\(ps)Generated\(ps)IotaInterface",
                "kotlin\(ps)src\(ps)generated\(ps)kotlin\(ps)com\(ps)cricut\(ps)\(config.module.lowercased())",
                "c-sharp\(ps)Cricut.\(config.module.lowercased())\(ps)generated",
                "dart\(ps)lib\(ps)src\(ps)generated",
            ]
            try cmd("rm", arguments: ["-rf", "Sources\(ps)Generated\(ps)FishyJoes.generated.swift"]).run()
            try cmd("rm", arguments: ["-rf"] + sourceLocations).run()
            try cmd("mkdir", arguments: ["-p"] + sourceLocations).run()

            // Populate directories that are empty with a placeholder
            try cmd("echo").output(overwritingFile: "Sources\(ps)Generated\(ps)CommonInterface\(ps)EmptyPlaceholder.swift").run()
            try cmd("echo").output(overwritingFile: "Sources\(ps)Generated\(ps)WasmMainShim\(ps)EmptyPlaceholder.swift").run()
            try cmd("echo").output(overwritingFile: "Sources\(ps)Generated\(ps)NodeNativeShim\(ps)EmptyPlaceholder.swift").run()
            try cmd("echo").output(overwritingFile: "Sources\(ps)Generated\(ps)NodeInterface\(ps)EmptyPlaceholder.swift").run()
            try cmd("echo").output(overwritingFile: "Sources\(ps)Generated\(ps)JavaInterface\(ps)EmptyPlaceholder.swift").run()
            try cmd("echo").output(overwritingFile: "Sources\(ps)Generated\(ps)IotaInterface\(ps)EmptyPlaceholder.swift").run()

            // Build the Sourcery tool itself
            try cmd("swift", "build", "--product", "sourcery").run()

            // Build the FishyJoes internal execution helper product
            try cmd("swift", arguments: ["build"] + (codeCoveragePath == nil ? [] : Platform.coverageFlags) + ["--product", "helper-fishy-joes-core"]).run()

            // Trampoline into fishy-joes-execution-helper via Sourcery
            var sourceryEnv: [String: String] = [:]
            if let sourceryDumpPath = sourceryDumpPath {
                sourceryEnv["DUMP_SOURCERY_DATA"] = URL(fileURLWithPath: (sourceryDumpPath as NSString).expandingTildeInPath, isDirectory: false).path
            }
            if let codeCoveragePath = codeCoveragePath {
                sourceryEnv["LLVM_PROFILE_FILE"] = "\(codeCoveragePath)\(ps)fishy-joes-execution-helper-\(UUID()).profraw"
            }

            // Provide access to stderr for the fishy-joes core by creating a temporary named pipe
            // This is necessary because sourcery intercepts stderr and fails if it is used at all
            // https://unix.stackexchange.com/a/29918/5471
            let errorFifoPath = try cmd("mktemp", "-u").runString()
            try cmd("mkfifo", errorFifoPath).run()
            defer { try? cmd("rm", errorFifoPath).run() }
            let errorReporter = cmd("cat", errorFifoPath).async(stdout: .stderr)

            // Execute Sourcery to generate the Swift-side and foreign-side source files for all supported language targets
            let base64RequiredModules = try! JSONEncoder().encode(fishyJoesModuleFiles).base64EncodedString()
            let base64ExtraDynamicLibraries = try! JSONEncoder().encode(config.extraDynamicLibraries).base64EncodedString()
            try cmd(
                ".build\(ps)debug\(ps)sourcery",
                arguments: [
                    quiet ? "-q" : nil,
                    "--disableCache",
                    "--parseDocumentation",
                    "--sources", translateeSources,
                    "--templates", ".build\(ps)debug\(ps)FishyJoes_FishyJoesExecutionHelper.bundle\(ps)FishyJoes.swifttemplate",
                    "--args", "module=\(config.module)",
                    "--args", "debugRepresentation=\(dumpDebugRepresentation)",
                    "--args", "requiredModules=\"\(base64RequiredModules)\"",
                    "--args", "extraDynamicLibraries=\"\(base64ExtraDynamicLibraries)\"",
                    "--args", "fishyJoesExecutable=.build\(ps)debug\(ps)helper-fishy-joes-core",
                    "--args", "stderrFifo=\(errorFifoPath)",
                    "--output", "Sources\(ps)Generated"
                ].compactMap { $0 } + config.excludeSources.flatMap { exclude in
                    var basePath = translateeSources
                    if !basePath.hasSuffix("\(ps)") {
                        basePath += "\(ps)"
                    }
                    let path = basePath + exclude
                    return ["--exclude-sources", path]
                },
                addEnv: sourceryEnv
            ).run()

            try errorReporter.succeed()
        }

        // MARK: - Build Step
        if buildStep.contains(.build) {
            // Assemble a build configuration from passed arguments
            let localPathsNeeded = packageInfo.dependencyMap.entries.values.map(\.localPath)
            let makeDockerContext = useDocker ? {
                let context = DockerContext(withAvailablePaths: localPathsNeeded)
                if let context = context {
                    printAndFlush("found docker binary: \(context.hostDockerBinary)")
                } else {
                    printAndFlush("not using docker")
                }
                return context
            } : { nil }
            let configuration = BuildConfiguration(
                debug: debug,
                fat: fat,
                codeCoveragePath: codeCoveragePath,
                baseDockerContext: Lazy(makeDockerContext()),
                disableParallelism: disableParallelism
            )

            // Pre-fetch dependencies for docker... TODO: can this be improved?
            if platforms.contains(where: { $0.needsDocker(configuration: configuration) }) {
                try cmd(
                    "swift", "build",
                    "--scratch-path", ".\(ps).build\(ps)android-build",
                    "--product", "FishyJoesJavaRuntime"
                ).run()
            }

            // When building a node native target on Windows, node.lib must be downloaded and put in the LIBPATH in order to build the NodeAPI dependency
            #if os(Windows)
            if platforms.contains(.node) {
                try DownloadNodeLib.download(
                    destinations: ["\(try Platform.node.extraLibPathDir(configuration))\(ps)node.lib"]
                )
            }
            #endif

            // Build libraries for the requested platforms
            for platform in platforms {
                let libs = [config.module] + config.requiredModules
                switch platform {
                case .wasm:
                    try platform.build(configuration: configuration)
                case .node:
                    let nodeLibsToBuild = config.extraDynamicLibraries + libs.flatMap { [$0, "\($0)-node"] } + ["FishyJoesNodeRuntime"]
                    try platform.build(
                        product: "\(config.module)-node",
                        libs: nodeLibsToBuild,
                        configuration: configuration
                    )
                case .kotlinSystem, .kotlinAndroid:
                    let javaLibsToBuild = config.extraDynamicLibraries + libs.flatMap { [$0, "\($0)-java"] } + ["FishyJoesJavaRuntime"]
                    try platform.build(
                        product: "\(config.module)-java",
                        libs: javaLibsToBuild,
                        configuration: configuration
                    )
                case .cSharp, .dart:
                    let iotaLibsToBuild = config.extraDynamicLibraries + libs.flatMap { [$0, "\($0)-iota"] } + ["FishyJoesIotaRuntime"]
                    try platform.build(
                        product: "\(config.module)-iota",
                        libs: iotaLibsToBuild,
                        configuration: configuration
                    )
                }
            }

            // Create / clean platform-specific output directories
            for platform in platforms {
                // Prepare output directory
                try cmd("rm", "-rf", platform.outputDir(config)).run()
                try cmd("mkdir", "-p", platform.outputDir(config)).run()
            }

            // Install libraries to platform-specific output directories
            for platform in platforms {
                let outputDir = platform.outputDir(config)

                // Define a function to install library files to the output directory
                func installLibrary(_ name: String, installName: String? = nil, sign: Bool = false) throws {
                    let src = "\(try platform.buildDir(configuration))\(ps)\(platform.dylibName(for: name))"
                    let installName = installName ?? platform.dylibName(for: name)
                    let dest = "\(outputDir)\(ps)\(installName)"
                    try cmd("cp", src, dest).run()
                    if sign, platform.dylibExt == "dylib" {
                        try cmd("codesign", "-s", "-", dest).run()
                    }
                }

                // Define functions to operate on files & lines to replace each instance of __MODULE_NAME__ with the name of a module
                // and replace each line containing __MODULE_DEPENDENCY__ with one line for each dependency module
                func template(line: String, moduleName: String, dependencies: [String]) -> [String] {
                    let line = line.replacingOccurrences(of: "__MODULE_NAME__", with: moduleName)
                    if line.contains("__MODULE_DEPENDENCY__") {
                        return dependencies.map {
                            line.replacingOccurrences(of: "__MODULE_DEPENDENCY__", with: $0)
                        }
                    } else {
                        return [line]
                    }
                }
                func template(inPath: String, outPath: String, moduleName: String, dependencies: [String]) throws {
                    var lines = try cmd("cat", inPath).runLines()
                    lines = lines.flatMap { template(line: $0, moduleName: moduleName, dependencies: dependencies) }
                    lines.append("") // newline terminate
                    try cmd("cat", "-")
                        .input(lines.joined(separator: "\n"))
                        .output(overwritingFile: outPath)
                        .run()
                }

                // Perform library installation and platform-specific customization
                switch platform {
                case .wasm, .node:
                    // Find the path to the runtime
                    let runtimePath = "\(fishyJoesDependency.localPath)\(ps)node-runtime"
                    guard cmd("test", "-d", runtimePath).runBool() else {
                        fatalError("Could not find node runtime at: \(runtimePath)")
                    }

                    // Collect the information about the module and its dependencies that will be needed to build node modules
                    var nodeModules: [
                        (
                            name: String,
                            localPath: String,
                            definitionsPath: String,
                            extensionsPath: String,
                            jsExports: [String],
                            tsExports: [String],
                            nativeLibName: String,
                            wasmMainShimName: String,
                            nodeShimLibName: String,
                            nodeShimCJSName: String,
                            npmPackageName: String,
                            npmModuleVersion: String
                        )
                    ] = []
                    nodeModules.append((
                        name: "Runtime",
                        localPath: runtimePath,
                        definitionsPath: "\(runtimePath)\(ps)fishyjoes-runtime-common",
                        extensionsPath: "\(runtimePath)\(ps)fishyjoes-runtime-common",
                        jsExports: ["Runtime"],
                        tsExports: ["Optional", "Runtime"],
                        nativeLibName: "FishyJoesNodeRuntime",
                        wasmMainShimName: "Runtime_WasmMainShim.wasm",
                        nodeShimLibName: "Runtime-node-shim",
                        nodeShimCJSName: "Runtime.cjs.node",
                        npmPackageName: "fishyjoes-runtime-\(platform.nodeExecutionEnvironment)",
                        npmModuleVersion: fishyJoesDependency.version ??
                            // If fishy-joes is file-local, use a file-local runtime too
                            "file:\(fishyJoesDependency.localPath)\(ps)node-runtime\(ps)fishyjoes-runtime-\(platform.nodeExecutionEnvironment)"
                    ))
                    for moduleName in config.requiredModules {
                        let bindingsModuleName = "\(moduleName)-bindings"
                        guard let dependency = packageInfo.dependencyMap[bindingsModuleName] else {
                            fatalError("Could not locate dependency \(bindingsModuleName) in Package.swift")
                        }
                        nodeModules.append((
                            name: moduleName,
                            localPath: dependency.localPath,
                            definitionsPath: "\(dependency.localPath)\(ps)Sources\(ps)Generated\(ps)NodeInterface",
                            extensionsPath: "ts",
                            jsExports: [moduleName],
                            tsExports: [moduleName],
                            nativeLibName: "\(moduleName)-node",
                            wasmMainShimName: "\(moduleName)_WasmMainShim.wasm",
                            nodeShimLibName: "\(moduleName)-node-shim",
                            nodeShimCJSName: "\(moduleName).cjs.node",
                            npmPackageName: "\(moduleName.lowercased())-\(platform.nodeExecutionEnvironment)",
                            npmModuleVersion: dependency.version ??
                                // If dependency is file-local, use a file-local dependency too
                                "file:\(dependency.localPath)\(ps)output\(ps)\(platform.platform)"
                        ))
                    }
                    nodeModules.append((
                        name: config.module,
                        localPath: "Sources\(ps)Generated\(ps)NodeInterface",
                        definitionsPath: "Sources\(ps)Generated\(ps)NodeInterface",
                        extensionsPath: "ts",
                        jsExports: [config.module],
                        tsExports: [config.module],
                        nativeLibName: "\(config.module)-node",
                        wasmMainShimName: "\(config.module)_WasmMainShim.wasm",
                        nodeShimLibName: "\(config.module)-node-shim",
                        nodeShimCJSName: "\(config.module).cjs.node",
                        npmPackageName: "\(config.module)-\(platform.nodeExecutionEnvironment)",
                        npmModuleVersion: "file:output\(ps)\(platform.platform)"
                    ))
                    let nodeDependencies = nodeModules.dropLast()
                    let nodeModule = nodeModules.last!

                    // Install the module and its dependencies, then assemble the Javascript files required to load them
                    if platform == .wasm {
                        // Install Wasm bundle to the output directory, using wasm-opt to optimize Wasm bundles if available
                        if wasmOpt, cmd("wasm-opt", "--version").runBool() {
                            try cmd("wasm-opt", "\(platform.buildDir(configuration))\(ps)\(nodeModule.wasmMainShimName)", "-O1", "-o", "\(outputDir)\(ps)\(nodeModule.name).wasm").run()
                        } else {
                            if wasmOpt {
                                printAndFlush("WARNING: wasm-opt is not installed, resulting build will be bigger and possibly slower")
                            } else {
                                printAndFlush("skipping wasm-opt")
                            }
                            try cmd("cp", "\(platform.buildDir(configuration))\(ps)\(nodeModule.wasmMainShimName)", "\(outputDir)\(ps)\(nodeModule.name).wasm").run()
                        }
                        try cmd("cp", "\(fishyJoesDependency.localPath)\(ps)Sources\(ps)FishyJoesNodeRuntime\(ps)Templates\(ps)wasm-napi.js", outputDir).run()

                        // Create the required Javascript files for loading the module's Wasm bundle
                        try template(
                            inPath: "\(fishyJoesDependency.localPath)\(ps)Sources\(ps)FishyJoesNodeRuntime\(ps)Templates\(ps)__MODULE_NAME__.js",
                            outPath: "\(outputDir)\(ps)\(nodeModule.name).js",
                            moduleName: nodeModule.name,
                            dependencies: nodeDependencies.map(\.name)
                        )
                        try template(
                            inPath: "\(fishyJoesDependency.localPath)\(ps)Sources\(ps)FishyJoesNodeRuntime\(ps)Templates\(ps)__MODULE_NAME__.browser.js",
                            outPath: "\(outputDir)\(ps)\(nodeModule.name).browser.js",
                            moduleName: nodeModule.name,
                            dependencies: nodeDependencies.map(\.name)
                        )

                        // Install Javascript extensions for dependencies so they are loaded when the Wasm bundle is loaded, if provided
                        for module in nodeModules {
                            let outPath = "\(outputDir)\(ps)\(module.name).extensions.js"
                            let extensionPath = "\(module.extensionsPath)\(ps)\(module.name).extensions.js"
                            if !cmd("cp", extensionPath, outPath).runBool() {
                                // No extensions found. Generate a no-op extension
                                try cmd("cat", "-")
                                    .input(
                                        """
                                        function applyExtensions() {}
                                        const imports = {};
                                        export { applyExtensions, imports };
                                        """
                                    )
                                    .output(overwritingFile: outPath)
                                    .run()
                            }
                        }
                    }
                    if platform == .node {
                        try config.extraDynamicLibraries.forEach {
                            try installLibrary($0)
                        }
                        // Install the module library and Node interfacing library
                        try installLibrary(nodeModule.name)
                        try installLibrary(nodeModule.nativeLibName)

                        // For node to load a library correctly, the file must be ".cjs.node", so compile a shim to load the actual Node interfacing library
                        // and copy it into the build directory so it can be installed like any other library
                        // and also remove intermediate files that MSVC makes but we don't need
                        // TODO: When SwiftPM supports product dependencies on targets within the same package, use them instead
                        // See: https://forums.swift.org/t/pitch-swiftpm-allow-targets-to-depend-on-products-in-the-same-package/57717/37
                        let shimDir = "Sources\(ps)Generated\(ps)NodeNativeShim"
                        try platform.clangBuild(
                            sources: ["\(shimDir)\(ps)NAPIRegisterModule.c"],
                            dependencies: [nodeModule.nativeLibName],
                            headerSearchPaths: ["\(fishyJoesDependency.localPath)\(ps)Sources\(ps)NodeAPI\(ps)include"],
                            librarySearchPaths: [platform.buildDir(configuration), platform.extraLibPathDir(configuration)],
                            outputPath: "\(platform.buildDir(configuration))\(ps)\(platform.dylibName(for: nodeModule.nodeShimLibName))",
                            configuration: configuration
                        )
                        try installLibrary(nodeModule.nodeShimLibName, installName: nodeModule.nodeShimCJSName)
                        for intermediateBuildResult in ["NAPIRegisterModule.exp", "NAPIRegisterModule.lib"] {
                            if cmd("test", "-f", intermediateBuildResult).runBool() {
                                try? cmd("rm", intermediateBuildResult).run()
                            }
                        }

                        // Create the required Javascript files for loading the module's native library from node
                        var moduleDotJS: [String] = []
                        for dependency in nodeDependencies {
                            moduleDotJS.append("export { \(dependency.jsExports.joined(separator: ", ")) } from '@cricut/\(dependency.npmPackageName)';")
                        }
                        moduleDotJS.append("import { createRequire } from 'module';")
                        moduleDotJS.append("const require = createRequire(import.meta.url);")
                        moduleDotJS.append("export const { \(nodeModule.name) } = require('./\(nodeModule.name).cjs');")
                        moduleDotJS.append("export default \(nodeModule.name);")
                        try cmd("echo", moduleDotJS.joined(separator: "\n")).output(overwritingFile: "\(outputDir)\(ps)\(config.module).js").run()

                        // Configure loading of Javascript extensions when the module is loaded by node, if provided
                        let outPath = "\(outputDir)\(ps)\(nodeModule.name).extensions.js"
                        if !cmd("cp", "\(nodeModule.extensionsPath)\(ps)\(config.module).extensions.js", outPath).runBool() {
                            // No extensions found. Generate a no-op extension file for the module
                            try cmd("cat", "-")
                                .input(
                                        """
                                        function applyExtensions() {}
                                        const imports = {};
                                        export { applyExtensions, imports };
                                        """
                                )
                                .output(overwritingFile: outPath)
                                .run()
                        }
                    }

                    // Assemble a TypeScript definitions file for the module from its dependencies, its own definitions, and its extensions
                    var definitions: [String] = []
                    for dependency in nodeDependencies {
                        if platform == .wasm {
                            // Splat in depenency definitions
                            let dependencyDefinitionsPath = "\(dependency.definitionsPath)\(ps)\(dependency.name).d.ts.part"
                            let dependencyDefintions = try String(contentsOfFile: dependencyDefinitionsPath)
                            definitions.append(contentsOf: dependencyDefintions.split(separator: "\n").map(String.init))
                            definitions.append("")

                            // Splat in dependency extension definitions, if present
                            let dependencyExtensionDefinitionsPath = "\(dependency.definitionsPath)\(ps)\(dependency.name).extensions.d.ts.part"
                            if cmd("test", "-f", dependencyExtensionDefinitionsPath).runBool() {
                                let dependencyExtensionDefintions = try String(contentsOfFile: dependencyExtensionDefinitionsPath)
                                definitions.append(contentsOf: dependencyExtensionDefintions.split(separator: "\n").map(String.init))
                                definitions.append("")
                            }
                        }
                        if platform == .node {
                            // Import and re-export the dependency exports
                            definitions.append("import { \(dependency.tsExports.joined(separator: ", ")) } from '@cricut/\(dependency.npmPackageName)';")
                            definitions.append("export { \(dependency.tsExports.joined(separator: ", ")) } from '@cricut/\(dependency.npmPackageName)';")
                        }
                    }
                    definitions.append("")

                    // Splat in the module's own definitions
                    let moduleDefinitionsPath = "Sources\(ps)Generated\(ps)NodeInterface\(ps)\(nodeModule.name).d.ts.part"
                    let moduleDefinitions = try String(contentsOfFile: moduleDefinitionsPath)
                    definitions.append(contentsOf: moduleDefinitions.split(separator: "\n").map(String.init))
                    definitions.append("")

                    // Splat in the module's extension definitions
                    let moduleExtensionsPath = "\(nodeModule.extensionsPath)\(ps)\(nodeModule.name).extensions.d.ts.part"
                    if cmd("test", "-f", moduleExtensionsPath).runBool() {
                        let moduleExtensionDefinitions = try String(contentsOfFile: moduleExtensionsPath)
                        definitions.append(contentsOf: moduleExtensionDefinitions.split(separator: "\n").map(String.init))
                        definitions.append("")
                    }

                    // Export a function that can be used to load the module and its dependencies using a promise
                    definitions.append("export declare function init(): Promise<{")
                    for dependency in nodeDependencies {
                        definitions.append("    \(dependency.name): typeof \(dependency.name),")
                    }
                    definitions.append("    \(nodeModule.name): typeof \(nodeModule.name),")
                    definitions.append("}>;")
                    definitions.append("")

                    // Make the module's own definitions the default export
                    definitions.append("export default \(nodeModule.name);")
                    definitions.append("")

                    // Write out the assembled definitions file
                    try cmd("cat", "-")
                        .input(definitions.joined(separator: "\n"))
                        .output(overwritingFile: "\(outputDir)\(ps)\(nodeModule.name).d.ts")
                        .run()

                    // Generate the package.json file from the template
                    let packageVersion = version ?? "0.0.1" // If no version is provided, use a dummy version to build the package
                    var npmDependencies = try cmd("cat", "package.template.json").runJSON(NPMPackage.self).dependencies ?? [:]
                    for dependency in nodeDependencies {
                        npmDependencies["@cricut/\(dependency.npmPackageName)"] = dependency.npmModuleVersion
                    }
                    var package = NPMPackage(
                        config: config,
                        platform: platform,
                        version: packageVersion,
                        dependencies: npmDependencies
                    )
                    if platform.platform == "node-native-macos" || platform.platform == "node-native-ubuntu" {
                        // When on macOS & Ubuntu, dlopen() needs file-relative native libraries, so add a post-install script to the package to setup symlinks to dependency DYLIBs / SOs
                        var postinstall = """
                        #!/bin/bash
                        #

                        set -ex
                        if [[ "$npm_package_version" == "0.0.1" ]]; then
                            # We are installed as a file local package
                            package_directory="node_modules/@cricut"
                        else
                            # We are installed as a published package
                            package_directory=".."
                        fi


                        """

                        for dependency in nodeDependencies {
                            let nativeLibFilename = platform.dylibName(for: dependency.nativeLibName)
                            postinstall += """
                                ln -sf "$(realpath \"$package_directory/\(dependency.npmPackageName)/\(nativeLibFilename)\")" "\"\(nativeLibFilename)\""

                            """
                        }
                        for xdl in config.extraDynamicLibraries {
                            let nativeLibFilename = platform.dylibName(for: xdl)
                            for destDirSuffix in ["macos", "ubuntu", "windows"] {
                                postinstall += """
                                    ln -sf "$(realpath \"$package_directory/output/node-native-\(destDirSuffix)/\(nativeLibFilename)\")" "\"\(nativeLibFilename)\""

                                """
                            }
                        }

                        try cmd("cat")
                            .input(postinstall)
                            .output(overwritingFile: "\(platform.outputDir(config))\(ps)postinstall.sh")
                            .run()
                        try cmd("chmod", "+x", "\(platform.outputDir(config))\(ps)postinstall.sh").run()
                        package.scripts[default: [:]]["postinstall"] = "./postinstall.sh"
                    }
                    if platform.platform == "node-native-windows" {
                        // When on Windows, LoadLibrary() needs file-relative native libraries, so add a post-install script to the package to copy dependency DLLs
                        var postinstall = """
                        @ECHO ON
                        IF %npm_package_version%==0.0.1 (SET package_directory=node_modules\\@cricut) ELSE (SET package_directory=..)

                        """

                        for dependency in nodeDependencies {
                            let nativeLibFilename = platform.dylibName(for: dependency.nativeLibName)
                            // TODO: Should copy?!? How to establish this link with only one file?
                            postinstall += """
                            COPY "%package_directory%\\\(dependency.npmPackageName)\\\(nativeLibFilename)" "\(nativeLibFilename)"

                            """
                        }

                        try cmd("cat")
                            .input(postinstall)
                            .output(overwritingFile: "\(platform.outputDir(config))\(ps)postinstall.cmd")
                            .run()
                        package.scripts[default: [:]]["postinstall"] = "postinstall.cmd"
                    }
                    let packageJsonPath = "\(platform.outputDir(config))\(ps)package.json"
                    try cmd("cat")
                        .inputJSON(from: package, encoder: PrettyJSONEncoder())
                        .output(overwritingFile: packageJsonPath)
                        .run()
                case .kotlinSystem, .kotlinAndroid:
                    // Install the module library and interfacing JNI library
                    // Don't copy over any dependency's extraDynamicLibraries for Kotlin because it's bundled by maven from the dependency.
                    try config.extraDynamicLibraries.forEach {
                        try installLibrary($0)
                    }
                    try installLibrary(config.module)
                    try installLibrary("\(config.module)-java")
                case .cSharp:
                    // Install the module library, interfacing library, and required module libraries
                    try cmd("mkdir", "-p", outputDir).run()
                    var libs = config.extraDynamicLibraries
                    libs += [
                        "FishyJoesIotaRuntime",
                        config.module,
                        config.module + "-iota",
                    ] + config.requiredModules.flatMap { module in
                        [
                            module,
                            module + "-iota",
                        ]
                    }
                    for lib in libs {
                        try installLibrary(lib)
                    }
                case .dart:
                    // Install the module library, interfacing library, and required module libraries, signing if necessary
                    try cmd("mkdir", "-p", outputDir).run()
                    var libs = config.extraDynamicLibraries
                    libs += [
                        "FishyJoesIotaRuntime",
                        config.module,
                        config.module + "-iota",
                    ] + config.requiredModules.flatMap { module in
                        [
                            module,
                            module + "-iota",
                        ]
                    }
                    for lib in libs {
                        try installLibrary(lib, sign: true)
                    }
                }
            }

            // Compile generated interfacing source code files for platforms that require it (e.g. not node-native or wasm)
            for platform in platforms {
                switch platform {
                case .wasm, .node:
                    break
                case .kotlinSystem:
                    try withDirectory("kotlin") {
                        try platform.gradleBuild("assemble", configuration: configuration).run()
                    }
                case .kotlinAndroid:
                    // Compiled along with .kotlinSystem
                    break
                case .cSharp:
                    try withDirectory("c-sharp") {
                        try platform.dotnetBuild("Cricut.\(config.module).sln", configuration: configuration).run()
                    }
                case .dart:
                    try withDirectory("dart") {
                        try platform.dartBuild(configuration: configuration).run()
                    }
                }
            }
        }

        // MARK: - Test Step
        if buildStep.contains(.test) {
            for platform in platforms {
                // Run the test suite for the library for the requested platforms
                switch platform {
                case .wasm, .node:
                    try withDirectory(platform.outputDir(config)) {
                        // Perform a file-local install of the module and its dependencies
                        // TODO: Should build a package tarball and install it instead?
                        try platform.npm("install").run()
                    }
                    try withDirectory("node-test") {
                        // Perform a file-local install of the test package and its dependencies
                        // TODO: Should build a package tarball and install it instead?
                        try platform.npm("install").run()

                        // Use npm to execute the test suite
                        try platform.npm("run", "clear-cache").run()
                        try platform.npmTest(codeCoveragePath: codeCoveragePath).run()
                    }
                case .kotlinSystem:
                    // Use gradle to execute the test suite
                    try withDirectory("kotlin") {
                        try platform.gradleTest(codeCoveragePath: codeCoveragePath).run()
                    }
                case .kotlinAndroid:
                    // TODO: Execute Android tests from FishyJoes
                    break
                case .cSharp:
                    // Use dotnet to execute the test suite
                    try withDirectory("c-sharp") {
                        if codeCoveragePath != nil, !cmd("dotnet-coverage", "--version").runBool() {
                            printAndFlush("Couldn't find dotnet-coverage! Install with:")
                            printAndFlush()
                            printAndFlush("   dotnet tool install --global dotnet-sonarscanner")
                            printAndFlush()
                            printAndFlush("and ensure that $HOME/.dotnet/tools is in your path")
                        }
                        try platform.dotnetTest("Cricut.\(config.module).sln", codeCoveragePath: codeCoveragePath).run()
                    }
                case .dart:
                    try withDirectory("dart") {
                        // Fetch binary artifacts
                        try cmd("dart", "run", "fishyjoes_dart:setup").run()

                        // Use dart to execute the test suite
                        try platform.dartTest(codeCoveragePath: codeCoveragePath).run()
                    }
                }
            }
        }

        // MARK: - Pack Step
        if buildStep.contains(.pack) {
            for platform in platforms {
                switch platform {
                case .wasm, .node:
                    // Update version number in package, if provided
                    if let version = version {
                        // Read package.json and update the version
                        let packageJsonPath = "\(platform.outputDir(config))\(ps)package.json"
                        var package = try cmd("cat", packageJsonPath).runJSON(NPMPackage.self)
                        package.version = version

                        // Write out the new package.json
                        try cmd("cat")
                            .inputJSON(from: package, encoder: PrettyJSONEncoder())
                            .output(overwritingFile: packageJsonPath)
                            .run()
                    }

                    // Pack using npm
                    try platform.npm("pack", ".\(ps)\(platform.outputDir(config))").run()
                case .kotlinSystem, .kotlinAndroid:
                    // Pack happens as part of publish step in gradle
                    ()
                case .cSharp:
                    // Pack using dotnet
                    // The `XDL` initialism is used to denote `Extra dynamic library` below:
                    // Currently, both direct XDLs and dependency's XDLs are copyied into the same directory for C# currently.
                    // So we remove the dependency's XDLs here because we don't want to redundantly package them, as they are already packaged with the dependencies.
                    var dependencyXDLs = Set<String>()
                    fishyJoesYamlConfigs.forEach { dependencyXDLs.formUnion($0.extraDynamicLibraries) }
                    let rmArgs = ["-f"] + dependencyXDLs.flatMap {
                        [
                            "c-sharp\(ps)Cricut.\(config.module)\(ps)runtimes\(ps)osx\(ps)native\(ps)lib\($0).dylib",
                            "c-sharp\(ps)Cricut.\(config.module)\(ps)runtimes\(ps)linux\(ps)native\(ps)lib\($0).so",
                            "c-sharp\(ps)Cricut.\(config.module)\(ps)runtimes\(ps)win\(ps)native\(ps)\($0).dll"
                        ]
                    }
                    try cmd("rm", arguments: rmArgs).run()

                    let name = "Cricut.\(config.module)"
                    let version = version ?? "0.0.1-unknown"
                    try cmd("dotnet", "pack", "-c", "Release", "c-sharp\(ps)\(name)\(ps)\(name).csproj", "/p:Version=\(version)").run()
                    try cmd("cp", "c-sharp\(ps)\(name)\(ps)bin\(ps)Release\(ps)\(name).\(version).nupkg", ".").run()
                case .dart:
                    let tarCmdArgs = [
                        "-cvzf", "\(config.module)-bindings-dart-binaries.tgz", "-C", "dart"
                    ] + config.extraDynamicLibraries.flatMap {
                        [
                            "macos\(ps)native\(ps)lib\($0).dylib",
                            "linux\(ps)native\(ps)lib\($0).so",
                            "windows\(ps)native\(ps)\($0).dll"
                        ]
                    } + [
                        "macos\(ps)native\(ps)lib\(config.module).dylib",
                        "macos\(ps)native\(ps)lib\(config.module)-iota.dylib",
                        "linux\(ps)native\(ps)lib\(config.module).so",
                        "linux\(ps)native\(ps)lib\(config.module)-iota.so",
                        "windows\(ps)native\(ps)\(config.module).dll",
                        "windows\(ps)native\(ps)\(config.module)-iota.dll"
                    ]
                    try cmd("tar", arguments: tarCmdArgs).run()

                    // Generate flutter package from dart package
                    try cmd("rm", "-rf", "dart\(ps)flutter-package").run()
                    try cmd("mkdir", "-p", "dart\(ps)flutter-package\(ps)macos\(ps)native").run()
                    try cmd("mkdir", "-p", "dart\(ps)flutter-package\(ps)linux\(ps)native").run()
                    try cmd("mkdir", "-p", "dart\(ps)flutter-package\(ps)windows\(ps)native").run()

                    try cmd("yq", ".version = strenv(VERSION)", addEnv: ["VERSION": version ?? "0.0.1-unknown"])
                        .input(fromFile: "dart\(ps)npm_flutter_pubspec.yaml")
                        .output(overwritingFile: "dart\(ps)flutter-package\(ps)pubspec.yaml")
                        .run()

                    let installList = [
                        (path: "lib\(ps)", required: true),

                        (path: "macos\(ps)cricut_\(config.module.lowercased()).podspec", required: true),
                        (path: "macos\(ps)native\(ps)lib\(config.module).dylib", required: false),
                        (path: "macos\(ps)native\(ps)lib\(config.module)-iota.dylib", required: false),

                        (path: "linux\(ps)CMakeLists.txt", required: true),
                        (path: "linux\(ps)native\(ps)lib\(config.module).so", required: false),
                        (path: "linux\(ps)native\(ps)lib\(config.module)-iota.so", required: false),

                        (path: "windows\(ps)CMakeLists.txt", required: true),
                        (path: "windows\(ps)native\(ps)\(config.module).dll", required: false),
                        (path: "windows\(ps)native\(ps)\(config.module)-iota.dll", required: false),
                    ] +
                    config.extraDynamicLibraries.flatMap {
                        [
                            (path: "macos\(ps)native\(ps)lib\($0).dylib", required: true),
                            (path: "linux\(ps)native\(ps)lib\($0).so", required: true),
                            (path: "windows\(ps)native\(ps)\($0).dll", required: true)
                        ]
                    }

                    for (path, required) in installList {
                        if required {
                            try cmd("cp", "-r", "dart\(ps)\(path)", "dart\(ps)flutter-package\(ps)\(path)").run()
                        } else {
                            try? cmd("cp", "-r", "dart\(ps)\(path)", "dart\(ps)flutter-package\(ps)\(path)").run()
                        }
                    }

                    var package = NPMPackage(name: "@cricut/flutter-\(config.module.lowercased())")
                    package.version = version ?? "0.0.1" // If no version is provided, use a dummy version to package

                    // If fishy-joes is file-local, use a file-local runtime too
                    let runtimeVersion = fishyJoesDependency.version ??
                        "file:\(fishyJoesDependency.localPath)\(ps)dart-runtime\(ps)flutter-package"

                    var dependencies = ["@cricut/flutter-fishyjoes-runtime": runtimeVersion]
                    for module in config.requiredModules {
                        let bindingsModuleName = "\(module)-bindings"
                        guard let dependency = packageInfo.dependencyMap[bindingsModuleName] else {
                            fatalError("Could not locate dependency \(bindingsModuleName) in Package.swift")
                        }

                        // If dependency is file-local, use a file-local dependency too
                        let moduleVersion = dependency.version ?? "file:\(dependency.localPath)/dart/flutter-package/"
                        dependencies["@cricut/flutter-\(module.lowercased())"] = moduleVersion
                    }
                    package.dependencies = dependencies
                    try cmd("cat")
                        .inputJSON(from: package, encoder: PrettyJSONEncoder())
                        .output(overwritingFile: "dart\(ps)flutter-package\(ps)package.json")
                        .run()

                    // Pack using npm
                    try platform.npm("pack", ".\(ps)dart\(ps)flutter-package").run()
                }
            }
        }
    }

    // MARK: utilities

    func withDirectory<R>(_ dirName: String, body: () throws -> R) throws -> R {
        func printDir() {
            print("Entering directory `\(FileManager.default.currentDirectoryPath)'")
            fflush(stdout)
        }
        defer { printDir() }
        return try FileManager.default.withCurrentDirectoryPath(dirName) {
            printDir()
            return try body()
        }
    }
}
