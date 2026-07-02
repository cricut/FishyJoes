"""Shared helpers for the typing-gate tests (stubtest / mypy / pyright runners).

Not a test module: unittest discovery ignores it (no test_ prefix).
"""
import os
import subprocess
import unittest
from collections.abc import Sequence
from pathlib import Path


def checker_env(mypy_source_paths: Sequence[Path]) -> dict[str, str]:
    """Environment for a type-checker subprocess.

    In installed-wheel mode the stubs come from the installed packages, so
    MYPYPATH must not shadow them with the source tree; in development mode the
    given source paths are prepended so checkers see the working-tree stubs.
    """
    env = os.environ.copy()
    if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") == "1":
        env.pop("MYPYPATH", None)
    else:
        env["MYPYPATH"] = os.pathsep.join(
            [str(path) for path in mypy_source_paths] + list(filter(None, [env.get("MYPYPATH", "")]))
        )
    env["PYTHONDONTWRITEBYTECODE"] = "1"
    return env


def run_checker(
    test: unittest.TestCase,
    name: str,
    command: list[str],
    env: dict[str, str],
    cwd: Path,
) -> subprocess.CompletedProcess[str]:
    result = subprocess.run(
        command,
        cwd=cwd,
        env=env,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        check=False,
    )
    test.assertEqual(
        0,
        result.returncode,
        "\n".join(
            [
                f"{name} failed.",
                "Install test dependencies in bindings/python/.venv if the checker is missing.",
                result.stdout,
                result.stderr,
            ]
        ),
    )
    return result
