part of 'loader.dart';

typedef _ResultGetContents =
    CreatedRef Function(UnownedRef context, UnownedRef resultObj, ffi.Pointer<ffi.Uint8>, OutCreatedRef exn);
typedef _ResultConstructor =
    CreatedRef Function(UnownedRef context, ffi.Uint8 isSuccess, ConsumedRef contents, OutCreatedRef exn);

typedef _FishyJoesCommonRuntime_ResultConverter_setup<R> =
    R Function(
      Env env,
      ffi.Pointer<ffi.Utf16> name,
      ffi.Pointer<ffi.NativeFunction<_ResultGetContents>> getContents,
      ffi.Pointer<ffi.NativeFunction<_ResultConstructor>> constructor,
      ConsumedRef context,
    );

class _ResultConversions {
  final CreatedRef Function(UnownedRef result, ffi.Pointer<ffi.Uint8>) getContents;
  final CreatedRef Function(int isSuccess, ConsumedRef contents) constructor;

  const _ResultConversions(this.getContents, this.constructor);

  static CreatedRef _getContents(
    UnownedRef context,
    UnownedRef result,
    ffi.Pointer<ffi.Uint8> outIsSuccess,
    OutCreatedRef exn,
  ) => catchingRef(exn, () => peekRef<_ResultConversions>(context).getContents(result, outIsSuccess));
  static CreatedRef _constructor(UnownedRef context, int isSuccess, ConsumedRef contents, OutCreatedRef exn) =>
      catchingRef(exn, () => peekRef<_ResultConversions>(context).constructor(isSuccess, contents));

  static final ffi.Pointer<ffi.NativeFunction<_ResultGetContents>> getContentsPtr = ffi.Pointer.fromFunction(
    _getContents,
  );
  static final ffi.Pointer<ffi.NativeFunction<_ResultConstructor>> constructorPtr = ffi.Pointer.fromFunction(
    _constructor,
  );
}

extension LoaderResult on Loader {
  static final _fishyJoesCommonRuntime_ResultConverter_setup = Loader._dylib
      .lookupFunction<
        _FishyJoesCommonRuntime_ResultConverter_setup<ffi.Void>,
        _FishyJoesCommonRuntime_ResultConverter_setup<void>
      >('FishyJoesCommonRuntime_ResultConverter_setup');

  void _resultConverterSetup(Env env, String name, _ResultConversions context) {
    final cName = name.toNativeUtf16();
    _fishyJoesCommonRuntime_ResultConverter_setup(
      env,
      cName,
      _ResultConversions.getContentsPtr,
      _ResultConversions.constructorPtr,
      createConsumedRef(context),
    );
    ffi.malloc.free(cName);
  }

  void FishyJoesCommonRuntime_ResultConverter_setup<T, F>(Env env, String name, OutCreatedRef exn) {
    _resultConverterSetup(
      env,
      name,
      _ResultConversions(
        (result, outIsSuccess) {
          switch (peekRef<Result<T, F>>(result)) {
            case ResultSuccess(:var value):
              outIsSuccess.value = 1;
              return createRef(value);
            case ResultFailure(:var exception):
              outIsSuccess.value = 0;
              return createRef(exception);
          }
        },
        (isSuccess, contents) {
          if (isSuccess != 0) {
            return createRef(ResultSuccess<T, F>(consumeRef<T>(contents)));
          } else {
            return createRef(ResultFailure<T, F>(consumeRef<F>(contents)));
          }
        },
      ),
    );
  }
}
