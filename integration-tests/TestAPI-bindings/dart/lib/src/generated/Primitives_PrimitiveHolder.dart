import './AssociatedDataEnum.dart' as TestAPI;
import './AssociatedDataEnum.dart';
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
import './EmptyEnum.dart' as TestAPI;
import './EmptyEnum.dart';
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
import './Strings.dart' as TestAPI;
import './Strings.dart';
import './Structs.dart' as TestAPI;
import './Structs.dart';
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart';
import './Structs_ReferenceStruct.dart' as TestAPI;
import './Structs_ReferenceStruct.dart';
import './Tuples.dart' as TestAPI;
import './Tuples.dart';
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

part 'Primitives_PrimitiveHolder.freezed.dart';

/// <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
@Freezed(addImplicitFinal: false, makeCollectionsUnmodifiable: false)
class Primitives_PrimitiveHolder with _$Primitives_PrimitiveHolder {
    factory Primitives_PrimitiveHolder({
        required bool b,
        required bool? bq,
        required int ui8,
        required int? ui8q,
        required int ui16,
        required int? ui16q,
        required int ui32,
        required int? ui32q,
        required int ui64,
        required int? ui64q,
        required int ui,
        required int? uiq,
        required int i8,
        required int? i8q,
        required int i16,
        required int? i16q,
        required int i32,
        required int? i32q,
        required int i64,
        required int? i64q,
        required int i,
        required int? iq,
        required double f,
        required double? fq,
        required double d,
        required double? dq
    }) = _Primitives_PrimitiveHolder;

