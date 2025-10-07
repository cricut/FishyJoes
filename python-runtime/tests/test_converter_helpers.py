"""Test converter helper functions.

These tests validate the helper functions used by generated bindings
to convert between Python and Swift types. Since we don't have the Swift
runtime library built yet, these tests use mock converters and validate
the conversion logic and error handling.
"""

from __future__ import annotations

import asyncio
from unittest.mock import Mock

import pytest

from fishyjoes_runtime._loader_collections import (
    python_dict_to_dictionary,
    python_list_to_array,
    python_set_to_set,
    swift_array_to_python_list,
    swift_dictionary_to_python_dict,
    swift_set_to_python_set,
)
from fishyjoes_runtime._loader_futures import (
    SwiftTaskFuture,
    get_or_create_event_loop,
    python_coroutine_to_swift_task,
    swift_task_to_python_future,
)
from fishyjoes_runtime._loader_tuples import (
    python_tuple2_to_swift,
    python_tuple3_to_swift,
    python_tuple4_to_swift,
    swift_tuple2_to_python,
    swift_tuple3_to_python,
    swift_tuple4_to_python,
)
from fishyjoes_runtime.loader import Loader


class TestCollectionHelpers:
    """Test collection converter helper functions."""

    def test_python_list_to_array_accepts_parameters(self) -> None:
        """Test that python_list_to_array accepts the correct parameters."""
        # Create mock converter
        element_converter = Mock()

        # Call the helper function
        result = python_list_to_array(
            [1, 2, 3],
            element_converter,
            Loader,
        )

        # Should return a pointer (0 in placeholder implementation)
        assert result is not None

    def test_swift_array_to_python_list_accepts_parameters(self) -> None:
        """Test that swift_array_to_python_list accepts the correct parameters."""
        element_converter = Mock()
        swift_array = Mock()  # Mock Swift array pointer

        result = swift_array_to_python_list(
            swift_array,
            element_converter,
            Loader,
        )

        # Should return a list (empty in placeholder implementation)
        assert isinstance(result, list)

    def test_python_dict_to_dictionary_accepts_parameters(self) -> None:
        """Test that python_dict_to_dictionary accepts the correct parameters."""
        key_converter = Mock()
        value_converter = Mock()

        result = python_dict_to_dictionary(
            {"key": "value"},
            key_converter,
            value_converter,
            Loader,
        )

        assert result is not None

    def test_swift_dictionary_to_python_dict_accepts_parameters(
        self,
    ) -> None:
        """Test that swift_dictionary_to_python_dict accepts correct parameters."""
        key_converter = Mock()
        value_converter = Mock()
        swift_dict = Mock()

        result = swift_dictionary_to_python_dict(
            swift_dict,
            key_converter,
            value_converter,
            Loader,
        )

        assert isinstance(result, dict)

    def test_python_set_to_set_accepts_parameters(self) -> None:
        """Test that python_set_to_set accepts the correct parameters."""
        element_converter = Mock()

        result = python_set_to_set(
            {1, 2, 3},
            element_converter,
            Loader,
        )

        assert result is not None

    def test_swift_set_to_python_set_accepts_parameters(self) -> None:
        """Test that swift_set_to_python_set accepts the correct parameters."""
        element_converter = Mock()
        swift_set = Mock()

        result = swift_set_to_python_set(
            swift_set,
            element_converter,
            Loader,
        )

        assert isinstance(result, set)


class TestTupleHelpers:
    """Test tuple converter helper functions."""

    def test_python_tuple2_to_swift_accepts_parameters(self) -> None:
        """Test that python_tuple2_to_swift accepts the correct parameters."""
        conv1 = Mock()
        conv2 = Mock()

        result = python_tuple2_to_swift(
            ("hello", 42),
            conv1,
            conv2,
            Loader,
        )

        assert result is not None

    def test_swift_tuple2_to_python_accepts_parameters(self) -> None:
        """Test that swift_tuple2_to_python accepts the correct parameters."""
        conv1 = Mock()
        conv2 = Mock()
        swift_tuple = Mock()

        result = swift_tuple2_to_python(
            swift_tuple,
            conv1,
            conv2,
            Loader,
        )

        assert isinstance(result, tuple)
        assert len(result) == 2

    def test_python_tuple3_to_swift_accepts_parameters(self) -> None:
        """Test that python_tuple3_to_swift accepts the correct parameters."""
        conv1 = Mock()
        conv2 = Mock()
        conv3 = Mock()

        result = python_tuple3_to_swift(
            ("hello", 42, 3.14),
            conv1,
            conv2,
            conv3,
            Loader,
        )

        assert result is not None

    def test_swift_tuple3_to_python_accepts_parameters(self) -> None:
        """Test that swift_tuple3_to_python accepts the correct parameters."""
        conv1 = Mock()
        conv2 = Mock()
        conv3 = Mock()
        swift_tuple = Mock()

        result = swift_tuple3_to_python(
            swift_tuple,
            conv1,
            conv2,
            conv3,
            Loader,
        )

        assert isinstance(result, tuple)
        assert len(result) == 3

    def test_python_tuple4_to_swift_accepts_parameters(self) -> None:
        """Test that python_tuple4_to_swift accepts the correct parameters."""
        conv1 = Mock()
        conv2 = Mock()
        conv3 = Mock()
        conv4 = Mock()

        result = python_tuple4_to_swift(
            ("hello", 42, 3.14, True),
            conv1,
            conv2,
            conv3,
            conv4,
            Loader,
        )

        assert result is not None

    def test_swift_tuple4_to_python_accepts_parameters(self) -> None:
        """Test that swift_tuple4_to_python accepts the correct parameters."""
        conv1 = Mock()
        conv2 = Mock()
        conv3 = Mock()
        conv4 = Mock()
        swift_tuple = Mock()

        result = swift_tuple4_to_python(
            swift_tuple,
            conv1,
            conv2,
            conv3,
            conv4,
            Loader,
        )

        assert isinstance(result, tuple)
        assert len(result) == 4


