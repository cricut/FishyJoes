import SourceryRuntime

extension SourceryVariable {
    var isNonisolated: Bool {
        modifiers.contains { $0.name == "nonisolated" }
    }

    var isAsyncOrIsolated: Bool {
        isAsync || (definedInType is Actor && !isNonisolated)
    }
}
