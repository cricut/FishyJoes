using System;
using System.Runtime.InteropServices;

namespace Cricut.TestAPI {
    public class _TypeSetup {
        [DllImport("TestAPI")]
        static extern void ArrayConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void AssociatedDataEnumSetup(
        );

        [DllImport("TestAPI")]
        static extern void BoolSetup(
        );

        [DllImport("TestAPI")]
        static extern void BytesSetup(
        );

        [DllImport("TestAPI")]
        static extern void CollectionsSetup(
        );

        [DllImport("TestAPI")]
        static extern void Collections_CollectionHolderSetup(
        );

        [DllImport("TestAPI")]
        static extern void DictionaryConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void DoubleSetup(
        );

        [DllImport("TestAPI")]
        static extern void EmptyEnumSetup(
        );

        [DllImport("TestAPI")]
        static extern void FloatSetup(
        );

        [DllImport("TestAPI")]
        static extern void Foundation_DataSetup(
        );

        [DllImport("TestAPI")]
        static extern void Function0ConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void Function1ConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void Function2ConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void Function3ConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void Function4ConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void Function5ConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void Function6ConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void FunctionsSetup(
        );

        [DllImport("TestAPI")]
        static extern void Functions_TheErrorSetup(
        );

        [DllImport("TestAPI")]
        static extern void IntSetup(
        );

        [DllImport("TestAPI")]
        static extern void Int16Setup(
        );

        [DllImport("TestAPI")]
        static extern void Int32Setup(
        );

        [DllImport("TestAPI")]
        static extern void Int64Setup(
        );

        [DllImport("TestAPI")]
        static extern void Int8Setup(
        );

        [DllImport("TestAPI")]
        static extern void OptionalConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void PrimitivesSetup(
        );

        [DllImport("TestAPI")]
        static extern void Primitives_PrimitiveHolderSetup(
        );

        [DllImport("TestAPI")]
        static extern void SetConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void SimpleEnumSetup(
        );

        [DllImport("TestAPI")]
        static extern void StringsSetup(
        );

        [DllImport("TestAPI")]
        static extern void StructsSetup(
        );

        [DllImport("TestAPI")]
        static extern void Structs_MemberwiseStructSetup(
        );

        [DllImport("TestAPI")]
        static extern void Structs_ReferenceStructSetup(
        );

        [DllImport("TestAPI")]
        static extern void Swift_StringSetup(
        );

        [DllImport("TestAPI")]
        static extern void Tuple2ConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void Tuple3ConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void Tuple4ConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void Tuple5ConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void Tuple6ConverterSetup(
        );

        [DllImport("TestAPI")]
        static extern void TuplesSetup(
        );

        [DllImport("TestAPI")]
        static extern void UInt16Setup(
        );

        [DllImport("TestAPI")]
        static extern void UInt32Setup(
        );

        [DllImport("TestAPI")]
        static extern void UInt64Setup(
        );

        [DllImport("TestAPI")]
        static extern void UInt8Setup(
        );

        public static void _ensureLoaded() {}

        static _TypeSetup() {
            Console.WriteLine("setting up ArrayConverter...");
            ArrayConverterSetup();
            Console.WriteLine("setting up AssociatedDataEnum...");
            AssociatedDataEnumSetup();
            Console.WriteLine("setting up Bool...");
            BoolSetup();
            Console.WriteLine("setting up Bytes...");
            BytesSetup();
            Console.WriteLine("setting up Collections...");
            CollectionsSetup();
            Console.WriteLine("setting up Collections_CollectionHolder...");
            Collections_CollectionHolderSetup();
            Console.WriteLine("setting up DictionaryConverter...");
            DictionaryConverterSetup();
            Console.WriteLine("setting up Double...");
            DoubleSetup();
            Console.WriteLine("setting up EmptyEnum...");
            EmptyEnumSetup();
            Console.WriteLine("setting up Float...");
            FloatSetup();
            Console.WriteLine("setting up Foundation_Data...");
            Foundation_DataSetup();
            Console.WriteLine("setting up Function0Converter...");
            Function0ConverterSetup();
            Console.WriteLine("setting up Function1Converter...");
            Function1ConverterSetup();
            Console.WriteLine("setting up Function2Converter...");
            Function2ConverterSetup();
            Console.WriteLine("setting up Function3Converter...");
            Function3ConverterSetup();
            Console.WriteLine("setting up Function4Converter...");
            Function4ConverterSetup();
            Console.WriteLine("setting up Function5Converter...");
            Function5ConverterSetup();
            Console.WriteLine("setting up Function6Converter...");
            Function6ConverterSetup();
            Console.WriteLine("setting up Functions...");
            FunctionsSetup();
            Console.WriteLine("setting up Functions_TheError...");
            Functions_TheErrorSetup();
            Console.WriteLine("setting up Int...");
            IntSetup();
            Console.WriteLine("setting up Int16...");
            Int16Setup();
            Console.WriteLine("setting up Int32...");
            Int32Setup();
            Console.WriteLine("setting up Int64...");
            Int64Setup();
            Console.WriteLine("setting up Int8...");
            Int8Setup();
            Console.WriteLine("setting up OptionalConverter...");
            OptionalConverterSetup();
            Console.WriteLine("setting up Primitives...");
            PrimitivesSetup();
            Console.WriteLine("setting up Primitives_PrimitiveHolder...");
            Primitives_PrimitiveHolderSetup();
            Console.WriteLine("setting up SetConverter...");
            SetConverterSetup();
            Console.WriteLine("setting up SimpleEnum...");
            SimpleEnumSetup();
            Console.WriteLine("setting up Strings...");
            StringsSetup();
            Console.WriteLine("setting up Structs...");
            StructsSetup();
            Console.WriteLine("setting up Structs_MemberwiseStruct...");
            Structs_MemberwiseStructSetup();
            Console.WriteLine("setting up Structs_ReferenceStruct...");
            Structs_ReferenceStructSetup();
            Console.WriteLine("setting up Swift_String...");
            Swift_StringSetup();
            Console.WriteLine("setting up Tuple2Converter...");
            Tuple2ConverterSetup();
            Console.WriteLine("setting up Tuple3Converter...");
            Tuple3ConverterSetup();
            Console.WriteLine("setting up Tuple4Converter...");
            Tuple4ConverterSetup();
            Console.WriteLine("setting up Tuple5Converter...");
            Tuple5ConverterSetup();
            Console.WriteLine("setting up Tuple6Converter...");
            Tuple6ConverterSetup();
            Console.WriteLine("setting up Tuples...");
            TuplesSetup();
            Console.WriteLine("setting up UInt16...");
            UInt16Setup();
            Console.WriteLine("setting up UInt32...");
            UInt32Setup();
            Console.WriteLine("setting up UInt64...");
            UInt64Setup();
            Console.WriteLine("setting up UInt8...");
            UInt8Setup();
        }
    }
}
