# setup functions are organized by file for logical consistency, then brought together in the _type_setup namespace so
# that downstream libraries can find them easily.

from loader_collections import FishyJoesCommonRuntime_ArrayConverter_setup, \
    FishyJoesCommonRuntime_DictionaryConverter_setup, FishyJoesCommonRuntime_SetConverter_setup
from loader_future import FishyJoesCommonRuntime_FutureConverter_setup
from loader_tuple import FishyJoesCommonRuntime_Tuple2Converter_setup, FishyJoesCommonRuntime_Tuple2Converter_setup, \
    FishyJoesCommonRuntime_Tuple3Converter_setup, FishyJoesCommonRuntime_Tuple4Converter_setup, \
    FishyJoesCommonRuntime_Tuple5Converter_setup, FishyJoesCommonRuntime_Tuple6Converter_setup
from swift_function_impl import FishyJoesCommonRuntime_Function0Converter_setup, \
    FishyJoesCommonRuntime_Function1Converter_setup, FishyJoesCommonRuntime_Function2Converter_setup, \
    FishyJoesCommonRuntime_Function3Converter_setup, FishyJoesCommonRuntime_Function4Converter_setup, \
    FishyJoesCommonRuntime_Function5Converter_setup, FishyJoesCommonRuntime_Function6Converter_setup, \
    FishyJoesCommonRuntime_AsyncFunction0Converter_setup, FishyJoesCommonRuntime_AsyncFunction1Converter_setup, \
    FishyJoesCommonRuntime_AsyncFunction2Converter_setup, FishyJoesCommonRuntime_AsyncFunction3Converter_setup, \
    FishyJoesCommonRuntime_AsyncFunction4Converter_setup, FishyJoesCommonRuntime_AsyncFunction5Converter_setup, \
    FishyJoesCommonRuntime_AsyncFunction6Converter_setup
from swift_range import FishyJoesCommonRuntime_RangeConverter_setup, FishyJoesCommonRuntime_ClosedRangeConverter_setup

__all__ = [
    # collections
    'FishyJoesCommonRuntime_SetConverter_setup', 'FishyJoesCommonRuntime_DictionaryConverter_setup',
    'FishyJoesCommonRuntime_ArrayConverter_setup',
    # future
    'FishyJoesCommonRuntime_FutureConverter_setup',
    # tuple
    'FishyJoesCommonRuntime_Tuple2Converter_setup', 'FishyJoesCommonRuntime_Tuple3Converter_setup',
    'FishyJoesCommonRuntime_Tuple4Converter_setup', 'FishyJoesCommonRuntime_Tuple5Converter_setup',
    'FishyJoesCommonRuntime_Tuple6Converter_setup',
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
