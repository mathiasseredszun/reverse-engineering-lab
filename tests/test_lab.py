import pathlib
import subprocess
import sys
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))


class BehaviorTests(unittest.TestCase):
    def run_binary(self, name, value):
        return subprocess.run([str(ROOT / 'build' / name), value],
                              capture_output=True, text=True, timeout=3)

    def test_targets_exist(self):
        self.assertTrue((ROOT / 'build' / 'token_gate').is_file())
        self.assertTrue((ROOT / 'build' / 'record_count').is_file())

    def test_token_contract(self):
        for name in ('token_gate', 'token_gate.stripped'):
            self.assertEqual(self.run_binary(name, 'LAB-ONLY').stdout, 'accepted\n')
            for value in ('', 'LAB-ONLX', 'LAB-ONLY-extra', 'wrong'):
                result = self.run_binary(name, value)
                self.assertEqual(result.returncode, 1)
                self.assertEqual(result.stdout, 'rejected\n')

    def test_record_boundaries_and_truncation(self):
        for name in ('record_count', 'record_count.stripped'):
            for value, expected in (
                ('0', 'legacy=accept fixed=accept\n'),
                ('64', 'legacy=accept fixed=accept\n'),
                ('65', 'legacy=reject fixed=reject\n'),
                ('65536', 'legacy=accept fixed=reject\n'),
                ('4294967295', 'legacy=reject fixed=reject\n'),
            ):
                result = self.run_binary(name, value)
                self.assertEqual(result.returncode, 0)
                self.assertEqual(result.stdout, expected)

    def test_record_rejects_invalid_input(self):
        for value in ('', '-1', '+1', ' 1', '1x', '4294967296', '9' * 100):
            result = self.run_binary('record_count', value)
            self.assertEqual(result.returncode, 2, value)

    def test_usage(self):
        for name in ('token_gate', 'record_count'):
            result = subprocess.run([str(ROOT / 'build' / name)],
                                    capture_output=True, timeout=3)
            self.assertEqual(result.returncode, 2)


class MetadataTests(unittest.TestCase):
    def test_elf_identity(self):
        from analysis.elf_info import inspect_elf
        for name in ('token_gate', 'record_count', 'token_gate.stripped'):
            result = inspect_elf(ROOT / 'build' / name)
            self.assertEqual(result['machine'], 'x86-64')
            self.assertEqual(result['bits'], 64)
            self.assertEqual(result['byte_order'], 'little')
            self.assertEqual(result['type'], 'PIE/shared')
            self.assertEqual(len(result['sha256']), 64)

    def test_invalid_headers(self):
        from analysis.elf_info import decode_header
        for data in (b'', b'MZ' + bytes(62), b'\x7fELF' + bytes(10)):
            with self.assertRaises(ValueError):
                decode_header(data)

    def test_unsupported_and_bad_elf(self):
        from analysis.elf_info import decode_header
        original = (ROOT / 'build' / 'token_gate').read_bytes()[:64]
        for position, value in ((4, 1), (5, 2), (6, 0), (18, 3), (52, 0)):
            data = bytearray(original)
            data[position] = value
            with self.assertRaises(ValueError):
                decode_header(data)


if __name__ == '__main__':
    unittest.main()
