import Foundation

/// <!-- FishyJoes.export(DefaultArguments) -->
public enum DefaultArguments {
    /// <!-- FishyJoes.export(echoDefaults, compatibilityOrder: [z, y]) -->
    public static func echoDefaults(y: Int? = nil, x: Int?, theLabelForZ z: Double = 3.14) -> String {
        "\(x ?? 42) \(y ?? 52) \(z)"
    }

    /// <!-- FishyJoes.export(echoDefaultIntLimits) -->
    public static func echoDefaultIntLimits(minValue: Int = .min, maxValue: Int = .max) -> String {
        "\(minValue) \(maxValue)"
    }

    /// <!-- FishyJoes.export(echoExplicitIntMax) -->
    public static func echoExplicitIntMax(value: Int = Int.max) -> String {
        "\(value)"
    }
}
