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
import './TestProtocol.dart' as TestAPI;
import './TestProtocolEnum.dart' as TestAPI;
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

/// <!-- FishyJoes.export(TestProtocolEnum, protocols: [TestProtocol]) -->
sealed class TestProtocolEnum implements TestAPI.TestProtocol {
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

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef str,
        OutCreatedRef _exn
    ) f__iota_TestAPI_TestProtocolEnum_garply;
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
