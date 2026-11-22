# Shared workflow rules

## Control

- Keep responses and artifacts concise. State outcomes, decisions, and evidence.
- Keep workflow state in the conversation. Do not create workflow state or plan files unless asked.
- Follow repo instructions. Validation scripts belong to the repo, not this workflow.
- Plan approval authorizes breakdown, not implementation.
- Breakdown approval authorizes building the named task, not publication.
- The coordinator independently reviews and validates before accepting a task.
- Commit, push, and PR creation require explicit approval for the accepted task.
- Default to one task. Multiple tasks require explicit authorization.
- Never merge or deploy as part of this workflow.
- If agent mode or permissions block an action, report the blocker. Do not bypass it.

## Engineering

- Make the smallest correct, understandable change, not merely the fewest changed lines.
- Solve the approved requirement. Avoid speculative abstractions and future-proofing.
- Use clear names, cohesive modules, small functions, and testable layers.
- Do not add dependency injection solely to enable tests.
- Separate responsibilities so changes and tests do not require unrelated changes.
- Share duplicated knowledge and rules, not code merely because it looks similar.
- Define exact inputs, outputs, errors, and invariants at changed boundaries.
- Leave private implementation choices to the build agent.
- Prefer short-lived branches and shallow dependencies.
- When integration is uncertain, start with a thin end-to-end slice that proves the path.
- Refactor only within task scope after checks pass; rerun checks afterward.

## Validation

- Define the repo-local validation path before Build. Include needed script changes in approved scope.
- Prefer existing package scripts. Add or extend repo-local validation scripts when needed.
- Use the lowest deterministic layer that proves the behavior:
  - Pure logic: unit tests.
  - Service, database, or route contracts: integration tests.
  - User flows: end-to-end tests.
  - Structural rules: types or lint.
- Validate first, implement, then refactor:
  - Bugs and new behavior: demonstrate the expected failure first.
  - Refactors: establish passing behavior checks and preserve them.
  - Types and lint: demonstrate a violating example fails.
  - Visual changes: define the expected result and capture before/after evidence; automate stable assertions where practical.
- A failure must have the expected cause, not a broken setup.
- Run focused checks during development. The build agent's last action before handoff is running required validation.
- Return exact commands, relevant output, exit status, and artifact locations. State checks not run.
- Screenshots, videos, and API request/response captures support review; they do not replace practical automated checks.
- Any later edit makes prior evidence stale. Rerun affected checks before acceptance or publication.
- The task that completes the behavior owns the full-change acceptance check, even when all individual checks pass.
- Treat reported evidence as unverified until the coordinator inspects the diff and independently reruns acceptance checks.

## Delegation and acceptance

- The coordinator does not edit product code, even for small fixes. Delegate implementation and validation-script changes.
- Use the `builder` subagent. If it is unavailable, stop and ask. Do not silently choose another agent or model.
- Open each builder child in a background Rex tab using [builder visibility](REX.md). Reuse its session and tab for retries; keep completed tabs open. Do not open tabs for Explore or other agents.
- Give a concise, self-contained task: outcome, write scope and exclusions, necessary contracts, validation commands, required evidence, and retry limit.
- Do not send the full planning conversation or unnecessary exploration rules.
- Default to three corrective retries total per task (four attempts including the initial attempt), including failures discovered during coordinator verification. The user may explicitly extend or remove this limit for the task; pass that instruction to the builder. Otherwise, stop when the retry budget is exhausted and validation still fails, and return evidence to the user. A retry override does not waive validation, scope, contracts, or approval gates.
- Contract, scope, or validation-method changes require stopping and returning to the user for approval, regardless of size.
- Correctness failures, broken contracts, missing proof, and scope violations block acceptance.
- Style preferences and unrelated cleanup are suggestions, not blockers or permission to expand scope.
- No separate reviewer agent is required.
