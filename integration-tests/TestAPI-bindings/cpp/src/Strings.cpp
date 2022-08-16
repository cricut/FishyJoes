#include "shared_impl.hpp"
namespace TestAPI {
    Strings::Strings(const std::variant<> &_variant): _variant(_variant){}
    std::string Strings::echo(const std::string &string) {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Strings_echo(FishyJoesInternal::Packer::pack(string).ptr()));
    }
    std::string Strings::getSimple() {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Strings_getSimple());
    }
    std::string Strings::getAccent() {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Strings_getAccent());
    }
    std::string Strings::getScript() {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Strings_getScript());
    }
    std::string Strings::getChinese() {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Strings_getChinese());
    }
    std::string Strings::getChineseBMP() {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Strings_getChineseBMP());
    }
    std::string Strings::getChineseSIP() {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Strings_getChineseSIP());
    }
    std::string Strings::getEmoji() {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Strings_getEmoji());
    }
    std::string Strings::getEmojiMulti() {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Strings_getEmojiMulti());
    }
}
