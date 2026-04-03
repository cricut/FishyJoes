from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

from .runtime import get_runtime
from .AProtocol import AProtocol
from .AProtocolImplementation import AProtocolImplementation
from .Actors import Actors
from .AssociatedDataEnum import AssociatedDataEnum
from .AsyncFunctions import AsyncFunctions
from .AttributedStrings import AttributedStrings
from .Bytes import Bytes
from .ClosedRanges import ClosedRanges
from .CollectionHolder import CollectionHolder
from .Collections import Collections
from .DefaultArguments import DefaultArguments
from .Deprecations import Deprecations
from .EmptyClass import EmptyClass
from .EmptyClass2 import EmptyClass2
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
from .MutableStruct import MutableStruct
from .PrimitiveHolder import PrimitiveHolder
from .Primitives import Primitives
from .PuttingTypesIntoQuestionablePlaces import PuttingTypesIntoQuestionablePlaces
from .PuttingTypesIntoQuestionablePlaces import PuttingTypesIntoQuestionablePlaces
from .PuttingTypesIntoQuestionablePlaces import PuttingTypesIntoQuestionablePlaces
from .PuttingTypesIntoQuestionablePlaces import PuttingTypesIntoQuestionablePlaces
from .Ranges import Ranges
from .ReferenceEmptyEnum import ReferenceEmptyEnum
from .ReferenceStruct import ReferenceStruct
from .Results import Results
from .SimpleEnum import SimpleEnum
from .Strings import Strings
from .Structs import Structs
from .TemperatureLogger import TemperatureLogger
from .TestAsyncForeignSideFunctionsStruct import TestAsyncForeignSideFunctionsStruct
from .TestAsyncFunctions import TestAsyncFunctions
from .TestAsyncSwiftSideFunctionsClass import TestAsyncSwiftSideFunctionsClass
from .TestDefaultComputedProperties import TestDefaultComputedProperties
from .TestDefaultComputedPropertiesClass import TestDefaultComputedPropertiesClass
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
from .TestProtocolEnum import TestProtocolEnum
from .TestProtocolStruct import TestProtocolStruct
from .TheMethodError import TheMethodError
from .Tuples import Tuples
from .TwentyOneItemStruct import TwentyOneItemStruct
from .URLs import URLs

_runtime = get_runtime()
_SETUP_COMPLETE = False

