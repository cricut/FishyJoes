#pragma once
#include "TestAPI_pre.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.exportReference(AttributeScope) -->
    class AttributeScopeASDF {
        /*  Complete Constructor  */
        private:
        /// Create new AttributeScopeASDF (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        AttributeScopeASDF(const FishyJoesInternal::SwiftReference &_ref);
        
        /*  Methods  */
        
        /*  Data  */
        private:
        /// Reference to Swift-managed data
        FishyJoesInternal::SwiftReference _ref;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
