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

/// <!-- FishyJoes.export(UnicodeScalar_PuttingTypesIntoQuestionablePlaces) -->
sealed class UnicodeScalar_PuttingTypesIntoQuestionablePlaces {
    const factory UnicodeScalar_PuttingTypesIntoQuestionablePlaces.thing(
    ) = UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing;

    const UnicodeScalar_PuttingTypesIntoQuestionablePlaces();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        final peekedObj = peekRef<UnicodeScalar_PuttingTypesIntoQuestionablePlaces>(obj);
        if (peekedObj is UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing) { return 0; }
        else { throw UnsupportedError('Unknown UnicodeScalar_PuttingTypesIntoQuestionablePlaces subclass'); }
    });

    static CreatedRef newThing(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing(
        ))
    );

    static void extractThing(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing>(obj);
        });
    }

    /// <!-- FishyJoes.export(testCall) -->
    int testCall(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall(Loader.shared.env, _thisHandle.ptr, _exn))
        )
    ;

    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall;
}

class UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing extends UnicodeScalar_PuttingTypesIntoQuestionablePlaces {
    const UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing();

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing
    );

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'UnicodeScalar_PuttingTypesIntoQuestionablePlaces.thing()';

    UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing copyWith() => UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing();
}
