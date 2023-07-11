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
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(Deprecations) -->
class Deprecations {
    Deprecations._() {}

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
        throw UnsupportedError('This class is supposed to be unihabited')
    );

    /// <!-- FishyJoes.export(deprecatedVariable) -->
    @Deprecated("replace with `deprecatedMethod` ( <-- swift name, sorry )")
    static int get deprecatedVariable =>
        check((exn) =>
            f__dart_get_Deprecations_deprecatedVariable(Loader.shared.env, exn)
        )
    ;
    /// <!-- FishyJoes.export(deprecatedMethod) -->
    @Deprecated("don't use this")
    static String deprecatedMethod(
    ) =>
        consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__dart_Deprecations_deprecatedMethod(Loader.shared.env, _exn)))
    ;

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__dart_Deprecations_deprecatedMethod;
    static late int Function(
        Env env,
        OutCreatedRef _exn
    ) f__dart_get_Deprecations_deprecatedVariable;
}
