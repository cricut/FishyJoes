#include "shared_impl.hpp"
namespace TestAPI {
    AttributedSubstringASDF::AttributedSubstringASDF(const FishyJoesInternal::SwiftReference &_ref): _ref(_ref){}
    AttributedSubstring AttributedSubstringASDF::createEmpty() {
        return FishyJoesInternal::Packer::unpack<AttributedSubstring>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedSubstringASDF_createEmpty());
    }
    AttributedSubstring AttributedSubstringASDF::substringForRange(const std::ranges::range<AttributedString::Index> /* for */ &range) const {
        return FishyJoesInternal::Packer::unpack<AttributedSubstring>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedSubstringASDF_substringForRange(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(range).ptr()));
    }
    void AttributedSubstringASDF::setAttributes(const AttributeContainer &attributes) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedSubstringASDF_setAttributes(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(attributes).ptr());
    }
    void AttributedSubstringASDF::mergeAttributes(const AttributeContainer &attributes, const std::optional<AttributedString::AttributeMergePolicy> &mergePolicy = nil) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedSubstringASDF_mergeAttributes(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(attributes).ptr(), FishyJoesInternal::Packer::pack(mergePolicy).ptr());
    }
    void AttributedSubstringASDF::replaceAttributes(const AttributeContainer &attributes, const AttributeContainer /* with */ &others) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedSubstringASDF_replaceAttributes(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(attributes).ptr(), FishyJoesInternal::Packer::pack(others).ptr());
    }
    AttributedString AttributedSubstringASDF::getBase() const {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedSubstringASDF_getBase(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedString::Index AttributedSubstringASDF::getStartIndex() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedSubstringASDF_getStartIndex(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedString::Index AttributedSubstringASDF::getEndIndex() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedSubstringASDF_getEndIndex(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedString::UnicodeScalarView AttributedSubstringASDF::getUnicodeScalars() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::UnicodeScalarView>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedSubstringASDF_getUnicodeScalars(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedString::CharacterView AttributedSubstringASDF::getCharacters() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::CharacterView>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedSubstringASDF_getCharacters(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedString::Runs AttributedSubstringASDF::getRuns() const {
        return FishyJoesInternal::Packer::unpack<AttributedString::Runs>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedSubstringASDF_getRuns(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    AttributedSubstring AttributedSubstringASDF::getSubstring() const {
        return FishyJoesInternal::Packer::unpack<AttributedSubstring>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedSubstringASDF_getSubstring(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    std::unordered_map<std::string, std::string> AttributedSubstringASDF::getAttributes() const {
        return FishyJoesInternal::Packer::unpack<std::unordered_map<std::string, std::string>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedSubstringASDF_getAttributes(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
}
