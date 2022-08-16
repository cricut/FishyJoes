#include "shared_impl.hpp"
namespace TestAPI {
    Deprecations::Deprecations(const std::variant<> &_variant): _variant(_variant){}
    std::string Deprecations::deprecatedMethod() {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Deprecations_deprecatedMethod());
    }
    int Deprecations::getDeprecatedVariable() {
        return FishyJoesInternal::Packer::unpack<int>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Deprecations_getDeprecatedVariable());
    }
}
