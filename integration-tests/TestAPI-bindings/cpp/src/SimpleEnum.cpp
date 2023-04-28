#include "shared_impl.hpp"
namespace TestAPI {
    SimpleEnum::SimpleEnum(const std::variant<red,green,blue> &_variant): _variant(_variant){}
    std::optional<SimpleEnum> SimpleEnum::pickAColor(const int &rawValue) {
        return FishyJoesInternal::Packer::unpack<std::optional<SimpleEnum>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_SimpleEnum_pickAColor(FishyJoesInternal::Packer::pack(rawValue).ptr()));
    }
    std::string SimpleEnum::hexMethod() const {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_SimpleEnum_hexMethod(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    void SimpleEnum::resetFavoriteColor() {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_SimpleEnum_resetFavoriteColor();
    }
    int SimpleEnum::getHex() const {
        return FishyJoesInternal::Packer::unpack<int>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_SimpleEnum_getHex(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    SimpleEnum SimpleEnum::getFavoriteColor() {
        return FishyJoesInternal::Packer::unpack<SimpleEnum>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_SimpleEnum_getFavoriteColor());
    }
    void SimpleEnum::setFavoriteColor(const SimpleEnum &newVal) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_SimpleEnum_setFavoriteColor(FishyJoesInternal::Packer::pack(newVal).ptr());
    }
}
