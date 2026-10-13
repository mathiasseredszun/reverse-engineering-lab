# LAB-001: A built-in XOR token is recoverable

**Classification:** educational design weakness in an owned synthetic target.
**Scope:** `labs/token_gate.c`; no external product, CVE or production credential.

## Hypothesis and method

A token encoded with a constant XOR key can be reconstructed from static data.
Build with `make evidence`, identify the artifact in
[`metadata.json`](../../evidence/metadata.json), inspect `check_token` in
[`token_gate.asm`](../../evidence/token_gate.asm) and
[`Ghidra output`](../../evidence/ghidra/token_gate.c).

## Observations

The Ghidra export shows an eight-byte length comparison, XOR `0x5a` and encoded
bytes `16 1b 18 77 15 14 16 03` (hex). This Python expression decodes only this
public demonstration fixture:

```python
encoded = bytes.fromhex('16 1b 18 77 15 14 16 03')
print(bytes(value ^ 0x5a for value in encoded).decode('ascii'))
# LAB-ONLY
```

[`behavior.json`](../../evidence/behavior.json) records `LAB-ONLY` producing
`accepted` with exit 0, and `wrong` producing `rejected` with exit 1.
Tests additionally cover empty, same-length incorrect and too-long strings in
both debug and stripped artifacts. Hashes are in
[`SHA256SUMS`](../../evidence/SHA256SUMS).

## Interpretation and remediation

Observed acceptance corroborates the recovered fixture. XOR encoding adds no
secret boundary when the decoder and bytes are shipped together. The program is
not a real authentication service; this is not a remote-access finding.

For real authorization, enforce the decision in an independently trusted
component and use an appropriate credential protocol. Merely hashing or further
obfuscating a public local token does not create that boundary. This exercise
retains the encoding so the analysis remains reproducible.

## Limits

Source and symbols were available; this does not demonstrate blind analysis.
Ghidra has an unresolved local-variable annotation, so variable naming is not
claimed as recovered original information. No real secrets or third-party
targets were involved.
