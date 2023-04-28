#include "shared_impl.hpp"
namespace TestAPI {
    AssociatedDataEnum::AssociatedDataEnum(const std::variant<thing,other,bar,noValue,simpleEnum> &_variant): _variant(_variant){}
    AssociatedDataEnum AssociatedDataEnum::plus(const AssociatedDataEnum &other) const {
        return FishyJoesInternal::Packer::unpack<AssociatedDataEnum>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AssociatedDataEnum_plus(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(other).ptr()));
    }
    AssociatedDataEnum AssociatedDataEnum::getStaticThing() {
        return FishyJoesInternal::Packer::unpack<AssociatedDataEnum>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AssociatedDataEnum_getStaticThing());
    }
    int AssociatedDataEnum::getIntValue() const {
        return FishyJoesInternal::Packer::unpack<int>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AssociatedDataEnum_getIntValue(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
}
