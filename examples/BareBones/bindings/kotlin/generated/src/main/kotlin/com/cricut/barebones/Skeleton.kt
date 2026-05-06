package com.cricut.barebones

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.exportReference(Skeleton) -->
 */
class Skeleton private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {

    companion object {
        /**
         * <!-- FishyJoes.export(boneCount) -->
         */
        val boneCount: Long
          get() = __jni_get_boneCount()
        @JvmStatic
        @JvmName("__jni_get_boneCount")
        private external fun __jni_get_boneCount(): Long

        init { loadNativeLibs() }
    }
}
