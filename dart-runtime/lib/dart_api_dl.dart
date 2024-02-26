// ignore_for_file: unused_element

import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as ffi;

// This file is a dart translation of dart_api_dl.c
// Instead of #including the c file into the target, we locate the dartVM API symbols on the dart side

// SOURCE: dart_version.h

// On breaking changes the major version is increased.
// On backwards compatible changes the minor version is increased.
// The versioning covers the symbols exposed in dart_api_dl.h
final _DART_API_DL_MAJOR_VERSION = 2;
final _DART_API_DL_MINOR_VERSION = 1;

// SOURCE: internal/dart_api_dl_impl.h

final class _DartApiEntry extends ffi.Struct {
  external ffi.Pointer<ffi.Utf8> name;
  external ffi.Pointer function;
}

final class _DartApi extends ffi.Struct {
  @ffi.Int()
  external int major;

  @ffi.Int()
  external int minor;

  external ffi.Pointer<_DartApiEntry> functions;
}

// SOURCE: dart_api_dl.c

final class DartApiDL {
  static final shared = DartApiDL(ffi.NativeApi.initializeApiDLData);

  DartApiDL(ffi.Pointer<ffi.Void> data) {
    ffi.Pointer<_DartApi> dartApi = data.cast();
    final major = dartApi.ref.major;
    if (major != _DART_API_DL_MAJOR_VERSION) {
      throw UnsupportedError("Expected dart version $_DART_API_DL_MAJOR_VERSION, got $major");
    }

    ffi.Pointer findFunctionPointer(String name) {
      var entries = dartApi.ref.functions;
      while (entries.ref.name.address != 0) {
        if (entries.ref.name.toDartString() == name) {
          return entries.ref.function;
        }
        entries = entries.elementAt(1);
      }
      throw UnsupportedError("Unable to find handle to $name in dart VM C interface");
    }

    handleFromPersistentPtr = findFunctionPointer('Dart_HandleFromPersistent');
    newPersistentHandlePtr = findFunctionPointer('Dart_NewPersistentHandle');
    deletePersistentHandlePtr = findFunctionPointer('Dart_DeletePersistentHandle');
    postIntegerPtr = findFunctionPointer('Dart_PostInteger');
  }

  late ffi.Pointer handleFromPersistentPtr;
  late ffi.Pointer newPersistentHandlePtr;
  late ffi.Pointer deletePersistentHandlePtr;
  late ffi.Pointer postIntegerPtr;
  // Many methods omitted, only these 4 needed here.
}
