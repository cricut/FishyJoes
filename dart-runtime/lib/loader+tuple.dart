part of 'loader.dart';

typedef _TupleGetter = CreatedRef Function(
    UnownedRef context, UnownedRef obj, OutCreatedRef exn);
typedef _TupleConstructor = CreatedRef Function(
    UnownedRef context, ffi.Pointer<UnownedRef> elements, OutCreatedRef exn);

typedef _FishyJoesRuntime_tuple_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.Utf16> name,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>>? get0,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>>? get1,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>>? get2,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>>? get3,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>>? get4,
  ffi.Pointer<ffi.NativeFunction<_TupleGetter>>? get5,
  ffi.Pointer<ffi.NativeFunction<_TupleConstructor>> constructor,
  ConsumedRef context,
);

class _TupleConversions {
  final CreatedRef Function(ffi.Pointer<UnownedRef> elements) constructor;
  final CreatedRef Function(UnownedRef tuple)? get0;
  final CreatedRef Function(UnownedRef tuple)? get1;
  final CreatedRef Function(UnownedRef tuple)? get2;
  final CreatedRef Function(UnownedRef tuple)? get3;
  final CreatedRef Function(UnownedRef tuple)? get4;
  final CreatedRef Function(UnownedRef tuple)? get5;

  const _TupleConversions(
    this.constructor, {
    this.get0,
    this.get1,
    this.get2,
    this.get3,
    this.get4,
    this.get5,
  });

  static CreatedRef _constructor(UnownedRef context,
          ffi.Pointer<UnownedRef> elements, OutCreatedRef exn) =>
      catchingRef(
          exn, () => peekRef<_TupleConversions>(context).constructor(elements));

  static CreatedRef _get0(
          UnownedRef context, UnownedRef tuple, OutCreatedRef exn) =>
      catchingRef(exn, () => peekRef<_TupleConversions>(context).get0!(tuple));
  static CreatedRef _get1(
          UnownedRef context, UnownedRef tuple, OutCreatedRef exn) =>
      catchingRef(exn, () => peekRef<_TupleConversions>(context).get1!(tuple));
  static CreatedRef _get2(
          UnownedRef context, UnownedRef tuple, OutCreatedRef exn) =>
      catchingRef(exn, () => peekRef<_TupleConversions>(context).get2!(tuple));
  static CreatedRef _get3(
          UnownedRef context, UnownedRef tuple, OutCreatedRef exn) =>
      catchingRef(exn, () => peekRef<_TupleConversions>(context).get3!(tuple));
  static CreatedRef _get4(
          UnownedRef context, UnownedRef tuple, OutCreatedRef exn) =>
      catchingRef(exn, () => peekRef<_TupleConversions>(context).get4!(tuple));
  static CreatedRef _get5(
          UnownedRef context, UnownedRef tuple, OutCreatedRef exn) =>
      catchingRef(exn, () => peekRef<_TupleConversions>(context).get5!(tuple));

  static final ffi.Pointer<ffi.NativeFunction<_TupleConstructor>>
      constructorPtr = ffi.Pointer.fromFunction(_constructor);
  static final ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get0Ptr =
      ffi.Pointer.fromFunction(_get0);
  static final ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get1Ptr =
      ffi.Pointer.fromFunction(_get1);
  static final ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get2Ptr =
      ffi.Pointer.fromFunction(_get2);
  static final ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get3Ptr =
      ffi.Pointer.fromFunction(_get3);
  static final ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get4Ptr =
      ffi.Pointer.fromFunction(_get4);
  static final ffi.Pointer<ffi.NativeFunction<_TupleGetter>> get5Ptr =
      ffi.Pointer.fromFunction(_get5);
}

extension LoaderTuple on Loader {
  static final _fishyJoesRuntime_TupleConverter_setup = Loader._dylib
      .lookupFunction<_FishyJoesRuntime_tuple_setup<ffi.Void>,
              _FishyJoesRuntime_tuple_setup<void>>(
          'FishyJoesRuntime_TupleConverter_setup');

