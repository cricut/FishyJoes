#include "shared_impl.hpp"
namespace TestAPI {
    Tuples::Tuples(const std::variant<> &_variant): _variant(_variant){}
    bool Tuples::checkTuples(const std::tuple<int, std::string> &t2, const std::tuple<std::string, double, std::string> &t3, const std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool> &t4, const std::tuple<std::string, uint8_t, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, double, std::string>, std::tuple<int, std::string>> &t5, const std::tuple<std::string, int, double, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, uint8_t, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, double, std::string>, std::tuple<int, std::string>>, bool> &t6) {
        return FishyJoesInternal::Packer::unpack<bool>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Tuples_checkTuples(FishyJoesInternal::Packer::pack(t2).ptr(), FishyJoesInternal::Packer::pack(t3).ptr(), FishyJoesInternal::Packer::pack(t4).ptr(), FishyJoesInternal::Packer::pack(t5).ptr(), FishyJoesInternal::Packer::pack(t6).ptr()));
    }
    std::tuple<int, std::string> Tuples::getTuple2() {
        return FishyJoesInternal::Packer::unpack<std::tuple<int, std::string>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Tuples_getTuple2());
    }
    std::tuple<std::string, double, std::string> Tuples::getTuple3() {
        return FishyJoesInternal::Packer::unpack<std::tuple<std::string, double, std::string>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Tuples_getTuple3());
    }
    std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool> Tuples::getTuple4() {
        return FishyJoesInternal::Packer::unpack<std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Tuples_getTuple4());
    }
    std::tuple<std::string, uint8_t, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, double, std::string>, std::tuple<int, std::string>> Tuples::getTuple5() {
        return FishyJoesInternal::Packer::unpack<std::tuple<std::string, uint8_t, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, double, std::string>, std::tuple<int, std::string>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Tuples_getTuple5());
    }
    std::tuple<std::string, int, double, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, uint8_t, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, double, std::string>, std::tuple<int, std::string>>, bool> Tuples::getTuple6() {
        return FishyJoesInternal::Packer::unpack<std::tuple<std::string, int, double, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, uint8_t, std::tuple<std::tuple<int, std::string>, std::tuple<std::string, double, std::string>, std::string, bool>, std::tuple<std::string, double, std::string>, std::tuple<int, std::string>>, bool>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Tuples_getTuple6());
    }
}
