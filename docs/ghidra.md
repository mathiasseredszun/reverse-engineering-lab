# Ghidra walkthrough

Use the official [Ghidra 12.1.4 release](https://github.com/NationalSecurityAgency/ghidra/releases/tag/Ghidra_12.1.4_build)
and JDK 21. CI downloads the release ZIP and verifies its upstream SHA-256.
Ghidra is a separately licensed upstream dependency and is not vendored here.

## Headless analysis

```sh
make all
export GHIDRA_HOME=/path/to/ghidra_12.1.4_PUBLIC
make ghidra
```

`scripts/ghidra.sh` imports only `build/token_gate` and `build/record_count`.
`analysis/ExportFindings.java` decompiles `check_token`, `legacy_accept` and
`fixed_accept`, verifies the expected function count and writes selected outputs
under `evidence/ghidra/`. Projects and raw logs remain in ignored `build/`, since
logs can expose local paths. The export records the Ghidra version.

## GUI investigation

1. Create a local non-shared project and import `build/token_gate` as ELF.
2. Run auto-analysis. Navigate to `check_token` in the Symbol Tree.
3. Compare the length check, XOR constant and encoded bytes in the Listing and
   Decompiler. Rename variables as hypotheses, not evidence of original names.
4. Import `record_count`. Compare operand widths in `legacy_accept` and
   `fixed_accept`, then corroborate with `./build/record_count 65536`.
5. Repeat with the stripped targets. Start from strings and references in `main`;
   symbol-name navigation is unavailable. The automated export intentionally
   uses symbol-bearing targets, not the stripped variants.

Pseudocode is a model produced by a decompiler. Types and variable names may be
inferred; debug information can help. This lab provides source for confirmation
and behavioral tests for corroboration. It does not claim blind analysis,
malware classification or complete coverage of arbitrary binaries.
