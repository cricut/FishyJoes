#include "shared_impl.hpp"
namespace TestAPI {
    Functions::Functions(const std::variant<> &_variant): _variant(_variant){}
    std::string Functions::exercise0(const std::function<int(> &fn) {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_exercise0(FishyJoesInternal::Packer::pack(fn).ptr()));
    }
    std::string Functions::exercise1(const std::function<int(int> &fn) {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_exercise1(FishyJoesInternal::Packer::pack(fn).ptr()));
    }
    std::string Functions::exercise2(const std::function<std::function<int(int>(std::function<int(int>, std::function<int(int>> &fn) {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_exercise2(FishyJoesInternal::Packer::pack(fn).ptr()));
    }
    std::string Functions::exercise3(const std::function<double(float, double, int> &fn) {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_exercise3(FishyJoesInternal::Packer::pack(fn).ptr()));
    }
    std::string Functions::exercise4(const std::function<std::vector<std::string>(std::string, std::string, std::string, std::string> &fn) {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_exercise4(FishyJoesInternal::Packer::pack(fn).ptr()));
    }
    std::string Functions::exercise5(const std::function<std::function<int(>(std::string, int, double, std::string, std::function<int(>> &fn) {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_exercise5(FishyJoesInternal::Packer::pack(fn).ptr()));
    }
    std::string Functions::exercise6(const std::function<int(std::string, int, double, std::string, std::function<int(>, int> &fn) {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_exercise6(FishyJoesInternal::Packer::pack(fn).ptr()));
    }
    std::string Functions::willThrow() {
        return FishyJoesInternal::Packer::unpack<std::string>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_willThrow());
    }
    int Functions::async42Func() {
        return FishyJoesInternal::Packer::unpack<int>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_async42Func());
    }
    int Functions::asyncYieldFunc() {
        return FishyJoesInternal::Packer::unpack<int>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_asyncYieldFunc());
    }
    int Functions::asyncSleepFunc() {
        return FishyJoesInternal::Packer::unpack<int>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_asyncSleepFunc());
    }
    void Functions::asyncVoidFunc() {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_asyncVoidFunc();
    }
    double Functions::asyncDoubleFunc(const double &d) {
        return FishyJoesInternal::Packer::unpack<double>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_asyncDoubleFunc(FishyJoesInternal::Packer::pack(d).ptr()));
    }
    void Functions::asyncThrowingFunc() {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_asyncThrowingFunc();
    }
    std::function<int(> Functions::getConst42() {
        return FishyJoesInternal::Packer::unpack<std::function<int(>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_getConst42());
    }
    std::function<int(int> Functions::getIabs() {
        return FishyJoesInternal::Packer::unpack<std::function<int(int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_getIabs());
    }
    std::function<std::function<int(int>(std::function<int(int>, std::function<int(int>> Functions::getIntCompose() {
        return FishyJoesInternal::Packer::unpack<std::function<std::function<int(int>(std::function<int(int>, std::function<int(int>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_getIntCompose());
    }
    std::function<double(float, double, int> Functions::getAdd3Things() {
        return FishyJoesInternal::Packer::unpack<std::function<double(float, double, int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_getAdd3Things());
    }
    std::function<std::vector<std::string>(std::string, std::string, std::string, std::string> Functions::getMakeList() {
        return FishyJoesInternal::Packer::unpack<std::function<std::vector<std::string>(std::string, std::string, std::string, std::string>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_getMakeList());
    }
    std::function<std::function<int(>(std::string, int, double, std::string, std::function<int(>> Functions::getFifthThing() {
        return FishyJoesInternal::Packer::unpack<std::function<std::function<int(>(std::string, int, double, std::string, std::function<int(>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_getFifthThing());
    }
    std::function<int(std::string, int, double, std::string, std::function<int(>, int> Functions::getSix() {
        return FishyJoesInternal::Packer::unpack<std::function<int(std::string, int, double, std::string, std::function<int(>, int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Functions_getSix());
    }
}
