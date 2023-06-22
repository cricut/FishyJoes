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
    public static let simple = AttributedString("Hello")
    /// <!-- FishyJoes.export(accent) -->
    public static let accent = AttributedString("Olá")
    /// <!-- FishyJoes.export(script) -->
    public static let script = AttributedString("こんにちは")
    /// <!-- FishyJoes.export(chinese) -->
    public static let chinese = AttributedString("你好")
    /// <!-- FishyJoes.export(chineseBMP) -->
    public static let chineseBMP = AttributedString("豈更車賈滑")
    /// <!-- FishyJoes.export(chineseSIP) -->
    public static let chineseSIP = AttributedString("\u{20001}\u{20002}\u{20003}\u{20004}")
    /// <!-- FishyJoes.export(emoji) -->
    public static let emoji = AttributedString("🤯🐶🍓")
    /// <!-- FishyJoes.export(emojiMulti) -->
    public static let emojiMulti = AttributedString("👨‍👩‍👧‍👦👍🏿🇺🇸")

    /// <!-- FishyJoes.export(echo) -->
    public static func echo(_ string: AttributedString) -> AttributedString {
        return string
    }
}

/*
/// <!-- FishyJoes.exportReference(AttributeScope) -->
public struct AttributeScopeASDF {

}

/// <!-- FishyJoes.exportReference(AttributeContainer) -->
public struct AttributeContainerASDF: /*Equatable, */CustomStringConvertible {
    /// <!-- FishyJoes.export(createEmpty) -->
    public init() {}

    // TODO: Static or dynamic attributes?
//    public subscript<T>(_: T.Type) -> T.Value? where T : AttributedStringKey
    public subscript(_ attributeName: String) -> String? { attributes[attributeName] }
    /// <!-- FishyJoes.export(attributes) -->
    public var attributes: [String: String] { [:] }

//    public struct FoundationAttributes {
//        public let link: AttributeScopes.FoundationAttributes.LinkAttribute
//        public let morphology: AttributeScopes.FoundationAttributes.MorphologyAttribute
//        public let inflect: AttributeScopes.FoundationAttributes.InflectionRuleAttribute
//        public let languageIdentifier: AttributeScopes.FoundationAttributes.LanguageIdentifierAttribute
//        public let personNameComponent: AttributeScopes.FoundationAttributes.PersonNameComponentAttribute
//        public let numberFormat: AttributeScopes.FoundationAttributes.NumberFormatAttributes
//        public let dateField: AttributeScopes.FoundationAttributes.DateFieldAttribute
//        public let inlinePresentationIntent: AttributeScopes.FoundationAttributes.InlinePresentationIntentAttribute
//        public let presentationIntent: AttributeScopes.FoundationAttributes.PresentationIntentAttribute
//        public let alternateDescription: AttributeScopes.FoundationAttributes.AlternateDescriptionAttribute
//        public let imageURL: AttributeScopes.FoundationAttributes.ImageURLAttribute
//        public let replacementIndex: AttributeScopes.FoundationAttributes.ReplacementIndexAttribute
//        public let measurement: AttributeScopes.FoundationAttributes.MeasurementAttribute
//        public let inflectionAlternative: AttributeScopes.FoundationAttributes.InflectionAlternativeAttribute
//        public let byteCount: AttributeScopes.FoundationAttributes.ByteCountAttribute
//    }
//    public var foundationAttributes: FoundationAttributes

//    public struct CriTextAttributes {
//        public let font: AttributeScopes.CriTextAttributes.FontAttribute
//        public let alternateGlyph: AttributeScopes.CriTextAttributes.AlternateGlyphAttribute
//        public let strokeStyle: AttributeScopes.CriTextAttributes.StrokeStyle
//    }
//    public var criTextAttributes: CriTextAttributes

    /// <!-- FishyJoes.export(merge) -->
    public mutating func merge(_ other: Self, mergePolicy: AttributedStringASDF.AttributeMergePolicy? = nil) {}

    public var description: String { "fake" }
}

/// <!-- FishyJoes.exportReference(AttributedString) -->
public struct AttributedStringASDF: CustomStringConvertible, Hashable {
    /// <!-- FishyJoes.export(createEmpty) -->
    public init() {}
    /// <!-- FishyJoes.export(create) -->
    public init(_ string: String, attributes: AttributeContainerASDF? = nil) {}
    /// <!-- FishyJoes.export(createFromSubstring) -->
    public init(_ substring: AttributedSubstringASDF) {}

    /// <!-- FishyJoes.export(startIndex) -->
    public var startIndex: Index { .init() }
    /// <!-- FishyJoes.export(endIndex) -->
    public var endIndex: Index { .init() }

