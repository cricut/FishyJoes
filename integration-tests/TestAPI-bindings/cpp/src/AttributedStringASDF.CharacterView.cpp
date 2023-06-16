#include "shared_impl.hpp"
namespace TestAPI {
    AttributedStringASDF::CharacterView::CharacterView(const FishyJoesInternal::SwiftReference &_ref): _ref(_ref){}
    AttributedString::Index AttributedStringASDF::CharacterView::indexBefore(const AttributedString::Index /* before */ &i) const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_CharacterView_indexBefore(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(i).ptr()));
    }
    AttributedString::Index AttributedStringASDF::CharacterView::indexAfter(const AttributedString::Index /* after */ &i) const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_CharacterView_indexAfter(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(i).ptr()));
    }
    std::string AttributedStringASDF::CharacterView::elementAt(const AttributedString::Index /* at */ &index) const {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_CharacterView_elementAt(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(index).ptr()));
    }
    void AttributedStringASDF::CharacterView::replaceSubrange(const std::ranges::range<AttributedString::Index> &subrange, const std::vector<std::string> /* with */ &newElements) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_CharacterView_replaceSubrange(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(subrange).ptr(), FishyJoesInternal::Packer::pack(newElements).ptr());
    }
    AttributedString::Index AttributedStringASDF::CharacterView::getStartIndex() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_CharacterView_getStartIndex(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedString::Index AttributedStringASDF::CharacterView::getEndIndex() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_CharacterView_getEndIndex(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
}
