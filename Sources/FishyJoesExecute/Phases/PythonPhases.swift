import Foundation
import swsh

class PythonPhases: IotaPhases, Phases {
    func generationPhaseTemplateReplacements() throws -> [String: String] {
        let dependencies = options.config.requiredModules.map { module in
            PythonDependency(
                module: module,
                distributionName: options.config.python.dependencyDistributionName(forModule: module),
                importName: options.config.python.dependencyImportPackageName(forModule: module),
                versionRequirement: pythonVersionRequirement(for: module)
            )
        }
        return [
            "__PYTHON_DISTRIBUTION_NAME__": options.config.python.distributionName(forModule: options.config.module),
            "__PYTHON_IMPORT_PACKAGE__": options.config.python.importPackageName(forModule: options.config.module),
            "__PYTHON_DEPENDENCIES__": pythonDependencyLines(dependencies),
            "__PYTHON_MODULE_REGISTER_TYPES__": "FishyJoes_\(mangle(options.config.module))_registerTypes",
            "__PYTHON_PACKAGE_VERSION__": options.version ?? "0.0.1",
            "__PYTHON_RUNTIME_DISTRIBUTION_NAME__": options.config.python.runtimeDistributionName,
            "__PYTHON_RUNTIME_DEPENDENCIES__": pythonRuntimeDependencyList(dependencies),
            "__PYTHON_NATIVE_DEPENDENCIES__": pythonNativeDependencyList(dependencies)
        ]
    }

    private struct PythonDependency {
        let module: String
        let distributionName: String
        let importName: String
        let versionRequirement: String
    }

