import './AssociatedDataEnum.dart' as TestAPI;
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './AttributedStrings.dart' as TestAPI;
import './Bytes.dart' as TestAPI;
import './ClosedRanges.dart' as TestAPI;
import './Collections.dart' as TestAPI;
import './Collections_CollectionHolder.dart' as TestAPI;
import './DefaultArguments.dart' as TestAPI;
import './Deprecations.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Functions_TheError.dart' as TestAPI;
import './Methods.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Ranges.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
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

/// <!-- FishyJoes.export(String_PuttingTypesIntoQuestionablePlaces) -->
class String_PuttingTypesIntoQuestionablePlaces {
    final String x;

    String_PuttingTypesIntoQuestionablePlaces({
        required this.x
    });

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

    @override
    String toString() => 'String_PuttingTypesIntoQuestionablePlaces(x: $x)';

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is String_PuttingTypesIntoQuestionablePlaces &&
            (
                const DeepCollectionEquality().equals(other.x, x)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(x)
    );

    String_PuttingTypesIntoQuestionablePlaces shallowCopy() => String_PuttingTypesIntoQuestionablePlaces(
        x: x
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
