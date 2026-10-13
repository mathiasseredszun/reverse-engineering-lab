#!/usr/bin/env bash
set -euo pipefail
: "${GHIDRA_HOME:?Set GHIDRA_HOME to an official Ghidra installation}"
mkdir -p build/ghidra evidence/ghidra
for target in token_gate record_count; do
  rm -f "evidence/ghidra/$target.c"
  "$GHIDRA_HOME/support/analyzeHeadless" build/ghidra "$target" \
    -import "build/$target" -overwrite -scriptPath analysis \
    -postScript ExportFindings.java "$PWD/evidence/ghidra/$target.c" -deleteProject \
    > "build/ghidra-$target.log" 2>&1
  test -s "evidence/ghidra/$target.c"
done
echo 'Ghidra exports created; local logs remain in build/.'
