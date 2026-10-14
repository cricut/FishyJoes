from __future__ import annotations
from .. import _strings_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "get_accent",
    "get_chinese",
    "get_chinese_bmp",
    "get_chinese_sip",
    "get_emoji",
    "get_emoji_multi",
    "get_script",
    "get_simple",
    "echo",
    "split",
]

def get_accent() -> str:
    """<!-- FishyJoes.export(accent) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Strings_accent(fishyjoes_runtime.Runtime.shared.env_ref), str)

def get_chinese() -> str:
    """<!-- FishyJoes.export(chinese) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Strings_chinese(fishyjoes_runtime.Runtime.shared.env_ref), str)

def get_chinese_bmp() -> str:
    """<!-- FishyJoes.export(chineseBMP) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Strings_chinese_bmp(fishyjoes_runtime.Runtime.shared.env_ref), str)

def get_chinese_sip() -> str:
    """<!-- FishyJoes.export(chineseSIP) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Strings_chinese_sip(fishyjoes_runtime.Runtime.shared.env_ref), str)

def get_emoji() -> str:
    """<!-- FishyJoes.export(emoji) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Strings_emoji(fishyjoes_runtime.Runtime.shared.env_ref), str)

def get_emoji_multi() -> str:
    """<!-- FishyJoes.export(emojiMulti) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Strings_emoji_multi(fishyjoes_runtime.Runtime.shared.env_ref), str)

def get_script() -> str:
    """<!-- FishyJoes.export(script) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Strings_script(fishyjoes_runtime.Runtime.shared.env_ref), str)

def get_simple() -> str:
    """A simple ASCII greeting."""
    """<!-- FishyJoes.export(simple) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Strings_simple(fishyjoes_runtime.Runtime.shared.env_ref), str)

def echo(
    string: str,
) -> str:
    """Returns the given string unchanged."""
    """<!-- FishyJoes.export(echo) -->"""
    with fishyjoes_runtime.local_handles(string) as (_stringHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Strings_echo(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _stringHandle,
            ),
            str
        )

def split(
    string: str,
    by: str,
) -> list[str]:
    """Splits the string on each occurrence of the separator."""
    """Returns the pieces in order without the separator."""
    """<!-- FishyJoes.export(split) -->"""
    with fishyjoes_runtime.local_handles(string, by) as (_stringHandle, _byHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Strings_split(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _stringHandle,
                _byHandle,
            ),
            list
        )
