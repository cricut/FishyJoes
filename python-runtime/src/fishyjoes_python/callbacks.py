from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Callable


@dataclass(slots=True)
class CallbackRegistry:
    """Retains Python callbacks while native code may still call them."""

    _callbacks: dict[int, Callable[..., Any]] = field(default_factory=dict)
    _next_id: int = 1

    def register(self, callback: Callable[..., Any]) -> int:
        callback_id = self._next_id
        self._next_id += 1
        self._callbacks[callback_id] = callback
        return callback_id

    def resolve(self, callback_id: int) -> Callable[..., Any]:
        return self._callbacks[callback_id]

    def unregister(self, callback_id: int) -> None:
        self._callbacks.pop(callback_id, None)

    def clear(self) -> None:
        self._callbacks.clear()

