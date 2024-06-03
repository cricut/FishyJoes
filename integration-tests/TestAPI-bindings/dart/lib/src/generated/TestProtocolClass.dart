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
import './EmptyStruct.dart' as TestAPI;
import './ExternalWitness_AProtocol.dart' as TestAPI;
import './ExternalWitness_TestAsyncFunctions.dart' as TestAPI;
import './ExternalWitness_TestDefaultComputedProperties.dart' as TestAPI;
import './ExternalWitness_TestDifferingExportNameProtocolDiffy.dart' as TestAPI;
import './ExternalWitness_TestLeadingUnderscoredProp.dart' as TestAPI;
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
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MutableStruct.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
import './TestAsyncForeignSideFunctionsStruct.dart' as TestAPI;
import './TestAsyncFunctions.dart' as TestAPI;
import './TestAsyncSwiftSideFunctionsClass.dart' as TestAPI;
import './TestDefaultComputedProperties.dart' as TestAPI;
import './TestDefaultComputedPropertiesEnum.dart' as TestAPI;
import './TestDefaultComputedPropertiesReference.dart' as TestAPI;
import './TestDefaultComputedPropertiesStruct.dart' as TestAPI;
import './TestDifferingExportNameProtocolDiffy.dart' as TestAPI;
import './TestDifferingExportNameStruct.dart' as TestAPI;
import './TestLeadingUnderscoredProp.dart' as TestAPI;
import './TestLeadingUnderscoredPropStruct.dart' as TestAPI;
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

/// <!-- FishyJoes.exportReference(TestProtocolClass) -->
class TestProtocolClass extends SwiftReference implements TestAPI.TestMethodsProtocol, TestAPI.TestOptionalsProtocol, TestAPI.TestPropertiesProtocol {
    TestProtocolClass(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(TestProtocolClass(ref))
    );

    @override
    String toString() => 'TestProtocolClass(corge: $corge, flarp: $flarp, frobby: $frobby)';

    /// <!-- FishyJoes.export(corge) -->
    String get corge =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String>(f__iota_get_TestAPI_TestProtocolClass_corge(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    void set corge(String value) {
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(value, (_valueHandle) =>
                check((exn) =>
                    f__iota_set_TestAPI_TestProtocolClass_corge(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
                )
            )
        )
        ;
    }
    /// <!-- FishyJoes.export(flarp) -->
    String? get flarp =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String?>(f__iota_get_TestAPI_TestProtocolClass_flarp(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    void set flarp(String? value) {
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(value, (_valueHandle) =>
                check((exn) =>
                    f__iota_set_TestAPI_TestProtocolClass_flarp(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
                )
            )
        )
        ;
    }
    /// <!-- FishyJoes.export(frobby) -->
    List<int> get frobby =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<List<int>>(f__iota_get_TestAPI_TestProtocolClass_frobby(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// <!-- FishyJoes.export(foo) -->
    void foo(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolClass_foo(Loader.shared.env, _thisHandle.ptr, _exn))
        )
    ;

    /// <!-- FishyJoes.export(bar) -->
    bool bar(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolClass_bar(Loader.shared.env, _thisHandle.ptr, _exn))
        )
    ;

    /// <!-- FishyJoes.export(baz) -->
    void baz(
        bool qux,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolClass_baz(Loader.shared.env, _thisHandle.ptr, qux, _exn))
        )
    ;

    /// <!-- FishyJoes.export(garply) -->
    String garply(
        String str,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(str, (_strHandle) =>
                consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolClass_garply(Loader.shared.env, _thisHandle.ptr, _strHandle.ptr, _exn)))
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
                consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolClass_xyzzy(Loader.shared.env, _thisHandle.ptr, thud, _graultHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(plugh) -->
    tuple.Tuple3<bool, int, String> plugh(
        tuple.Tuple3<bool, double, List<String>> fred,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fred, (_fredHandle) =>
                consumeCreatedRef<tuple.Tuple3<bool, int, String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolClass_plugh(Loader.shared.env, _thisHandle.ptr, _fredHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(init) -->
    static TestAPI.TestProtocolClass init(
        String corge,
        {
            String? flarp = null,
        }
    ) =>
        GCRef.using(corge, (_corgeHandle) =>
            GCRef.using(flarp, (_flarpHandle) =>
                consumeCreatedRef<TestAPI.TestProtocolClass>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolClass_init(Loader.shared.env, _corgeHandle.ptr, _flarpHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(wombat) -->
    double? wombat(
        int? zxc,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(zxc, (_zxcHandle) =>
                consumeCreatedRef<double?>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolClass_wombat(Loader.shared.env, _thisHandle.ptr, _zxcHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(spqr) -->
    int spqr(
        TestAPI.AssociatedDataEnum pippo,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(pippo, (_pippoHandle) =>
                check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolClass_spqr(Loader.shared.env, _thisHandle.ptr, _pippoHandle.ptr, _exn))
            )
        )
    ;

    static late bool Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolClass_bar;
    static late void Function(
        Env env,
        UnownedRef _this,
        bool qux,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolClass_baz;
    static late void Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolClass_foo;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef str,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolClass_garply;
    static late CreatedRef Function(
        Env env,
        UnownedRef corge,
        UnownedRef flarp,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolClass_init;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fred,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolClass_plugh;
    static late int Function(
        Env env,
        UnownedRef _this,
        UnownedRef pippo,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolClass_spqr;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef zxc,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolClass_wombat;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        int thud,
        UnownedRef grault,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolClass_xyzzy;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestProtocolClass_corge;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestProtocolClass_flarp;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_TestProtocolClass_frobby;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef corge,
        OutCreatedRef _exn
    ) f__iota_set_TestAPI_TestProtocolClass_corge;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef flarp,
        OutCreatedRef _exn
    ) f__iota_set_TestAPI_TestProtocolClass_flarp;
}
