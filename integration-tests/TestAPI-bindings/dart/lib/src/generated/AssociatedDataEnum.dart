import './AssociatedDataEnum.dart' as TestAPI;
import './Bytes.dart' as TestAPI;
import './Collections.dart' as TestAPI;
import './Collections_CollectionHolder.dart' as TestAPI;
import './DefaultArguments.dart' as TestAPI;
import './Deprecations.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Tuples.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:dart_runtime/runtime.dart';
import 'package:dart_runtime/utilities.dart' as utils;
import 'package:ffi/ffi.dart' as ffi;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

part 'AssociatedDataEnum.freezed.dart';

/// <!-- FishyJoes.export(AssociatedDataEnum) -->
@unfreezed
class AssociatedDataEnum with _$AssociatedDataEnum {
    factory AssociatedDataEnum.thing(
        int value
    ) = Thing;

    factory AssociatedDataEnum.other(
        String unnamed,
        int m_1
    ) = Other;

    factory AssociatedDataEnum.bar(
        String named,
        TestAPI.AssociatedDataEnum m_1
    ) = Bar;

    factory AssociatedDataEnum.noValue(
    ) = NoValue;

    AssociatedDataEnum._() {}

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
        peekRef<AssociatedDataEnum>(obj).map(
            thing: (_) => 0,
            other: (_) => 1,
            bar: (_) => 2,
            noValue: (_) => 3,
        )
    );

    static CreatedRef newThing(
        int _value,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Thing(
            _value
        ))
    );

    static void extractThing(
        UnownedRef obj,
        ffi.Pointer<ffi.Int> _value,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<Thing>(obj);
            _value.value = _self.value;
        });
    }

    static CreatedRef newOther(
        ConsumedRef _unnamed,
        int __1,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Other(
            consumeRef<String>(_unnamed),
            __1
        ))
    );

    static void extractOther(
        UnownedRef obj,
        OutCreatedRef _unnamed,
        ffi.Pointer<ffi.Int> __1,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<Other>(obj);
            _unnamed.value = createRef(_self.unnamed);
            __1.value = _self.m_1;
        });
    }

    static CreatedRef newBar(
        ConsumedRef _named,
        ConsumedRef __1,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Bar(
            consumeRef<String>(_named),
            consumeRef<TestAPI.AssociatedDataEnum>(__1),
        ))
    );

    static void extractBar(
        UnownedRef obj,
        OutCreatedRef _named,
        OutCreatedRef __1,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<Bar>(obj);
            _named.value = createRef(_self.named);
            __1.value = createRef(_self.m_1);
        });
    }

    static CreatedRef newNoValue(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(NoValue(
        ))
    );

    static void extractNoValue(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<NoValue>(obj);
        });
    }

    /// <!-- FishyJoes.export(staticThing) -->
    static TestAPI.AssociatedDataEnum get staticThing =>
        check((exn) =>
            consumeCreatedRef<TestAPI.AssociatedDataEnum>(f__dart_get_AssociatedDataEnum_staticThing(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(intValue) -->
    int get intValue =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__dart_get_AssociatedDataEnum_intValue(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(plus) -->
    TestAPI.AssociatedDataEnum plus(
        TestAPI.AssociatedDataEnum other,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(other, (_otherHandle) =>
                consumeCreatedRef<TestAPI.AssociatedDataEnum>(check((OutCreatedRef _exn) => f__dart_AssociatedDataEnum_plus(Loader.shared.env, _thisHandle.ptr, _otherHandle.ptr, _exn)))
            )
        )
    ;

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__dart_get_AssociatedDataEnum_staticThing;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef other,
        OutCreatedRef _exn
    ) f__dart_AssociatedDataEnum_plus;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__dart_get_AssociatedDataEnum_intValue;
}
