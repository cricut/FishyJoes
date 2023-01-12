import 'dart:ffi' as ffi;
import 'utilities.dart';

class SwiftReference {
  GCRef reference;

  SwiftReference(ConsumedRef ref) : reference = new GCRef(ref);
}