    /// <!-- FishyJoes.export(unicodeScalars) -->
    public var unicodeScalars: UnicodeScalarView { .init() }
    /// <!-- FishyJoes.export(characters) -->
    public var characters: CharacterView { .init() }
    /// <!-- FishyJoes.export(runs) -->
    public var runs: Runs { .init() }

    public subscript(_ range: Range<Index>) -> AttributedSubstringASDF { .init() }
    /// <!-- FishyJoes.export(substringForRange) -->
    public func substring(for range: Range<Index>) -> AttributedSubstringASDF { self[range] }
    /// <!-- FishyJoes.export(substring) -->
    public var substring: AttributedSubstringASDF { .init() }

    // TODO: Static or dynamic attributes?
//    public subscript<T>(_: T.Type) -> T.Value? where T : AttributedStringKey
    public subscript(_ attributeName: String) -> String? { attributes[attributeName] }
    /// <!-- FishyJoes.export(attributes) -->
    public var attributes: [String: String] { [:] }

    /// <!-- FishyJoes.export(setAttributes) -->
    public mutating func setAttributes(_ attributes: AttributeContainerASDF) {}
    /// <!-- FishyJoes.export(mergeAttributes) -->
    public mutating func mergeAttributes(_ attributes: AttributeContainerASDF, mergePolicy: AttributedStringASDF.AttributeMergePolicy? = nil) {}
    /// <!-- FishyJoes.export(replaceAttributes) -->
    public mutating func replaceAttributes(_ attributes: AttributeContainerASDF, with others: AttributeContainerASDF) {}

    /// <!-- FishyJoes.export(append) -->
    public mutating func append(_ s: Self) {}
    /// <!-- FishyJoes.export(insert) -->
    public mutating func insert(_ s: Self, at index: Index) {}
    /// <!-- FishyJoes.export(removeSubrange) -->
    public mutating func removeSubrange(_ range: Range<Index>) {}
    /// <!-- FishyJoes.export(replaceSubrange) -->
    public mutating func replaceSubrange(_ range: Range<Index>, with s: Self) {}

    public var description: String { "fake" }
}

/// <!-- FishyJoes.exportReference(AttributedSubstring) -->
public struct AttributedSubstringASDF: CustomStringConvertible, Hashable {
    /// <!-- FishyJoes.export(createEmpty) -->
    public init() {}

    public typealias Index = AttributedStringASDF.Index

    /// <!-- FishyJoes.export(base) -->
    public var base: AttributedStringASDF { .init() }

    /// <!-- FishyJoes.export(startIndex) -->
    public var startIndex: Index { .init() }
    /// <!-- FishyJoes.export(endIndex) -->
    public var endIndex: Index { .init() }

    /// <!-- FishyJoes.export(unicodeScalars) -->
    public var unicodeScalars: AttributedStringASDF.UnicodeScalarView { .init() }
    /// <!-- FishyJoes.export(characters) -->
    public var characters: AttributedStringASDF.CharacterView { .init() }
    /// <!-- FishyJoes.export(runs) -->
    public var runs: AttributedStringASDF.Runs { .init() }

    public subscript(_ range: Range<Index>) -> AttributedSubstringASDF { .init() }
    /// <!-- FishyJoes.export(substringForRange) -->
    public func substring(for range: Range<Index>) -> AttributedSubstringASDF { self[range] }
    /// <!-- FishyJoes.export(substring) -->
    public var substring: AttributedSubstringASDF { .init() }

    // TODO: Static or dynamic attributes?
//    public subscript<T>(_: T.Type) -> T.Value? where T : AttributedStringKey
    public subscript(_ attributeName: String) -> String? { attributes[attributeName] }
    /// <!-- FishyJoes.export(attributes) -->
    public var attributes: [String: String] { [:] }

    /// <!-- FishyJoes.export(setAttributes) -->
    public mutating func setAttributes(_ attributes: AttributeContainerASDF) {}
    /// <!-- FishyJoes.export(mergeAttributes) -->
    public mutating func mergeAttributes(_ attributes: AttributeContainerASDF, mergePolicy: AttributedStringASDF.AttributeMergePolicy? = nil) {}
    /// <!-- FishyJoes.export(replaceAttributes) -->
    public mutating func replaceAttributes(_ attributes: AttributeContainerASDF, with others: AttributeContainerASDF) {}

    public var description: String { "fake" }
}

extension AttributedStringASDF {
    /// <!-- FishyJoes.exportReference(AttributedString.Index) -->
    public struct Index: Comparable, Sendable {
        public init() { self._data = 0 }
        public init(_data: UInt64) { self._data = _data }
        public var _data: UInt64
        public static func < (lhs: Index, rhs: Index) -> Bool { false }
        public static func == (a: Index, b: Index) -> Bool { false }
    }
}

