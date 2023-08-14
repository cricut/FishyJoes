//
//  AttributedStrings.swift
//  FishyJoes
//
//  Created by Matt Stoker on 6/14/23.
//

import Foundation

/// <!-- FishyJoes.export(AttributedStrings) -->
public enum AttributedStrings {
    /// <!-- FishyJoes.export(simple) -->
    public static let simple = AttributedString("Hello", attributes: .init().languageIdentifier("en"))
    /// <!-- FishyJoes.export(accent) -->
    public static let accent = AttributedString("Olá", attributes: .init().languageIdentifier("pt"))
    /// <!-- FishyJoes.export(script) -->
    public static let script = AttributedString("こんにちは", attributes: .init().languageIdentifier("ja"))
    /// <!-- FishyJoes.export(chinese) -->
    public static let chinese = AttributedString("你好", attributes: .init().languageIdentifier("zh"))
    /// <!-- FishyJoes.export(chineseBMP) -->
    public static let chineseBMP = AttributedString("豈更車賈滑", attributes: .init().languageIdentifier("zh"))
    /// <!-- FishyJoes.export(chineseSIP) -->
    public static let chineseSIP = AttributedString("\u{20001}\u{20002}\u{20003}\u{20004}", attributes: .init().languageIdentifier("zh"))
    /// <!-- FishyJoes.export(emoji) -->
    public static let emoji = AttributedString("🤯🐶🍓", attributes: .init().link(URL(string: "https://home.unicode.org/emoji")!))
    /// <!-- FishyJoes.export(emojiMulti) -->
    public static let emojiMulti = AttributedString("👨‍👩‍👧‍👦👍🏿🇺🇸", attributes: .init().link(URL(string: "https://home.unicode.org/emoji/emoji-frequency")!))
    /// <!-- FishyJoes.export(polyglot) -->
    public static let polyglot: AttributedString = { Self.simple + " " + Self.accent + " " + Self.script }()

    /// <!-- FishyJoes.export(echo) -->
    public static func echo(_ string: AttributedString) -> AttributedString {
        return string
    }
}

