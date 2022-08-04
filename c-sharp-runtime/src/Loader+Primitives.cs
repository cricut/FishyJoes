using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    public partial class Loader {
        delegate byte BoolValueMethod(IntPtr obj, out IntPtr exn);
        delegate sbyte Int8ValueMethod(IntPtr obj, out IntPtr exn);
        delegate short Int16ValueMethod(IntPtr obj, out IntPtr exn);
        delegate int Int32ValueMethod(IntPtr obj, out IntPtr exn);
        delegate long Int64ValueMethod(IntPtr obj, out IntPtr exn);
        delegate nint IntValueMethod(IntPtr obj, out IntPtr exn);
        delegate byte UInt8ValueMethod(IntPtr obj, out IntPtr exn);
        delegate ushort UInt16ValueMethod(IntPtr obj, out IntPtr exn);
        delegate uint UInt32ValueMethod(IntPtr obj, out IntPtr exn);
        delegate ulong UInt64ValueMethod(IntPtr obj, out IntPtr exn);
        delegate float FloatValueMethod(IntPtr obj, out IntPtr exn);
        delegate double DoubleValueMethod(IntPtr obj, out IntPtr exn);
        delegate IntPtr Int8Constructor(sbyte value);
        delegate IntPtr Int16Constructor(short value);
        delegate IntPtr Int32Constructor(int value);
        delegate IntPtr Int64Constructor(long value);
        delegate IntPtr IntConstructor(nint value);
        delegate IntPtr UInt8Constructor(byte value);
        delegate IntPtr UInt16Constructor(ushort value);
        delegate IntPtr UInt32Constructor(uint value);
        delegate IntPtr UInt64Constructor(ulong value);
        delegate IntPtr FloatConstructor(float value);
        delegate IntPtr DoubleConstructor(double value);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Bool_setup(
            IntPtr cSharpTrue,
            IntPtr cSharpFalse,
            BoolValueMethod valueMethod
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Int8_setup(
            Int8ValueMethod valueMethod,
            Int8Constructor constructor
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Int16_setup(
            Int16ValueMethod valueMethod,
            Int16Constructor constructor
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Int32_setup(
            Int32ValueMethod valueMethod,
            Int32Constructor constructor
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Int64_setup(
            Int64ValueMethod valueMethod,
            Int64Constructor constructor
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_UInt8_setup(
            UInt8ValueMethod valueMethod,
            UInt8Constructor constructor
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_UInt16_setup(
            UInt16ValueMethod valueMethod,
            UInt16Constructor constructor
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_UInt32_setup(
            UInt32ValueMethod valueMethod,
            UInt32Constructor constructor
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_UInt64_setup(
            UInt64ValueMethod valueMethod,
            UInt64Constructor constructor
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Int_setup(
            IntValueMethod valueMethod,
            IntConstructor constructor
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Float_setup(
            FloatValueMethod valueMethod,
            FloatConstructor constructor
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Double_setup(
            DoubleValueMethod valueMethod,
            DoubleConstructor constructor
        );

        private static void setupPrimitives() {
            FishyJoesRuntime_Bool_setup(
                PassOwnership(true),
                PassOwnership(false),
                bag<BoolValueMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => {
                    return PeekHandle<bool>(obj) ? (byte)1 : (byte)0;
                }))
            );

            FishyJoesRuntime_Int8_setup(
                bag<Int8ValueMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => PeekHandle<sbyte>(obj))),
                bag<Int8Constructor>(value => PassOwnership(value))
            );

            FishyJoesRuntime_Int16_setup(
                bag<Int16ValueMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => PeekHandle<short>(obj))),
                bag<Int16Constructor>(value => PassOwnership(value))
            );

            FishyJoesRuntime_Int32_setup(
                bag<Int32ValueMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => PeekHandle<int>(obj))),
                bag<Int32Constructor>(value => PassOwnership(value))
            );

            FishyJoesRuntime_Int64_setup(
                bag<Int64ValueMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => PeekHandle<long>(obj))),
                bag<Int64Constructor>(value => PassOwnership(value))
            );

            FishyJoesRuntime_UInt8_setup(
                bag<UInt8ValueMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => PeekHandle<byte>(obj))),
                bag<UInt8Constructor>(new UInt8Constructor(value => {
                    // Console.WriteLine($"constructing uint8 {value}");
                    return PassOwnership(value);
                }))
            );

            FishyJoesRuntime_UInt16_setup(
                bag<UInt16ValueMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => PeekHandle<ushort>(obj))),
                bag<UInt16Constructor>(value => PassOwnership(value))
            );

            FishyJoesRuntime_UInt32_setup(
                bag<UInt32ValueMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => PeekHandle<uint>(obj))),
                bag<UInt32Constructor>(value => PassOwnership(value))
            );

            FishyJoesRuntime_UInt64_setup(
                bag<UInt64ValueMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => PeekHandle<ulong>(obj))),
                bag<UInt64Constructor>(value => PassOwnership(value))
            );

            FishyJoesRuntime_Int_setup(
                bag<IntValueMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => PeekHandle<nint>(obj))),
                bag<IntConstructor>(new IntConstructor(value => {
                    // Console.WriteLine($"constructing int {value}");
                    return PassOwnership(value);
                }))
            );

            FishyJoesRuntime_Float_setup(
                bag<FloatValueMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => PeekHandle<float>(obj))),
                bag<FloatConstructor>(value => PassOwnership(value))
            );

            FishyJoesRuntime_Double_setup(
                bag<DoubleValueMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => PeekHandle<double>(obj))),
                bag<DoubleConstructor>(value => PassOwnership(value))
            );
        }
    }
}