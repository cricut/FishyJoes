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

/// <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
class Structs_MemberwiseStruct {
    final String immutable;
    String mutable;

    Structs_MemberwiseStruct({
        required this.immutable,
        required this.mutable
    });

    static CreatedRef ffi_constructor(
        ConsumedRef immutable,
        ConsumedRef mutable,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Structs_MemberwiseStruct(
            immutable: consumeRef(immutable),
            mutable: consumeRef(mutable),
        ))
    );

    static CreatedRef ffi_get_immutable(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_MemberwiseStruct>(obj).immutable
        )
    );

    static CreatedRef ffi_get_mutable(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_MemberwiseStruct>(obj).mutable
        )
    );
    static void ffi_set_mutable(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_MemberwiseStruct>(obj).mutable = consumeRef<String>(newValue);
    });

    @override
    String toString() => 'Structs_MemberwiseStruct(immutable: $immutable, mutable: $mutable)';

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is Structs_MemberwiseStruct &&
            (
                const DeepCollectionEquality().equals(other.immutable, immutable) &&
                const DeepCollectionEquality().equals(other.mutable, mutable)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(immutable), 
        const DeepCollectionEquality().hash(mutable)
    );

    Structs_MemberwiseStruct copyWith({
        String? immutable,
        String? mutable
    }) => Structs_MemberwiseStruct(
        immutable: immutable ?? this.immutable,
        mutable: mutable ?? this.mutable
    );

    /// <!-- FishyJoes.export(create) -->
    static TestAPI.Structs_MemberwiseStruct create(
    ) =>
        consumeCreatedRef<TestAPI.Structs_MemberwiseStruct>(check((OutCreatedRef _exn) => f__iota_TestAPI_Structs_MemberwiseStruct_create(Loader.shared.env, _exn)))
    ;

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Structs_MemberwiseStruct_create;
}
