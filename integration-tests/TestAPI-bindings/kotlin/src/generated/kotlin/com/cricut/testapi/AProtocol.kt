package com.cricut.testapi

import com.cricut.fishyjoes.runtime.LibraryLoader

/**
 * <!-- FishyJoes.export(AProtocol) -->
 */
interface AProtocol {
    /**
     * <!-- FishyJoes.export(foo) -->
     */
    var foo: kotlin.String
    /**
     * <!-- FishyJoes.export(bar) -->
     */
    fun bar(
        x: Long,
        y: Long
    ): com.cricut.testapi.AProtocol

    /**
     * <!-- FishyJoes.export(hasADefaultImplementation) -->
     */
    fun hasADefaultImplementation(
    ): Long = __jni__default_hasADefaultImplementation(this)

    companion object {
        /**
         * <!-- FishyJoes.export(hasADefaultImplementation) -->
         */
        @JvmName("__jni__default_hasADefaultImplementation")
        private external fun __jni__default_hasADefaultImplementation(
            self: AProtocol
        ): Long
    }
}
