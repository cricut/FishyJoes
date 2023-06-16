#include "shared_impl.hpp"
namespace TestAPI {
    AttributedStringASDF::AttributedStringASDF(const FishyJoesInternal::SwiftReference &_ref): _ref(_ref){}
    AttributedString AttributedStringASDF::createEmpty() {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_createEmpty());
    }
    AttributedString AttributedStringASDF::create(const std::string &string, const std::optional<AttributeContainer> &attributes = nil) {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_create(FishyJoesInternal::Packer::pack(string).ptr(), FishyJoesInternal::Packer::pack(attributes).ptr()));
    }
    AttributedString AttributedStringASDF::createFromSubstring(const AttributedSubstring &substring) {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_createFromSubstring(FishyJoesInternal::Packer::pack(substring).ptr()));
    }
    AttributedSubstring AttributedStringASDF::substringForRange(const std::ranges::range<AttributedString::Index> /* for */ &range) const {
        return FishyJoesInternal::Packer::unpack<AttributedSubstring>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_substringForRange(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(range).ptr()));
    }
    void AttributedStringASDF::append(const AttributedString &s) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_append(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(s).ptr());
    }
    void AttributedStringASDF::insert(const AttributedString &s, const AttributedString::Index /* at */ &index) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_insert(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(s).ptr(), FishyJoesInternal::Packer::pack(index).ptr());
    }
    void AttributedStringASDF::removeSubrange(const std::ranges::range<AttributedString::Index> &range) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_removeSubrange(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(range).ptr());
    }
    void AttributedStringASDF::replaceSubrange(const std::ranges::range<AttributedString::Index> &range, const AttributedString /* with */ &s) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_replaceSubrange(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(range).ptr(), FishyJoesInternal::Packer::pack(s).ptr());
    }
    void AttributedStringASDF::setAttributes(const AttributeContainer &attributes) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_setAttributes(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(attributes).ptr());
    }
    void AttributedStringASDF::mergeAttributes(const AttributeContainer &attributes, const std::optional<AttributedString::AttributeMergePolicy> &mergePolicy = nil) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_mergeAttributes(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(attributes).ptr(), FishyJoesInternal::Packer::pack(mergePolicy).ptr());
    }
    void AttributedStringASDF::replaceAttributes(const AttributeContainer &attributes, const AttributeContainer /* with */ &others) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_replaceAttributes(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(attributes).ptr(), FishyJoesInternal::Packer::pack(others).ptr());
    }
    AttributedString::Index AttributedStringASDF::getStartIndex() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_getStartIndex(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedString::Index AttributedStringASDF::getEndIndex() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_getEndIndex(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedString::UnicodeScalarView AttributedStringASDF::getUnicodeScalars() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::UnicodeScalarView>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_getUnicodeScalars(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedString::CharacterView AttributedStringASDF::getCharacters() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::CharacterView>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_getCharacters(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedString::Runs AttributedStringASDF::getRuns() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Runs>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_getRuns(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedSubstring AttributedStringASDF::getSubstring() const {
        return FishyJoesInternal::Packer::unpack<AttributedSubstring>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStringASDF_getSubstring(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
}
