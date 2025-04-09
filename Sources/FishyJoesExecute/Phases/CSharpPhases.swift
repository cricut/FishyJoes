import Foundation
import swsh

class CSharpPhases: IotaPhases, Phases {

    func generationPhaseTemplateReplacements() throws -> [String: String] {
        var replacements: [String: String] = [:]
        replacements["__LIBRARY_CSPROJ_UUID__"] = UUID(deterministicFrom: "Cricut.\(options.config.module).csproj").uuidString
        replacements["__TESTS_CSPROJ_UUID__"] = UUID(deterministicFrom: "Cricut.\(options.config.module).Tests.csproj").uuidString

        let csProjDependencies = [
            (swift: "FishyJoes", nupkgsPath: "c-sharp-runtime/nupkgs", nuget: "Cricut.FishyJoesRuntime")
        ] + options.config.requiredModules.map {
            (swift: $0, nupkgsPath: "bindings/c-sharp/nupkgs", nuget: "Cricut.\($0)")
        }
        let csProjDependencyLines = {
            var dependencyPaths: [String] = []
            let deps = csProjDependencies.map {
                guard let dependency = options.packageInfo?.dependencyMap[$0.swift] else {
                    return #"<ItemGroup><PackageReference Include="\#($0.nuget)" Version="[0.0.1-unknown]" /></ItemGroup>"#
                }
                if let version = dependency.versionInNugetFormat {
                    return #"<ItemGroup><PackageReference Include="\#($0.nuget)" Version="\#(version)" /></ItemGroup>"#
                } else {
                    let path = relativePath(of: dependency.localPath, relativeTo: "bindings/c-sharp/generated/Cricut.\(options.config.module)/")
                    dependencyPaths.append("$(MSBuildThisFileDirectory)\(path)/\($0.nupkgsPath)")
                    return #"<ItemGroup><PackageReference Include="\#($0.nuget)" Version="[0.0.1-unknown]" /></ItemGroup>"#
                }
            }

            if dependencyPaths.isEmpty {
                return deps
            } else {
                return [
                    // Note: All these being in one line as one item seems to be important, even though ugly
                    #"<PropertyGroup><RestoreAdditionalProjectSources>\#(dependencyPaths.joined(separator: ";"))</RestoreAdditionalProjectSources></PropertyGroup>"#,
                ] + deps
            }
        }()
        replacements["__CSPROJ_DEPENDENCIES__"] = join(lines: csProjDependencyLines, indent: 2)

        return replacements
    }

    func installPhase() throws {
        // Install the module library and interfacing library
        try installLibrary(options.config.module)
        try installLibrary("\(options.config.module)-iota")
        try options.config.extraDynamicLibraries.forEach { try installLibrary($0) }
    }

    func compileHostLanguagePhase() throws {
        try withDirectory("bindings/c-sharp") {
            let solution = "generated/Cricut.\(options.config.module).sln"
            // dotnet caches "package doesn't exist" for an annoyingly long time. This still caches the large downloads.
            // This seems consistently flaky on clean checkouts, so try multiple times
            var restoreSucceeded = false
            for _ in 0..<2 {
                if cmd("dotnet", "restore", "--no-cache", solution).runBool() {
                    restoreSucceeded = true
                    break
                }
            }
            guard restoreSucceeded else {
                Log.error("dotnet restore failed after multiple attempts")
                fatalError()
            }

            var args = ["build", solution]
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
            var args = ["test", "generated/Cricut.\(options.config.module).sln", "--logger", "console;verbosity=detailed"]
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

        // TODO: fix this to use dotnet's package exclusion instead of using rm
        var dependencyBindingsPaths: [String: String] = [options.config.module: "."]
        for moduleName in options.config.requiredModules {
            guard let dependencyPath = options.packageInfo.dependencyMap[moduleName]?.localPath else {
                fatalError("Couldn't locate \(moduleName) in Package.swift, but it's required by fishyjoes.json")
            }
            dependencyBindingsPaths[moduleName] = dependencyPath
        }
        var dependencyXDLs = Set<String>()
        // Locate dependencies yaml files
        let fishyJoesYamlConfigs: [FishyJoesConfig] = try dependencyBindingsPaths.compactMap {
            $0.key == options.config.module ? nil : $0.value
        }.map(FishyJoesConfig.readFromFile(basePath:))

        fishyJoesYamlConfigs.forEach { dependencyXDLs.formUnion($0.extraDynamicLibraries) }
        let rmArgs = ["-f"] + dependencyXDLs.flatMap {
            [
                "c-sharp/Cricut.\(options.config.module)/runtimes/osx/native/lib\($0).dylib",
                "c-sharp/Cricut.\(options.config.module)/runtimes/linux/native/lib\($0).so",
                "c-sharp/Cricut.\(options.config.module)/runtimes/win/native/\($0).dll",
            ]
        }
        try cmd("rm", arguments: rmArgs).run()

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
