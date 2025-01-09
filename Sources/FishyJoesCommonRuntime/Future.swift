import Foundation

// Based on https://cs3110.github.io/textbook/chapters/ds/promises.html#the-full-implementation
public final class Future<Output: Sendable>: Sendable {
    private typealias Handler = @Sendable (Result<Output, any Error>) -> Void

    // read or write access to state/handlers must be synchronized by lock
    private nonisolated(unsafe) var state: Result<Output, any Error>?
    private nonisolated(unsafe) var handlers: [Handler] = []
    private let lock = NSLock()

    public struct Promise: Sendable {
        fileprivate let future: Future<Output>

        public func resolve(_ resolved: Output) { handle(.success(resolved)) }
        public func reject(_ error: any Error) { handle(.failure(error)) }
        public func handle(_ result: Result<Output, any Error>) {
            let handlers = future.withLock { () -> [Handler] in
                if let state = future.state {
                    fatalError("Future resolved twice, first \(state), then \(result)")
                }
                future.state = result
                defer { future.handlers = [] }
                return future.handlers
            }
            for handler in handlers {
                handler(result)
            }
        }
    }

    private init(state: Result<Output, any Error>? = nil) { self.state = state }
    public static func success(_ success: Output) -> Future { .init(state: .success(success)) }
    public static func failure(_ error: any Error) -> Future { .init(state: .failure(error)) }
    public static func from(result: Result<Output, any Error>) -> Future { .init(state: result) }
}

extension Future: CustomStringConvertible {
    public var description: String {
        withLock { state }.map(String.init(describing:)) ?? "<future pending>"
    }

    public var debugDescription: String { description }
}

extension Future {
    func withLock<T>(_ operation: () throws -> T) rethrows -> T {
        lock.lock()
        defer { lock.unlock() }
        return try operation()
    }

    public static func make() -> (Future, Promise) {
        let future = Future()
        return (future, Promise(future: future))
    }

    public func sink(_ body: @escaping @Sendable (Result<Output, any Error>) -> Void) {
        let syncedState: Result<Output, any Error>? = withLock {
            if let state = state {
                return state
            } else {
                handlers.append(body)
                return nil
            }
        }
        syncedState.map(body)
    }

    public func flatMap<U>(_ body: @escaping @Sendable (Output) throws -> Future<U>) -> Future<U> {
        func bodyHandler(_ resolver: Future<U>.Promise) -> Future<Output>.Handler {
            { result in
                do {
                    try body(result.get()).sink { resolver.handle($0) }
                } catch {
                    resolver.reject(error)
                }
            }
        }

        // Create a function so that the lock can be released before calling body
        let promiseThunk: () -> Future<U> = withLock {
            switch state {
            case .success(let resolved):
                return {
                    do {
                        return try body(resolved)
                    } catch {
                        return Future<U>.failure(error)
                    }
                }
            case .failure(let error):
                return { Future<U>.failure(error) }
            case nil:
                let (outFuture, outResolver) = Future<U>.make()
                handlers.append(bodyHandler(outResolver))
                return { outFuture }
            }
        }
        return promiseThunk()
    }
}

extension Future {
    public convenience init(_ body: @escaping () async throws -> Output) {
        // let (self, future) = Future.make()
        // Unfortunately, the above isn't legal swift, so `make` is inlined instead
        self.init()
        let promise = Promise(future: self)
        Task {
            do {
                promise.resolve(try await body())
            } catch {
                promise.reject(error)
            }
        }
    }

    public static func detached(_ body: @escaping () async throws -> Output) -> Future<Output> {
        let (future, promise) = Future.make()
        Task.detached {
            do {
                promise.resolve(try await body())
            } catch {
                promise.reject(error)
            }
        }
        return future
    }

    public var value: Output {
        get async throws {
            try await withCheckedThrowingContinuation { continuation in
                sink { continuation.resume(with: $0) }
            }
        }
    }
}
