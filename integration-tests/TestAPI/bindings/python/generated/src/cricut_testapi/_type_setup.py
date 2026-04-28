from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

from .runtime import get_runtime
from .AProtocol import AProtocol
from .AProtocolImplementation import AProtocolImplementation
from .Actors import Actors
from .AssociatedDataEnum import AssociatedDataEnum
from .AsyncFunctions import AsyncFunctions
from .AttributedString_PuttingTypesIntoQuestionablePlaces import AttributedString_PuttingTypesIntoQuestionablePlaces
from .AttributedStrings import AttributedStrings
from .Bytes import Bytes
from .ClosedRanges import ClosedRanges
from .CollectionHolder import CollectionHolder
from .Collections import Collections
from .DefaultArguments import DefaultArguments
from .Deprecations import Deprecations
from .EmptyClass import EmptyClass
from .EmptyClass import _cls_TestAPI_EmptyClass_setup
from .EmptyClass2 import EmptyClass2
from .EmptyClass2 import _cls_TestAPI_EmptyClass2_setup
from .EmptyEnum import EmptyEnum
from .EmptyStruct import EmptyStruct
from .EmptyStruct2 import EmptyStruct2
from .Error import Error
from .ExternalWitness_AProtocol import ExternalWitness_AProtocol
from .ExternalWitness_TestAsyncFunctions import ExternalWitness_TestAsyncFunctions
from .ExternalWitness_TestDefaultComputedProperties import ExternalWitness_TestDefaultComputedProperties
from .ExternalWitness_TestDifferingExportNameProtocolDiffy import ExternalWitness_TestDifferingExportNameProtocolDiffy
from .ExternalWitness_TestLeadingUnderscoredProp import ExternalWitness_TestLeadingUnderscoredProp
from .ExternalWitness_TestMethodsProtocol import ExternalWitness_TestMethodsProtocol
from .ExternalWitness_TestOptionalsProtocol import ExternalWitness_TestOptionalsProtocol
from .ExternalWitness_TestPropertiesProtocol import ExternalWitness_TestPropertiesProtocol
from .Functions import Functions
from .MemberwiseStruct import MemberwiseStruct
from .Methods import Methods
from .Methods import _cls_TestAPI_Methods_setup
from .MutableStruct import MutableStruct
from .PrimitiveHolder import PrimitiveHolder
from .Primitives import Primitives
from .Ranges import Ranges
from .ReferenceEmptyEnum import ReferenceEmptyEnum
from .ReferenceStruct import ReferenceStruct
from .ReferenceStruct import _cls_TestAPI_Structs_ReferenceStruct_setup
from .Results import Results
from .SimpleEnum import SimpleEnum
from .String_PuttingTypesIntoQuestionablePlaces import String_PuttingTypesIntoQuestionablePlaces
from .Strings import Strings
from .Structs import Structs
from .Structs_PuttingTypesIntoQuestionablePlaces import Structs_PuttingTypesIntoQuestionablePlaces
from .Structs_PuttingTypesIntoQuestionablePlaces import _cls_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup
from .TemperatureLogger import TemperatureLogger
from .TemperatureLogger import _cls_TestAPI_Actors_TemperatureLogger_setup
from .TestAsyncForeignSideFunctionsStruct import TestAsyncForeignSideFunctionsStruct
from .TestAsyncFunctions import TestAsyncFunctions
from .TestAsyncSwiftSideFunctionsClass import TestAsyncSwiftSideFunctionsClass
from .TestAsyncSwiftSideFunctionsClass import _cls_TestAPI_TestAsyncSwiftSideFunctionsClass_setup
from .TestDefaultComputedProperties import TestDefaultComputedProperties
from .TestDefaultComputedPropertiesClass import TestDefaultComputedPropertiesClass
from .TestDefaultComputedPropertiesClass import _cls_TestAPI_TestDefaultComputedPropertiesClass_setup
from .TestDefaultComputedPropertiesEnum import TestDefaultComputedPropertiesEnum
from .TestDefaultComputedPropertiesStruct import TestDefaultComputedPropertiesStruct
from .TestDifferingExportNameProtocol import TestDifferingExportNameProtocol
from .TestDifferingExportNameStruct import TestDifferingExportNameStruct
from .TestLeadingUnderscoredProp import TestLeadingUnderscoredProp
from .TestLeadingUnderscoredPropStruct import TestLeadingUnderscoredPropStruct
from .TestMethodsProtocol import TestMethodsProtocol
from .TestNonExportedProtocolEnum import TestNonExportedProtocolEnum
from .TestOptionalsProtocol import TestOptionalsProtocol
from .TestPropertiesProtocol import TestPropertiesProtocol
from .TestProtocolClass import TestProtocolClass
from .TestProtocolClass import _cls_TestAPI_TestProtocolClass_setup
from .TestProtocolEnum import TestProtocolEnum
from .TestProtocolStruct import TestProtocolStruct
from .TheMethodError import TheMethodError
from .TheMethodError import _cls_TestAPI_Methods_TheMethodError_setup
from .Tuples import Tuples
from .TwentyOneItemStruct import TwentyOneItemStruct
from .URLs import URLs
from .UnicodeScalar_PuttingTypesIntoQuestionablePlaces import UnicodeScalar_PuttingTypesIntoQuestionablePlaces