/*
/// A string with associated attributes for portions of its text.
///
/// See `text` or `characters` for access to the text of an attributed string.
/// See `runs` for access to the attribute information associated with the attributed string's text.
///
/// <!-- FishyJoes.exportReference(AttributedString) -->
public struct AttributedStringASDF: Hashable {

    /// Text represented by the attributed string.
    ///
    /// See `runs` for the attribute information associated with the attributed string's text.
    ///
    /// <!-- FishyJoes.export(string) -->
    public var string: String { .init() }

    /// The attributed runs of the attributed string, as a view into the underlying string.
    ///
    /// This view provides access to the attribute information associated with the attributed string.
    ///
    /// See `runs.elementAtPosition()` or its `get()` operator for a way to access the attributes that
    /// are associated with a particular position in the attributed string.
    ///
    /// For example, `s.runs.first().attributes` yields the attributes in the first run of `s`
    /// and `s.runs[index].attributes` yields the attributes associated with the position `index` in `s`.
    ///
    /// <!-- FishyJoes.export(runs) -->
    public var runs: Runs { .init() }

    /// The characters of the attributed string, as a view into the underlying string.
    /// <!-- FishyJoes.export(characters) -->
    public var characters: CharacterView { .init() }

    /// The Unicode scalars of the attributed string, as a view into the underlying string.
    /// <!-- FishyJoes.export(unicodeScalars) -->
    public var unicodeScalars: UnicodeScalarView { .init() }

    /// An attributed substring representing the full content of the attributed string.
    /// <!-- FishyJoes.export(substring) -->
    public var substring: AttributedSubstringASDF { .init() }

    /// Obtains an attributed substring representing part of the attributed string.
    ///
    /// - Parameter range The portion of the attributed string to be represented by the substring, bounded by `startIndex` and `endIndex`.
    ///
    /// <!-- FishyJoes.export(substringForRange) -->
    public func substring(for range: Range<Index>) -> AttributedSubstringASDF { .init() }

    /// The position of the first character in a nonempty attributed string.
    ///
    /// See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.
    ///
    /// <!-- FishyJoes.export(startIndex) -->
    public var startIndex: Index { .init() }

    /// An attributed string’s past-the-end position — the position one greater than the last valid subscript argument.
    ///
    /// See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.
    ///
    /// <!-- FishyJoes.export(endIndex) -->
    public var endIndex: Index { .init() }

    /// Appends the text and any associated attributes of another attributed string to the end of this one.
    /// - Parameter attributedString The attributed string containing the text and attributes to append.
    ///
    /// <!-- FishyJoes.export(append) -->
    public mutating func append(_ attributedString: Self) {}

    /// Appends the text and any associated attributes of the portion of an attributed string represented by a substring to the end of this one.
    /// - Parameter subtring The substring containing the text and attributes to append.
    ///
    /// <!-- FishyJoes.export(appendSubstring) -->
    public mutating func appendSubstring(_ substring: AttributedSubstringASDF) {}

    /// Inserts the text and any associated attributes of another attributed string into this one at the specified position.
    ///
    /// - Parameter attributedString The attributed string containing the text and attributes to insert.
    /// - Parameter index Position at which the content of `attributedString` should be inserted, bounded by `startIndex` and `endIndex`.
    ///     If `index` is `startIndex` the content will be inserted before all content of this attributed string.
    ///     If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `append()`.
    ///
    /// <!-- FishyJoes.export(insert) -->
    public mutating func insert(_ attributedString: Self, at index: Index) {}

    /// Inserts the text and any associated attributes of a substring of an attributed string into this one at the specified position.
    ///
    /// - Parameter substring The substring of an attributed string containing the text and attributes to insert.
    /// - Parameter index Position at which the content of `substring` should be inserted, bounded by `startIndex` and `endIndex`.
    ///     If `index` is `startIndex` the content will be inserted before all content of this attributed string.
    ///     If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `appendSubstring()`.
    ///
    /// <!-- FishyJoes.export(insertSubstring) -->
    public mutating func insertSubstring(_ substring: AttributedSubstringASDF, at index: Index) {}

    /// Replaces a portion of the text and associated attributes of the attributed string with content from another one.
    ///
    /// - Parameter range The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.
    /// - Parameter attributedString The attributed string containing the text and attributes that replaces the content in `range`.
    ///
    /// <!-- FishyJoes.export(replaceSubrange) -->
    public mutating func replaceSubrange(_ range: Range<Index>, with attributedString: Self) {}

    /// Replaces a portion of the text and associated attributes of the attributed string with content from a substring of another one.
    ///
    /// - Parameter range The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.
    /// - Parameter substring The substring of an attributed string containing the text and attributes that replaces the content in `range`.
    ///
    /// <!-- FishyJoes.export(replaceSubrangeWithSubstring) -->
    public mutating func replaceSubrangeWithSubstring(_ range: Range<Index>, with substring: AttributedSubstringASDF) {}

    /// Removes a portion of the text and associated attributes from the attributed string.
    ///
    /// - Parameter range The portion of the attributed string to remove, bounded by `startIndex` and `endIndex`.
    ///
    /// <!-- FishyJoes.export(removeSubrange) -->
    public mutating func removeSubrange(_ range: Range<Index>) {}

    /// Associates attributes with the content of the entire attributed string, replacing any existing attribute information.
    ///
    /// - Parameter attributes The attributes which will subsequently apply to all text in the attributed string.
    ///
    /// <!-- FishyJoes.export(setAttributes) -->
    public mutating func setAttributes(_ attributes: AttributeContainerASDF) {}

    /// Associates attributes with the content of a portion of the attributed string, replacing any existing attribute information.
    ///
    /// - Parameter range The portion of the attributed string whose attributes are to be replaced, bounded by `startIndex` and `endIndex`.
    /// - Parameter attributes The attributes which will subsequently apply to the text in `range`.
    ///
    /// <!-- FishyJoes.export(setAttributesForRange) -->
    public mutating func setAttributes(for range: Range<Index>, attributes: AttributeContainerASDF) {}

    /// Associates attributes with the content of the entire attributed string, merging with any existing attribute information.
    ///
    /// - Parameter attributes The attributes which will subsequently apply to all text in the attributed string.
    /// - Parameter keepCurrent For attributes in `attributes` that already have a value in the attributed string,
    ///     passing `true` retains the current value of the attribute,
    ///     passing `false` replaces the value of the attribute with the one in `attributes`.
    ///
    /// <!-- FishyJoes.export(mergeAttributes) -->
    public mutating func mergeAttributes(_ attributes: AttributeContainerASDF, keepCurrent: Bool = false) {}

    /// Associates attributes with the content of a portion of the attributed string, merging with any existing attribute information.
    ///
    /// - Parameter range The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.
    /// - Parameter attributes The attributes which will subsequently apply to the text in `range`.
    /// - Parameter keepCurrent For attributes in `attributes` that already have a value in `range` in the attributed string,
    ///     passing `true` retains the current value of the attribute,
    ///     passing `false` replaces the value of the attribute with the one in `attributes`.
    ///
    /// <!-- FishyJoes.export(mergeAttributesForRange) -->
    public mutating func mergeAttributes(for range: Range<Index>, attributes: AttributeContainerASDF, keepCurrent: Bool = false) {}

    /// Replaces occurrences of attributes in one attribute container with those in another attribute container.
    ///
    /// - Parameter attributes The existing attributes to replace.
    /// - Parameter others The new attributes to apply.
    ///
    /// <!-- FishyJoes.export(replaceAttributes) -->
    public mutating func replaceAttributes(_ attributes: AttributeContainerASDF, with others: AttributeContainerASDF) {}

    /// Replaces occurrences of attributes in one attribute container with those in another attribute container.
    ///
    /// - Parameter range The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.
    /// - Parameter attributes The existing attributes to replace.
    /// - Parameter others The new attributes to apply.
    ///
    /// <!-- FishyJoes.export(replaceAttributesForRange) -->
    public mutating func replaceAttributes(for range: Range<Index>, attributes: AttributeContainerASDF, with others: AttributeContainerASDF) {}

    /// Creates an attributed string containing the empty string as its text with no associated attributes.
    /// <!-- FishyJoes.export(createEmpty) -->
    public init() {}

    /// Creates an attributed string containing a string as its text, all associated with the specified attributes.
    ///
    /// - Parameter string A string containing the text to serve as the content of the attributed string.
    /// - Parameter attributes Attributes to associate with the full range of the attributed string.
    ///
    /// <!-- FishyJoes.export(create) -->
    public init(_ string: String, attributes: AttributeContainerASDF? = nil) {}

    /// Creates an attributed string drawing its the text and attributes from a substring of another attributed string.
    ///
    /// - Parameter substring A substring of another attributed string whose content is used for the created attributed string.
    ///
    /// <!-- FishyJoes.export(createFromSubstring) -->
    public init(_ substring: AttributedSubstringASDF) {}
}

/// A type that represents a portion of an attributed string.
///
/// The attributed string for which the type represents a sub-portion can be accessed in the `base` property.
/// The indices offered in `startIndex` and `endIndex` are in the same index space as those in `base`,
/// so they can be used to find what part of `base` the substring represents.
///
/// <!-- FishyJoes.exportReference(AttributedSubstring) -->
public struct AttributedSubstringASDF: Hashable {
    public typealias Index = AttributedStringASDF.Index

    /// The attributed string that this substring references.
    ///
    /// The `startIndex` and `endIndex` of this substring are comparable to `base.startIndex` and `base.endIndex` and are guaranteed to be bounded by them.
    /// As such, the portion of the base string represented by the substring is the range from `startIndex` inclusive to `endIndex` exclusive.
    ///
    /// <!-- FishyJoes.export(base) -->
    public var base: AttributedStringASDF { .init() }

    /// Text represented by the attributed substring.
    ///
    /// See `runs` for the attribute information associated with the attributed substring's text.
    ///
    /// <!-- FishyJoes.export(string) -->
    public var string: String { .init() }

    /// The attributed runs of the attributed substring, as a view into the underlying string.
    ///
    /// This view provides access to the attribute information associated with the attributed substring.
    ///
    /// See `runs.elementAtPosition()` or its `get()` operator for a way to access the attributes that
    /// are associated with a particular position in the attributed substring.
    ///
    /// For example, `s.runs.first().attributes` yields the attributes in the first run of `s`
    /// and `s.runs[index].attributes` yields the attributes associated with the position `index` in `s`.
    ///
    /// <!-- FishyJoes.export(runs) -->
    public var runs: AttributedStringASDF.Runs { .init() }

    /// The characters of the attributed substring, as a view into the underlying string.
    /// <!-- FishyJoes.export(characters) -->
    public var characters: AttributedStringASDF.CharacterView { .init() }

    /// The Unicode scalars of the attributed substring, as a view into the underlying string.
    /// <!-- FishyJoes.export(unicodeScalars) -->
    public var unicodeScalars: AttributedStringASDF.UnicodeScalarView { .init() }

    /// The position of the first character in a nonempty attributed substring.
    ///
    /// See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.
    ///
    /// <!-- FishyJoes.export(startIndex) -->
    public var startIndex: Index { .init() }

    /// An attributed substring’s past-the-end position — the position one greater than the last valid subscript argument.
    ///
    /// See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.
    ///
    /// <!-- FishyJoes.export(endIndex) -->
    public var endIndex: Index { .init() }

    /// An attributed substring representing the full content of the attributed substring.
    /// <!-- FishyJoes.export(substring) -->
    public var substring: AttributedSubstringASDF { .init() }

    /// Obtains an attributed substring representing part of the attributed substring.
    ///
    /// - Parameter range The portion of the attributed substring to be represented by the substring, bounded by `startIndex` and `endIndex`.
    /// - Returns A substring of `base` over `range`.
    ///
    /// <!-- FishyJoes.export(substringForRange) -->
    public func substring(for range: Range<Index>) -> AttributedSubstringASDF { .init() }

    /// Creates an attributed substring with an empty base attributed string.
    /// <!-- FishyJoes.export(createEmpty) -->
    public init() {}
}

/// A type that provides a way to store attributes and their values outside of an attributed string.
///
/// Use this type to initialize an instance of AttributedString with preset attributes,
/// and to set, merge, or replace attributes in existing attributed strings.
///
/// Libraries that depend on `AttributeContainer` are free to define their own attributes to be associated with attributed strings.
/// As a result of this flexibility, the actual values of attributes can only be obtained using types defined in those libraries.
///
/// The runtime itself defines one such type, `AttributeContainer.FoundationAttributes`.
/// To obtain the values of attributes from that type, such as the `link` attribute or `languageIdentifier` attribute,
/// one must construct an instance passing the container:
///
/// `link = AttributeContainer.FoundationAttributes(someContainer).link`
///
/// <!-- FishyJoes.exportReference(AttributeContainer) -->
public struct AttributeContainerASDF: Hashable {

    /// Merges the attributes of another attribute container with those of this container.
    ///
    /// - Parameter other The other attribute container whose attributes should be merged into this container.
    /// - Parameter keepCurrent For attributes in `other` that already have a value in this container,
    ///     passing `true` retains the current value of the attribute,
    ///     passing `false` replaces the value of the attribute with the one in `other`.
    ///
    /// <!-- FishyJoes.export(merge) -->
    public mutating func merge(_ other: Self, keepCurrent: Bool = false) {}

    /// Creates an attribute container having no attribute values.
    /// <!-- FishyJoes.export(createEmpty) -->
    public init() {}
}

extension AttributeContainerASDF {
    /// Attributes defined by the Swift Foundation library in ``AttributeScopes``, packaged as a static type.
    ///
    /// This type (and the ones like it defined in other libraries) allow features similar to those
    /// offered by Swift dynamic member lookup in ``AttributeScope`` to be exported to other languages.
    ///
    /// An attribute container can be asked to fill in the fields defined by this structure using `AttributeContainerFoundationAttributes(AttributeContainer)`.
    /// This type can be asked to fill in an attribute container using `AttributeContainer(FoundationAttributes)`.
    ///
    /// Combining these calls with `AttributedString.setAttributes(_:)` and `AttributedString.mergeAttributes(_:)` allows expansion
    /// of attributed strings with new attributes in other languages analogously to how it is done in ``AttributeScopes`` using Swift dynamic member lookup.
    ///
    /// <!-- FishyJoes.exportReference(AttributeContainer.FoundationAttributes) -->
    public struct FoundationAttributes: Hashable, Sendable {
        /// A link attribute.
        /// <!-- FishyJoes.export(link) -->
        public var link: URL?

        /// A language identifier attribute.
        /// <!-- FishyJoes.export(languageIdentifier) -->
        public var languageIdentifier: String?

        /// Creates a Foundation attribute container having no attribute values.
        /// <!-- FishyJoes.export(createEmpty) -->
        public init() {}

        /// Extracts the Foundation attributes from an attribute container and makes them available as statically typed properties.
        /// <!-- FishyJoes.export(createFromContainer) -->
        public init(_ container: AttributeContainer) {
            self.link = container.link
            self.languageIdentifier = container.languageIdentifier
        }
    }
}

extension AttributedStringASDF {
    /// A type that represents the position of a character or code unit within an attributed string.
    /// <!-- FishyJoes.exportReference(AttributedString.Index) -->
    public struct Index: Comparable, Hashable, Sendable {
        public init() { self._data = 0 }
        public init(_data: UInt64) { self._data = _data }
        public var _data: UInt64
        public static func < (lhs: Index, rhs: Index) -> Bool { false }
        public static func == (a: Index, b: Index) -> Bool { false }
    }
}

extension AttributedStringASDF {
    /// An iterable view into segments of the attributed string or substring, each of which indicates where a run of identical attributes begins or ends.
    /// <!-- FishyJoes.exportReference(AttributedString.Runs) -->
    public struct Runs: BidirectionalCollection, Hashable {
        /// A type that represents the position of a descriptor for a run within an attributed string's view of runs.
        /// <!-- FishyJoes.exportReference(AttributedString.Runs.Index) -->
        public struct Index: Comparable, Strideable, Hashable, Sendable {
            public init() { self._data = 0 }
            public init(_data: UInt64) { self._data = _data }
            public var _data: UInt64

            public static func < (lhs: Self, rhs: Self) -> Bool { false }
            public func distance(to other: Self) -> Int { 0 }
            public func advanced(by n: Int) -> Self { .init() }
            public typealias Stride = Int
        }

        /// Description of a run of attributes within an attributed string or substring.
        /// <!-- FishyJoes.exportReference(AttributedString.Runs.Run) -->
        public struct Run: Hashable {
            /// The range of the portion of the attributed string that this run description represents.
            /// <!-- FishyJoes.export(range) -->
            public var range: Range<AttributedStringASDF.Index> { AttributedStringASDF.Index()..<AttributedStringASDF.Index() }

            /// The attributes associated with of the portion of the attributed string that this run description represents.
            /// <!-- FishyJoes.export(attributes) -->
            public var attributes: AttributeContainerASDF { .init() }
        }

        /// <!-- FishyJoes.exportReference(AttributedString.Runs.Element) -->
        public typealias Element = Run

        /// The position of the first run in a nonempty attributed string or substring.
        /// <!-- FishyJoes.export(startIndex) -->
        public var startIndex: Index { .init() }

        /// The past-the-end position — the position one greater than the last valid subscript argument.
        /// <!-- FishyJoes.export(endIndex) -->
        public var endIndex: Index { .init() }

        /// Obtains the run index before another index.
        ///
        /// - Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
        /// - Returns The index of the run before `index`.
        ///     If `index` is `startIndex` an exception is thrown.
        ///     If `index` is `endIndex`, the last valid index is returned.
        ///
        /// <!-- FishyJoes.export(indexBefore) -->
        public func index(before i: Index) -> Index { .init() }

        /// Obtains the run index after another index.
        ///
        /// - Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
        /// - Returns The index of the run after `index`.
        ///     If `index` is `endIndex`, an exception is thrown.
        ///     If `index` is `startIndex`, the first valid index is returned.
        ///
        /// <!-- FishyJoes.export(indexAfter) -->
        public func index(after i: Index) -> Index { .init() }

        /// Obtains the run descriptor at a run index.
        ///
        /// - Parameter index The index of the desired run, between `startIndex` inclusive and `endIndex` exclusive.
        /// - Returns The descriptor for the run at `index`.
        ///      If `index` is `endIndex`, an exception is thrown.
        ///      If `index` is `startIndex`, the first valid run descriptor is returned.
        ///
        /// <!-- FishyJoes.export(elementAt) -->
        public func element(at index: Index) -> Element { .init() }

        /// Obtains the run descriptor associated with an attributed string index.
        ///
        /// - Parameter index The index of the desired position in the attributed string or substring that this object is a view for,
        ///              between its `startIndex` inclusive and `endIndex` exclusive.
        /// - Returns The descriptor for the run whose `range` contains `index`.
        ///     If `index` is `endIndex` of the view's attributed string or substring, an exception is thrown.
        ///     If `index` is `startIndex` of the view's attributed string or substring, the first valid run descriptor is returned.
        ///
        /// <!-- FishyJoes.export(elementAtPosition) -->
        public func element(at index: AttributedStringASDF.Index) -> Element { .init() }

        public init() {}
        public subscript(position: Index) -> Run { return .init() }
    }
}

extension AttributedStringASDF {
    /// A view into the underlying storage of an attributed string or substring, as Unicode characters.
    /// <!-- FishyJoes.exportReference(AttributedString.CharacterView) -->
    public struct CharacterView: BidirectionalCollection {
        /// <!-- FishyJoes.exportReference(AttributedString.CharacterView.Element) -->
        public typealias Element = String//Character

        /// <!-- FishyJoes.exportReference(AttributedString.CharacterView.Index) -->
        public typealias Index = AttributedStringASDF.Index

        /// The position of the first character in a nonempty attributed string or substring.
        /// <!-- FishyJoes.export(startIndex) -->
        public var startIndex: Index { .init() }

        /// The past-the-end position — the position one greater than the last valid subscript argument.
        /// <!-- FishyJoes.export(endIndex) -->
        public var endIndex: Index { .init() }

        /// Obtains the index of the character before the character referenced by another index in the view's attributed string or substring.
        ///
        /// - Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
        /// - Returns The index of the character before the one referenced by `index`.
        ///     If `index` is `startIndex` an exception is thrown.
        ///     If `index` is `endIndex`, the index to the last character in the view's attributed string or substring is returned.
        ///
        /// <!-- FishyJoes.export(indexBefore) -->
        public func index(before i: Index) -> Index { .init() }

        /// Obtains the index of the character after the character referenced by another index in the view's attributed string or substring.
        ///
        /// - Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
        /// - Returns The index of the character before the one referenced by `index`.
        ///     If `index` is `endIndex` an exception is thrown.
        ///     If `index` is `startIndex`, the index to the first character in the view's attributed string or substring is returned.
        ///
        /// <!-- FishyJoes.export(indexAfter) -->
        public func index(after i: Index) -> Index { .init() }

        /// Obtains the character associated with an attributed string index.
        ///
        /// - Parameter index The index of the desired character, between `startIndex` inclusive and `endIndex` exclusive.
        /// - Returns The character associated with `index`.
        ///     If `index` is `endIndex`, an exception is thrown.
        ///     If `index` is `startIndex`, the first character in the view's attributed string or substring is returned.
        ///
        /// <!-- FishyJoes.export(elementAt) -->
        public func element(at index: Index) -> Element { .init() }

        public init() {}
        public subscript(index: Index) -> Element { "A" }
    }
}

extension AttributedStringASDF {
    /// A view into the underlying storage of the attributed string, as Unicode scalars.
    /// <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView) -->
    public struct UnicodeScalarView: BidirectionalCollection {
        /// <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView.Element) -->
        public typealias Element = UInt32//UnicodeScalar
        /// <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView.Index) -->
        public typealias Index = AttributedStringASDF.Index

        /// The position of the first Unicode scalar in a nonempty attributed string or substring.
        /// <!-- FishyJoes.export(startIndex) -->
        public var startIndex: Index { .init() }

        /// The past-the-end position — the position one greater than the last valid subscript argument.
        /// <!-- FishyJoes.export(endIndex) -->
        public var endIndex: Index { .init() }

        /// Obtains the index of the Unicode scalar before the scalar referenced by another index in the view's attributed string or substring.
        ///
        /// - Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
        /// - Returns The index of the Unicode scalar before the one referenced by `index`.
        ///     If `index` is `startIndex` an exception is thrown.
        ///     If `index` is `endIndex`, the index to the last Unicode scalar in the view's attributed string or substring is returned.
        ///
        /// <!-- FishyJoes.export(indexBefore) -->
        public func index(before i: Index) -> Index { .init() }

        /// Obtains the index of the Unicode scalar after the scalar referenced by another index in the view's attributed string or substring.
        ///
        /// - Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
        /// - Returns The index of the Unicode scalar before the one referenced by `index`.
        ///     If `index` is `endIndex` an exception is thrown.
        ///     If `index` is `startIndex`, the index to the first Unicode scalar in the view's attributed string or substring is returned.
        ///
        /// <!-- FishyJoes.export(indexAfter) -->
        public func index(after i: Index) -> Index { .init() }

        /// Obtains the Unicode scalar associated with an attributed string index.
        ///
        /// - Parameter index The index of the desired Unicode scalar, between `startIndex` inclusive and `endIndex` exclusive.
        /// - Returns The Unicode scalar associated with `index`.
        ///     If `index` is `endIndex`, an exception is thrown.
        ///     If `index` is `startIndex`, the first Unicode scalar in the view's attributed string or substring is returned.
        ///
        /// <!-- FishyJoes.export(elementAt) -->
        public func element(at index: Index) -> Element { .init() }

        public init() {}
        public subscript(index: Index) -> Element { .max }//{ "A" }
    }
}
*/
