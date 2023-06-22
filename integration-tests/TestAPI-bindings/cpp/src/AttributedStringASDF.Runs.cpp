#include "shared_impl.hpp"
namespace TestAPI {
    AttributedStringASDF::Runs::Runs(const FishyJoesInternal::SwiftReference &_ref): _ref(_ref){}
    AttributedString::Runs::Index AttributedStringASDF::Runs::indexBefore(const AttributedString::Runs::Index /* before */ &i) const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Runs::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_Runs_indexBefore(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(i).ptr()));
    }
    AttributedString::Runs::Index AttributedStringASDF::Runs::indexAfter(const AttributedString::Runs::Index /* after */ &i) const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Runs::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_Runs_indexAfter(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(i).ptr()));
    }
    AttributedString::Runs::Run AttributedStringASDF::Runs::elementAt(const AttributedString::Runs::Index /* at */ &index) const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Runs::Run>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_Runs_elementAt(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(index).ptr()));
    }
    AttributedString::Runs::Run AttributedStringASDF::Runs::elementAtPosition(const AttributedString::Index /* at */ &index) const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Runs::Run>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_Runs_elementAtPosition(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(index).ptr()));
    }
    AttributedString::Runs::Index AttributedStringASDF::Runs::getStartIndex() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Runs::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_Runs_getStartIndex(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedString::Runs::Index AttributedStringASDF::Runs::getEndIndex() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Runs::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_Runs_getEndIndex(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
}
