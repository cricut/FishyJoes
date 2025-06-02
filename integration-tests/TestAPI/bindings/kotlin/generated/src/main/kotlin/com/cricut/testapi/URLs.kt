package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(URLs) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class URLs {

    companion object {
        /**
         * <!-- FishyJoes.export(dataImage) -->
         */
        val dataImage: java.net.URI
          get() = __jni_get_dataImage()
        @JvmStatic
        @JvmName("__jni_get_dataImage")
        private external fun __jni_get_dataImage(): java.net.URI

        /**
         * <!-- FishyJoes.export(localFile) -->
         */
        val localFile: java.net.URI
          get() = __jni_get_localFile()
        @JvmStatic
        @JvmName("__jni_get_localFile")
        private external fun __jni_get_localFile(): java.net.URI

        /**
         * <!-- FishyJoes.export(remoteFile) -->
         */
        val remoteFile: java.net.URI
          get() = __jni_get_remoteFile()
        @JvmStatic
        @JvmName("__jni_get_remoteFile")
        private external fun __jni_get_remoteFile(): java.net.URI

        /**
         * <!-- FishyJoes.export(simple) -->
         */
        val simple: java.net.URI
          get() = __jni_get_simple()
        @JvmStatic
        @JvmName("__jni_get_simple")
        private external fun __jni_get_simple(): java.net.URI

        /**
         * <!-- FishyJoes.export(echo) -->
         */
        fun echo(
            url: java.net.URI
        ): java.net.URI = __jni_echo(url)
        @JvmStatic
        @JvmName("__jni_echo")
        private external fun __jni_echo(
            url: java.net.URI
        ): java.net.URI

        init { loadNativeLibs() }
    }
}
