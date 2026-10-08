from __future__ import annotations

from typing import Any

from testapi import associated_data_enum, async_functions, functions, reference_only_types, simple_enum


def uses_generated_sync_api() -> None:
    color = simple_enum.green
    associated = associated_data_enum.Thing(value=1)
    no_value = associated_data_enum.NoValue()
    marker: reference_only_types.Marker = reference_only_types.marker()
    exercised = functions.exercise0(lambda: 42)

    _: tuple[Any, ...] = (color, associated, no_value, marker, exercised)


async def uses_generated_async_api() -> None:
    delayed = await async_functions.delayed_const(nanoseconds=1)

    _: Any = delayed
