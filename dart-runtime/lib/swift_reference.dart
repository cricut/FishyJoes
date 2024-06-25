import 'dart:ffi' as ffi;
import 'loader.dart';
import 'utilities.dart';

class SwiftReference {
  ffi.Pointer unsafeReference;

  static final _finalizer = Finalizer<ffi.Pointer>((reference) =>
    check((exn) => Loader.fishyJoesCommonRuntime_AnyBox_releaseRef(Loader.shared.env, reference.cast(), exn)));

  SwiftReference(ffi.Pointer ref) : unsafeReference = ref {
    _finalizer.attach(this, ref.cast(), detach: this);
  }

  void dispose() {
    if (unsafeReference.address != 0) {
      _finalizer.detach(this);
      check((exn) => Loader.fishyJoesCommonRuntime_AnyBox_releaseRef(Loader.shared.env, unsafeReference.cast(), exn));
      unsafeReference = ffi.Pointer.fromAddress(0);
    }
  }

  String toString() {
    return check((exn) => consumeCreatedRef<String>(Loader.fishyJoesCommonRuntime_AnyBox_toString(Loader.shared.env, unsafeReference.cast(), exn)));
  }

  static CreatedRef constructor(ffi.Pointer ptr, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(SwiftReference(ptr)));

  static ffi.Pointer anyBoxRefGetter(UnownedRef obj, OutCreatedRef exn) =>
    catchingRef(exn, () => peekRef<SwiftReference>(obj).unsafeReference);
}
