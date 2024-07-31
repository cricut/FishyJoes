// ignore_for_file: library_prefixes

import 'dart:ffi' as ffi;
import 'dart:isolate';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/dart_api_dl.dart';
import 'package:fishyjoes_dart/result.dart';
import 'dart:typed_data' as typed_data;
import 'dart:async' as async;
import 'package:tuple/tuple.dart';
import 'utilities.dart';
import 'swift_reference.dart';
import 'swift_range.dart';
import 'AttributeContainer_FoundationAttributes.dart' as FishyJoesRuntime;
import 'AttributeContainer.dart' as FishyJoesRuntime;
import 'AttributedString_CharacterView.dart' as FishyJoesRuntime;
import 'AttributedString_Index.dart' as FishyJoesRuntime;
import 'AttributedString_Runs_Index.dart' as FishyJoesRuntime;
import 'AttributedString_Runs_Run.dart' as FishyJoesRuntime;
import 'AttributedString_Runs.dart' as FishyJoesRuntime;
import 'AttributedString_UnicodeScalarView.dart' as FishyJoesRuntime;
import 'AttributedString.dart' as FishyJoesRuntime;
import 'AttributedSubstring.dart' as FishyJoesRuntime;
import 'platform_impl/locator_stub.dart'
    if (dart.library.ui) 'platform_impl/locator_flutter.dart'
    if (dart.library.io) 'platform_impl/locator_dart.dart'
    as locator
    ;

part 'loader_attributedString.dart';
part 'loader_collections.dart';
part 'loader_functions.dart';
part 'loader_futures.dart';
part 'loader_misc.dart';
part 'loader_primitives.dart';
part 'loader_ranges.dart';
part 'loader_result.dart';
part 'loader_tuple.dart';

typedef _EnvNewRefFn = CreatedRef Function(UnownedRef obj);
typedef _EnvDeleteRefFn = ffi.Void Function(ConsumedRef obj);
typedef _EnvNewErrorFn = CreatedRef Function(ffi.Pointer<ffi.Utf16>);
typedef _EnvDescribeFn = ffi.Pointer<ffi.Utf8> Function(UnownedRef obj);
typedef _EnvScheduleThreadWorkFn<R> = R Function(Env env, ffi.Pointer context);

typedef _FishyJoesCommonRuntime_Env_setup = Env Function(
    ffi.Pointer<ffi.NativeFunction<_EnvNewRefFn>>,
    ffi.Pointer<ffi.NativeFunction<_EnvDeleteRefFn>>,
    ffi.Pointer<ffi.NativeFunction<_EnvNewErrorFn>>,
    ffi.Pointer<ffi.NativeFunction<_EnvDescribeFn>>,
    ffi.Pointer<ffi.NativeFunction<_EnvScheduleThreadWorkFn<ffi.Void>>>,
);

typedef _FishyJoesCommonRuntime_dartWorkScheduler_setup<R, I64> = R Function(
  Env env,
  I64 sendPortID,
  ffi.Pointer dart_PostInteger_DL
);

typedef _FishyJoesCommonRuntime_AnyBox_releaseRef<R> = R Function(
  Env env,
  ConsumedRef swiftReference,
  OutCreatedRef exn,
);
typedef _FishyJoesCommonRuntime_AnyBox_toString = CreatedRef Function(
  Env env,
  UnownedRef swiftReference,
  OutCreatedRef exn,
);
typedef _FishyJoesCommonRuntime_runScheduledWork<R> = R Function(
  Env env,
  ffi.Pointer context,
  OutCreatedRef exn
);

typedef _AnyBoxConstructor = CreatedRef Function(ffi.Pointer externalRef, OutCreatedRef exn);
typedef _AnyBoxRefGetter = ffi.Pointer Function(UnownedRef obj, OutCreatedRef exn);
typedef _FishyJoesCommonRuntime_AnyBox_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_AnyBoxConstructor>> constructor,
  ffi.Pointer<ffi.NativeFunction<_AnyBoxRefGetter>> refGetter
);

class Loader {
  static final shared = Loader._();
  late final Env env;
  late final ReceivePort port;
  late final async.StreamSubscription<dynamic> portSubscription;

