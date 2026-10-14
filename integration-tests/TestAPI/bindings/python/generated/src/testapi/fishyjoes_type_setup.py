from __future__ import annotations
from . import _associated_data_enum_implementation as _testapi_AssociatedDataEnum_impl
from . import _empty_class1_implementation as _testapi_EmptyClass1_impl
from . import _empty_class2_implementation as _testapi_EmptyClass2_impl
from . import _methods_implementation as _testapi_Methods_impl
from . import _reference_case_enum_implementation as _testapi_ReferenceCaseEnum_impl
from . import _shadow_box_implementation as _testapi_ShadowBox_impl
from . import _simple_enum_implementation as _testapi_SimpleEnum_impl
from . import _structs__putting_types_into_questionable_places_implementation as _testapi_Structs_PuttingTypesIntoQuestionablePlaces_impl
from . import _test_async_swift_side_functions_class_implementation as _testapi_TestAsyncSwiftSideFunctionsClass_impl
from . import _test_default_computed_properties_enum_implementation as _testapi_TestDefaultComputedPropertiesEnum_impl
from . import _test_default_computed_properties_reference_implementation as _testapi_TestDefaultComputedPropertiesReference_impl
from . import _test_non_exported_protocol_enum_implementation as _testapi_TestNonExportedProtocolEnum_impl
from . import _test_protocol_class_implementation as _testapi_TestProtocolClass_impl
from . import _test_protocol_enum_implementation as _testapi_TestProtocolEnum_impl
from . import _testapi_exported as testapi
from . import _the_method_error_implementation as _testapi_TheMethodError_impl
from . import _unicode_scalar__putting_types_into_questionable_places_implementation as _testapi_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_impl
from ._c_api import _testapi_lib
from .actors import _temperature_logger_implementation as _testapi_actors_TemperatureLogger_impl
from .reference_only_types import _marker_implementation as _testapi_reference_only_types_Marker_impl
from .structs import _reference_struct_implementation as _testapi_structs_ReferenceStruct_impl
from warnings import deprecated
import fishyjoes_runtime
import fishyjoes_runtime.fishyjoes_type_setup
import types
import typing

_testapi_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_new_thing: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_extract_thing: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_AssociatedDataEnum_new_thing: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.ConsumedRef,
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_AssociatedDataEnum_extract_thing: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_AssociatedDataEnum_new_other: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.ConsumedRef,
    fishyjoes_runtime.ConsumedRef,
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_AssociatedDataEnum_extract_other: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef,
    fishyjoes_runtime.OutCreatedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_AssociatedDataEnum_new_bar: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.ConsumedRef,
    fishyjoes_runtime.ConsumedRef,
    fishyjoes_runtime.ConsumedRef,
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_AssociatedDataEnum_extract_bar: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef,
    fishyjoes_runtime.OutCreatedRef,
    fishyjoes_runtime.OutCreatedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_AssociatedDataEnum_new_noValue: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_AssociatedDataEnum_extract_noValue: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_AssociatedDataEnum_new_none: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_AssociatedDataEnum_extract_none: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_AssociatedDataEnum_new_simpleEnum: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.ConsumedRef,
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_AssociatedDataEnum_extract_simpleEnum: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_ReferenceCaseEnum_new_north: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_ReferenceCaseEnum_extract_north: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_ReferenceCaseEnum_new_south: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_ReferenceCaseEnum_extract_south: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_ReferenceCaseEnum_new_east: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_ReferenceCaseEnum_extract_east: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_ReferenceCaseEnum_new_west: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_ReferenceCaseEnum_extract_west: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_ShadowBox_new_shade: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.ConsumedRef,
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_ShadowBox_extract_shade: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_ShadowBox_new_empty: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_ShadowBox_extract_empty: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_SimpleEnum_new_red: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_SimpleEnum_extract_red: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_SimpleEnum_new_green: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_SimpleEnum_extract_green: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_SimpleEnum_new_blue: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_SimpleEnum_extract_blue: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_TestDefaultComputedPropertiesEnum_new_qux: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_TestDefaultComputedPropertiesEnum_extract_qux: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_TestNonExportedProtocolEnum_new_hogehoge: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_TestNonExportedProtocolEnum_extract_hogehoge: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]
_testapi_TestProtocolEnum_new_qux: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.OutCreatedRef
], fishyjoes_runtime.CreatedRef]
_testapi_TestProtocolEnum_extract_qux: typing.TypeAlias = typing.Callable[[
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.OutCreatedRef
], None]

Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup'))
Swift_String_PuttingTypesIntoQuestionablePlaces_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'Swift_String_PuttingTypesIntoQuestionablePlaces_setup'))
Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], int],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup'))
TestAPI_Actors_TemperatureLogger_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Actors_TemperatureLogger_setup'))
TestAPI_Collections_CollectionHolder_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Collections_CollectionHolder_setup'))
TestAPI_Methods_TheMethodError_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Methods_TheMethodError_setup'))
TestAPI_Primitives_PrimitiveHolder_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Primitives_PrimitiveHolder_setup'))
TestAPI_ReferenceOnlyTypes_Marker_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_ReferenceOnlyTypes_Marker_setup'))
TestAPI_Results_Error_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Results_Error_setup'))
TestAPI_Structs_MemberwiseStruct_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Structs_MemberwiseStruct_setup'))
TestAPI_Structs_MutableStruct_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Structs_MutableStruct_setup'))
TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup'))
TestAPI_Structs_ReferenceStruct_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Structs_ReferenceStruct_setup'))
TestAPI_Structs_TwentyOneItemStruct_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Structs_TwentyOneItemStruct_setup'))
TestAPI_CommonInterface__AProtocolConverter_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_CommonInterface__AProtocolConverter_setup'))
TestAPI_AProtocolImplementation_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_AProtocolImplementation_setup'))
TestAPI_Actors_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Actors_setup'))
TestAPI_AssociatedDataEnum_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], int],
    typing.Callable[[fishyjoes_runtime.ConsumedRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef, fishyjoes_runtime.OutCreatedRef], None],
    typing.Callable[[fishyjoes_runtime.ConsumedRef, fishyjoes_runtime.ConsumedRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef, fishyjoes_runtime.OutCreatedRef, fishyjoes_runtime.OutCreatedRef], None],
    typing.Callable[[fishyjoes_runtime.ConsumedRef, fishyjoes_runtime.ConsumedRef, fishyjoes_runtime.ConsumedRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef, fishyjoes_runtime.OutCreatedRef, fishyjoes_runtime.OutCreatedRef, fishyjoes_runtime.OutCreatedRef], None],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
    typing.Callable[[fishyjoes_runtime.ConsumedRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef, fishyjoes_runtime.OutCreatedRef], None],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_AssociatedDataEnum_setup'))
TestAPI_AsyncFunctions_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_AsyncFunctions_setup'))
TestAPI_Bytes_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Bytes_setup'))
TestAPI_ClosedRanges_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_ClosedRanges_setup'))
TestAPI_Collections_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Collections_setup'))
TestAPI_DefaultArguments_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_DefaultArguments_setup'))
TestAPI_Deprecations_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Deprecations_setup'))
TestAPI_EmptyClass_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_EmptyClass_setup'))
TestAPI_EmptyClass2_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_EmptyClass2_setup'))
TestAPI_EmptyEnum_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_EmptyEnum_setup'))
TestAPI_EmptyStruct_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_EmptyStruct_setup'))
TestAPI_EmptyStruct2_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_EmptyStruct2_setup'))
TestAPI_Functions_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Functions_setup'))
TestAPI_Methods_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Methods_setup'))
TestAPI_Primitives_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Primitives_setup'))
TestAPI_ProtocolFixtures_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_ProtocolFixtures_setup'))
TestAPI_PythonNamingCollisions_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_PythonNamingCollisions_setup'))
TestAPI_Ranges_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Ranges_setup'))
TestAPI_ReferenceCaseEnum_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], int],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_ReferenceCaseEnum_setup'))
TestAPI_ReferenceEmptyEnum_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_ReferenceEmptyEnum_setup'))
TestAPI_ReferenceOnlyTypes_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_ReferenceOnlyTypes_setup'))
TestAPI_Results_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Results_setup'))
TestAPI_Shade_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Shade_setup'))
TestAPI_ShadowBox_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], int],
    typing.Callable[[fishyjoes_runtime.ConsumedRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef, fishyjoes_runtime.OutCreatedRef], None],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_ShadowBox_setup'))
TestAPI_SimpleEnum_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], int],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_SimpleEnum_setup'))
TestAPI_Strings_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Strings_setup'))
TestAPI_Structs_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Structs_setup'))
TestAPI_TestAsyncForeignSideFunctionsStruct_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_TestAsyncForeignSideFunctionsStruct_setup'))
TestAPI_CommonInterface__TestAsyncFunctionsConverter_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_CommonInterface__TestAsyncFunctionsConverter_setup'))
TestAPI_TestAsyncSwiftSideFunctionsClass_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_TestAsyncSwiftSideFunctionsClass_setup'))
TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_setup'))
TestAPI_TestDefaultComputedPropertiesClass_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_TestDefaultComputedPropertiesClass_setup'))
TestAPI_TestDefaultComputedPropertiesEnum_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], int],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_TestDefaultComputedPropertiesEnum_setup'))
TestAPI_TestDefaultComputedPropertiesStruct_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_TestDefaultComputedPropertiesStruct_setup'))
TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_setup'))
TestAPI_TestDifferingExportNameStruct_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_TestDifferingExportNameStruct_setup'))
TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_setup'))
TestAPI_TestLeadingUnderscoredPropStruct_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_TestLeadingUnderscoredPropStruct_setup'))
TestAPI_CommonInterface__TestMethodsProtocolConverter_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_CommonInterface__TestMethodsProtocolConverter_setup'))
TestAPI_TestNonExportedProtocolEnum_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], int],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_TestNonExportedProtocolEnum_setup'))
TestAPI_CommonInterface__TestOptionalsProtocolConverter_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_CommonInterface__TestOptionalsProtocolConverter_setup'))
TestAPI_CommonInterface__TestPropertiesProtocolConverter_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_CommonInterface__TestPropertiesProtocolConverter_setup'))
TestAPI_TestProtocolClass_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_TestProtocolClass_setup'))
TestAPI_TestProtocolEnum_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], int],
    typing.Callable[[fishyjoes_runtime.OutCreatedRef], fishyjoes_runtime.CreatedRef],
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], None],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_TestProtocolEnum_setup'))
TestAPI_TestProtocolStruct_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_TestProtocolStruct_setup'))
TestAPI_Tree_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Tree_setup'))
TestAPI_Tuples_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_Tuples_setup'))
TestAPI_URLs_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_URLs_setup'))

