#!/usr/bin/env bash
set -euo pipefail

if (( $# != 2 )); then
  echo "usage: verify-release-checksum.sh ARCHIVE EXPECTED_SHA256" >&2
  exit 2
fi

archive=$1
expected=$2
if [[ ! -f "$archive" || ! -s "$archive" ]]; then
  echo "release archive must exist and be nonempty" >&2
  exit 2
fi
if [[ ! "$expected" =~ ^[0-9a-f]{64}$ ]]; then
  echo "expected checksum must be exactly 64 lowercase hex characters" >&2
  exit 2
fi
if command -v shasum >/dev/null 2>&1; then
  actual=$(shasum -a 256 -- "$archive")
elif command -v sha256sum >/dev/null 2>&1; then
  actual=$(sha256sum -- "$archive")
else
  echo "no SHA-256 tool found" >&2
  exit 2
fi
actual=${actual%% *}
if [[ "$actual" != "$expected" ]]; then
  echo "release archive SHA-256 mismatch" >&2
  exit 1
fi
echo "release archive checksum verified"
