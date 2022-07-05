import Foundation

public class CallbackEnv {
    public let env: NAPI.Env
    public let napiInfo: NAPI.CallbackInfo
    public let name: String
    public let expectedArgumentCount: Int

    private typealias Info = (argv: [NAPI.Value], this: NAPI.Value, data: UnsafeMutableRawPointer?)

    private var info: Info?

    public init(env: NAPI.Env, napiInfo: NAPI.CallbackInfo, name: String, expectedArgumentCount: Int) {
        self.env = env
        self.napiInfo = napiInfo
        self.name = name
        self.expectedArgumentCount = expectedArgumentCount
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
        guard info.argv.count == expectedArgumentCount else {
            throw ArityError(message: "Error in \(name): Expected \(expectedArgumentCount) arguments, got \(info.argv.count)")
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

    public func this<T: NodeConverter>(converter type: T.Type) throws -> T.SwiftType {
        try T.fromNode(this(), env: env)
    }
}