@fishyjoes_runtime.lazy_once("testapi_setup")
def ensure_loaded() -> None:
    fishyjoes_runtime.fishyjoes_type_setup.ensure_loaded()

    getattr(_testapi_lib, 'FishyJoes_TestAPI_registerTypes')()
    with fishyjoes_runtime.CStringBag() as string_bag:

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, FutureConverter<Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_Function2Converter_AsyncFunction1Converter_Swift_Int__Swift_Int___AsyncFunction1Converter_Swift_Int__Swift_Int___AsyncFunction1Converter_Swift_Int__Swift_Int____FutureConverter_Swift_String__() -> None:
            print(f"setting up (@escaping (@escaping (Swift.Int) async throws -> Swift.Int, @escaping (Swift.Int) async throws -> Swift.Int) throws -> (Swift.Int) async throws -> Swift.Int) throws -> Future<Swift.String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, FutureConverter<Swift.String>>"),
                ("Callable",),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction1Converter_Function2Converter_AsyncFunction1Converter_Swift_Int__Swift_Int___AsyncFunction1Converter_Swift_Int__Swift_Int___AsyncFunction1Converter_Swift_Int__Swift_Int____Swift_String_() -> None:
            print(f"setting up (@escaping (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int) async throws -> String")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, FutureConverter<Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_AsyncFunction3Converter_Swift_Float__Swift_Double__Swift_Int__Swift_Double___FutureConverter_Swift_String__() -> None:
            print(f"setting up (@escaping (Swift.Float, Swift.Double, Swift.Int) async throws -> Swift.Double) throws -> Future<Swift.String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, FutureConverter<Swift.String>>"),
                ("Callable",),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function2Converter_Function1Converter_Swift_Int__Swift_Int___Function1Converter_Swift_Int__Swift_Int___Function1Converter_Swift_Int__Swift_Int__() -> None:
            print(f"setting up (@escaping (Swift.Int) throws -> Swift.Int, @escaping (Swift.Int) throws -> Swift.Int) throws -> (Swift.Int) throws -> Swift.Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function2Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>"),
                ("Callable",),
                ("Callable",),
                ("Callable",),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function2Converter_AsyncFunction1Converter_Swift_Int__Swift_Int___AsyncFunction1Converter_Swift_Int__Swift_Int___AsyncFunction1Converter_Swift_Int__Swift_Int__() -> None:
            print(f"setting up (@escaping (Swift.Int) async throws -> Swift.Int, @escaping (Swift.Int) async throws -> Swift.Int) throws -> (Swift.Int) async throws -> Swift.Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function2Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>"),
                ("Callable",),
                ("Callable",),
                ("Callable",),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, FutureConverter<Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_AsyncFunction1Converter_Swift_Int__Swift_Int___FutureConverter_Swift_String__() -> None:
            print(f"setting up (@escaping (Swift.Int) async throws -> Swift.Int) throws -> Future<Swift.String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, FutureConverter<Swift.String>>"),
                ("Callable",),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, FutureConverter<Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_AsyncFunction6Converter_Swift_String__Swift_Int__Swift_Double__Swift_String__AsyncFunction0Converter_Swift_Int___Swift_Int__Swift_Int___FutureConverter_Swift_String__() -> None:
            print(f"setting up (@escaping (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int, Swift.Int) async throws -> Swift.Int) throws -> Future<Swift.String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, FutureConverter<Swift.String>>"),
                ("Callable",),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, FutureConverter<Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_AsyncFunction5Converter_Swift_String__Swift_Int__Swift_Double__Swift_String__AsyncFunction0Converter_Swift_Int___AsyncFunction0Converter_Swift_Int____FutureConverter_Swift_String__() -> None:
            print(f"setting up (@escaping (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int) async throws -> () async throws -> Swift.Int) throws -> Future<Swift.String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, FutureConverter<Swift.String>>"),
                ("Callable",),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, FutureConverter<Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_AsyncFunction4Converter_Swift_String__Swift_String__Swift_String__Swift_String__ArrayConverter_Swift_String____FutureConverter_Swift_String__() -> None:
            print(f"setting up (@escaping (Swift.String, Swift.String, Swift.String, Swift.String) async throws -> Array<Swift.String>) throws -> Future<Swift.String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, FutureConverter<Swift.String>>"),
                ("Callable",),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction1Converter_AsyncFunction3Converter_Swift_Float__Swift_Double__Swift_Int__Swift_Double___Swift_String_() -> None:
            print(f"setting up (@escaping (Float, Double, Int) async throws -> Double) async throws -> String")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function2Converter_Function1Converter_Swift_Int__Swift_Int___Function1Converter_Swift_Int__Swift_Int___Function1Converter_Swift_Int__Swift_Int__() -> None:
            print(f"setting up (@escaping (Int) throws -> Int, @escaping (Int) throws -> Int) throws -> (Int) throws -> Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function2Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>"),
                ("Callable",),
                ("Callable",),
                ("Callable",),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function2Converter_AsyncFunction1Converter_Swift_Int__Swift_Int___AsyncFunction1Converter_Swift_Int__Swift_Int___AsyncFunction1Converter_Swift_Int__Swift_Int__() -> None:
            print(f"setting up (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function2Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>"),
                ("Callable",),
                ("Callable",),
                ("Callable",),
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction1Converter_AsyncFunction1Converter_Swift_Int__Swift_Int___Swift_String_() -> None:
            print(f"setting up (@escaping (Int) async throws -> Int) async throws -> String")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction1Converter_AsyncFunction6Converter_Swift_String__Swift_Int__Swift_Double__Swift_String__AsyncFunction0Converter_Swift_Int___Swift_Int__Swift_Int___Swift_String_() -> None:
            print(f"setting up (@escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) async throws -> String")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction1Converter_AsyncFunction5Converter_Swift_String__Swift_Int__Swift_Double__Swift_String__AsyncFunction0Converter_Swift_Int___AsyncFunction0Converter_Swift_Int____Swift_String_() -> None:
            print(f"setting up (@escaping (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int) async throws -> String")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction1Converter_AsyncFunction4Converter_Swift_String__Swift_String__Swift_String__Swift_String__ArrayConverter_Swift_String____Swift_String_() -> None:
            print(f"setting up (@escaping (String, String, String, String) async throws -> Array<String>) async throws -> String")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction0Converter<Swift.Int>, FutureConverter<Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_AsyncFunction0Converter_Swift_Int___FutureConverter_Swift_String__() -> None:
            print(f"setting up (@escaping () async throws -> Swift.Int) throws -> Future<Swift.String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<AsyncFunction0Converter<Swift.Int>, FutureConverter<Swift.String>>"),
                ("Callable",),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction1Converter_AsyncFunction0Converter_Swift_Int___Swift_String_() -> None:
            print(f"setting up (@escaping () async throws -> Int) async throws -> String")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_AsyncFunction0Converter_FishyJoesCommonRuntime_VoidConverter___AsyncFunction0Converter_FishyJoesCommonRuntime_VoidConverter__() -> None:
            print(f"setting up (@escaping () async throws -> Void) throws -> () async throws -> Void")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>"),
                ("Callable",),
                ("Callable",),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_OptionalConverter_ArrayConverter_OptionalConverter_Swift_Int_____OptionalConverter_ArrayConverter_OptionalConverter_Swift_Int____() -> None:
            print(f"setting up (Optional<Array<Optional<Swift.Int>>>) throws -> Optional<Array<Optional<Swift.Int>>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>"),
                (list, types.NoneType),
                (list, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_OptionalConverter_ArrayConverter_OptionalConverter_Swift_Int_____OptionalConverter_ArrayConverter_OptionalConverter_Swift_Int____() -> None:
            print(f"setting up (Optional<Array<Optional<Int>>>) throws -> Optional<Array<Optional<Int>>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>"),
                (list, types.NoneType),
                (list, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_OptionalConverter_Swift_UInt8___OptionalConverter_Swift_UInt8__() -> None:
            print(f"setting up (Optional<Swift.UInt8>) throws -> Optional<Swift.UInt8>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>"),
                (int, types.NoneType),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_OptionalConverter_Swift_UInt8___OptionalConverter_Swift_UInt8__() -> None:
            print(f"setting up (Optional<UInt8>) throws -> Optional<UInt8>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>"),
                (int, types.NoneType),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, FutureConverter<Swift.Double>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function3Converter_Swift_Float__Swift_Double__Swift_Int__FutureConverter_Swift_Double__() -> None:
            print(f"setting up (Swift.Float, Swift.Double, Swift.Int) throws -> Future<Swift.Double>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function3Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function3Converter<Swift.Float, Swift.Double, Swift.Int, FutureConverter<Swift.Double>>"),
                (float,),
                (float,),
                (int,),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>') # type: ignore[unused-ignore,no-redef]
        def setup_Function3Converter_Swift_Float__Swift_Double__Swift_Int__Swift_Double_() -> None:
            print(f"setting up (Swift.Float, Swift.Double, Swift.Int) throws -> Swift.Double")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function3Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>"),
                (float,),
                (float,),
                (int,),
                (float,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function3Converter<Swift.Int, Foundation.Data, Swift.Bool, FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function3Converter_Swift_Int__Foundation_Data__Swift_Bool__FutureConverter_ResultConverter_Swift_Int__TestAPI_Methods_TheMethodError___() -> None:
            print(f"setting up (Swift.Int, Foundation.Data, Swift.Bool) throws -> Future<Result<Swift.Int, TestAPI.Methods.TheMethodError>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function3Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function3Converter<Swift.Int, Foundation.Data, Swift.Bool, FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>"),
                (int,),
                (bytes,),
                (bool,),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<Swift.Int, FutureConverter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_Swift_Int__FutureConverter_Swift_Int__() -> None:
            print(f"setting up (Swift.Int) throws -> Future<Swift.Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<Swift.Int, FutureConverter<Swift.Int>>"),
                (int,),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<Swift.Int, Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_Swift_Int__Swift_Int_() -> None:
            print(f"setting up (Swift.Int) throws -> Swift.Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<Swift.Int, Swift.Int>"),
                (int,),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_Function6Converter_Swift_String__Swift_Int__Swift_Double__Swift_String__Function0Converter_Swift_Int___Swift_Int__Swift_Int_() -> None:
            print(f"setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () throws -> Swift.Int, Swift.Int) throws -> Swift.Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function6Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>"),
                (str,),
                (int,),
                (float,),
                (str,),
                ("Callable",),
                (int,),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function5Converter_Swift_String__Swift_Int__Swift_Double__Swift_String__Function0Converter_Swift_Int___Function0Converter_Swift_Int__() -> None:
            print(f"setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () throws -> Swift.Int) throws -> () throws -> Swift.Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function5Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>"),
                (str,),
                (int,),
                (float,),
                (str,),
                ("Callable",),
                ("Callable",),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, FutureConverter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function6Converter_Swift_String__Swift_Int__Swift_Double__Swift_String__AsyncFunction0Converter_Swift_Int___Swift_Int__FutureConverter_Swift_Int__() -> None:
            print(f"setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int, Swift.Int) throws -> Future<Swift.Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function6Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, FutureConverter<Swift.Int>>"),
                (str,),
                (int,),
                (float,),
                (str,),
                ("Callable",),
                (int,),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, FutureConverter<AsyncFunction0Converter<Swift.Int>>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function5Converter_Swift_String__Swift_Int__Swift_Double__Swift_String__AsyncFunction0Converter_Swift_Int___FutureConverter_AsyncFunction0Converter_Swift_Int___() -> None:
            print(f"setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int) throws -> Future<() async throws -> Swift.Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function5Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, FutureConverter<AsyncFunction0Converter<Swift.Int>>>"),
                (str,),
                (int,),
                (float,),
                (str,),
                ("Callable",),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, FutureConverter<ArrayConverter<Swift.String>>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function4Converter_Swift_String__Swift_String__Swift_String__Swift_String__FutureConverter_ArrayConverter_Swift_String___() -> None:
            print(f"setting up (Swift.String, Swift.String, Swift.String, Swift.String) throws -> Future<Array<Swift.String>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function4Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, FutureConverter<ArrayConverter<Swift.String>>>"),
                (str,),
                (str,),
                (str,),
                (str,),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function4Converter_Swift_String__Swift_String__Swift_String__Swift_String__ArrayConverter_Swift_String__() -> None:
            print(f"setting up (Swift.String, Swift.String, Swift.String, Swift.String) throws -> Array<Swift.String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function4Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>"),
                (str,),
                (str,),
                (str,),
                (str,),
                (list,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>') # type: ignore[unused-ignore,no-redef]
        def setup_Function3Converter_Swift_Float__Swift_Double__Swift_Int__Swift_Double_() -> None:
            print(f"setting up (Float, Double, Int) throws -> Double")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function3Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>"),
                (float,),
                (float,),
                (int,),
                (float,),
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction3Converter_Swift_Float__Swift_Double__Swift_Int__Swift_Double_() -> None:
            print(f"setting up (Float, Double, Int) async throws -> Double")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction3Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction3Converter<Swift.Int, Foundation.Data, Swift.Bool, ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction3Converter_Swift_Int__Foundation_Data__Swift_Bool__ResultConverter_Swift_Int__TestAPI_Methods_TheMethodError__() -> None:
            print(f"setting up (Int, Data, Bool) async throws -> Result<Int, Methods.TheMethodError>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction3Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_Function1Converter<Swift.Int, Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_Function1Converter_Swift_Int__Swift_Int_() -> None:
            print(f"setting up (Int) throws -> Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function1Converter<Swift.Int, Swift.Int>"),
                (int,),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<Swift.Int, Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction1Converter_Swift_Int__Swift_Int_() -> None:
            print(f"setting up (Int) async throws -> Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_Function6Converter_Swift_String__Swift_Int__Swift_Double__Swift_String__Function0Converter_Swift_Int___Swift_Int__Swift_Int_() -> None:
            print(f"setting up (String, Int, Double, String, @escaping () throws -> Int, Int) throws -> Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function6Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>"),
                (str,),
                (int,),
                (float,),
                (str,),
                ("Callable",),
                (int,),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function5Converter_Swift_String__Swift_Int__Swift_Double__Swift_String__Function0Converter_Swift_Int___Function0Converter_Swift_Int__() -> None:
            print(f"setting up (String, Int, Double, String, @escaping () throws -> Int) throws -> () throws -> Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function5Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>"),
                (str,),
                (int,),
                (float,),
                (str,),
                ("Callable",),
                ("Callable",),
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction6Converter_Swift_String__Swift_Int__Swift_Double__Swift_String__AsyncFunction0Converter_Swift_Int___Swift_Int__Swift_Int_() -> None:
            print(f"setting up (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction6Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction5Converter_Swift_String__Swift_Int__Swift_Double__Swift_String__AsyncFunction0Converter_Swift_Int___AsyncFunction0Converter_Swift_Int__() -> None:
            print(f"setting up (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction5Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function4Converter_Swift_String__Swift_String__Swift_String__Swift_String__ArrayConverter_Swift_String__() -> None:
            print(f"setting up (String, String, String, String) throws -> Array<String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function4Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>"),
                (str,),
                (str,),
                (str,),
                (str,),
                (list,),
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction4Converter_Swift_String__Swift_String__Swift_String__Swift_String__ArrayConverter_Swift_String__() -> None:
            print(f"setting up (String, String, String, String) async throws -> Array<String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction4Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_Function0Converter<FutureConverter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function0Converter_FutureConverter_Swift_Int__() -> None:
            print(f"setting up () throws -> Future<Swift.Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function0Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function0Converter<FutureConverter<Swift.Int>>"),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function0Converter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>') # type: ignore[unused-ignore,no-redef]
        def setup_Function0Converter_FutureConverter_FishyJoesCommonRuntime_VoidConverter__() -> None:
            print(f"setting up () throws -> Future<Void>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function0Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function0Converter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>"),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function0Converter<Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_Function0Converter_Swift_Int_() -> None:
            print(f"setting up () throws -> Swift.Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function0Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function0Converter<Swift.Int>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Function0Converter<Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_Function0Converter_Swift_Int_() -> None:
            print(f"setting up () throws -> Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function0Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function0Converter<Swift.Int>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction0Converter<Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction0Converter_Swift_Int_() -> None:
            print(f"setting up () async throws -> Int")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction0Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_Function0Converter<FishyJoesCommonRuntime.VoidConverter>') # type: ignore[unused-ignore,no-redef]
        def setup_Function0Converter_FishyJoesCommonRuntime_VoidConverter_() -> None:
            print(f"setting up () throws -> Void")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Function0Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Function0Converter<FishyJoesCommonRuntime.VoidConverter>"),
                (types.NoneType,),
            )

        @fishyjoes_runtime.eval_once_now('setup_AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>') # type: ignore[unused-ignore,no-redef]
        def setup_AsyncFunction0Converter_FishyJoesCommonRuntime_VoidConverter_() -> None:
            print(f"setting up () async throws -> Void")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_AsyncFunction0Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<Function1Converter<Swift.Int, Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_Function1Converter_Swift_Int__Swift_Int__() -> None:
            print(f"setting up Future<(Swift.Int) throws -> Swift.Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<Function1Converter<Swift.Int, Swift.Int>>"),
                ("Callable",),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<AsyncFunction1Converter<Swift.Int, Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_AsyncFunction1Converter_Swift_Int__Swift_Int__() -> None:
            print(f"setting up Future<(Swift.Int) async throws -> Swift.Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<AsyncFunction1Converter<Swift.Int, Swift.Int>>"),
                ("Callable",),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<Function0Converter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_Function0Converter_Swift_Int__() -> None:
            print(f"setting up Future<() throws -> Swift.Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<Function0Converter<Swift.Int>>"),
                ("Callable",),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<AsyncFunction0Converter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_AsyncFunction0Converter_Swift_Int__() -> None:
            print(f"setting up Future<() async throws -> Swift.Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<AsyncFunction0Converter<Swift.Int>>"),
                ("Callable",),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_AsyncFunction0Converter_FishyJoesCommonRuntime_VoidConverter__() -> None:
            print(f"setting up Future<() async throws -> Void>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>"),
                ("Callable",),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<AsyncFunction0Converter<Swift.Int>>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_FutureConverter_AsyncFunction0Converter_Swift_Int___() -> None:
            print(f"setting up Future<Future<() async throws -> Swift.Int>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<FutureConverter<AsyncFunction0Converter<Swift.Int>>>"),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<ArrayConverter<Swift.String>>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_FutureConverter_ArrayConverter_Swift_String___() -> None:
            print(f"setting up Future<Future<Array<Swift.String>>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<FutureConverter<ArrayConverter<Swift.String>>>"),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_FutureConverter_ResultConverter_Swift_Int__TestAPI_Methods_TheMethodError___() -> None:
            print(f"setting up Future<Future<Result<Swift.Int, TestAPI.Methods.TheMethodError>>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>"),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<Swift.Double>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_FutureConverter_Swift_Double__() -> None:
            print(f"setting up Future<Future<Swift.Double>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<FutureConverter<Swift.Double>>"),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_FutureConverter_Swift_Int__() -> None:
            print(f"setting up Future<Future<Swift.Int>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<FutureConverter<Swift.Int>>"),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_FutureConverter_Swift_String__() -> None:
            print(f"setting up Future<Future<Swift.String>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<FutureConverter<Swift.String>>"),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_FutureConverter_FishyJoesCommonRuntime_VoidConverter__() -> None:
            print(f"setting up Future<Future<Void>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>"),
                (fishyjoes_runtime.Future,),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<ArrayConverter<Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_ArrayConverter_Swift_String__() -> None:
            print(f"setting up Future<Array<Swift.String>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<ArrayConverter<Swift.String>>"),
                (list,),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_OptionalConverter_ArrayConverter_OptionalConverter_Swift_Int____() -> None:
            print(f"setting up Future<Optional<Array<Optional<Swift.Int>>>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>"),
                (list, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<OptionalConverter<Swift.UInt8>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_OptionalConverter_Swift_UInt8__() -> None:
            print(f"setting up Future<Optional<Swift.UInt8>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<OptionalConverter<Swift.UInt8>>"),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_ResultConverter_Swift_Int__TestAPI_Methods_TheMethodError__() -> None:
            print(f"setting up Future<Result<Swift.Int, TestAPI.Methods.TheMethodError>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>"),
                (fishyjoes_runtime.ResultSuccess, fishyjoes_runtime.ResultFailure),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<Swift.Double>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_Swift_Double_() -> None:
            print(f"setting up Future<Swift.Double>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<Swift.Double>"),
                (float,),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_Swift_Int_() -> None:
            print(f"setting up Future<Swift.Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<Swift.Int>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_Swift_String_() -> None:
            print(f"setting up Future<Swift.String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<Swift.String>"),
                (str,),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<Swift.UInt>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_Swift_UInt_() -> None:
            print(f"setting up Future<Swift.UInt>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<Swift.UInt>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FishyJoesCommonRuntime.VoidConverter>') # type: ignore[unused-ignore,no-redef]
        def setup_FutureConverter_FishyJoesCommonRuntime_VoidConverter_() -> None:
            print(f"setting up Future<Void>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("FutureConverter<FishyJoesCommonRuntime.VoidConverter>"),
                (types.NoneType,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Bool>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_OptionalConverter_Swift_Bool__() -> None:
            print(f"setting up Array<Optional<Bool>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<OptionalConverter<Swift.Bool>>"),
                (bool, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Double>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_OptionalConverter_Swift_Double__() -> None:
            print(f"setting up Array<Optional<Double>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<OptionalConverter<Swift.Double>>"),
                (float, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Float>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_OptionalConverter_Swift_Float__() -> None:
            print(f"setting up Array<Optional<Float>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<OptionalConverter<Swift.Float>>"),
                (float, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_OptionalConverter_Swift_Int__() -> None:
            print(f"setting up Array<Optional<Int>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<OptionalConverter<Swift.Int>>"),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Int16>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_OptionalConverter_Swift_Int16__() -> None:
            print(f"setting up Array<Optional<Int16>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<OptionalConverter<Swift.Int16>>"),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Int32>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_OptionalConverter_Swift_Int32__() -> None:
            print(f"setting up Array<Optional<Int32>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<OptionalConverter<Swift.Int32>>"),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Int64>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_OptionalConverter_Swift_Int64__() -> None:
            print(f"setting up Array<Optional<Int64>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<OptionalConverter<Swift.Int64>>"),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Int8>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_OptionalConverter_Swift_Int8__() -> None:
            print(f"setting up Array<Optional<Int8>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<OptionalConverter<Swift.Int8>>"),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.UInt>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_OptionalConverter_Swift_UInt__() -> None:
            print(f"setting up Array<Optional<UInt>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<OptionalConverter<Swift.UInt>>"),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.UInt16>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_OptionalConverter_Swift_UInt16__() -> None:
            print(f"setting up Array<Optional<UInt16>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<OptionalConverter<Swift.UInt16>>"),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.UInt32>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_OptionalConverter_Swift_UInt32__() -> None:
            print(f"setting up Array<Optional<UInt32>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<OptionalConverter<Swift.UInt32>>"),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.UInt64>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_OptionalConverter_Swift_UInt64__() -> None:
            print(f"setting up Array<Optional<UInt64>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<OptionalConverter<Swift.UInt64>>"),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.UInt8>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_OptionalConverter_Swift_UInt8__() -> None:
            print(f"setting up Array<Optional<UInt8>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<OptionalConverter<Swift.UInt8>>"),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Bool>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_Bool_() -> None:
            print(f"setting up Array<Bool>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.Bool>"),
                (bool,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Double>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_Double_() -> None:
            print(f"setting up Array<Double>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.Double>"),
                (float,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Float>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_Float_() -> None:
            print(f"setting up Array<Float>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.Float>"),
                (float,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_Int_() -> None:
            print(f"setting up Array<Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.Int>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Int16>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_Int16_() -> None:
            print(f"setting up Array<Int16>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.Int16>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Int32>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_Int32_() -> None:
            print(f"setting up Array<Int32>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.Int32>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Int64>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_Int64_() -> None:
            print(f"setting up Array<Int64>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.Int64>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Int8>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_Int8_() -> None:
            print(f"setting up Array<Int8>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.Int8>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<TestAPI.Shade>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_TestAPI_Shade_() -> None:
            print(f"setting up Array<Shade>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<TestAPI.Shade>"),
                (testapi.Shade,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_String_() -> None:
            print(f"setting up Array<String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.String>"),
                (str,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<TestAPI.Tree>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_TestAPI_Tree_() -> None:
            print(f"setting up Array<Tree>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<TestAPI.Tree>"),
                (testapi.Tree,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.UInt>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_UInt_() -> None:
            print(f"setting up Array<UInt>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.UInt>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.UInt16>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_UInt16_() -> None:
            print(f"setting up Array<UInt16>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.UInt16>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.UInt32>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_UInt32_() -> None:
            print(f"setting up Array<UInt32>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.UInt32>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.UInt64>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_UInt64_() -> None:
            print(f"setting up Array<UInt64>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.UInt64>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.UInt8>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Swift_UInt8_() -> None:
            print(f"setting up Array<UInt8>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Swift.UInt8>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>>') # type: ignore[unused-ignore,no-redef]
        def setup_ArrayConverter_Tuple4Converter_Swift_Int8__Swift_Int16__Swift_Int32__Swift_Int64__() -> None:
            print(f"setting up Array<(Int8, Int16, Int32, Int64)>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ArrayConverter<Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>>"),
                (tuple,),
            )

        @fishyjoes_runtime.eval_once_now('setup_DictionaryConverter<Swift.Bool, Swift.Bool>') # type: ignore[unused-ignore,no-redef]
        def setup_DictionaryConverter_Swift_Bool__Swift_Bool_() -> None:
            print(f"setting up Dictionary<Bool, Bool>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_DictionaryConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("DictionaryConverter<Swift.Bool, Swift.Bool>"),
                (bool,),
                (bool,),
            )

        @fishyjoes_runtime.eval_once_now('setup_DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_DictionaryConverter_Swift_Int__OptionalConverter_Swift_Int__() -> None:
            print(f"setting up Dictionary<Int, Optional<Int>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_DictionaryConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>"),
                (int,),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_DictionaryConverter<Swift.Int, Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_DictionaryConverter_Swift_Int__Swift_Int_() -> None:
            print(f"setting up Dictionary<Int, Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_DictionaryConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("DictionaryConverter<Swift.Int, Swift.Int>"),
                (int,),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_DictionaryConverter<Swift.String, Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_DictionaryConverter_Swift_String__Swift_String_() -> None:
            print(f"setting up Dictionary<String, String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_DictionaryConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("DictionaryConverter<Swift.String, Swift.String>"),
                (str,),
                (str,),
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_ArrayConverter_OptionalConverter_Swift_Int___() -> None:
            print(f"setting up Optional<Array<Optional<Int>>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<ArrayConverter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_ArrayConverter_Swift_Int__() -> None:
            print(f"setting up Optional<Array<Int>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_DictionaryConverter_Swift_Int__OptionalConverter_Swift_Int___() -> None:
            print(f"setting up Optional<Dictionary<Int, Optional<Int>>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<DictionaryConverter<Swift.Int, Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_DictionaryConverter_Swift_Int__Swift_Int__() -> None:
            print(f"setting up Optional<Dictionary<Int, Int>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<SetConverter<OptionalConverter<Swift.Int>>>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_SetConverter_OptionalConverter_Swift_Int___() -> None:
            print(f"setting up Optional<Set<Optional<Int>>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<SetConverter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_SetConverter_Swift_Int__() -> None:
            print(f"setting up Optional<Set<Int>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Bool>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_Bool_() -> None:
            print(f"setting up Optional<Bool>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Double>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_Double_() -> None:
            print(f"setting up Optional<Double>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Float>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_Float_() -> None:
            print(f"setting up Optional<Float>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_Int_() -> None:
            print(f"setting up Optional<Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Int16>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_Int16_() -> None:
            print(f"setting up Optional<Int16>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Int32>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_Int32_() -> None:
            print(f"setting up Optional<Int32>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Int64>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_Int64_() -> None:
            print(f"setting up Optional<Int64>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Int8>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_Int8_() -> None:
            print(f"setting up Optional<Int8>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<TestAPI.Shade>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_TestAPI_Shade_() -> None:
            print(f"setting up Optional<Shade>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<TestAPI.SimpleEnum>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_TestAPI_SimpleEnum_() -> None:
            print(f"setting up Optional<SimpleEnum>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_String_() -> None:
            print(f"setting up Optional<String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.UInt>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_UInt_() -> None:
            print(f"setting up Optional<UInt>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.UInt16>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_UInt16_() -> None:
            print(f"setting up Optional<UInt16>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.UInt32>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_UInt32_() -> None:
            print(f"setting up Optional<UInt32>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.UInt64>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_UInt64_() -> None:
            print(f"setting up Optional<UInt64>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.UInt8>') # type: ignore[unused-ignore,no-redef]
        def setup_OptionalConverter_Swift_UInt8_() -> None:
            print(f"setting up Optional<UInt8>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Double>') # type: ignore[unused-ignore,no-redef]
        def setup_ClosedRangeConverter_Swift_Double_() -> None:
            print(f"setting up ClosedRange<Double>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ClosedRangeConverter<Swift.Double>"),
                (float,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Float>') # type: ignore[unused-ignore,no-redef]
        def setup_ClosedRangeConverter_Swift_Float_() -> None:
            print(f"setting up ClosedRange<Float>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ClosedRangeConverter<Swift.Float>"),
                (float,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_ClosedRangeConverter_Swift_Int_() -> None:
            print(f"setting up ClosedRange<Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ClosedRangeConverter<Swift.Int>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Int16>') # type: ignore[unused-ignore,no-redef]
        def setup_ClosedRangeConverter_Swift_Int16_() -> None:
            print(f"setting up ClosedRange<Int16>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ClosedRangeConverter<Swift.Int16>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Int32>') # type: ignore[unused-ignore,no-redef]
        def setup_ClosedRangeConverter_Swift_Int32_() -> None:
            print(f"setting up ClosedRange<Int32>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ClosedRangeConverter<Swift.Int32>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Int64>') # type: ignore[unused-ignore,no-redef]
        def setup_ClosedRangeConverter_Swift_Int64_() -> None:
            print(f"setting up ClosedRange<Int64>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ClosedRangeConverter<Swift.Int64>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Int8>') # type: ignore[unused-ignore,no-redef]
        def setup_ClosedRangeConverter_Swift_Int8_() -> None:
            print(f"setting up ClosedRange<Int8>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ClosedRangeConverter<Swift.Int8>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_ClosedRangeConverter_Swift_String_() -> None:
            print(f"setting up ClosedRange<String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ClosedRangeConverter<Swift.String>"),
                (str,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.UInt>') # type: ignore[unused-ignore,no-redef]
        def setup_ClosedRangeConverter_Swift_UInt_() -> None:
            print(f"setting up ClosedRange<UInt>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ClosedRangeConverter<Swift.UInt>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.UInt16>') # type: ignore[unused-ignore,no-redef]
        def setup_ClosedRangeConverter_Swift_UInt16_() -> None:
            print(f"setting up ClosedRange<UInt16>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ClosedRangeConverter<Swift.UInt16>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.UInt32>') # type: ignore[unused-ignore,no-redef]
        def setup_ClosedRangeConverter_Swift_UInt32_() -> None:
            print(f"setting up ClosedRange<UInt32>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ClosedRangeConverter<Swift.UInt32>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.UInt64>') # type: ignore[unused-ignore,no-redef]
        def setup_ClosedRangeConverter_Swift_UInt64_() -> None:
            print(f"setting up ClosedRange<UInt64>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ClosedRangeConverter<Swift.UInt64>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.UInt8>') # type: ignore[unused-ignore,no-redef]
        def setup_ClosedRangeConverter_Swift_UInt8_() -> None:
            print(f"setting up ClosedRange<UInt8>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ClosedRangeConverter<Swift.UInt8>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_RangeConverter_Swift_Int_() -> None:
            print(f"setting up Range<Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("RangeConverter<Swift.Int>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.Int16>') # type: ignore[unused-ignore,no-redef]
        def setup_RangeConverter_Swift_Int16_() -> None:
            print(f"setting up Range<Int16>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("RangeConverter<Swift.Int16>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.Int32>') # type: ignore[unused-ignore,no-redef]
        def setup_RangeConverter_Swift_Int32_() -> None:
            print(f"setting up Range<Int32>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("RangeConverter<Swift.Int32>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.Int64>') # type: ignore[unused-ignore,no-redef]
        def setup_RangeConverter_Swift_Int64_() -> None:
            print(f"setting up Range<Int64>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("RangeConverter<Swift.Int64>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.Int8>') # type: ignore[unused-ignore,no-redef]
        def setup_RangeConverter_Swift_Int8_() -> None:
            print(f"setting up Range<Int8>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("RangeConverter<Swift.Int8>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.UInt>') # type: ignore[unused-ignore,no-redef]
        def setup_RangeConverter_Swift_UInt_() -> None:
            print(f"setting up Range<UInt>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("RangeConverter<Swift.UInt>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.UInt16>') # type: ignore[unused-ignore,no-redef]
        def setup_RangeConverter_Swift_UInt16_() -> None:
            print(f"setting up Range<UInt16>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("RangeConverter<Swift.UInt16>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.UInt32>') # type: ignore[unused-ignore,no-redef]
        def setup_RangeConverter_Swift_UInt32_() -> None:
            print(f"setting up Range<UInt32>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("RangeConverter<Swift.UInt32>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.UInt64>') # type: ignore[unused-ignore,no-redef]
        def setup_RangeConverter_Swift_UInt64_() -> None:
            print(f"setting up Range<UInt64>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("RangeConverter<Swift.UInt64>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.UInt8>') # type: ignore[unused-ignore,no-redef]
        def setup_RangeConverter_Swift_UInt8_() -> None:
            print(f"setting up Range<UInt8>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("RangeConverter<Swift.UInt8>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>') # type: ignore[unused-ignore,no-redef]
        def setup_ResultConverter_Swift_Int__TestAPI_Methods_TheMethodError_() -> None:
            print(f"setting up Result<Int, Methods.TheMethodError>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ResultConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>"),
                (int,),
                (testapi.TheMethodError,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ResultConverter<Swift.Int, TestAPI.Results.Error>') # type: ignore[unused-ignore,no-redef]
        def setup_ResultConverter_Swift_Int__TestAPI_Results_Error_() -> None:
            print(f"setting up Result<Int, Results.Error>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ResultConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ResultConverter<Swift.Int, TestAPI.Results.Error>"),
                (int,),
                (testapi.results.Error,),
            )

        @fishyjoes_runtime.eval_once_now('setup_ResultConverter<Swift.String, TestAPI.Results.Error>') # type: ignore[unused-ignore,no-redef]
        def setup_ResultConverter_Swift_String__TestAPI_Results_Error_() -> None:
            print(f"setting up Result<String, Results.Error>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_ResultConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("ResultConverter<Swift.String, TestAPI.Results.Error>"),
                (str,),
                (testapi.results.Error,),
            )

        @fishyjoes_runtime.eval_once_now('setup_SetConverter<OptionalConverter<Swift.Int>>') # type: ignore[unused-ignore,no-redef]
        def setup_SetConverter_OptionalConverter_Swift_Int__() -> None:
            print(f"setting up Set<Optional<Int>>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_SetConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("SetConverter<OptionalConverter<Swift.Int>>"),
                (int, types.NoneType),
            )

        @fishyjoes_runtime.eval_once_now('setup_SetConverter<Swift.Bool>') # type: ignore[unused-ignore,no-redef]
        def setup_SetConverter_Swift_Bool_() -> None:
            print(f"setting up Set<Bool>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_SetConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("SetConverter<Swift.Bool>"),
                (bool,),
            )

        @fishyjoes_runtime.eval_once_now('setup_SetConverter<Swift.Int>') # type: ignore[unused-ignore,no-redef]
        def setup_SetConverter_Swift_Int_() -> None:
            print(f"setting up Set<Int>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_SetConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("SetConverter<Swift.Int>"),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_SetConverter<Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_SetConverter_Swift_String_() -> None:
            print(f"setting up Set<String>")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_SetConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("SetConverter<Swift.String>"),
                (str,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces') # type: ignore[unused-ignore,no-redef]
        def setup_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces() -> None:
            print(f"setting up Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces")
            testapi.fishyjoes_type_setup.Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_Swift.String.PuttingTypesIntoQuestionablePlaces') # type: ignore[unused-ignore,no-redef]
        def setup_Swift_String_PuttingTypesIntoQuestionablePlaces() -> None:
            print(f"setting up Swift.String.PuttingTypesIntoQuestionablePlaces")
            testapi.fishyjoes_type_setup.Swift_String_PuttingTypesIntoQuestionablePlaces_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces') # type: ignore[unused-ignore,no-redef]
        def setup_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces() -> None:
            print(f"setting up Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces")
            testapi.fishyjoes_type_setup.Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_impl.enum_discriminator,
                _testapi_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_impl.new_thing,
                _testapi_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_impl.extract_thing,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Actors.TemperatureLogger') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Actors_TemperatureLogger() -> None:
            print(f"setting up TestAPI.Actors.TemperatureLogger")
            testapi.fishyjoes_type_setup.TestAPI_Actors_TemperatureLogger_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_actors_TemperatureLogger_impl.ffi_new,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Collections.CollectionHolder') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Collections_CollectionHolder() -> None:
            print(f"setting up TestAPI.Collections.CollectionHolder")
            testapi.fishyjoes_type_setup.TestAPI_Collections_CollectionHolder_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Methods.TheMethodError') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Methods_TheMethodError() -> None:
            print(f"setting up TestAPI.Methods.TheMethodError")
            testapi.fishyjoes_type_setup.TestAPI_Methods_TheMethodError_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_TheMethodError_impl.ffi_new,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Primitives.PrimitiveHolder') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Primitives_PrimitiveHolder() -> None:
            print(f"setting up TestAPI.Primitives.PrimitiveHolder")
            testapi.fishyjoes_type_setup.TestAPI_Primitives_PrimitiveHolder_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.ReferenceOnlyTypes.Marker') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_ReferenceOnlyTypes_Marker() -> None:
            print(f"setting up TestAPI.ReferenceOnlyTypes.Marker")
            testapi.fishyjoes_type_setup.TestAPI_ReferenceOnlyTypes_Marker_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_reference_only_types_Marker_impl.ffi_new,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Results.Error') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Results_Error() -> None:
            print(f"setting up TestAPI.Results.Error")
            testapi.fishyjoes_type_setup.TestAPI_Results_Error_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Structs.MemberwiseStruct') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Structs_MemberwiseStruct() -> None:
            print(f"setting up TestAPI.Structs.MemberwiseStruct")
            testapi.fishyjoes_type_setup.TestAPI_Structs_MemberwiseStruct_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Structs.MutableStruct') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Structs_MutableStruct() -> None:
            print(f"setting up TestAPI.Structs.MutableStruct")
            testapi.fishyjoes_type_setup.TestAPI_Structs_MutableStruct_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Structs.PuttingTypesIntoQuestionablePlaces') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces() -> None:
            print(f"setting up TestAPI.Structs.PuttingTypesIntoQuestionablePlaces")
            testapi.fishyjoes_type_setup.TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_Structs_PuttingTypesIntoQuestionablePlaces_impl.ffi_new,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Structs.ReferenceStruct') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Structs_ReferenceStruct() -> None:
            print(f"setting up TestAPI.Structs.ReferenceStruct")
            testapi.fishyjoes_type_setup.TestAPI_Structs_ReferenceStruct_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_structs_ReferenceStruct_impl.ffi_new,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Structs.TwentyOneItemStruct') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Structs_TwentyOneItemStruct() -> None:
            print(f"setting up TestAPI.Structs.TwentyOneItemStruct")
            testapi.fishyjoes_type_setup.TestAPI_Structs_TwentyOneItemStruct_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._AProtocolConverter') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_CommonInterface__AProtocolConverter() -> None:
            print(f"setting up TestAPI.AProtocol")
            testapi.fishyjoes_type_setup.TestAPI_CommonInterface__AProtocolConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.AProtocolImplementation') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_AProtocolImplementation() -> None:
            print(f"setting up TestAPI.AProtocolImplementation")
            testapi.fishyjoes_type_setup.TestAPI_AProtocolImplementation_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Actors') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Actors() -> None:
            print(f"setting up TestAPI.Actors")
            testapi.fishyjoes_type_setup.TestAPI_Actors_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.AssociatedDataEnum') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_AssociatedDataEnum() -> None:
            print(f"setting up TestAPI.AssociatedDataEnum")
            testapi.fishyjoes_type_setup.TestAPI_AssociatedDataEnum_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_AssociatedDataEnum_impl.enum_discriminator,
                _testapi_AssociatedDataEnum_impl.new_thing,
                _testapi_AssociatedDataEnum_impl.extract_thing,
                _testapi_AssociatedDataEnum_impl.new_other,
                _testapi_AssociatedDataEnum_impl.extract_other,
                _testapi_AssociatedDataEnum_impl.new_bar,
                _testapi_AssociatedDataEnum_impl.extract_bar,
                _testapi_AssociatedDataEnum_impl.new_no_value,
                _testapi_AssociatedDataEnum_impl.extract_no_value,
                _testapi_AssociatedDataEnum_impl.new_none,
                _testapi_AssociatedDataEnum_impl.extract_none,
                _testapi_AssociatedDataEnum_impl.new_simple_enum,
                _testapi_AssociatedDataEnum_impl.extract_simple_enum,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.AsyncFunctions') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_AsyncFunctions() -> None:
            print(f"setting up TestAPI.AsyncFunctions")
            testapi.fishyjoes_type_setup.TestAPI_AsyncFunctions_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Bytes') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Bytes() -> None:
            print(f"setting up TestAPI.Bytes")
            testapi.fishyjoes_type_setup.TestAPI_Bytes_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.ClosedRanges') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_ClosedRanges() -> None:
            print(f"setting up TestAPI.ClosedRanges")
            testapi.fishyjoes_type_setup.TestAPI_ClosedRanges_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Collections') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Collections() -> None:
            print(f"setting up TestAPI.Collections")
            testapi.fishyjoes_type_setup.TestAPI_Collections_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.DefaultArguments') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_DefaultArguments() -> None:
            print(f"setting up TestAPI.DefaultArguments")
            testapi.fishyjoes_type_setup.TestAPI_DefaultArguments_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Deprecations') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Deprecations() -> None:
            print(f"setting up TestAPI.Deprecations")
            testapi.fishyjoes_type_setup.TestAPI_Deprecations_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.EmptyClass') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_EmptyClass() -> None:
            print(f"setting up TestAPI.EmptyClass")
            testapi.fishyjoes_type_setup.TestAPI_EmptyClass_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_EmptyClass1_impl.ffi_new,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.EmptyClass2') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_EmptyClass2() -> None:
            print(f"setting up TestAPI.EmptyClass2")
            testapi.fishyjoes_type_setup.TestAPI_EmptyClass2_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_EmptyClass2_impl.ffi_new,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.EmptyEnum') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_EmptyEnum() -> None:
            print(f"setting up TestAPI.EmptyEnum")
            testapi.fishyjoes_type_setup.TestAPI_EmptyEnum_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.EmptyStruct') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_EmptyStruct() -> None:
            print(f"setting up TestAPI.EmptyStruct")
            testapi.fishyjoes_type_setup.TestAPI_EmptyStruct_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.EmptyStruct2') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_EmptyStruct2() -> None:
            print(f"setting up TestAPI.EmptyStruct2")
            testapi.fishyjoes_type_setup.TestAPI_EmptyStruct2_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Functions') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Functions() -> None:
            print(f"setting up TestAPI.Functions")
            testapi.fishyjoes_type_setup.TestAPI_Functions_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Methods') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Methods() -> None:
            print(f"setting up TestAPI.Methods")
            testapi.fishyjoes_type_setup.TestAPI_Methods_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_Methods_impl.ffi_new,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Primitives') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Primitives() -> None:
            print(f"setting up TestAPI.Primitives")
            testapi.fishyjoes_type_setup.TestAPI_Primitives_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.ProtocolFixtures') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_ProtocolFixtures() -> None:
            print(f"setting up TestAPI.ProtocolFixtures")
            testapi.fishyjoes_type_setup.TestAPI_ProtocolFixtures_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.PythonNamingCollisions') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_PythonNamingCollisions() -> None:
            print(f"setting up TestAPI.PythonNamingCollisions")
            testapi.fishyjoes_type_setup.TestAPI_PythonNamingCollisions_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Ranges') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Ranges() -> None:
            print(f"setting up TestAPI.Ranges")
            testapi.fishyjoes_type_setup.TestAPI_Ranges_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.ReferenceCaseEnum') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_ReferenceCaseEnum() -> None:
            print(f"setting up TestAPI.ReferenceCaseEnum")
            testapi.fishyjoes_type_setup.TestAPI_ReferenceCaseEnum_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_ReferenceCaseEnum_impl.enum_discriminator,
                _testapi_ReferenceCaseEnum_impl.new_north,
                _testapi_ReferenceCaseEnum_impl.extract_north,
                _testapi_ReferenceCaseEnum_impl.new_south,
                _testapi_ReferenceCaseEnum_impl.extract_south,
                _testapi_ReferenceCaseEnum_impl.new_east,
                _testapi_ReferenceCaseEnum_impl.extract_east,
                _testapi_ReferenceCaseEnum_impl.new_west,
                _testapi_ReferenceCaseEnum_impl.extract_west,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.ReferenceEmptyEnum') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_ReferenceEmptyEnum() -> None:
            print(f"setting up TestAPI.ReferenceEmptyEnum")
            testapi.fishyjoes_type_setup.TestAPI_ReferenceEmptyEnum_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.ReferenceOnlyTypes') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_ReferenceOnlyTypes() -> None:
            print(f"setting up TestAPI.ReferenceOnlyTypes")
            testapi.fishyjoes_type_setup.TestAPI_ReferenceOnlyTypes_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Results') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Results() -> None:
            print(f"setting up TestAPI.Results")
            testapi.fishyjoes_type_setup.TestAPI_Results_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Shade') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Shade() -> None:
            print(f"setting up TestAPI.Shade")
            testapi.fishyjoes_type_setup.TestAPI_Shade_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.ShadowBox') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_ShadowBox() -> None:
            print(f"setting up TestAPI.ShadowBox")
            testapi.fishyjoes_type_setup.TestAPI_ShadowBox_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_ShadowBox_impl.enum_discriminator,
                _testapi_ShadowBox_impl.new_shade,
                _testapi_ShadowBox_impl.extract_shade,
                _testapi_ShadowBox_impl.new_empty,
                _testapi_ShadowBox_impl.extract_empty,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.SimpleEnum') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_SimpleEnum() -> None:
            print(f"setting up TestAPI.SimpleEnum")
            testapi.fishyjoes_type_setup.TestAPI_SimpleEnum_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_SimpleEnum_impl.enum_discriminator,
                _testapi_SimpleEnum_impl.new_red,
                _testapi_SimpleEnum_impl.extract_red,
                _testapi_SimpleEnum_impl.new_green,
                _testapi_SimpleEnum_impl.extract_green,
                _testapi_SimpleEnum_impl.new_blue,
                _testapi_SimpleEnum_impl.extract_blue,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Strings') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Strings() -> None:
            print(f"setting up TestAPI.Strings")
            testapi.fishyjoes_type_setup.TestAPI_Strings_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Structs') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Structs() -> None:
            print(f"setting up TestAPI.Structs")
            testapi.fishyjoes_type_setup.TestAPI_Structs_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestAsyncForeignSideFunctionsStruct') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_TestAsyncForeignSideFunctionsStruct() -> None:
            print(f"setting up TestAPI.TestAsyncForeignSideFunctionsStruct")
            testapi.fishyjoes_type_setup.TestAPI_TestAsyncForeignSideFunctionsStruct_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestAsyncFunctionsConverter') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_CommonInterface__TestAsyncFunctionsConverter() -> None:
            print(f"setting up TestAPI.TestAsyncFunctions")
            testapi.fishyjoes_type_setup.TestAPI_CommonInterface__TestAsyncFunctionsConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestAsyncSwiftSideFunctionsClass') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_TestAsyncSwiftSideFunctionsClass() -> None:
            print(f"setting up TestAPI.TestAsyncSwiftSideFunctionsClass")
            testapi.fishyjoes_type_setup.TestAPI_TestAsyncSwiftSideFunctionsClass_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_TestAsyncSwiftSideFunctionsClass_impl.ffi_new,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter() -> None:
            print(f"setting up TestAPI.TestDefaultComputedProperties")
            testapi.fishyjoes_type_setup.TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestDefaultComputedPropertiesClass') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_TestDefaultComputedPropertiesClass() -> None:
            print(f"setting up TestAPI.TestDefaultComputedPropertiesClass")
            testapi.fishyjoes_type_setup.TestAPI_TestDefaultComputedPropertiesClass_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_TestDefaultComputedPropertiesReference_impl.ffi_new,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestDefaultComputedPropertiesEnum') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_TestDefaultComputedPropertiesEnum() -> None:
            print(f"setting up TestAPI.TestDefaultComputedPropertiesEnum")
            testapi.fishyjoes_type_setup.TestAPI_TestDefaultComputedPropertiesEnum_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_TestDefaultComputedPropertiesEnum_impl.enum_discriminator,
                _testapi_TestDefaultComputedPropertiesEnum_impl.new_qux,
                _testapi_TestDefaultComputedPropertiesEnum_impl.extract_qux,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestDefaultComputedPropertiesStruct') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_TestDefaultComputedPropertiesStruct() -> None:
            print(f"setting up TestAPI.TestDefaultComputedPropertiesStruct")
            testapi.fishyjoes_type_setup.TestAPI_TestDefaultComputedPropertiesStruct_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter() -> None:
            print(f"setting up TestAPI.TestDifferingExportNameProtocol")
            testapi.fishyjoes_type_setup.TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestDifferingExportNameStruct') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_TestDifferingExportNameStruct() -> None:
            print(f"setting up TestAPI.TestDifferingExportNameStruct")
            testapi.fishyjoes_type_setup.TestAPI_TestDifferingExportNameStruct_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter() -> None:
            print(f"setting up TestAPI.TestLeadingUnderscoredProp")
            testapi.fishyjoes_type_setup.TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestLeadingUnderscoredPropStruct') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_TestLeadingUnderscoredPropStruct() -> None:
            print(f"setting up TestAPI.TestLeadingUnderscoredPropStruct")
            testapi.fishyjoes_type_setup.TestAPI_TestLeadingUnderscoredPropStruct_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestMethodsProtocolConverter') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_CommonInterface__TestMethodsProtocolConverter() -> None:
            print(f"setting up TestAPI.TestMethodsProtocol")
            testapi.fishyjoes_type_setup.TestAPI_CommonInterface__TestMethodsProtocolConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestNonExportedProtocolEnum') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_TestNonExportedProtocolEnum() -> None:
            print(f"setting up TestAPI.TestNonExportedProtocolEnum")
            testapi.fishyjoes_type_setup.TestAPI_TestNonExportedProtocolEnum_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_TestNonExportedProtocolEnum_impl.enum_discriminator,
                _testapi_TestNonExportedProtocolEnum_impl.new_hogehoge,
                _testapi_TestNonExportedProtocolEnum_impl.extract_hogehoge,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestOptionalsProtocolConverter') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_CommonInterface__TestOptionalsProtocolConverter() -> None:
            print(f"setting up TestAPI.TestOptionalsProtocol")
            testapi.fishyjoes_type_setup.TestAPI_CommonInterface__TestOptionalsProtocolConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestPropertiesProtocolConverter') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_CommonInterface__TestPropertiesProtocolConverter() -> None:
            print(f"setting up TestAPI.TestPropertiesProtocol")
            testapi.fishyjoes_type_setup.TestAPI_CommonInterface__TestPropertiesProtocolConverter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestProtocolClass') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_TestProtocolClass() -> None:
            print(f"setting up TestAPI.TestProtocolClass")
            testapi.fishyjoes_type_setup.TestAPI_TestProtocolClass_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_TestProtocolClass_impl.ffi_new,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestProtocolEnum') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_TestProtocolEnum() -> None:
            print(f"setting up TestAPI.TestProtocolEnum")
            testapi.fishyjoes_type_setup.TestAPI_TestProtocolEnum_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _testapi_TestProtocolEnum_impl.enum_discriminator,
                _testapi_TestProtocolEnum_impl.new_qux,
                _testapi_TestProtocolEnum_impl.extract_qux,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestProtocolStruct') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_TestProtocolStruct() -> None:
            print(f"setting up TestAPI.TestProtocolStruct")
            testapi.fishyjoes_type_setup.TestAPI_TestProtocolStruct_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Tree') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Tree() -> None:
            print(f"setting up TestAPI.Tree")
            testapi.fishyjoes_type_setup.TestAPI_Tree_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.Tuples') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_Tuples() -> None:
            print(f"setting up TestAPI.Tuples")
            testapi.fishyjoes_type_setup.TestAPI_Tuples_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_TestAPI.URLs') # type: ignore[unused-ignore,no-redef]
        def setup_TestAPI_URLs() -> None:
            print(f"setting up TestAPI.URLs")
            testapi.fishyjoes_type_setup.TestAPI_URLs_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
            )

        @fishyjoes_runtime.eval_once_now('setup_Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_Tuple3Converter_Swift_Bool__Swift_Double__ArrayConverter_Swift_String__() -> None:
            print(f"setting up (Bool, Double, Array<String>)")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Tuple3Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>"),
                (bool,),
                (float,),
                (list,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_Tuple3Converter_Swift_Bool__Swift_Int__Swift_String_() -> None:
            print(f"setting up (Bool, Int, String)")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Tuple3Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>"),
                (bool,),
                (int,),
                (str,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Tuple2Converter<Swift.Int, Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_Tuple2Converter_Swift_Int__Swift_String_() -> None:
            print(f"setting up (Int, String)")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Tuple2Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Tuple2Converter<Swift.Int, Swift.String>"),
                (int,),
                (str,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>') # type: ignore[unused-ignore,no-redef]
        def setup_Tuple4Converter_Swift_Int8__Swift_Int16__Swift_Int32__Swift_Int64_() -> None:
            print(f"setting up (Int8, Int16, Int32, Int64)")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Tuple4Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>"),
                (int,),
                (int,),
                (int,),
                (int,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Tuple3Converter<Swift.String, Swift.Double, Swift.String>') # type: ignore[unused-ignore,no-redef]
        def setup_Tuple3Converter_Swift_String__Swift_Double__Swift_String_() -> None:
            print(f"setting up (String, Double, String)")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Tuple3Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Tuple3Converter<Swift.String, Swift.Double, Swift.String>"),
                (str,),
                (float,),
                (str,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>') # type: ignore[unused-ignore,no-redef]
        def setup_Tuple6Converter_Swift_String__Swift_Int__Swift_Double__Tuple4Converter_Tuple2Converter_Swift_Int__Swift_String___Tuple3Converter_Swift_String__Swift_Double__Swift_String___Swift_String__Swift_Bool___Tuple5Converter_Swift_String__Swift_UInt8__Tuple4Converter_Tuple2Converter_Swift_Int__Swift_String___Tuple3Converter_Swift_String__Swift_Double__Swift_String___Swift_String__Swift_Bool___Tuple3Converter_Swift_String__Swift_Double__Swift_String___Tuple2Converter_Swift_Int__Swift_String____Swift_Bool_() -> None:
            print(f"setting up (String, Int, Double, ((Int, String), (String, Double, String), String, Bool), (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)), Bool)")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Tuple6Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>"),
                (str,),
                (int,),
                (float,),
                (tuple,),
                (tuple,),
                (bool,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>') # type: ignore[unused-ignore,no-redef]
        def setup_Tuple5Converter_Swift_String__Swift_UInt8__Tuple4Converter_Tuple2Converter_Swift_Int__Swift_String___Tuple3Converter_Swift_String__Swift_Double__Swift_String___Swift_String__Swift_Bool___Tuple3Converter_Swift_String__Swift_Double__Swift_String___Tuple2Converter_Swift_Int__Swift_String__() -> None:
            print(f"setting up (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String))")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Tuple5Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>"),
                (str,),
                (int,),
                (tuple,),
                (tuple,),
                (tuple,),
            )

        @fishyjoes_runtime.eval_once_now('setup_Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>') # type: ignore[unused-ignore,no-redef]
        def setup_Tuple4Converter_Tuple2Converter_Swift_Int__Swift_String___Tuple3Converter_Swift_String__Swift_Double__Swift_String___Swift_String__Swift_Bool_() -> None:
            print(f"setting up ((Int, String), (String, Double, String), String, Bool)")
            fishyjoes_runtime.fishyjoes_type_setup.FishyJoesCommonRuntime_Tuple4Converter_setup(
                fishyjoes_runtime.Runtime.shared.env_ref,
                string_bag.utf16("Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>"),
                (tuple,),
                (tuple,),
                (str,),
                (bool,),
            )

FIXME: You should not use this, you should use one of the representations below. int __iota_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_testCall(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall(...);
FIXME: You should not use this, you should use one of the representations below. testapi.AProtocol __iota_TestAPI_AProtocolImplementation_bar(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_AProtocolImplementation_hasADefaultImplementation(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_AProtocolImplementation_hasADefaultImplementation2(...);
FIXME: You should not use this, you should use one of the representations below. testapi.AProtocol __iota_TestAPI_AProtocol_bar(...);
FIXME: You should not use this, you should use one of the representations below. testapi.AProtocol __iota_TestAPI_AProtocol_bar(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_AProtocol_hasADefaultImplementation(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_AProtocol_hasADefaultImplementation2(...);
FIXME: You should not use this, you should use one of the representations below. testapi.actors.TemperatureLogger __iota_TestAPI_Actors_TemperatureLogger_create(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_Actors_TemperatureLogger_extensionIsolatedGetLabel(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_Actors_TemperatureLogger_extensionNonisolatedGetLabel(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[int] __iota_TestAPI_Actors_TemperatureLogger_min(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[None] __iota_TestAPI_Actors_TemperatureLogger_update(...);
FIXME: You should not use this, you should use one of the representations below. testapi.AssociatedDataEnum __iota_TestAPI_AssociatedDataEnum_plus(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[int] __iota_TestAPI_AsyncFunctions_delayedConst(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_AsyncFunctions_exercise0(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_AsyncFunctions_exercise1(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_AsyncFunctions_exercise2(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_AsyncFunctions_exercise3(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_AsyncFunctions_exercise4(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_AsyncFunctions_exercise5(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_AsyncFunctions_exercise6(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], typing.Awaitable[None]] __iota_TestAPI_AsyncFunctions_thunkTwiceMaker(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_TestAPI_Bytes_echoBytes(...);
FIXME: You should not use this, you should use one of the representations below. bytes __iota_TestAPI_Bytes_echoData(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[float] __iota_TestAPI_ClosedRanges_echoDoubleRange(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[float] __iota_TestAPI_ClosedRanges_echoFloatRange(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_TestAPI_ClosedRanges_echoInt16Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_TestAPI_ClosedRanges_echoInt32Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_TestAPI_ClosedRanges_echoInt64Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_TestAPI_ClosedRanges_echoInt8Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_TestAPI_ClosedRanges_echoIntRange(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[str] __iota_TestAPI_ClosedRanges_echoStringRange(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_TestAPI_ClosedRanges_echoUInt16Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_TestAPI_ClosedRanges_echoUInt32Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_TestAPI_ClosedRanges_echoUInt64Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_TestAPI_ClosedRanges_echoUInt8Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_TestAPI_ClosedRanges_echoUIntRange(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] | None __iota_TestAPI_Collections_collectionMapper(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_TestAPI_Collections_echoArrayOfInt(...);
FIXME: You should not use this, you should use one of the representations below. dict[int,int] __iota_TestAPI_Collections_echoDictionaryOfIntToInt(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] | None __iota_TestAPI_Collections_echoMaybeArrayOfMaybeInt(...);
FIXME: You should not use this, you should use one of the representations below. dict[int,int | None] | None __iota_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt(...);
FIXME: You should not use this, you should use one of the representations below. set[int | None] | None __iota_TestAPI_Collections_echoMaybeSetOfMaybeInt(...);
FIXME: You should not use this, you should use one of the representations below. set[int] __iota_TestAPI_Collections_echoSetOfInt(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_DefaultArguments_describeEnumDefault(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_DefaultArguments_echoDefaultIntLimits(...);
FIXME: You should not use this, you should use one of the representations below. float __iota_TestAPI_DefaultArguments_echoDefaultTolerance(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_DefaultArguments_echoDefaults(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_Deprecations_deprecatedMethod(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_TestAPI_EmptyClass2_equals(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_EmptyClass2_gorp(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_EmptyClass2_hash(...);
FIXME: You should not use this, you should use one of the representations below. testapi.EmptyClass2 __iota_TestAPI_EmptyClass2_make(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_EmptyClass2_shmee(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_EmptyClass_Gorpers(...);
FIXME: You should not use this, you should use one of the representations below. testapi.EmptyClass1 __iota_TestAPI_EmptyClass_create(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_TestAPI_EmptyClass_equals(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_EmptyClass_hash(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_EmptyClass_shme(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_EmptyEnum_aStaticMethod(...);
FIXME: You should not use this, you should use one of the representations below. testapi.EmptyEnum __iota_TestAPI_EmptyEnum_notGoingToHappen(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_EmptyStruct2_aap(...);
FIXME: You should not use this, you should use one of the representations below. testapi.EmptyStruct2 __iota_TestAPI_EmptyStruct2_create(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_EmptyStruct2_zxccxz(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_EmptyStruct_aap(...);
FIXME: You should not use this, you should use one of the representations below. testapi.EmptyStruct __iota_TestAPI_EmptyStruct_create(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_EmptyStruct_zxccxz(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_Functions_exercise0(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_Functions_exercise1(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_Functions_exercise2(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_Functions_exercise3(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_Functions_exercise4(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_Functions_exercise5(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_Functions_exercise6(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], None] __iota_TestAPI_Functions_thunkTwiceMaker(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_Functions_willThrow(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[int] __iota_TestAPI_Methods_async42(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[int] __iota_TestAPI_Methods_asyncCallbackFunc0(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[float] __iota_TestAPI_Methods_asyncDouble(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[int] __iota_TestAPI_Methods_asyncMultipleArgs(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[int] __iota_TestAPI_Methods_asyncSleep(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[None] __iota_TestAPI_Methods_asyncThrowing(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[None] __iota_TestAPI_Methods_asyncVoid(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[int] __iota_TestAPI_Methods_asyncYield(...);
FIXME: You should not use this, you should use one of the representations below. testapi.Methods __iota_TestAPI_Methods_create(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Methods_doublePlusGood(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_TestAPI_Methods_methodWithNewlinesInTypes(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[int] __iota_TestAPI_Methods_staticAsync42(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[int] __iota_TestAPI_Methods_staticAsyncCallbackFunc0(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[float] __iota_TestAPI_Methods_staticAsyncDouble(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[int] __iota_TestAPI_Methods_staticAsyncMultipleArgs(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[int] __iota_TestAPI_Methods_staticAsyncSleep(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[None] __iota_TestAPI_Methods_staticAsyncThrowing(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[None] __iota_TestAPI_Methods_staticAsyncVoid(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[int] __iota_TestAPI_Methods_staticAsyncYield(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Primitives_boolOverflow(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_TestAPI_Primitives_echoBool(...);
FIXME: You should not use this, you should use one of the representations below. float __iota_TestAPI_Primitives_echoDouble(...);
FIXME: You should not use this, you should use one of the representations below. float __iota_TestAPI_Primitives_echoFloat(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Primitives_echoInt(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Primitives_echoInt16(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Primitives_echoInt32(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Primitives_echoInt64(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Primitives_echoInt8(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Primitives_echoUInt(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Primitives_echoUInt16(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Primitives_echoUInt32(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Primitives_echoUInt64(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Primitives_echoUInt8(...);
FIXME: You should not use this, you should use one of the representations below. bool | None __iota_TestAPI_Primitives_maybeEchoBool(...);
FIXME: You should not use this, you should use one of the representations below. float | None __iota_TestAPI_Primitives_maybeEchoDouble(...);
FIXME: You should not use this, you should use one of the representations below. float | None __iota_TestAPI_Primitives_maybeEchoFloat(...);
FIXME: You should not use this, you should use one of the representations below. int | None __iota_TestAPI_Primitives_maybeEchoInt(...);
FIXME: You should not use this, you should use one of the representations below. int | None __iota_TestAPI_Primitives_maybeEchoInt16(...);
FIXME: You should not use this, you should use one of the representations below. int | None __iota_TestAPI_Primitives_maybeEchoInt32(...);
FIXME: You should not use this, you should use one of the representations below. int | None __iota_TestAPI_Primitives_maybeEchoInt64(...);
FIXME: You should not use this, you should use one of the representations below. int | None __iota_TestAPI_Primitives_maybeEchoInt8(...);
FIXME: You should not use this, you should use one of the representations below. int | None __iota_TestAPI_Primitives_maybeEchoUInt(...);
FIXME: You should not use this, you should use one of the representations below. int | None __iota_TestAPI_Primitives_maybeEchoUInt16(...);
FIXME: You should not use this, you should use one of the representations below. int | None __iota_TestAPI_Primitives_maybeEchoUInt32(...);
FIXME: You should not use this, you should use one of the representations below. int | None __iota_TestAPI_Primitives_maybeEchoUInt64(...);
FIXME: You should not use this, you should use one of the representations below. int | None __iota_TestAPI_Primitives_maybeEchoUInt8(...);
FIXME: You should not use this, you should use one of the representations below. int | None __iota_TestAPI_Primitives_valueMapper(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_ProtocolFixtures_describeAProtocol(...);
FIXME: You should not use this, you should use one of the representations below. testapi.AProtocol __iota_TestAPI_ProtocolFixtures_returnAProtocol(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_PythonNamingCollisions_from(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_TestAPI_Ranges_echoInt16Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_TestAPI_Ranges_echoInt32Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_TestAPI_Ranges_echoInt64Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_TestAPI_Ranges_echoInt8Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_TestAPI_Ranges_echoIntRange(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_TestAPI_Ranges_echoUInt16Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_TestAPI_Ranges_echoUInt32Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_TestAPI_Ranges_echoUInt64Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_TestAPI_Ranges_echoUInt8Range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_TestAPI_Ranges_echoUIntRange(...);
FIXME: You should not use this, you should use one of the representations below. testapi.ReferenceCaseEnum __iota_TestAPI_ReferenceCaseEnum_rotate180(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_ReferenceEmptyEnum_aStaticMethod(...);
FIXME: You should not use this, you should use one of the representations below. testapi.ReferenceEmptyEnum __iota_TestAPI_ReferenceEmptyEnum_notGoingToHappen(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_TestAPI_ReferenceOnlyTypes_Marker_equals(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_ReferenceOnlyTypes_Marker_hash(...);
FIXME: You should not use this, you should use one of the representations below. testapi.reference_only_types.Marker __iota_TestAPI_ReferenceOnlyTypes_marker(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_Results_processResult(...);
FIXME: You should not use this, you should use one of the representations below. testapi.Shade | None __iota_TestAPI_ShadowBox_darkest(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_SimpleEnum_hexMethod(...);
FIXME: You should not use this, you should use one of the representations below. testapi.SimpleEnum | None __iota_TestAPI_SimpleEnum_pickAColor(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_TestAPI_SimpleEnum_resetFavoriteColor(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_Strings_echo(...);
FIXME: You should not use this, you should use one of the representations below. list[str] __iota_TestAPI_Strings_split(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_Structs_MemberwiseStruct_asyncGetMutable(...);
FIXME: You should not use this, you should use one of the representations below. testapi.structs.MemberwiseStruct __iota_TestAPI_Structs_MemberwiseStruct_create(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[int] __iota_TestAPI_Structs_MutableStruct_asyncGetI(...);
FIXME: You should not use this, you should use one of the representations below. testapi.structs.MutableStruct __iota_TestAPI_Structs_MutableStruct_create(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_TestAPI_Structs_MutableStruct_increment(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[None] __iota_TestAPI_Structs_MutableStruct_incrementAsync(...);
FIXME: You should not use this, you should use one of the representations below. testapi.Structs_PuttingTypesIntoQuestionablePlaces __iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_Structs_ReferenceStruct_asyncGetMutable(...);
FIXME: You should not use this, you should use one of the representations below. testapi.structs.ReferenceStruct __iota_TestAPI_Structs_ReferenceStruct_create(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_TestAPI_Structs_ReferenceStruct_equals(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_Structs_ReferenceStruct_hash(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_defaultExercise6(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], typing.Awaitable[None]] __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker(...);
FIXME: You should not use this, you should use one of the representations below. testapi.TestAsyncFunctions __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_defaultExercise6(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise0(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise0(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise1(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise1(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise2(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise2(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise3(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise3(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise4(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise4(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise5(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise5(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise6(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncFunctions_exercise6(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], typing.Awaitable[None]] __iota_TestAPI_TestAsyncFunctions_thunkTwiceMaker(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], typing.Awaitable[None]] __iota_TestAPI_TestAsyncFunctions_thunkTwiceMaker(...);
FIXME: You should not use this, you should use one of the representations below. testapi.TestAsyncFunctions __iota_TestAPI_TestAsyncFunctions_witness(...);
FIXME: You should not use this, you should use one of the representations below. testapi.TestAsyncFunctions __iota_TestAPI_TestAsyncFunctions_witness(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_defaultExercise6(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise0(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise1(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise2(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise3(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise4(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise5(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Future[str] __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise6(...);
FIXME: You should not use this, you should use one of the representations below. testapi.TestAsyncSwiftSideFunctionsClass __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_init(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], typing.Awaitable[None]] __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_thunkTwiceMaker(...);
FIXME: You should not use this, you should use one of the representations below. testapi.TestAsyncFunctions __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_witness(...);
FIXME: You should not use this, you should use one of the representations below. testapi.TestDefaultComputedPropertiesReference __iota_TestAPI_TestDefaultComputedPropertiesClass_init(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_TestAPI_TestMethodsProtocol_bar(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_TestAPI_TestMethodsProtocol_bar(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_TestAPI_TestMethodsProtocol_baz(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_TestAPI_TestMethodsProtocol_baz(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_TestAPI_TestMethodsProtocol_foo(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_TestAPI_TestMethodsProtocol_foo(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_TestMethodsProtocol_garply(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_TestMethodsProtocol_garply(...);
FIXME: You should not use this, you should use one of the representations below. tuple[bool,int,str] __iota_TestAPI_TestMethodsProtocol_plugh(...);
FIXME: You should not use this, you should use one of the representations below. tuple[bool,int,str] __iota_TestAPI_TestMethodsProtocol_plugh(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_TestMethodsProtocol_xyzzy(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_TestMethodsProtocol_xyzzy(...);
FIXME: You should not use this, you should use one of the representations below. float __iota_TestAPI_TestNonExportedProtocolEnum_hoge(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_TestOptionalsProtocol_spqr(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_TestOptionalsProtocol_spqr(...);
FIXME: You should not use this, you should use one of the representations below. float | None __iota_TestAPI_TestOptionalsProtocol_wombat(...);
FIXME: You should not use this, you should use one of the representations below. float | None __iota_TestAPI_TestOptionalsProtocol_wombat(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_TestAPI_TestProtocolClass_bar(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_TestAPI_TestProtocolClass_baz(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_TestAPI_TestProtocolClass_equals(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_TestAPI_TestProtocolClass_foo(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_TestProtocolClass_garply(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_TestProtocolClass_hash(...);
FIXME: You should not use this, you should use one of the representations below. testapi.TestProtocolClass __iota_TestAPI_TestProtocolClass_init(...);
FIXME: You should not use this, you should use one of the representations below. tuple[bool,int,str] __iota_TestAPI_TestProtocolClass_plugh(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_TestAPI_TestProtocolClass_spqr(...);
FIXME: You should not use this, you should use one of the representations below. float | None __iota_TestAPI_TestProtocolClass_wombat(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_TestProtocolClass_xyzzy(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_TestAPI_TestProtocolEnum_bar(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_TestAPI_TestProtocolEnum_baz(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_TestAPI_TestProtocolEnum_foo(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_TestProtocolEnum_garply(...);
FIXME: You should not use this, you should use one of the representations below. tuple[bool,int,str] __iota_TestAPI_TestProtocolEnum_plugh(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_TestProtocolEnum_xyzzy(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_TestAPI_TestProtocolStruct_bar(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_TestAPI_TestProtocolStruct_baz(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_TestAPI_TestProtocolStruct_foo(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_TestProtocolStruct_garply(...);
FIXME: You should not use this, you should use one of the representations below. tuple[bool,int,str] __iota_TestAPI_TestProtocolStruct_plugh(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_TestProtocolStruct_xyzzy(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_TestAPI_Tuples_checkTuples(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_TestAPI_URLs_echo(...);
FIXME: You should not use this, you should use one of the representations below. str __iota__default_TestAPI_TestDefaultComputedPropertiesClass_plutonic(...);
FIXME: You should not use this, you should use one of the representations below. str __iota__default_TestAPI_TestDefaultComputedPropertiesEnum_plutonic(...);
FIXME: You should not use this, you should use one of the representations below. str __iota__default_TestAPI_TestDefaultComputedPropertiesStruct_plutonic(...);
FIXME: You should not use this, you should use one of the representations below. int __iota__default_TestAPI_TestDefaultComputedProperties_noot(...);
FIXME: You should not use this, you should use one of the representations below. int __iota__default_TestAPI_TestDefaultComputedProperties_noot(...);
FIXME: You should not use this, you should use one of the representations below. str __iota__default_TestAPI_TestDefaultComputedProperties_plutonic(...);
FIXME: You should not use this, you should use one of the representations below. str __iota__default_TestAPI_TestDefaultComputedProperties_plutonic(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_get_TestAPI_AProtocol_baz(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_get_TestAPI_AProtocol_baz(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_AProtocol_foo(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_AProtocol_foo(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_Actors_TemperatureLogger_backwards_label(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_Actors_TemperatureLogger_extension_nonisolated_var_label(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_Actors_TemperatureLogger_label(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_AssociatedDataEnum_int_value(...);
FIXME: You should not use this, you should use one of the representations below. testapi.AssociatedDataEnum __iota_get_TestAPI_AssociatedDataEnum_static_thing(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[int], typing.Awaitable[int]] __iota_get_TestAPI_AsyncFunctions_abs(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[float, float, int], typing.Awaitable[float]] __iota_get_TestAPI_AsyncFunctions_add3_things(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], typing.Awaitable[int]] __iota_get_TestAPI_AsyncFunctions_const42(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]] __iota_get_TestAPI_AsyncFunctions_fifth_thing(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]] __iota_get_TestAPI_AsyncFunctions_int_compose(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]] __iota_get_TestAPI_AsyncFunctions_make_list(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]] __iota_get_TestAPI_AsyncFunctions_sixth_thing(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], typing.Awaitable[int]] __iota_get_TestAPI_AsyncFunctions_will_throw(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_Bytes_bytes(...);
FIXME: You should not use this, you should use one of the representations below. bytes __iota_get_TestAPI_Bytes_data(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[float] __iota_get_TestAPI_ClosedRanges_double_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[float] __iota_get_TestAPI_ClosedRanges_float_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_get_TestAPI_ClosedRanges_int16_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_get_TestAPI_ClosedRanges_int32_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_get_TestAPI_ClosedRanges_int64_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_get_TestAPI_ClosedRanges_int8_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_get_TestAPI_ClosedRanges_int_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[str] __iota_get_TestAPI_ClosedRanges_string_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_get_TestAPI_ClosedRanges_uint16_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_get_TestAPI_ClosedRanges_uint32_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_get_TestAPI_ClosedRanges_uint64_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_get_TestAPI_ClosedRanges_uint8_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftClosedRange[int] __iota_get_TestAPI_ClosedRanges_uint_range(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Collections_CollectionHolder_static_mutable_property(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Collections_CollectionHolder_static_property(...);
FIXME: You should not use this, you should use one of the representations below. list[tuple[int,int,int,int]] __iota_get_TestAPI_Collections_array_of_big_tuples(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_Collections_array_of_int(...);
FIXME: You should not use this, you should use one of the representations below. testapi.collections.CollectionHolder __iota_get_TestAPI_Collections_default_collection_holder(...);
FIXME: You should not use this, you should use one of the representations below. dict[int,int] __iota_get_TestAPI_Collections_dictionary_of_int_to_int(...);
FIXME: You should not use this, you should use one of the representations below. list[int] | None __iota_get_TestAPI_Collections_maybe_array_of_int(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] | None __iota_get_TestAPI_Collections_maybe_array_of_maybe_int(...);
FIXME: You should not use this, you should use one of the representations below. dict[int,int] | None __iota_get_TestAPI_Collections_maybe_dictionary_of_int_to_int(...);
FIXME: You should not use this, you should use one of the representations below. dict[int,int | None] | None __iota_get_TestAPI_Collections_maybe_dictionary_of_int_to_maybe_int(...);
FIXME: You should not use this, you should use one of the representations below. set[int] | None __iota_get_TestAPI_Collections_maybe_set_of_int(...);
FIXME: You should not use this, you should use one of the representations below. set[int | None] | None __iota_get_TestAPI_Collections_maybe_set_of_maybe_int(...);
FIXME: You should not use this, you should use one of the representations below. set[int] __iota_get_TestAPI_Collections_set_of_int(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Deprecations_deprecated_variable(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_EmptyClass2_blorg(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_EmptyClass2_wibble(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_EmptyClass_blarg(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_EmptyClass_wibbledy_wobbledy_timey_whimey(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_EmptyEnum_a_static_property(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_EmptyStruct2_tatiana(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_EmptyStruct2_tutu(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_EmptyStruct_tatiana(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_EmptyStruct_tutu(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[int], int] __iota_get_TestAPI_Functions_abs(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[float, float, int], float] __iota_get_TestAPI_Functions_add3_things(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], int] __iota_get_TestAPI_Functions_const42(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]] __iota_get_TestAPI_Functions_fifth_thing(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]] __iota_get_TestAPI_Functions_int_compose(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, str, str, str], list[str]] __iota_get_TestAPI_Functions_make_list(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int] __iota_get_TestAPI_Functions_sixth_thing(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Methods_garply(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Methods_instance_get(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Methods_instance_get_method(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Methods_instance_modifiable(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Methods_instance_stored(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Methods_static_get(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Methods_static_get_method(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Methods_static_modifiable(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Methods_static_stored(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Primitives_PrimitiveHolder_static_mutable_property(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Primitives_PrimitiveHolder_static_property(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_bit_count_int(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_bit_count_u_int(...);
FIXME: You should not use this, you should use one of the representations below. testapi.primitives.PrimitiveHolder __iota_get_TestAPI_Primitives_default_primitive_holder(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_get_TestAPI_Primitives_false_bool(...);
FIXME: You should not use this, you should use one of the representations below. list[bool] __iota_get_TestAPI_Primitives_many_bool(...);
FIXME: You should not use this, you should use one of the representations below. list[float] __iota_get_TestAPI_Primitives_many_double(...);
FIXME: You should not use this, you should use one of the representations below. list[float] __iota_get_TestAPI_Primitives_many_float(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_Primitives_many_int(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_Primitives_many_int16(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_Primitives_many_int32(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_Primitives_many_int64(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_Primitives_many_int8(...);
FIXME: You should not use this, you should use one of the representations below. list[bool | None] __iota_get_TestAPI_Primitives_many_maybe_bool(...);
FIXME: You should not use this, you should use one of the representations below. list[float | None] __iota_get_TestAPI_Primitives_many_maybe_double(...);
FIXME: You should not use this, you should use one of the representations below. list[float | None] __iota_get_TestAPI_Primitives_many_maybe_float(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Primitives_many_maybe_int(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Primitives_many_maybe_int16(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Primitives_many_maybe_int32(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Primitives_many_maybe_int64(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Primitives_many_maybe_int8(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Primitives_many_maybe_uint(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Primitives_many_maybe_uint16(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Primitives_many_maybe_uint32(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Primitives_many_maybe_uint64(...);
FIXME: You should not use this, you should use one of the representations below. list[int | None] __iota_get_TestAPI_Primitives_many_maybe_uint8(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_Primitives_many_uint(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_Primitives_many_uint16(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_Primitives_many_uint32(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_Primitives_many_uint64(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_Primitives_many_uint8(...);
FIXME: You should not use this, you should use one of the representations below. float __iota_get_TestAPI_Primitives_max_double(...);
FIXME: You should not use this, you should use one of the representations below. float __iota_get_TestAPI_Primitives_max_float(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_max_int(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_max_int16(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_max_int32(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_max_int64(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_max_int8(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_max_uint(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_max_uint16(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_max_uint32(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_max_uint64(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_max_uint8(...);
FIXME: You should not use this, you should use one of the representations below. float __iota_get_TestAPI_Primitives_min_double(...);
FIXME: You should not use this, you should use one of the representations below. float __iota_get_TestAPI_Primitives_min_float(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_min_int(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_min_int16(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_min_int32(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_min_int64(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_min_int8(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_min_uint(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_min_uint16(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_min_uint32(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_min_uint64(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_min_uint8(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_get_TestAPI_Primitives_true_bool(...);
FIXME: You should not use this, you should use one of the representations below. float __iota_get_TestAPI_Primitives_zero_double(...);
FIXME: You should not use this, you should use one of the representations below. float __iota_get_TestAPI_Primitives_zero_float(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_zero_int(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_zero_int16(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_zero_int32(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_zero_int64(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_zero_int8(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_zero_uint(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_zero_uint16(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_zero_uint32(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_zero_uint64(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_Primitives_zero_uint8(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_PythonNamingCollisions_class_(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_PythonNamingCollisions_dunder____(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_get_TestAPI_PythonNamingCollisions_is_na_n(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_PythonNamingCollisions_leading_underscore_(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_PythonNamingCollisions_list(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_PythonNamingCollisions_title_url(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_PythonNamingCollisions_url(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_get_TestAPI_Ranges_int16_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_get_TestAPI_Ranges_int32_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_get_TestAPI_Ranges_int64_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_get_TestAPI_Ranges_int8_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_get_TestAPI_Ranges_int_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_get_TestAPI_Ranges_uint16_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_get_TestAPI_Ranges_uint32_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_get_TestAPI_Ranges_uint64_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_get_TestAPI_Ranges_uint8_range(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.SwiftRange[int] __iota_get_TestAPI_Ranges_uint_range(...);
FIXME: You should not use this, you should use one of the representations below. testapi.ReferenceCaseEnum __iota_get_TestAPI_ReferenceCaseEnum_default_direction(...);
FIXME: You should not use this, you should use one of the representations below. testapi.ReferenceCaseEnum __iota_get_TestAPI_ReferenceCaseEnum_opposite(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_ReferenceEmptyEnum_a_static_property(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Result[int,testapi.results.Error] __iota_get_TestAPI_Results_a_failure(...);
FIXME: You should not use this, you should use one of the representations below. fishyjoes_runtime.Result[int,testapi.results.Error] __iota_get_TestAPI_Results_a_success(...);
FIXME: You should not use this, you should use one of the representations below. list[testapi.Shade] __iota_get_TestAPI_ShadowBox_all_shades(...);
FIXME: You should not use this, you should use one of the representations below. testapi.SimpleEnum __iota_get_TestAPI_SimpleEnum_favorite_color(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_SimpleEnum_hex(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_Strings_accent(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_Strings_chinese(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_Strings_chinese_bmp(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_Strings_chinese_sip(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_Strings_emoji(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_Strings_emoji_multi(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_Strings_script(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_Strings_simple(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_Structs_ReferenceStruct_immutable(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_Structs_ReferenceStruct_mutable(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[float, float, int], typing.Awaitable[float]] __iota_get_TestAPI_TestAsyncFunctions_add3_things(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[float, float, int], typing.Awaitable[float]] __iota_get_TestAPI_TestAsyncFunctions_add3_things(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], typing.Awaitable[int]] __iota_get_TestAPI_TestAsyncFunctions_const42(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], typing.Awaitable[int]] __iota_get_TestAPI_TestAsyncFunctions_const42(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]] __iota_get_TestAPI_TestAsyncFunctions_fifth_thing(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]] __iota_get_TestAPI_TestAsyncFunctions_fifth_thing(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[int], typing.Awaitable[int]] __iota_get_TestAPI_TestAsyncFunctions_iabs(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[int], typing.Awaitable[int]] __iota_get_TestAPI_TestAsyncFunctions_iabs(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]] __iota_get_TestAPI_TestAsyncFunctions_int_compose(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]] __iota_get_TestAPI_TestAsyncFunctions_int_compose(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]] __iota_get_TestAPI_TestAsyncFunctions_make_list(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]] __iota_get_TestAPI_TestAsyncFunctions_make_list(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]] __iota_get_TestAPI_TestAsyncFunctions_six(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]] __iota_get_TestAPI_TestAsyncFunctions_six(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], typing.Awaitable[int]] __iota_get_TestAPI_TestAsyncFunctions_will_throw(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], typing.Awaitable[int]] __iota_get_TestAPI_TestAsyncFunctions_will_throw(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[float, float, int], typing.Awaitable[float]] __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_add3_things(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], typing.Awaitable[int]] __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_const42(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]]], typing.Awaitable[typing.Callable[[], typing.Awaitable[int]]]] __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_fifth_thing(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[int], typing.Awaitable[int]] __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_iabs(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[typing.Callable[[int], typing.Awaitable[int]], typing.Callable[[int], typing.Awaitable[int]]], typing.Callable[[int], typing.Awaitable[int]]] __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_int_compose(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, str, str, str], typing.Awaitable[list[str]]] __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_make_list(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[str, int, float, str, typing.Callable[[], typing.Awaitable[int]], int], typing.Awaitable[int]] __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_six(...);
FIXME: You should not use this, you should use one of the representations below. typing.Callable[[], typing.Awaitable[int]] __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_will_throw(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_TestDefaultComputedPropertiesClass_noot(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_get_TestAPI_TestDefaultComputedPropertiesClass_spam(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_TestDefaultComputedPropertiesEnum_noot(...);
FIXME: You should not use this, you should use one of the representations below. bool __iota_get_TestAPI_TestDefaultComputedPropertiesEnum_spam(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_TestDifferingExportNameProtocol_tata(...);
FIXME: You should not use this, you should use one of the representations below. int __iota_get_TestAPI_TestDifferingExportNameProtocol_tata(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_TestLeadingUnderscoredProp_leading_underscore_prop_(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_TestLeadingUnderscoredProp_leading_underscore_prop_(...);
FIXME: You should not use this, you should use one of the representations below. float __iota_get_TestAPI_TestNonExportedProtocolEnum_fuga(...);
FIXME: You should not use this, you should use one of the representations below. str | None __iota_get_TestAPI_TestOptionalsProtocol_flarp(...);
FIXME: You should not use this, you should use one of the representations below. str | None __iota_get_TestAPI_TestOptionalsProtocol_flarp(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_TestPropertiesProtocol_corge(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_TestPropertiesProtocol_corge(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_TestPropertiesProtocol_frobby(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_TestPropertiesProtocol_frobby(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_TestProtocolClass_corge(...);
FIXME: You should not use this, you should use one of the representations below. str | None __iota_get_TestAPI_TestProtocolClass_flarp(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_TestProtocolClass_frobby(...);
FIXME: You should not use this, you should use one of the representations below. list[int] __iota_get_TestAPI_TestProtocolStruct_frobby(...);
FIXME: You should not use this, you should use one of the representations below. tuple[int,str] __iota_get_TestAPI_Tuples_tuple2(...);
FIXME: You should not use this, you should use one of the representations below. tuple[str,float,str] __iota_get_TestAPI_Tuples_tuple3(...);
FIXME: You should not use this, you should use one of the representations below. tuple[tuple[int,str],tuple[str,float,str],str,bool] __iota_get_TestAPI_Tuples_tuple4(...);
FIXME: You should not use this, you should use one of the representations below. tuple[str,int,tuple[tuple[int,str],tuple[str,float,str],str,bool],tuple[str,float,str],tuple[int,str]] __iota_get_TestAPI_Tuples_tuple5(...);
FIXME: You should not use this, you should use one of the representations below. tuple[str,int,float,tuple[tuple[int,str],tuple[str,float,str],str,bool],tuple[str,int,tuple[tuple[int,str],tuple[str,float,str],str,bool],tuple[str,float,str],tuple[int,str]],bool] __iota_get_TestAPI_Tuples_tuple6(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_URLs_data_image(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_URLs_local_file(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_URLs_remote_file(...);
FIXME: You should not use this, you should use one of the representations below. str __iota_get_TestAPI_URLs_simple(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_set_TestAPI_Collections_CollectionHolder_static_mutable_property(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_set_TestAPI_Methods_instance_modifiable(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_set_TestAPI_Methods_instance_stored(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_set_TestAPI_Methods_static_modifiable(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_set_TestAPI_Methods_static_stored(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_set_TestAPI_Primitives_PrimitiveHolder_static_mutable_property(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_set_TestAPI_SimpleEnum_favorite_color(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_set_TestAPI_Structs_ReferenceStruct_mutable(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_set_TestAPI_TestDefaultComputedPropertiesClass_noot(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_set_TestAPI_TestDefaultComputedPropertiesClass_spam(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_set_TestAPI_TestProtocolClass_corge(...);
FIXME: You should not use this, you should use one of the representations below. None __iota_set_TestAPI_TestProtocolClass_flarp(...);
