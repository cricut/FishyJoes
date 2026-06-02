import ArgumentParser
import Foundation
import swsh
import Yams

struct ProjectConfig: Codable {
    let module: String
    let publishRepository: String?
    let requiredModules: [String]
    let extraDynamicLibraries: [String]
    let excludeSources: [String]
    let ciPreBuildHook: String?
    let flexibleVersions: Bool
    let python: PythonConfig

    // Sometimes sourcery has conflicts with a particular macos or xcode
    // version, so while not recommended normally, this can be used to work
    // around temporary problems.
    let sourceryOverride: SourceryOverride?

    let ciRunners: CIRunners?

    // Authorization that may be needed to fetch any dependencies of the library
    let ciDependencyAuth: CIDependencyAuth?

    enum SourceryOverride {
        case local(String?) // Local sourcery binary. Will search PATH if nil
        case remote(String) // Run a specific version using mint
    }

    struct PythonConfig: Codable, Equatable {
        let distributionName: String?
        let importPackageName: String?
        let runtimeDistributionName: String
        let dependencies: [String: PythonDependencyConfig]

        static let `default` = PythonConfig(
            distributionName: nil,
            importPackageName: nil,
            runtimeDistributionName: "fishyjoes-runtime",
            dependencies: [:]
        )

        func distributionName(forModule module: String) -> String {
            distributionName ?? defaultDistributionName(forModule: module)
        }

        func importPackageName(forModule module: String) -> String {
            importPackageName ?? defaultImportPackageName(forModule: module)
        }

        func dependencyDistributionName(forModule module: String) -> String {
            dependencies[module]?.distributionName ?? defaultDistributionName(forModule: module)
        }

        func dependencyImportPackageName(forModule module: String) -> String {
            dependencies[module]?.importPackageName ?? defaultImportPackageName(forModule: module)
        }

        func validate(module: String) throws {
            try Self.validateDistributionName(distributionName(forModule: module), key: "python.distributionName")
            try Self.validateImportPackageName(importPackageName(forModule: module), key: "python.importPackageName")
            try Self.validateDistributionName(runtimeDistributionName, key: "python.runtimeDistributionName")
            for module in dependencies.keys {
                try Self.validateDistributionName(
                    dependencyDistributionName(forModule: module),
                    key: "python.dependencies.\(module).distributionName"
                )
                try Self.validateImportPackageName(
                    dependencyImportPackageName(forModule: module),
                    key: "python.dependencies.\(module).importPackageName"
                )
            }
        }

        private func defaultDistributionName(forModule module: String) -> String {
            module
                .replacingOccurrences(of: "_", with: "-")
                .lowercased()
        }

        private func defaultImportPackageName(forModule module: String) -> String {
            module
                .replacingOccurrences(of: "-", with: "_")
                .replacingOccurrences(of: ".", with: "_")
                .lowercased()
        }

        private static func validateDistributionName(_ name: String, key: String) throws {
            let pattern = #"^[A-Za-z0-9](?:[A-Za-z0-9._-]*[A-Za-z0-9])?$"#
            guard name.range(of: pattern, options: .regularExpression) != nil else {
                throw ValidationError("fishy-joes.yaml value for key `\(key)` is not a valid Python distribution name")
            }
        }

        private static func validateImportPackageName(_ name: String, key: String) throws {
            let pattern = #"^[A-Za-z_][A-Za-z0-9_]*$"#
            let pythonKeywords: Set<String> = [
                "False", "None", "True", "and", "as", "assert", "async", "await", "break",
                "class", "continue", "def", "del", "elif", "else", "except", "finally",
                "for", "from", "global", "if", "import", "in", "is", "lambda", "nonlocal",
                "not", "or", "pass", "raise", "return", "try", "while", "with", "yield",
            ]
            guard name.range(of: pattern, options: .regularExpression) != nil,
                  !pythonKeywords.contains(name)
            else {
                throw ValidationError("fishy-joes.yaml value for key `\(key)` is not a valid Python import package name")
            }
        }
    }

