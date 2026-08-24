"""Read Windows PE import tables needed for runtime-wheel DLL bundling."""

import contextlib
from pathlib import Path


SectionRange = tuple[int, int, int]


def _read_c_string(data: bytes, offset: int) -> str | None:
    if offset < 0 or offset >= len(data):
        return None
    end = data.find(b"\0", offset)
    if end == -1:
        return None
    with contextlib.suppress(UnicodeDecodeError):
        return data[offset:end].decode("ascii")
    return None


def _pe_section_ranges(data: bytes) -> list[SectionRange]:
    if len(data) < 0x40 or data[:2] != b"MZ":
        return []
    pe_offset = int.from_bytes(data[0x3C:0x40], "little")
    if pe_offset + 24 > len(data) or data[pe_offset:pe_offset + 4] != b"PE\0\0":
        return []
    coff_offset = pe_offset + 4
    section_count = int.from_bytes(data[coff_offset + 2:coff_offset + 4], "little")
    optional_header_size = int.from_bytes(data[coff_offset + 16:coff_offset + 18], "little")
    section_table = coff_offset + 20 + optional_header_size
    ranges: list[SectionRange] = []
    for index in range(section_count):
        offset = section_table + index * 40
        if offset + 40 > len(data):
            break
        virtual_size = int.from_bytes(data[offset + 8:offset + 12], "little")
        virtual_address = int.from_bytes(data[offset + 12:offset + 16], "little")
        raw_size = int.from_bytes(data[offset + 16:offset + 20], "little")
        raw_pointer = int.from_bytes(data[offset + 20:offset + 24], "little")
        size = max(virtual_size, raw_size)
        if size > 0:
            ranges.append((virtual_address, size, raw_pointer))
    return ranges


def _pe_rva_to_offset(ranges: list[SectionRange], rva: int) -> int | None:
    for virtual_address, size, raw_pointer in ranges:
        if virtual_address <= rva < virtual_address + size:
            return raw_pointer + (rva - virtual_address)
    return None


def _pe_data_directory_rva(data: bytes, pe_offset: int, index: int) -> int | None:
    coff_offset = pe_offset + 4
    optional_header_offset = coff_offset + 20
    optional_header_size = int.from_bytes(data[coff_offset + 16:coff_offset + 18], "little")
    if optional_header_offset + optional_header_size > len(data):
        return None
    magic = int.from_bytes(data[optional_header_offset:optional_header_offset + 2], "little")
    data_directory_offset = optional_header_offset + (112 if magic == 0x20B else 96 if magic == 0x10B else 0)
    if data_directory_offset == optional_header_offset:
        return None
    entry_offset = data_directory_offset + index * 8
    if entry_offset + 8 > len(data):
        return None
    rva = int.from_bytes(data[entry_offset:entry_offset + 4], "little")
    return rva if rva != 0 else None


def _pe_imported_dll_names(data: bytes, section_ranges: list[SectionRange], import_rva: int) -> set[str]:
    descriptor_offset = _pe_rva_to_offset(section_ranges, import_rva)
    if descriptor_offset is None:
        return set()

    dlls: set[str] = set()
    offset = descriptor_offset
    while offset + 20 <= len(data):
        descriptor = data[offset:offset + 20]
        if descriptor == b"\0" * 20:
            break
        name_rva = int.from_bytes(descriptor[12:16], "little")
        name_offset = _pe_rva_to_offset(section_ranges, name_rva)
        if name_offset is not None:
            name = _read_c_string(data, name_offset)
            if name is not None:
                dlls.add(name)
        offset += 20
    return dlls


def _pe_delay_imported_dll_names(data: bytes, section_ranges: list[SectionRange], import_rva: int) -> set[str]:
    descriptor_offset = _pe_rva_to_offset(section_ranges, import_rva)
    if descriptor_offset is None:
        return set()

    dlls: set[str] = set()
    offset = descriptor_offset
    while offset + 32 <= len(data):
        descriptor = data[offset:offset + 32]
        if descriptor == b"\0" * 32:
            break
        name_rva = int.from_bytes(descriptor[4:8], "little")
        name_offset = _pe_rva_to_offset(section_ranges, name_rva)
        if name_offset is not None:
            name = _read_c_string(data, name_offset)
            if name is not None:
                dlls.add(name)
        offset += 32
    return dlls


def imported_dll_names(path: Path) -> set[str]:
    data = path.read_bytes()
    if len(data) < 0x40 or data[:2] != b"MZ":
        return set()
    pe_offset = int.from_bytes(data[0x3C:0x40], "little")
    if pe_offset + 24 > len(data) or data[pe_offset:pe_offset + 4] != b"PE\0\0":
        return set()

    section_ranges = _pe_section_ranges(data)
    dlls: set[str] = set()
    if import_rva := _pe_data_directory_rva(data, pe_offset, 1):
        dlls.update(_pe_imported_dll_names(data, section_ranges, import_rva))
    if delay_import_rva := _pe_data_directory_rva(data, pe_offset, 13):
        dlls.update(_pe_delay_imported_dll_names(data, section_ranges, delay_import_rva))
    return dlls
