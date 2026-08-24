// #include <stdint.h>
/*
Shared FishyJoesIotaRuntime cffi declarations, owned by the fishyjoes-runtime
package. These declare the runtime's own exported symbols and callback
typedefs; generated binding packages contribute only their module-specific
declarations in _generated_declarations.h. The Swift/Iota symbol model remains
the source of truth; this header is its cffi-facing reflection.
*/

/*
ABI pointer conventions:
- calling-convention: cdecl for all exported functions and callback typedefs.
- nullability: fishyjoes_env is nonnull; out_created_exception is nonnull; foreignObject values are nonnull unless named optional or documented otherwise.
*/

// References to host-side objects. While these 3 types are convertible, distinct and opaque types help document memory management contracts.
struct created_host_ref_impl;
struct unowned_host_ref_impl;
struct consumed_host_ref_impl;
struct created_swift_ref_impl;
struct unowned_swift_ref_impl;
struct consumed_swift_ref_impl;

/// A reference to host object returned by a function, ownership belongs to the caller.
typedef struct created_host_ref_impl *created_host_ref;
/// A reference to a borrowed host object, owned by the provider.
typedef struct unowned_host_ref_impl *unowned_host_ref;
/// A reference to a host object that passes ownership from the caller to the callee.
typedef struct consumed_host_ref_impl *consumed_host_ref;


/// A swift object returned by a function, ownership belongs to the caller.
typedef struct created_swift_ref_impl *created_swift_ref;
/// A borrowed swift object, owned by the provider.
typedef struct unowned_swift_ref_impl *unowned_swift_ref;
/// A swift object that passes ownership from the caller to the callee.
typedef struct consumed_swift_ref_impl *consumed_swift_ref;

/// An out-parameter with storage allocated for passing back a created host exception.
/// Initialized to allocated and zeroed storage by the caller with space for a single host exception.
/// Both the storage and the contents are owned by the caller.
typedef created_host_ref *out_created_exception;

// SECTION: FishyJoes Environment
// The FishyJoes runtime environment. Opaque from the host-side.
struct fishyjoes_env_impl;
typedef struct fishyjoes_env_impl *fishyjoes_env;

// Core callbacks needed by the runtime environment
typedef created_host_ref (*FishyJoes_NewRefFn)(unowned_host_ref object);
typedef void (*FishyJoes_DeleteRefFn)(consumed_host_ref object);
typedef created_host_ref (*FishyJoes_NewErrorFn)(const uint16_t *message);
/// caller must free result
typedef char *(*FishyJoes_DescribeFn)(unowned_host_ref object);
typedef void (*FishyJoes_ScheduleThreadWorkFn)(fishyjoes_env envRef, consumed_swift_ref context);

// SECTION: primitive numeric types
// Intro/elim for host-side boxed numeric types
typedef uint8_t (*FishyJoes_BoolValueFn)(unowned_host_ref object, out_created_exception exn);
typedef intptr_t (*FishyJoes_IntValueFn)(unowned_host_ref object, out_created_exception exn);
typedef created_host_ref (*FishyJoes_IntConstructorFn)(intptr_t value);
typedef int32_t (*FishyJoes_Int32ValueFn)(unowned_host_ref object, out_created_exception exn);
typedef created_host_ref (*FishyJoes_Int32ConstructorFn)(int32_t value);
typedef uint8_t (*FishyJoes_UInt8ValueFn)(unowned_host_ref object, out_created_exception exn);
typedef created_host_ref (*FishyJoes_UInt8ConstructorFn)(uint8_t value);
typedef int8_t (*FishyJoes_Int8ValueFn)(unowned_host_ref object, out_created_exception exn);
typedef created_host_ref (*FishyJoes_Int8ConstructorFn)(int8_t value);
typedef int16_t (*FishyJoes_Int16ValueFn)(unowned_host_ref object, out_created_exception exn);
typedef created_host_ref (*FishyJoes_Int16ConstructorFn)(int16_t value);
typedef int64_t (*FishyJoes_Int64ValueFn)(unowned_host_ref object, out_created_exception exn);
typedef created_host_ref (*FishyJoes_Int64ConstructorFn)(int64_t value);
typedef uintptr_t (*FishyJoes_UIntValueFn)(unowned_host_ref object, out_created_exception exn);
typedef created_host_ref (*FishyJoes_UIntConstructorFn)(uintptr_t value);
typedef uint16_t (*FishyJoes_UInt16ValueFn)(unowned_host_ref object, out_created_exception exn);
typedef created_host_ref (*FishyJoes_UInt16ConstructorFn)(uint16_t value);
typedef uint32_t (*FishyJoes_UInt32ValueFn)(unowned_host_ref object, out_created_exception exn);
typedef created_host_ref (*FishyJoes_UInt32ConstructorFn)(uint32_t value);
typedef uint64_t (*FishyJoes_UInt64ValueFn)(unowned_host_ref object, out_created_exception exn);
typedef created_host_ref (*FishyJoes_UInt64ConstructorFn)(uint64_t value);
typedef float (*FishyJoes_FloatValueFn)(unowned_host_ref object, out_created_exception exn);
typedef created_host_ref (*FishyJoes_FloatConstructorFn)(float value);
typedef double (*FishyJoes_DoubleValueFn)(unowned_host_ref object, out_created_exception exn);
typedef created_host_ref (*FishyJoes_DoubleConstructorFn)(double value);

