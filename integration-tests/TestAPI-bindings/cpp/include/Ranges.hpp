#pragma once
#include "TestAPI_pre.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.export(Ranges) -->
    class Ranges {
        /* Special */
        
        private:
        using VariantType = std::variant<>;
        
        public:
        template <typename T>
        Ranges(const T& caseObj): _variant(caseObj) {}
        
        template <typename T>
        Ranges& operator=(const T& rhs) {
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
        /// Create new Ranges (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        Ranges(const std::variant<> &_variant);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(echoInt8Range) -->
        static std::ranges::range<int8_t> echoInt8Range(const std::ranges::range<int8_t> &range);
        
        /// <!-- FishyJoes.export(echoInt16Range) -->
        static std::ranges::range<int16_t> echoInt16Range(const std::ranges::range<int16_t> &range);
        
        /// <!-- FishyJoes.export(echoInt32Range) -->
        static std::ranges::range<int32_t> echoInt32Range(const std::ranges::range<int32_t> &range);
        
        /// <!-- FishyJoes.export(echoInt64Range) -->
        static std::ranges::range<int64_t> echoInt64Range(const std::ranges::range<int64_t> &range);
        
        /// <!-- FishyJoes.export(echoIntRange) -->
        static std::ranges::range<int> echoIntRange(const std::ranges::range<int> &range);
        
        /// <!-- FishyJoes.export(echoUInt8Range) -->
        static std::ranges::range<uint8_t> echoUInt8Range(const std::ranges::range<uint8_t> &range);
        
        /// <!-- FishyJoes.export(echoUInt16Range) -->
        static std::ranges::range<uint16_t> echoUInt16Range(const std::ranges::range<uint16_t> &range);
        
        /// <!-- FishyJoes.export(echoUInt32Range) -->
        static std::ranges::range<uint32_t> echoUInt32Range(const std::ranges::range<uint32_t> &range);
        
        /// <!-- FishyJoes.export(echoUInt64Range) -->
        static std::ranges::range<uint64_t> echoUInt64Range(const std::ranges::range<uint64_t> &range);
        
        /// <!-- FishyJoes.export(echoUIntRange) -->
        static std::ranges::range<uint64_t> echoUIntRange(const std::ranges::range<uint64_t> &range);
        
        /// <!-- FishyJoes.export(int8Range) -->
        static std::ranges::range<int8_t> getInt8Range();
        
        /// <!-- FishyJoes.export(int16Range) -->
        static std::ranges::range<int16_t> getInt16Range();
        
        /// <!-- FishyJoes.export(int32Range) -->
        static std::ranges::range<int32_t> getInt32Range();
        
        /// <!-- FishyJoes.export(int64Range) -->
        static std::ranges::range<int64_t> getInt64Range();
        
        /// <!-- FishyJoes.export(intRange) -->
        static std::ranges::range<int> getIntRange();
        
        /// <!-- FishyJoes.export(uInt8Range) -->
        static std::ranges::range<uint8_t> getUInt8Range();
        
        /// <!-- FishyJoes.export(uInt16Range) -->
        static std::ranges::range<uint16_t> getUInt16Range();
        
        /// <!-- FishyJoes.export(uInt32Range) -->
        static std::ranges::range<uint32_t> getUInt32Range();
        
        /// <!-- FishyJoes.export(uInt64Range) -->
        static std::ranges::range<uint64_t> getUInt64Range();
        
        /// <!-- FishyJoes.export(uIntRange) -->
        static std::ranges::range<uint64_t> getUIntRange();
        
        
        /*  Data  */
        private:
        /// std::variant containing subtypes
        std::variant<> _variant;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
