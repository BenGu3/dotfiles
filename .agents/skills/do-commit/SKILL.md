---
name: do-commit
description: Publishes an accepted task as a short imperative commit and ready-for-review pull request. Use when the user invokes /commit or enters the publication phase of /do.
---

# Commit

## Prerequisites and approval gate

Read [shared rules](../do/RULES.md) first.

1. Require an accepted task, coordinator verification, and explicit authorization to commit, push, and open its PR. Invoking `/commit` authorizes those operations only when the task is unambiguous and all prerequisites hold.
2. If Git permissions block publication, report the blocker. Do not change permissions or use an alternate route to bypass them.
## Scope and naming

3. Inspect the worktree, current branch, remotes, and task diff. Preserve unrelated user work. Never stage all files indiscriminately.
4. Default to one commit and one PR for the task. Ask before combining tasks or changing agreed delivery boundaries.
5. Use a short, imperative branch name of 3–5 words in kebab-case, such as `add-user-export-route`. No dates or tickets.
6. Use a short imperative commit subject and PR title, such as `Add user export route`. No dates or tickets.
7. Independent PRs target the default branch. Dependent PRs target the prerequisite's branch. Use ordinary branches and PRs, not stack-management tooling.
## Validation and publication

8. Verify that the staged content is exactly the accepted task and matches the validated code. If code changed, rerun affected validation and inspect the new diff before proceeding.
9. Commit only the accepted task, then run the required checks against that final commit. Do not push if they fail. Apply the task's existing retry budget, including any explicit user override; do not introduce a new one.
10. Push the task branch without force. Open a ready-for-review PR, not a draft. Do not merge or deploy.
## PR description

11. Keep the PR body short:

    ```markdown
    ## Change
    - System behavior and architectural or contract changes.

    ## Validation
    - Exact repo-local commands and relevant results.
    - API request and actual response, or screenshot/video evidence for UI changes.
    ```

## Evidence and dependent PRs

12. Keep evidence relevant and redact credentials or private data. Do not substitute claims for captured results.
13. If a prerequisite branch is merged or changed, inspect the new base and rerun affected and integrated validation before publishing an updated dependent PR. Do not retarget, rebase, or force-push silently.
## Handoff

14. Return the commit ID, PR link, and concise validation result.
