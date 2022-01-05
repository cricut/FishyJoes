//
//  Structs.swift
//  FishyJoes
//
//  Created by Matt Stoker on 12/22/21.
//

/// <!-- FishyJoes.exportReference(Structs) -->
public enum Structs {
    /// <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
    public struct MemberwiseStruct: Equatable {
        public private(set) var immutable = "Eternal"
        public private(set) var mutable = "Fickle"

        // NOTE: Structs exposed by value must posess a member-wise initializer in order for the types to be instantiated in other language contexts
        public init(immutable: String, mutable: String) {
            self.immutable = immutable
            self.mutable = mutable
        }
        
        /// <!-- FishyJoes.export(create) -->
        public init() {}
    }
    
    /// <!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->
    public struct ReferenceStruct: Equatable {
        /// <!-- FishyJoes.export(immutable) -->
        public private(set) var immutable = "Eternal"
        /// <!-- FishyJoes.export(mutable) -->
        public private(set) var mutable = "Fickle"

        /// <!-- FishyJoes.export(create) -->
        public init() {}
    }
}
