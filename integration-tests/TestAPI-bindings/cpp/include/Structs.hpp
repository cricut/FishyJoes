#pragma once
#include "TestAPI_pre.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.export(Structs) -->
    class Structs {
        /*  Inner Classes  */
        public:
        class MemberwiseStruct;
        class MutableStruct;
        class ReferenceStruct;
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
        /// <!-- FishyJoes.export(Structs.MutableStruct) -->
        class MutableStruct {
            /*  Complete Constructor  */
            public:
            /// Create new MutableStruct
            MutableStruct(const int &i);
            
            /*  Methods  */
            public:
            /// <!-- FishyJoes.export(create) -->
            static Structs::MutableStruct create();
            
            /// <!-- FishyJoes.export(increment) -->
            void increment();
            
            /// <!-- FishyJoes.export(incrementAsync) -->
            void incrementAsync();
            
            
            /*  Data  */
            public:
            int i;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
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
        
        /* Special */
        
        private:
        using VariantType = std::variant<>;
        
        public:
        template <typename T>
        Structs(const T& caseObj): _variant(caseObj) {}
        
        template <typename T>
        Structs& operator=(const T& rhs) {
            _variant = rhs;
            return *this;
        }
        
        template <typename T>
        std::invoke_result_t<T, std::variant_alternative_t<0, VariantType>> visit(const T& visitor) {
            return std::visit(visitor, _variant);
        }
        
        template <typename T>
        bool isOfType() {
            std::holds_alternative<T>(_variant);
        }
        template <const auto& n>
        bool isOfType() {
            return isOfType<std::decay_t<decltype(n)>>();
        }
        
        template <typename T>
        T* getIfIs() {
            return std::get_if<T>(&_variant);
        }
        template <const auto& n>
        std::decay_t<decltype(n)>* getIfIs() {
            return getIfIs<std::decay_t<decltype(n)>>();
        }
        
        template <typename T>
        T& get() {
            return std::get<T>(_variant);
        }
        template <const auto& n>
        std::decay_t<decltype(n)>& get() {
            return get<std::decay_t<decltype(n)>>();
        }
        
        /*  Complete Constructor  */
        private:
        /// Create new Structs (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        Structs(const std::variant<> &_variant);
        
        /*  Methods  */
        
        /*  Data  */
        private:
        /// std::variant containing subtypes
        std::variant<> _variant;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
