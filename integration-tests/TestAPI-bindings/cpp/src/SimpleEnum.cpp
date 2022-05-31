#include "shared_impl.hpp"
namespace TestAPI {
    SimpleEnum::SimpleEnum(const std::variant<red,green,blue> &_variant): _variant(_variant){}
    std::optional<SimpleEnum> SimpleEnum::pickAColor(const int &rawValue) {
        return FishyJoesInternal::Packer::unpack<std::optional<SimpleEnum>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_SimpleEnum_pickAColor(FishyJoesInternal::Packer::pack(rawValue).ptr()));
    }
    int SimpleEnum::getHex() const {
        return FishyJoesInternal::Packer::unpack<int>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_SimpleEnum_getHex(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
}
