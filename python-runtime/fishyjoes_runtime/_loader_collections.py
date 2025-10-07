"""Collection type converters for Python-Swift interop."""

from __future__ import annotations

import ctypes
from typing import TYPE_CHECKING, Any

if TYPE_CHECKING:
    from fishyjoes_runtime.loader import Loader


# Collection converter callback types
# These match the patterns used in Dart/Iota runtimes

CollectionLengthType = ctypes.CFUNCTYPE(
    ctypes.c_int,  # return: collection length
    ctypes.c_void_p,  # context (converter info)
    ctypes.c_void_p,  # collection object
    ctypes.POINTER(ctypes.c_void_p),  # exception out param
)

CollectionValuesType = ctypes.CFUNCTYPE(
    None,  # return: void
    ctypes.c_void_p,  # context
    ctypes.c_void_p,  # collection object
    ctypes.POINTER(ctypes.c_void_p),  # out values array
    ctypes.POINTER(ctypes.c_void_p),  # exception out param
)

CollectionConstructorType = ctypes.CFUNCTYPE(
    ctypes.c_void_p,  # return: created collection
    ctypes.c_void_p,  # context
    ctypes.POINTER(ctypes.c_void_p),  # in values array
    ctypes.c_int,  # length
    ctypes.POINTER(ctypes.c_void_p),  # exception out param
)


def setup_collections(loader_cls: type[Loader]) -> None:
    """
    Setup collection type converters with Swift.

    Collections in Python (list, dict, set) are converted through generated
    binding code rather than through explicit converter registration like
    primitives. This function sets up any shared infrastructure needed.

    In the FishyJoes architecture, collection conversion happens at binding
    generation time, where element/key/value converters are composed together.
    For example:
    - Array[String] uses String converter for each element
    - Dictionary[String, Int] uses String converter for keys, Int for values
    - Set[Bool] uses Bool converter for each element

    Args:
        loader_cls: The Loader class (passed to avoid circular import)

    Note:
        Unlike primitives which have Swift-side setup functions, collections
        are handled through the generic ArrayConverter, DictionaryConverter,
        and SetConverter types that are set up per-binding based on their
        element types.
    """
    if not loader_cls._lib or not loader_cls._env:
        return

    # Collection conversion infrastructure notes:
    #
    # For Python, collections will be converted as follows:
    #
    # 1. List/Array conversion:
    #    - Python list → Swift Array: Iterate list, convert each element
    #    - Swift Array → Python list: Create list, append converted elements
    #
    # 2. Dictionary conversion:
    #    - Python dict → Swift Dictionary: Iterate items(), convert key/value pairs
    #    - Swift Dictionary → Python dict: Create dict, insert converted pairs
    #
    # 3. Set conversion:
    #    - Python set → Swift Set: Iterate set, convert each element
    #    - Swift Set → Python set: Create set, add converted elements
    #
    # These conversions will be implemented in generated binding code that
    # calls the appropriate element/key/value converters for the specific
    # generic types being used.

    # No explicit registration needed for collections at runtime initialization.
    # Collection converter infrastructure is handled by the generated bindings
    # which will call appropriate primitive/reference converters for elements.
    pass


# Helper functions for collection conversion (used by generated bindings)


def python_list_to_array(
    py_list: list[Any],
    element_converter: Any,  # Will be a converter function
    loader_cls: type[Loader],
) -> ctypes.c_void_p:
    """
    Convert a Python list to a Swift Array.

    This is a helper that will be used by generated bindings.

    Args:
        py_list: Python list to convert
        element_converter: Function to convert each element
        loader_cls: Loader class for FFI operations

    Returns:
        Pointer to Swift Array object
    """
    # Placeholder implementation
    # In real implementation:
    # 1. Create array of converted elements
    # 2. Call Swift Array constructor with elements
    # 3. Return Swift Array pointer
    return ctypes.c_void_p(0)


def swift_array_to_python_list(
    swift_array_ptr: ctypes.c_void_p,
    element_converter: Any,  # Will be a converter function
    loader_cls: type[Loader],
) -> list[Any]:
    """
    Convert a Swift Array to a Python list.

    This is a helper that will be used by generated bindings.

    Args:
        swift_array_ptr: Pointer to Swift Array
        element_converter: Function to convert each element
        loader_cls: Loader class for FFI operations

    Returns:
        Python list with converted elements
    """
    # Placeholder implementation
    # In real implementation:
    # 1. Get array length from Swift
    # 2. Extract each element pointer
    # 3. Convert each element using element_converter
    # 4. Build Python list
    return []


def python_dict_to_dictionary(
    py_dict: dict[Any, Any],
    key_converter: Any,
    value_converter: Any,
    loader_cls: type[Loader],
) -> ctypes.c_void_p:
    """
    Convert a Python dict to a Swift Dictionary.

    This is a helper that will be used by generated bindings.

    Args:
        py_dict: Python dict to convert
        key_converter: Function to convert each key
        value_converter: Function to convert each value
        loader_cls: Loader class for FFI operations

    Returns:
        Pointer to Swift Dictionary object
    """
    # Placeholder implementation
    return ctypes.c_void_p(0)


def swift_dictionary_to_python_dict(
    swift_dict_ptr: ctypes.c_void_p,
    key_converter: Any,
    value_converter: Any,
    loader_cls: type[Loader],
) -> dict[Any, Any]:
    """
    Convert a Swift Dictionary to a Python dict.

    This is a helper that will be used by generated bindings.

    Args:
        swift_dict_ptr: Pointer to Swift Dictionary
        key_converter: Function to convert each key
        value_converter: Function to convert each value
        loader_cls: Loader class for FFI operations

    Returns:
        Python dict with converted key-value pairs
    """
    # Placeholder implementation
    return {}


def python_set_to_set(
    py_set: set[Any],
    element_converter: Any,
    loader_cls: type[Loader],
) -> ctypes.c_void_p:
    """
    Convert a Python set to a Swift Set.

    This is a helper that will be used by generated bindings.

    Args:
        py_set: Python set to convert
        element_converter: Function to convert each element
        loader_cls: Loader class for FFI operations

    Returns:
        Pointer to Swift Set object
    """
    # Placeholder implementation
    return ctypes.c_void_p(0)


def swift_set_to_python_set(
    swift_set_ptr: ctypes.c_void_p,
    element_converter: Any,
    loader_cls: type[Loader],
) -> set[Any]:
    """
    Convert a Swift Set to a Python set.

    This is a helper that will be used by generated bindings.

    Args:
        swift_set_ptr: Pointer to Swift Set
        element_converter: Function to convert each element
        loader_cls: Loader class for FFI operations

    Returns:
        Python set with converted elements
    """
    # Placeholder implementation
    return set()
