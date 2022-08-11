import Foundation

// Not exercised per-language, but this will at test that the generator works

/// <!-- FishyJoes.exportReference(Deprecated) -->
public enum Deprecated {
    @available(*, deprecated, message: "don't use this")
    /// <!-- FishyJoes.export(deprecatedMethod) -->
    public static func deprecatedMethod() -> String {
        "Hello"
    }

    @available(*, deprecated, renamed: "deprecatedMethod")
    /// <!-- FishyJoes.export(deprecatedVariable) -->
    public static let deprecatedVariable: Int = 42
}
