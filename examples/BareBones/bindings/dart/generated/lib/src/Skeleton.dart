import './_exports.dart' as BareBones;
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

/// <!-- FishyJoes.exportReference(Skeleton) -->
class Skeleton extends SwiftReference {
    Skeleton(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(Skeleton(ref))
    );

    /// <!-- FishyJoes.export(boneCount) -->
    static int get boneCount =>
        check((exn) =>
            f__iota_get_BareBones_Skeleton_boneCount(Loader.shared.env, exn)
        )
    ;

    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_BareBones_Skeleton_boneCount;
}
