#!/usr/bin/env bash

set -eu -o pipefail

cd "$(dirname "$0")/.."

MARKER_START='{{COMMAND-OUTPUT "'
MARKER_END='"}}'
ALLOWED_COMMANDS=("phpcs" "phpcbf")

tokenize_command() {
  read -ra TOKENS <<< "$1"
}

check_allowed_commands() {
  local cmd="${TOKENS[0]}"
  for allowed in "${ALLOWED_COMMANDS[@]}"; do
    [[ "${cmd}" == "${allowed}" ]] && return 0
  done

  echo >&2 "  ERROR: refusing to run arbitrary command: ${cmd}"
  exit 1
}

validate_tokens() {
  for token in "${TOKENS[@]}"; do
    if [[ "${token}" =~ [\;\|\&\$\<\>\`\\] ]]; then
      echo >&2 "  ERROR: refusing unsafe token: ${token}"
      exit 1
    fi
  done
}

execute_command() {
  tokenize_command "$1"
  check_allowed_commands
  validate_tokens

  EXECUTABLE_COMMAND=("${TOKENS[0]}" "${TOKENS[@]:1}")
  echo >&2 "  INFO: running: " "${EXECUTABLE_COMMAND[@]}"
  "${EXECUTABLE_COMMAND[@]}" </dev/null || true
}

if [[ -z "${CI:-}" ]]; then
  # The `_wiki` directory is created in a previous GitHub Action step.
  # This 'if' block is intended to assist with local development activity.
  rm -rf _wiki/
  cp -r wiki/ _wiki/
fi

grep -lrF "${MARKER_START}" _wiki | while read -r file_to_process; do
  echo "Processing markers in ${file_to_process}"

  while IFS=$'\n' read -r line; do
    if [[ ${line} = ${MARKER_START}*${MARKER_END} ]]; then
      USER_COMMAND="${line##"${MARKER_START}"}"
      USER_COMMAND="${USER_COMMAND%%"${MARKER_END}"}"

      execute_command "${USER_COMMAND}"
    else
      echo "${line}"
    fi
  done < "${file_to_process}" > build/temp.md

  mv build/temp.md "${file_to_process}"
done
