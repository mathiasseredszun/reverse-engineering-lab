# reverse-engineering-lab

A small, public portfolio of defensive reverse engineering on **self-authored,
synthetic programs**. Each finding connects source, a binary hash, x86-64
instructions, Ghidra pseudocode and observed behavior. The exercises are learning
examples, not discoveries in production products.

## Start here

| Exercise | Question | Evidence and result |
| --- | --- | --- |
| [Token gate](docs/findings/001-token-encoding.md) | Does XOR encoding protect a built-in token? | Recover a synthetic token, corroborate acceptance, explain the trust boundary. |
| [Record count](docs/findings/002-integer-truncation.md) | Which integer width does the comparison use? | Compare a deliberately flawed 16-bit check with a 32-bit fix and regression tests. |
| [Python ELF inspection](analysis/elf_info.py) | What can a header establish? | Offline architecture, entry point and SHA-256; explicit parser limitations. |

## Run the laboratory

Linux x86-64 / Ubuntu 24.04, GCC, GNU make, binutils and Python 3.12+ are required.
There are no Python package dependencies. On Windows, use Ubuntu in WSL:

```powershell
wsl -d Ubuntu-24.04 --cd "$PWD" -- make check-reproducible
```

Run that command from this repository directory. Alternatively, inside Linux:

```sh
make check-reproducible
make sanitize
python3 analysis/elf_info.py build/token_gate
./build/record_count 65536
```

Expected record-count output: `legacy=accept fixed=reject`. `make test` covers
debug and stripped binaries, invalid input, boundary values and malformed ELF
headers. `make check-reproducible` rebuilds twice with the same toolchain and
compares all four binary hashes. Build products stay in ignored `build/`.

For a portable container, see [laboratory setup](docs/laboratory.md). Ghidra is
optional for the Python and runtime exercises:

```sh
export GHIDRA_HOME=/path/to/ghidra_12.1.4_PUBLIC
make ghidra
```

See the [Ghidra walkthrough](docs/ghidra.md), [x86-64 notes](docs/x86-64.md), and
[captured evidence](evidence/README.md). CI runs tests, repeated builds, the
undefined-behavior sanitizer, the container and headless Ghidra; evidence from
each CI execution is retained as an artifact. The committed evidence records
the local toolchain and is not guaranteed byte-identical to a CI compiler.

## Scope and ethics

Only the supplied programs are exercise targets. No scanning, network services,
malware, persistence, credential collection, privilege escalation, customer
data, internal findings or proprietary binaries are included. Read the
[scope](SCOPE.md) before adapting these examples. Permission for a private
engagement never implies permission to publish its material.

## Portfolio purpose

This repository can accompany an application to Anthropic's Cyber Verification
Program / Defense Access. It demonstrates a reproducible method and careful
reporting, not professional accreditation, program acceptance, or proof of
organizational controls. See [application preparation](docs/application.md)
for current official sources and remaining private steps.

Project decisions and execution criteria are in [design](docs/design.md).
Contributions follow [CONTRIBUTING.md](CONTRIBUTING.md). Original code and
documentation are licensed under [MIT](LICENSE).
