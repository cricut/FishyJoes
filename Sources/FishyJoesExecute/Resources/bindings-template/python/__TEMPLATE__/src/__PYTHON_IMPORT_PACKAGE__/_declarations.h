/* __AUTOGEN_WARNING__ */

/*
ABI pointer conventions:
- calling-convention: cdecl for all exported functions and callback typedefs.
- nullability: EnvRef is nonnull; foreignOutExn is nonnull; foreignObject values are nonnull unless named optional or documented otherwise.
- ownership: foreignObject return values are created unless explicitly documented; foreignObject parameters are borrowed unless explicitly documented; foreignOutExn is nonnull and receives an optional created error object.
*/

typedef _Bool bool;
typedef signed char int8_t;
typedef short int16_t;
typedef int int32_t;
typedef long long int64_t;
typedef long long intptr_t;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;
typedef unsigned long long uintptr_t;

typedef void *foreignObject;
typedef foreignObject *foreignOutExn;
typedef void *EnvRef;

typedef float float_t;
typedef foreignObject (*FishyJoes_NewRefFn)(foreignObject object);
typedef void (*FishyJoes_DeleteRefFn)(foreignObject object);
typedef foreignObject (*FishyJoes_NewErrorFn)(const uint16_t *message);
typedef char *(*FishyJoes_DescribeFn)(foreignObject object);
typedef void (*FishyJoes_ScheduleThreadWorkFn)(EnvRef envRef, void *context);
typedef uint8_t (*FishyJoes_BoolValueFn)(foreignObject object, foreignOutExn exn);
typedef intptr_t (*FishyJoes_StringUtf8LengthFn)(foreignObject object, foreignOutExn exn);
typedef void (*FishyJoes_StringGetUtf8Fn)(foreignObject object, char *outBytes, foreignOutExn exn);
typedef foreignObject (*FishyJoes_StringUtf8ConstructorFn)(const char *bytes, intptr_t length, foreignOutExn exn);
typedef foreignObject (*FishyJoes_AnyBoxConstructorFn)(void *ptr, foreignOutExn exn);
typedef void *(*FishyJoes_AnyBoxRefGetterFn)(foreignObject object, foreignOutExn exn);
typedef int (*FishyJoes_DataLengthFn)(foreignObject data, foreignOutExn exn);
typedef void (*FishyJoes_DataBytesFn)(foreignObject data, void *outBytes, foreignOutExn exn);
typedef foreignObject (*FishyJoes_DataConstructorFn)(const void *bytes, int length, foreignOutExn exn);
typedef foreignObject (*FishyJoes_URLAbsoluteURIFn)(foreignObject url, foreignOutExn exn);
typedef foreignObject (*FishyJoes_URLConstructorFn)(foreignObject string, foreignOutExn exn);
typedef intptr_t (*FishyJoes_IntValueFn)(foreignObject object, foreignOutExn exn);
typedef foreignObject (*FishyJoes_IntConstructorFn)(intptr_t value);
typedef int32_t (*FishyJoes_Int32ValueFn)(foreignObject object, foreignOutExn exn);
typedef foreignObject (*FishyJoes_Int32ConstructorFn)(int32_t value);
typedef uint8_t (*FishyJoes_UInt8ValueFn)(foreignObject object, foreignOutExn exn);
typedef foreignObject (*FishyJoes_UInt8ConstructorFn)(uint8_t value);
typedef int8_t (*FishyJoes_Int8ValueFn)(foreignObject object, foreignOutExn exn);
typedef foreignObject (*FishyJoes_Int8ConstructorFn)(int8_t value);
typedef int16_t (*FishyJoes_Int16ValueFn)(foreignObject object, foreignOutExn exn);
typedef foreignObject (*FishyJoes_Int16ConstructorFn)(int16_t value);
typedef int64_t (*FishyJoes_Int64ValueFn)(foreignObject object, foreignOutExn exn);
typedef foreignObject (*FishyJoes_Int64ConstructorFn)(int64_t value);
typedef uintptr_t (*FishyJoes_UIntValueFn)(foreignObject object, foreignOutExn exn);
typedef foreignObject (*FishyJoes_UIntConstructorFn)(uintptr_t value);
typedef uint16_t (*FishyJoes_UInt16ValueFn)(foreignObject object, foreignOutExn exn);
typedef foreignObject (*FishyJoes_UInt16ConstructorFn)(uint16_t value);
typedef uint32_t (*FishyJoes_UInt32ValueFn)(foreignObject object, foreignOutExn exn);
typedef foreignObject (*FishyJoes_UInt32ConstructorFn)(uint32_t value);
typedef uint64_t (*FishyJoes_UInt64ValueFn)(foreignObject object, foreignOutExn exn);
typedef foreignObject (*FishyJoes_UInt64ConstructorFn)(uint64_t value);
typedef float_t (*FishyJoes_FloatValueFn)(foreignObject object, foreignOutExn exn);
typedef foreignObject (*FishyJoes_FloatConstructorFn)(float_t value);
typedef double (*FishyJoes_DoubleValueFn)(foreignObject object, foreignOutExn exn);
typedef foreignObject (*FishyJoes_DoubleConstructorFn)(double value);
typedef int (*FishyJoes_CollectionLengthFn)(void *context, foreignObject array, foreignOutExn exn);
typedef void (*FishyJoes_CollectionValuesFn)(void *context, foreignObject array, foreignObject *outValues, foreignOutExn exn);
typedef foreignObject (*FishyJoes_CollectionConstructorFn)(void *context, const foreignObject *inValues, int length, foreignOutExn exn);
typedef foreignObject (*FishyJoes_RangeGetBoundFn)(void *context, foreignObject range, foreignOutExn exn);
typedef foreignObject (*FishyJoes_RangeConstructorFn)(void *context, foreignObject lowerBound, foreignObject upperBound, foreignOutExn exn);
typedef foreignObject (*FishyJoes_TupleGetFn)(void *context, foreignObject tuple, foreignOutExn exn);
typedef foreignObject (*FishyJoes_TupleConstructorFn)(void *context, const foreignObject *values, foreignOutExn exn);
typedef foreignObject (*FishyJoes_ResultGetContentsFn)(void *context, foreignObject result, uint8_t *outIsSuccess, foreignOutExn exn);
typedef foreignObject (*FishyJoes_ResultConstructorFn)(void *context, uint8_t isSuccess, foreignObject contents, foreignOutExn exn);
typedef foreignObject (*FishyJoes_FunctionConstructorFn)(void *context, void *ref, foreignOutExn exn);
typedef foreignObject (*FishyJoes_FunctionInvokeFn)(void *context, foreignObject fn, const foreignObject *args, foreignOutExn exn);
typedef foreignObject (*FishyJoes_FutureConstructorFn)(void *context, foreignObject *outPromise, foreignOutExn exn);
typedef void (*FishyJoes_FutureSinkFn)(void *context, foreignObject future, foreignObject handlerContext, foreignOutExn exn);
typedef void (*FishyJoes_FutureResolveRejectFn)(void *context, foreignObject promise, foreignObject result, foreignOutExn exn);
typedef foreignObject (*FishyJoes_ReferenceConstructorFn)(void *ptr, foreignOutExn exn);

