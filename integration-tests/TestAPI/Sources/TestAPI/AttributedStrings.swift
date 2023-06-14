//
//  AttributedStrings.swift
//  FishyJoes
//
//  Created by Matt Stoker on 6/14/23.
//

import Foundation

/// <!-- FishyJoes.export(Strings) -->
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

/// <!-- FishyJoes.exportReference(AttributeScope) -->
public struct AttributeScopeASDF {

}

public struct AttributeContainerASDF {

}

/// <!-- FishyJoes.exportReference(AttributedString) -->
public struct AttributedStringASDF: CustomStringConvertible, Hashable {
    /// <!-- FishyJoes.export(startIndex) -->
    public var startIndex: Index { return .init() }
    /// <!-- FishyJoes.export(endIndex) -->
    public var endIndex: Index { return .init() }

    public var unicodeScalars: UnicodeScalarView { .init() }
    public var characters: CharacterView { .init() }
    public var runs: Runs { .init() }

    public mutating func setAttributes(_ attributes: AttributeContainerASDF) {}
    public mutating func mergeAttributes(_ attributes: AttributeContainerASDF, mergePolicy: AttributedStringASDF.AttributeMergePolicy) {}
    public mutating func replaceAttributes(_ attributes: AttributeContainerASDF, with others: AttributeContainerASDF) {}

//    public subscript<K>(_: K.Type) -> K.Value? where K : AttributedStringKey { get { nil } set {} }
//    public attributes(at index: Index) -> AttributeContainerASDF

