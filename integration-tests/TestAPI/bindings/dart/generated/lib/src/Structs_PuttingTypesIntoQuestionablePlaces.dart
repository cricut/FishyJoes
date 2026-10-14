import './_exports.dart' as TestAPI;
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

/// <!-- FishyJoes.exportReference(Structs_PuttingTypesIntoQuestionablePlaces) -->
class Structs_PuttingTypesIntoQuestionablePlaces extends SwiftReference {
    Structs_PuttingTypesIntoQuestionablePlaces(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(Structs_PuttingTypesIntoQuestionablePlaces(ref))
    );

    /// <!-- FishyJoes.export(create) -->
    static TestAPI.Structs_PuttingTypesIntoQuestionablePlaces create(
    ) =>
        consumeCreatedRef<TestAPI.Structs_PuttingTypesIntoQuestionablePlaces>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(testCall) -->
    int testCall(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall(Loader.shared.env, _thisHandle.ptr, _exn))
        )
    ;

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall;
}
