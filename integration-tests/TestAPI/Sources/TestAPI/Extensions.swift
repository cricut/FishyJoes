#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

extension Swift.String {
    /// <!-- FishyJoes.export(String_PuttingTypesIntoQuestionablePlaces) -->
    public struct PuttingTypesIntoQuestionablePlaces {
        public let x: String
        public init(x: String) {
            self.x = x
        }

        /// <!-- FishyJoes.export(testCall) -->
        public func testCall() -> Int { 42 }
    }
}

#if canImport(FoundationEssentials)
typealias _AttributedString = FoundationEssentials.AttributedString
#else
typealias _AttributedString = Foundation.AttributedString
#endif

extension _AttributedString {
    /// <!-- FishyJoes.export(AttributedString_PuttingTypesIntoQuestionablePlaces) -->
    public struct PuttingTypesIntoQuestionablePlaces {
        public let x: String
        public init(x: String) {
            self.x = x
        }

        /// <!-- FishyJoes.export(testCall) -->
        public func testCall() -> Int { 42 }
    }
}

extension Structs {
    /// <!-- FishyJoes.exportReference(Structs_PuttingTypesIntoQuestionablePlaces) -->
    public struct PuttingTypesIntoQuestionablePlaces {
        /// <!-- FishyJoes.export(create) -->
        public init() {}

        /// <!-- FishyJoes.export(testCall) -->
        public func testCall() -> Int { 43 }
    }
}

extension UnicodeScalar {
    /// <!-- FishyJoes.export(UnicodeScalar_PuttingTypesIntoQuestionablePlaces) -->
    public enum PuttingTypesIntoQuestionablePlaces {
        case thing

        /// <!-- FishyJoes.export(testCall) -->
        public func testCall() -> Int { 44 }
    }
}
