import FishyJoesCore
import Foundation
import swsh

class PythonPhases: IotaPhases, Phases {
    func generationPhaseTemplateReplacements() throws -> [String: String] {
        let (fishyJoesRuntimeVersion, fishyJoesRuntimeUVSource) = pythonVersionRequirement(for: "FishyJoes")
        let dependencies = [
            PythonDependency(
                module: "FishyJoes",
                distributionName: "fishyjoes-runtime",
                importName: "fishyjoes_runtime",
                versionRequirement: fishyJoesRuntimeVersion,
                uvSource: fishyJoesRuntimeUVSource,
            )
        ] + options.config.requiredModules.map { module in
            let distributionName = PythonNamingConventions.moduleDistributionName(swift: module)
            let importName = PythonNamingConventions.moduleImportName(swift: module)
            let (version, uvSource) = pythonVersionRequirement(for: module)
            return PythonDependency(
                module: module,
                distributionName: distributionName,
                importName: importName,
                versionRequirement: version,
                uvSource: uvSource,
            )
        }

        let pythonDependencyLines = dependencies.map { dep in
            let versionRequirement = dep.versionRequirement.map { " \($0) " } ?? ""
            return #"\#n    "\#(dep.distributionName)\#(versionRequirement)","#
        }
        let pythonDependencySources = dependencies.compactMap { dep -> String? in
            guard let uvSource = dep.uvSource else { return nil }
            return "\n\(dep.distributionName) = \(uvSource)"
        }

        return [
            "__PYTHON_DISTRIBUTION_NAME__": PythonNamingConventions.moduleDistributionName(swift: options.config.module),
            "__PYTHON_IMPORT_PACKAGE__": PythonNamingConventions.moduleImportName(swift: options.config.module),
            "__PYTHON_DEPENDENCIES__": pythonDependencyLines.joined(separator: ""),
            "__PYTHON_DEPENDENCY_SOURCES__": pythonDependencySources.joined(separator: ""),
            "__PYTHON_MODULE_REGISTER_TYPES__": "FishyJoes_\(options.config.module)_registerTypes",
            "__PYTHON_PACKAGE_VERSION__": options.version ?? "0.0.1.dev0",
        ]
    }

    private struct PythonDependency {
        let module: String
        let distributionName: String
        let importName: String
        /// PEP 440 version specifier, or PEP 508 direct reference
        /// (e.g. `>=2.22.4,<3.0.0` or nil for a local dependency)
        let versionRequirement: String?
        /// uv package source, e.g. '{ path = "../../../../../python-runtime" }' or '{ index = "custom-pypi" }'
        let uvSource: String?
    }

    private func pythonVersionRequirement(for module: String) -> (version: String?, uvSource: String?) {
        guard let dependency = options.packageInfo?.dependencyMap[module] else {
            fatalError("couldn't find dependency \(module)")
        }
        let pythonSubdirectory = module == "FishyJoes" ? "python-runtime" : "bindings/python/generated"
        let selfPackagePath = "bindings/python/generated"
        let version = dependency.versionInPythonRequirementFormat(
            relativeTo: selfPackagePath,
            addIfLocalPath: pythonSubdirectory,
            flexibleVersions: options.config.flexibleVersions
        )
        var uvSource: String?
        if case .fileSystem = dependency {
            uvSource = dependency.pythonUVSource(
                relativeTo: selfPackagePath,
                addIfLocalPath: pythonSubdirectory,
                flexibleVersions: options.config.flexibleVersions
            )
        } else if let indexName = options.dependencyConfigs[module]?.packageRegistries?.pythonIndexName {
            uvSource = #"{ index = "\#(indexName)" }"#
        }
        return (version, uvSource)
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
            // Test compatibility with whatever typechecker(s) downstream wants to use
            try cmd("uv", "run", "pyrefly", "check", "--preset=strict", "--output-format=min-text", "generated").run()
            try cmd("uv", "run", "mypy", "--strict", ".").run()
        }
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

    func testPhase() throws {
        try withDirectory("bindings/python") {
            try cmd(
                "uv", "run", "pytest", "--verbose", "--capture=no", "-x", "./tests",
                addEnv: ["PYTHONFAULTHANDLER": "1"]
            ).run()
        }
    }

    func packPhase() throws {
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
            pyPlatformTag = "manylinux_2_17_x86_64"
            #endif

            try cmd(
                "uv", "build", "--wheel",
                addEnv: ["PY_PLATFORM_TAG": pyPlatformTag]
            ).run()
        }
    }
}
