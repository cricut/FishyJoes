#pragma once
#include "TestAPI_pre.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.exportReference(DefaultArguments) -->
    class DefaultArguments {
        /*  Complete Constructor  */
        private:
        /// Create new DefaultArguments (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        DefaultArguments(const FishyJoesInternal::SwiftReference &_ref);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(echoDefaults) -->
        static std::string echoDefaults(const std::optional<int> &y = nil, const std::optional<int> &x, const double &z = 3.14);
        
        
        /*  Data  */
        private:
        /// Reference to Swift-managed data
        FishyJoesInternal::SwiftReference _ref;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