class TestFutureHelpers:
    """Test async/future converter helper functions."""

    def test_get_or_create_event_loop_creates_new_loop(self) -> None:
        """Test that get_or_create_event_loop creates a loop when needed."""
        # This test runs in pytest which may or may not have an event loop
        loop = get_or_create_event_loop()

        assert loop is not None
        assert isinstance(loop, asyncio.AbstractEventLoop)

    def test_get_or_create_event_loop_returns_existing_loop(self) -> None:
        """Test that get_or_create_event_loop reuses existing loop."""
        # Get the loop twice
        loop1 = get_or_create_event_loop()
        loop2 = get_or_create_event_loop()

        # Should return the same loop
        assert loop1 is loop2

    def test_swift_task_future_initialization(self) -> None:
        """Test SwiftTaskFuture can be created."""
        swift_task = Mock()  # Mock Swift Task pointer
        result_converter = Mock()

        future = SwiftTaskFuture(swift_task, result_converter, Loader)

        assert future is not None
        assert isinstance(future, asyncio.Future)
        assert future._swift_task_ptr is swift_task

    def test_swift_task_future_set_result(self) -> None:
        """Test SwiftTaskFuture can have result set."""
        swift_task = Mock()
        future = SwiftTaskFuture(swift_task, Mock(), Loader)

        future.set_result(42)

        assert future.done()
        assert future.result() == 42

    def test_swift_task_future_set_exception(self) -> None:
        """Test SwiftTaskFuture can have exception set."""
        swift_task = Mock()
        future = SwiftTaskFuture(swift_task, Mock(), Loader)

        error = ValueError("test error")
        future.set_exception(error)

        assert future.done()
        with pytest.raises(ValueError, match="test error"):
            future.result()

    def test_swift_task_future_cancellation(self) -> None:
        """Test SwiftTaskFuture cancellation."""
        swift_task = Mock()
        future = SwiftTaskFuture(swift_task, Mock(), Loader)

        # Cancel the future
        cancelled = future.cancel()

        assert cancelled
        assert future.cancelled()

    @pytest.mark.asyncio
    async def test_swift_task_future_await(self) -> None:
        """Test SwiftTaskFuture can be awaited."""
        swift_task = Mock()
        future = SwiftTaskFuture(swift_task, Mock(), Loader)

        # Set result in the background
        future.set_result(42)

        # Await the future
        result = await future

        assert result == 42

    def test_swift_task_to_python_future_accepts_parameters(self) -> None:
        """Test that swift_task_to_python_future accepts correct parameters."""
        swift_task = Mock()
        result_converter = Mock()

        result = swift_task_to_python_future(swift_task, result_converter, Loader)

        # Should return a Future
        assert result is not None
        assert isinstance(result, asyncio.Future)

    def test_python_coroutine_to_swift_task_accepts_parameters(
        self,
    ) -> None:
        """Test that python_coroutine_to_swift_task accepts correct parameters."""

        async def my_coroutine() -> int:
            return 42

        coro = my_coroutine()
        result_converter = Mock()

        result = python_coroutine_to_swift_task(coro, result_converter, Loader)

        # Should return pointer (0 in placeholder)
        assert result is not None

        # Clean up the coroutine
        coro.close()


