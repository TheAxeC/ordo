---
name: wait-what
description: "Explain again a message that did not land: the user types it when the last message was not understood, and the session re-pitches it in the conversation. It writes no file. Triggers on: /wait-what, wait what."
metadata:
  version: "1.0.0"
disable-model-invocation: true
---

# Wait, what

`/wait-what` is what the user types when a message did not land. The session answers in the conversation and leaves no file behind.

## Quick start

```
/wait-what    the last message did not land: explain it again
```

## Use instead

| When | Use |
|---|---|
| Where a plan stands and which command comes next | `/ordo-help <entry>` |

## What it reads

1. The conversation so far.
2. The glossary: the `glossary.md` that the `standards` list of the repository's `plan.yaml` names.
   - With no glossary the skill still runs, without the glossary's terms, and that is no refusal.

## Steps

1. Answer what the user says by typing the skill: "Wait, I don't understand where you've got to here. Re-pitch that: give me a little bit of context, talk in ASD-STE100 Simplified Technical English, and use the terms of the glossary."
   - Done when the answer stands in the conversation.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| No stop | The skill never stops | Nothing | Nothing |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Refusing when the repository has no glossary | The user still has not followed the message | Answer without the glossary's terms, as "What it reads" 2 says |

## Rules

- The skill writes no file.
- The skill starts no agent.
- The skill asks the user nothing.
