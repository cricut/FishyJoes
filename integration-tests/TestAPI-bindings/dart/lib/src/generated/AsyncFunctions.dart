import './AssociatedDataEnum.dart' as TestAPI;
import './AssociatedDataEnum.dart';
import './AsyncFunctions.dart' as TestAPI;
import './AsyncFunctions.dart';
import './AsyncFunctions_TheError.dart' as TestAPI;
import './AsyncFunctions_TheError.dart';
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
import './Structs_MutableStruct.dart' as TestAPI;
import './Structs_MutableStruct.dart';
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

/// <!-- FishyJoes.export(AsyncFunctions) -->
class AsyncFunctions {
    AsyncFunctions._() {}

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
        throw UnsupportedError('This class is supposed to be unihabited')
    );

    /// <!-- FishyJoes.export(const42) -->
    static int Function() get const42 =>
        check((exn) =>
            consumeCreatedRef<int Function()>(f__iota_get_TestAPI_AsyncFunctions_const42(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(abs) -->
    static int Function(int) get abs =>
        check((exn) =>
            consumeCreatedRef<int Function(int)>(f__iota_get_TestAPI_AsyncFunctions_abs(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(intCompose) -->
    static int Function(int) Function(int Function(int), int Function(int)) get intCompose =>
        check((exn) =>
            consumeCreatedRef<int Function(int) Function(int Function(int), int Function(int))>(f__iota_get_TestAPI_AsyncFunctions_intCompose(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(add3Things) -->
    static double Function(double, double, int) get add3Things =>
        check((exn) =>
            consumeCreatedRef<double Function(double, double, int)>(f__iota_get_TestAPI_AsyncFunctions_add3Things(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(makeList) -->
    static List<String> Function(String, String, String, String) get makeList =>
        check((exn) =>
            consumeCreatedRef<List<String> Function(String, String, String, String)>(f__iota_get_TestAPI_AsyncFunctions_makeList(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(fifthThing) -->
    static int Function() Function(String, int, double, String, int Function()) get fifthThing =>
        check((exn) =>
            consumeCreatedRef<int Function() Function(String, int, double, String, int Function())>(f__iota_get_TestAPI_AsyncFunctions_fifthThing(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(sixthThing) -->
    static int Function(String, int, double, String, int Function(), int) get sixthThing =>
        check((exn) =>
            consumeCreatedRef<int Function(String, int, double, String, int Function(), int)>(f__iota_get_TestAPI_AsyncFunctions_sixthThing(Loader.shared.env, exn))
        )
    ;

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_abs;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_add3Things;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_const42;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_fifthThing;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_intCompose;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_makeList;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_AsyncFunctions_sixthThing;
}
