import './AssociatedDataEnum.dart' as TestAPI;
import './AssociatedDataEnum.dart';
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
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart';
import './Structs_ReferenceStruct.dart' as TestAPI;
import './Structs_ReferenceStruct.dart';
import './Tuples.dart' as TestAPI;
import './Tuples.dart';
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart';
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

part 'Structs_MemberwiseStruct.freezed.dart';

/// <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
@Freezed(addImplicitFinal: false, makeCollectionsUnmodifiable: false)
class Structs_MemberwiseStruct with _$Structs_MemberwiseStruct {
    factory Structs_MemberwiseStruct({
        required final String immutable,
        required String mutable
    }) = _Structs_MemberwiseStruct;

    Structs_MemberwiseStruct._();
    static CreatedRef ffi_constructor(
        ConsumedRef immutable,
        ConsumedRef mutable,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Structs_MemberwiseStruct(
            immutable: consumeRef(immutable),
            mutable: consumeRef(mutable),
        ))
    );

    static CreatedRef ffi_get_immutable(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_MemberwiseStruct>(obj).immutable
        )
    );

    static CreatedRef ffi_get_mutable(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_MemberwiseStruct>(obj).mutable
        )
    );
    static void ffi_set_mutable(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_MemberwiseStruct>(obj).mutable = consumeRef<String>(newValue);
    });

    /// <!-- FishyJoes.export(create) -->
    static TestAPI.Structs_MemberwiseStruct create(
    ) =>
        consumeCreatedRef<TestAPI.Structs_MemberwiseStruct>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_MemberwiseStruct_create(Loader.shared.env, _exn)))
    ;

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_MemberwiseStruct_create;
}
