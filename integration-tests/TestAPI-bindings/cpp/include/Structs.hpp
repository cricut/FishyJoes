#pragma once
#include "TestAPI_pre.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.exportReference(Structs) -->
    class Structs {
        /*  Inner Classes  */
        public:
        class ReferenceStruct;
        class MemberwiseStruct;
        /// <!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->
        class ReferenceStruct {
            /*  Complete Constructor  */
            private:
            /// Create new ReferenceStruct (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
            ReferenceStruct(const FishyJoesInternal::SwiftReference &_ref);
            
            /*  Methods  */
            public:
            /// <!-- FishyJoes.export(create) -->
            static Structs::ReferenceStruct create();
            
            /// <!-- FishyJoes.export(immutable) -->
            std::string getImmutable() const;
            
            /// <!-- FishyJoes.export(immutable) -->
            void setImmutable(const std::string &newVal);
            
            /// <!-- FishyJoes.export(mutable) -->
            std::string getMutable() const;
            
            /// <!-- FishyJoes.export(mutable) -->
            void setMutable(const std::string &newVal);
            
            
            /*  Data  */
            private:
            /// Reference to Swift-managed data
            FishyJoesInternal::SwiftReference _ref;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        /// <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
        class MemberwiseStruct {
            /*  Complete Constructor  */
            public:
            /// Create new MemberwiseStruct
            MemberwiseStruct(const std::string &immutable, const std::string &mutable);
            
            /*  Methods  */
            public:
            /// <!-- FishyJoes.export(create) -->
            static Structs::MemberwiseStruct create();
            
            
            /*  Data  */
            public:
            std::string immutable;
            std::string mutable;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        
        /*  Complete Constructor  */
        private:
        /// Create new Structs (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        Structs(const FishyJoesInternal::SwiftReference &_ref);
        
        /*  Methods  */
        
        /*  Data  */
        private:
        /// Reference to Swift-managed data
        FishyJoesInternal::SwiftReference _ref;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
