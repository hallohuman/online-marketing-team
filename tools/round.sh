#!/bin/sh
# The poking loop for the online-marketing team. A seat takes one turn and stops; this script is
# what makes a handoff reach the next seat. Run it in a second terminal and leave it running.
#
#   sh tools/round.sh
#
# It pokes @lead whenever tasks/review.md changes, one headless turn per change. Stop it with
# Ctrl-C; nothing else depends on it.
set -eu

HARNESS="${HARNESS:-codex}"
MODEL="${MODEL:-gpt-6-sol}"
REVIEW=tasks/review.md
seen=""

poke() {
  ag code -p --harness "$HARNESS" --model "$MODEL" "$1" >/dev/null 2>&1 || true
}

while :; do
  stamp=$(cksum "$REVIEW" 2>/dev/null || printf 'none')
  if [ "$stamp" != "$seen" ] && [ -n "$seen" ]; then
    poke "You are @lead. Read AGENTS.md and roles/lead.md, then read what changed in $REVIEW, check every claim against reports/ and memory/brand.md, and answer GO or CHANGES in the task line."
  fi
  seen="$stamp"
  sleep 20
done