// SECTION: Reference types
// Intro/elim callbacks for host-side references to swift objects
typedef created_host_ref (*FishyJoes_ReferenceConstructorFn)(consumed_swift_ref object, out_created_exception exn);
typedef unowned_swift_ref (*FishyJoes_ReferencePointerGetterFn)(unowned_host_ref object, out_created_exception exn);

// SECTION: Swift.String
// Intro/elim callbacks for host-side strings
typedef created_host_ref (*FishyJoes_StringConstructorFn)(const char_16t *code_units, intptr_t length, out_created_exception exn);
typedef intptr_t (*FishyJoes_StringGetLengthFn)(unowned_host_ref object, out_created_exception exn);
typedef void (*FishyJoes_StringGetCodeUnitsFn)(unowned_host_ref object, char *outBytes, out_created_exception exn);

// SECTION: Foundation.Data
// Intro/elim callbacks for host-side data
typedef created_host_ref (*FishyJoes_DataConstructorFn)(const uint8_t *bytes, int length, out_created_exception exn);
typedef int (*FishyJoes_DataLengthFn)(unowned_host_ref data, out_created_exception exn);
typedef void (*FishyJoes_DataBytesFn)(unowned_host_ref data, uint8_t *outBytes, out_created_exception exn);

// SECTION: `Foundation.URL`
// Intro/elim callbacks for host-side URLs
typedef created_host_ref (*FishyJoes_URLConstructorFn)(consumed_host_ref urlString, out_created_exception exn);
typedef created_host_ref (*FishyJoes_URLAbsoluteURIFn)(unowned_host_ref object, out_created_exception exn);

// SECTION: Collection types (`Swift.Array`, `Swift.Set`, and `Swift.Dictionary`)
// Intro/elim callbacks for host-side collection types
typedef created_host_ref (*FishyJoes_CollectionConstructorFn)(unowned_host_ref callbackContext, const unowned_host_ref *inValues, int length, out_created_exception exn);
typedef int (*FishyJoes_CollectionLengthFn)(unowned_host_ref callbackContext, unowned_host_ref collection, out_created_exception exn);
typedef void (*FishyJoes_CollectionValuesFn)(unowned_host_ref callbackContext, unowned_host_ref collection, created_host_ref *outValues, out_created_exception exn);

// SECTION: Range types (`Swift.Range` and `Swift.ClosedRange`)
// Intro/elim callbacks for host-side range types
typedef created_host_ref (*FishyJoes_RangeConstructorFn)(unowned_host_ref callbackContext, unowned_host_ref lowerBound, unowned_host_ref upperBound, out_created_exception exn);
typedef created_host_ref (*FishyJoes_RangeGetBoundFn)(unowned_host_ref callbackContext, unowned_host_ref range, out_created_exception exn);

// SECTION: Tuple types
// Intro/elim callbacks for host-side tuples
typedef created_host_ref (*FishyJoes_TupleConstructorFn)(unowned_host_ref callbackContext, const unowned_host_ref *values, out_created_exception exn);
typedef created_host_ref (*FishyJoes_TupleGetFn)(unowned_host_ref callbackContext, unowned_host_ref tuple, out_created_exception exn);

// SECTION: `Swift.Result`
// Intro/elim callbacks for host-side results
typedef created_host_ref (*FishyJoes_ResultConstructorFn)(unowned_host_ref callbackContext, uint8_t isSuccess, consumed_host_ref contents, out_created_exception exn);
typedef created_host_ref (*FishyJoes_ResultGetContentsFn)(unowned_host_ref callbackContext, unowned_host_ref result, uint8_t *outIsSuccess, out_created_exception exn);

