#include "shared_impl.hpp"
namespace TestAPI {
    AttributeContainerASDF::AttributeContainerASDF(const FishyJoesInternal::SwiftReference &_ref): _ref(_ref){}
    AttributeContainer AttributeContainerASDF::createEmpty() {
        return FishyJoesInternal::Packer::unpack<AttributeContainer>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributeContainerASDF_createEmpty());
    }
    void AttributeContainerASDF::merge(const AttributeContainer &other, const std::optional<AttributedString::AttributeMergePolicy> &mergePolicy = nil) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributeContainerASDF_merge(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(other).ptr(), FishyJoesInternal::Packer::pack(mergePolicy).ptr());
    }
    std::unordered_map<std::string, std::string> AttributeContainerASDF::getAttributes() const {
        return FishyJoesInternal::Packer::unpack<std::unordered_map<std::string, std::string>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributeContainerASDF_getAttributes(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
}
