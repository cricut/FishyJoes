#include "shared_impl.hpp"
namespace TestAPI {
    Primitives::Primitives(const std::variant<> &_variant): _variant(_variant){}
    bool Primitives::echoBool(const bool &value) {
        return FishyJoesInternal::Packer::unpack<bool>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_echoBool(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    uint8_t Primitives::echoUInt8(const uint8_t &value) {
        return FishyJoesInternal::Packer::unpack<uint8_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_echoUInt8(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    uint16_t Primitives::echoUInt16(const uint16_t &value) {
        return FishyJoesInternal::Packer::unpack<uint16_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_echoUInt16(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    uint32_t Primitives::echoUInt32(const uint32_t &value) {
        return FishyJoesInternal::Packer::unpack<uint32_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_echoUInt32(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    uint64_t Primitives::echoUInt64(const uint64_t &value) {
        return FishyJoesInternal::Packer::unpack<uint64_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_echoUInt64(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    uint64_t Primitives::echoUInt(const uint64_t &value) {
        return FishyJoesInternal::Packer::unpack<uint64_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_echoUInt(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    int8_t Primitives::echoInt8(const int8_t &value) {
        return FishyJoesInternal::Packer::unpack<int8_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_echoInt8(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    int16_t Primitives::echoInt16(const int16_t &value) {
        return FishyJoesInternal::Packer::unpack<int16_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_echoInt16(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    int32_t Primitives::echoInt32(const int32_t &value) {
        return FishyJoesInternal::Packer::unpack<int32_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_echoInt32(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    int64_t Primitives::echoInt64(const int64_t &value) {
        return FishyJoesInternal::Packer::unpack<int64_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_echoInt64(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    int Primitives::echoInt(const int &value) {
        return FishyJoesInternal::Packer::unpack<int>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_echoInt(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    float Primitives::echoFloat(const float &value) {
        return FishyJoesInternal::Packer::unpack<float>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_echoFloat(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    double Primitives::echoDouble(const double &value) {
        return FishyJoesInternal::Packer::unpack<double>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_echoDouble(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<bool> Primitives::maybeEchoBool(const std::optional<bool> &value) {
        return FishyJoesInternal::Packer::unpack<std::optional<bool>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_maybeEchoBool(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<uint8_t> Primitives::maybeEchoUInt8(const std::optional<uint8_t> &value) {
        return FishyJoesInternal::Packer::unpack<std::optional<uint8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_maybeEchoUInt8(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<uint16_t> Primitives::maybeEchoUInt16(const std::optional<uint16_t> &value) {
        return FishyJoesInternal::Packer::unpack<std::optional<uint16_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_maybeEchoUInt16(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<uint32_t> Primitives::maybeEchoUInt32(const std::optional<uint32_t> &value) {
        return FishyJoesInternal::Packer::unpack<std::optional<uint32_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_maybeEchoUInt32(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<uint64_t> Primitives::maybeEchoUInt64(const std::optional<uint64_t> &value) {
        return FishyJoesInternal::Packer::unpack<std::optional<uint64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_maybeEchoUInt64(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<uint64_t> Primitives::maybeEchoUInt(const std::optional<uint64_t> &value) {
        return FishyJoesInternal::Packer::unpack<std::optional<uint64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_maybeEchoUInt(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<int8_t> Primitives::maybeEchoInt8(const std::optional<int8_t> &value) {
        return FishyJoesInternal::Packer::unpack<std::optional<int8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_maybeEchoInt8(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<int16_t> Primitives::maybeEchoInt16(const std::optional<int16_t> &value) {
        return FishyJoesInternal::Packer::unpack<std::optional<int16_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_maybeEchoInt16(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<int32_t> Primitives::maybeEchoInt32(const std::optional<int32_t> &value) {
        return FishyJoesInternal::Packer::unpack<std::optional<int32_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_maybeEchoInt32(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<int64_t> Primitives::maybeEchoInt64(const std::optional<int64_t> &value) {
        return FishyJoesInternal::Packer::unpack<std::optional<int64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_maybeEchoInt64(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<int> Primitives::maybeEchoInt(const std::optional<int> &value) {
        return FishyJoesInternal::Packer::unpack<std::optional<int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_maybeEchoInt(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<float> Primitives::maybeEchoFloat(const std::optional<float> &value) {
        return FishyJoesInternal::Packer::unpack<std::optional<float>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_maybeEchoFloat(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<double> Primitives::maybeEchoDouble(const std::optional<double> &value) {
        return FishyJoesInternal::Packer::unpack<std::optional<double>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_maybeEchoDouble(FishyJoesInternal::Packer::pack(value).ptr()));
    }
    std::optional<uint8_t> Primitives::valueMapper(const std::optional<uint8_t> &value, const std::function<std::optional<uint8_t>(std::optional<uint8_t>> &mapper) {
        return FishyJoesInternal::Packer::unpack<std::optional<uint8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_valueMapper(FishyJoesInternal::Packer::pack(value).ptr(), FishyJoesInternal::Packer::pack(mapper).ptr()));
    }
    bool Primitives::getFalseBool() {
        return FishyJoesInternal::Packer::unpack<bool>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getFalseBool());
    }
    bool Primitives::getTrueBool() {
        return FishyJoesInternal::Packer::unpack<bool>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getTrueBool());
    }
    uint8_t Primitives::getZeroUInt8() {
        return FishyJoesInternal::Packer::unpack<uint8_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getZeroUInt8());
    }
    uint8_t Primitives::getMinUInt8() {
        return FishyJoesInternal::Packer::unpack<uint8_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMinUInt8());
    }
    uint8_t Primitives::getMaxUInt8() {
        return FishyJoesInternal::Packer::unpack<uint8_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMaxUInt8());
    }
    uint16_t Primitives::getZeroUInt16() {
        return FishyJoesInternal::Packer::unpack<uint16_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getZeroUInt16());
    }
    uint16_t Primitives::getMinUInt16() {
        return FishyJoesInternal::Packer::unpack<uint16_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMinUInt16());
    }
    uint16_t Primitives::getMaxUInt16() {
        return FishyJoesInternal::Packer::unpack<uint16_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMaxUInt16());
    }
    uint32_t Primitives::getZeroUInt32() {
        return FishyJoesInternal::Packer::unpack<uint32_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getZeroUInt32());
    }
    uint32_t Primitives::getMinUInt32() {
        return FishyJoesInternal::Packer::unpack<uint32_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMinUInt32());
    }
    uint32_t Primitives::getMaxUInt32() {
        return FishyJoesInternal::Packer::unpack<uint32_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMaxUInt32());
    }
    uint64_t Primitives::getZeroUInt64() {
        return FishyJoesInternal::Packer::unpack<uint64_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getZeroUInt64());
    }
    uint64_t Primitives::getMinUInt64() {
        return FishyJoesInternal::Packer::unpack<uint64_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMinUInt64());
    }
    uint64_t Primitives::getMaxUInt64() {
        return FishyJoesInternal::Packer::unpack<uint64_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMaxUInt64());
    }
    uint64_t Primitives::getZeroUInt() {
        return FishyJoesInternal::Packer::unpack<uint64_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getZeroUInt());
    }
    uint64_t Primitives::getMinUInt() {
        return FishyJoesInternal::Packer::unpack<uint64_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMinUInt());
    }
    uint64_t Primitives::getMaxUInt() {
        return FishyJoesInternal::Packer::unpack<uint64_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMaxUInt());
    }
    int8_t Primitives::getZeroInt8() {
        return FishyJoesInternal::Packer::unpack<int8_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getZeroInt8());
    }
    int8_t Primitives::getMinInt8() {
        return FishyJoesInternal::Packer::unpack<int8_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMinInt8());
    }
    int8_t Primitives::getMaxInt8() {
        return FishyJoesInternal::Packer::unpack<int8_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMaxInt8());
    }
    int16_t Primitives::getZeroInt16() {
        return FishyJoesInternal::Packer::unpack<int16_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getZeroInt16());
    }
    int16_t Primitives::getMinInt16() {
        return FishyJoesInternal::Packer::unpack<int16_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMinInt16());
    }
    int16_t Primitives::getMaxInt16() {
        return FishyJoesInternal::Packer::unpack<int16_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMaxInt16());
    }
    int32_t Primitives::getZeroInt32() {
        return FishyJoesInternal::Packer::unpack<int32_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getZeroInt32());
    }
    int32_t Primitives::getMinInt32() {
        return FishyJoesInternal::Packer::unpack<int32_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMinInt32());
    }
    int32_t Primitives::getMaxInt32() {
        return FishyJoesInternal::Packer::unpack<int32_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMaxInt32());
    }
    int64_t Primitives::getZeroInt64() {
        return FishyJoesInternal::Packer::unpack<int64_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getZeroInt64());
    }
    int64_t Primitives::getMinInt64() {
        return FishyJoesInternal::Packer::unpack<int64_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMinInt64());
    }
    int64_t Primitives::getMaxInt64() {
        return FishyJoesInternal::Packer::unpack<int64_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMaxInt64());
    }
    int Primitives::getZeroInt() {
        return FishyJoesInternal::Packer::unpack<int>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getZeroInt());
    }
    int Primitives::getMinInt() {
        return FishyJoesInternal::Packer::unpack<int>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMinInt());
    }
    int Primitives::getMaxInt() {
        return FishyJoesInternal::Packer::unpack<int>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMaxInt());
    }
    float Primitives::getZeroFloat() {
        return FishyJoesInternal::Packer::unpack<float>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getZeroFloat());
    }
    float Primitives::getMinFloat() {
        return FishyJoesInternal::Packer::unpack<float>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMinFloat());
    }
    float Primitives::getMaxFloat() {
        return FishyJoesInternal::Packer::unpack<float>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMaxFloat());
    }
    double Primitives::getZeroDouble() {
        return FishyJoesInternal::Packer::unpack<double>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getZeroDouble());
    }
    double Primitives::getMinDouble() {
        return FishyJoesInternal::Packer::unpack<double>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMinDouble());
    }
    double Primitives::getMaxDouble() {
        return FishyJoesInternal::Packer::unpack<double>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getMaxDouble());
    }
    std::vector<bool> Primitives::getManyBool() {
        return FishyJoesInternal::Packer::unpack<std::vector<bool>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyBool());
    }
    std::vector<uint8_t> Primitives::getManyUInt8() {
        return FishyJoesInternal::Packer::unpack<std::vector<uint8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyUInt8());
    }
    std::vector<uint16_t> Primitives::getManyUInt16() {
        return FishyJoesInternal::Packer::unpack<std::vector<uint16_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyUInt16());
    }
    std::vector<uint32_t> Primitives::getManyUInt32() {
        return FishyJoesInternal::Packer::unpack<std::vector<uint32_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyUInt32());
    }
    std::vector<uint64_t> Primitives::getManyUInt64() {
        return FishyJoesInternal::Packer::unpack<std::vector<uint64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyUInt64());
    }
    std::vector<uint64_t> Primitives::getManyUInt() {
        return FishyJoesInternal::Packer::unpack<std::vector<uint64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyUInt());
    }
    std::vector<int8_t> Primitives::getManyInt8() {
        return FishyJoesInternal::Packer::unpack<std::vector<int8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyInt8());
    }
    std::vector<int16_t> Primitives::getManyInt16() {
        return FishyJoesInternal::Packer::unpack<std::vector<int16_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyInt16());
    }
    std::vector<int32_t> Primitives::getManyInt32() {
        return FishyJoesInternal::Packer::unpack<std::vector<int32_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyInt32());
    }
    std::vector<int64_t> Primitives::getManyInt64() {
        return FishyJoesInternal::Packer::unpack<std::vector<int64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyInt64());
    }
    std::vector<int> Primitives::getManyInt() {
        return FishyJoesInternal::Packer::unpack<std::vector<int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyInt());
    }
    std::vector<float> Primitives::getManyFloat() {
        return FishyJoesInternal::Packer::unpack<std::vector<float>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyFloat());
    }
    std::vector<double> Primitives::getManyDouble() {
        return FishyJoesInternal::Packer::unpack<std::vector<double>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyDouble());
    }
    std::vector<std::optional<bool>> Primitives::getManyMaybeBool() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<bool>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyMaybeBool());
    }
    std::vector<std::optional<uint8_t>> Primitives::getManyMaybeUInt8() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<uint8_t>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyMaybeUInt8());
    }
    std::vector<std::optional<uint16_t>> Primitives::getManyMaybeUInt16() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<uint16_t>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyMaybeUInt16());
    }
    std::vector<std::optional<uint32_t>> Primitives::getManyMaybeUInt32() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<uint32_t>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyMaybeUInt32());
    }
    std::vector<std::optional<uint64_t>> Primitives::getManyMaybeUInt64() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<uint64_t>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyMaybeUInt64());
    }
    std::vector<std::optional<uint64_t>> Primitives::getManyMaybeUInt() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<uint64_t>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyMaybeUInt());
    }
    std::vector<std::optional<int8_t>> Primitives::getManyMaybeInt8() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<int8_t>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyMaybeInt8());
    }
    std::vector<std::optional<int16_t>> Primitives::getManyMaybeInt16() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<int16_t>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyMaybeInt16());
    }
    std::vector<std::optional<int32_t>> Primitives::getManyMaybeInt32() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<int32_t>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyMaybeInt32());
    }
    std::vector<std::optional<int64_t>> Primitives::getManyMaybeInt64() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<int64_t>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyMaybeInt64());
    }
    std::vector<std::optional<int>> Primitives::getManyMaybeInt() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<int>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyMaybeInt());
    }
    std::vector<std::optional<float>> Primitives::getManyMaybeFloat() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<float>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyMaybeFloat());
    }
    std::vector<std::optional<double>> Primitives::getManyMaybeDouble() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<double>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getManyMaybeDouble());
    }
    Primitives::PrimitiveHolder Primitives::getDefaultPrimitiveHolder() {
        return FishyJoesInternal::Packer::unpack<Primitives::PrimitiveHolder>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_getDefaultPrimitiveHolder());
    }
}
