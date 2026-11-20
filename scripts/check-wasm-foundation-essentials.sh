#!/bin/bash

# Fails if TestAPI's wasm module links FoundationInternationalization or ICU. TestAPI only imports
# FoundationEssentials where it's available, so this catches the runtime or generated bindings
# importing full Foundation on WASI again (~38 MB, mostly ICU data).
# Run after `fishy-joes --nodejs --wasm build` in integration-tests/TestAPI.

set -euxo pipefail

if [[ ! -d node-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

wasm="integration-tests/TestAPI/bindings/ts/generated/packages/wasm/TestAPI.wasm"
ls -l "$wasm"

# -a: treat the binary as text, otherwise grep only reports "Binary file matches"
failed=0
for marker in icudt FoundationInternationalization _FoundationICU; do
    if grep -aq "$marker" "$wasm"; then
        echo "::error::$wasm contains '$marker': something imports Foundation instead of FoundationEssentials on WASI"
        failed=1
    fi
done
exit "$failed"
