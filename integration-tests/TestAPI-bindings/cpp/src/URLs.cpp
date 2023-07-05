#include "shared_impl.hpp"
namespace TestAPI {
    URLs::URLs(const std::variant<> &_variant): _variant(_variant){}
    URL URLs::echo(const URL &url) {
        return FishyJoesInternal::Packer::unpack<URL>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_URLs_echo(FishyJoesInternal::Packer::pack(url).ptr()));
    }
    URL URLs::getSimple() {
        return FishyJoesInternal::Packer::unpack<URL>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_URLs_getSimple());
    }
    URL URLs::getRemoteFile() {
        return FishyJoesInternal::Packer::unpack<URL>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_URLs_getRemoteFile());
    }
    URL URLs::getLocalFile() {
        return FishyJoesInternal::Packer::unpack<URL>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_URLs_getLocalFile());
    }
}
