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

/// An inhabited enum that the product annotated `exportReference` rather than
/// `export`. An enum's cases are its only construction surface, so the generator
/// must still surface the cases (mirroring the `export` enum path) instead of
/// emitting an unconstructable, members-less opaque reference shell. Mirrors the
/// real CriRaster `Image.Kind` / `Image.Color.Channel` shape.
/// <!-- FishyJoes.exportReference(ReferenceCaseEnum) -->
sealed class ReferenceCaseEnum {
    const factory ReferenceCaseEnum.north(
    ) = ReferenceCaseEnum_North;

    const factory ReferenceCaseEnum.south(
    ) = ReferenceCaseEnum_South;

    const factory ReferenceCaseEnum.east(
    ) = ReferenceCaseEnum_East;

    const factory ReferenceCaseEnum.west(
    ) = ReferenceCaseEnum_West;

    const ReferenceCaseEnum();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        final peekedObj = peekRef<ReferenceCaseEnum>(obj);
        if (peekedObj is ReferenceCaseEnum_North) { return 0; }
        else if (peekedObj is ReferenceCaseEnum_South) { return 1; }
        else if (peekedObj is ReferenceCaseEnum_East) { return 2; }
        else if (peekedObj is ReferenceCaseEnum_West) { return 3; }
        else { throw UnsupportedError('Unknown ReferenceCaseEnum subclass'); }
    });

    static CreatedRef newNorth(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(ReferenceCaseEnum_North(
        ))
    );

    static void extractNorth(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<ReferenceCaseEnum_North>(obj);
        });
    }

    static CreatedRef newSouth(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(ReferenceCaseEnum_South(
        ))
    );

    static void extractSouth(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<ReferenceCaseEnum_South>(obj);
        });
    }

    static CreatedRef newEast(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(ReferenceCaseEnum_East(
        ))
    );

    static void extractEast(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<ReferenceCaseEnum_East>(obj);
        });
    }

    static CreatedRef newWest(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(ReferenceCaseEnum_West(
        ))
    );

    static void extractWest(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<ReferenceCaseEnum_West>(obj);
        });
    }

    /// Mirrors `Image.kind`: a value-returning accessor whose result must be
    /// comparable to a known case from Python.
    /// <!-- FishyJoes.export(defaultDirection) -->
    static TestAPI.ReferenceCaseEnum get defaultDirection =>
        check((exn) =>
            consumeCreatedRef<TestAPI.ReferenceCaseEnum>(f__iota_get_TestAPI_ReferenceCaseEnum_defaultDirection(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(opposite) -->
    TestAPI.ReferenceCaseEnum get opposite =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<TestAPI.ReferenceCaseEnum>(f__iota_get_TestAPI_ReferenceCaseEnum_opposite(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// A method that both consumes (parameter) and produces (return) the
    /// reference-annotated enum — only callable from Python if the cases bridge.
    /// <!-- FishyJoes.export(rotate180) -->
    static TestAPI.ReferenceCaseEnum rotate180(
        TestAPI.ReferenceCaseEnum direction,
    ) =>
        GCRef.using(direction, (_directionHandle) =>
            consumeCreatedRef<TestAPI.ReferenceCaseEnum>(check((OutCreatedRef _exn) => f__iota_TestAPI_ReferenceCaseEnum_rotate180(Loader.shared.env, _directionHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef direction,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ReferenceCaseEnum_rotate180;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ReferenceCaseEnum_defaultDirection;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ReferenceCaseEnum_opposite;
}

class ReferenceCaseEnum_North extends ReferenceCaseEnum {
    const ReferenceCaseEnum_North();

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is ReferenceCaseEnum_North
    );

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'ReferenceCaseEnum.north()';

    ReferenceCaseEnum_North copyWith() => ReferenceCaseEnum_North();
}

class ReferenceCaseEnum_South extends ReferenceCaseEnum {
    const ReferenceCaseEnum_South();

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is ReferenceCaseEnum_South
    );

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'ReferenceCaseEnum.south()';

    ReferenceCaseEnum_South copyWith() => ReferenceCaseEnum_South();
}

class ReferenceCaseEnum_East extends ReferenceCaseEnum {
    const ReferenceCaseEnum_East();

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is ReferenceCaseEnum_East
    );

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'ReferenceCaseEnum.east()';

    ReferenceCaseEnum_East copyWith() => ReferenceCaseEnum_East();
}

class ReferenceCaseEnum_West extends ReferenceCaseEnum {
    const ReferenceCaseEnum_West();

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is ReferenceCaseEnum_West
    );

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'ReferenceCaseEnum.west()';

    ReferenceCaseEnum_West copyWith() => ReferenceCaseEnum_West();
}
