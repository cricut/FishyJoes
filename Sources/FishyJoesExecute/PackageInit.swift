import ArgumentParser
import Foundation
import swsh
import Yams

public struct PackageInit: ParsableCommand {
    public static var configuration = CommandConfiguration(abstract: "create/update the recommended files for a bindings repo in the current directory")

    @Flag(help: "continue with generation, even if not in a clean git state")
    var force = false

    struct Error: Swift.Error {}

    public init() {}

    public mutating func run() throws {
        ExternalCommand.verbose = true

        if (try? cmd("git", "status", "--porcelain", ".").runString().isEmpty) != true {
            guard force else {
                Log.error("Uncommitted changes present. Refusing to run. Specify --force to override safety")
                throw Error()
            }
            Log.warn("Uncommitted changes present. Continuing anyway.")
        }

        let config = try (try? FishyJoesConfig.readFromFile(basePath: ".")) ?? promptForConfig()
        let fileTemplater = try FileTemplater(
            config: config,
            phasesList: [],
            swiftPackage: nil,
            includeFilesNotMarkedAsGenerated: true
        )
        try fileTemplater.installTemplate()
        try setupKotlin(config: config)
        try setupCSharp(config: config)
    }

    func setupKotlin(config: FishyJoesConfig) throws {
        // Install gradle
        if !cmd("gradle", "--version").runBool() {
            try Interactive.confirmCommand(description: "Install gradle", cmd("brew", "install", "gradle"))
        }
    }

    func setupCSharp(config: FishyJoesConfig) throws {
        // Install dotnet
        if !cmd("dotnet", "--version").runBool() {
            try Interactive.confirmCommand(description: "Install dotnet", cmd("brew", "install", "dotnet"))
        }
    }

    func promptForConfig() throws -> FishyJoesConfig {
        Log.warn("No fishy-joes.yaml found. Will create one in \(FileManager.default.currentDirectoryPath)")
        let module = try Interactive.prompt("Name of swift product you're generating bindings for (e.g. CriGeo): ")
        let defaultRepository = "github.com/cricut/\(module)"
        var publishRepository: String? = try Interactive.prompt(
            "url of repository to publish bindings to, or \"nil\". Default [\(defaultRepository)]: ",
            allowEmpty: true
        )
        if publishRepository == "nil" {
            publishRepository = nil
        } else if publishRepository?.isEmpty == true {
            publishRepository = defaultRepository
        }

        let requiredModules = try Interactive.prompt(
            "Exported dependencies of \(module), space separated. Default []: ",
            allowEmpty: true
        )

        let extraDynamicLibraries = try Interactive.prompt(
            "Dynamic library names that do not have a -bindings repo and so are not in the requiredModules of \(module), space separated. Default []: ",
            allowEmpty: true
        )

        let excludeSources = try Interactive.prompt(
            "File or directory paths to exclude from generation, space separated. Default []:",
            allowEmpty: true
        )

        let config = FishyJoesConfig(
            module: module,
            publishRepository: publishRepository,
            requiredModules: requiredModules.split(separator: " ").map(String.init),
            extraDynamicLibraries: extraDynamicLibraries.split(separator: " ").map(String.init),
            excludeSources: excludeSources.split(separator: " ").map(String.init),
            ciPreBuildHook: nil,
            flexibleVersions: false,
            sourceryOverride: nil
        )

        let encoder = YAMLEncoder()
        let yaml = try encoder.encode(config)
        let path = "\(FileManager.default.currentDirectoryPath)/fishy-joes.yaml"

        Log.info("Will write to \(path):")
        print(yaml)
        Log.info("continue? ", terminator: "")
        guard try Interactive.promptYesNo() else {
            throw Error()
        }

        try cmd("cat").input(yaml).output(overwritingFile: path).run()

        return config
    }
}
