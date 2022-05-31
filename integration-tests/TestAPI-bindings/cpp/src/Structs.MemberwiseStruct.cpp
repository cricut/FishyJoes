#include "shared_impl.hpp"
namespace TestAPI {
    Structs::MemberwiseStruct::MemberwiseStruct(const std::string &immutable, const std::string &mutable): immutable(immutable), mutable(mutable){}
    Structs::MemberwiseStruct Structs::MemberwiseStruct::create() {
        return FishyJoesInternal::Packer::unpack<Structs::MemberwiseStruct>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Structs_MemberwiseStruct_create());
    }
}
