package com.cricut.fishyjoes.runtime

private class UnsignedIntegerConverter() {
    companion object {
        @JvmName("coerceUByteToByte")
        @JvmStatic
        fun coerceUByteToByte(value: UByte?): Byte = value?.toByte() ?: 0

        @JvmName("coerceByteToUByte")
        @JvmStatic
        fun coerceByteToUByte(value: Byte): UByte? = value.toUByte()

        @JvmName("coerceUShortToShort")
        @JvmStatic
        fun coerceUShortToShort(value: UShort?): Short = value?.toShort() ?: 0

        @JvmName("coerceShortToUShort")
        @JvmStatic
        fun coerceShortToUShort(value: Short): UShort? = value.toUShort()

        @JvmName("coerceUIntToInt")
        @JvmStatic
        fun coerceUIntToInt(value: UInt?): Int = value?.toInt() ?: 0

        @JvmName("coerceIntToUInt")
        @JvmStatic
        fun coerceIntToUInt(value: Int): UInt? = value.toUInt()

        @JvmName("coerceULongToLong")
        @JvmStatic
        fun coerceULongToLong(value: ULong?): Long = value?.toLong() ?: 0

        @JvmName("coerceLongToULong")
        @JvmStatic
        fun coerceLongToULong(value: Long): ULong? = value.toULong()
    }
}
