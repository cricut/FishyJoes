import Foundation
import swsh

class KotlinPhases: BasePhases, Phases {
    func buildSwiftPhase() throws {
        // Build libraries for the requested platforms
        let libs = [options.config.module] + options.config.requiredModules
        try platform.build(
            product: "\(options.config.module)-java",
            libs: libs.flatMap { [$0, "\($0)-java"] } + ["FishyJoesJavaRuntime"],
            configuration: options.buildConfig
        )
    }

    func installPhase() throws {
        // Install the module library and interfacing JNI library
        try installLibrary(options.config.module)
        try installLibrary("\(options.config.module)-java")
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
            }

            #if os(macOS) || os(Linux)
            try cmd("./gradlew", arguments: args, addEnv: addEnv).run()
            #elseif os(Windows)
            try cmd("cmd.exe", arguments: ["/c", "gradlew.bat"] + args, addEnv: addEnv).run()
            #else
            fatalError("unknown host OS")
            #endif
        }
    }

    func packPhase() throws {
        // Pack happens as part of publish step in gradle
    }
}
