from . import _AssociatedDataEnum_implementation
from . import _ReferenceCaseEnum_implementation
from . import _ShadowBox_implementation
from . import _SimpleEnum_implementation
from . import _TestDefaultComputedPropertiesEnum_implementation
from . import _TestNonExportedProtocolEnum_implementation
from . import _TestProtocolEnum_implementation
from . import _UnicodeScalar_PuttingTypesIntoQuestionablePlaces_implementation
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
import fishyjoes_runtime
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
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
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
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
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
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
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
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
], None] = fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, 'TestAPI_ShadowBox_setup'))
TestAPI_SimpleEnum_setup: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    typing.Callable[[fishyjoes_runtime.UnownedRef, fishyjoes_runtime.OutCreatedRef], int],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
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
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
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
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
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
    typing.Callable[[TODO], TODO],
    typing.Callable[[TODO], TODO],
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
    fishyjoes_runtime.ensure_loaded()

    getattr(_testapi_lib, 'FishyJoes_TestAPI_registerTypes')()

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, FutureConverter<Swift.String>>')
    def _() -> None:
        print(f"setting up (@escaping (@escaping (Swift.Int) async throws -> Swift.Int, @escaping (Swift.Int) async throws -> Swift.Int) throws -> (Swift.Int) async throws -> Swift.Int) throws -> Future<Swift.String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>')
    def _() -> None:
        print(f"setting up (@escaping (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int) async throws -> String")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, FutureConverter<Swift.String>>')
    def _() -> None:
        print(f"setting up (@escaping (Swift.Float, Swift.Double, Swift.Int) async throws -> Swift.Double) throws -> Future<Swift.String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>')
    def _() -> None:
        print(f"setting up (@escaping (Swift.Int) throws -> Swift.Int, @escaping (Swift.Int) throws -> Swift.Int) throws -> (Swift.Int) throws -> Swift.Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function2Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>')
    def _() -> None:
        print(f"setting up (@escaping (Swift.Int) async throws -> Swift.Int, @escaping (Swift.Int) async throws -> Swift.Int) throws -> (Swift.Int) async throws -> Swift.Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function2Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, FutureConverter<Swift.String>>')
    def _() -> None:
        print(f"setting up (@escaping (Swift.Int) async throws -> Swift.Int) throws -> Future<Swift.String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, FutureConverter<Swift.String>>')
    def _() -> None:
        print(f"setting up (@escaping (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int, Swift.Int) async throws -> Swift.Int) throws -> Future<Swift.String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, FutureConverter<Swift.String>>')
    def _() -> None:
        print(f"setting up (@escaping (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int) async throws -> () async throws -> Swift.Int) throws -> Future<Swift.String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, FutureConverter<Swift.String>>')
    def _() -> None:
        print(f"setting up (@escaping (Swift.String, Swift.String, Swift.String, Swift.String) async throws -> Array<Swift.String>) throws -> Future<Swift.String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>')
    def _() -> None:
        print(f"setting up (@escaping (Float, Double, Int) async throws -> Double) async throws -> String")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>')
    def _() -> None:
        print(f"setting up (@escaping (Int) throws -> Int, @escaping (Int) throws -> Int) throws -> (Int) throws -> Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function2Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>')
    def _() -> None:
        print(f"setting up (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function2Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>')
    def _() -> None:
        print(f"setting up (@escaping (Int) async throws -> Int) async throws -> String")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>')
    def _() -> None:
        print(f"setting up (@escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) async throws -> String")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>')
    def _() -> None:
        print(f"setting up (@escaping (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int) async throws -> String")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>')
    def _() -> None:
        print(f"setting up (@escaping (String, String, String, String) async throws -> Array<String>) async throws -> String")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction0Converter<Swift.Int>, FutureConverter<Swift.String>>')
    def _() -> None:
        print(f"setting up (@escaping () async throws -> Swift.Int) throws -> Future<Swift.String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>')
    def _() -> None:
        print(f"setting up (@escaping () async throws -> Int) async throws -> String")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>')
    def _() -> None:
        print(f"setting up (@escaping () async throws -> Void) throws -> () async throws -> Void")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>')
    def _() -> None:
        print(f"setting up (Optional<Array<Optional<Swift.Int>>>) throws -> Optional<Array<Optional<Swift.Int>>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>')
    def _() -> None:
        print(f"setting up (Optional<Array<Optional<Int>>>) throws -> Optional<Array<Optional<Int>>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>')
    def _() -> None:
        print(f"setting up (Optional<Swift.UInt8>) throws -> Optional<Swift.UInt8>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>')
    def _() -> None:
        print(f"setting up (Optional<UInt8>) throws -> Optional<UInt8>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, FutureConverter<Swift.Double>>')
    def _() -> None:
        print(f"setting up (Swift.Float, Swift.Double, Swift.Int) throws -> Future<Swift.Double>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function3Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>')
    def _() -> None:
        print(f"setting up (Swift.Float, Swift.Double, Swift.Int) throws -> Swift.Double")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function3Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function3Converter<Swift.Int, Foundation.Data, Swift.Bool, FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>')
    def _() -> None:
        print(f"setting up (Swift.Int, Foundation.Data, Swift.Bool) throws -> Future<Result<Swift.Int, TestAPI.Methods.TheMethodError>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function3Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<Swift.Int, FutureConverter<Swift.Int>>')
    def _() -> None:
        print(f"setting up (Swift.Int) throws -> Future<Swift.Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<Swift.Int, Swift.Int>')
    def _() -> None:
        print(f"setting up (Swift.Int) throws -> Swift.Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>')
    def _() -> None:
        print(f"setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () throws -> Swift.Int, Swift.Int) throws -> Swift.Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function6Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>')
    def _() -> None:
        print(f"setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () throws -> Swift.Int) throws -> () throws -> Swift.Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function5Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, FutureConverter<Swift.Int>>')
    def _() -> None:
        print(f"setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int, Swift.Int) throws -> Future<Swift.Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function6Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, FutureConverter<AsyncFunction0Converter<Swift.Int>>>')
    def _() -> None:
        print(f"setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int) throws -> Future<() async throws -> Swift.Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function5Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, FutureConverter<ArrayConverter<Swift.String>>>')
    def _() -> None:
        print(f"setting up (Swift.String, Swift.String, Swift.String, Swift.String) throws -> Future<Array<Swift.String>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function4Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>')
    def _() -> None:
        print(f"setting up (Swift.String, Swift.String, Swift.String, Swift.String) throws -> Array<Swift.String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function4Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>')
    def _() -> None:
        print(f"setting up (Float, Double, Int) throws -> Double")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function3Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>')
    def _() -> None:
        print(f"setting up (Float, Double, Int) async throws -> Double")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction3Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction3Converter<Swift.Int, Foundation.Data, Swift.Bool, ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>')
    def _() -> None:
        print(f"setting up (Int, Data, Bool) async throws -> Result<Int, Methods.TheMethodError>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction3Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function1Converter<Swift.Int, Swift.Int>')
    def _() -> None:
        print(f"setting up (Int) throws -> Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction1Converter<Swift.Int, Swift.Int>')
    def _() -> None:
        print(f"setting up (Int) async throws -> Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>')
    def _() -> None:
        print(f"setting up (String, Int, Double, String, @escaping () throws -> Int, Int) throws -> Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function6Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>')
    def _() -> None:
        print(f"setting up (String, Int, Double, String, @escaping () throws -> Int) throws -> () throws -> Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function5Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>')
    def _() -> None:
        print(f"setting up (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction6Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>')
    def _() -> None:
        print(f"setting up (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction5Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>')
    def _() -> None:
        print(f"setting up (String, String, String, String) throws -> Array<String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function4Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>')
    def _() -> None:
        print(f"setting up (String, String, String, String) async throws -> Array<String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction4Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function0Converter<FutureConverter<Swift.Int>>')
    def _() -> None:
        print(f"setting up () throws -> Future<Swift.Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function0Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function0Converter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>')
    def _() -> None:
        print(f"setting up () throws -> Future<Void>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function0Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function0Converter<Swift.Int>')
    def _() -> None:
        print(f"setting up () throws -> Swift.Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function0Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function0Converter<Swift.Int>')
    def _() -> None:
        print(f"setting up () throws -> Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function0Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction0Converter<Swift.Int>')
    def _() -> None:
        print(f"setting up () async throws -> Int")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction0Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Function0Converter<FishyJoesCommonRuntime.VoidConverter>')
    def _() -> None:
        print(f"setting up () throws -> Void")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Function0Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>')
    def _() -> None:
        print(f"setting up () async throws -> Void")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_AsyncFunction0Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<Function1Converter<Swift.Int, Swift.Int>>')
    def _() -> None:
        print(f"setting up Future<(Swift.Int) throws -> Swift.Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<AsyncFunction1Converter<Swift.Int, Swift.Int>>')
    def _() -> None:
        print(f"setting up Future<(Swift.Int) async throws -> Swift.Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<Function0Converter<Swift.Int>>')
    def _() -> None:
        print(f"setting up Future<() throws -> Swift.Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<AsyncFunction0Converter<Swift.Int>>')
    def _() -> None:
        print(f"setting up Future<() async throws -> Swift.Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>')
    def _() -> None:
        print(f"setting up Future<() async throws -> Void>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<AsyncFunction0Converter<Swift.Int>>>')
    def _() -> None:
        print(f"setting up Future<Future<() async throws -> Swift.Int>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<ArrayConverter<Swift.String>>>')
    def _() -> None:
        print(f"setting up Future<Future<Array<Swift.String>>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>')
    def _() -> None:
        print(f"setting up Future<Future<Result<Swift.Int, TestAPI.Methods.TheMethodError>>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<Swift.Double>>')
    def _() -> None:
        print(f"setting up Future<Future<Swift.Double>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<Swift.Int>>')
    def _() -> None:
        print(f"setting up Future<Future<Swift.Int>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<Swift.String>>')
    def _() -> None:
        print(f"setting up Future<Future<Swift.String>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>')
    def _() -> None:
        print(f"setting up Future<Future<Void>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<ArrayConverter<Swift.String>>')
    def _() -> None:
        print(f"setting up Future<Array<Swift.String>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>')
    def _() -> None:
        print(f"setting up Future<Optional<Array<Optional<Swift.Int>>>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<OptionalConverter<Swift.UInt8>>')
    def _() -> None:
        print(f"setting up Future<Optional<Swift.UInt8>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>')
    def _() -> None:
        print(f"setting up Future<Result<Swift.Int, TestAPI.Methods.TheMethodError>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<Swift.Double>')
    def _() -> None:
        print(f"setting up Future<Swift.Double>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<Swift.Int>')
    def _() -> None:
        print(f"setting up Future<Swift.Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<Swift.String>')
    def _() -> None:
        print(f"setting up Future<Swift.String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<Swift.UInt>')
    def _() -> None:
        print(f"setting up Future<Swift.UInt>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_FutureConverter<FishyJoesCommonRuntime.VoidConverter>')
    def _() -> None:
        print(f"setting up Future<Void>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_FutureConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Bool>>')
    def _() -> None:
        print(f"setting up Array<Optional<Bool>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Double>>')
    def _() -> None:
        print(f"setting up Array<Optional<Double>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Float>>')
    def _() -> None:
        print(f"setting up Array<Optional<Float>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Int>>')
    def _() -> None:
        print(f"setting up Array<Optional<Int>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Int16>>')
    def _() -> None:
        print(f"setting up Array<Optional<Int16>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Int32>>')
    def _() -> None:
        print(f"setting up Array<Optional<Int32>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Int64>>')
    def _() -> None:
        print(f"setting up Array<Optional<Int64>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.Int8>>')
    def _() -> None:
        print(f"setting up Array<Optional<Int8>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.UInt>>')
    def _() -> None:
        print(f"setting up Array<Optional<UInt>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.UInt16>>')
    def _() -> None:
        print(f"setting up Array<Optional<UInt16>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.UInt32>>')
    def _() -> None:
        print(f"setting up Array<Optional<UInt32>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.UInt64>>')
    def _() -> None:
        print(f"setting up Array<Optional<UInt64>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<OptionalConverter<Swift.UInt8>>')
    def _() -> None:
        print(f"setting up Array<Optional<UInt8>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Bool>')
    def _() -> None:
        print(f"setting up Array<Bool>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Double>')
    def _() -> None:
        print(f"setting up Array<Double>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Float>')
    def _() -> None:
        print(f"setting up Array<Float>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Int>')
    def _() -> None:
        print(f"setting up Array<Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Int16>')
    def _() -> None:
        print(f"setting up Array<Int16>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Int32>')
    def _() -> None:
        print(f"setting up Array<Int32>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Int64>')
    def _() -> None:
        print(f"setting up Array<Int64>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.Int8>')
    def _() -> None:
        print(f"setting up Array<Int8>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<TestAPI.Shade>')
    def _() -> None:
        print(f"setting up Array<Shade>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.String>')
    def _() -> None:
        print(f"setting up Array<String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<TestAPI.Tree>')
    def _() -> None:
        print(f"setting up Array<Tree>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.UInt>')
    def _() -> None:
        print(f"setting up Array<UInt>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.UInt16>')
    def _() -> None:
        print(f"setting up Array<UInt16>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.UInt32>')
    def _() -> None:
        print(f"setting up Array<UInt32>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.UInt64>')
    def _() -> None:
        print(f"setting up Array<UInt64>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Swift.UInt8>')
    def _() -> None:
        print(f"setting up Array<UInt8>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ArrayConverter<Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>>')
    def _() -> None:
        print(f"setting up Array<(Int8, Int16, Int32, Int64)>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ArrayConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_DictionaryConverter<Swift.Bool, Swift.Bool>')
    def _() -> None:
        print(f"setting up Dictionary<Bool, Bool>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_DictionaryConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>')
    def _() -> None:
        print(f"setting up Dictionary<Int, Optional<Int>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_DictionaryConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_DictionaryConverter<Swift.Int, Swift.Int>')
    def _() -> None:
        print(f"setting up Dictionary<Int, Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_DictionaryConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_DictionaryConverter<Swift.String, Swift.String>')
    def _() -> None:
        print(f"setting up Dictionary<String, String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_DictionaryConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>')
    def _() -> None:
        print(f"setting up Optional<Array<Optional<Int>>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<ArrayConverter<Swift.Int>>')
    def _() -> None:
        print(f"setting up Optional<Array<Int>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>>')
    def _() -> None:
        print(f"setting up Optional<Dictionary<Int, Optional<Int>>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<DictionaryConverter<Swift.Int, Swift.Int>>')
    def _() -> None:
        print(f"setting up Optional<Dictionary<Int, Int>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<SetConverter<OptionalConverter<Swift.Int>>>')
    def _() -> None:
        print(f"setting up Optional<Set<Optional<Int>>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<SetConverter<Swift.Int>>')
    def _() -> None:
        print(f"setting up Optional<Set<Int>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Bool>')
    def _() -> None:
        print(f"setting up Optional<Bool>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Double>')
    def _() -> None:
        print(f"setting up Optional<Double>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Float>')
    def _() -> None:
        print(f"setting up Optional<Float>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Int>')
    def _() -> None:
        print(f"setting up Optional<Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Int16>')
    def _() -> None:
        print(f"setting up Optional<Int16>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Int32>')
    def _() -> None:
        print(f"setting up Optional<Int32>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Int64>')
    def _() -> None:
        print(f"setting up Optional<Int64>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.Int8>')
    def _() -> None:
        print(f"setting up Optional<Int8>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<TestAPI.Shade>')
    def _() -> None:
        print(f"setting up Optional<Shade>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<TestAPI.SimpleEnum>')
    def _() -> None:
        print(f"setting up Optional<SimpleEnum>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.String>')
    def _() -> None:
        print(f"setting up Optional<String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.UInt>')
    def _() -> None:
        print(f"setting up Optional<UInt>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.UInt16>')
    def _() -> None:
        print(f"setting up Optional<UInt16>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.UInt32>')
    def _() -> None:
        print(f"setting up Optional<UInt32>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.UInt64>')
    def _() -> None:
        print(f"setting up Optional<UInt64>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_OptionalConverter<Swift.UInt8>')
    def _() -> None:
        print(f"setting up Optional<UInt8>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_OptionalConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Double>')
    def _() -> None:
        print(f"setting up ClosedRange<Double>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Float>')
    def _() -> None:
        print(f"setting up ClosedRange<Float>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Int>')
    def _() -> None:
        print(f"setting up ClosedRange<Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Int16>')
    def _() -> None:
        print(f"setting up ClosedRange<Int16>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Int32>')
    def _() -> None:
        print(f"setting up ClosedRange<Int32>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Int64>')
    def _() -> None:
        print(f"setting up ClosedRange<Int64>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.Int8>')
    def _() -> None:
        print(f"setting up ClosedRange<Int8>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.String>')
    def _() -> None:
        print(f"setting up ClosedRange<String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.UInt>')
    def _() -> None:
        print(f"setting up ClosedRange<UInt>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.UInt16>')
    def _() -> None:
        print(f"setting up ClosedRange<UInt16>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.UInt32>')
    def _() -> None:
        print(f"setting up ClosedRange<UInt32>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.UInt64>')
    def _() -> None:
        print(f"setting up ClosedRange<UInt64>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ClosedRangeConverter<Swift.UInt8>')
    def _() -> None:
        print(f"setting up ClosedRange<UInt8>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.Int>')
    def _() -> None:
        print(f"setting up Range<Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.Int16>')
    def _() -> None:
        print(f"setting up Range<Int16>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.Int32>')
    def _() -> None:
        print(f"setting up Range<Int32>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.Int64>')
    def _() -> None:
        print(f"setting up Range<Int64>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.Int8>')
    def _() -> None:
        print(f"setting up Range<Int8>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.UInt>')
    def _() -> None:
        print(f"setting up Range<UInt>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.UInt16>')
    def _() -> None:
        print(f"setting up Range<UInt16>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.UInt32>')
    def _() -> None:
        print(f"setting up Range<UInt32>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.UInt64>')
    def _() -> None:
        print(f"setting up Range<UInt64>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_RangeConverter<Swift.UInt8>')
    def _() -> None:
        print(f"setting up Range<UInt8>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_RangeConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>')
    def _() -> None:
        print(f"setting up Result<Int, Methods.TheMethodError>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ResultConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ResultConverter<Swift.Int, TestAPI.Results.Error>')
    def _() -> None:
        print(f"setting up Result<Int, Results.Error>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ResultConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_ResultConverter<Swift.String, TestAPI.Results.Error>')
    def _() -> None:
        print(f"setting up Result<String, Results.Error>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_ResultConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_SetConverter<OptionalConverter<Swift.Int>>')
    def _() -> None:
        print(f"setting up Set<Optional<Int>>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_SetConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_SetConverter<Swift.Bool>')
    def _() -> None:
        print(f"setting up Set<Bool>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_SetConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_SetConverter<Swift.Int>')
    def _() -> None:
        print(f"setting up Set<Int>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_SetConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_SetConverter<Swift.String>')
    def _() -> None:
        print(f"setting up Set<String>")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_SetConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces')
    def _() -> None:
        print(f"setting up Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces")
        testapi._type_setup.Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Swift.String.PuttingTypesIntoQuestionablePlaces')
    def _() -> None:
        print(f"setting up Swift.String.PuttingTypesIntoQuestionablePlaces")
        testapi._type_setup.Swift_String_PuttingTypesIntoQuestionablePlaces_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces')
    def _() -> None:
        print(f"setting up Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces")
        testapi._type_setup.Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _UnicodeScalar_PuttingTypesIntoQuestionablePlaces_implementation.enum_discriminator,
            _UnicodeScalar_PuttingTypesIntoQuestionablePlaces_implementation.new_thing,
            _UnicodeScalar_PuttingTypesIntoQuestionablePlaces_implementation.extract_thing,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Actors.TemperatureLogger')
    def _() -> None:
        print(f"setting up TestAPI.Actors.TemperatureLogger")
        testapi._type_setup.TestAPI_Actors_TemperatureLogger_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _testapi.actors._temperature_logger_implementation.ffi_new),
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Collections.CollectionHolder')
    def _() -> None:
        print(f"setting up TestAPI.Collections.CollectionHolder")
        testapi._type_setup.TestAPI_Collections_CollectionHolder_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Methods.TheMethodError')
    def _() -> None:
        print(f"setting up TestAPI.Methods.TheMethodError")
        testapi._type_setup.TestAPI_Methods_TheMethodError_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _testapi._the_method_error_implementation.ffi_new),
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Primitives.PrimitiveHolder')
    def _() -> None:
        print(f"setting up TestAPI.Primitives.PrimitiveHolder")
        testapi._type_setup.TestAPI_Primitives_PrimitiveHolder_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.ReferenceOnlyTypes.Marker')
    def _() -> None:
        print(f"setting up TestAPI.ReferenceOnlyTypes.Marker")
        testapi._type_setup.TestAPI_ReferenceOnlyTypes_Marker_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _testapi.reference_only_types._marker_implementation.ffi_new),
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Results.Error')
    def _() -> None:
        print(f"setting up TestAPI.Results.Error")
        testapi._type_setup.TestAPI_Results_Error_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Structs.MemberwiseStruct')
    def _() -> None:
        print(f"setting up TestAPI.Structs.MemberwiseStruct")
        testapi._type_setup.TestAPI_Structs_MemberwiseStruct_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Structs.MutableStruct')
    def _() -> None:
        print(f"setting up TestAPI.Structs.MutableStruct")
        testapi._type_setup.TestAPI_Structs_MutableStruct_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Structs.PuttingTypesIntoQuestionablePlaces')
    def _() -> None:
        print(f"setting up TestAPI.Structs.PuttingTypesIntoQuestionablePlaces")
        testapi._type_setup.TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _testapi._structs__putting_types_into_questionable_places_implementation.ffi_new),
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Structs.ReferenceStruct')
    def _() -> None:
        print(f"setting up TestAPI.Structs.ReferenceStruct")
        testapi._type_setup.TestAPI_Structs_ReferenceStruct_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _testapi.structs._reference_struct_implementation.ffi_new),
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Structs.TwentyOneItemStruct')
    def _() -> None:
        print(f"setting up TestAPI.Structs.TwentyOneItemStruct")
        testapi._type_setup.TestAPI_Structs_TwentyOneItemStruct_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._AProtocolConverter')
    def _() -> None:
        print(f"setting up TestAPI.AProtocol")
        testapi._type_setup.TestAPI_CommonInterface__AProtocolConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.AProtocolImplementation')
    def _() -> None:
        print(f"setting up TestAPI.AProtocolImplementation")
        testapi._type_setup.TestAPI_AProtocolImplementation_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Actors')
    def _() -> None:
        print(f"setting up TestAPI.Actors")
        testapi._type_setup.TestAPI_Actors_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.AssociatedDataEnum')
    def _() -> None:
        print(f"setting up TestAPI.AssociatedDataEnum")
        testapi._type_setup.TestAPI_AssociatedDataEnum_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _AssociatedDataEnum_implementation.enum_discriminator,
            _AssociatedDataEnum_implementation.new_thing,
            _AssociatedDataEnum_implementation.extract_thing,
            _AssociatedDataEnum_implementation.new_other,
            _AssociatedDataEnum_implementation.extract_other,
            _AssociatedDataEnum_implementation.new_bar,
            _AssociatedDataEnum_implementation.extract_bar,
            _AssociatedDataEnum_implementation.new_noValue,
            _AssociatedDataEnum_implementation.extract_noValue,
            _AssociatedDataEnum_implementation.new_none,
            _AssociatedDataEnum_implementation.extract_none,
            _AssociatedDataEnum_implementation.new_simpleEnum,
            _AssociatedDataEnum_implementation.extract_simpleEnum,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.AsyncFunctions')
    def _() -> None:
        print(f"setting up TestAPI.AsyncFunctions")
        testapi._type_setup.TestAPI_AsyncFunctions_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Bytes')
    def _() -> None:
        print(f"setting up TestAPI.Bytes")
        testapi._type_setup.TestAPI_Bytes_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.ClosedRanges')
    def _() -> None:
        print(f"setting up TestAPI.ClosedRanges")
        testapi._type_setup.TestAPI_ClosedRanges_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Collections')
    def _() -> None:
        print(f"setting up TestAPI.Collections")
        testapi._type_setup.TestAPI_Collections_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.DefaultArguments')
    def _() -> None:
        print(f"setting up TestAPI.DefaultArguments")
        testapi._type_setup.TestAPI_DefaultArguments_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Deprecations')
    def _() -> None:
        print(f"setting up TestAPI.Deprecations")
        testapi._type_setup.TestAPI_Deprecations_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.EmptyClass')
    def _() -> None:
        print(f"setting up TestAPI.EmptyClass")
        testapi._type_setup.TestAPI_EmptyClass_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _testapi._empty_class1_implementation.ffi_new),
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.EmptyClass2')
    def _() -> None:
        print(f"setting up TestAPI.EmptyClass2")
        testapi._type_setup.TestAPI_EmptyClass2_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _testapi._empty_class2_implementation.ffi_new),
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.EmptyEnum')
    def _() -> None:
        print(f"setting up TestAPI.EmptyEnum")
        testapi._type_setup.TestAPI_EmptyEnum_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.EmptyStruct')
    def _() -> None:
        print(f"setting up TestAPI.EmptyStruct")
        testapi._type_setup.TestAPI_EmptyStruct_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.EmptyStruct2')
    def _() -> None:
        print(f"setting up TestAPI.EmptyStruct2")
        testapi._type_setup.TestAPI_EmptyStruct2_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Functions')
    def _() -> None:
        print(f"setting up TestAPI.Functions")
        testapi._type_setup.TestAPI_Functions_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Methods')
    def _() -> None:
        print(f"setting up TestAPI.Methods")
        testapi._type_setup.TestAPI_Methods_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _testapi._methods_implementation.ffi_new),
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Primitives')
    def _() -> None:
        print(f"setting up TestAPI.Primitives")
        testapi._type_setup.TestAPI_Primitives_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.ProtocolFixtures')
    def _() -> None:
        print(f"setting up TestAPI.ProtocolFixtures")
        testapi._type_setup.TestAPI_ProtocolFixtures_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.PythonNamingCollisions')
    def _() -> None:
        print(f"setting up TestAPI.PythonNamingCollisions")
        testapi._type_setup.TestAPI_PythonNamingCollisions_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Ranges')
    def _() -> None:
        print(f"setting up TestAPI.Ranges")
        testapi._type_setup.TestAPI_Ranges_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.ReferenceCaseEnum')
    def _() -> None:
        print(f"setting up TestAPI.ReferenceCaseEnum")
        testapi._type_setup.TestAPI_ReferenceCaseEnum_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _ReferenceCaseEnum_implementation.enum_discriminator,
            _ReferenceCaseEnum_implementation.new_north,
            _ReferenceCaseEnum_implementation.extract_north,
            _ReferenceCaseEnum_implementation.new_south,
            _ReferenceCaseEnum_implementation.extract_south,
            _ReferenceCaseEnum_implementation.new_east,
            _ReferenceCaseEnum_implementation.extract_east,
            _ReferenceCaseEnum_implementation.new_west,
            _ReferenceCaseEnum_implementation.extract_west,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.ReferenceEmptyEnum')
    def _() -> None:
        print(f"setting up TestAPI.ReferenceEmptyEnum")
        testapi._type_setup.TestAPI_ReferenceEmptyEnum_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.ReferenceOnlyTypes')
    def _() -> None:
        print(f"setting up TestAPI.ReferenceOnlyTypes")
        testapi._type_setup.TestAPI_ReferenceOnlyTypes_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Results')
    def _() -> None:
        print(f"setting up TestAPI.Results")
        testapi._type_setup.TestAPI_Results_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Shade')
    def _() -> None:
        print(f"setting up TestAPI.Shade")
        testapi._type_setup.TestAPI_Shade_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.ShadowBox')
    def _() -> None:
        print(f"setting up TestAPI.ShadowBox")
        testapi._type_setup.TestAPI_ShadowBox_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _ShadowBox_implementation.enum_discriminator,
            _ShadowBox_implementation.new_shade,
            _ShadowBox_implementation.extract_shade,
            _ShadowBox_implementation.new_empty,
            _ShadowBox_implementation.extract_empty,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.SimpleEnum')
    def _() -> None:
        print(f"setting up TestAPI.SimpleEnum")
        testapi._type_setup.TestAPI_SimpleEnum_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _SimpleEnum_implementation.enum_discriminator,
            _SimpleEnum_implementation.new_red,
            _SimpleEnum_implementation.extract_red,
            _SimpleEnum_implementation.new_green,
            _SimpleEnum_implementation.extract_green,
            _SimpleEnum_implementation.new_blue,
            _SimpleEnum_implementation.extract_blue,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Strings')
    def _() -> None:
        print(f"setting up TestAPI.Strings")
        testapi._type_setup.TestAPI_Strings_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Structs')
    def _() -> None:
        print(f"setting up TestAPI.Structs")
        testapi._type_setup.TestAPI_Structs_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestAsyncForeignSideFunctionsStruct')
    def _() -> None:
        print(f"setting up TestAPI.TestAsyncForeignSideFunctionsStruct")
        testapi._type_setup.TestAPI_TestAsyncForeignSideFunctionsStruct_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestAsyncFunctionsConverter')
    def _() -> None:
        print(f"setting up TestAPI.TestAsyncFunctions")
        testapi._type_setup.TestAPI_CommonInterface__TestAsyncFunctionsConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestAsyncSwiftSideFunctionsClass')
    def _() -> None:
        print(f"setting up TestAPI.TestAsyncSwiftSideFunctionsClass")
        testapi._type_setup.TestAPI_TestAsyncSwiftSideFunctionsClass_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _testapi._test_async_swift_side_functions_class_implementation.ffi_new),
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter')
    def _() -> None:
        print(f"setting up TestAPI.TestDefaultComputedProperties")
        testapi._type_setup.TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestDefaultComputedPropertiesClass')
    def _() -> None:
        print(f"setting up TestAPI.TestDefaultComputedPropertiesClass")
        testapi._type_setup.TestAPI_TestDefaultComputedPropertiesClass_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _testapi._test_default_computed_properties_reference_implementation.ffi_new),
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestDefaultComputedPropertiesEnum')
    def _() -> None:
        print(f"setting up TestAPI.TestDefaultComputedPropertiesEnum")
        testapi._type_setup.TestAPI_TestDefaultComputedPropertiesEnum_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _TestDefaultComputedPropertiesEnum_implementation.enum_discriminator,
            _TestDefaultComputedPropertiesEnum_implementation.new_qux,
            _TestDefaultComputedPropertiesEnum_implementation.extract_qux,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestDefaultComputedPropertiesStruct')
    def _() -> None:
        print(f"setting up TestAPI.TestDefaultComputedPropertiesStruct")
        testapi._type_setup.TestAPI_TestDefaultComputedPropertiesStruct_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter')
    def _() -> None:
        print(f"setting up TestAPI.TestDifferingExportNameProtocol")
        testapi._type_setup.TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestDifferingExportNameStruct')
    def _() -> None:
        print(f"setting up TestAPI.TestDifferingExportNameStruct")
        testapi._type_setup.TestAPI_TestDifferingExportNameStruct_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter')
    def _() -> None:
        print(f"setting up TestAPI.TestLeadingUnderscoredProp")
        testapi._type_setup.TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestLeadingUnderscoredPropStruct')
    def _() -> None:
        print(f"setting up TestAPI.TestLeadingUnderscoredPropStruct")
        testapi._type_setup.TestAPI_TestLeadingUnderscoredPropStruct_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestMethodsProtocolConverter')
    def _() -> None:
        print(f"setting up TestAPI.TestMethodsProtocol")
        testapi._type_setup.TestAPI_CommonInterface__TestMethodsProtocolConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestNonExportedProtocolEnum')
    def _() -> None:
        print(f"setting up TestAPI.TestNonExportedProtocolEnum")
        testapi._type_setup.TestAPI_TestNonExportedProtocolEnum_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _TestNonExportedProtocolEnum_implementation.enum_discriminator,
            _TestNonExportedProtocolEnum_implementation.new_hogehoge,
            _TestNonExportedProtocolEnum_implementation.extract_hogehoge,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestOptionalsProtocolConverter')
    def _() -> None:
        print(f"setting up TestAPI.TestOptionalsProtocol")
        testapi._type_setup.TestAPI_CommonInterface__TestOptionalsProtocolConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI_CommonInterface._TestPropertiesProtocolConverter')
    def _() -> None:
        print(f"setting up TestAPI.TestPropertiesProtocol")
        testapi._type_setup.TestAPI_CommonInterface__TestPropertiesProtocolConverter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestProtocolClass')
    def _() -> None:
        print(f"setting up TestAPI.TestProtocolClass")
        testapi._type_setup.TestAPI_TestProtocolClass_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _testapi._test_protocol_class_implementation.ffi_new),
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestProtocolEnum')
    def _() -> None:
        print(f"setting up TestAPI.TestProtocolEnum")
        testapi._type_setup.TestAPI_TestProtocolEnum_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
            _TestProtocolEnum_implementation.enum_discriminator,
            _TestProtocolEnum_implementation.new_qux,
            _TestProtocolEnum_implementation.extract_qux,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.TestProtocolStruct')
    def _() -> None:
        print(f"setting up TestAPI.TestProtocolStruct")
        testapi._type_setup.TestAPI_TestProtocolStruct_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Tree')
    def _() -> None:
        print(f"setting up TestAPI.Tree")
        testapi._type_setup.TestAPI_Tree_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.Tuples')
    def _() -> None:
        print(f"setting up TestAPI.Tuples")
        testapi._type_setup.TestAPI_Tuples_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_TestAPI.URLs')
    def _() -> None:
        print(f"setting up TestAPI.URLs")
        testapi._type_setup.TestAPI_URLs_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>')
    def _() -> None:
        print(f"setting up (Bool, Double, Array<String>)")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Tuple3Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>')
    def _() -> None:
        print(f"setting up (Bool, Int, String)")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Tuple3Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Tuple2Converter<Swift.Int, Swift.String>')
    def _() -> None:
        print(f"setting up (Int, String)")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Tuple2Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>')
    def _() -> None:
        print(f"setting up (Int8, Int16, Int32, Int64)")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Tuple4Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Tuple3Converter<Swift.String, Swift.Double, Swift.String>')
    def _() -> None:
        print(f"setting up (String, Double, String)")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Tuple3Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>')
    def _() -> None:
        print(f"setting up (String, Int, Double, ((Int, String), (String, Double, String), String, Bool), (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)), Bool)")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Tuple6Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>')
    def _() -> None:
        print(f"setting up (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String))")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Tuple5Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )

    @fishyjoes_runtime.eval_once_now('setup_Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>')
    def _() -> None:
        print(f"setting up ((Int, String), (String, Double, String), String, Bool)")
        fishyjoes_runtime._type_setup.FishyJoesCommonRuntime_Tuple4Converter_setup(
            fishyjoes_runtime.Runtime.shared.env_ref,
        )
