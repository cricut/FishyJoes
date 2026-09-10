_testapi_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_new_thing: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_extract_thing: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]
_testapi_AssociatedDataEnum_new_thing: TypeAlias = Callable[[
        TODO[ffiConsumedTag],
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_AssociatedDataEnum_extract_thing: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        TODO[ffiOutCreatedTag],
        OutCreatedRef _exn
    ], None]
_testapi_AssociatedDataEnum_new_other: TypeAlias = Callable[[
        TODO[ffiConsumedTag],
        TODO[ffiConsumedTag],
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_AssociatedDataEnum_extract_other: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        TODO[ffiOutCreatedTag],
        TODO[ffiOutCreatedTag],
        OutCreatedRef _exn
    ], None]
_testapi_AssociatedDataEnum_new_bar: TypeAlias = Callable[[
        TODO[ffiConsumedTag],
        TODO[ffiConsumedTag],
        TODO[ffiConsumedTag],
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_AssociatedDataEnum_extract_bar: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        TODO[ffiOutCreatedTag],
        TODO[ffiOutCreatedTag],
        TODO[ffiOutCreatedTag],
        OutCreatedRef _exn
    ], None]
_testapi_AssociatedDataEnum_new_noValue: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_AssociatedDataEnum_extract_noValue: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]
_testapi_AssociatedDataEnum_new_none: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_AssociatedDataEnum_extract_none: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]
_testapi_AssociatedDataEnum_new_simpleEnum: TypeAlias = Callable[[
        TODO[ffiConsumedTag],
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_AssociatedDataEnum_extract_simpleEnum: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        TODO[ffiOutCreatedTag],
        OutCreatedRef _exn
    ], None]
_testapi_ReferenceCaseEnum_new_north: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_ReferenceCaseEnum_extract_north: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]
_testapi_ReferenceCaseEnum_new_south: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_ReferenceCaseEnum_extract_south: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]
_testapi_ReferenceCaseEnum_new_east: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_ReferenceCaseEnum_extract_east: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]
_testapi_ReferenceCaseEnum_new_west: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_ReferenceCaseEnum_extract_west: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]
_testapi_ShadowBox_new_shade: TypeAlias = Callable[[
        TODO[ffiConsumedTag],
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_ShadowBox_extract_shade: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        TODO[ffiOutCreatedTag],
        OutCreatedRef _exn
    ], None]
_testapi_ShadowBox_new_empty: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_ShadowBox_extract_empty: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]
_testapi_SimpleEnum_new_red: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_SimpleEnum_extract_red: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]
_testapi_SimpleEnum_new_green: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_SimpleEnum_extract_green: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]
_testapi_SimpleEnum_new_blue: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_SimpleEnum_extract_blue: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]
_testapi_TestDefaultComputedPropertiesEnum_new_qux: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_TestDefaultComputedPropertiesEnum_extract_qux: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]
_testapi_TestNonExportedProtocolEnum_new_hogehoge: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_TestNonExportedProtocolEnum_extract_hogehoge: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]
_testapi_TestProtocolEnum_new_qux: TypeAlias = Callable[[
        OutCreatedRef
    ], TODO[ffiCreatedTag]]
_testapi_TestProtocolEnum_extract_qux: TypeAlias = Callable[[
        TODO[ffiUnownedName],
        OutCreatedRef _exn
    ], None]

