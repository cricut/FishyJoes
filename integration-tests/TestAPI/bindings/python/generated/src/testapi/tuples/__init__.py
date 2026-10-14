from __future__ import annotations
from .. import _testapi_exported as testapi
from .. import _tuples_implementation as _impl
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "get_tuple2",
    "get_tuple3",
    "get_tuple4",
    "get_tuple5",
    "get_tuple6",
    "check_tuples",
]

def get_tuple2() -> tuple[int,str]:
    """<!-- FishyJoes.export(tuple2) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Tuples_tuple2(fishyjoes_runtime.Runtime.shared.env_ref), tuple)

def get_tuple3() -> tuple[str,float,str]:
    """<!-- FishyJoes.export(tuple3) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Tuples_tuple3(fishyjoes_runtime.Runtime.shared.env_ref), tuple)

def get_tuple4() -> tuple[tuple[int,str],tuple[str,float,str],str,bool]:
    """<!-- FishyJoes.export(tuple4) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Tuples_tuple4(fishyjoes_runtime.Runtime.shared.env_ref), tuple)

def get_tuple5() -> tuple[str,int,tuple[tuple[int,str],tuple[str,float,str],str,bool],tuple[str,float,str],tuple[int,str]]:
    """<!-- FishyJoes.export(tuple5) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Tuples_tuple5(fishyjoes_runtime.Runtime.shared.env_ref), tuple)

def get_tuple6() -> tuple[str,int,float,tuple[tuple[int,str],tuple[str,float,str],str,bool],tuple[str,int,tuple[tuple[int,str],tuple[str,float,str],str,bool],tuple[str,float,str],tuple[int,str]],bool]:
    """<!-- FishyJoes.export(tuple6) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Tuples_tuple6(fishyjoes_runtime.Runtime.shared.env_ref), tuple)

def check_tuples(
    t2: tuple[int,str],
    t3: tuple[str,float,str],
    t4: tuple[tuple[int,str],tuple[str,float,str],str,bool],
    t5: tuple[str,int,tuple[tuple[int,str],tuple[str,float,str],str,bool],tuple[str,float,str],tuple[int,str]],
    t6: tuple[str,int,float,tuple[tuple[int,str],tuple[str,float,str],str,bool],tuple[str,int,tuple[tuple[int,str],tuple[str,float,str],str,bool],tuple[str,float,str],tuple[int,str]],bool],
) -> bool:
    """<!-- FishyJoes.export(checkTuples) -->"""
    with fishyjoes_runtime.local_handles(t2, t3, t4, t5, t6) as (_t2Handle, _t3Handle, _t4Handle, _t5Handle, _t6Handle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Tuples_checkTuples(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _t2Handle,
                _t3Handle,
                _t4Handle,
                _t5Handle,
                _t6Handle,
            ),
            bool
        )
