// The team: three seats, each started with its own role file as the opening instruction.
// No codeRoot is declared, so the folder this file lives in is the team's source root.
// The model is pinned because an unpinned seat can resolve to a model with no quota binding and
// then never start (ag exits 79). Swap --harness/--model for a provider you are signed in to.
const seat = (role: string) => ({
  command: `ag code --harness codex --model gpt-6-sol "You are @${role}. Read AGENTS.md, then roles/${role}.md, then work the top of tasks/calendar.md."`,
  readiness: { readyWithinMs: 20_000 },
})

export default {
  name: "online-marketing-team",
  habitants: {
    "@lead": seat("lead"),
    "@writer": seat("writer"),
    "@analyst": seat("analyst"),
  },
}
