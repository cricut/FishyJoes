/**
 * <!-- FishyJoes.export(Results) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class Results {

    companion object {
        /**
         * <!-- FishyJoes.export(aFailure) -->
         */
        val aFailure: com.cricut.fishyjoes.runtime.TypedResult<Long, com.cricut.testapi.Results.Error>
          get() = __jni_get_aFailure()
        @JvmStatic
        @JvmName("__jni_get_aFailure")
        private external fun __jni_get_aFailure(): com.cricut.fishyjoes.runtime.TypedResult<Long, com.cricut.testapi.Results.Error>

        /**
         * <!-- FishyJoes.export(aSuccess) -->
         */
        val aSuccess: com.cricut.fishyjoes.runtime.TypedResult<Long, com.cricut.testapi.Results.Error>
          get() = __jni_get_aSuccess()
        @JvmStatic
        @JvmName("__jni_get_aSuccess")
        private external fun __jni_get_aSuccess(): com.cricut.fishyjoes.runtime.TypedResult<Long, com.cricut.testapi.Results.Error>

        /**
         * <!-- FishyJoes.export(processResult) -->
         */
        fun processResult(
            result: com.cricut.fishyjoes.runtime.TypedResult<kotlin.String, com.cricut.testapi.Results.Error>
        ): kotlin.String = __jni_processResult(result)
        @JvmStatic
        @JvmName("__jni_processResult")
        private external fun __jni_processResult(
            result: com.cricut.fishyjoes.runtime.TypedResult<kotlin.String, com.cricut.testapi.Results.Error>
        ): kotlin.String

        init { loadNativeLibs() }
    }

    /**
     * <!-- FishyJoes.export(Results.Error) -->
     */
    data class Error(
        val message: kotlin.String
    ) {

        companion object {
            init { loadNativeLibs() }
        }
    }
}

package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*
