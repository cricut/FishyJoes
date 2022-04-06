package com.cricut.fishyjoes.runtime

data class Tuple6<out A, out B, out C, out D, out E, out F>(
    val first: A,
    val second: B,
    val third: C,
    val fourth: D,
    val fifth: E,
    val sixth: F,
) {
    override fun toString(): String = "($first, $second, $third, $fourth, $fifth, $sixth)"
}
