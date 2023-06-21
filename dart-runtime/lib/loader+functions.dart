part of 'loader.dart';

typedef _Constructor = CreatedRef Function(
  UnownedRef context,
  ConsumedRef reference,
  OutCreatedRef exn
);
typedef _Invoke = CreatedRef Function(
  UnownedRef context,
  UnownedRef fn,
  ffi.Pointer<ConsumedRef> args,
  OutCreatedRef exn
);

typedef _FishyJoesRuntime_FunctionConverter_setup<R> = R Function(
  Env env,
  ffi.Pointer<Utf16> typeName,
  ffi.Pointer<ffi.NativeFunction<_Constructor>> constructor,
  ffi.Pointer<ffi.NativeFunction<_Invoke>> invoke,
  ConsumedRef context,
  OutCreatedRef exn
);

// Mark invokes
typedef _FishyJoesRuntime_SwiftFunctionImpl_invoke0 = CreatedRef Function(
  Env env,
  UnownedRef self,
  OutCreatedRef exn
);
typedef _FishyJoesRuntime_SwiftFunctionImpl_invoke1 = CreatedRef Function(
  Env env,
  UnownedRef self,
  UnownedRef p0,
  OutCreatedRef exn
);
typedef _FishyJoesRuntime_SwiftFunctionImpl_invoke2 = CreatedRef Function(
  Env env,
  UnownedRef self,
  UnownedRef p0,
  UnownedRef p1,
  OutCreatedRef exn
);
typedef _FishyJoesRuntime_SwiftFunctionImpl_invoke3 = CreatedRef Function(
  Env env,
  UnownedRef self,
  UnownedRef p0,
  UnownedRef p1,
  UnownedRef p2,
  OutCreatedRef exn
);
typedef _FishyJoesRuntime_SwiftFunctionImpl_invoke4 = CreatedRef Function(
  Env env,
  UnownedRef self,
  UnownedRef p0,
  UnownedRef p1,
  UnownedRef p2,
  UnownedRef p3,
  OutCreatedRef exn
);
typedef _FishyJoesRuntime_SwiftFunctionImpl_invoke5 = CreatedRef Function(
  Env env,
  UnownedRef self,
  UnownedRef p0,
  UnownedRef p1,
  UnownedRef p2,
  UnownedRef p3,
  UnownedRef p4,
  OutCreatedRef exn
);
typedef _FishyJoesRuntime_SwiftFunctionImpl_invoke6 = CreatedRef Function(
  Env env,
  UnownedRef self,
  UnownedRef p0,
  UnownedRef p1,
  UnownedRef p2,
  UnownedRef p3,
  UnownedRef p4,
  UnownedRef p5,
  OutCreatedRef exn
);

class _FunctionConversions {
  final CreatedRef Function(ConsumedRef reference) constructor;
  final CreatedRef Function(UnownedRef fn, ffi.Pointer<ConsumedRef> args) invoke;

  const _FunctionConversions(this.constructor, this.invoke);

  static CreatedRef _constructor(UnownedRef context, ConsumedRef reference, OutCreatedRef exn) => catchingRef(exn, () =>
    peekRef<_FunctionConversions>(context).constructor(reference)
  );

  static CreatedRef _invoke(UnownedRef context, UnownedRef fn, ffi.Pointer<ConsumedRef> args, OutCreatedRef exn) => catchingRef(exn, () =>
    peekRef<_FunctionConversions>(context).invoke(fn, args)
  );

  static final ffi.Pointer<ffi.NativeFunction<_Constructor>> constructorPtr = ffi.Pointer.fromFunction(_constructor);
  static final ffi.Pointer<ffi.NativeFunction<_Invoke>> invokePtr = ffi.Pointer.fromFunction(_invoke);
}

extension LoaderFunctions on Loader {
  static final _fishyJoesRuntime_FunctionConverter_setup = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_FunctionConverter_setup<ffi.Void>,
    _FishyJoesRuntime_FunctionConverter_setup<void>
  >('FishyJoesRuntime_FunctionConverter_setup');

