import './AProtocol.dart' as TestAPI;
import './AProtocolImplementation.dart' as TestAPI;
import './Actors.dart' as TestAPI;
import './Actors_TemperatureLogger.dart' as TestAPI;
import './AssociatedDataEnum.dart' as TestAPI;
import './AsyncFunctions.dart' as TestAPI;
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './AttributedStrings.dart' as TestAPI;
import './Bytes.dart' as TestAPI;
import './ClosedRanges.dart' as TestAPI;
import './Collections.dart' as TestAPI;
import './Collections_CollectionHolder.dart' as TestAPI;
import './DefaultArguments.dart' as TestAPI;
import './Deprecations.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './ExternalWitness_AProtocol.dart' as TestAPI;
import './ExternalWitness_TestLeadingUnderscoredProp.dart' as TestAPI;
import './ExternalWitness_TestMethodsProtocol.dart' as TestAPI;
import './ExternalWitness_TestOptionalsProtocol.dart' as TestAPI;
import './ExternalWitness_TestPropertiesProtocol.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Methods.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Ranges.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MutableStruct.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
import './TestLeadingUnderscoredProp.dart' as TestAPI;
import './TestLeadingUnderscoredPropStruct.dart' as TestAPI;
import './TestMethodsProtocol.dart' as TestAPI;
import './TestOptionalsProtocol.dart' as TestAPI;
import './TestPropertiesProtocol.dart' as TestAPI;
import './TestProtocolClass.dart' as TestAPI;
import './TestProtocolEnum.dart' as TestAPI;
import './TestProtocolStruct.dart' as TestAPI;
import './Tuples.dart' as TestAPI;
import './URLs.dart' as TestAPI;
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:tuple/tuple.dart' as tuple;

// ignore_for_file: unused_import
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: library_prefixes
// ignore_for_file: file_names
// ignore_for_file: annotate_overrides

/// <!-- FishyJoes.export(TestLeadingUnderscoredPropStruct, conformances: [TestLeadingUnderscoredProp]) -->
class TestLeadingUnderscoredPropStruct implements TestAPI.TestLeadingUnderscoredProp {
    String m_leadingUnderscoreProp;

    TestLeadingUnderscoredPropStruct({
        required String m_leadingUnderscoreProp
    }):
        this.m_leadingUnderscoreProp = m_leadingUnderscoreProp;

    static CreatedRef ffi_constructor(
        ConsumedRef m_leadingUnderscoreProp,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(TestLeadingUnderscoredPropStruct(
            m_leadingUnderscoreProp: consumeRef(m_leadingUnderscoreProp),
        ))
    );
    @override
    String toString() => 'TestLeadingUnderscoredPropStruct(m_leadingUnderscoreProp: $m_leadingUnderscoreProp)';

    static CreatedRef ffi_get__leadingUnderscoreProp(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestLeadingUnderscoredPropStruct>(obj).m_leadingUnderscoreProp
        )
    );
    static void ffi_set__leadingUnderscoreProp(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<TestLeadingUnderscoredPropStruct>(obj).m_leadingUnderscoreProp = consumeRef<String>(newValue);
    });

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is TestLeadingUnderscoredPropStruct &&
            (
                const DeepCollectionEquality().equals(other.m_leadingUnderscoreProp, m_leadingUnderscoreProp)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(m_leadingUnderscoreProp)
    );

    TestLeadingUnderscoredPropStruct copyWith({
        String? m_leadingUnderscoreProp
    }) => TestLeadingUnderscoredPropStruct(
        m_leadingUnderscoreProp: m_leadingUnderscoreProp ?? this.m_leadingUnderscoreProp
    );
}
