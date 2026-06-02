from __future__ import annotations

import argparse
import base64
import hashlib
import platform
import re
import shutil
import subprocess
import sysconfig
import tempfile
import tomllib
import zipfile
from pathlib import Path


ROOT = Path(__file__).resolve().parent
PYPROJECT = tomllib.loads((ROOT / "pyproject.toml").read_text(encoding="utf-8"))


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


def wheel_platform_tag() -> str:
    return normalized_platform(sysconfig.get_platform())


def build_wheel(outdir: Path, native_library: Path) -> Path:
    project = PYPROJECT["project"]
    distribution = normalized_distribution_name(project["name"])
    version = project["version"]
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
            write_bytes(archive, archive_path.as_posix(), data)
        write_bytes(
            archive,
            (Path(package_name) / "native" / native_library_filename()).as_posix(),
            native_library.read_bytes(),
        )

        metadata = [
            "Metadata-Version: 2.3",
            f"Name: {project['name']}",
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


def repair_wheel(wheel_path: Path) -> Path:
    system = platform.system()
    if system != "Darwin":
        return wheel_path
    delocate_wheel = tool_path("delocate-wheel")
    if delocate_wheel is None:
        raise RuntimeError("delocate-wheel is required to repair macOS FishyJoes runtime wheels")
    with tempfile.TemporaryDirectory() as temp:
        result = run_command([delocate_wheel, "--verbose", "-w", temp, str(wheel_path)])
        if result.returncode != 0:
            raise RuntimeError(f"delocate-wheel failed for {wheel_path.name}:\n{result.stdout}")
        return replace_with_repaired_wheel(wheel_path, Path(temp))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--outdir", type=Path, default=ROOT / "dist")
    parser.add_argument(
        "--native-library",
        type=Path,
        required=True,
        help="FishyJoesIotaRuntime dynamic library to include",
    )
    parser.add_argument("--no-repair", action="store_true", help="Build the wheel without native-library repair")
    args = parser.parse_args()
    wheel = build_wheel(args.outdir, native_library=args.native_library)
    if not args.no_repair:
        wheel = repair_wheel(wheel)
    print(wheel)


if __name__ == "__main__":
    main()
