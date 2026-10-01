from . import _testapi_exported as testapi
from . import unicode_scalar__putting_types_into_questionable_places
from ._c_api import _testapi_lib
from ._unicode_scalar__putting_types_into_questionable_places_type import UnicodeScalar_PuttingTypesIntoQuestionablePlaces
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

# MARK: C callback implementations

@fishyjoes_runtime.callback("EnumDiscriminator")
@fishyjoes_runtime.catch_by_out_ref(default=0)
def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:
    match fishyjoes_runtime.peek_ref(obj_ref, UnicodeScalar_PuttingTypesIntoQuestionablePlaces):
        case unicode_scalar__putting_types_into_questionable_places.Thing: return 0
        case unknown: raise ValueError(f'Unknown UnicodeScalar_PuttingTypesIntoQuestionablePlaces case "{unknown})". Enums are not meant to be extended.')

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def new_thing(
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(unicode_scalar__putting_types_into_questionable_places.Thing(
    ))

@fishyjoes_runtime.callback("TODO")
@fishyjoes_runtime.catch_by_out_ref(default=None)
def extract_Thing(
    obj: fishyjoes_runtime.UnownedRef,
) -> None:
    self = fishyjoes_runtime.peek_ref(obj, unicode_scalar__putting_types_into_questionable_places.Thing)

# MARK: setup

# TODO: setup for testapi.UnicodeScalar_PuttingTypesIntoQuestionablePlaces
