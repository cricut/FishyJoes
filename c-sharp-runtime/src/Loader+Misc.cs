using System;
using System.Runtime.InteropServices;
using System.Text;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    public partial class Loader {

        // String Conversions
        delegate nint StringGetLengthMethod(UnownedRef obj, out CreatedRef exn);
        unsafe delegate void StringGetUtf16Method(UnownedRef obj, char* outUnits, out CreatedRef exn);
        unsafe delegate CreatedRef StringConstructor(char* units, int length, out CreatedRef exn);

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Swift_String_setup(
            IntPtr envRef,
            StringGetLengthMethod getLength,
            StringGetUtf16Method getUtf16,
            StringConstructor constructor
        );

        // Data Conversions
        delegate int DataLengthMethod(UnownedRef obj, out CreatedRef exn);
        unsafe delegate void DataGetBytesMethod(UnownedRef obj, byte* outValues, out CreatedRef exn);
        unsafe delegate CreatedRef DataConstructor(byte* bytes, int length, out CreatedRef exn);

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Foundation_Data_setup(
            IntPtr envRef,
            DataLengthMethod getLength,
            DataGetBytesMethod bytesMethod,
            DataConstructor constructor
        );

        // URL Conversions
        delegate CreatedRef URLAbsoluteURIMethod(UnownedRef obj, out CreatedRef exn);
        delegate CreatedRef URLConstructor(ConsumedRef urlString, out CreatedRef exn);
        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void Foundation_URL_setup(
            IntPtr envRef,
            URLAbsoluteURIMethod absoluteURIMethod,
            URLConstructor constructor
        );

        private static void setupMisc() {
            unsafe {
                Swift_String_setup(
                    env,
                    bag<StringGetLengthMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => {
                        return obj.Peek<string>().Length;
                    })),
                    bag<StringGetUtf16Method>((UnownedRef obj, char* outUnits, out CreatedRef exn) => Catching(out exn, () => {
                        var str = obj.Peek<string>();
                        for (int i = 0; i < str.Length; i++) {
                            outUnits[i] = str[i];
                        }
                    })),
                    bag<StringConstructor>((char* units, int byteLength, out CreatedRef exn) => Catching(out exn, () => {
                        var utf16 = new UnicodeEncoding(bigEndian: !BitConverter.IsLittleEndian, byteOrderMark: false, throwOnInvalidBytes: true);
                        return new CreatedRef(utf16.GetString((byte*)units, byteLength));
                    }))
                );

                Foundation_Data_setup(
                    env,
                    bag<DataLengthMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => {
                        return obj.Peek<byte[]>().Length;
                    })),
                    bag<DataGetBytesMethod>((UnownedRef obj, byte* outBytes, out CreatedRef exn) => Catching(out exn, () => {
                        var data = obj.Peek<byte[]>();
                        for (int i = 0; i < data.Length; i++) {
                            outBytes[i] = data[i];
                        }
                    })),
                    bag<DataConstructor>((byte* bytes, int byteLength, out CreatedRef exn) => Catching(out exn, () => {
                        var data = new byte[byteLength];
                        for (int i = 0; i < byteLength; i++) {
                            data[i] = bytes[i];
                        }
                        return new CreatedRef(data);
                    }))
                );

                Foundation_URL_setup(
                    env,
                    bag<URLAbsoluteURIMethod>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => {
                        Uri uri = obj.Peek<Uri>();
                        return new CreatedRef(uri.AbsoluteUri);
                    })),
                    bag<URLConstructor>((ConsumedRef urlString, out CreatedRef exn) => Catching(out exn, () => {
                        Uri uri = new Uri(urlString.Consume<string>());
                        return new CreatedRef(uri);
                    }))
                );
            }
        }
    }
}
