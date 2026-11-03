from __future__ import annotations
from ._test_differing_export_name_protocol_diffy_type import TestDifferingExportNameProtocolDiffy # early import to make cycles work correctly
from . import _test_differing_export_name_struct_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class TestDifferingExportNameStruct(TestDifferingExportNameProtocolDiffy):
    """<!-- FishyJoes.export(TestDifferingExportNameStruct) -->"""

    tata: int
    __slots__: list[str] = [
        'tata',
    ]

    def __init__(
        self,
        tata: int,
    ) -> None:
        self.tata = tata

    def __repr__(self) -> str:
        return f'testapi.TestDifferingExportNameStruct(...)'

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        return isinstance(other, TestDifferingExportNameStruct) and \
            self.tata == other.tata and \
            True
