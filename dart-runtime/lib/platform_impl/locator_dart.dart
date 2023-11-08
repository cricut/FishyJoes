import 'dart:io' as io;
import 'dart:ffi' as ffi;
import 'package:path/path.dart' as p;

ffi.DynamicLibrary openLibrary(String baseName) {
  if (io.Platform.isMacOS) {
    return ffi.DynamicLibrary.open(p.absolute("native/macos/lib$baseName.dylib"));
  } else if (io.Platform.isWindows) {
    return ffi.DynamicLibrary.open(p.absolute("native\\windows\\$baseName.dll"));
  } else if (io.Platform.isLinux) {
    return ffi.DynamicLibrary.open(p.absolute("native/linux/lib$baseName.so"));
  } else {
    throw UnimplementedError();
  }
}
