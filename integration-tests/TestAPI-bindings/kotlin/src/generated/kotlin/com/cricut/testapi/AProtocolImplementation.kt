package com.cricut.testapi

import com.cricut.fishyjoes.runtime.LibraryLoader

/**
 * <!-- FishyJoes.export(AProtocolImplementation) -->
 */
data class AProtocolImplementation(
    override var foo: kotlin.String
): AProtocol {
    /**
     * <!-- FishyJoes.export(bar) -->
     */
    override fun bar(
        x: Long,
        y: Long
    ): com.cricut.testapi.AProtocol = __jni_bar(x, y)
    @JvmName("__jni_bar")
    private external fun __jni_bar(
        x: Long,
        y: Long
    ): com.cricut.testapi.AProtocol

    companion object {
        init {
            LibraryLoader.ensureLoaded("TestAPI")
        }
    }
}
