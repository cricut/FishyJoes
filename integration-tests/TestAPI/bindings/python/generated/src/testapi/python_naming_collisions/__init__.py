from __future__ import annotations
from .. import _python_naming_collisions_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "get_class_",
    "get_dunder____",
    "get_is_na_n",
    "get_leading_underscore_",
    "get_list",
    "get_title_url",
    "get_url",
    "from_",
]

def get_class_() -> int:
    """<!-- FishyJoes.export(class) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_PythonNamingCollisions_class_(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_dunder____() -> int:
    """<!-- FishyJoes.export(__dunder__) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_PythonNamingCollisions_dunder____(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_is_na_n() -> bool:
    """<!-- FishyJoes.export(isNaN) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_PythonNamingCollisions_is_na_n(fishyjoes_runtime.Runtime.shared.env_ref), bool)

def get_leading_underscore_() -> int:
    """<!-- FishyJoes.export(_leadingUnderscore) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_PythonNamingCollisions_leading_underscore_(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_list() -> int:
    """<!-- FishyJoes.export(list) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_PythonNamingCollisions_list(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_title_url() -> str:
    """`URL` and `Url` both snake-case to `url`; sibling collisions are a"""
    """generation error, resolved with an explicit verbatim `python:` name."""
    """<!-- FishyJoes.export(Url, python: title_url) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_PythonNamingCollisions_title_url(fishyjoes_runtime.Runtime.shared.env_ref), str)

def get_url() -> str:
    """<!-- FishyJoes.export(URL) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_PythonNamingCollisions_url(fishyjoes_runtime.Runtime.shared.env_ref), str)

def from_(
) -> str:
    """<!-- FishyJoes.export(from) -->"""
    return fishyjoes_runtime.consume_created_ref(
        _impl.iota_TestAPI_PythonNamingCollisions_from(
            fishyjoes_runtime.Runtime.shared.env_ref,
        ),
        str
    )
