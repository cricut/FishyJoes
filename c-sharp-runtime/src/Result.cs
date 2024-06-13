using System;

namespace Cricut.FishyJoesRuntime;

// Interface borrows from kotlin implementation, which in turn is based on
// https://github.com/JetBrains/kotlin/blob/6a670dc5f38fc73eb01d754d8f7c158ae0176ceb/libraries/stdlib/src/kotlin/util/Result.kt

/**
 * A discriminated union that encapsulates a successful outcome with a value of type [T]
 * or a failure of exception type [F].
 */
public abstract record Result<T, F> {
    private Result() {}
    public sealed record Success(T Value) : Result<T, F>;
    public sealed record Failure(F Error) : Result<T, F>;

    /// <summary>
    /// Returns the result of [onSuccess] for the encapsulated value if this instance represents a Result.Success
    /// or the result of [onFailure] function for the encapsulated [F] exception if it is a Result.Failure.
    ///
    /// Note, that this function rethrows any exception thrown by onSuccess or by onFailure.
    /// </summary>
    public R Match<R>(Func<T, R> onSuccess, Func<F, R> onFailure) =>
        this switch {
            Success success => onSuccess(success.Value),
            Failure failure => onFailure(failure.Error),
            _ => throw new ArgumentOutOfRangeException()
        };

    /// <summary>
    /// calls [onSuccess] for the encapsulated value if this instance represents [success][TypedResult.isSuccess]
    /// or [onFailure] for the encapsulated [F] exception if it is [failure][TypedResult.isFailure].
    ///
    /// Note, that this function rethrows any exception thrown by onSuccess or by onFailure.
    /// </summary>
    public void Match(Action<T> onSuccess, Action<F> onFailure) {
        switch (this) {
            case Success success:
                onSuccess(success.Value);
                break;
            case Failure failure:
                onFailure(failure.Error);
                break;
            default:
                throw new ArgumentOutOfRangeException();
        }
    }
}
