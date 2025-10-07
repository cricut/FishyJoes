"""Primitive type converters for Python-Swift interop."""

from __future__ import annotations

import ctypes
from typing import TYPE_CHECKING, Any

if TYPE_CHECKING:
    from fishyjoes_runtime.loader import Loader

# mypy: disable-error-code="valid-type"
# ctypes.POINTER has typing issues with mypy, but works correctly at runtime


# Callback function types matching Swift expectations
# These match the signatures in PythonConverter.swift

# Bool callbacks
BoolValueMethodType = ctypes.CFUNCTYPE(
    ctypes.c_bool,  # return: bool value
    ctypes.c_void_p,  # PyObjectPtr
    ctypes.POINTER(ctypes.c_void_p),  # PyOutExn (exception out param)
)

# Int callbacks (covers Int, Int64, UInt64)
IntValueMethodType = ctypes.CFUNCTYPE(
    ctypes.c_int64,  # return: int value
    ctypes.c_void_p,  # PyObjectPtr
    ctypes.POINTER(ctypes.c_void_p),  # PyOutExn
)

Int64ValueMethodType = ctypes.CFUNCTYPE(
    ctypes.c_int64,  # return: int64 value
    ctypes.c_void_p,  # PyObjectPtr
    ctypes.POINTER(ctypes.c_void_p),  # PyOutExn
)

UInt64ValueMethodType = ctypes.CFUNCTYPE(
    ctypes.c_uint64,  # return: uint64 value
    ctypes.c_void_p,  # PyObjectPtr
    ctypes.POINTER(ctypes.c_void_p),  # PyOutExn
)

IntConstructorType = ctypes.CFUNCTYPE(
    ctypes.c_void_p,  # return: PyObjectPtr
    ctypes.c_int64,  # value
)

Int64ConstructorType = ctypes.CFUNCTYPE(
    ctypes.c_void_p,  # return: PyObjectPtr
    ctypes.c_int64,  # value
)

UInt64ConstructorType = ctypes.CFUNCTYPE(
    ctypes.c_void_p,  # return: PyObjectPtr
    ctypes.c_uint64,  # value
)

# Float/Double callbacks
FloatValueMethodType = ctypes.CFUNCTYPE(
    ctypes.c_float,  # return: float value
    ctypes.c_void_p,  # PyObjectPtr
    ctypes.POINTER(ctypes.c_void_p),  # PyOutExn
)

DoubleValueMethodType = ctypes.CFUNCTYPE(
    ctypes.c_double,  # return: double value
    ctypes.c_void_p,  # PyObjectPtr
    ctypes.POINTER(ctypes.c_void_p),  # PyOutExn
)

FloatConstructorType = ctypes.CFUNCTYPE(
    ctypes.c_void_p,  # return: PyObjectPtr
    ctypes.c_float,  # value
)

DoubleConstructorType = ctypes.CFUNCTYPE(
    ctypes.c_void_p,  # return: PyObjectPtr
    ctypes.c_double,  # value
)

# String callbacks (need special handling for UTF-8)
StringValueMethodType = ctypes.CFUNCTYPE(
    ctypes.c_void_p,  # return: PyObjectPtr (Swift String as Python wrapper)
    ctypes.c_void_p,  # PyObjectPtr
    ctypes.POINTER(ctypes.c_void_p),  # PyOutExn
)

StringConstructorType = ctypes.CFUNCTYPE(
    ctypes.c_void_p,  # return: PyObjectPtr
    ctypes.c_char_p,  # UTF-8 bytes
    ctypes.c_size_t,  # length
)


