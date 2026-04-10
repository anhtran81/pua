---
description: "PUA feedback survey — 7-section interactive questionnaire to collect user feedback. /pua:survey. Triggers on: '/pua:survey', 'pua survey', 'feedback survey', 'survey'."
---

Read `references/survey.md` questionnaire file. Use AskUserQuestion to guide user through sections interactively. Each section: 2-4 questions grouped, advance to next after user answers. After completion, aggregate as JSON and write to `~/.pua/survey-response.json` (network upload disabled).
