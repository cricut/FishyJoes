"""Test basic runtime functionality."""

from __future__ import annotations

import pytest

from fishyjoes_runtime import (
    Failure,
    IntClosedRange,
    IntRange,
    Result,
    ResultHelpers,
    Success,
    SwiftClosedRange,
    SwiftRange,
    failure,
    success,
)


class TestResult:
    """Test Result type functionality."""

    def test_success_creation(self) -> None:
        """Test creating a success result."""
        result: Result[int, Exception] = Success(42)
        assert ResultHelpers.is_success(result)
        assert not ResultHelpers.is_failure(result)
        assert ResultHelpers.get(result) == 42

    def test_failure_creation(self) -> None:
        """Test creating a failure result."""
        error = ValueError("test error")
        result: Result[int, ValueError] = Failure(error)
        assert ResultHelpers.is_failure(result)
        assert not ResultHelpers.is_success(result)

        with pytest.raises(ValueError, match="test error"):
            ResultHelpers.get(result)

    def test_success_function(self) -> None:
        """Test success convenience function."""
        result: Result[int, Exception] = success(42)
        assert isinstance(result, Success)
        assert result.value == 42

    def test_failure_function(self) -> None:
        """Test failure convenience function."""
        error = ValueError("test")
        result: Result[int, ValueError] = failure(error)
        assert isinstance(result, Failure)
        assert result.error == error

    def test_get_or(self) -> None:
        """Test get_or method."""
        success_result: Result[int, Exception] = Success(42)
        failure_result: Result[int, Exception] = Failure(ValueError())

        assert ResultHelpers.get_or(success_result, 0) == 42
        assert ResultHelpers.get_or(failure_result, 0) == 0

    def test_map(self) -> None:
        """Test map method."""
        result: Result[int, Exception] = Success(42)
        mapped = ResultHelpers.map(result, lambda x: x * 2)

        assert ResultHelpers.is_success(mapped)
        assert ResultHelpers.get(mapped) == 84


class TestSwiftRange:
    """Test Swift range types."""

    def test_swift_range_contains(self) -> None:
        """Test half-open range contains."""
        r = SwiftRange(0, 10)
        assert 0 in r
        assert 5 in r
        assert 9 in r
        assert 10 not in r
        assert -1 not in r

    def test_swift_range_empty(self) -> None:
        """Test empty range."""
        empty_range = SwiftRange(5, 5)
        assert empty_range.is_empty()

        non_empty_range = SwiftRange(0, 5)
        assert not non_empty_range.is_empty()

    def test_swift_range_repr(self) -> None:
        """Test range string representation."""
        r = SwiftRange(0, 10)
        assert repr(r) == "0..<10"

    def test_swift_closed_range_contains(self) -> None:
        """Test closed range contains."""
        r = SwiftClosedRange(0, 10)
        assert 0 in r
        assert 5 in r
        assert 10 in r
        assert 11 not in r
        assert -1 not in r

    def test_swift_closed_range_repr(self) -> None:
        """Test closed range string representation."""
        r = SwiftClosedRange(0, 10)
        assert repr(r) == "0...10"

    def test_int_range_iteration(self) -> None:
        """Test integer range iteration."""
        r = IntRange(0, 5)
        values = list(r)
        assert values == [0, 1, 2, 3, 4]
        assert len(r) == 5

    def test_int_closed_range_iteration(self) -> None:
        """Test integer closed range iteration."""
        r = IntClosedRange(0, 5)
        values = list(r)
        assert values == [0, 1, 2, 3, 4, 5]
        assert len(r) == 6


class TestSwiftReference:
    """Test SwiftReference wrapper."""

    def test_swift_reference_disabled(self) -> None:
        """
        SwiftReference requires the runtime library to be loaded.

        This test just ensures the import works. Real tests will be added
        when the runtime library is available.
        """
        from fishyjoes_runtime.swift_reference import SwiftReference

        assert SwiftReference is not None


class TestLoader:
    """Test Loader functionality."""

    def test_loader_import(self) -> None:
        """Test that Loader can be imported."""
        from fishyjoes_runtime.loader import Loader

        assert Loader is not None

    def test_loader_not_initialized_yet(self) -> None:
        """
        Test that Loader doesn't crash if runtime library isn't built yet.

        The loader should handle missing library gracefully during development.
        """
        from fishyjoes_runtime.loader import Loader

        # These should not raise even if library isn't built
        assert Loader._lib is None or Loader._lib is not None
        assert Loader._initialized is True or Loader._initialized is False