def setup_primitives(loader_cls: type[Loader]) -> None:
    """
    Setup primitive type converters with Swift.

    This registers callback functions that Swift will use to convert
    between Python objects and Swift primitive types.

    Args:
        loader_cls: The Loader class (passed to avoid circular import)
    """
    if not loader_cls._lib or not loader_cls._env:
        return

    lib = loader_cls._lib
    env = loader_cls._env

    # Create callback instances that will be passed to Swift
    # These need to be kept alive, so we store them in _bag

    # Bool setup
    def bool_value_method(obj_ptr: ctypes.c_void_p, exn_ptr: Any) -> bool:
        """Extract bool value from Python object."""
        try:
            # In a real implementation, this would peek at the Python object
            # For now, this is a placeholder that will be replaced when
            # the Swift runtime is fully integrated
            return False  # noqa: TRY300
        except Exception as e:
            # Store exception for Swift to retrieve
            if exn_ptr:
                exn_ptr[0] = ctypes.c_void_p(id(e))
            return False

    bool_callback = BoolValueMethodType(bool_value_method)
    loader_cls._bag(bool_callback)

    # Get Python's True and False as objects to pass to Swift
    python_true = ctypes.c_void_p(id(True))
    python_false = ctypes.c_void_p(id(False))

    setup_bool = lib.Swift_Bool_python_setup
    setup_bool.argtypes = [
        ctypes.c_void_p,  # EnvRef
        ctypes.c_void_p,  # pythonTrue
        ctypes.c_void_p,  # pythonFalse
        BoolValueMethodType,  # valueMethod
    ]
    setup_bool.restype = None
    setup_bool(env, python_true, python_false, bool_callback)

    # Int setup
    def int_value_method(obj_ptr: ctypes.c_void_p, exn_ptr: Any) -> int:
        """Extract int value from Python object."""
        try:
            return 0  # Placeholder  # noqa: TRY300
        except Exception as e:
            if exn_ptr:
                exn_ptr[0] = ctypes.c_void_p(id(e))
            return 0

    def int_constructor(value: int) -> ctypes.c_void_p:
        """Create Python int from Swift value."""
        # In real implementation, wrap the int properly
        return ctypes.c_void_p(id(value))

    int_value_callback = IntValueMethodType(int_value_method)
    int_constructor_callback = IntConstructorType(int_constructor)
    loader_cls._bag(int_value_callback)
    loader_cls._bag(int_constructor_callback)

    setup_int = lib.Swift_Int_python_setup
    setup_int.argtypes = [
        ctypes.c_void_p,  # EnvRef
        IntValueMethodType,  # valueMethod
        IntConstructorType,  # constructor
    ]
    setup_int.restype = None
    setup_int(env, int_value_callback, int_constructor_callback)

    # Int64 setup
    int64_value_callback = Int64ValueMethodType(int_value_method)
    int64_constructor_callback = Int64ConstructorType(int_constructor)
    loader_cls._bag(int64_value_callback)
    loader_cls._bag(int64_constructor_callback)

    setup_int64 = lib.Swift_Int64_python_setup
    setup_int64.argtypes = [
        ctypes.c_void_p,  # EnvRef
        Int64ValueMethodType,  # valueMethod
        Int64ConstructorType,  # constructor
    ]
    setup_int64.restype = None
    setup_int64(env, int64_value_callback, int64_constructor_callback)

    # UInt64 setup
    def uint64_value_method(obj_ptr: ctypes.c_void_p, exn_ptr: Any) -> int:
        """Extract uint64 value from Python object."""
        try:
            return 0  # Placeholder  # noqa: TRY300
        except Exception as e:
            if exn_ptr:
                exn_ptr[0] = ctypes.c_void_p(id(e))
            return 0

    uint64_value_callback = UInt64ValueMethodType(uint64_value_method)
    uint64_constructor_callback = UInt64ConstructorType(int_constructor)
    loader_cls._bag(uint64_value_callback)
    loader_cls._bag(uint64_constructor_callback)

    setup_uint64 = lib.Swift_UInt64_python_setup
    setup_uint64.argtypes = [
        ctypes.c_void_p,  # EnvRef
        UInt64ValueMethodType,  # valueMethod
        UInt64ConstructorType,  # constructor
    ]
    setup_uint64.restype = None
    setup_uint64(env, uint64_value_callback, uint64_constructor_callback)

    # Float setup
    def float_value_method(obj_ptr: ctypes.c_void_p, exn_ptr: Any) -> float:
        """Extract float value from Python object."""
        try:
            return 0.0  # Placeholder  # noqa: TRY300
        except Exception as e:
            if exn_ptr:
                exn_ptr[0] = ctypes.c_void_p(id(e))
            return 0.0

    def float_constructor(value: float) -> ctypes.c_void_p:
        """Create Python float from Swift value."""
        return ctypes.c_void_p(id(float(value)))

    float_value_callback = FloatValueMethodType(float_value_method)
    float_constructor_callback = FloatConstructorType(float_constructor)
    loader_cls._bag(float_value_callback)
    loader_cls._bag(float_constructor_callback)

    setup_float = lib.Swift_Float_python_setup
    setup_float.argtypes = [
        ctypes.c_void_p,  # EnvRef
        FloatValueMethodType,  # valueMethod
        FloatConstructorType,  # constructor
    ]
    setup_float.restype = None
    setup_float(env, float_value_callback, float_constructor_callback)

    # Double setup
    def double_value_method(obj_ptr: ctypes.c_void_p, exn_ptr: Any) -> float:
        """Extract double value from Python object."""
        try:
            return 0.0  # Placeholder  # noqa: TRY300
        except Exception as e:
            if exn_ptr:
                exn_ptr[0] = ctypes.c_void_p(id(e))
            return 0.0

    def double_constructor(value: float) -> ctypes.c_void_p:
        """Create Python float from Swift value."""
        return ctypes.c_void_p(id(float(value)))

    double_value_callback = DoubleValueMethodType(double_value_method)
    double_constructor_callback = DoubleConstructorType(double_constructor)
    loader_cls._bag(double_value_callback)
    loader_cls._bag(double_constructor_callback)

    setup_double = lib.Swift_Double_python_setup
    setup_double.argtypes = [
        ctypes.c_void_p,  # EnvRef
        DoubleValueMethodType,  # valueMethod
        DoubleConstructorType,  # constructor
    ]
    setup_double.restype = None
    setup_double(env, double_value_callback, double_constructor_callback)

    # String setup
    def string_value_method(obj_ptr: ctypes.c_void_p, exn_ptr: Any) -> ctypes.c_void_p:
        """Extract string value from Python object."""
        try:
            # Placeholder - would extract string from Python object
            return ctypes.c_void_p(0)  # noqa: TRY300
        except Exception as e:
            if exn_ptr:
                exn_ptr[0] = ctypes.c_void_p(id(e))
            return ctypes.c_void_p(0)

    def string_constructor(utf8_bytes: bytes, length: int) -> ctypes.c_void_p:
        """Create Python str from Swift UTF-8 bytes."""
        try:
            text = utf8_bytes[:length].decode("utf-8")
            return ctypes.c_void_p(id(text))
        except Exception:
            return ctypes.c_void_p(0)

    string_value_callback = StringValueMethodType(string_value_method)
    string_constructor_callback = StringConstructorType(string_constructor)
    loader_cls._bag(string_value_callback)
    loader_cls._bag(string_constructor_callback)

    setup_string = lib.Swift_String_python_setup
    setup_string.argtypes = [
        ctypes.c_void_p,  # EnvRef
        StringValueMethodType,  # valueMethod
        StringConstructorType,  # constructor
    ]
    setup_string.restype = None
    setup_string(env, string_value_callback, string_constructor_callback)
