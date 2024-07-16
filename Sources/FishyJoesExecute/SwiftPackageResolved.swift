import Foundation

// Representation of a swift Package.resolved file
struct SwiftPackageResolved {
    let pins: [Pin]
    let version: Double

    struct Pin: Decodable {
        let identity: String?
        let package: String?
        let state: State
    }

    struct State: Decodable {
        let revision: String
        let branch: String?
        let version: String?
    }

    func revision(for identity: String) -> String? {
        pins.first {
            $0.identity?.lowercased() == identity.lowercased() || $0.package?.lowercased() == identity.lowercased()
        }?.state.revision
    }

    enum CodingKeys: CodingKey {
        case object, pins, version
    }
}

extension SwiftPackageResolved: Decodable {
    init(from decoder: any Decoder) throws {
        var container = try decoder.container(keyedBy: CodingKeys.self)
        version = try container.decode(Double.self, forKey: .version)
        if let object = try? container.nestedContainer(keyedBy: CodingKeys.self, forKey: .object) {
            container = object
        }
        pins = try container.decode([Pin].self, forKey: .pins)
    }
}
