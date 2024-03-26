package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestAsyncSwiftSideFunctionsClass, conformances: [TestAsyncFunctions]) -->
 */
class TestAsyncSwiftSideFunctionsClass private constructor(_swiftReference: Long): TestAsyncFunctions, com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(const42) -->
     */
    override val const42: (suspend () -> Long)
      get() = __jni_get_const42()
    @JvmName("__jni_get_const42")
    private external fun __jni_get_const42(): (suspend () -> Long)

    /**
     * <!-- FishyJoes.export(iabs) -->
     */
    override val iabs: (suspend (Long) -> Long)
      get() = __jni_get_iabs()
    @JvmName("__jni_get_iabs")
    private external fun __jni_get_iabs(): (suspend (Long) -> Long)

    /**
     * <!-- FishyJoes.export(intCompose) -->
     */
    override val intCompose: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long))
      get() = __jni_get_intCompose()
    @JvmName("__jni_get_intCompose")
    private external fun __jni_get_intCompose(): (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long))

    /**
     * <!-- FishyJoes.export(add3Things) -->
     */
    override val add3Things: (suspend (Float, Double, Long) -> Double)
      get() = __jni_get_add3Things()
    @JvmName("__jni_get_add3Things")
    private external fun __jni_get_add3Things(): (suspend (Float, Double, Long) -> Double)

    /**
     * <!-- FishyJoes.export(makeList) -->
     */
    override val makeList: (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)
      get() = __jni_get_makeList()
    @JvmName("__jni_get_makeList")
    private external fun __jni_get_makeList(): (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)

    /**
     * <!-- FishyJoes.export(fifthThing) -->
     */
    override val fifthThing: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long))
      get() = __jni_get_fifthThing()
    @JvmName("__jni_get_fifthThing")
    private external fun __jni_get_fifthThing(): (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long))

    /**
     * <!-- FishyJoes.export(six) -->
     */
    override val six: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)
      get() = __jni_get_six()
    @JvmName("__jni_get_six")
    private external fun __jni_get_six(): (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)

    /**
     * <!-- FishyJoes.export(willThrow) -->
     */
    override val willThrow: (suspend () -> Long)
      get() = __jni_get_willThrow()
    @JvmName("__jni_get_willThrow")
    private external fun __jni_get_willThrow(): (suspend () -> Long)

    companion object {
        /**
         * <!-- FishyJoes.export(init) -->
         */
        fun init(
        ): com.cricut.testapi.TestAsyncSwiftSideFunctionsClass = __jni_init()
        @JvmStatic
        @JvmName("__jni_init")
        private external fun __jni_init(
        ): com.cricut.testapi.TestAsyncSwiftSideFunctionsClass

        init { loadNativeLibs() }
    }
}
