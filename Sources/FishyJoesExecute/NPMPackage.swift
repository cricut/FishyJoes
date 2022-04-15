struct NPMPackage: Codable {
    var name: String
    var version: String?
    var description: String?
    var main: String?
    var type: String?
    var types: String?
    var browser: String?
    var author: String?
    var repository: Repository?
    var publishConfig: PublishConfig? = PublishConfig()
    var dependencies: [String: String]?

    init(config: FishyJoesConfig, platform: Platform, version: String, dependencies: [String: String]?) {
        self.name = "@cricut/\(config.module.lowercased())-\(platform.platform.replacingOccurrences(of: "node-", with: ""))"
        self.version = version
        self.description = platform.packageDescription(config: config)
        self.dependencies = dependencies
        self.main = "\(config.module).js"
        self.type = "module"
        self.types = "\(config.module).d.ts"
        self.browser = "\(config.module).browser.js"
        self.repository = config.publishRepository.map {
            Repository(type: "git", url: "ssh://git@\($0).git", directory: "packages")
        }
    }

    struct Repository: Codable {
        var type: String
        var url: String
        var directory: String
    }
    
    struct PublishConfig: Codable  {
        var registry: String = "https://npm.pkg.github.com/"
    }
}
