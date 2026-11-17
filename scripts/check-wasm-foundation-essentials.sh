#!/bin/bash

# Builds integration-tests/EssentialsOnly for wasm and fails if the module links
# FoundationInternationalization or ICU. A library that only imports FoundationEssentials
# should stay ~8 MB; full Foundation adds ~38 MB, mostly ICU data.

set -euxo pipefail

if [[ ! -d node-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

cd integration-tests/EssentialsOnly
FISHYJOES=1 swift run -- fishy-joes generate
FISHYJOES=1 swift run -- fishy-joes --nodejs --wasm build

wasm="bindings/ts/generated/packages/wasm/EssentialsOnly.wasm"
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
