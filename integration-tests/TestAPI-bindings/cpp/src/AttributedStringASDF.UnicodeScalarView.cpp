#include "shared_impl.hpp"
namespace TestAPI {
    AttributedStringASDF::UnicodeScalarView::UnicodeScalarView(const FishyJoesInternal::SwiftReference &_ref): _ref(_ref){}
    AttributedString::Index AttributedStringASDF::UnicodeScalarView::indexBefore(const AttributedString::Index /* before */ &i) const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_UnicodeScalarView_indexBefore(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(i).ptr()));
    }
    AttributedString::Index AttributedStringASDF::UnicodeScalarView::indexAfter(const AttributedString::Index /* after */ &i) const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_UnicodeScalarView_indexAfter(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(i).ptr()));
    }
    AttributedString::Index AttributedStringASDF::UnicodeScalarView::indexOffsetByDistance(const AttributedString::Index &i, const int /* offsetBy */ &distance) const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_UnicodeScalarView_indexOffsetByDistance(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(i).ptr(), FishyJoesInternal::Packer::pack(distance).ptr()));
    }
    uint32_t AttributedStringASDF::UnicodeScalarView::elementAt(const AttributedString::Index /* at */ &index) const {
        return FishyJoesInternal::Packer::unpack<uint32_t>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_UnicodeScalarView_elementAt(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(index).ptr()));
    }
    void AttributedStringASDF::UnicodeScalarView::replaceSubrange(const std::ranges::range<AttributedString::Index> &subrange, const std::vector<uint32_t> /* with */ &newElements) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_UnicodeScalarView_replaceSubrange(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(subrange).ptr(), FishyJoesInternal::Packer::pack(newElements).ptr());
    }
    AttributedString::Index AttributedStringASDF::UnicodeScalarView::getStartIndex() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_UnicodeScalarView_getStartIndex(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedString::Index AttributedStringASDF::UnicodeScalarView::getEndIndex() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_UnicodeScalarView_getEndIndex(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
}
