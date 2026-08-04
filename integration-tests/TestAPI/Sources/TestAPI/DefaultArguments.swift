import Foundation

/// <!-- FishyJoes.export(DefaultArguments) -->
public enum DefaultArguments {
    /// <!-- FishyJoes.export(echoDefaults, compatibilityOrder: [z, y]) -->
    public static func echoDefaults(y: Int? = nil, x: Int?, theLabelForZ z: Double = 3.14) -> String {
        "\(x ?? 42) \(y ?? 52) \(z)"
    }

    /// <!-- FishyJoes.export(describeEnumDefault) -->
    public static func describeEnumDefault(_ value: Int, color: SimpleEnum = .blue) -> String {
        "\(value) \(color.hex)"
    }

    // Intentionally exercises a default the generator cannot translate for
    // every language; the generate step is expected to emit a warning here.
    /// <!-- FishyJoes.export(echoDefaultTolerance) -->
    public static func echoDefaultTolerance(_ tolerance: Double = Double.ulpOfOne.squareRoot()) -> Double {
        tolerance
    }

    /// <!-- FishyJoes.export(echoDefaultIntLimits) -->
    public static func echoDefaultIntLimits(minValue: Int = .min, maxValue: Int = .max) -> String {
        "\(minValue) \(maxValue)"
    }
}
