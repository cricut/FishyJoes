part of 'loader.dart';

typedef _CollectionLength = ffi.Int Function(UnownedRef context, UnownedRef array, OutCreatedRef exn);
typedef _CollectionValues = ffi.Void Function(UnownedRef context, UnownedRef arr, OutCreatedRef outValues, OutCreatedRef exn);
typedef _CollectionConstructor = CreatedRef Function(UnownedRef context, ffi.Pointer<UnownedRef> objects, ffi.Int length, OutCreatedRef exn);
typedef _FishyJoesRuntime_collection_setup<R> = R Function(
  Env env,
  ffi.Pointer<ffi.Utf16> name,
  ffi.Pointer<ffi.NativeFunction<_CollectionLength>> length,
  ffi.Pointer<ffi.NativeFunction<_CollectionValues>> values,
  ffi.Pointer<ffi.NativeFunction<_CollectionConstructor>> constructor,
  ConsumedRef context,
  OutCreatedRef exn
);

class _CollectionConversions {
  final int Function(UnownedRef collection) length;
  final void Function(UnownedRef collection, OutCreatedRef outValues) values;
  final CreatedRef Function(ffi.Pointer<UnownedRef> inValues, int length) constructor;

  const _CollectionConversions(
      this.length,
      this.values,
      this.constructor,
  );

  static int _collectionLength(UnownedRef context, UnownedRef collection, OutCreatedRef exn) => catching(exn, () =>
    peekRef<_CollectionConversions>(context).length(collection)
  ) ?? 0;

  static void _collectionValues(UnownedRef context, UnownedRef collection, OutCreatedRef outValues, OutCreatedRef exn) => catching(exn, () {
      peekRef<_CollectionConversions>(context).values(collection, outValues);
  });

  static CreatedRef _collectionConstructor(UnownedRef context, ffi.Pointer<UnownedRef> inValues, int length, OutCreatedRef exn) => catchingRef(exn, () =>
      peekRef<_CollectionConversions>(context).constructor(inValues, length)
  );

  static final ffi.Pointer<ffi.NativeFunction<_CollectionLength>> lengthPtr = ffi.Pointer.fromFunction(_collectionLength, 0);
  static final ffi.Pointer<ffi.NativeFunction<_CollectionValues>> valuesPtr = ffi.Pointer.fromFunction(_collectionValues);
  static final ffi.Pointer<ffi.NativeFunction<_CollectionConstructor>> constructorPtr = ffi.Pointer.fromFunction(_collectionConstructor);
}

extension LoaderCollections on Loader {
  static final _fishyJoesRuntime_collection_setup = Loader._dylib.lookupFunction<
    _FishyJoesRuntime_collection_setup<ffi.Void>,
    _FishyJoesRuntime_collection_setup<void>
  >('FishyJoesRuntime_collection_setup');

  // Array
  void FishyJoesRuntime_ArrayConverter_setup<T>(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_collection_setup(
      env,
      cName,
      _CollectionConversions.lengthPtr,
      _CollectionConversions.valuesPtr,
      _CollectionConversions.constructorPtr,
      createConsumedRef(
        _CollectionConversions(
          (array) => peekRef<List<T>>(array).length,
          (arr, outValues) {
            final array = peekRef<List<T>>(arr);
            for (int i = 0; i < array.length; i++) {
              outValues[i] = createRef(array[i]);
            }
          },
          (inValues, length) {
            final List<T> array = [];
            for (int i = 0; i < length; i++) {
              array.add(peekRef<T>(inValues[i]));
            }
            return createRef(array);
          }
        )
      ),
      exn
    );
    ffi.malloc.free(cName);
  }

  // Set
  void FishyJoesRuntime_SetConverter_setup<T>(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_collection_setup(
      env,
      cName,
      _CollectionConversions.lengthPtr,
      _CollectionConversions.valuesPtr,
      _CollectionConversions.constructorPtr,
      createConsumedRef(
        _CollectionConversions(
          (set) => peekRef<Set<T>>(set).length,
          (setRef, outValues) {
            final set = peekRef<Set<T>>(setRef);
            var i = 0;
            set.forEach((element) {
                outValues[i] = createRef(element);
                i++;
            });
          },
          (inValues, length) {
            final Set<T> set = Set();
            for (int i = 0; i < length; i++) {
              set.add(peekRef<T>(inValues[i]));
            }
            return createRef(set);
          }
        )
      ),
      exn
    );
    ffi.malloc.free(cName);
  }

  // Dictionary
  void FishyJoesRuntime_DictionaryConverter_setup<K, V>(Env env, String name, OutCreatedRef exn) {
    final cName = name.toNativeUtf16();
    _fishyJoesRuntime_collection_setup(
      env,
      cName,
      _CollectionConversions.lengthPtr,
      _CollectionConversions.valuesPtr,
      _CollectionConversions.constructorPtr,
      createConsumedRef(
        _CollectionConversions(
          (map) => peekRef<Map<K, V>>(map).length,
          (mapRef, outValues) {
            final map = peekRef<Map<K, V>>(mapRef);
            var i = 0;
            map.forEach((key, value) {
                outValues[2 * i + 0] = createRef(key);
                outValues[2 * i + 1] = createRef(value);
                i++;
            });
          },
          (inValues, length) {
            final Map<K, V> map = Map();
            for (int i = 0; i < length; i++) {
              final key = peekRef<K>(inValues[2 * i + 0]);
              final val = peekRef<V>(inValues[2 * i + 1]);
              map[key] = val;
            }
            return createRef(map);
          }
        )
      ),
      exn
    );
    ffi.malloc.free(cName);
  }

  void FishyJoesRuntime_OptionalConverter_setup(Env env, OutCreatedRef exn) => catching(exn, () {
      // Objects need no extra setup
  });
}
