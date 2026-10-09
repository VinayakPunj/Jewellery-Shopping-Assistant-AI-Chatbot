#!/usr/bin/env bash
# Usage:  ./run.sh          play a scripted conversation
#         ./run.sh chat     talk to the assistant in the terminal
#         ./run.sh web      chat in the browser at http://127.0.0.1:8000
#         ./run.sh test     run the unit tests
set -euo pipefail
cd "$(dirname "$0")"

PY="${PYTHON:-python3}"
if ! command -v "$PY" >/dev/null 2>&1; then
  echo "Python 3.9 or newer is required. Install it from https://www.python.org/downloads/" >&2
  exit 1
fi

case "${1:-demo}" in
  demo) "$PY" -m jewel_assistant demo ;;
  chat) "$PY" -m jewel_assistant chat ;;
  web)  "$PY" -m jewel_assistant web ;;
  test) "$PY" -m unittest discover -s tests -v ;;
  *)    echo "Unknown option '$1'. Use: demo, chat, web or test." >&2; exit 1 ;;
esac
