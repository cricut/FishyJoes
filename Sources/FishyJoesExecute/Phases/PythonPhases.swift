import FishyJoesCore
import Foundation
import swsh

class PythonPhases: IotaPhases, Phases {
    func generationPhaseTemplateReplacements() throws -> [String: String] {
        let dependencies = [
            PythonDependency(
                module: "FishyJoes",
                distributionName: "fishyjoes-runtime",
                importName: "fishyjoes_runtime",
                versionRequirement: pythonVersionRequirement(for: "FishyJoes")
            )
        ] + options.config.requiredModules.map { module in
            let distributionName = PythonNamingConventions.moduleDistributionName(swift: module)
            let importName = PythonNamingConventions.moduleImportName(swift: module)
            return PythonDependency(
                module: module,
                distributionName: distributionName,
                importName: importName,
                versionRequirement: pythonVersionRequirement(for: module),
            )
        }

        let pythonDependencyLines = dependencies.map { dep in
            #"\#n    "\#(dep.distributionName) \#(dep.versionRequirement)","#
        }
        let pythonDependencySources = [""] // dependencies.map { #"\#n\#($0.distributionName) = { index = "local" }"# }
        return [
            "__PYTHON_DISTRIBUTION_NAME__": PythonNamingConventions.moduleDistributionName(swift: options.config.module),
            "__PYTHON_IMPORT_PACKAGE__": PythonNamingConventions.moduleImportName(swift: options.config.module),
            "__PYTHON_DEPENDENCIES__": pythonDependencyLines.joined(separator: ""),
            "__PYTHON_DEPENDENCY_SOURCES__": pythonDependencySources.joined(separator: ""),
            "__PYTHON_MODULE_REGISTER_TYPES__": "FishyJoes_\(options.config.module)_registerTypes",
            "__PYTHON_PACKAGE_VERSION__": options.version ?? "0.0.1",
            "__PYTHON_RUNTIME_DEPENDENCIES__": pythonRuntimeDependencyList(dependencies),
        ]
    }

    private struct PythonDependency {
        let module: String
        let distributionName: String
        let importName: String
        /// PEP 440 version specifier, or PEP 508 direct reference
        /// (e.g. `>=2.22.4,<3.0.0` or `@ file:///...`)
        let versionRequirement: String
    }

    private func pythonVersionRequirement(for module: String) -> String {
        guard let dependency = options.packageInfo?.dependencyMap[module] else {
            fatalError("couldn't find dependency \(module)")
        }
        let pythonSubdirectory = module == "FishyJoes" ? "python-runtime" : "bindings/python"
        return dependency.versionInPythonRequirementFormat(
            relativeTo: nil,
            addIfLocalPath: pythonSubdirectory,
            flexibleVersions: options.config.flexibleVersions
        )
    }

    private func pythonRuntimeDependencyList(_ dependencies: [PythonDependency]) -> String {
        guard !dependencies.isEmpty else {
            return "[]"
        }
        let entries = dependencies.compactMap { dependency -> String? in
            // TODO: remove this filter
            guard dependency.importName != "fishyjoes_runtime" else { return nil }
            return
                """
                RuntimeDependency(
                    import_name="\(dependency.importName)",
                    distribution_name="\(dependency.distributionName)",
                    version_requirement="\(dependency.versionRequirement)",
                )
                """
        }
        return "[\n            \(entries.joined(separator: ",\n            "))\n        ]"
    }

    private func pythonNativeDependencyList(_ dependencies: [PythonDependency]) -> String {
        guard !dependencies.isEmpty else {
            return "[]"
        }
        let entries = dependencies.map { dependency in
            #"{ "module": "\#(dependency.module)", "import_name": "\#(dependency.importName)" }"#
        }
        return "[\(entries.joined(separator: ", "))]"
    }

    func installPhase() throws {
        try installLibrary(options.config.module)
        try installLibrary("\(options.config.module)-iota")
        try options.config.extraDynamicLibraries.forEach { try installLibrary($0) }
    }

    func compileHostLanguagePhase() throws {
        try withDirectory("bindings/python") {
            try cmd("uv", "sync", "--dev").run()
        }
        try withDirectory("bindings/python/generated") {
            try cmd("uv", "run", "mypy", ".").run()
        }
    }

    private func pythonVirtualEnvironmentPython() -> String {
        #if os(Windows)
        return ".venv/Scripts/python.exe"
        #else
        return ".venv/bin/python"
        #endif
    }

    private func hostPythonExecutable() -> String {
        ProcessInfo.processInfo.environment["FISHYJOES_PYTHON"] ?? "python3"
    }

