# Contributing

Keep exercises small, self-authored and synthetic. Include source, a documented
hypothesis, commands, binary hashes, observed behavior, limitations and regression
tests. Changes go through a branch and pull request with passing CI.

Run `make check-reproducible sanitize` and `make ghidra` if decompilation changes.
Inspect the diff and generated evidence before committing. Never attach private
targets or personal data. Keep project documentation and code comments in English.

Report laboratory defects through GitHub issues with synthetic reproduction
steps. This project is not a disclosure channel for vulnerabilities in other
products or organizations.
