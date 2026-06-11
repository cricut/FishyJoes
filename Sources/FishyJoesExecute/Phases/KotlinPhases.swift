import Foundation
import swsh

class KotlinPhases: BasePhases, Phases {
    func generationPhaseTemplateReplacements() throws -> [String: String] {
        var replacements: [String: String] = [:]

        let gradleDependencies = [
            (swift: "FishyJoes", groupId: "com.cricut.fishyjoes", artifactId: "runtime")
        ] + options.config.requiredModules.map {
            (swift: $0, groupId: "com.cricut.\($0)", artifactId: $0.lowercased())
        }
        let gradleDependencyLines = gradleDependencies.flatMap { dependency in
            let version = options.packageInfo?.dependencyMap[dependency.swift]?.versionInGradleFormat(flexibleVersions: options.config.flexibleVersions) ?? .inline("local")
            return version.formatLines(forPackage: "\(dependency.groupId):\(dependency.artifactId)")
        }
        replacements["__GRADLE_DEPENDENCIES__"] = join(lines: gradleDependencyLines, indent: 4)
        let localBuilds = localDependencyBuilds()
        replacements["__GRADLE_INCLUDED_BUILDS__"] = localBuilds.isEmpty ? "" : "\n" + join(lines: localBuilds, indent: 0)
        return replacements
    }

    private func localDependencyBuilds() -> [String] {
        options.config.requiredModules.compactMap { moduleName -> (path: String, moduleName: String)? in
            guard
                let dependency = options.packageInfo?.dependencyMap[moduleName],
                let editedPath = options.editedDependencyPaths[dependency.identity.lowercased()]
            else {
                return nil
            }
            let path = relativePath(
                of: "\(editedPath)/bindings/kotlin/generated",
                relativeTo: "bindings/kotlin/generated"
            )
            return (path, moduleName)
        }.map { path, moduleName in
            """
            includeBuild("\(path)") {
                name = "\(moduleName)"
                dependencySubstitution {
                    substitute(module("com.cricut.\(moduleName):\(moduleName.lowercased())")).using(project(":"))
                }
            }
            """
        }
    }

    func buildSwiftPhase() throws {
        // Build libraries for the requested platforms
        let libs = [options.config.module] + options.config.requiredModules
        try platform.build(
            product: "\(options.config.module)-java",
            libs: options.config.extraDynamicLibraries + libs.flatMap { [$0, "\($0)-java"] } + ["FishyJoesJavaRuntime"],
            configuration: options.buildConfig
        )
    }

    func installPhase() throws {
        let translatedLibraries = ([options.config.module] + options.config.requiredModules)
            .flatMap { [$0, "\($0)-java"] }
        let nativeLibraries = options.config.extraDynamicLibraries + translatedLibraries
        try nativeLibraries.forEach { try installLibrary($0) }
    }

    func compileHostLanguagePhase() throws {
        switch platform {
        case .kotlinSystem:
            try withDirectory("bindings/kotlin/generated") {
                #if os(macOS) || os(Linux)
                try cmd("./gradlew", "assemble").run()
                #elseif os(Windows)
                try cmd("cmd.exe", "/c", "gradlew.bat", "assemble").run()
                #else
                fatalError("unknown host OS")
                #endif
            }
        case .kotlinAndroid:
            // Compiled along with .kotlinSystem
            ()
        default:
            fatalError("not a kotlin platform")
        }
    }

    func testPhase() throws {
        // Use gradle to execute the test suite
        try withDirectory("bindings/kotlin/generated") {
            var args = ["cleanTest", "test"]
            var addEnv: [String: String] = [:]
            if let codeCoveragePath = options.codeCoveragePath {
                args.append("jacocoTestReport")
                addEnv["LLVM_PROFILE_FILE"] = "\(codeCoveragePath)/fishy-joes-test-\(platform)-\(UUID()).profraw"
                addEnv["JACOCO_COVERAGE_PATH"] = "\(codeCoveragePath)/jacoco-\(options.config.module)"
            }
            try gradle(args, addEnv: addEnv).run()
        }
    }

    func packPhase() throws {
        // Pack happens as part of publish step in gradle
        try withDirectory("bindings/kotlin/generated") {
            try gradle(["publishToMavenLocal"]).run()
        }
    }

    func gradle(_ args: [String], addEnv: [String: String] = [:]) -> any Command {
        #if os(macOS) || os(Linux)
        cmd("./gradlew", arguments: args, addEnv: addEnv)
        #elseif os(Windows)
        cmd("cmd.exe", arguments: ["/c", "gradlew.bat"] + args, addEnv: addEnv)
        #else
        fatalError("unknown host OS")
        #endif
    }
}
