#include "shared_impl.hpp"
namespace TestAPI {
    Deprecations::Deprecations(const FishyJoesInternal::SwiftReference &_ref): _ref(_ref){}
    std::string Deprecations::deprecatedMethod() {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Deprecations_deprecatedMethod());
    }
    int Deprecations::getDeprecatedVariable() {
        return FishyJoesInternal::Packer::unpack<int>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Deprecations_getDeprecatedVariable());
    }
}
