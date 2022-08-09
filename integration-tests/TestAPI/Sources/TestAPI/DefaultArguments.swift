import Foundation

/// <!-- FishyJoes.exportReference(DefaultArguments) -->
public enum DefaultArguments {
    /// <!-- FishyJoes.export(echoDefaults, cSharp: TheBytes) -->
    public static func echoDefaults(y: Int? = nil, x: Int?, z: Double = 3.14) -> String {
        "\(x ?? 42) \(y ?? 52) \(z)"
    }
}
