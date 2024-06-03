package com.cricut.fishyjoes.runtime

// Based on https://github.com/JetBrains/kotlin/blob/6a670dc5f38fc73eb01d754d8f7c158ae0176ceb/libraries/stdlib/src/kotlin/util/Result.kt

/**
 * A discriminated union that encapsulates a successful outcome with a value of type [T]
 * or a failure of exception type [F].
 */
// TODO after protocols? F: Throwable?
sealed class TypedResult<out T, out F> {
    /**
     * Erase the error type and convert to kotlin [Result]
     */
    // abstract val asResult: Result<T>

    /**
     * Returns `true` if this instance represents a successful outcome.
     * In this case [isFailure] returns `false`.
     */
    abstract val isSuccess: Boolean

    /**
     * Returns `true` if this instance represents a failed outcome.
     * In this case [isSuccess] returns `false`.
     */
    abstract val isFailure: Boolean

    /**
     * Returns the encapsulated value if this instance represents [success][TypedResult.isSuccess] or `null`
     * if it is [failure][TypedResult.isFailure].
     *
     * This function is a shorthand for `getOrElse { null }` (see [getOrElse]) or
     * `fold(onSuccess = { it }, onFailure = { null })` (see [fold]).
     */
    abstract fun getOrNull(): T?

    /**
     * Returns the encapsulated [F] exception if this instance represents [failure][isFailure] or `null`
     * if it is [success][isSuccess].
     *
     * This function is a shorthand for `fold(onSuccess = { null }, onFailure = { it })` (see [fold]).
     */
    abstract fun exceptionOrNull(): F?

    /**
     * Encapsulates the given [value] as successful value.
     */
    data class Success<out T, out F>(val value: T): TypedResult<T, F>() {
        // override val asResult = Result.success(value)
        override val isFailure = false
        override val isSuccess = true
        override fun exceptionOrNull(): F? = null
        override fun getOrNull(): T? = value
        override fun toString(): String = "Success($value)"
    }

    /**
     * Encapsulates the given [F] [exception] as failure.
     */
    data class Failure<out T, out F>(val exception: F): TypedResult<T, F>() {
        // override val asResult = Result.failure<T>(exception)
        override val isFailure = true
        override val isSuccess = false
        override fun exceptionOrNull(): F? = exception
        override fun getOrNull(): T? = null
        override fun toString(): String = "Failure($exception)"
    }
}

/**
 * Returns the result of [onSuccess] for the encapsulated value if this instance represents [success][TypedResult.isSuccess]
 * or the result of [onFailure] function for the encapsulated [F] exception if it is [failure][TypedResult.isFailure].
 *
 * Note, that this function rethrows any [Throwable] exception thrown by [onSuccess] or by [onFailure] function.
 */
fun <R, T, F: Throwable> TypedResult<T, F>.fold(
    onSuccess: (value: T) -> R,
    onFailure: (exception: F) -> R
): R = when (this) {
    is TypedResult.Success -> onSuccess(value)
    is TypedResult.Failure -> onFailure(exception)
}

/**
 * Returns the encapsulated value if this instance represents [success][TypedResult.isSuccess] or the
 * [defaultValue] if it is [failure][TypedResult.isFailure].
 *
 * This function is a shorthand for `getOrElse { defaultValue }` (see [getOrElse]).
 */
fun <R, T : R, F: Throwable> TypedResult<T, F>.getOrDefault(
    defaultValue: R
): R = getOrNull() ?: defaultValue

/**
 * Returns the encapsulated value if this instance represents [success][TypedResult.isSuccess] or the
 * result of [onFailure] function for the encapsulated [F] exception if it is [failure][TypedResult.isFailure].
 *
 * Note, that this function rethrows any [Throwable] exception thrown by [onFailure] function.
 *
 * This function is a shorthand for `fold(onSuccess = { it }, onFailure = onFailure)` (see [fold]).
 */
fun <R, T : R, F: Throwable> TypedResult<T, F>.getOrElse(
    onFailure: (exception: F) -> R
): R = when (this) {
    is TypedResult.Success -> value
    is TypedResult.Failure -> onFailure(exception)
}

/**
 * Returns the encapsulated value if this instance represents [success][TypedResult.isSuccess] or throws the encapsulated [F] exception
 * if it is [failure][TypedResult.isFailure].
 *
 * This function is a shorthand for `getOrElse { throw it }` (see [getOrElse]).
 */
fun <T, F: Throwable> TypedResult<T, F>.getOrThrow(): T = when (this) {
    is TypedResult.Success -> value
    is TypedResult.Failure -> throw exception
}

/**
 * Returns the encapsulated result of the given [transform] function applied to the encapsulated value
 * if this instance represents [success][TypedResult.isSuccess] or the
 * original encapsulated [F] exception if it is [failure][TypedResult.isFailure].
 *
 * Note, that this function rethrows any [Throwable] exception thrown by [transform] function.
 */
fun <R, T, F: Throwable> TypedResult<T, F>.map(
    transform: (value: T) -> R
): TypedResult<R, F> = when(this) {
    is TypedResult.Success -> TypedResult.Success(transform(value))
    is TypedResult.Failure -> TypedResult.Failure(exception)
}

/**
 * Performs the given [action] on the encapsulated [F] exception if this instance represents [failure][TypedResult.isFailure].
 * Returns the original `TypedResult` unchanged.
 */
fun <T, F: Throwable> TypedResult<T, F>.onFailure(
    action: (exception: F) -> Unit
): TypedResult<T, F> {
    exceptionOrNull()?.let(action)
    return this
}

/**
 * Performs the given [action] on the encapsulated value if this instance represents [success][TypedResult.isSuccess].
 * Returns the original `TypedResult` unchanged.
 */
fun <T, F: Throwable> TypedResult<T, F>.onSuccess(
    action: (value: T) -> Unit
): TypedResult<T, F> {
    getOrNull()?.let(action)
    return this
}

/**
 * Returns the encapsulated result of the given [transform] function applied to the encapsulated [F] exception
 * if this instance represents [failure][TypedResult.isFailure] or the
 * original encapsulated value if it is [success][TypedResult.isSuccess].
 *
 * Note, that this function rethrows any [Throwable] exception thrown by [transform] function.
 */
fun <R, T : R, F: Throwable> TypedResult<T, F>.recover(
    transform: (exception: F) -> R
): TypedResult<R, F> = when(this) {
    is TypedResult.Success -> this
    is TypedResult.Failure -> TypedResult.Success(transform(exception))
}
