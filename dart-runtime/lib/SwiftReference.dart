import 'dart:ffi' as ffi;
import 'loader.dart';
import 'utilities.dart';

class SwiftReference {
  ffi.Pointer unsafeReference;

  static final _finalizer = Finalizer<ffi.Pointer>((reference) =>
    check((exn) => Loader.fishyJoesRuntime_AnyBox_releaseRef(reference.cast(), exn)));

  SwiftReference(ConsumedRef ref) : unsafeReference = ref {
    _finalizer.attach(this, ref.cast(), detach: this);
  }

  void dispose() {
    if (unsafeReference.address != 0) {
      _finalizer.detach(this);
      check((exn) => Loader.fishyJoesRuntime_AnyBox_releaseRef(unsafeReference.cast(), exn));
      unsafeReference = ffi.Pointer.fromAddress(0);
    }
  }
}