  static final _fishyJoesRuntime_SwiftFunctionImpl_invoke0 = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_SwiftFunctionImpl_invoke0,
    _FishyJoesRuntime_SwiftFunctionImpl_invoke0
  >('FishyJoesRuntime_SwiftFunctionImpl_invoke0');
  static final _fishyJoesRuntime_SwiftFunctionImpl_invoke1 = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_SwiftFunctionImpl_invoke1,
    _FishyJoesRuntime_SwiftFunctionImpl_invoke1
  >('FishyJoesRuntime_SwiftFunctionImpl_invoke1');
  static final _fishyJoesRuntime_SwiftFunctionImpl_invoke2 = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_SwiftFunctionImpl_invoke2,
    _FishyJoesRuntime_SwiftFunctionImpl_invoke2
  >('FishyJoesRuntime_SwiftFunctionImpl_invoke2');
  static final _fishyJoesRuntime_SwiftFunctionImpl_invoke3 = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_SwiftFunctionImpl_invoke3,
    _FishyJoesRuntime_SwiftFunctionImpl_invoke3
  >('FishyJoesRuntime_SwiftFunctionImpl_invoke3');
  static final _fishyJoesRuntime_SwiftFunctionImpl_invoke4 = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_SwiftFunctionImpl_invoke4,
    _FishyJoesRuntime_SwiftFunctionImpl_invoke4
  >('FishyJoesRuntime_SwiftFunctionImpl_invoke4');
  static final _fishyJoesRuntime_SwiftFunctionImpl_invoke5 = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_SwiftFunctionImpl_invoke5,
    _FishyJoesRuntime_SwiftFunctionImpl_invoke5
  >('FishyJoesRuntime_SwiftFunctionImpl_invoke5');
  static final _fishyJoesRuntime_SwiftFunctionImpl_invoke6 = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_SwiftFunctionImpl_invoke6,
    _FishyJoesRuntime_SwiftFunctionImpl_invoke6
  >('FishyJoesRuntime_SwiftFunctionImpl_invoke6');

