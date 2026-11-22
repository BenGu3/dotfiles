---
name: do-breakdown
description: Splits an approved change contract into small delivery tasks with independent proof. Use when the user invokes /breakdown or enters the breakdown phase of /do.
---

# Break down

## Prerequisites

Read [shared rules](../do/RULES.md) first.

1. Require an approved change contract in the conversation. If missing, return to Plan.
## Task design

2. Inspect the code as needed to define realistic task boundaries.
3. Apply the same change contract at task level without repeating the full plan.
4. Make each task one coherent behavior or structural change with its own proof, not a line-count quota.
5. Default to one commit and one PR per task. Agree on exceptions explicitly.
## Task contract

6. Give each task:
   - **Goal:** One sentence.
   - **Scope and exclusions:** Allowed files or modules and explicit exclusions.
   - **System change:** Observable before → after behavior.
   - **Contracts:** Exact boundaries consumed or provided; reference approved definitions rather than duplicating them.
   - **Dependencies:** Prerequisite tasks and intended PR base.
   - **Validation:** Repo-local commands, expected pre-change result, acceptance criteria, and evidence.
## Validation and dependencies

7. Keep validate → implement → refactor inside each task. Do not separate all tests from all implementation.
8. Assign the full-change acceptance check to the task that completes the behavior.
9. If integration is uncertain, make the first task a thin end-to-end slice.
10. Independent tasks target the repo's default branch. Dependent PRs target the prerequisite branch; use ordinary Git and GitHub, not a stack manager.
11. Parallel work requires explicit authorization, settled contracts, and non-overlapping write scopes.
## Approval gate

12. Return architectural decisions to Plan for approval. Do not silently resolve them during breakdown.
13. Ask for approval to build one named task, or an explicitly named group. Do not start Build automatically.

## Example

Example: Task A adds a verified service contract; Task B uses that contract in a route, targets A's branch, and owns the full route acceptance check.
