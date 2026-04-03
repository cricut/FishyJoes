from __future__ import annotations

import sys
from dataclasses import dataclass
from typing import Final


CPYTHON_ONLY_MESSAGE: Final = "fishyjoes_python supports CPython only"


def ensure_cpython() -> None:
    if sys.implementation.name != "cpython":
        raise RuntimeError(CPYTHON_ONLY_MESSAGE)


def get_runtime_capabilities() -> dict[str, object]:
    return {
        "implementation": sys.implementation.name,
        "version": sys.version_info[:3],
        "supports_abi3": True,
        "supports_free_threaded": False,
        "supports_subinterpreters": False,
    }


@dataclass(frozen=True, slots=True)
class RuntimeState:
    """Process-wide runtime facts used by generated bindings."""

    implementation: str
    version: tuple[int, int, int]
    supports_abi3: bool = True
    supports_free_threaded: bool = False
    supports_subinterpreters: bool = False

    @classmethod
    def detect(cls) -> "RuntimeState":
        info = get_runtime_capabilities()
        return cls(
            implementation=str(info["implementation"]),
            version=tuple(info["version"]),  # type: ignore[arg-type]
            supports_abi3=bool(info["supports_abi3"]),
            supports_free_threaded=bool(info["supports_free_threaded"]),
            supports_subinterpreters=bool(info["supports_subinterpreters"]),
        )

