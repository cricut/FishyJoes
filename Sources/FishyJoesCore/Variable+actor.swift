import SourceryRuntime

extension SourceryVariable {
    var isNonisolated: Bool {
        modifiers.contains { $0.name == "nonisolated" }
    }
}
