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

part 'String_PuttingTypesIntoQuestionablePlaces.freezed.dart';

/// <!-- FishyJoes.export(String_PuttingTypesIntoQuestionablePlaces) -->
@Freezed(addImplicitFinal: false, makeCollectionsUnmodifiable: false)
class String_PuttingTypesIntoQuestionablePlaces with _$String_PuttingTypesIntoQuestionablePlaces {
    factory String_PuttingTypesIntoQuestionablePlaces({
        required final String x
    }) = _String_PuttingTypesIntoQuestionablePlaces;

    String_PuttingTypesIntoQuestionablePlaces._();
    static CreatedRef ffi_constructor(
        ConsumedRef x,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(String_PuttingTypesIntoQuestionablePlaces(
            x: consumeRef(x),
        ))
    );

    static CreatedRef ffi_get_x(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<String_PuttingTypesIntoQuestionablePlaces>(obj).x
        )
    );

    /// <!-- FishyJoes.export(testCall) -->
    int testCall(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall(Loader.shared.env, _thisHandle.ptr, _exn))
        )
    ;

    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall;
}
