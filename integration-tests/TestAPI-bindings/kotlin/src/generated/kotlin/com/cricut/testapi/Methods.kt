package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.exportReference(Methods) -->
 */
class Methods private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
    /**
     * <!-- FishyJoes.export(instanceGet) -->
     */
    val instanceGet: Long
      get() = __jni_get_instanceGet()
    @JvmName("__jni_get_instanceGet")
    private external fun __jni_get_instanceGet(): Long

    /**
     * <!-- FishyJoes.export(instanceModifiable) -->
     */
    var instanceModifiable: Long
      get() = __jni_get_instanceModifiable()
      set(value) { __jni_set_instanceModifiable(value) } 
    @JvmName("__jni_get_instanceModifiable")
    private external fun __jni_get_instanceModifiable(): Long
    @JvmName("__jni_set_instanceModifiable")
    private external fun __jni_set_instanceModifiable(newValue: Long)

    /**
     * <!-- FishyJoes.export(instanceStored) -->
     */
    var instanceStored: Long
      get() = __jni_get_instanceStored()
      set(value) { __jni_set_instanceStored(value) } 
    @JvmName("__jni_get_instanceStored")
    private external fun __jni_get_instanceStored(): Long
    @JvmName("__jni_set_instanceStored")
    private external fun __jni_set_instanceStored(newValue: Long)

    /**
     * <!-- FishyJoes.exportAsMethod(instanceGetMethod) -->
     */
    fun instanceGetMethod(
    ): Long = __jni_instanceGetMethod()
    @JvmName("__jni_instanceGetMethod")
    private external fun __jni_instanceGetMethod(
    ): Long

    companion object {
        /**
         * <!-- FishyJoes.export(staticGet) -->
         */
        val staticGet: Long
          get() = __jni_get_staticGet()
        @JvmStatic
        @JvmName("__jni_get_staticGet")
        private external fun __jni_get_staticGet(): Long

        /**
         * <!-- FishyJoes.export(staticModifiable) -->
         */
        var staticModifiable: Long
          get() = __jni_get_staticModifiable()
          set(value) { __jni_set_staticModifiable(value) } 
        @JvmStatic
        @JvmName("__jni_get_staticModifiable")
        private external fun __jni_get_staticModifiable(): Long
        @JvmStatic
        @JvmName("__jni_set_staticModifiable")
        private external fun __jni_set_staticModifiable(newValue: Long)

        /**
         * <!-- FishyJoes.export(staticStored) -->
         */
        var staticStored: Long
          get() = __jni_get_staticStored()
          set(value) { __jni_set_staticStored(value) } 
        @JvmStatic
        @JvmName("__jni_get_staticStored")
        private external fun __jni_get_staticStored(): Long
        @JvmStatic
        @JvmName("__jni_set_staticStored")
        private external fun __jni_set_staticStored(newValue: Long)

        /**
         * <!-- FishyJoes.exportAsMethod(staticGetMethod) -->
         */
        fun staticGetMethod(
        ): Long = __jni_staticGetMethod()
        @JvmStatic
        @JvmName("__jni_staticGetMethod")
        private external fun __jni_staticGetMethod(
        ): Long

        /**
         * <!-- FishyJoes.export(create) -->
         */
        fun create(
        ): com.cricut.testapi.Methods = __jni_create()
        @JvmStatic
        @JvmName("__jni_create")
        private external fun __jni_create(
        ): com.cricut.testapi.Methods

        init { loadNativeLibs() }
    }
}
