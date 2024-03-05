import './AProtocol.dart' as TestAPI;
import './AProtocolImplementation.dart' as TestAPI;
import './Actors.dart' as TestAPI;
import './Actors_TemperatureLogger.dart' as TestAPI;
import './AssociatedDataEnum.dart' as TestAPI;
import './AsyncFunctions.dart' as TestAPI;
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './AttributedStrings.dart' as TestAPI;
import './Bytes.dart' as TestAPI;
import './ClosedRanges.dart' as TestAPI;
import './Collections.dart' as TestAPI;
import './Collections_CollectionHolder.dart' as TestAPI;
import './DefaultArguments.dart' as TestAPI;
import './Deprecations.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './ExternalWitness_AProtocol.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Methods.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Ranges.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MutableStruct.dart' as TestAPI;
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

// ignore_for_file: unused_import
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: library_prefixes
// ignore_for_file: file_names
// ignore_for_file: annotate_overrides

/// <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
class Primitives_PrimitiveHolder {
    bool b;
    bool? bq;
    int ui8;
    int? ui8q;
    int ui16;
    int? ui16q;
    int ui32;
    int? ui32q;
    int ui64;
    int? ui64q;
    int ui;
    int? uiq;
    int i8;
    int? i8q;
    int i16;
    int? i16q;
    int i32;
    int? i32q;
    int i64;
    int? i64q;
    int i;
    int? iq;
    double f;
    double? fq;
    double d;
    double? dq;

    Primitives_PrimitiveHolder({
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
    }):
        this.b = b,
        this.bq = bq,
        this.ui8 = ui8,
        this.ui8q = ui8q,
        this.ui16 = ui16,
        this.ui16q = ui16q,
        this.ui32 = ui32,
        this.ui32q = ui32q,
        this.ui64 = ui64,
        this.ui64q = ui64q,
        this.ui = ui,
        this.uiq = uiq,
        this.i8 = i8,
        this.i8q = i8q,
        this.i16 = i16,
        this.i16q = i16q,
        this.i32 = i32,
        this.i32q = i32q,
        this.i64 = i64,
        this.i64q = i64q,
        this.i = i,
        this.iq = iq,
        this.f = f,
        this.fq = fq,
        this.d = d,
        this.dq = dq;

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

    static CreatedRef ffi_get_staticProperty(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Primitives_PrimitiveHolder.staticProperty
        )
    );

    static CreatedRef ffi_get_staticMutableProperty(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Primitives_PrimitiveHolder.staticMutableProperty
        )
    );
    static void ffi_set_staticMutableProperty(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        Primitives_PrimitiveHolder.staticMutableProperty = consumeRef<List<int?>>(newValue);
    });

    @override
    String toString() => 'Primitives_PrimitiveHolder(staticProperty: $staticProperty, staticMutableProperty: $staticMutableProperty)';

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is Primitives_PrimitiveHolder &&
            (
                const DeepCollectionEquality().equals(other.staticProperty, staticProperty) &&
                const DeepCollectionEquality().equals(other.staticMutableProperty, staticMutableProperty)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(staticProperty), 
        const DeepCollectionEquality().hash(staticMutableProperty)
    );

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
