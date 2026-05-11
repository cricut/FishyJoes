part of 'loader.dart';

typedef _RangeGetter = CreatedRef Function(UnownedRef context, UnownedRef obj, OutCreatedRef exn);
typedef _RangeConstructor =
    CreatedRef Function(UnownedRef context, UnownedRef lowerBound, UnownedRef upperBound, OutCreatedRef exn);

typedef _FishyJoesCommonRuntime_RangeConverter_setup<R> =
    R Function(
      Env env,
      ffi.Pointer<ffi.Utf16> name,
      ffi.Pointer<ffi.NativeFunction<_RangeGetter>> getLowerBound,
      ffi.Pointer<ffi.NativeFunction<_RangeGetter>> getUpperBound,
      ffi.Pointer<ffi.NativeFunction<_RangeConstructor>> constructor,
      ConsumedRef context,
    );

class _RangeConversions {
  final CreatedRef Function(UnownedRef lowerBound, UnownedRef upperBound) constructor;
  final CreatedRef Function(UnownedRef range) getLowerBound;
  final CreatedRef Function(UnownedRef range) getUpperBound;

  const _RangeConversions(this.constructor, this.getLowerBound, this.getUpperBound);

  static CreatedRef _constructor(UnownedRef context, UnownedRef lowerBound, UnownedRef upperBound, OutCreatedRef exn) =>
      catchingRef(exn, () => peekRef<_RangeConversions>(context).constructor(lowerBound, upperBound));
  static CreatedRef _getLowerBound(UnownedRef context, UnownedRef range, OutCreatedRef exn) =>
      catchingRef(exn, () => peekRef<_RangeConversions>(context).getLowerBound(range));
  static CreatedRef _getUpperBound(UnownedRef context, UnownedRef range, OutCreatedRef exn) =>
      catchingRef(exn, () => peekRef<_RangeConversions>(context).getUpperBound(range));

  static final ffi.Pointer<ffi.NativeFunction<_RangeConstructor>> constructorPtr = ffi.Pointer.fromFunction(
    _constructor,
  );
  static final ffi.Pointer<ffi.NativeFunction<_RangeGetter>> getLowerPtr = ffi.Pointer.fromFunction(_getLowerBound);
  static final ffi.Pointer<ffi.NativeFunction<_RangeGetter>> getUpperPtr = ffi.Pointer.fromFunction(_getUpperBound);
}

extension LoaderRange on Loader {
  static final _fishyJoesCommonRuntime_RangeConverter_setup = Loader._dylib
      .lookupFunction<
        _FishyJoesCommonRuntime_RangeConverter_setup<ffi.Void>,
        _FishyJoesCommonRuntime_RangeConverter_setup<void>
      >('FishyJoesCommonRuntime_RangeConverter_setup');

  void _rangeConverterSetup(Env env, String name, _RangeConversions context) {
    final cName = name.toNativeUtf16();
    _fishyJoesCommonRuntime_RangeConverter_setup(
      env,
      cName,
      _RangeConversions.getLowerPtr,
      _RangeConversions.getUpperPtr,
      _RangeConversions.constructorPtr,
      createConsumedRef(context),
    );
    ffi.malloc.free(cName);
  }

  void FishyJoesCommonRuntime_RangeConverter_setup<T extends Comparable<dynamic>>(
    Env env,
    String name,
    OutCreatedRef exn,
  ) {
    _rangeConverterSetup(
      env,
      name,
      _RangeConversions(
        (lowerBound, upperBound) => createRef(
          SwiftRange<T>(
            peekRef<T>(lowerBound),
            peekRef<T>(upperBound),
          ),
        ),
        (range) => createRef(peekRef<SwiftRange<T>>(range).lowerBound),
        (range) => createRef(peekRef<SwiftRange<T>>(range).upperBound),
      ),
    );
  }

  void FishyJoesCommonRuntime_ClosedRangeConverter_setup<T extends Comparable<dynamic>>(
    Env env,
    String name,
    OutCreatedRef exn,
  ) {
    _rangeConverterSetup(
      env,
      name,
      _RangeConversions(
        (lowerBound, upperBound) => createRef(
          SwiftClosedRange<T>(
            peekRef<T>(lowerBound),
            peekRef<T>(upperBound),
          ),
        ),
        (range) => createRef(peekRef<SwiftClosedRange<T>>(range).lowerBound),
        (range) => createRef(peekRef<SwiftClosedRange<T>>(range).upperBound),
      ),
    );
  }
}