// SECTION: Function (closure) types
// Intro/elim callbacks for host-side closures
typedef created_host_ref (*FishyJoes_FunctionInvokeFn)(unowned_host_ref callbackContext, unowned_host_ref fn, const consumed_host_ref *args, out_created_exception exn);
typedef created_host_ref (*FishyJoes_FunctionConstructorFn)(unowned_host_ref callbackContext, consumed_swift_ref fn, out_created_exception exn);

// SECTION: `FishyJoesCommonRuntime.Future`
// Intro/elim callbacks for host-side futures and promises
typedef created_host_ref (*FishyJoes_FutureConstructorFn)(unowned_host_ref callbackContext, created_host_ref *outPromise, out_created_exception exn);
typedef void (*FishyJoes_FutureSinkFn)(unowned_host_ref callbackContext, unowned_host_ref future, consumed_swift_ref handlerContext, out_created_exception exn);
typedef void (*FishyJoes_FutureResolveRejectFn)(unowned_host_ref callbackContext, unowned_host_ref promise, consumed_host_ref result, out_created_exception exn);

// SECTION: ???
// TODO: organize these into above sections
fishyjoes_env FishyJoesCommonRuntime_Env_setup(
    FishyJoes_NewRefFn newRefFn,
    FishyJoes_DeleteRefFn deleteRefFn,
    FishyJoes_NewErrorFn newErrorFn,
    FishyJoes_DescribeFn describeFn,
    FishyJoes_ScheduleThreadWorkFn scheduleThreadWorkFn
);

void FishyJoesCommonRuntime_runScheduledWork(fishyjoes_env envRef, void *callbackContext, out_created_exception exn);
char *FishyJoesCommonRuntime_strdup(char *ptr);
created_host_ref FishyJoesCommonRuntime_AnyBox_toString(fishyjoes_env envRef, unowned_swift_ref swiftReference, out_created_exception exn);
void FishyJoesCommonRuntime_AnyBox_setup(
    fishyjoes_env envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    FishyJoes_ReferencePointerGetterFn refGetter
);
void FishyJoesCommonRuntime_AnyBox_releaseRef(fishyjoes_env envRef, consumed_host_ref ptr, out_created_exception exn);

