# Legal and ethical scope

## Allowed laboratory work

- Build and analyze the self-authored source files in `labs/`.
- Inspect their debug and stripped executables, validate hypotheses with bounded
  command-line inputs, and compare a deliberately defective check with its fix.
- Publish reproducible observations using only these synthetic artifacts.

The token `LAB-ONLY` is public exercise data. It is not a credential. The count
example prints decisions only; it does not allocate according to untrusted
counts, access out-of-bounds memory or target another process.

## Outside this repository's scope

Real company or customer systems, internal vulnerabilities, malware, commercial
license checks, credential extraction, unauthorized access and exploitation of
third-party targets. This repository grants no permission concerning any such
system. Ownership, written authorization, applicable law and publication rights
must be established separately for each future engagement.

## Publication boundary

Use synthetic data only. Do not submit real binaries, memory dumps, logs,
addresses, hostnames, names, employer details, tickets, credentials or screenshots
from private engagements. Even a redacted report can reveal sensitive context;
create a fresh synthetic example instead. Authorizations and identity evidence
belong in private application channels, not in repository issues or commits.

## Operational controls

Build from reviewed source. Run only these known exercises. Container execution
uses a non-root user, disabled network, dropped capabilities, read-only root
filesystem and no host mounts. Dependency installation needs network access
at build time; runtime exercises do not. No production environment is involved.

These rules describe this laboratory; they are not a legal opinion or a blanket
security guarantee for the tools or for arbitrary future input.
