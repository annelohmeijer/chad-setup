---
name: "mechanism"
description: "Capture the mechanism behind a bug, incident or surprise as a note in the second brain. Use after a debugging session, or when Anne says 'note the mechanism' / '/mechanism'."
argument-hint: "[optional topic hint]"
---

# mechanism skill

Turn a debugging session into a fundamentals note. The point is that Anne can
explain *why* it broke, not that the fix landed.

## Steps

1. Reconstruct from the session: symptom → what was actually wrong → how we proved it.
2. Name the layer. Be specific, not "the network":
   `DNS | TCP | TLS | HTTP/WS | app | db | filesystem | scheduler | infra`
3. Write the note to
   `~/Documents/Second Brain/professional/3-resources/<area>/<slug>.md`
   where `<area>` is `platform-engineering` (networking, infra, containers, CI)
   or `software-engineering` (data structures, concurrency, db internals, patterns).
4. Print the path as a link when done.

## Note template

```markdown
# <symptom in one line>

date: <YYYY-MM-DD>
layer: <layer>
tags: #<area> #<subtopic>

## Symptom
<what Anne observed>

## Mechanism
<why it happened. Name the actual primitive: TCP keepalive, B-tree index,
connection pool exhaustion, LRU eviction, SIGTERM handling, ...>

## How we proved it
```bash
<the exact commands, with the output line that was decisive>
```

## What to check first next time
<one sentence — the fastest discriminating command>

## Rabbit hole
<optional: the RFC section, man page or DDIA chapter that covers this>
```

## Rules

- Keep it under 30 lines. A note nobody rereads is worse than no note.
- No note if the mechanism is still a guess — say so instead and stop.
- Reuse an existing note if one covers the same mechanism; append a dated case to it.
