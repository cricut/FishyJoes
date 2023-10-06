import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as ffi;
import 'dart:typed_data' as typed_data;
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

part 'loader_primitives.dart';
part 'loader_collections.dart';
part 'loader_tuple.dart';
part 'loader_functions.dart';
part 'loader_misc.dart';
part 'loader_ranges.dart';
part 'loader_attributedString.dart';

typedef _EnvNewRefFn = CreatedRef Function(UnownedRef obj);
typedef _EnvDeleteRefFn = ffi.Void Function(ConsumedRef obj);
typedef _EnvNewErrorFn = CreatedRef Function(ffi.Pointer<ffi.Utf16>);

typedef _FishyJoesCommonRuntime_Env_setup = Env Function(
    ffi.Pointer<ffi.NativeFunction<_EnvNewRefFn>>,
    ffi.Pointer<ffi.NativeFunction<_EnvDeleteRefFn>>,
    ffi.Pointer<ffi.NativeFunction<_EnvNewErrorFn>>);

typedef _FishyJoesCommonRuntime_AnyBox_releaseRef<R> = R Function(
  ConsumedRef swiftReference,
  OutCreatedRef exn,
);
typedef _FishyJoesCommonRuntime_AnyBox_toString = CreatedRef Function(
  Env env,
  UnownedRef swiftReference,
  OutCreatedRef exn,
);

typedef _AnyBoxRefGetter = ffi.Pointer Function(UnownedRef obj, OutCreatedRef exn);
typedef _FishyJoesCommonRuntime_AnyBox_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_AnyBoxRefGetter>> refGetter
);

class Loader {
  static final shared = new Loader._();
  late final Env env;

  Loader._() {
    this.env = _dylib.lookupFunction<_FishyJoesCommonRuntime_Env_setup, _FishyJoesCommonRuntime_Env_setup>('FishyJoesCommonRuntime_Env_setup')(
      ffi.Pointer.fromFunction<_EnvNewRefFn>(_newRefFn),
      ffi.Pointer.fromFunction<_EnvDeleteRefFn>(_deleteRefFn),
      ffi.Pointer.fromFunction<_EnvNewErrorFn>(_newErrorFn));
    Loader._dylib.lookupFunction<
      _FishyJoesCommonRuntime_AnyBox_setup<ffi.Void>,
      _FishyJoesCommonRuntime_AnyBox_setup<void>
    >('FishyJoesCommonRuntime_AnyBox_setup')(
      env,
      ffi.Pointer.fromFunction(SwiftReference.anyBoxRefGetter)
    );
    LoaderPrimitives._setup(env);
    LoaderMisc._setup(env);
    // LoaderAttributedString._setup(env);

    // check<void>((exn) {
    //   FishyJoesCommonRuntime_RangeConverter_setup<FishyJoesRuntime.AttributedString_Index>(
    //       env,
    //       "RangeConverter<Foundation.AttributedString.Index>",
    //       exn
    //   );
    // });
    // check<void>((exn) {
    //   FishyJoesCommonRuntime_RangeConverter_setup<FishyJoesRuntime.AttributedString_Runs_Index>(
    //       env,
    //       "RangeConverter<Foundation.AttributedString.Runs.Index>",
    //       exn
    //   );
    // });
    // check<void>((exn) {
    //   FishyJoesCommonRuntime_ClosedRangeConverter_setup<FishyJoesRuntime.AttributedString_Index>(
    //       env,
    //       "ClosedRangeConverter<Foundation.AttributedString.Index>",
    //       exn
    //   );
    // });
    // check<void>((exn) {
    //   FishyJoesCommonRuntime_ClosedRangeConverter_setup<FishyJoesRuntime.AttributedString_Runs_Index>(
    //       env,
    //       "ClosedRangeConverter<Foundation.AttributedString.Runs.Index>",
    //       exn
    //   );
    // });
  }

  static ffi.DynamicLibrary openLibrary(String baseName) => locator.openLibrary(baseName);

  static final _dylib = openLibrary('FishyJoesIotaRuntime');
  final _onceSet = <String>{};

  static CreatedRef _newRefFn(UnownedRef obj) {
    return createRef(peekRef(obj));
  }

  static void _deleteRefFn(ConsumedRef obj) {
    consumeRef(obj);
  }

  static CreatedRef _newErrorFn(ffi.Pointer<ffi.Utf16> ptr) {
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
  static final fishyJoesCommonRuntime_AnyBox_releaseRef =
    Loader._dylib.lookupFunction<_FishyJoesCommonRuntime_AnyBox_releaseRef<ffi.Void>, _FishyJoesCommonRuntime_AnyBox_releaseRef<void>>(
      'FishyJoesCommonRuntime_AnyBox_releaseRef'
    );

  static final fishyJoesCommonRuntime_AnyBox_toString =
    Loader._dylib.lookupFunction<_FishyJoesCommonRuntime_AnyBox_toString, _FishyJoesCommonRuntime_AnyBox_toString>(
      'FishyJoesCommonRuntime_AnyBox_toString'
    );
}
