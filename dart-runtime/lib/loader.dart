import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'package:path/path.dart' as path;
import 'package:tuple/tuple.dart';
import 'utilities.dart';
import 'SwiftReference.dart';

part 'loader+primitives.dart';
part 'loader+collections.dart';
part 'loader+tuple.dart';
part 'loader+functions.dart';

typedef _EnvNewRefFn = CreatedRef Function(UnownedRef obj);
typedef _EnvDeleteRefFn = ffi.Void Function(ConsumedRef obj);
typedef _EnvNewErrorFn = CreatedRef Function(ffi.Pointer<Utf16>);

typedef _FishyJoesRuntime_Env_setup<R> = R Function(
    ffi.Pointer<ffi.NativeFunction<_EnvNewRefFn>>,
    ffi.Pointer<ffi.NativeFunction<_EnvDeleteRefFn>>,
    ffi.Pointer<ffi.NativeFunction<_EnvNewErrorFn>>);

class Loader {
  static final shared = new Loader._();

  Loader._() {}

  static final _dylib = ffi.DynamicLibrary.open(path.join(
      Directory.current.path, 'native/libFishyJoesIotaRuntime.dylib'));
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

  void ensureLoaded = (() {
    _dylib.lookupFunction<_FishyJoesRuntime_Env_setup<ffi.Void>,
            _FishyJoesRuntime_Env_setup<void>>('FishyJoesRuntime_Env_setup')(
        ffi.Pointer.fromFunction<_EnvNewRefFn>(_newRefFn),
        ffi.Pointer.fromFunction<_EnvDeleteRefFn>(_deleteRefFn),
        ffi.Pointer.fromFunction<_EnvNewErrorFn>(_newErrorFn));

    LoaderPrimitives._setup();
    LoaderTuple._setup();
  })();

  void once(String onceName, void Function() block) {
    if (_onceSet.contains(onceName)) {
      return;
    }
    _onceSet.add(onceName);
    block();
  }
}
