"""Shared helpers for FishyJoes-generated Python runtime modules."""

from __future__ import annotations

import ctypes
import platform
from typing import Any, NoReturn


def not_implemented(symbol: str) -> NoReturn:
    raise NotImplementedError(
        f"Python binding surface for {symbol} is generated, but native-backed "
        "invocation is not wired yet."
    )


def function_returns_future(converter_name: str) -> bool:
    args = generic_arguments(converter_name)
    return bool(args) and args[-1].startswith("FutureConverter<")


def generic_arguments(converter_name: str) -> list[str]:
    start = converter_name.find("<")
    if start == -1 or not converter_name.endswith(">"):
        return []
    body = converter_name[start + 1:-1]
    args: list[str] = []
    depth = 0
    current: list[str] = []
    for char in body:
        if char == "<":
            depth += 1
        elif char == ">":
            depth -= 1
        elif char == "," and depth == 0:
            args.append("".join(current).strip())
            current = []
            continue
        current.append(char)
    args.append("".join(current).strip())
    return args


def ffi_ctypes_type(name: str) -> Any:
    return {
        "bool": ctypes.c_uint8,
        "int8": ctypes.c_int8,
        "int16": ctypes.c_int16,
        "int32": ctypes.c_int32,
        "int64": ctypes.c_int64,
        "int": ctypes.c_ssize_t,
        "uint8": ctypes.c_uint8,
        "uint16": ctypes.c_uint16,
        "uint32": ctypes.c_uint32,
        "uint64": ctypes.c_uint64,
        "uint": ctypes.c_size_t,
        "float": ctypes.c_float,
        "double": ctypes.c_double,
        "object": ctypes.c_void_p,
    }[name]


def ffi_default_value(name: str) -> Any:
    return {
        "bool": 0,
        "int8": 0,
        "int16": 0,
        "int32": 0,
        "int64": 0,
        "int": 0,
        "uint8": 0,
        "uint16": 0,
        "uint32": 0,
        "uint64": 0,
        "uint": 0,
        "float": 0.0,
        "double": 0.0,
        "object": 0,
    }[name]


def platform_library_name(name: str) -> str:
    if hasattr(ctypes, "windll"):
        return f"{name}.dll"

    if platform.system() == "Darwin":
        return f"lib{name}.dylib"

    return f"lib{name}.so"
