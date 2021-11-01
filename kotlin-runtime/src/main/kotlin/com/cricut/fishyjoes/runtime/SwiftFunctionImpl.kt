package com.cricut.fishyjoes.runtime

// Inspired by: https://github.com/JetBrains/kotlin/blob/master/spec-docs/function-types.md
class SwiftFunctionImpl private constructor(val arity: Int, private val _swiftReference: Long) :
    Function0<Any?>,
    Function1<Any?, Any?>,
    Function2<Any?, Any?, Any?>
{
    external override fun invoke(): Any?
    external override fun invoke(p1: Any?): Any?
    external override fun invoke(p1: Any?, p2: Any?): Any?
    protected external fun finalize()
}