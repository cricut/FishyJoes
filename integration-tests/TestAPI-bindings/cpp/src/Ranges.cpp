#include "shared_impl.hpp"
namespace TestAPI {
    Ranges::Ranges(const std::variant<> &_variant): _variant(_variant){}
    std::ranges::range<int> Ranges::echo(const std::ranges::range<int> &closedIntRange) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_echo(FishyJoesInternal::Packer::pack(closedIntRange).ptr()));
    }
    std::ranges::range<int> Ranges::getClosedIntRange() {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Ranges_getClosedIntRange());
    }
}
