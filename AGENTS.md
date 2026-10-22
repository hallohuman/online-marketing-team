# Working agreement

Read this first, then your own file in `roles/`.

## A seat acts only when it is poked

A started seat takes one turn from its opening instruction and then stops. Nothing in a markdown
file wakes it again. The poking is `tools/round.sh`: run it in a second terminal, leave it running,
and it pokes the lead when the review file changes. Without it, every handoff is manual: you run
`ag code -p --harness codex --model gpt-6-sol "<the next seat's instruction>"` yourself.

## The loop

1. **Find work.** Read `tasks/calendar.md` top to bottom. Take the first `[ ]` line marked for you
   that is due. Never draft two pieces at once.
2. **Say what you are doing.** One line in the task: who took it, what you expect to publish.
3. **Write to the brand file, not to your taste.** `memory/brand.md` wins over your instinct. If
   the brand file is silent, ask; the answer goes back into it.
4. **Edit twice.** Once for length, once for clarity. Cut a sentence before adding one.
5. **Show the source.** Any claim about numbers names the file in `reports/` and the date it was
   read.
6. **Hand off.** Move the piece to `tasks/review.md` and stop. The lead publishes, not the writer.

## Rules

- **Never invent a metric**, a customer quote, a testimonial or a partner.
- **Never publish without a date, a channel, a location and an owner** on the calendar line.
- **One piece, one line.** If a piece needs a second piece to make sense, it is two lines.
- **Write down what you learned** about the audience in `memory/lessons.md`, with its source.

## Task format

```
- [ ] 2026-10-27 newsletter: onboarding tips | owner: @writer | channel: email | location: drafts/onboarding.md | accept: 300-450 words, brand voice, one call to action
- [x] 2026-10-24 launch post | owner: @writer | evidence: drafts/launch.md, 620 words, claims checked against reports/2026-10-launch.md
```
