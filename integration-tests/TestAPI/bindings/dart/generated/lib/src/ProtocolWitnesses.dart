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

/// <!-- FishyJoes.export(ProtocolWitnesses) -->
class ProtocolWitnesses {
    ProtocolWitnesses._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(describeAProtocol) -->
    static String describeAProtocol(
        TestAPI.AProtocol value,
        int x,
        int y,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_ProtocolWitnesses_describeAProtocol(Loader.shared.env, _valueHandle.ptr, x, y, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(returnAProtocol) -->
    static TestAPI.AProtocol returnAProtocol(
        TestAPI.AProtocol value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<TestAPI.AProtocol>(check((OutCreatedRef _exn) => f__iota_TestAPI_ProtocolWitnesses_returnAProtocol(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        int x,
        int y,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ProtocolWitnesses_describeAProtocol;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ProtocolWitnesses_returnAProtocol;
}
