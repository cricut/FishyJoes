package com.cricut.fishyjoes.runtime

import kotlinx.coroutines.*

// Inspired by: https://github.com/JetBrains/kotlin/blob/master/spec-docs/function-types.md
class SwiftFunctionImpl private constructor(private val arity: Int, swiftReference: Long): SwiftReference(swiftReference),
    Function0<Any?>,
    Function1<Any?, Any?>,
    Function2<Any?, Any?, Any?>,
    Function3<Any?, Any?, Any?, Any?>,
    Function4<Any?, Any?, Any?, Any?, Any?>,
    Function5<Any?, Any?, Any?, Any?, Any?, Any?>,
    Function6<Any?, Any?, Any?, Any?, Any?, Any?, Any?>
{
    override fun invoke(): Any? =
        __jni_invoke()
    override fun invoke(p1: Any?): Any? =
        __jni_invoke(p1)
    override fun invoke(p1: Any?, p2: Any?): Any? =
        __jni_invoke(p1, p2)
    override fun invoke(p1: Any?, p2: Any?, p3: Any?): Any? =
        __jni_invoke(p1, p2, p3)
    override fun invoke(p1: Any?, p2: Any?, p3: Any?, p4: Any?): Any? =
        __jni_invoke(p1, p2, p3, p4)
    override fun invoke(p1: Any?, p2: Any?, p3: Any?, p4: Any?, p5: Any?): Any? =
        __jni_invoke(p1, p2, p3, p4, p5)
    override fun invoke(p1: Any?, p2: Any?, p3: Any?, p4: Any?, p5: Any?, p6: Any?): Any? =
        __jni_invoke(p1, p2, p3, p4, p5, p6)

    external fun __jni_invoke(): Any?
    external fun __jni_invoke(p1: Any?): Any?
    external fun __jni_invoke(p1: Any?, p2: Any?): Any?
    external fun __jni_invoke(p1: Any?, p2: Any?, p3: Any?): Any?
    external fun __jni_invoke(p1: Any?, p2: Any?, p3: Any?, p4: Any?): Any?
    external fun __jni_invoke(p1: Any?, p2: Any?, p3: Any?, p4: Any?, p5: Any?): Any?
    external fun __jni_invoke(p1: Any?, p2: Any?, p3: Any?, p4: Any?, p5: Any?, p6: Any?): Any?
    
    private fun toSuspend0(): (suspend () -> Any?) = {
        (invoke() as Deferred<*>).await()
    }
    private fun toSuspend1(): (suspend (Any?) -> Any?) = { p1 ->
        (invoke(p1) as Deferred<*>).await()
    }
    private fun toSuspend2(): (suspend (Any?, Any?) -> Any?) = { p1, p2 ->
        (invoke(p1, p2) as Deferred<*>).await()
    }
    private fun toSuspend3(): (suspend (Any?, Any?, Any?) -> Any?) = { p1, p2, p3 ->
        (invoke(p1, p2, p3) as Deferred<*>).await()
    }
    private fun toSuspend4(): (suspend (Any?, Any?, Any?, Any?) -> Any?) = { p1, p2, p3, p4 ->
        (invoke(p1, p2, p3, p4) as Deferred<*>).await()
    }
    private fun toSuspend5(): (suspend (Any?, Any?, Any?, Any?, Any?) -> Any?) = { p1, p2, p3, p4, p5 ->
        (invoke(p1, p2, p3, p4, p5) as Deferred<*>).await()
    }
    private fun toSuspend6(): (suspend (Any?, Any?, Any?, Any?, Any?, Any?) -> Any?) = { p1, p2, p3, p4, p5, p6 ->
        (invoke(p1, p2, p3, p4, p5, p6) as Deferred<*>).await()
    }

    companion object {
        @JvmStatic
        private fun fromSuspend(fn: suspend () -> Any?)
                : (() -> Deferred<*>) =
            { CoroutineScope(Dispatchers.Default).async { fn() } }
        @JvmStatic
        private fun fromSuspend(fn: suspend (p1: Any?) -> Any?)
                : ((Any?) -> Deferred<*>) =
            { p1 -> CoroutineScope(Dispatchers.Default).async { fn(p1) } }
        @JvmStatic
        private fun fromSuspend(fn: suspend (p1: Any?, p2: Any?) -> Any?)
                : ((Any?, Any?) -> Deferred<*>) =
            { p1, p2 -> CoroutineScope(Dispatchers.Default).async { fn(p1, p2) } }
        @JvmStatic
        private fun fromSuspend(fn: suspend (p1: Any?, p2: Any?, p3: Any?) -> Any?)
                : ((Any?, Any?, Any?) -> Deferred<*>) =
            { p1, p2, p3 -> CoroutineScope(Dispatchers.Default).async { fn(p1, p2, p3) } }
        @JvmStatic
        private fun fromSuspend(fn: suspend (p1: Any?, p2: Any?, p3: Any?, p4: Any?) -> Any?)
                : ((Any?, Any?, Any?, Any?) -> Deferred<*>) =
            { p1, p2, p3, p4 -> CoroutineScope(Dispatchers.Default).async { fn(p1, p2, p3, p4) } }
        @JvmStatic
        private fun fromSuspend(fn: suspend (p1: Any?, p2: Any?, p3: Any?, p4: Any?, p5: Any?) -> Any?)
                : ((Any?, Any?, Any?, Any?, Any?) -> Deferred<*>) =
            { p1, p2, p3, p4, p5 -> CoroutineScope(Dispatchers.Default).async { fn(p1, p2, p3, p4, p5) } }
        @JvmStatic
        private fun fromSuspend(fn: suspend (p1: Any?, p2: Any?, p3: Any?, p4: Any?, p5: Any?, p6: Any?) -> Any?)
                : ((Any?, Any?, Any?, Any?, Any?, Any?) -> Deferred<*>) =
            { p1, p2, p3, p4, p5, p6 -> CoroutineScope(Dispatchers.Default).async { fn(p1, p2, p3, p4, p5, p6) } }
    }
}