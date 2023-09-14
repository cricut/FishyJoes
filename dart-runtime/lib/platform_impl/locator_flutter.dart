import 'dart:io' as io;
import 'dart:ffi' as ffi;

ffi.DynamicLibrary openLibrary(String baseName) {
  if (io.Platform.isMacOS || io.Platform.isIOS) {
    return DynamicLibrary.open('$lib.framework/$lib');
  }
  if (io.Platform.isAndroid || io.Platform.isLinux) {
    return DynamicLibrary.open('lib$lib.so');
  }
  if (io.Platform.isWindows) {
    return ffi.DynamicLibrary.open('$lib.dll');
  }
  throw ffi.UnsupportedError('Unknown platform: ${io.Platform.operatingSystem}');
}
