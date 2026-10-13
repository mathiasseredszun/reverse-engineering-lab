# Evidence index

Captured from the self-authored targets on 2026-10-13 using Linux x86-64, GCC
13.3.0 and Ghidra 12.1.4. See `toolchain.json` for compiler and source identity.

| File | What it establishes |
| --- | --- |
| `SHA256SUMS` | SHA-256 of the four built artifacts; binaries themselves are generated, not committed. |
| `metadata.json` | ELF64 little-endian x86-64 header fields and hashes. |
| `behavior.json` | Exact command arguments, return codes, stdout and stderr from synthetic probes. |
| `token_gate.asm`, `record_count.asm` | Captured GNU objdump disassembly of the identified debug artifacts. |
| `ghidra/*.c` | Captured decompilation of selected functions; not replacement source or runtime evidence. |
| `toolchain.json` | Tool versions, source hashes and reproduction command. |

Regenerate core evidence with `make check-reproducible`, then Ghidra evidence with
`make ghidra`. Re-running with a different compiler may produce a legitimate diff.
Review and commit all related evidence together when sources change; never mix
old decompilation with new binary hashes. Runtime probes have a 20-second timeout.

Observed: token acceptance/rejection and a count-width decision discrepancy.
Trailing whitespace and excess terminal blank lines in tool output are removed;
instructions and pseudocode are otherwise preserved.

Inferred: how the instructions explain those decisions. Unknown: behavior of any
real-world target; no such target was analyzed. A passing sanitizer exercise
does not prove memory safety of arbitrary programs or every possible path.
