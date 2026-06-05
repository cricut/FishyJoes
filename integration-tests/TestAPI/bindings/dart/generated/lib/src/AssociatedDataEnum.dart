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

/// <!-- FishyJoes.export(AssociatedDataEnum) -->
sealedclass AssociatedDataEnum {
    /// Documentation about thing
    const factory AssociatedDataEnum.thing(
        int value
    ) = AssociatedDataEnum_Thing;

    const factory AssociatedDataEnum.other(
        String unnamed,
        int m_1
    ) = AssociatedDataEnum_Other;

    /// Documentation about bar
    const factory AssociatedDataEnum.bar(
        String named,
        TestAPI.AssociatedDataEnum m_1,
        bool toggled
    ) = AssociatedDataEnum_Bar;

    /// Documentation about noValue
    const factory AssociatedDataEnum.noValue(
    ) = AssociatedDataEnum_NoValue;

    const factory AssociatedDataEnum.none(
    ) = AssociatedDataEnum_None;

    const factory AssociatedDataEnum.simpleEnum(
        TestAPI.SimpleEnum value
    ) = AssociatedDataEnum_SimpleEnum;

    const AssociatedDataEnum();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        final peekedObj = peekRef<AssociatedDataEnum>(obj);
        if (peekedObj is AssociatedDataEnum_Thing) { return 0; }
        elseif (peekedObj is AssociatedDataEnum_Other) { return 1; }
        elseif (peekedObj is AssociatedDataEnum_Bar) { return 2; }
        elseif (peekedObj is AssociatedDataEnum_NoValue) { return 3; }
        elseif (peekedObj is AssociatedDataEnum_None) { return 4; }
        elseif (peekedObj is AssociatedDataEnum_SimpleEnum) { return 5; }
        else { throw UnsupportedError('Unknown AssociatedDataEnum subclass'); }
    });

    static CreatedRef newThing(
        int _value,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(AssociatedDataEnum_Thing(
            _value,
        ))
    );

    static void extractThing(
        UnownedRef obj,
        ffi.Pointer<ffi.IntPtr> _value,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<AssociatedDataEnum_Thing>(obj);
            _value.value = _self.value;
        });
    }

    static CreatedRef newOther(
        ConsumedRef _unnamed,
        int __1,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(AssociatedDataEnum_Other(
            consumeRef<String>(_unnamed),
            __1,
        ))
    );

    static void extractOther(
        UnownedRef obj,
        OutCreatedRef _unnamed,
        ffi.Pointer<ffi.IntPtr> __1,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<AssociatedDataEnum_Other>(obj);
            _unnamed.value = createRef(_self.unnamed);
            __1.value = _self.m_1;
        });
    }

    static CreatedRef newBar(
        ConsumedRef _named,
        ConsumedRef __1,
        bool _toggled,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(AssociatedDataEnum_Bar(
            consumeRef<String>(_named),
            consumeRef<TestAPI.AssociatedDataEnum>(__1),
            _toggled,
        ))
    );

    static void extractBar(
        UnownedRef obj,
        OutCreatedRef _named,
        OutCreatedRef __1,
        ffi.Pointer<ffi.Bool> _toggled,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<AssociatedDataEnum_Bar>(obj);
            _named.value = createRef(_self.named);
            __1.value = createRef(_self.m_1);
            _toggled.value = _self.toggled;
        });
    }

    static CreatedRef newNoValue(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(AssociatedDataEnum_NoValue(
        ))
    );

    static void extractNoValue(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<AssociatedDataEnum_NoValue>(obj);
        });
    }

    static CreatedRef newNone(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(AssociatedDataEnum_None(
        ))
    );

    static void extractNone(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<AssociatedDataEnum_None>(obj);
        });
    }

    static CreatedRef newSimpleEnum(
        ConsumedRef _value,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(AssociatedDataEnum_SimpleEnum(
            consumeRef<TestAPI.SimpleEnum>(_value),
        ))
    );

    static void extractSimpleEnum(
        UnownedRef obj,
        OutCreatedRef _value,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<AssociatedDataEnum_SimpleEnum>(obj);
            _value.value = createRef(_self.value);
        });
    }

    /// <!-- FishyJoes.export(intValue) -->
    int get intValue =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_AssociatedDataEnum_intValue(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(staticThing) -->
    static TestAPI.AssociatedDataEnum get staticThing =>
        check((exn) =>
            consumeCreatedRef<TestAPI.AssociatedDataEnum>(f__iota_get_TestAPI_AssociatedDataEnum_staticThing(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(plus) -->
    TestAPI.AssociatedDataEnum plus(
        TestAPI.AssociatedDataEnum other,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(other, (_otherHandle) =>
                consumeCreatedRef<TestAPI.AssociatedDataEnum>(check((OutCreatedRef _exn) => f__iota_TestAPI_AssociatedDataEnum_plus(Loader.shared.env, _thisHandle.ptr, _otherHandle.ptr, _exn)))
            )
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef other,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AssociatedDataEnum_plus;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AssociatedDataEnum_intValue;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AssociatedDataEnum_staticThing;
}

class AssociatedDataEnum_Thing extends AssociatedDataEnum {
    const AssociatedDataEnum_Thing(
        this.value
    );

    final int value;

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is AssociatedDataEnum_Thing
        && const DeepCollectionEquality().equals(other.value, value)
    );

    @override
    int get hashCode =>Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(value)
    );

    @override
    String toString() => 'AssociatedDataEnum.thing(value: $value)';

    AssociatedDataEnum_Thing copyWith([
        int? value
    ]) => AssociatedDataEnum_Thing(
        value ?? this.value
    );
}

class AssociatedDataEnum_Other extends AssociatedDataEnum {
    const AssociatedDataEnum_Other(
        this.unnamed,
        this.m_1
    );

    final String unnamed;
    final int m_1;

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is AssociatedDataEnum_Other
        && const DeepCollectionEquality().equals(other.unnamed, unnamed)
        && const DeepCollectionEquality().equals(other.m_1, m_1)
    );

    @override
    int get hashCode =>Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(unnamed),
        const DeepCollectionEquality().hash(m_1)
    );

    @override
    String toString() => 'AssociatedDataEnum.other(unnamed: $unnamed, m_1: $m_1)';

    AssociatedDataEnum_Other copyWith([
        String? unnamed,
        int? m_1
    ]) => AssociatedDataEnum_Other(
        unnamed ?? this.unnamed,
        m_1 ?? this.m_1
    );
}

