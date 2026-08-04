import sys
import unittest
from pathlib import Path

import typing_gate_support


def _fishyjoes_repo_root() -> Path | None:
    """Walk up from this file to the FishyJoes repository root, if inside one.

    TestAPI's tests also run in checkouts where TestAPI itself is the
    repository root (the generated downstream workflow); the runtime gate is
    owned by the FishyJoes repository (ADR 0017) and only runs there.
    """
    for candidate in Path(__file__).resolve().parents:
        if (candidate / "python-runtime").is_dir() and (candidate / "Sources" / "FishyJoesExecute").is_dir():
            return candidate
    return None


class RuntimeTypingTests(unittest.TestCase):
    """Gate the fishyjoes_runtime package's typing once, in the FishyJoes repository.

    Generated bindings stubtest only their own package, so the runtime's
    irreducible allowlist residue (closure-built iota/attributed_string classes)
    lives with the runtime instead of being repeated in every binding's allowlist.
    """

    def test_runtime_package_matches_stubs_with_stubtest(self) -> None:
        repo_root = _fishyjoes_repo_root()
        if repo_root is None:
            self.skipTest("runtime typing is gated in the FishyJoes repository, not in downstream checkouts")
        allowlist = repo_root / "python-runtime" / "stubtest_allowlist.txt"
        # Inside the owner repository the allowlist is required: a missing file
        # must fail the gate, not silently skip it.
        self.assertTrue(allowlist.is_file(), f"runtime stubtest allowlist missing: {allowlist}")
        typing_gate_support.run_checker(
            self,
            "mypy.stubtest (fishyjoes_runtime)",
            [
                sys.executable,
                "-m",
                "mypy.stubtest",
                "fishyjoes_runtime",
                "--concise",
                "--allowlist",
                str(allowlist),
            ],
            env=typing_gate_support.checker_env([repo_root / "python-runtime" / "src"]),
            cwd=Path(__file__).resolve().parents[1],
        )


if __name__ == "__main__":
    unittest.main()
