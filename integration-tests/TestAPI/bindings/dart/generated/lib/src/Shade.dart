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

/// A type whose name matches a case of ``ShadowBox``. Inside ShadowBox's
/// generated Python class body, the case-type attribute (`Shade: ClassVar[...]`)
/// shadows this type's import, so annotations meaning this type must resolve
/// through a module-level alias in the generated stub.
/// <!-- FishyJoes.export(Shade) -->
class Shade {
    double darkness;

    Shade({
        required double darkness
    }):
        this.darkness = darkness;

    static CreatedRef ffi_constructor(
        double darkness,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Shade(
            darkness: darkness,
        ))
    );
    @override
    String toString() => 'TestAPI.Shade(darkness: $darkness)';

    static double ffi_get_darkness(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Shade>(obj).darkness
    ) ?? 0.0;
    static void ffi_set_darkness(
        UnownedRef obj,
        double newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Shade>(obj).darkness = newValue;
    });

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is Shade &&
            (
                const DeepCollectionEquality().equals(other.darkness, darkness)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(darkness)
    );

    Shade copyWith({
        double? darkness
    }) => Shade(
        darkness: darkness ?? this.darkness
    );
}
