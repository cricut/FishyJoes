from . import _test_differing_export_name_struct_implementation as _impl
from . import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class TestDifferingExportNameStruct(testapi.TestDifferingExportNameProtocolDiffy):
    """<!-- FishyJoes.export(TestDifferingExportNameStruct) -->"""

    tata: int

    def __init__(
        self,
        tata: int,
    ) -> None:
        self.tata = tata

    def __repr__(self) -> str:
        return f'testapi.TestDifferingExportNameStruct(tata={self.tata!r})'
