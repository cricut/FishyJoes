#include "TestAPI.hpp"
#include <cstdlib>
#include <utility>

namespace TestAPI {
    struct FishyJoesInternal::Packer {
        std::vector<uint8_t> data;
        int idx;
        std::function<void()> on_destruct = [](){};
        //size must be power of 2
        inline void align(int size) {
            auto off = idx & (size - 1);
            if(off) idx += size - off;
        }
        inline void* ptr() {
            align(8);
            data.resize(idx);
            return data.data();
        }
        static inline Packer fromSwiftPtr(void* ptr) {
            uint32_t data_size = *(uint32_t*)ptr;
            uint8_t* u8ptr = ((uint8_t*)ptr) + 4;
            //copy data into a Packer
            Packer ret = { .data = { u8ptr, u8ptr + data_size }, .idx = 0 };
            TestAPI_swift_release_packed_data(ptr);
            return ret;
        }
        ~Packer() {
            on_destruct();
        }
        template <typename T>
        static inline Packer pack(const T& obj) {
            Packer packer;
            packer.put(obj);
            return packer;
        }
        template <typename T>
        static inline Packer packThenUnpackMutatedMembersOnDestruct(T& obj) {
            Packer packer;
            packer.put(obj);
            packer.on_destruct = [&](){ obj = packer.get_t<T>(); };
            return packer;
        }
        template <typename T>
        static inline T unpack(void* swiftPtr) {
            return fromSwiftPtr(swiftPtr).get_t<T>();
        }
        template <typename T>
        inline T get_t() {
            return get(std::in_place_type_t<T>{});
        }
        inline void put(const uint8_t& obj) {
            align(sizeof(obj));
            data.resize(data.size() + sizeof(obj));
            *(uint8_t*)(data.data() + idx) = obj;
            idx += sizeof(obj);
        }
        inline uint8_t get(std::in_place_type_t<uint8_t> typeGuide = std::in_place_type_t<uint8_t>{}) {
            align(sizeof(uint8_t));
            auto ret = *(uint8_t*)(data.data() + idx);
            idx += sizeof(uint8_t);
            return ret;
        }
        inline void put(const uint16_t& obj) {
            align(sizeof(obj));
            data.resize(data.size() + sizeof(obj));
            *(uint16_t*)(data.data() + idx) = obj;
            idx += sizeof(obj);
        }
        inline uint16_t get(std::in_place_type_t<uint16_t> typeGuide = std::in_place_type_t<uint16_t>{}) {
            align(sizeof(uint16_t));
            auto ret = *(uint16_t*)(data.data() + idx);
            idx += sizeof(uint16_t);
            return ret;
        }
        inline void put(const uint32_t& obj) {
            align(sizeof(obj));
            data.resize(data.size() + sizeof(obj));
            *(uint32_t*)(data.data() + idx) = obj;
            idx += sizeof(obj);
        }
        inline uint32_t get(std::in_place_type_t<uint32_t> typeGuide = std::in_place_type_t<uint32_t>{}) {
            align(sizeof(uint32_t));
            auto ret = *(uint32_t*)(data.data() + idx);
            idx += sizeof(uint32_t);
            return ret;
        }
        inline void put(const uint64_t& obj) {
            align(sizeof(obj));
            data.resize(data.size() + sizeof(obj));
            *(uint64_t*)(data.data() + idx) = obj;
            idx += sizeof(obj);
        }
        inline uint64_t get(std::in_place_type_t<uint64_t> typeGuide = std::in_place_type_t<uint64_t>{}) {
            align(sizeof(uint64_t));
            auto ret = *(uint64_t*)(data.data() + idx);
            idx += sizeof(uint64_t);
            return ret;
        }
        inline void put(const int8_t& obj) {
            align(sizeof(obj));
            data.resize(data.size() + sizeof(obj));
            *(int8_t*)(data.data() + idx) = obj;
            idx += sizeof(obj);
        }
        inline int8_t get(std::in_place_type_t<int8_t> typeGuide = std::in_place_type_t<int8_t>{}) {
            align(sizeof(int8_t));
            auto ret = *(int8_t*)(data.data() + idx);
            idx += sizeof(int8_t);
            return ret;
        }
        inline void put(const int16_t& obj) {
            align(sizeof(obj));
            data.resize(data.size() + sizeof(obj));
            *(int16_t*)(data.data() + idx) = obj;
            idx += sizeof(obj);
        }
        inline int16_t get(std::in_place_type_t<int16_t> typeGuide = std::in_place_type_t<int16_t>{}) {
            align(sizeof(int16_t));
            auto ret = *(int16_t*)(data.data() + idx);
            idx += sizeof(int16_t);
            return ret;
        }
        inline void put(const int32_t& obj) {
            align(sizeof(obj));
            data.resize(data.size() + sizeof(obj));
            *(int32_t*)(data.data() + idx) = obj;
            idx += sizeof(obj);
        }
        inline int32_t get(std::in_place_type_t<int32_t> typeGuide = std::in_place_type_t<int32_t>{}) {
            align(sizeof(int32_t));
            auto ret = *(int32_t*)(data.data() + idx);
            idx += sizeof(int32_t);
            return ret;
        }
        inline void put(const int64_t& obj) {
            align(sizeof(obj));
            data.resize(data.size() + sizeof(obj));
            *(int64_t*)(data.data() + idx) = obj;
            idx += sizeof(obj);
        }
        inline int64_t get(std::in_place_type_t<int64_t> typeGuide = std::in_place_type_t<int64_t>{}) {
            align(sizeof(int64_t));
            auto ret = *(int64_t*)(data.data() + idx);
            idx += sizeof(int64_t);
            return ret;
        }
        inline void put(const bool& obj) {
            align(sizeof(obj));
            data.resize(data.size() + sizeof(obj));
            *(bool*)(data.data() + idx) = obj;
            idx += sizeof(obj);
        }
        inline bool get(std::in_place_type_t<bool> typeGuide = std::in_place_type_t<bool>{}) {
            align(sizeof(bool));
            auto ret = *(bool*)(data.data() + idx);
            idx += sizeof(bool);
            return ret;
        }
        inline void put(const char& obj) {
            align(sizeof(obj));
            data.resize(data.size() + sizeof(obj));
            *(char*)(data.data() + idx) = obj;
            idx += sizeof(obj);
        }
        inline char get(std::in_place_type_t<char> typeGuide = std::in_place_type_t<char>{}) {
            align(sizeof(char));
            auto ret = *(char*)(data.data() + idx);
            idx += sizeof(char);
            return ret;
        }
        inline void put(const float& obj) {
            align(sizeof(obj));
            data.resize(data.size() + sizeof(obj));
            *(float*)(data.data() + idx) = obj;
            idx += sizeof(obj);
        }
        inline float get(std::in_place_type_t<float> typeGuide = std::in_place_type_t<float>{}) {
            align(sizeof(float));
            auto ret = *(float*)(data.data() + idx);
            idx += sizeof(float);
            return ret;
        }
        inline void put(const double& obj) {
            align(sizeof(obj));
            data.resize(data.size() + sizeof(obj));
            *(double*)(data.data() + idx) = obj;
            idx += sizeof(obj);
        }
        inline double get(std::in_place_type_t<double> typeGuide = std::in_place_type_t<double>{}) {
            align(sizeof(double));
            auto ret = *(double*)(data.data() + idx);
            idx += sizeof(double);
            return ret;
        }
        inline void put(const FishyJoesInternal::SwiftReference &ref) {
            put((uint64_t)ref.ref.get());
        }
        inline FishyJoesInternal::SwiftReference get(std::in_place_type_t<FishyJoesInternal::SwiftReference> typeGuide = std::in_place_type_t<FishyJoesInternal::SwiftReference>{}) {
            return {.ref = {(void*)get_t<uint64_t>(), FishyJoesInternal::TestAPI_swift_release}};
        }
        template <typename T>
        inline void put(const std::vector<T>& vec) {
            put((uint64_t)vec.size());
            for(const auto &ele: vec) {
                put(ele);
            }
        }
        template <typename T>
        inline std::vector<T> get(std::in_place_type_t<std::vector<T>> typeGuide = std::in_place_type_t<std::vector<T>>{}) {
            std::vector<T> out;
            auto length = get_t<uint64_t>();
            for(int i = 0; i < length; i++) {
                out.emplace_back(get_t<T>());
            }
            return out;
        }
        template <typename K, typename V>
        inline void put(const std::unordered_map<K, V>& map) {
            put((uint64_t)map.size());
            for(const auto &entry: map) {
                put(entry.first);
                put(entry.second);
            }
        }
        template <typename K, typename V>
        inline std::unordered_map<K, V> get(std::in_place_type_t<std::unordered_map<K, V>> typeGuide = std::in_place_type_t<std::unordered_map<K, V>>{}) {
            std::unordered_map<K, V> out;
            auto len = get_t<uint64_t>();
            for(int i = 0; i < len; i++) {
                out.insert({get_t<K>(), get_t<V>()});
            }
            return out;
        }
        template <typename... Types>
        inline void put(const std::variant<Types...>& variant) {
            put((int64_t)variant.index());
            std::visit([&](auto&& arg){ put(arg); }, variant);
        }
        template <typename Variant, int N>
        inline std::enable_if_t<N != 0, Variant> get_variant_helper(int n) {
            if(n >= N || n < 0) {
              throw std::runtime_error("invalid variant index when unpacking");
            } else if(n == N - 1) {
              return get_t<std::variant_alternative_t<N - 1, Variant>>();
            } else {
              return get_variant_helper<Variant, N - 1>(n);
            }
        }
        template <typename Variant, int N>
        inline std::enable_if_t<N == 0, Variant> get_variant_helper(int n) {
            throw std::runtime_error("invalid variant index when unpacking");
        }
        template <typename... Types>
        inline std::variant<Types...> get(std::in_place_type_t<std::variant<Types...>> typeGuide = std::in_place_type_t<std::variant<Types...>>{}) {
            int index = (int)get_t<int64_t>();
            return get_variant_helper<std::variant<Types...>, std::variant_size_v<std::variant<Types...>>>(index);
        }
        template <typename T>
        inline void put(const std::optional<T>& obj) {
            put(obj.has_value());
            if(obj.has_value()) put(*obj);
        }
        template <typename T>
        inline std::optional<T> get(std::in_place_type_t<std::optional<T>> typeGuide = std::in_place_type_t<std::optional<T>>{}) {
            if(!get_t<bool>()) return std::nullopt;
            return get_t<T>();
        }
        template <typename T>
        inline void put(const std::unordered_set<T>& obj) {
            put((uint64_t)obj.size());
            for(const auto &entry: obj) {
                put(entry);
            }
        }
        template <typename T>
        inline std::unordered_set<T> get(std::in_place_type_t<std::unordered_set<T>> typeGuide = std::in_place_type_t<std::unordered_set<T>>{}) {
            std::unordered_set<T> out;
            auto length = get_t<uint64_t>();
            for(int i = 0; i < length; i++) {
                out.insert(get_t<T>());
            }
            return out;
        }
        inline void put(const std::string& str) {
            put((uint64_t)str.size());
            for(const auto &ch: str) {
                put(ch);
            }
        }
        inline std::string get(std::in_place_type_t<std::string> typeGuide = std::in_place_type_t<std::string>{}) {
            std::string out((size_t)get_t<uint64_t>(), ' ');
            for(auto &ch: out) {
                ch = get_t<char>();
            }
            return out;
        }
        template <typename Tuple, int N>
        inline std::enable_if_t<N >= std::tuple_size_v<Tuple>> put_tuple_helper(const Tuple& tuple) {}
        template <typename Tuple, int N>
        inline std::enable_if_t<N < std::tuple_size_v<Tuple>> put_tuple_helper(const Tuple& tuple) {
            put(std::get<N>(tuple));
            put_tuple_helper<Tuple, N + 1>(tuple);
        }
        template <typename... Types>
        inline void put(const std::tuple<Types...>& tuple) {
            put_tuple_helper<std::tuple<Types...>, 0>(tuple);
        }
        template <typename... Types>
        inline std::tuple<Types...> get(std::in_place_type_t<std::tuple<Types...>> typeGuide = std::in_place_type_t<std::tuple<Types...>>{}) {
            return std::make_tuple(get_t<Types>()...);
        }
        inline void put(const TestAPI::AssociatedDataEnum& obj) {
            put(obj._variant);
        }
        inline TestAPI::AssociatedDataEnum get(std::in_place_type_t<TestAPI::AssociatedDataEnum> obj = std::in_place_type_t<TestAPI::AssociatedDataEnum>{}) {
            return TestAPI::AssociatedDataEnum {
                get_t<decltype(TestAPI::AssociatedDataEnum::_variant)>()
            };
        }
        inline void put(const TestAPI::AssociatedDataEnum::bar& obj) {
            put(obj.named);
            put(obj._1);
        }
        inline TestAPI::AssociatedDataEnum::bar get(std::in_place_type_t<TestAPI::AssociatedDataEnum::bar> obj = std::in_place_type_t<TestAPI::AssociatedDataEnum::bar>{}) {
            return TestAPI::AssociatedDataEnum::bar {
                get_t<decltype(TestAPI::AssociatedDataEnum::bar::named)>(), get_t<decltype(TestAPI::AssociatedDataEnum::bar::_1)>()
            };
        }
        inline void put(const TestAPI::AssociatedDataEnum::noValue& obj) {
        }
        inline TestAPI::AssociatedDataEnum::noValue get(std::in_place_type_t<TestAPI::AssociatedDataEnum::noValue> obj = std::in_place_type_t<TestAPI::AssociatedDataEnum::noValue>{}) {
            return TestAPI::AssociatedDataEnum::noValue {
                
            };
        }
        inline void put(const TestAPI::AssociatedDataEnum::other& obj) {
            put(obj.unnamed);
            put(obj._1);
        }
        inline TestAPI::AssociatedDataEnum::other get(std::in_place_type_t<TestAPI::AssociatedDataEnum::other> obj = std::in_place_type_t<TestAPI::AssociatedDataEnum::other>{}) {
            return TestAPI::AssociatedDataEnum::other {
                get_t<decltype(TestAPI::AssociatedDataEnum::other::unnamed)>(), get_t<decltype(TestAPI::AssociatedDataEnum::other::_1)>()
            };
        }
        inline void put(const TestAPI::AssociatedDataEnum::simpleEnum& obj) {
            put(obj.value);
        }
        inline TestAPI::AssociatedDataEnum::simpleEnum get(std::in_place_type_t<TestAPI::AssociatedDataEnum::simpleEnum> obj = std::in_place_type_t<TestAPI::AssociatedDataEnum::simpleEnum>{}) {
            return TestAPI::AssociatedDataEnum::simpleEnum {
                get_t<decltype(TestAPI::AssociatedDataEnum::simpleEnum::value)>()
            };
        }
        inline void put(const TestAPI::AssociatedDataEnum::thing& obj) {
            put(obj.value);
        }
        inline TestAPI::AssociatedDataEnum::thing get(std::in_place_type_t<TestAPI::AssociatedDataEnum::thing> obj = std::in_place_type_t<TestAPI::AssociatedDataEnum::thing>{}) {
            return TestAPI::AssociatedDataEnum::thing {
                get_t<decltype(TestAPI::AssociatedDataEnum::thing::value)>()
            };
        }
        inline void put(const TestAPI::Bytes& obj) {
            put(obj._variant);
        }
        inline TestAPI::Bytes get(std::in_place_type_t<TestAPI::Bytes> obj = std::in_place_type_t<TestAPI::Bytes>{}) {
            return TestAPI::Bytes {
                get_t<decltype(TestAPI::Bytes::_variant)>()
            };
        }
        inline void put(const TestAPI::ClosedRanges& obj) {
            put(obj._variant);
        }
        inline TestAPI::ClosedRanges get(std::in_place_type_t<TestAPI::ClosedRanges> obj = std::in_place_type_t<TestAPI::ClosedRanges>{}) {
            return TestAPI::ClosedRanges {
                get_t<decltype(TestAPI::ClosedRanges::_variant)>()
            };
        }
        inline void put(const TestAPI::Collections& obj) {
            put(obj._variant);
        }
        inline TestAPI::Collections get(std::in_place_type_t<TestAPI::Collections> obj = std::in_place_type_t<TestAPI::Collections>{}) {
            return TestAPI::Collections {
                get_t<decltype(TestAPI::Collections::_variant)>()
            };
        }
        inline void put(const TestAPI::Collections::CollectionHolder& obj) {
            put(obj.boolArray);
            put(obj.boolSet);
            put(obj.boolDictionary);
            put(obj.integerArray);
            put(obj.integerSet);
            put(obj.integerDictionary);
            put(obj.stringArray);
            put(obj.stringSet);
            put(obj.stringDictionary);
        }
        inline TestAPI::Collections::CollectionHolder get(std::in_place_type_t<TestAPI::Collections::CollectionHolder> obj = std::in_place_type_t<TestAPI::Collections::CollectionHolder>{}) {
            return TestAPI::Collections::CollectionHolder {
                get_t<decltype(TestAPI::Collections::CollectionHolder::boolArray)>(), get_t<decltype(TestAPI::Collections::CollectionHolder::boolSet)>(), get_t<decltype(TestAPI::Collections::CollectionHolder::boolDictionary)>(), get_t<decltype(TestAPI::Collections::CollectionHolder::integerArray)>(), get_t<decltype(TestAPI::Collections::CollectionHolder::integerSet)>(), get_t<decltype(TestAPI::Collections::CollectionHolder::integerDictionary)>(), get_t<decltype(TestAPI::Collections::CollectionHolder::stringArray)>(), get_t<decltype(TestAPI::Collections::CollectionHolder::stringSet)>(), get_t<decltype(TestAPI::Collections::CollectionHolder::stringDictionary)>()
            };
        }
        inline void put(const TestAPI::DefaultArguments& obj) {
            put(obj._variant);
        }
        inline TestAPI::DefaultArguments get(std::in_place_type_t<TestAPI::DefaultArguments> obj = std::in_place_type_t<TestAPI::DefaultArguments>{}) {
            return TestAPI::DefaultArguments {
                get_t<decltype(TestAPI::DefaultArguments::_variant)>()
            };
        }
        inline void put(const TestAPI::Deprecations& obj) {
            put(obj._variant);
        }
        inline TestAPI::Deprecations get(std::in_place_type_t<TestAPI::Deprecations> obj = std::in_place_type_t<TestAPI::Deprecations>{}) {
            return TestAPI::Deprecations {
                get_t<decltype(TestAPI::Deprecations::_variant)>()
            };
        }
        inline void put(const TestAPI::EmptyEnum& obj) {
            put(obj._variant);
        }
        inline TestAPI::EmptyEnum get(std::in_place_type_t<TestAPI::EmptyEnum> obj = std::in_place_type_t<TestAPI::EmptyEnum>{}) {
            return TestAPI::EmptyEnum {
                get_t<decltype(TestAPI::EmptyEnum::_variant)>()
            };
        }
        inline void put(const TestAPI::Functions& obj) {
            put(obj._variant);
        }
        inline TestAPI::Functions get(std::in_place_type_t<TestAPI::Functions> obj = std::in_place_type_t<TestAPI::Functions>{}) {
            return TestAPI::Functions {
                get_t<decltype(TestAPI::Functions::_variant)>()
            };
        }
        inline void put(const TestAPI::Functions::TheError& obj) {
            put(obj._ref);
        }
        inline TestAPI::Functions::TheError get(std::in_place_type_t<TestAPI::Functions::TheError> obj = std::in_place_type_t<TestAPI::Functions::TheError>{}) {
            return TestAPI::Functions::TheError {
                get_t<decltype(TestAPI::Functions::TheError::_ref)>()
            };
        }
        inline void put(const TestAPI::Primitives& obj) {
            put(obj._variant);
        }
        inline TestAPI::Primitives get(std::in_place_type_t<TestAPI::Primitives> obj = std::in_place_type_t<TestAPI::Primitives>{}) {
            return TestAPI::Primitives {
                get_t<decltype(TestAPI::Primitives::_variant)>()
            };
        }
        inline void put(const TestAPI::Primitives::PrimitiveHolder& obj) {
            put(obj.b);
            put(obj.bq);
            put(obj.ui8);
            put(obj.ui8q);
            put(obj.ui16);
            put(obj.ui16q);
            put(obj.ui32);
            put(obj.ui32q);
            put(obj.ui64);
            put(obj.ui64q);
            put(obj.i8);
            put(obj.i8q);
            put(obj.i16);
            put(obj.i16q);
            put(obj.i32);
            put(obj.i32q);
            put(obj.i64);
            put(obj.i64q);
            put(obj.f);
            put(obj.fq);
            put(obj.d);
            put(obj.dq);
        }
        inline TestAPI::Primitives::PrimitiveHolder get(std::in_place_type_t<TestAPI::Primitives::PrimitiveHolder> obj = std::in_place_type_t<TestAPI::Primitives::PrimitiveHolder>{}) {
            return TestAPI::Primitives::PrimitiveHolder {
                get_t<decltype(TestAPI::Primitives::PrimitiveHolder::b)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::bq)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::ui8)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::ui8q)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::ui16)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::ui16q)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::ui32)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::ui32q)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::ui64)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::ui64q)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::i8)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::i8q)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::i16)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::i16q)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::i32)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::i32q)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::i64)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::i64q)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::f)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::fq)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::d)>(), get_t<decltype(TestAPI::Primitives::PrimitiveHolder::dq)>()
            };
        }
        inline void put(const TestAPI::SimpleEnum& obj) {
            put(obj._variant);
        }
        inline TestAPI::SimpleEnum get(std::in_place_type_t<TestAPI::SimpleEnum> obj = std::in_place_type_t<TestAPI::SimpleEnum>{}) {
            return TestAPI::SimpleEnum {
                get_t<decltype(TestAPI::SimpleEnum::_variant)>()
            };
        }
        inline void put(const TestAPI::SimpleEnum::blue& obj) {
        }
        inline TestAPI::SimpleEnum::blue get(std::in_place_type_t<TestAPI::SimpleEnum::blue> obj = std::in_place_type_t<TestAPI::SimpleEnum::blue>{}) {
            return TestAPI::SimpleEnum::blue {
                
            };
        }
        inline void put(const TestAPI::SimpleEnum::green& obj) {
        }
        inline TestAPI::SimpleEnum::green get(std::in_place_type_t<TestAPI::SimpleEnum::green> obj = std::in_place_type_t<TestAPI::SimpleEnum::green>{}) {
            return TestAPI::SimpleEnum::green {
                
            };
        }
        inline void put(const TestAPI::SimpleEnum::red& obj) {
        }
        inline TestAPI::SimpleEnum::red get(std::in_place_type_t<TestAPI::SimpleEnum::red> obj = std::in_place_type_t<TestAPI::SimpleEnum::red>{}) {
            return TestAPI::SimpleEnum::red {
                
            };
        }
        inline void put(const TestAPI::Strings& obj) {
            put(obj._variant);
        }
        inline TestAPI::Strings get(std::in_place_type_t<TestAPI::Strings> obj = std::in_place_type_t<TestAPI::Strings>{}) {
            return TestAPI::Strings {
                get_t<decltype(TestAPI::Strings::_variant)>()
            };
        }
        inline void put(const TestAPI::Structs& obj) {
            put(obj._variant);
        }
        inline TestAPI::Structs get(std::in_place_type_t<TestAPI::Structs> obj = std::in_place_type_t<TestAPI::Structs>{}) {
            return TestAPI::Structs {
                get_t<decltype(TestAPI::Structs::_variant)>()
            };
        }
        inline void put(const TestAPI::Structs::MemberwiseStruct& obj) {
            put(obj.immutable);
            put(obj.mutable);
        }
        inline TestAPI::Structs::MemberwiseStruct get(std::in_place_type_t<TestAPI::Structs::MemberwiseStruct> obj = std::in_place_type_t<TestAPI::Structs::MemberwiseStruct>{}) {
            return TestAPI::Structs::MemberwiseStruct {
                get_t<decltype(TestAPI::Structs::MemberwiseStruct::immutable)>(), get_t<decltype(TestAPI::Structs::MemberwiseStruct::mutable)>()
            };
        }
        inline void put(const TestAPI::Structs::ReferenceStruct& obj) {
            put(obj._ref);
        }
        inline TestAPI::Structs::ReferenceStruct get(std::in_place_type_t<TestAPI::Structs::ReferenceStruct> obj = std::in_place_type_t<TestAPI::Structs::ReferenceStruct>{}) {
            return TestAPI::Structs::ReferenceStruct {
                get_t<decltype(TestAPI::Structs::ReferenceStruct::_ref)>()
            };
        }
        inline void put(const TestAPI::Tuples& obj) {
            put(obj._variant);
        }
        inline TestAPI::Tuples get(std::in_place_type_t<TestAPI::Tuples> obj = std::in_place_type_t<TestAPI::Tuples>{}) {
            return TestAPI::Tuples {
                get_t<decltype(TestAPI::Tuples::_variant)>()
            };
        }
    };
}
