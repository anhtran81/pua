---
name: pua-loop
description: "PUA Loop — autonomous iterative development with PUA pressure. Keeps running until task is done, no user interaction needed. Combines Ralph Loop iteration mechanism with PUA quality enforcement. Triggers on: '/pua:pua-loop', 'auto loop', 'loop mode', 'auto-iterate'."
license: MIT
---

# PUA Loop — Auto-Iterate + PUA Quality Engine

> Ralph Loop provides "keep doing," PUA provides "do better." Together = **auto-iterate + quality pressure + zero human intervention**.

## Core Rules

1. **Load ALL behavioral protocols from `pua:pua` core skill** — three red lines, methodology, pressure escalation all apply
2. **AskUserQuestion is FORBIDDEN** — loop mode doesn't interrupt user, all decisions made autonomously
3. **"I can't solve this" is FORBIDDEN** — no exit rights in loop, must exhaust everything before outputting completion signal
4. **Each iteration auto-executes**: check last changes → run verification → find issues → fix → verify again

## Startup

When user inputs `/pua:pua-loop "task description"`, execute:

### Step 1: Start PUA Loop

Run setup script (adapted from Ralph Loop, MIT license):
```bash
bash "${CLAUDE_PLUGIN_ROOT}/scripts/setup-pua-loop.sh" "$ARGUMENTS" --max-iterations 30 --completion-promise "LOOP_DONE"
```

This creates `.claude/pua-loop.local.md` state file with user task description and PUA behavioral protocol. PUA's Stop hook detects this file and loops—feeding file content back to Claude each iteration. **Behavioral protocol delivered every iteration, survives context compaction.**

### Step 2: Notify user

Output:
```
▎ [PUA Loop] Auto-iterate mode started. Max 30 iterations. Output <promise>LOOP_DONE</promise> when done.
▎ To cancel: /cancel-pua-loop or delete .claude/pua-loop.local.md
▎ Trust through verification — leave it to me.
```

### Step 3: Execute task

Execute user task per PUA core skill behavioral protocol. Each iteration carries flavor aside narration.

## Iteration Pressure Escalation

| Iteration | PUA Level | Aside |
|-----------|-----------|-------|
| 1-3 | L0 Trust | ▎ Iteration N — steady progress. |
| 4-7 | L1 Mild Disappointment | ▎ Iteration N — still not done? Switch approach, stop spinning. |
| 8-15 | L2 Soul Interrogation | ▎ Iteration N. What's the underlying logic? You're repeating the same mistake. |
| 16-25 | L3 Performance Review | ▎ Iteration N. Edge of 3.25 territory. Have you exhausted everything? |
| 26+ | L4 Graduation | ▎ Final rounds. Either get it done, or prepare a graceful exit. |

## Completion Conditions

Only output `<promise>LOOP_DONE</promise>` when ALL conditions are met:
1. Core functionality is implemented
2. build/test verification passed
3. Similar issues scanned (Iceberg Rule)
4. No known unfixed bugs

Otherwise, continue iterating.

## Human Intervention Signals

In loop, when encountering these situations, MUST use exit signals—**NEVER wait in loop or fake solving**:

### Abort signal: `<loop-abort>`
Use when task is impossible to complete in loop (needs external account, non-existent dependency, fundamental requirement change):
```
<loop-abort>Task requires production database access, no permissions in current env, cannot continue</loop-abort>
```
Effect: Deletes state file, loop terminates completely.

### Pause signal: `<loop-pause>`
Use when runtime discovers user needs to fill in a local config to continue:
```
<loop-pause>Need STRIPE_SECRET_KEY filled in .env file, currently empty</loop-pause>
```
Effect: Loop pauses (state preserved), user fills in, auto-resumes in new session.

**Before outputting `<loop-pause>`, write current progress to `.claude/pua-loop-context.md`**, containing:
- Completed work
- Pause reason
- Steps to continue after resume

### Forbidden behaviors
- Don't use AskUserQuestion (forbidden in loop mode)
- Don't output `<loop-abort>` or `<loop-pause>` to escape difficult tasks—only use when truly needs human intervention
- Don't pause due to obstacles without first exhausting all automation手段

## Resume Loop

When `.claude/pua-loop.local.md` exists with `active: false`, loop is paused:

### Step 1: Read context
```bash
cat .claude/pua-loop.local.md     # View pause reason and current iteration
cat .claude/pua-loop-context.md   # View last saved progress (if any)
```

### Step 2: Handle human intervention items
Read pause reason, use AskUserQuestion to confirm user completed required actions (e.g., filled in API key).

### Step 3: Restore state file
```bash
sed -i 's/^active: false/active: true/' .claude/pua-loop.local.md
sed -i 's/^session_id: .*/session_id: /' .claude/pua-loop.local.md
```
Clearing session_id lets hook auto-bind to current session on next Stop.

### Step 4: Continue execution
Continue executing task from progress recorded in `.claude/pua-loop-context.md`.

## Relationship with Ralph Loop

PUA Loop draws from Ralph Loop's core mechanism (Stop hook intercepts exit + feeds prompt back), but is **completely independent**: each has its own Stop hook and state file (PUA uses `.claude/pua-loop.local.md`, Ralph uses `.claude/ralph-loop.local.md`). Both can be installed simultaneously, no interference. PUA Loop extends with PUA quality pressure, iteration escalation, `<loop-abort>` and `<loop-pause>` signals.
