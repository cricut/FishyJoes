import './AssociatedDataEnum.dart' as TestAPI;
import './Bytes.dart' as TestAPI;
import './Collections.dart' as TestAPI;
import './Collections_CollectionHolder.dart' as TestAPI;
import './DefaultArguments.dart' as TestAPI;
import './Deprecations.dart' as TestAPI;
import './EmptyEnum.dart' as TestAPI;
import './Functions.dart' as TestAPI;
import './Functions_TheError.dart' as TestAPI;
import './Primitives.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './SimpleEnum.dart' as TestAPI;
import './Strings.dart' as TestAPI;
import './Structs.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_ReferenceStruct.dart' as TestAPI;
import './Tuples.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:dart_runtime/runtime.dart';
import 'package:dart_runtime/utilities.dart' as utils;
import 'package:ffi/ffi.dart' as ffi;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(DefaultArguments) -->
class DefaultArguments {
    DefaultArguments._() {}

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
        throw UnsupportedError('This class is supposed to be unihabited')
    );

    /// <!-- FishyJoes.export(echoDefaults) -->
    static String echoDefaults(
        int? x,
        {
            int? y = null,
            double z = 3.14,
        }
    ) =>
        GCRef.using(y, (_yHandle) =>
            GCRef.using(x, (_xHandle) =>
                consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__dart_DefaultArguments_echoDefaults(Loader.shared.env, _yHandle.ptr, _xHandle.ptr, z, _exn)))
            )
        )
    ;

    static late CreatedRef Function(
        Env env,
        UnownedRef y,
        UnownedRef x,
        double z,
        OutCreatedRef _exn
    ) f__dart_DefaultArguments_echoDefaults;
}
