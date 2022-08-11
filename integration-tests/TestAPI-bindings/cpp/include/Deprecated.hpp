#pragma once
#include "TestAPI_pre.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.exportReference(Deprecated) -->
    class Deprecated {
        /*  Complete Constructor  */
        private:
        /// Create new Deprecated (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        Deprecated(const FishyJoesInternal::SwiftReference &_ref);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(deprecatedMethod) -->
        static std::string deprecatedMethod();
        
        /// <!-- FishyJoes.export(deprecatedVariable) -->
        static int getDeprecatedVariable();
        
        
        /*  Data  */
        private:
        /// Reference to Swift-managed data
        FishyJoesInternal::SwiftReference _ref;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