_runtime = get_runtime()
_SETUP_COMPLETE = False

def ensure_loaded() -> None:
    global _SETUP_COMPLETE
    if _SETUP_COMPLETE:
        return
    
    _runtime.ensure_loaded()
    _runtime.setup_function_type("Function1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, FutureConverter<Swift.String>>", 1)
    _runtime.setup_function_type("AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>", 1)
    _runtime.setup_function_type("Function1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, FutureConverter<Swift.String>>", 1)
    _runtime.setup_function_type("Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>", 2)
    _runtime.setup_function_type("Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>", 2)
    _runtime.setup_function_type("Function1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, FutureConverter<Swift.String>>", 1)
    _runtime.setup_function_type("Function1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, FutureConverter<Swift.String>>", 1)
    _runtime.setup_function_type("Function1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, FutureConverter<Swift.String>>", 1)
    _runtime.setup_function_type("Function1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, FutureConverter<Swift.String>>", 1)
    _runtime.setup_function_type("AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>", 1)
    _runtime.setup_function_type("Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>", 2)
    _runtime.setup_function_type("Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>", 2)
    _runtime.setup_function_type("AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>", 1)
    _runtime.setup_function_type("AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>", 1)
    _runtime.setup_function_type("AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>", 1)
    _runtime.setup_function_type("AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>", 1)
    _runtime.setup_function_type("Function1Converter<AsyncFunction0Converter<Swift.Int>, FutureConverter<Swift.String>>", 1)
    _runtime.setup_function_type("AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>", 1)
    _runtime.setup_function_type("Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>", 1)
    _runtime.setup_function_type("Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>", 1)
    _runtime.setup_function_type("Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>", 1)
    _runtime.setup_function_type("Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>", 1)
    _runtime.setup_function_type("Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>", 1)
    _runtime.setup_function_type("Function3Converter<Swift.Float, Swift.Double, Swift.Int, FutureConverter<Swift.Double>>", 3)
    _runtime.setup_function_type("Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>", 3)
    _runtime.setup_function_type("Function3Converter<Swift.Int, Foundation.Data, Swift.Bool, FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>", 3)
    _runtime.setup_function_type("Function1Converter<Swift.Int, FutureConverter<Swift.Int>>", 1)
    _runtime.setup_function_type("Function1Converter<Swift.Int, Swift.Int>", 1)
    _runtime.setup_function_type("Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>", 6)
    _runtime.setup_function_type("Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>", 5)
    _runtime.setup_function_type("Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, FutureConverter<Swift.Int>>", 6)
    _runtime.setup_function_type("Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, FutureConverter<AsyncFunction0Converter<Swift.Int>>>", 5)
    _runtime.setup_function_type("Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, FutureConverter<ArrayConverter<Swift.String>>>", 4)
    _runtime.setup_function_type("Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", 4)
    _runtime.setup_function_type("Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>", 3)
    _runtime.setup_function_type("AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>", 3)
    _runtime.setup_function_type("AsyncFunction3Converter<Swift.Int, Foundation.Data, Swift.Bool, ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>", 3)
    _runtime.setup_function_type("Function1Converter<Swift.Int, Swift.Int>", 1)
    _runtime.setup_function_type("AsyncFunction1Converter<Swift.Int, Swift.Int>", 1)
    _runtime.setup_function_type("Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>", 6)
    _runtime.setup_function_type("Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>", 5)
    _runtime.setup_function_type("AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>", 6)
    _runtime.setup_function_type("AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>", 5)
    _runtime.setup_function_type("Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", 4)
    _runtime.setup_function_type("AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>", 4)
    _runtime.setup_function_type("Function0Converter<FutureConverter<Swift.Int>>", 0)
    _runtime.setup_function_type("Function0Converter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>", 0)
    _runtime.setup_function_type("Function0Converter<Swift.Int>", 0)
    _runtime.setup_function_type("Function0Converter<Swift.Int>", 0)
    _runtime.setup_function_type("AsyncFunction0Converter<Swift.Int>", 0)
    _runtime.setup_function_type("Function0Converter<FishyJoesCommonRuntime.VoidConverter>", 0)
    _runtime.setup_function_type("AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>", 0)
    _runtime.setup_future_type("FutureConverter<Function1Converter<Swift.Int, Swift.Int>>")
    _runtime.setup_future_type("FutureConverter<AsyncFunction1Converter<Swift.Int, Swift.Int>>")
    _runtime.setup_future_type("FutureConverter<Function0Converter<Swift.Int>>")
    _runtime.setup_future_type("FutureConverter<AsyncFunction0Converter<Swift.Int>>")
    _runtime.setup_future_type("FutureConverter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>")
    _runtime.setup_future_type("FutureConverter<FutureConverter<AsyncFunction0Converter<Swift.Int>>>")
    _runtime.setup_future_type("FutureConverter<FutureConverter<ArrayConverter<Swift.String>>>")
    _runtime.setup_future_type("FutureConverter<FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>>")
    _runtime.setup_future_type("FutureConverter<FutureConverter<Swift.Double>>")
    _runtime.setup_future_type("FutureConverter<FutureConverter<Swift.Int>>")
    _runtime.setup_future_type("FutureConverter<FutureConverter<Swift.String>>")
    _runtime.setup_future_type("FutureConverter<FutureConverter<FishyJoesCommonRuntime.VoidConverter>>")
    _runtime.setup_future_type("FutureConverter<ArrayConverter<Swift.String>>")
    _runtime.setup_future_type("FutureConverter<OptionalConverter<ArrayConverter<OptionalConverter<Swift.Int>>>>")
    _runtime.setup_future_type("FutureConverter<OptionalConverter<Swift.UInt8>>")
    _runtime.setup_future_type("FutureConverter<ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>>")
    _runtime.setup_future_type("FutureConverter<Swift.Double>")
    _runtime.setup_future_type("FutureConverter<Swift.Int>")
    _runtime.setup_future_type("FutureConverter<Swift.String>")
    _runtime.setup_future_type("FutureConverter<Swift.UInt>")
    _runtime.setup_future_type("FutureConverter<FishyJoesCommonRuntime.VoidConverter>")
    _runtime.setup_collection_type("ArrayConverter<OptionalConverter<Swift.Bool>>", "object")
    _runtime.setup_collection_type("ArrayConverter<OptionalConverter<Swift.Double>>", "object")
    _runtime.setup_collection_type("ArrayConverter<OptionalConverter<Swift.Float>>", "object")
    _runtime.setup_collection_type("ArrayConverter<OptionalConverter<Swift.Int>>", "object")
    _runtime.setup_collection_type("ArrayConverter<OptionalConverter<Swift.Int16>>", "object")
    _runtime.setup_collection_type("ArrayConverter<OptionalConverter<Swift.Int32>>", "object")
    _runtime.setup_collection_type("ArrayConverter<OptionalConverter<Swift.Int64>>", "object")
    _runtime.setup_collection_type("ArrayConverter<OptionalConverter<Swift.Int8>>", "object")
    _runtime.setup_collection_type("ArrayConverter<OptionalConverter<Swift.UInt>>", "object")
    _runtime.setup_collection_type("ArrayConverter<OptionalConverter<Swift.UInt16>>", "object")
    _runtime.setup_collection_type("ArrayConverter<OptionalConverter<Swift.UInt32>>", "object")
    _runtime.setup_collection_type("ArrayConverter<OptionalConverter<Swift.UInt64>>", "object")
    _runtime.setup_collection_type("ArrayConverter<OptionalConverter<Swift.UInt8>>", "object")
    _runtime.setup_collection_type("ArrayConverter<Foundation.AttributedString.Runs.Run>", "object")
    _runtime.setup_collection_type("ArrayConverter<Foundation.AttributedSubstring>", "object")
    _runtime.setup_collection_type("ArrayConverter<Swift.Bool>", "bool")
    _runtime.setup_collection_type("ArrayConverter<Swift.Double>", "double")
    _runtime.setup_collection_type("ArrayConverter<Swift.Float>", "float")
    _runtime.setup_collection_type("ArrayConverter<Swift.Int>", "int")
    _runtime.setup_collection_type("ArrayConverter<Swift.Int16>", "int16")
    _runtime.setup_collection_type("ArrayConverter<Swift.Int32>", "int32")
    _runtime.setup_collection_type("ArrayConverter<Swift.Int64>", "int64")
    _runtime.setup_collection_type("ArrayConverter<Swift.Int8>", "int8")
    _runtime.setup_collection_type("ArrayConverter<Swift.String>", "object")
    _runtime.setup_collection_type("ArrayConverter<Swift.UInt>", "uint")
    _runtime.setup_collection_type("ArrayConverter<Swift.UInt16>", "uint16")
    _runtime.setup_collection_type("ArrayConverter<Swift.UInt32>", "uint32")
    _runtime.setup_collection_type("ArrayConverter<Swift.UInt64>", "uint64")
    _runtime.setup_collection_type("ArrayConverter<Swift.UInt8>", "uint8")
    _runtime.setup_collection_type("ArrayConverter<Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>>", "object")
    _runtime.setup_dictionary_type("DictionaryConverter<Swift.Bool, Swift.Bool>")
    _runtime.setup_dictionary_type("DictionaryConverter<Swift.Int, OptionalConverter<Swift.Int>>")
    _runtime.setup_dictionary_type("DictionaryConverter<Swift.Int, Swift.Int>")
    _runtime.setup_dictionary_type("DictionaryConverter<Swift.String, Swift.String>")
    _runtime.setup_range_type("ClosedRangeConverter<Swift.Double>")
    _runtime.setup_range_type("ClosedRangeConverter<Swift.Float>")
    _runtime.setup_range_type("ClosedRangeConverter<Swift.Int>")
    _runtime.setup_range_type("ClosedRangeConverter<Swift.Int16>")
    _runtime.setup_range_type("ClosedRangeConverter<Swift.Int32>")
    _runtime.setup_range_type("ClosedRangeConverter<Swift.Int64>")
    _runtime.setup_range_type("ClosedRangeConverter<Swift.Int8>")
    _runtime.setup_range_type("ClosedRangeConverter<Swift.String>")
    _runtime.setup_range_type("ClosedRangeConverter<Swift.UInt>")
    _runtime.setup_range_type("ClosedRangeConverter<Swift.UInt16>")
    _runtime.setup_range_type("ClosedRangeConverter<Swift.UInt32>")
    _runtime.setup_range_type("ClosedRangeConverter<Swift.UInt64>")
    _runtime.setup_range_type("ClosedRangeConverter<Swift.UInt8>")
    _runtime.setup_range_type("RangeConverter<Foundation.AttributedString.Index>")
    _runtime.setup_range_type("RangeConverter<Swift.Int>")
    _runtime.setup_range_type("RangeConverter<Swift.Int16>")
    _runtime.setup_range_type("RangeConverter<Swift.Int32>")
    _runtime.setup_range_type("RangeConverter<Swift.Int64>")
    _runtime.setup_range_type("RangeConverter<Swift.Int8>")
    _runtime.setup_range_type("RangeConverter<Swift.UInt>")
    _runtime.setup_range_type("RangeConverter<Swift.UInt16>")
    _runtime.setup_range_type("RangeConverter<Swift.UInt32>")
    _runtime.setup_range_type("RangeConverter<Swift.UInt64>")
    _runtime.setup_range_type("RangeConverter<Swift.UInt8>")
    _runtime.setup_result_type("ResultConverter<Swift.Int, TestAPI.Methods.TheMethodError>")
    _runtime.setup_result_type("ResultConverter<Swift.Int, TestAPI.Results.Error>")
    _runtime.setup_result_type("ResultConverter<Swift.String, TestAPI.Results.Error>")
    _runtime.setup_collection_type("SetConverter<OptionalConverter<Swift.Int>>", "object")
    _runtime.setup_collection_type("SetConverter<Swift.Bool>", "bool")
    _runtime.setup_collection_type("SetConverter<Swift.Int>", "int")
    _runtime.setup_collection_type("SetConverter<Swift.String>", "object")
    _runtime.setup_struct_type("Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup", AttributedString_PuttingTypesIntoQuestionablePlaces, [("x", "object")], set())
    _runtime.setup_struct_type("Swift_String_PuttingTypesIntoQuestionablePlaces_setup", String_PuttingTypesIntoQuestionablePlaces, [("x", "object")], set())
    _runtime.setup_enum_type("Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup", UnicodeScalar_PuttingTypesIntoQuestionablePlaces, True, [("thing", [])])
    _runtime.setup_reference_type("TestAPI_Actors_TemperatureLogger_setup", _cls_TestAPI_Actors_TemperatureLogger_setup)
    _runtime.setup_struct_type("TestAPI_Collections_CollectionHolder_setup", CollectionHolder, [("boolArray", "object"), ("boolSet", "object"), ("boolDictionary", "object"), ("integerArray", "object"), ("integerSet", "object"), ("integerDictionary", "object"), ("stringArray", "object"), ("stringSet", "object"), ("stringDictionary", "object")], {"boolArray", "boolSet", "boolDictionary", "integerArray", "integerSet", "integerDictionary", "stringArray", "stringSet", "stringDictionary"})
    _runtime.setup_reference_type("TestAPI_Methods_TheMethodError_setup", _cls_TestAPI_Methods_TheMethodError_setup)
    _runtime.setup_struct_type("TestAPI_Primitives_PrimitiveHolder_setup", PrimitiveHolder, [("b", "bool"), ("bq", "object"), ("ui8", "uint8"), ("ui8q", "object"), ("ui16", "uint16"), ("ui16q", "object"), ("ui32", "uint32"), ("ui32q", "object"), ("ui64", "uint64"), ("ui64q", "object"), ("ui", "uint"), ("uiq", "object"), ("i8", "int8"), ("i8q", "object"), ("i16", "int16"), ("i16q", "object"), ("i32", "int32"), ("i32q", "object"), ("i64", "int64"), ("i64q", "object"), ("i", "int"), ("iq", "object"), ("f", "float"), ("fq", "object"), ("d", "double"), ("dq", "object")], {"b", "bq", "ui8", "ui8q", "ui16", "ui16q", "ui32", "ui32q", "ui64", "ui64q", "ui", "uiq", "i8", "i8q", "i16", "i16q", "i32", "i32q", "i64", "i64q", "i", "iq", "f", "fq", "d", "dq"})
    _runtime.setup_struct_type("TestAPI_Results_Error_setup", Error, [("message", "object")], set())
    _runtime.setup_struct_type("TestAPI_Structs_MemberwiseStruct_setup", MemberwiseStruct, [("immutable", "object"), ("mutable", "object")], {"immutable", "mutable"})
    _runtime.setup_struct_type("TestAPI_Structs_MutableStruct_setup", MutableStruct, [("i", "int")], {"i"})
    _runtime.setup_reference_type("TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup", _cls_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup)
    _runtime.setup_reference_type("TestAPI_Structs_ReferenceStruct_setup", _cls_TestAPI_Structs_ReferenceStruct_setup)
    _runtime.setup_struct_type("TestAPI_Structs_TwentyOneItemStruct_setup", TwentyOneItemStruct, [("a", "object"), ("b", "object"), ("c", "object"), ("d", "object"), ("e", "object"), ("f", "object"), ("g", "object"), ("h", "object"), ("i", "object"), ("j", "object"), ("k", "object"), ("l", "object"), ("m", "object"), ("n", "object"), ("o", "object"), ("p", "object"), ("q", "object"), ("r", "object"), ("s", "object"), ("t", "object"), ("u", "object")], {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u"})
    _runtime.setup_protocol_type("TestAPI_CommonInterface__AProtocolConverter_setup", ExternalWitness_AProtocol, [("baz", "bool"), ("foo", "object")], [("bar", ["int", "int"], "object")])
    _runtime.setup_struct_type("TestAPI_AProtocolImplementation_setup", AProtocolImplementation, [("foo", "object"), ("baz", "bool")], {"foo", "baz"})
    _runtime.setup_enum_type("TestAPI_Actors_setup", Actors, False, [])
    _runtime.setup_enum_type("TestAPI_AssociatedDataEnum_setup", AssociatedDataEnum, True, [("thing", [("value", "int")]), ("other", [("unnamed", "object"), ("_1", "int")]), ("bar", [("named", "object"), ("_1", "object"), ("toggled", "bool")]), ("noValue", []), ("simpleEnum", [("value", "object")])])
    _runtime.setup_enum_type("TestAPI_AsyncFunctions_setup", AsyncFunctions, False, [])
    _runtime.setup_enum_type("TestAPI_AttributedStrings_setup", AttributedStrings, False, [])
    _runtime.setup_enum_type("TestAPI_Bytes_setup", Bytes, False, [])
    _runtime.setup_enum_type("TestAPI_ClosedRanges_setup", ClosedRanges, False, [])
    _runtime.setup_enum_type("TestAPI_Collections_setup", Collections, False, [])
    _runtime.setup_enum_type("TestAPI_DefaultArguments_setup", DefaultArguments, False, [])
    _runtime.setup_enum_type("TestAPI_Deprecations_setup", Deprecations, False, [])
    _runtime.setup_reference_type("TestAPI_EmptyClass_setup", _cls_TestAPI_EmptyClass_setup)
    _runtime.setup_reference_type("TestAPI_EmptyClass2_setup", _cls_TestAPI_EmptyClass2_setup)
    _runtime.setup_enum_type("TestAPI_EmptyEnum_setup", EmptyEnum, False, [])
    _runtime.setup_struct_type("TestAPI_EmptyStruct_setup", EmptyStruct, [], set())
    _runtime.setup_struct_type("TestAPI_EmptyStruct2_setup", EmptyStruct2, [], set())
    _runtime.setup_enum_type("TestAPI_Functions_setup", Functions, False, [])
    _runtime.setup_reference_type("TestAPI_Methods_setup", _cls_TestAPI_Methods_setup)
    _runtime.setup_enum_type("TestAPI_Primitives_setup", Primitives, False, [])
    _runtime.setup_enum_type("TestAPI_Ranges_setup", Ranges, False, [])
    _runtime.setup_enum_type("TestAPI_ReferenceEmptyEnum_setup", ReferenceEmptyEnum, False, [])
    _runtime.setup_enum_type("TestAPI_Results_setup", Results, False, [])
    _runtime.setup_enum_type("TestAPI_SimpleEnum_setup", SimpleEnum, True, [("red", []), ("green", []), ("blue", [])])
    _runtime.setup_enum_type("TestAPI_Strings_setup", Strings, False, [])
    _runtime.setup_enum_type("TestAPI_Structs_setup", Structs, False, [])
    _runtime.setup_struct_type("TestAPI_TestAsyncForeignSideFunctionsStruct_setup", TestAsyncForeignSideFunctionsStruct, [("const42", "object"), ("iabs", "object"), ("intCompose", "object"), ("add3Things", "object"), ("makeList", "object"), ("fifthThing", "object"), ("six", "object"), ("willThrow", "object"), ("exercise0Fun", "object"), ("exercise1Fun", "object"), ("exercise2Fun", "object"), ("exercise3Fun", "object"), ("exercise4Fun", "object"), ("exercise5Fun", "object"), ("exercise6Fun", "object"), ("thunkTwiceMakerFun", "object")], set())
    _runtime.setup_protocol_type("TestAPI_CommonInterface__TestAsyncFunctionsConverter_setup", ExternalWitness_TestAsyncFunctions, [("add3Things", "object"), ("const42", "object"), ("fifthThing", "object"), ("iabs", "object"), ("intCompose", "object"), ("makeList", "object"), ("six", "object"), ("willThrow", "object")], [("exercise0", ["object"], "object"), ("exercise1", ["object"], "object"), ("exercise2", ["object"], "object"), ("exercise3", ["object"], "object"), ("exercise4", ["object"], "object"), ("exercise5", ["object"], "object"), ("exercise6", ["object"], "object"), ("thunkTwiceMaker", ["object"], "object"), ("witness", [], "object")])
    _runtime.setup_reference_type("TestAPI_TestAsyncSwiftSideFunctionsClass_setup", _cls_TestAPI_TestAsyncSwiftSideFunctionsClass_setup)
    _runtime.setup_protocol_type("TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_setup", ExternalWitness_TestDefaultComputedProperties, [("noot", "int"), ("pluto", "object")], [])
    _runtime.setup_reference_type("TestAPI_TestDefaultComputedPropertiesClass_setup", _cls_TestAPI_TestDefaultComputedPropertiesClass_setup)
    _runtime.setup_enum_type("TestAPI_TestDefaultComputedPropertiesEnum_setup", TestDefaultComputedPropertiesEnum, True, [("qux", [])])
    _runtime.setup_struct_type("TestAPI_TestDefaultComputedPropertiesStruct_setup", TestDefaultComputedPropertiesStruct, [("spam", "bool"), ("noot", "int")], {"spam", "noot"})
    _runtime.setup_protocol_type("TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_setup", ExternalWitness_TestDifferingExportNameProtocolDiffy, [("tata", "int")], [])
    _runtime.setup_struct_type("TestAPI_TestDifferingExportNameStruct_setup", TestDifferingExportNameStruct, [("tata", "int")], {"tata"})
    _runtime.setup_protocol_type("TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_setup", ExternalWitness_TestLeadingUnderscoredProp, [("_leadingUnderscoreProp", "object")], [])
    _runtime.setup_struct_type("TestAPI_TestLeadingUnderscoredPropStruct_setup", TestLeadingUnderscoredPropStruct, [("_leadingUnderscoreProp", "object")], {"_leadingUnderscoreProp"})
    _runtime.setup_protocol_type("TestAPI_CommonInterface__TestMethodsProtocolConverter_setup", ExternalWitness_TestMethodsProtocol, [], [("foo", [], "void"), ("bar", [], "bool"), ("baz", ["bool"], "void"), ("garply", ["object"], "object"), ("xyzzy", ["int", "object"], "object"), ("plugh", ["object"], "object")])
    _runtime.setup_enum_type("TestAPI_TestNonExportedProtocolEnum_setup", TestNonExportedProtocolEnum, True, [("hogehoge", [])])
    _runtime.setup_protocol_type("TestAPI_CommonInterface__TestOptionalsProtocolConverter_setup", ExternalWitness_TestOptionalsProtocol, [("flarp", "object")], [("wombat", ["object"], "object"), ("spqr", ["object"], "int")])
    _runtime.setup_protocol_type("TestAPI_CommonInterface__TestPropertiesProtocolConverter_setup", ExternalWitness_TestPropertiesProtocol, [("corge", "object"), ("frob", "object")], [])
    _runtime.setup_reference_type("TestAPI_TestProtocolClass_setup", _cls_TestAPI_TestProtocolClass_setup)
    _runtime.setup_enum_type("TestAPI_TestProtocolEnum_setup", TestProtocolEnum, True, [("qux", [])])
    _runtime.setup_struct_type("TestAPI_TestProtocolStruct_setup", TestProtocolStruct, [("corge", "object")], {"corge"})
    _runtime.setup_enum_type("TestAPI_Tuples_setup", Tuples, False, [])
    _runtime.setup_enum_type("TestAPI_URLs_setup", URLs, False, [])
    _runtime.setup_tuple_type("Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>", 3)
    _runtime.setup_tuple_type("Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>", 3)
    _runtime.setup_tuple_type("Tuple2Converter<Swift.Int, Swift.String>", 2)
    _runtime.setup_tuple_type("Tuple4Converter<Swift.Int8, Swift.Int16, Swift.Int32, Swift.Int64>", 4)
    _runtime.setup_tuple_type("Tuple3Converter<Swift.String, Swift.Double, Swift.String>", 3)
    _runtime.setup_tuple_type("Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>", 6)
    _runtime.setup_tuple_type("Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>", 5)
    _runtime.setup_tuple_type("Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>", 4)
    _SETUP_COMPLETE = True
