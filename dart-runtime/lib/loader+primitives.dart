part of 'loader.dart';

typedef _BoolValueMethod = ffi.Uint8 Function(UnownedRef obj, OutCreatedRef);
typedef _Int8ValueMethod = ffi.Int8 Function(UnownedRef obj, OutCreatedRef);
typedef _Int16ValueMethod = ffi.Int16 Function(UnownedRef obj, OutCreatedRef);
typedef _Int32ValueMethod = ffi.Int32 Function(UnownedRef obj, OutCreatedRef);
typedef _Int64ValueMethod = ffi.Int64 Function(UnownedRef obj, OutCreatedRef);
typedef _IntValueMethod = ffi.Int Function(UnownedRef obj, OutCreatedRef);
typedef _UInt8ValueMethod = ffi.Uint8 Function(UnownedRef obj, OutCreatedRef);
typedef _UInt16ValueMethod = ffi.Uint16 Function(UnownedRef obj, OutCreatedRef);
typedef _UInt32ValueMethod = ffi.Uint32 Function(UnownedRef obj, OutCreatedRef);
typedef _UInt64ValueMethod = ffi.Uint64 Function(UnownedRef obj, OutCreatedRef);
typedef _FloatValueMethod = ffi.Float Function(UnownedRef obj, OutCreatedRef);
typedef _DoubleValueMethod = ffi.Double Function(UnownedRef obj, OutCreatedRef);

typedef _Int8Constructor = CreatedRef Function(ffi.Int8 value);
typedef _Int16Constructor = CreatedRef Function(ffi.Int16 value);
typedef _Int32Constructor = CreatedRef Function(ffi.Int32 value);
typedef _Int64Constructor = CreatedRef Function(ffi.Int64 value);
typedef _IntConstructor = CreatedRef Function(ffi.Int value);
typedef _UInt8Constructor = CreatedRef Function(ffi.Uint8 value);
typedef _UInt16Constructor = CreatedRef Function(ffi.Uint16 value);
typedef _UInt32Constructor = CreatedRef Function(ffi.Uint32 value);
typedef _UInt64Constructor = CreatedRef Function(ffi.Uint64 value);
typedef _FloatConstructor = CreatedRef Function(ffi.Float value);
typedef _DoubleConstructor = CreatedRef Function(ffi.Double value);

typedef _FishyJoesRuntime_Bool_setup<R> = R Function(
  Env env,
  UnownedRef dartTrue,
  UnownedRef dartFalse,
  ffi.Pointer<ffi.NativeFunction<_BoolValueMethod>> valueMethod
);

typedef _FishyJoesRuntime_Int8_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_Int8ValueMethod>> valueMethod,
  ffi.Pointer<ffi.NativeFunction<_Int8Constructor>> constructor
);

typedef _FishyJoesRuntime_Int16_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_Int16ValueMethod>> valueMethod,
  ffi.Pointer<ffi.NativeFunction<_Int16Constructor>> constructor
);

typedef _FishyJoesRuntime_Int32_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_Int32ValueMethod>> valueMethod,
  ffi.Pointer<ffi.NativeFunction<_Int32Constructor>> constructor
);

typedef _FishyJoesRuntime_Int64_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_Int64ValueMethod>> valueMethod,
  ffi.Pointer<ffi.NativeFunction<_Int64Constructor>> constructor
);

typedef _FishyJoesRuntime_UInt8_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_UInt8ValueMethod>> valueMethod,
  ffi.Pointer<ffi.NativeFunction<_UInt8Constructor>> constructor
);

typedef _FishyJoesRuntime_UInt16_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_UInt16ValueMethod>> valueMethod,
  ffi.Pointer<ffi.NativeFunction<_UInt16Constructor>> constructor
);

typedef _FishyJoesRuntime_UInt32_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_UInt32ValueMethod>> valueMethod,
  ffi.Pointer<ffi.NativeFunction<_UInt32Constructor>> constructor
);

typedef _FishyJoesRuntime_UInt64_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_UInt64ValueMethod>> valueMethod,
  ffi.Pointer<ffi.NativeFunction<_UInt64Constructor>> constructor
);

typedef _FishyJoesRuntime_Int_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_IntValueMethod>> valueMethod,
  ffi.Pointer<ffi.NativeFunction<_IntConstructor>> constructor
);

typedef _FishyJoesRuntime_Float_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_FloatValueMethod>> valueMethod,
  ffi.Pointer<ffi.NativeFunction<_FloatConstructor>> constructor
);

typedef _FishyJoesRuntime_Double_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.NativeFunction<_DoubleValueMethod>> valueMethod,
  ffi.Pointer<ffi.NativeFunction<_DoubleConstructor>> constructor
);

extension LoaderPrimitives on Loader {
  static int _boolValue(UnownedRef obj, OutCreatedRef exn) => catching(exn, () => peekRef<bool>(obj) ? 1 : 0) ?? 0;
  static int _intValue(UnownedRef obj, OutCreatedRef exn) => catching(exn, () => peekRef<int>(obj)) ?? 0;
  static CreatedRef _intConstructor(int value) => createRef(value);
  static CreatedRef _uint8Constructor(int value) => createRef(value.toUnsigned(8));
  static CreatedRef _uint16Constructor(int value) => createRef(value.toUnsigned(16));
  static CreatedRef _uint32Constructor(int value) => createRef(value.toUnsigned(32));
  static CreatedRef _uint64Constructor(int value) => createRef(value.toUnsigned(64));

