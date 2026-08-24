# __AUTOGEN_WARNING__

from typing import Any

from . import _native


def diagnostics() -> dict[str, Any]:
    """Report how this binding package was set up, for debugging import issues.

    Returns a dictionary describing the installed package and its runtime
    state: package name and version, whether native setup finished
    (``supported``), the Python and platform the process is running on, the
    FishyJoes runtime package/version/requirement, per-dependency reports of
    the same shape, and the paths of the native libraries that were loaded.

    This is the first thing to inspect when an import fails or a wheel loads
    the wrong native library.
    """
    return _native.diagnostics(__package__ or __name__.rpartition(".")[0])
