import Foundation

// Regression fixture for generator robustness: an exported member whose signature
// references a type that is NOT exported must be diagnosed and skipped, not abort
// the whole run with a `fatalError` in `resolve`. Mirrors the CriRaster case where
// `Image.Color`'s annotation failed to attach, leaving `init?(rgbHex:)` referencing
// an unexported type.

// Intentionally NOT exported (no FishyJoes annotation).
public struct UnexportedReferencedType: Hashable {
    public init() {}
}

/// <!-- FishyJoes.export(SkippedMemberHost) -->
public enum SkippedMemberHost {
    /// Returns a non-exported type — must be skipped (return-type path).
    /// <!-- FishyJoes.export(makeUnexported) -->
    public static func makeUnexported() -> UnexportedReferencedType? {
        nil
    }

    /// Takes a non-exported type — must be skipped (parameter path).
    /// <!-- FishyJoes.export(consumeUnexported) -->
    public static func consumeUnexported(_ value: UnexportedReferencedType) -> Int {
        0
    }

    /// A computed property of a non-exported type — must be skipped (field path).
    /// <!-- FishyJoes.export(unexportedProperty) -->
    public static var unexportedProperty: UnexportedReferencedType {
        UnexportedReferencedType()
    }

    /// A sibling member referencing only exported types — must still generate.
    /// <!-- FishyJoes.export(echoInt) -->
    public static func echoInt(_ value: Int) -> Int {
        value
    }
}
