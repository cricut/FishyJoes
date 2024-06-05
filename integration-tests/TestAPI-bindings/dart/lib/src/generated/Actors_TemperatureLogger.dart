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

/// <!-- FishyJoes.export(Actors.TemperatureLogger) -->
class Actors_TemperatureLogger extends SwiftReference {
    Actors_TemperatureLogger(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(Actors_TemperatureLogger(ref))
    );

    @override
    String toString() => 'Actors_TemperatureLogger(backwardsLabel: $backwardsLabel, extensionNonisolatedVarLabel: $extensionNonisolatedVarLabel, label: $label)';

    /// <!-- FishyJoes.export(backwardsLabel) -->
    String get backwardsLabel =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_Actors_TemperatureLogger_backwardsLabel(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(extensionNonisolatedVarLabel) -->
    String get extensionNonisolatedVarLabel =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_Actors_TemperatureLogger_extensionNonisolatedVarLabel(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(label) -->
    String get label =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_Actors_TemperatureLogger_label(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(create) -->
    static TestAPI.Actors_TemperatureLogger create(
        String label,
        int measurement,
    ) =>
        GCRef.using(label, (_labelHandle) =>
            consumeCreatedRef<TestAPI.Actors_TemperatureLogger>(check((OutCreatedRef _exn) => f__iota_TestAPI_Actors_TemperatureLogger_create(Loader.shared.env, _labelHandle.ptr, measurement, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(update) -->
    Future<void> update(
        int /* with */ measurement,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<void>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Actors_TemperatureLogger_update(Loader.shared.env, _thisHandle.ptr, measurement, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(min) -->
    Future<int> min(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<int>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Actors_TemperatureLogger_min(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(extensionIsolatedGetLabel) -->
    Future<String> extensionIsolatedGetLabel(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<Future<String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_Actors_TemperatureLogger_extensionIsolatedGetLabel(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(extensionNonisolatedGetLabel) -->
    String extensionNonisolatedGetLabel(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Actors_TemperatureLogger_extensionNonisolatedGetLabel(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef label,
        int measurement,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Actors_TemperatureLogger_create;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Actors_TemperatureLogger_extensionIsolatedGetLabel;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Actors_TemperatureLogger_extensionNonisolatedGetLabel;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Actors_TemperatureLogger_min;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        int measurement,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Actors_TemperatureLogger_update;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Actors_TemperatureLogger_backwardsLabel;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Actors_TemperatureLogger_extensionNonisolatedVarLabel;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Actors_TemperatureLogger_label;
}
