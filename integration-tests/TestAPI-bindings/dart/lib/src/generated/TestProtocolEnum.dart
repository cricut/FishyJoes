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
import './ExternalWitness_TestAsyncFunctions.dart' as TestAPI;
import './ExternalWitness_TestDefaultComputedProperties.dart' as TestAPI;
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
import './TestDefaultComputedPropertiesStruct.dart' as TestAPI;
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

/// <!-- FishyJoes.export(TestProtocolEnum, conformances: [TestMethodsProtocol]) -->
sealed class TestProtocolEnum implements TestAPI.TestMethodsProtocol {
    const factory TestProtocolEnum.qux(
    ) = TestProtocolEnum_Qux;

    const TestProtocolEnum();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        final peekedObj = peekRef<TestProtocolEnum>(obj);
        if (peekedObj is TestProtocolEnum_Qux) { return 0; }
        else { throw UnsupportedError('Unknown TestProtocolEnum subclass'); }
    });

    static CreatedRef newQux(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(TestProtocolEnum_Qux(
        ))
    );

    static void extractQux(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<TestProtocolEnum_Qux>(obj);
        });
    }

    /// <!-- FishyJoes.export(foo) -->
    void foo(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolEnum_foo(Loader.shared.env, _thisHandle.ptr, _exn))
        )
    ;

    /// <!-- FishyJoes.export(bar) -->
    bool bar(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolEnum_bar(Loader.shared.env, _thisHandle.ptr, _exn))
        )
    ;

    /// <!-- FishyJoes.export(baz) -->
    void baz(
        bool qux,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolEnum_baz(Loader.shared.env, _thisHandle.ptr, qux, _exn))
        )
    ;

    /// <!-- FishyJoes.export(garply) -->
    String garply(
        String str,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(str, (_strHandle) =>
                consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolEnum_garply(Loader.shared.env, _thisHandle.ptr, _strHandle.ptr, _exn)))
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
                consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolEnum_xyzzy(Loader.shared.env, _thisHandle.ptr, thud, _graultHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(plugh) -->
    tuple.Tuple3<bool, int, String> plugh(
        tuple.Tuple3<bool, double, List<String>> fred,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(fred, (_fredHandle) =>
                consumeCreatedRef<tuple.Tuple3<bool, int, String>>(check((OutCreatedRef _exn) => f__iota_TestAPI_TestProtocolEnum_plugh(Loader.shared.env, _thisHandle.ptr, _fredHandle.ptr, _exn)))
            )
        )
    ;

    static late bool Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolEnum_bar;
    static late void Function(
        Env env,
        UnownedRef _this,
        bool qux,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolEnum_baz;
    static late void Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolEnum_foo;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef str,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolEnum_garply;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef fred,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolEnum_plugh;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        int thud,
        UnownedRef grault,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolEnum_xyzzy;
}

class TestProtocolEnum_Qux extends TestProtocolEnum {
    const TestProtocolEnum_Qux();

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is TestProtocolEnum_Qux
        );
    }

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'TestProtocolEnum.qux()';

    TestProtocolEnum_Qux copyWith() => TestProtocolEnum_Qux();
}