    private func mangle(_ value: String) -> String {
        value
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "-", with: "_")
    }

    private func pythonVersionRequirement(for module: String) -> String {
        guard let dependency = options.packageInfo?.dependencyMap[module],
              let version = dependency.versionInPubspecFormat(flexibleVersions: options.config.flexibleVersions)
        else {
            return ">=0.0.1"
        }
        if version.hasPrefix("^") {
            return pythonCompatibleRequirement(for: String(version.dropFirst()))
        }
        if version.contains(",") || [">=", "==", "~=", "<=", "!=", ">", "<", "==="].contains(where: { version.hasPrefix($0) }) {
            return version
        }
        return "==\(version)"
    }

    private func pythonCompatibleRequirement(for version: String) -> String {
        let parts = version.split(separator: ".").map(String.init)
        guard let major = Int(parts.first ?? "") else {
            return "==\(version)"
        }
        let upperBound: String
        if major > 0 {
            upperBound = "\(major + 1).0.0"
        } else if parts.count > 1, let minor = Int(parts[1]) {
            upperBound = "0.\(minor + 1).0"
        } else {
            upperBound = "\(major + 1).0.0"
        }
        return ">=\(version),<\(upperBound)"
    }

    private func pythonDependencyLines(_ dependencies: [PythonDependency]) -> String {
        guard !dependencies.isEmpty else {
            return ""
        }
        return dependencies
            .map { #"  "\#($0.distributionName)\#($0.versionRequirement)","# }
            .joined(separator: "\n")
    }

    private func pythonRuntimeDependencyList(_ dependencies: [PythonDependency]) -> String {
        guard !dependencies.isEmpty else {
            return "[]"
        }
        let entries = dependencies.map { dependency in
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

    func compileHostLanguagePhase() throws {}

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

    private func ensurePythonVirtualEnvironment() throws {
        let venvPython = pythonVirtualEnvironmentPython()
        if !FileManager.default.fileExists(atPath: venvPython) {
            try cmd(hostPythonExecutable(), "-m", "venv", ".venv").run()
        }
        try ensureSupportedPythonVersion(venvPython)
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

    private func installPythonBootstrapDependencies() throws {
        try ensurePythonVirtualEnvironment()

        var dependencies = ["cffi", "hatchling", "packaging"]
        #if os(macOS)
        dependencies.append("delocate")
        #elseif os(Linux)
        dependencies.append("auditwheel")
        #endif

        try cmd(
            pythonVirtualEnvironmentPython(),
            arguments: ["-m", "pip", "install"] + dependencies,
            addEnv: [
                "PIP_DISABLE_PIP_VERSION_CHECK": "1",
                "PIP_NO_CACHE_DIR": "1",
            ]
        ).run()
    }

    private func installPythonDevDependencies() throws {
        try installPythonBootstrapDependencies()

        if FileManager.default.fileExists(atPath: "requirements-dev.txt") {
            try cmd(
                pythonVirtualEnvironmentPython(),
                "-m", "pip", "install",
                "-r", "requirements-dev.txt",
                addEnv: [
                    "PIP_DISABLE_PIP_VERSION_CHECK": "1",
                    "PIP_NO_CACHE_DIR": "1",
                ]
            ).run()
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

    private func installPythonRuntimePackage() throws {
        let runtimePackagePath = try pythonRuntimePackagePath()
        let runtimeWheelDirectory = ".venv/fishyjoes-runtime-wheel"
        let runtimeLibraryPath = try builtRuntimeNativeLibraryPath()
        try cmd("rm", "-rf", runtimeWheelDirectory).run()
        try cmd("mkdir", "-p", runtimeWheelDirectory).run()
        let runtimeWheelPath = try cmd(
            pythonVirtualEnvironmentPython(),
            "\(runtimePackagePath)/_build_wheel.py",
            "--outdir", runtimeWheelDirectory,
            "--native-library", runtimeLibraryPath,
            addEnv: [
                "PIP_DISABLE_PIP_VERSION_CHECK": "1",
                "PIP_NO_CACHE_DIR": "1",
            ]
        ).runString().trimmingCharacters(in: .whitespacesAndNewlines)
        try cmd(
            pythonVirtualEnvironmentPython(),
            "-m", "pip", "install",
            "--no-build-isolation",
            "--no-deps",
            "--force-reinstall",
            runtimeWheelPath,
            addEnv: [
                "PIP_DISABLE_PIP_VERSION_CHECK": "1",
                "PIP_NO_CACHE_DIR": "1",
            ]
        ).run()
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

    private func installGeneratedPythonPackage() throws {
        for module in options.config.requiredModules {
            guard let dependency = options.packageInfo?.dependencyMap[module] else {
                throw NSError(
                    domain: "FishyJoes.Python",
                    code: 1,
                    userInfo: [
                        NSLocalizedDescriptionKey: "Could not locate required module \(module) in Package.swift"
                    ]
                )
            }

            let dependencyGeneratedPath = "\(options.absoluteLocalPath(for: dependency))/bindings/python/generated"
            try installGeneratedPythonPackage(
                at: dependencyGeneratedPath,
                module: module,
                wheelDirectory: ".venv/fishyjoes-generated-wheels/\(module)",
                versionOverride: pythonLocalPackageVersion(for: dependency),
                prepareIsolatedCopy: true
            )
        }

        try installGeneratedPythonPackage(
            at: "generated",
            module: options.config.module,
            wheelDirectory: ".venv/fishyjoes-generated-wheels/\(options.config.module)",
            versionOverride: nil,
            prepareIsolatedCopy: false
        )
    }

    private func pythonLocalPackageVersion(for dependency: SwiftPackage.Dependency) -> String? {
        guard let version = dependency.versionInPubspecFormat(flexibleVersions: options.config.flexibleVersions) else {
            return nil
        }

        if version.hasPrefix("^") {
            return String(version.dropFirst())
        }

        if version.range(of: #"^\d+\.\d+\.\d+$"#, options: .regularExpression) != nil {
            return version
        }

        if let lowerBound = version.range(of: #">=\s*(\d+\.\d+\.\d+)"#, options: .regularExpression) {
            return String(version[lowerBound]).replacingOccurrences(of: ">=", with: "").trimmingCharacters(in: .whitespaces)
        }

        return nil
    }

    private func installGeneratedPythonPackage(
        at generatedPath: String,
        module: String,
        wheelDirectory: String,
        versionOverride: String?,
        prepareIsolatedCopy: Bool
    ) throws {
        guard FileManager.default.fileExists(atPath: "\(generatedPath)/pyproject.toml") else {
            throw NSError(
                domain: "FishyJoes.Python",
                code: 1,
                userInfo: [
                    NSLocalizedDescriptionKey: "Could not locate generated Python package at \(generatedPath); run `fishy-joes --python generate build` for that module first"
                ]
            )
        }
        if FileManager.default.fileExists(atPath: wheelDirectory) {
            try FileManager.default.removeItem(atPath: wheelDirectory)
        }
        let buildPath = try preparedGeneratedPackagePath(
            generatedPath,
            module: module,
            wheelDirectory: wheelDirectory,
            versionOverride: versionOverride,
            prepareIsolatedCopy: prepareIsolatedCopy
        )
        let buildArgs = [
            "\(buildPath)/_build_wheel.py",
            "--outdir", wheelDirectory,
            "--no-repair"
        ]
        try cmd(pythonVirtualEnvironmentPython(), arguments: buildArgs).run()
        let wheels = try FileManager.default.contentsOfDirectory(atPath: wheelDirectory)
            .filter { $0.hasSuffix(".whl") }
            .sorted()
        guard wheels.count == 1, let wheel = wheels.first else {
            throw NSError(
                domain: "FishyJoes.Python",
                code: 1,
                userInfo: [
                    NSLocalizedDescriptionKey: "Expected generated Python wheel builder to produce exactly one wheel in \(wheelDirectory); found \(wheels)"
                ]
            )
        }
        try cmd(
            pythonVirtualEnvironmentPython(),
            "-m", "pip", "install",
            "--no-build-isolation",
            "--no-deps",
            "--force-reinstall",
            "\(wheelDirectory)/\(wheel)",
            addEnv: [
                "PIP_DISABLE_PIP_VERSION_CHECK": "1",
                "PIP_NO_CACHE_DIR": "1",
            ]
        ).run()
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
            try installPythonDevDependencies()
            try installPythonRuntimePackage()
            try installGeneratedPythonPackage()
            let testArguments = ["-m", "unittest", "discover", "-s", "tests", "-v"]
            if let codeCoveragePath = options.codeCoveragePath {
                try FileManager.default.createDirectory(atPath: codeCoveragePath, withIntermediateDirectories: true)
                let coverageConfigPath = ".venv/fishyjoes-coverage.rc"
                try writePythonCoverageConfig(to: coverageConfigPath, runtimePackagePath: try pythonRuntimePackagePath())
                let coverageEnv = ["COVERAGE_FILE": "\(codeCoveragePath)/integration-tests-python.coverage"]
                try cmd(
                    pythonVirtualEnvironmentPython(),
                    "-m", "coverage", "erase",
                    "--rcfile", coverageConfigPath,
                    addEnv: coverageEnv
                ).run()
                try cmd(
                    pythonVirtualEnvironmentPython(),
                    arguments: ["-m", "coverage", "run", "--rcfile", coverageConfigPath] + testArguments,
                    addEnv: coverageEnv
                ).run()
                try cmd(
                    pythonVirtualEnvironmentPython(),
                    "-m", "coverage", "xml",
                    "--rcfile", coverageConfigPath,
                    "-o", "\(codeCoveragePath)/integration-tests-python.xml",
                    addEnv: coverageEnv
                ).run()
                try normalizePythonCoverageXML(at: "\(codeCoveragePath)/integration-tests-python.xml")
                try cmd(
                    pythonVirtualEnvironmentPython(),
                    "-m", "coverage", "report",
                    "--rcfile", coverageConfigPath,
                    addEnv: coverageEnv
                ).run()
            } else {
                try cmd(pythonVirtualEnvironmentPython(), arguments: testArguments).run()
            }
        }
    }

    func packPhase() throws {
        try withDirectory("bindings/python") {
            try installPythonDevDependencies()
            try installPythonRuntimePackage()
        }
        try withDirectory("bindings/python/generated") {
            var args = [
                "_build_wheel.py",
                "--outdir", "../dist"
            ]
            if let version = options.version {
                args += ["--version-override", version]
            }
            try cmd(
                "../\(pythonVirtualEnvironmentPython())",
                arguments: args
            ).run()
        }
    }
}
