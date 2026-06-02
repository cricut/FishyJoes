#!/usr/bin/env python3
"""Summarize recent FishyJoes-related macOS crash reports.

The script deliberately reads only recent allowlisted process reports and prints
small redacted summaries. It is meant for local debugging of crashes triggered by
local FishyJoes builds/tests, not for browsing unrelated diagnostics.
"""

from __future__ import annotations

import argparse
import json
import os
from dataclasses import dataclass
from datetime import datetime, timedelta
from pathlib import Path
from typing import Any


DEFAULT_PROCESSES = ("Python", "fishy-joes")
FISHYJOES_MARKERS = (
    "FishyJoes",
    "TestAPI",
    "__iota",
    "Iota",
    "AttributedString+iota.swift",
    "Env.swift",
    "GenericConverters.swift",
)


@dataclass(frozen=True)
class CrashReport:
    path: Path
    metadata: dict[str, Any]
    report: dict[str, Any]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Summarize recent FishyJoes crash reports."
    )
    parser.add_argument(
        "--diagnostic-dir",
        type=Path,
        default=Path.home() / "Library/Logs/DiagnosticReports",
        help="macOS DiagnosticReports directory.",
    )
    parser.add_argument(
        "--repo-root",
        type=Path,
        default=Path.cwd(),
        help="FishyJoes checkout root used as an additional relevance marker.",
    )
    parser.add_argument(
        "--since-hours",
        type=float,
        default=24,
        help="Only inspect reports modified within this many hours.",
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=8,
        help="Maximum number of summaries to print.",
    )
    parser.add_argument(
        "--process",
        action="append",
        choices=("Python", "fishy-joes", "swift", "swift-frontend"),
        help=(
            "Process basename to inspect. May be repeated. Defaults to "
            "Python and fishy-joes."
        ),
    )
    parser.add_argument(
        "--launcher",
        action="append",
        help=(
            "Substring matched against a report's parent/responsible/coalition "
            "fields to restrict results to a given launching process. May be "
            "repeated. When omitted, reports are not filtered by launcher."
        ),
    )
    parser.add_argument(
        "--allow-any-launcher",
        action="store_true",
        help="Also show FishyJoes-related reports regardless of launching process.",
    )
    return parser.parse_args()


def candidate_paths(
    diagnostic_dir: Path, processes: tuple[str, ...], since: datetime
) -> list[Path]:
    if not diagnostic_dir.is_dir():
        return []

    paths: list[Path] = []
    for process in processes:
        paths.extend(diagnostic_dir.glob(f"{process}-*.ips"))
        paths.extend(diagnostic_dir.glob(f"{process}_*.ips"))

    unique_paths = {path.resolve(): path for path in paths}
    recent = [
        path
        for path in unique_paths.values()
        if datetime.fromtimestamp(path.stat().st_mtime) >= since
    ]
    return sorted(recent, key=lambda path: path.stat().st_mtime, reverse=True)


def load_report(path: Path) -> CrashReport | None:
    try:
        text = path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        text = path.read_text(encoding="utf-8", errors="replace")

    first_line, separator, body = text.partition("\n")
    if not separator:
        return None

    try:
        metadata = json.loads(first_line)
        report = json.loads(body)
    except json.JSONDecodeError:
        return None

    return CrashReport(path=path, metadata=metadata, report=report)


def text_contains_marker(value: Any, markers: tuple[str, ...]) -> bool:
    if isinstance(value, str):
        return any(marker in value for marker in markers)
    if isinstance(value, dict):
        return any(text_contains_marker(item, markers) for item in value.values())
    if isinstance(value, list):
        return any(text_contains_marker(item, markers) for item in value)
    return False


def launcher_related(report: CrashReport, launchers: list[str]) -> bool:
    if not launchers:
        return True
    values = (
        report.report.get("parentProc"),
        report.report.get("responsibleProc"),
        report.report.get("coalitionName"),
    )
    return any(
        launcher.lower() in str(value).lower()
        for value in values
        if value
        for launcher in launchers
    )


def fishyjoes_related(report: CrashReport, repo_root: Path) -> bool:
    markers = FISHYJOES_MARKERS + (str(repo_root),)
    return text_contains_marker(report.report.get("threads", []), markers) or text_contains_marker(
        report.report.get("usedImages", []), markers
    )


def triggered_frames(report: CrashReport) -> list[dict[str, Any]]:
    threads = report.report.get("threads", [])
    for thread in threads:
        if thread.get("triggered"):
            return thread.get("frames", [])
    return []


def redacted_path(value: str) -> str:
    home = str(Path.home())
    if value.startswith(home):
        return "~" + value[len(home) :]
    return value


def frame_line(frame: dict[str, Any]) -> str:
    symbol = frame.get("symbol", "<unknown symbol>")
    source_file = frame.get("sourceFile")
    source_line = frame.get("sourceLine")
    image_index = frame.get("imageIndex")
    location = ""
    if source_file and source_line:
        location = f" ({source_file}:{source_line})"
    elif source_file:
        location = f" ({source_file})"
    image = f" imageIndex={image_index}" if image_index is not None else ""
    return f"  - {symbol}{location}{image}"


def interesting_frames(report: CrashReport) -> list[dict[str, Any]]:
    frames = triggered_frames(report)
    marked = [frame for frame in frames if text_contains_marker(frame, FISHYJOES_MARKERS)]
    return marked[:10] if marked else frames[:6]


def interesting_images(report: CrashReport) -> list[str]:
    images = []
    for image in report.report.get("usedImages", []):
        if not text_contains_marker(image, FISHYJOES_MARKERS):
            continue
        name = image.get("name", "<unknown image>")
        path = image.get("path")
        images.append(f"{name}: {redacted_path(path)}" if path else name)
    return images[:8]


def print_summary(report: CrashReport) -> None:
    exception = report.report.get("exception", {})
    termination = report.report.get("termination", {})
    print(report.path.name)
    print(f"  timestamp: {report.metadata.get('timestamp', '<unknown>')}")
    print(f"  incident: {report.metadata.get('incident_id', report.report.get('incident', '<unknown>'))}")
    print(
        "  process: "
        f"{report.metadata.get('app_name', report.report.get('procName', '<unknown>'))}"
        f" parent={report.report.get('parentProc', '<unknown>')}"
        f" responsible={report.report.get('responsibleProc', '<unknown>')}"
    )
    print(
        "  exception: "
        f"{exception.get('type', '<unknown>')}"
        f" signal={exception.get('signal', '<unknown>')}"
        f" termination={termination.get('indicator', '<unknown>')}"
    )
    print("  frames:")
    for frame in interesting_frames(report):
        print(frame_line(frame))
    images = interesting_images(report)
    if images:
        print("  FishyJoes images:")
        for image in images:
            print(f"  - {image}")
    print()


def main() -> int:
    args = parse_args()
    processes = tuple(args.process) if args.process else DEFAULT_PROCESSES
    since = datetime.now() - timedelta(hours=args.since_hours)

    printed = 0
    for path in candidate_paths(args.diagnostic_dir, processes, since):
        report = load_report(path)
        if report is None:
            continue
        if not args.allow_any_launcher and not launcher_related(report, args.launcher or []):
            continue
        if not fishyjoes_related(report, args.repo_root.resolve()):
            continue
        print_summary(report)
        printed += 1
        if printed >= args.limit:
            break

    if printed == 0:
        process_list = ", ".join(processes)
        print(
            "No recent FishyJoes crash reports found "
            f"for: {process_list}"
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
