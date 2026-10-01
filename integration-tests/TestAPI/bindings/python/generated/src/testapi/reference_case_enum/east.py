from .. import _testapi_exported as testapi
from .._reference_case_enum_type import _BaseReferenceCaseEnum
import dataclasses
import fishyjoes_runtime
import types
import typing

@typing.final
@dataclasses.dataclass(frozen=True)
class East(_BaseReferenceCaseEnum):
    pass
