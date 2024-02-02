package com.cricut.fishyjoes.runtime

import kotlinx.coroutines.*
import kotlinx.coroutines.future.asCompletableFuture

private class SwiftFutureImpl {
    companion object {
        @JvmStatic
        private external fun sinkResult(context: Any?, success: Boolean, result: Any?)

        @JvmStatic
        private fun <T> sinkFuture(future: Deferred<T>, context: Any?) {
            future.asCompletableFuture().whenComplete { value, error ->
                if (error == null) {
                    sinkResult(context, true, value)
                } else {
                    sinkResult(context, false, error)
                }
            }
        }

        @JvmStatic
        private fun <T> createCompletable(): CompletableDeferred<T> = CompletableDeferred<T>()
    }
}