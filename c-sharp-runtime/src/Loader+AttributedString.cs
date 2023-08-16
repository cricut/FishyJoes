using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    public partial class Loader {
        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCSharpRuntime_AttributeContainer_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCSharpRuntime_AttributeContainer_FoundationAttributes_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCSharpRuntime_AttributedString_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCSharpRuntime_AttributedString_CharacterView_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCSharpRuntime_AttributedString_Index_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCSharpRuntime_AttributedString_Runs_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCSharpRuntime_AttributedString_Runs_Index_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCSharpRuntime_AttributedString_Runs_Run_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCSharpRuntime_AttributedString_UnicodeScalarView_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCSharpRuntime_AttributedStrings_setup(
            out CreatedRef _exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCSharpRuntime_AttributedSubstring_setup(
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        private static void setupAttributedString() {
            Once("setup_AttributeContainer", () => {
                Console.WriteLine("setting up AttributeContainer...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCSharpRuntime_AttributeContainer_setup(
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.FishyJoesRuntime.AttributeContainer(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_AttributeContainer.FoundationAttributes", () => {
                Console.WriteLine("setting up AttributeContainer.FoundationAttributes...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCSharpRuntime_AttributeContainer_FoundationAttributes_setup(
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.FishyJoesRuntime.AttributeContainer.FoundationAttributes(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_AttributedString", () => {
                Console.WriteLine("setting up AttributedString...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCSharpRuntime_AttributedString_setup(
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.FishyJoesRuntime.AttributedString(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_AttributedString.CharacterView", () => {
                Console.WriteLine("setting up AttributedString.CharacterView...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCSharpRuntime_AttributedString_CharacterView_setup(
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.FishyJoesRuntime.AttributedString.CharacterView(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_AttributedString.Index", () => {
                Console.WriteLine("setting up AttributedString.Index...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCSharpRuntime_AttributedString_Index_setup(
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.FishyJoesRuntime.AttributedString.Index(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_AttributedString.Runs", () => {
                Console.WriteLine("setting up AttributedString.Runs...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCSharpRuntime_AttributedString_Runs_setup(
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.FishyJoesRuntime.AttributedString.Runs(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_AttributedString.Runs.Index", () => {
                Console.WriteLine("setting up AttributedString.Runs.Index...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCSharpRuntime_AttributedString_Runs_Index_setup(
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.FishyJoesRuntime.AttributedString.Runs.Index(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_AttributedString.Runs.Run", () => {
                Console.WriteLine("setting up AttributedString.Runs.Run...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCSharpRuntime_AttributedString_Runs_Run_setup(
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.FishyJoesRuntime.AttributedString.Runs.Run(ptr));
                    })),
                    out exn
                ));
            });
            Once("setup_AttributedString.UnicodeScalarView", () => {
                Console.WriteLine("setting up AttributedString.UnicodeScalarView...");
                Utilities.Check((out CreatedRef exn) => FishyJoesCSharpRuntime_AttributedString_UnicodeScalarView_setup(
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.FishyJoesRuntime.AttributedString.UnicodeScalarView(ptr));
                    })),
                    out exn
                ));
            });
        }
    }
}
