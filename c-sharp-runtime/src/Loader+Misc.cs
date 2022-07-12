using System;
using System.Runtime.InteropServices;
using System.Text;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    public partial class Loader {

        // String Conversions
        delegate nint StringGetLengthMethod(IntPtr obj, out IntPtr exn);
        unsafe delegate void StringGetUtf16Method(IntPtr obj, char* outUnits, out IntPtr exn);
        unsafe delegate IntPtr StringConstructor(char* units, int length, out IntPtr exn);
        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_String_setup(
            StringGetLengthMethod getLength,
            StringGetUtf16Method getUtf16,
            StringConstructor constructor
        );

        // Data Conversions
        delegate int DataLengthMethod(IntPtr obj, out IntPtr exn);
        unsafe delegate void DataGetBytesMethod(IntPtr obj, byte* outValues, out IntPtr exn);
        unsafe delegate IntPtr DataConstructor(byte* bytes, int length, out IntPtr exn);
        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Data_setup(
            DataLengthMethod getLength,
            DataGetBytesMethod bytesMethod,
            DataConstructor constructor
        );

        private static void setupMisc() {
            unsafe {
                FishyJoesRuntime_String_setup(
                    bag<StringGetLengthMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => {
                        return PeekHandle<string>(obj).Length;
                    })),
                    bag<StringGetUtf16Method>((IntPtr obj, Char* outUnits, out IntPtr exn) => Catching(out exn, () => {
                        var str = PeekHandle<string>(obj);
                        for (int i = 0; i < str.Length; i++) {
                            outUnits[i] = str[i];
                        }
                    })),
                    bag<StringConstructor>((char* units, int byteLength, out IntPtr exn) => Catching(out exn, () => {
                        var utf16 = new UnicodeEncoding(bigEndian: !BitConverter.IsLittleEndian, byteOrderMark: false, throwOnInvalidBytes: true);
                        return PassOwnership(utf16.GetString((byte*)units, byteLength));
                    }))
                );

                FishyJoesRuntime_Data_setup(
                    bag<DataLengthMethod>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => {
                        return PeekHandle<byte[]>(obj).Length;
                    })),
                    bag<DataGetBytesMethod>((IntPtr obj, byte* outBytes, out IntPtr exn) => Catching(out exn, () => {
                        var data = PeekHandle<byte[]>(obj);
                        unsafe {
                            for (int i = 0; i < data.Length; i++) {
                                outBytes[i] = data[i];
                            }
                        }
                    })),
                    bag<DataConstructor>((byte* bytes, int byteLength, out IntPtr exn) => Catching(out exn, () => {
                        unsafe {
                            var data = new byte[byteLength];
                            for (int i = 0; i < byteLength; i++) {
                                data[i] = bytes[i];
                            }
                            return PassOwnership(data);
                        }
                    }))
                );
            }
        }
    }
}