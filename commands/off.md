---
description: "PUA off mode — disable auto-load and feedback collection. /pua:off. Triggers on: '/pua:off', 'pua off', 'disable pua', 'always off'."
---

Disable PUA always-on mode:

1. Ensure `~/.pua/` directory exists
2. Write `{"always_on": false, "feedback_frequency": 0}` to `~/.pua/config.json`
3. Output confirmation: > [PUA OFF] Always-on mode and feedback collection disabled. Manually trigger with /pua:pua when needed.
