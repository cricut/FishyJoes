# __AUTOGEN_WARNING__

from __future__ import annotations

from typing import Any

from . import _native


def diagnostics() -> dict[str, Any]:
    return _native.diagnostics(__package__ or __name__.rpartition(".")[0])
