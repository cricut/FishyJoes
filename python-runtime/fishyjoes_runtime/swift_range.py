"""Swift Range types for Python."""

from __future__ import annotations

from collections.abc import Iterator
from dataclasses import dataclass
from typing import TypeVar

T = TypeVar("T")


@dataclass(frozen=True)
class SwiftRange[T]:
    """
    Swift Range<Bound> - a half-open range [lowerBound, upperBound).

    Equivalent to Swift's Range<Bound>.
    """

    lower_bound: T
    upper_bound: T

    def __contains__(self, value: T) -> bool:
        """Check if value is in the range."""
        return self.lower_bound <= value < self.upper_bound  # type: ignore[operator, no-any-return]

    def __repr__(self) -> str:
        return f"{self.lower_bound}..<{self.upper_bound}"

    def is_empty(self) -> bool:
        """Check if the range is empty."""
        return self.lower_bound >= self.upper_bound  # type: ignore[operator, no-any-return]


@dataclass(frozen=True)
class SwiftClosedRange[T]:
    """
    Swift ClosedRange<Bound> - a closed range [lowerBound, upperBound].

    Equivalent to Swift's ClosedRange<Bound>.
    """

    lower_bound: T
    upper_bound: T

    def __contains__(self, value: T) -> bool:
        """Check if value is in the range."""
        return self.lower_bound <= value <= self.upper_bound  # type: ignore[operator, no-any-return]

    def __repr__(self) -> str:
        return f"{self.lower_bound}...{self.upper_bound}"

    def is_empty(self) -> bool:
        """Check if the range is empty."""
        return self.lower_bound > self.upper_bound  # type: ignore[operator, no-any-return]


# Convenience functions for creating ranges
def range_from[T](lower: T, upper: T) -> SwiftRange[T]:
    """Create a half-open range."""
    return SwiftRange(lower_bound=lower, upper_bound=upper)


def closed_range_from[T](lower: T, upper: T) -> SwiftClosedRange[T]:
    """Create a closed range."""
    return SwiftClosedRange(lower_bound=lower, upper_bound=upper)


# Special case for Int ranges that can be iterated
@dataclass(frozen=True)
class IntRange(SwiftRange[int]):
    """SwiftRange specialized for integers, allowing iteration."""

    def __iter__(self) -> Iterator[int]:
        """Iterate over the range."""
        current = self.lower_bound
        while current < self.upper_bound:
            yield current
            current += 1

    def __len__(self) -> int:
        """Get the count of elements in the range."""
        return max(0, self.upper_bound - self.lower_bound)


@dataclass(frozen=True)
class IntClosedRange(SwiftClosedRange[int]):
    """SwiftClosedRange specialized for integers, allowing iteration."""

    def __iter__(self) -> Iterator[int]:
        """Iterate over the range."""
        current = self.lower_bound
        while current <= self.upper_bound:
            yield current
            current += 1

    def __len__(self) -> int:
        """Get the count of elements in the range."""
        return max(0, self.upper_bound - self.lower_bound + 1)
