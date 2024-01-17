//
//  Structs.swift
//  FishyJoes
//
//  Created by Matt Stoker on 12/22/21.
//

/// <!-- FishyJoes.export(Structs) -->
public enum Structs {
    /// <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
    public struct MemberwiseStruct: Hashable {
        public private(set) var immutable = "Eternal"
        public var mutable = "Fickle"

        // NOTE: Structs exposed by value must posess a member-wise initializer in order for the types to be instantiated in other language contexts
        public init(immutable: String, mutable: String) {
            self.immutable = immutable
            self.mutable = mutable
        }

        /// <!-- FishyJoes.export(create) -->
        public init() {}
        
        /// <!-- FishyJoes.export(asyncGetMutable) -->
        public func asyncGetMutable() async -> String {
//            fatalError("Swift: \(#line) \(#function)")
            await Task.yield()
            return mutable
        }
    }

    /// <!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->
    public struct ReferenceStruct: Hashable {
        /// <!-- FishyJoes.export(immutable) -->
        public private(set) var immutable = "Eternal"
        /// <!-- FishyJoes.export(mutable) -->
        public var mutable = "Fickle"

        /// <!-- FishyJoes.export(create) -->
        public init() {}
        
        /// <!-- FishyJoes.export(asyncGetMutable) -->
        public func asyncGetMutable() async -> String {
            await Task.yield()
            return mutable
        }
    }

    /// <!-- FishyJoes.export(Structs.MutableStruct) -->
    public struct MutableStruct: Hashable {
        public var i = 0

        /// <!-- FishyJoes.export(create) -->
        public init() {}

        public init(i: Int = 0) {
            self.i = i
        }

        /// <!-- FishyJoes.export(increment) -->
        public mutating func increment() {
            i += 1
        }

        /// <!-- FishyJoes.export(incrementAsync) -->
        public mutating func incrementAsync() async {
            i += 1
        }
        
        /// <!-- FishyJoes.export(asyncGetI) -->
        public func asyncGetI() async -> Int {
            await Task.yield()
            return i
        }
    }
}
