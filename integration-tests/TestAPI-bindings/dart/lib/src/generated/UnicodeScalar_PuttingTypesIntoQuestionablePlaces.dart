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
import './Structs_EmptyStruct.dart' as TestAPI;
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

/// <!-- FishyJoes.export(UnicodeScalar_PuttingTypesIntoQuestionablePlaces) -->
sealed class UnicodeScalar_PuttingTypesIntoQuestionablePlaces {
    const factory UnicodeScalar_PuttingTypesIntoQuestionablePlaces.thing(
    ) = UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing;

    const UnicodeScalar_PuttingTypesIntoQuestionablePlaces();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        final peekedObj = peekRef<UnicodeScalar_PuttingTypesIntoQuestionablePlaces>(obj);
        if (peekedObj is UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing) { return 0; }
        else { throw UnsupportedError('Unknown UnicodeScalar_PuttingTypesIntoQuestionablePlaces subclass'); }
    });

    static CreatedRef newThing(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing(
        ))
    );

    static void extractThing(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing>(obj);
        });
    }

    /// <!-- FishyJoes.export(testCall) -->
    int testCall(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            check((OutCreatedRef _exn) => f__iota_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall(Loader.shared.env, _thisHandle.ptr, _exn))
        )
    ;

    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall;
}

class UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing extends UnicodeScalar_PuttingTypesIntoQuestionablePlaces {
    const UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing();

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing
        );
    }

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'UnicodeScalar_PuttingTypesIntoQuestionablePlaces.thing()';

    UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing copyWith() => UnicodeScalar_PuttingTypesIntoQuestionablePlaces_Thing();
}
