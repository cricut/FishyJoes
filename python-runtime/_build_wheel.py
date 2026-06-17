"""Build and repair the FishyJoes Python runtime wheel.

This script handles three package-time jobs for the hand-written runtime
package:

1. Read `pyproject.toml`, stamp the runtime package version into `config.py`,
   and write wheel metadata.
2. Collect the native FishyJoes runtime library and any platform-local support
   libraries that must travel with it. On Windows this includes walking PE
   imports to find Swift runtime DLL dependencies.
3. Repair the produced wheel with the platform toolchain: delocate on macOS,
   auditwheel on Linux, and a package-local DLL report on Windows.
"""

from __future__ import annotations

import argparse
import base64
import hashlib
import json
import os
import platform
import re
import shutil
import subprocess
import sys
import sysconfig
import tempfile
import tomllib
import zipfile
from collections.abc import Sequence
from pathlib import Path


ROOT = Path(__file__).resolve().parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from _windows_pe import imported_dll_names as windows_imported_dll_names

PYPROJECT = tomllib.loads((ROOT / "pyproject.toml").read_text(encoding="utf-8"))
WINDOWS_RUNTIME_DLL_NAMES = {"blocksruntime.dll", "dispatch.dll"}
WINDOWS_RUNTIME_DLL_PREFIXES = ("swift", "foundation")


def normalized_distribution_name(name: str) -> str:
    return re.sub(r"[-_.]+", "_", name).lower()


def wheel_hash(data: bytes) -> str:
    digest = hashlib.sha256(data).digest()
    return "sha256=" + base64.urlsafe_b64encode(digest).rstrip(b"=").decode("ascii")


def package_root() -> tuple[str, Path]:
    packages = PYPROJECT["tool"]["hatch"]["build"]["targets"]["wheel"]["packages"]
    package_path = Path(packages[0])
    return package_path.name, ROOT / package_path


def iter_package_files(package_name: str, source_dir: Path):
    for path in sorted(source_dir.rglob("*")):
        if path.is_file() and "__pycache__" not in path.parts:
            yield Path(package_name) / path.relative_to(source_dir), path


def runtime_config_with_version(data: bytes, version: str) -> bytes:
    source = data.decode("utf-8")
    updated, count = re.subn(
        r'^(FISHYJOES_RUNTIME_VERSION = ")[^"]+(")(\r?)$',
        rf"\g<1>{version}\g<2>\g<3>",
        source,
        count=1,
        flags=re.MULTILINE,
    )
    if count != 1:
        raise RuntimeError("Could not stamp FishyJoes runtime version in config.py")
    return updated.encode("utf-8")


def normalized_platform(value: str) -> str:
    return value.replace("-", "_").replace(".", "_")


def native_library_filename() -> str:
    system = platform.system()
    if system == "Darwin":
        return "libFishyJoesIotaRuntime.dylib"
    if system == "Linux":
        return "libFishyJoesIotaRuntime.so"
    if system == "Windows":
        return "FishyJoesIotaRuntime.dll"
    raise RuntimeError(f"Unsupported Python binding platform: {system}")


def _should_bundle_windows_path_dependency(dll_name: str, path: Path) -> bool:
    lower_name = dll_name.lower()
    if not (
        lower_name.startswith(WINDOWS_RUNTIME_DLL_PREFIXES)
        or lower_name in WINDOWS_RUNTIME_DLL_NAMES
    ):
        return False
    return "windows\\system32" not in str(path).lower()


def _windows_path_entries() -> list[Path]:
    return [Path(entry) for entry in os.environ.get("PATH", "").split(os.pathsep) if entry]


def _windows_path_file(dll_name: str) -> Path | None:
    for directory in _windows_path_entries():
        candidate = directory / dll_name
        if candidate.exists() and candidate.suffix.lower() == ".dll":
            return candidate
    return None


def _windows_dependency_candidate(search_dirs: Sequence[Path], dll_name: str) -> Path | None:
    for directory in search_dirs:
        adjacent = directory / dll_name
        if adjacent.exists() and adjacent.suffix.lower() == ".dll":
            return adjacent
    candidate = _windows_path_file(dll_name)
    if candidate is not None and _should_bundle_windows_path_dependency(dll_name, candidate):
        return candidate
    return None


