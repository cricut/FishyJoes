import Foundation

/// Thread safe container for generic type
///
/// Avoids verbosity and error proneness versus inline locks and accessors.
/// The speed is about the same as with inline locks and accessors in RELEASE scheme, which has compiler optimizations turned on. In DEBUG mode, which has compiler optimizations turned off, AtomicBox is significantly slower than inline locks and accessors, but not so much that it is a huge unit test slowness burden. Since Apple heavily discourages testing in Release mode, as we must use unsafe flags to enable testability in Release mode, this is a tradeoff that was deemed acceptable.
///
/// _read/_modify, though officially undocumented, was found to be significantly faster than using get/set during tests because they allow direct access to values without copies. https://github.com/swiftlang/swift/blob/main/docs/OwnershipManifesto.md#generalized-accessors
public final class AtomicBox<T> {
    private var _value: T
    private let _lock = NSRecursiveLock()

    public init(_ value: T) {
        self._value = value
    }

    public var value: T {
        _read {
            _lock.lock()
            defer { _lock.unlock() }
            yield _value
        }
        _modify {
            _lock.lock()
            defer { _lock.unlock() }
            yield &_value
        }
    }
}

extension AtomicBox: @unchecked Sendable where T: Sendable {}

/// Thread safe container for generic type, with lazy initializer.
///
/// Initializer is only called when value is read, and not when LazyAtomicBox is initialized. The purpose of this is to provide a thread safe container for lazy vars in Swift.
///
/// Avoids verbosity and error proneness versus inline locks and accessors.
/// The speed is about the same as with inline locks and accessors in RELEASE scheme, which has compiler optimizations turned on. In DEBUG mode, which has compiler optimizations turned off, AtomicBox is significantly slower than inline locks and accessors, but not so much that it is a huge unit test slowness burden. Since Apple heavily discourages testing in Release mode, as we must use unsafe flags to enable testability in Release mode, this is a tradeoff that was deemed acceptable.
///
/// _read/_modify, though officially undocumented, was found to be significantly faster than using get/set during tests because they allow direct access to values without copies. https://github.com/swiftlang/swift/blob/main/docs/OwnershipManifesto.md#generalized-accessors
public final class LazyAtomicBox<T> {
    private var _value: T?
    private let _lock = NSRecursiveLock()
    private var lazyInit: (() -> T)?
    private var hasLazyInited = false

    public init(_ lazyInit: @escaping () -> T) {
        self.lazyInit = lazyInit
    }

    public var value: T {
        _read {
            _lock.lock()
            defer { _lock.unlock() }

            if !hasLazyInited {
                _value = lazyInit!()
                lazyInit = nil
                hasLazyInited = true
            }
            yield _value!
        }
        _modify {
            _lock.lock()
            defer { _lock.unlock() }

            if !hasLazyInited {
                _value = lazyInit!()
                lazyInit = nil
                hasLazyInited = true
            }

            yield &_value!
        }
    }
}

extension LazyAtomicBox: @unchecked Sendable where T: Sendable {}
