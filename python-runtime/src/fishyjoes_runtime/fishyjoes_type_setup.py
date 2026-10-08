# setup functions are organized by file for logical consistency, then brought together in the _type_setup namespace so
# that downstream libraries can find them easily.
from ._fishyjoesruntime_c_api import lazy_once
from .loader_collections import FishyJoesCommonRuntime_ArrayConverter_setup, \
    FishyJoesCommonRuntime_DictionaryConverter_setup, FishyJoesCommonRuntime_OptionalConverter_setup, \
    FishyJoesCommonRuntime_SetConverter_setup, setup_collections
from .loader_environment import setup_environment
from .loader_future import FishyJoesCommonRuntime_FutureConverter_setup, setup_futures
from .loader_misc import setup_misc
from .loader_primitives import setup_primitives
from .loader_tuple import FishyJoesCommonRuntime_Tuple2Converter_setup, FishyJoesCommonRuntime_Tuple2Converter_setup, \
    FishyJoesCommonRuntime_Tuple3Converter_setup, FishyJoesCommonRuntime_Tuple4Converter_setup, \
    FishyJoesCommonRuntime_Tuple5Converter_setup, FishyJoesCommonRuntime_Tuple6Converter_setup, setup_tuples
from .result import FishyJoesCommonRuntime_ResultConverter_setup, setup_results
from .runtime import Runtime
from .swift_function_impl import FishyJoesCommonRuntime_AsyncFunction0Converter_setup, \
    FishyJoesCommonRuntime_AsyncFunction1Converter_setup, FishyJoesCommonRuntime_AsyncFunction2Converter_setup, \
    FishyJoesCommonRuntime_AsyncFunction3Converter_setup, FishyJoesCommonRuntime_AsyncFunction4Converter_setup, \
    FishyJoesCommonRuntime_AsyncFunction5Converter_setup, FishyJoesCommonRuntime_AsyncFunction6Converter_setup, \
    FishyJoesCommonRuntime_Function0Converter_setup, FishyJoesCommonRuntime_Function1Converter_setup, \
    FishyJoesCommonRuntime_Function2Converter_setup, FishyJoesCommonRuntime_Function3Converter_setup, \
    FishyJoesCommonRuntime_Function4Converter_setup, FishyJoesCommonRuntime_Function5Converter_setup, \
    FishyJoesCommonRuntime_Function6Converter_setup, setup_functions
from .swift_range import FishyJoesCommonRuntime_ClosedRangeConverter_setup, FishyJoesCommonRuntime_RangeConverter_setup, \
    setup_ranges
from .swift_reference import setup_references


@lazy_once("fishyjoes_runtime_setup")
def ensure_loaded() -> None:
    Runtime.shared = Runtime(setup_environment())
    setup_primitives()
    setup_collections()
    setup_tuples()
    setup_ranges()
    setup_results()
    setup_references()
    setup_functions()
    setup_misc()
    # setup_attributed_string()
    setup_futures()

__all__ = [
    # collections
    'FishyJoesCommonRuntime_SetConverter_setup', 'FishyJoesCommonRuntime_DictionaryConverter_setup',
    'FishyJoesCommonRuntime_ArrayConverter_setup', 'FishyJoesCommonRuntime_OptionalConverter_setup',
    # future
    'FishyJoesCommonRuntime_FutureConverter_setup',
    # tuple
    'FishyJoesCommonRuntime_Tuple2Converter_setup', 'FishyJoesCommonRuntime_Tuple3Converter_setup',
    'FishyJoesCommonRuntime_Tuple4Converter_setup', 'FishyJoesCommonRuntime_Tuple5Converter_setup',
    'FishyJoesCommonRuntime_Tuple6Converter_setup',
    # result
    'FishyJoesCommonRuntime_ResultConverter_setup',
    # function
    'FishyJoesCommonRuntime_Function0Converter_setup',
    'FishyJoesCommonRuntime_Function1Converter_setup',
    'FishyJoesCommonRuntime_Function2Converter_setup',
    'FishyJoesCommonRuntime_Function3Converter_setup',
    'FishyJoesCommonRuntime_Function4Converter_setup',
    'FishyJoesCommonRuntime_Function5Converter_setup',
    'FishyJoesCommonRuntime_Function6Converter_setup',
    'FishyJoesCommonRuntime_AsyncFunction0Converter_setup',
    'FishyJoesCommonRuntime_AsyncFunction1Converter_setup',
    'FishyJoesCommonRuntime_AsyncFunction2Converter_setup',
    'FishyJoesCommonRuntime_AsyncFunction3Converter_setup',
    'FishyJoesCommonRuntime_AsyncFunction4Converter_setup',
    'FishyJoesCommonRuntime_AsyncFunction5Converter_setup',
    'FishyJoesCommonRuntime_AsyncFunction6Converter_setup',
    # range
    'FishyJoesCommonRuntime_RangeConverter_setup', 'FishyJoesCommonRuntime_ClosedRangeConverter_setup',
]
