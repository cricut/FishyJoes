//
//  ShadowedAnnotations.swift
//  FishyJoes
//

/// A type whose name matches a case of ``ShadowBox``. Inside ShadowBox's
/// generated Python class body, the case-type attribute (`Shade: ClassVar[...]`)
/// shadows this type's import, so annotations meaning this type must resolve
/// through a module-level alias in the generated stub.
/// <!-- FishyJoes.export(Shade) -->
public struct Shade: Hashable {
    public var darkness: Double

    public init(darkness: Double) {
        self.darkness = darkness
    }
}

/// <!-- FishyJoes.export(ShadowBox) -->
public enum ShadowBox: Hashable {
    case shade(Shade)
    case empty

    /// <!-- FishyJoes.export(allShades) -->
    public var allShades: [Shade] {
        if case .shade(let shade) = self {
            return [shade]
        }
        return []
    }

    /// <!-- FishyJoes.export(darkest) -->
    public static func darkest(of shades: [Shade]) -> Shade? {
        shades.max { $0.darkness < $1.darkness }
    }
}
