#pragma once
#include "TestAPI_pre.hpp"
#include "AttributeContainer.hpp"
#include "AttributedString.hpp"
#include "AttributedSubstring.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.exportReference(AttributedString) -->
    class AttributedStringASDF {
        /*  Inner Classes  */
        public:
        class AttributeMergePolicy;
        class CharacterView;
        class Index;
        class Runs;
        class UnicodeScalarView;
        /// <!-- FishyJoes.exportReference(AttributedString.AttributeMergePolicy) -->
        class AttributeMergePolicy {
            /*  Complete Constructor  */
            private:
            /// Create new AttributeMergePolicy (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
            AttributeMergePolicy(const FishyJoesInternal::SwiftReference &_ref);
            
            /*  Methods  */
            
            /*  Data  */
            private:
            /// Reference to Swift-managed data
            FishyJoesInternal::SwiftReference _ref;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        /// <!-- FishyJoes.exportReference(AttributedString.CharacterView) -->
        class CharacterView {
            /*  Complete Constructor  */
            private:
            /// Create new CharacterView (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
            CharacterView(const FishyJoesInternal::SwiftReference &_ref);
            
            /*  Methods  */
            public:
            /// <!-- FishyJoes.export(indexBefore) -->
            AttributedString::Index indexBefore(const AttributedString::Index /* before */ &i) const;
            
            /// <!-- FishyJoes.export(indexAfter) -->
            AttributedString::Index indexAfter(const AttributedString::Index /* after */ &i) const;
            
            /// <!-- FishyJoes.export(elementAt) -->
            std::string elementAt(const AttributedString::Index /* at */ &index) const;
            
            /// <!-- FishyJoes.export(replaceSubrange, generic: [C: [String]]) -->
            void replaceSubrange(const std::ranges::range<AttributedString::Index> &subrange, const std::vector<std::string> /* with */ &newElements);
            
            /// <!-- FishyJoes.export(startIndex) -->
            AttributedString::Index getStartIndex() const;
            
            /// <!-- FishyJoes.export(endIndex) -->
            AttributedString::Index getEndIndex() const;
            
            
            /*  Data  */
            private:
            /// Reference to Swift-managed data
            FishyJoesInternal::SwiftReference _ref;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        /// <!-- FishyJoes.exportReference(AttributedString.Index) -->
        class Index {
            /*  Complete Constructor  */
            private:
            /// Create new Index (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
            Index(const FishyJoesInternal::SwiftReference &_ref);
            
            /*  Methods  */
            
            /*  Data  */
            private:
            /// Reference to Swift-managed data
            FishyJoesInternal::SwiftReference _ref;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        /// <!-- FishyJoes.exportReference(AttributedString.Runs) -->
        class Runs {
            /*  Inner Classes  */
            public:
            class Index;
            class Run;
            /// <!-- FishyJoes.exportReference(AttributedString.Runs.Index) -->
            class Index {
                /*  Complete Constructor  */
                private:
                /// Create new Index (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
                Index(const FishyJoesInternal::SwiftReference &_ref);
                
                /*  Methods  */
                
                /*  Data  */
                private:
                /// Reference to Swift-managed data
                FishyJoesInternal::SwiftReference _ref;
                
                friend struct FishyJoesInternal::Packer;
                template <typename T> friend struct std::hash;
                template <typename T> friend struct std::equal_to;
            };
            /// <!-- FishyJoes.exportReference(AttributedString.Runs.Run) -->
            class Run {
                /*  Complete Constructor  */
                private:
                /// Create new Run (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
                Run(const FishyJoesInternal::SwiftReference &_ref);
                
                /*  Methods  */
                public:
                /// <!-- FishyJoes.export(range) -->
                std::ranges::range<AttributedString::Index> getRange() const;
                
                /// <!-- FishyJoes.export(attributes) -->
                AttributeContainer getAttributes() const;
                
                
                /*  Data  */
                private:
                /// Reference to Swift-managed data
                FishyJoesInternal::SwiftReference _ref;
                
                friend struct FishyJoesInternal::Packer;
                template <typename T> friend struct std::hash;
                template <typename T> friend struct std::equal_to;
            };
            
            /*  Complete Constructor  */
            private:
            /// Create new Runs (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
            Runs(const FishyJoesInternal::SwiftReference &_ref);
            
            /*  Methods  */
            public:
            /// <!-- FishyJoes.export(indexBefore) -->
            AttributedString::Runs::Index indexBefore(const AttributedString::Runs::Index /* before */ &i) const;
            
            /// <!-- FishyJoes.export(indexAfter) -->
            AttributedString::Runs::Index indexAfter(const AttributedString::Runs::Index /* after */ &i) const;
            
            /// <!-- FishyJoes.export(elementAt) -->
            AttributedString::Runs::Run elementAt(const AttributedString::Runs::Index /* at */ &index) const;
            
            /// <!-- FishyJoes.export(elementAtPosition) -->
            AttributedString::Runs::Run elementAtPosition(const AttributedString::Index /* at */ &index) const;
            
            /// <!-- FishyJoes.export(startIndex) -->
            AttributedString::Runs::Index getStartIndex() const;
            
            /// <!-- FishyJoes.export(endIndex) -->
            AttributedString::Runs::Index getEndIndex() const;
            
            
            /*  Data  */
            private:
            /// Reference to Swift-managed data
            FishyJoesInternal::SwiftReference _ref;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        /// <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView) -->
        class UnicodeScalarView {
            /*  Complete Constructor  */
            private:
            /// Create new UnicodeScalarView (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
            UnicodeScalarView(const FishyJoesInternal::SwiftReference &_ref);
            
            /*  Methods  */
            public:
            /// <!-- FishyJoes.export(indexBefore) -->
            AttributedString::Index indexBefore(const AttributedString::Index /* before */ &i) const;
            
            /// <!-- FishyJoes.export(indexAfter) -->
            AttributedString::Index indexAfter(const AttributedString::Index /* after */ &i) const;
            
            /// <!-- FishyJoes.export(indexOffsetByDistance) -->
            AttributedString::Index indexOffsetByDistance(const AttributedString::Index &i, const int /* offsetBy */ &distance) const;
            
            /// <!-- FishyJoes.export(elementAt) -->
            uint32_t elementAt(const AttributedString::Index /* at */ &index) const;
            
            /// <!-- FishyJoes.export(replaceSubrange, generic: [C: [UInt32]]) -->
            void replaceSubrange(const std::ranges::range<AttributedString::Index> &subrange, const std::vector<uint32_t> /* with */ &newElements);
            
            /// <!-- FishyJoes.export(startIndex) -->
            AttributedString::Index getStartIndex() const;
            
            /// <!-- FishyJoes.export(endIndex) -->
            AttributedString::Index getEndIndex() const;
            
            
            /*  Data  */
            private:
            /// Reference to Swift-managed data
            FishyJoesInternal::SwiftReference _ref;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        
        /*  Complete Constructor  */
        private:
        /// Create new AttributedStringASDF (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        AttributedStringASDF(const FishyJoesInternal::SwiftReference &_ref);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(createEmpty) -->
        static AttributedString createEmpty();
        
        /// <!-- FishyJoes.export(create) -->
        static AttributedString create(const std::string &string, const std::optional<AttributeContainer> &attributes = nil);
        
        /// <!-- FishyJoes.export(createFromSubstring) -->
        static AttributedString createFromSubstring(const AttributedSubstring &substring);
        
        /// <!-- FishyJoes.export(substringForRange) -->
        AttributedSubstring substringForRange(const std::ranges::range<AttributedString::Index> /* for */ &range) const;
        
        /// <!-- FishyJoes.export(append) -->
        void append(const AttributedString &s);
        
        /// <!-- FishyJoes.export(insert) -->
        void insert(const AttributedString &s, const AttributedString::Index /* at */ &index);
        
        /// <!-- FishyJoes.export(removeSubrange) -->
        void removeSubrange(const std::ranges::range<AttributedString::Index> &range);
        
        /// <!-- FishyJoes.export(replaceSubrange) -->
        void replaceSubrange(const std::ranges::range<AttributedString::Index> &range, const AttributedString /* with */ &s);
        
        /// <!-- FishyJoes.export(setAttributes) -->
        void setAttributes(const AttributeContainer &attributes);
        
        /// <!-- FishyJoes.export(mergeAttributes) -->
        void mergeAttributes(const AttributeContainer &attributes, const std::optional<AttributedString::AttributeMergePolicy> &mergePolicy = nil);
        
        /// <!-- FishyJoes.export(replaceAttributes) -->
        void replaceAttributes(const AttributeContainer &attributes, const AttributeContainer /* with */ &others);
        
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
