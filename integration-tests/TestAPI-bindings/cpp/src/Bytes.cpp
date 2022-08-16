#include "shared_impl.hpp"
namespace TestAPI {
    Bytes::Bytes(const std::variant<> &_variant): _variant(_variant){}
    std::vector<uint8_t> Bytes::echoBytes(const std::vector<uint8_t> &bytes) {
        return FishyJoesInternal::Packer::unpack<std::vector<uint8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Bytes_echoBytes(FishyJoesInternal::Packer::pack(bytes).ptr()));
    }
    std::vector<uint8_t> Bytes::echoData(const std::vector<uint8_t> &data) {
        return FishyJoesInternal::Packer::unpack<std::vector<uint8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Bytes_echoData(FishyJoesInternal::Packer::pack(data).ptr()));
    }
    std::vector<uint8_t> Bytes::getBytes() {
        return FishyJoesInternal::Packer::unpack<std::vector<uint8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Bytes_getBytes());
    }
    std::vector<uint8_t> Bytes::getData() {
        return FishyJoesInternal::Packer::unpack<std::vector<uint8_t>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Bytes_getData());
    }
}
