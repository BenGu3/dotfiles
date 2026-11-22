---
name: do-plan
description: Defines a concise change contract with exact boundaries and validation. Use when the user invokes /plan or enters the planning phase of /do.
---

# Plan

## Prerequisites

Read [shared rules](../do/RULES.md) first.

## Investigation and decisions

1. Inspect relevant repo instructions, code, callers, and existing validation scripts.
2. Load `grill-me` for the interview. Ask one question at a time, with a recommendation. Investigate code-answerable questions instead of asking the user.
3. Agree on the problem, scope, system behavior, architecture, and observable acceptance criteria.
4. Define exact signatures or schemas for new or changed routes, service interfaces, and important exported functions. Include inputs, outputs, errors, and invariants. Leave private implementation details open.
5. Resolve decisions before approval. Name uncertainty honestly; use read-only investigation or a separately approved experiment to settle it before dependent implementation.
## Change contract

6. Produce this concise change contract:

   - **Goal:** One sentence.
   - **Scope and exclusions:** 2–3 bullets.
   - **System change:** A couple of before → after bullets.
   - **Architecture:** A couple of bullets, plus exact changed boundary contracts as needed.
   - **Validation:** A couple of bullets naming observable acceptance criteria, repo-local checks, and required runtime evidence.

## Validation

7. Define a full-change acceptance check. “Tests pass” alone is not an acceptance criterion.
8. If a suitable validation script is missing, define how to add or extend it within scope.
## Approval gate

9. Present the contract with no unresolved decisions and ask for approval before breakdown. Do not implement.

## Example

Example boundary: `POST /users` accepts `{ email: string }`, returns `201 { userId: string }`, and returns `409 { code: "EMAIL_EXISTS" }` for duplicates. Validate creation and duplicate handling through the repo's integration script.
