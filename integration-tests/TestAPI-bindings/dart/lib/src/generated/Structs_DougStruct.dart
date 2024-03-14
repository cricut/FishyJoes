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

/// <!-- FishyJoes.export(Structs.DougStruct) -->
class Structs_DougStruct {
    String str;

    Structs_DougStruct({
        required String str
    }):
        this.str = str;

    static CreatedRef ffi_constructor(
        ConsumedRef str,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Structs_DougStruct(
            str: consumeRef(str),
        ))
    );
    @override
    String toString() => 'Structs_DougStruct(str: $str)';

    static CreatedRef ffi_get_str(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_DougStruct>(obj).str
        )
    );
    static void ffi_set_str(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_DougStruct>(obj).str = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_cat(
        UnownedRef obj,
        ConsumedRef str,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_DougStruct>(obj).cat(
                consumeRef(str)
            )
        )
    );

    static CreatedRef ffi_create(
        UnownedRef obj,
        ConsumedRef str,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            Structs_DougStruct.create(
                consumeRef(str)
            )
        )
    );

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is Structs_DougStruct &&
            (
                const DeepCollectionEquality().equals(other.str, str)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(str)
    );

    Structs_DougStruct copyWith({
        String? str
    }) => Structs_DougStruct(
        str: str ?? this.str
    );

    /// <!-- FishyJoes.export(cat) -->
    String cat(
        String str,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(str, (_strHandle) =>
                consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_DougStruct_cat(Loader.shared.env, _thisHandle.ptr, _strHandle.ptr, _exn)))
            )
        )
    ;

    /// <!-- FishyJoes.export(create) -->
    static TestAPI.Structs_DougStruct create(
        String str,
    ) =>
        GCRef.using(str, (_strHandle) =>
            consumeCreatedRef<TestAPI.Structs_DougStruct>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_DougStruct_create(Loader.shared.env, _strHandle.ptr, _exn)))
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        UnownedRef str,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_DougStruct_cat;
    static late CreatedRef Function(
        Env env,
        UnownedRef str,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_DougStruct_create;
}
