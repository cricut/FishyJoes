import 'dart:io' as io;
import 'dart:ffi' as ffi;
import 'package:path/path.dart' as p;

ffi.DynamicLibrary openLibrary(String baseName) {
  if (io.Platform.isMacOS) {
    return ffi.DynamicLibrary.open(p.absolute("macos/native/lib$baseName.dylib"));
  } else if (io.Platform.isWindows) {
    return ffi.DynamicLibrary.open(p.absolute("windows\\native\\$baseName.dll"));
  } else if (io.Platform.isLinux) {
    return ffi.DynamicLibrary.open(p.absolute("linux/native/lib$baseName.so"));
  } else {
    throw UnimplementedError();
  }
}
