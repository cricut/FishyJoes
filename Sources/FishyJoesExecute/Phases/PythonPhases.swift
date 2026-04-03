import Foundation
import swsh

class PythonPhases: IotaPhases, Phases {
    private var pythonPathSeparator: String {
        #if os(Windows)
        return ";"
        #else
        return ":"
        #endif
    }

    override func preInstallPhase() throws {
        // Python source files are generated during the `generate` step directly into the
        // final package layout, so preserve them here and only ensure the output exists.
        try cmd("mkdir", "-p", platform.outputDir(options.config)).run()
    }

    private func pythonSupportEnv() -> [String: String] {
        let runtimeSourcePath = "../../../../../python-runtime/src"
        var pythonPaths = ["src"]
        if FileManager.default.fileExists(atPath: "bindings/python/generated/\(runtimeSourcePath)")
            || FileManager.default.fileExists(atPath: runtimeSourcePath)
        {
            pythonPaths.append(runtimeSourcePath)
        }
        return ["PYTHONPATH": pythonPaths.joined(separator: pythonPathSeparator)]
    }

    func generationPhaseTemplateReplacements() throws -> [String: String] {
        let pythonDependencies = options.config.requiredModules.compactMap { moduleName -> String? in
            guard let dependency = options.packageInfo?.dependencyMap[moduleName] else {
                return nil
            }

            if let version = dependency.versionInPythonFormat(flexibleVersions: options.config.flexibleVersions) {
                return "  \"cricut-\(moduleName.lowercased())\(version)\","
            } else {
                let basePath = "bindings/python/generated"
                let relative = relativePath(of: dependency.localPath, relativeTo: basePath)
                return "  \"cricut-\(moduleName.lowercased()) @ file://\(relative)/bindings/python/generated\","
            }
        }

        return [
            "__PYPROJECT_DEPENDENCIES__": pythonDependencies.joined(separator: "\n"),
        ]
    }

    func installPhase() throws {
        try installLibrary("FishyJoesIotaRuntime")
        try installLibrary(options.config.module)
        try installLibrary("\(options.config.module)-iota")
        try options.config.extraDynamicLibraries.forEach { try installLibrary($0) }
    }

    func compileHostLanguagePhase() throws {
        try withDirectory("bindings/python/generated") {
            try cmd("python3", "-m", "compileall", "src", "tests", addEnv: pythonSupportEnv()).run()
        }
    }

    func testPhase() throws {
        try withDirectory("bindings/python/generated") {
            try cmd(
                "python3",
                "-m", "unittest", "discover",
                "-s", "tests",
                "-p", "test_*.py",
                addEnv: pythonSupportEnv()
            ).run()
        }
    }

    func packPhase() throws {
        try withDirectory("bindings/python/generated") {
            try cmd("mkdir", "-p", "../packed-python-packages").run()
            try cmd("python3", "-m", "pip", "install", "--upgrade", "build").run()
            try cmd(
                "python3",
                "-m", "build",
                "--sdist",
                "--wheel",
                "--outdir", "../packed-python-packages",
                addEnv: pythonSupportEnv()
            ).run()
        }
    }
}
