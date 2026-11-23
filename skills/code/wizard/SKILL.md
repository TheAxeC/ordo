---
name: wizard
description: "Generate an interactive bash script, a wizard, that walks a person through a setup or another procedure: it opens each URL, says what to click and copy, reads each value, writes it to .env, a GitHub secret or a GitHub variable, runs the commands a stage needs, each shown and confirmed first, and asks before an irreversible action. Use it when installing a tool or a project's dependencies, provisioning infrastructure, setting up credentials or CI secrets, walking an unfamiliar third-party dashboard, or running a one-off migration or cutover. It is not for an action the session can take itself, now, on the machine it runs on. It leaves behind the script, checked and never run by the session. Triggers on: /wizard, write a wizard, write a setup script that walks me through it, walk me through installing the dependencies, walk me through setting up the credentials, set up the CI secrets, walk me through this dashboard, walk me through the migration, walk me through the cutover."
metadata:
  version: "1.0.0"
---

# Wizard

`/wizard` writes a wizard: a bash script that walks a person, stage by stage, through a setup, a migration or a cutover. The script opens each URL, says what to click and copy, reads the values, writes each one to `.env`, a GitHub secret or a GitHub variable, runs the commands a stage needs, each shown and confirmed first, asks before each irreversible action and shows how many stages are left. The skill leaves behind the script, executable and never run by the session.

## Quick start

```
/wizard <procedure>    write the script for a procedure, named in the user's words: a setup, a migration or a cutover, with the commands its stages run, each shown and confirmed first
```

## Use instead

| When | Use |
|---|---|
| A new repository is to be set up with its pages and skills | `/repo-setup` |
| A repository is to be set up for the plan skills | `/ordo-init` |

## What it reads

1. The procedure, in the user's words, or, when the model invokes the skill, the action or the command it met that Rules leaves to the skill.
2. For a setup, the repository's `.env`, `.env.example`, `.env.*`, `README`, `docker-compose*`, framework configuration and `.github/workflows/*`.
   - Every `secrets.*` and `vars.*` reference in the workflows is a value the script must produce.
   - The commands of a setup come from the repository's build files, its `README`'s install instructions and a setup script it already has.
3. For a migration or a cutover, the current state, the target state and the irreversible actions between them.
4. `templates/template.sh`, whole.

## Steps

1. Scope the procedure: list every action the person must take, every command a stage runs and every value read along the way, from "What it reads" 2 or 3, before asking the user anything.
   - Order the actions into stages.
   - For each value, note where the person gets it.
   - For each value, note where it is written: `.env`, a GitHub secret, a GitHub variable, several of these, or nowhere for a stage that is a pure action.
   - For each value, note whether it is secret, and so typed hidden, or public.
   - For each command, note the tool it installs or the state it reaches.
   - For each command, note the check that shows its stage is already done, so that a second run skips it: `have` for a tool, or a bash test that reads and changes nothing, such as `[[ -d <folder> ]]`.
   - For each command, note the operating systems it holds for.
   - Done when every stage is named in order, each value has its three notes and each command has its three.
2. Show the user the stage list as the Stops row "The stage list" gives it, and wait for the confirmation.
   - The user may add, drop or reorder stages, and the list is shown again as changed.
   - Done when the user has confirmed the list.
3. Map each stage's journey: which URL to open, what to do there, where the value is shown and which variable it fills, such as "Dashboard, Developers, API keys, Reveal test key, copy".
   - Where the current UI or the exact command is not known, say so, then read the service's documentation or ask the user ("Stops").
   - Where a command is not known for an operating system it must hold for, say so, then read the tool's documentation or ask the user, at the same stop.
   - Done when every stage traces to instructions a stranger could follow.
4. Copy `templates/template.sh` to the target path, which Rules gives.
   - Done when the copy stands at that path.
