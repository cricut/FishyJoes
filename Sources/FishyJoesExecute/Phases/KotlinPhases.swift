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
        let gradleDependencyLines = gradleDependencies.map { dependency in
            // TODO: figure out how to use gradle version ranges. The solver may not be good enough for this to work properly.
            // See for example: https://github.com/gradle/gradle/issues/8126

            // let version = swiftPackage?.dependencyMap[$0.swift]?.versionInGradleFormat ?? "local"

            let resolved = options.packageResolved?.state(for: dependency.swift)
            var version = resolved?.version ?? resolved?.branch ?? resolved?.revision ?? "local"
            // Convert anything like "user/branch" into things gradle can parse, even if it probably won't find a release by that name
            version = version.replacingOccurrences(of: "/", with: "-")
            return "api(\"\(dependency.groupId):\(dependency.artifactId):\(version)\")"
        }
        replacements["__GRADLE_DEPENDENCIES__"] = join(lines: gradleDependencyLines, indent: 4)
        return replacements
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
        // Install the module library and interfacing JNI library
        try installLibrary(options.config.module)
        try installLibrary("\(options.config.module)-java")
        try options.config.extraDynamicLibraries.forEach { try installLibrary($0) }
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
