# Design and implementation plan

This public portfolio demonstrates defensive reverse engineering on owned,
synthetic targets. It contains no organizational systems, customer data,
credentials, malware, or third-party vulnerability disclosures.

## Architecture

- Two small C command-line programs: an encoded demonstration token and a
  bounded record-count example contrasting arithmetic truncation with a fix.
- GCC builds Linux x86-64 ELF debug and stripped variants. Python's standard
  library inspects ELF metadata and validates behavioral hypotheses.
- A Ghidra Java post-script exports decompilation for selected functions.
- Make generates binaries, SHA-256 manifests, disassembly and evidence; tests
  verify input boundaries, metadata and behavior. CI repeats these steps.
- A versioned container provides a portable laboratory. No network or host
  credentials are needed during exercises; source remains readable for checking.

## Acceptance and execution

1. Write tests before implementations: token acceptance/rejection; record counts
   0, 64, 65, 65536 and malformed inputs; ELF identity and truncated headers.
2. Build both programs with warnings as errors and run the complete test suite.
3. Generate evidence twice and compare manifests with the same compiler.
4. Run Ghidra on owned binaries and link findings to actual captured evidence.
5. Inspect all published files for personal data, unsupported claims and secrets.
6. Commit through a feature branch, create a pull request and verify CI.

Constraints: English project documentation; German commit and PR descriptions;
no personal identity in repository content or commit metadata. Generated files
use relative paths. The portfolio supports an application but does not claim
access, security-control compliance, independent research or eligibility.

## Review focus

Reject invalid integers and trailing input; bound record-count arithmetic;
reject non-ELF and incomplete headers; verify stripped binaries still behave
correctly; treat decompilation as an inference requiring runtime corroboration.

## Provenance and limits

Created from the implementation request dated 2026-10-13. Earlier conversation
responses were not available as text, so this is not a reconstruction of that
plan. Builds are reproducible within a recorded toolchain, not promised to be
bit-identical across compiler versions. Container tags and upstream package
repositories are mutable; capture image digests for archival reproduction.
