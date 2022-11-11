using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    public partial class Loader {

        delegate int collection_Length(UnownedRef array, out CreatedRef exn);
        unsafe delegate void collection_Values(UnownedRef arr, CreatedRef* outValues, out CreatedRef exn);
        unsafe delegate CreatedRef collection_Constructor(UnownedRef* objects, int length, out CreatedRef exn);
        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        extern static void FishyJoesRuntime_collection_setup(
            string name,
            collection_Length length,
            collection_Values values,
            collection_Constructor constructor,
            out CreatedRef exn
        );

        // TODO: re-enable unboxed arrays?
        // public static void FishyJoesRuntime_ArrayConverter_setup<T>(string name, /* Overloading hack */ bool isNotAnObject, out CreatedRef exn) where T: unmanaged =>
        //     FishyJoesRuntime_collection_setup(
        //         name,
        //         bag<collection_Length>((IntPtr array, out CreatedRef exn) => Catching(out exn, () =>
        //             PeekHandle<IList<T>>(array).Count
        //         )),
        //         bag<collection_Values>((IntPtr arr, IntPtr outValues, out CreatedRef exn) => Catching(out exn, () => {
        //             var array = PeekHandle<IList<T>>(arr);
        //             unsafe {
        //                 var typedPtr = (T*)outValues;
        //                 for (int i = 0; i < array.Count; i++) {
        //                     typedPtr[i] = array[i];
        //                 }
        //             }
        //         })),
        //         bag<collection_Constructor>((IntPtr inValues, int length, out CreatedRef exn) => Catching(out exn, () => {
        //             var array = new List<T>(length);
        //             unsafe {
        //                 var typedPtr = (T*)inValues;
        //                 for (int i = 0; i < length; i++) {
        //                     array.Add(typedPtr[i]);
        //                 }
        //                 }
        //             return PassOwnership(array);
        //         })),
        //         out exn
        //     );

        public static void FishyJoesRuntime_ArrayConverter_setup<T>(string name, out CreatedRef exn) {
            unsafe {
                FishyJoesRuntime_collection_setup(
                    name,
                    bag<collection_Length>((UnownedRef array, out CreatedRef exn) => Catching(out exn, () =>
                        array.Peek<IList<T>>().Count
                    )),
                    bag<collection_Values>((UnownedRef arr, CreatedRef* outValues, out CreatedRef exn) => Catching(out exn, () => {
                        var array = arr.Peek<IList<T>>();
                        for (int i = 0; i < array.Count; i++) {
                            outValues[i] = new CreatedRef(array[i]);
                        }
                    })),
                    bag<collection_Constructor>((UnownedRef *inValues, int length, out CreatedRef exn) => Catching(out exn, () => {
                        var array = new List<T>(length);
                        unsafe {
                            for (int i = 0; i < length; i++) {
                                array.Add(inValues[i].Peek<T>());
                            }
                        }
                        return new CreatedRef(array);
                    })),
                    out exn
                );
            }
        }

        public static void FishyJoesRuntime_SetConverter_setup<T>(string name, out CreatedRef exn) {
            unsafe {
                FishyJoesRuntime_collection_setup(
                    name,
                    bag<collection_Length>((UnownedRef set, out CreatedRef exn) => Catching(out exn, () =>
                        set.Peek<ISet<T>>().Count
                    )),
                    bag<collection_Values>((UnownedRef setPtr, CreatedRef* outValues, out CreatedRef exn) => Catching(out exn, () => {
                        var set = setPtr.Peek<ISet<T>>();
                        foreach (var value in set) {
                            *outValues++ = new CreatedRef(value);
                        }
                    })),
                    bag<collection_Constructor>((UnownedRef* inValues, int length, out CreatedRef exn) => Catching(out exn, () => {
                        var set = new HashSet<T>(length);
                        for (int i = 0; i < length; i++) {
                            set.Add(inValues[i].Peek<T>());
                        }
                        return new CreatedRef(set);
                    })),
                    out exn
                );
            }
        }

        public static void FishyJoesRuntime_DictionaryConverter_setup<K, V>(string name, out CreatedRef exn) where K: notnull {
            unsafe {
                FishyJoesRuntime_collection_setup(
                    name,
                    bag<collection_Length>((UnownedRef dict, out CreatedRef exn) => Catching(out exn, () =>
                        dict.Peek<IDictionary<K, V>>().Count
                    )),
                    bag<collection_Values>((UnownedRef dictPtr, CreatedRef* outValues, out CreatedRef exn) => Catching(out exn, () => {
                        var dict = dictPtr.Peek<IDictionary<K, V>>();
                        foreach (var pair in dict) {
                            *outValues++ = new CreatedRef(pair.Key);
                            *outValues++ = new CreatedRef(pair.Value);
                        }
                    })),
                    bag<collection_Constructor>((UnownedRef* inKeysAndValues, int length, out CreatedRef exn) => Catching(out exn, () => {
                        var dict = new Dictionary<K, V>();
                        for (int i = 0; i < length; i++) {
                            dict.Add(
                                inKeysAndValues[2 * i + 0].Peek<K>(),
                                inKeysAndValues[2 * i + 1].Peek<V>()
                            );
                        }
                        return new CreatedRef(dict);
                    })),
                    out exn
                );
            }
        }

        public static void FishyJoesRuntime_OptionalConverter_setup(out CreatedRef exn) => Catching(out exn, () => {
            // Objects need no extra setup
        });

        private static void setupCollections() {
            // Generic types need to be set up as instantiated types, so nothing to do here.
        }
    }
}
