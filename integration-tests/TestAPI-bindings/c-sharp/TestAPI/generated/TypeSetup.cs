using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    public class _TypeSetup {
        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void ArrayConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void AssociatedDataEnumSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void BoolSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void BytesSetup(
            SwiftReference.Constructor constructorMethod,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void CollectionsSetup(
            SwiftReference.Constructor constructorMethod,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Collections_CollectionHolderSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void DictionaryConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void DoubleSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void EmptyEnumSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void FloatSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Foundation_DataSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Function0ConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Function1ConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Function2ConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Function3ConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Function4ConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Function5ConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Function6ConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void FunctionsSetup(
            SwiftReference.Constructor constructorMethod,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Functions_TheErrorSetup(
            SwiftReference.Constructor constructorMethod,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void IntSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Int16Setup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Int32Setup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Int64Setup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Int8Setup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void OptionalConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void PrimitivesSetup(
            SwiftReference.Constructor constructorMethod,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Primitives_PrimitiveHolderSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void SetConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void SimpleEnumSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void StringsSetup(
            SwiftReference.Constructor constructorMethod,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void StructsSetup(
            SwiftReference.Constructor constructorMethod,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Structs_MemberwiseStructSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Structs_ReferenceStructSetup(
            SwiftReference.Constructor constructorMethod,
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Swift_StringSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Tuple2ConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Tuple3ConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Tuple4ConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Tuple5ConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void Tuple6ConverterSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void TuplesSetup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void UInt16Setup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void UInt32Setup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void UInt64Setup(
            out IntPtr _exn
        );

        [DllImport("TestAPI-c-sharp.dylib")]
        static extern void UInt8Setup(
            out IntPtr _exn
        );

        public static void _ensureLoaded() {}

        static _TypeSetup() {
            Console.WriteLine("setting up ArrayConverter...");
            Utilities.Check((out IntPtr exn) => ArrayConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up AssociatedDataEnum...");
            Utilities.Check((out IntPtr exn) => AssociatedDataEnumSetup(
                out exn
            ));
            Console.WriteLine("setting up Bool...");
            Utilities.Check((out IntPtr exn) => BoolSetup(
                out exn
            ));
            Console.WriteLine("setting up Bytes...");
            Utilities.Check((out IntPtr exn) => BytesSetup(
                (IntPtr ptr, out IntPtr exn) => Utilities.Catching(out exn, () => (IntPtr)GCHandle.Alloc(new Cricut.TestAPI.Bytes(ptr))),
                out exn
            ));
            Console.WriteLine("setting up Collections...");
            Utilities.Check((out IntPtr exn) => CollectionsSetup(
                (IntPtr ptr, out IntPtr exn) => Utilities.Catching(out exn, () => (IntPtr)GCHandle.Alloc(new Cricut.TestAPI.Collections(ptr))),
                out exn
            ));
            Console.WriteLine("setting up Collections_CollectionHolder...");
            Utilities.Check((out IntPtr exn) => Collections_CollectionHolderSetup(
                out exn
            ));
            Console.WriteLine("setting up DictionaryConverter...");
            Utilities.Check((out IntPtr exn) => DictionaryConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Double...");
            Utilities.Check((out IntPtr exn) => DoubleSetup(
                out exn
            ));
            Console.WriteLine("setting up EmptyEnum...");
            Utilities.Check((out IntPtr exn) => EmptyEnumSetup(
                out exn
            ));
            Console.WriteLine("setting up Float...");
            Utilities.Check((out IntPtr exn) => FloatSetup(
                out exn
            ));
            Console.WriteLine("setting up Foundation_Data...");
            Utilities.Check((out IntPtr exn) => Foundation_DataSetup(
                out exn
            ));
            Console.WriteLine("setting up Function0Converter...");
            Utilities.Check((out IntPtr exn) => Function0ConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Function1Converter...");
            Utilities.Check((out IntPtr exn) => Function1ConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Function2Converter...");
            Utilities.Check((out IntPtr exn) => Function2ConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Function3Converter...");
            Utilities.Check((out IntPtr exn) => Function3ConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Function4Converter...");
            Utilities.Check((out IntPtr exn) => Function4ConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Function5Converter...");
            Utilities.Check((out IntPtr exn) => Function5ConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Function6Converter...");
            Utilities.Check((out IntPtr exn) => Function6ConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Functions...");
            Utilities.Check((out IntPtr exn) => FunctionsSetup(
                (IntPtr ptr, out IntPtr exn) => Utilities.Catching(out exn, () => (IntPtr)GCHandle.Alloc(new Cricut.TestAPI.Functions(ptr))),
                out exn
            ));
            Console.WriteLine("setting up Functions_TheError...");
            Utilities.Check((out IntPtr exn) => Functions_TheErrorSetup(
                (IntPtr ptr, out IntPtr exn) => Utilities.Catching(out exn, () => (IntPtr)GCHandle.Alloc(new Cricut.TestAPI.Functions.TheError(ptr))),
                out exn
            ));
            Console.WriteLine("setting up Int...");
            Utilities.Check((out IntPtr exn) => IntSetup(
                out exn
            ));
            Console.WriteLine("setting up Int16...");
            Utilities.Check((out IntPtr exn) => Int16Setup(
                out exn
            ));
            Console.WriteLine("setting up Int32...");
            Utilities.Check((out IntPtr exn) => Int32Setup(
                out exn
            ));
            Console.WriteLine("setting up Int64...");
            Utilities.Check((out IntPtr exn) => Int64Setup(
                out exn
            ));
            Console.WriteLine("setting up Int8...");
            Utilities.Check((out IntPtr exn) => Int8Setup(
                out exn
            ));
            Console.WriteLine("setting up OptionalConverter...");
            Utilities.Check((out IntPtr exn) => OptionalConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Primitives...");
            Utilities.Check((out IntPtr exn) => PrimitivesSetup(
                (IntPtr ptr, out IntPtr exn) => Utilities.Catching(out exn, () => (IntPtr)GCHandle.Alloc(new Cricut.TestAPI.Primitives(ptr))),
                out exn
            ));
            Console.WriteLine("setting up Primitives_PrimitiveHolder...");
            Utilities.Check((out IntPtr exn) => Primitives_PrimitiveHolderSetup(
                out exn
            ));
            Console.WriteLine("setting up SetConverter...");
            Utilities.Check((out IntPtr exn) => SetConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up SimpleEnum...");
            Utilities.Check((out IntPtr exn) => SimpleEnumSetup(
                out exn
            ));
            Console.WriteLine("setting up Strings...");
            Utilities.Check((out IntPtr exn) => StringsSetup(
                (IntPtr ptr, out IntPtr exn) => Utilities.Catching(out exn, () => (IntPtr)GCHandle.Alloc(new Cricut.TestAPI.Strings(ptr))),
                out exn
            ));
            Console.WriteLine("setting up Structs...");
            Utilities.Check((out IntPtr exn) => StructsSetup(
                (IntPtr ptr, out IntPtr exn) => Utilities.Catching(out exn, () => (IntPtr)GCHandle.Alloc(new Cricut.TestAPI.Structs(ptr))),
                out exn
            ));
            Console.WriteLine("setting up Structs_MemberwiseStruct...");
            Utilities.Check((out IntPtr exn) => Structs_MemberwiseStructSetup(
                out exn
            ));
            Console.WriteLine("setting up Structs_ReferenceStruct...");
            Utilities.Check((out IntPtr exn) => Structs_ReferenceStructSetup(
                (IntPtr ptr, out IntPtr exn) => Utilities.Catching(out exn, () => (IntPtr)GCHandle.Alloc(new Cricut.TestAPI.Structs.ReferenceStruct(ptr))),
                out exn
            ));
            Console.WriteLine("setting up Swift_String...");
            Utilities.Check((out IntPtr exn) => Swift_StringSetup(
                out exn
            ));
            Console.WriteLine("setting up Tuple2Converter...");
            Utilities.Check((out IntPtr exn) => Tuple2ConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Tuple3Converter...");
            Utilities.Check((out IntPtr exn) => Tuple3ConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Tuple4Converter...");
            Utilities.Check((out IntPtr exn) => Tuple4ConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Tuple5Converter...");
            Utilities.Check((out IntPtr exn) => Tuple5ConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Tuple6Converter...");
            Utilities.Check((out IntPtr exn) => Tuple6ConverterSetup(
                out exn
            ));
            Console.WriteLine("setting up Tuples...");
            Utilities.Check((out IntPtr exn) => TuplesSetup(
                out exn
            ));
            Console.WriteLine("setting up UInt16...");
            Utilities.Check((out IntPtr exn) => UInt16Setup(
                out exn
            ));
            Console.WriteLine("setting up UInt32...");
            Utilities.Check((out IntPtr exn) => UInt32Setup(
                out exn
            ));
            Console.WriteLine("setting up UInt64...");
            Utilities.Check((out IntPtr exn) => UInt64Setup(
                out exn
            ));
            Console.WriteLine("setting up UInt8...");
            Utilities.Check((out IntPtr exn) => UInt8Setup(
                out exn
            ));
        }
    }
}
