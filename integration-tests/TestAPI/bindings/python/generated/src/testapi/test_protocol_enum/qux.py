from .. import _testapi_exported as testapi
from .._test_protocol_enum_type import _BaseTestProtocolEnum
import dataclasses
import fishyjoes_runtime
import types
import typing

@typing.final
@dataclasses.dataclass(frozen=True)
class Qux(_BaseTestProtocolEnum):
    pass
