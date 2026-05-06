using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

using static Cricut.FishyJoesRuntime.Loader;

namespace Cricut.EmojiFun {
    public class _TypeSetup {
        [DllImport("EmojiFun-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoes_EmojiFun_registerTypes();

        [DllImport("EmojiFun-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void EmojiFun_EmojiExplorer_setup(
            IntPtr envRef,
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        public static void _ensureLoaded() {}

        static _TypeSetup() {
            // There's no explicit way to call the static constructor, so do this instead
            FishyJoesRuntime.Loader.ensureLoaded();
            FishyJoes_EmojiFun_registerTypes();

            Once("setup_Function1Converter<Swift.String, Swift.Bool>", () => {
                // Console.WriteLine("setting up (Swift.String) throws -> Swift.Bool...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<bool, string>(
                    Loader.env,
                    "Function1Converter<Swift.String, Swift.Bool>",
                    out exn
                ));
            });
            Once("setup_Function1Converter<Swift.String, Swift.Bool>", () => {
                // Console.WriteLine("setting up (String) throws -> Bool...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_Function1Converter_setup<bool, string>(
                    Loader.env,
                    "Function1Converter<Swift.String, Swift.Bool>",
                    out exn
                ));
            });
            Once("setup_FutureConverter<Swift.Bool>", () => {
                // Console.WriteLine("setting up Future<Swift.Bool>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_FutureConverter_setup<bool>(
                    Loader.env,
                    "FutureConverter<Swift.Bool>",
                    out exn
                ));
            });
            Once("setup_OptionalConverter<Swift.String>", () => {
                // Console.WriteLine("setting up Optional<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_OptionalConverter_setup(
                    Loader.env,
                    out exn
                ));
            });
            Once("setup_SetConverter<Swift.String>", () => {
                // Console.WriteLine("setting up Set<String>...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCommonRuntime_SetConverter_setup<string>(
                    Loader.env,
                    "SetConverter<Swift.String>",
                    out exn
                ));
            });
            Once("setup_EmojiFun.EmojiExplorer", () => {
                // Console.WriteLine("setting up EmojiFun.EmojiExplorer...");
                Utilities.Check((out CreatedRef exn) => EmojiFun_EmojiExplorer_setup(
                    Loader.env,
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.EmojiFun.EmojiExplorer(ptr));
                    })),
                    out exn
                ));
            });
        }
    }
}
