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
import './ExternalWitness_TestMethodsProtocol.dart' as TestAPI;
import './ExternalWitness_TestOptionalsProtocol.dart' as TestAPI;
import './ExternalWitness_TestPropertiesProtocol.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Methods.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Ranges.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_DougStruct.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MutableStruct.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
import './TestMethodsProtocol.dart' as TestAPI;
import './TestOptionalsProtocol.dart' as TestAPI;
import './TestPropertiesProtocol.dart' as TestAPI;
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

// ignore_for_file: unused_import
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: library_prefixes
// ignore_for_file: file_names
// ignore_for_file: annotate_overrides

/// <!-- FishyJoes.export(AProtocolImplementation, conformances: [AProtocol]) -->
class AProtocolImplementation implements TestAPI.AProtocol {
    String foo;
    bool baz;

    AProtocolImplementation({
        required String foo,
        required bool baz
    }):
        this.foo = foo,
        this.baz = baz;

    static CreatedRef ffi_constructor(
        ConsumedRef foo,
        bool baz,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(AProtocolImplementation(
            foo: consumeRef(foo),
            baz: baz,
        ))
    );

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

    static CreatedRef ffi_bar(
        UnownedRef obj,
        int x,
        int y,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<AProtocolImplementation>(obj).bar(
                x,
                y
            )
        )
    );

    @override
    String toString() => 'AProtocolImplementation(foo: $foo, baz: $baz)';

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is AProtocolImplementation &&
            (
                const DeepCollectionEquality().equals(other.foo, foo) &&
                const DeepCollectionEquality().equals(other.baz, baz)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(foo), 
        const DeepCollectionEquality().hash(baz)
    );

    AProtocolImplementation copyWith({
        String? foo,
        bool? baz
    }) => AProtocolImplementation(
        foo: foo ?? this.foo,
        baz: baz ?? this.baz
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
