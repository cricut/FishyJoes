import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'dart:typed_data' as typed_data;
import 'package:path/path.dart' as path;
import 'package:tuple/tuple.dart';
import 'utilities.dart';
import 'SwiftReference.dart';


part 'loader+primitives.dart';
part 'loader+collections.dart';
part 'loader+tuple.dart';
part 'loader+functions.dart';
part 'loader+misc.dart';

typedef _EnvNewRefFn = CreatedRef Function(UnownedRef obj);
typedef _EnvDeleteRefFn = ffi.Void Function(ConsumedRef obj);
typedef _EnvNewErrorFn = CreatedRef Function(ffi.Pointer<Utf16>);

typedef _FishyJoesRuntime_Env_setup = Env Function(
    ffi.Pointer<ffi.NativeFunction<_EnvNewRefFn>>,
    ffi.Pointer<ffi.NativeFunction<_EnvDeleteRefFn>>,
    ffi.Pointer<ffi.NativeFunction<_EnvNewErrorFn>>);

typedef _FishyJoesRuntime_AnyBox_releaseRef<R> = R Function(
  ConsumedRef swiftReference,
  OutCreatedRef exn,
);
typedef _FishyJoesRuntime_AnyBox_toString = CreatedRef Function(
  Env env,
  UnownedRef swiftReference,
  OutCreatedRef exn,
);

typedef _AnyBoxRefGetter = ffi.Pointer Function(UnownedRef obj, OutCreatedRef exn);
typedef _FishyJoesRuntime_AnyBox_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_AnyBoxRefGetter>> refGetter
);

class Loader {
  static final shared = new Loader._();
  late final Env env;

  Loader._() {
    this.env = _dylib.lookupFunction<_FishyJoesRuntime_Env_setup, _FishyJoesRuntime_Env_setup>('FishyJoesRuntime_Env_setup')(
      ffi.Pointer.fromFunction<_EnvNewRefFn>(_newRefFn),
      ffi.Pointer.fromFunction<_EnvDeleteRefFn>(_deleteRefFn),
      ffi.Pointer.fromFunction<_EnvNewErrorFn>(_newErrorFn));
    Loader._dylib.lookupFunction<
      _FishyJoesRuntime_AnyBox_setup<ffi.Void>,
      _FishyJoesRuntime_AnyBox_setup<void>
    >('FishyJoesRuntime_AnyBox_setup')(
      env,
      ffi.Pointer.fromFunction(SwiftReference.anyBoxRefGetter)
    );
    LoaderPrimitives._setup(env);
    LoaderMisc._setup(env);
  }

  static final _dylib = ffi.DynamicLibrary.open(path.join(
      Directory.current.path, 'native/libFishyJoesDartRuntime.dylib'));
  final _onceSet = <String>{};

  static CreatedRef _newRefFn(UnownedRef obj) {
    return createRef(peekRef(obj));
  }

  static void _deleteRefFn(ConsumedRef obj) {
    consumeRef(obj);
  }

  static CreatedRef _newErrorFn(ffi.Pointer<Utf16> ptr) {
    final message = ptr.toDartString();
    return createRef(Exception(message));
  }

  void ensureLoaded;

  void once(String onceName, void Function() block) {
    if (_onceSet.contains(onceName)) {
      return;
    }
    _onceSet.add(onceName);
    block();
  }
  static final fishyJoesRuntime_AnyBox_releaseRef =
    Loader._dylib.lookupFunction<_FishyJoesRuntime_AnyBox_releaseRef<ffi.Void>, _FishyJoesRuntime_AnyBox_releaseRef<void>>(
      'FishyJoesRuntime_AnyBox_releaseRef'
    );

  static final fishyJoesRuntime_AnyBox_toString =
    Loader._dylib.lookupFunction<_FishyJoesRuntime_AnyBox_toString, _FishyJoesRuntime_AnyBox_toString>(
      'FishyJoesRuntime_AnyBox_toString'
    );
}
