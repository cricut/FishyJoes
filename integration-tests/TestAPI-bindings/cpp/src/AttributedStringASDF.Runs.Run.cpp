#include "shared_impl.hpp"
namespace TestAPI {
    AttributedStringASDF::Runs::Run::Run(const FishyJoesInternal::SwiftReference &_ref): _ref(_ref){}
    std::ranges::range<AttributedString::Index> AttributedStringASDF::Runs::Run::getRange() const {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<AttributedString::Index>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_Runs_Run_getRange(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributeContainer AttributedStringASDF::Runs::Run::getAttributes() const {
        return FishyJoesInternal::Packer::unpack<AttributeContainer>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_Runs_Run_getAttributes(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
}
