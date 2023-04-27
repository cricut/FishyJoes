package com.cricut.testapi

/**
 * <!-- FishyJoes.export(Ranges) -->
 */
sealed class Ranges {

    companion object {
        /**
         * <!-- FishyJoes.export(int8Range) -->
         */
        val int8Range: kotlin.ranges.ClosedRange<Byte>
          get() = __jni_get_int8Range()
        @JvmStatic
        @JvmName("__jni_get_int8Range")
        private external fun __jni_get_int8Range(): kotlin.ranges.ClosedRange<Byte>

        /**
         * <!-- FishyJoes.export(int16Range) -->
         */
        val int16Range: kotlin.ranges.ClosedRange<Short>
          get() = __jni_get_int16Range()
        @JvmStatic
        @JvmName("__jni_get_int16Range")
        private external fun __jni_get_int16Range(): kotlin.ranges.ClosedRange<Short>

        /**
         * <!-- FishyJoes.export(int32Range) -->
         */
        val int32Range: kotlin.ranges.ClosedRange<Int>
          get() = __jni_get_int32Range()
        @JvmStatic
        @JvmName("__jni_get_int32Range")
        private external fun __jni_get_int32Range(): kotlin.ranges.ClosedRange<Int>

        /**
         * <!-- FishyJoes.export(int64Range) -->
         */
        val int64Range: kotlin.ranges.ClosedRange<Long>
          get() = __jni_get_int64Range()
        @JvmStatic
        @JvmName("__jni_get_int64Range")
        private external fun __jni_get_int64Range(): kotlin.ranges.ClosedRange<Long>

        /**
         * <!-- FishyJoes.export(intRange) -->
         */
        val intRange: kotlin.ranges.ClosedRange<Long>
          get() = __jni_get_intRange()
        @JvmStatic
        @JvmName("__jni_get_intRange")
        private external fun __jni_get_intRange(): kotlin.ranges.ClosedRange<Long>

        /**
         * <!-- FishyJoes.export(uInt8Range) -->
         */
        val uInt8Range: kotlin.ranges.ClosedRange<UByte>
          get() = __jni_get_uInt8Range()
        @JvmStatic
        @JvmName("__jni_get_uInt8Range")
        private external fun __jni_get_uInt8Range(): kotlin.ranges.ClosedRange<UByte>

        /**
         * <!-- FishyJoes.export(uInt16Range) -->
         */
        val uInt16Range: kotlin.ranges.ClosedRange<UShort>
          get() = __jni_get_uInt16Range()
        @JvmStatic
        @JvmName("__jni_get_uInt16Range")
        private external fun __jni_get_uInt16Range(): kotlin.ranges.ClosedRange<UShort>

        /**
         * <!-- FishyJoes.export(uInt32Range) -->
         */
        val uInt32Range: kotlin.ranges.ClosedRange<UInt>
          get() = __jni_get_uInt32Range()
        @JvmStatic
        @JvmName("__jni_get_uInt32Range")
        private external fun __jni_get_uInt32Range(): kotlin.ranges.ClosedRange<UInt>

        /**
         * <!-- FishyJoes.export(uInt64Range) -->
         */
        val uInt64Range: kotlin.ranges.ClosedRange<ULong>
          get() = __jni_get_uInt64Range()
        @JvmStatic
        @JvmName("__jni_get_uInt64Range")
        private external fun __jni_get_uInt64Range(): kotlin.ranges.ClosedRange<ULong>

        /**
         * <!-- FishyJoes.export(uIntRange) -->
         */
        val uIntRange: kotlin.ranges.ClosedRange<ULong>
          get() = __jni_get_uIntRange()
        @JvmStatic
        @JvmName("__jni_get_uIntRange")
        private external fun __jni_get_uIntRange(): kotlin.ranges.ClosedRange<ULong>

        /**
         * <!-- FishyJoes.export(echoInt8Range) -->
         */
        fun echoInt8Range(
            range: kotlin.ranges.ClosedRange<Byte>
        ): kotlin.ranges.ClosedRange<Byte> = __jni_echoInt8Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt8Range")
        private external fun __jni_echoInt8Range(
            range: kotlin.ranges.ClosedRange<Byte>
        ): kotlin.ranges.ClosedRange<Byte>

        /**
         * <!-- FishyJoes.export(echoInt16Range) -->
         */
        fun echoInt16Range(
            range: kotlin.ranges.ClosedRange<Short>
        ): kotlin.ranges.ClosedRange<Short> = __jni_echoInt16Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt16Range")
        private external fun __jni_echoInt16Range(
            range: kotlin.ranges.ClosedRange<Short>
        ): kotlin.ranges.ClosedRange<Short>

        /**
         * <!-- FishyJoes.export(echoInt32Range) -->
         */
        fun echoInt32Range(
            range: kotlin.ranges.ClosedRange<Int>
        ): kotlin.ranges.ClosedRange<Int> = __jni_echoInt32Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt32Range")
        private external fun __jni_echoInt32Range(
            range: kotlin.ranges.ClosedRange<Int>
        ): kotlin.ranges.ClosedRange<Int>

        /**
         * <!-- FishyJoes.export(echoInt64Range) -->
         */
        fun echoInt64Range(
            range: kotlin.ranges.ClosedRange<Long>
        ): kotlin.ranges.ClosedRange<Long> = __jni_echoInt64Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt64Range")
        private external fun __jni_echoInt64Range(
            range: kotlin.ranges.ClosedRange<Long>
        ): kotlin.ranges.ClosedRange<Long>

        /**
         * <!-- FishyJoes.export(echoIntRange) -->
         */
        fun echoIntRange(
            range: kotlin.ranges.ClosedRange<Long>
        ): kotlin.ranges.ClosedRange<Long> = __jni_echoIntRange(range)
        @JvmStatic
        @JvmName("__jni_echoIntRange")
        private external fun __jni_echoIntRange(
            range: kotlin.ranges.ClosedRange<Long>
        ): kotlin.ranges.ClosedRange<Long>

        /**
         * <!-- FishyJoes.export(echoUInt8Range) -->
         */
        fun echoUInt8Range(
            range: kotlin.ranges.ClosedRange<UByte>
        ): kotlin.ranges.ClosedRange<UByte> = __jni_echoUInt8Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt8Range")
        private external fun __jni_echoUInt8Range(
            range: kotlin.ranges.ClosedRange<UByte>
        ): kotlin.ranges.ClosedRange<UByte>

        /**
         * <!-- FishyJoes.export(echoUInt16Range) -->
         */
        fun echoUInt16Range(
            range: kotlin.ranges.ClosedRange<UShort>
        ): kotlin.ranges.ClosedRange<UShort> = __jni_echoUInt16Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt16Range")
        private external fun __jni_echoUInt16Range(
            range: kotlin.ranges.ClosedRange<UShort>
        ): kotlin.ranges.ClosedRange<UShort>

        /**
         * <!-- FishyJoes.export(echoUInt32Range) -->
         */
        fun echoUInt32Range(
            range: kotlin.ranges.ClosedRange<UInt>
        ): kotlin.ranges.ClosedRange<UInt> = __jni_echoUInt32Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt32Range")
        private external fun __jni_echoUInt32Range(
            range: kotlin.ranges.ClosedRange<UInt>
        ): kotlin.ranges.ClosedRange<UInt>

        /**
         * <!-- FishyJoes.export(echoUInt64Range) -->
         */
        fun echoUInt64Range(
            range: kotlin.ranges.ClosedRange<ULong>
        ): kotlin.ranges.ClosedRange<ULong> = __jni_echoUInt64Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt64Range")
        private external fun __jni_echoUInt64Range(
            range: kotlin.ranges.ClosedRange<ULong>
        ): kotlin.ranges.ClosedRange<ULong>

        /**
         * <!-- FishyJoes.export(echoUIntRange) -->
         */
        fun echoUIntRange(
            range: kotlin.ranges.ClosedRange<ULong>
        ): kotlin.ranges.ClosedRange<ULong> = __jni_echoUIntRange(range)
        @JvmStatic
        @JvmName("__jni_echoUIntRange")
        private external fun __jni_echoUIntRange(
            range: kotlin.ranges.ClosedRange<ULong>
        ): kotlin.ranges.ClosedRange<ULong>

        init { loadNativeLibs() }
    }
}