extension AttributedStringASDF {
    /// <!-- FishyJoes.export(AttributedString.AttributeMergePolicy) -->
    public enum AttributeMergePolicy: String, Hashable, Sendable {
        case keepNew
        case keepCurrent
    }
}

extension AttributedStringASDF {
    /// <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView) -->
    public struct UnicodeScalarView: RangeReplaceableCollection, BidirectionalCollection {
        public init() {}

        public typealias Element = UInt32//UnicodeScalar
        public typealias Index = AttributedStringASDF.Index

        /// <!-- FishyJoes.export(startIndex) -->
        public var startIndex: Index { .init() }
        /// <!-- FishyJoes.export(endIndex) -->
        public var endIndex: Index { .init() }
        /// <!-- FishyJoes.export(indexBefore) -->
        public func index(before i: Index) -> Index { .init() }
        /// <!-- FishyJoes.export(indexAfter) -->
        public func index(after i: Index) -> Index { .init() }
        /// <!-- FishyJoes.export(indexOffsetByDistance) -->
        public func index(_ i: Index, offsetBy distance: Int) -> Index { .init() }

        public subscript(index: Index) -> Element { .max }//{ "A" }
        /// <!-- FishyJoes.export(elementAt) -->
        public func element(at index: Index) -> Element { self[index] }

        /// <!-- FishyJoes.export(replaceSubrange, generic: [C: [UInt32]]) -->
        public mutating func replaceSubrange<C>(_ subrange: Range<Index>, with newElements: C) where C: Collection, C.Element == UInt32 {}//Element {}
    }
}

extension AttributedStringASDF {
    /// <!-- FishyJoes.exportReference(AttributedString.CharacterView) -->
    public struct CharacterView: BidirectionalCollection, RangeReplaceableCollection {
        public init() {}

        public typealias Element = String//Character
        public typealias Index = AttributedStringASDF.Index

        /// <!-- FishyJoes.export(startIndex) -->
        public var startIndex: Index { .init() }
        /// <!-- FishyJoes.export(endIndex) -->
        public var endIndex: Index { .init() }
        /// <!-- FishyJoes.export(indexBefore) -->
        public func index(before i: Index) -> Index { .init() }
        /// <!-- FishyJoes.export(indexAfter) -->
        public func index(after i: Index) -> Index { .init() }

        public subscript(index: Index) -> Element { "A" }
        /// <!-- FishyJoes.export(elementAt) -->
        public func element(at index: Index) -> Element { self[index] }

        /// <!-- FishyJoes.export(replaceSubrange, generic: [C: [String]]) -->
        public mutating func replaceSubrange<C>(_ subrange: Range<Index>, with newElements: C) where C: Collection, C.Element == String {}//Element {}
    }
}

extension AttributedStringASDF {
    /// <!-- FishyJoes.exportReference(AttributedString.Runs) -->
    public struct Runs: BidirectionalCollection, CustomStringConvertible {
        public init() {}

        /// <!-- FishyJoes.exportReference(AttributedString.Runs.Index) -->
        public struct Index: Comparable, Strideable, Sendable {
            public init() { self._data = 0 }
            public init(_data: UInt64) { self._data = _data }
            public var _data: UInt64

            public static func < (lhs: Self, rhs: Self) -> Bool { false }
            public func distance(to other: Self) -> Int { 0 }
            public func advanced(by n: Int) -> Self { .init() }
            public typealias Stride = Int
        }

        /// <!-- FishyJoes.exportReference(AttributedString.Runs.Run) -->
        public struct Run: /*Equatable, */CustomStringConvertible {
            /// <!-- FishyJoes.export(range) -->
            public var range: Range<AttributedStringASDF.Index> { AttributedStringASDF.Index()..<AttributedStringASDF.Index() }
            /// <!-- FishyJoes.export(attributes) -->
            public var attributes: AttributeContainerASDF { .init() }

            public var description: String { "fake" }
        }
        public typealias Element = Run

        /// <!-- FishyJoes.export(startIndex) -->
        public var startIndex: Index { .init() }
        /// <!-- FishyJoes.export(endIndex) -->
        public var endIndex: Index { .init() }
        /// <!-- FishyJoes.export(indexBefore) -->
        public func index(before i: Index) -> Index { .init() }
        /// <!-- FishyJoes.export(indexAfter) -->
        public func index(after i: Index) -> Index { .init() }

        public subscript(position: Index) -> Run { .init() }
        /// <!-- FishyJoes.export(elementAt) -->
        public func element(at index: Index) -> Element { self[index] }

        public subscript(position: AttributedStringASDF.Index) -> Run { .init() }
        /// <!-- FishyJoes.export(elementAtPosition) -->
        public func element(at index: AttributedStringASDF.Index) -> Element { self[index] }

        public var description: String { "fake" }
    }
}
*/
