import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;

import 'package:path/path.dart' as path;

void _ensureLoaded = (() {
    final libraryPath = path.join(Directory.current.path, 'binaries', 'libTestAPI.dylib');
    final dylib = ffi.DynamicLibrary.open(libraryPath);
    dylib.lookupFunction<
        ffi.Void Function(ffi.Pointer<ffi.Void>),
        void Function(ffi.Pointer<ffi.Void>)
    >('dart_dl_initialize')(ffi.NativeApi.initializeApiDLData);
    dylib.lookupFunction<>('setup_AssociatedDataEnum')()
    dylib.lookupFunction<>('setup_Bool')()
    dylib.lookupFunction<>('setup_Bytes')()
    dylib.lookupFunction<>('setup_Collections_CollectionHolder')()
    dylib.lookupFunction<>('setup_Collections')()
    dylib.lookupFunction<>('setup_Data')()
    dylib.lookupFunction<>('setup_Double')()
    dylib.lookupFunction<>('setup_EmptyEnum')()
    dylib.lookupFunction<>('setup_Float')()
    dylib.lookupFunction<>('setup_Functions')()
    dylib.lookupFunction<>('setup_Int')()
    dylib.lookupFunction<>('setup_Int16')()
    dylib.lookupFunction<>('setup_Int32')()
    dylib.lookupFunction<>('setup_Int64')()
    dylib.lookupFunction<>('setup_Int8')()
    dylib.lookupFunction<>('setup_Structs_MemberwiseStruct')()
    dylib.lookupFunction<>('setup_Primitives_PrimitiveHolder')()
    dylib.lookupFunction<>('setup_Primitives')()
    dylib.lookupFunction<>('setup_Structs_ReferenceStruct')()
    dylib.lookupFunction<>('setup_SimpleEnum')()
    dylib.lookupFunction<>('setup_String')()
    dylib.lookupFunction<>('setup_Strings')()
    dylib.lookupFunction<>('setup_Structs')()
    dylib.lookupFunction<>('setup_Functions_TheError')()
    dylib.lookupFunction<>('setup_Tuples')()
    dylib.lookupFunction<>('setup_UInt16')()
    dylib.lookupFunction<>('setup_UInt32')()
    dylib.lookupFunction<>('setup_UInt64')()
    dylib.lookupFunction<>('setup_UInt8')()
    return exports
})();
