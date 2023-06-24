#include "shared_impl.hpp"
namespace TestAPI {
    AttributedStrings::AttributedStrings(const std::variant<> &_variant): _variant(_variant){}
    AttributedString AttributedStrings::echo(const AttributedString &string) {
        return FishyJoesInternal::Packer::unpack<AttributedString>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_AttributedStrings_echo(FishyJoesInternal::Packer::pack(string).ptr()));
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
