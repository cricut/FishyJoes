from __future__ import annotations

from pathlib import Path
from setuptools import Extension, setup


ROOT = Path(__file__).parent


def read_readme() -> str:
    return (ROOT / "README.md").read_text(encoding="utf-8")


native = Extension(
    "fishyjoes_python._native",
    sources=["src/fishyjoes_python/_native.c"],
    define_macros=[("Py_LIMITED_API", "0x030B0000")],
    py_limited_api=True,
)


setup(long_description=read_readme(), ext_modules=[native])

