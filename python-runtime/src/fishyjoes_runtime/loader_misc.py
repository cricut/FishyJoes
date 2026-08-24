from typing import Callable, TypeAlias

from fishyjoes_runtime._fishyjoesruntime_c_api import _fishyjoes_runtime_lib, callback, ffi
from fishyjoes_runtime.ffi_types import *
from fishyjoes_runtime.runtime import FishyJoesRuntime, _create_ref, _peek_ref, catch_by_out_ref

# MARK: C APIs

_StringGetLengthFn: TypeAlias = Callable[[UnownedRef, OutCreatedRef], int]
_StringGetCodeUnitsFn: TypeAlias = Callable[[UnownedRef, Pointer, OutCreatedRef], None]
_StringConstructorFn: TypeAlias = Callable[[Pointer, int, OutCreatedRef], CreatedRef]

_DataGetLengthFn: TypeAlias = Callable[[UnownedRef, OutCreatedRef], int]
_DataGetBytesFn: TypeAlias = Callable[[UnownedRef, Pointer, OutCreatedRef], None]
_DataConstructorFn: TypeAlias = Callable[[Pointer, int, OutCreatedRef], CreatedRef]

_URLAbsoluteURIFn: TypeAlias = Callable[[UnownedRef, OutCreatedRef], CreatedRef]
_URLConstructorFn: TypeAlias = Callable[[UnownedRef, OutCreatedRef], CreatedRef]

_Swift_String_setup: \
    Callable[[EnvRef, _StringGetLengthFn, _StringGetCodeUnitsFn, _StringConstructorFn], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_String_setup")

_Foundation_Data_setup: \
    Callable[[EnvRef, _DataGetLengthFn, _DataGetBytesFn, _DataConstructorFn], None] = \
    getattr(_fishyjoes_runtime_lib, "Foundation_Data_setup")

_Foundation_URL_setup: \
    Callable[[EnvRef, _URLAbsoluteURIFn, _URLConstructorFn], None] = \
    getattr(_fishyjoes_runtime_lib, "Foundation_URL_setup")


# MARK: C callback implementations

@callback("StringGetLengthFn")
@catch_by_out_ref(default=0)
def _string_length(string_ref: UnownedRef) -> int:
    string = _peek_ref(string_ref, str)
    return len(string.encode("utf-16"))


@callback("StringGetCodeUnitsFn")
@catch_by_out_ref(default=None)
def _string_code_units(string_ref: UnownedRef, out_code_units: Pointer) -> None:
    string = _peek_ref(string_ref, str)
    string_bytes = string.encode("utf-16")
    ffi.memmove(out_code_units, string_bytes, len(string_bytes))


@callback("StringConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _string_constructor(code_units: Pointer, code_unit_count: int) -> CreatedRef:
    string = ffi.unpack(code_units, code_unit_count)
    return _create_ref(string)


@callback("DataGetLengthFn")
@catch_by_out_ref(default=0)
def _data_length(bytes_ref: UnownedRef) -> int:
    return len(_peek_ref(bytes_ref, bytes))


@callback("DataGetBytesFn")
@catch_by_out_ref(default=None)
def _data_bytes(bytes_ref: UnownedRef, out_bytes: Pointer) -> None:
    data = _peek_ref(bytes_ref, bytes)
    ffi.memmove(out_bytes, data, len(data))


@callback("DataConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _data_constructor(contents: Pointer, length: int) -> CreatedRef:
    data = bytes(ffi.buffer(contents, length))
    return _create_ref(data)


@callback("URLAbsoluteURIFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _url_absolute_uri(url_ref: UnownedRef) -> CreatedRef:
    url = _peek_ref(url_ref, str)
    return _create_ref(url)


@callback("URLConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _url_constructor(url_string_ref: UnownedRef) -> CreatedRef:
    url_string = _peek_ref(url_string_ref, str)
    return _create_ref(url_string)

# MARK: setup

def setup_misc() -> None:
    _Swift_String_setup(
        FishyJoesRuntime.shared.env_ref,
        _string_length,
        _string_code_units,
        _string_constructor,
    )
