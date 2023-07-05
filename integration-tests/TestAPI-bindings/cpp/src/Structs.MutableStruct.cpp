#include "shared_impl.hpp"
namespace TestAPI {
    Structs::MutableStruct::MutableStruct(const int &i): i(i){}
    Structs::MutableStruct Structs::MutableStruct::create() {
        return FishyJoesInternal::Packer::unpack<Structs::MutableStruct>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Structs_MutableStruct_create());
    }
    void Structs::MutableStruct::increment() {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Structs_MutableStruct_increment(FishyJoesInternal::Packer::pack(*this).ptr());
    }
    void Structs::MutableStruct::incrementAsync() {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Structs_MutableStruct_incrementAsync(FishyJoesInternal::Packer::pack(*this).ptr());
    }
}