    private func installedPythonRuntimeNativeLibraryPath() throws -> String {
        try cmd(
            "uv", "run", "python",
            "-c",
            """
            import pathlib
            import fishyjoes_runtime
            print(pathlib.Path(fishyjoes_runtime.__file__).resolve().parent / "native")
            """
        ).runString().trimmingCharacters(in: .whitespacesAndNewlines)
    }

    static func swiftRuntimeLibraryPaths(fromTargetInfo targetInfo: String) throws -> [String] {
        let object = try JSONSerialization.jsonObject(with: Data(targetInfo.utf8))
        guard let root = object as? [String: Any],
              let paths = root["paths"] as? [String: Any],
              let runtimeLibraryPaths = paths["runtimeLibraryPaths"] as? [String]
        else {
            throw NSError(
                domain: "FishyJoes.Python",
                code: 1,
                userInfo: [
                    NSLocalizedDescriptionKey: "Could not parse Swift runtime library paths from swift -print-target-info"
                ]
            )
        }
        return runtimeLibraryPaths.filter { !$0.isEmpty }
    }

    static func environmentByAddingDynamicLibraryPaths(
        _ libraryPaths: [String],
        to environment: [String: String],
        variable: String
    ) -> [String: String] {
        let newPaths = libraryPaths.filter { !$0.isEmpty }
        guard !newPaths.isEmpty else { return environment }

        var result = environment
        let existingPaths = environment[variable].map { [$0] } ?? []
        result[variable] = (existingPaths + newPaths).joined(separator: ":")
        return result
    }

    static func removeExistingPythonDistDirectory(at path: String = "bindings/python/dist") throws {
        if FileManager.default.fileExists(atPath: path) {
            try FileManager.default.removeItem(atPath: path)
        }
    }

    private func pythonTestEnvironment(adding environment: [String: String] = [:]) throws -> [String: String] {
        #if os(Linux)
        let targetInfo = try cmd("swift", "-print-target-info").runString()
        let libraryPaths = [try installedPythonRuntimeNativeLibraryPath()]
            + (try Self.swiftRuntimeLibraryPaths(fromTargetInfo: targetInfo))
        var testEnvironment = environment
        if testEnvironment["LD_LIBRARY_PATH"] == nil {
            testEnvironment["LD_LIBRARY_PATH"] = ProcessInfo.processInfo.environment["LD_LIBRARY_PATH"]
        }
        return Self.environmentByAddingDynamicLibraryPaths(
            libraryPaths,
            to: testEnvironment,
            variable: "LD_LIBRARY_PATH"
        )
        #else
        return environment
        #endif
    }

    // The Python target requires Python 3.11+ (see python-runtime/pyproject.toml
    // requires-python). Fail fast with an actionable message instead of surfacing
    // confusing downstream errors (missing stdlib tomllib, delocate arch mismatches,
    // pip "requires a different Python") when an older interpreter is selected.
    private func ensureSupportedPythonVersion(_ python: String) throws {
        let minimum = (major: 3, minor: 11)
        let reported = try cmd(
            python, "-c", "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')"
        ).runString().trimmingCharacters(in: .whitespacesAndNewlines)
        let components = reported.split(separator: ".").compactMap { Int($0) }
        guard components.count >= 2 else {
            return
        }
        let (major, minor) = (components[0], components[1])
        if major < minimum.major || (major == minimum.major && minor < minimum.minor) {
            throw NSError(
                domain: "FishyJoes.Python",
                code: 2,
                userInfo: [
                    NSLocalizedDescriptionKey: """
                    FishyJoes Python target requires Python \(minimum.major).\(minimum.minor)+, but the selected interpreter (\(hostPythonExecutable())) is \(reported).
                    Install Python \(minimum.major).\(minimum.minor) or newer and re-run, or point FISHYJOES_PYTHON at a suitable interpreter, e.g. FISHYJOES_PYTHON=python3.11.
                    """
                ]
            )
        }
    }

    private func writePythonCoverageConfig(to configPath: String, runtimePackagePath: String) throws {
        let runtimeSourcePath = "\(absolutePath(runtimePackagePath))/src/fishyjoes_runtime"
        let coverageConfig = """
        [run]
        source =
            testapi
            fishyjoes_runtime

        [paths]
        testapi =
            generated/src/testapi
            */site-packages/testapi
        fishyjoes_runtime =
            \(runtimeSourcePath)
            */site-packages/fishyjoes_runtime

        [report]
        omit =
            */__pycache__/*
        """
        try coverageConfig.write(toFile: configPath, atomically: true, encoding: .utf8)
    }

