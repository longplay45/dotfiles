#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 [-o output.json] <url>"
  exit 2
}

OUT=""
while getopts ":o:" opt; do
  case $opt in
    o) OUT=$OPTARG ;;
    *) usage ;;
  esac
done
shift $((OPTIND-1))

[ $# -ge 1 ] || usage
URL="$1"

PYTHON="$(command -v python3 || command -v python || true)"
if [ -z "$PYTHON" ]; then
  echo "Error: python is not installed" >&2
  exit 3
fi

if [ -n "$OUT" ]; then
  TMP="$(mktemp)"
  trap 'rm -f "$TMP"' EXIT
  if curl -fsSL "$URL" | "$PYTHON" -m json.tool > "$TMP"; then
    mv "$TMP" "$OUT"
    echo "Saved pretty JSON to $OUT"
  else
    echo "Error: failed to fetch or parse JSON from $URL" >&2
    exit 4
  fi
else
  curl -fsSL "$URL" | "$PYTHON" -m json.tool
fi