  void _tupleConverterSetup(String name, _TupleConversions context) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_TupleConverter_setup(
      Loader.shared.env,
      cName,
      _TupleConversions.get0Ptr,
      _TupleConversions.get1Ptr,
      _TupleConversions.get2Ptr,
      _TupleConversions.get3Ptr,
      _TupleConversions.get4Ptr,
      _TupleConversions.get5Ptr,
      _TupleConversions.constructorPtr,
      createConsumedRef(context),
    );
    ffi.malloc.free(cName);
  }

  void FishyJoesRuntime_Tuple2Converter_setup<T0, T1>(
      Env env, String name, OutCreatedRef exn) {
    _tupleConverterSetup(
        name,
        _TupleConversions(
          (elements) => createRef(Tuple2(
            peekRef<T0>(elements[0]),
            peekRef<T1>(elements[1]),
          )),
          get0: (tuple) => createRef(peekRef<Tuple2<T0, T1>>(tuple).item1),
          get1: (tuple) => createRef(peekRef<Tuple2<T0, T1>>(tuple).item2),
        ));
  }

  void FishyJoesRuntime_Tuple3Converter_setup<T0, T1, T2>(
      Env env, String name, OutCreatedRef exn) {
    _tupleConverterSetup(
        name,
        _TupleConversions(
          (elements) => createRef(Tuple3(
            peekRef<T0>(elements[0]),
            peekRef<T1>(elements[1]),
            peekRef<T2>(elements[2]),
          )),
          get0: (tuple) => createRef(peekRef<Tuple3<T0, T1, T2>>(tuple).item1),
          get1: (tuple) => createRef(peekRef<Tuple3<T0, T1, T2>>(tuple).item2),
          get2: (tuple) => createRef(peekRef<Tuple3<T0, T1, T2>>(tuple).item3),
        ));
  }

  void FishyJoesRuntime_Tuple4Converter_setup<T0, T1, T2, T3>(
      Env env, String name, OutCreatedRef exn) {
    _tupleConverterSetup(
        name,
        _TupleConversions(
          (elements) => createRef(Tuple4(
            peekRef<T0>(elements[0]),
            peekRef<T1>(elements[1]),
            peekRef<T2>(elements[2]),
            peekRef<T3>(elements[3]),
          )),
          get0: (tuple) => createRef(peekRef<Tuple4<T0, T1, T2, T3>>(tuple).item1),
          get1: (tuple) => createRef(peekRef<Tuple4<T0, T1, T2, T3>>(tuple).item2),
          get2: (tuple) => createRef(peekRef<Tuple4<T0, T1, T2, T3>>(tuple).item3),
          get3: (tuple) => createRef(peekRef<Tuple4<T0, T1, T2, T3>>(tuple).item4),
        ));
  }

  void FishyJoesRuntime_Tuple5Converter_setup<T0, T1, T2, T3, T4>(
      Env env, String name, OutCreatedRef exn) {
    _tupleConverterSetup(
        name,
        _TupleConversions(
          (elements) => createRef(Tuple5(
            peekRef<T0>(elements[0]),
            peekRef<T1>(elements[1]),
            peekRef<T2>(elements[2]),
            peekRef<T3>(elements[3]),
            peekRef<T4>(elements[4]),
          )),
          get0: (tuple) => createRef(peekRef<Tuple5<T0, T1, T2, T3, T4>>(tuple).item1),
          get1: (tuple) => createRef(peekRef<Tuple5<T0, T1, T2, T3, T4>>(tuple).item2),
          get2: (tuple) => createRef(peekRef<Tuple5<T0, T1, T2, T3, T4>>(tuple).item3),
          get3: (tuple) => createRef(peekRef<Tuple5<T0, T1, T2, T3, T4>>(tuple).item4),
          get4: (tuple) => createRef(peekRef<Tuple5<T0, T1, T2, T3, T4>>(tuple).item5),
        ));
  }

  void FishyJoesRuntime_Tuple6Converter_setup<T0, T1, T2, T3, T4, T5>(
      Env env, String name, OutCreatedRef exn) {
    _tupleConverterSetup(
        name,
        _TupleConversions(
          (elements) => createRef(Tuple6(
            peekRef<T0>(elements[0]),
            peekRef<T1>(elements[1]),
            peekRef<T2>(elements[2]),
            peekRef<T3>(elements[3]),
            peekRef<T4>(elements[4]),
            peekRef<T5>(elements[5]),
          )),
          get0: (tuple) => createRef(peekRef<Tuple6<T0, T1, T2, T3, T4, T5>>(tuple).item1),
          get1: (tuple) => createRef(peekRef<Tuple6<T0, T1, T2, T3, T4, T5>>(tuple).item2),
          get2: (tuple) => createRef(peekRef<Tuple6<T0, T1, T2, T3, T4, T5>>(tuple).item3),
          get3: (tuple) => createRef(peekRef<Tuple6<T0, T1, T2, T3, T4, T5>>(tuple).item4),
          get4: (tuple) => createRef(peekRef<Tuple6<T0, T1, T2, T3, T4, T5>>(tuple).item5),
          get5: (tuple) => createRef(peekRef<Tuple6<T0, T1, T2, T3, T4, T5>>(tuple).item6),
        ));
  }
}