5. Replace the example stage with one `stage` per stage of the list, in dependency order, below the `STAGES` marker.
   - Use the library's helpers: `stage`, `say` and `step`, `open_url`, `ask` and `ask_secret`, `write_env`, `set_secret` and `set_var`, `pause` and `confirm`, `have`, `run_cmd` and `WIZARD_OS`.
   - Set `TOTAL_STAGES` to the number of stages written.
   - Open the URL before asking for its value.
   - Read every secret with `ask_secret`.
   - Write every value that is kept with `write_env`.
   - Call `set_secret` only for the values CI needs, and `set_var` for a public value CI reads.
   - Call `confirm` before every irreversible action.
   - Write one `run_cmd` per command.
   - Skip a stage that is already done by its check, which stands in the condition of an `if` and is not a command of the stage.
   - Choose a command that differs by operating system by `WIZARD_OS`.
   - Give an operating system the stage list does not cover a `warn` that names it.
   - Keep the expansion of a secret's variable off the `run_cmd` line, where bash replaces it by the value before the line is printed: the command reads the variable from its environment, which the stage exports after `ask_secret`, or asks for the secret itself.
   - Keep a stage to one focused task, since each `stage` clears the screen and what the person still needs must not scroll away.
   - Done when the script holds one `stage` for each stage of the list and `TOTAL_STAGES` equals their number.
6. Check the script without running it.
   - Run `bash -n <script>`.
   - Run `shellcheck <script>` when it is installed.
   - Run `chmod +x <script>`.
   - Trace the script by reading it: every value of Steps 1 is read and lands where Steps 1 said.
   - Trace every command of Steps 1: it stands behind a `run_cmd`.
   - Trace every `set_secret` name: it equals a `secrets.*` reference in CI.
   - Done when `bash -n` prints nothing, the script is executable and the trace finds every value and every command.
7. Tell the user how to run the script, and to delete it after its run unless it is kept as Rules says.
   - Done when the message names the script's path and the command that runs it.

## The template

- `templates/template.sh` holds the wizard library above its `STAGES` marker and one example stage below it.
- The library is the same in every script: stage-by-stage progress, confirmations, URL opening on macOS, Linux and WSL, hidden entry of secrets, `.env` writes that replace an existing line, `gh secret` and `gh variable` writes, the check whether a tool is installed (`have`), the run of one command once the person has seen it and answered yes (`run_cmd`), the operating system the script runs on (`WIZARD_OS`), and a closing summary.
- The example stage is made up, around the public API-keys page of Stripe's dashboard.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The stage list | Steps 2, before any script is written | The ordered stages, the values each produces, where each is written and whether it is secret, and each stage's commands with the operating systems they hold for | The user's confirmation, or the list changed as the user says and shown again |
| An action not known | Steps 3, when the current UI or the exact command of an action, or a command for an operating system, is not known and the documentation does not give it | The stage, the action or the command and what is not known | The user's answer |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A script for an action Rules leaves to the session | The person does by hand what needed no person | The session takes that action, and the script holds the actions a person must take and the commands Rules leaves to the skill |
| An action written from a guess at a dashboard's UI | The person is sent to a button that is not there | Say what is not known and read the documentation or ask, as Steps 3 says |
| Asking the user for a stage's values without reading the repository | The user is asked what the files already answer | Read "What it reads" 2 or 3 first, as Steps 1 says |
| The instructions written into the conversation as a numbered list | They scroll away, and nothing keeps the values the person enters | Write the script |

## Rules

- The session never runs the script, since it opens a browser, runs commands on the person's machine and waits for a person: it checks the script as Steps 6 says.
- No command runs without being shown to the person and confirmed with a yes: every command of a stage goes through `run_cmd`.
- The skill is not for an action the session can take itself, now, on the machine it runs on.
- The library above the `STAGES` marker is never edited: the session writes only below the marker.
- A secret is never asked for in the conversation: the script reads it with `ask_secret` when the person runs it.
- A secret is never printed: a line the script prints names the variable and never its value.
- A secret is never written into the script: the script holds the variable's name only.
- The script is written to a scratch path, or to a `scripts/` path the user names.
- The script is deleted after its run, unless the user wants a setup path that can be run again.
- The script is committed and linked from the README only on the user's word.