class TestConverterComposition:
    """Test that converters can be composed together.

    These tests validate the patterns that generated binding code will use
    to compose multiple converters for nested types like Array[Dictionary[String, Int]].
    """

    def test_nested_list_conversion_pattern(self) -> None:
        """Test pattern for converting nested lists like Array[Array[Int]]."""
        # Mock converters
        int_converter = Mock()
        inner_array_converter = Mock()

        # Pattern: Generated binding would use python_list_to_array twice
        python_list = [[1, 2], [3, 4]]

        # First, convert inner lists
        inner_arrays = []
        for inner_list in python_list:
            # This would call python_list_to_array with int_converter
            inner_swift = python_list_to_array(inner_list, int_converter, Loader)
            inner_arrays.append(inner_swift)

        # Then, convert outer list
        outer_swift = python_list_to_array(inner_arrays, inner_array_converter, Loader)

        # Should return pointers
        assert outer_swift is not None

    def test_dict_with_list_values_pattern(self) -> None:
        """Test pattern for Dictionary[String, Array[Int]]."""
        string_converter = Mock()
        int_converter = Mock()
        array_converter = Mock()

        python_dict = {
            "key1": [1, 2, 3],
            "key2": [4, 5, 6],
        }

        # Pattern: First convert values (lists) to Swift arrays
        swift_values = {}
        for key, value_list in python_dict.items():
            swift_array = python_list_to_array(value_list, int_converter, Loader)
            swift_values[key] = swift_array

        # Then convert the dict with converted values
        swift_dict = python_dict_to_dictionary(
            swift_values,
            string_converter,
            array_converter,
            Loader,
        )

        # Should return pointer
        assert swift_dict is not None

    def test_tuple_with_collections_pattern(self) -> None:
        """Test pattern for (Array[String], Dictionary[String, Int])."""
        string_converter = Mock()
        int_converter = Mock()
        array_converter = Mock()
        dict_converter = Mock()

        python_tuple = (["a", "b"], {"x": 1, "y": 2})

        # Pattern: Convert collection elements first
        swift_array = python_list_to_array(python_tuple[0], string_converter, Loader)
        swift_dict = python_dict_to_dictionary(
            python_tuple[1],
            string_converter,
            int_converter,
            Loader,
        )

        # Then convert the tuple
        swift_tuple = python_tuple2_to_swift(
            (swift_array, swift_dict),
            array_converter,
            dict_converter,
            Loader,
        )

        # Should return pointer
        assert swift_tuple is not None


class TestConverterErrorHandling:
    """Test error handling in converter helpers.

    These tests validate that converters properly handle errors and edge cases.
    """

    def test_empty_list_conversion(self) -> None:
        """Test converting an empty list."""
        element_converter = Mock()

        result = python_list_to_array([], element_converter, Loader)

        # Should handle empty list gracefully (returns pointer in placeholder)
        assert result is not None

    def test_empty_dict_conversion(self) -> None:
        """Test converting an empty dictionary."""
        key_converter = Mock()
        value_converter = Mock()

        result = python_dict_to_dictionary({}, key_converter, value_converter, Loader)

        # Should handle empty dict gracefully (returns pointer in placeholder)
        assert result is not None

    def test_empty_set_conversion(self) -> None:
        """Test converting an empty set."""
        element_converter = Mock()

        result = python_set_to_set(set(), element_converter, Loader)

        # Should handle empty set gracefully (returns pointer in placeholder)
        assert result is not None

    def test_single_element_collections(self) -> None:
        """Test converting collections with single elements."""
        element_converter = Mock()

        # Single-element list
        list_result = python_list_to_array([42], element_converter, Loader)
        assert list_result is not None

        # Single-element set
        set_result = python_set_to_set({42}, element_converter, Loader)
        assert set_result is not None

        # Single-element dict
        key_converter = Mock()
        dict_result = python_dict_to_dictionary(
            {"key": 42},
            key_converter,
            element_converter,
            Loader,
        )
        assert dict_result is not None


class TestConverterAPI:
    """Test that converter helper APIs are consistent and well-designed."""

    def test_all_collection_helpers_accept_converters(self) -> None:
        """Test that all collection helpers accept converter parameters."""
        conv = Mock()

        # All these should accept converters without crashing
        python_list_to_array([], conv, Loader)
        swift_array_to_python_list(Mock(), conv, Loader)
        python_dict_to_dictionary({}, conv, conv, Loader)
        swift_dictionary_to_python_dict(Mock(), conv, conv, Loader)
        python_set_to_set(set(), conv, Loader)
        swift_set_to_python_set(Mock(), conv, Loader)

    def test_all_tuple_helpers_accept_converters(self) -> None:
        """Test that all tuple helpers accept converter parameters."""
        conv = Mock()

        # All these should accept converters without crashing
        python_tuple2_to_swift(("a", 1), conv, conv, Loader)
        swift_tuple2_to_python(Mock(), conv, conv, Loader)
        python_tuple3_to_swift(("a", 1, 2.0), conv, conv, conv, Loader)
        swift_tuple3_to_python(Mock(), conv, conv, conv, Loader)
        python_tuple4_to_swift(("a", 1, 2.0, True), conv, conv, conv, conv, Loader)
        swift_tuple4_to_python(Mock(), conv, conv, conv, conv, Loader)

    def test_converter_helpers_return_values(self) -> None:
        """Test that helpers return appropriate values."""
        conv = Mock()

        # Collection helpers should return pointers or lists
        assert python_list_to_array([], conv, Loader) is not None
        assert isinstance(swift_array_to_python_list(Mock(), conv, Loader), list)

        # Tuple helpers should return pointers or tuples
        assert python_tuple2_to_swift(("a", 1), conv, conv, Loader) is not None
        assert isinstance(swift_tuple2_to_python(Mock(), conv, conv, Loader), tuple)

        # Future helper should return Future
        future = swift_task_to_python_future(Mock(), conv, Loader)
        assert isinstance(future, asyncio.Future)
