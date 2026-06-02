from __future__ import annotations

from typing import Any

from testapi import (
    AssociatedDataEnum,
    AsyncFunctions,
    Functions,
    ReferenceOnlyTypes,
    ReferenceOnlyTypes_Marker,
    SimpleEnum,
    diagnostics,
)


def uses_generated_sync_api() -> None:
    color = SimpleEnum.green
    associated = AssociatedDataEnum.thing(value=1)
    no_value = AssociatedDataEnum.no_value()
    marker: ReferenceOnlyTypes_Marker = ReferenceOnlyTypes.marker()
    const_value: Any = Functions.const42
    diagnostics_report = diagnostics()

    _: tuple[Any, ...] = (color, associated, no_value, marker, const_value, diagnostics_report)


async def uses_generated_async_api() -> None:
    delayed = await AsyncFunctions.delayed_const(nanoseconds=1)

    _: Any = delayed
