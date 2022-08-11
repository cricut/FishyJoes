#include "shared_impl.hpp"
namespace TestAPI {
    Deprecated::Deprecated(const FishyJoesInternal::SwiftReference &_ref): _ref(_ref){}
    std::string Deprecated::deprecatedMethod() {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Deprecated_deprecatedMethod());
    }
    int Deprecated::getDeprecatedVariable() {
        return FishyJoesInternal::Packer::unpack<int>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Deprecated_getDeprecatedVariable());
    }
}