    struct PythonDependencyConfig: Codable, Equatable {
        let distributionName: String?
        let importPackageName: String?
    }

    struct CIRunners: Codable {
        let macos: String
        let ubuntu: String
        let windows: String

        static let defaults = CIRunners(macos: "macos-26", ubuntu: "ubuntu-22.04", windows: "windows-2025")
    }

    struct CIDependencyAuth: Codable {
        let user: String?
        let token: String
    }

    static func readFromFile(basePath: String) throws -> ProjectConfig {
        guard let configData = try? cmd("cat", "\(basePath)/bindings/fishy-joes.yaml").runString() else {
            throw ValidationError("missing config file \(basePath)/bindings/fishy-joes.yaml")
        }
        guard let configObject = try? Yams.load(yaml: configData),
              let configDictionary = configObject as? [String: Any]
        else {
            Log.error("fishy-joes.yaml root object must be a dictionary. Should be something like:")
            Log.error("---")
            Log.error("module: CriMyModule")
            Log.error("requiredModules:")
            Log.error("  - CriOtherModule")
            Log.error("excludeSources:")
            Log.error("  - SomeFile.swift")
            Log.error("  - Some/Directory/")
            Log.error("CIPreBuildHook: |")
            Log.error("  echo 'doing CI work in bash'")
            Log.error("CIRunners:")
            Log.error("  macos: \(CIRunners.defaults.macos)  # default")
            Log.error("  ubuntu: \(CIRunners.defaults.ubuntu)  # default")
            Log.error("  windows: \(CIRunners.defaults.windows)  # default")
            throw ValidationError("invalid YAML")
        }
        guard let moduleObj = configDictionary["module"] else {
            throw ValidationError("fishy-joes.yaml missing key `module`. Should be the name of the library target you're exporting.")
        }
        guard let module = moduleObj as? String else {
            throw ValidationError("fishy-joes.yaml value for key `module` is not a string. Should be the name of the library target you're exporting.")
        }
        let publishRepository = try configDictionary["publishRepository"].map { obj -> String in
            guard let str = obj as? String else {
                throw ValidationError("fishy-joes.yaml value for key `publishRepository` is not a string")
            }
            return str
        }
        let requiredModules = try configDictionary["requiredModules"].map { obj -> [String] in
            guard let list = obj as? [String] else {
                throw ValidationError("fishy-joes.yaml value for key `requiredModules` is not an array of module names")
            }
            return list
        }
        let extraDynamicLibraries = try configDictionary["extraDynamicLibraries"].map { obj -> [String] in
            guard let list = obj as? [String] else {
                throw ValidationError("fishy-joes.yaml value for key `extraDynamicLibraries` is not an array of file names")
            }
            return list
        }
        let excludeSources = try configDictionary["excludeSources"].map { obj -> [String] in
            guard let list = obj as? [String] else {
                throw ValidationError("fishy-joes.yaml value for key `excludeSources` is not an array of file or directory paths")
            }
            return list
        }
        let ciPreBuildHook = try configDictionary["CIPreBuildHook"].map { obj -> String in
            guard let hook = obj as? String else {
                throw ValidationError("fishy-joes.yaml value for key `CIPreBuildHook` is not a (string) bash script")
            }
            return hook
        }
        let flexibleVersions = (configDictionary["flexibleVersions"] as? Bool) ?? false
        let sourceryOverride = try configDictionary["sourceryOverride"].map { obj -> SourceryOverride in
            let dict = obj as? [String: Any]
            if let remote = dict?["remote"] as? String {
                return .remote(remote)
            } else if let path = dict?["local"] as? String {
                return .local(path)
            } else if dict?["local"] is NSNull {
                return .local(nil)
            } else {
                throw ValidationError(#"fishy-joes.yaml value for key `sourceryOverride` is \#(obj), not e.g. `{"remote": "krzysztofzablocki/Sourcery@x.y.z"}`, `{"local": "/path/to/sourcery"}`, or `{"local": null}`"#)
            }
        }
        let python = try readPythonConfig(configDictionary["python"])
        try python.validate(module: module)
        let ciRunners = try configDictionary["CIRunners"].map { obj -> CIRunners in
            guard let dict = obj as? [String: Any] else {
                throw ValidationError("fishy-joes.yaml value for key `CIRunners` is not a [String: String] dictionary")
            }
            return CIRunners(
                macos: dict["macos"] as? String ?? CIRunners.defaults.macos,
                ubuntu: dict["ubuntu"] as? String ?? CIRunners.defaults.ubuntu,
                windows: dict["windows"] as? String ?? CIRunners.defaults.windows,
            )
        }
        let ciDependencyAuth = try configDictionary["CIDependencyAuth"].map { obj -> CIDependencyAuth in
            guard let dict = obj as? [String: Any] else {
                throw ValidationError("fishy-joes.yaml value for key `CIDependencyAuth` is not a [String: String] dictionary")
            }
            guard let token = dict["token"] as? String else {
                throw ValidationError("fishy-joes.yaml value for key `CIDependencyAuth.token` is missing or not a String")
            }
            return CIDependencyAuth(user: dict["user"] as? String, token: token)
        }

        return ProjectConfig(
            module: module,
            publishRepository: publishRepository,
            requiredModules: requiredModules ?? [],
            extraDynamicLibraries: extraDynamicLibraries ?? [],
            excludeSources: excludeSources ?? [],
            ciPreBuildHook: ciPreBuildHook,
            flexibleVersions: flexibleVersions,
            python: python,
            sourceryOverride: sourceryOverride,
            ciRunners: ciRunners,
            ciDependencyAuth: ciDependencyAuth
        )
    }

    private static func readPythonConfig(_ obj: Any?) throws -> PythonConfig {
        guard let obj else {
            return .default
        }
        guard let dictionary = obj as? [String: Any] else {
            throw ValidationError("fishy-joes.yaml value for key `python` is not a dictionary")
        }

        func stringValue(_ key: String) throws -> String? {
            guard let value = dictionary[key] else {
                return nil
            }
            guard let string = value as? String else {
                throw ValidationError("fishy-joes.yaml value for key `python.\(key)` is not a string")
            }
            return string
        }

        var dependencies: [String: PythonDependencyConfig] = [:]
        if let dependenciesObject = dictionary["dependencies"] {
            guard let dependenciesDictionary = dependenciesObject as? [String: Any] else {
                throw ValidationError("fishy-joes.yaml value for key `python.dependencies` is not a dictionary")
            }
            for (module, dependencyObject) in dependenciesDictionary {
                guard let dependencyDictionary = dependencyObject as? [String: Any] else {
                    throw ValidationError("fishy-joes.yaml value for key `python.dependencies.\(module)` is not a dictionary")
                }
                func dependencyStringValue(_ key: String) throws -> String? {
                    guard let value = dependencyDictionary[key] else {
                        return nil
                    }
                    guard let string = value as? String else {
                        throw ValidationError("fishy-joes.yaml value for key `python.dependencies.\(module).\(key)` is not a string")
                    }
                    return string
                }
                dependencies[module] = PythonDependencyConfig(
                    distributionName: try dependencyStringValue("distributionName"),
                    importPackageName: try dependencyStringValue("importPackageName")
                )
            }
        }

        return PythonConfig(
            distributionName: try stringValue("distributionName"),
            importPackageName: try stringValue("importPackageName"),
            runtimeDistributionName: try stringValue("runtimeDistributionName") ?? PythonConfig.default.runtimeDistributionName,
            dependencies: dependencies
        )
    }
}

extension ProjectConfig.SourceryOverride: Codable {
    enum CodingKeys: CodingKey {
        case local, remote
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let path = try container.decodeIfPresent(String?.self, forKey: .local) {
            self = .local(path)
        } else if let remote = try container.decodeIfPresent(String.self, forKey: .remote) {
            self = .remote(remote)
        } else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Expected key 'local' or 'remote'"))
        }
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .local(let path):
            try container.encode(path, forKey: .local)
        case .remote(let remote):
            try container.encode(remote, forKey: .remote)
        }
    }
}
