#include "shared_impl.hpp"
namespace TestAPI {
    Ranges::Ranges(const std::variant<> &_variant): _variant(_variant){}
    std::ranges::range<uint8_t> Ranges::echoUInt8Range(const std::ranges::range<uint8_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_echoUInt8Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<uint16_t> Ranges::echoUInt16Range(const std::ranges::range<uint16_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint16_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_echoUInt16Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<uint32_t> Ranges::echoUInt32Range(const std::ranges::range<uint32_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint32_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_echoUInt32Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<uint64_t> Ranges::echoUInt64Range(const std::ranges::range<uint64_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_echoUInt64Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<uint64_t> Ranges::echoUIntRange(const std::ranges::range<uint64_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_echoUIntRange(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<int8_t> Ranges::echoInt8Range(const std::ranges::range<int8_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_echoInt8Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<int16_t> Ranges::echoInt16Range(const std::ranges::range<int16_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int16_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_echoInt16Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<int32_t> Ranges::echoInt32Range(const std::ranges::range<int32_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int32_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_echoInt32Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<int64_t> Ranges::echoInt64Range(const std::ranges::range<int64_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_echoInt64Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<int> Ranges::echoIntRange(const std::ranges::range<int> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_echoIntRange(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<uint8_t> Ranges::getUInt8Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_getUInt8Range());
    }
    std::ranges::range<uint16_t> Ranges::getUInt16Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint16_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_getUInt16Range());
    }
    std::ranges::range<uint32_t> Ranges::getUInt32Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint32_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_getUInt32Range());
    }
    std::ranges::range<uint64_t> Ranges::getUInt64Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_getUInt64Range());
    }
    std::ranges::range<uint64_t> Ranges::getUIntRange() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_getUIntRange());
    }
    std::ranges::range<int8_t> Ranges::getInt8Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_getInt8Range());
    }
    std::ranges::range<int16_t> Ranges::getInt16Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int16_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_getInt16Range());
    }
    std::ranges::range<int32_t> Ranges::getInt32Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int32_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_getInt32Range());
    }
    std::ranges::range<int64_t> Ranges::getInt64Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_getInt64Range());
    }
    std::ranges::range<int> Ranges::getIntRange() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_getIntRange());
    }
}
