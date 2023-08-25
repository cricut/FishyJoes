import ArgumentParser
import Foundation
import swsh

public struct CodeGen: ParsableCommand {
    @Flag(name: .shortAndLong, help: "suppress verbose output")
    var quiet = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a NodeJS N-API based node package")
    var nodejs = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Web-assembly based node package")
    var wasm = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a C++ package")
    var cpp = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Kotlin package")
    var kotlin = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Kotlin package without android support (much faster)")
    var kotlinFast = false

    @Flag(name: [.long, .customLong("C🗡️")], inversion: .prefixedNo, help: "Generate a C# Package")
    var cSharp = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Additional wasm optimizations (takes some time)")
    var wasmOpt = true

    @Flag(name: .long, help: "build macOS libraries for both x64_64 and arm64")
    var fat = false

    @Flag(name: .long, help: "Build library in debug mode")
    var debug = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Use docker")
    var useDocker = true

    @Option(help: "Used for debugging fishy-joes code generation")
    var sourceryDumpPath: String?

    @Option(name: .long, help: "Update version number of generated package.")
    var version: String?

    enum BuildStep: String, CaseIterable, ExpressibleByArgument {
        case generate, build, test, pack
    }

    let codeCoveragePath = ProcessInfo.processInfo.environment["FISHYJOES_COVERAGE_PATH"]

    @Argument(
        help: """
            one or more of:
             - generate: run sourcery code-generation step
             - build: compile generated bindings into a dynamic library
             - test: test calling dynamic library from typescript
             - pack: create tgz package of npm module in root

            """
    )
    var buildStep: [BuildStep] = [.generate, .build, .test]

    enum CodingKeys: CodingKey {
        case quiet
        case nodejs
        case wasm
        case cpp
        case kotlin
        case kotlinFast
        case cSharp
        case wasmOpt
        case useDocker
        case sourceryDumpPath
        case version
        case buildStep
        case debug
        case fat
    }

    var config: FishyJoesConfig!
    var platforms: [Platform] = []

    public init() {}
}

