#pragma once
#include "TestAPI_pre.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.export(Bytes) -->
    class Bytes {
        /* Special */
        
        private:
        using VariantType = std::variant<>;
        
        public:
        template <typename T>
        Bytes(const T& caseObj): _variant(caseObj) {}
        
        template <typename T>
        Bytes& operator=(const T& rhs) {
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
        /// Create new Bytes (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        Bytes(const std::variant<> &_variant);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(echoBytes) -->
        static std::vector<uint8_t> echoBytes(const std::vector<uint8_t> &bytes);
        
        /// <!-- FishyJoes.export(echoData) -->
        static std::vector<uint8_t> echoData(const std::vector<uint8_t> &data);
        
        /// <!-- FishyJoes.export(bytes, cSharp: TheBytes) -->
        static std::vector<uint8_t> getBytes();
        
        /// <!-- FishyJoes.export(data) -->
        static std::vector<uint8_t> getData();
        
        
        /*  Data  */
        private:
        /// std::variant containing subtypes
        std::variant<> _variant;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
