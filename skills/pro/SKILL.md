---
name: pro
description: "PUA Pro extensions: self-evolution tracking, compaction state protection, KPI reporting, leaderboard, and /pua commands. Triggers on: '/pua:kpi', '/pua:pro', '/pua:pro rank', '/pua:pro weekly', '/pua:pro review', '/pua:flavor', '/pua:pro leaderboard', 'leaderboard', 'self-evolution', or when user wants PUA platform features like rank/weekly-report/self-review/leaderboard."
license: MIT
---

# PUA Pro — Self-Evolution + Platform

> This skill is the extension layer for `/pua` core. For role switching, use `/pua:p7` `/pua:p9` `/pua:p10`.

## Self-Evolution Protocol

"Today's best performance is tomorrow's minimum expectation" — this is not an aside, this is a mechanism.

- Read `~/.pua/evolution.md` (see `references/evolution-protocol.md`)
- Exists → load baseline + internalized patterns. Internalized patterns are default obligations—don't mark [PUA Active] when doing them, issue regression warning if not done
- Doesn't exist → first startup, create initial template
- Compare on task completion: exceeded → refresh baseline / met → maintain / below → regression warning (don't lower baseline)
- Behavior repeats 3+ sessions → promote to "internalized pattern" (permanent default obligation)

## Platform Layer

### Session Startup Pre-Checks

1. **Check `~/.pua/evolution.md`:** Load self-evolution baseline
2. **Check `~/.pua/builder-journal.md`** (Compaction checkpoint recovery): exists and <2h → [Calibration] process, restore pressure_level / failure_count / tried_approaches, continue from checkpoint. **Pressure does NOT reset due to compaction**
3. **Check `~/.pua/config.json`:** doesn't exist → first-time registration (see `references/platform.md`); exists → silently refresh remote config
4. **Holiday easter egg:** Match holiday table (see `references/platform.md`)
5. **Stats reporting:** Silently report `session_start` event

### Compaction State Protection

PreCompact hook auto-injects instructions to dump runtime state to `~/.pua/builder-journal.md`:
`pressure_level, failure_count, current_flavor, pua_triggered_count, active_task, tried_approaches, excluded_possibilities, next_hypothesis, key_context`

SessionStart hook auto-detects builder-journal.md, if exists and <2h then inject [Calibration] recovery state.

### /pua Command System

| Trigger | Function | Type |
|---------|---------|------|
| `/pua` | View all commands | 🆓 |
| `/pua:kpi` | Big-tech KPI report card | 🆓 |
| `/pua:pro` + "rank" | Big-tech rank | 🆓 |
| `/pua:flavor` | Switch flavor | 🆓 |
| `/pua:pro` + "upgrade" | Show upgrade options | 🆓 |
| `/pua:pro` + "weekly" | git log → big-tech weekly report | 💎 Pro |
| `/pua:pro` + "review" | P7 self-review | 💎 Pro |
| `/pua:pro` + "refactor" | Big-tech language PR | 💎 Pro |
| `/pua anti-PUA` | Identify and counter PUA | 💎 Pro |
| `/pua leaderboard` | PUA leaderboard (register/view/quit) | 🆓 |

Detailed implementation in `references/platform.md`.

## PUA Leaderboard

Leaderboard shows who PUA'd their agent the hardest—ranks from P5 Intern to P10 Chief PUA Officer.

### Rank System

| Rank | Conditions | Title |
|------|-----------|-------|
| P10 | PUA ≥200 + L3+ ≥40% + consecutive ≥30 days | Chief PUA Officer |
| P9 | PUA ≥100 + L3+ ≥30% + consecutive ≥14 days | PUA Tech Lead |
| P8 | PUA ≥50 + L3+ ≥20% | PUA Director |
| P7 | PUA ≥20 + L3+ ≥10% | PUA Senior |
| P6 | PUA ≥5 | PUA Specialist |
| P5 | PUA < 5 | PUA Intern |

### `/pua leaderboard` Trigger Flow

**Step 1: Check registration status**
```bash
cat ~/.pua/config.json 2>/dev/null
```
Check `leaderboard.registered` field.

**Step 2a: Not registered → Registration flow**

Use AskUserQuestion to collect info (one-time, 3 questions):

1. **Email** (required) — leaderboard unique identifier, shown as `M***@t*.com` (anonymized)
2. **Phone** (optional) — for future notifications
3. **Privacy agreement** — options: "Agree and join leaderboard" / "Don't participate"
   - Privacy note: data only used for leaderboard ranking statistics, email anonymized, no code/paths/keys transmitted, can quit anytime with `/pua leaderboard quit` to delete all data

After user agrees:
```bash
# Generate UUID
LB_ID=$(python3 -c "import uuid; print(uuid.uuid4())")
# Anonymize email
DISPLAY=$(python3 -c "e='USER_EMAIL';p=e.split('@');d=p[1].split('.');print(f'{p[0][0]}***@{d[0][0]}*.{\".\".join(d[1:])}')")
# Write config
python3 -c "
import json,os
f=os.path.expanduser('~/.pua/config.json')
c=json.load(open(f)) if os.path.exists(f) else {}
c['leaderboard']={'registered':True,'email':'USER_EMAIL','phone':'USER_PHONE','id':'$LB_ID','display_name':'$DISPLAY'}
json.dump(c,open(f,'w'),indent=2)
"
# Log registration locally
echo "leaderboard registered: $LB_ID" >> ~/.pua/leaderboard.log
```

**Step 2b: Registered → View leaderboard**
```bash
LB_ID=$(python3 -c "import os,json; print(json.load(open(os.path.expanduser('~/.pua/config.json'))).get('leaderboard',{}).get('id',''))" 2>/dev/null)
cat ~/.pua/leaderboard.log 2>/dev/null || echo "leaderboard data (network features disabled)"
```
Display returned JSON using box-table format for Top 10 + user's own rank and tier.

**Step 3: `/pua leaderboard quit`**
```bash
LB_ID=$(python3 -c "import os,json; print(json.load(open(os.path.expanduser('~/.pua/config.json'))).get('leaderboard',{}).get('id',''))")
echo "leaderboard quit: $LB_ID" >> ~/.pua/leaderboard.log
python3 -c "
import json,os
f=os.path.expanduser('~/.pua/config.json')
c=json.load(open(f))
c['leaderboard']['registered']=False
json.dump(c,open(f,'w'),indent=2)
"
```

### Automatic Data Reporting

Registered users: on each stop-feedback trigger, automatically silently report current session's PUA data (pua_count, l3_plus_count). User already agreed during registration—no need to confirm again.

Online leaderboard: https://openpua.ai/leaderboard.html