extension CodeGen {
    public mutating func validate() throws {
        ExternalCommand.verbose = !quiet

        guard cmd("test", "-f", "Package.swift").runBool() else {
            throw ValidationError("No Package.swift found in current directory. fishy-joes must be run in the root of the bindings package")
        }

        config = try FishyJoesConfig.readFromFile()

        if wasm {
            platforms.append(.wasm)
        }
        if nodejs {
            platforms.append(.node)
        }
        if cpp {
            platforms.append(.cpp)
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

        // Locate dependency bindings modules required by this bindings module
        var dependencyPaths: [String: String] = [config.module: "."]
        for moduleName in config.requiredModules {
            let bindingModule = "\(moduleName)-bindings"
            guard let dependencyURL = packageInfo.dependencyMap[bindingModule.lowercased()] else {
                fatalError("Couldn't locate \(bindingModule) in Package.swift, but it's required by fishyjoes.json")
            }
            let dependencyPath = (dependencyURL.scheme == nil ? dependencyURL.path : ".build/checkouts/\(bindingModule)") + "/Sources"
            dependencyPaths[moduleName] = dependencyPath
        }
        let localPathsNeeded = packageInfo.dependencyMap.compactMap {
            let url = $0.value
            return url.scheme == nil ? url.path : nil
        }

        // MARK: - Generate Step
        if buildStep.contains(.generate) {
            // Locate sources to translate
            let translateeSources: String
            if let translateeDependency = packageInfo.dependencyMap[config.module.lowercased()] {
                translateeSources = (translateeDependency.scheme == nil ? translateeDependency.path : ".build/checkouts/\(config.module)") + "/Sources"
            } else if let sourcePath = packageInfo.path(toTarget: config.module) {
                translateeSources = sourcePath
            } else {
                fatalError("Couldn't locate module for translation '\(config.module)' in Package.swift")
            }
            guard packageInfo.dependencyMap["fishyjoes"] != nil else {
                fatalError("Couldn't locate FishyJoes in Package.swift")
            }

            // Locate dependency module configuration files
            let fishyJoesModuleFiles: [String] = dependencyPaths.compactMap {
                $0.key == config.module ? nil : "\($0.value)/Generated/\($0.key).fishyjoesmodule"
            }

            // Prepare destination directories for the Swift-side interface files for the translated foreign languages
            try cmd("rm", "-rf", "Sources/Generated", "kotlin/src/generated", "DebugGenerated", "cpp").run()
            try cmd("mkdir", "-p",
                    "Sources/Generated/CSharpInterface",
                    "Sources/Generated/NodeInterface",
                    "Sources/Generated/JavaInterface",
                    "Sources/Generated/CPPInterface",
                    "kotlin/src/generated/kotlin/com/cricut/\(config.module.lowercased())"
            ).run()
            try cmd(
                "touch",
                "Sources/Generated/CSharpInterface/EmptyPlaceholder.swift",
                "Sources/Generated/NodeInterface/EmptyPlaceholder.swift",
                "Sources/Generated/JavaInterface/EmptyPlaceholder.swift",
                "Sources/Generated/CPPInterface/EmptyPlaceholder.swift"
            ).run()

            // Build the Sourcery tool itself
            try cmd("swift", "build", "--product", "sourcery").run()

            // Build the FishyJoes internal execution helper product
            try cmd("swift", arguments: ["build"] + (codeCoveragePath == nil ? [] : Platform.coverageFlags) + ["--product", "🐟☕️"]).run()

            // Trampoline into fishy-joes-execution-helper via Sourcery
            var sourceryEnv: [String: String] = [:]
            if let sourceryDumpPath = sourceryDumpPath {
                sourceryEnv["DUMP_SOURCERY_DATA"] = URL(fileURLWithPath: (sourceryDumpPath as NSString).expandingTildeInPath, isDirectory: false).path
            }
            if let codeCoveragePath = codeCoveragePath {
                sourceryEnv["LLVM_PROFILE_FILE"] = "\(codeCoveragePath)/fishy-joes-execution-helper-\(UUID()).profraw"
            }

            // Provide access to stderr for the fishy-joes core
            // This is necessary because sourcery intercepts stderr and fails if it is used at all
            // Create a temporary named pipe
            // https://unix.stackexchange.com/a/29918/5471
            let errorFifoPath = try cmd("mktemp", "-u").runString()
            try cmd("mkfifo", errorFifoPath).run()
            defer { try? cmd("rm", errorFifoPath).run() }
            let errorReporter = cmd("cat", errorFifoPath).async(stdout: .stderr)

            // Execute Sourcery to generate the Swift-side and foreign-side source files for all supported language targets
            try cmd(
                ".build/debug/sourcery",
                arguments: [
                    quiet ? "-q" : nil,
                    "--disableCache",
                    "--parseDocumentation",
                    "--sources", translateeSources,
                    "--templates", ".build/debug/FishyJoes_FishyJoesExecutionHelper.bundle/FishyJoes.swifttemplate",
                    "--args", "module=\(config.module)",
                    "--args", "debugRepresentation=\(debug)",
                    "--args", "requiredModules=\"\(try! JSONEncoder().encode(fishyJoesModuleFiles).base64EncodedString())\"",
                    "--args", "fishyJoesExecutable=.build/debug/🐟☕️",
                    "--args", "stderrFifo=\(errorFifoPath)",
                    "--output", "Sources/Generated"
                ].compactMap { $0 },
                addEnv: sourceryEnv
            ).run()
            try errorReporter.succeed()
        }

        // MARK: - Build Step
        if buildStep.contains(.build) {
            // Assemble a build configuration from passed arguments
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
                codeCoverage: codeCoveragePath != nil,
                baseDockerContext: Lazy(makeDockerContext())
            )

            // Pre-fetch dependencies for docker... TODO: can this be improved?
            if platforms.contains(where: { $0.needsDocker(configuration: configuration) }) {
                try cmd(
                    "swift", "build",
                    "--scratch-path", "./.build/android-build",
                    "--product", "FishyJoesJavaRuntime"
                ).run()
            }

            // Build libraries for the requested platforms
            for platform in platforms {
                let libs = [config.module] + config.requiredModules
                switch platform {
                case .wasm:
                    try platform.build(configuration: configuration)
                case .node:
                    try platform.build(
                        product: "\(config.module)-node",
                        libs: libs.flatMap { [$0, "\($0)-node"] },
                        configuration: configuration
                    )
                case .kotlinSystem, .kotlinAndroid:
                    try platform.build(
                        product: "\(config.module)-java",
                        libs: libs.flatMap { [$0, "\($0)-java"] } + ["FishyJoesJavaRuntime"],
                        configuration: configuration
                    )
                case .cpp:
                    try platform.build(
                        product: "\(config.module)-cpp",
                        libs: libs.flatMap { [$0, "\($0)-cpp"] },
                        configuration: configuration
                    )
                case .cSharp:
                    try platform.build(
                        product: "\(config.module)-c-sharp",
                        libs: libs.flatMap { [$0, "\($0)-c-sharp"] } + ["FishyJoesCSharpRuntime"],
                        configuration: configuration
                    )
                }
            }

            // Install libraries to platform-specific output directories
            for platform in platforms {
                // Prepare output directory
                let outputDir = platform.outputDir(config)
                try cmd("rm", "-rf", outputDir).run()
                try cmd("mkdir", "-p", outputDir).run()

                // Define a function to install library files to the output directory
                func installLibrary(_ name: String, installName: String? = nil) throws {
                    let src = "\(try platform.buildDir(configuration))/lib\(name).\(platform.dylibExt)"
                    let installName = installName ?? "lib\(name).\(platform.dylibExt)"
                    let dest = "\(outputDir)/\(installName)"
                    try cmd("cp", src, dest).run()
                }

                // Perform library installation and platform-specific customization
                switch platform {
                case .wasm:
                    // Configure wasm-opt to optimize Wasm bundles
                    if wasmOpt, cmd("wasm-opt", "--version").runBool() {
                        try cmd("wasm-opt", "\(platform.buildDir(configuration))/DummyMain.wasm", "-O1", "-o", "\(outputDir)/\(config.module).wasm").run()
                    } else {
                        if wasmOpt {
                            printAndFlush("WARNING: wasm-opt is not installed, resulting build will be bigger and possibly slower")
                        } else {
                            printAndFlush("skipping wasm-opt")
                        }
                        try cmd("cp", "\(platform.buildDir(configuration))/DummyMain.wasm", "\(outputDir)/\(config.module).wasm").run()
                    }
                    try cmd("cp", "\(platform.buildDir(configuration))/FishyJoes_FishyJoesNodeRuntime.resources/js/wasm-napi.js", outputDir).run()

                    // Find the path to the runtime
                    let runtimeDirectorySearchLocations = [".build/checkouts/FishyJoes/node-runtime", "../../node-runtime"]
                    guard let runtimePath = runtimeDirectorySearchLocations.first(where: { cmd("test", "-d", $0).runBool() }) else {
                        fatalError("Could not locate runtime at any of: \(runtimeDirectorySearchLocations)")
                    }

                    // Collect the TypeScript definitions for the module and extensions for dependency modules then concatenate them together into one file
                    var tsSources = [
                        "Sources/Generated/NodeInterface/\(config.module).d.ts",
                        "\(runtimePath)/fishyjoes-runtime-common/Runtime.d.ts",
                    ]
                    for (moduleName, modulePath) in dependencyPaths {
                        let path = "\(modulePath)/ts/\(moduleName).extensions.d.ts"
                        if cmd("test", "-f", path).runBool() {
                            tsSources.append(path)
                        }
                    }
                    try cmd("cat", arguments: tsSources).output(overwritingFile: "\(outputDir)/\(config.module).d.ts").run()

                    // Create the required Javascript files for loading the module's Wasm bundle from a web browser
                    // Replace each instance of __MODULE_NAME__ with the name of the module
                    // Replace each line containing __MODULE_DEPENDENCY__ with one line for each dependency module
                    func template(line: String) -> [String] {
                        let line = line.replacingOccurrences(of: "__MODULE_NAME__", with: config.module)
                        if line.contains("__MODULE_DEPENDENCY__") {
                            return (config.requiredModules + ["Runtime"]).map {
                                line.replacingOccurrences(of: "__MODULE_DEPENDENCY__", with: $0)
                            }
                        } else {
                            return [line]
                        }
                    }
                    func template(inPath: String, outPath: String) throws {
                        var lines = try cmd("cat", inPath).runLines()
                        lines = lines.flatMap(template(line:))
                        lines.append("") // newline terminate
                        try cmd("cat", "-")
                            .input(lines.joined(separator: "\n"))
                            .output(overwritingFile: outPath)
                            .run()
                    }
                    try template(
                        inPath: "\(platform.buildDir(configuration))/FishyJoes_FishyJoesNodeRuntime.resources/js/__MODULE_NAME__.js",
                        outPath: "\(outputDir)/\(config.module).js"
                    )
                    try template(
                        inPath: "\(platform.buildDir(configuration))/FishyJoes_FishyJoesNodeRuntime.resources/js/__MODULE_NAME__.browser.js",
                        outPath: "\(outputDir)/\(config.module).browser.js"
                    )

                    // Configure loading of Javascript extensions when the Wasm bundle is loaded, if provided by dependency modules
                    try cmd("cp", "\(runtimePath)/fishyjoes-runtime-common/Runtime.extensions.js", "\(outputDir)/Runtime.extensions.js").run()
                    for (moduleName, modulePath) in dependencyPaths {
                        let outPath = "\(outputDir)/\(moduleName).extensions.js"
                        if !cmd("cp", "\(modulePath)/ts/\(moduleName).extensions.js", outPath).runBool() {
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
                case .node:
                    // Install the module library
                    for dependency in config.requiredModules + [config.module] {
                        try installLibrary(dependency)

                        // For node to load a library correctly, the file must be ".cjs.node" and not a symlink
                        // But for the linker to find required libraries, they need their original names.
                        // So we symlink `libModule-node.dylib` -> `module.cjs.node`
                        let compiledLibName = "lib\(dependency)-node.\(platform.dylibExt)"
                        let nodeLibName = "\(dependency).cjs.node"
                        try installLibrary("\(dependency)-node", installName: nodeLibName)
                        try installLibrary(dependency)
                        try cmd("ln", "-s", nodeLibName, "\(outputDir)/\(compiledLibName)").run()
                    }

                    // Install the module TypeScript definitions
                    try cmd(
                        "cp",
                        "Sources/Generated/NodeInterface/\(config.module).d.ts",
                        outputDir
                    ).run()

                    // Create the required Javascript files for loading the module's native library from node
                    var moduleDotJS = [
                        "export { Runtime } from '@cricut/fishyjoes-runtime-\(platform.executionEnvironment)'",
                        "import { createRequire } from 'module';",
                        "const require = createRequire(import.meta.url);",
                    ]
                    for module in config.requiredModules + [config.module] {
                        moduleDotJS.append("export const { \(module) } = require('./\(module).cjs');")
                    }
                    moduleDotJS.append("export default \(config.module);")
                    try cmd("echo", moduleDotJS.joined(separator: "\n")).output(overwritingFile: "\(outputDir)/\(config.module).js").run()

                    // Collect the TypeScript definitions for the module and its extensions then concatenate them together into one file
                    var tsSources = ["Sources/Generated/NodeInterface/\(config.module).d.ts"]
                    let path = "ts/\(config.module).extensions.d.ts"
                    if cmd("test", "-f", path).runBool() {
                        tsSources.append(path)
                    }
                    try cmd("cat", arguments: tsSources).output(overwritingFile: "\(outputDir)/\(config.module).d.ts").run()

                    // Configure loading of Javascript extensions when the module is loaded by node, if provided
                    let outPath = "\(outputDir)/\(config.module).extensions.js"
                    if !cmd("cp", "ts/\(config.module).extensions.js", outPath).runBool() {
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
                case .kotlinSystem, .kotlinAndroid:
                    // Install the module library and interfacing JNI library
                    try installLibrary(config.module)
                    try installLibrary("\(config.module)-java")
                case .cSharp:
                    // Install the module library and interfacing library
                    try installLibrary(config.module)
                    try installLibrary("\(config.module)-c-sharp")
                case .cpp:
                    break
                }
            }

            // Generate files whose creation requires use of template files
            if version == nil {
                // No version provided, use dummy version to build package
                version = "0.0.1"
            }
            for platform in platforms {
                switch platform {
                case .wasm, .node:
                    if let version = version {
                        // Generate package.json from template
                        let packageJsonPath = "\(platform.outputDir(config))/package.json"
                        let prettyEncoder = JSONEncoder()
                        prettyEncoder.outputFormatting = [
                            .prettyPrinted,
                            .withoutEscapingSlashes
                        ]
                        let templatePackage = try cmd("cat", "package.template.json").runJSON(NPMPackage.self)
                        let package = NPMPackage(
                            config: config,
                            platform: platform,
                            version: version,
                            dependencies: templatePackage.dependencies
                        )
                        try cmd("cat")
                            .inputJSON(from: package, encoder: prettyEncoder)
                            .output(overwritingFile: packageJsonPath)
                            .run()

                        // Be a good unix citizen and terminate with a newline
                        try cmd("echo")
                            .append(toFile: packageJsonPath)
                            .run()
                    }
                case .kotlinSystem, .kotlinAndroid, .cpp, .cSharp:
                    break
                }
            }

            // Compile generated interfacing source code files for platforms that require it (e.g. not node-native or wasm)
            for platform in platforms {
                switch platform {
                case .wasm, .node:
                    break
                case .kotlinSystem:
                    try FileManager.default.withCurrentDirectoryPath("kotlin") {
                        try cmd("./gradlew", "build", "-Dskip.tests").run()
                    }
                case .kotlinAndroid:
                    // TODO: Compile using Android Studio
                    break
                case .cSharp:
                    try FileManager.default.withCurrentDirectoryPath("c-sharp") {
                        try cmd("dotnet", "build", "Cricut.\(config.module).sln").run()
                    }
                case .cpp:
                    break
                }
            }
        }

        // MARK: - Test Step
        if buildStep.contains(.test) {
            for platform in platforms {
                // Gather environment information to pass on for code-coverage purposes
                let env = codeCoveragePath.map {
                    [
                        "LLVM_PROFILE_FILE": "\($0)/fishy-joes-test-\(platform)-\(UUID()).profraw",
                        "NODE_V8_COVERAGE": "\($0)/node",
                    ]
                } ?? [:]

                // Run the test suite for the library for the requested platforms
                switch platform {
                case .wasm, .node:
                    try FileManager.default.withCurrentDirectoryPath("node-test") {
                        // Install the test package and its dependencies
                        try cmd("npm", "install").run()

                        // Perform execution-environment-specific fixups to allow execution to succeed despite use of file-relative packages
                        switch platform.executionEnvironment {
                        case "native-macos":
                            try FileManager.default.withCurrentDirectoryPath("node_modules/\(NPMPackage.nameFor(config: config, platform: platform))") {
                                try cmd("npm", "install").run()
                            }
                        case "native-ubuntu":
                            try FileManager.default.withCurrentDirectoryPath("node_modules/\(NPMPackage.nameFor(config: config, platform: platform))") {
                                try cmd("npm", "install").run()
                                try cmd("ln", "-s", "node_modules/@cricut/fishyjoes-runtime-native-ubuntu/libFishyJoesNodeRuntime.so").run()
                            }
                        default:
                            break
                        }

                        // Use npm to execute the test suite
                        try cmd("npm", "run", "clear-cache").run()
                        try cmd("npm", "run", "test-\(platform.executionEnvironment)").run()
                    }
                case .kotlinSystem:
                    // Use gradle to execute the test suite
                    try FileManager.default.withCurrentDirectoryPath("kotlin") {
                        let tasks = ["cleanTest", "test"] + (codeCoveragePath == nil ? [] : ["jacocoTestReport"])
                        try cmd("./gradlew", arguments: tasks, addEnv: env).run()
                    }
                case .kotlinAndroid:
                    // TODO: Execute Android tests from FishyJoes
                    break
                case .cSharp:
                    // Use dotnet to execute the test suite
                    if !cmd("dotnet-coverage", "--version").runBool() {
                        printAndFlush("Couldn't find dotnet-coverage! Install with:")
                        printAndFlush()
                        printAndFlush("   dotnet tool install --global dotnet-sonarscanner")
                        printAndFlush()
                        printAndFlush("and ensure that $HOME/.dotnet/tools is in your path")
                    }
                    try FileManager.default.withCurrentDirectoryPath("c-sharp") {
                        var commandParts = ["dotnet", "test", "Cricut.\(config.module).sln"]
                        if let path = codeCoveragePath {
                            commandParts = ["dotnet-coverage", "collect", "-f", "xml", "-o", "\(path)/integration-tests-c-sharp.xml"] + commandParts
                        }
                        try cmd(commandParts.first!, arguments: Array(commandParts.dropFirst()), addEnv: env).run()
                    }
                case .cpp:
                    break
                }
            }
        }

        // MARK: - Pack Step
        if buildStep.contains(.pack) {
            let version = version ?? "0.0.1-unknown"
            for platform in platforms {
                switch platform {
                case .wasm, .node:
                    // Pack using npm
                    try cmd("npm", "pack", "./\(platform.outputDir(config))").run()
                case .kotlinSystem, .kotlinAndroid:
                    // TODO: Pack using maven
                    break
                case .cSharp:
                    // Pack using dotnet
                    let name = "Cricut.\(config.module)"
                    try cmd("dotnet", "pack", "-c", "Release", "c-sharp/\(name)/\(name).csproj", "/p:Version=\(version)").run()
                    try cmd("cp", "c-sharp/\(name)/bin/Release/\(name).\(version).nupkg", ".").run()
                case .cpp:
                    break
                }
            }
        }
    }
}
