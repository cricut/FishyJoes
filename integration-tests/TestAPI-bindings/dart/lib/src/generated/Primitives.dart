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

/// <!-- FishyJoes.export(Primitives) -->
class Primitives {
    Primitives._();

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
        throw UnsupportedError('This class is supposed to be uninhabited');
    });

    /// <!-- FishyJoes.export(falseBool) -->
    static bool get falseBool =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_falseBool(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(trueBool) -->
    static bool get trueBool =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_trueBool(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroUInt8) -->
    static int get zeroUInt8 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_zeroUInt8(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(minUInt8) -->
    static int get minUInt8 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_minUInt8(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(maxUInt8) -->
    static int get maxUInt8 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_maxUInt8(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroUInt16) -->
    static int get zeroUInt16 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_zeroUInt16(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(minUInt16) -->
    static int get minUInt16 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_minUInt16(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(maxUInt16) -->
    static int get maxUInt16 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_maxUInt16(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroUInt32) -->
    static int get zeroUInt32 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_zeroUInt32(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(minUInt32) -->
    static int get minUInt32 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_minUInt32(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(maxUInt32) -->
    static int get maxUInt32 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_maxUInt32(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroUInt64) -->
    static int get zeroUInt64 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_zeroUInt64(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(minUInt64) -->
    static int get minUInt64 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_minUInt64(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(maxUInt64) -->
    static int get maxUInt64 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_maxUInt64(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroUInt) -->
    static int get zeroUInt =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_zeroUInt(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(minUInt) -->
    static int get minUInt =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_minUInt(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(maxUInt) -->
    static int get maxUInt =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_maxUInt(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt8) -->
    static int get zeroInt8 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_zeroInt8(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt8) -->
    static int get minInt8 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_minInt8(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt8) -->
    static int get maxInt8 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_maxInt8(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt16) -->
    static int get zeroInt16 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_zeroInt16(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt16) -->
    static int get minInt16 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_minInt16(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt16) -->
    static int get maxInt16 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_maxInt16(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt32) -->
    static int get zeroInt32 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_zeroInt32(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt32) -->
    static int get minInt32 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_minInt32(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt32) -->
    static int get maxInt32 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_maxInt32(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt64) -->
    static int get zeroInt64 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_zeroInt64(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt64) -->
    static int get minInt64 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_minInt64(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt64) -->
    static int get maxInt64 =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_maxInt64(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroInt) -->
    static int get zeroInt =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_zeroInt(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(minInt) -->
    static int get minInt =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_minInt(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(maxInt) -->
    static int get maxInt =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_maxInt(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroFloat) -->
    static double get zeroFloat =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_zeroFloat(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(minFloat) -->
    static double get minFloat =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_minFloat(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(maxFloat) -->
    static double get maxFloat =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_maxFloat(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(zeroDouble) -->
    static double get zeroDouble =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_zeroDouble(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(minDouble) -->
    static double get minDouble =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_minDouble(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(maxDouble) -->
    static double get maxDouble =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_maxDouble(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(bitCountUInt) -->
    static int get bitCountUInt =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_bitCountUInt(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(bitCountInt) -->
    static int get bitCountInt =>
        check((exn) =>
            f__iota_get_TestAPI_Primitives_bitCountInt(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(manyBool) -->
    static List<bool> get manyBool =>
        check((exn) =>
            consumeCreatedRef<List<bool>>(f__iota_get_TestAPI_Primitives_manyBool(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyUInt8) -->
    static List<int> get manyUInt8 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_TestAPI_Primitives_manyUInt8(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyUInt16) -->
    static List<int> get manyUInt16 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_TestAPI_Primitives_manyUInt16(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyUInt32) -->
    static List<int> get manyUInt32 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_TestAPI_Primitives_manyUInt32(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyUInt64) -->
    static List<int> get manyUInt64 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_TestAPI_Primitives_manyUInt64(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyUInt) -->
    static List<int> get manyUInt =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_TestAPI_Primitives_manyUInt(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyInt8) -->
    static List<int> get manyInt8 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_TestAPI_Primitives_manyInt8(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyInt16) -->
    static List<int> get manyInt16 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_TestAPI_Primitives_manyInt16(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyInt32) -->
    static List<int> get manyInt32 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_TestAPI_Primitives_manyInt32(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyInt64) -->
    static List<int> get manyInt64 =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_TestAPI_Primitives_manyInt64(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyInt) -->
    static List<int> get manyInt =>
        check((exn) =>
            consumeCreatedRef<List<int>>(f__iota_get_TestAPI_Primitives_manyInt(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyFloat) -->
    static List<double> get manyFloat =>
        check((exn) =>
            consumeCreatedRef<List<double>>(f__iota_get_TestAPI_Primitives_manyFloat(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyDouble) -->
    static List<double> get manyDouble =>
        check((exn) =>
            consumeCreatedRef<List<double>>(f__iota_get_TestAPI_Primitives_manyDouble(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeBool) -->
    static List<bool?> get manyMaybeBool =>
        check((exn) =>
            consumeCreatedRef<List<bool?>>(f__iota_get_TestAPI_Primitives_manyMaybeBool(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeUInt8) -->
    static List<int?> get manyMaybeUInt8 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Primitives_manyMaybeUInt8(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeUInt16) -->
    static List<int?> get manyMaybeUInt16 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Primitives_manyMaybeUInt16(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeUInt32) -->
    static List<int?> get manyMaybeUInt32 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Primitives_manyMaybeUInt32(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeUInt64) -->
    static List<int?> get manyMaybeUInt64 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Primitives_manyMaybeUInt64(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeUInt) -->
    static List<int?> get manyMaybeUInt =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Primitives_manyMaybeUInt(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeInt8) -->
    static List<int?> get manyMaybeInt8 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Primitives_manyMaybeInt8(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeInt16) -->
    static List<int?> get manyMaybeInt16 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Primitives_manyMaybeInt16(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeInt32) -->
    static List<int?> get manyMaybeInt32 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Primitives_manyMaybeInt32(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeInt64) -->
    static List<int?> get manyMaybeInt64 =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Primitives_manyMaybeInt64(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeInt) -->
    static List<int?> get manyMaybeInt =>
        check((exn) =>
            consumeCreatedRef<List<int?>>(f__iota_get_TestAPI_Primitives_manyMaybeInt(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeFloat) -->
    static List<double?> get manyMaybeFloat =>
        check((exn) =>
            consumeCreatedRef<List<double?>>(f__iota_get_TestAPI_Primitives_manyMaybeFloat(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(manyMaybeDouble) -->
    static List<double?> get manyMaybeDouble =>
        check((exn) =>
            consumeCreatedRef<List<double?>>(f__iota_get_TestAPI_Primitives_manyMaybeDouble(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(defaultPrimitiveHolder) -->
    static TestAPI.Primitives_PrimitiveHolder get defaultPrimitiveHolder =>
        check((exn) =>
            consumeCreatedRef<TestAPI.Primitives_PrimitiveHolder>(f__iota_get_TestAPI_Primitives_defaultPrimitiveHolder(Loader.shared.env, exn))
        )
    ;
    /// <!-- FishyJoes.export(echoBool) -->
    static bool echoBool(
        bool value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_echoBool(Loader.shared.env, value, _exn))
    ;

    /// <!-- FishyJoes.export(echoUInt8) -->
    static int echoUInt8(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_echoUInt8(Loader.shared.env, value, _exn))
    ;

    /// <!-- FishyJoes.export(echoUInt16) -->
    static int echoUInt16(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_echoUInt16(Loader.shared.env, value, _exn))
    ;

    /// <!-- FishyJoes.export(echoUInt32) -->
    static int echoUInt32(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_echoUInt32(Loader.shared.env, value, _exn))
    ;

    /// <!-- FishyJoes.export(echoUInt64) -->
    static int echoUInt64(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_echoUInt64(Loader.shared.env, value, _exn))
    ;

    /// <!-- FishyJoes.export(echoUInt) -->
    static int echoUInt(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_echoUInt(Loader.shared.env, value, _exn))
    ;

    /// <!-- FishyJoes.export(echoInt8) -->
    static int echoInt8(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_echoInt8(Loader.shared.env, value, _exn))
    ;

    /// <!-- FishyJoes.export(echoInt16) -->
    static int echoInt16(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_echoInt16(Loader.shared.env, value, _exn))
    ;

    /// <!-- FishyJoes.export(echoInt32) -->
    static int echoInt32(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_echoInt32(Loader.shared.env, value, _exn))
    ;

    /// <!-- FishyJoes.export(echoInt64) -->
    static int echoInt64(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_echoInt64(Loader.shared.env, value, _exn))
    ;

    /// <!-- FishyJoes.export(echoInt) -->
    static int echoInt(
        int value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_echoInt(Loader.shared.env, value, _exn))
    ;

    /// <!-- FishyJoes.export(echoFloat) -->
    static double echoFloat(
        double value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_echoFloat(Loader.shared.env, value, _exn))
    ;

    /// <!-- FishyJoes.export(echoDouble) -->
    static double echoDouble(
        double value,
    ) =>
        check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_echoDouble(Loader.shared.env, value, _exn))
    ;

    /// <!-- FishyJoes.export(maybeEchoBool) -->
    static bool? maybeEchoBool(
        bool? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<bool?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_maybeEchoBool(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoUInt8) -->
    static int? maybeEchoUInt8(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_maybeEchoUInt8(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoUInt16) -->
    static int? maybeEchoUInt16(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_maybeEchoUInt16(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoUInt32) -->
    static int? maybeEchoUInt32(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_maybeEchoUInt32(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoUInt64) -->
    static int? maybeEchoUInt64(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_maybeEchoUInt64(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoUInt) -->
    static int? maybeEchoUInt(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_maybeEchoUInt(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoInt8) -->
    static int? maybeEchoInt8(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_maybeEchoInt8(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoInt16) -->
    static int? maybeEchoInt16(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_maybeEchoInt16(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoInt32) -->
    static int? maybeEchoInt32(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_maybeEchoInt32(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoInt64) -->
    static int? maybeEchoInt64(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_maybeEchoInt64(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoInt) -->
    static int? maybeEchoInt(
        int? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_maybeEchoInt(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoFloat) -->
    static double? maybeEchoFloat(
        double? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<double?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_maybeEchoFloat(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(maybeEchoDouble) -->
    static double? maybeEchoDouble(
        double? value,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            consumeCreatedRef<double?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_maybeEchoDouble(Loader.shared.env, _valueHandle.ptr, _exn)))
        )
    ;

    /// <!-- FishyJoes.export(valueMapper) -->
    static int? valueMapper(
        int? value,
        int? Function(int?) mapper,
    ) =>
        GCRef.using(value, (_valueHandle) =>
            GCRef.using(mapper, (_mapperHandle) =>
                consumeCreatedRef<int?>(check((OutCreatedRef _exn) => f__iota_TestAPI_Primitives_valueMapper(Loader.shared.env, _valueHandle.ptr, _mapperHandle.ptr, _exn)))
            )
        )
    ;

    static late bool Function(
        Env env,
        bool value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_echoBool;
    static late double Function(
        Env env,
        double value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_echoDouble;
    static late double Function(
        Env env,
        double value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_echoFloat;
    static late int Function(
        Env env,
        int value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_echoInt;
    static late int Function(
        Env env,
        int value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_echoInt16;
    static late int Function(
        Env env,
        int value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_echoInt32;
    static late int Function(
        Env env,
        int value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_echoInt64;
    static late int Function(
        Env env,
        int value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_echoInt8;
    static late int Function(
        Env env,
        int value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_echoUInt;
    static late int Function(
        Env env,
        int value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_echoUInt16;
    static late int Function(
        Env env,
        int value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_echoUInt32;
    static late int Function(
        Env env,
        int value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_echoUInt64;
    static late int Function(
        Env env,
        int value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_echoUInt8;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_maybeEchoBool;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_maybeEchoDouble;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_maybeEchoFloat;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_maybeEchoInt;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_maybeEchoInt16;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_maybeEchoInt32;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_maybeEchoInt64;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_maybeEchoInt8;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_maybeEchoUInt;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_maybeEchoUInt16;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_maybeEchoUInt32;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_maybeEchoUInt64;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_maybeEchoUInt8;
    static late CreatedRef Function(
        Env env,
        UnownedRef value,
        UnownedRef mapper,
        OutCreatedRef _exn
    ) f__iota_TestAPI_Primitives_valueMapper;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_bitCountInt;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_bitCountUInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_defaultPrimitiveHolder;
    static late bool Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_falseBool;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyBool;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyDouble;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyFloat;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyInt16;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyInt32;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyInt64;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyInt8;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyMaybeBool;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyMaybeDouble;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyMaybeFloat;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyMaybeInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyMaybeInt16;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyMaybeInt32;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyMaybeInt64;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyMaybeInt8;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyMaybeUInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyMaybeUInt16;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyMaybeUInt32;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyMaybeUInt64;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyMaybeUInt8;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyUInt;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyUInt16;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyUInt32;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyUInt64;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_manyUInt8;
    static late double Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_maxDouble;
    static late double Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_maxFloat;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_maxInt;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_maxInt16;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_maxInt32;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_maxInt64;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_maxInt8;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_maxUInt;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_maxUInt16;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_maxUInt32;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_maxUInt64;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_maxUInt8;
    static late double Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_minDouble;
    static late double Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_minFloat;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_minInt;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_minInt16;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_minInt32;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_minInt64;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_minInt8;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_minUInt;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_minUInt16;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_minUInt32;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_minUInt64;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_minUInt8;
    static late bool Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_trueBool;
    static late double Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_zeroDouble;
    static late double Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_zeroFloat;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_zeroInt;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_zeroInt16;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_zeroInt32;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_zeroInt64;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_zeroInt8;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_zeroUInt;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_zeroUInt16;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_zeroUInt32;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_zeroUInt64;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_TestAPI_Primitives_zeroUInt8;
}
