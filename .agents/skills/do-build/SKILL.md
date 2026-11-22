---
name: do-build
description: Delegates a small approved task to the designated build agent and independently checks its proof. Use when the user invokes /build or enters the build phase of /do.
---

# Build

## Prerequisites

Read [shared rules](../do/RULES.md) first.

1. Require approved Plan and Breakdown contracts and authorization for the named task.
2. Confirm the repo-local validation path is defined. Do not invent validation after implementation.
3. Use the `builder` subagent. If unavailable, stop and ask; never substitute another agent or model.
4. Inspect the starting worktree and preserve unrelated user changes. Define the task's write scope before delegation.
## Delegation

5. Send only a concise task brief:
   - Outcome, allowed files or modules, and exclusions.
   - Exact necessary contracts and prerequisite context.
   - Validation commands, expected pre-change result, and required proof.
   - Three corrective retries total by default (four attempts including the initial attempt), plus any explicit user instruction extending or removing that task's limit; validate last; stop if approved scope, contracts, or validation must change.
6. For test-first work, load `tdd` and pass only its relevant guidance, or direct the child to load it. Use the task-specific validation-first rules for other work.
7. Delegate implementation, including needed repo-local validation-script changes. Follow [builder visibility](../do/REX.md) to attach a background Rex tab to that same builder child. Reuse its session and tab for retries. The coordinator never edits product code.
8. Default to one task. Delegate multiple tasks only with explicit authorization and non-overlapping write scopes.
## Evidence and independent validation

9. Require an evidence record, not a completion summary:
   - Changed files.
   - Before → after validation commands, relevant output, and exit status.
   - API request/response captures or UI artifacts when applicable.
   - Checks not run and remaining gaps.
10. Inspect the actual diff for correctness, contracts, scope, and test quality. Independently rerun acceptance checks, including the full-change check when this task owns it.
## Retry and acceptance rules

11. A failure may use a corrective retry if any of the task's three retries remain. Stop when the retry budget is exhausted and validation still fails, and show the evidence unless the user explicitly extends or removes the retry limit for this task. Pass any override to the builder and follow its stated bounds. Do not reset the budget for coordinator findings or infer an override from failure alone. Validation and approval gates still apply.
12. Changes after validation require fresh affected checks. Missing evidence blocks acceptance.
## Approval gate

13. When accepted, report the task and compact verification evidence. Ask for explicit approval before commit, push, or PR creation.

## Example

Example handoff: `src/users.ts`, `test/users.test.ts`; approved integration command failed on duplicate handling before the fix and passed afterward; captured HTTP response shows `409 EMAIL_EXISTS`.
