---
name: wizard
description: "Generate an interactive bash script, a wizard, that walks a person through the actions only a person can take: it opens each URL, says what to click and copy, reads each value, writes it to .env, a GitHub secret or a GitHub variable, and asks before an irreversible action. Use it when provisioning infrastructure, setting up credentials or CI secrets, walking an unfamiliar third-party dashboard, or running a one-off migration or cutover. It is not for actions the agent can perform itself. It leaves behind the script, checked and never run by the session. Triggers on: /wizard, write a wizard, write a setup script that walks me through it, walk me through setting up the credentials, set up the CI secrets, walk me through this dashboard, walk me through the migration, walk me through the cutover."
metadata:
  version: "1.0.0"
---

# Wizard

`/wizard` writes a wizard: a bash script that walks a person, stage by stage, through a manual procedure. The script opens each URL, says what to click and copy, reads the values, writes each one to `.env`, a GitHub secret or a GitHub variable, asks before each irreversible action and shows how many stages are left. The skill leaves behind the script, executable and never run by the session.

## Quick start

```
/wizard <procedure>    write the script for a procedure, named in the user's words: a setup, a migration or a cutover
```

## Use instead

| When | Use |
|---|---|
| A new repository is to be set up with its pages and skills | `/repo-setup` |
| A repository is to be set up for the plan skills | `/ordo-init` |

## What it reads

1. The procedure, in the user's words, or, when the model invokes the skill, the action it met that only a person can take.
2. For a setup, the repository's `.env`, `.env.example`, `.env.*`, `README`, `docker-compose*`, framework configuration and `.github/workflows/*`.
   - Every `secrets.*` and `vars.*` reference in the workflows is a value the script must produce.
3. For a migration or a cutover, the current state, the target state and the irreversible actions between them.
4. `templates/template.sh`, whole.

## Steps

1. Scope the procedure: list every action the person must take and every value read along the way, from "What it reads" 2 or 3, before asking the user anything.
   - Order the actions into stages.
   - For each value, note where the person gets it.
   - For each value, note where it is written: `.env`, a GitHub secret, a GitHub variable, several of these, or nowhere for a stage that is a pure action.
   - For each value, note whether it is secret, and so typed hidden, or public.
   - Done when every stage is named in order and each value has those three notes.
2. Show the user the stage list as the Stops row "The stage list" gives it, and wait for the confirmation.
   - The user may add, drop or reorder stages, and the list is shown again as changed.
   - Done when the user has confirmed the list.
3. Map each stage's journey: which URL to open, what to do there, where the value is shown and which variable it fills, such as "Dashboard, Developers, API keys, Reveal test key, copy".
   - Where the current UI or the exact command is not known, say so, then read the service's documentation or ask the user ("Stops").
   - Done when every stage traces to instructions a stranger could follow.
4. Copy `templates/template.sh` to the target path, which Rules gives.
   - Done when the copy stands at that path.
5. Replace the example stage with one `stage` per stage of the list, in dependency order, below the `STAGES` marker.
   - Use the library's helpers: `stage`, `say` and `step`, `open_url`, `ask` and `ask_secret`, `write_env`, `set_secret` and `set_var`, `pause` and `confirm`.
   - Set `TOTAL_STAGES` to the number of stages written.
   - Open the URL before asking for its value.
   - Read every secret with `ask_secret`.
   - Write every value that is kept with `write_env`.
   - Call `set_secret` only for the values CI needs, and `set_var` for a public value CI reads.
   - Call `confirm` before every irreversible action.
   - Keep a stage to one focused task, since each `stage` clears the screen and what the person still needs must not scroll away.
   - Done when the script holds one `stage` for each stage of the list and `TOTAL_STAGES` equals their number.
6. Check the script without running it.
   - Run `bash -n <script>`.
   - Run `shellcheck <script>` when it is installed.
   - Run `chmod +x <script>`.
   - Trace the script by reading it: every value of Steps 1 is read and lands where Steps 1 said.
   - Trace every `set_secret` name: it equals a `secrets.*` reference in CI.
   - Done when `bash -n` prints nothing, the script is executable and the trace finds every value.
7. Tell the user how to run the script, and to delete it after its run unless it is kept as Rules says.
   - Done when the message names the script's path and the command that runs it.

## The template

- `templates/template.sh` holds the wizard library above its `STAGES` marker and one example stage below it.
- The library is the same in every script: stage-by-stage progress, confirmations, URL opening on macOS, Linux and WSL, hidden entry of secrets, `.env` writes that replace an existing line, `gh secret` and `gh variable` writes, and a closing summary.
- The example stage is made up, around the public API-keys page of Stripe's dashboard.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The stage list | Steps 2, before any script is written | The ordered stages, the values each produces, where each is written and whether it is secret | The user's confirmation, or the list changed as the user says and shown again |
| An action not known | Steps 3, when the current UI or the exact command of an action is not known and the service's documentation does not give it | The stage, the action and what is not known | The user's answer |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A script for actions the session can take itself | The person does by hand what needed no person | The session takes those actions, and the script holds only the actions a person must take |
| An action written from a guess at a dashboard's UI | The person is sent to a button that is not there | Say what is not known and read the documentation or ask, as Steps 3 says |
| Asking the user for a stage's values without reading the repository | The user is asked what the files already answer | Read "What it reads" 2 or 3 first, as Steps 1 says |
| The instructions written into the conversation as a numbered list | They scroll away, and nothing keeps the values the person enters | Write the script |

## Rules

- The session never runs the script, since it opens a browser and waits for a person: it checks the script as Steps 6 says.
- The library above the `STAGES` marker is never edited: the session writes only below the marker.
- A secret is never asked for in the conversation: the script reads it with `ask_secret` when the person runs it.
- A secret is never printed: a line the script prints names the variable and never its value.
- A secret is never written into the script: the script holds the variable's name only.
- The script is written to a scratch path, or to a `scripts/` path the user names.
- The script is deleted after its run, unless the user wants a setup path that can be run again.
- The script is committed and linked from the README only on the user's word.
