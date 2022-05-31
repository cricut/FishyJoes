#include "shared_impl.hpp"
namespace TestAPI {
    Primitives::PrimitiveHolder::PrimitiveHolder(const bool &b, const std::optional<bool> &bq, const uint8_t &ui8, const std::optional<uint8_t> &ui8q, const uint16_t &ui16, const std::optional<uint16_t> &ui16q, const uint32_t &ui32, const std::optional<uint32_t> &ui32q, const uint64_t &ui64, const std::optional<uint64_t> &ui64q, const int8_t &i8, const std::optional<int8_t> &i8q, const int16_t &i16, const std::optional<int16_t> &i16q, const int32_t &i32, const std::optional<int32_t> &i32q, const int64_t &i64, const std::optional<int64_t> &i64q, const float &f, const std::optional<float> &fq, const double &d, const std::optional<double> &dq): b(b), bq(bq), ui8(ui8), ui8q(ui8q), ui16(ui16), ui16q(ui16q), ui32(ui32), ui32q(ui32q), ui64(ui64), ui64q(ui64q), i8(i8), i8q(i8q), i16(i16), i16q(i16q), i32(i32), i32q(i32q), i64(i64), i64q(i64q), f(f), fq(fq), d(d), dq(dq){}
    std::vector<std::optional<uint8_t>> Primitives::PrimitiveHolder::getStaticPropery() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<uint8_t>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_PrimitiveHolder_getStaticPropery());
    }
    std::vector<std::optional<uint8_t>> Primitives::PrimitiveHolder::getStaticMutablePropery() {
        return FishyJoesInternal::Packer::unpack<std::vector<std::optional<uint8_t>>>(FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_PrimitiveHolder_getStaticMutablePropery());
    }
    void Primitives::PrimitiveHolder::setStaticMutablePropery(const std::vector<std::optional<uint8_t>> &newVal) {
        FishyJoesInternal::CBindings::FJInternalBinding_TestAPI_Primitives_PrimitiveHolder_setStaticMutablePropery(FishyJoesInternal::Packer::pack(newVal).ptr());
    }
}
