package com.cricut.testapi

/**
 * <!-- FishyJoes.export(Ranges) -->
 */
sealed class Ranges {

    companion object {
        /**
         * <!-- FishyJoes.export(uInt8Range) -->
         */
        val uInt8Range: com.cricut.fishyjoes.runtime.OpenRange<UByte>
          get() = __jni_get_uInt8Range()
        @JvmStatic
        @JvmName("__jni_get_uInt8Range")
        private external fun __jni_get_uInt8Range(): com.cricut.fishyjoes.runtime.OpenRange<UByte>

        /**
         * <!-- FishyJoes.export(uInt16Range) -->
         */
        val uInt16Range: com.cricut.fishyjoes.runtime.OpenRange<UShort>
          get() = __jni_get_uInt16Range()
        @JvmStatic
        @JvmName("__jni_get_uInt16Range")
        private external fun __jni_get_uInt16Range(): com.cricut.fishyjoes.runtime.OpenRange<UShort>

        /**
         * <!-- FishyJoes.export(uInt32Range) -->
         */
        val uInt32Range: com.cricut.fishyjoes.runtime.OpenRange<UInt>
          get() = __jni_get_uInt32Range()
        @JvmStatic
        @JvmName("__jni_get_uInt32Range")
        private external fun __jni_get_uInt32Range(): com.cricut.fishyjoes.runtime.OpenRange<UInt>

        /**
         * <!-- FishyJoes.export(uInt64Range) -->
         */
        val uInt64Range: com.cricut.fishyjoes.runtime.OpenRange<ULong>
          get() = __jni_get_uInt64Range()
        @JvmStatic
        @JvmName("__jni_get_uInt64Range")
        private external fun __jni_get_uInt64Range(): com.cricut.fishyjoes.runtime.OpenRange<ULong>

        /**
         * <!-- FishyJoes.export(uIntRange) -->
         */
        val uIntRange: com.cricut.fishyjoes.runtime.OpenRange<ULong>
          get() = __jni_get_uIntRange()
        @JvmStatic
        @JvmName("__jni_get_uIntRange")
        private external fun __jni_get_uIntRange(): com.cricut.fishyjoes.runtime.OpenRange<ULong>

        /**
         * <!-- FishyJoes.export(int8Range) -->
         */
        val int8Range: com.cricut.fishyjoes.runtime.OpenRange<Byte>
          get() = __jni_get_int8Range()
        @JvmStatic
        @JvmName("__jni_get_int8Range")
        private external fun __jni_get_int8Range(): com.cricut.fishyjoes.runtime.OpenRange<Byte>

        /**
         * <!-- FishyJoes.export(int16Range) -->
         */
        val int16Range: com.cricut.fishyjoes.runtime.OpenRange<Short>
          get() = __jni_get_int16Range()
        @JvmStatic
        @JvmName("__jni_get_int16Range")
        private external fun __jni_get_int16Range(): com.cricut.fishyjoes.runtime.OpenRange<Short>

        /**
         * <!-- FishyJoes.export(int32Range) -->
         */
        val int32Range: com.cricut.fishyjoes.runtime.OpenRange<Int>
          get() = __jni_get_int32Range()
        @JvmStatic
        @JvmName("__jni_get_int32Range")
        private external fun __jni_get_int32Range(): com.cricut.fishyjoes.runtime.OpenRange<Int>

        /**
         * <!-- FishyJoes.export(int64Range) -->
         */
        val int64Range: com.cricut.fishyjoes.runtime.OpenRange<Long>
          get() = __jni_get_int64Range()
        @JvmStatic
        @JvmName("__jni_get_int64Range")
        private external fun __jni_get_int64Range(): com.cricut.fishyjoes.runtime.OpenRange<Long>

        /**
         * <!-- FishyJoes.export(intRange) -->
         */
        val intRange: com.cricut.fishyjoes.runtime.OpenRange<Long>
          get() = __jni_get_intRange()
        @JvmStatic
        @JvmName("__jni_get_intRange")
        private external fun __jni_get_intRange(): com.cricut.fishyjoes.runtime.OpenRange<Long>

        /**
         * <!-- FishyJoes.export(echoUInt8Range) -->
         */
        fun echoUInt8Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<UByte>
        ): com.cricut.fishyjoes.runtime.OpenRange<UByte> = __jni_echoUInt8Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt8Range")
        private external fun __jni_echoUInt8Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<UByte>
        ): com.cricut.fishyjoes.runtime.OpenRange<UByte>

        /**
         * <!-- FishyJoes.export(echoUInt16Range) -->
         */
        fun echoUInt16Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<UShort>
        ): com.cricut.fishyjoes.runtime.OpenRange<UShort> = __jni_echoUInt16Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt16Range")
        private external fun __jni_echoUInt16Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<UShort>
        ): com.cricut.fishyjoes.runtime.OpenRange<UShort>

        /**
         * <!-- FishyJoes.export(echoUInt32Range) -->
         */
        fun echoUInt32Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<UInt>
        ): com.cricut.fishyjoes.runtime.OpenRange<UInt> = __jni_echoUInt32Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt32Range")
        private external fun __jni_echoUInt32Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<UInt>
        ): com.cricut.fishyjoes.runtime.OpenRange<UInt>

        /**
         * <!-- FishyJoes.export(echoUInt64Range) -->
         */
        fun echoUInt64Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<ULong>
        ): com.cricut.fishyjoes.runtime.OpenRange<ULong> = __jni_echoUInt64Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt64Range")
        private external fun __jni_echoUInt64Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<ULong>
        ): com.cricut.fishyjoes.runtime.OpenRange<ULong>

        /**
         * <!-- FishyJoes.export(echoUIntRange) -->
         */
        fun echoUIntRange(
            range: com.cricut.fishyjoes.runtime.OpenRange<ULong>
        ): com.cricut.fishyjoes.runtime.OpenRange<ULong> = __jni_echoUIntRange(range)
        @JvmStatic
        @JvmName("__jni_echoUIntRange")
        private external fun __jni_echoUIntRange(
            range: com.cricut.fishyjoes.runtime.OpenRange<ULong>
        ): com.cricut.fishyjoes.runtime.OpenRange<ULong>

        /**
         * <!-- FishyJoes.export(echoInt8Range) -->
         */
        fun echoInt8Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<Byte>
        ): com.cricut.fishyjoes.runtime.OpenRange<Byte> = __jni_echoInt8Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt8Range")
        private external fun __jni_echoInt8Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<Byte>
        ): com.cricut.fishyjoes.runtime.OpenRange<Byte>

        /**
         * <!-- FishyJoes.export(echoInt16Range) -->
         */
        fun echoInt16Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<Short>
        ): com.cricut.fishyjoes.runtime.OpenRange<Short> = __jni_echoInt16Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt16Range")
        private external fun __jni_echoInt16Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<Short>
        ): com.cricut.fishyjoes.runtime.OpenRange<Short>

        /**
         * <!-- FishyJoes.export(echoInt32Range) -->
         */
        fun echoInt32Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<Int>
        ): com.cricut.fishyjoes.runtime.OpenRange<Int> = __jni_echoInt32Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt32Range")
        private external fun __jni_echoInt32Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<Int>
        ): com.cricut.fishyjoes.runtime.OpenRange<Int>

        /**
         * <!-- FishyJoes.export(echoInt64Range) -->
         */
        fun echoInt64Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<Long>
        ): com.cricut.fishyjoes.runtime.OpenRange<Long> = __jni_echoInt64Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt64Range")
        private external fun __jni_echoInt64Range(
            range: com.cricut.fishyjoes.runtime.OpenRange<Long>
        ): com.cricut.fishyjoes.runtime.OpenRange<Long>

        /**
         * <!-- FishyJoes.export(echoIntRange) -->
         */
        fun echoIntRange(
            range: com.cricut.fishyjoes.runtime.OpenRange<Long>
        ): com.cricut.fishyjoes.runtime.OpenRange<Long> = __jni_echoIntRange(range)
        @JvmStatic
        @JvmName("__jni_echoIntRange")
        private external fun __jni_echoIntRange(
            range: com.cricut.fishyjoes.runtime.OpenRange<Long>
        ): com.cricut.fishyjoes.runtime.OpenRange<Long>

        init { loadNativeLibs() }
    }
}
