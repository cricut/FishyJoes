package com.cricut.fishyjoes.runtime

// Inspired by: https://github.com/JetBrains/kotlin/blob/master/spec-docs/function-types.md
class SwiftFunctionImpl private constructor(val arity: Int, swiftReference: Long): SwiftReference(swiftReference),
    Function0<Any?>,
    Function1<Any?, Any?>,
    Function2<Any?, Any?, Any?>,
    Function3<Any?, Any?, Any?, Any?>,
    Function4<Any?, Any?, Any?, Any?, Any?>,
    Function5<Any?, Any?, Any?, Any?, Any?, Any?>,
    Function6<Any?, Any?, Any?, Any?, Any?, Any?, Any?>
{
    external override fun invoke(): Any?
    external override fun invoke(p1: Any?): Any?
    external override fun invoke(p1: Any?, p2: Any?): Any?
    external override fun invoke(p1: Any?, p2: Any?, p3: Any?): Any?
    external override fun invoke(p1: Any?, p2: Any?, p3: Any?, p4: Any?): Any?
    external override fun invoke(p1: Any?, p2: Any?, p3: Any?, p4: Any?, p5: Any?): Any?
    external override fun invoke(p1: Any?, p2: Any?, p3: Any?, p4: Any?, p5: Any?, p6: Any?): Any?
}