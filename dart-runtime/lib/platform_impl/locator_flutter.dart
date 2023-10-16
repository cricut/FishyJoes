import 'dart:io' as io;
import 'dart:ffi' as ffi;

ffi.DynamicLibrary openLibrary(String baseName) {
  if (io.Platform.isMacOS || io.Platform.isIOS) {
    return ffi.DynamicLibrary.open('lib$baseName.dylib');
  }
  if (io.Platform.isAndroid || io.Platform.isLinux) {
    return ffi.DynamicLibrary.open('lib$baseName.so');
  }
  if (io.Platform.isWindows) {
    return ffi.DynamicLibrary.open('$baseName.dll');
  }
  throw UnsupportedError('Unknown platform: ${io.Platform.operatingSystem}');
}
