#pragma once
#include "TestAPI_pre.hpp"
#include "AttributeContainer.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.exportReference(AttributeContainer) -->
    class AttributeContainerASDF {
        /*  Complete Constructor  */
        private:
        /// Create new AttributeContainerASDF (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        AttributeContainerASDF(const FishyJoesInternal::SwiftReference &_ref);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(createEmpty) -->
        static AttributeContainer createEmpty();
        
        
        /*  Data  */
        private:
        /// Reference to Swift-managed data
        FishyJoesInternal::SwiftReference _ref;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
