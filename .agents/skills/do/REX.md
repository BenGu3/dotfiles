# Builder visibility in Rex

## Scope

- Apply this only to `builder` children, not Explore or other agents.
- Keep native OpenCode child sessions, permissions, and automatic reports to the parent.
- Rex is a view into the existing child, not a second worker.
- A tab does not isolate files or authorize parallel work.

## Start and attach

1. Load the `rex` skill and follow its installed CLI guide.
2. Identify the current Rex session, parent OpenCode session, project directory, and server connection. Use `$REX_SESSION` and `$OPENCODE_SESSION_ID` when available; verify missing or stale context rather than guessing.
3. Create the `builder` child through native delegation and retain its child session ID. Attach as soon as the ID is available.
4. If native delegation is unavailable, the documented OpenCode API can create a linked child with `parentID`, `agent: "builder"`, and a short title. Start it with `session.prompt`. Use `opencode api` for server discovery and authentication. Never use this path to bypass denied delegation.
5. Open a named background tab in the same Rex session:

   ```sh
   rex window new -s "$REX_SESSION" "Builder: Add route" \
     -c "$project_dir" --focus=false --keep-open --json \
     -- opencode --session "$child_session_id"
   ```

6. Both OpenCode clients must use the same server. If the parent uses an explicit server, pass the same `--server` to the attached client. Do not use `--standalone`, `--auto`, or supply a new prompt when attaching.
7. Save the returned window and block IDs in the conversation. Capture the block once to verify that the correct child is visible. Inspect before retrying a timed-out tab creation to avoid duplicates.

## Follow-up and completion

- Send corrections and retries to the same child session through native delegation or the documented session prompt API. Do not start a new child or tab for each attempt.
- Keep the task's retry budget across follow-ups. Attaching a client does not reset it.
- Let the child's automatic report return to the parent. Terminal output is visibility, not proof of correctness.
- The attached client is interactive, not read-only. Avoid conflicting instructions if the user intervenes there.
- Keep completed tabs open unless the user asks to close them.

## Failure handling

- If Rex is unavailable or attachment fails, report the visibility problem and ask whether to continue without the tab.
- Do not duplicate an already-running builder, silently switch servers, or replace the native child with an unrelated worker.
- Do not change validation, approval gates, write scope, or agent permissions to enable visibility.