  Loader._() {
    env = _dylib.lookupFunction<_FishyJoesCommonRuntime_Env_setup, _FishyJoesCommonRuntime_Env_setup>('FishyJoesCommonRuntime_Env_setup')(
      ffi.Pointer.fromFunction<_EnvNewRefFn>(_newRefFn),
      ffi.Pointer.fromFunction<_EnvDeleteRefFn>(_deleteRefFn),
      ffi.Pointer.fromFunction<_EnvNewErrorFn>(_newErrorFn),
      ffi.Pointer.fromFunction<_EnvDescribeFn>(_describeFn),
      fishyJoesCommonRuntime_dartWorkScheduler,
    );

    port = ReceivePort("swift-async-dispatch-port");
    portSubscription = port.listen(portReceive);

    Loader._dylib.lookupFunction<
        _FishyJoesCommonRuntime_dartWorkScheduler_setup<ffi.Void, ffi.Int64>,
        _FishyJoesCommonRuntime_dartWorkScheduler_setup<void, int>
    >('FishyJoesCommonRuntime_dartWorkScheduler_setup')(
      env,
      port.sendPort.nativePort,
      DartApiDL.shared.postIntegerPtr
    );

    Loader._dylib.lookupFunction<
      _FishyJoesCommonRuntime_AnyBox_setup<ffi.Void>,
      _FishyJoesCommonRuntime_AnyBox_setup<void>
    >('FishyJoesCommonRuntime_AnyBox_setup')(
      env,
      ffi.Pointer.fromFunction(SwiftReference.constructor),
      ffi.Pointer.fromFunction(SwiftReference.anyBoxRefGetter),
    );
    LoaderPrimitives._setup(env);
    LoaderMisc._setup(env);
    LoaderAttributedString._setup(env);

    check<void>((exn) {
      FishyJoesCommonRuntime_RangeConverter_setup<FishyJoesRuntime.AttributedString_Index>(
          env,
          "RangeConverter<Foundation.AttributedString.Index>",
          exn
      );
    });
    check<void>((exn) {
      FishyJoesCommonRuntime_RangeConverter_setup<FishyJoesRuntime.AttributedString_Runs_Index>(
          env,
          "RangeConverter<Foundation.AttributedString.Runs.Index>",
          exn
      );
    });
    check<void>((exn) {
      FishyJoesCommonRuntime_ClosedRangeConverter_setup<FishyJoesRuntime.AttributedString_Index>(
          env,
          "ClosedRangeConverter<Foundation.AttributedString.Index>",
          exn
      );
    });
    check<void>((exn) {
      FishyJoesCommonRuntime_ClosedRangeConverter_setup<FishyJoesRuntime.AttributedString_Runs_Index>(
          env,
          "ClosedRangeConverter<Foundation.AttributedString.Runs.Index>",
          exn
      );
    });
  }

  void portReceive(dynamic message) {
    check((exn) {
      fishyJoesCommonRuntime_runScheduledWork(env, ffi.Pointer.fromAddress(message), exn);
    });
  }

  static ffi.DynamicLibrary openLibrary(String baseName) => locator.openLibrary(baseName);

  static final _dylib = openLibrary('FishyJoesIotaRuntime');
  final _onceSet = <String>{};

  static CreatedRef _newRefFn(UnownedRef obj) {
    return createRef(peekRef(obj));
  }

  static void _deleteRefFn(ConsumedRef obj) {
    consumeRef<Object?>(obj);
  }

  static CreatedRef _newErrorFn(ffi.Pointer<ffi.Utf16> ptr) {
    return createRef(Exception(ptr.toDartString()));
  }

  static ffi.Pointer<ffi.Utf8> _describeFn(UnownedRef ref) {
    final obj = peekRef<Object?>(ref);
    return '$obj'.toNativeUtf8();
  }

  void ensureLoaded;

  void once(String onceName, void Function() block) {
    if (_onceSet.contains(onceName)) {
      return;
    }
    _onceSet.add(onceName);
    block();
  }
  static final fishyJoesCommonRuntime_AnyBox_releaseRef =
    Loader._dylib.lookupFunction<_FishyJoesCommonRuntime_AnyBox_releaseRef<ffi.Void>, _FishyJoesCommonRuntime_AnyBox_releaseRef<void>>(
      'FishyJoesCommonRuntime_AnyBox_releaseRef'
    );

  static final fishyJoesCommonRuntime_AnyBox_toString =
    Loader._dylib.lookupFunction<_FishyJoesCommonRuntime_AnyBox_toString, _FishyJoesCommonRuntime_AnyBox_toString>(
      'FishyJoesCommonRuntime_AnyBox_toString'
    );

  static final fishyJoesCommonRuntime_runScheduledWork =
  Loader._dylib.lookupFunction<_FishyJoesCommonRuntime_runScheduledWork<ffi.Void>, _FishyJoesCommonRuntime_runScheduledWork<void>>(
      'FishyJoesCommonRuntime_runScheduledWork'
  );

  static final fishyJoesCommonRuntime_dartWorkScheduler =
  Loader._dylib.lookup<ffi.NativeFunction<_EnvScheduleThreadWorkFn<ffi.Void>>>(
      'FishyJoesCommonRuntime_dartWorkScheduler'
  );
}