def windows_runtime_support_dlls_on_path() -> list[Path]:
    dlls: dict[str, Path] = {}
    for directory in _windows_path_entries():
        if not directory.exists():
            continue
        for path in directory.glob("*.dll"):
            if _should_bundle_windows_path_dependency(path.name, path):
                dlls.setdefault(path.name.lower(), path)
    return [path for _, path in sorted(dlls.items())]


def windows_runtime_dependency_dlls(native_library: Path) -> list[Path]:
    native_dir = native_library.parent
    copied: dict[str, Path] = {native_library.name.lower(): native_library}
    pending = [native_library]
    for path in windows_runtime_support_dlls_on_path():
        if path.name.lower() not in copied:
            copied[path.name.lower()] = path
            pending.append(path)
    while pending:
        current = pending.pop()
        for dll_name in sorted(windows_imported_dll_names(current), key=str.lower):
            if dll_name.lower() in copied:
                continue
            candidate = _windows_dependency_candidate([native_dir, current.parent], dll_name)
            if candidate is not None:
                copied[dll_name.lower()] = candidate
                pending.append(candidate)
    return [path for name, path in sorted(copied.items()) if path != native_library]


def native_library_files(native_library: Path) -> list[Path]:
    files = [native_library]
    if platform.system() == "Windows":
        files.extend(windows_runtime_dependency_dlls(native_library))
    return files


def wheel_platform_tag() -> str:
    tag = sysconfig.get_platform()
    if platform.system() == "Darwin":
        deployment_target = os.environ.get("MACOSX_DEPLOYMENT_TARGET")
        if deployment_target:
            parts = tag.split("-")
            if len(parts) >= 3 and parts[0] == "macosx":
                parts[1] = deployment_target
                tag = "-".join(parts)
    return normalized_platform(tag)


def build_wheel(
    outdir: Path,
    native_library: Path,
    distribution_name: str | None = None,
    version_override: str | None = None,
) -> Path:
    project = PYPROJECT["project"]
    metadata_name = distribution_name or project["name"]
    distribution = normalized_distribution_name(metadata_name)
    version = version_override or project["version"]
    package_name, source_dir = package_root()
    tag = f"py3-none-{wheel_platform_tag()}"
    dist_info = f"{distribution}-{version}.dist-info"
    wheel_path = outdir / f"{distribution}-{version}-{tag}.whl"
    if not native_library.exists():
        raise RuntimeError(f"Missing FishyJoesIotaRuntime native library: {native_library}")

    outdir.mkdir(parents=True, exist_ok=True)
    records: list[tuple[str, str, str]] = []

    def write_bytes(archive: zipfile.ZipFile, name: str, data: bytes) -> None:
        archive.writestr(name, data)
        records.append((name, wheel_hash(data), str(len(data))))

    with zipfile.ZipFile(wheel_path, "w", compression=zipfile.ZIP_DEFLATED) as archive:
        for archive_path, source_path in iter_package_files(package_name, source_dir):
            data = source_path.read_bytes()
            if archive_path == Path(package_name) / "config.py":
                data = runtime_config_with_version(data, version)
            write_bytes(archive, archive_path.as_posix(), data)
        for library_file in native_library_files(native_library):
            archive_path = Path(package_name) / "native" / library_file.name
            write_bytes(archive, archive_path.as_posix(), library_file.read_bytes())

        metadata = [
            "Metadata-Version: 2.3",
            f"Name: {metadata_name}",
            f"Version: {version}",
            f"Requires-Python: {project['requires-python']}",
        ]
        if description := project.get("description"):
            metadata.append(f"Summary: {description}")
        for dependency in project.get("dependencies", []):
            metadata.append(f"Requires-Dist: {dependency}")
        metadata.append("")
        write_bytes(archive, f"{dist_info}/METADATA", "\n".join(metadata).encode("utf-8"))

        wheel = [
            "Wheel-Version: 1.0",
            "Generator: fishy-joes",
            "Root-Is-Purelib: false",
            f"Tag: {tag}",
            "",
        ]
        write_bytes(archive, f"{dist_info}/WHEEL", "\n".join(wheel).encode("utf-8"))

        record_name = f"{dist_info}/RECORD"
        record_lines = [",".join(record) for record in records]
        record_lines.append(f"{record_name},,")
        archive.writestr(record_name, "\n".join(record_lines).encode("utf-8"))

    return wheel_path


