"""Bounded, offline ELF64 little-endian x86-64 metadata example."""
import argparse
import hashlib
import json
from pathlib import Path
import struct


def decode_header(data: bytes) -> dict:
    if len(data) < 64 or data[:4] != b'\x7fELF':
        raise ValueError('expected a complete 64-byte ELF header')
    if data[4:7] != bytes((2, 1, 1)):
        raise ValueError('only ELF64 little-endian version 1 is supported')
    kind, machine, version = struct.unpack_from('<HHI', data, 16)
    header_size = struct.unpack_from('<H', data, 52)[0]
    if machine != 62 or version != 1 or header_size != 64 or kind not in (2, 3):
        raise ValueError('unsupported or malformed x86-64 executable header')
    return {'bits': 64, 'byte_order': 'little', 'machine': 'x86-64',
            'type': {2: 'executable', 3: 'PIE/shared'}[kind],
            'entry_point': hex(struct.unpack_from('<Q', data, 24)[0])}


def inspect_elf(path: Path) -> dict:
    digest = hashlib.sha256()
    with path.open('rb') as stream:
        result = decode_header(stream.read(64))
        stream.seek(0)
        for chunk in iter(lambda: stream.read(65536), b''):
            digest.update(chunk)
    return {'artifact': path.name, **result, 'sha256': digest.hexdigest()}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('binary', type=Path)
    args = parser.parse_args()
    try:
        print(json.dumps(inspect_elf(args.binary), sort_keys=True, indent=2))
    except (OSError, ValueError) as error:
        parser.exit(2, f'{error}\n')


if __name__ == '__main__':
    main()
