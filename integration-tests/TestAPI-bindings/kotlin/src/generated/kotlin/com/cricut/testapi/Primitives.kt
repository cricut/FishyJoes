package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(Primitives) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class Primitives {

    companion object {
        /**
         * <!-- FishyJoes.export(bitCountInt) -->
         */
        val bitCountInt: Long
          get() = __jni_get_bitCountInt()
        @JvmStatic
        @JvmName("__jni_get_bitCountInt")
        private external fun __jni_get_bitCountInt(): Long

        /**
         * <!-- FishyJoes.export(bitCountUInt) -->
         */
        val bitCountUInt: Long
          get() = __jni_get_bitCountUInt()
        @JvmStatic
        @JvmName("__jni_get_bitCountUInt")
        private external fun __jni_get_bitCountUInt(): Long

        /**
         * <!-- FishyJoes.export(defaultPrimitiveHolder) -->
         */
        val defaultPrimitiveHolder: com.cricut.testapi.Primitives.PrimitiveHolder
          get() = __jni_get_defaultPrimitiveHolder()
        @JvmStatic
        @JvmName("__jni_get_defaultPrimitiveHolder")
        private external fun __jni_get_defaultPrimitiveHolder(): com.cricut.testapi.Primitives.PrimitiveHolder

        /**
         * <!-- FishyJoes.export(falseBool) -->
         */
        val falseBool: Boolean
          get() = __jni_get_falseBool()
        @JvmStatic
        @JvmName("__jni_get_falseBool")
        private external fun __jni_get_falseBool(): Boolean

        /**
         * <!-- FishyJoes.export(manyBool) -->
         */
        val manyBool: kotlin.collections.List<Boolean>
          get() = __jni_get_manyBool()
        @JvmStatic
        @JvmName("__jni_get_manyBool")
        private external fun __jni_get_manyBool(): kotlin.collections.List<Boolean>

        /**
         * <!-- FishyJoes.export(manyDouble) -->
         */
        val manyDouble: kotlin.collections.List<Double>
          get() = __jni_get_manyDouble()
        @JvmStatic
        @JvmName("__jni_get_manyDouble")
        private external fun __jni_get_manyDouble(): kotlin.collections.List<Double>

        /**
         * <!-- FishyJoes.export(manyFloat) -->
         */
        val manyFloat: kotlin.collections.List<Float>
          get() = __jni_get_manyFloat()
        @JvmStatic
        @JvmName("__jni_get_manyFloat")
        private external fun __jni_get_manyFloat(): kotlin.collections.List<Float>

        /**
         * <!-- FishyJoes.export(manyInt) -->
         */
        val manyInt: kotlin.collections.List<Long>
          get() = __jni_get_manyInt()
        @JvmStatic
        @JvmName("__jni_get_manyInt")
        private external fun __jni_get_manyInt(): kotlin.collections.List<Long>

        /**
         * <!-- FishyJoes.export(manyInt16) -->
         */
        val manyInt16: kotlin.collections.List<Short>
          get() = __jni_get_manyInt16()
        @JvmStatic
        @JvmName("__jni_get_manyInt16")
        private external fun __jni_get_manyInt16(): kotlin.collections.List<Short>

        /**
         * <!-- FishyJoes.export(manyInt32) -->
         */
        val manyInt32: kotlin.collections.List<Int>
          get() = __jni_get_manyInt32()
        @JvmStatic
        @JvmName("__jni_get_manyInt32")
        private external fun __jni_get_manyInt32(): kotlin.collections.List<Int>

        /**
         * <!-- FishyJoes.export(manyInt64) -->
         */
        val manyInt64: kotlin.collections.List<Long>
          get() = __jni_get_manyInt64()
        @JvmStatic
        @JvmName("__jni_get_manyInt64")
        private external fun __jni_get_manyInt64(): kotlin.collections.List<Long>

        /**
         * <!-- FishyJoes.export(manyInt8) -->
         */
        val manyInt8: kotlin.collections.List<Byte>
          get() = __jni_get_manyInt8()
        @JvmStatic
        @JvmName("__jni_get_manyInt8")
        private external fun __jni_get_manyInt8(): kotlin.collections.List<Byte>

        /**
         * <!-- FishyJoes.export(manyMaybeBool) -->
         */
        val manyMaybeBool: kotlin.collections.List<Boolean?>
          get() = __jni_get_manyMaybeBool()
        @JvmStatic
        @JvmName("__jni_get_manyMaybeBool")
        private external fun __jni_get_manyMaybeBool(): kotlin.collections.List<Boolean?>

        /**
         * <!-- FishyJoes.export(manyMaybeDouble) -->
         */
        val manyMaybeDouble: kotlin.collections.List<Double?>
          get() = __jni_get_manyMaybeDouble()
        @JvmStatic
        @JvmName("__jni_get_manyMaybeDouble")
        private external fun __jni_get_manyMaybeDouble(): kotlin.collections.List<Double?>

        /**
         * <!-- FishyJoes.export(manyMaybeFloat) -->
         */
        val manyMaybeFloat: kotlin.collections.List<Float?>
          get() = __jni_get_manyMaybeFloat()
        @JvmStatic
        @JvmName("__jni_get_manyMaybeFloat")
        private external fun __jni_get_manyMaybeFloat(): kotlin.collections.List<Float?>

        /**
         * <!-- FishyJoes.export(manyMaybeInt) -->
         */
        val manyMaybeInt: kotlin.collections.List<Long?>
          get() = __jni_get_manyMaybeInt()
        @JvmStatic
        @JvmName("__jni_get_manyMaybeInt")
        private external fun __jni_get_manyMaybeInt(): kotlin.collections.List<Long?>

        /**
         * <!-- FishyJoes.export(manyMaybeInt16) -->
         */
        val manyMaybeInt16: kotlin.collections.List<Short?>
          get() = __jni_get_manyMaybeInt16()
        @JvmStatic
        @JvmName("__jni_get_manyMaybeInt16")
        private external fun __jni_get_manyMaybeInt16(): kotlin.collections.List<Short?>

        /**
         * <!-- FishyJoes.export(manyMaybeInt32) -->
         */
        val manyMaybeInt32: kotlin.collections.List<Int?>
          get() = __jni_get_manyMaybeInt32()
        @JvmStatic
        @JvmName("__jni_get_manyMaybeInt32")
        private external fun __jni_get_manyMaybeInt32(): kotlin.collections.List<Int?>

        /**
         * <!-- FishyJoes.export(manyMaybeInt64) -->
         */
        val manyMaybeInt64: kotlin.collections.List<Long?>
          get() = __jni_get_manyMaybeInt64()
        @JvmStatic
        @JvmName("__jni_get_manyMaybeInt64")
        private external fun __jni_get_manyMaybeInt64(): kotlin.collections.List<Long?>

        /**
         * <!-- FishyJoes.export(manyMaybeInt8) -->
         */
        val manyMaybeInt8: kotlin.collections.List<Byte?>
          get() = __jni_get_manyMaybeInt8()
        @JvmStatic
        @JvmName("__jni_get_manyMaybeInt8")
        private external fun __jni_get_manyMaybeInt8(): kotlin.collections.List<Byte?>

        /**
         * <!-- FishyJoes.export(manyMaybeUInt) -->
         */
        val manyMaybeUInt: kotlin.collections.List<ULong?>
          get() = __jni_get_manyMaybeUInt()
        @JvmStatic
        @JvmName("__jni_get_manyMaybeUInt")
        private external fun __jni_get_manyMaybeUInt(): kotlin.collections.List<ULong?>

        /**
         * <!-- FishyJoes.export(manyMaybeUInt16) -->
         */
        val manyMaybeUInt16: kotlin.collections.List<UShort?>
          get() = __jni_get_manyMaybeUInt16()
        @JvmStatic
        @JvmName("__jni_get_manyMaybeUInt16")
        private external fun __jni_get_manyMaybeUInt16(): kotlin.collections.List<UShort?>

        /**
         * <!-- FishyJoes.export(manyMaybeUInt32) -->
         */
        val manyMaybeUInt32: kotlin.collections.List<UInt?>
          get() = __jni_get_manyMaybeUInt32()
        @JvmStatic
        @JvmName("__jni_get_manyMaybeUInt32")
        private external fun __jni_get_manyMaybeUInt32(): kotlin.collections.List<UInt?>

        /**
         * <!-- FishyJoes.export(manyMaybeUInt64) -->
         */
        val manyMaybeUInt64: kotlin.collections.List<ULong?>
          get() = __jni_get_manyMaybeUInt64()
        @JvmStatic
        @JvmName("__jni_get_manyMaybeUInt64")
        private external fun __jni_get_manyMaybeUInt64(): kotlin.collections.List<ULong?>

        /**
         * <!-- FishyJoes.export(manyMaybeUInt8) -->
         */
        val manyMaybeUInt8: kotlin.collections.List<UByte?>
          get() = __jni_get_manyMaybeUInt8()
        @JvmStatic
        @JvmName("__jni_get_manyMaybeUInt8")
        private external fun __jni_get_manyMaybeUInt8(): kotlin.collections.List<UByte?>

        /**
         * <!-- FishyJoes.export(manyUInt) -->
         */
        val manyUInt: kotlin.collections.List<ULong>
          get() = __jni_get_manyUInt()
        @JvmStatic
        @JvmName("__jni_get_manyUInt")
        private external fun __jni_get_manyUInt(): kotlin.collections.List<ULong>

        /**
         * <!-- FishyJoes.export(manyUInt16) -->
         */
        val manyUInt16: kotlin.collections.List<UShort>
          get() = __jni_get_manyUInt16()
        @JvmStatic
        @JvmName("__jni_get_manyUInt16")
        private external fun __jni_get_manyUInt16(): kotlin.collections.List<UShort>

        /**
         * <!-- FishyJoes.export(manyUInt32) -->
         */
        val manyUInt32: kotlin.collections.List<UInt>
          get() = __jni_get_manyUInt32()
        @JvmStatic
        @JvmName("__jni_get_manyUInt32")
        private external fun __jni_get_manyUInt32(): kotlin.collections.List<UInt>

        /**
         * <!-- FishyJoes.export(manyUInt64) -->
         */
        val manyUInt64: kotlin.collections.List<ULong>
          get() = __jni_get_manyUInt64()
        @JvmStatic
        @JvmName("__jni_get_manyUInt64")
        private external fun __jni_get_manyUInt64(): kotlin.collections.List<ULong>

        /**
         * <!-- FishyJoes.export(manyUInt8) -->
         */
        val manyUInt8: kotlin.collections.List<UByte>
          get() = __jni_get_manyUInt8()
        @JvmStatic
        @JvmName("__jni_get_manyUInt8")
        private external fun __jni_get_manyUInt8(): kotlin.collections.List<UByte>

        /**
         * <!-- FishyJoes.export(maxDouble) -->
         */
        val maxDouble: Double
          get() = __jni_get_maxDouble()
        @JvmStatic
        @JvmName("__jni_get_maxDouble")
        private external fun __jni_get_maxDouble(): Double

        /**
         * <!-- FishyJoes.export(maxFloat) -->
         */
        val maxFloat: Float
          get() = __jni_get_maxFloat()
        @JvmStatic
        @JvmName("__jni_get_maxFloat")
        private external fun __jni_get_maxFloat(): Float

        /**
         * <!-- FishyJoes.export(maxInt) -->
         */
        val maxInt: Long
          get() = __jni_get_maxInt()
        @JvmStatic
        @JvmName("__jni_get_maxInt")
        private external fun __jni_get_maxInt(): Long

        /**
         * <!-- FishyJoes.export(maxInt16) -->
         */
        val maxInt16: Short
          get() = __jni_get_maxInt16()
        @JvmStatic
        @JvmName("__jni_get_maxInt16")
        private external fun __jni_get_maxInt16(): Short

        /**
         * <!-- FishyJoes.export(maxInt32) -->
         */
        val maxInt32: Int
          get() = __jni_get_maxInt32()
        @JvmStatic
        @JvmName("__jni_get_maxInt32")
        private external fun __jni_get_maxInt32(): Int

        /**
         * <!-- FishyJoes.export(maxInt64) -->
         */
        val maxInt64: Long
          get() = __jni_get_maxInt64()
        @JvmStatic
        @JvmName("__jni_get_maxInt64")
        private external fun __jni_get_maxInt64(): Long

        /**
         * <!-- FishyJoes.export(maxInt8) -->
         */
        val maxInt8: Byte
          get() = __jni_get_maxInt8()
        @JvmStatic
        @JvmName("__jni_get_maxInt8")
        private external fun __jni_get_maxInt8(): Byte

        /**
         * <!-- FishyJoes.export(maxUInt) -->
         */
        val maxUInt: ULong
          get() = __jni_get_maxUInt().toULong()
        @JvmStatic
        @JvmName("__jni_get_maxUInt")
        private external fun __jni_get_maxUInt(): Long

        /**
         * <!-- FishyJoes.export(maxUInt16) -->
         */
        val maxUInt16: UShort
          get() = __jni_get_maxUInt16().toUShort()
        @JvmStatic
        @JvmName("__jni_get_maxUInt16")
        private external fun __jni_get_maxUInt16(): Short

        /**
         * <!-- FishyJoes.export(maxUInt32) -->
         */
        val maxUInt32: UInt
          get() = __jni_get_maxUInt32().toUInt()
        @JvmStatic
        @JvmName("__jni_get_maxUInt32")
        private external fun __jni_get_maxUInt32(): Int

        /**
         * <!-- FishyJoes.export(maxUInt64) -->
         */
        val maxUInt64: ULong
          get() = __jni_get_maxUInt64().toULong()
        @JvmStatic
        @JvmName("__jni_get_maxUInt64")
        private external fun __jni_get_maxUInt64(): Long

        /**
         * <!-- FishyJoes.export(maxUInt8) -->
         */
        val maxUInt8: UByte
          get() = __jni_get_maxUInt8().toUByte()
        @JvmStatic
        @JvmName("__jni_get_maxUInt8")
        private external fun __jni_get_maxUInt8(): Byte

        /**
         * <!-- FishyJoes.export(minDouble) -->
         */
        val minDouble: Double
          get() = __jni_get_minDouble()
        @JvmStatic
        @JvmName("__jni_get_minDouble")
        private external fun __jni_get_minDouble(): Double

        /**
         * <!-- FishyJoes.export(minFloat) -->
         */
        val minFloat: Float
          get() = __jni_get_minFloat()
        @JvmStatic
        @JvmName("__jni_get_minFloat")
        private external fun __jni_get_minFloat(): Float

        /**
         * <!-- FishyJoes.export(minInt) -->
         */
        val minInt: Long
          get() = __jni_get_minInt()
        @JvmStatic
        @JvmName("__jni_get_minInt")
        private external fun __jni_get_minInt(): Long

        /**
         * <!-- FishyJoes.export(minInt16) -->
         */
        val minInt16: Short
          get() = __jni_get_minInt16()
        @JvmStatic
        @JvmName("__jni_get_minInt16")
        private external fun __jni_get_minInt16(): Short

        /**
         * <!-- FishyJoes.export(minInt32) -->
         */
        val minInt32: Int
          get() = __jni_get_minInt32()
        @JvmStatic
        @JvmName("__jni_get_minInt32")
        private external fun __jni_get_minInt32(): Int

        /**
         * <!-- FishyJoes.export(minInt64) -->
         */
        val minInt64: Long
          get() = __jni_get_minInt64()
        @JvmStatic
        @JvmName("__jni_get_minInt64")
        private external fun __jni_get_minInt64(): Long

        /**
         * <!-- FishyJoes.export(minInt8) -->
         */
        val minInt8: Byte
          get() = __jni_get_minInt8()
        @JvmStatic
        @JvmName("__jni_get_minInt8")
        private external fun __jni_get_minInt8(): Byte

        /**
         * <!-- FishyJoes.export(minUInt) -->
         */
        val minUInt: ULong
          get() = __jni_get_minUInt().toULong()
        @JvmStatic
        @JvmName("__jni_get_minUInt")
        private external fun __jni_get_minUInt(): Long

        /**
         * <!-- FishyJoes.export(minUInt16) -->
         */
        val minUInt16: UShort
          get() = __jni_get_minUInt16().toUShort()
        @JvmStatic
        @JvmName("__jni_get_minUInt16")
        private external fun __jni_get_minUInt16(): Short

        /**
         * <!-- FishyJoes.export(minUInt32) -->
         */
        val minUInt32: UInt
          get() = __jni_get_minUInt32().toUInt()
        @JvmStatic
        @JvmName("__jni_get_minUInt32")
        private external fun __jni_get_minUInt32(): Int

        /**
         * <!-- FishyJoes.export(minUInt64) -->
         */
        val minUInt64: ULong
          get() = __jni_get_minUInt64().toULong()
        @JvmStatic
        @JvmName("__jni_get_minUInt64")
        private external fun __jni_get_minUInt64(): Long

        /**
         * <!-- FishyJoes.export(minUInt8) -->
         */
        val minUInt8: UByte
          get() = __jni_get_minUInt8().toUByte()
        @JvmStatic
        @JvmName("__jni_get_minUInt8")
        private external fun __jni_get_minUInt8(): Byte

        /**
         * <!-- FishyJoes.export(trueBool) -->
         */
        val trueBool: Boolean
          get() = __jni_get_trueBool()
        @JvmStatic
        @JvmName("__jni_get_trueBool")
        private external fun __jni_get_trueBool(): Boolean

        /**
         * <!-- FishyJoes.export(zeroDouble) -->
         */
        val zeroDouble: Double
          get() = __jni_get_zeroDouble()
        @JvmStatic
        @JvmName("__jni_get_zeroDouble")
        private external fun __jni_get_zeroDouble(): Double

        /**
         * <!-- FishyJoes.export(zeroFloat) -->
         */
        val zeroFloat: Float
          get() = __jni_get_zeroFloat()
        @JvmStatic
        @JvmName("__jni_get_zeroFloat")
        private external fun __jni_get_zeroFloat(): Float

        /**
         * <!-- FishyJoes.export(zeroInt) -->
         */
        val zeroInt: Long
          get() = __jni_get_zeroInt()
        @JvmStatic
        @JvmName("__jni_get_zeroInt")
        private external fun __jni_get_zeroInt(): Long

        /**
         * <!-- FishyJoes.export(zeroInt16) -->
         */
        val zeroInt16: Short
          get() = __jni_get_zeroInt16()
        @JvmStatic
        @JvmName("__jni_get_zeroInt16")
        private external fun __jni_get_zeroInt16(): Short

        /**
         * <!-- FishyJoes.export(zeroInt32) -->
         */
        val zeroInt32: Int
          get() = __jni_get_zeroInt32()
        @JvmStatic
        @JvmName("__jni_get_zeroInt32")
        private external fun __jni_get_zeroInt32(): Int

        /**
         * <!-- FishyJoes.export(zeroInt64) -->
         */
        val zeroInt64: Long
          get() = __jni_get_zeroInt64()
        @JvmStatic
        @JvmName("__jni_get_zeroInt64")
        private external fun __jni_get_zeroInt64(): Long

        /**
         * <!-- FishyJoes.export(zeroInt8) -->
         */
        val zeroInt8: Byte
          get() = __jni_get_zeroInt8()
        @JvmStatic
        @JvmName("__jni_get_zeroInt8")
        private external fun __jni_get_zeroInt8(): Byte

        /**
         * <!-- FishyJoes.export(zeroUInt) -->
         */
        val zeroUInt: ULong
          get() = __jni_get_zeroUInt().toULong()
        @JvmStatic
        @JvmName("__jni_get_zeroUInt")
        private external fun __jni_get_zeroUInt(): Long

        /**
         * <!-- FishyJoes.export(zeroUInt16) -->
         */
        val zeroUInt16: UShort
          get() = __jni_get_zeroUInt16().toUShort()
        @JvmStatic
        @JvmName("__jni_get_zeroUInt16")
        private external fun __jni_get_zeroUInt16(): Short

        /**
         * <!-- FishyJoes.export(zeroUInt32) -->
         */
        val zeroUInt32: UInt
          get() = __jni_get_zeroUInt32().toUInt()
        @JvmStatic
        @JvmName("__jni_get_zeroUInt32")
        private external fun __jni_get_zeroUInt32(): Int

        /**
         * <!-- FishyJoes.export(zeroUInt64) -->
         */
        val zeroUInt64: ULong
          get() = __jni_get_zeroUInt64().toULong()
        @JvmStatic
        @JvmName("__jni_get_zeroUInt64")
        private external fun __jni_get_zeroUInt64(): Long

        /**
         * <!-- FishyJoes.export(zeroUInt8) -->
         */
        val zeroUInt8: UByte
          get() = __jni_get_zeroUInt8().toUByte()
        @JvmStatic
        @JvmName("__jni_get_zeroUInt8")
        private external fun __jni_get_zeroUInt8(): Byte

        /**
         * <!-- FishyJoes.export(echoBool) -->
         */
        fun echoBool(
            value: Boolean
        ): Boolean = __jni_echoBool(value)
        @JvmStatic
        @JvmName("__jni_echoBool")
        private external fun __jni_echoBool(
            value: Boolean
        ): Boolean

        /**
         * <!-- FishyJoes.export(echoDouble) -->
         */
        fun echoDouble(
            value: Double
        ): Double = __jni_echoDouble(value)
        @JvmStatic
        @JvmName("__jni_echoDouble")
        private external fun __jni_echoDouble(
            value: Double
        ): Double

        /**
         * <!-- FishyJoes.export(echoFloat) -->
         */
        fun echoFloat(
            value: Float
        ): Float = __jni_echoFloat(value)
        @JvmStatic
        @JvmName("__jni_echoFloat")
        private external fun __jni_echoFloat(
            value: Float
        ): Float

        /**
         * <!-- FishyJoes.export(echoInt) -->
         */
        fun echoInt(
            value: Long
        ): Long = __jni_echoInt(value)
        @JvmStatic
        @JvmName("__jni_echoInt")
        private external fun __jni_echoInt(
            value: Long
        ): Long

        /**
         * <!-- FishyJoes.export(echoInt16) -->
         */
        fun echoInt16(
            value: Short
        ): Short = __jni_echoInt16(value)
        @JvmStatic
        @JvmName("__jni_echoInt16")
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
        @JvmName("__jni_echoInt32")
        private external fun __jni_echoInt32(
            value: Int
        ): Int

        /**
         * <!-- FishyJoes.export(echoInt64) -->
         */
        fun echoInt64(
            value: Long
        ): Long = __jni_echoInt64(value)
        @JvmStatic
        @JvmName("__jni_echoInt64")
        private external fun __jni_echoInt64(
            value: Long
        ): Long

        /**
         * <!-- FishyJoes.export(echoInt8) -->
         */
        fun echoInt8(
            value: Byte
        ): Byte = __jni_echoInt8(value)
        @JvmStatic
        @JvmName("__jni_echoInt8")
        private external fun __jni_echoInt8(
            value: Byte
        ): Byte

        /**
         * <!-- FishyJoes.export(echoUInt) -->
         */
        fun echoUInt(
            value: ULong
        ): ULong = __jni_echoUInt(value.toLong()).toULong()
        @JvmStatic
        @JvmName("__jni_echoUInt")
        private external fun __jni_echoUInt(
            value: Long
        ): Long

        /**
         * <!-- FishyJoes.export(echoUInt16) -->
         */
        fun echoUInt16(
            value: UShort
        ): UShort = __jni_echoUInt16(value.toShort()).toUShort()
        @JvmStatic
        @JvmName("__jni_echoUInt16")
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
        @JvmName("__jni_echoUInt32")
        private external fun __jni_echoUInt32(
            value: Int
        ): Int

        /**
         * <!-- FishyJoes.export(echoUInt64) -->
         */
        fun echoUInt64(
            value: ULong
        ): ULong = __jni_echoUInt64(value.toLong()).toULong()
        @JvmStatic
        @JvmName("__jni_echoUInt64")
        private external fun __jni_echoUInt64(
            value: Long
        ): Long

        /**
         * <!-- FishyJoes.export(echoUInt8) -->
         */
        fun echoUInt8(
            value: UByte
        ): UByte = __jni_echoUInt8(value.toByte()).toUByte()
        @JvmStatic
        @JvmName("__jni_echoUInt8")
        private external fun __jni_echoUInt8(
            value: Byte
        ): Byte

        /**
         * <!-- FishyJoes.export(maybeEchoBool) -->
         */
        fun maybeEchoBool(
            value: Boolean?
        ): Boolean? = __jni_maybeEchoBool(value)
        @JvmStatic
        @JvmName("__jni_maybeEchoBool")
        private external fun __jni_maybeEchoBool(
            value: Boolean?
        ): Boolean?

        /**
         * <!-- FishyJoes.export(maybeEchoDouble) -->
         */
        fun maybeEchoDouble(
            value: Double?
        ): Double? = __jni_maybeEchoDouble(value)
        @JvmStatic
        @JvmName("__jni_maybeEchoDouble")
        private external fun __jni_maybeEchoDouble(
            value: Double?
        ): Double?

        /**
         * <!-- FishyJoes.export(maybeEchoFloat) -->
         */
        fun maybeEchoFloat(
            value: Float?
        ): Float? = __jni_maybeEchoFloat(value)
        @JvmStatic
        @JvmName("__jni_maybeEchoFloat")
        private external fun __jni_maybeEchoFloat(
            value: Float?
        ): Float?

        /**
         * <!-- FishyJoes.export(maybeEchoInt) -->
         */
        fun maybeEchoInt(
            value: Long?
        ): Long? = __jni_maybeEchoInt(value)
        @JvmStatic
        @JvmName("__jni_maybeEchoInt")
        private external fun __jni_maybeEchoInt(
            value: Long?
        ): Long?

        /**
         * <!-- FishyJoes.export(maybeEchoInt16) -->
         */
        fun maybeEchoInt16(
            value: Short?
        ): Short? = __jni_maybeEchoInt16(value)
        @JvmStatic
        @JvmName("__jni_maybeEchoInt16")
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
        @JvmName("__jni_maybeEchoInt32")
        private external fun __jni_maybeEchoInt32(
            value: Int?
        ): Int?

        /**
         * <!-- FishyJoes.export(maybeEchoInt64) -->
         */
        fun maybeEchoInt64(
            value: Long?
        ): Long? = __jni_maybeEchoInt64(value)
        @JvmStatic
        @JvmName("__jni_maybeEchoInt64")
        private external fun __jni_maybeEchoInt64(
            value: Long?
        ): Long?

        /**
         * <!-- FishyJoes.export(maybeEchoInt8) -->
         */
        fun maybeEchoInt8(
            value: Byte?
        ): Byte? = __jni_maybeEchoInt8(value)
        @JvmStatic
        @JvmName("__jni_maybeEchoInt8")
        private external fun __jni_maybeEchoInt8(
            value: Byte?
        ): Byte?

        /**
         * <!-- FishyJoes.export(maybeEchoUInt) -->
         */
        fun maybeEchoUInt(
            value: ULong?
        ): ULong? = __jni_maybeEchoUInt(value)
        @JvmStatic
        @JvmName("__jni_maybeEchoUInt")
        private external fun __jni_maybeEchoUInt(
            value: ULong?
        ): ULong?

        /**
         * <!-- FishyJoes.export(maybeEchoUInt16) -->
         */
        fun maybeEchoUInt16(
            value: UShort?
        ): UShort? = __jni_maybeEchoUInt16(value)
        @JvmStatic
        @JvmName("__jni_maybeEchoUInt16")
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
        @JvmName("__jni_maybeEchoUInt32")
        private external fun __jni_maybeEchoUInt32(
            value: UInt?
        ): UInt?

        /**
         * <!-- FishyJoes.export(maybeEchoUInt64) -->
         */
        fun maybeEchoUInt64(
            value: ULong?
        ): ULong? = __jni_maybeEchoUInt64(value)
        @JvmStatic
        @JvmName("__jni_maybeEchoUInt64")
        private external fun __jni_maybeEchoUInt64(
            value: ULong?
        ): ULong?

        /**
         * <!-- FishyJoes.export(maybeEchoUInt8) -->
         */
        fun maybeEchoUInt8(
            value: UByte?
        ): UByte? = __jni_maybeEchoUInt8(value)
        @JvmStatic
        @JvmName("__jni_maybeEchoUInt8")
        private external fun __jni_maybeEchoUInt8(
            value: UByte?
        ): UByte?

        /**
         * <!-- FishyJoes.export(valueMapper) -->
         */
        fun valueMapper(
            value: UByte?,
            mapper: ((UByte?) -> UByte?)
        ): UByte? = __jni_valueMapper(value, mapper)
        @JvmStatic
        @JvmName("__jni_valueMapper")
        private external fun __jni_valueMapper(
            value: UByte?,
            mapper: ((UByte?) -> UByte?)
        ): UByte?

        init { loadNativeLibs() }
    }

    /**
     * <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
     */
    data class PrimitiveHolder(
        var b: Boolean,
        var bq: Boolean?,
        var d: Double,
        var dq: Double?,
        var f: Float,
        var fq: Float?,
        var i: Long,
        var i16: Short,
        var i16q: Short?,
        var i32: Int,
        var i32q: Int?,
        var i64: Long,
        var i64q: Long?,
        var i8: Byte,
        var i8q: Byte?,
        var iq: Long?,
        var ui: ULong,
        var ui16: UShort,
        var ui16q: UShort?,
        var ui32: UInt,
        var ui32q: UInt?,
        var ui64: ULong,
        var ui64q: ULong?,
        var ui8: UByte,
        var ui8q: UByte?,
        var uiq: ULong?
    ) {

        companion object {
            /**
             * <!-- FishyJoes.export(staticMutableProperty) -->
             */
            var staticMutableProperty: kotlin.collections.List<UByte?>
              get() = __jni_get_staticMutableProperty()
              set(value) { __jni_set_staticMutableProperty(value) } 
            @JvmStatic
            @JvmName("__jni_get_staticMutableProperty")
            private external fun __jni_get_staticMutableProperty(): kotlin.collections.List<UByte?>
            @JvmStatic
            @JvmName("__jni_set_staticMutableProperty")
            private external fun __jni_set_staticMutableProperty(newValue: kotlin.collections.List<UByte?>)

            /**
             * <!-- FishyJoes.export(staticProperty) -->
             */
            val staticProperty: kotlin.collections.List<UByte?>
              get() = __jni_get_staticProperty()
            @JvmStatic
            @JvmName("__jni_get_staticProperty")
            private external fun __jni_get_staticProperty(): kotlin.collections.List<UByte?>

            init { loadNativeLibs() }
        }
    }
}