    public var description: String { "fake" }


//    public subscript<K>(_: K.Type) -> K.Value? where K : AttributedStringKey
//    public subscript<K>(dynamicMember keyPath: KeyPath<AttributeDynamicLookup, K>) -> K.Value? where K : AttributedStringKey
//    public subscript<S>(dynamicMember keyPath: KeyPath<AttributeScopes, S.Type>) -> ScopedAttributeContainer<S> where S : AttributeScope
//
//    public mutating func setAttributes(_ attributes: AttributeContainer)
//    public mutating func mergeAttributes(_ attributes: AttributeContainer, mergePolicy: AttributedString.AttributeMergePolicy = .keepNew)
//    public mutating func replaceAttributes(_ attributes: AttributeContainer, with others: AttributeContainer)
//
//    public func transformingAttributes<K>(_ k: K.Type, _ c: (inout AttributedString.SingleAttributeTransformer<K>) -> Void) -> AttributedString where K : AttributedStringKey
//    public func transformingAttributes<K1, K2>(_ k: K1.Type, _ k2: K2.Type, _ c: (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>) -> Void) -> AttributedString where K1 : AttributedStringKey, K2 : AttributedStringKey
//    public func transformingAttributes<K1, K2, K3>(_ k: K1.Type, _ k2: K2.Type, _ k3: K3.Type, _ c: (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>, inout AttributedString.SingleAttributeTransformer<K3>) -> Void) -> AttributedString where K1 : AttributedStringKey, K2 : AttributedStringKey, K3 : AttributedStringKey
//    public func transformingAttributes<K1, K2, K3, K4>(_ k: K1.Type, _ k2: K2.Type, _ k3: K3.Type, _ k4: K4.Type, _ c: (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>, inout AttributedString.SingleAttributeTransformer<K3>, inout AttributedString.SingleAttributeTransformer<K4>) -> Void) -> AttributedString where K1 : AttributedStringKey, K2 : AttributedStringKey, K3 : AttributedStringKey, K4 : AttributedStringKey
//    public func transformingAttributes<K1, K2, K3, K4, K5>(_ k: K1.Type, _ k2: K2.Type, _ k3: K3.Type, _ k4: K4.Type, _ k5: K5.Type, _ c: (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>, inout AttributedString.SingleAttributeTransformer<K3>, inout AttributedString.SingleAttributeTransformer<K4>, inout AttributedString.SingleAttributeTransformer<K5>) -> Void) -> AttributedString where K1 : AttributedStringKey, K2 : AttributedStringKey, K3 : AttributedStringKey, K4 : AttributedStringKey, K5 : AttributedStringKey
//    public func transformingAttributes<K>(_ k: KeyPath<AttributeDynamicLookup, K>, _ c: (inout AttributedString.SingleAttributeTransformer<K>) -> Void) -> AttributedString where K : AttributedStringKey
//    public func transformingAttributes<K1, K2>(_ k: KeyPath<AttributeDynamicLookup, K1>, _ k2: KeyPath<AttributeDynamicLookup, K2>, _ c: (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>) -> Void) -> AttributedString where K1 : AttributedStringKey, K2 : AttributedStringKey
//    public func transformingAttributes<K1, K2, K3>(_ k: KeyPath<AttributeDynamicLookup, K1>, _ k2: KeyPath<AttributeDynamicLookup, K2>, _ k3: KeyPath<AttributeDynamicLookup, K3>, _ c: (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>, inout AttributedString.SingleAttributeTransformer<K3>) -> Void) -> AttributedString where K1 : AttributedStringKey, K2 : AttributedStringKey, K3 : AttributedStringKey
//    public func transformingAttributes<K1, K2, K3, K4>(_ k: KeyPath<AttributeDynamicLookup, K1>, _ k2: KeyPath<AttributeDynamicLookup, K2>, _ k3: KeyPath<AttributeDynamicLookup, K3>, _ k4: KeyPath<AttributeDynamicLookup, K4>, _ c: (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>, inout AttributedString.SingleAttributeTransformer<K3>, inout AttributedString.SingleAttributeTransformer<K4>) -> Void) -> AttributedString where K1 : AttributedStringKey, K2 : AttributedStringKey, K3 : AttributedStringKey, K4 : AttributedStringKey
//    public func transformingAttributes<K1, K2, K3, K4, K5>(_ k: KeyPath<AttributeDynamicLookup, K1>, _ k2: KeyPath<AttributeDynamicLookup, K2>, _ k3: KeyPath<AttributeDynamicLookup, K3>, _ k4: KeyPath<AttributeDynamicLookup, K4>, _ k5: KeyPath<AttributeDynamicLookup, K5>, _ c: (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>, inout AttributedString.SingleAttributeTransformer<K3>, inout AttributedString.SingleAttributeTransformer<K4>, inout AttributedString.SingleAttributeTransformer<K5>) -> Void) -> AttributedString where K1 : AttributedStringKey, K2 : AttributedStringKey, K3 : AttributedStringKey, K4 : AttributedStringKey, K5 : AttributedStringKey
//
//    public struct Index : Comparable, Sendable {}
//    public struct Runs : BidirectionalCollection, Equatable, CustomStringConvertible {}
//    public struct CharacterView : BidirectionalCollection, RangeReplaceableCollection {}
//    public struct UnicodeScalarView : RangeReplaceableCollection, BidirectionalCollection {}
//
//
//    public var runs: AttributedString.Runs { get }
//    public var characters: AttributedString.CharacterView
//    public var unicodeScalars: AttributedString.UnicodeScalarView
//
//    public static func == (lhs: AttributedString, rhs: AttributedString) -> Bool
//
//    public init()
//    public init(_ string: String, attributes: AttributeContainer = .init())
//    public init(_ substring: Substring, attributes: AttributeContainer = .init())
//    public init<S>(_ elements: S, attributes: AttributeContainer = .init()) where S : Sequence, S.Element == Character
//    public init(_ substring: AttributedSubstring)
//    public init<S, T>(_ other: T, including scope: KeyPath<AttributeScopes, S.Type>) where S : AttributeScope, T : AttributedStringProtocol
//    public init<S, T>(_ other: T, including scope: S.Type) where S : AttributeScope, T : AttributedStringProtocol
//
//    public static func + <T>(lhs: AttributedString, rhs: T) -> AttributedString where T : AttributedStringProtocol
//    public static func += <T>(lhs: inout AttributedString, rhs: T) where T : AttributedStringProtocol
//    public static func + (lhs: AttributedString, rhs: AttributedString) -> AttributedString
//    public static func += (lhs: inout AttributedString, rhs: AttributedString)
//
//    public subscript<R>(bounds: R) -> AttributedSubstring where R : RangeExpression, R.Bound == AttributedString.Index
//
//    public mutating func append<S>(_ s: S) where S : AttributedStringProtocol
//    public mutating func insert<S>(_ s: S, at index: AttributedString.Index) where S : AttributedStringProtocol
//    public mutating func removeSubrange<R>(_ range: R) where R : RangeExpression, R.Bound == AttributedString.Index
//    public mutating func replaceSubrange<R, S>(_ range: R, with s: S) where R : RangeExpression, S : AttributedStringProtocol, R.Bound == AttributedString.Index
//
//    public var startIndex: AttributedString.Index { get }
//    public var endIndex: AttributedString.Index { get }
//    public var hashValue: Int { get }
}

extension AttributedStringASDF {
    /// <!-- FishyJoes.exportReference(AttributedString.Index) -->
    public struct Index: Comparable, Sendable {
        public static func < (lhs: Index, rhs: Index) -> Bool { false }
        public static func == (a: Index, b: Index) -> Bool { false }
    }
}

extension AttributedStringASDF {
    /// <!-- FishyJoes.exportReference(AttributedString.AttributeMergePolicy) -->
    public enum AttributeMergePolicy: String, Hashable, Sendable {
        case keepNew
        case keepCurrent
    }
}

extension AttributedStringASDF {
    /// <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView) -->
    public struct UnicodeScalarView: RangeReplaceableCollection, BidirectionalCollection {
        public init() {}

