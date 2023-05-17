using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    public partial class Loader {
        delegate byte BoolValueMethod(UnownedRef obj, out CreatedRef exn);
        delegate sbyte Int8ValueMethod(UnownedRef obj, out CreatedRef exn);
        delegate short Int16ValueMethod(UnownedRef obj, out CreatedRef exn);
        delegate int Int32ValueMethod(UnownedRef obj, out CreatedRef exn);
        delegate long Int64ValueMethod(UnownedRef obj, out CreatedRef exn);
        delegate nint IntValueMethod(UnownedRef obj, out CreatedRef exn);
        delegate byte UInt8ValueMethod(UnownedRef obj, out CreatedRef exn);
        delegate ushort UInt16ValueMethod(UnownedRef obj, out CreatedRef exn);
        delegate uint UInt32ValueMethod(UnownedRef obj, out CreatedRef exn);
        delegate ulong UInt64ValueMethod(UnownedRef obj, out CreatedRef exn);
        delegate nuint UIntValueMethod(UnownedRef obj, out CreatedRef exn);
        delegate float FloatValueMethod(UnownedRef obj, out CreatedRef exn);
        delegate double DoubleValueMethod(UnownedRef obj, out CreatedRef exn);

        delegate CreatedRef Int8Constructor(sbyte value);
        delegate CreatedRef Int16Constructor(short value);
        delegate CreatedRef Int32Constructor(int value);
        delegate CreatedRef Int64Constructor(long value);
        delegate CreatedRef IntConstructor(nint value);
        delegate CreatedRef UInt8Constructor(byte value);
        delegate CreatedRef UInt16Constructor(ushort value);
        delegate CreatedRef UInt32Constructor(uint value);
        delegate CreatedRef UInt64Constructor(ulong value);
        delegate CreatedRef UIntConstructor(nuint value);
        delegate CreatedRef FloatConstructor(float value);
        delegate CreatedRef DoubleConstructor(double value);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Bool_setup(
            UnownedRef cSharpTrue,
            UnownedRef cSharpFalse,
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
        static extern void FishyJoesRuntime_Int_setup(
            IntValueMethod valueMethod,
            IntConstructor constructor
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
        static extern void FishyJoesRuntime_UInt_setup(
            UIntValueMethod valueMethod,
            UIntConstructor constructor
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
            using GCRef trueRef = new GCRef(true);
            using GCRef falseRef = new GCRef(false);
            FishyJoesRuntime_Bool_setup(
                trueRef.ptr,
                falseRef.ptr,
                bag<BoolValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => {
                    return obj.Peek<bool>() ? (byte)1 : (byte)0;
                }))
            );

            FishyJoesRuntime_Int8_setup(
                bag<Int8ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<sbyte>())),
                bag<Int8Constructor>(value => new CreatedRef((object)value))
            );

            FishyJoesRuntime_Int16_setup(
                bag<Int16ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<short>())),
                bag<Int16Constructor>(value => new CreatedRef((object)value))
            );

            FishyJoesRuntime_Int32_setup(
                bag<Int32ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<int>())),
                bag<Int32Constructor>(value => new CreatedRef((object)value))
            );

            FishyJoesRuntime_Int64_setup(
                bag<Int64ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<long>())),
                bag<Int64Constructor>(value => new CreatedRef((object)value))
            );

            FishyJoesRuntime_Int_setup(
                bag<IntValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<nint>())),
                bag<IntConstructor>(value => new CreatedRef((object)value))
            );

            FishyJoesRuntime_UInt8_setup(
                bag<UInt8ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<byte>())),
                bag<UInt8Constructor>(value => new CreatedRef((object)value))
            );

            FishyJoesRuntime_UInt16_setup(
                bag<UInt16ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<ushort>())),
                bag<UInt16Constructor>(value => new CreatedRef((object)value))
            );

            FishyJoesRuntime_UInt32_setup(
                bag<UInt32ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<uint>())),
                bag<UInt32Constructor>(value => new CreatedRef((object)value))
            );

            FishyJoesRuntime_UInt64_setup(
                bag<UInt64ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<ulong>())),
                bag<UInt64Constructor>(value => new CreatedRef((object)value))
            );

            FishyJoesRuntime_UInt_setup(
                bag<UIntValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<nuint>())),
                bag<UIntConstructor>(value => new CreatedRef((object)value))
            );

            FishyJoesRuntime_Float_setup(
                bag<FloatValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<float>())),
                bag<FloatConstructor>(value => new CreatedRef((object)value))
            );

            FishyJoesRuntime_Double_setup(
                bag<DoubleValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<double>())),
                bag<DoubleConstructor>(value => new CreatedRef((object)value))
            );
        }
    }
}
