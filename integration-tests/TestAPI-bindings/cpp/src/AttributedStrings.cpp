#include "shared_impl.hpp"
namespace TestAPI {
    AttributedStrings::AttributedStrings(const std::variant<> &_variant): _variant(_variant){}
    AttributedString AttributedStrings::echo(const AttributedString &string) {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_echo(FishyJoesInternal::Packer::pack(string).ptr()));
    }
    AttributedString::Index AttributedStrings::firstIndex(const AttributedString /* of */ &string) {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_firstIndex(FishyJoesInternal::Packer::pack(string).ptr()));
    }
    AttributedString::Index AttributedStrings::lastIndex(const AttributedString /* of */ &string) {
        return FishyJoesInternal::Packer::unpack<AttributedString::Index>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_lastIndex(FishyJoesInternal::Packer::pack(string).ptr()));
    }
    std::ranges::range<AttributedString::Index> AttributedStrings::fullRange(const AttributedString /* of */ &string) {
        return FishyJoesInternal::Packer::unpack<std::ranges::range<AttributedString::Index>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_fullRange(FishyJoesInternal::Packer::pack(string).ptr()));
    }
    std::vector<AttributedString> AttributedStrings::attributedCharacters(const AttributedString /* of */ &string) {
        return FishyJoesInternal::Packer::unpack<std::vector<AttributedString>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_attributedCharacters(FishyJoesInternal::Packer::pack(string).ptr()));
    }
    AttributeContainer AttributedStrings::attributesPreferringDuplicatesNearerStart(const AttributedString /* of */ &string) {
        return FishyJoesInternal::Packer::unpack<AttributeContainer>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_attributesPreferringDuplicatesNearerStart(FishyJoesInternal::Packer::pack(string).ptr()));
    }
    std::vector<AttributedString::Runs::Run> AttributedStrings::emptyAttributeRuns(const AttributedString /* of */ &string) {
        return FishyJoesInternal::Packer::unpack<std::vector<AttributedString::Runs::Run>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_emptyAttributeRuns(FishyJoesInternal::Packer::pack(string).ptr()));
    }
    AttributedString AttributedStrings::getSimple() {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_getSimple());
    }
    AttributedString AttributedStrings::getAccent() {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_getAccent());
    }
    AttributedString AttributedStrings::getScript() {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_getScript());
    }
    AttributedString AttributedStrings::getChinese() {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_getChinese());
    }
    AttributedString AttributedStrings::getChineseBMP() {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_getChineseBMP());
    }
    AttributedString AttributedStrings::getChineseSIP() {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_getChineseSIP());
    }
    AttributedString AttributedStrings::getEmoji() {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_getEmoji());
    }
    AttributedString AttributedStrings::getEmojiMulti() {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_getEmojiMulti());
    }
    AttributedString AttributedStrings::getPolyglot() {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_getPolyglot());
    }
}
