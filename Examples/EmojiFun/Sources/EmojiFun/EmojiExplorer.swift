/// A playground object for working with emoji.
/// <!-- FishyJoes.exportReference(EmojiExplorer) -->
public struct EmojiExplorer {
    /// Emits a hello string.
    /// - Returns: A string containing an emoji hello message.
    /// <!-- FishyJoes.export(hello) -->
    public static let hello = "👋🌎"

    /// A collection of emoji strings known to the object.
    ///
    /// This value could contain millions of strings and be very large, incuring a performance cost to communicate to foreign callers, so `enumerateKnown(_:)` is also provided.
    /// <!-- FishyJoes.export(known) -->
    public private(set) var known: Set<String>

    /// Emoji that have not yet been reported by a call to `randomUnique()`.
    fileprivate var unreported: Set<String>

    /// Creates an object that works with emoji strings.
    /// - Parameter count: The number of emoji strings to include in the object's known collection.
    /// <!-- FishyJoes.export(create) -->
    public init(count: Int) {
        // Find the first `count` Unicode Code Points that are emoji and use them to fulfill the request, if possible
        var emojiStrings: Set<String> = Set()
        var unicodeCodePoint: Int = -1
        let unicodeCodePointMaxValue: Int = 0x1FFFFF
        while emojiStrings.count < count, unicodeCodePoint < unicodeCodePointMaxValue {
            defer {
                unicodeCodePoint += 1
            }

            // Find the unicode scalar value corresponding to the code point and determine if it is emoji and has an emoji presentation by default
            guard let unicodeScalar = UnicodeScalar(unicodeCodePoint),
                  unicodeScalar.properties.isEmoji,
                  unicodeScalar.properties.isEmojiPresentation else {
                continue
            }

            // Convert the unicode scalar to a character (extended grapheme cluster), then create a string from it
            let character = Character(unicodeScalar)
            emojiStrings.insert(String(character))
        }

        // Fulfill the rest of the request using combinations of those already found
        while emojiStrings.count < count {
            precondition(!emojiStrings.isEmpty)
            emojiStrings.insert(emojiStrings.randomElement()! + emojiStrings.randomElement()!)
        }

        // Save the emoji strings and indicate none have been reported yet
        self.known = emojiStrings
        self.unreported = emojiStrings
    }

    /// Reports a random emoji string built using the object's collection of known emoji strings.
    /// - Returns: A string containing one or more random emoji. In the unusual case that the object knows zero emoji strings, the `hello` string is returned.
    /// <!-- FishyJoes.export(random) -->
    public func random() -> String {
        let s = (0..<Int.random(in: 0...100)).reduce(into: "") { s, _ in s.append(known.randomElement() ?? "") }
        return s.isEmpty ? Self.hello : s
    }

    /// Reports a random emoji string from the object's collection of known emoji strings, ensuring it is only reported once.
    /// - Returns: A random emoji string, or `nil` if all values known to the object have been reported.
    /// <!-- FishyJoes.export(randomUnique) -->
    public mutating func randomUnique() -> String? {
        guard let s = unreported.randomElement() else {
            return nil
        }
        unreported.remove(s)
        return s
    }

    /// Enumerates the emoji strings known to the object.
    /// - Parameter body: A closure to call with each string. On each call to the closure, a string is provided, and the closure should return `true` to continue enumeration or `false` to halt.
    /// <!-- FishyJoes.export(enumerateKnown) -->
    public func enumerateKnown(_ body: (String) throws -> Bool) rethrows {
        for s in known {
            guard try body(s) else { return }
        }
    }
}
