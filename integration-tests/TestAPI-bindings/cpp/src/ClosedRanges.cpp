#include "shared_impl.hpp"
namespace TestAPI {
    ClosedRanges::ClosedRanges(const std::variant<> &_variant): _variant(_variant){}
    std::ranges::range<uint8_t> ClosedRanges::echoUInt8Range(const std::ranges::range<uint8_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_echoUInt8Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<uint16_t> ClosedRanges::echoUInt16Range(const std::ranges::range<uint16_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint16_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_echoUInt16Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<uint32_t> ClosedRanges::echoUInt32Range(const std::ranges::range<uint32_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint32_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_echoUInt32Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<uint64_t> ClosedRanges::echoUInt64Range(const std::ranges::range<uint64_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_echoUInt64Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<uint64_t> ClosedRanges::echoUIntRange(const std::ranges::range<uint64_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_echoUIntRange(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<int8_t> ClosedRanges::echoInt8Range(const std::ranges::range<int8_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_echoInt8Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<int16_t> ClosedRanges::echoInt16Range(const std::ranges::range<int16_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int16_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_echoInt16Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<int32_t> ClosedRanges::echoInt32Range(const std::ranges::range<int32_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int32_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_echoInt32Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<int64_t> ClosedRanges::echoInt64Range(const std::ranges::range<int64_t> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_echoInt64Range(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<int> ClosedRanges::echoIntRange(const std::ranges::range<int> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_echoIntRange(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<float> ClosedRanges::echoFloatRange(const std::ranges::range<float> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<float>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_echoFloatRange(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<double> ClosedRanges::echoDoubleRange(const std::ranges::range<double> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<double>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_echoDoubleRange(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<std::string> ClosedRanges::echoStringRange(const std::ranges::range<std::string> &range) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<std::string>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_echoStringRange(FishyJoesInternal::Packer::pack(range).ptr()));
    }
    std::ranges::range<uint8_t> ClosedRanges::getUInt8Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_getUInt8Range());
    }
    std::ranges::range<uint16_t> ClosedRanges::getUInt16Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint16_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_getUInt16Range());
    }
    std::ranges::range<uint32_t> ClosedRanges::getUInt32Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint32_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_getUInt32Range());
    }
    std::ranges::range<uint64_t> ClosedRanges::getUInt64Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_getUInt64Range());
    }
    std::ranges::range<uint64_t> ClosedRanges::getUIntRange() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<uint64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_getUIntRange());
    }
    std::ranges::range<int8_t> ClosedRanges::getInt8Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_getInt8Range());
    }
    std::ranges::range<int16_t> ClosedRanges::getInt16Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int16_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_getInt16Range());
    }
    std::ranges::range<int32_t> ClosedRanges::getInt32Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int32_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_getInt32Range());
    }
    std::ranges::range<int64_t> ClosedRanges::getInt64Range() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int64_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_getInt64Range());
    }
    std::ranges::range<int> ClosedRanges::getIntRange() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_getIntRange());
    }
    std::ranges::range<float> ClosedRanges::getFloatRange() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<float>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_getFloatRange());
    }
    std::ranges::range<double> ClosedRanges::getDoubleRange() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<double>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_getDoubleRange());
    }
    std::ranges::range<std::string> ClosedRanges::getStringRange() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<std::string>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_ClosedRanges_getStringRange());
    }
}
