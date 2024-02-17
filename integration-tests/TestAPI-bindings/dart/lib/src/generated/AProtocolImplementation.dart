import './AProtocolImplementation.dart' as TestAPI;
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
import './TestProtocolClass.dart' as TestAPI;
import './TestProtocolEnum.dart' as TestAPI;
import './TestProtocolStruct.dart' as TestAPI;
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

/// <!-- FishyJoes.export(AProtocolImplementation, conformances: [AProtocol]) -->
class AProtocolImplementation {
    bool baz;
    String foo;

    AProtocolImplementation({
        required bool baz,
        required String foo
    }):
        this.baz = baz,
        this.foo = foo;

    static CreatedRef ffi_constructor(
        bool baz,
        ConsumedRef foo,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(AProtocolImplementation(
            baz: baz,
            foo: consumeRef(foo),
        ))
    );

    static bool ffi_get_baz(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<AProtocolImplementation>(obj).baz
    ) ?? false;
    static void ffi_set_baz(
        UnownedRef obj,
        bool newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<AProtocolImplementation>(obj).baz = newValue;
    });

    static CreatedRef ffi_get_foo(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<AProtocolImplementation>(obj).foo
        )
    );
    static void ffi_set_foo(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<AProtocolImplementation>(obj).foo = consumeRef<String>(newValue);
    });

    @override
    String toString() => 'AProtocolImplementation(baz: $baz, foo: $foo)';

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is AProtocolImplementation &&
            (
                const DeepCollectionEquality().equals(other.baz, baz) &&
                const DeepCollectionEquality().equals(other.foo, foo)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(baz), 
        const DeepCollectionEquality().hash(foo)
    );

    AProtocolImplementation copyWith({
        bool? baz,
        String? foo
    }) => AProtocolImplementation(
        baz: baz ?? this.baz,
        foo: foo ?? this.foo
    );

    /// <!-- FishyJoes.export(bar) -->
    TestAPI.AProtocol bar(
        int x,
        int y,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<TestAPI.AProtocol>(check((OutCreatedRef _exn) => f__iota_TestAPI_AProtocolImplementation_bar(Loader.shared.env, _thisHandle.ptr, x, y, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        int x,
        int y,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AProtocolImplementation_bar;
}
