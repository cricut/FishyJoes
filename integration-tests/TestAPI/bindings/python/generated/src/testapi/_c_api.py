from __future__ import annotations
from . import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import importlib
import types
import typing

_resources = importlib.resources.files('testapi')
fishyjoes_runtime.ffi.cdef((_resources / '_declarations.h').read_text('utf-8'))
_testapi_lib = fishyjoes_runtime.ffi.dlopen(str(_resources / 'native' / fishyjoes_runtime.platform_shared_lib_name('TestAPI-iota')))
__all__ = [ '_testapi_lib' ]