class AssociatedDataEnum_Bar extends AssociatedDataEnum {
    const AssociatedDataEnum_Bar(
        this.named,
        this.m_1,
        this.toggled
    );

    final String named;
    final TestAPI.AssociatedDataEnum m_1;
    final bool toggled;

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is AssociatedDataEnum_Bar
        && const DeepCollectionEquality().equals(other.named, named)
        && const DeepCollectionEquality().equals(other.m_1, m_1)
        && const DeepCollectionEquality().equals(other.toggled, toggled)
    );

    @override
    int get hashCode =>Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(named),
        const DeepCollectionEquality().hash(m_1),
        const DeepCollectionEquality().hash(toggled)
    );

    @override
    String toString() => 'AssociatedDataEnum.bar(named: $named, m_1: $m_1, toggled: $toggled)';

    AssociatedDataEnum_Bar copyWith([
        String? named,
        TestAPI.AssociatedDataEnum? m_1,
        bool? toggled
    ]) => AssociatedDataEnum_Bar(
        named ?? this.named,
        m_1 ?? this.m_1,
        toggled ?? this.toggled
    );
}

class AssociatedDataEnum_NoValue extends AssociatedDataEnum {
    const AssociatedDataEnum_NoValue();

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is AssociatedDataEnum_NoValue
    );

    @override
    int get hashCode =>runtimeType.hashCode;

    @override
    String toString() => 'AssociatedDataEnum.noValue()';

    AssociatedDataEnum_NoValue copyWith() => AssociatedDataEnum_NoValue();
}

class AssociatedDataEnum_None extends AssociatedDataEnum {
    const AssociatedDataEnum_None();

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is AssociatedDataEnum_None
    );

    @override
    int get hashCode =>runtimeType.hashCode;

    @override
    String toString() => 'AssociatedDataEnum.none()';

    AssociatedDataEnum_None copyWith() => AssociatedDataEnum_None();
}

class AssociatedDataEnum_SimpleEnum extends AssociatedDataEnum {
    const AssociatedDataEnum_SimpleEnum(
        this.value
    );

    final TestAPI.SimpleEnum value;

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is AssociatedDataEnum_SimpleEnum
        && const DeepCollectionEquality().equals(other.value, value)
    );

    @override
    int get hashCode =>Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(value)
    );

    @override
    String toString() => 'AssociatedDataEnum.simpleEnum(value: $value)';

    AssociatedDataEnum_SimpleEnum copyWith([
        TestAPI.SimpleEnum? value
    ]) => AssociatedDataEnum_SimpleEnum(
        value ?? this.value
    );
}
