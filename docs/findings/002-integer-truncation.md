# LAB-002: A narrowing conversion changes a range check

**Classification:** intentional logical input-validation defect.
**Scope:** `labs/record_count.c`; no allocation or unsafe memory operation.

## Hypothesis

Checking a 32-bit record count after conversion to 16 bits can accept values
above the intended maximum of 64. The corrected check must retain the original
width. The program prints both decisions for comparison.

## Static evidence

[`record_count.asm`](../../evidence/record_count.asm) contains `cmp di,0x40` at
`0x11cd` in `legacy_accept` and `cmp edi,0x40` at `0x11dc` in `fixed_accept` for
the captured build. The former checks only the low 16 bits. See
[`x86-64 notes`](../x86-64.md) for the ABI and operand-width interpretation.
[`Ghidra export`](../../evidence/ghidra/record_count.c) independently exposes
the truncated comparison. Source confirms an explicit `uint16_t` conversion.

## Runtime evidence and regression

```sh
./build/record_count 64       # legacy=accept fixed=accept
./build/record_count 65       # legacy=reject fixed=reject
./build/record_count 65536    # legacy=accept fixed=reject
```

Exact observations are recorded in
[`behavior.json`](../../evidence/behavior.json); artifact identity is in
[`SHA256SUMS`](../../evidence/SHA256SUMS). Unsigned conversion maps 65536 to zero
in 16 bits. This is defined integer behavior, so the undefined-behavior sanitizer
does not detect the logical mistake.

`tests/test_lab.py` verifies both decisions at 0, 64, 65, 65536 and UINT32_MAX,
including stripped artifacts. Negative, signed, whitespace-prefixed, trailing
garbage and overflowing input must exit 2 before the exercise functions run.
Fix: compare the original `uint32_t` value with 64, as `fixed_accept` does.

## Impact and limits

The demonstrated impact is a printed incorrect acceptance decision. In a
hypothetical parser, narrowing before validation could undermine an allocation
or count boundary; that consequence is not implemented or observed here.
There is no claim of exploitation, memory corruption or a third-party defect.
Compiler-specific addresses and pseudocode may change across toolchains.
