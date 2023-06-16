part of 'loader.dart';

typedef _TupleGetter = CreatedRef Function(UnownedRef obj, OutCreatedRef exn);
typedef _TupleConstructor = CreatedRef Function(ffi.Pointer<UnownedRef> elements, OutCreatedRef exn);
typedef _FishyJoesRuntime_tuple2_setup<R> = R Function(
  Env env,
  ffi.Pointer<Utf16> name,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get0,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get1,
  ffi.Pointer<ffi.NativeFunction<_TupleConstructor>> constructor
);
typedef _FishyJoesRuntime_tuple3_setup<R> = R Function(
  Env env,
  ffi.Pointer<Utf16> name,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get0,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get1,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get2,
  ffi.Pointer<ffi.NativeFunction<_TupleConstructor>> constructor
);
typedef _FishyJoesRuntime_tuple4_setup<R> = R Function(
  Env env,
  ffi.Pointer<Utf16> name,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get0,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get1,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get2,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get3,
  ffi.Pointer<ffi.NativeFunction<_TupleConstructor>> constructor
);
typedef _FishyJoesRuntime_tuple5_setup<R> = R Function(
  Env env,
  ffi.Pointer<Utf16> name,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get0,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get1,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get2,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get3,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get4,
  ffi.Pointer<ffi.NativeFunction<_TupleConstructor>> constructor
);
typedef _FishyJoesRuntime_tuple6_setup<R> = R Function(
  Env env,
  ffi.Pointer<Utf16> name,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get0,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get1,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get2,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get3,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get4,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get5,
  ffi.Pointer<ffi.NativeFunction<_TupleConstructor>> constructor
);

extension LoaderTuple on Loader {
  static final _fishyJoesRuntime_Tuple2Converter_setup = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_tuple2_setup<ffi.Void>,
    _FishyJoesRuntime_tuple2_setup<void>
  >('FishyJoesRuntime_Tuple2Converter_setup');

  static final _fishyJoesRuntime_Tuple3Converter_setup = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_tuple3_setup<ffi.Void>,
    _FishyJoesRuntime_tuple3_setup<void>
  >('FishyJoesRuntime_Tuple3Converter_setup');

  static final _fishyJoesRuntime_Tuple4Converter_setup = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_tuple4_setup<ffi.Void>,
    _FishyJoesRuntime_tuple4_setup<void>
  >('FishyJoesRuntime_Tuple4Converter_setup');

  static final _fishyJoesRuntime_Tuple5Converter_setup = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_tuple5_setup<ffi.Void>,
    _FishyJoesRuntime_tuple5_setup<void>
  >('FishyJoesRuntime_Tuple5Converter_setup');

  static final _fishyJoesRuntime_Tuple6Converter_setup = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_tuple6_setup<ffi.Void>,
    _FishyJoesRuntime_tuple6_setup<void>
  >('FishyJoesRuntime_Tuple6Converter_setup');

