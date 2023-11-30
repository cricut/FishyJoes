part of 'loader.dart';

extension LoaderAttributedString on Loader {
  static void _setup(Env env) {
    check<void>((exn) {
      Loader._dylib.lookupFunction<
          ffi.Void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          ),
          void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          )
      >('FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_setup')(
          env,
          ffi.Pointer.fromFunction(FishyJoesRuntime.AttributeContainer_FoundationAttributes.ffi_new),
          exn
      );
    });
    check<void>((exn) {
      Loader._dylib.lookupFunction<
          ffi.Void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          ),
          void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          )
      >('Foundation_AttributedString_Runs_Index_setup')(
          env,
          ffi.Pointer.fromFunction(FishyJoesRuntime.AttributedString_Runs_Index.ffi_new),
          exn
      );
    });
    check<void>((exn) {
      Loader._dylib.lookupFunction<
          ffi.Void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          ),
          void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          )
      >('Foundation_AttributedString_Runs_Run_setup')(
          env,
          ffi.Pointer.fromFunction(FishyJoesRuntime.AttributedString_Runs_Run.ffi_new),
          exn
      );
    });
    check<void>((exn) {
      Loader._dylib.lookupFunction<
          ffi.Void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          ),
          void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          )
      >('Foundation_AttributedString_CharacterView_setup')(
          env,
          ffi.Pointer.fromFunction(FishyJoesRuntime.AttributedString_CharacterView.ffi_new),
          exn
      );
    });
    check<void>((exn) {
      Loader._dylib.lookupFunction<
          ffi.Void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          ),
          void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          )
      >('Foundation_AttributedString_Index_setup')(
          env,
          ffi.Pointer.fromFunction(FishyJoesRuntime.AttributedString_Index.ffi_new),
          exn
      );
    });
    check<void>((exn) {
      Loader._dylib.lookupFunction<
          ffi.Void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          ),
          void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          )
      >('Foundation_AttributedString_Runs_setup')(
          env,
          ffi.Pointer.fromFunction(FishyJoesRuntime.AttributedString_Runs.ffi_new),
          exn
      );
    });
    check<void>((exn) {
      Loader._dylib.lookupFunction<
          ffi.Void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          ),
          void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          )
      >('Foundation_AttributedString_UnicodeScalarView_setup')(
          env,
          ffi.Pointer.fromFunction(FishyJoesRuntime.AttributedString_UnicodeScalarView.ffi_new),
          exn
      );
    });
    check<void>((exn) {
      Loader._dylib.lookupFunction<
          ffi.Void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          ),
          void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          )
      >('FishyJoesCommonRuntime_AttributeContainer_setup')(
          env,
          ffi.Pointer.fromFunction(FishyJoesRuntime.AttributeContainer.ffi_new),
          exn
      );
    });
    check<void>((exn) {
      Loader._dylib.lookupFunction<
          ffi.Void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          ),
          void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          )
      >('Foundation_AttributedString_setup')(
          env,
          ffi.Pointer.fromFunction(FishyJoesRuntime.AttributedString.ffi_new),
          exn
      );
    });
    check<void>((exn) {
      Loader._dylib.lookupFunction<
          ffi.Void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          ),
          void Function(
              Env env,
              ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
              OutCreatedRef exn
          )
      >('Foundation_AttributedSubstring_setup')(
          env,
          ffi.Pointer.fromFunction(FishyJoesRuntime.AttributedSubstring.ffi_new),
          exn
      );
    });
    
    FishyJoesRuntime.AttributeContainer_FoundationAttributes.f__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createEmpty = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createEmpty");
    FishyJoesRuntime.AttributeContainer_FoundationAttributes.f__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef container,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef container,
            OutCreatedRef _exn
        )
    >("__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer");
    FishyJoesRuntime.AttributeContainer_FoundationAttributes.f__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals = Loader._dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        )
    >("__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals");
    FishyJoesRuntime.AttributeContainer_FoundationAttributes.f__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_asContainer = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_asContainer");
    FishyJoesRuntime.AttributeContainer.f__iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty");
    FishyJoesRuntime.AttributeContainer.f__iota_FishyJoesCommonRuntime_AttributeContainer_equals = Loader._dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        )
    >("__iota_FishyJoesCommonRuntime_AttributeContainer_equals");
    FishyJoesRuntime.AttributeContainer.f__iota_FishyJoesCommonRuntime_AttributeContainer_merge = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef other,
            ffi.Bool keepCurrent,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef other,
            bool keepCurrent,
            OutCreatedRef _exn
        )
    >("__iota_FishyJoesCommonRuntime_AttributeContainer_merge");
    FishyJoesRuntime.AttributedString_CharacterView.f__iota_Foundation_AttributedString_CharacterView_elementAt = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_CharacterView_elementAt");
    FishyJoesRuntime.AttributedString_CharacterView.f__iota_Foundation_AttributedString_CharacterView_indexAfter = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_CharacterView_indexAfter");
    FishyJoesRuntime.AttributedString_CharacterView.f__iota_Foundation_AttributedString_CharacterView_indexBefore = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_CharacterView_indexBefore");
    FishyJoesRuntime.AttributedString_Index.f__iota_Foundation_AttributedString_Index_equals = Loader._dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_Index_equals");
    FishyJoesRuntime.AttributedString_Runs_Index.f__iota_Foundation_AttributedString_Runs_Index_equals = Loader._dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_Runs_Index_equals");
    FishyJoesRuntime.AttributedString_Runs_Run.f__iota_Foundation_AttributedString_Runs_Run_equals = Loader._dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_Runs_Run_equals");
    FishyJoesRuntime.AttributedString_Index.f__iota_Foundation_AttributedString_Index_compare = Loader._dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_Index_compare");
    FishyJoesRuntime.AttributedString_Runs_Index.f__iota_Foundation_AttributedString_Runs_Index_compare = Loader._dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_Runs_Index_compare");
    FishyJoesRuntime.AttributedString_Runs.f__iota_Foundation_AttributedString_Runs_elementAt = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_Runs_elementAt");
    FishyJoesRuntime.AttributedString_Runs.f__iota_Foundation_AttributedString_Runs_elementAtPosition = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_Runs_elementAtPosition");
    FishyJoesRuntime.AttributedString_Runs.f__iota_Foundation_AttributedString_Runs_equals = Loader._dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_Runs_equals");
    FishyJoesRuntime.AttributedString_Runs.f__iota_Foundation_AttributedString_Runs_indexAfter = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_Runs_indexAfter");
    FishyJoesRuntime.AttributedString_Runs.f__iota_Foundation_AttributedString_Runs_indexBefore = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_Runs_indexBefore");
    FishyJoesRuntime.AttributedString_UnicodeScalarView.f__iota_Foundation_AttributedString_UnicodeScalarView_elementAt = Loader._dylib.lookupFunction<
        ffi.Uint32 Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_UnicodeScalarView_elementAt");
    FishyJoesRuntime.AttributedString_UnicodeScalarView.f__iota_Foundation_AttributedString_UnicodeScalarView_indexAfter = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_UnicodeScalarView_indexAfter");
    FishyJoesRuntime.AttributedString_UnicodeScalarView.f__iota_Foundation_AttributedString_UnicodeScalarView_indexBefore = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef index,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_UnicodeScalarView_indexBefore");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_append = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef attributedString,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef attributedString,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_append");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_appendSubstring = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef substring,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef substring,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_appendSubstring");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_create = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef string,
            UnownedRef attributes,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef string,
            UnownedRef attributes,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_create");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_createEmpty = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_createEmpty");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_createFromSubstring = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef substring,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef substring,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_createFromSubstring");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_equals = Loader._dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_equals");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_insert = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef attributedString,
            UnownedRef index,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef attributedString,
            UnownedRef index,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_insert");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_insertSubstring = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef substring,
            UnownedRef index,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef substring,
            UnownedRef index,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_insertSubstring");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_mergeAttributes = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef attributes,
            ffi.Bool keepCurrent,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef attributes,
            bool keepCurrent,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_mergeAttributes");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_mergeAttributesForRange = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            UnownedRef attributes,
            ffi.Bool keepCurrent,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            UnownedRef attributes,
            bool keepCurrent,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_mergeAttributesForRange");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_removeSubrange = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_removeSubrange");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_replaceAttributes = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef attributes,
            UnownedRef others,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef attributes,
            UnownedRef others,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_replaceAttributes");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_replaceAttributesForRange = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            UnownedRef attributes,
            UnownedRef others,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            UnownedRef attributes,
            UnownedRef others,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_replaceAttributesForRange");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_replaceSubrange = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            UnownedRef attributedString,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            UnownedRef attributedString,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_replaceSubrange");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_replaceSubrangeWithSubstring = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            UnownedRef substring,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            UnownedRef substring,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_replaceSubrangeWithSubstring");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_setAttributes = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef attributes,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef attributes,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_setAttributes");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_setAttributesForRange = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            UnownedRef attributes,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            UnownedRef attributes,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_setAttributesForRange");
    FishyJoesRuntime.AttributedString.f__iota_Foundation_AttributedString_substringForRange = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedString_substringForRange");
    FishyJoesRuntime.AttributedSubstring.f__iota_Foundation_AttributedSubstring_createEmpty = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedSubstring_createEmpty");
    FishyJoesRuntime.AttributedSubstring.f__iota_Foundation_AttributedSubstring_equals = Loader._dylib.lookupFunction<
        ffi.Bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        ),
        bool Function(
            Env env,
            UnownedRef lhs,
            UnownedRef rhs,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedSubstring_equals");
    FishyJoesRuntime.AttributedSubstring.f__iota_Foundation_AttributedSubstring_substringForRange = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            UnownedRef range,
            OutCreatedRef _exn
        )
    >("__iota_Foundation_AttributedSubstring_substringForRange");
    FishyJoesRuntime.AttributeContainer_FoundationAttributes.f__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash = Loader._dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash");
    FishyJoesRuntime.AttributeContainer_FoundationAttributes.f__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier");
    FishyJoesRuntime.AttributeContainer_FoundationAttributes.f__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link");
    FishyJoesRuntime.AttributeContainer.f__iota_get_FishyJoesCommonRuntime_AttributeContainer_hash = Loader._dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_FishyJoesCommonRuntime_AttributeContainer_hash");
    FishyJoesRuntime.AttributedString_CharacterView.f__iota_get_Foundation_AttributedString_CharacterView_endIndex = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_CharacterView_endIndex");
    FishyJoesRuntime.AttributedString_CharacterView.f__iota_get_Foundation_AttributedString_CharacterView_startIndex = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_CharacterView_startIndex");
    FishyJoesRuntime.AttributedString_Index.f__iota_get_Foundation_AttributedString_Index_hash = Loader._dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_Index_hash");
    FishyJoesRuntime.AttributedString_Runs_Index.f__iota_get_Foundation_AttributedString_Runs_Index_hash = Loader._dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_Runs_Index_hash");
    FishyJoesRuntime.AttributedString_Runs_Run.f__iota_get_Foundation_AttributedString_Runs_Run_attributes = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_Runs_Run_attributes");
    FishyJoesRuntime.AttributedString_Runs_Run.f__iota_get_Foundation_AttributedString_Runs_Run_hash = Loader._dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_Runs_Run_hash");
    FishyJoesRuntime.AttributedString_Runs_Run.f__iota_get_Foundation_AttributedString_Runs_Run_range = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_Runs_Run_range");
    FishyJoesRuntime.AttributedString_Runs.f__iota_get_Foundation_AttributedString_Runs_endIndex = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_Runs_endIndex");
    FishyJoesRuntime.AttributedString_Runs.f__iota_get_Foundation_AttributedString_Runs_hash = Loader._dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_Runs_hash");
    FishyJoesRuntime.AttributedString_Runs.f__iota_get_Foundation_AttributedString_Runs_startIndex = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_Runs_startIndex");
    FishyJoesRuntime.AttributedString_UnicodeScalarView.f__iota_get_Foundation_AttributedString_UnicodeScalarView_endIndex = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_UnicodeScalarView_endIndex");
    FishyJoesRuntime.AttributedString_UnicodeScalarView.f__iota_get_Foundation_AttributedString_UnicodeScalarView_startIndex = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_UnicodeScalarView_startIndex");
    FishyJoesRuntime.AttributedString.f__iota_get_Foundation_AttributedString_characters = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_characters");
    FishyJoesRuntime.AttributedString.f__iota_get_Foundation_AttributedString_endIndex = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_endIndex");
    FishyJoesRuntime.AttributedString.f__iota_get_Foundation_AttributedString_hash = Loader._dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_hash");
    FishyJoesRuntime.AttributedString.f__iota_get_Foundation_AttributedString_runs = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_runs");
    FishyJoesRuntime.AttributedString.f__iota_get_Foundation_AttributedString_startIndex = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_startIndex");
    FishyJoesRuntime.AttributedString.f__iota_get_Foundation_AttributedString_string = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_string");
    FishyJoesRuntime.AttributedString.f__iota_get_Foundation_AttributedString_substring = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_substring");
    FishyJoesRuntime.AttributedString.f__iota_get_Foundation_AttributedString_unicodeScalars = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedString_unicodeScalars");
    FishyJoesRuntime.AttributedSubstring.f__iota_get_Foundation_AttributedSubstring_base = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedSubstring_base");
    FishyJoesRuntime.AttributedSubstring.f__iota_get_Foundation_AttributedSubstring_characters = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedSubstring_characters");
    FishyJoesRuntime.AttributedSubstring.f__iota_get_Foundation_AttributedSubstring_endIndex = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedSubstring_endIndex");
    FishyJoesRuntime.AttributedSubstring.f__iota_get_Foundation_AttributedSubstring_hash = Loader._dylib.lookupFunction<
        ffi.Int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedSubstring_hash");
    FishyJoesRuntime.AttributedSubstring.f__iota_get_Foundation_AttributedSubstring_runs = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedSubstring_runs");
    FishyJoesRuntime.AttributedSubstring.f__iota_get_Foundation_AttributedSubstring_startIndex = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedSubstring_startIndex");
    FishyJoesRuntime.AttributedSubstring.f__iota_get_Foundation_AttributedSubstring_string = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedSubstring_string");
    FishyJoesRuntime.AttributedSubstring.f__iota_get_Foundation_AttributedSubstring_substring = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedSubstring_substring");
    FishyJoesRuntime.AttributedSubstring.f__iota_get_Foundation_AttributedSubstring_unicodeScalars = Loader._dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_Foundation_AttributedSubstring_unicodeScalars");
    FishyJoesRuntime.AttributeContainer_FoundationAttributes.f__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef languageIdentifier,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef languageIdentifier,
            OutCreatedRef _exn
        )
    >("__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier");
    FishyJoesRuntime.AttributeContainer_FoundationAttributes.f__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link = Loader._dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef link,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef link,
            OutCreatedRef _exn
        )
    >("__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link");
  }
}
