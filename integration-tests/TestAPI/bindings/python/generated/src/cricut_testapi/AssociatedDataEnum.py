from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented
if typing.TYPE_CHECKING: from .SimpleEnum import SimpleEnum

class AssociatedDataEnum:
    """
    <!-- FishyJoes.export(AssociatedDataEnum) -->
    Generated FishyJoes Python sum type base class.
    """
    @property
    def intValue(self) -> builtins.int:
        """
        <!-- FishyJoes.export(intValue) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_AssociatedDataEnum_intValue", "int", ("object", self))
    

    @staticmethod
    def staticThing() -> AssociatedDataEnum:
        """
        <!-- FishyJoes.export(staticThing) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_AssociatedDataEnum_staticThing", "object")
    

    def plus(self, other: AssociatedDataEnum) -> AssociatedDataEnum:
        """
        <!-- FishyJoes.export(plus) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_AssociatedDataEnum_plus", "object", ("object", self), ("object", other))
    


@dataclass(slots=True, frozen=True)
class AssociatedDataEnum_Thing(AssociatedDataEnum):
    """
    Documentation about thing
    """
    value: builtins.int


@dataclass(slots=True, frozen=True)
class AssociatedDataEnum_Other(AssociatedDataEnum):
    unnamed: builtins.str
    _1: builtins.int


@dataclass(slots=True, frozen=True)
class AssociatedDataEnum_Bar(AssociatedDataEnum):
    """
    Documentation about bar
    """
    named: builtins.str
    _1: AssociatedDataEnum
    toggled: builtins.bool


@dataclass(slots=True, frozen=True)
class AssociatedDataEnum_NoValue(AssociatedDataEnum):
    """
    Documentation about noValue
    """
    pass


@dataclass(slots=True, frozen=True)
class AssociatedDataEnum_SimpleEnum(AssociatedDataEnum):
    value: SimpleEnum