def run_command(command: list[str]) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        command,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
    )


def tool_path(name: str) -> str | None:
    for executable in [
        Path(sysconfig.get_path("scripts")) / name,
    ]:
        if executable.exists():
            return str(executable)
    return shutil.which(name)


def replace_with_repaired_wheel(original: Path, repaired_dir: Path) -> Path:
    repaired_wheels = sorted(repaired_dir.glob("*.whl"))
    if len(repaired_wheels) != 1:
        raise RuntimeError(f"Expected one repaired wheel, found {[path.name for path in repaired_wheels]}")
    repaired = repaired_wheels[0]
    destination = original.parent / repaired.name
    if destination != original and original.exists():
        original.unlink()
    shutil.move(str(repaired), destination)
    return destination


def write_repair_report(outdir: Path, platform_name: str, lines: list[str]) -> None:
    report = outdir / f"runtime-native-repair-report-{platform_name}.txt"
    report.write_text("\n".join(lines) + "\n", encoding="utf-8")


def repair_wheel(wheel_path: Path) -> Path:
    system = platform.system()
    platform_name = normalized_platform(system.lower())
    report_lines = [
        f"wheel={wheel_path.name}",
        f"platform={wheel_platform_tag()}",
        f"system={system}",
    ]
    if system == "Darwin":
        delocate_wheel = tool_path("delocate-wheel")
        if delocate_wheel is None:
            raise RuntimeError("delocate-wheel is required to repair macOS FishyJoes runtime wheels")
        with tempfile.TemporaryDirectory() as temp:
            result = run_command([delocate_wheel, "--verbose", "-w", temp, str(wheel_path)])
            report_lines.append(result.stdout.rstrip())
            if result.returncode != 0:
                raise RuntimeError(f"delocate-wheel failed for {wheel_path.name}:\n{result.stdout}")
            repaired = replace_with_repaired_wheel(wheel_path, Path(temp))
        report_lines.append(f"repaired={repaired.name}")
        write_repair_report(wheel_path.parent, platform_name, report_lines)
        return repaired
    if system == "Linux":
        auditwheel = tool_path("auditwheel")
        if auditwheel is None:
            raise RuntimeError("auditwheel is required to repair Linux FishyJoes runtime wheels")
        show = run_command([auditwheel, "show", str(wheel_path)])
        report_lines.append(show.stdout.rstrip())
        with tempfile.TemporaryDirectory() as temp:
            repair = run_command([auditwheel, "repair", "-w", temp, str(wheel_path)])
            report_lines.append(repair.stdout.rstrip())
            if repair.returncode != 0:
                raise RuntimeError(f"auditwheel repair failed for {wheel_path.name}:\n{repair.stdout}")
            repaired = replace_with_repaired_wheel(wheel_path, Path(temp))
        report_lines.append(f"repaired={repaired.name}")
        write_repair_report(wheel_path.parent, platform_name, report_lines)
        return repaired
    if system == "Windows":
        with zipfile.ZipFile(wheel_path) as archive:
            dlls = [
                Path(name).name
                for name in archive.namelist()
                if name.startswith("fishyjoes_runtime/native/") and name.lower().endswith(".dll")
            ]
        report_lines.append(
            json.dumps({"dlls": sorted(dlls, key=str.lower)}, sort_keys=True)
        )
        report_lines.append("repair=package-local DLL loading is validated by runtime import tests")
        write_repair_report(wheel_path.parent, platform_name, report_lines)
        return wheel_path
    raise RuntimeError(f"Unsupported Python binding platform: {system}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--outdir", type=Path, default=ROOT / "dist")
    parser.add_argument(
        "--native-library",
        type=Path,
        required=True,
        help="FishyJoesIotaRuntime dynamic library to include",
    )
    parser.add_argument("--distribution-name", help="Wheel distribution name to publish for this runtime package")
    parser.add_argument("--version-override", help="Build a wheel with this package version without editing runtime files")
    parser.add_argument("--no-repair", action="store_true", help="Build the wheel without native-library repair")
    args = parser.parse_args()
    wheel = build_wheel(
        args.outdir,
        native_library=args.native_library,
        distribution_name=args.distribution_name,
        version_override=args.version_override,
    )
    if not args.no_repair:
        wheel = repair_wheel(wheel)
    print(wheel)


if __name__ == "__main__":
    main()
