"""Capture synthetic observations; never execute externally supplied artifacts."""
import hashlib
import json
from pathlib import Path
import subprocess
from elf_info import inspect_elf

ROOT = Path(__file__).resolve().parents[1]


def run(args):
    result = subprocess.run(args, cwd=ROOT, capture_output=True, text=True, timeout=20)
    return {'command': args, 'exit_code': result.returncode,
            'stdout': result.stdout, 'stderr': result.stderr}


def main():
    output = ROOT / 'evidence'
    output.mkdir(exist_ok=True)
    artifacts = [ROOT / 'build' / name for name in
                 ('token_gate', 'record_count', 'token_gate.stripped', 'record_count.stripped')]
    metadata = [inspect_elf(path) for path in artifacts]
    (output / 'metadata.json').write_text(json.dumps(metadata, indent=2, sort_keys=True) + '\n')
    (output / 'SHA256SUMS').write_text(''.join(
        f"{item['sha256']}  build/{item['artifact']}\n" for item in metadata))
    observations = [run([f'./build/{name}', value]) for name, value in (
        ('token_gate', 'LAB-ONLY'), ('token_gate', 'wrong'),
        ('record_count', '64'), ('record_count', '65'), ('record_count', '65536'),
        ('record_count', '-1'), ('record_count', '4294967296'))]
    (output / 'behavior.json').write_text(json.dumps(observations, indent=2) + '\n')
    for name in ('token_gate', 'record_count'):
        result = run(['objdump', '-d', '-M', 'intel', f'build/{name}'])
        if result['exit_code']:
            raise RuntimeError(result['stderr'])
        normalized = '\n'.join(line.rstrip() for line in result['stdout'].splitlines()).strip() + '\n'
        (output / f'{name}.asm').write_text(normalized)
    versions = {tool: run([tool, '--version'])['stdout'].splitlines()[0]
                for tool in ('gcc', 'ld', 'objdump', 'strip', 'python3', 'make')}
    source = {str(path.relative_to(ROOT)): hashlib.sha256(path.read_bytes()).hexdigest()
              for path in sorted((ROOT / 'labs').glob('*.c'))}
    (output / 'toolchain.json').write_text(json.dumps(
        {'versions': versions, 'source_sha256': source,
         'build_command': 'make check-reproducible',
         'platform': 'Linux x86-64',
         'limits': 'No cross-toolchain byte-identity claim; no third-party inputs.'},
        indent=2, sort_keys=True) + '\n')


if __name__ == '__main__':
    main()
