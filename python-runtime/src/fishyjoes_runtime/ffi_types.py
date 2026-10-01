from typing import NewType, TypeAlias

from _cffi_backend import _CDataBase
from cffi import FFI

Pointer: TypeAlias = _CDataBase

# Handles to python objects
CreatedRef = NewType("CreatedRef", Pointer)
UnownedRef = NewType("UnownedRef", Pointer)
ConsumedRef = NewType("ConsumedRef", Pointer)

# Handles to swift objects
CreatedSwiftRef = NewType("CreatedSwiftRef", Pointer)
UnownedSwiftRef = NewType("UnownedSwiftRef", Pointer)
ConsumedSwiftRef = NewType("ConsumedSwiftRef", Pointer)

# Pointers to handles to python objects
OutCreatedRef = NewType("OutCreatedRef", Pointer)
CreatedRefArray = NewType("CreatedRefArray", Pointer)
UnownedRefArray = NewType("UnownedRefArray", Pointer)
ConsumedRefArray = NewType("ConsumedRefArray", Pointer)

# Other pointers
EnvRef = NewType("EnvRef", Pointer)
UTF8CString = NewType("UTF8CString", Pointer)
UTF16CString = NewType("UTF16CString", Pointer)

# Specific pointers
CREATED_REF_NULL = CreatedRef(FFI.NULL)

__all__ = [
    "Pointer",
    "CreatedRef", "UnownedRef", "ConsumedRef",
    "CreatedSwiftRef", "UnownedSwiftRef", "ConsumedSwiftRef",
    "OutCreatedRef", "CreatedRefArray", "UnownedRefArray", "ConsumedRefArray",
    "EnvRef", "UTF8CString", "UTF16CString",
    "CREATED_REF_NULL",
]
