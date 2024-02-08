import FishyJoesCommonRuntime
import Foundation

// This file should be the only dart-specific part of iota.
// It is needed because it is unsafe to invoke a dart function from another thread.
// Instead this function gets invoked and sends a message to dart to schedule the work on the appropriate thread.

@_cdecl("FishyJoesCommonRuntime_dartWorkScheduler")
public func FishyJoesCommonRuntime_dartWorkScheduler(envRef: EnvRef, context: UnsafeMutableRawPointer) {
    let env = Env(envRef)
    let ptrInt = Int64(bitPattern: UInt64(UInt(bitPattern: context)))
    guard Dart_PostInteger_DL(Env.dartSendPort[env], ptrInt) != 0 else {
        fatalError("Error posting to dart work scheduler port")
    }
}

@_cdecl("FishyJoesCommonRuntime_dartWorkScheduler_setup")
public func FishyJoesCommonRuntime_dartWorkScheduler_setup(
    envRef: EnvRef,
    sendPort: Int64,
    postInteger: @escaping _Dart_PostInteger
) {
    let env = Env(envRef)
    Env.dartSendPort[env] = sendPort
    // This should get set up very early, so probably race conditions won't happen
    if Dart_PostInteger_DL == nil {
        Dart_PostInteger_DL = postInteger
    }
}

public typealias _Dart_PostInteger = @convention(c) (_ port_id: Int64, _ message: Int64) -> UInt8
private var Dart_PostInteger_DL: _Dart_PostInteger!
