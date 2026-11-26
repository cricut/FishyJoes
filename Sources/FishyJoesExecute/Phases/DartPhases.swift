import ArgumentParser
import Foundation
import swsh

class DartPhases: IotaPhases, Phases {
    func generationPhaseTemplateReplacements() throws -> [String: String] {
        let dartDependencies = [
            (
                swift: "FishyJoes",
                path: "dart-runtime",
                dart: "fishyjoes_dart",
                npm: "flutter-fishyjoes-runtime",
                npmSubPath: "dart-runtime/flutter-package"
            )
        ] + options.config.requiredModules.map {
            (
                swift: $0,
                path: "bindings/dart/generated",
                dart: "cricut_\($0.lowercased())",
                npm: "flutter-\($0.lowercased())",
                npmSubPath: "bindings/dart/generated/flutter-package"
            )
        }

        let pureDartDependencyLines = dartDependencies.flatMap { depNames -> [String] in
            let lines = ["\(depNames.dart):"]
            guard let dependency = options.packageInfo.dependencyMap[depNames.swift] else {
                return lines + [
                    "  path: DEPENDENCY_NOT_FOUND",
                ]
            }
            var gitURL = "https://github.com/cricut/\(depNames.swift).git"
            var gitPath = depNames.path
            if case let .sibling(_, _, published, _) = dependency {
                gitURL = "\(published.repository.absoluteString).git"
                gitPath = "\(published.packagePath)/\(depNames.path)"
            }
            if options.config.flexibleVersions,
               let tagPattern = dependency.tagPatternAndVersionConstraint() {
                return lines + [
                    #"  git:"#,
                    #"    url: "\#(gitURL)""#,
                    #"    tag_pattern: "\#(tagPattern.tagPattern)""#,
                    #"    path: "\#(gitPath)""#,
                    #"  version: "\#(tagPattern.versionConstraint)""#,
                ]
            }
            if let version = dependency.versionInPubspecFormat(flexibleVersions: false) {
                return lines + [
                    #"  git:"#,
                    #"    url: "\#(gitURL)""#,
                    #"    ref: "\#(version)""#,
                    #"    path: "\#(gitPath)""#,
                ]
            } else {
                let dependencyPath = relativePath(of: dependency.localPath, relativeTo: "bindings/dart/generated")
                return lines + [
                    "  path: \(dependencyPath)/\(depNames.path)",
                ]
            }
        }

        let flutterDependencyLines = dartDependencies.flatMap { depNames in
            [
                "\(depNames.dart):",
                "  path: ../\(depNames.npm)",
            ]
        }

        let npmFlutterDependencyLines = dartDependencies.map { dependency in
            let version = options.packageInfo?.dependencyMap[dependency.swift]?
                .versionInNpmFormat(
                    relativeTo: "bindings/dart/generated/flutter-package/",
                    addIfLocalPath: dependency.npmSubPath,
                    flexibleVersions: options.config.flexibleVersions
                )
                ?? "0.0.1-unknown"
            return #""@cricut/\#(dependency.npm)": "\#(version)""#
        }

        return [
            "__PUBSPEC_DART_DEPENDENCIES__": join(lines: pureDartDependencyLines, indent: 2),
            "__PUBSPEC_FLUTTER_DEPENDENCIES__": join(lines: flutterDependencyLines, indent: 2),
            "__NPM_FLUTTER_DEPENDENCIES__": npmFlutterDependencyLines.joined(separator: ",\n    ")
        ]
    }

    func installPhase() throws {
        // Install the module library and interfacing library
        try installLibrary(options.config.module)
        try installLibrary("\(options.config.module)-iota")
        try options.config.extraDynamicLibraries.forEach { try installLibrary($0) }
    }

    func compileHostLanguagePhase() throws {
        // Nothing to do here. Dart doesn't provide a way to compile libraries without running/testing them
    }

    override func preTestPhase() throws {
        try super.preTestPhase()
        try useLocalDependencies()
        try withDirectory("bindings/dart/generated") {
            // Fetch binary artifacts
            try cmd("dart", "run", "fishyjoes_dart:setup").run()
        }
    }

