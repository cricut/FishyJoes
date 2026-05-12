package com.cricut.emojifun

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * A playground object for working with emoji.
 * <!-- FishyJoes.exportReference(EmojiExplorer) -->
 */
class EmojiExplorer private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * A collection of emoji strings known to the object.
     *
     * This value could contain millions of strings and be very large, incuring a performance cost to communicate to foreign callers, so `enumerateKnown(_:)` is also provided.
     * <!-- FishyJoes.export(known) -->
     */
    val known: kotlin.collections.Set<kotlin.String>
      get() = __jni_get_known()
    @JvmName("__jni_get_known")
    private external fun __jni_get_known(): kotlin.collections.Set<kotlin.String>
    @JvmName("__jni_set_known")
    private external fun __jni_set_known(newValue: kotlin.collections.Set<kotlin.String>)

    /**
     * Reports a random emoji string built using the object's collection of known emoji strings.
     * - Returns: A string containing one or more random emoji. In the unusual case that the object knows zero emoji strings, the `hello` string is returned.
     * <!-- FishyJoes.export(random) -->
     */
    fun random(
    ): kotlin.String = __jni_random()
    @JvmName("__jni_random")
    private external fun __jni_random(
    ): kotlin.String

    /**
     * Reports a random emoji string from the object's collection of known emoji strings, ensuring it is only reported once.
     * - Returns: A random emoji string, or `nil` if all values known to the object have been reported.
     * <!-- FishyJoes.export(randomUnique) -->
     */
    fun randomUnique(
    ): kotlin.String? = __jni_randomUnique()
    @JvmName("__jni_randomUnique")
    private external fun __jni_randomUnique(
    ): kotlin.String?

    /**
     * Enumerates the emoji strings known to the object.
     * - Parameter body: A closure to call with each string. On each call to the closure, a string is provided, and the closure should return `true` to continue enumeration or `false` to halt.
     * <!-- FishyJoes.export(enumerateKnown) -->
     */
    fun enumerateKnown(
        body: ((kotlin.String) -> Boolean)
    ): kotlin.Unit = __jni_enumerateKnown(body)
    @JvmName("__jni_enumerateKnown")
    private external fun __jni_enumerateKnown(
        body: ((kotlin.String) -> Boolean)
    ): kotlin.Unit

    companion object {
        /**
         * Emits a hello string.
         * - Returns: A string containing an emoji hello message.
         * <!-- FishyJoes.export(hello) -->
         */
        val hello: kotlin.String
          get() = __jni_get_hello()
        @JvmStatic
        @JvmName("__jni_get_hello")
        private external fun __jni_get_hello(): kotlin.String

        /**
         * Creates an object that works with emoji strings.
         * - Parameter count: The number of emoji strings to include in the object's known collection.
         * <!-- FishyJoes.export(create) -->
         */
        fun create(
            count: Long
        ): com.cricut.emojifun.EmojiExplorer = __jni_create(count)
        @JvmStatic
        @JvmName("__jni_create")
        private external fun __jni_create(
            count: Long
        ): com.cricut.emojifun.EmojiExplorer

        init { loadNativeLibs() }
    }
}
