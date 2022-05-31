#pragma once
#include "TestAPI_pre.hpp"
#include "SimpleEnum.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.export(SimpleEnum) -->
    class SimpleEnum {
        /*  Inner Classes  */
        public:
        class blue;
        class green;
        class red;
        class blue {
            /*  Complete Constructor  */
            public:
            /// Create new blue
            blue();
            
            /*  Methods  */
            
            /*  Data  */
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        class green {
            /*  Complete Constructor  */
            public:
            /// Create new green
            green();
            
            /*  Methods  */
            
            /*  Data  */
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        class red {
            /*  Complete Constructor  */
            public:
            /// Create new red
            red();
            
            /*  Methods  */
            
            /*  Data  */
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        
        /* Special */
        
        private:
        using VariantType = std::variant<red, green, blue>;
        
        public:
        template <typename T>
        SimpleEnum(const T& caseObj): _variant(caseObj) {}
        
        template <typename T>
        SimpleEnum& operator=(const T& rhs) {
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
        /// Create new SimpleEnum (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        SimpleEnum(const std::variant<red,green,blue> &_variant);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(pickAColor) -->
        static std::optional<SimpleEnum> pickAColor(const int &rawValue);
        
        /// <!-- FishyJoes.export(hex) -->
        int getHex() const;
        
        
        /*  Data  */
        private:
        /// std::variant containing subtypes
        std::variant<red,green,blue> _variant;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
