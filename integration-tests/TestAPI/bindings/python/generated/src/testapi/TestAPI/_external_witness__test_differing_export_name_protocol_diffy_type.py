from . import _external_witness__test_differing_export_name_protocol_diffy_implementation as _impl
from .. import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class ExternalWitness_TestDifferingExportNameProtocolDiffy(fishyjoes_runtime.SwiftReference, testapi.TestDifferingExportNameProtocolDiffy):
    """<!-- FishyJoes.export(TestDifferingExportNameProtocolDiffy) -->"""

    @property
    def tata(self) -> int:
        """<!-- FishyJoes.export(tata) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestDifferingExportNameProtocol_tata(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), int)