  // Tuple2
  static CreatedRef _tuple2get0(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple2<Object?, Object?>>(tuple).item1));
  static CreatedRef _tuple2get1(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple2<Object?, Object?>>(tuple).item2));
  static CreatedRef _tuple2create(ffi.Pointer<UnownedRef> elements, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(Tuple2<Object?, Object?>(
          peekRef<Object?>(elements[0]),
          peekRef<Object?>(elements[1]),
    )));

  void FishyJoesRuntime_Tuple2Converter_setup(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_Tuple2Converter_setup(
      env,
      cName,
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple2get0),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple2get1),
      ffi.Pointer.fromFunction<_TupleConstructor>(_tuple2create),
    );
    malloc.free(cName);
  }

  // Tuple3
  static CreatedRef _tuple3get0(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple3<Object?, Object?, Object?>>(tuple).item1));
  static CreatedRef _tuple3get1(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple3<Object?, Object?, Object?>>(tuple).item2));
  static CreatedRef _tuple3get2(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple3<Object?, Object?, Object?>>(tuple).item3));
  static CreatedRef _tuple3create(ffi.Pointer<UnownedRef> elements, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(Tuple3<Object?, Object?, Object?>(
          peekRef<Object?>(elements[0]),
          peekRef<Object?>(elements[1]),
          peekRef<Object?>(elements[2]),
    )));

  void FishyJoesRuntime_Tuple3Converter_setup(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_Tuple3Converter_setup(
      env,
      cName,
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple3get0),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple3get1),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple3get2),
      ffi.Pointer.fromFunction<_TupleConstructor>(_tuple3create),
    );
    malloc.free(cName);
  }

  // Tuple4
  static CreatedRef _tuple4get0(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple4<Object?, Object?, Object?, Object?>>(tuple).item1));
  static CreatedRef _tuple4get1(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple4<Object?, Object?, Object?, Object?>>(tuple).item2));
  static CreatedRef _tuple4get2(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple4<Object?, Object?, Object?, Object?>>(tuple).item3));
  static CreatedRef _tuple4get3(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple4<Object?, Object?, Object?, Object?>>(tuple).item4));
  static CreatedRef _tuple4create(ffi.Pointer<UnownedRef> elements, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(Tuple4<Object?, Object?, Object?, Object?>(
          peekRef<Object?>(elements[0]),
          peekRef<Object?>(elements[1]),
          peekRef<Object?>(elements[2]),
          peekRef<Object?>(elements[3]),
    )));

  void FishyJoesRuntime_Tuple4Converter_setup(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_Tuple4Converter_setup(
      env,
      cName,
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple4get0),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple4get1),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple4get2),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple4get3),
      ffi.Pointer.fromFunction<_TupleConstructor>(_tuple4create),
    );
    malloc.free(cName);
  }

  // Tuple5
  static CreatedRef _tuple5get0(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple5<Object?, Object?, Object?, Object?, Object?>>(tuple).item1));
  static CreatedRef _tuple5get1(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple5<Object?, Object?, Object?, Object?, Object?>>(tuple).item2));
  static CreatedRef _tuple5get2(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple5<Object?, Object?, Object?, Object?, Object?>>(tuple).item3));
  static CreatedRef _tuple5get3(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple5<Object?, Object?, Object?, Object?, Object?>>(tuple).item4));
  static CreatedRef _tuple5get4(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple5<Object?, Object?, Object?, Object?, Object?>>(tuple).item5));
  static CreatedRef _tuple5create(ffi.Pointer<UnownedRef> elements, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(Tuple5<Object?, Object?, Object?, Object?, Object?>(
          peekRef<Object?>(elements[0]),
          peekRef<Object?>(elements[1]),
          peekRef<Object?>(elements[2]),
          peekRef<Object?>(elements[3]),
          peekRef<Object?>(elements[4]),
    )));

  void FishyJoesRuntime_Tuple5Converter_setup(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_Tuple5Converter_setup(
      env,
      cName,
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple5get0),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple5get1),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple5get2),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple5get3),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple5get4),
      ffi.Pointer.fromFunction<_TupleConstructor>(_tuple5create),
    );
    malloc.free(cName);
  }

  // Tuple6
  static CreatedRef _tuple6get0(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple6<Object?, Object?, Object?, Object?, Object?, Object?>>(tuple).item1));
  static CreatedRef _tuple6get1(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple6<Object?, Object?, Object?, Object?, Object?, Object?>>(tuple).item2));
  static CreatedRef _tuple6get2(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple6<Object?, Object?, Object?, Object?, Object?, Object?>>(tuple).item3));
  static CreatedRef _tuple6get3(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple6<Object?, Object?, Object?, Object?, Object?, Object?>>(tuple).item4));
  static CreatedRef _tuple6get4(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple6<Object?, Object?, Object?, Object?, Object?, Object?>>(tuple).item5));
  static CreatedRef _tuple6get5(UnownedRef tuple, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(peekRef<Tuple6<Object?, Object?, Object?, Object?, Object?, Object?>>(tuple).item6));
  static CreatedRef _tuple6create(ffi.Pointer<UnownedRef> elements, OutCreatedRef exn) =>
    catchingRef(exn, () => createRef(Tuple6<Object?, Object?, Object?, Object?, Object?, Object?>(
          peekRef<Object?>(elements[0]),
          peekRef<Object?>(elements[1]),
          peekRef<Object?>(elements[2]),
          peekRef<Object?>(elements[3]),
          peekRef<Object?>(elements[4]),
          peekRef<Object?>(elements[5]),
    )));

  void FishyJoesRuntime_Tuple6Converter_setup(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_Tuple6Converter_setup(
      env,
      cName,
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple6get0),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple6get1),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple6get2),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple6get3),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple6get4),
      ffi.Pointer.fromFunction<_TupleGetter>(_tuple6get5),
      ffi.Pointer.fromFunction<_TupleConstructor>(_tuple6create),
    );
    malloc.free(cName);
  }
}
