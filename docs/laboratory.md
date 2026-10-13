# Laboratory setup and reproduction

## Existing Linux or WSL environment

Ubuntu 24.04, x86-64, GCC, make, binutils, Python 3.12+; Ghidra 12.1.4 and
JDK 21 for decompilation. On a fresh Ubuntu installation, an administrator can
install the core tools with `sudo apt-get install gcc libc6-dev make binutils python3`.
No Python dependencies or API credentials are required.

```sh
make check-reproducible sanitize
python3 analysis/elf_info.py build/record_count
```

Make maps absolute source directories to `.` in debug information. Evidence
contains only relative artifact paths, selected tool versions and source hashes.
The build keeps PIE, stack protection and RELRO flags; there is no need to
disable operating-system protections to solve these exercises.

## Container

```sh
docker build --platform linux/amd64 -t reverse-engineering-lab:local .
docker run --rm --platform linux/amd64 --network none --read-only \
  --cap-drop ALL --security-opt no-new-privileges \
  --pids-limit 128 --memory 512m --cpus 2 \
  --tmpfs /lab/build:rw,uid=10001,gid=10001,mode=0700 \
  --tmpfs /lab/evidence:rw,uid=10001,gid=10001,mode=0700 \
  --tmpfs /tmp:rw,noexec,nosuid,size=64m \
  reverse-engineering-lab:local
```

No bind mounts, host credentials or inbound ports are needed. Generated evidence
inside this ephemeral container disappears on exit. The container contains the
core compiler/runtime lab; headless Ghidra is run separately in CI.

## Reproduction limits and cleanup

`make check-reproducible` compares two builds within the same toolchain.
Different GCC/binutils versions may change addresses, optimization and hashes.
The base image tag and Ubuntu package repositories are mutable. For archival
reproduction, record `docker image inspect reverse-engineering-lab:local` image
digests and package versions; a frozen offline dependency mirror is not supplied.

CI uploads generated binaries, metadata and Ghidra exports for 14 days. Durable
publication artifacts should be added as a reviewed release after CI succeeds.
To reset locally, remove only this repository's ignored `build/` directory.
The project creates no services, cloud resources, accounts or production changes.
