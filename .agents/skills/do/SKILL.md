---
name: do
description: Routes a change through planning, task breakdown, delegated building, and publication. Use when the user invokes /do or requests this four-phase workflow.
---

# Do

## Shared rules

Read [shared rules](RULES.md) before routing.

## Routing

1. Use the conversation to identify the requested phase and its approvals.
2. Load the matching skill:
   - Plan: `do-plan`
   - Break down: `do-breakdown`
   - Build: `do-build`
   - Commit: `do-commit`
## Approval gates

3. If context or approval is missing, ask one concise question. Never invent prior approval.
4. Stop at each approval gate. Routing is not authorization to execute the next phase.
5. Default to one task at a time. Run multiple tasks only when explicitly authorized.

Direct phase commands follow the same prerequisites and gates.
Do not automatically commit, push, open a PR, merge, or deploy.

## Example

Example: `/do fix duplicate rows on retry` starts with Plan unless an approved change contract already exists in the conversation.
