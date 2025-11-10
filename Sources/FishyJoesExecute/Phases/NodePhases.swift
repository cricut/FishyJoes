import Foundation
import swsh

class NodePhases: BasePhases, Phases {
    func generationPhaseTemplateReplacements() throws -> [String: String] {
        var replacements: [String: String] = [:]

        // Possible TODO: should the `Platform` type be able to describe node-native on windows when building on a mac?
        for platform in ["macos", "ubuntu", "windows"] {
            let npmDependencies = [
                (
                    swift: "FishyJoes",
                    libName: "FishyJoesNodeRuntime",
                    npm: "fishyjoes-runtime-native-\(platform)",
                    subPath: "node-runtime/fishyjoes-runtime-native-\(platform)"
                ),
            ] + options.config.requiredModules.map { module in
                (
                    swift: module,
                    libName: "\(module)-node",
                    npm: "\(module.lowercased())-native-\(platform)",
                    subPath: "bindings/ts/generated/packages/node-native-\(platform)"
                )
            }
            let npmDependencyLines = npmDependencies.map { dependency in
                let version = options.packageInfo?.dependencyMap[dependency.swift]?
                    .versionInNpmFormat(
                        relativeTo: "bindings/ts/generated/packages/node-native\(platform)",
                        addIfLocalPath: dependency.subPath,
                        flexibleVersions: options.flexibleVersions
                    )
                    ?? "0.0.1-unknown"
                return #""@cricut/\#(dependency.npm)": "\#(version)""#
            }
            replacements["__NPM_DEPENDENCIES_\(platform)__"] = npmDependencyLines.joined(separator: ",\n    ")

            if platform == "windows" {
                let postinstallLines = npmDependencies.map { dependency in
                    let libName = "\(dependency.libName).dll"
                    // TODO: Should copy?!? How to establish this link with only one file?
                    return #"COPY "%package_directory%\\#(dependency.npm)\\#(libName)" "\#(libName)""#
                }
                replacements["__NODE_POSTINSTALL_\(platform)__"] = join(lines: postinstallLines, indent: 0)
            } else {
                let postinstallLines = npmDependencies.map { dependency in
                    let libName = "lib\(dependency.libName).\(platform == "macos" ? "dylib" : "so")"
                    return #"ln -sf "$(realpath "$package_directory/\#(dependency.npm)/\#(libName)")" "\#(libName)""#
                }
                replacements["__NODE_POSTINSTALL_\(platform)__"] = join(lines: postinstallLines, indent: 0)
            }
        }

        return replacements
    }

    override func preBuildPhase() throws {
        try super.preBuildPhase()
        // When building a node native target on Windows, node.lib must be downloaded and put in the LIBPATH in order to build the NodeAPI dependency
        #if os(Windows)
        if platform == .node {
            try DownloadNodeLib.download(
                destinations: ["\(Platform.node.extraLibPathDir())/node.lib"]
            )
        }
        #endif
    }

    func buildSwiftPhase() throws {
        // Build libraries for the requested platforms
        let libs = [options.config.module] + options.config.requiredModules
        switch platform {
        case .wasm:
            try platform.build(
                configuration: options.buildConfig
            )
        case .node:
            try platform.build(
                product: "\(options.config.module)-node",
                libs: options.config.extraDynamicLibraries + libs.flatMap { [$0, "\($0)-node"] } + ["FishyJoesNodeRuntime"],
                configuration: options.buildConfig
            )
        default:
            fatalError("platform isn't node")
        }
    }

