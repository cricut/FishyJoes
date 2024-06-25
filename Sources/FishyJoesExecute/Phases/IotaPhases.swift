import Foundation
import swsh

class IotaPhases: BasePhases {
    func buildSwiftPhase() throws {
        // Build libraries for the requested platforms
        let libs = [options.config.module] + options.config.requiredModules
        try platform.build(
            product: "\(options.config.module)-iota",
            libs: libs.flatMap { [$0, "\($0)-iota"] } + ["FishyJoesIotaRuntime"],
            configuration: options.buildConfig
        )
    }
}
