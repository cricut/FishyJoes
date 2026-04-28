from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented
if typing.TYPE_CHECKING: from fishyjoes_python import AttributeContainer, AttributedString, AttributedStringIndex, AttributedStringRun, AttributedSubstring

class AttributedStrings:
    """
    <!-- FishyJoes.export(AttributedStrings) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def accent() -> AttributedString:
        """
        <!-- FishyJoes.export(accent) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_AttributedStrings_accent", "object")
    

    @staticmethod
    def chinese() -> AttributedString:
        """
        <!-- FishyJoes.export(chinese) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_AttributedStrings_chinese", "object")
    

    @staticmethod
    def chineseBMP() -> AttributedString:
        """
        <!-- FishyJoes.export(chineseBMP) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_AttributedStrings_chineseBMP", "object")
    

    @staticmethod
    def chineseSIP() -> AttributedString:
        """
        <!-- FishyJoes.export(chineseSIP) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_AttributedStrings_chineseSIP", "object")
    

    @staticmethod
    def emoji() -> AttributedString:
        """
        <!-- FishyJoes.export(emoji) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_AttributedStrings_emoji", "object")
    

    @staticmethod
    def emojiMulti() -> AttributedString:
        """
        <!-- FishyJoes.export(emojiMulti) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_AttributedStrings_emojiMulti", "object")
    

    @staticmethod
    def polyglot() -> AttributedString:
        """
        <!-- FishyJoes.export(polyglot) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_AttributedStrings_polyglot", "object")
    

    @staticmethod
    def script() -> AttributedString:
        """
        <!-- FishyJoes.export(script) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_AttributedStrings_script", "object")
    

    @staticmethod
    def simple() -> AttributedString:
        """
        <!-- FishyJoes.export(simple) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_AttributedStrings_simple", "object")
    

    @staticmethod
    def echo(string: AttributedString) -> AttributedString:
        """
        <!-- FishyJoes.export(echo) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_AttributedStrings_echo", "object", ("object", string))
    

    @staticmethod
    def firstIndex(string: AttributedString) -> AttributedStringIndex:
        """
        <!-- FishyJoes.export(firstIndex) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_AttributedStrings_firstIndex", "object", ("object", string))
    

    @staticmethod
    def lastIndex(string: AttributedString) -> AttributedStringIndex:
        """
        <!-- FishyJoes.export(lastIndex) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_AttributedStrings_lastIndex", "object", ("object", string))
    

    @staticmethod
    def fullRange(string: AttributedString) -> typing.Any:
        """
        <!-- FishyJoes.export(fullRange) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_AttributedStrings_fullRange", "object", ("object", string))
    

    @staticmethod
    def attributedCharacters(string: AttributedString) -> builtins.list[AttributedSubstring]:
        """
        <!-- FishyJoes.export(attributedCharacters) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_AttributedStrings_attributedCharacters", "object", ("object", string))
    

    @staticmethod
    def attributesPreferringDuplicatesNearerStart(string: AttributedString) -> AttributeContainer:
        """
        <!-- FishyJoes.export(attributesPreferringDuplicatesNearerStart) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_AttributedStrings_attributesPreferringDuplicatesNearerStart", "object", ("object", string))
    

    @staticmethod
    def emptyAttributeRuns(string: AttributedString) -> builtins.list[AttributedStringRun]:
        """
        <!-- FishyJoes.export(emptyAttributeRuns) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_AttributedStrings_emptyAttributeRuns", "object", ("object", string))
    