def ensure_loaded() -> None:
    global _SETUP_COMPLETE
    if _SETUP_COMPLETE:
        return
    
    _runtime.ensure_loaded()
    _runtime.setup_struct_type("Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup", PuttingTypesIntoQuestionablePlaces, [("x", "object")], {})
    _runtime.setup_struct_type("Swift_String_PuttingTypesIntoQuestionablePlaces_setup", PuttingTypesIntoQuestionablePlaces, [("x", "object")], {})
    _runtime.setup_reference_type("TestAPI_Actors_TemperatureLogger_setup", TemperatureLogger)
    _runtime.setup_struct_type("TestAPI_Collections_CollectionHolder_setup", CollectionHolder, [("boolArray", "object"), ("boolSet", "object"), ("boolDictionary", "object"), ("integerArray", "object"), ("integerSet", "object"), ("integerDictionary", "object"), ("stringArray", "object"), ("stringSet", "object"), ("stringDictionary", "object")], {"boolArray", "boolSet", "boolDictionary", "integerArray", "integerSet", "integerDictionary", "stringArray", "stringSet", "stringDictionary"})
    _runtime.setup_reference_type("TestAPI_Methods_TheMethodError_setup", TheMethodError)
    _runtime.setup_struct_type("TestAPI_Primitives_PrimitiveHolder_setup", PrimitiveHolder, [("b", "object"), ("bq", "object"), ("ui8", "object"), ("ui8q", "object"), ("ui16", "object"), ("ui16q", "object"), ("ui32", "object"), ("ui32q", "object"), ("ui64", "object"), ("ui64q", "object"), ("ui", "object"), ("uiq", "object"), ("i8", "object"), ("i8q", "object"), ("i16", "object"), ("i16q", "object"), ("i32", "object"), ("i32q", "object"), ("i64", "object"), ("i64q", "object"), ("i", "object"), ("iq", "object"), ("f", "object"), ("fq", "object"), ("d", "object"), ("dq", "object")], {"b", "bq", "ui8", "ui8q", "ui16", "ui16q", "ui32", "ui32q", "ui64", "ui64q", "ui", "uiq", "i8", "i8q", "i16", "i16q", "i32", "i32q", "i64", "i64q", "i", "iq", "f", "fq", "d", "dq"})
    _runtime.setup_struct_type("TestAPI_Results_Error_setup", Error, [("message", "object")], {})
    _runtime.setup_struct_type("TestAPI_Structs_MemberwiseStruct_setup", MemberwiseStruct, [("immutable", "object"), ("mutable", "object")], {"immutable", "mutable"})
    _runtime.setup_struct_type("TestAPI_Structs_MutableStruct_setup", MutableStruct, [("i", "object")], {"i"})
    _runtime.setup_reference_type("TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_setup", PuttingTypesIntoQuestionablePlaces)
    _runtime.setup_reference_type("TestAPI_Structs_ReferenceStruct_setup", ReferenceStruct)
    _runtime.setup_struct_type("TestAPI_Structs_TwentyOneItemStruct_setup", TwentyOneItemStruct, [("a", "object"), ("b", "object"), ("c", "object"), ("d", "object"), ("e", "object"), ("f", "object"), ("g", "object"), ("h", "object"), ("i", "object"), ("j", "object"), ("k", "object"), ("l", "object"), ("m", "object"), ("n", "object"), ("o", "object"), ("p", "object"), ("q", "object"), ("r", "object"), ("s", "object"), ("t", "object"), ("u", "object")], {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u"})
    _runtime.setup_struct_type("TestAPI_AProtocolImplementation_setup", AProtocolImplementation, [("foo", "object"), ("baz", "object")], {"foo", "baz"})
    _runtime.setup_reference_type("TestAPI_EmptyClass_setup", EmptyClass)
    _runtime.setup_reference_type("TestAPI_EmptyClass2_setup", EmptyClass2)
    _runtime.setup_struct_type("TestAPI_EmptyStruct_setup", EmptyStruct, [], {})
    _runtime.setup_struct_type("TestAPI_EmptyStruct2_setup", EmptyStruct2, [], {})
    _runtime.setup_reference_type("TestAPI_Methods_setup", Methods)
    _runtime.setup_struct_type("TestAPI_TestAsyncForeignSideFunctionsStruct_setup", TestAsyncForeignSideFunctionsStruct, [("const42", "object"), ("iabs", "object"), ("intCompose", "object"), ("add3Things", "object"), ("makeList", "object"), ("fifthThing", "object"), ("six", "object"), ("willThrow", "object"), ("exercise0Fun", "object"), ("exercise1Fun", "object"), ("exercise2Fun", "object"), ("exercise3Fun", "object"), ("exercise4Fun", "object"), ("exercise5Fun", "object"), ("exercise6Fun", "object"), ("thunkTwiceMakerFun", "object")], {})
    _runtime.setup_reference_type("TestAPI_TestAsyncSwiftSideFunctionsClass_setup", TestAsyncSwiftSideFunctionsClass)
    _runtime.setup_reference_type("TestAPI_TestDefaultComputedPropertiesClass_setup", TestDefaultComputedPropertiesClass)
    _runtime.setup_struct_type("TestAPI_TestDefaultComputedPropertiesStruct_setup", TestDefaultComputedPropertiesStruct, [("spam", "object"), ("noot", "object")], {"spam", "noot"})
    _runtime.setup_struct_type("TestAPI_TestDifferingExportNameStruct_setup", TestDifferingExportNameStruct, [("tata", "object")], {"tata"})
    _runtime.setup_struct_type("TestAPI_TestLeadingUnderscoredPropStruct_setup", TestLeadingUnderscoredPropStruct, [("_leadingUnderscoreProp", "object")], {"_leadingUnderscoreProp"})
    _runtime.setup_reference_type("TestAPI_TestProtocolClass_setup", TestProtocolClass)
    _runtime.setup_struct_type("TestAPI_TestProtocolStruct_setup", TestProtocolStruct, [("corge", "object")], {"corge"})
    _SETUP_COMPLETE = True
