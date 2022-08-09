package com.cricut.testapi

/**
 * <!-- FishyJoes.exportReference(Functions) -->
 */
class Functions private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {

    companion object {
        /**
         * <!-- FishyJoes.export(const42) -->
         */
        val const42: (() -> Long)
          get() = __jni_get_const42()
        @JvmStatic
        @JvmName("__jni_get_const42")
        private external fun __jni_get_const42(): (() -> Long)

        /**
         * <!-- FishyJoes.export(abs) -->
         */
        val abs: ((Long) -> Long)
          get() = __jni_get_abs()
        @JvmStatic
        @JvmName("__jni_get_abs")
        private external fun __jni_get_abs(): ((Long) -> Long)

        /**
         * <!-- FishyJoes.export(intCompose) -->
         */
        val intCompose: ((((Long) -> Long), ((Long) -> Long)) -> ((Long) -> Long))
          get() = __jni_get_intCompose()
        @JvmStatic
        @JvmName("__jni_get_intCompose")
        private external fun __jni_get_intCompose(): ((((Long) -> Long), ((Long) -> Long)) -> ((Long) -> Long))

        /**
         * <!-- FishyJoes.export(add3Things) -->
         */
        val add3Things: ((Float, Double, Long) -> Double)
          get() = __jni_get_add3Things()
        @JvmStatic
        @JvmName("__jni_get_add3Things")
        private external fun __jni_get_add3Things(): ((Float, Double, Long) -> Double)

        /**
         * <!-- FishyJoes.export(makeList) -->
         */
        val makeList: ((String, String, String, String) -> List<String>)
          get() = __jni_get_makeList()
        @JvmStatic
        @JvmName("__jni_get_makeList")
        private external fun __jni_get_makeList(): ((String, String, String, String) -> List<String>)

        /**
         * <!-- FishyJoes.export(fifthThing) -->
         */
        val fifthThing: ((String, Long, Double, String, (() -> Long)) -> (() -> Long))
          get() = __jni_get_fifthThing()
        @JvmStatic
        @JvmName("__jni_get_fifthThing")
        private external fun __jni_get_fifthThing(): ((String, Long, Double, String, (() -> Long)) -> (() -> Long))

        /**
         * <!-- FishyJoes.export(sixthThing) -->
         */
        val sixthThing: ((String, Long, Double, String, (() -> Long), Long) -> Long)
          get() = __jni_get_sixthThing()
        @JvmStatic
        @JvmName("__jni_get_sixthThing")
        private external fun __jni_get_sixthThing(): ((String, Long, Double, String, (() -> Long), Long) -> Long)

        /**
         * <!-- FishyJoes.export(exercise0) -->
         */
        fun exercise0(
            fn: (() -> Long)
        ): kotlin.String = __jni_exercise0(fn)
        @JvmStatic
        @JvmName("__jni_exercise0")
        private external fun __jni_exercise0(
            fn: (() -> Long)
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(exercise1) -->
         */
        fun exercise1(
            fn: ((Long) -> Long)
        ): kotlin.String = __jni_exercise1(fn)
        @JvmStatic
        @JvmName("__jni_exercise1")
        private external fun __jni_exercise1(
            fn: ((Long) -> Long)
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(exercise2) -->
         */
        fun exercise2(
            fn: ((((Long) -> Long), ((Long) -> Long)) -> ((Long) -> Long))
        ): kotlin.String = __jni_exercise2(fn)
        @JvmStatic
        @JvmName("__jni_exercise2")
        private external fun __jni_exercise2(
            fn: ((((Long) -> Long), ((Long) -> Long)) -> ((Long) -> Long))
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(exercise3) -->
         */
        fun exercise3(
            fn: ((Float, Double, Long) -> Double)
        ): kotlin.String = __jni_exercise3(fn)
        @JvmStatic
        @JvmName("__jni_exercise3")
        private external fun __jni_exercise3(
            fn: ((Float, Double, Long) -> Double)
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(exercise4) -->
         */
        fun exercise4(
            fn: ((String, String, String, String) -> List<String>)
        ): kotlin.String = __jni_exercise4(fn)
        @JvmStatic
        @JvmName("__jni_exercise4")
        private external fun __jni_exercise4(
            fn: ((String, String, String, String) -> List<String>)
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(exercise5) -->
         */
        fun exercise5(
            fn: ((String, Long, Double, String, (() -> Long)) -> (() -> Long))
        ): kotlin.String = __jni_exercise5(fn)
        @JvmStatic
        @JvmName("__jni_exercise5")
        private external fun __jni_exercise5(
            fn: ((String, Long, Double, String, (() -> Long)) -> (() -> Long))
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(exercise6) -->
         */
        fun exercise6(
            fn: ((String, Long, Double, String, (() -> Long), Long) -> Long)
        ): kotlin.String = __jni_exercise6(fn)
        @JvmStatic
        @JvmName("__jni_exercise6")
        private external fun __jni_exercise6(
            fn: ((String, Long, Double, String, (() -> Long), Long) -> Long)
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(willThrow) -->
         */
        fun willThrow(
        ): kotlin.String = __jni_willThrow()
        @JvmStatic
        @JvmName("__jni_willThrow")
        private external fun __jni_willThrow(
        ): kotlin.String

        init { loadNativeLibs() }
    }

    /**
     * <!-- FishyJoes.exportReference(Functions.TheError) -->
     */
    class TheError private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {

        companion object {
            init { loadNativeLibs() }
        }
    }
}
