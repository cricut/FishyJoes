import './AssociatedDataEnum.dart' as TestAPI;
import './AssociatedDataEnum.dart';
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart';
import './AttributedStrings.dart' as TestAPI;
import './AttributedStrings.dart';
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
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart';
import './Strings.dart' as TestAPI;
import './Strings.dart';
import './Structs.dart' as TestAPI;
import './Structs.dart';
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart';
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart';
import './Structs_ReferenceStruct.dart' as TestAPI;
import './Structs_ReferenceStruct.dart';
import './Tuples.dart' as TestAPI;
import './Tuples.dart';
import './URLs.dart' as TestAPI;
import './URLs.dart';
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart';
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(AssociatedDataEnum) -->
sealed class AssociatedDataEnum {
    const factory AssociatedDataEnum.thing(
        int value
    ) = AssociatedDataEnum_Thing;

    const factory AssociatedDataEnum.other(
        String unnamed,
        int m_1
    ) = AssociatedDataEnum_Other;

    const factory AssociatedDataEnum.bar(
        String named,
        TestAPI.AssociatedDataEnum m_1
    ) = AssociatedDataEnum_Bar;

    const factory AssociatedDataEnum.noValue(
    ) = AssociatedDataEnum_NoValue;

    const factory AssociatedDataEnum.simpleEnum(
        TestAPI.SimpleEnum value
    ) = AssociatedDataEnum_SimpleEnum;

    const AssociatedDataEnum();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        final peekedObj = peekRef<AssociatedDataEnum>(obj);
        if (peekedObj is AssociatedDataEnum_Thing) { return 0; }
        else if (peekedObj is AssociatedDataEnum_Other) { return 1; }
        else if (peekedObj is AssociatedDataEnum_Bar) { return 2; }
        else if (peekedObj is AssociatedDataEnum_NoValue) { return 3; }
        else if (peekedObj is AssociatedDataEnum_SimpleEnum) { return 4; }
        throw UnsupportedError('Unknown AssociatedDataEnum subclass');
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
        ffi.Pointer<ffi.Int> _value,
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
        ffi.Pointer<ffi.Int> __1,
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
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(AssociatedDataEnum_Bar(
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
            final _self = peekRef<AssociatedDataEnum_Bar>(obj);
            _named.value = createRef(_self.named);
            __1.value = createRef(_self.m_1);
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

    /// <!-- FishyJoes.export(staticThing) -->
    static TestAPI.AssociatedDataEnum get staticThing =>
        check((exn) =>
            consumeCreatedRef<TestAPI.AssociatedDataEnum>(f__iota_get_TestAPI_AssociatedDataEnum_staticThing(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(intValue) -->
    int get intValue =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_AssociatedDataEnum_intValue(Loader.shared.env, _thisHandle.ptr, exn)
            )
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
}

class AssociatedDataEnum_Other extends AssociatedDataEnum {
    const AssociatedDataEnum_Other(
        this.unnamed,
        this.m_1
    );

    final String unnamed;
    final int m_1;
}

class AssociatedDataEnum_Bar extends AssociatedDataEnum {
    const AssociatedDataEnum_Bar(
        this.named,
        this.m_1
    );

    final String named;
    final TestAPI.AssociatedDataEnum m_1;
}

class AssociatedDataEnum_NoValue extends AssociatedDataEnum {
    const AssociatedDataEnum_NoValue(
    );
}

class AssociatedDataEnum_SimpleEnum extends AssociatedDataEnum {
    const AssociatedDataEnum_SimpleEnum(
        this.value
    );

    final TestAPI.SimpleEnum value;
}
