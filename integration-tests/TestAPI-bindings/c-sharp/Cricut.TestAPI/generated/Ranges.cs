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
        public static TODO.TODO UInt8Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_UInt8Range(out exn).Consume<TODO.TODO>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_UInt8Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt16Range) -->
        /// </summary>
        public static TODO.TODO UInt16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_UInt16Range(out exn).Consume<TODO.TODO>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_UInt16Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt32Range) -->
        /// </summary>
        public static TODO.TODO UInt32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_UInt32Range(out exn).Consume<TODO.TODO>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_UInt32Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt64Range) -->
        /// </summary>
        public static TODO.TODO UInt64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_UInt64Range(out exn).Consume<TODO.TODO>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_UInt64Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uIntRange) -->
        /// </summary>
        public static TODO.TODO UIntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_UIntRange(out exn).Consume<TODO.TODO>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_UIntRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int8Range) -->
        /// </summary>
        public static TODO.TODO Int8Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_Int8Range(out exn).Consume<TODO.TODO>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_Int8Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int16Range) -->
        /// </summary>
        public static TODO.TODO Int16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_Int16Range(out exn).Consume<TODO.TODO>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_Int16Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int32Range) -->
        /// </summary>
        public static TODO.TODO Int32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_Int32Range(out exn).Consume<TODO.TODO>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_Int32Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int64Range) -->
        /// </summary>
        public static TODO.TODO Int64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_Int64Range(out exn).Consume<TODO.TODO>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_Int64Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(intRange) -->
        /// </summary>
        public static TODO.TODO IntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_IntRange(out exn).Consume<TODO.TODO>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_IntRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt8Range) -->
        /// </summary>
        public static TODO.TODO EchoUInt8Range(
            TODO.TODO range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoUInt8Range(_rangeHandle.ptr, out _exn)).Consume<TODO.TODO>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoUInt8Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt16Range) -->
        /// </summary>
        public static TODO.TODO EchoUInt16Range(
            TODO.TODO range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoUInt16Range(_rangeHandle.ptr, out _exn)).Consume<TODO.TODO>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoUInt16Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt32Range) -->
        /// </summary>
        public static TODO.TODO EchoUInt32Range(
            TODO.TODO range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoUInt32Range(_rangeHandle.ptr, out _exn)).Consume<TODO.TODO>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoUInt32Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt64Range) -->
        /// </summary>
        public static TODO.TODO EchoUInt64Range(
            TODO.TODO range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoUInt64Range(_rangeHandle.ptr, out _exn)).Consume<TODO.TODO>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoUInt64Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUIntRange) -->
        /// </summary>
        public static TODO.TODO EchoUIntRange(
            TODO.TODO range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoUIntRange(_rangeHandle.ptr, out _exn)).Consume<TODO.TODO>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoUIntRange(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt8Range) -->
        /// </summary>
        public static TODO.TODO EchoInt8Range(
            TODO.TODO range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoInt8Range(_rangeHandle.ptr, out _exn)).Consume<TODO.TODO>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoInt8Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt16Range) -->
        /// </summary>
        public static TODO.TODO EchoInt16Range(
            TODO.TODO range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoInt16Range(_rangeHandle.ptr, out _exn)).Consume<TODO.TODO>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoInt16Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt32Range) -->
        /// </summary>
        public static TODO.TODO EchoInt32Range(
            TODO.TODO range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoInt32Range(_rangeHandle.ptr, out _exn)).Consume<TODO.TODO>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoInt32Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt64Range) -->
        /// </summary>
        public static TODO.TODO EchoInt64Range(
            TODO.TODO range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoInt64Range(_rangeHandle.ptr, out _exn)).Consume<TODO.TODO>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoInt64Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoIntRange) -->
        /// </summary>
        public static TODO.TODO EchoIntRange(
            TODO.TODO range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_Ranges_echoIntRange(_rangeHandle.ptr, out _exn)).Consume<TODO.TODO>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echoIntRange(
            UnownedRef range,
            out CreatedRef exn
        );

        static Ranges() { _TypeSetup._ensureLoaded(); }
    }
}
