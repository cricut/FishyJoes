part of 'loader.dart';

typedef _StringGetLengthMethod = ffi.Int Function(UnownedRef obj, OutCreatedRef exn);
typedef _StringGetUtf16Method = ffi.Void Function(UnownedRef obj, ffi.Pointer<ffi.Uint16>, OutCreatedRef exn);
typedef _StringConstructor = CreatedRef Function(ffi.Pointer<ffi.Uint16>, ffi.Int, OutCreatedRef exn);
typedef _FishyJoesRuntime_String_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_StringGetLengthMethod>> getLengthMethod,
  ffi.Pointer<ffi.NativeFunction<_StringGetUtf16Method>> getUtf16Method,
  ffi.Pointer<ffi.NativeFunction<_StringConstructor>> constructor
);

typedef _DataGetLengthMethod = ffi.Int32 Function(UnownedRef obj, OutCreatedRef exn);
typedef _DataGetBytesMethod = ffi.Void Function(UnownedRef obj, ffi.Pointer<ffi.Uint8> outBytes, OutCreatedRef exn);
typedef _DataConstructor = CreatedRef Function(ffi.Pointer<ffi.Uint8> bytes, ffi.Int32 length, OutCreatedRef exn);
typedef _FishyJoesRuntime_Data_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_DataGetLengthMethod>> getLengthMethod,
  ffi.Pointer<ffi.NativeFunction<_DataGetBytesMethod>> getBytesMethod,
  ffi.Pointer<ffi.NativeFunction<_DataConstructor>> constructor
);

extension LoaderMisc on Loader {
  static int _stringGetLengthMethod(UnownedRef obj, OutCreatedRef exn) => catching(exn, () =>
      peekRef<String>(obj).length
  ) ?? 0;

  static void _stringGetUtf16Method(UnownedRef obj, ffi.Pointer<ffi.Uint16> outUnits, OutCreatedRef exn) => catching(exn, () {
    final codeUnits = peekRef<String>(obj).codeUnits;
    for (int i = 0; i < codeUnits.length; i++) {
      outUnits[i] = codeUnits[i];
    }
  });

  static CreatedRef _stringConstructor(ffi.Pointer<ffi.Uint16> codeUnits, int byteLength, OutCreatedRef exn) => catchingRef(exn, () {
      final codeUnitList = codeUnits.asTypedList(byteLength ~/ 2);
      return createRef(String.fromCharCodes(codeUnitList));
  });

  static int _dataGetLengthMethod(UnownedRef obj, OutCreatedRef exn) => catching(exn, () =>
    peekRef<typed_data.Uint8List>(obj).lengthInBytes
  ) ?? 0;

  static void _dataGetBytesMethod(UnownedRef obj, ffi.Pointer<ffi.Uint8> outBytes, OutCreatedRef exn) => catching(exn, () {
    final data = peekRef<typed_data.Uint8List>(obj);
    outBytes.asTypedList(data.lengthInBytes).setAll(0, data.buffer.asUint8List());
  });

  static CreatedRef _dataConstructor(ffi.Pointer<ffi.Uint8> bytes, int length, OutCreatedRef exn) => catchingRef(exn, () =>
    createRef(typed_data.Uint8List.fromList(bytes.asTypedList(length)))
  );


  static void _setup(Env env) {
    Loader._dylib.lookupFunction<
      _FishyJoesRuntime_String_setup<ffi.Void>,
      _FishyJoesRuntime_String_setup<void>
    >('FishyJoesRuntime_String_setup')(
      env,
      ffi.Pointer.fromFunction<_StringGetLengthMethod>(_stringGetLengthMethod, 0),
      ffi.Pointer.fromFunction<_StringGetUtf16Method>(_stringGetUtf16Method),
      ffi.Pointer.fromFunction<_StringConstructor>(_stringConstructor),
    );
    Loader._dylib.lookupFunction<
      _FishyJoesRuntime_Data_setup<ffi.Void>,
      _FishyJoesRuntime_Data_setup<void>
    >('FishyJoesRuntime_Data_setup')(
      env,
      ffi.Pointer.fromFunction<_DataGetLengthMethod>(_dataGetLengthMethod, 0),
      ffi.Pointer.fromFunction<_DataGetBytesMethod>(_dataGetBytesMethod),
      ffi.Pointer.fromFunction<_DataConstructor>(_dataConstructor),
    );
  }
}
