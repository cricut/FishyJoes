package com.cricut.testapi

/**
 * <!-- FishyJoes.export(Tuples) -->
 */
sealed class Tuples {

    companion object {
        /**
         * <!-- FishyJoes.export(tuple2) -->
         */
        val tuple2: kotlin.Pair<Long, kotlin.String>
          get() = __jni_get_tuple2()
        @JvmStatic
        @JvmName("__jni_get_tuple2")
        private external fun __jni_get_tuple2(): kotlin.Pair<Long, kotlin.String>

        /**
         * <!-- FishyJoes.export(tuple3) -->
         */
        val tuple3: kotlin.Triple<kotlin.String, Double, kotlin.String>
          get() = __jni_get_tuple3()
        @JvmStatic
        @JvmName("__jni_get_tuple3")
        private external fun __jni_get_tuple3(): kotlin.Triple<kotlin.String, Double, kotlin.String>

        /**
         * <!-- FishyJoes.export(tuple4) -->
         */
        val tuple4: com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>
          get() = __jni_get_tuple4()
        @JvmStatic
        @JvmName("__jni_get_tuple4")
        private external fun __jni_get_tuple4(): com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>

        /**
         * <!-- FishyJoes.export(tuple5) -->
         */
        val tuple5: com.cricut.fishyjoes.runtime.Tuple5<kotlin.String, UByte, com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.Pair<Long, kotlin.String>>
          get() = __jni_get_tuple5()
        @JvmStatic
        @JvmName("__jni_get_tuple5")
        private external fun __jni_get_tuple5(): com.cricut.fishyjoes.runtime.Tuple5<kotlin.String, UByte, com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.Pair<Long, kotlin.String>>

        /**
         * <!-- FishyJoes.export(tuple6) -->
         */
        val tuple6: com.cricut.fishyjoes.runtime.Tuple6<kotlin.String, Long, Double, com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>, com.cricut.fishyjoes.runtime.Tuple5<kotlin.String, UByte, com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.Pair<Long, kotlin.String>>, Boolean>
          get() = __jni_get_tuple6()
        @JvmStatic
        @JvmName("__jni_get_tuple6")
        private external fun __jni_get_tuple6(): com.cricut.fishyjoes.runtime.Tuple6<kotlin.String, Long, Double, com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>, com.cricut.fishyjoes.runtime.Tuple5<kotlin.String, UByte, com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.Pair<Long, kotlin.String>>, Boolean>

        /**
         * <!-- FishyJoes.export(checkTuples) -->
         */
        fun checkTuples(
            t2: kotlin.Pair<Long, kotlin.String>,
            t3: kotlin.Triple<kotlin.String, Double, kotlin.String>,
            t4: com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>,
            t5: com.cricut.fishyjoes.runtime.Tuple5<kotlin.String, UByte, com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.Pair<Long, kotlin.String>>,
            t6: com.cricut.fishyjoes.runtime.Tuple6<kotlin.String, Long, Double, com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>, com.cricut.fishyjoes.runtime.Tuple5<kotlin.String, UByte, com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.Pair<Long, kotlin.String>>, Boolean>
        ): Boolean = __jni_checkTuples(t2, t3, t4, t5, t6)
        @JvmStatic
        @JvmName("__jni_checkTuples")
        private external fun __jni_checkTuples(
            t2: kotlin.Pair<Long, kotlin.String>,
            t3: kotlin.Triple<kotlin.String, Double, kotlin.String>,
            t4: com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>,
            t5: com.cricut.fishyjoes.runtime.Tuple5<kotlin.String, UByte, com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.Pair<Long, kotlin.String>>,
            t6: com.cricut.fishyjoes.runtime.Tuple6<kotlin.String, Long, Double, com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>, com.cricut.fishyjoes.runtime.Tuple5<kotlin.String, UByte, com.cricut.fishyjoes.runtime.Tuple4<kotlin.Pair<Long, kotlin.String>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.String, Boolean>, kotlin.Triple<kotlin.String, Double, kotlin.String>, kotlin.Pair<Long, kotlin.String>>, Boolean>
        ): Boolean

        init { loadNativeLibs() }
    }
}
