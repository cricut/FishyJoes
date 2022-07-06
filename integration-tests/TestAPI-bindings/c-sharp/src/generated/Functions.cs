using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using Cricut.FishyJoesRuntime;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Functions) -->
     */
    public class Functions : SwiftReference {
        Functions(IntPtr reference): base(reference) {}

        /**
         * <!-- FishyJoes.export(const42) -->
         */
        public System.Func<nint> const42 {
            get => Check((out Exception? exn) => __cs_get_Functions_const42(out exn));
        }

        [DllImport("TestAPI")]
        private static extern System.Func<nint> __cs_get_Functions_const42(out Exception? exn);

        /**
         * <!-- FishyJoes.export(abs) -->
         */
        public System.Func<nint, nint> abs {
            get => Check((out Exception? exn) => __cs_get_Functions_abs(out exn));
        }

        [DllImport("TestAPI")]
        private static extern System.Func<nint, nint> __cs_get_Functions_abs(out Exception? exn);

        /**
         * <!-- FishyJoes.export(intCompose) -->
         */
        public System.Func<Func<nint, nint>, Func<nint, nint>, Func<nint, nint>> intCompose {
            get => Check((out Exception? exn) => __cs_get_Functions_intCompose(out exn));
        }

        [DllImport("TestAPI")]
        private static extern System.Func<Func<nint, nint>, Func<nint, nint>, Func<nint, nint>> __cs_get_Functions_intCompose(out Exception? exn);

        /**
         * <!-- FishyJoes.export(add3Things) -->
         */
        public System.Func<float, double, nint, double> add3Things {
            get => Check((out Exception? exn) => __cs_get_Functions_add3Things(out exn));
        }

        [DllImport("TestAPI")]
        private static extern System.Func<float, double, nint, double> __cs_get_Functions_add3Things(out Exception? exn);

        /**
         * <!-- FishyJoes.export(makeList) -->
         */
        public System.Func<String, String, String, String, String[]> makeList {
            get => Check((out Exception? exn) => __cs_get_Functions_makeList(out exn));
        }

        [DllImport("TestAPI")]
        private static extern System.Func<String, String, String, String, String[]> __cs_get_Functions_makeList(out Exception? exn);

        /**
         * <!-- FishyJoes.export(fifthThing) -->
         */
        public System.Func<String, nint, double, String, Func<nint>, Func<nint>> fifthThing {
            get => Check((out Exception? exn) => __cs_get_Functions_fifthThing(out exn));
        }

        [DllImport("TestAPI")]
        private static extern System.Func<String, nint, double, String, Func<nint>, Func<nint>> __cs_get_Functions_fifthThing(out Exception? exn);

        /**
         * <!-- FishyJoes.export(sixthThing) -->
         */
        public System.Func<String, nint, double, String, Func<nint>, nint, nint> sixthThing {
            get => Check((out Exception? exn) => __cs_get_Functions_sixthThing(out exn));
        }

        [DllImport("TestAPI")]
        private static extern System.Func<String, nint, double, String, Func<nint>, nint, nint> __cs_get_Functions_sixthThing(out Exception? exn);

        /**
         * <!-- FishyJoes.export(exercise0) -->
         */
        public String exercise0(
            System.Func<nint> fn
        ) => Check((out Exception? exn) => __cs_Functions_exercise0(fn, out exn));
        [DllImport("TestAPI")]
        static extern String __cs_Functions_exercise0(
            System.Func<nint> fn,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(exercise1) -->
         */
        public String exercise1(
            System.Func<nint, nint> fn
        ) => Check((out Exception? exn) => __cs_Functions_exercise1(fn, out exn));
        [DllImport("TestAPI")]
        static extern String __cs_Functions_exercise1(
            System.Func<nint, nint> fn,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(exercise2) -->
         */
        public String exercise2(
            System.Func<Func<nint, nint>, Func<nint, nint>, Func<nint, nint>> fn
        ) => Check((out Exception? exn) => __cs_Functions_exercise2(fn, out exn));
        [DllImport("TestAPI")]
        static extern String __cs_Functions_exercise2(
            System.Func<Func<nint, nint>, Func<nint, nint>, Func<nint, nint>> fn,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(exercise3) -->
         */
        public String exercise3(
            System.Func<float, double, nint, double> fn
        ) => Check((out Exception? exn) => __cs_Functions_exercise3(fn, out exn));
        [DllImport("TestAPI")]
        static extern String __cs_Functions_exercise3(
            System.Func<float, double, nint, double> fn,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(exercise4) -->
         */
        public String exercise4(
            System.Func<String, String, String, String, String[]> fn
        ) => Check((out Exception? exn) => __cs_Functions_exercise4(fn, out exn));
        [DllImport("TestAPI")]
        static extern String __cs_Functions_exercise4(
            System.Func<String, String, String, String, String[]> fn,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(exercise5) -->
         */
        public String exercise5(
            System.Func<String, nint, double, String, Func<nint>, Func<nint>> fn
        ) => Check((out Exception? exn) => __cs_Functions_exercise5(fn, out exn));
        [DllImport("TestAPI")]
        static extern String __cs_Functions_exercise5(
            System.Func<String, nint, double, String, Func<nint>, Func<nint>> fn,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(exercise6) -->
         */
        public String exercise6(
            System.Func<String, nint, double, String, Func<nint>, nint, nint> fn
        ) => Check((out Exception? exn) => __cs_Functions_exercise6(fn, out exn));
        [DllImport("TestAPI")]
        static extern String __cs_Functions_exercise6(
            System.Func<String, nint, double, String, Func<nint>, nint, nint> fn,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(willThrow) -->
         */
        public String willThrow(
        ) => Check((out Exception? exn) => __cs_Functions_willThrow(out exn));
        [DllImport("TestAPI")]
        static extern String __cs_Functions_willThrow(
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.exportReference(Functions.TheError) -->
         */
        public class TheError : SwiftReference {
            TheError(IntPtr reference): base(reference) {}

            static TheError() { _TypeSetup._ensureLoaded(); }
        }
        static Functions() { _TypeSetup._ensureLoaded(); }
    }
}
