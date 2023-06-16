#pragma once
#include "TestAPI_pre.hpp"
#include "AttributeContainer.hpp"
#include "AttributedString.hpp"
#include "AttributedSubstring.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.exportReference(AttributedSubstring) -->
    class AttributedSubstringASDF {
        /*  Complete Constructor  */
        private:
        /// Create new AttributedSubstringASDF (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        AttributedSubstringASDF(const FishyJoesInternal::SwiftReference &_ref);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(createEmpty) -->
        static AttributedSubstring createEmpty();
        
        /// <!-- FishyJoes.export(substringForRange) -->
        AttributedSubstring substringForRange(const std::ranges::range<AttributedString::Index> /* for */ &range) const;
        
        /// <!-- FishyJoes.export(setAttributes) -->
        void setAttributes(const AttributeContainer &attributes);
        
        /// <!-- FishyJoes.export(mergeAttributes) -->
        void mergeAttributes(const AttributeContainer &attributes, const std::optional<AttributedString::AttributeMergePolicy> &mergePolicy = nil);
        
        /// <!-- FishyJoes.export(replaceAttributes) -->
        void replaceAttributes(const AttributeContainer &attributes, const AttributeContainer /* with */ &others);
        
        /// <!-- FishyJoes.export(base) -->
        AttributedString getBase() const;
        
        /// <!-- FishyJoes.export(startIndex) -->
        AttributedString::Index getStartIndex() const;
        
        /// <!-- FishyJoes.export(endIndex) -->
        AttributedString::Index getEndIndex() const;
        
        /// <!-- FishyJoes.export(unicodeScalars) -->
        AttributedString::UnicodeScalarView getUnicodeScalars() const;
        
        /// <!-- FishyJoes.export(characters) -->
        AttributedString::CharacterView getCharacters() const;
        
        /// <!-- FishyJoes.export(runs) -->
        AttributedString::Runs getRuns() const;
        
        /// <!-- FishyJoes.export(substring) -->
        AttributedSubstring getSubstring() const;
        
        
        /*  Data  */
        private:
        /// Reference to Swift-managed data
        FishyJoesInternal::SwiftReference _ref;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