void Swift_Bool_setup(
    fishyjoes_env envRef,
    unowned_host_ref iotaTrue,
    unowned_host_ref iotaFalse,
    FishyJoes_BoolValueFn valueMethod
);
void Swift_String_utf8_setup(
    fishyjoes_env envRef,
    FishyJoes_StringUtf8LengthFn getLengthMethod,
    FishyJoes_StringGetUtf8Fn getUtf8Method,
    FishyJoes_StringUtf8ConstructorFn constructor
);
void Foundation_Data_setup(
    fishyjoes_env envRef,
    FishyJoes_DataLengthFn lengthMethod,
    FishyJoes_DataBytesFn bytesMethod,
    FishyJoes_DataConstructorFn constructor
);
void Foundation_URL_setup(
    fishyjoes_env envRef,
    FishyJoes_URLAbsoluteURIFn absoluteURIMethod,
    FishyJoes_URLConstructorFn constructor
);
void Swift_Int_setup(
    fishyjoes_env envRef,
    FishyJoes_IntValueFn valueMethod,
    FishyJoes_IntConstructorFn constructor
);
void Swift_Int32_setup(
    fishyjoes_env envRef,
    FishyJoes_Int32ValueFn valueMethod,
    FishyJoes_Int32ConstructorFn constructor
);
void Swift_UInt8_setup(
    fishyjoes_env envRef,
    FishyJoes_UInt8ValueFn valueMethod,
    FishyJoes_UInt8ConstructorFn constructor
);
void Swift_Int8_setup(
    fishyjoes_env envRef,
    FishyJoes_Int8ValueFn valueMethod,
    FishyJoes_Int8ConstructorFn constructor
);
void Swift_Int16_setup(
    fishyjoes_env envRef,
    FishyJoes_Int16ValueFn valueMethod,
    FishyJoes_Int16ConstructorFn constructor
);
void Swift_Int64_setup(
    fishyjoes_env envRef,
    FishyJoes_Int64ValueFn valueMethod,
    FishyJoes_Int64ConstructorFn constructor
);
void Swift_UInt_setup(
    fishyjoes_env envRef,
    FishyJoes_UIntValueFn valueMethod,
    FishyJoes_UIntConstructorFn constructor
);
void Swift_UInt16_setup(
    fishyjoes_env envRef,
    FishyJoes_UInt16ValueFn valueMethod,
    FishyJoes_UInt16ConstructorFn constructor
);
void Swift_UInt32_setup(
    fishyjoes_env envRef,
    FishyJoes_UInt32ValueFn valueMethod,
    FishyJoes_UInt32ConstructorFn constructor
);
void Swift_UInt64_setup(
    fishyjoes_env envRef,
    FishyJoes_UInt64ValueFn valueMethod,
    FishyJoes_UInt64ConstructorFn constructor
);
void Swift_Float_setup(
    fishyjoes_env envRef,
    FishyJoes_FloatValueFn valueMethod,
    FishyJoes_FloatConstructorFn constructor
);
void Swift_Double_setup(
    fishyjoes_env envRef,
    FishyJoes_DoubleValueFn valueMethod,
    FishyJoes_DoubleConstructorFn constructor
);
void FishyJoesCommonRuntime_collection_setup(
    fishyjoes_env envRef,
    const uint16_t *name,
    FishyJoes_CollectionLengthFn lengthMethod,
    FishyJoes_CollectionValuesFn valuesMethod,
    FishyJoes_CollectionConstructorFn constructor,
    consumed_host_ref callbackContext,
    out_created_exception exn
);
void FishyJoesCommonRuntime_RangeConverter_setup(
    fishyjoes_env envRef,
    const uint16_t *name,
    FishyJoes_RangeGetBoundFn getLowerBoundMethod,
    FishyJoes_RangeGetBoundFn getUpperBoundMethod,
    FishyJoes_RangeConstructorFn constructor,
    consumed_host_ref callbackContext
);
void FishyJoesCommonRuntime_TupleConverter_setup(
    fishyjoes_env envRef,
    const uint16_t *name,
    FishyJoes_TupleGetFn get0Method,
    FishyJoes_TupleGetFn get1Method,
    FishyJoes_TupleGetFn get2Method,
    FishyJoes_TupleGetFn get3Method,
    FishyJoes_TupleGetFn get4Method,
    FishyJoes_TupleGetFn get5Method,
    FishyJoes_TupleConstructorFn constructor,
    consumed_host_ref callbackContext
);
void FishyJoesCommonRuntime_ResultConverter_setup(
    fishyjoes_env envRef,
    const uint16_t *name,
    FishyJoes_ResultGetContentsFn getContentsMethod,
    FishyJoes_ResultConstructorFn constructor,
    consumed_host_ref callbackContext
);
void FishyJoesCommonRuntime_FunctionConverter_setup(
    fishyjoes_env envRef,
    const uint16_t *name,
    FishyJoes_FunctionConstructorFn constructor,
    FishyJoes_FunctionInvokeFn invoke,
    consumed_host_ref callbackContext,
    out_created_exception exn
);
void FishyJoesCommonRuntime_FutureConverter_setup(
    fishyjoes_env envRef,
    const uint16_t *name,
    FishyJoes_FutureConstructorFn constructor,
    FishyJoes_FutureSinkFn sinkFuture,
    FishyJoes_FutureResolveRejectFn resolve,
    FishyJoes_FutureResolveRejectFn reject,
    consumed_host_ref callbackContext,
    out_created_exception exn
);
void FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler(
    fishyjoes_env envRef,
    consumed_swift_ref context,
    uint32_t success,
    consumed_host_ref result,
    out_created_exception exn
);
created_host_ref FishyJoesCommonRuntime_SwiftFunctionImpl_invoke0(
    fishyjoes_env envRef,
    unowned_swift_ref self,
    out_created_exception exn
);
created_host_ref FishyJoesCommonRuntime_SwiftFunctionImpl_invoke1(
    fishyjoes_env envRef,
    unowned_swift_ref self,
    unowned_host_ref p0,
    out_created_exception exn
);
created_host_ref FishyJoesCommonRuntime_SwiftFunctionImpl_invoke2(
    fishyjoes_env envRef,
    unowned_swift_ref self,
    unowned_host_ref p0,
    unowned_host_ref p1,
    out_created_exception exn
);
created_host_ref FishyJoesCommonRuntime_SwiftFunctionImpl_invoke3(
    fishyjoes_env envRef,
    unowned_swift_ref self,
    unowned_host_ref p0,
    unowned_host_ref p1,
    unowned_host_ref p2,
    out_created_exception exn
);
created_host_ref FishyJoesCommonRuntime_SwiftFunctionImpl_invoke4(
    fishyjoes_env envRef,
    unowned_swift_ref self,
    unowned_host_ref p0,
    unowned_host_ref p1,
    unowned_host_ref p2,
    unowned_host_ref p3,
    out_created_exception exn
);
created_host_ref FishyJoesCommonRuntime_SwiftFunctionImpl_invoke5(
    fishyjoes_env envRef,
    unowned_swift_ref self,
    unowned_host_ref p0,
    unowned_host_ref p1,
    unowned_host_ref p2,
    unowned_host_ref p3,
    unowned_host_ref p4,
    out_created_exception exn
);
created_host_ref FishyJoesCommonRuntime_SwiftFunctionImpl_invoke6(
    fishyjoes_env envRef,
    unowned_swift_ref self,
    unowned_host_ref p0,
    unowned_host_ref p1,
    unowned_host_ref p2,
    unowned_host_ref p3,
    unowned_host_ref p4,
    unowned_host_ref p5,
    out_created_exception exn
);
void Foundation_AttributedString_setup(
    fishyjoes_env envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    out_created_exception exn
);
void Foundation_AttributedString_Index_setup(
    fishyjoes_env envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    out_created_exception exn
);
void Foundation_AttributedString_UnicodeScalarView_setup(
    fishyjoes_env envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    out_created_exception exn
);
void Foundation_AttributedString_CharacterView_setup(
    fishyjoes_env envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    out_created_exception exn
);
void Foundation_AttributedString_Runs_setup(
    fishyjoes_env envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    out_created_exception exn
);
void Foundation_AttributedString_Runs_Index_setup(
    fishyjoes_env envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    out_created_exception exn
);
void Foundation_AttributedString_Runs_Run_setup(
    fishyjoes_env envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedString_create(
    fishyjoes_env envRef,
    unowned_host_ref string,
    unowned_host_ref attributes,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_string(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_substring(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
uint8_t __iota_Foundation_AttributedString_equals(
    fishyjoes_env envRef,
    unowned_host_ref lhs,
    unowned_host_ref rhs,
    out_created_exception exn
);
int32_t __iota_get_Foundation_AttributedString_hash(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_runs(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_characters(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_unicodeScalars(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedString_substringForRange(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref range,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_startIndex(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_endIndex(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
void __iota_Foundation_AttributedString_append(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref attributedString,
    out_created_exception exn
);
void __iota_Foundation_AttributedString_appendSubstring(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref substring,
    out_created_exception exn
);
void __iota_Foundation_AttributedString_insert(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref attributedString,
    unowned_host_ref index,
    out_created_exception exn
);
void __iota_Foundation_AttributedString_insertSubstring(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref substring,
    unowned_host_ref index,
    out_created_exception exn
);
void __iota_Foundation_AttributedString_replaceSubrange(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref range,
    unowned_host_ref attributedString,
    out_created_exception exn
);
void __iota_Foundation_AttributedString_replaceSubrangeWithSubstring(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref range,
    unowned_host_ref substring,
    out_created_exception exn
);
void __iota_Foundation_AttributedString_removeSubrange(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref range,
    out_created_exception exn
);
void __iota_Foundation_AttributedString_setAttributes(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref attributes,
    out_created_exception exn
);
void __iota_Foundation_AttributedString_setAttributesForRange(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref range,
    unowned_host_ref attributes,
    out_created_exception exn
);
void __iota_Foundation_AttributedString_mergeAttributes(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref attributes,
    uint8_t keepCurrent,
    out_created_exception exn
);
void __iota_Foundation_AttributedString_mergeAttributesForRange(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref range,
    unowned_host_ref attributes,
    uint8_t keepCurrent,
    out_created_exception exn
);
void __iota_Foundation_AttributedString_replaceAttributes(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref attributes,
    unowned_host_ref others,
    out_created_exception exn
);
void __iota_Foundation_AttributedString_replaceAttributesForRange(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref range,
    unowned_host_ref attributes,
    unowned_host_ref others,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedString_createEmpty(
    fishyjoes_env envRef,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedString_createFromSubstring(
    fishyjoes_env envRef,
    unowned_host_ref substring,
    out_created_exception exn
);
uint8_t __iota_Foundation_AttributedString_Index_equals(
    fishyjoes_env envRef,
    unowned_host_ref lhs,
    unowned_host_ref rhs,
    out_created_exception exn
);
int32_t __iota_get_Foundation_AttributedString_Index_hash(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
intptr_t __iota_Foundation_AttributedString_Index_compare(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref other,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_UnicodeScalarView_startIndex(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_UnicodeScalarView_endIndex(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedString_UnicodeScalarView_indexBefore(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref index,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedString_UnicodeScalarView_indexAfter(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref index,
    out_created_exception exn
);
uint32_t __iota_Foundation_AttributedString_UnicodeScalarView_elementAt(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref index,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_CharacterView_startIndex(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_CharacterView_endIndex(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedString_CharacterView_indexBefore(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref index,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedString_CharacterView_indexAfter(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref index,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedString_CharacterView_elementAt(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref index,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_Runs_startIndex(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_Runs_endIndex(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedString_Runs_indexBefore(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref index,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedString_Runs_indexAfter(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref index,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedString_Runs_elementAt(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref index,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedString_Runs_elementAtPosition(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref index,
    out_created_exception exn
);
uint8_t __iota_Foundation_AttributedString_Runs_equals(
    fishyjoes_env envRef,
    unowned_host_ref lhs,
    unowned_host_ref rhs,
    out_created_exception exn
);
int32_t __iota_get_Foundation_AttributedString_Runs_hash(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
uint8_t __iota_Foundation_AttributedString_Runs_Index_equals(
    fishyjoes_env envRef,
    unowned_host_ref lhs,
    unowned_host_ref rhs,
    out_created_exception exn
);
int32_t __iota_get_Foundation_AttributedString_Runs_Index_hash(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
intptr_t __iota_Foundation_AttributedString_Runs_Index_compare(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref other,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_Runs_Run_range(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedString_Runs_Run_attributes(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
uint8_t __iota_Foundation_AttributedString_Runs_Run_equals(
    fishyjoes_env envRef,
    unowned_host_ref lhs,
    unowned_host_ref rhs,
    out_created_exception exn
);
int32_t __iota_get_Foundation_AttributedString_Runs_Run_hash(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
void Foundation_AttributedSubstring_setup(
    fishyjoes_env envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedSubstring_base(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedSubstring_string(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedSubstring_substring(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
uint8_t __iota_Foundation_AttributedSubstring_equals(
    fishyjoes_env envRef,
    unowned_host_ref lhs,
    unowned_host_ref rhs,
    out_created_exception exn
);
int32_t __iota_get_Foundation_AttributedSubstring_hash(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedSubstring_runs(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedSubstring_characters(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedSubstring_unicodeScalars(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedSubstring_startIndex(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_get_Foundation_AttributedSubstring_endIndex(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedSubstring_substringForRange(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref range,
    out_created_exception exn
);
created_host_ref __iota_Foundation_AttributedSubstring_createEmpty(
    fishyjoes_env envRef,
    out_created_exception exn
);
void FishyJoesCommonRuntime_AttributeContainer_setup(
    fishyjoes_env envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    out_created_exception exn
);
uint8_t __iota_FishyJoesCommonRuntime_AttributeContainer_equals(
    fishyjoes_env envRef,
    unowned_host_ref lhs,
    unowned_host_ref rhs,
    out_created_exception exn
);
int32_t __iota_get_FishyJoesCommonRuntime_AttributeContainer_hash(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
void __iota_FishyJoesCommonRuntime_AttributeContainer_merge(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref other,
    uint8_t keepCurrent,
    out_created_exception exn
);
created_host_ref __iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty(
    fishyjoes_env envRef,
    out_created_exception exn
);
void FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_setup(
    fishyjoes_env envRef,
    FishyJoes_ReferenceConstructorFn constructor,
    out_created_exception exn
);
created_host_ref __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
void __iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref newValue,
    out_created_exception exn
);
created_host_ref __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
void __iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier(
    fishyjoes_env envRef,
    unowned_host_ref self,
    unowned_host_ref newValue,
    out_created_exception exn
);
created_host_ref __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createEmpty(
    fishyjoes_env envRef,
    out_created_exception exn
);
uint8_t __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals(
    fishyjoes_env envRef,
    unowned_host_ref lhs,
    unowned_host_ref rhs,
    out_created_exception exn
);
int32_t __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
created_host_ref __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer(
    fishyjoes_env envRef,
    unowned_host_ref container,
    out_created_exception exn
);
created_host_ref __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_asContainer(
    fishyjoes_env envRef,
    unowned_host_ref self,
    out_created_exception exn
);
