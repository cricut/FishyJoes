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
import './ExternalWitness_TestAsyncFunctions.dart' as TestAPI;
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

/// <!-- FishyJoes.export(TestAsyncFunctions) -->
class ExternalWitness_TestAsyncFunctions extends SwiftReference implements TestAPI.TestAsyncFunctions {
    ExternalWitness_TestAsyncFunctions(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(ExternalWitness_TestAsyncFunctions(ref))
    );

    @override
    String toString() => 'ExternalWitness_TestAsyncFunctions(const42: $const42, iabs: $iabs, intCompose: $intCompose, add3Things: $add3Things, makeList: $makeList, fifthThing: $fifthThing, six: $six)';

    /// <!-- FishyJoes.export(const42) -->
    Future<int> Function() get const42 =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<int> Function()>(f__iota_get_TestAPI_TestAsyncFunctions_const42(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(iabs) -->
    Future<int> Function(int) get iabs =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<int> Function(int)>(f__iota_get_TestAPI_TestAsyncFunctions_iabs(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(intCompose) -->
    Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int)) get intCompose =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<int> Function(int) Function(Future<int> Function(int), Future<int> Function(int))>(f__iota_get_TestAPI_TestAsyncFunctions_intCompose(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(add3Things) -->
    Future<double> Function(double, double, int) get add3Things =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<double> Function(double, double, int)>(f__iota_get_TestAPI_TestAsyncFunctions_add3Things(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(makeList) -->
    Future<List<String>> Function(String, String, String, String) get makeList =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<List<String>> Function(String, String, String, String)>(f__iota_get_TestAPI_TestAsyncFunctions_makeList(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(fifthThing) -->
    Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function()) get fifthThing =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<Future<int> Function()> Function(String, int, double, String, Future<int> Function())>(f__iota_get_TestAPI_TestAsyncFunctions_fifthThing(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(six) -->
    Future<int> Function(String, int, double, String, Future<int> Function(), int) get six =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Future<int> Function(String, int, double, String, Future<int> Function(), int)>(f__iota_get_TestAPI_TestAsyncFunctions_six(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncFunctions_add3Things;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncFunctions_const42;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncFunctions_fifthThing;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncFunctions_iabs;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncFunctions_intCompose;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncFunctions_makeList;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestAsyncFunctions_six;
}
