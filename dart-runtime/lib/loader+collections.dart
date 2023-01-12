part of 'loader.dart';

typedef _CollectionLength = ffi.Int Function(UnownedRef array, OutCreatedRef exn);
typedef _CollectionValues = ffi.Void Function(UnownedRef arr, OutCreatedRef outValues, OutCreatedRef exn);
typedef _CollectionConstructor = CreatedRef Function(ffi.Pointer<UnownedRef> objects, ffi.Int length, OutCreatedRef exn);
typedef _FishyJoesRuntime_collection_setup<R> = R Function(
  ffi.Pointer<Utf16> name,
  ffi.Pointer<ffi.NativeFunction<_CollectionLength>> length,
  ffi.Pointer<ffi.NativeFunction<_CollectionValues>> values,
  ffi.Pointer<ffi.NativeFunction<_CollectionConstructor>> constructor,
  OutCreatedRef exn
);

extension LoaderCollections on Loader {
  static final _fishyJoesRuntime_collection_setup = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_collection_setup<ffi.Void>,
    _FishyJoesRuntime_collection_setup<void>
  >('FishyJoesRuntime_collection_setup');

  // Array
  static int _arrayLength(UnownedRef array, OutCreatedRef exn) => catching(exn, () =>
    peekRef<List<Object?>>(array).length
  ) ?? 0;

  static void _arrayValues(UnownedRef arr, OutCreatedRef outValues, OutCreatedRef exn) => catching(exn, () {
      final array = peekRef<List<Object?>>(arr);
      for (int i = 0; i < array.length; i++) {
        outValues[i] = createRef(array[i]);
      }
  });

  static CreatedRef _arrayConstructor(ffi.Pointer<UnownedRef> inValues, int length, OutCreatedRef exn) => catchingRef(exn, () {
      final List<Object?> array = [];
      for (int i = 0; i < length; i++) {
        array.add(peekRef<Object?>(inValues[i]));
      }
      return createRef(array);
  });

  void FishyJoesRuntime_ArrayConverter_setup<T>(String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_collection_setup(
      cName,
      ffi.Pointer.fromFunction<_CollectionLength>(_arrayLength, 0),
      ffi.Pointer.fromFunction<_CollectionValues>(_arrayValues),
      ffi.Pointer.fromFunction<_CollectionConstructor>(_arrayConstructor),
      exn
    );
    malloc.free(cName);
  }

  // Set
  static int _setLength(UnownedRef set, OutCreatedRef exn) => catching(exn, () =>
    peekRef<Set<Object?>>(set).length
  ) ?? 0;

  static void _setValues(UnownedRef arr, OutCreatedRef outValues, OutCreatedRef exn) => catching(exn, () {
      final set = peekRef<Set<Object?>>(arr);
      var i = 0;
      set.forEach((element) {
        outValues[i] = createRef(element);
        i++;
      });
  });

  static CreatedRef _setConstructor(ffi.Pointer<UnownedRef> inValues, int length, OutCreatedRef exn) => catchingRef(exn, () {
      final Set<Object?> set = Set();
      for (int i = 0; i < length; i++) {
        set.add(peekRef<Object?>(inValues[i]));
      }
      return createRef(set);
  });

  void FishyJoesRuntime_SetConverter_setup<T>(String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_collection_setup(
      cName,
      ffi.Pointer.fromFunction<_CollectionLength>(_setLength, 0),
      ffi.Pointer.fromFunction<_CollectionValues>(_setValues),
      ffi.Pointer.fromFunction<_CollectionConstructor>(_setConstructor),
      exn
    );
    malloc.free(cName);
  }

  // Dictionary
  static int _mapLength(UnownedRef map, OutCreatedRef exn) => catching(exn, () =>
    peekRef<Map<Object?, Object?>>(map).length
  ) ?? 0;

  static void _mapValues(UnownedRef arr, OutCreatedRef outValues, OutCreatedRef exn) => catching(exn, () {
      final map = peekRef<Map<Object?, Object?>>(arr);
      var i = 0;
      map.forEach((key, value) {
        outValues[2 * i + 0] = createRef(key);
        outValues[2 * i + 1] = createRef(value);
        i++;
      });
  });

  static CreatedRef _mapConstructor(ffi.Pointer<UnownedRef> inValues, int length, OutCreatedRef exn) => catchingRef(exn, () {
      final Map<Object?, Object?> map = Map();
      for (int i = 0; i < length; i++) {
        final key = peekRef<Object?>(inValues[2 * i + 0]);
        final val = peekRef<Object?>(inValues[2 * i + 1]);
        map[key] = val;
      }
      return createRef(map);
  });

  void FishyJoesRuntime_DictionaryConverter_setup<T>(String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_collection_setup(
      cName,
      ffi.Pointer.fromFunction<_CollectionLength>(_mapLength, 0),
      ffi.Pointer.fromFunction<_CollectionValues>(_mapValues),
      ffi.Pointer.fromFunction<_CollectionConstructor>(_mapConstructor),
      exn
    );
    malloc.free(cName);
  }

  void FishyJoesRuntime_OptionalConverter_setup(OutCreatedRef exn) => catching(exn, () {
      // Objects need no extra setup
  });

  void _setup() {
    // Generic types need to be set up as instantiated types, so nothing to do here.
  }
}
