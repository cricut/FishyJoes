from __future__ import annotations
from .. import _attributed_strings_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "attributed_characters",
    "attributes_preferring_duplicates_nearer_start",
    "echo",
    "empty_attribute_runs",
    "first_index",
    "full_range",
    "get_accent",
    "get_chinese",
    "get_chinese_bmp",
    "get_chinese_sip",
    "get_emoji",
    "get_emoji_multi",
    "get_polyglot",
    "get_script",
    "get_simple",
    "last_index",
]

def get_accent() -> fishyjoes_runtime.AttributedString:
    """<!-- FishyJoes.export(accent) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AttributedStrings_accent(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.AttributedString)

def get_chinese() -> fishyjoes_runtime.AttributedString:
    """<!-- FishyJoes.export(chinese) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AttributedStrings_chinese(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.AttributedString)

def get_chinese_bmp() -> fishyjoes_runtime.AttributedString:
    """<!-- FishyJoes.export(chineseBMP) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AttributedStrings_chineseBMP(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.AttributedString)

def get_chinese_sip() -> fishyjoes_runtime.AttributedString:
    """<!-- FishyJoes.export(chineseSIP) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AttributedStrings_chineseSIP(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.AttributedString)

def get_emoji() -> fishyjoes_runtime.AttributedString:
    """<!-- FishyJoes.export(emoji) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AttributedStrings_emoji(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.AttributedString)

def get_emoji_multi() -> fishyjoes_runtime.AttributedString:
    """<!-- FishyJoes.export(emojiMulti) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AttributedStrings_emojiMulti(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.AttributedString)

def get_polyglot() -> fishyjoes_runtime.AttributedString:
    """<!-- FishyJoes.export(polyglot) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AttributedStrings_polyglot(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.AttributedString)

def get_script() -> fishyjoes_runtime.AttributedString:
    """<!-- FishyJoes.export(script) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AttributedStrings_script(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.AttributedString)

def get_simple() -> fishyjoes_runtime.AttributedString:
    """<!-- FishyJoes.export(simple) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AttributedStrings_simple(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.AttributedString)

def echo(
    string: fishyjoes_runtime.AttributedString,
) -> fishyjoes_runtime.AttributedString:
    """<!-- FishyJoes.export(echo) -->"""
    with fishyjoes_runtime.local_handles(string) as (_stringHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AttributedStrings_echo(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _stringHandle,
            ),
            fishyjoes_runtime.AttributedString
        )

def first_index(
    string: fishyjoes_runtime.AttributedString,
) -> fishyjoes_runtime.attributed_string.Index:
    """<!-- FishyJoes.export(firstIndex) -->"""
    with fishyjoes_runtime.local_handles(string) as (_stringHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AttributedStrings_firstIndex(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _stringHandle,
            ),
            fishyjoes_runtime.attributed_string.Index
        )

def last_index(
    string: fishyjoes_runtime.AttributedString,
) -> fishyjoes_runtime.attributed_string.Index:
    """<!-- FishyJoes.export(lastIndex) -->"""
    with fishyjoes_runtime.local_handles(string) as (_stringHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AttributedStrings_lastIndex(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _stringHandle,
            ),
            fishyjoes_runtime.attributed_string.Index
        )

def full_range(
    string: fishyjoes_runtime.AttributedString,
) -> fishyjoes_runtime.SwiftRange[fishyjoes_runtime.attributed_string.Index]:
    """<!-- FishyJoes.export(fullRange) -->"""
    with fishyjoes_runtime.local_handles(string) as (_stringHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AttributedStrings_fullRange(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _stringHandle,
            ),
            fishyjoes_runtime.SwiftRange
        )

def attributed_characters(
    string: fishyjoes_runtime.AttributedString,
) -> list[fishyjoes_runtime.AttributedSubstring]:
    """<!-- FishyJoes.export(attributedCharacters) -->"""
    with fishyjoes_runtime.local_handles(string) as (_stringHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AttributedStrings_attributedCharacters(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _stringHandle,
            ),
            list
        )

def attributes_preferring_duplicates_nearer_start(
    string: fishyjoes_runtime.AttributedString,
) -> fishyjoes_runtime.AttributeContainer:
    """<!-- FishyJoes.export(attributesPreferringDuplicatesNearerStart) -->"""
    with fishyjoes_runtime.local_handles(string) as (_stringHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AttributedStrings_attributesPreferringDuplicatesNearerStart(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _stringHandle,
            ),
            fishyjoes_runtime.AttributeContainer
        )

def empty_attribute_runs(
    string: fishyjoes_runtime.AttributedString,
) -> list[fishyjoes_runtime.attributed_string.runs.Run]:
    """<!-- FishyJoes.export(emptyAttributeRuns) -->"""
    with fishyjoes_runtime.local_handles(string) as (_stringHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_AttributedStrings_emptyAttributeRuns(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _stringHandle,
            ),
            list
        )
