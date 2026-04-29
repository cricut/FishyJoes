import Foundation
import swsh

func pythonSwiftCoverageEnv(
    codeCoveragePath: String?,
    platform: Platform,
    uuid: UUID = UUID()
) -> [String: String] {
    codeCoveragePath.map {
        [
            "LLVM_PROFILE_FILE": "\($0)/fishy-joes-test-\(platform)-\(uuid).profraw",
        ]
    } ?? [:]
}

class PythonPhases: IotaPhases, Phases {
    private var pythonPathSeparator: String {
        #if os(Windows)
        return ";"
        #else
        return ":"
        #endif
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

    private func pythonEnvWithSwiftCoverage(_ env: [String: String]) -> [String: String] {
        env.merging(
            pythonSwiftCoverageEnv(
                codeCoveragePath: options.codeCoveragePath,
                platform: platform
            ),
            uniquingKeysWith: { _, coverageValue in coverageValue }
        )
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

    private func ensureLintTools() throws {
        // Pin major+minor so generator output is verified against a stable
        // ruleset.  Bump deliberately when the generator emits new constructs.
        // ``--break-system-packages`` lets us install on Homebrew/distro
        // Python without forcing every contributor to spin up a venv first;
        // see PEP 668.  CI and isolated environments pay no cost.
        try cmd(
            "python3", "-m", "pip", "install",
            "--break-system-packages",
            "--user",
            "ruff>=0.5,<0.10",
            "mypy>=1.10,<2"
        ).run()
    }

    private func ensureRuntimeInstalled() throws {
        let runtimeSourcePath = "../../../../../python-runtime"
        guard FileManager.default.fileExists(atPath: runtimeSourcePath) else {
            return
        }

        // The shared runtime has a CPython extension module.  Adding
        // python-runtime/src to PYTHONPATH is not enough: without an editable
        // install Python falls back to the pure _native.py shim, which only
        // exposes native_runtime_version and cannot exercise real IOTA paths.
        try cmd(
            "python3", "-m", "pip", "install",
            "--break-system-packages",
            "--user",
            "-e", runtimeSourcePath
        ).run()
    }

    func testPhase() throws {
        try withDirectory("bindings/python/generated") {
            try ensureRuntimeInstalled()
            try ensureLintTools()
            // Lint generated sources first; a syntactically broken or
            // import-broken generator output should fail before we waste
            // time loading native libraries.
            try cmd("python3", "-m", "ruff", "check", "src", "tests").run()
            try cmd("python3", "-m", "mypy", "src", addEnv: pythonSupportEnv()).run()
            // 1) Generated smoke tests (live next to the generated tree).
            try cmd(
                "python3",
                "-m", "unittest", "discover",
                "-s", "tests",
                "-p", "test_*.py",
                addEnv: pythonEnvWithSwiftCoverage(pythonSupportEnv())
            ).run()
        }
        // 2) Hand-written integration tests (sibling to ``generated/`` so
        // they survive regeneration).  Run from ``bindings/python`` with
        // an explicit PYTHONPATH that includes both ``generated/src`` (so
        // ``cricut_<module>`` resolves) and the shared
        // ``python-runtime/src`` (so ``fishyjoes_python`` resolves).
        let handWrittenTestsDir = "bindings/python/tests"
        if FileManager.default.fileExists(atPath: handWrittenTestsDir) {
            try withDirectory("bindings/python") {
                let runtimeSrc = "../../../../python-runtime/src"
                let pythonPath = ["generated/src", runtimeSrc].joined(separator: pythonPathSeparator)
                try cmd(
                    "python3",
                    "-m", "unittest", "discover",
                    "-s", "tests",
                    "-p", "test_*.py",
                    addEnv: pythonEnvWithSwiftCoverage(["PYTHONPATH": pythonPath])
                ).run()
            }
        }
    }

    func packPhase() throws {
        try withDirectory("bindings/python/generated") {
            try cmd("mkdir", "-p", "../packed-python-packages").run()
            try cmd(
                "python3", "-m", "pip", "install",
                "--break-system-packages",
                "--user",
                "--upgrade",
                "build"
            ).run()
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
