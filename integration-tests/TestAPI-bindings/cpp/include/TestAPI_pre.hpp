#pragma once
#include <cstdint>
#include <vector>
#include <unordered_map>
#include <unordered_set>
#include <variant>
#include <functional>
#include <optional>
#include <string>
#include <tuple>
#include <memory>

namespace TestAPI {
    namespace FishyJoesInternal {
        struct Packer;
        
        template <typename T>
        inline void hashCombine(std::size_t &seed, const T &v) {
            seed ^= std::hash<T>()(v) + 0x9e3779b9 + (seed << 6) + (seed >> 2);
        }
        extern "C" {
            void TestAPI_swift_release(void* swift_obj);
            void TestAPI_swift_release_packed_data(void* swift_buf);
            bool TestAPI_swift_check_equality(void* swift_obj_1, void* swift_obj_2);
            uint64_t TestAPI_swift_hash(void* swift_obj);
        }
        struct SwiftReference {
            std::shared_ptr<void> ref;
        };
        SwiftReference swiftRefFromPtr(uint64_t ptr) {
            return {.ref = {(void*)ptr, TestAPI_swift_release}};
        }
        namespace CBindings {
            extern "C" {
                void* FJInternalBinding_TestAPI_AssociatedDataEnum_plus(void*, void*);
                void* FJInternalBinding_TestAPI_AssociatedDataEnum_getStaticThing();
                void* FJInternalBinding_TestAPI_AssociatedDataEnum_getIntValue(void*);
                void* FJInternalBinding_TestAPI_Bytes_echoBytes(void*);
                void* FJInternalBinding_TestAPI_Bytes_echoData(void*);
                void* FJInternalBinding_TestAPI_Bytes_getBytes();
                void* FJInternalBinding_TestAPI_Bytes_getData();
                void* FJInternalBinding_TestAPI_Collections_echoArrayOfInt(void*);
                void* FJInternalBinding_TestAPI_Collections_echoSetOfInt(void*);
                void* FJInternalBinding_TestAPI_Collections_echoDictionaryOfIntToInt(void*);
                void* FJInternalBinding_TestAPI_Collections_echoMaybeArrayOfMaybeInt(void*);
                void* FJInternalBinding_TestAPI_Collections_echoMaybeSetOfMaybeInt(void*);
                void* FJInternalBinding_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt(void*);
                void* FJInternalBinding_TestAPI_Collections_collectionMapper(void*, void*);
                void* FJInternalBinding_TestAPI_Collections_getArrayOfInt();
                void* FJInternalBinding_TestAPI_Collections_getSetOfInt();
                void* FJInternalBinding_TestAPI_Collections_getDictionaryOfIntToInt();
                void* FJInternalBinding_TestAPI_Collections_getArrayOfBigTuples();
                void* FJInternalBinding_TestAPI_Collections_getMaybeArrayOfInt();
                void* FJInternalBinding_TestAPI_Collections_getMaybeSetOfInt();
                void* FJInternalBinding_TestAPI_Collections_getMaybeDictionaryOfIntToInt();
                void* FJInternalBinding_TestAPI_Collections_getMaybeArrayOfMaybeInt();
                void* FJInternalBinding_TestAPI_Collections_getMaybeSetOfMaybeInt();
                void* FJInternalBinding_TestAPI_Collections_getMaybeDictionaryOfIntToMaybeInt();
                void* FJInternalBinding_TestAPI_Collections_getDefaultCollectionHolder();
                void* FJInternalBinding_TestAPI_Collections_CollectionHolder_getStaticPropery();
                void* FJInternalBinding_TestAPI_Collections_CollectionHolder_getStaticMutablePropery();
                void* FJInternalBinding_TestAPI_Collections_CollectionHolder_setStaticMutablePropery(void*);
                void* FJInternalBinding_TestAPI_DefaultArguments_echoDefaults(void*, void*, void*);
                void* FJInternalBinding_TestAPI_Deprecations_deprecatedMethod();
                void* FJInternalBinding_TestAPI_Deprecations_getDeprecatedVariable();
                void* FJInternalBinding_TestAPI_EmptyEnum_notGoingToHappen();
                void* FJInternalBinding_TestAPI_Functions_exercise0(void*);
                void* FJInternalBinding_TestAPI_Functions_exercise1(void*);
                void* FJInternalBinding_TestAPI_Functions_exercise2(void*);
                void* FJInternalBinding_TestAPI_Functions_exercise3(void*);
                void* FJInternalBinding_TestAPI_Functions_exercise4(void*);
                void* FJInternalBinding_TestAPI_Functions_exercise5(void*);
                void* FJInternalBinding_TestAPI_Functions_exercise6(void*);
                void* FJInternalBinding_TestAPI_Functions_willThrow();
                void* FJInternalBinding_TestAPI_Functions_async42Func();
                void* FJInternalBinding_TestAPI_Functions_getConst42();
                void* FJInternalBinding_TestAPI_Functions_getIabs();
                void* FJInternalBinding_TestAPI_Functions_getIntCompose();
                void* FJInternalBinding_TestAPI_Functions_getAdd3Things();
                void* FJInternalBinding_TestAPI_Functions_getMakeList();
                void* FJInternalBinding_TestAPI_Functions_getFifthThing();
                void* FJInternalBinding_TestAPI_Functions_getSix();
                void* FJInternalBinding_TestAPI_Primitives_echoBool(void*);
                void* FJInternalBinding_TestAPI_Primitives_echoUInt8(void*);
                void* FJInternalBinding_TestAPI_Primitives_echoUInt16(void*);
                void* FJInternalBinding_TestAPI_Primitives_echoUInt32(void*);
                void* FJInternalBinding_TestAPI_Primitives_echoUInt64(void*);
                void* FJInternalBinding_TestAPI_Primitives_echoInt8(void*);
                void* FJInternalBinding_TestAPI_Primitives_echoInt16(void*);
                void* FJInternalBinding_TestAPI_Primitives_echoInt32(void*);
                void* FJInternalBinding_TestAPI_Primitives_echoInt64(void*);
                void* FJInternalBinding_TestAPI_Primitives_echoFloat(void*);
                void* FJInternalBinding_TestAPI_Primitives_echoDouble(void*);
                void* FJInternalBinding_TestAPI_Primitives_maybeEchoBool(void*);
                void* FJInternalBinding_TestAPI_Primitives_maybeEchoUInt8(void*);
                void* FJInternalBinding_TestAPI_Primitives_maybeEchoUInt16(void*);
                void* FJInternalBinding_TestAPI_Primitives_maybeEchoUInt32(void*);
                void* FJInternalBinding_TestAPI_Primitives_maybeEchoUInt64(void*);
                void* FJInternalBinding_TestAPI_Primitives_maybeEchoInt8(void*);
                void* FJInternalBinding_TestAPI_Primitives_maybeEchoInt16(void*);
                void* FJInternalBinding_TestAPI_Primitives_maybeEchoInt32(void*);
                void* FJInternalBinding_TestAPI_Primitives_maybeEchoInt64(void*);
                void* FJInternalBinding_TestAPI_Primitives_maybeEchoFloat(void*);
                void* FJInternalBinding_TestAPI_Primitives_maybeEchoDouble(void*);
                void* FJInternalBinding_TestAPI_Primitives_valueMapper(void*, void*);
                void* FJInternalBinding_TestAPI_Primitives_getFalseBool();
                void* FJInternalBinding_TestAPI_Primitives_getTrueBool();
                void* FJInternalBinding_TestAPI_Primitives_getZeroUInt8();
                void* FJInternalBinding_TestAPI_Primitives_getMinUInt8();
                void* FJInternalBinding_TestAPI_Primitives_getMaxUInt8();
                void* FJInternalBinding_TestAPI_Primitives_getZeroUInt16();
                void* FJInternalBinding_TestAPI_Primitives_getMinUInt16();
                void* FJInternalBinding_TestAPI_Primitives_getMaxUInt16();
                void* FJInternalBinding_TestAPI_Primitives_getZeroUInt32();
                void* FJInternalBinding_TestAPI_Primitives_getMinUInt32();
                void* FJInternalBinding_TestAPI_Primitives_getMaxUInt32();
                void* FJInternalBinding_TestAPI_Primitives_getZeroUInt64();
                void* FJInternalBinding_TestAPI_Primitives_getMinUInt64();
                void* FJInternalBinding_TestAPI_Primitives_getMaxUInt64();
                void* FJInternalBinding_TestAPI_Primitives_getZeroInt8();
                void* FJInternalBinding_TestAPI_Primitives_getMinInt8();
                void* FJInternalBinding_TestAPI_Primitives_getMaxInt8();
                void* FJInternalBinding_TestAPI_Primitives_getZeroInt16();
                void* FJInternalBinding_TestAPI_Primitives_getMinInt16();
                void* FJInternalBinding_TestAPI_Primitives_getMaxInt16();
                void* FJInternalBinding_TestAPI_Primitives_getZeroInt32();
                void* FJInternalBinding_TestAPI_Primitives_getMinInt32();
                void* FJInternalBinding_TestAPI_Primitives_getMaxInt32();
                void* FJInternalBinding_TestAPI_Primitives_getZeroInt64();
                void* FJInternalBinding_TestAPI_Primitives_getMinInt64();
                void* FJInternalBinding_TestAPI_Primitives_getMaxInt64();
                void* FJInternalBinding_TestAPI_Primitives_getZeroInt();
                void* FJInternalBinding_TestAPI_Primitives_getMinInt();
                void* FJInternalBinding_TestAPI_Primitives_getMaxInt();
                void* FJInternalBinding_TestAPI_Primitives_getZeroFloat();
                void* FJInternalBinding_TestAPI_Primitives_getMinFloat();
                void* FJInternalBinding_TestAPI_Primitives_getMaxFloat();
                void* FJInternalBinding_TestAPI_Primitives_getZeroDouble();
                void* FJInternalBinding_TestAPI_Primitives_getMinDouble();
                void* FJInternalBinding_TestAPI_Primitives_getMaxDouble();
                void* FJInternalBinding_TestAPI_Primitives_getManyBool();
                void* FJInternalBinding_TestAPI_Primitives_getManyUInt8();
                void* FJInternalBinding_TestAPI_Primitives_getManyUInt16();
                void* FJInternalBinding_TestAPI_Primitives_getManyUInt32();
                void* FJInternalBinding_TestAPI_Primitives_getManyUInt64();
                void* FJInternalBinding_TestAPI_Primitives_getManyInt8();
                void* FJInternalBinding_TestAPI_Primitives_getManyInt16();
                void* FJInternalBinding_TestAPI_Primitives_getManyInt32();
                void* FJInternalBinding_TestAPI_Primitives_getManyInt64();
                void* FJInternalBinding_TestAPI_Primitives_getManyFloat();
                void* FJInternalBinding_TestAPI_Primitives_getManyDouble();
                void* FJInternalBinding_TestAPI_Primitives_getManyMaybeBool();
                void* FJInternalBinding_TestAPI_Primitives_getManyMaybeUInt8();
                void* FJInternalBinding_TestAPI_Primitives_getManyMaybeUInt16();
                void* FJInternalBinding_TestAPI_Primitives_getManyMaybeUInt32();
                void* FJInternalBinding_TestAPI_Primitives_getManyMaybeUInt64();
                void* FJInternalBinding_TestAPI_Primitives_getManyMaybeInt8();
                void* FJInternalBinding_TestAPI_Primitives_getManyMaybeInt16();
                void* FJInternalBinding_TestAPI_Primitives_getManyMaybeInt32();
                void* FJInternalBinding_TestAPI_Primitives_getManyMaybeInt64();
                void* FJInternalBinding_TestAPI_Primitives_getManyMaybeFloat();
                void* FJInternalBinding_TestAPI_Primitives_getManyMaybeDouble();
                void* FJInternalBinding_TestAPI_Primitives_getDefaultPrimitiveHolder();
                void* FJInternalBinding_TestAPI_Primitives_PrimitiveHolder_getStaticPropery();
                void* FJInternalBinding_TestAPI_Primitives_PrimitiveHolder_getStaticMutablePropery();
                void* FJInternalBinding_TestAPI_Primitives_PrimitiveHolder_setStaticMutablePropery(void*);
                void* FJInternalBinding_TestAPI_SimpleEnum_pickAColor(void*);
                void* FJInternalBinding_TestAPI_SimpleEnum_hexMethod(void*);
                void* FJInternalBinding_TestAPI_SimpleEnum_resetFavoriteColor();
                void* FJInternalBinding_TestAPI_SimpleEnum_getHex(void*);
                void* FJInternalBinding_TestAPI_SimpleEnum_getFavoriteColor();
                void* FJInternalBinding_TestAPI_SimpleEnum_setFavoriteColor(void*);
                void* FJInternalBinding_TestAPI_Strings_echo(void*);
                void* FJInternalBinding_TestAPI_Strings_getSimple();
                void* FJInternalBinding_TestAPI_Strings_getAccent();
                void* FJInternalBinding_TestAPI_Strings_getScript();
                void* FJInternalBinding_TestAPI_Strings_getChinese();
                void* FJInternalBinding_TestAPI_Strings_getChineseBMP();
                void* FJInternalBinding_TestAPI_Strings_getChineseSIP();
                void* FJInternalBinding_TestAPI_Strings_getEmoji();
                void* FJInternalBinding_TestAPI_Strings_getEmojiMulti();
                void* FJInternalBinding_TestAPI_Structs_MemberwiseStruct_create();
                void* FJInternalBinding_TestAPI_Structs_ReferenceStruct_create();
                void* FJInternalBinding_TestAPI_Structs_ReferenceStruct_getImmutable(void*);
                void* FJInternalBinding_TestAPI_Structs_ReferenceStruct_setImmutable(void*, void*);
                void* FJInternalBinding_TestAPI_Structs_ReferenceStruct_getMutable(void*);
                void* FJInternalBinding_TestAPI_Structs_ReferenceStruct_setMutable(void*, void*);
                void* FJInternalBinding_TestAPI_Tuples_checkTuples(void*, void*, void*, void*, void*);
                void* FJInternalBinding_TestAPI_Tuples_getTuple2();
                void* FJInternalBinding_TestAPI_Tuples_getTuple3();
                void* FJInternalBinding_TestAPI_Tuples_getTuple4();
                void* FJInternalBinding_TestAPI_Tuples_getTuple5();
                void* FJInternalBinding_TestAPI_Tuples_getTuple6();
            }
        }
    }
    
    class AssociatedDataEnum;
    class Bytes;
    class Collections;
    class DefaultArguments;
    class Deprecations;
    class EmptyEnum;
    class Functions;
    class Primitives;
    class SimpleEnum;
    class Strings;
    class Structs;
    class Tuples;
}
