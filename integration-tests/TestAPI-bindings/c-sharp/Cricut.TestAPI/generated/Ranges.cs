using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Ranges) -->
    /// </summary>
    public record Ranges {
        private Ranges() {}

        /// <summary>
        /// <!-- FishyJoes.export(uInt8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<byte> UInt8Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_UInt8Range(out exn).Consume<Cricut.FishyJoesRuntime.OpenRange<byte>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_UInt8Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<ushort> UInt16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_UInt16Range(out exn).Consume<Cricut.FishyJoesRuntime.OpenRange<ushort>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_UInt16Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<uint> UInt32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_UInt32Range(out exn).Consume<Cricut.FishyJoesRuntime.OpenRange<uint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_UInt32Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<ulong> UInt64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_UInt64Range(out exn).Consume<Cricut.FishyJoesRuntime.OpenRange<ulong>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_UInt64Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uIntRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<nuint> UIntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_UIntRange(out exn).Consume<Cricut.FishyJoesRuntime.OpenRange<nuint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_UIntRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<sbyte> Int8Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_Int8Range(out exn).Consume<Cricut.FishyJoesRuntime.OpenRange<sbyte>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_Int8Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<short> Int16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_Int16Range(out exn).Consume<Cricut.FishyJoesRuntime.OpenRange<short>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_Int16Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<int> Int32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_Int32Range(out exn).Consume<Cricut.FishyJoesRuntime.OpenRange<int>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_Int32Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<long> Int64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_Int64Range(out exn).Consume<Cricut.FishyJoesRuntime.OpenRange<long>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_Int64Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(intRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<nint> IntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_IntRange(out exn).Consume<Cricut.FishyJoesRuntime.OpenRange<nint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_IntRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<byte> EchoUInt8Range(
            Cricut.FishyJoesRuntime.OpenRange<byte> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoUInt8Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.OpenRange<byte>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoUInt8Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<ushort> EchoUInt16Range(
            Cricut.FishyJoesRuntime.OpenRange<ushort> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoUInt16Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.OpenRange<ushort>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoUInt16Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<uint> EchoUInt32Range(
            Cricut.FishyJoesRuntime.OpenRange<uint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoUInt32Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.OpenRange<uint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoUInt32Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<ulong> EchoUInt64Range(
            Cricut.FishyJoesRuntime.OpenRange<ulong> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoUInt64Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.OpenRange<ulong>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoUInt64Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUIntRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<nuint> EchoUIntRange(
            Cricut.FishyJoesRuntime.OpenRange<nuint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoUIntRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.OpenRange<nuint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoUIntRange(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<sbyte> EchoInt8Range(
            Cricut.FishyJoesRuntime.OpenRange<sbyte> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoInt8Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.OpenRange<sbyte>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoInt8Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<short> EchoInt16Range(
            Cricut.FishyJoesRuntime.OpenRange<short> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoInt16Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.OpenRange<short>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoInt16Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<int> EchoInt32Range(
            Cricut.FishyJoesRuntime.OpenRange<int> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoInt32Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.OpenRange<int>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoInt32Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<long> EchoInt64Range(
            Cricut.FishyJoesRuntime.OpenRange<long> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoInt64Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.OpenRange<long>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoInt64Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoIntRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.OpenRange<nint> EchoIntRange(
            Cricut.FishyJoesRuntime.OpenRange<nint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoIntRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.OpenRange<nint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoIntRange(
            UnownedRef range,
            out CreatedRef exn
        );

        static Ranges() { _TypeSetup._ensureLoaded(); }
    }
}
