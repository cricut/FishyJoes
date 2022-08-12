#pragma once
#include "TestAPI_pre.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.export(DefaultArguments) -->
    class DefaultArguments {
        /* Special */
        
        private:
        using VariantType = std::variant<>;
        
        public:
        template <typename T>
        DefaultArguments(const T& caseObj): _variant(caseObj) {}
        
        template <typename T>
        DefaultArguments& operator=(const T& rhs) {
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
        /// Create new DefaultArguments (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        DefaultArguments(const std::variant<> &_variant);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(echoDefaults) -->
        static std::string echoDefaults(const std::optional<int> &y = nil, const std::optional<int> &x, const double &z = 3.14);
        
        
        /*  Data  */
        private:
        /// std::variant containing subtypes
        std::variant<> _variant;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
