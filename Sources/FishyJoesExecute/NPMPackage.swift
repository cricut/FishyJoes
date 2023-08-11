struct NPMPackage: Codable {
    static func name(config: FishyJoesConfig, platform: Platform) -> String {
        "@cricut/\(config.module.lowercased())-\(platform.executionEnvironment)"
    }

    var name: String
    var version: String?
    var description: String?
    var main: String?
    var type: String?
    var types: String?
    var browser: String?
    var author: String?
    var repository: Repository?
    var publishConfig: PublishConfig?
    var dependencies: [String: String]?
    var scripts: [String: String]?

    init(config: FishyJoesConfig, platform: Platform, version: String, dependencies: [String: String]?) {
        self.name = Self.name(config: config, platform: platform)
        self.version = version
        self.description = platform.packageDescription(config: config)
        self.dependencies = dependencies ?? [:]
        // TODO: This needs to reference a real package once it is published
        self.dependencies?["@cricut/fishyjoes-runtime-\(platform.executionEnvironment)"] = "file:../../../../node-runtime/fishyjoes-runtime-\(platform.executionEnvironment)"
        self.main = "\(config.module).js"
        self.type = "module"
        self.types = "\(config.module).d.ts"
        self.browser = "\(config.module).browser.js"
        self.publishConfig = PublishConfig(registry: "https://npm.pkg.github.com/")
        self.repository = config.publishRepository.map {
            Repository(type: "git", url: "ssh://git@\($0).git", directory: "packages")
        }
        switch platform.platform {
        case "node-native-ubuntu": // TODO: Find something that works for this
            self.scripts = nil// ["postinstall": "ln -s `cd ..; cd fishyjoes-runtime-\(platform.executionEnvironment); realpath Runtime.cjs.node` libFishyJoesNodeRuntime.so"]
        default:
            self.scripts = nil
        }
    }

    struct Repository: Codable {
        var type: String
        var url: String
        var directory: String
    }

    struct PublishConfig: Codable {
        var registry: String
    }
}
