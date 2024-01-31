import './AssociatedDataEnum.dart' as TestAPI;
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
import './Functions_TheError.dart' as TestAPI;
import './Methods.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Ranges.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
import './TestMethodsProtocol.dart' as TestAPI;
import './TestPropertiesProtocol.dart' as TestAPI;
import './TestProtocolClass.dart' as TestAPI;
import './TestProtocolEnum.dart' as TestAPI;
import './TestProtocolStruct.dart' as TestAPI;
import './TestStaticProtocol.dart' as TestAPI;
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

/// <!-- FishyJoes.export(TestProtocolStruct, protocols: [TestMethodsProtocol, TestPropertiesProtocol, TestStaticProtocol]) -->
class TestProtocolStruct implements TestAPI.TestMethodsProtocol, TestAPI.TestPropertiesProtocol, TestAPI.TestStaticProtocol {
    String corge;

    TestProtocolStruct({
        required this.corge
    });

    static CreatedRef ffi_constructor(
        ConsumedRef corge,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(TestProtocolStruct(
            corge: consumeRef(corge),
        ))
    );

    static CreatedRef ffi_get_corge(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestProtocolStruct>(obj).corge
        )
    );
    static void ffi_set_corge(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<TestProtocolStruct>(obj).corge = consumeRef<String>(newValue);
    });

    @override
    String toString() => 'TestProtocolStruct(corge: $corge)';

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is TestProtocolStruct &&
            (
                const DeepCollectionEquality().equals(other.corge, corge)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(corge)
    );

    TestProtocolStruct copyWith({
        String? corge
    }) => TestProtocolStruct(
        corge: corge ?? this.corge
    );

    /// <!-- FishyJoes.export(frob) -->
    List<double> get frob =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<List<double>>(f__iota_get_TestAPI_TestProtocolStruct_frob(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(blarg) -->
    static String get blarg =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_TestAPI_TestProtocolStruct_blarg(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(foo) -->
    void foo(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolStruct_foo(Loader.shared.env, _thisHandle.ptr, _exn))
        )
    ;

    /// <!-- FishyJoes.export(bar) -->
    bool bar(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolStruct_bar(Loader.shared.env, _thisHandle.ptr, _exn))
        )
    ;

    /// <!-- FishyJoes.export(baz) -->
    void baz(
        bool qux,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolStruct_baz(Loader.shared.env, _thisHandle.ptr, qux, _exn))
        )
    ;

    /// <!-- FishyJoes.export(garply) -->
    String garply(
        String str,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(str, (_strHandle) =>
                consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolStruct_garply(Loader.shared.env, _thisHandle.ptr, _strHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(xyzzy) -->
    String xyzzy(
        int thud,
        List<double> grault,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(grault, (_graultHandle) =>
                consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolStruct_xyzzy(Loader.shared.env, _thisHandle.ptr, thud, _graultHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(plugh) -->
    tuple.Tuple3<bool, int, String> plugh(
        tuple.Tuple3<bool, double, List<String>> fred,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fred, (_fredHandle) =>
                consumeCreatedRef<tuple.Tuple3<bool, int, String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolStruct_plugh(Loader.shared.env, _thisHandle.ptr, _fredHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(wibble) -->
    static String wibble(
    ) =>
        consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolStruct_wibble(Loader.shared.env, _exn)))
    ;

    static late bool Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolStruct_bar;
    static late void Function(
        Env env,
        UnownedRef _this,
        bool qux,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolStruct_baz;
    static late void Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolStruct_foo;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef str,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolStruct_garply;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fred,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolStruct_plugh;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolStruct_wibble;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        int thud,
        UnownedRef grault,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolStruct_xyzzy;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestProtocolStruct_blarg;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestProtocolStruct_frob;
}
