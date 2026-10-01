from .. import _testapi_exported as testapi
from .._test_default_computed_properties_enum_type import _BaseTestDefaultComputedPropertiesEnum
import dataclasses
import fishyjoes_runtime
import types
import typing

@typing.final
@dataclasses.dataclass(frozen=True)
class Qux(_BaseTestDefaultComputedPropertiesEnum):
    pass
