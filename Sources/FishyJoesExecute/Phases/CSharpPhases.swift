import Foundation
import swsh

class CSharpPhases: IotaPhases, Phases {
    func installPhase() throws {
        // Install the module library and interfacing library
        try installLibrary(options.config.module)
        try installLibrary("\(options.config.module)-iota")
    }

    func compileHostLanguagePhase() throws {
        try withDirectory("bindings/c-sharp") {
            var args = ["build", "Cricut.\(options.config.module).sln"]
            if options.buildConfig.debug {
                args.append(contentsOf: ["--configuration", "Debug"])
            }
            try cmd("dotnet", arguments: args).run()
        }
    }

    func testPhase() throws {
        // Use dotnet to execute the test suite
        try withDirectory("bindings/c-sharp") {
            if options.codeCoveragePath != nil, !cmd("dotnet-coverage", "--version").runBool() {
                printAndFlush("Couldn't find dotnet-coverage! Install with:")
                printAndFlush()
                printAndFlush("   dotnet tool install --global dotnet-sonarscanner")
                printAndFlush()
                printAndFlush("and ensure that $HOME/.dotnet/tools is in your path")
            }

            var command = "dotnet"
            var args = ["test", "Cricut.\(options.config.module).sln", "--logger", "console;verbosity=detailed"]
            var addEnv: [String: String] = [:]
            if let codeCoveragePath = options.codeCoveragePath {
                command = "dotnet-coverage"
                addEnv["LLVM_PROFILE_FILE"] = "\(codeCoveragePath)/fishy-joes-test-\(platform)-\(UUID()).profraw"
                args = ["collect", "-f", "xml", "-o", "\(codeCoveragePath)/integration-tests-c-sharp.xml", "dotnet"] + args
            }
            try cmd(command, arguments: args, addEnv: addEnv).run()
        }
    }

    func packPhase() throws {
        // Pack using dotnet
        let name = "Cricut.\(options.config.module)"
        let version = options.version ?? "0.0.1-unknown"
        try cmd(
            "dotnet", "pack",
            "-c", "Release",
            "bindings/c-sharp/generated/\(name)/\(name).csproj",
            "/p:Version=\(version)",
            "--output", "bindings/c-sharp/nupkgs"
        ).run()
    }
}
