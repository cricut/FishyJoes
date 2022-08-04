using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    public partial class Loader {

        delegate int collection_Length(IntPtr array, out IntPtr exn);
        delegate void collection_Values(IntPtr arr, IntPtr outValues, out IntPtr exn);
        delegate IntPtr collection_Constructor(IntPtr objects, int length, out IntPtr exn);
        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        extern static void FishyJoesRuntime_collection_setup(
            string name,
            collection_Length length,
            collection_Values values,
            collection_Constructor constructor,
            out IntPtr exn
        );

        // TODO: re-enable unboxed arrays?
        // public static void FishyJoesRuntime_ArrayConverter_setup<T>(string name, /* Overloading hack */ bool isNotAnObject, out IntPtr exn) where T: unmanaged =>
        //     FishyJoesRuntime_collection_setup(
        //         name,
        //         bag<collection_Length>((IntPtr array, out IntPtr exn) => Catching(out exn, () =>
        //             PeekHandle<IList<T>>(array).Count
        //         )),
        //         bag<collection_Values>((IntPtr arr, IntPtr outValues, out IntPtr exn) => Catching(out exn, () => {
        //             var array = PeekHandle<IList<T>>(arr);
        //             unsafe {
        //                 var typedPtr = (T*)outValues;
        //                 for (int i = 0; i < array.Count; i++) {
        //                     typedPtr[i] = array[i];
        //                 }
        //             }
        //         })),
        //         bag<collection_Constructor>((IntPtr inValues, int length, out IntPtr exn) => Catching(out exn, () => {
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

        public static void FishyJoesRuntime_ArrayConverter_setup<T>(string name, out IntPtr exn) {
            FishyJoesRuntime_collection_setup(
                name,
                bag<collection_Length>((IntPtr array, out IntPtr exn) => Catching(out exn, () =>
                    PeekHandle<IList<T>>(array).Count
                )),
                bag<collection_Values>((IntPtr arr, IntPtr outValues, out IntPtr exn) => Catching(out exn, () => {
                    var array = PeekHandle<IList<T>>(arr);
                    unsafe {
                        var typedPtr = (IntPtr*)outValues;
                        for (int i = 0; i < array.Count; i++) {
                            typedPtr[i] = PassOwnership(array[i]);
                        }
                    }
                })),
                bag<collection_Constructor>((IntPtr inValues, int length, out IntPtr exn) => Catching(out exn, () => {
                    var array = new List<T>(length);
                    unsafe {
                        var typedPtr = (IntPtr*)inValues;
                        for (int i = 0; i < length; i++) {
                            array.Add(PeekHandle<T>(typedPtr[i]));
                        }
                    }
                    return PassOwnership(array);
                })),
                out exn
            );
        }

        public static void FishyJoesRuntime_SetConverter_setup<T>(string name, out IntPtr exn) {
            FishyJoesRuntime_collection_setup(
                name,
                bag<collection_Length>((IntPtr set, out IntPtr exn) => Catching(out exn, () =>
                    PeekHandle<ISet<T>>(set).Count
                )),
                bag<collection_Values>((IntPtr setPtr, IntPtr outValues, out IntPtr exn) => Catching(out exn, () => {
                    var set = PeekHandle<ISet<T>>(setPtr);
                    unsafe {
                        var typedPtr = (IntPtr*)outValues;
                        foreach (var value in set) {
                            *typedPtr++ = PassOwnership(value);
                        }
                    }
                })),
                bag<collection_Constructor>((IntPtr inKeysAndValues, int length, out IntPtr exn) => Catching(out exn, () => {
                    var set = new HashSet<T>(length);
                    unsafe {
                        var typedPtr = (IntPtr*)inKeysAndValues;
                        for (int i = 0; i < length; i++) {
                            set.Add(PeekHandle<T>(typedPtr[i]));
                        }
                    }
                    return PassOwnership(set);
                })),
                out exn
            );
        }

        public static void FishyJoesRuntime_DictionaryConverter_setup<K, V>(string name, out IntPtr exn) where K: notnull {
            FishyJoesRuntime_collection_setup(
                name,
                bag<collection_Length>((IntPtr set, out IntPtr exn) => Catching(out exn, () =>
                    PeekHandle<IDictionary<K, V>>(set).Count
                )),
                bag<collection_Values>((IntPtr setPtr, IntPtr outValues, out IntPtr exn) => Catching(out exn, () => {
                    var dict = PeekHandle<IDictionary<K, V>>(setPtr);
                    unsafe {
                        var typedPtr = (IntPtr*)outValues;
                        foreach (var pair in dict) {
                            *typedPtr++ = PassOwnership(pair.Key);
                            *typedPtr++ = PassOwnership(pair.Value);
                        }
                    }
                })),
                bag<collection_Constructor>((IntPtr inKeysAndValues, int length, out IntPtr exn) => Catching(out exn, () => {
                    var dict = new Dictionary<K, V>();
                    unsafe {
                        var typedPtr = (IntPtr*)inKeysAndValues;
                        for (int i = 0; i < length; i++) {
                            dict.Add(PeekHandle<K>(typedPtr[2 * i]), PeekHandle<V>(typedPtr[2 * i + 1]));
                        }
                    }
                    return PassOwnership(dict);
                })),
                out exn
            );
        }

        public static void FishyJoesRuntime_OptionalConverter_setup(out IntPtr exn) => Catching(out exn, () => {
            // Objects need no extra setup
        });

        private static void setupCollections() {
            // Generic types need to be set up as instantiated types, so nothing to do here.
        }
    }
}