EnvRef FishyJoesCommonRuntime_Env_setup(
    FishyJoes_NewRefFn newRefFn,
    FishyJoes_DeleteRefFn deleteRefFn,
    FishyJoes_NewErrorFn newErrorFn,
    FishyJoes_DescribeFn describeFn,
    FishyJoes_ScheduleThreadWorkFn scheduleThreadWorkFn
);
void FishyJoesCommonRuntime_runScheduledWork(EnvRef envRef, void *context, foreignOutExn exn);
char *FishyJoesCommonRuntime_strdup(char *ptr);
void FishyJoesCommonRuntime_AnyBox_setup(
    EnvRef envRef,
    FishyJoes_AnyBoxConstructorFn constructor,
    FishyJoes_AnyBoxRefGetterFn refGetter
);
void FishyJoesCommonRuntime_AnyBox_releaseRef(EnvRef envRef, void *ptr, foreignOutExn exn);

void Swift_Bool_setup(
    EnvRef envRef,
    foreignObject iotaTrue,
    foreignObject iotaFalse,
    FishyJoes_BoolValueFn valueMethod
);
void Swift_String_utf8_setup(
    EnvRef envRef,
    FishyJoes_StringUtf8LengthFn getLengthMethod,
    FishyJoes_StringGetUtf8Fn getUtf8Method,
    FishyJoes_StringUtf8ConstructorFn constructor
);
void Foundation_Data_setup(
    EnvRef envRef,
    FishyJoes_DataLengthFn lengthMethod,
    FishyJoes_DataBytesFn bytesMethod,
    FishyJoes_DataConstructorFn constructor
);
void Foundation_URL_setup(
    EnvRef envRef,
    FishyJoes_URLAbsoluteURIFn absoluteURIMethod,
    FishyJoes_URLConstructorFn constructor
);
void Swift_Int_setup(
    EnvRef envRef,
    FishyJoes_IntValueFn valueMethod,
    FishyJoes_IntConstructorFn constructor
);
void Swift_Int32_setup(
    EnvRef envRef,
    FishyJoes_Int32ValueFn valueMethod,
    FishyJoes_Int32ConstructorFn constructor
);
void Swift_UInt8_setup(
    EnvRef envRef,
    FishyJoes_UInt8ValueFn valueMethod,
    FishyJoes_UInt8ConstructorFn constructor
);
void Swift_Int8_setup(
    EnvRef envRef,
    FishyJoes_Int8ValueFn valueMethod,
    FishyJoes_Int8ConstructorFn constructor
);
void Swift_Int16_setup(
    EnvRef envRef,
    FishyJoes_Int16ValueFn valueMethod,
    FishyJoes_Int16ConstructorFn constructor
);
void Swift_Int64_setup(
    EnvRef envRef,
    FishyJoes_Int64ValueFn valueMethod,
    FishyJoes_Int64ConstructorFn constructor
);
void Swift_UInt_setup(
    EnvRef envRef,
    FishyJoes_UIntValueFn valueMethod,
    FishyJoes_UIntConstructorFn constructor
);
void Swift_UInt16_setup(
    EnvRef envRef,
    FishyJoes_UInt16ValueFn valueMethod,
    FishyJoes_UInt16ConstructorFn constructor
);
void Swift_UInt32_setup(
    EnvRef envRef,
    FishyJoes_UInt32ValueFn valueMethod,
    FishyJoes_UInt32ConstructorFn constructor
);
void Swift_UInt64_setup(
    EnvRef envRef,
    FishyJoes_UInt64ValueFn valueMethod,
    FishyJoes_UInt64ConstructorFn constructor
);
void Swift_Float_setup(
    EnvRef envRef,
    FishyJoes_FloatValueFn valueMethod,
    FishyJoes_FloatConstructorFn constructor
);
void Swift_Double_setup(
    EnvRef envRef,
    FishyJoes_DoubleValueFn valueMethod,
    FishyJoes_DoubleConstructorFn constructor
);
void FishyJoesCommonRuntime_collection_setup(
    EnvRef envRef,
    const uint16_t *name,
    FishyJoes_CollectionLengthFn lengthMethod,
    FishyJoes_CollectionValuesFn valuesMethod,
    FishyJoes_CollectionConstructorFn constructor,
    void *context,
    foreignOutExn exn
);
void FishyJoesCommonRuntime_RangeConverter_setup(
    EnvRef envRef,
    const uint16_t *name,
    FishyJoes_RangeGetBoundFn getLowerBoundMethod,
    FishyJoes_RangeGetBoundFn getUpperBoundMethod,
    FishyJoes_RangeConstructorFn constructor,
    void *context
);
void FishyJoesCommonRuntime_TupleConverter_setup(
    EnvRef envRef,
    const uint16_t *name,
    FishyJoes_TupleGetFn get0Method,
    FishyJoes_TupleGetFn get1Method,
    FishyJoes_TupleGetFn get2Method,
    FishyJoes_TupleGetFn get3Method,
    FishyJoes_TupleGetFn get4Method,
    FishyJoes_TupleGetFn get5Method,
    FishyJoes_TupleConstructorFn constructor,
    void *context
);
void FishyJoesCommonRuntime_ResultConverter_setup(
    EnvRef envRef,
    const uint16_t *name,
    FishyJoes_ResultGetContentsFn getContentsMethod,
    FishyJoes_ResultConstructorFn constructor,
    void *context
);
void FishyJoesCommonRuntime_FunctionConverter_setup(
    EnvRef envRef,
    const uint16_t *name,
    FishyJoes_FunctionConstructorFn constructor,
    FishyJoes_FunctionInvokeFn invoke,
    void *context,
    foreignOutExn exn
);
void FishyJoesCommonRuntime_FutureConverter_setup(
    EnvRef envRef,
    const uint16_t *name,
    FishyJoes_FutureConstructorFn constructor,
    FishyJoes_FutureSinkFn sinkFuture,
    FishyJoes_FutureResolveRejectFn resolve,
    FishyJoes_FutureResolveRejectFn reject,
    void *context,
    foreignOutExn exn
);
void FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler(
    EnvRef envRef,
    foreignObject context,
    uint32_t success,
    foreignObject result,
    foreignOutExn exn
);
foreignObject FishyJoesCommonRuntime_SwiftFunctionImpl_invoke0(
    EnvRef envRef,
    void *self,
    foreignOutExn exn
);
foreignObject FishyJoesCommonRuntime_SwiftFunctionImpl_invoke1(
    EnvRef envRef,
    void *self,
    foreignObject p0,
    foreignOutExn exn
);
foreignObject FishyJoesCommonRuntime_SwiftFunctionImpl_invoke2(
    EnvRef envRef,
    void *self,
    foreignObject p0,
    foreignObject p1,
    foreignOutExn exn
);
foreignObject FishyJoesCommonRuntime_SwiftFunctionImpl_invoke3(
    EnvRef envRef,
    void *self,
    foreignObject p0,
    foreignObject p1,
    foreignObject p2,
    foreignOutExn exn
);
foreignObject FishyJoesCommonRuntime_SwiftFunctionImpl_invoke4(
    EnvRef envRef,
    void *self,
    foreignObject p0,
    foreignObject p1,
    foreignObject p2,
    foreignObject p3,
    foreignOutExn exn
);
foreignObject FishyJoesCommonRuntime_SwiftFunctionImpl_invoke5(
    EnvRef envRef,
    void *self,
    foreignObject p0,
    foreignObject p1,
    foreignObject p2,
    foreignObject p3,
    foreignObject p4,
    foreignOutExn exn
);
foreignObject FishyJoesCommonRuntime_SwiftFunctionImpl_invoke6(
    EnvRef envRef,
    void *self,
    foreignObject p0,
    foreignObject p1,
    foreignObject p2,
    foreignObject p3,
    foreignObject p4,
    foreignObject p5,
    foreignOutExn exn
);
void Foundation_AttributedString_setup(
    EnvRef envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    foreignOutExn exn
);
void Foundation_AttributedString_Index_setup(
    EnvRef envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    foreignOutExn exn
);
void Foundation_AttributedString_UnicodeScalarView_setup(
    EnvRef envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    foreignOutExn exn
);
void Foundation_AttributedString_CharacterView_setup(
    EnvRef envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    foreignOutExn exn
);
void Foundation_AttributedString_Runs_setup(
    EnvRef envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    foreignOutExn exn
);
void Foundation_AttributedString_Runs_Index_setup(
    EnvRef envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    foreignOutExn exn
);
void Foundation_AttributedString_Runs_Run_setup(
    EnvRef envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    foreignOutExn exn
);
foreignObject __iota_get_Foundation_AttributedString_string(
    EnvRef envRef,
    foreignObject self,
    foreignOutExn exn
);
foreignObject __iota_get_Foundation_AttributedString_substring(
    EnvRef envRef,
    foreignObject self,
    foreignOutExn exn
);
bool __iota_Foundation_AttributedString_equals(
    EnvRef envRef,
    foreignObject lhs,
    foreignObject rhs,
    foreignOutExn exn
);
int32_t __iota_get_Foundation_AttributedString_hash(
    EnvRef envRef,
    foreignObject self,
    foreignOutExn exn
);
void Foundation_AttributedSubstring_setup(
    EnvRef envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    foreignOutExn exn
);
foreignObject __iota_get_Foundation_AttributedSubstring_base(
    EnvRef envRef,
    foreignObject self,
    foreignOutExn exn
);
foreignObject __iota_get_Foundation_AttributedSubstring_string(
    EnvRef envRef,
    foreignObject self,
    foreignOutExn exn
);
foreignObject __iota_get_Foundation_AttributedSubstring_substring(
    EnvRef envRef,
    foreignObject self,
    foreignOutExn exn
);
bool __iota_Foundation_AttributedSubstring_equals(
    EnvRef envRef,
    foreignObject lhs,
    foreignObject rhs,
    foreignOutExn exn
);
int32_t __iota_get_Foundation_AttributedSubstring_hash(
    EnvRef envRef,
    foreignObject self,
    foreignOutExn exn
);
void FishyJoesCommonRuntime_AttributeContainer_setup(
    EnvRef envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    foreignOutExn exn
);
bool __iota_FishyJoesCommonRuntime_AttributeContainer_equals(
    EnvRef envRef,
    foreignObject lhs,
    foreignObject rhs,
    foreignOutExn exn
);
int32_t __iota_get_FishyJoesCommonRuntime_AttributeContainer_hash(
    EnvRef envRef,
    foreignObject self,
    foreignOutExn exn
);
void FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_setup(
    EnvRef envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    foreignOutExn exn
);
foreignObject __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link(
    EnvRef envRef,
    foreignObject self,
    foreignOutExn exn
);
foreignObject __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier(
    EnvRef envRef,
    foreignObject self,
    foreignOutExn exn
);
bool __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals(
    EnvRef envRef,
    foreignObject lhs,
    foreignObject rhs,
    foreignOutExn exn
);
int32_t __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash(
    EnvRef envRef,
    foreignObject self,
    foreignOutExn exn
);
foreignObject __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer(
    EnvRef envRef,
    foreignObject container,
    foreignOutExn exn
);
foreignObject __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_asContainer(
    EnvRef envRef,
    foreignObject self,
    foreignOutExn exn
);

void __PYTHON_MODULE_REGISTER_TYPES__(void);
