#include "shared_impl.hpp"
namespace TestAPI {
    Collections::CollectionHolder::CollectionHolder(const std::vector<bool> &boolArray, const std::unordered_set<bool> &boolSet, const std::unordered_map<bool, bool> &boolDictionary, const std::vector<int> &integerArray, const std::unordered_set<int> &integerSet, const std::unordered_map<int, int> &integerDictionary, const std::vector<std::string> &stringArray, const std::unordered_set<std::string> &stringSet, const std::unordered_map<std::string, std::string> &stringDictionary): boolArray(boolArray), boolSet(boolSet), boolDictionary(boolDictionary), integerArray(integerArray), integerSet(integerSet), integerDictionary(integerDictionary), stringArray(stringArray), stringSet(stringSet), stringDictionary(stringDictionary){}
    std::vector<std::optional<int>> Collections::CollectionHolder::getStaticPropery() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<int>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_CollectionHolder_getStaticPropery());
    }
    std::vector<std::optional<int>> Collections::CollectionHolder::getStaticMutablePropery() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<int>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_CollectionHolder_getStaticMutablePropery());
    }
    void Collections::CollectionHolder::setStaticMutablePropery(const std::vector<std::optional<int>> &newVal) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_CollectionHolder_setStaticMutablePropery(FishyJoesInternal::Packer::pack(newVal).ptr());
    }
}
