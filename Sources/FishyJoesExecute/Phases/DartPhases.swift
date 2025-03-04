import Foundation
import swsh

class DartPhases: IotaPhases, Phases {
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
        try withDirectory("bindings/dart/generated") {
            // Fetch binary artifacts
            try cmd("dart", "run", "fishyjoes_dart:setup").run()
        }
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
        let tarCmdArgs = [
            "-cvzf", "\(options.config.module)-bindings-dart-binaries.tgz", "-C", "dart"
        ] + options.config.extraDynamicLibraries.flatMap {
            [
                "macos/native/lib\($0).dylib",
                "linux/native/lib\($0).so",
                "windows/native/\($0).dll"
            ]
        } + [
            "macos/native/lib\(options.config.module).dylib",
            "macos/native/lib\(options.config.module)-iota.dylib",
            "linux/native/lib\(options.config.module).so",
            "linux/native/lib\(options.config.module)-iota.so",
            "windows/native/\(options.config.module).dll",
            "windows/native/\(options.config.module)-iota.dll"
        ]
        try cmd("tar", arguments: tarCmdArgs).run()

        // Generate flutter package from dart package
        try withDirectory("bindings/dart") {
            try cmd("rm", "-rf", "generated/flutter-package").run()
            try cmd("mkdir", "-p", "generated/flutter-package/macos/native").run()
            try cmd("mkdir", "-p", "generated/flutter-package/linux/native").run()
            try cmd("mkdir", "-p", "generated/flutter-package/windows/native").run()

            try cmd("yq", ".version = strenv(VERSION)", addEnv: ["VERSION": options.version ?? "0.0.1-unknown"])
                .input(fromFile: "generated/npm_flutter_pubspec.yaml")
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

            var package = NPMPackage(name: "@cricut/flutter-\(options.config.module.lowercased())")
            package.version = options.version ?? "0.0.1" // If no version is provided, use a dummy version to package

            // If fishy-joes is file-local, use a file-local runtime too
            let runtimeVersion = options.fishyJoesDependency.versionInNpmFormat(addIfLocalPath: "/dart-runtime/flutter-package")

            var dependencies = ["@cricut/flutter-fishyjoes-runtime": runtimeVersion]
            for module in options.config.requiredModules {
                guard let dependency = options.packageInfo.dependencyMap[module] else {
                    fatalError("Could not locate dependency \(module) in Package.swift")
                }

                // If dependency is file-local, use a file-local dependency too
                let moduleVersion = dependency.versionInNpmFormat(addIfLocalPath: "/bindings/dart/generated/flutter-package")
                dependencies["@cricut/flutter-\(module.lowercased())"] = moduleVersion
            }
            package.dependencies = dependencies
            try cmd("cat")
                .inputJSON(from: package, encoder: PrettyJSONEncoder())
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