  void FishyJoesRuntime_Function0Converter_setup<R>(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_FunctionConverter_setup(
      env,
      cName,
      _FunctionConversions.constructorPtr,
      _FunctionConversions.invokePtr,
      createConsumedRef(
        _FunctionConversions(
          (swiftRef) {
            final impl = new SwiftFunctionImpl(swiftRef);
            return createRef(impl.invoke0<R>);
          },
          (fn, args) {
            final func = peekRef<R Function()>(fn);
            final result = func(
            );
            return createRef(result);
          }
        )
      ),
      exn
    );
    malloc.free(cName);
  }
  void FishyJoesRuntime_Function1Converter_setup<R, P0>(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_FunctionConverter_setup(
      env,
      cName,
      _FunctionConversions.constructorPtr,
      _FunctionConversions.invokePtr,
      createConsumedRef(
        _FunctionConversions(
          (swiftRef) {
            final impl = new SwiftFunctionImpl(swiftRef);
            return createRef(impl.invoke1<R, P0>);
          },
          (fn, args) {
            final func = peekRef<R Function(P0)>(fn);
            final result = func(
              consumeRef<P0>(args[0]),
            );
            return createRef(result);
          }
        )
      ),
      exn
    );
    malloc.free(cName);
  }
  void FishyJoesRuntime_Function2Converter_setup<R, P0, P1>(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_FunctionConverter_setup(
      env,
      cName,
      _FunctionConversions.constructorPtr,
      _FunctionConversions.invokePtr,
      createConsumedRef(
        _FunctionConversions(
          (swiftRef) {
            final impl = new SwiftFunctionImpl(swiftRef);
            return createRef(impl.invoke2<R, P0, P1>);
          },
          (fn, args) {
            final func = peekRef<R Function(P0, P1)>(fn);
            final result = func(
              consumeRef<P0>(args[0]),
              consumeRef<P1>(args[1]),
            );
            return createRef(result);
          }
        )
      ),
      exn
    );
    malloc.free(cName);
  }
  void FishyJoesRuntime_Function3Converter_setup<R, P0, P1, P2>(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_FunctionConverter_setup(
      env,
      cName,
      _FunctionConversions.constructorPtr,
      _FunctionConversions.invokePtr,
      createConsumedRef(
        _FunctionConversions(
          (swiftRef) {
            final impl = new SwiftFunctionImpl(swiftRef);
            return createRef(impl.invoke3<R, P0, P1, P2>);
          },
          (fn, args) {
            final func = peekRef<R Function(P0, P1, P2)>(fn);
            final result = func(
              consumeRef<P0>(args[0]),
              consumeRef<P1>(args[1]),
              consumeRef<P2>(args[2]),
            );
            return createRef(result);
          }
        )
      ),
      exn
    );
    malloc.free(cName);
  }
  void FishyJoesRuntime_Function4Converter_setup<R, P0, P1, P2, P3>(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_FunctionConverter_setup(
      env,
      cName,
      _FunctionConversions.constructorPtr,
      _FunctionConversions.invokePtr,
      createConsumedRef(
        _FunctionConversions(
          (swiftRef) {
            final impl = new SwiftFunctionImpl(swiftRef);
            return createRef(impl.invoke4<R, P0, P1, P2, P3>);
          },
          (fn, args) {
            final func = peekRef<R Function(P0, P1, P2, P3)>(fn);
            final result = func(
              consumeRef<P0>(args[0]),
              consumeRef<P1>(args[1]),
              consumeRef<P2>(args[2]),
              consumeRef<P3>(args[3]),
            );
            return createRef(result);
          }
        )
      ),
      exn
    );
    malloc.free(cName);
  }
  void FishyJoesRuntime_Function5Converter_setup<R, P0, P1, P2, P3, P4>(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_FunctionConverter_setup(
      env,
      cName,
      _FunctionConversions.constructorPtr,
      _FunctionConversions.invokePtr,
      createConsumedRef(
        _FunctionConversions(
          (swiftRef) {
            final impl = new SwiftFunctionImpl(swiftRef);
            return createRef(impl.invoke5<R, P0, P1, P2, P3, P4>);
          },
          (fn, args) {
            final func = peekRef<R Function(P0, P1, P2, P3, P4)>(fn);
            final result = func(
              consumeRef<P0>(args[0]),
              consumeRef<P1>(args[1]),
              consumeRef<P2>(args[2]),
              consumeRef<P3>(args[3]),
              consumeRef<P4>(args[4]),
            );
            return createRef(result);
          }
        )
      ),
      exn
    );
    malloc.free(cName);
  }
  void FishyJoesRuntime_Function6Converter_setup<R, P0, P1, P2, P3, P4, P5>(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_FunctionConverter_setup(
      env,
      cName,
      _FunctionConversions.constructorPtr,
      _FunctionConversions.invokePtr,
      createConsumedRef(
        _FunctionConversions(
          (swiftRef) {
            final impl = new SwiftFunctionImpl(swiftRef);
            return createRef(impl.invoke6<R, P0, P1, P2, P3, P4, P5>);
          },
          (fn, args) {
            final func = peekRef<R Function(P0, P1, P2, P3, P4, P5)>(fn);
            final result = func(
              consumeRef<P0>(args[0]),
              consumeRef<P1>(args[1]),
              consumeRef<P2>(args[2]),
              consumeRef<P3>(args[3]),
              consumeRef<P4>(args[4]),
              consumeRef<P5>(args[5]),
            );
            return createRef(result);
          }
        )
      ),
      exn
    );
    malloc.free(cName);
  }

}

class SwiftFunctionImpl extends SwiftReference {
  SwiftFunctionImpl(ConsumedRef reference): super(reference);

