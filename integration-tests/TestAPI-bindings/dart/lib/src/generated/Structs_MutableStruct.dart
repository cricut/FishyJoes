import './AssociatedDataEnum.dart' as TestAPI;
import './AssociatedDataEnum.dart';
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart';
import './AttributedStrings.dart' as TestAPI;
import './AttributedStrings.dart';
import './Bytes.dart' as TestAPI;
import './Bytes.dart';
import './ClosedRanges.dart' as TestAPI;
import './ClosedRanges.dart';
import './Collections.dart' as TestAPI;
import './Collections.dart';
import './Collections_CollectionHolder.dart' as TestAPI;
import './Collections_CollectionHolder.dart';
import './DefaultArguments.dart' as TestAPI;
import './DefaultArguments.dart';
import './Deprecations.dart' as TestAPI;
import './Deprecations.dart';
import './EmptyEnum.dart' as TestAPI;
import './EmptyEnum.dart';
import './Functions.dart' as TestAPI;
import './Functions.dart';
import './Functions_TheError.dart' as TestAPI;
import './Functions_TheError.dart';
import './Methods.dart' as TestAPI;
import './Methods.dart';
import './Primitives.dart' as TestAPI;
import './Primitives.dart';
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart';
import './Ranges.dart' as TestAPI;
import './Ranges.dart';
import './SimpleEnum.dart' as TestAPI;
import './SimpleEnum.dart';
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart';
import './Strings.dart' as TestAPI;
import './Strings.dart';
import './Structs.dart' as TestAPI;
import './Structs.dart';
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart';
import './Structs_MutableStruct.dart' as TestAPI;
import './Structs_MutableStruct.dart';
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart';
import './Structs_ReferenceStruct.dart' as TestAPI;
import './Structs_ReferenceStruct.dart';
import './Tuples.dart' as TestAPI;
import './Tuples.dart';
import './URLs.dart' as TestAPI;
import './URLs.dart';
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart';
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

part 'Structs_MutableStruct.freezed.dart';

/// <!-- FishyJoes.export(Structs.MutableStruct) -->
@Freezed(addImplicitFinal: false, makeCollectionsUnmodifiable: false)
class Structs_MutableStruct with _$Structs_MutableStruct {
    factory Structs_MutableStruct({
        required int i
    }) = _Structs_MutableStruct;

    Structs_MutableStruct._();
    static CreatedRef ffi_constructor(
        int i,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Structs_MutableStruct(
            i: i,
        ))
    );

    static int ffi_get_i(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Structs_MutableStruct>(obj).i
    ) ?? 0;
    static void ffi_set_i(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_MutableStruct>(obj).i = newValue;
    });

    /// <!-- FishyJoes.export(create) -->
    static TestAPI.Structs_MutableStruct create(
    ) =>
        consumeCreatedRef<TestAPI.Structs_MutableStruct>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_MutableStruct_create(Loader.shared.env, _exn)))
    ;

    /// <!-- FishyJoes.export(increment) -->
    void increment(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_MutableStruct_increment(Loader.shared.env, _thisHandle.ptr, _exn))
        )
    ;

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_MutableStruct_create;
    static late void Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_MutableStruct_increment;
}
