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

/// <!-- FishyJoes.export(String_PuttingTypesIntoQuestionablePlaces) -->
class String_PuttingTypesIntoQuestionablePlaces {
    final String x;

    String_PuttingTypesIntoQuestionablePlaces({
        required String x
    }):
        this.x = x;

    static CreatedRef ffi_constructor(
        ConsumedRef x,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(String_PuttingTypesIntoQuestionablePlaces(
            x: consumeRef(x),
        ))
    );
    @override
    String toString() => 'TestAPI.String_PuttingTypesIntoQuestionablePlaces(x: $x)';

    static CreatedRef ffi_get_x(
        UnownedRef obj,
        OutCreatedRef exn
    ) =>catchingRef(exn, () =>
        createRef(
            peekRef<String_PuttingTypesIntoQuestionablePlaces>(obj).x
        )
    );

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
    int get hashCode =>Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(x)
    );

    String_PuttingTypesIntoQuestionablePlaces copyWith({
        String? x
    }) => String_PuttingTypesIntoQuestionablePlaces(
        x: x ?? this.x
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