  R invoke0<R>() {
    try {
      return consumeCreatedRef<R>(
        check((outExn) =>
          LoaderFunctions._fishyJoesRuntime_SwiftFunctionImpl_invoke0(
            Loader.shared.env,
            this.unsafeReference.cast(),
            outExn
          )
        )
      );
    } finally {
    }
  }
  R invoke1<R, P0>(P0 p0) {
    final a0 = new GCRef(p0);
    try {
      return consumeCreatedRef<R>(
        check((outExn) =>
          LoaderFunctions._fishyJoesRuntime_SwiftFunctionImpl_invoke1(
            Loader.shared.env,
            this.unsafeReference.cast(),
            a0.ptr,
            outExn
          )
        )
      );
    } finally {
      a0.dispose();
    }
  }
  R invoke2<R, P0, P1>(P0 p0, P1 p1) {
    final a0 = new GCRef(p0);
    final a1 = new GCRef(p1);
    try {
      return consumeCreatedRef<R>(
        check((outExn) => LoaderFunctions._fishyJoesRuntime_SwiftFunctionImpl_invoke2(
            Loader.shared.env,
            this.unsafeReference.cast(),
            a0.ptr, a1.ptr,
            outExn
      )));
    } finally {
      a0.dispose();
      a1.dispose();
    }
  }
  R invoke3<R, P0, P1, P2>(P0 p0, P1 p1, P2 p2) {
    final a0 = new GCRef(p0);
    final a1 = new GCRef(p1);
    final a2 = new GCRef(p2);
    try {
      return consumeCreatedRef<R>(
        check((outExn) => LoaderFunctions._fishyJoesRuntime_SwiftFunctionImpl_invoke3(
            Loader.shared.env,
            this.unsafeReference.cast(),
            a0.ptr, a1.ptr, a2.ptr,
            outExn
      )));
    } finally {
      a0.dispose();
      a1.dispose();
      a2.dispose();
    }
  }
  R invoke4<R, P0, P1, P2, P3>(P0 p0, P1 p1, P2 p2, P3 p3) {
    final a0 = new GCRef(p0);
    final a1 = new GCRef(p1);
    final a2 = new GCRef(p2);
    final a3 = new GCRef(p3);
    try {
      return consumeCreatedRef<R>(
        check((outExn) => LoaderFunctions._fishyJoesRuntime_SwiftFunctionImpl_invoke4(
            Loader.shared.env,
            this.unsafeReference.cast(),
            a0.ptr, a1.ptr, a2.ptr, a3.ptr,
            outExn
      )));
    } finally {
      a0.dispose();
      a1.dispose();
      a2.dispose();
      a3.dispose();
    }
  }
  R invoke5<R, P0, P1, P2, P3, P4>(P0 p0, P1 p1, P2 p2, P3 p3, P4 p4) {
    final a0 = new GCRef(p0);
    final a1 = new GCRef(p1);
    final a2 = new GCRef(p2);
    final a3 = new GCRef(p3);
    final a4 = new GCRef(p4);
    try {
      return consumeCreatedRef<R>(
        check((outExn) => LoaderFunctions._fishyJoesRuntime_SwiftFunctionImpl_invoke5(
            Loader.shared.env,
            this.unsafeReference.cast(),
            a0.ptr, a1.ptr, a2.ptr, a3.ptr, a4.ptr,
            outExn
      )));
    } finally {
      a0.dispose();
      a1.dispose();
      a2.dispose();
      a3.dispose();
      a4.dispose();
    }
  }
  R invoke6<R, P0, P1, P2, P3, P4, P5>(P0 p0, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5) {
    final a0 = new GCRef(p0);
    final a1 = new GCRef(p1);
    final a2 = new GCRef(p2);
    final a3 = new GCRef(p3);
    final a4 = new GCRef(p4);
    final a5 = new GCRef(p5);
    try {
      return consumeCreatedRef<R>(
        check((outExn) => LoaderFunctions._fishyJoesRuntime_SwiftFunctionImpl_invoke6(
            Loader.shared.env,
            this.unsafeReference.cast(),
            a0.ptr, a1.ptr, a2.ptr, a3.ptr, a4.ptr, a5.ptr,
            outExn
      )));
    } finally {
      a0.dispose();
      a1.dispose();
      a2.dispose();
      a3.dispose();
      a4.dispose();
      a5.dispose();
    }
  }
}
