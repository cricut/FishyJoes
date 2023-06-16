#include "shared_impl.hpp"
namespace TestAPI {
    AttributeContainerASDF::AttributeContainerASDF(const FishyJoesInternal::SwiftReference &_ref): _ref(_ref){}
    AttributeContainer AttributeContainerASDF::createEmpty() {
        return FishyJoesInternal::Packer::unpack<AttributeContainer>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributeContainerASDF_createEmpty());
    }
}
