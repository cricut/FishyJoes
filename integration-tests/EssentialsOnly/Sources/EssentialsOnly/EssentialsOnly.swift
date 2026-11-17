// A library that only needs FoundationEssentials on WASI. Its wasm module must not link
// FoundationInternationalization or ICU; scripts/check-wasm-foundation-essentials.sh checks that.
#if os(WASI)
import FoundationEssentials
#else
import Foundation
#endif

/// <!-- FishyJoes.export(Echo) -->
public enum Echo {
    /// <!-- FishyJoes.export(echoData) -->
    public static func echo(data: Data) -> Data { data }

    /// <!-- FishyJoes.export(echoURL) -->
    public static func echo(url: URL) -> URL { url }

    /// <!-- FishyJoes.export(echoAttributedString) -->
    public static func echo(attributedString: AttributedString) -> AttributedString { attributedString }

    /// <!-- FishyJoes.export(echoAttributedSubstring) -->
    public static func echo(attributedSubstring: AttributedSubstring) -> AttributedSubstring { attributedSubstring }

    /// <!-- FishyJoes.export(echoAttributeContainer) -->
    public static func echo(attributeContainer: AttributeContainer) -> AttributeContainer { attributeContainer }
}
