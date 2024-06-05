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
import './EmptyClass1.dart' as TestAPI;
import './EmptyClass2.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './EmptyStruct.dart' as TestAPI;
import './EmptyStruct2.dart' as TestAPI;
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

/// <!-- FishyJoes.export(TestMethodsProtocol) -->
abstract class TestMethodsProtocol {
    void foo(
    );

    bool bar(
    );

    void baz(
        bool qux
    );

    String garply(
        String m_0
    );

    String xyzzy(
        int thud,
        List<double> grault
    );

    tuple.Tuple3<bool, int, String> plugh(
        tuple.Tuple3<bool, double, List<String>> fred
    );
}

extension TestMethodsProtocol_DefaultImplementations on TestMethodsProtocol {
}

extension TestMethodsProtocol_FfiHooks on TestMethodsProtocol {
    static void ffi_foo(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<TestMethodsProtocol>(obj).foo(
        )
    );

    static bool ffi_bar(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<TestMethodsProtocol>(obj).bar(
        )
    ) ?? false;

    static void ffi_baz(
        UnownedRef obj,
        bool qux,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<TestMethodsProtocol>(obj).baz(
            qux
        )
    );

    static CreatedRef ffi_garply(
        UnownedRef obj,
        UnownedRef m_0,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestMethodsProtocol>(obj).garply(
                peekRef(m_0)
            )
        )
    );

    static CreatedRef ffi_xyzzy(
        UnownedRef obj,
        int thud,
        UnownedRef grault,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestMethodsProtocol>(obj).xyzzy(
                thud,
                peekRef(grault)
            )
        )
    );

    static CreatedRef ffi_plugh(
        UnownedRef obj,
        UnownedRef fred,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestMethodsProtocol>(obj).plugh(
                peekRef(fred)
            )
        )
    );
}
