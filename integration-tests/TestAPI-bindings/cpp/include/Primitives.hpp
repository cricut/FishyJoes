#pragma once
#include "TestAPI_pre.hpp"
#include "Primitives.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.exportReference(Primitives) -->
    class Primitives {
        /*  Inner Classes  */
        public:
        class PrimitiveHolder;
        /// <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
        class PrimitiveHolder {
            /*  Complete Constructor  */
            public:
            /// Create new PrimitiveHolder
            PrimitiveHolder(const bool &b, const std::optional<bool> &bq, const uint8_t &ui8, const std::optional<uint8_t> &ui8q, const uint16_t &ui16, const std::optional<uint16_t> &ui16q, const uint32_t &ui32, const std::optional<uint32_t> &ui32q, const uint64_t &ui64, const std::optional<uint64_t> &ui64q, const int8_t &i8, const std::optional<int8_t> &i8q, const int16_t &i16, const std::optional<int16_t> &i16q, const int32_t &i32, const std::optional<int32_t> &i32q, const int64_t &i64, const std::optional<int64_t> &i64q, const float &f, const std::optional<float> &fq, const double &d, const std::optional<double> &dq);
            
            /*  Methods  */
            public:
            /// <!-- FishyJoes.export(staticPropery) -->
            static std::vector<std::optional<uint8_t>> getStaticPropery();
            
            /// <!-- FishyJoes.export(staticMutablePropery) -->
            static std::vector<std::optional<uint8_t>> getStaticMutablePropery();
            
            /// <!-- FishyJoes.export(staticMutablePropery) -->
            static void setStaticMutablePropery(const std::vector<std::optional<uint8_t>> &newVal);
            
            
            /*  Data  */
            public:
            bool b;
            std::optional<bool> bq;
            uint8_t ui8;
            std::optional<uint8_t> ui8q;
            uint16_t ui16;
            std::optional<uint16_t> ui16q;
            uint32_t ui32;
            std::optional<uint32_t> ui32q;
            uint64_t ui64;
            std::optional<uint64_t> ui64q;
            int8_t i8;
            std::optional<int8_t> i8q;
            int16_t i16;
            std::optional<int16_t> i16q;
            int32_t i32;
            std::optional<int32_t> i32q;
            int64_t i64;
            std::optional<int64_t> i64q;
            float f;
            std::optional<float> fq;
            double d;
            std::optional<double> dq;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        
        /*  Complete Constructor  */
        private:
        /// Create new Primitives (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        Primitives(const FishyJoesInternal::SwiftReference &_ref);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(echoBool) -->
        static bool echoBool(const bool &value);
        
        /// <!-- FishyJoes.export(echoUInt8) -->
        static uint8_t echoUInt8(const uint8_t &value);
        
        /// <!-- FishyJoes.export(echoUInt16) -->
        static uint16_t echoUInt16(const uint16_t &value);
        
        /// <!-- FishyJoes.export(echoUInt32) -->
        static uint32_t echoUInt32(const uint32_t &value);
        
        /// <!-- FishyJoes.export(echoUInt64) -->
        static uint64_t echoUInt64(const uint64_t &value);
        
        /// <!-- FishyJoes.export(echoInt8) -->
        static int8_t echoInt8(const int8_t &value);
        
        /// <!-- FishyJoes.export(echoInt16) -->
        static int16_t echoInt16(const int16_t &value);
        
        /// <!-- FishyJoes.export(echoInt32) -->
        static int32_t echoInt32(const int32_t &value);
        
        /// <!-- FishyJoes.export(echoInt64) -->
        static int64_t echoInt64(const int64_t &value);
        
        /// <!-- FishyJoes.export(echoFloat) -->
        static float echoFloat(const float &value);
        
        /// <!-- FishyJoes.export(echoDouble) -->
        static double echoDouble(const double &value);
        
        /// <!-- FishyJoes.export(maybeEchoBool) -->
        static std::optional<bool> maybeEchoBool(const std::optional<bool> &value);
        
        /// <!-- FishyJoes.export(maybeEchoUInt8) -->
        static std::optional<uint8_t> maybeEchoUInt8(const std::optional<uint8_t> &value);
        
        /// <!-- FishyJoes.export(maybeEchoUInt16) -->
        static std::optional<uint16_t> maybeEchoUInt16(const std::optional<uint16_t> &value);
        
        /// <!-- FishyJoes.export(maybeEchoUInt32) -->
        static std::optional<uint32_t> maybeEchoUInt32(const std::optional<uint32_t> &value);
        
        /// <!-- FishyJoes.export(maybeEchoUInt64) -->
        static std::optional<uint64_t> maybeEchoUInt64(const std::optional<uint64_t> &value);
        
        /// <!-- FishyJoes.export(maybeEchoInt8) -->
        static std::optional<int8_t> maybeEchoInt8(const std::optional<int8_t> &value);
        
        /// <!-- FishyJoes.export(maybeEchoInt16) -->
        static std::optional<int16_t> maybeEchoInt16(const std::optional<int16_t> &value);
        
        /// <!-- FishyJoes.export(maybeEchoInt32) -->
        static std::optional<int32_t> maybeEchoInt32(const std::optional<int32_t> &value);
        
        /// <!-- FishyJoes.export(maybeEchoInt64) -->
        static std::optional<int64_t> maybeEchoInt64(const std::optional<int64_t> &value);
        
        /// <!-- FishyJoes.export(maybeEchoFloat) -->
        static std::optional<float> maybeEchoFloat(const std::optional<float> &value);
        
        /// <!-- FishyJoes.export(maybeEchoDouble) -->
        static std::optional<double> maybeEchoDouble(const std::optional<double> &value);
        
        /// <!-- FishyJoes.export(valueMapper) -->
        static std::optional<uint8_t> valueMapper(const std::optional<uint8_t> &value, const std::function<std::optional<uint8_t>(std::optional<uint8_t>> &mapper);
        
        /// <!-- FishyJoes.export(falseBool) -->
        static bool getFalseBool();
        
        /// <!-- FishyJoes.export(trueBool) -->
        static bool getTrueBool();
        
        /// <!-- FishyJoes.export(zeroUInt8) -->
        static uint8_t getZeroUInt8();
        
        /// <!-- FishyJoes.export(minUInt8) -->
        static uint8_t getMinUInt8();
        
        /// <!-- FishyJoes.export(maxUInt8) -->
        static uint8_t getMaxUInt8();
        
        /// <!-- FishyJoes.export(zeroUInt16) -->
        static uint16_t getZeroUInt16();
        
        /// <!-- FishyJoes.export(minUInt16) -->
        static uint16_t getMinUInt16();
        
        /// <!-- FishyJoes.export(maxUInt16) -->
        static uint16_t getMaxUInt16();
        
        /// <!-- FishyJoes.export(zeroUInt32) -->
        static uint32_t getZeroUInt32();
        
        /// <!-- FishyJoes.export(minUInt32) -->
        static uint32_t getMinUInt32();
        
        /// <!-- FishyJoes.export(maxUInt32) -->
        static uint32_t getMaxUInt32();
        
        /// <!-- FishyJoes.export(zeroUInt64) -->
        static uint64_t getZeroUInt64();
        
        /// <!-- FishyJoes.export(minUInt64) -->
        static uint64_t getMinUInt64();
        
        /// <!-- FishyJoes.export(maxUInt64) -->
        static uint64_t getMaxUInt64();
        
        /// <!-- FishyJoes.export(zeroInt8) -->
        static int8_t getZeroInt8();
        
        /// <!-- FishyJoes.export(minInt8) -->
        static int8_t getMinInt8();
        
        /// <!-- FishyJoes.export(maxInt8) -->
        static int8_t getMaxInt8();
        
        /// <!-- FishyJoes.export(zeroInt16) -->
        static int16_t getZeroInt16();
        
        /// <!-- FishyJoes.export(minInt16) -->
        static int16_t getMinInt16();
        
        /// <!-- FishyJoes.export(maxInt16) -->
        static int16_t getMaxInt16();
        
        /// <!-- FishyJoes.export(zeroInt32) -->
        static int32_t getZeroInt32();
        
        /// <!-- FishyJoes.export(minInt32) -->
        static int32_t getMinInt32();
        
        /// <!-- FishyJoes.export(maxInt32) -->
        static int32_t getMaxInt32();
        
        /// <!-- FishyJoes.export(zeroInt64) -->
        static int64_t getZeroInt64();
        
        /// <!-- FishyJoes.export(minInt64) -->
        static int64_t getMinInt64();
        
        /// <!-- FishyJoes.export(maxInt64) -->
        static int64_t getMaxInt64();
        
        /// <!-- FishyJoes.export(zeroInt) -->
        static int getZeroInt();
        
        /// <!-- FishyJoes.export(minInt) -->
        static int getMinInt();
        
        /// <!-- FishyJoes.export(maxInt) -->
        static int getMaxInt();
        
        /// <!-- FishyJoes.export(zeroFloat) -->
        static float getZeroFloat();
        
        /// <!-- FishyJoes.export(minFloat) -->
        static float getMinFloat();
        
        /// <!-- FishyJoes.export(maxFloat) -->
        static float getMaxFloat();
        
        /// <!-- FishyJoes.export(zeroDouble) -->
        static double getZeroDouble();
        
        /// <!-- FishyJoes.export(minDouble) -->
        static double getMinDouble();
        
        /// <!-- FishyJoes.export(maxDouble) -->
        static double getMaxDouble();
        
        /// <!-- FishyJoes.export(manyBool) -->
        static std::vector<bool> getManyBool();
        
        /// <!-- FishyJoes.export(manyUInt8) -->
        static std::vector<uint8_t> getManyUInt8();
        
        /// <!-- FishyJoes.export(manyUInt16) -->
        static std::vector<uint16_t> getManyUInt16();
        
        /// <!-- FishyJoes.export(manyUInt32) -->
        static std::vector<uint32_t> getManyUInt32();
        
        /// <!-- FishyJoes.export(manyUInt64) -->
        static std::vector<uint64_t> getManyUInt64();
        
        /// <!-- FishyJoes.export(manyInt8) -->
        static std::vector<int8_t> getManyInt8();
        
        /// <!-- FishyJoes.export(manyInt16) -->
        static std::vector<int16_t> getManyInt16();
        
        /// <!-- FishyJoes.export(manyInt32) -->
        static std::vector<int32_t> getManyInt32();
        
        /// <!-- FishyJoes.export(manyInt64) -->
        static std::vector<int64_t> getManyInt64();
        
        /// <!-- FishyJoes.export(manyFloat) -->
        static std::vector<float> getManyFloat();
        
        /// <!-- FishyJoes.export(manyDouble) -->
        static std::vector<double> getManyDouble();
        
        /// <!-- FishyJoes.export(manyMaybeBool) -->
        static std::vector<std::optional<bool>> getManyMaybeBool();
        
        /// <!-- FishyJoes.export(manyMaybeUInt8) -->
        static std::vector<std::optional<uint8_t>> getManyMaybeUInt8();
        
        /// <!-- FishyJoes.export(manyMaybeUInt16) -->
        static std::vector<std::optional<uint16_t>> getManyMaybeUInt16();
        
        /// <!-- FishyJoes.export(manyMaybeUInt32) -->
        static std::vector<std::optional<uint32_t>> getManyMaybeUInt32();
        
        /// <!-- FishyJoes.export(manyMaybeUInt64) -->
        static std::vector<std::optional<uint64_t>> getManyMaybeUInt64();
        
        /// <!-- FishyJoes.export(manyMaybeInt8) -->
        static std::vector<std::optional<int8_t>> getManyMaybeInt8();
        
        /// <!-- FishyJoes.export(manyMaybeInt16) -->
        static std::vector<std::optional<int16_t>> getManyMaybeInt16();
        
        /// <!-- FishyJoes.export(manyMaybeInt32) -->
        static std::vector<std::optional<int32_t>> getManyMaybeInt32();
        
        /// <!-- FishyJoes.export(manyMaybeInt64) -->
        static std::vector<std::optional<int64_t>> getManyMaybeInt64();
        
        /// <!-- FishyJoes.export(manyMaybeFloat) -->
        static std::vector<std::optional<float>> getManyMaybeFloat();
        
        /// <!-- FishyJoes.export(manyMaybeDouble) -->
        static std::vector<std::optional<double>> getManyMaybeDouble();
        
        /// <!-- FishyJoes.export(defaultPrimitiveHolder) -->
        static Primitives::PrimitiveHolder getDefaultPrimitiveHolder();
        
        
        /*  Data  */
        private:
        /// Reference to Swift-managed data
        FishyJoesInternal::SwiftReference _ref;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