    /// Resolves the dependencies listed in `FISHYJOES_LOCAL_DEPENDENCIES` (module names, space separated) from their
    /// directories instead of their Dart publish tags, e.g. dependencies released together with this package, built
    /// earlier in the same workflow run. Their libraries are taken from `FISHYJOES_LOCAL_DEPENDENCY_ARTIFACTS`, a
    /// directory with the `<Module>-{mac,ubuntu,windows}_lib` artifacts of the Dart workflow, and fetched by the setup
    /// like those of any directory dependency. The overrides are only used for testing, the pubspec isn't changed.
    private func useLocalDependencies() throws {
        let environment = ProcessInfo.processInfo.environment
        let modules = (environment["FISHYJOES_LOCAL_DEPENDENCIES"] ?? "").split(separator: " ").map(String.init)
        guard !modules.isEmpty else {
            return
        }
        let dartPackageDirectory = "bindings/dart/generated"
        var overrideLines = ["dependency_overrides:"]
        for module in modules {
            guard let dependency = options.packageInfo.dependencyMap[module] else {
                throw ValidationError("Local dependency \(module) isn't a dependency in Package.swift")
            }
            let dependencyDartPackage = "\(dependency.localPath)/\(dartPackageDirectory)"
            if let artifacts = environment["FISHYJOES_LOCAL_DEPENDENCY_ARTIFACTS"] {
                for (directory, artifactPlatform) in [("macos", "mac"), ("linux", "ubuntu"), ("windows", "windows")] {
                    let artifact = "\(artifacts)/\(module)-\(artifactPlatform)_lib"
                    guard FileManager.default.fileExists(atPath: artifact) else {
                        continue
                    }
                    try cmd("rm", "-rf", "\(dependencyDartPackage)/\(directory)/native").run()
                    try cmd("mkdir", "-p", "\(dependencyDartPackage)/\(directory)").run()
                    try cmd("cp", "-R", artifact, "\(dependencyDartPackage)/\(directory)/native").run()
                }
            }
            overrideLines += [
                "  cricut_\(module.lowercased()):",
                "    path: \(relativePath(of: dependencyDartPackage, relativeTo: dartPackageDirectory))",
            ]
        }
        try (overrideLines.joined(separator: "\n") + "\n")
            .write(toFile: "\(dartPackageDirectory)/pubspec_overrides.yaml", atomically: true, encoding: .utf8)
    }

    func testPhase() throws {
        // Use dart to execute the test suite
        try withDirectory("bindings/dart/generated") {
            let env = options.codeCoveragePath.map {
                [
                    "LLVM_PROFILE_FILE": "\($0)/fishy-joes-test-\(platform)-\(UUID()).profraw",
                ]
            } ?? [:]
            try cmd("dart", "test", "--chain-stack-traces", addEnv: env).run()
        }
    }

    func packPhase() throws {
        let tarBaseDirectory = "bindings/dart/generated"
        let binariesToPack = (
            [options.config.module, options.config.module + "-iota"] +
                options.config.extraDynamicLibraries
        ).flatMap {
            [
                "macos/native/lib\($0).dylib",
                "linux/native/lib\($0).so",
                "windows/native/\($0).dll",
            ]
        }.filter {
            FileManager.default.fileExists(atPath: "\(tarBaseDirectory)/\($0)")
        }

        let packageDirectory = "bindings/dart/generated/packages"
        try cmd("mkdir", "-p", packageDirectory).run()
        try cmd(
            "tar",
            arguments: [
                "-cvzf", "\(packageDirectory)/\(options.config.module)-dart-binaries.tgz",
                "-C", tarBaseDirectory,
            ] + binariesToPack
        ).run()

        // Generate flutter package from dart package
        try withDirectory("bindings/dart") {
            try cmd("rm", "-rf", "generated/flutter-package").run()
            try cmd("mkdir", "-p", "generated/flutter-package/macos/native").run()
            try cmd("mkdir", "-p", "generated/flutter-package/linux/native").run()
            try cmd("mkdir", "-p", "generated/flutter-package/windows/native").run()

            try cmd("yq", ".version = strenv(VERSION)", addEnv: ["VERSION": options.version ?? "0.0.1-unknown"])
                .input(fromFile: "generated/flutter-pubspec.yaml")
                .output(overwritingFile: "generated/flutter-package/pubspec.yaml")
                .run()

            let installList = [
                (path: "lib/", required: true),

                (path: "macos/cricut_\(options.config.module.lowercased()).podspec", required: true),
                (path: "macos/native/lib\(options.config.module).dylib", required: false),
                (path: "macos/native/lib\(options.config.module)-iota.dylib", required: false),

                (path: "linux/CMakeLists.txt", required: true),
                (path: "linux/native/lib\(options.config.module).so", required: false),
                (path: "linux/native/lib\(options.config.module)-iota.so", required: false),

                (path: "windows/CMakeLists.txt", required: true),
                (path: "windows/native/\(options.config.module).dll", required: false),
                (path: "windows/native/\(options.config.module)-iota.dll", required: false),
            ] + options.config.extraDynamicLibraries.flatMap {
                [
                    (path: "macos/native/lib\($0).dylib", required: false),
                    (path: "linux/native/lib\($0).so", required: false),
                    (path: "windows/native/\($0).dll", required: false),
                ]
            }

            for (path, required) in installList {
                if required {
                    try cmd("cp", "-r", "generated/\(path)", "generated/flutter-package/\(path)").run()
                } else {
                    try? cmd("cp", "-r", "generated/\(path)", "generated/flutter-package/\(path)").run()
                }
            }

            // If no version is provided, use a dummy version to package
            try cmd("jq", "-e", ".version = env.VERSION", addEnv: ["VERSION": options.version ?? "0.0.1"])
                .input(fromFile: "generated/flutter-package.json")
                .output(overwritingFile: "generated/flutter-package/package.json")
                .run()

            // Pack using npm
            try cmd("mkdir", "-p", "../packed-npm-packages").run()
            let npmPackArgs = ["pack", "./generated/flutter-package", "--pack-destination", "../packed-npm-packages"]
            #if os(macOS) || os(Linux)
            try cmd("npm", arguments: npmPackArgs).run()
            #elseif os(Windows)
            try cmd("cmd.exe", arguments: ["/c", "npm"] + npmPackArgs).run()
            #else
            fatalError("unknown host OS")
            #endif
        }
    }
}
