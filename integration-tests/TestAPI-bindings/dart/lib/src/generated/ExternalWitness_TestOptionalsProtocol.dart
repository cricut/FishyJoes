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

/// <!-- FishyJoes.export(TestOptionalsProtocol) -->
class ExternalWitness_TestOptionalsProtocol extends SwiftReference implements TestAPI.TestOptionalsProtocol {
    ExternalWitness_TestOptionalsProtocol(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(ExternalWitness_TestOptionalsProtocol(ref))
    );

    @override
    String toString() => 'ExternalWitness_TestOptionalsProtocol(flarp: $flarp)';

    /// <!-- FishyJoes.export(flarp) -->
    String? get flarp =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String?>(f__iota_get_TestAPI_TestOptionalsProtocol_flarp(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(wombat) -->
    double? wombat(
        int? zxc,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(zxc, (_zxcHandle) =>
                consumeCreatedRef<double?>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestOptionalsProtocol_wombat(Loader.shared.env, _thisHandle.ptr, _zxcHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(spqr) -->
    int spqr(
        TestAPI.AssociatedDataEnum pippo,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(pippo, (_pippoHandle) =>
                check((OutCreatedRef _exn) => f__iota_TestAPI_TestOptionalsProtocol_spqr(Loader.shared.env, _thisHandle.ptr, _pippoHandle.ptr, _exn))
            )
        )
    ;

    static late int Function(
        Env env,
        UnownedRef _this,
        UnownedRef pippo,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestOptionalsProtocol_spqr;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef zxc,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestOptionalsProtocol_wombat;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestOptionalsProtocol_flarp;
}
