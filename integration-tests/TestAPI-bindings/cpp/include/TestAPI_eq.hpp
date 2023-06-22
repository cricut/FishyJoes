#include <functional>
template <> struct std::hash<TestAPI::FishyJoesInternal::SwiftReference> {
    size_t operator()(const TestAPI::FishyJoesInternal::SwiftReference& ref) {
        return (size_t)TestAPI::FishyJoesInternal::TestAPI_swift_hash(ref.ref.get());
    }
};
inline bool operator==(const TestAPI::FishyJoesInternal::SwiftReference& ref1, const TestAPI::FishyJoesInternal::SwiftReference& ref2) {
    return TestAPI::FishyJoesInternal::TestAPI_swift_check_equality(ref1.ref.get(), ref2.ref.get());
}
template <> struct std::hash<TestAPI::AssociatedDataEnum> {
    size_t operator()(const TestAPI::AssociatedDataEnum &obj) const;
};
namespace TestAPI {
    inline bool operator==(const AssociatedDataEnum& lhs, const AssociatedDataEnum& rhs);
}
template <> struct std::hash<TestAPI::AssociatedDataEnum::bar> {
    size_t operator()(const TestAPI::AssociatedDataEnum::bar &obj) const;
};
namespace TestAPI {
    inline bool operator==(const AssociatedDataEnum::bar& lhs, const AssociatedDataEnum::bar& rhs);
}
template <> struct std::hash<TestAPI::AssociatedDataEnum::noValue> {
    size_t operator()(const TestAPI::AssociatedDataEnum::noValue &obj) const;
};
namespace TestAPI {
    inline bool operator==(const AssociatedDataEnum::noValue& lhs, const AssociatedDataEnum::noValue& rhs);
}
template <> struct std::hash<TestAPI::AssociatedDataEnum::other> {
    size_t operator()(const TestAPI::AssociatedDataEnum::other &obj) const;
};
namespace TestAPI {
    inline bool operator==(const AssociatedDataEnum::other& lhs, const AssociatedDataEnum::other& rhs);
}
template <> struct std::hash<TestAPI::AssociatedDataEnum::simpleEnum> {
    size_t operator()(const TestAPI::AssociatedDataEnum::simpleEnum &obj) const;
};
namespace TestAPI {
    inline bool operator==(const AssociatedDataEnum::simpleEnum& lhs, const AssociatedDataEnum::simpleEnum& rhs);
}
template <> struct std::hash<TestAPI::AssociatedDataEnum::thing> {
    size_t operator()(const TestAPI::AssociatedDataEnum::thing &obj) const;
};
namespace TestAPI {
    inline bool operator==(const AssociatedDataEnum::thing& lhs, const AssociatedDataEnum::thing& rhs);
}
template <> struct std::hash<TestAPI::AttributedStringASDF> {
    size_t operator()(const TestAPI::AttributedStringASDF &obj) const;
};
namespace TestAPI {
    inline bool operator==(const AttributedStringASDF& lhs, const AttributedStringASDF& rhs);
}
template <> struct std::hash<TestAPI::AttributedStringASDF::AttributeMergePolicy> {
    size_t operator()(const TestAPI::AttributedStringASDF::AttributeMergePolicy &obj) const;
};
namespace TestAPI {
    inline bool operator==(const AttributedStringASDF::AttributeMergePolicy& lhs, const AttributedStringASDF::AttributeMergePolicy& rhs);
}
template <> struct std::hash<TestAPI::AttributedStringASDF::AttributeMergePolicy::keepCurrent> {
    size_t operator()(const TestAPI::AttributedStringASDF::AttributeMergePolicy::keepCurrent &obj) const;
};
namespace TestAPI {
    inline bool operator==(const AttributedStringASDF::AttributeMergePolicy::keepCurrent& lhs, const AttributedStringASDF::AttributeMergePolicy::keepCurrent& rhs);
}
template <> struct std::hash<TestAPI::AttributedStringASDF::AttributeMergePolicy::keepNew> {
    size_t operator()(const TestAPI::AttributedStringASDF::AttributeMergePolicy::keepNew &obj) const;
};
namespace TestAPI {
    inline bool operator==(const AttributedStringASDF::AttributeMergePolicy::keepNew& lhs, const AttributedStringASDF::AttributeMergePolicy::keepNew& rhs);
}
template <> struct std::hash<TestAPI::AttributedStrings> {
    size_t operator()(const TestAPI::AttributedStrings &obj) const;
};
namespace TestAPI {
    inline bool operator==(const AttributedStrings& lhs, const AttributedStrings& rhs);
}
template <> struct std::hash<TestAPI::AttributedSubstringASDF> {
    size_t operator()(const TestAPI::AttributedSubstringASDF &obj) const;
};
namespace TestAPI {
    inline bool operator==(const AttributedSubstringASDF& lhs, const AttributedSubstringASDF& rhs);
}
template <> struct std::hash<TestAPI::Bytes> {
    size_t operator()(const TestAPI::Bytes &obj) const;
};
namespace TestAPI {
    inline bool operator==(const Bytes& lhs, const Bytes& rhs);
}
template <> struct std::hash<TestAPI::ClosedRanges> {
    size_t operator()(const TestAPI::ClosedRanges &obj) const;
};
namespace TestAPI {
    inline bool operator==(const ClosedRanges& lhs, const ClosedRanges& rhs);
}
template <> struct std::hash<TestAPI::Collections> {
    size_t operator()(const TestAPI::Collections &obj) const;
};
namespace TestAPI {
    inline bool operator==(const Collections& lhs, const Collections& rhs);
}
template <> struct std::hash<TestAPI::DefaultArguments> {
    size_t operator()(const TestAPI::DefaultArguments &obj) const;
};
namespace TestAPI {
    inline bool operator==(const DefaultArguments& lhs, const DefaultArguments& rhs);
}
template <> struct std::hash<TestAPI::Deprecations> {
    size_t operator()(const TestAPI::Deprecations &obj) const;
};
namespace TestAPI {
    inline bool operator==(const Deprecations& lhs, const Deprecations& rhs);
}
template <> struct std::hash<TestAPI::EmptyEnum> {
    size_t operator()(const TestAPI::EmptyEnum &obj) const;
};
namespace TestAPI {
    inline bool operator==(const EmptyEnum& lhs, const EmptyEnum& rhs);
}
template <> struct std::hash<TestAPI::Functions> {
    size_t operator()(const TestAPI::Functions &obj) const;
};
namespace TestAPI {
    inline bool operator==(const Functions& lhs, const Functions& rhs);
}
template <> struct std::hash<TestAPI::Primitives> {
    size_t operator()(const TestAPI::Primitives &obj) const;
};
namespace TestAPI {
    inline bool operator==(const Primitives& lhs, const Primitives& rhs);
}
template <> struct std::hash<TestAPI::Primitives::PrimitiveHolder> {
    size_t operator()(const TestAPI::Primitives::PrimitiveHolder &obj) const;
};
namespace TestAPI {
    inline bool operator==(const Primitives::PrimitiveHolder& lhs, const Primitives::PrimitiveHolder& rhs);
}
template <> struct std::hash<TestAPI::Ranges> {
    size_t operator()(const TestAPI::Ranges &obj) const;
};
namespace TestAPI {
    inline bool operator==(const Ranges& lhs, const Ranges& rhs);
}
template <> struct std::hash<TestAPI::SimpleEnum> {
    size_t operator()(const TestAPI::SimpleEnum &obj) const;
};
namespace TestAPI {
    inline bool operator==(const SimpleEnum& lhs, const SimpleEnum& rhs);
}
template <> struct std::hash<TestAPI::SimpleEnum::blue> {
    size_t operator()(const TestAPI::SimpleEnum::blue &obj) const;
};
namespace TestAPI {
    inline bool operator==(const SimpleEnum::blue& lhs, const SimpleEnum::blue& rhs);
}
template <> struct std::hash<TestAPI::SimpleEnum::green> {
    size_t operator()(const TestAPI::SimpleEnum::green &obj) const;
};
namespace TestAPI {
    inline bool operator==(const SimpleEnum::green& lhs, const SimpleEnum::green& rhs);
}
template <> struct std::hash<TestAPI::SimpleEnum::red> {
    size_t operator()(const TestAPI::SimpleEnum::red &obj) const;
};
namespace TestAPI {
    inline bool operator==(const SimpleEnum::red& lhs, const SimpleEnum::red& rhs);
}
template <> struct std::hash<TestAPI::Strings> {
    size_t operator()(const TestAPI::Strings &obj) const;
};
namespace TestAPI {
    inline bool operator==(const Strings& lhs, const Strings& rhs);
}
template <> struct std::hash<TestAPI::Structs> {
    size_t operator()(const TestAPI::Structs &obj) const;
};
namespace TestAPI {
    inline bool operator==(const Structs& lhs, const Structs& rhs);
}
template <> struct std::hash<TestAPI::Structs::MemberwiseStruct> {
    size_t operator()(const TestAPI::Structs::MemberwiseStruct &obj) const;
};
namespace TestAPI {
    inline bool operator==(const Structs::MemberwiseStruct& lhs, const Structs::MemberwiseStruct& rhs);
}
template <> struct std::hash<TestAPI::Structs::ReferenceStruct> {
    size_t operator()(const TestAPI::Structs::ReferenceStruct &obj) const;
};
namespace TestAPI {
    inline bool operator==(const Structs::ReferenceStruct& lhs, const Structs::ReferenceStruct& rhs);
}
template <> struct std::hash<TestAPI::Tuples> {
    size_t operator()(const TestAPI::Tuples &obj) const;
};
namespace TestAPI {
    inline bool operator==(const Tuples& lhs, const Tuples& rhs);
}
size_t std::hash<TestAPI::AssociatedDataEnum>::operator()(const TestAPI::AssociatedDataEnum &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::AssociatedDataEnum::bar>::operator()(const TestAPI::AssociatedDataEnum::bar &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.named);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._1);
    return ret;
}
size_t std::hash<TestAPI::AssociatedDataEnum::noValue>::operator()(const TestAPI::AssociatedDataEnum::noValue &obj) const {
    size_t ret = 0;
    return ret;
}
size_t std::hash<TestAPI::AssociatedDataEnum::other>::operator()(const TestAPI::AssociatedDataEnum::other &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.unnamed);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._1);
    return ret;
}
size_t std::hash<TestAPI::AssociatedDataEnum::simpleEnum>::operator()(const TestAPI::AssociatedDataEnum::simpleEnum &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.value);
    return ret;
}
size_t std::hash<TestAPI::AssociatedDataEnum::thing>::operator()(const TestAPI::AssociatedDataEnum::thing &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.value);
    return ret;
}
size_t std::hash<TestAPI::AttributedStringASDF>::operator()(const TestAPI::AttributedStringASDF &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._ref);
    return ret;
}
size_t std::hash<TestAPI::AttributedStringASDF::AttributeMergePolicy>::operator()(const TestAPI::AttributedStringASDF::AttributeMergePolicy &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::AttributedStringASDF::AttributeMergePolicy::keepCurrent>::operator()(const TestAPI::AttributedStringASDF::AttributeMergePolicy::keepCurrent &obj) const {
    size_t ret = 0;
    return ret;
}
size_t std::hash<TestAPI::AttributedStringASDF::AttributeMergePolicy::keepNew>::operator()(const TestAPI::AttributedStringASDF::AttributeMergePolicy::keepNew &obj) const {
    size_t ret = 0;
    return ret;
}
size_t std::hash<TestAPI::AttributedStrings>::operator()(const TestAPI::AttributedStrings &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::AttributedSubstringASDF>::operator()(const TestAPI::AttributedSubstringASDF &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._ref);
    return ret;
}
size_t std::hash<TestAPI::Bytes>::operator()(const TestAPI::Bytes &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::ClosedRanges>::operator()(const TestAPI::ClosedRanges &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::Collections>::operator()(const TestAPI::Collections &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::DefaultArguments>::operator()(const TestAPI::DefaultArguments &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::Deprecations>::operator()(const TestAPI::Deprecations &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::EmptyEnum>::operator()(const TestAPI::EmptyEnum &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::Functions>::operator()(const TestAPI::Functions &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::Primitives>::operator()(const TestAPI::Primitives &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::Primitives::PrimitiveHolder>::operator()(const TestAPI::Primitives::PrimitiveHolder &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.b);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.bq);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.ui8);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.ui8q);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.ui16);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.ui16q);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.ui32);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.ui32q);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.ui64);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.ui64q);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.ui);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.uiq);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.i8);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.i8q);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.i16);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.i16q);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.i32);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.i32q);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.i64);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.i64q);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.i);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.iq);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.f);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.fq);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.d);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.dq);
    return ret;
}
size_t std::hash<TestAPI::Ranges>::operator()(const TestAPI::Ranges &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::SimpleEnum>::operator()(const TestAPI::SimpleEnum &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::SimpleEnum::blue>::operator()(const TestAPI::SimpleEnum::blue &obj) const {
    size_t ret = 0;
    return ret;
}
size_t std::hash<TestAPI::SimpleEnum::green>::operator()(const TestAPI::SimpleEnum::green &obj) const {
    size_t ret = 0;
    return ret;
}
size_t std::hash<TestAPI::SimpleEnum::red>::operator()(const TestAPI::SimpleEnum::red &obj) const {
    size_t ret = 0;
    return ret;
}
size_t std::hash<TestAPI::Strings>::operator()(const TestAPI::Strings &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::Structs>::operator()(const TestAPI::Structs &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
size_t std::hash<TestAPI::Structs::MemberwiseStruct>::operator()(const TestAPI::Structs::MemberwiseStruct &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.immutable);
    TestAPI::FishyJoesInternal::hashCombine(ret, obj.mutable);
    return ret;
}
size_t std::hash<TestAPI::Structs::ReferenceStruct>::operator()(const TestAPI::Structs::ReferenceStruct &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._ref);
    return ret;
}
size_t std::hash<TestAPI::Tuples>::operator()(const TestAPI::Tuples &obj) const {
    size_t ret = 0;
    TestAPI::FishyJoesInternal::hashCombine(ret, obj._variant);
    return ret;
}
namespace TestAPI {
    inline bool operator==(const AssociatedDataEnum& lhs, const AssociatedDataEnum& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const AssociatedDataEnum::bar& lhs, const AssociatedDataEnum::bar& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const AssociatedDataEnum::noValue& lhs, const AssociatedDataEnum::noValue& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const AssociatedDataEnum::other& lhs, const AssociatedDataEnum::other& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const AssociatedDataEnum::simpleEnum& lhs, const AssociatedDataEnum::simpleEnum& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const AssociatedDataEnum::thing& lhs, const AssociatedDataEnum::thing& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const AttributedStringASDF& lhs, const AttributedStringASDF& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const AttributedStringASDF::AttributeMergePolicy& lhs, const AttributedStringASDF::AttributeMergePolicy& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const AttributedStringASDF::AttributeMergePolicy::keepCurrent& lhs, const AttributedStringASDF::AttributeMergePolicy::keepCurrent& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const AttributedStringASDF::AttributeMergePolicy::keepNew& lhs, const AttributedStringASDF::AttributeMergePolicy::keepNew& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const AttributedStrings& lhs, const AttributedStrings& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const AttributedSubstringASDF& lhs, const AttributedSubstringASDF& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const Bytes& lhs, const Bytes& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const ClosedRanges& lhs, const ClosedRanges& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const Collections& lhs, const Collections& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const DefaultArguments& lhs, const DefaultArguments& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const Deprecations& lhs, const Deprecations& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const EmptyEnum& lhs, const EmptyEnum& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const Functions& lhs, const Functions& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const Primitives& lhs, const Primitives& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const Primitives::PrimitiveHolder& lhs, const Primitives::PrimitiveHolder& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const Ranges& lhs, const Ranges& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const SimpleEnum& lhs, const SimpleEnum& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const SimpleEnum::blue& lhs, const SimpleEnum::blue& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const SimpleEnum::green& lhs, const SimpleEnum::green& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const SimpleEnum::red& lhs, const SimpleEnum::red& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const Strings& lhs, const Strings& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const Structs& lhs, const Structs& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const Structs::MemberwiseStruct& lhs, const Structs::MemberwiseStruct& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const Structs::ReferenceStruct& lhs, const Structs::ReferenceStruct& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
namespace TestAPI {
    inline bool operator==(const Tuples& lhs, const Tuples& rhs) {
        return std::equal_to<std::decay_t<decltype(lhs)>>()(lhs, rhs);
    }
}
