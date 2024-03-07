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

/// <!-- FishyJoes.export(AProtocol) -->
abstract class AProtocol {
    TestAPI.AProtocol bar(
        int x,
        int y
    );

    /// <!-- FishyJoes.export(foo) -->
    String get foo;

    /// <!-- FishyJoes.export(baz) -->
    bool get baz;
}

extension AProtocol_DefaultImplementations on AProtocol {
    String hasADefaultImplementation(
        int x,
        double y
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_TestAPI_AProtocol_hasADefaultImplementation(Loader.shared.env, _thisHandle.ptr, x, y, _exn)))
        )
    ;

    static CreatedRef ffi_hasADefaultImplementation(
        UnownedRef obj,
        int x,
        double y,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<AProtocol>(obj).hasADefaultImplementation(
                x,
                y
            )
        )
    );

    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        int x,
        double y,
        OutCreatedRef _exn
    ) f__iota_TestAPI_AProtocol_hasADefaultImplementation;
}
