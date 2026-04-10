from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class AssociatedDataEnum:
    """
    <!-- FishyJoes.export(AssociatedDataEnum) -->
    Generated FishyJoes Python sum type base class.
    """
    @property
    def intValue(self) -> int:
        """
        <!-- FishyJoes.export(intValue) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_AssociatedDataEnum_intValue", "int", ("object", self))
    

    @staticmethod
    def staticThing() -> AssociatedDataEnum:
        """
        <!-- FishyJoes.export(staticThing) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_AssociatedDataEnum_staticThing", "object")
    

    def plus(self, other: AssociatedDataEnum) -> AssociatedDataEnum:
        """
        <!-- FishyJoes.export(plus) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_AssociatedDataEnum_plus", "object", ("object", self), ("object", other))
    


@dataclass(slots=True)
class AssociatedDataEnum_Thing(AssociatedDataEnum):
    """
    Documentation about thing
    """
    value: int


@dataclass(slots=True)
class AssociatedDataEnum_Other(AssociatedDataEnum):
    unnamed: str
    _1: int


@dataclass(slots=True)
class AssociatedDataEnum_Bar(AssociatedDataEnum):
    """
    Documentation about bar
    """
    named: str
    _1: AssociatedDataEnum
    toggled: bool


@dataclass(slots=True)
class AssociatedDataEnum_NoValue(AssociatedDataEnum):
    """
    Documentation about noValue
    """
    pass


@dataclass(slots=True)
class AssociatedDataEnum_SimpleEnum(AssociatedDataEnum):
    value: SimpleEnum
