#pragma once
#include "TestAPI_pre.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.exportReference(Bytes) -->
    class Bytes {
        /*  Complete Constructor  */
        private:
        /// Create new Bytes (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        Bytes(const FishyJoesInternal::SwiftReference &_ref);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(echoBytes) -->
        static std::vector<uint8_t> echoBytes(const std::vector<uint8_t> &bytes);
        
        /// <!-- FishyJoes.export(echoData) -->
        static std::vector<uint8_t> echoData(const std::vector<uint8_t> &data);
        
        /// <!-- FishyJoes.export(bytes) -->
        static std::vector<uint8_t> getBytes();
        
        /// <!-- FishyJoes.export(data) -->
        static std::vector<uint8_t> getData();
        
        
        /*  Data  */
        private:
        /// Reference to Swift-managed data
        FishyJoesInternal::SwiftReference _ref;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
