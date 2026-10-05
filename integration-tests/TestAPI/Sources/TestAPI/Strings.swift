//
//  Strings.swift
//  FishyJoes
//
//  Created by Matt Stoker on 12/16/21.
//

/// Sample strings and string operations for Unicode round-trips.
/// <!-- FishyJoes.export(Strings) -->
public enum Strings {
    /// A simple ASCII greeting.
    /// <!-- FishyJoes.export(simple) -->
    public static let simple = "Hello"
    /// <!-- FishyJoes.export(accent) -->
    public static let accent = "Olá"
    /// <!-- FishyJoes.export(script) -->
    public static let script = "こんにちは"
    /// <!-- FishyJoes.export(chinese) -->
    public static let chinese = "你好"
    /// <!-- FishyJoes.export(chineseBMP) -->
    public static let chineseBMP = "豈更車賈滑"
    /// <!-- FishyJoes.export(chineseSIP) -->
    public static let chineseSIP = "\u{20001}\u{20002}\u{20003}\u{20004}"
    /// <!-- FishyJoes.export(emoji) -->
    public static let emoji = "🤯🐶🍓"
    /// <!-- FishyJoes.export(emojiMulti) -->
    public static let emojiMulti = "👨‍👩‍👧‍👦👍🏿🇺🇸"

    /// Returns the given string unchanged.
    /// <!-- FishyJoes.export(echo) -->
    public static func echo(_ string: String) -> String {
        return string
    }

    /// Splits the string on each occurrence of the separator.
    /// Returns the pieces in order without the separator.
    /// <!-- FishyJoes.export(split) -->
    public static func split(_ string: String, by: String) -> [String] {
        string.components(separatedBy: by).map(String.init(_:))
    }
}