    private func normalizePythonCoverageXML(at coverageXMLPath: String) throws {
        let repositoryRoot = absolutePath("../../../..")
        let bindingsPythonPath = "integration-tests/TestAPI/bindings/python/"
        let xml = try String(contentsOfFile: coverageXMLPath, encoding: .utf8)
            .replacingOccurrences(of: #"filename="\#(repositoryRoot)/"#, with: #"filename=""#)
            .replacingOccurrences(of: #"filename="generated/src/"#, with: #"filename="\#(bindingsPythonPath)generated/src/"#)
        try xml.write(toFile: coverageXMLPath, atomically: true, encoding: .utf8)
    }

    private func pythonRuntimePackagePath() throws -> String {
        var candidates = [
            "../../../../python-runtime",
            "../../.build/checkouts/FishyJoes/python-runtime",
            "../swift-interfaces/generated/\(options.config.module)-bindings/.build/checkouts/FishyJoes/python-runtime",
        ]

        if let fishyJoesDependency = options.packageInfo?.dependencyMap["FishyJoes"] {
            candidates.insert("\(options.absoluteLocalPath(for: fishyJoesDependency))/python-runtime", at: 0)
        }

        guard let runtimePackagePath = candidates.first(where: { FileManager.default.fileExists(atPath: "\($0)/pyproject.toml") }) else {
            throw NSError(
                domain: "FishyJoes.Python",
                code: 1,
                userInfo: [
                    NSLocalizedDescriptionKey: "Could not locate FishyJoes python-runtime package; checked \(candidates.joined(separator: ", "))"
                ]
            )
        }

        return runtimePackagePath
    }

    private func builtRuntimeNativeLibraryPath() throws -> String {
        try builtNativeLibraryPath("FishyJoesIotaRuntime")
    }

    private func builtNativeLibraryPath(_ library: String) throws -> String {
        if FileManager.default.fileExists(atPath: "../../Package.swift") {
            return try withDirectory("../..") {
                absolutePath(try platform.dylibPath(for: library, configuration: options.buildConfig))
            }
        }
        return absolutePath(try platform.dylibPath(for: library, configuration: options.buildConfig))
    }

    private func absolutePath(_ path: String) -> String {
        URL(
            fileURLWithPath: path,
            relativeTo: URL(fileURLWithPath: FileManager.default.currentDirectoryPath, isDirectory: true)
        )
        .standardizedFileURL
        .path
    }

    private func pythonLocalPackageVersion(for module: String, dependency: SwiftPackage.Dependency) -> String? {
        let version = dependency.versionInPythonRequirementFormat(relativeTo: nil, flexibleVersions: options.config.flexibleVersions)

        if version.hasPrefix("==") {
            return String(version.dropFirst(2))
        }

        if version.range(of: #"^\d+\.\d+\.\d+$"#, options: .regularExpression) != nil {
            return version
        }

        if let lowerBound = version.range(of: #">=\s*(\d+\.\d+\.\d+)"#, options: .regularExpression) {
            return String(version[lowerBound]).replacingOccurrences(of: ">=", with: "").trimmingCharacters(in: .whitespaces)
        }

        return nil
    }

    private func validatePublishablePythonDependencies() throws {
        for module in options.config.requiredModules {
            guard options.packageInfo?.dependencyMap[module] != nil else {
                throw NSError(
                    domain: "FishyJoes.Python",
                    code: 1,
                    userInfo: [
                        NSLocalizedDescriptionKey: "Could not locate required module \(module) in Package.swift"
                    ]
                )
            }
        }
    }

    private func preparedGeneratedPackagePath(
        _ generatedPath: String,
        module: String,
        wheelDirectory: String,
        versionOverride: String?,
        prepareIsolatedCopy: Bool
    ) throws -> String {
        guard prepareIsolatedCopy || versionOverride != nil else {
            return generatedPath
        }

        let preparedPath = "\(wheelDirectory)-source"
        let preparedURL = URL(fileURLWithPath: preparedPath)
        let preparedParent = preparedURL.deletingLastPathComponent().path
        try FileManager.default.createDirectory(atPath: preparedParent, withIntermediateDirectories: true)
        if FileManager.default.fileExists(atPath: preparedPath) {
            try FileManager.default.removeItem(atPath: preparedPath)
        }
        try FileManager.default.copyItem(atPath: generatedPath, toPath: preparedPath)
        try copyBuiltNativeLibraries(for: module, intoGeneratedPackageAt: preparedPath)
        if let versionOverride {
            try overrideGeneratedPythonPackageVersion(at: preparedPath, version: versionOverride)
        }
        return preparedPath
    }

    private func copyBuiltNativeLibraries(for module: String, intoGeneratedPackageAt generatedPath: String) throws {
        let nativePath = "\(generatedPath)/native"
        try FileManager.default.createDirectory(atPath: nativePath, withIntermediateDirectories: true)
        for library in [module, "\(module)-iota"] {
            let sourcePath = try builtNativeLibraryPath(library)
            guard FileManager.default.fileExists(atPath: sourcePath) else {
                throw NSError(
                    domain: "FishyJoes.Python",
                    code: 1,
                    userInfo: [
                        NSLocalizedDescriptionKey: "Could not locate built native library \(sourcePath) while preparing Python dependency wheel for \(module); run the FishyJoes Python build phase first"
                    ]
                )
            }
            let destinationPath = "\(nativePath)/\(platform.dylibName(for: library))"
            if FileManager.default.fileExists(atPath: destinationPath) {
                try FileManager.default.removeItem(atPath: destinationPath)
            }
            try FileManager.default.copyItem(atPath: sourcePath, toPath: destinationPath)
        }
    }

    private func overrideGeneratedPythonPackageVersion(at generatedPath: String, version: String) throws {
        let pyprojectPath = "\(generatedPath)/pyproject.toml"
        let pyproject = try String(contentsOfFile: pyprojectPath)
            .replacingOccurrences(
                of: #"(?m)^version = ".*"$"#,
                with: #"version = "\#(version)""#,
                options: .regularExpression
            )
        try pyproject.write(toFile: pyprojectPath, atomically: true, encoding: .utf8)

        guard let enumerator = FileManager.default.enumerator(atPath: "\(generatedPath)/src") else {
            return
        }
        for case let relativePath as String in enumerator where relativePath.hasSuffix("/_native.py") {
            let nativePath = "\(generatedPath)/src/\(relativePath)"
            let native = try String(contentsOfFile: nativePath)
                .replacingOccurrences(
                    of: #"package_version="[^"]*""#,
                    with: #"package_version="\#(version)""#,
                    options: .regularExpression
                )
            try native.write(toFile: nativePath, atomically: true, encoding: .utf8)
        }
    }

    func testPhase() throws {
        try withDirectory("bindings/python") {
            try cmd("uv", "run", "pytest", "-v", "./tests").run()
        }
        // try withDirectory("bindings/python/generated") {
        //     var testArguments = ["-v"]
        //     // testArguments.append("-x")
        //     if let codeCoveragePath = options.codeCoveragePath {
        //         // try FileManager.default.createDirectory(atPath: codeCoveragePath, withIntermediateDirectories: true)
        //         // let coverageConfigPath = ".venv/fishyjoes-coverage.rc"
        //         // try writePythonCoverageConfig(to: coverageConfigPath, runtimePackagePath: try pythonRuntimePackagePath())
        //         // let coverageEnv = try pythonTestEnvironment(
        //         //     adding: ["COVERAGE_FILE": "\(codeCoveragePath)/integration-tests-python.coverage"]
        //         // )
        //         // try cmd(
        //         //     "uv", "run", "python",
        //         //     "-m", "coverage", "erase",
        //         //     "--rcfile", coverageConfigPath,
        //         //     addEnv: coverageEnv
        //         // ).run()
        //         // try cmd(
        //         //     "uv",
        //         //     arguments: ["run", "python", "-m", "coverage", "run", "--rcfile", coverageConfigPath] + testArguments,
        //         //     addEnv: coverageEnv
        //         // ).run()
        //         // try cmd(
        //         //     "uv", "run", "python",
        //         //     "-m", "coverage", "xml",
        //         //     "--rcfile", coverageConfigPath,
        //         //     "-o", "\(codeCoveragePath)/integration-tests-python.xml",
        //         //     addEnv: coverageEnv
        //         // ).run()
        //         // try normalizePythonCoverageXML(at: "\(codeCoveragePath)/integration-tests-python.xml")
        //         // try cmd(
        //         //     "uv", "run", "python",
        //         //     "-m", "coverage", "report",
        //         //     "--rcfile", coverageConfigPath,
        //         //     addEnv: coverageEnv
        //         // ).run()
        //         fatalError("TODO: fix")
        //     } else {
        //         try cmd(
        //             "uv",
        //             arguments: ["run", "pytest"] + testArguments,
        //             addEnv: try pythonTestEnvironment()
        //         ).run()
        //     }
        // }
    }

    func packPhase() throws {
        try validatePublishablePythonDependencies()
        try withDirectory("bindings/python/generated") {
            let pyPlatformTag: String
            #if os(macOS)
            if options.buildConfig.fat {
                pyPlatformTag = "macosx_13_0_universal2"
            } else {
                let arch = try cmd("uname", "-m").runString()
                pyPlatformTag = "macosx_13_0_\(arch)"
            }
            #elseif os(Windows)
            pyPlatformTag = "win_amd64"
            #elseif os(Linux)
            pyPlatformTag = "linux_x86_64"
            #endif

            try cmd(
                "uv", "build", "--wheel",
                addEnv: ["PY_PLATFORM_TAG": pyPlatformTag]
            ).run()
        }
    }
}
