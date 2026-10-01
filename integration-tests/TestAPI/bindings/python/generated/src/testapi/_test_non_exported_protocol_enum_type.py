from . import _test_non_exported_protocol_enum_implementation as _impl
from . import _testapi_exported as testapi
from . import test_non_exported_protocol_enum
import fishyjoes_runtime
import types
import typing

class _BaseTestNonExportedProtocolEnum:
    """<!-- FishyJoes.export(TestNonExportedProtocolEnum) -->"""

    @property
    def fuga(self) -> float:
        """<!-- FishyJoes.export(fuga) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestNonExportedProtocolEnum_fuga(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), float)

    def hoge(
        self,
    ) -> float:
        """<!-- FishyJoes.export(hoge) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestNonExportedProtocolEnum_hoge(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                float
            )

TestNonExportedProtocolEnum: typing.TypeAlias = typing.Union[
    test_non_exported_protocol_enum.Hogehoge,
]
