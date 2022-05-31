#pragma once
#include "TestAPI_pre.hpp"
#include "AssociatedDataEnum.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.export(AssociatedDataEnum) -->
    class AssociatedDataEnum {
        /*  Inner Classes  */
        public:
        class thing;
        class other;
        class bar;
        class thing {
            /*  Complete Constructor  */
            public:
            /// Create new thing
            thing(const int &value);
            
            /*  Methods  */
            
            /*  Data  */
            public:
            int value;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        class other {
            /*  Complete Constructor  */
            public:
            /// Create new other
            other(const std::string &unnamed, const int &_1);
            
            /*  Methods  */
            
            /*  Data  */
            public:
            std::string unnamed;
            int _1;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        class bar {
            /*  Complete Constructor  */
            public:
            /// Create new bar
            bar(const std::string &named, const AssociatedDataEnum &_1);
            
            /*  Methods  */
            
            /*  Data  */
            public:
            std::string named;
            AssociatedDataEnum _1;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        
        /* Special */
        
        private:
        using VariantType = std::variant<thing, other, bar>;
        
        public:
        template <typename T>
        AssociatedDataEnum(const T& caseObj): _variant(caseObj) {}
        
        template <typename T>
        AssociatedDataEnum& operator=(const T& rhs) {
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
        /// Create new AssociatedDataEnum (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        AssociatedDataEnum(const std::variant<thing,other,bar> &_variant);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(plus) -->
        AssociatedDataEnum plus(const AssociatedDataEnum &other) const;
        
        /// <!-- FishyJoes.export(intValue) -->
        int getIntValue() const;
        
        
        /*  Data  */
        private:
        /// std::variant containing subtypes
        std::variant<thing,other,bar> _variant;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
