#include "shared_impl.hpp"
namespace TestAPI {
    DefaultArguments::DefaultArguments(const FishyJoesInternal::SwiftReference &_ref): _ref(_ref){}
    std::string DefaultArguments::echoDefaults(const std::optional<int> &y = nil, const std::optional<int> &x, const double &z = 3.14) {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_DefaultArguments_echoDefaults(FishyJoesInternal::Packer::pack(y).ptr(), FishyJoesInternal::Packer::pack(x).ptr(), FishyJoesInternal::Packer::pack(z).ptr()));
    }
}
