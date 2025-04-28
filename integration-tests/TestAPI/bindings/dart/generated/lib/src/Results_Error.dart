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

/// <!-- FishyJoes.export(Results.Error) -->
class Results_Error {
    final String message;

    Results_Error({
        required String message
    }):
        this.message = message;

    static CreatedRef ffi_constructor(
        ConsumedRef message,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Results_Error(
            message: consumeRef(message),
        ))
    );
    @override
    String toString() => 'TestAPI.Results_Error(message: $message)';

    static CreatedRef ffi_get_message(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Results_Error>(obj).message
        )
    );

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is Results_Error &&
            (
                const DeepCollectionEquality().equals(other.message, message)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(message)
    );

    Results_Error copyWith({
        String? message
    }) => Results_Error(
        message: message ?? this.message
    );
}
