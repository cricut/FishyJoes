#pragma once
#include "TestAPI_pre.hpp"
#include "Collections.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.exportReference(Collections) -->
    class Collections {
        /*  Inner Classes  */
        public:
        class CollectionHolder;
        /// <!-- FishyJoes.export(Collections.CollectionHolder) -->
        class CollectionHolder {
            /*  Complete Constructor  */
            public:
            /// Create new CollectionHolder
            CollectionHolder(const std::vector<bool> &boolArray, const std::unordered_set<bool> &boolSet, const std::unordered_map<bool, bool> &boolDictionary, const std::vector<int> &integerArray, const std::unordered_set<int> &integerSet, const std::unordered_map<int, int> &integerDictionary, const std::vector<std::string> &stringArray, const std::unordered_set<std::string> &stringSet, const std::unordered_map<std::string, std::string> &stringDictionary);
            
            /*  Methods  */
            public:
            /// <!-- FishyJoes.export(staticPropery) -->
            static std::vector<std::optional<int>> getStaticPropery();
            
            /// <!-- FishyJoes.export(staticMutablePropery) -->
            static std::vector<std::optional<int>> getStaticMutablePropery();
            
            /// <!-- FishyJoes.export(staticMutablePropery) -->
            static void setStaticMutablePropery(const std::vector<std::optional<int>> &newVal);
            
            
            /*  Data  */
            public:
            std::vector<bool> boolArray;
            std::unordered_set<bool> boolSet;
            std::unordered_map<bool, bool> boolDictionary;
            std::vector<int> integerArray;
            std::unordered_set<int> integerSet;
            std::unordered_map<int, int> integerDictionary;
            std::vector<std::string> stringArray;
            std::unordered_set<std::string> stringSet;
            std::unordered_map<std::string, std::string> stringDictionary;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        
        /*  Complete Constructor  */
        private:
        /// Create new Collections (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        Collections(const FishyJoesInternal::SwiftReference &_ref);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(echoArrayOfInt) -->
        static std::vector<int> echoArrayOfInt(const std::vector<int> &arrayOfInt);
        
        /// <!-- FishyJoes.export(echoSetOfInt) -->
        static std::unordered_set<int> echoSetOfInt(const std::unordered_set<int> &setOfInt);
        
        /// <!-- FishyJoes.export(echoDictionaryOfIntToInt) -->
        static std::unordered_map<int, int> echoDictionaryOfIntToInt(const std::unordered_map<int, int> &dictionaryOfIntToInt);
        
        /// <!-- FishyJoes.export(echoMaybeArrayOfMaybeInt) -->
        static std::optional<std::vector<std::optional<int>>> echoMaybeArrayOfMaybeInt(const std::optional<std::vector<std::optional<int>>> &maybeArrayOfMaybeInt);
        
        /// <!-- FishyJoes.export(echoMaybeSetOfMaybeInt) -->
        static std::optional<std::unordered_set<std::optional<int>>> echoMaybeSetOfMaybeInt(const std::optional<std::unordered_set<std::optional<int>>> &maybeSetOfMaybeInt);
        
        /// <!-- FishyJoes.export(echoMaybeDictionaryOfIntToMaybeInt) -->
        static std::optional<std::unordered_map<int, std::optional<int>>> echoMaybeDictionaryOfIntToMaybeInt(const std::optional<std::unordered_map<int, std::optional<int>>> &maybeDictionaryOfIntToMaybeInt);
        
        /// <!-- FishyJoes.export(arrayOfInt) -->
        static std::vector<int> getArrayOfInt();
        
        /// <!-- FishyJoes.export(setOfInt) -->
        static std::unordered_set<int> getSetOfInt();
        
        /// <!-- FishyJoes.export(dictionaryOfIntToInt) -->
        static std::unordered_map<int, int> getDictionaryOfIntToInt();
        
        /// <!-- FishyJoes.export(maybeArrayOfInt) -->
        static std::optional<std::vector<int>> getMaybeArrayOfInt();
        
        /// <!-- FishyJoes.export(maybeSetOfInt) -->
        static std::optional<std::unordered_set<int>> getMaybeSetOfInt();
        
        /// <!-- FishyJoes.export(maybeDictionaryOfIntToInt) -->
        static std::optional<std::unordered_map<int, int>> getMaybeDictionaryOfIntToInt();
        
        /// <!-- FishyJoes.export(maybeArrayOfMaybeInt) -->
        static std::optional<std::vector<std::optional<int>>> getMaybeArrayOfMaybeInt();
        
        /// <!-- FishyJoes.export(maybeSetOfMaybeInt) -->
        static std::optional<std::unordered_set<std::optional<int>>> getMaybeSetOfMaybeInt();
        
        /// <!-- FishyJoes.export(maybeDictionaryOfIntToMaybeInt) -->
        static std::optional<std::unordered_map<int, std::optional<int>>> getMaybeDictionaryOfIntToMaybeInt();
        
        /// <!-- FishyJoes.export(defaultCollectionHolder) -->
        static Collections::CollectionHolder getDefaultCollectionHolder();
        
        
        /*  Data  */
        private:
        /// Reference to Swift-managed data
        FishyJoesInternal::SwiftReference _ref;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
