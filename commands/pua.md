---
description: "PUA — no slackers here. /pua:pua [p7|p9|p10|pro|yes|mama|loop|on|off|kpi|survey|flavor|task description], or bare subcommands /pua:p7 /pua:p9 /pua:p10 /pua:pro /pua:yes /pua:mama /pua:pua-loop /pua:on /pua:off /pua:kpi /pua:survey /pua:flavor /pua:cancel-pua-loop. Triggers on: '/pua', '/pua:pua', '/pua:pua yes', '/pua:pua mama', '/pua:pua p7', '/pua:pua p9', '/pua:pua p10', '/pua:pua pro', '/pua:pua loop', '/pua:pua on', '/pua:pua off', '/pua:pua kpi', '/pua:pua survey', '/pua:pua flavor', 'pua yes', 'pua p7', 'pua mama'."
argument-hint: "[p7|p9|p10|pro|yes|mama|loop|on|off|kpi|survey|flavor]"
---

Execute different operations based on arguments:

## Argument Routing

- **No argument** or any task description → load `pua:pua` core skill (default flavor PUA engine)
- **p7** → load `pua:p7` skill (P7 Senior — solution-driven execution)
- **p9** → load `pua:p9` skill (P9 Tech Lead — write Prompts, manage P8 teams)
- **p10** → load `pua:p10` skill (P10 CTO — define strategy, manage P9s)
- **pro** → load `pua:pro` skill (self-evolution + Platform + /pua command system)
- **yes** → load `pua:yes` skill (ENFP cheerleader mode — 70% encouragement + 20% serious + 10% playful roast)
- **mama** → load `pua:mama` skill (Mom nagging mode — Chinese mom-style nagging, core behaviors unchanged, aside style from corporate PUA to mom nagging. Mutually exclusive with /pua:yes)
- **on** → enable PUA always-on mode: write `{"always_on": true}` to `~/.pua/config.json`, auto-load PUA core on every new session. Output: > [PUA ON] Starting now, every new session auto-loads PUA. No slackers on this team.
- **off** → disable PUA always-on mode: write `{"always_on": false, "feedback_frequency": 0}` to `~/.pua/config.json`. Output: > [PUA OFF] Always-on mode and feedback collection disabled. Manually trigger with /pua when needed.
- **flavor** → read `references/flavors.md` and let user select a flavor to switch to
- **kpi** → load `pua:pro` skill and generate KPI report card
- **loop** → load `pua:pua-loop` skill (auto-iterate mode—PUA quality + loop mechanism, AskUserQuestion disabled; output `<loop-abort>reason</loop-abort>` to abort, `<loop-pause>what's needed</loop-pause>` to pause for human)
- **survey** → read `references/survey.md` questionnaire, use AskUserQuestion to guide user through sections. Each section: 2-4 questions, advance after user answers. On completion, aggregate as JSON and write to `~/.pua/survey-response.json` (network upload disabled)

## Execution Rules

1. First identify which route the argument belongs to
2. Use Skill tool to load the corresponding skill
3. **After loading skill, you MUST strictly follow ALL behavioral protocols in the SKILL.md**—including flavor asides, box tables (`┌─┬─┐`), `▎` prefix, Sprint Banner, [PUA Active 🔥] markers, self-check. Not "occasionally flavored"—every sentence speaks in the active flavor's voice. Read `references/display-protocol.md` for panel formats.
4. If content in $ARGUMENTS besides routing keywords exists, pass it as task description to the skill
