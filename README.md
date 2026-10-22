# online-marketing-team

A small team of AI agents that run your marketing week: one keeps the plan, one writes, one reads
the numbers, and every claim about performance comes from a real report.

## You need

- `hab` and `ag` from a hallohuman beta release.
- `git` on your PATH.
- One signed-in provider CLI — Claude Code, Codex or Grok. The seats name Codex in `hab.tsx`; swap
  `--harness` and `--model` for whichever you are signed in to.
- If `ag` asks for an account, add `--account <email>` (or `--account auto`) to the seat line in
  `hab.tsx`.

## Start it

After the beta release, from the directory you want the team in:

```console
$ hab up github.com/hallohuman/online-marketing-team
```

Hab clones the team into `./online-marketing-team` and starts its seats against that clone. If you already
have that clone, hab reuses it unchanged and prints the pull command instead of fetching for you. The
clone is your working copy: edit the brand file and the calendar there, and add your own remote if
you want to keep your changes.

Your first start will ask you to trust the folder and may ask for tool permissions; those prompts
are your harness's, not the team's.

Runtime state lives in `.hab/`, which is gitignored.

Two words used below: a **seat** is one `habitant` in `hab.tsx` — an interactive agent in this
team — and a **harness** is the provider CLI that seat runs (Claude Code, Codex, Grok).

## What the team does

- Plans the week in `tasks/calendar.md`: what ships, to which channel, on which day.
- Writes the piece against your brand file, then edits it once for length and once for clarity.
- Checks the numbers before making claims about what worked, and records the source.
- Keeps what it learns about your audience in `memory/`, so the next week starts ahead.

## What is inside

| Path | What it is |
|---|---|
| `hab.tsx` | the team: which seats start, what they run |
| `AGENTS.md` | the working agreement every seat reads first |
| `roles/` | one file per seat: what it owns and what it must not do |
| `tasks/calendar.md` | the week, as plain markdown lines |
| `tasks/review.md` | pieces waiting for the lead |
| `reports/` | the numbers, one file per report, with its source and period |
| `memory/brand.md` | who you are talking to, and how you sound |
| `memory/lessons.md` | what we learned about the audience, newest first |
| `skills/` | one procedure a seat can follow |
| `tools/round.sh` | the poking loop: the file that makes a handoff reach the next seat |

## Changing the team

Edit the files. A role is a markdown file, a piece of work is a line, a memory is a note. Commit
the team together with the content you publish, in your own remote, and it versions with it.
