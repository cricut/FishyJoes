struct NPMPackage: Codable {
    static func nameFor(config: FishyJoesConfig, platform: Platform) -> String {
        "@cricut/\(config.module.lowercased())-\(platform.nodeExecutionEnvironment)"
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

    init(name: String) {
        self.name = name
    }

    init(config: FishyJoesConfig, platform: Platform, version: String, dependencies: [String: String]?) {
        self.name = Self.nameFor(config: config, platform: platform)
        self.version = version
        self.description = platform.packageDescription(config: config)
        self.dependencies = dependencies ?? [:]
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
            self.scripts = nil// ["postinstall": "ln -s `cd ..; cd fishyjoes-runtime-\(platform.nodeExecutionEnvironment); realpath Runtime.cjs.node` libFishyJoesNodeRuntime.so"]
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
