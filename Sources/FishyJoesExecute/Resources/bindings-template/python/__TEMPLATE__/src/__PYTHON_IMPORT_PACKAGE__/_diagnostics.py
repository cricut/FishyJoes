# __AUTOGEN_WARNING__

from __future__ import annotations

from . import _native


def diagnostics():
    return _native.diagnostics(__package__ or __name__.rpartition(".")[0])
