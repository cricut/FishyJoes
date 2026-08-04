package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * An inhabited enum that the product annotated `exportReference` rather than
 * `export`. An enum's cases are its only construction surface, so the generator
 * must still surface the cases (mirroring the `export` enum path) instead of
 * emitting an unconstructable, members-less opaque reference shell. Mirrors the
 * real CriRaster `Image.Kind` / `Image.Color.Channel` shape.
 * <!-- FishyJoes.exportReference(ReferenceCaseEnum) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class ReferenceCaseEnum {
    object North : ReferenceCaseEnum()
    object South : ReferenceCaseEnum()
    object East : ReferenceCaseEnum()
    object West : ReferenceCaseEnum()
    /**
     * <!-- FishyJoes.export(opposite) -->
     */
    val opposite: com.cricut.testapi.ReferenceCaseEnum
      get() = __jni_get_opposite()
    @JvmName("__jni_get_opposite")
    private external fun __jni_get_opposite(): com.cricut.testapi.ReferenceCaseEnum

    companion object {
        /**
         * Mirrors `Image.kind`: a value-returning accessor whose result must be
         * comparable to a known case from Python.
         * <!-- FishyJoes.export(defaultDirection) -->
         */
        val defaultDirection: com.cricut.testapi.ReferenceCaseEnum
          get() = __jni_get_defaultDirection()
        @JvmStatic
        @JvmName("__jni_get_defaultDirection")
        private external fun __jni_get_defaultDirection(): com.cricut.testapi.ReferenceCaseEnum

        /**
         * A method that both consumes (parameter) and produces (return) the
         * reference-annotated enum — only callable from Python if the cases bridge.
         * <!-- FishyJoes.export(rotate180) -->
         */
        fun rotate180(
            direction: com.cricut.testapi.ReferenceCaseEnum
        ): com.cricut.testapi.ReferenceCaseEnum = __jni_rotate180(direction)
        @JvmStatic
        @JvmName("__jni_rotate180")
        private external fun __jni_rotate180(
            direction: com.cricut.testapi.ReferenceCaseEnum
        ): com.cricut.testapi.ReferenceCaseEnum

        init { loadNativeLibs() }
    }
}
