package com.cricut.fishyjoes.runtime

data class Tuple3<out A, out B, out C>(
    val first: A,
    val second: B,
    val third: C
) {
    override fun toString(): String = "($first, $second, $third)"
}

