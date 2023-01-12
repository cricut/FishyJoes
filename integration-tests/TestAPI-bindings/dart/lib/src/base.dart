import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'package:path/path.dart' as path;
import 'generated/type_setup.dart' show ensureLoaded;

typedef NativeBinaryOp = ffi.Int32 Function(ffi.Int32, ffi.Int32);
typedef BinaryOp = int Function(int, int);

class Simple {
  static String get platformVersion {
    ensureLoaded;
    return "42";
  }
}
