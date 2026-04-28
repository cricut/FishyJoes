from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class Strings:
    """
    <!-- FishyJoes.export(Strings) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def accent() -> builtins.str:
        """
        <!-- FishyJoes.export(accent) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Strings_accent", "object")
    

    @staticmethod
    def chinese() -> builtins.str:
        """
        <!-- FishyJoes.export(chinese) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Strings_chinese", "object")
    

    @staticmethod
    def chineseBMP() -> builtins.str:
        """
        <!-- FishyJoes.export(chineseBMP) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Strings_chineseBMP", "object")
    

    @staticmethod
    def chineseSIP() -> builtins.str:
        """
        <!-- FishyJoes.export(chineseSIP) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Strings_chineseSIP", "object")
    

    @staticmethod
    def emoji() -> builtins.str:
        """
        <!-- FishyJoes.export(emoji) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Strings_emoji", "object")
    

    @staticmethod
    def emojiMulti() -> builtins.str:
        """
        <!-- FishyJoes.export(emojiMulti) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Strings_emojiMulti", "object")
    

    @staticmethod
    def script() -> builtins.str:
        """
        <!-- FishyJoes.export(script) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Strings_script", "object")
    

    @staticmethod
    def simple() -> builtins.str:
        """
        <!-- FishyJoes.export(simple) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Strings_simple", "object")
    

    @staticmethod
    def echo(string: builtins.str) -> builtins.str:
        """
        <!-- FishyJoes.export(echo) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Strings_echo", "object", ("object", string))
    

    @staticmethod
    def split(string: builtins.str, by: builtins.str) -> builtins.list[builtins.str]:
        """
        <!-- FishyJoes.export(split) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Strings_split", "object", ("object", string), ("object", by))
    
