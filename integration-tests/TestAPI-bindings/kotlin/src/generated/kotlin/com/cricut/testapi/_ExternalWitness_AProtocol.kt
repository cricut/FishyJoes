package com.cricut.testapi

import com.cricut.fishyjoes.runtime.LibraryLoader

private class _ExternalWitness_AProtocol private constructor(
    _swiftReference: Long
): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference), AProtocol {
    /**
     * <!-- FishyJoes.export(foo) -->
     */
    override var foo: kotlin.String
      get() = __jni_get_foo()
      set(value) { __jni_set_foo(value) } 
    @JvmName("__jni_get_foo")
    private external fun __jni_get_foo(): kotlin.String
    @JvmName("__jni_set_foo")
    private external fun __jni_set_foo(newValue: kotlin.String)

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

    /**
     * <!-- FishyJoes.export(hasADefaultImplementation) -->
     */
    override fun hasADefaultImplementation(
    ): Long = __jni_hasADefaultImplementation()
    @JvmName("__jni_hasADefaultImplementation")
    private external fun __jni_hasADefaultImplementation(
    ): Long

    companion object {
        init {
            LibraryLoader.ensureLoaded("TestAPI")
        }
    }
}
