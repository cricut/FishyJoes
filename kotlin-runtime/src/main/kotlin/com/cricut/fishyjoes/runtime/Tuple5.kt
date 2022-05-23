package com.cricut.fishyjoes.runtime

data class Tuple5<out A, out B, out C, out D, out E>(
    val first: A,
    val second: B,
    val third: C,
    val fourth: D,
    val fifth: E,
) {
    override fun toString(): String = "($first, $second, $third, $fourth, $fifth)"
}
