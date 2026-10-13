# Security policy

The exercises intentionally demonstrate a reversible encoding and an integer
truncation defect. Neither represents a vulnerability in a third-party product.
The record-count demonstration performs no unsafe memory access.

Do not execute untrusted binaries using these helpers. The ELF reader validates
only a subset of a header; it is not a complete file validator or a sandbox.
Ghidra and other dependencies may have their own vulnerabilities; consult their
upstream security guidance before processing material outside this laboratory.

For bugs in this lab, use a GitHub issue containing only synthetic inputs. Never
publish sensitive discoveries in issues. Future versions should add a private
reporting channel before accepting sensitive reports or broader target classes.