    func installPhase() throws {
        let module = options.config.module
        let fishyJoesDependency = options.packageInfo.dependencyMap["FishyJoes"]!
        let outputDir = platform.outputDir(options.config)
        let buildConfig: BuildConfiguration = options.buildConfig

        // Perform library installation and platform-specific customization
        // Find the path to the runtime
        let runtimePath = "\(fishyJoesDependency.localPath)/node-runtime"
        guard cmd("test", "-d", runtimePath).runBool() else {
            fatalError("Could not find node runtime at: \(runtimePath)")
        }

        struct NodeModule {
            let name: String
            let definitionsPath: String
            let extensionsPath: String
            let jsExports: [String]
            let tsExports: [String]
            let nativeLibName: String
            let npmPackageName: String

            var wasmMainShimName: String { "\(name)_WasmMainShim.wasm" }
            var nodeShimLibName: String { "\(name)-node-shim" }
            var nodeShimCJSName: String { "\(name).cjs.node" }
        }

        // Collect the information about the module and its dependencies that will be needed to build node modules
        let nodeDependencies = [
            NodeModule(
                name: "Runtime",
                definitionsPath: "\(runtimePath)/fishyjoes-runtime-common/Runtime.d.ts.part",
                extensionsPath: "\(runtimePath)/fishyjoes-runtime-common",
                jsExports: ["Runtime"],
                tsExports: ["Optional", "Runtime"],
                nativeLibName: "FishyJoesNodeRuntime",
                npmPackageName: "fishyjoes-runtime-\(platform.nodeExecutionEnvironment)"
            )
        ] + options.config.requiredModules.map { requiredModule in
            guard let dependency = options.packageInfo.dependencyMap[requiredModule] else {
                fatalError("Could not locate dependency \(requiredModule) in Package.swift")
            }
            return NodeModule(
                name: requiredModule,
                definitionsPath: "\(dependency.localPath)/bindings/ts/generated/\(requiredModule).d.ts.part",
                extensionsPath: "\(dependency.localPath)/bindings/ts",
                jsExports: [requiredModule],
                tsExports: [requiredModule],
                nativeLibName: "\(requiredModule)-node",
                npmPackageName: "\(requiredModule.lowercased())-\(platform.nodeExecutionEnvironment)"
            )
        }

        let nodeModule = NodeModule(
            name: module,
            definitionsPath: "bindings/ts/generated/\(module).d.ts.part",
            extensionsPath: "bindings/ts",
            jsExports: [module],
            tsExports: [module],
            nativeLibName: "\(module)-node",
            npmPackageName: "\(module)-\(platform.nodeExecutionEnvironment)"
        )
        let nodeModules = nodeDependencies + [nodeModule]

        // Install the module and its dependencies, then assemble the Javascript files required to load them
        if platform == .wasm {
            // Install Wasm bundle to the output directory, using wasm-opt to optimize Wasm bundles if available
            if options.wasmOpt, cmd("wasm-opt", "--version").runBool() {
                let optArgs = try [
                    "\(platform.buildDir(buildConfig))/\(nodeModule.wasmMainShimName)",
                ] + (
                    options.buildConfig.debug ? ["--debuginfo", "-O1"] : ["-O1"]
                ) + [
                    "-o", "\(outputDir)/\(nodeModule.name).wasm",
                ]
                try cmd("wasm-opt", arguments: optArgs).run()
            } else {
                if options.wasmOpt {
                    Log.warn("WARNING: wasm-opt is not installed, resulting build will be bigger and possibly slower")
                } else {
                    Log.info("skipping wasm-opt")
                }
                try cmd("cp", "\(platform.buildDir(buildConfig))/\(nodeModule.wasmMainShimName)", "\(outputDir)/\(nodeModule.name).wasm").run()
            }
            try cmd("cp", "\(fishyJoesDependency.localPath)/Sources/FishyJoesNodeRuntime/Templates/wasm-napi.js", outputDir).run()

            // Create the required Javascript files for loading the module's Wasm bundle
            try template(
                inPath: "\(fishyJoesDependency.localPath)/Sources/FishyJoesNodeRuntime/Templates/__MODULE_NAME__.js",
                outPath: "\(outputDir)/\(nodeModule.name).js",
                moduleName: nodeModule.name,
                dependencies: nodeDependencies.map(\.name)
            )
            try template(
                inPath: "\(fishyJoesDependency.localPath)/Sources/FishyJoesNodeRuntime/Templates/__MODULE_NAME__.browser.js",
                outPath: "\(outputDir)/\(nodeModule.name).browser.js",
                moduleName: nodeModule.name,
                dependencies: nodeDependencies.map(\.name)
            )

            // Install Javascript extensions for dependencies so they are loaded when the Wasm bundle is loaded, if provided
            for module in nodeModules {
                let outPath = "\(outputDir)/\(module.name).extensions.js"
                let extensionPath = "\(module.extensionsPath)/\(module.name).extensions.js"
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
            // Install the module library and Node interfacing library
            try installLibrary(nodeModule.name)
            try installLibrary(nodeModule.nativeLibName)
            try options.config.extraDynamicLibraries.forEach { try installLibrary($0) }

            // For node to load a library correctly, the file must be ".cjs.node", so compile a shim to load the actual Node interfacing library
            // and copy it into the build directory so it can be installed like any other library
            // and also remove intermediate files that MSVC makes but we don't need
            // TODO: When SwiftPM supports product dependencies on targets within the same package, use them instead
            // See: https://forums.swift.org/t/pitch-swiftpm-allow-targets-to-depend-on-products-in-the-same-package/57717/37
            let shimDir = "bindings/swift-interfaces/generated/NodeNativeShim"
            try clangBuild(
                sources: ["\(shimDir)/NAPIRegisterModule.c"],
                dependencies: [nodeModule.nativeLibName],
                headerSearchPaths: ["\(fishyJoesDependency.localPath)/Sources/NodeAPI/include"],
                librarySearchPaths: [platform.buildDir(buildConfig), platform.extraLibPathDir()],
                outputPath: "\(platform.buildDir(buildConfig))/\(platform.dylibName(for: nodeModule.nodeShimLibName))",
                configuration: buildConfig
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
            try cmd("cat")
                .input(moduleDotJS.joined(separator: "\n"))
                .output(overwritingFile: "\(outputDir)/\(module).js")
                .run()

            // Configure loading of Javascript extensions when the module is loaded by node, if provided
            let outPath = "\(outputDir)/\(nodeModule.name).extensions.js"
            if !cmd("cp", "\(nodeModule.extensionsPath)/\(module).extensions.js", outPath).runBool() {
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
                let dependencyDefintions = try String(contentsOfFile: dependency.definitionsPath)
                definitions.append(contentsOf: dependencyDefintions.split(separator: "\n").map(String.init))
                definitions.append("")

                // Splat in dependency extension definitions, if present
                let dependencyExtensionDefinitionsPath = "\(dependency.extensionsPath)/\(dependency.name).extensions.d.ts.part"
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
        let moduleDefinitions = try String(contentsOfFile: nodeModule.definitionsPath)
        definitions.append(contentsOf: moduleDefinitions.split(separator: "\n").map(String.init))
        definitions.append("")

        // Splat in the module's extension definitions
        let moduleExtensionsPath = "\(nodeModule.extensionsPath)/\(nodeModule.name).extensions.d.ts.part"
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
            .output(overwritingFile: "\(outputDir)/\(nodeModule.name).d.ts")
            .run()
        // Copy ths .d.ts file to the test directory for common use between tests
        try cmd("cp", "\(outputDir)/\(nodeModule.name).d.ts", "bindings/ts/tests/generated/").run()

        // Generate the package.json file
        if platform.platform == "node-native-macos" || platform.platform == "node-native-ubuntu" {
            // When on macOS & Ubuntu, dlopen() needs file-relative native libraries, so add a post-install script to the package to setup symlinks to dependency DYLIBs / SOs
            let scriptName = "postinstall.\(platform.nodeExecutionEnvironment).sh"
            try cmd("cp", "bindings/ts/generated/\(scriptName)", outputDir).run()
            try cmd("chmod", "+x", "\(outputDir)/\(scriptName)").run()
        } else if platform.platform == "node-native-windows" {
            // When on Windows, LoadLibrary() needs file-relative native libraries, so add a post-install script to the package to copy dependency DLLs
            try cmd("cp", "bindings/ts/generated/postinstall.\(platform.nodeExecutionEnvironment).cmd", outputDir).run()
        }

        try cmd("jq", "-e", ".version = env.VERSION", addEnv: ["VERSION": options.version ?? "0.0.1"])
            .input(fromFile: "bindings/ts/generated/package.\(platform.nodeExecutionEnvironment).json")
            .output(overwritingFile: "\(outputDir)/package.json")
            .run()
    }

    func compileHostLanguagePhase() throws {}

    override func preTestPhase() throws {
        try super.preTestPhase()

        try withDirectory(platform.outputDir(options.config)) {
            // Perform a file-local install of the module and its dependencies
            // TODO: Should build a package tarball and install it instead?
            try npm("install").run()
        }
        try withDirectory("bindings/ts/tests") {
            // Perform a file-local install of the test package and its dependencies
            // TODO: Should build a package tarball and install it instead?
            try npm("install").run()

            // Use npm to execute the test suite
            try npm("run", "clear-cache").run()
        }
    }

    func testPhase() throws {
        try withDirectory("bindings/ts/tests") {
            let addEnv = options.codeCoveragePath.map {
                [
                    "LLVM_PROFILE_FILE": "\($0)/fishy-joes-test-\(platform)-\(UUID()).profraw",
                    "NODE_V8_COVERAGE": "\($0)/node",
                ]
            } ?? [:]
            try npm("run", "test-\(platform.nodeExecutionEnvironment)", addEnv: addEnv).run()
        }
    }

    func packPhase() throws {
        // Update version number in package, if provided
        if let version = options.version {
            // Read package.json and update the version
            let packageJsonPath = "\(platform.outputDir(options.config))/package.json"
            var package = try cmd("cat", packageJsonPath).runJSON(NPMPackage.self)
            package.version = version

            // Write out the new package.json
            try cmd("cat")
                .inputJSON(from: package, encoder: PrettyJSONEncoder())
                .output(overwritingFile: packageJsonPath)
                .run()
        }

        // Pack using npm
        try cmd("mkdir", "-p", "bindings/packed-npm-packages").run()
        try npm("pack", "./\(platform.outputDir(options.config))", "--pack-destination", "bindings/packed-npm-packages").run()
    }

    private func npm(_ arguments: String..., addEnv: [String: String] = [:]) -> Command {
        #if os(macOS) || os(Linux)
        return cmd("npm", arguments: arguments, addEnv: addEnv)
        #elseif os(Windows)
        return cmd("cmd.exe", arguments: ["/c", "npm"] + arguments, addEnv: addEnv)
        #else
        fatalError("unknown host OS")
        #endif
    }

    private func clangBuild(
        sources: [String],
        dependencies: [String] = [],
        headerSearchPaths: [String] = [],
        librarySearchPaths: [String] = [],
        omitLocalRPath: Bool = false,
        dynamic: Bool = true,
        outputPath: String? = nil,
        configuration: BuildConfiguration
    ) throws {
        if platform.isNative, configuration.fat {
            let triples = ["arm64-apple-macosx", "x86_64-apple-macosx"]
            let libs = triples.map { "\((outputPath as? NSString)?.lastPathComponent ?? platform.dylibName(for: "out"))_\($0)" }
            for (triple, lib) in zip(triples, libs) {
                try clangBuild(
                    sources: sources,
                    dependencies: dependencies,
                    headerSearchPaths: headerSearchPaths,
                    librarySearchPaths: librarySearchPaths,
                    omitLocalRPath: omitLocalRPath,
                    dynamic: dynamic,
                    optimize: !configuration.debug,
                    targetTriple: triple,
                    outputPath: lib
                ).run()
            }
            try cmd("lipo", arguments: ["-create"] + (outputPath != nil ? ["-output", outputPath!] : []) + libs).run()
            for lib in libs {
                if cmd("test", "-f", lib).runBool() {
                    try? cmd("rm", lib).run()
                }
            }
        } else {
            try clangBuild(
                sources: sources,
                dependencies: dependencies,
                headerSearchPaths: headerSearchPaths,
                librarySearchPaths: librarySearchPaths,
                omitLocalRPath: omitLocalRPath,
                dynamic: dynamic,
                optimize: !configuration.debug,
                outputPath: outputPath
            ).run()
        }
    }

    private func clangBuild(
        sources: [String],
        dependencies: [String] = [],
        headerSearchPaths: [String] = [],
        librarySearchPaths: [String] = [],
        omitLocalRPath: Bool = false,
        dynamic: Bool = true,
        optimize: Bool = true,
        targetTriple: String? = nil,
        outputPath: String? = nil
    ) -> Command {
        #if os(macOS) || os(Linux)
        var args: [String] = []
        if dynamic {
            args.append(contentsOf: ["-shared", "-undefined", "dynamic_lookup"])
        }
        if optimize {
            args.append("-O3")
        }
        for headerSearchPath in headerSearchPaths {
            args.append("-I\(headerSearchPath)")
        }
        for librarySearchPath in librarySearchPaths {
            args.append("-L\(librarySearchPath)")
        }
        for dependency in dependencies {
            args.append("-l\(dependency)")
        }
        if let targetTriple = targetTriple {
            args.append("--target=\(targetTriple)")
        }
        if let outputPath = outputPath {
            args.append(contentsOf: ["-o", outputPath])
        }
        if !omitLocalRPath {
            #if os(macOS)
            args.append(contentsOf: ["-rpath", "@loader_path"])
            #elseif os(Linux)
            args.append(contentsOf: ["-rpath", "$ORIGIN"])
            #endif
        }
        args.append(contentsOf: sources)
        return cmd("clang", arguments: args)
        #elseif os(Windows)
        var args: [String] = []
        if dynamic {
            args.append("/LD")
        }
        if optimize {
            args.append("/O2")
        } else {
            args.append("/Od")
        }
        for headerSearchPath in headerSearchPaths {
            args.append("/I\(headerSearchPath)")
        }
        args.append(contentsOf: sources)
        if !dependencies.isEmpty || !librarySearchPaths.isEmpty || outputPath != nil {
            args.append("/link")
        }
        for librarySearchPath in librarySearchPaths {
            args.append("/LIBPATH:\(librarySearchPath)")
        }
        for dependency in dependencies {
            args.append("\(dependency).lib")
        }
        if let targetTriple = targetTriple {
            fatalError("Windows clang cross-compile builds not supported: \(targetTriple)")
        }
        if let outputPath = outputPath {
            args.append("/OUT:\(outputPath)")
        }
        return cmd("clang-cl", arguments: args)
        #else
        fatalError("unknown host OS")
        #endif
    }
}
