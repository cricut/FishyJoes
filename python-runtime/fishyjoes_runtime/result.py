"""Swift Result<Success, Failure> type for Python."""

from __future__ import annotations

from collections.abc import Callable
from dataclasses import dataclass
from typing import TypeVar

S = TypeVar("S")  # Success type
E = TypeVar("E", bound=Exception)  # Error type (must be Exception)
T = TypeVar("T")


@dataclass(frozen=True)
class Success[S]:
    """Represents a successful result."""

    value: S

    def __repr__(self) -> str:
        return f"Success({self.value!r})"


@dataclass(frozen=True)
class Failure[E]:
    """Represents a failed result."""

    error: E

    def __repr__(self) -> str:
        return f"Failure({self.error!r})"


# Result is a union of Success and Failure
type Result[S, E] = Success[S] | Failure[E]


class ResultHelpers:
    """Helper methods for working with Result types."""

    @staticmethod
    def is_success(result: Result[S, E]) -> bool:
        """Check if result is a success."""
        return isinstance(result, Success)

    @staticmethod
    def is_failure(result: Result[S, E]) -> bool:
        """Check if result is a failure."""
        return isinstance(result, Failure)

    @staticmethod
    def get(result: Result[S, E]) -> S:
        """
        Get the success value or raise the error.

        Args:
            result: The result to unwrap

        Returns:
            The success value

        Raises:
            The failure error if result is a failure
        """
        match result:
            case Success(value):
                return value
            case Failure(error):
                raise error

    @staticmethod
    def get_or(result: Result[S, E], default: S) -> S:
        """Get the success value or return a default."""
        match result:
            case Success(value):
                return value
            case Failure(_):
                return default

    @staticmethod
    def get_or_else(result: Result[S, E], fn: Callable[[E], S]) -> S:
        """Get the success value or compute from error."""
        match result:
            case Success(value):
                return value
            case Failure(error):
                return fn(error)

    @staticmethod
    def map(result: Result[S, E], fn: Callable[[S], T]) -> Result[T, E]:
        """Map the success value if present."""
        match result:
            case Success(value):
                return Success(fn(value))
            case Failure(error):
                return Failure(error)

    @staticmethod
    def map_error(
        result: Result[S, E], fn: Callable[[E], Exception]
    ) -> Result[S, Exception]:
        """Map the error if present."""
        match result:
            case Success(value):
                return Success(value)
            case Failure(error):
                return Failure(fn(error))

    @staticmethod
    def flat_map(result: Result[S, E], fn: Callable[[S], Result[T, E]]) -> Result[T, E]:
        """FlatMap (bind) the success value if present."""
        match result:
            case Success(value):
                return fn(value)
            case Failure(error):
                return Failure(error)


# Convenience functions at module level
def success[S, E](value: S) -> Result[S, E]:
    """Create a success result."""
    return Success(value)


def failure[S, E](error: E) -> Result[S, E]:
    """Create a failure result."""
    return Failure(error)


def from_exception[S](fn: Callable[[], S]) -> Result[S, Exception]:
    """
    Wrap a function that might raise an exception into a Result.

    Args:
        fn: Function to call

    Returns:
        Success with the return value, or Failure with the exception
    """
    try:
        return Success(fn())
    except Exception as e:
        return Failure(e)
