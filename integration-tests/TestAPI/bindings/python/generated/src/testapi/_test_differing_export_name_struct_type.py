from . import _test_differing_export_name_struct_implementation as _impl
from . import _testapi_exported as testapi
import dataclasses
import fishyjoes_runtime
import types
import typing

@dataclasses.dataclass
class TestDifferingExportNameStruct(testapi.TestDifferingExportNameProtocolDiffy):
    """<!-- FishyJoes.export(TestDifferingExportNameStruct) -->"""
    tata: int
