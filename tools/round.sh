#!/bin/sh
# The poking loop for the online-marketing team. A seat takes one turn and stops; this script is
# what makes a handoff reach the next seat. Run it in a second terminal and leave it running.
#
#   sh tools/round.sh
#
# It pokes @lead whenever tasks/review.md changes, one headless turn per change, so it never
# stacks turns up. Every attempt prints one line; a failed attempt prints its exit status, the
# harness and model it used, and the end of the agent's own message, then the loop carries on.
# Stop it with Ctrl-C; nothing else depends on it.
set -u

HARNESS="${HARNESS:-codex}"
MODEL="${MODEL:-gpt-6-sol}"
REVIEW=tasks/review.md
seen=""
warned=""

poke() {
  if out=$(ag code -p --harness "$HARNESS" --model "$MODEL" "$1" 2>&1); then
    printf '%s poked @lead\n' "$(date '+%H:%M:%S')"
  else
    status=$?
    printf '%s POKE FAILED (exit %s): @lead not reached. harness=%s model=%s\n' \
      "$(date '+%H:%M:%S')" "$status" "$HARNESS" "$MODEL" >&2
    printf '%s\n' "$out" | tail -5 >&2
  fi
}

while :; do
  if [ ! -f "$REVIEW" ]; then
    if [ -z "$warned" ]; then
      printf '%s %s is missing: the loop has nothing to watch and will keep checking\n' \
        "$(date '+%H:%M:%S')" "$REVIEW" >&2
      warned=1
    fi
    sleep 20
    continue
  fi
  warned=""
  stamp=$(cksum "$REVIEW")
  if [ "$stamp" != "$seen" ] && [ -n "$seen" ]; then
    poke "You are @lead. Read AGENTS.md and roles/lead.md, then read what changed in $REVIEW, check every claim against reports/ and memory/brand.md, and answer GO or CHANGES in the task line."
  fi
  seen="$stamp"
  sleep 20
done