        /// <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView.Element) -->
        public typealias Element = UnicodeScalar
        /// <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView.Index) -->
        public typealias Index = AttributedStringASDF.Index

        /// <!-- FishyJoes.export(startIndex) -->
        public var startIndex: Index { return .init() }
        /// <!-- FishyJoes.export(endIndex) -->
        public var endIndex: Index { return .init() }
        /// <!-- FishyJoes.export(indexBefore) -->
        public func index(before i: Index) -> Index { return .init() }
        /// <!-- FishyJoes.export(indexAfter) -->
        public func index(after i: Index) -> Index { return .init() }
        /// <!-- FishyJoes.export(indexOffsetByDistance) -->
        public func index(_ i: Index, offsetBy distance: Int) -> Index { return .init() }

        public subscript(index: Index) -> Element { return "A" }
        /// <!-- FishyJoes.export(elementAt) -->
        public func element(at index: Index) -> Element { self[index] }

        /// <!-- FishyJoes.export(replaceSubrange, generic: [C: [Element]]) -->
        public mutating func replaceSubrange<C>(_ subrange: Range<Index>, with newElements: C) where C: Collection, C.Element == Element {}
    }
}

extension AttributedStringASDF {
    /// <!-- FishyJoes.export(AttributedString.CharacterView) -->
    public struct CharacterView: BidirectionalCollection, RangeReplaceableCollection {
        public init() {}

        /// <!-- FishyJoes.exportReference(AttributedString.CharacterView.Element) -->
        public typealias Element = Character

        /// <!-- FishyJoes.exportReference(AttributedString.CharacterView.Index) -->
        public typealias Index = AttributedStringASDF.Index

        /// <!-- FishyJoes.export(startIndex) -->
        public var startIndex: Index { return .init() }
        /// <!-- FishyJoes.export(endIndex) -->
        public var endIndex: Index { return .init() }
        /// <!-- FishyJoes.export(indexBefore) -->
        public func index(before i: Index) -> Index { return .init() }
        /// <!-- FishyJoes.export(indexAfter) -->
        public func index(after i: Index) -> Index { return .init() }

        public subscript(index: Index) -> Character { "A" }
        /// <!-- FishyJoes.export(elementAt) -->
        public func element(at index: Index) -> Element { self[index] }

        /// <!-- FishyJoes.export(replaceSubrange, generic: [C: [Element]]) -->
        public mutating func replaceSubrange<C>(_ subrange: Range<Index>, with newElements: C) where C: Collection, C.Element == Element {}
    }
}

extension AttributedStringASDF {
    /// <!-- FishyJoes.export(AttributedString.Runs) -->
    public struct Runs: BidirectionalCollection, Equatable, CustomStringConvertible {
        public init() {}

        /// <!-- FishyJoes.export(AttributedString.Runs.Index) -->
        public struct Index: Comparable, Strideable, Sendable {
            public static func < (lhs: Self, rhs: Self) -> Bool { false }
            public func distance(to other: Self) -> Int { 0 }
            public func advanced(by n: Int) -> Self { .init() }
            public typealias Stride = Int
        }

        /// <!-- FishyJoes.export(AttributedString.Runs.Run) -->
        public struct Run: Equatable, CustomStringConvertible {
            /// <!-- FishyJoes.export(range) -->
            public var range: Range<AttributedStringASDF.Index> { AttributedStringASDF.Index()..<AttributedStringASDF.Index() }
            /// <!-- FishyJoes.export(attributes) -->
            public var attributes: AttributeContainerASDF { .init() }

//            public subscript<K>(_: K.Type) -> K.Value? where K : AttributedStringKey { get }

            public static func == (lhs: Self, rhs: Self) -> Bool { false }
            public var description: String { "fake" }
        }

        /// <!-- FishyJoes.exportReference(AttributedString.Runs.Element) -->
        public typealias Element = Run

        /// <!-- FishyJoes.export(startIndex) -->
        public var startIndex: Index { return .init() }
        /// <!-- FishyJoes.export(endIndex) -->
        public var endIndex: Index { return .init() }
        /// <!-- FishyJoes.export(indexBefore) -->
        public func index(before i: Index) -> Index { return .init() }
        /// <!-- FishyJoes.export(indexAfter) -->
        public func index(after i: Index) -> Index { return .init() }

        public subscript(position: Index) -> Run { .init() }
        /// <!-- FishyJoes.export(elementAt) -->
        public func element(at index: Index) -> Element { self[index] }

        public subscript(position: AttributedStringASDF.Index) -> Run { .init() }
        /// <!-- FishyJoes.export(elementAtPosition) -->
        public func element(at index: AttributedStringASDF.Index) -> Element { self[index] }

        public static func == (lhs: Self, rhs: Self) -> Bool { false }
        public var description: String { "fake" }
    }
}
