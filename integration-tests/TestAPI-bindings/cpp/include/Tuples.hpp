#pragma once
#include "TestAPI_pre.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.export(Tuples) -->
    class Tuples {
        /* Special */
        
        private:
        using VariantType = std::variant<>;
        
        public:
        template <typename T>
        Tuples(const T& caseObj): _variant(caseObj) {}
        
        template <typename T>
        Tuples& operator=(const T& rhs) {
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
        /// Create new Tuples (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        Tuples(const std::variant<> &_variant);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(checkTuples) -->
        static bool checkTuples(const std::tuple<int, std::string> &t2, const std::tuple<std::string, double, std::string> &t3, const std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool> &t4, const std::tuple<std::string, uint8_t, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, double, std::string>, std::tuple<int, std::string>> &t5, const std::tuple<std::string, int, double, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, uint8_t, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, double, std::string>, std::tuple<int, std::string>>, bool> &t6);
        
        /// <!-- FishyJoes.export(tuple2) -->
        static std::tuple<int, std::string> getTuple2();
        
        /// <!-- FishyJoes.export(tuple3) -->
        static std::tuple<std::string, double, std::string> getTuple3();
        
        /// <!-- FishyJoes.export(tuple4) -->
        static std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool> getTuple4();
        
        /// <!-- FishyJoes.export(tuple5) -->
        static std::tuple<std::string, uint8_t, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, double, std::string>, std::tuple<int, std::string>> getTuple5();
        
        /// <!-- FishyJoes.export(tuple6) -->
        static std::tuple<std::string, int, double, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, uint8_t, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, double, std::string>, std::tuple<int, std::string>>, bool> getTuple6();
        
        
        /*  Data  */
        private:
        /// std::variant containing subtypes
        std::variant<> _variant;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