  static double _doubleValue(UnownedRef obj, OutCreatedRef exn) => catching(exn, () => peekRef<double>(obj)) ?? 0.0;
  static CreatedRef _doubleConstructor(double value) => createRef(value);

  static void _setup(Env env) {
    final trueObj = GCRef(true);
    final falseObj = GCRef(false);

    // Bool
    Loader._dylib.lookupFunction<_FishyJoesRuntime_Bool_setup<ffi.Void>, _FishyJoesRuntime_Bool_setup<void>>(
      'FishyJoesRuntime_Bool_setup'
    )(
      env,
      trueObj.ptr,
      falseObj.ptr,
      ffi.Pointer.fromFunction<_BoolValueMethod>(_boolValue, 0)
    );
    trueObj.dispose();
    falseObj.dispose();

    // Signed ints
    Loader._dylib.lookupFunction<_FishyJoesRuntime_Int8_setup<ffi.Void>, _FishyJoesRuntime_Int8_setup<void>>(
      'FishyJoesRuntime_Int8_setup'
    )(
      env,
      ffi.Pointer.fromFunction<_Int8ValueMethod>(_intValue, 0),
      ffi.Pointer.fromFunction<_Int8Constructor>(_intConstructor)
    );

    Loader._dylib.lookupFunction<_FishyJoesRuntime_Int16_setup<ffi.Void>, _FishyJoesRuntime_Int16_setup<void>>(
      'FishyJoesRuntime_Int16_setup'
    )(
      env,
      ffi.Pointer.fromFunction<_Int16ValueMethod>(_intValue, 0),
      ffi.Pointer.fromFunction<_Int16Constructor>(_intConstructor)
    );

    Loader._dylib.lookupFunction<_FishyJoesRuntime_Int32_setup<ffi.Void>, _FishyJoesRuntime_Int32_setup<void>>(
      'FishyJoesRuntime_Int32_setup'
    )(
      env,
      ffi.Pointer.fromFunction<_Int32ValueMethod>(_intValue, 0),
      ffi.Pointer.fromFunction<_Int32Constructor>(_intConstructor)
    );

    Loader._dylib.lookupFunction<_FishyJoesRuntime_Int64_setup<ffi.Void>, _FishyJoesRuntime_Int64_setup<void>>(
      'FishyJoesRuntime_Int64_setup'
    )(
      env,
      ffi.Pointer.fromFunction<_Int64ValueMethod>(_intValue, 0),
      ffi.Pointer.fromFunction<_Int64Constructor>(_intConstructor)
    );

    // Unsigned Ints
    Loader._dylib.lookupFunction<_FishyJoesRuntime_UInt8_setup<ffi.Void>, _FishyJoesRuntime_UInt8_setup<void>>(
      'FishyJoesRuntime_UInt8_setup'
    )(
      env,
      ffi.Pointer.fromFunction<_UInt8ValueMethod>(_intValue, 0),
      ffi.Pointer.fromFunction<_UInt8Constructor>(_uint8Constructor)
    );

    Loader._dylib.lookupFunction<_FishyJoesRuntime_UInt16_setup<ffi.Void>, _FishyJoesRuntime_UInt16_setup<void>>(
      'FishyJoesRuntime_UInt16_setup'
    )(
      env,
      ffi.Pointer.fromFunction<_UInt16ValueMethod>(_intValue, 0),
      ffi.Pointer.fromFunction<_UInt16Constructor>(_uint16Constructor)
    );

    Loader._dylib.lookupFunction<_FishyJoesRuntime_UInt32_setup<ffi.Void>, _FishyJoesRuntime_UInt32_setup<void>>(
      'FishyJoesRuntime_UInt32_setup'
    )(
      env,
      ffi.Pointer.fromFunction<_UInt32ValueMethod>(_intValue, 0),
      ffi.Pointer.fromFunction<_UInt32Constructor>(_uint32Constructor)
    );

    Loader._dylib.lookupFunction<_FishyJoesRuntime_UInt64_setup<ffi.Void>, _FishyJoesRuntime_UInt64_setup<void>>(
      'FishyJoesRuntime_UInt64_setup'
    )(
      env,
      ffi.Pointer.fromFunction<_UInt64ValueMethod>(_intValue, 0),
      ffi.Pointer.fromFunction<_UInt64Constructor>(_uint64Constructor)
    );

    // Native Int
    Loader._dylib.lookupFunction<_FishyJoesRuntime_Int_setup<ffi.Void>, _FishyJoesRuntime_Int_setup<void>>(
      'FishyJoesRuntime_Int_setup'
    )(
      env,
      ffi.Pointer.fromFunction<_IntValueMethod>(_intValue, 0),
      ffi.Pointer.fromFunction<_IntConstructor>(_intConstructor)
    );

    // Floating Point
    Loader._dylib.lookupFunction<_FishyJoesRuntime_Float_setup<ffi.Void>, _FishyJoesRuntime_Float_setup<void>>(
      'FishyJoesRuntime_Float_setup'
    )(
      env,
      ffi.Pointer.fromFunction<_FloatValueMethod>(_doubleValue, 0.0),
      ffi.Pointer.fromFunction<_FloatConstructor>(_doubleConstructor)
    );

    Loader._dylib.lookupFunction<_FishyJoesRuntime_Double_setup<ffi.Void>, _FishyJoesRuntime_Double_setup<void>>(
      'FishyJoesRuntime_Double_setup'
    )(
      env,
      ffi.Pointer.fromFunction<_DoubleValueMethod>(_doubleValue, 0.0),
      ffi.Pointer.fromFunction<_DoubleConstructor>(_doubleConstructor)
    );
  }
}
