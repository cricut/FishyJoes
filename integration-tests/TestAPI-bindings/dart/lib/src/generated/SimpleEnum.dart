import './AssociatedDataEnum.dart' as TestAPI;
import './AssociatedDataEnum.dart';
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart';
import './AttributedStrings.dart' as TestAPI;
import './AttributedStrings.dart';
import './Bytes.dart' as TestAPI;
import './Bytes.dart';
import './ClosedRanges.dart' as TestAPI;
import './ClosedRanges.dart';
import './Collections.dart' as TestAPI;
import './Collections.dart';
import './Collections_CollectionHolder.dart' as TestAPI;
import './Collections_CollectionHolder.dart';
import './DefaultArguments.dart' as TestAPI;
import './DefaultArguments.dart';
import './Deprecations.dart' as TestAPI;
import './Deprecations.dart';
import './EmptyEnum.dart' as TestAPI;
import './EmptyEnum.dart';
import './Functions.dart' as TestAPI;
import './Functions.dart';
import './Functions_TheError.dart' as TestAPI;
import './Functions_TheError.dart';
import './Methods.dart' as TestAPI;
import './Methods.dart';
import './Primitives.dart' as TestAPI;
import './Primitives.dart';
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart';
import './Ranges.dart' as TestAPI;
import './Ranges.dart';
import './SimpleEnum.dart' as TestAPI;
import './SimpleEnum.dart';
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart';
import './Strings.dart' as TestAPI;
import './Strings.dart';
import './Structs.dart' as TestAPI;
import './Structs.dart';
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart';
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart';
import './Structs_ReferenceStruct.dart' as TestAPI;
import './Structs_ReferenceStruct.dart';
import './Tuples.dart' as TestAPI;
import './Tuples.dart';
import './URLs.dart' as TestAPI;
import './URLs.dart';
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart';
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

part 'SimpleEnum.freezed.dart';

/// <!-- FishyJoes.export(SimpleEnum) -->
@freezed
class SimpleEnum with _$SimpleEnum {
    factory SimpleEnum.red(
    ) = SimpleEnum_Red;

    factory SimpleEnum.green(
    ) = SimpleEnum_Green;

    factory SimpleEnum.blue(
    ) = SimpleEnum_Blue;

    SimpleEnum._() {}

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
        peekRef<SimpleEnum>(obj).map(
            red: (_) => 0,
            green: (_) => 1,
            blue: (_) => 2,
        )
    );

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
