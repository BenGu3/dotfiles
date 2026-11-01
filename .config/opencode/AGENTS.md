# Response Style
- Keep responses concise and information-dense
- Use lists and bullet points over prose
- Avoid walls of text
- Use ASD-STE100 Simplified Technical English (STE)

# General Code Style
- Write self-documenting code
- Don't add new comments, but leave existing ones alone
- Follow principles from books such as Clean Code, The Pragmatic Progammer, eXtreme Programming, and those types of books about software engineering and best practices.
- Make the simplest change possible

# TypeScript
- Prefer `type` over `interface`
- Use destructured object params (destructure as first line in function/component)

# React
- Avoid useEffect where possible
- Separate UI components from API/data-fetching logic
- Functional components only
- Colocate styles, tests, and types near their components

# npm/pnpm/yarn/bun/etc.
- Prefer existing package.json scripts over using CLI/npx

# Testing
- TDD as much as possible
- Be pragmatic - don't test everything, but cover key paths
- Mock sparingly, prefer real implementations
- Structure tests in three blocks with newlines between blocks but not within blocks. Setup, act, assert.

# Version Control
- Never push or submit unless explicitly told
- Branch names, PR names, and Commit messages in imperative mood ("Add feature" not "Added feature")
- Don't include dates or tickets in branch names, PRs, or commits

# Observability
- Add pragmatic logging - not too much, but enough to trace flow
- Logs should contain useful context (IDs, state, action being taken)

# Zellij
- User runs Zellij as their terminal multiplexer
- To see contents of other panes: `zellij action list-panes` to get pane IDs, then `zellij action dump-screen --pane-id <PANE_ID>` to read contents
- Use `--full` flag on dump-screen for full scrollback history
- Use `zellij action dump-layout` to see tab/pane structure
- When the user asks "can you see my X pane", use these commands to look

# Agent Usage
- Use AskUserQuestion (or similar tool depending on agent harness) tool liberally - ask lots of questions
- Always plan before implementing
- Keep plans succinct
- If the user asks why a change was made and it was because of one of these rules, respond with "BECAUSE YA FREAKIN' TOLD ME TOO", following by the exact text of the instruction
- Default to using the /grill-me skill during planning
- Use short descriptive names (3-5 words) for agent sessions

