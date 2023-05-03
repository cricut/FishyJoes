package com.cricut.testapi

/**
 * <!-- FishyJoes.export(ClosedRanges) -->
 */
sealed class ClosedRanges {

    companion object {
        /**
         * <!-- FishyJoes.export(uInt8Range) -->
         */
        val uInt8Range: com.cricut.fishyjoes.runtime.ClosedRange<UByte>
          get() = __jni_get_uInt8Range()
        @JvmStatic
        @JvmName("__jni_get_uInt8Range")
        private external fun __jni_get_uInt8Range(): com.cricut.fishyjoes.runtime.ClosedRange<UByte>

        /**
         * <!-- FishyJoes.export(uInt16Range) -->
         */
        val uInt16Range: com.cricut.fishyjoes.runtime.ClosedRange<UShort>
          get() = __jni_get_uInt16Range()
        @JvmStatic
        @JvmName("__jni_get_uInt16Range")
        private external fun __jni_get_uInt16Range(): com.cricut.fishyjoes.runtime.ClosedRange<UShort>

        /**
         * <!-- FishyJoes.export(uInt32Range) -->
         */
        val uInt32Range: com.cricut.fishyjoes.runtime.ClosedRange<UInt>
          get() = __jni_get_uInt32Range()
        @JvmStatic
        @JvmName("__jni_get_uInt32Range")
        private external fun __jni_get_uInt32Range(): com.cricut.fishyjoes.runtime.ClosedRange<UInt>

        /**
         * <!-- FishyJoes.export(uInt64Range) -->
         */
        val uInt64Range: com.cricut.fishyjoes.runtime.ClosedRange<ULong>
          get() = __jni_get_uInt64Range()
        @JvmStatic
        @JvmName("__jni_get_uInt64Range")
        private external fun __jni_get_uInt64Range(): com.cricut.fishyjoes.runtime.ClosedRange<ULong>

        /**
         * <!-- FishyJoes.export(uIntRange) -->
         */
        val uIntRange: com.cricut.fishyjoes.runtime.ClosedRange<ULong>
          get() = __jni_get_uIntRange()
        @JvmStatic
        @JvmName("__jni_get_uIntRange")
        private external fun __jni_get_uIntRange(): com.cricut.fishyjoes.runtime.ClosedRange<ULong>

        /**
         * <!-- FishyJoes.export(int8Range) -->
         */
        val int8Range: com.cricut.fishyjoes.runtime.ClosedRange<Byte>
          get() = __jni_get_int8Range()
        @JvmStatic
        @JvmName("__jni_get_int8Range")
        private external fun __jni_get_int8Range(): com.cricut.fishyjoes.runtime.ClosedRange<Byte>

        /**
         * <!-- FishyJoes.export(int16Range) -->
         */
        val int16Range: com.cricut.fishyjoes.runtime.ClosedRange<Short>
          get() = __jni_get_int16Range()
        @JvmStatic
        @JvmName("__jni_get_int16Range")
        private external fun __jni_get_int16Range(): com.cricut.fishyjoes.runtime.ClosedRange<Short>

        /**
         * <!-- FishyJoes.export(int32Range) -->
         */
        val int32Range: com.cricut.fishyjoes.runtime.ClosedRange<Int>
          get() = __jni_get_int32Range()
        @JvmStatic
        @JvmName("__jni_get_int32Range")
        private external fun __jni_get_int32Range(): com.cricut.fishyjoes.runtime.ClosedRange<Int>

        /**
         * <!-- FishyJoes.export(int64Range) -->
         */
        val int64Range: com.cricut.fishyjoes.runtime.ClosedRange<Long>
          get() = __jni_get_int64Range()
        @JvmStatic
        @JvmName("__jni_get_int64Range")
        private external fun __jni_get_int64Range(): com.cricut.fishyjoes.runtime.ClosedRange<Long>

        /**
         * <!-- FishyJoes.export(intRange) -->
         */
        val intRange: com.cricut.fishyjoes.runtime.ClosedRange<Long>
          get() = __jni_get_intRange()
        @JvmStatic
        @JvmName("__jni_get_intRange")
        private external fun __jni_get_intRange(): com.cricut.fishyjoes.runtime.ClosedRange<Long>

        /**
         * <!-- FishyJoes.export(floatRange) -->
         */
        val floatRange: com.cricut.fishyjoes.runtime.ClosedRange<Float>
          get() = __jni_get_floatRange()
        @JvmStatic
        @JvmName("__jni_get_floatRange")
        private external fun __jni_get_floatRange(): com.cricut.fishyjoes.runtime.ClosedRange<Float>

        /**
         * <!-- FishyJoes.export(doubleRange) -->
         */
        val doubleRange: com.cricut.fishyjoes.runtime.ClosedRange<Double>
          get() = __jni_get_doubleRange()
        @JvmStatic
        @JvmName("__jni_get_doubleRange")
        private external fun __jni_get_doubleRange(): com.cricut.fishyjoes.runtime.ClosedRange<Double>

        /**
         * <!-- FishyJoes.export(stringRange) -->
         */
        val stringRange: com.cricut.fishyjoes.runtime.ClosedRange<String>
          get() = __jni_get_stringRange()
        @JvmStatic
        @JvmName("__jni_get_stringRange")
        private external fun __jni_get_stringRange(): com.cricut.fishyjoes.runtime.ClosedRange<String>

        /**
         * <!-- FishyJoes.export(echoUInt8Range) -->
         */
        fun echoUInt8Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<UByte>
        ): com.cricut.fishyjoes.runtime.ClosedRange<UByte> = __jni_echoUInt8Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt8Range")
        private external fun __jni_echoUInt8Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<UByte>
        ): com.cricut.fishyjoes.runtime.ClosedRange<UByte>

        /**
         * <!-- FishyJoes.export(echoUInt16Range) -->
         */
        fun echoUInt16Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<UShort>
        ): com.cricut.fishyjoes.runtime.ClosedRange<UShort> = __jni_echoUInt16Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt16Range")
        private external fun __jni_echoUInt16Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<UShort>
        ): com.cricut.fishyjoes.runtime.ClosedRange<UShort>

        /**
         * <!-- FishyJoes.export(echoUInt32Range) -->
         */
        fun echoUInt32Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<UInt>
        ): com.cricut.fishyjoes.runtime.ClosedRange<UInt> = __jni_echoUInt32Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt32Range")
        private external fun __jni_echoUInt32Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<UInt>
        ): com.cricut.fishyjoes.runtime.ClosedRange<UInt>

        /**
         * <!-- FishyJoes.export(echoUInt64Range) -->
         */
        fun echoUInt64Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<ULong>
        ): com.cricut.fishyjoes.runtime.ClosedRange<ULong> = __jni_echoUInt64Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt64Range")
        private external fun __jni_echoUInt64Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<ULong>
        ): com.cricut.fishyjoes.runtime.ClosedRange<ULong>

        /**
         * <!-- FishyJoes.export(echoUIntRange) -->
         */
        fun echoUIntRange(
            range: com.cricut.fishyjoes.runtime.ClosedRange<ULong>
        ): com.cricut.fishyjoes.runtime.ClosedRange<ULong> = __jni_echoUIntRange(range)
        @JvmStatic
        @JvmName("__jni_echoUIntRange")
        private external fun __jni_echoUIntRange(
            range: com.cricut.fishyjoes.runtime.ClosedRange<ULong>
        ): com.cricut.fishyjoes.runtime.ClosedRange<ULong>

        /**
         * <!-- FishyJoes.export(echoInt8Range) -->
         */
        fun echoInt8Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Byte>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Byte> = __jni_echoInt8Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt8Range")
        private external fun __jni_echoInt8Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Byte>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Byte>

        /**
         * <!-- FishyJoes.export(echoInt16Range) -->
         */
        fun echoInt16Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Short>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Short> = __jni_echoInt16Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt16Range")
        private external fun __jni_echoInt16Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Short>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Short>

        /**
         * <!-- FishyJoes.export(echoInt32Range) -->
         */
        fun echoInt32Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Int>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Int> = __jni_echoInt32Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt32Range")
        private external fun __jni_echoInt32Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Int>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Int>

        /**
         * <!-- FishyJoes.export(echoInt64Range) -->
         */
        fun echoInt64Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Long>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Long> = __jni_echoInt64Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt64Range")
        private external fun __jni_echoInt64Range(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Long>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Long>

        /**
         * <!-- FishyJoes.export(echoIntRange) -->
         */
        fun echoIntRange(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Long>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Long> = __jni_echoIntRange(range)
        @JvmStatic
        @JvmName("__jni_echoIntRange")
        private external fun __jni_echoIntRange(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Long>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Long>

        /**
         * <!-- FishyJoes.export(echoFloatRange) -->
         */
        fun echoFloatRange(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Float>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Float> = __jni_echoFloatRange(range)
        @JvmStatic
        @JvmName("__jni_echoFloatRange")
        private external fun __jni_echoFloatRange(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Float>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Float>

        /**
         * <!-- FishyJoes.export(echoDoubleRange) -->
         */
        fun echoDoubleRange(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Double>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Double> = __jni_echoDoubleRange(range)
        @JvmStatic
        @JvmName("__jni_echoDoubleRange")
        private external fun __jni_echoDoubleRange(
            range: com.cricut.fishyjoes.runtime.ClosedRange<Double>
        ): com.cricut.fishyjoes.runtime.ClosedRange<Double>

        /**
         * <!-- FishyJoes.export(echoStringRange) -->
         */
        fun echoStringRange(
            range: com.cricut.fishyjoes.runtime.ClosedRange<String>
        ): com.cricut.fishyjoes.runtime.ClosedRange<String> = __jni_echoStringRange(range)
        @JvmStatic
        @JvmName("__jni_echoStringRange")
        private external fun __jni_echoStringRange(
            range: com.cricut.fishyjoes.runtime.ClosedRange<String>
        ): com.cricut.fishyjoes.runtime.ClosedRange<String>

        init { loadNativeLibs() }
    }
}
