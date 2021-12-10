package com.cricut.testapi

import com.cricut.fishyjoes.runtime.LibraryLoader

/**
 * <!-- FishyJoes.export(Primitives) -->
 */
sealed class Primitives {

    companion object {
        /**
         * <!-- FishyJoes.export(falseBool) -->
         */
        val falseBool: Boolean
          get() = __jni_get_falseBool()
        @JvmStatic
        private external fun __jni_get_falseBool(): Boolean

        /**
         * <!-- FishyJoes.export(trueBool) -->
         */
        val trueBool: Boolean
          get() = __jni_get_trueBool()
        @JvmStatic
        private external fun __jni_get_trueBool(): Boolean

        /**
         * <!-- FishyJoes.export(zeroUInt8) -->
         */
        val zeroUInt8: UByte
          get() = __jni_get_zeroUInt8().toUByte()
        @JvmStatic
        private external fun __jni_get_zeroUInt8(): Byte

        /**
         * <!-- FishyJoes.export(minUInt8) -->
         */
        val minUInt8: UByte
          get() = __jni_get_minUInt8().toUByte()
        @JvmStatic
        private external fun __jni_get_minUInt8(): Byte

        /**
         * <!-- FishyJoes.export(maxUInt8) -->
         */
        val maxUInt8: UByte
          get() = __jni_get_maxUInt8().toUByte()
        @JvmStatic
        private external fun __jni_get_maxUInt8(): Byte

        /**
         * <!-- FishyJoes.export(zeroUInt16) -->
         */
        val zeroUInt16: UShort
          get() = __jni_get_zeroUInt16().toUShort()
        @JvmStatic
        private external fun __jni_get_zeroUInt16(): Short

        /**
         * <!-- FishyJoes.export(minUInt16) -->
         */
        val minUInt16: UShort
          get() = __jni_get_minUInt16().toUShort()
        @JvmStatic
        private external fun __jni_get_minUInt16(): Short

        /**
         * <!-- FishyJoes.export(maxUInt16) -->
         */
        val maxUInt16: UShort
          get() = __jni_get_maxUInt16().toUShort()
        @JvmStatic
        private external fun __jni_get_maxUInt16(): Short

        /**
         * <!-- FishyJoes.export(zeroUInt32) -->
         */
        val zeroUInt32: UInt
          get() = __jni_get_zeroUInt32().toUInt()
        @JvmStatic
        private external fun __jni_get_zeroUInt32(): Int

        /**
         * <!-- FishyJoes.export(minUInt32) -->
         */
        val minUInt32: UInt
          get() = __jni_get_minUInt32().toUInt()
        @JvmStatic
        private external fun __jni_get_minUInt32(): Int

        /**
         * <!-- FishyJoes.export(maxUInt32) -->
         */
        val maxUInt32: UInt
          get() = __jni_get_maxUInt32().toUInt()
        @JvmStatic
        private external fun __jni_get_maxUInt32(): Int

        /**
         * <!-- FishyJoes.export(zeroInt8) -->
         */
        val zeroInt8: Byte
          get() = __jni_get_zeroInt8()
        @JvmStatic
        private external fun __jni_get_zeroInt8(): Byte

        /**
         * <!-- FishyJoes.export(minInt8) -->
         */
        val minInt8: Byte
          get() = __jni_get_minInt8()
        @JvmStatic
        private external fun __jni_get_minInt8(): Byte

        /**
         * <!-- FishyJoes.export(maxInt8) -->
         */
        val maxInt8: Byte
          get() = __jni_get_maxInt8()
        @JvmStatic
        private external fun __jni_get_maxInt8(): Byte

        /**
         * <!-- FishyJoes.export(zeroInt16) -->
         */
        val zeroInt16: Short
          get() = __jni_get_zeroInt16()
        @JvmStatic
        private external fun __jni_get_zeroInt16(): Short

        /**
         * <!-- FishyJoes.export(minInt16) -->
         */
        val minInt16: Short
          get() = __jni_get_minInt16()
        @JvmStatic
        private external fun __jni_get_minInt16(): Short

        /**
         * <!-- FishyJoes.export(maxInt16) -->
         */
        val maxInt16: Short
          get() = __jni_get_maxInt16()
        @JvmStatic
        private external fun __jni_get_maxInt16(): Short

        /**
         * <!-- FishyJoes.export(zeroInt32) -->
         */
        val zeroInt32: Int
          get() = __jni_get_zeroInt32()
        @JvmStatic
        private external fun __jni_get_zeroInt32(): Int

        /**
         * <!-- FishyJoes.export(minInt32) -->
         */
        val minInt32: Int
          get() = __jni_get_minInt32()
        @JvmStatic
        private external fun __jni_get_minInt32(): Int

        /**
         * <!-- FishyJoes.export(maxInt32) -->
         */
        val maxInt32: Int
          get() = __jni_get_maxInt32()
        @JvmStatic
        private external fun __jni_get_maxInt32(): Int

        /**
         * <!-- FishyJoes.export(zeroInt) -->
         */
        val zeroInt: Long
          get() = __jni_get_zeroInt()
        @JvmStatic
        private external fun __jni_get_zeroInt(): Long

        /**
         * <!-- FishyJoes.export(minInt) -->
         */
        val minInt: Long
          get() = __jni_get_minInt()
        @JvmStatic
        private external fun __jni_get_minInt(): Long

        /**
         * <!-- FishyJoes.export(maxInt) -->
         */
        val maxInt: Long
          get() = __jni_get_maxInt()
        @JvmStatic
        private external fun __jni_get_maxInt(): Long

        /**
         * <!-- FishyJoes.export(zeroFloat) -->
         */
        val zeroFloat: Float
          get() = __jni_get_zeroFloat()
        @JvmStatic
        private external fun __jni_get_zeroFloat(): Float

        /**
         * <!-- FishyJoes.export(minFloat) -->
         */
        val minFloat: Float
          get() = __jni_get_minFloat()
        @JvmStatic
        private external fun __jni_get_minFloat(): Float

        /**
         * <!-- FishyJoes.export(maxFloat) -->
         */
        val maxFloat: Float
          get() = __jni_get_maxFloat()
        @JvmStatic
        private external fun __jni_get_maxFloat(): Float

        /**
         * <!-- FishyJoes.export(zeroDouble) -->
         */
        val zeroDouble: Double
          get() = __jni_get_zeroDouble()
        @JvmStatic
        private external fun __jni_get_zeroDouble(): Double

        /**
         * <!-- FishyJoes.export(minDouble) -->
         */
        val minDouble: Double
          get() = __jni_get_minDouble()
        @JvmStatic
        private external fun __jni_get_minDouble(): Double

        /**
         * <!-- FishyJoes.export(maxDouble) -->
         */
        val maxDouble: Double
          get() = __jni_get_maxDouble()
        @JvmStatic
        private external fun __jni_get_maxDouble(): Double

        /**
         * <!-- FishyJoes.export(echoBool) -->
         */
        fun echoBool(
            value: Boolean
        ): Boolean = __jni_echoBool(value)
        @JvmStatic
        private external fun __jni_echoBool(
            value: Boolean
        ): Boolean

        /**
         * <!-- FishyJoes.export(echoUInt8) -->
         */
        fun echoUInt8(
            value: UByte
        ): UByte = __jni_echoUInt8(value.toByte()).toUByte()
        @JvmStatic
        private external fun __jni_echoUInt8(
            value: Byte
        ): Byte

        /**
         * <!-- FishyJoes.export(echoUInt16) -->
         */
        fun echoUInt16(
            value: UShort
        ): UShort = __jni_echoUInt16(value.toShort()).toUShort()
        @JvmStatic
        private external fun __jni_echoUInt16(
            value: Short
        ): Short

        /**
         * <!-- FishyJoes.export(echoUInt32) -->
         */
        fun echoUInt32(
            value: UInt
        ): UInt = __jni_echoUInt32(value.toInt()).toUInt()
        @JvmStatic
        private external fun __jni_echoUInt32(
            value: Int
        ): Int

        /**
         * <!-- FishyJoes.export(echoInt8) -->
         */
        fun echoInt8(
            value: Byte
        ): Byte = __jni_echoInt8(value)
        @JvmStatic
        private external fun __jni_echoInt8(
            value: Byte
        ): Byte

        /**
         * <!-- FishyJoes.export(echoInt16) -->
         */
        fun echoInt16(
            value: Short
        ): Short = __jni_echoInt16(value)
        @JvmStatic
        private external fun __jni_echoInt16(
            value: Short
        ): Short

        /**
         * <!-- FishyJoes.export(echoInt32) -->
         */
        fun echoInt32(
            value: Int
        ): Int = __jni_echoInt32(value)
        @JvmStatic
        private external fun __jni_echoInt32(
            value: Int
        ): Int

        /**
         * <!-- FishyJoes.export(echoFloat) -->
         */
        fun echoFloat(
            value: Float
        ): Float = __jni_echoFloat(value)
        @JvmStatic
        private external fun __jni_echoFloat(
            value: Float
        ): Float

        /**
         * <!-- FishyJoes.export(echoDouble) -->
         */
        fun echoDouble(
            value: Double
        ): Double = __jni_echoDouble(value)
        @JvmStatic
        private external fun __jni_echoDouble(
            value: Double
        ): Double

        /**
         * <!-- FishyJoes.export(maybeEchoBool) -->
         */
        fun maybeEchoBool(
            value: Boolean?
        ): Boolean? = __jni_maybeEchoBool(value)
        @JvmStatic
        private external fun __jni_maybeEchoBool(
            value: Boolean?
        ): Boolean?

        /**
         * <!-- FishyJoes.export(maybeEchoUInt8) -->
         */
        fun maybeEchoUInt8(
            value: UByte?
        ): UByte? = __jni_maybeEchoUInt8(value)
        @JvmStatic
        private external fun __jni_maybeEchoUInt8(
            value: UByte?
        ): UByte?

        /**
         * <!-- FishyJoes.export(maybeEchoUInt16) -->
         */
        fun maybeEchoUInt16(
            value: UShort?
        ): UShort? = __jni_maybeEchoUInt16(value)
        @JvmStatic
        private external fun __jni_maybeEchoUInt16(
            value: UShort?
        ): UShort?

        /**
         * <!-- FishyJoes.export(maybeEchoUInt32) -->
         */
        fun maybeEchoUInt32(
            value: UInt?
        ): UInt? = __jni_maybeEchoUInt32(value)
        @JvmStatic
        private external fun __jni_maybeEchoUInt32(
            value: UInt?
        ): UInt?

        /**
         * <!-- FishyJoes.export(maybeEchoInt8) -->
         */
        fun maybeEchoInt8(
            value: Byte?
        ): Byte? = __jni_maybeEchoInt8(value)
        @JvmStatic
        private external fun __jni_maybeEchoInt8(
            value: Byte?
        ): Byte?

        /**
         * <!-- FishyJoes.export(maybeEchoInt16) -->
         */
        fun maybeEchoInt16(
            value: Short?
        ): Short? = __jni_maybeEchoInt16(value)
        @JvmStatic
        private external fun __jni_maybeEchoInt16(
            value: Short?
        ): Short?

        /**
         * <!-- FishyJoes.export(maybeEchoInt32) -->
         */
        fun maybeEchoInt32(
            value: Int?
        ): Int? = __jni_maybeEchoInt32(value)
        @JvmStatic
        private external fun __jni_maybeEchoInt32(
            value: Int?
        ): Int?

        /**
         * <!-- FishyJoes.export(maybeEchoFloat) -->
         */
        fun maybeEchoFloat(
            value: Float?
        ): Float? = __jni_maybeEchoFloat(value)
        @JvmStatic
        private external fun __jni_maybeEchoFloat(
            value: Float?
        ): Float?

        /**
         * <!-- FishyJoes.export(maybeEchoDouble) -->
         */
        fun maybeEchoDouble(
            value: Double?
        ): Double? = __jni_maybeEchoDouble(value)
        @JvmStatic
        private external fun __jni_maybeEchoDouble(
            value: Double?
        ): Double?

        init {
            LibraryLoader.ensureLoaded("TestAPI")
        }
    }
}
