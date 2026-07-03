"""Shared Iota runtime for FishyJoes-generated Python binding packages.

Generated wheels depend on this package: each binding constructs a
RuntimeConfig and calls create_runtime() to load its native libraries and
obtain the runtime namespace its generated modules bind against.
"""

from .config import FISHYJOES_RUNTIME_VERSION, RuntimeConfig, RuntimeDependency
from .iota import create_runtime

__version__ = FISHYJOES_RUNTIME_VERSION

__all__ = ["RuntimeConfig", "RuntimeDependency", "__version__", "create_runtime"]
