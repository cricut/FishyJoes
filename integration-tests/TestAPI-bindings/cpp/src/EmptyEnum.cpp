#include "shared_impl.hpp"
namespace TestAPI {
    EmptyEnum::EmptyEnum(const std::variant<> &_variant): _variant(_variant){}
    EmptyEnum EmptyEnum::notGoingToHappen() {
        return FishyJoesInternal::Packer::unpack<EmptyEnum>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_EmptyEnum_notGoingToHappen());
    }
}
