from __future__ import annotations

from . import _test_differing_export_name_protocol_diffy_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import abc
import collections.abc
import fishyjoes_runtime
import types
import typing

class TestDifferingExportNameProtocolDiffy(abc.ABC):
    """<!-- FishyJoes.export(TestDifferingExportNameProtocolDiffy) -->"""

    @property
    def tata(self) -> int:
        """<!-- FishyJoes.export(tata) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return _impl.iota_get_TestAPI_TestDifferingExportNameProtocol_tata(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)
