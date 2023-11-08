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

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_Bool_setup(
            IntPtr envRef,
            UnownedRef iotaTrue,
            UnownedRef iotaFalse,
            BoolValueMethod valueMethod
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_Int8_setup(
            IntPtr envRef,
            Int8ValueMethod valueMethod,
            Int8Constructor constructor
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_Int16_setup(
            IntPtr envRef,
            Int16ValueMethod valueMethod,
            Int16Constructor constructor
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_Int32_setup(
            IntPtr envRef,
            Int32ValueMethod valueMethod,
            Int32Constructor constructor
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_Int64_setup(
            IntPtr envRef,
            Int64ValueMethod valueMethod,
            Int64Constructor constructor
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_Int_setup(
            IntPtr envRef,
            IntValueMethod valueMethod,
            IntConstructor constructor
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_UInt8_setup(
            IntPtr envRef,
            UInt8ValueMethod valueMethod,
            UInt8Constructor constructor
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_UInt16_setup(
            IntPtr envRef,
            UInt16ValueMethod valueMethod,
            UInt16Constructor constructor
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_UInt32_setup(
            IntPtr envRef,
            UInt32ValueMethod valueMethod,
            UInt32Constructor constructor
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_UInt64_setup(
            IntPtr envRef,
            UInt64ValueMethod valueMethod,
            UInt64Constructor constructor
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_UInt_setup(
            IntPtr envRef,
            UIntValueMethod valueMethod,
            UIntConstructor constructor
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_Float_setup(
            IntPtr envRef,
            FloatValueMethod valueMethod,
            FloatConstructor constructor
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_Double_setup(
            IntPtr envRef,
            DoubleValueMethod valueMethod,
            DoubleConstructor constructor
        );

        private static void setupPrimitives() {
            using GCRef trueRef = new GCRef(true);
            using GCRef falseRef = new GCRef(false);
            Swift_Bool_setup(
                env,
                trueRef.ptr,
                falseRef.ptr,
                bag<BoolValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => {
                    return obj.Peek<bool>() ? (byte)1 : (byte)0;
                }))
            );

            Swift_Int8_setup(
                env,
                bag<Int8ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<sbyte>())),
                bag<Int8Constructor>(value => new CreatedRef((object)value))
            );

            Swift_Int16_setup(
                env,
                bag<Int16ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<short>())),
                bag<Int16Constructor>(value => new CreatedRef((object)value))
            );

            Swift_Int32_setup(
                env,
                bag<Int32ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<int>())),
                bag<Int32Constructor>(value => new CreatedRef((object)value))
            );

            Swift_Int64_setup(
                env,
                bag<Int64ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<long>())),
                bag<Int64Constructor>(value => new CreatedRef((object)value))
            );

            Swift_Int_setup(
                env,
                bag<IntValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<nint>())),
                bag<IntConstructor>(value => new CreatedRef((object)value))
            );

            Swift_UInt8_setup(
                env,
                bag<UInt8ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<byte>())),
                bag<UInt8Constructor>(value => new CreatedRef((object)value))
            );

            Swift_UInt16_setup(
                env,
                bag<UInt16ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<ushort>())),
                bag<UInt16Constructor>(value => new CreatedRef((object)value))
            );

            Swift_UInt32_setup(
                env,
                bag<UInt32ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<uint>())),
                bag<UInt32Constructor>(value => new CreatedRef((object)value))
            );

            Swift_UInt64_setup(
                env,
                bag<UInt64ValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<ulong>())),
                bag<UInt64Constructor>(value => new CreatedRef((object)value))
            );

            Swift_UInt_setup(
                env,
                bag<UIntValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<nuint>())),
                bag<UIntConstructor>(value => new CreatedRef((object)value))
            );

            Swift_Float_setup(
                env,
                bag<FloatValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<float>())),
                bag<FloatConstructor>(value => new CreatedRef((object)value))
            );

            Swift_Double_setup(
                env,
                bag<DoubleValueMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<double>())),
                bag<DoubleConstructor>(value => new CreatedRef((object)value))
            );
        }
    }
}
