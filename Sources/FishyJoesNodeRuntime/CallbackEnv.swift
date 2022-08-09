import Foundation

public class CallbackEnv {
    public let env: NAPI.Env
    public let napiInfo: NAPI.CallbackInfo
    public let name: String
    public let expectedArgumentCount: Int
    public let hasNamedOptions: Bool

    private typealias Info = (argv: [NAPI.Value], this: NAPI.Value, data: UnsafeMutableRawPointer?)

    private var info: Info?

    public init(env: NAPI.Env, napiInfo: NAPI.CallbackInfo, name: String, expectedArgumentCount: Int, hasNamedOptions: Bool) {
        self.env = env
        self.napiInfo = napiInfo
        self.name = name
        self.expectedArgumentCount = expectedArgumentCount
        self.hasNamedOptions = hasNamedOptions
    }

    public subscript() -> NAPI.Env {
        env
    }
}

extension CallbackEnv {
    struct ArityError: Error {
        let message: String
    }

    private func getInfo() throws -> Info {
        if let info = self.info {
            return info
        }
        let info = try env.getCbInfo(self.napiInfo)
        if hasNamedOptions {
            guard info.argv.count == expectedArgumentCount || info.argv.count == expectedArgumentCount + 1 else {
                throw ArityError(message: "Error in \(name): Expected \(expectedArgumentCount) or \(expectedArgumentCount + 1) arguments, got \(info.argv.count)")
            }
        } else {
            guard info.argv.count == expectedArgumentCount else {
                throw ArityError(message: "Error in \(name): Expected \(expectedArgumentCount) arguments, got \(info.argv.count)")
            }
        }
        self.info = info
        return info
    }

    public func this() throws -> NAPI.Value {
        try getInfo().this
    }

    public func argument(at index: Int) throws -> NAPI.Value {
        try getInfo().argv[index]
    }

    public func data() throws -> UnsafeMutableRawPointer? {
        try getInfo().data
    }

    public func argument<T: NodeConverter>(at index: Int, converter type: T.Type) throws -> T.SwiftType {
        try T.fromNode(argument(at: index), env: env)
    }

    private func options() throws -> NAPI.Value? {
        assert(hasNamedOptions)
        let info = try getInfo()
        guard info.argv.count > expectedArgumentCount else { return nil }
        return info.argv[expectedArgumentCount]
    }

    public func argument<T: NodeConverter>(named name: String, default: @autoclosure () -> T.SwiftType, converter type: T.Type) throws -> T.SwiftType {
        if let options = try self.options(), try env.hasNamedProperty(options, name) {
            return try T.fromNode(try env.getNamedProperty(options, name), env: env)
        } else {
            return `default`()
        }
    }

    public func this<T: NodeConverter>(converter type: T.Type) throws -> T.SwiftType {
        try T.fromNode(this(), env: env)
    }
}
