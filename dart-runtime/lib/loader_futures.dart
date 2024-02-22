part of 'loader.dart';

typedef _FutureCreate = CreatedRef Function(
  UnownedRef context,
  ffi.Pointer<CreatedRef> outPromise,
  OutCreatedRef exn
);
typedef _FutureSinkMethod = ffi.Void Function(
  UnownedRef context,
  UnownedRef future,
  ConsumedRef handlerContext,
  OutCreatedRef exn
);
typedef _FutureResolveRejectMethod = ffi.Void Function(
  UnownedRef context,
  ConsumedRef promise,
  ConsumedRef result,
  OutCreatedRef exn
);

typedef _FishyJoesCommonRuntime_FutureConverter_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.Utf16> name,
  ffi.Pointer<ffi.NativeFunction<_FutureCreate>> create,
  ffi.Pointer<ffi.NativeFunction<_FutureSinkMethod>> sinkMethod,
  ffi.Pointer<ffi.NativeFunction<_FutureResolveRejectMethod>> resolveMethod,
  ffi.Pointer<ffi.NativeFunction<_FutureResolveRejectMethod>> rejectMethod,
  ConsumedRef context,
  OutCreatedRef exn
);

typedef _FutureConverter_sinkHandler<Void, Uint32> = Void Function(
  Env env,
  ConsumedRef handlerContext,
  Uint32 success,
  ConsumedRef result,
  OutCreatedRef foreignOutExn
);

class _FutureConversions {
  final CreatedRef Function(OutCreatedRef outPromise) create;
  final void Function(UnownedRef future, ConsumedRef handlerContext) sink;
  final void Function(ConsumedRef promise, ConsumedRef result) resolve;
  final void Function(ConsumedRef promise, ConsumedRef result) reject;

  const _FutureConversions(
      this.create,
      this.sink,
      this.resolve,
      this.reject
  );

  static CreatedRef _create(UnownedRef context, OutCreatedRef outPromise, OutCreatedRef exn) => catchingRef(exn, () =>
    peekRef<_FutureConversions>(context).create(outPromise)
  );

  static void _sink(UnownedRef context, UnownedRef future, ConsumedRef handlerContext, OutCreatedRef exn) => catching(exn, () =>
    peekRef<_FutureConversions>(context).sink(future, handlerContext)
  );

  static void _resolve(UnownedRef context, ConsumedRef promise, ConsumedRef result, OutCreatedRef exn) => catching(exn, () =>
    peekRef<_FutureConversions>(context).resolve(promise, result)
  );

  static void _reject(UnownedRef context, ConsumedRef promise, ConsumedRef result, OutCreatedRef exn) => catching(exn, () =>
    peekRef<_FutureConversions>(context).reject(promise, result)
  );

  static final ffi.Pointer<ffi.NativeFunction<_FutureCreate>> createPtr = ffi.Pointer.fromFunction(_create);
  static final ffi.Pointer<ffi.NativeFunction<_FutureSinkMethod>> sinkPtr = ffi.Pointer.fromFunction(_sink);
  static final ffi.Pointer<ffi.NativeFunction<_FutureResolveRejectMethod>> resolvePtr = ffi.Pointer.fromFunction(_resolve);
  static final ffi.Pointer<ffi.NativeFunction<_FutureResolveRejectMethod>> rejectPtr = ffi.Pointer.fromFunction(_reject);
}

extension LoaderFutures on Loader {
  static final _fishyJoesCommonRuntime_FutureConverter_setup = Loader._dylib.lookupFunction<
    _FishyJoesCommonRuntime_FutureConverter_setup<ffi.Void>,
    _FishyJoesCommonRuntime_FutureConverter_setup<void>
  >('FishyJoesCommonRuntime_FutureConverter_setup');

  static final _fishyJoesCommonRuntime_FutureConverter_invokeSinkHandler = Loader._dylib.lookupFunction<
    _FutureConverter_sinkHandler<ffi.Void, ffi.Uint32>,
    _FutureConverter_sinkHandler<void, int>
  >('FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler');

  void FishyJoesCommonRuntime_FutureConverter_setup<R>(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesCommonRuntime_FutureConverter_setup(
      env,
      cName,
      _FutureConversions.createPtr,
      _FutureConversions.sinkPtr,
      _FutureConversions.resolvePtr,
      _FutureConversions.rejectPtr,
      createConsumedRef(
        _FutureConversions(
          (outPromise) {
            final completer = async.Completer<R>();
            final futureRef = createRef(completer.future);
            outPromise.value = createRef(completer);
            return futureRef;
          },
          (futureRef, handlerContext) {
            final future = peekRef<async.Future<R>>(futureRef);
            future.then(
              (value) =>
                check((exn) =>
                  _fishyJoesCommonRuntime_FutureConverter_invokeSinkHandler(
                    env,
                    handlerContext,
                    1,
                    createConsumedRef(value),
                    exn
                  )
                ),
              onError: (error) =>
                check((exn) =>
                  _fishyJoesCommonRuntime_FutureConverter_invokeSinkHandler(
                    env,
                    handlerContext,
                    0,
                    createConsumedRef(error),
                    exn
                  )
                )
            );
          },
          (promiseRef, resultRef) {
            final promise = consumeRef<async.Completer<R>>(promiseRef);
            final result = consumeRef<R>(resultRef);
            promise.complete(result);
          },
          (promiseRef, errorRef) {
            final promise = consumeRef<async.Completer<R>>(promiseRef);
            final error = consumeRef<Object>(errorRef);
            promise.completeError(error);
          },
        )
      ),
      exn
    );
    ffi.malloc.free(cName);
  }
}
