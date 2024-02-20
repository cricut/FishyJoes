package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(Ranges) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class Ranges {

    companion object {
        /**
         * <!-- FishyJoes.export(uInt8Range) -->
         */
        val uInt8Range: com.cricut.fishyjoes.runtime.SwiftRange<UByte>
          get() = __jni_get_uInt8Range()
        @JvmStatic
        @JvmName("__jni_get_uInt8Range")
        private external fun __jni_get_uInt8Range(): com.cricut.fishyjoes.runtime.SwiftRange<UByte>

        /**
         * <!-- FishyJoes.export(uInt16Range) -->
         */
        val uInt16Range: com.cricut.fishyjoes.runtime.SwiftRange<UShort>
          get() = __jni_get_uInt16Range()
        @JvmStatic
        @JvmName("__jni_get_uInt16Range")
        private external fun __jni_get_uInt16Range(): com.cricut.fishyjoes.runtime.SwiftRange<UShort>

        /**
         * <!-- FishyJoes.export(uInt32Range) -->
         */
        val uInt32Range: com.cricut.fishyjoes.runtime.SwiftRange<UInt>
          get() = __jni_get_uInt32Range()
        @JvmStatic
        @JvmName("__jni_get_uInt32Range")
        private external fun __jni_get_uInt32Range(): com.cricut.fishyjoes.runtime.SwiftRange<UInt>

        /**
         * <!-- FishyJoes.export(uInt64Range) -->
         */
        val uInt64Range: com.cricut.fishyjoes.runtime.SwiftRange<ULong>
          get() = __jni_get_uInt64Range()
        @JvmStatic
        @JvmName("__jni_get_uInt64Range")
        private external fun __jni_get_uInt64Range(): com.cricut.fishyjoes.runtime.SwiftRange<ULong>

        /**
         * <!-- FishyJoes.export(uIntRange) -->
         */
        val uIntRange: com.cricut.fishyjoes.runtime.SwiftRange<ULong>
          get() = __jni_get_uIntRange()
        @JvmStatic
        @JvmName("__jni_get_uIntRange")
        private external fun __jni_get_uIntRange(): com.cricut.fishyjoes.runtime.SwiftRange<ULong>

        /**
         * <!-- FishyJoes.export(int8Range) -->
         */
        val int8Range: com.cricut.fishyjoes.runtime.SwiftRange<Byte>
          get() = __jni_get_int8Range()
        @JvmStatic
        @JvmName("__jni_get_int8Range")
        private external fun __jni_get_int8Range(): com.cricut.fishyjoes.runtime.SwiftRange<Byte>

        /**
         * <!-- FishyJoes.export(int16Range) -->
         */
        val int16Range: com.cricut.fishyjoes.runtime.SwiftRange<Short>
          get() = __jni_get_int16Range()
        @JvmStatic
        @JvmName("__jni_get_int16Range")
        private external fun __jni_get_int16Range(): com.cricut.fishyjoes.runtime.SwiftRange<Short>

        /**
         * <!-- FishyJoes.export(int32Range) -->
         */
        val int32Range: com.cricut.fishyjoes.runtime.SwiftRange<Int>
          get() = __jni_get_int32Range()
        @JvmStatic
        @JvmName("__jni_get_int32Range")
        private external fun __jni_get_int32Range(): com.cricut.fishyjoes.runtime.SwiftRange<Int>

        /**
         * <!-- FishyJoes.export(int64Range) -->
         */
        val int64Range: com.cricut.fishyjoes.runtime.SwiftRange<Long>
          get() = __jni_get_int64Range()
        @JvmStatic
        @JvmName("__jni_get_int64Range")
        private external fun __jni_get_int64Range(): com.cricut.fishyjoes.runtime.SwiftRange<Long>

        /**
         * <!-- FishyJoes.export(intRange) -->
         */
        val intRange: com.cricut.fishyjoes.runtime.SwiftRange<Long>
          get() = __jni_get_intRange()
        @JvmStatic
        @JvmName("__jni_get_intRange")
        private external fun __jni_get_intRange(): com.cricut.fishyjoes.runtime.SwiftRange<Long>

        /**
         * <!-- FishyJoes.export(echoUInt8Range) -->
         */
        fun echoUInt8Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<UByte>
        ): com.cricut.fishyjoes.runtime.SwiftRange<UByte> = __jni_echoUInt8Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt8Range")
        private external fun __jni_echoUInt8Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<UByte>
        ): com.cricut.fishyjoes.runtime.SwiftRange<UByte>

        /**
         * <!-- FishyJoes.export(echoUInt16Range) -->
         */
        fun echoUInt16Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<UShort>
        ): com.cricut.fishyjoes.runtime.SwiftRange<UShort> = __jni_echoUInt16Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt16Range")
        private external fun __jni_echoUInt16Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<UShort>
        ): com.cricut.fishyjoes.runtime.SwiftRange<UShort>

        /**
         * <!-- FishyJoes.export(echoUInt32Range) -->
         */
        fun echoUInt32Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<UInt>
        ): com.cricut.fishyjoes.runtime.SwiftRange<UInt> = __jni_echoUInt32Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt32Range")
        private external fun __jni_echoUInt32Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<UInt>
        ): com.cricut.fishyjoes.runtime.SwiftRange<UInt>

        /**
         * <!-- FishyJoes.export(echoUInt64Range) -->
         */
        fun echoUInt64Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<ULong>
        ): com.cricut.fishyjoes.runtime.SwiftRange<ULong> = __jni_echoUInt64Range(range)
        @JvmStatic
        @JvmName("__jni_echoUInt64Range")
        private external fun __jni_echoUInt64Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<ULong>
        ): com.cricut.fishyjoes.runtime.SwiftRange<ULong>

        /**
         * <!-- FishyJoes.export(echoUIntRange) -->
         */
        fun echoUIntRange(
            range: com.cricut.fishyjoes.runtime.SwiftRange<ULong>
        ): com.cricut.fishyjoes.runtime.SwiftRange<ULong> = __jni_echoUIntRange(range)
        @JvmStatic
        @JvmName("__jni_echoUIntRange")
        private external fun __jni_echoUIntRange(
            range: com.cricut.fishyjoes.runtime.SwiftRange<ULong>
        ): com.cricut.fishyjoes.runtime.SwiftRange<ULong>

        /**
         * <!-- FishyJoes.export(echoInt8Range) -->
         */
        fun echoInt8Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<Byte>
        ): com.cricut.fishyjoes.runtime.SwiftRange<Byte> = __jni_echoInt8Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt8Range")
        private external fun __jni_echoInt8Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<Byte>
        ): com.cricut.fishyjoes.runtime.SwiftRange<Byte>

        /**
         * <!-- FishyJoes.export(echoInt16Range) -->
         */
        fun echoInt16Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<Short>
        ): com.cricut.fishyjoes.runtime.SwiftRange<Short> = __jni_echoInt16Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt16Range")
        private external fun __jni_echoInt16Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<Short>
        ): com.cricut.fishyjoes.runtime.SwiftRange<Short>

        /**
         * <!-- FishyJoes.export(echoInt32Range) -->
         */
        fun echoInt32Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<Int>
        ): com.cricut.fishyjoes.runtime.SwiftRange<Int> = __jni_echoInt32Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt32Range")
        private external fun __jni_echoInt32Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<Int>
        ): com.cricut.fishyjoes.runtime.SwiftRange<Int>

        /**
         * <!-- FishyJoes.export(echoInt64Range) -->
         */
        fun echoInt64Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<Long>
        ): com.cricut.fishyjoes.runtime.SwiftRange<Long> = __jni_echoInt64Range(range)
        @JvmStatic
        @JvmName("__jni_echoInt64Range")
        private external fun __jni_echoInt64Range(
            range: com.cricut.fishyjoes.runtime.SwiftRange<Long>
        ): com.cricut.fishyjoes.runtime.SwiftRange<Long>

        /**
         * <!-- FishyJoes.export(echoIntRange) -->
         */
        fun echoIntRange(
            range: com.cricut.fishyjoes.runtime.SwiftRange<Long>
        ): com.cricut.fishyjoes.runtime.SwiftRange<Long> = __jni_echoIntRange(range)
        @JvmStatic
        @JvmName("__jni_echoIntRange")
        private external fun __jni_echoIntRange(
            range: com.cricut.fishyjoes.runtime.SwiftRange<Long>
        ): com.cricut.fishyjoes.runtime.SwiftRange<Long>

        init { loadNativeLibs() }
    }
}
