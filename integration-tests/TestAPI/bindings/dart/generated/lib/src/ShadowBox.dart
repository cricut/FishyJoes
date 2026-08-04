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

/// <!-- FishyJoes.export(ShadowBox) -->
sealed class ShadowBox {
    const factory ShadowBox.shade(
        TestAPI.Shade m_0
    ) = ShadowBox_Shade;

    const factory ShadowBox.empty(
    ) = ShadowBox_Empty;

    const ShadowBox();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        final peekedObj = peekRef<ShadowBox>(obj);
        if (peekedObj is ShadowBox_Shade) { return 0; }
        else if (peekedObj is ShadowBox_Empty) { return 1; }
        else { throw UnsupportedError('Unknown ShadowBox subclass'); }
    });

    static CreatedRef newShade(
        ConsumedRef __0,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(ShadowBox_Shade(
            consumeRef<TestAPI.Shade>(__0),
        ))
    );

    static void extractShade(
        UnownedRef obj,
        OutCreatedRef __0,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<ShadowBox_Shade>(obj);
            __0.value = createRef(_self.m_0);
        });
    }

    static CreatedRef newEmpty(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(ShadowBox_Empty(
        ))
    );

    static void extractEmpty(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<ShadowBox_Empty>(obj);
        });
    }

    /// <!-- FishyJoes.export(allShades) -->
    List<TestAPI.Shade> get allShades =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<List<TestAPI.Shade>>(f__iota_get_TestAPI_ShadowBox_allShades(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(darkest) -->
    static TestAPI.Shade? darkest(
        List<TestAPI.Shade> /* of */ shades,
    ) =>
        GCRef.using(shades, (_shadesHandle) =>
            consumeCreatedRef<TestAPI.Shade?>(check((OutCreatedRef _exn) => f__iota_TestAPI_ShadowBox_darkest(Loader.shared.env, _shadesHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef shades,
        OutCreatedRef _exn
    ) f__iota_TestAPI_ShadowBox_darkest;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_ShadowBox_allShades;
}

class ShadowBox_Shade extends ShadowBox {
    const ShadowBox_Shade(
        this.m_0
    );

    final TestAPI.Shade m_0;

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is ShadowBox_Shade
        && const DeepCollectionEquality().equals(other.m_0, m_0)
    );

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(m_0)
    );

    @override
    String toString() => 'ShadowBox.shade(m_0: $m_0)';

    ShadowBox_Shade copyWith([
        TestAPI.Shade? m_0
    ]) => ShadowBox_Shade(
        m_0 ?? this.m_0
    );
}

class ShadowBox_Empty extends ShadowBox {
    const ShadowBox_Empty();

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is ShadowBox_Empty
    );

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'ShadowBox.empty()';

    ShadowBox_Empty copyWith() => ShadowBox_Empty();
}
