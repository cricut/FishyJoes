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

/// <!-- FishyJoes.export(SimpleEnum) -->
sealed class SimpleEnum {
    const factory SimpleEnum.red(
    ) = SimpleEnum_Red;

    const factory SimpleEnum.green(
    ) = SimpleEnum_Green;

    const factory SimpleEnum.blue(
    ) = SimpleEnum_Blue;

    const SimpleEnum();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        final peekedObj = peekRef<SimpleEnum>(obj);
        if (peekedObj is SimpleEnum_Red) { return 0; }
        else if (peekedObj is SimpleEnum_Green) { return 1; }
        else if (peekedObj is SimpleEnum_Blue) { return 2; }
        else { throw UnsupportedError('Unknown SimpleEnum subclass'); }
    });

    static CreatedRef newRed(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(SimpleEnum_Red(
        ))
    );

    static void extractRed(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<SimpleEnum_Red>(obj);
        });
    }

    static CreatedRef newGreen(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(SimpleEnum_Green(
        ))
    );

    static void extractGreen(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<SimpleEnum_Green>(obj);
        });
    }

    static CreatedRef newBlue(
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(SimpleEnum_Blue(
        ))
    );

    static void extractBlue(
        UnownedRef obj,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            final _self = peekRef<SimpleEnum_Blue>(obj);
        });
    }

    /// <!-- FishyJoes.export(hex) -->
    int get hex =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_SimpleEnum_hex(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// <!-- FishyJoes.export(favoriteColor) -->
    static TestAPI.SimpleEnum get favoriteColor =>
        check((exn) =>
            consumeCreatedRef<TestAPI.SimpleEnum>(f__iota_get_TestAPI_SimpleEnum_favoriteColor(Loader.shared.env, exn))
        )
    ;
    static void set favoriteColor(TestAPI.SimpleEnum value) {
        GCRef.using(value, (_valueHandle) =>
            check((exn) =>
                f__iota_set_TestAPI_SimpleEnum_favoriteColor(Loader.shared.env, _valueHandle.ptr, exn)
            )
        )
        ;
    }
    /// <!-- FishyJoes.export(pickAColor) -->
    static TestAPI.SimpleEnum? pickAColor(
        int rawValue,
    ) =>
        consumeCreatedRef<TestAPI.SimpleEnum?>(check((OutCreatedRef _exn) => f__iota_TestAPI_SimpleEnum_pickAColor(Loader.shared.env, rawValue, _exn)))
    ;

    /// <!-- FishyJoes.export(hexMethod) -->
    String hexMethod(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_SimpleEnum_hexMethod(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(resetFavoriteColor) -->
    static void resetFavoriteColor(
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_SimpleEnum_resetFavoriteColor(Loader.shared.env, _exn))
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_TestAPI_SimpleEnum_hexMethod;
    static late CreatedRef Function(
        Env env,
        int rawValue,
        OutCreatedRef _exn
    ) f__iota_TestAPI_SimpleEnum_pickAColor;
    static late void Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_TestAPI_SimpleEnum_resetFavoriteColor;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_SimpleEnum_favoriteColor;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_SimpleEnum_hex;
    static late void Function(
        Env env,
        UnownedRef favoriteColor,
        OutCreatedRef _exn
    ) f__iota_set_TestAPI_SimpleEnum_favoriteColor;
}

class SimpleEnum_Red extends SimpleEnum {
    const SimpleEnum_Red();

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is SimpleEnum_Red
        );
    }

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'SimpleEnum.red()';

    SimpleEnum_Red copyWith() => SimpleEnum_Red();
}

class SimpleEnum_Green extends SimpleEnum {
    const SimpleEnum_Green();

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is SimpleEnum_Green
        );
    }

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'SimpleEnum.green()';

    SimpleEnum_Green copyWith() => SimpleEnum_Green();
}

class SimpleEnum_Blue extends SimpleEnum {
    const SimpleEnum_Blue();

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is SimpleEnum_Blue
        );
    }

    @override
    int get hashCode => runtimeType.hashCode;

    @override
    String toString() => 'SimpleEnum.blue()';

    SimpleEnum_Blue copyWith() => SimpleEnum_Blue();
}