    Primitives_PrimitiveHolder._();
    static CreatedRef ffi_constructor(
        bool b,
        ConsumedRef bq,
        int ui8,
        ConsumedRef ui8q,
        int ui16,
        ConsumedRef ui16q,
        int ui32,
        ConsumedRef ui32q,
        int ui64,
        ConsumedRef ui64q,
        int ui,
        ConsumedRef uiq,
        int i8,
        ConsumedRef i8q,
        int i16,
        ConsumedRef i16q,
        int i32,
        ConsumedRef i32q,
        int i64,
        ConsumedRef i64q,
        int i,
        ConsumedRef iq,
        double f,
        ConsumedRef fq,
        double d,
        ConsumedRef dq,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Primitives_PrimitiveHolder(
            b: b,
            bq: consumeRef(bq),
            ui8: ui8,
            ui8q: consumeRef(ui8q),
            ui16: ui16,
            ui16q: consumeRef(ui16q),
            ui32: ui32,
            ui32q: consumeRef(ui32q),
            ui64: ui64,
            ui64q: consumeRef(ui64q),
            ui: ui,
            uiq: consumeRef(uiq),
            i8: i8,
            i8q: consumeRef(i8q),
            i16: i16,
            i16q: consumeRef(i16q),
            i32: i32,
            i32q: consumeRef(i32q),
            i64: i64,
            i64q: consumeRef(i64q),
            i: i,
            iq: consumeRef(iq),
            f: f,
            fq: consumeRef(fq),
            d: d,
            dq: consumeRef(dq),
        ))
    );

    static bool ffi_get_b(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Primitives_PrimitiveHolder>(obj).b
    ) ?? false;
    static void ffi_set_b(
        UnownedRef obj,
        bool newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).b = newValue;
    });

    static CreatedRef ffi_get_bq(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Primitives_PrimitiveHolder>(obj).bq
        )
    );
    static void ffi_set_bq(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).bq = consumeRef<bool?>(newValue);
    });

    static int ffi_get_ui8(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Primitives_PrimitiveHolder>(obj).ui8
    ) ?? 0;
    static void ffi_set_ui8(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).ui8 = newValue;
    });

    static CreatedRef ffi_get_ui8q(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Primitives_PrimitiveHolder>(obj).ui8q
        )
    );
    static void ffi_set_ui8q(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).ui8q = consumeRef<int?>(newValue);
    });

    static int ffi_get_ui16(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Primitives_PrimitiveHolder>(obj).ui16
    ) ?? 0;
    static void ffi_set_ui16(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).ui16 = newValue;
    });

    static CreatedRef ffi_get_ui16q(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Primitives_PrimitiveHolder>(obj).ui16q
        )
    );
    static void ffi_set_ui16q(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).ui16q = consumeRef<int?>(newValue);
    });

    static int ffi_get_ui32(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Primitives_PrimitiveHolder>(obj).ui32
    ) ?? 0;
    static void ffi_set_ui32(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).ui32 = newValue;
    });

    static CreatedRef ffi_get_ui32q(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Primitives_PrimitiveHolder>(obj).ui32q
        )
    );
    static void ffi_set_ui32q(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).ui32q = consumeRef<int?>(newValue);
    });

    static int ffi_get_ui64(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Primitives_PrimitiveHolder>(obj).ui64
    ) ?? 0;
    static void ffi_set_ui64(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).ui64 = newValue;
    });

    static CreatedRef ffi_get_ui64q(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Primitives_PrimitiveHolder>(obj).ui64q
        )
    );
    static void ffi_set_ui64q(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).ui64q = consumeRef<int?>(newValue);
    });

    static int ffi_get_ui(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Primitives_PrimitiveHolder>(obj).ui
    ) ?? 0;
    static void ffi_set_ui(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).ui = newValue;
    });

    static CreatedRef ffi_get_uiq(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Primitives_PrimitiveHolder>(obj).uiq
        )
    );
    static void ffi_set_uiq(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).uiq = consumeRef<int?>(newValue);
    });

    static int ffi_get_i8(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Primitives_PrimitiveHolder>(obj).i8
    ) ?? 0;
    static void ffi_set_i8(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).i8 = newValue;
    });

    static CreatedRef ffi_get_i8q(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Primitives_PrimitiveHolder>(obj).i8q
        )
    );
    static void ffi_set_i8q(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).i8q = consumeRef<int?>(newValue);
    });

    static int ffi_get_i16(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Primitives_PrimitiveHolder>(obj).i16
    ) ?? 0;
    static void ffi_set_i16(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).i16 = newValue;
    });

    static CreatedRef ffi_get_i16q(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Primitives_PrimitiveHolder>(obj).i16q
        )
    );
    static void ffi_set_i16q(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).i16q = consumeRef<int?>(newValue);
    });

    static int ffi_get_i32(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Primitives_PrimitiveHolder>(obj).i32
    ) ?? 0;
    static void ffi_set_i32(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).i32 = newValue;
    });

    static CreatedRef ffi_get_i32q(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Primitives_PrimitiveHolder>(obj).i32q
        )
    );
    static void ffi_set_i32q(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).i32q = consumeRef<int?>(newValue);
    });

    static int ffi_get_i64(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Primitives_PrimitiveHolder>(obj).i64
    ) ?? 0;
    static void ffi_set_i64(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).i64 = newValue;
    });

    static CreatedRef ffi_get_i64q(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Primitives_PrimitiveHolder>(obj).i64q
        )
    );
    static void ffi_set_i64q(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).i64q = consumeRef<int?>(newValue);
    });

    static int ffi_get_i(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Primitives_PrimitiveHolder>(obj).i
    ) ?? 0;
    static void ffi_set_i(
        UnownedRef obj,
        int newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).i = newValue;
    });

    static CreatedRef ffi_get_iq(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Primitives_PrimitiveHolder>(obj).iq
        )
    );
    static void ffi_set_iq(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).iq = consumeRef<int?>(newValue);
    });

    static double ffi_get_f(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Primitives_PrimitiveHolder>(obj).f
    ) ?? 0.0;
    static void ffi_set_f(
        UnownedRef obj,
        double newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).f = newValue;
    });

    static CreatedRef ffi_get_fq(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Primitives_PrimitiveHolder>(obj).fq
        )
    );
    static void ffi_set_fq(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).fq = consumeRef<double?>(newValue);
    });

    static double ffi_get_d(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Primitives_PrimitiveHolder>(obj).d
    ) ?? 0.0;
    static void ffi_set_d(
        UnownedRef obj,
        double newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).d = newValue;
    });

    static CreatedRef ffi_get_dq(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Primitives_PrimitiveHolder>(obj).dq
        )
    );
    static void ffi_set_dq(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Primitives_PrimitiveHolder>(obj).dq = consumeRef<double?>(newValue);
    });

    /// <!-- FishyJoes.export(staticProperty) -->
    static List<int?> get staticProperty =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Primitives_PrimitiveHolder_staticProperty(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(staticMutableProperty) -->
    static List<int?> get staticMutableProperty =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty(Loader.shared.env, exn))
        )
    ;
    static void set staticMutableProperty(List<int?> value) {
        GCRef.using(value, (_valueHandle) =>
            check((exn) =>
                f__iota_set_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty(Loader.shared.env, _valueHandle.ptr, exn)
            )
        )
        ;
    }

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_PrimitiveHolder_staticProperty;
    static late void Function(
        Env env,
        UnownedRef staticMutableProperty,
        OutCreatedRef _exn
    ) f__iota_set_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty;
}
