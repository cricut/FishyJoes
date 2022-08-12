#include "shared_impl.hpp"
namespace TestAPI {
    Collections::Collections(const std::variant<> &_variant): _variant(_variant){}
    std::vector<int> Collections::echoArrayOfInt(const std::vector<int> &arrayOfInt) {
        return FishyJoesInternal::Packer::unpack<std::vector<int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_echoArrayOfInt(FishyJoesInternal::Packer::pack(arrayOfInt).ptr()));
    }
    std::unordered_set<int> Collections::echoSetOfInt(const std::unordered_set<int> &setOfInt) {
        return FishyJoesInternal::Packer::unpack<std::unordered_set<int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_echoSetOfInt(FishyJoesInternal::Packer::pack(setOfInt).ptr()));
    }
    std::unordered_map<int, int> Collections::echoDictionaryOfIntToInt(const std::unordered_map<int, int> &dictionaryOfIntToInt) {
        return FishyJoesInternal::Packer::unpack<std::unordered_map<int, int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_echoDictionaryOfIntToInt(FishyJoesInternal::Packer::pack(dictionaryOfIntToInt).ptr()));
    }
    std::optional<std::vector<std::optional<int>>> Collections::echoMaybeArrayOfMaybeInt(const std::optional<std::vector<std::optional<int>>> &maybeArrayOfMaybeInt) {
        return FishyJoesInternal::Packer::unpack<std::optional<std::vector<std::optional<int>>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_echoMaybeArrayOfMaybeInt(FishyJoesInternal::Packer::pack(maybeArrayOfMaybeInt).ptr()));
    }
    std::optional<std::unordered_set<std::optional<int>>> Collections::echoMaybeSetOfMaybeInt(const std::optional<std::unordered_set<std::optional<int>>> &maybeSetOfMaybeInt) {
        return FishyJoesInternal::Packer::unpack<std::optional<std::unordered_set<std::optional<int>>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_echoMaybeSetOfMaybeInt(FishyJoesInternal::Packer::pack(maybeSetOfMaybeInt).ptr()));
    }
    std::optional<std::unordered_map<int, std::optional<int>>> Collections::echoMaybeDictionaryOfIntToMaybeInt(const std::optional<std::unordered_map<int, std::optional<int>>> &maybeDictionaryOfIntToMaybeInt) {
        return FishyJoesInternal::Packer::unpack<std::optional<std::unordered_map<int, std::optional<int>>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt(FishyJoesInternal::Packer::pack(maybeDictionaryOfIntToMaybeInt).ptr()));
    }
    std::optional<std::vector<std::optional<int>>> Collections::collectionMapper(const std::optional<std::vector<std::optional<int>>> &collection, const std::function<std::optional<std::vector<std::optional<int>>>(std::optional<std::vector<std::optional<int>>>> &mapper) {
        return FishyJoesInternal::Packer::unpack<std::optional<std::vector<std::optional<int>>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_collectionMapper(FishyJoesInternal::Packer::pack(collection).ptr(), FishyJoesInternal::Packer::pack(mapper).ptr()));
    }
    std::vector<int> Collections::getArrayOfInt() {
        return FishyJoesInternal::Packer::unpack<std::vector<int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_getArrayOfInt());
    }
    std::unordered_set<int> Collections::getSetOfInt() {
        return FishyJoesInternal::Packer::unpack<std::unordered_set<int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_getSetOfInt());
    }
    std::unordered_map<int, int> Collections::getDictionaryOfIntToInt() {
        return FishyJoesInternal::Packer::unpack<std::unordered_map<int, int>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_getDictionaryOfIntToInt());
    }
    std::optional<std::vector<int>> Collections::getMaybeArrayOfInt() {
        return FishyJoesInternal::Packer::unpack<std::optional<std::vector<int>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_getMaybeArrayOfInt());
    }
    std::optional<std::unordered_set<int>> Collections::getMaybeSetOfInt() {
        return FishyJoesInternal::Packer::unpack<std::optional<std::unordered_set<int>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_getMaybeSetOfInt());
    }
    std::optional<std::unordered_map<int, int>> Collections::getMaybeDictionaryOfIntToInt() {
        return FishyJoesInternal::Packer::unpack<std::optional<std::unordered_map<int, int>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_getMaybeDictionaryOfIntToInt());
    }
    std::optional<std::vector<std::optional<int>>> Collections::getMaybeArrayOfMaybeInt() {
        return FishyJoesInternal::Packer::unpack<std::optional<std::vector<std::optional<int>>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_getMaybeArrayOfMaybeInt());
    }
    std::optional<std::unordered_set<std::optional<int>>> Collections::getMaybeSetOfMaybeInt() {
        return FishyJoesInternal::Packer::unpack<std::optional<std::unordered_set<std::optional<int>>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_getMaybeSetOfMaybeInt());
    }
    std::optional<std::unordered_map<int, std::optional<int>>> Collections::getMaybeDictionaryOfIntToMaybeInt() {
        return FishyJoesInternal::Packer::unpack<std::optional<std::unordered_map<int, std::optional<int>>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_getMaybeDictionaryOfIntToMaybeInt());
    }
    Collections::CollectionHolder Collections::getDefaultCollectionHolder() {
        return FishyJoesInternal::Packer::unpack<Collections::CollectionHolder>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Collections_getDefaultCollectionHolder());
    }
}
