"""``_assume(value, kind)`` is the typed-cast-with-runtime-check helper
the runtime template uses at FFI boundaries where mypy cannot prove
the shape of a value but the runtime semantics demand a specific type.

Contract:
1. When the value is an instance of ``kind``, return it (narrowed).
2. When it is not, raise ``TypeMismatchError`` with the expected name
   and the actual value — the assertion is a real runtime check, not
   a type-system fiction.
3. Mypy treats it as a ``TypeGuard``-style narrower (verified by the
   downstream typechecker pass on generated runtime files).
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src"
if str(SRC) not in sys.path:
    sys.path.insert(0, str(SRC))

from fishyjoes_python import TypeMismatchError
from fishyjoes_python.iota import _assume


class AssumeHelperTests(unittest.TestCase):
    def test_returns_value_when_isinstance(self) -> None:
        self.assertEqual(_assume("hello", str), "hello")
        self.assertEqual(_assume(42, int), 42)
        self.assertEqual(_assume([1, 2], list), [1, 2])

    def test_raises_typemismatch_on_wrong_kind(self) -> None:
        with self.assertRaises(TypeMismatchError) as ctx:
            _assume("not a number", int)
        # The error must carry the expected type name and the actual value.
        self.assertIn("int", str(ctx.exception))
        self.assertEqual(ctx.exception.expected, "int")
        self.assertEqual(ctx.exception.got, "not a number")

    def test_raises_on_none(self) -> None:
        with self.assertRaises(TypeMismatchError):
            _assume(None, int)

    def test_subclass_passes(self) -> None:
        class MyDict(dict):
            pass
        d = MyDict({"k": 1})
        self.assertIs(_assume(d, dict), d)


if __name__ == "__main__":
    unittest.main()
