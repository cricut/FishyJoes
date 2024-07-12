// ignore_for_file: unused_import
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: library_prefixes
// ignore_for_file: file_names
// ignore_for_file: annotate_overrides

/// <!-- FishyJoes.export(TestDefaultComputedPropertiesEnum) -->
sealed class TestDefaultComputedPropertiesEnum implements TestAPI.TestDefaultComputedProperties {
    const factory TestDefaultComputedPropertiesEnum.qux(
    ) = TestDefaultComputedPropertiesEnum_Qux;

    const TestDefaultComputedPropertiesEnum();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        final peekedObj = peekRef<TestDefaultComputedPropertiesEnum>(obj);
        if (peekedObj is TestDefaultComputedPropertiesEnum_Qux) { return 0; }
        else { throw UnsupportedError('Unknown TestDefaultComputedPropertiesEnum subclass'); }
    });

    static CreatedRef newQux(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(TestDefaultComputedPropertiesEnum_Qux(
        ))
    );

    static void extractQux(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<TestDefaultComputedPropertiesEnum_Qux>(obj);
        });
    }

    /// <!-- FishyJoes.export(noot) -->
    int get noot =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_noot(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(plutonic) -->
    String get plutonic =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota__default_TestAPI_TestDefaultComputedPropertiesEnum_plutonic(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(spam) -->
    bool get spam =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_spam(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota__default_TestAPI_TestDefaultComputedPropertiesEnum_plutonic;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_noot;
    static late bool Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestDefaultComputedPropertiesEnum_spam;
}

class TestDefaultComputedPropertiesEnum_Qux extends TestDefaultComputedPropertiesEnum {
    const TestDefaultComputedPropertiesEnum_Qux();

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is TestDefaultComputedPropertiesEnum_Qux
    );

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'TestDefaultComputedPropertiesEnum.qux()';

    TestDefaultComputedPropertiesEnum_Qux copyWith() => TestDefaultComputedPropertiesEnum_Qux();
}

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
import './EmptyClass1.dart' as TestAPI;
import './EmptyClass2.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './EmptyStruct.dart' as TestAPI;
import './EmptyStruct2.dart' as TestAPI;
import './ExternalWitness_AProtocol.dart' as TestAPI;
import './ExternalWitness_TestAsyncFunctions.dart' as TestAPI;
import './ExternalWitness_TestDefaultComputedProperties.dart' as TestAPI;
import './ExternalWitness_TestDifferingExportNameProtocolDiffy.dart' as TestAPI;
import './ExternalWitness_TestLeadingUnderscoredProp.dart' as TestAPI;
import './ExternalWitness_TestMethodsProtocol.dart' as TestAPI;
import './ExternalWitness_TestOptionalsProtocol.dart' as TestAPI;
import './ExternalWitness_TestPropertiesProtocol.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Methods.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Ranges.dart' as TestAPI;
import './Results.dart' as TestAPI;
import './Results_Error.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MutableStruct.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
import './TestAsyncForeignSideFunctionsStruct.dart' as TestAPI;
import './TestAsyncFunctions.dart' as TestAPI;
import './TestAsyncSwiftSideFunctionsClass.dart' as TestAPI;
import './TestDefaultComputedProperties.dart' as TestAPI;
import './TestDefaultComputedPropertiesEnum.dart' as TestAPI;
import './TestDefaultComputedPropertiesReference.dart' as TestAPI;
import './TestDefaultComputedPropertiesStruct.dart' as TestAPI;
import './TestDifferingExportNameProtocolDiffy.dart' as TestAPI;
import './TestDifferingExportNameStruct.dart' as TestAPI;
import './TestLeadingUnderscoredProp.dart' as TestAPI;
import './TestLeadingUnderscoredPropStruct.dart' as TestAPI;
import './TestMethodsProtocol.dart' as TestAPI;
import './TestNonExportedProtocolEnum.dart' as TestAPI;
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
