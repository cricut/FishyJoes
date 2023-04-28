#include "shared_impl.hpp"
namespace TestAPI {
    Structs::ReferenceStruct::ReferenceStruct(const FishyJoesInternal::SwiftReference &_ref): _ref(_ref){}
    Structs::ReferenceStruct Structs::ReferenceStruct::create() {
        return FishyJoesInternal::Packer::unpack<Structs::ReferenceStruct>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Structs_ReferenceStruct_create());
    }
    std::string Structs::ReferenceStruct::getImmutable() const {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Structs_ReferenceStruct_getImmutable(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    void Structs::ReferenceStruct::setImmutable(const std::string &newVal) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Structs_ReferenceStruct_setImmutable(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(newVal).ptr());
    }
    std::string Structs::ReferenceStruct::getMutable() const {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Structs_ReferenceStruct_getMutable(FishyJoesInternal::Packer::pack(*this).ptr()));
    }
    void Structs::ReferenceStruct::setMutable(const std::string &newVal) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Structs_ReferenceStruct_setMutable(FishyJoesInternal::Packer::pack(*this).ptr(), FishyJoesInternal::Packer::pack(newVal).ptr());
    }
}
