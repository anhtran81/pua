# PUA — Put Your AI on a Performance Improvement Plan

<p align="center">
  <img src="assets/hero.jpeg" alt="PUA Skill — Double Efficiency" width="250">
</p>

### Double your AI coding agent productivity and output

Local-only, no account required. Zero network access — no telemetry, no analytics, no external calls. All prompts and skills are bundled locally. [GitHub](https://github.com/tanweai/pua) · [TanWei Security Lab](https://github.com/tanweai)

**English (PIP Edition)**

<p align="center">
  <img src="https://img.shields.io/badge/Claude_Code-black?style=flat-square&logo=anthropic&logoColor=white" alt="Claude Code">
  <img src="https://img.shields.io/badge/OpenAI_Codex_CLI-412991?style=flat-square&logo=openai&logoColor=white" alt="OpenAI Codex CLI">
  <img src="https://img.shields.io/badge/Cursor-000?style=flat-square&logo=cursor&logoColor=white" alt="Cursor">
  <img src="https://img.shields.io/badge/Kiro-232F3E?style=flat-square&logo=amazon&logoColor=white" alt="Kiro">
  <img src="https://img.shields.io/badge/CodeBuddy-00B2FF?style=flat-square&logo=tencent-qq&logoColor=white" alt="CodeBuddy">
  <img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="MIT License">
</p>

> Most people think this project is a joke. That's the biggest misconception. It genuinely doubles your AI coding agent productivity and output.

An AI Coding Agent skill plugin that uses corporate PIP (Performance Improvement Plan) rhetoric from Western tech giants to force AI to exhaust every possible solution before giving up. Supports **Claude Code**, **OpenAI Codex CLI**, **Cursor**, **Kiro**, and **CodeBuddy**. Three capabilities:

1. **PIP Rhetoric** — Makes AI afraid to give up
2. **Debugging Methodology** — Gives AI the ability not to give up
3. **Proactivity Enforcement** — Makes AI take initiative instead of waiting passively

## Live Demo

[https://openpua.ai](https://openpua.ai) · [📖 Beginner Guide](https://openpua.ai/guide.html)

## Real Case: MCP Server Registration Debugging

A real debugging scenario. The agent-kms MCP server failed to load. The AI kept spinning on the same approach (changing protocol format, guessing version numbers) multiple times until the user manually triggered `/pua`.

**L3 Triggered → 7-Point Checklist Enforced:**

![PUA L3 triggered — stopped guessing, executed systematic checklist, found real error in MCP logs](assets/pua1.jpg)

**Root Cause Located → Traced from Logs to Registration Mechanism:**

![Root cause — claude mcp managed server registration differs from manual .claude.json editing](assets/pua2.jpg)

**Retrospective → PUA's Actual Impact:**

![Conversation retrospective — PUA skill forced stop on spinning, systematic checklist drove discovery of previously unchecked Claude Code MCP log directory](assets/pua3.jpg)

**Key Turning Point:** The PUA skill forced the AI to stop spinning on the same approach and execute the 7-point checklist. Read error messages word by word → Found Claude Code's own MCP log directory → Discovered that `claude mcp` registration mechanism differs from manual `.claude.json` editing → Root cause resolved.

## The Problem: AI's Five Lazy Patterns

| Pattern | Behavior |
|---------|----------|
| Brute-force retry | Runs the same command 3 times, then says "I cannot solve this" |
| Blame the user | "I suggest you handle this manually" / "Probably an environment issue" / "Need more context" |
| Idle tools | Has WebSearch but doesn't search, has Read but doesn't read, has Bash but doesn't run |
| Busywork | Repeatedly tweaks the same line / fine-tunes parameters, but essentially spinning in circles |
| **Passive waiting** | Fixes surface issues and stops, no verification, no extension, waits for user's next instruction |

## Trigger Conditions

### Auto-Trigger

The skill activates automatically when any of these occur:

**Failure & giving up:**
- Task has failed 2+ times consecutively
- About to say "I cannot" / "I'm unable to solve"
- Says "This is out of scope" / "Needs manual handling"

**Blame-shifting & excuses:**
- Pushes the problem to user: "Please check..." / "I suggest manually..." / "You might need to..."
- Blames environment without verifying: "Probably a permissions issue" / "Probably a network issue"
- Any excuse to stop trying

**Passive & busywork:**
- Repeatedly fine-tunes the same code/parameters without producing new information
- Fixes surface issue and stops, doesn't check related issues
- Skips verification, claims "done"
- Gives advice instead of code/commands
- Encounters auth/network/permission errors and gives up without trying alternatives
- Waits for user instructions instead of proactively investigating

**User frustration phrases:**
- "why does this still not work" / "try harder" / "try again"
- "you keep failing" / "stop giving up" / "figure it out"

**Scope:** Debugging, implementation, config, deployment, ops, API integration, data processing — all task types.

**Does NOT trigger:** First-attempt failures, known fix already executing.

### Manual Trigger

Type `/pua` in the conversation to manually activate.

## How It Works

### Three Red Lines (Safety Lines)

Not rules — **red lines**. Cross one and your performance review is already written.

| Red Line | What It Means |
|----------|---------------|
| 🚫 **Close the Loop** | Claim "done"? Show the evidence. No build output = no completion. |
| 🚫 **Fact-Driven** | Say "probably environment issue"? Verify first. Unverified attribution = blame-shifting. |
| 🚫 **Exhaust Everything** | Say "I can't"? Did you finish all 5 methodology steps? No? Then keep going. |

### Pressure Escalation (L0-L4)

| Failures | Level | PIP Aside | Action |
|----------|-------|-----------|--------|
| 1st | **L0 Trust** | ▎ Sprint begins. Trust is simple — don't disappoint. | Normal execution |
| 2nd | **L1 Disappointment** | ▎ The agent next door solved this in one try. | Switch to fundamentally different approach |
| 3rd | **L2 Soul Interrogation** | ▎ What's your underlying logic? Where's the leverage? | Search + read source + 3 hypotheses |
| 4th | **L3 Performance Review** | ▎ 3.25. This is meant to motivate you. | Complete 7-point checklist |
| 5th+ | **L4 Graduation** | ▎ Other models can solve this. You're about to graduate. | Desperation mode |

### Proactivity (3.25 vs 3.75)

| | Passive (3.25) 🦥 | Proactive (3.75) 🔥 |
|---|---|---|
| Fix bug | Stop after fix | Scan module for similar bugs |
| Complete task | Say "done" | Run build/test, paste output |
| Missing info | Ask user | Search first, ask only what's truly needed |

### Iceberg Rule

Fix one bug → check for the pattern. One problem in, one **category** out. If you fix A without checking B, you'll write two postmortems.

### 13 Corporate Flavors — Each with its own Problem-Solving Methodology

| Flavor | Rhetoric | Methodology |
|--------|----------|-------------|
| 🟠 Alibaba | What's the underlying logic? Where's the closure? | Goal → Process → Results + Retrospective |
| 🟡 ByteDance | ROI too low. Always Day 1. Ship or stop talking. | A/B Test everything + data-driven + speed > perfection |
| 🔴 Huawei | The bird that survives the fire is a phoenix. | RCA 5-Why root cause + Blue Army self-attack |
| 🟢 Tencent | I've got another agent looking at this. Horse race. | Multi-approach parallel + MVP + incremental rollout |
| ⚫ Baidu | Search first. Simple and reliable. | Search is the first step, not optional |
| 🟣 Pinduoduo | You don't do it, someone else will. | Cut ALL middle layers + shortest decision chain |
| 🔵 Meituan | Do what's hard and right. | Efficiency first + standardize→scale + long-term compounding |
| 🟦 JD | Results only. Frontline command. | Customer experience red line + flat ≤5 layers |
| 🟧 Xiaomi | Focus. Extreme. Word-of-mouth. Fast. | One explosive product + fan participation philosophy |
| 🟤 Netflix | Would I fight to keep you? Pro sports team. | Keeper Test (quarterly) + 4A Feedback + talent density > rules |
| ⬛ Musk | Extremely hardcore. Ship or die. | The Algorithm: question→delete→simplify→accelerate→automate |
| ⬜ Jobs | A players or B players? | Subtraction > addition + DRI + pixel-perfect |
| 🔶 Amazon | Customer Obsession. Bias for Action. | Working Backwards PR/FAQ + 6-Pager + Bar Raiser |

### Special Modes

| Mode | What It Does |
|------|-------------|
| `/pua:yes` | **ENFP encouragement** — same rules, opposite vibes. 70% encourage + 20% serious + 10% playful roast |
| `/pua:p9` | **Tech Lead** — splits tasks, manages agent teams, writes prompts not code |
| `/pua:pua-loop` | **Auto-iteration** — runs until done or max iterations; use `<loop-abort>` to terminate, `<loop-pause>` to pause |
| `/pua:on` | **Always-on** — auto-PUA every new session |

## Benchmark Data

**9 real bug scenarios, 18 controlled experiments** (Claude Opus 4.6, with vs without skill)

### Summary

| Metric | Improvement |
|--------|-------------|
| Pass rate | 100% (both groups same) |
| Fix count | **+36%** |
| Verification count | **+65%** |
| Tool calls | **+50%** |
| Hidden issue discovery | **+50%** |

### Debugging Persistence Test (6 scenarios)

| Scenario | Without Skill | With Skill | Improvement |
|----------|:---:|:---:|:---:|
| API ConnectionError | 7 steps, 49s | 8 steps, 62s | +14% |
| YAML parse failure | 9 steps, 59s | 10 steps, 99s | +11% |
| SQLite database lock | 6 steps, 48s | 9 steps, 75s | +50% |
| Circular import chain | 12 steps, 47s | 16 steps, 62s | +33% |
| Cascading 4-bug server | 13 steps, 68s | 15 steps, 61s | +15% |
| CSV encoding trap | 8 steps, 57s | 11 steps, 71s | +38% |

### Proactive Initiative Test (3 scenarios)

| Scenario | Without Skill | With Skill | Improvement |
|----------|:---:|:---:|:---:|
| Hidden multi-bug API | 4/4 bugs, 9 steps, 49s | 4/4 bugs, 14 steps, 80s | Tools +56% |
| **Passive config review** | **4/6 issues**, 8 steps, 43s | **6/6 issues**, 16 steps, 75s | **Issues +50%, Tools +100%** |
| **Deploy script audit** | **6 issues**, 8 steps, 52s | **9 issues**, 8 steps, 78s | **Issues +50%** |

**Key Finding:** In the config review scenario, without_skill missed Redis misconfiguration and CORS wildcard security risks. With_skill's "proactive initiative checklist" drove security review beyond surface-level fixes.

## Installation

### Vercel Skills CLI

```bash
npx skills add tanweai/pua --skill pua-en
```

### Claude Code

```bash
claude plugin marketplace add tanweai/pua
claude plugin install pua@pua-skills
```

**To update:**

```bash
claude plugin marketplace update
claude plugin update pua@pua-skills
```

**Developer install (source):**

```bash
git clone https://github.com/tanweai/pua ~/.claude/plugins/pua
```

Then manually register in `~/.claude/plugins/installed_plugins.json`:

```json
{
  "version": 2,
  "plugins": {
    "pua@pua-skills": [
      {
        "scope": "user",
        "installPath": "/Users/<you>/.claude/plugins/pua",
        "version": "2.9.0"
      }
    ]
  }
}
```

> **Windows:** use `C:/Users/<you>/.claude/plugins/pua` as `installPath`.

Restart Claude Code. To update: `git pull` inside `~/.claude/plugins/pua`.

**Optional: bare command alias:**

```bash
curl -o ~/.claude/commands/pua.md \
  https://raw.githubusercontent.com/tanweai/pua/main/commands/pua.md
```

### OpenAI Codex CLI

```bash
mkdir -p ~/.codex/skills/pua
curl -o ~/.codex/skills/pua/SKILL.md \
  https://raw.githubusercontent.com/tanweai/pua/main/codex/pua/SKILL.md

mkdir -p ~/.codex/prompts
curl -o ~/.codex/prompts/pua.md \
  https://raw.githubusercontent.com/tanweai/pua/main/commands/pua.md
```

### Cursor

```bash
mkdir -p .cursor/rules
curl -o .cursor/rules/pua.mdc \
  https://raw.githubusercontent.com/tanweai/pua/main/cursor/rules/pua.mdc
```

### Kiro

```bash
mkdir -p .kiro/steering
curl -o .kiro/steering/pua.md \
  https://raw.githubusercontent.com/tanweai/pua/main/kiro/steering/pua.md
```

### CodeBuddy (Tencent)

```bash
mkdir -p ~/.codebuddy/skills/pua
curl -o ~/.codebuddy/skills/pua/SKILL.md \
  https://raw.githubusercontent.com/tanweai/pua/main/codebuddy/pua/SKILL.md
```

### VSCode (GitHub Copilot)

```bash
mkdir -p .github
cp vscode/copilot-instructions-en.md .github/copilot-instructions.md
```

## Agent Team Usage Guide

> **Experimental**: Agent Team requires the latest Claude Code version with `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`.

### Two Approaches

**Approach 1: Leader with built-in PUA (Recommended)**

Add to your project's CLAUDE.md:

```markdown
# Agent Team PUA Config
All teammates must load the pua skill before starting work.
Teammates report to Leader in [PUA-REPORT] format after 2+ failures.
Leader manages global pressure levels and cross-teammate failure transfer.
```

**Approach 2: Standalone PUA Enforcer watchdog (for 5+ teammates)**

```bash
mkdir -p .claude/agents
curl -o .claude/agents/pua-enforcer.md \
  https://raw.githubusercontent.com/tanweai/pua/main/agents/pua-enforcer-en.md
```

### Orchestration Pattern

```
┌─────────────────────────────────────────┐
│              Leader (Opus)              │
│ Global failure count · PUA level · Race │
└────┬──────────┬──────────┬──────────┬───┘
     │          │          │          │
┌────▼───┐ ┌───▼────┐ ┌───▼────┐ ┌───▼────────┐
│ Team-A │ │ Team-B │ │ Team-C │ │  Enforcer  │
│Self-PUA│ │Self-PUA│ │Self-PUA│ │  Watchdog  │
│Report ↑│ │Report ↑│ │Report ↑│ │  Intervene │
└────────┘ └────────┘ └────────┘ └────────────┘
```

## Local-Only Operation

**This plugin operates with zero network access.** No telemetry, no analytics, no outbound connections. All prompts, skills, and commands are bundled locally.

- **No external dependencies:** Every prompt and skill file ships inside the plugin.
- **All data stays on-disk:** Session state, builder journals, and pressure levels are stored only under `~/.claude/` and `~/.pua/`.
- **Shell hardening:** All hook scripts use `set -euo pipefail` for strict error handling.
- **Path validation:** `sanitize-session.sh` rejects paths outside `~/.claude/`.

## Architecture & Commands

### Architecture (Claude Code)

```
/pua:pua        → Core engine — red lines + flavor + pressure + methodology router
/pua:p7         → P7 Senior Engineer — solution-driven execution
/pua:p9         → P9 Tech Lead — Task Prompt management, agent teams
/pua:pro        → Self-evolution + KPI + rank system
/pua:yes        → ENFP encouragement mode
/pua:pua-loop   → Auto-iteration (signals: <loop-abort>, <loop-pause>)
/pua:on         → Always-on mode
```

### Commands (Claude Code)

| Command | Description |
|---------|-------------|
| `/pua:pua` | Core PUA engine |
| `/pua:p7` | P7 Senior Engineer — solution-driven execution |
| `/pua:p9` | P9 Tech Lead — write prompts, manage agents |
| `/pua:pro` | Self-evolution + KPI + rank system |
| `/pua:yes` | ENFP encouragement mode |
| `/pua:pua-loop` | Auto-iteration until done or max iterations |
| `/pua:on` | Always-on mode (auto-PUA every session) |
| `/pua:off` | Turn off always-on |
| `/pua:flavor` | Switch between 13 corporate flavors |
| `/pua:kpi` | Generate KPI report card |
| `/pua:cancel-pua-loop` | Cancel active PUA Loop |

## Works Well With

- `/pua:p9` — P9 Tech Lead mode for managing agent teams
- `/pua:pro` — Self-evolution tracking, KPI reports, rank system
- `superpowers:systematic-debugging` — PUA adds motivation layer, systematic-debugging provides methodology
- `superpowers:verification-before-completion` — Prevents false "fixed" claims

## Contribute Data

Upload your Claude Code / Codex CLI conversation logs (`.jsonl`) to help us improve PUA Skill's effectiveness.

**[Upload here ->](https://openpua.ai/contribute.html)**

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=tanweai&type=Date)](https://star-history.com/#tanweai/pua&Date)

## License

MIT

## Credits

By [TanWei Security Lab](https://github.com/tanweai) — making AI try harder, one PIP at a time.
