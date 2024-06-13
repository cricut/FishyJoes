final class ResultSuccess<T, F> extends Result<T, F> {
  final T value;
  ResultSuccess(this.value);
}

final class ResultFailure<T, F> extends Result<T, F> {
  final F exception;
  ResultFailure(this.exception);
}

// Interface borrows heavily from kotlin implementation, which in turn is based on
// https://github.com/JetBrains/kotlin/blob/6a670dc5f38fc73eb01d754d8f7c158ae0176ceb/libraries/stdlib/src/kotlin/util/Result.kt
sealed class Result<T, F> {
  /// Returns `true` if this instance represents a successful outcome.
  /// In this case [isFailure] returns `false`.
  bool get isSuccess => this is ResultSuccess;

  /// Returns `true` if this instance represents a failed outcome.
  /// In this case [isSuccess] returns `false`.
  bool get isFailure => this is ResultFailure;

  /// Returns the encapsulated value if this instance represents [success][TypedResult.isSuccess] or `null`
  /// if it is [failure][TypedResult.isFailure].
  ///
  /// This function is a shorthand for `getOrElse { null }` (see [getOrElse]) or
  /// `fold(onSuccess = { it }, onFailure = { null })` (see [fold]).
  T? getOrNull() => switch (this) {
    ResultSuccess(: var value) => value,
    ResultFailure() => null,
  };

  /// Returns the encapsulated [F] exception if this instance represents [failure][isFailure] or `null`
  /// if it is [success][isSuccess].
  ///
  /// This function is a shorthand for `fold(onSuccess = { null }, onFailure = { it })` (see [fold]).
  F? exceptionOrNull() => switch (this) {
    ResultSuccess() => null,
    ResultFailure(: var exception) => exception,
  };

  /// Returns the result of [onSuccess] for the encapsulated value if this instance represents [success][TypedResult.isSuccess]
  /// or the result of [onFailure] function for the encapsulated [F] exception if it is [failure][TypedResult.isFailure].
  ///
  /// Note, that this function rethrows any [Throwable] exception thrown by [onSuccess] or by [onFailure] function.
  R fold<R>(R Function(T) onSuccess, R Function(F) onFailure) => switch (this) {
    ResultSuccess(: var value) => onSuccess(value),
    ResultFailure(: var exception) => onFailure(exception),
  };

  /// Returns the encapsulated result of the given [transform] function applied to the encapsulated value
  /// if this instance represents [success][TypedResult.isSuccess] or the
  /// original encapsulated [F] exception if it is [failure][TypedResult.isFailure].
  ///
  /// Note, that this function rethrows any [Throwable] exception thrown by [transform] function.
  Result<R, F> map<R>(R Function(T) transform) => switch(this) {
    ResultSuccess(: var value) => ResultSuccess(transform(value)),
    ResultFailure(: var exception) => ResultFailure(exception),
  };

  /// Performs the given [action] on the encapsulated [F] exception if this instance represents [failure][TypedResult.isFailure].
  /// Returns the original `TypedResult` unchanged.
  Result<T, F> onFailure(void Function(F) action) {
    if (this case ResultFailure(: var exception)) {
      action(exception);
    }
    return this;
  }

  /// Performs the given [action] on the encapsulated value if this instance represents [success][TypedResult.isSuccess].
  /// Returns the original `TypedResult` unchanged.
  Result<T, F> onSuccess(void Function(T) action) {
    if (this case ResultSuccess(: var value)) {
      action(value);
    }
    return this;
  }
}

extension ResultGetOrElseExtension<R, T extends R, F> on Result<T, F> {
  /// Returns the encapsulated value if this instance represents [success][TypedResult.isSuccess] or the
  /// result of [onFailure] function for the encapsulated [F] exception if it is [failure][TypedResult.isFailure].
  ///
  /// Note, that this function rethrows any [Throwable] exception thrown by [onFailure] function.
  ///
  /// This function is a shorthand for `fold(onSuccess = { it }, onFailure = onFailure)` (see [fold]).
  R getOrElse(R Function(F) onFailure) => switch (this) {
    ResultSuccess(: var value) => value,
    ResultFailure(: var exception) => onFailure(exception),
  };
}

extension ResultGetOrThrowsExtension<T, F extends Object> on Result<T, F> {
  /// Returns the encapsulated value if this instance represents [success][TypedResult.isSuccess] or throws the encapsulated [F] exception
  /// if it is [failure][TypedResult.isFailure].
  ///
  /// This function is a shorthand for `getOrElse { throw it }` (see [getOrElse]).
  T getOrThrow() => switch (this) {
    ResultSuccess(: var value) => value,
    ResultFailure(: var exception) => throw exception,
  };
}