final ensureLoaded = (() {
    FishyJoesRuntime.Loader.shared.ensureLoaded;

    final dylib = Loader.openLibrary('TestAPI-iota');
    final arena = ffi.Arena();

    dylib.lookupFunction<ffi.Void Function(), void Function()>('FishyJoes_TestAPI_registerTypes')();

    final Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup');
    final Swift_String_PuttingTypesIntoQuestionablePlaces_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('Swift_String_PuttingTypesIntoQuestionablePlaces_setup');
    final Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None thing_constructor,
            None thing_extractor,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None thing_constructor,
            None thing_extractor,
            OutCreatedRef exn
        )
    >('Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup');
    final TestAPI_Actors_TemperatureLogger_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_Actors_TemperatureLogger_setup');
    final TestAPI_Collections_CollectionHolder_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Collections_CollectionHolder_setup');
    final TestAPI_Methods_TheMethodError_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_Methods_TheMethodError_setup');
    final TestAPI_Primitives_PrimitiveHolder_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Primitives_PrimitiveHolder_setup');
    final TestAPI_ReferenceOnlyTypes_Marker_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_ReferenceOnlyTypes_Marker_setup');
    final TestAPI_Results_Error_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Results_Error_setup');
    final TestAPI_Structs_MemberwiseStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Structs_MemberwiseStruct_setup');
    final TestAPI_Structs_MutableStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Structs_MutableStruct_setup');
    final TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup');
    final TestAPI_Structs_ReferenceStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_Structs_ReferenceStruct_setup');
    final TestAPI_Structs_TwentyOneItemStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Structs_TwentyOneItemStruct_setup');
    final TestAPI_CommonInterface__AProtocolConverter_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_CommonInterface__AProtocolConverter_setup');
    final TestAPI_AProtocolImplementation_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_AProtocolImplementation_setup');
    final TestAPI_Actors_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Actors_setup');
    final TestAPI_AssociatedDataEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None thing_constructor,
            None thing_extractor,
            None other_constructor,
            None other_extractor,
            None bar_constructor,
            None bar_extractor,
            None noValue_constructor,
            None noValue_extractor,
            None none_constructor,
            None none_extractor,
            None simpleEnum_constructor,
            None simpleEnum_extractor,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None thing_constructor,
            None thing_extractor,
            None other_constructor,
            None other_extractor,
            None bar_constructor,
            None bar_extractor,
            None noValue_constructor,
            None noValue_extractor,
            None none_constructor,
            None none_extractor,
            None simpleEnum_constructor,
            None simpleEnum_extractor,
            OutCreatedRef exn
        )
    >('TestAPI_AssociatedDataEnum_setup');
    final TestAPI_AsyncFunctions_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_AsyncFunctions_setup');
    final TestAPI_Bytes_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Bytes_setup');
    final TestAPI_ClosedRanges_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_ClosedRanges_setup');
    final TestAPI_Collections_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Collections_setup');
    final TestAPI_DefaultArguments_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_DefaultArguments_setup');
    final TestAPI_Deprecations_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Deprecations_setup');
    final TestAPI_EmptyClass_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_EmptyClass_setup');
    final TestAPI_EmptyClass2_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_EmptyClass2_setup');
    final TestAPI_EmptyEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_EmptyEnum_setup');
    final TestAPI_EmptyStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_EmptyStruct_setup');
    final TestAPI_EmptyStruct2_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_EmptyStruct2_setup');
    final TestAPI_Functions_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Functions_setup');
    final TestAPI_Methods_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_Methods_setup');
    final TestAPI_Primitives_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Primitives_setup');
    final TestAPI_ProtocolFixtures_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_ProtocolFixtures_setup');
    final TestAPI_PythonNamingCollisions_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_PythonNamingCollisions_setup');
    final TestAPI_Ranges_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Ranges_setup');
    final TestAPI_ReferenceCaseEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None north_constructor,
            None north_extractor,
            None south_constructor,
            None south_extractor,
            None east_constructor,
            None east_extractor,
            None west_constructor,
            None west_extractor,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None north_constructor,
            None north_extractor,
            None south_constructor,
            None south_extractor,
            None east_constructor,
            None east_extractor,
            None west_constructor,
            None west_extractor,
            OutCreatedRef exn
        )
    >('TestAPI_ReferenceCaseEnum_setup');
    final TestAPI_ReferenceEmptyEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_ReferenceEmptyEnum_setup');
    final TestAPI_ReferenceOnlyTypes_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_ReferenceOnlyTypes_setup');
    final TestAPI_Results_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Results_setup');
    final TestAPI_Shade_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Shade_setup');
    final TestAPI_ShadowBox_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None shade_constructor,
            None shade_extractor,
            None empty_constructor,
            None empty_extractor,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None shade_constructor,
            None shade_extractor,
            None empty_constructor,
            None empty_extractor,
            OutCreatedRef exn
        )
    >('TestAPI_ShadowBox_setup');
    final TestAPI_SimpleEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None red_constructor,
            None red_extractor,
            None green_constructor,
            None green_extractor,
            None blue_constructor,
            None blue_extractor,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None red_constructor,
            None red_extractor,
            None green_constructor,
            None green_extractor,
            None blue_constructor,
            None blue_extractor,
            OutCreatedRef exn
        )
    >('TestAPI_SimpleEnum_setup');
    final TestAPI_Strings_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Strings_setup');
    final TestAPI_Structs_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Structs_setup');
    final TestAPI_TestAsyncForeignSideFunctionsStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_TestAsyncForeignSideFunctionsStruct_setup');
    final TestAPI_CommonInterface__TestAsyncFunctionsConverter_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_CommonInterface__TestAsyncFunctionsConverter_setup');
    final TestAPI_TestAsyncSwiftSideFunctionsClass_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_TestAsyncSwiftSideFunctionsClass_setup');
    final TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_setup');
    final TestAPI_TestDefaultComputedPropertiesClass_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_TestDefaultComputedPropertiesClass_setup');
    final TestAPI_TestDefaultComputedPropertiesEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None qux_constructor,
            None qux_extractor,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None qux_constructor,
            None qux_extractor,
            OutCreatedRef exn
        )
    >('TestAPI_TestDefaultComputedPropertiesEnum_setup');
    final TestAPI_TestDefaultComputedPropertiesStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_TestDefaultComputedPropertiesStruct_setup');
    final TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_setup');
    final TestAPI_TestDifferingExportNameStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_TestDifferingExportNameStruct_setup');
    final TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_setup');
    final TestAPI_TestLeadingUnderscoredPropStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_TestLeadingUnderscoredPropStruct_setup');
    final TestAPI_CommonInterface__TestMethodsProtocolConverter_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_CommonInterface__TestMethodsProtocolConverter_setup');
    final TestAPI_TestNonExportedProtocolEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None hogehoge_constructor,
            None hogehoge_extractor,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None hogehoge_constructor,
            None hogehoge_extractor,
            OutCreatedRef exn
        )
    >('TestAPI_TestNonExportedProtocolEnum_setup');
    final TestAPI_CommonInterface__TestOptionalsProtocolConverter_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_CommonInterface__TestOptionalsProtocolConverter_setup');
    final TestAPI_CommonInterface__TestPropertiesProtocolConverter_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_CommonInterface__TestPropertiesProtocolConverter_setup');
    final TestAPI_TestProtocolClass_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.ConsumedSwiftRef, fishyjoes_runtime.OutCreatedHostRef], fishyjoes_runtime.CreatedHostRef] constructorMethod,
            OutCreatedRef exn
        )
    >('TestAPI_TestProtocolClass_setup');
    final TestAPI_TestProtocolEnum_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None qux_constructor,
            None qux_extractor,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            typing.Callable[[fishyjoes_runtime.UnownedHostRef, fishyjoes_runtime.OutCreatedHostRef], int] discriminator,
            None qux_constructor,
            None qux_extractor,
            OutCreatedRef exn
        )
    >('TestAPI_TestProtocolEnum_setup');
    final TestAPI_TestProtocolStruct_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_TestProtocolStruct_setup');
    final TestAPI_Tree_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Tree_setup');
    final TestAPI_Tuples_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_Tuples_setup');
    final TestAPI_URLs_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            OutCreatedRef exn
        )
    >('TestAPI_URLs_setup');

    Loader.shared.once("setup_Function1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, FutureConverter<Swift.String>>", () {
        // print("setting up (@escaping (@escaping (Swift.Int) async throws -> Swift.Int, @escaping (Swift.Int) async throws -> Swift.Int) throws -> (Swift.Int) async throws -> Swift.Int) throws -> Future<Swift.String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>", () {
        // print("setting up (@escaping (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int) async throws -> String (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, FutureConverter<Swift.String>>", () {
        // print("setting up (@escaping (Swift.Float, Swift.Double, Swift.Int) async throws -> Swift.Double) throws -> Future<Swift.String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>", () {
        // print("setting up (@escaping (Swift.Int) throws -> Swift.Int, @escaping (Swift.Int) throws -> Swift.Int) throws -> (Swift.Int) throws -> Swift.Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function2Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>", () {
        // print("setting up (@escaping (Swift.Int) async throws -> Swift.Int, @escaping (Swift.Int) async throws -> Swift.Int) throws -> (Swift.Int) async throws -> Swift.Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function2Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, FutureConverter<Swift.String>>", () {
        // print("setting up (@escaping (Swift.Int) async throws -> Swift.Int) throws -> Future<Swift.String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, FutureConverter<Swift.String>>", () {
        // print("setting up (@escaping (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int, Swift.Int) async throws -> Swift.Int) throws -> Future<Swift.String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, FutureConverter<Swift.String>>", () {
        // print("setting up (@escaping (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int) async throws -> () async throws -> Swift.Int) throws -> Future<Swift.String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, FutureConverter<Swift.String>>", () {
        // print("setting up (@escaping (Swift.String, Swift.String, Swift.String, Swift.String) async throws -> Array<Swift.String>) throws -> Future<Swift.String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>", () {
        // print("setting up (@escaping (Float, Double, Int) async throws -> Double) async throws -> String (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>", () {
        // print("setting up (@escaping (Int) throws -> Int, @escaping (Int) throws -> Int) throws -> (Int) throws -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function2Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>", () {
        // print("setting up (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function2Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>", () {
        // print("setting up (@escaping (Int) async throws -> Int) async throws -> String (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>", () {
        // print("setting up (@escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) async throws -> String (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>", () {
        // print("setting up (@escaping (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int) async throws -> String (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>", () {
        // print("setting up (@escaping (String, String, String, String) async throws -> Array<String>) async throws -> String (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<AsyncFunction0Converter<Swift.Int>, FutureConverter<Swift.String>>", () {
        // print("setting up (@escaping () async throws -> Swift.Int) throws -> Future<Swift.String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>", () {
        // print("setting up (@escaping () async throws -> Int) async throws -> String (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>", () {
        // print("setting up (@escaping () async throws -> Void) throws -> () async throws -> Void (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>", () {
        // print("setting up (Optional<Array<Optional<Swift.Int>>>) throws -> Optional<Array<Optional<Swift.Int>>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>", () {
        // print("setting up (Optional<Array<Optional<Int>>>) throws -> Optional<Array<Optional<Int>>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>", () {
        // print("setting up (Optional<Swift.UInt8>) throws -> Optional<Swift.UInt8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>", () {
        // print("setting up (Optional<UInt8>) throws -> Optional<UInt8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, FutureConverter<Swift.Double>>", () {
        // print("setting up (Swift.Float, Swift.Double, Swift.Int) throws -> Future<Swift.Double> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function3Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>", () {
        // print("setting up (Swift.Float, Swift.Double, Swift.Int) throws -> Swift.Double (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function3Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function3Converter<Swift.Int, Foundation.Data, Swift.Bool, FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>", () {
        // print("setting up (Swift.Int, Foundation.Data, Swift.Bool) throws -> Future<Result<Swift.Int, TestAPI.Methods.TheMethodError>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function3Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<Swift.Int, FutureConverter<Swift.Int>>", () {
        // print("setting up (Swift.Int) throws -> Future<Swift.Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<Swift.Int, Swift.Int>", () {
        // print("setting up (Swift.Int) throws -> Swift.Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>", () {
        // print("setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () throws -> Swift.Int, Swift.Int) throws -> Swift.Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function6Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>", () {
        // print("setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () throws -> Swift.Int) throws -> () throws -> Swift.Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function5Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, FutureConverter<Swift.Int>>", () {
        // print("setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int, Swift.Int) throws -> Future<Swift.Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function6Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, FutureConverter<AsyncFunction0Converter<Swift.Int>>>", () {
        // print("setting up (Swift.String, Swift.Int, Swift.Double, Swift.String, @escaping () async throws -> Swift.Int) throws -> Future<() async throws -> Swift.Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function5Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, FutureConverter<ArrayConverter<Swift.String>>>", () {
        // print("setting up (Swift.String, Swift.String, Swift.String, Swift.String) throws -> Future<Array<Swift.String>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function4Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", () {
        // print("setting up (Swift.String, Swift.String, Swift.String, Swift.String) throws -> Array<Swift.String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function4Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>", () {
        // print("setting up (Float, Double, Int) throws -> Double (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function3Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>", () {
        // print("setting up (Float, Double, Int) async throws -> Double (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction3Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction3Converter<Swift.Int, Foundation.Data, Swift.Bool, ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>", () {
        // print("setting up (Int, Data, Bool) async throws -> Result<Int, Methods.TheMethodError> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction3Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<Swift.Int, Swift.Int>", () {
        // print("setting up (Int) throws -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction1Converter<Swift.Int, Swift.Int>", () {
        // print("setting up (Int) async throws -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction1Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>", () {
        // print("setting up (String, Int, Double, String, @escaping () throws -> Int, Int) throws -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function6Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>", () {
        // print("setting up (String, Int, Double, String, @escaping () throws -> Int) throws -> () throws -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function5Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>", () {
        // print("setting up (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction6Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>", () {
        // print("setting up (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction5Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", () {
        // print("setting up (String, String, String, String) throws -> Array<String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function4Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", () {
        // print("setting up (String, String, String, String) async throws -> Array<String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction4Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function0Converter<FutureConverter<Swift.Int>>", () {
        // print("setting up () throws -> Future<Swift.Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function0Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function0Converter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>", () {
        // print("setting up () throws -> Future<Void> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function0Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function0Converter<Swift.Int>", () {
        // print("setting up () throws -> Swift.Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function0Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function0Converter<Swift.Int>", () {
        // print("setting up () throws -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function0Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction0Converter<Swift.Int>", () {
        // print("setting up () async throws -> Int (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction0Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Function0Converter<FishyJoesCommonRuntime.VoidConverter>", () {
        // print("setting up () throws -> Void (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function0Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>", () {
        // print("setting up () async throws -> Void (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_AsyncFunction0Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<Function1Converter<Swift.Int, Swift.Int>>", () {
        // print("setting up Future<(Swift.Int) throws -> Swift.Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<AsyncFunction1Converter<Swift.Int, Swift.Int>>", () {
        // print("setting up Future<(Swift.Int) async throws -> Swift.Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<Function0Converter<Swift.Int>>", () {
        // print("setting up Future<() throws -> Swift.Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<AsyncFunction0Converter<Swift.Int>>", () {
        // print("setting up Future<() async throws -> Swift.Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>", () {
        // print("setting up Future<() async throws -> Void> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<FutureConverter<AsyncFunction0Converter<Swift.Int>>>", () {
        // print("setting up Future<Future<() async throws -> Swift.Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<FutureConverter<ArrayConverter<Swift.String>>>", () {
        // print("setting up Future<Future<Array<Swift.String>>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>", () {
        // print("setting up Future<Future<Result<Swift.Int, TestAPI.Methods.TheMethodError>>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<FutureConverter<Swift.Double>>", () {
        // print("setting up Future<Future<Swift.Double>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<FutureConverter<Swift.Int>>", () {
        // print("setting up Future<Future<Swift.Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<FutureConverter<Swift.String>>", () {
        // print("setting up Future<Future<Swift.String>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>", () {
        // print("setting up Future<Future<Void>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<ArrayConverter<Swift.String>>", () {
        // print("setting up Future<Array<Swift.String>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>", () {
        // print("setting up Future<Optional<Array<Optional<Swift.Int>>>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<OptionalConverter<Swift.UInt8>>", () {
        // print("setting up Future<Optional<Swift.UInt8>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>", () {
        // print("setting up Future<Result<Swift.Int, TestAPI.Methods.TheMethodError>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<Swift.Double>", () {
        // print("setting up Future<Swift.Double> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<Swift.Int>", () {
        // print("setting up Future<Swift.Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<Swift.String>", () {
        // print("setting up Future<Swift.String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<Swift.UInt>", () {
        // print("setting up Future<Swift.UInt> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<FishyJoesCommonRuntime.VoidConverter>", () {
        // print("setting up Future<Void> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Bool>>", () {
        // print("setting up Array<Optional<Bool>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Double>>", () {
        // print("setting up Array<Optional<Double>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Float>>", () {
        // print("setting up Array<Optional<Float>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Int>>", () {
        // print("setting up Array<Optional<Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Int16>>", () {
        // print("setting up Array<Optional<Int16>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Int32>>", () {
        // print("setting up Array<Optional<Int32>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Int64>>", () {
        // print("setting up Array<Optional<Int64>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.Int8>>", () {
        // print("setting up Array<Optional<Int8>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.UInt>>", () {
        // print("setting up Array<Optional<UInt>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.UInt16>>", () {
        // print("setting up Array<Optional<UInt16>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.UInt32>>", () {
        // print("setting up Array<Optional<UInt32>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.UInt64>>", () {
        // print("setting up Array<Optional<UInt64>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<OptionalConverter<Swift.UInt8>>", () {
        // print("setting up Array<Optional<UInt8>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Bool>", () {
        // print("setting up Array<Bool> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Double>", () {
        // print("setting up Array<Double> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Float>", () {
        // print("setting up Array<Float> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Int>", () {
        // print("setting up Array<Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Int16>", () {
        // print("setting up Array<Int16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Int32>", () {
        // print("setting up Array<Int32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Int64>", () {
        // print("setting up Array<Int64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.Int8>", () {
        // print("setting up Array<Int8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<TestAPI.Shade>", () {
        // print("setting up Array<Shade> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.String>", () {
        // print("setting up Array<String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<TestAPI.Tree>", () {
        // print("setting up Array<Tree> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.UInt>", () {
        // print("setting up Array<UInt> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.UInt16>", () {
        // print("setting up Array<UInt16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.UInt32>", () {
        // print("setting up Array<UInt32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.UInt64>", () {
        // print("setting up Array<UInt64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Swift.UInt8>", () {
        // print("setting up Array<UInt8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ArrayConverter<Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>>", () {
        // print("setting up Array<(Int8, Int16, Int32, Int64)> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ArrayConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Swift.Bool, Swift.Bool>", () {
        // print("setting up Dictionary<Bool, Bool> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_DictionaryConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>", () {
        // print("setting up Dictionary<Int, Optional<Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_DictionaryConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Swift.Int, Swift.Int>", () {
        // print("setting up Dictionary<Int, Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_DictionaryConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_DictionaryConverter<Swift.String, Swift.String>", () {
        // print("setting up Dictionary<String, String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_DictionaryConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>", () {
        // print("setting up Optional<Array<Optional<Int>>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<ArrayConverter<Swift.Int>>", () {
        // print("setting up Optional<Array<Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>>", () {
        // print("setting up Optional<Dictionary<Int, Optional<Int>>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<DictionaryConverter<Swift.Int, Swift.Int>>", () {
        // print("setting up Optional<Dictionary<Int, Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<SetConverter<OptionalConverter<Swift.Int>>>", () {
        // print("setting up Optional<Set<Optional<Int>>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<SetConverter<Swift.Int>>", () {
        // print("setting up Optional<Set<Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Bool>", () {
        // print("setting up Optional<Bool> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Double>", () {
        // print("setting up Optional<Double> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Float>", () {
        // print("setting up Optional<Float> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Int>", () {
        // print("setting up Optional<Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Int16>", () {
        // print("setting up Optional<Int16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Int32>", () {
        // print("setting up Optional<Int32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Int64>", () {
        // print("setting up Optional<Int64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.Int8>", () {
        // print("setting up Optional<Int8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<TestAPI.Shade>", () {
        // print("setting up Optional<Shade> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<TestAPI.SimpleEnum>", () {
        // print("setting up Optional<SimpleEnum> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.String>", () {
        // print("setting up Optional<String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.UInt>", () {
        // print("setting up Optional<UInt> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.UInt16>", () {
        // print("setting up Optional<UInt16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.UInt32>", () {
        // print("setting up Optional<UInt32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.UInt64>", () {
        // print("setting up Optional<UInt64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.UInt8>", () {
        // print("setting up Optional<UInt8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Double>", () {
        // print("setting up ClosedRange<Double> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Float>", () {
        // print("setting up ClosedRange<Float> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Int>", () {
        // print("setting up ClosedRange<Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Int16>", () {
        // print("setting up ClosedRange<Int16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Int32>", () {
        // print("setting up ClosedRange<Int32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Int64>", () {
        // print("setting up ClosedRange<Int64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.Int8>", () {
        // print("setting up ClosedRange<Int8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.String>", () {
        // print("setting up ClosedRange<String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.UInt>", () {
        // print("setting up ClosedRange<UInt> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.UInt16>", () {
        // print("setting up ClosedRange<UInt16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.UInt32>", () {
        // print("setting up ClosedRange<UInt32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.UInt64>", () {
        // print("setting up ClosedRange<UInt64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ClosedRangeConverter<Swift.UInt8>", () {
        // print("setting up ClosedRange<UInt8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.Int>", () {
        // print("setting up Range<Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.Int16>", () {
        // print("setting up Range<Int16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.Int32>", () {
        // print("setting up Range<Int32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.Int64>", () {
        // print("setting up Range<Int64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.Int8>", () {
        // print("setting up Range<Int8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.UInt>", () {
        // print("setting up Range<UInt> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.UInt16>", () {
        // print("setting up Range<UInt16> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.UInt32>", () {
        // print("setting up Range<UInt32> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.UInt64>", () {
        // print("setting up Range<UInt64> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_RangeConverter<Swift.UInt8>", () {
        // print("setting up Range<UInt8> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_RangeConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>", () {
        // print("setting up Result<Int, Methods.TheMethodError> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ResultConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ResultConverter<Swift.Int, TestAPI.Results.Error>", () {
        // print("setting up Result<Int, Results.Error> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ResultConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_ResultConverter<Swift.String, TestAPI.Results.Error>", () {
        // print("setting up Result<String, Results.Error> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_ResultConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<OptionalConverter<Swift.Int>>", () {
        // print("setting up Set<Optional<Int>> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_SetConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<Swift.Bool>", () {
        // print("setting up Set<Bool> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_SetConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<Swift.Int>", () {
        // print("setting up Set<Int> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_SetConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<Swift.String>", () {
        // print("setting up Set<String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_SetConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces", () {
        // print("setting up Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Swift.String.PuttingTypesIntoQuestionablePlaces", () {
        // print("setting up Swift.String.PuttingTypesIntoQuestionablePlaces (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Swift_String_PuttingTypesIntoQuestionablePlaces_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces", () {
        // print("setting up Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.UnicodeScalar_PuttingTypesIntoQuestionablePlaces.enumDiscriminator, 0),
                ffi.Pointer.fromFunction(testapi.UnicodeScalar_PuttingTypesIntoQuestionablePlaces.newThing),
                ffi.Pointer.fromFunction(testapi.UnicodeScalar_PuttingTypesIntoQuestionablePlaces.extractThing),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Actors.TemperatureLogger", () {
        // print("setting up TestAPI.Actors.TemperatureLogger (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Actors_TemperatureLogger_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.Actors.TemperatureLogger.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Collections.CollectionHolder", () {
        // print("setting up TestAPI.Collections.CollectionHolder (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Collections_CollectionHolder_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Methods.TheMethodError", () {
        // print("setting up TestAPI.Methods.TheMethodError (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Methods_TheMethodError_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.TheMethodError.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Primitives.PrimitiveHolder", () {
        // print("setting up TestAPI.Primitives.PrimitiveHolder (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Primitives_PrimitiveHolder_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.ReferenceOnlyTypes.Marker", () {
        // print("setting up TestAPI.ReferenceOnlyTypes.Marker (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_ReferenceOnlyTypes_Marker_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.ReferenceOnlyTypes.Marker.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Results.Error", () {
        // print("setting up TestAPI.Results.Error (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Results_Error_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Structs.MemberwiseStruct", () {
        // print("setting up TestAPI.Structs.MemberwiseStruct (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Structs_MemberwiseStruct_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Structs.MutableStruct", () {
        // print("setting up TestAPI.Structs.MutableStruct (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Structs_MutableStruct_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Structs.PuttingTypesIntoQuestionablePlaces", () {
        // print("setting up TestAPI.Structs.PuttingTypesIntoQuestionablePlaces (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.Structs_PuttingTypesIntoQuestionablePlaces.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Structs.ReferenceStruct", () {
        // print("setting up TestAPI.Structs.ReferenceStruct (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Structs_ReferenceStruct_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.Structs.ReferenceStruct.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Structs.TwentyOneItemStruct", () {
        // print("setting up TestAPI.Structs.TwentyOneItemStruct (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Structs_TwentyOneItemStruct_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI_CommonInterface._AProtocolConverter", () {
        // print("setting up TestAPI.AProtocol (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_CommonInterface__AProtocolConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.AProtocolImplementation", () {
        // print("setting up TestAPI.AProtocolImplementation (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_AProtocolImplementation_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Actors", () {
        // print("setting up TestAPI.Actors (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Actors_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.AssociatedDataEnum", () {
        // print("setting up TestAPI.AssociatedDataEnum (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_AssociatedDataEnum_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.AssociatedDataEnum.enumDiscriminator, 0),
                ffi.Pointer.fromFunction(testapi.AssociatedDataEnum.newThing),
                ffi.Pointer.fromFunction(testapi.AssociatedDataEnum.extractThing),
                ffi.Pointer.fromFunction(testapi.AssociatedDataEnum.newOther),
                ffi.Pointer.fromFunction(testapi.AssociatedDataEnum.extractOther),
                ffi.Pointer.fromFunction(testapi.AssociatedDataEnum.newBar),
                ffi.Pointer.fromFunction(testapi.AssociatedDataEnum.extractBar),
                ffi.Pointer.fromFunction(testapi.AssociatedDataEnum.newNoValue),
                ffi.Pointer.fromFunction(testapi.AssociatedDataEnum.extractNoValue),
                ffi.Pointer.fromFunction(testapi.AssociatedDataEnum.newNone),
                ffi.Pointer.fromFunction(testapi.AssociatedDataEnum.extractNone),
                ffi.Pointer.fromFunction(testapi.AssociatedDataEnum.newSimpleEnum),
                ffi.Pointer.fromFunction(testapi.AssociatedDataEnum.extractSimpleEnum),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.AsyncFunctions", () {
        // print("setting up TestAPI.AsyncFunctions (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_AsyncFunctions_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Bytes", () {
        // print("setting up TestAPI.Bytes (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Bytes_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.ClosedRanges", () {
        // print("setting up TestAPI.ClosedRanges (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_ClosedRanges_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Collections", () {
        // print("setting up TestAPI.Collections (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Collections_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.DefaultArguments", () {
        // print("setting up TestAPI.DefaultArguments (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_DefaultArguments_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Deprecations", () {
        // print("setting up TestAPI.Deprecations (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Deprecations_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.EmptyClass", () {
        // print("setting up TestAPI.EmptyClass (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_EmptyClass_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.EmptyClass1.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.EmptyClass2", () {
        // print("setting up TestAPI.EmptyClass2 (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_EmptyClass2_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.EmptyClass2.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.EmptyEnum", () {
        // print("setting up TestAPI.EmptyEnum (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_EmptyEnum_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.EmptyStruct", () {
        // print("setting up TestAPI.EmptyStruct (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_EmptyStruct_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.EmptyStruct2", () {
        // print("setting up TestAPI.EmptyStruct2 (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_EmptyStruct2_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Functions", () {
        // print("setting up TestAPI.Functions (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Functions_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Methods", () {
        // print("setting up TestAPI.Methods (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Methods_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.Methods.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Primitives", () {
        // print("setting up TestAPI.Primitives (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Primitives_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.ProtocolFixtures", () {
        // print("setting up TestAPI.ProtocolFixtures (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_ProtocolFixtures_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.PythonNamingCollisions", () {
        // print("setting up TestAPI.PythonNamingCollisions (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_PythonNamingCollisions_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Ranges", () {
        // print("setting up TestAPI.Ranges (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Ranges_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.ReferenceCaseEnum", () {
        // print("setting up TestAPI.ReferenceCaseEnum (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_ReferenceCaseEnum_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.ReferenceCaseEnum.enumDiscriminator, 0),
                ffi.Pointer.fromFunction(testapi.ReferenceCaseEnum.newNorth),
                ffi.Pointer.fromFunction(testapi.ReferenceCaseEnum.extractNorth),
                ffi.Pointer.fromFunction(testapi.ReferenceCaseEnum.newSouth),
                ffi.Pointer.fromFunction(testapi.ReferenceCaseEnum.extractSouth),
                ffi.Pointer.fromFunction(testapi.ReferenceCaseEnum.newEast),
                ffi.Pointer.fromFunction(testapi.ReferenceCaseEnum.extractEast),
                ffi.Pointer.fromFunction(testapi.ReferenceCaseEnum.newWest),
                ffi.Pointer.fromFunction(testapi.ReferenceCaseEnum.extractWest),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.ReferenceEmptyEnum", () {
        // print("setting up TestAPI.ReferenceEmptyEnum (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_ReferenceEmptyEnum_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.ReferenceOnlyTypes", () {
        // print("setting up TestAPI.ReferenceOnlyTypes (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_ReferenceOnlyTypes_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Results", () {
        // print("setting up TestAPI.Results (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Results_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Shade", () {
        // print("setting up TestAPI.Shade (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Shade_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.ShadowBox", () {
        // print("setting up TestAPI.ShadowBox (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_ShadowBox_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.ShadowBox.enumDiscriminator, 0),
                ffi.Pointer.fromFunction(testapi.ShadowBox.newShade),
                ffi.Pointer.fromFunction(testapi.ShadowBox.extractShade),
                ffi.Pointer.fromFunction(testapi.ShadowBox.newEmpty),
                ffi.Pointer.fromFunction(testapi.ShadowBox.extractEmpty),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.SimpleEnum", () {
        // print("setting up TestAPI.SimpleEnum (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_SimpleEnum_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.SimpleEnum.enumDiscriminator, 0),
                ffi.Pointer.fromFunction(testapi.SimpleEnum.newRed),
                ffi.Pointer.fromFunction(testapi.SimpleEnum.extractRed),
                ffi.Pointer.fromFunction(testapi.SimpleEnum.newGreen),
                ffi.Pointer.fromFunction(testapi.SimpleEnum.extractGreen),
                ffi.Pointer.fromFunction(testapi.SimpleEnum.newBlue),
                ffi.Pointer.fromFunction(testapi.SimpleEnum.extractBlue),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Strings", () {
        // print("setting up TestAPI.Strings (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Strings_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Structs", () {
        // print("setting up TestAPI.Structs (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Structs_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.TestAsyncForeignSideFunctionsStruct", () {
        // print("setting up TestAPI.TestAsyncForeignSideFunctionsStruct (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_TestAsyncForeignSideFunctionsStruct_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI_CommonInterface._TestAsyncFunctionsConverter", () {
        // print("setting up TestAPI.TestAsyncFunctions (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_CommonInterface__TestAsyncFunctionsConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.TestAsyncSwiftSideFunctionsClass", () {
        // print("setting up TestAPI.TestAsyncSwiftSideFunctionsClass (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_TestAsyncSwiftSideFunctionsClass_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.TestAsyncSwiftSideFunctionsClass.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter", () {
        // print("setting up TestAPI.TestDefaultComputedProperties (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.TestDefaultComputedPropertiesClass", () {
        // print("setting up TestAPI.TestDefaultComputedPropertiesClass (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_TestDefaultComputedPropertiesClass_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.TestDefaultComputedPropertiesReference.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.TestDefaultComputedPropertiesEnum", () {
        // print("setting up TestAPI.TestDefaultComputedPropertiesEnum (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_TestDefaultComputedPropertiesEnum_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.TestDefaultComputedPropertiesEnum.enumDiscriminator, 0),
                ffi.Pointer.fromFunction(testapi.TestDefaultComputedPropertiesEnum.newQux),
                ffi.Pointer.fromFunction(testapi.TestDefaultComputedPropertiesEnum.extractQux),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.TestDefaultComputedPropertiesStruct", () {
        // print("setting up TestAPI.TestDefaultComputedPropertiesStruct (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_TestDefaultComputedPropertiesStruct_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter", () {
        // print("setting up TestAPI.TestDifferingExportNameProtocol (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.TestDifferingExportNameStruct", () {
        // print("setting up TestAPI.TestDifferingExportNameStruct (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_TestDifferingExportNameStruct_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter", () {
        // print("setting up TestAPI.TestLeadingUnderscoredProp (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.TestLeadingUnderscoredPropStruct", () {
        // print("setting up TestAPI.TestLeadingUnderscoredPropStruct (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_TestLeadingUnderscoredPropStruct_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI_CommonInterface._TestMethodsProtocolConverter", () {
        // print("setting up TestAPI.TestMethodsProtocol (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_CommonInterface__TestMethodsProtocolConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.TestNonExportedProtocolEnum", () {
        // print("setting up TestAPI.TestNonExportedProtocolEnum (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_TestNonExportedProtocolEnum_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.TestNonExportedProtocolEnum.enumDiscriminator, 0),
                ffi.Pointer.fromFunction(testapi.TestNonExportedProtocolEnum.newHogehoge),
                ffi.Pointer.fromFunction(testapi.TestNonExportedProtocolEnum.extractHogehoge),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI_CommonInterface._TestOptionalsProtocolConverter", () {
        // print("setting up TestAPI.TestOptionalsProtocol (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_CommonInterface__TestOptionalsProtocolConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI_CommonInterface._TestPropertiesProtocolConverter", () {
        // print("setting up TestAPI.TestPropertiesProtocol (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_CommonInterface__TestPropertiesProtocolConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.TestProtocolClass", () {
        // print("setting up TestAPI.TestProtocolClass (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_TestProtocolClass_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.TestProtocolClass.ffi_new),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.TestProtocolEnum", () {
        // print("setting up TestAPI.TestProtocolEnum (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_TestProtocolEnum_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(testapi.TestProtocolEnum.enumDiscriminator, 0),
                ffi.Pointer.fromFunction(testapi.TestProtocolEnum.newQux),
                ffi.Pointer.fromFunction(testapi.TestProtocolEnum.extractQux),
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.TestProtocolStruct", () {
        // print("setting up TestAPI.TestProtocolStruct (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_TestProtocolStruct_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Tree", () {
        // print("setting up TestAPI.Tree (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Tree_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.Tuples", () {
        // print("setting up TestAPI.Tuples (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_Tuples_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_TestAPI.URLs", () {
        // print("setting up TestAPI.URLs (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            TestAPI_URLs_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>", () {
        // print("setting up (Bool, Double, Array<String>) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple3Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>", () {
        // print("setting up (Bool, Int, String) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple3Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple2Converter<Swift.Int, Swift.String>", () {
        // print("setting up (Int, String) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple2Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>", () {
        // print("setting up (Int8, Int16, Int32, Int64) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple4Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple3Converter<Swift.String, Swift.Double, Swift.String>", () {
        // print("setting up (String, Double, String) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple3Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>", () {
        // print("setting up (String, Int, Double, ((Int, String), (String, Double, String), String, Bool), (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)), Bool) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple6Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>", () {
        // print("setting up (String, UInt8, ((Int, String), (String, Double, String), String, Bool), (String, Double, String), (Int, String)) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple5Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>", () {
        // print("setting up ((Int, String), (String, Double, String), String, Bool) (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Tuple4Converter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    arena.releaseAll();
})();
