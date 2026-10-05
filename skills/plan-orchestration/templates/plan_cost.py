#!/usr/bin/env python3
"""Price the usage of each agent role of a plan from the response bodies Claude Code keeps and the agents' transcripts.

Usage: python3 plan_cost.py <ledger folder> [<transcript root>]

<ledger folder> is a plan's ledger folder, open or archived, absolute or relative. <transcript root> defaults to $HOME/.claude/projects.

The inputs read, and nothing else:
    prices.txt in this script's own folder, found from the script's resolved path whatever the working folder, and printed as an absolute path. Its first line is a # comment naming the page the prices were copied from. A blank line and a # line after the first are passed over. Every other line is a row of six fields separated by spaces: a model id, then its input, 5-minute cache write, 1-hour cache write, cache read and output price in US dollars per million tokens. A price is digits with an optional fractional part. A model id is listed once.
    <ledger folder>/plan.md. Its first line is `# Plan: <entry>`, which gives the name printed. Its agents are the bullets of its `## Agents` section, from that heading to the next `## ` heading, and no other line of it is read.
    <ledger folder>/agents/agent-roles.md, when it exists: its agents are the bullets anywhere in the file.
    The transcript of each agent: the one file named exactly agent-<agent id>.jsonl anywhere under <transcript root>. A main session file is never read.
    The response body of a response, from the folder named by OTEL_LOG_RAW_API_BODIES: its file <folder>/<requestId>.response.json, when it exists. Claude Code writes these files, for the main session and every subagent, when it runs with CLAUDE_CODE_ENABLE_TELEMETRY=1 and OTEL_LOG_RAW_API_BODIES=file:<folder>. A value that does not start with file: (or an empty value, or no value) names no folder. The folder is a path as given, a relative one from the working folder. Its index.jsonl and its <uuid>.request.json files are never read.
    The value of OTEL_LOG_RAW_API_BODIES comes from the script's environment when the environment holds the variable, even empty. Otherwise it comes from the key env.OTEL_LOG_RAW_API_BODIES of Claude Code's settings files, from the first of these that sets it: <repository>/.claude/settings.local.json, <repository>/.claude/settings.json and $HOME/.claude/settings.json. The repository is the nearest folder, from the working folder upwards, that holds a .git entry; with none, only the last file is read. A settings file that does not exist is passed over, and the files after the one that sets the key are not read. Claude Code passes its settings' CLAUDE_CODE_ENABLE_TELEMETRY to a tool's shell and leaves OTEL_LOG_RAW_API_BODIES out, so a run from a Claude Code tool finds the folder in the settings files.

An agent is a bullet `- <agent id>: <role>, <served model>`. A line that is not a bullet (a paragraph, a blank line, a heading) is passed over. A line that starts, after any spaces, with `-`, `*` or `+` and then a space or the end of the line is a bullet, and a bullet that is not of that form, after its leading spaces, is an error. The served model is not used: each response is priced at the model its own entry names.

The role kinds, in this order: builder (`builder of step <n>`), brief check (`brief check of step <n>`), reviewer (`reviewer of step <n>`), reviewer over a round (`reviewer of step <n> over round <r>`), grill lookup (`grill lookup`). A step is a number with an optional lower-case letter, such as 6b, and a round is a number. Any other role text is an error.

A response is a transcript line that is a JSON object with "type":"assistant" and a message.usage. A response written as several entries has the same message.id and requestId in each, and is counted once. Its five counts and its model come from its response body when the body folder holds <requestId>.response.json, and otherwise from its last entry in the file. The transcript can record a response's output count before the response ended, so a response priced from its transcript is a lower bound: it is a response without a body, and the cost of every row that holds one is written with >= in front. Per entry, the first of these checks that fails is its one error, and the entries after it are still read:
    1. usage is an object, and input_tokens, cache_creation_input_tokens, cache_read_input_tokens and output_tokens are each whole numbers of 0 or more, as are cache_creation.ephemeral_5m_input_tokens and cache_creation.ephemeral_1h_input_tokens.
    2. cache_creation_input_tokens equals the sum of the two cache writes, and is 0 when the usage has no cache_creation, absent or null.
    3. An entry whose input, 5-minute write, 1-hour write, cache read and output counts are all 0 is passed over; the runner writes such an entry, with the model <synthetic>, for a failed request.
    4. requestId is a string of letters, digits, - and _ only, so it never reaches a path as a pattern.
    5. usage.speed is absent, null or standard, usage.inference_geo is not us, usage.service_tier is absent, null or standard, and usage.server_tool_use, when set, is an object with no web_search_requests above 0, since prices.txt holds no price for those.
A response body is read only for a response whose transcript entry passed these checks. It is a JSON object whose id is the message.id of the transcript entry and whose usage goes through checks 1, 2 and 5 in that order, with the same error texts, naming the body's path where a transcript error names its file and line. Its model is the model of the response.
The price of a response is each of its five counts times its column of the row for its model, divided by 1,000,000, computed with decimal.Decimal from the table's text so no rounding enters.

The output, on success, is written for a person to read:
    Plan <entry>: priced usage of its agents
    Prices from <the table's path>:
    the table's first comment line without its `# `
    Response bodies from <the body folder as given>.   (or, with no body folder, "Response bodies: none, so every cost is a lower bound.")
    a blank line, then a table with one row per role kind that has agents, in the order above, with the columns Role, Agents, No body, Input, Cache write 5m, Cache write 1h, Cache read, Output and Cost (USD), then a row Total
    a blank line, then a table with one row per agent, with the columns Agent, Role, Model, No body, the five counts and Cost (USD), ordered by role kind, then step number as a number and then its letter, then round as a number, then agent id
No body is the number of the row's responses priced from the transcript, and the Total row holds the sum. A Cost cell of a row whose No body is above 0 is written >= and then the cost, as >=1.87. Counts are whole numbers with no separators. Model lists each model of the agent's responses, comma-separated, in the order first met, and is - for an agent with no counted response, whose counts are 0 and cost 0.00. A cost has two decimals, rounded half up from the exact sum; the Total row is rounded from the exact total, not summed from rounded rows. Each column is padded with spaces so it lines up.

The script reads every input before it prints anything. Each error is one line `error: <what>` on stderr, and stdout stays empty. An error names its file and line where it has them. The errors of the run, exit 1:
    error: cannot read <path>: <reason>   (the table, plan.md, agent-roles.md, a transcript or a body; the reason is the system's text)
    error: <table>:<line>: a row is not a model id and five prices
    error: <table>:<line>: model <model> is listed twice, first on line <n>
    error: <plan.md>:1: the first line is not "# Plan: <entry>"
    error: cannot read <settings file>: <reason>   (as above, naming a Claude Code settings file)
    error: <settings file>: not a JSON object
    error: <settings file>: env.OTEL_LOG_RAW_API_BODIES is not a string
    error: OTEL_LOG_RAW_API_BODIES names <folder>, which is not a folder
    error: <file>:<line>: the bullet is not of the form "- <agent id>: <role>, <served model>"
    error: agent <id> has an unknown role: <role>
    error: agent <id> is listed twice: <file>:<line> and <file>:<line>
    error: the ledger names no agent   (no bullet in plan.md's Agents section or in agent-roles.md)
    error: no transcript of agent <id> under <transcript root>
    error: agent <id> has <n> transcripts: <path>, <path>
    error: <transcript>:<line>: not a JSON object
    error: <transcript>:<line>: usage is not an object
    error: <transcript>:<line>: <field> is missing
    error: <transcript>:<line>: <field> is not a whole number of 0 or more: <value>
    error: <transcript>:<line>: usage.cache_creation_input_tokens is <n> and usage has no cache_creation
    error: <transcript>:<line>: usage.cache_creation_input_tokens is <n>, but the two cache writes sum to <m>
    error: <transcript>:<line>: invalid requestId '<id>'
    error: <transcript>:<line>: <field> is <value>, which the table does not price
    error: <body>: not a JSON object
    error: <body>: id <body id> is not the transcript's message.id <id>
    error: <body>: <the error of check 1, 2 or 5 above, without its <transcript>:<line>:>
    error: model <model> of agent <id> is not in <the table's path>   (one line per model and agent, whatever the number of responses that carry it, from a body or a transcript)
A table with an error prices nothing, so the model lines are left out of that run.

The usage errors, each followed by the line `usage: python3 plan_cost.py <ledger folder> [<transcript root>]`, exit 2:
    error: expected <ledger folder> and, optionally, <transcript root>   (no argument, or more than two)
    error: not a folder: <path>   (the ledger folder or the transcript root)
    error: no plan.md in <ledger folder>

Exit statuses: 0 the output printed, 1 at least one error of the run, 2 a usage error.

Standard library only; runs on Python 3.9 and newer.
"""

from __future__ import annotations

import decimal
import json
import os
import re
import sys
from decimal import Decimal
from typing import Any, NamedTuple

_USAGE = "usage: python3 plan_cost.py <ledger folder> [<transcript root>]"
_ARGUMENTS_ERROR = "expected <ledger folder> and, optionally, <transcript root>"
_FORM_ERROR = 'the bullet is not of the form "- <agent id>: <role>, <served model>"'
_TABLE = os.path.join(os.path.dirname(os.path.realpath(__file__)), "prices.txt")
_REQUEST_ID = re.compile(r"[A-Za-z0-9_-]+")
_BODIES = "OTEL_LOG_RAW_API_BODIES"
_PLAN_LINE = re.compile(r"# Plan: +(\S.*)")
_BULLET = re.compile(r" *[-*+](?: |$)")
_AGENT_BULLET = re.compile(r"- ([^:]*): (.+), ([^,]+)")
_PRICE = re.compile(r"[0-9]+(?:\.[0-9]+)?")
_KINDS = ("builder", "brief check", "reviewer", "reviewer over a round", "grill lookup")
_ROLES = (
    re.compile(r"builder of step ([0-9]+)([a-z]?)"),
    re.compile(r"brief check of step ([0-9]+)([a-z]?)"),
    re.compile(r"reviewer of step ([0-9]+)([a-z]?)"),
    re.compile(r"reviewer of step ([0-9]+)([a-z]?) over round ([0-9]+)"),
    re.compile(r"grill lookup"),
)
_COLUMNS = ("Input", "Cache write 5m", "Cache write 1h", "Cache read", "Output")
_EXACT = decimal.Context(prec=100)
_MILLION = Decimal(1000000)
_CENT = Decimal("0.01")


class _Problem(Exception):
    """A defect of one transcript entry, whose text is the error."""


class _Agent(NamedTuple):
    agent_id: str
    role: str
    kind: int
    step: int
    letter: str
    round: int
    where: str


class _Response(NamedTuple):
    model: str
    counts: list[int]
    from_body: bool


class _Result(NamedTuple):
    agent: _Agent
    models: list[str]
    counts: list[int]
    cost: Decimal
    without_body: int


def _read_lines(path: str, errors: list[str]) -> list[str] | None:
    """The lines of a UTF-8 text file, or None after adding the reason to errors."""
    try:
        with open(path, encoding="utf-8") as handle:
            lines = handle.read().split("\n")
    except (OSError, UnicodeDecodeError) as exc:
        errors.append(f"cannot read {path}: {getattr(exc, 'strerror', None) or exc}")
        return None
    if lines[-1] == "":
        lines.pop()
    return lines


def _read_table(errors: list[str]) -> tuple[dict[str, tuple[Decimal, ...]] | None, str]:
    """The prices by model and the first comment line, or None for the prices after errors."""
    lines = _read_lines(_TABLE, errors)
    if lines is None:
        return None, ""
    problems = len(errors)
    prices: dict[str, tuple[Decimal, ...]] = {}
    listed: dict[str, int] = {}
    for number, line in enumerate(lines[1:], 2):
        if line.startswith("#") or not line.strip():
            continue
        fields = line.split()
        if len(fields) != 6 or any(_PRICE.fullmatch(price) is None for price in fields[1:]):
            errors.append(f"{_TABLE}:{number}: a row is not a model id and five prices")
        elif fields[0] in listed:
            errors.append(
                f"{_TABLE}:{number}: model {fields[0]} is listed twice, first on line {listed[fields[0]]}"
            )
        else:
            listed[fields[0]] = number
            prices[fields[0]] = tuple(Decimal(price) for price in fields[1:])
    if len(errors) > problems:
        return None, ""
    return prices, lines[0][1:].strip()


def _role_parts(role: str) -> tuple[int, int, str, int] | None:
    """The role kind, step number, step letter and round of a role text, or None."""
    for kind, pattern in enumerate(_ROLES):
        match = pattern.fullmatch(role)
        if match is not None:
            groups = match.groups()
            step = int(groups[0]) if groups else 0
            letter = groups[1] if groups else ""
            number = int(groups[2]) if len(groups) > 2 else 0
            return kind, step, letter, number
    return None


def _read_bullets(
    path: str, numbered: list[tuple[int, str]], agents: dict[str, _Agent], errors: list[str]
) -> int:
    """Add the agents of the bullets among the numbered lines; return the number of bullets."""
    bullets = 0
    for number, line in numbered:
        if _BULLET.match(line) is None:
            continue
        bullets += 1
        where = f"{path}:{number}"
        match = _AGENT_BULLET.fullmatch(line.lstrip(" "))
        if match is None or not match.group(2).strip() or not match.group(3).strip():
            errors.append(f"{where}: {_FORM_ERROR}")
            continue
        agent_id, role = match.group(1), match.group(2).strip()
        parts = _role_parts(role)
        if parts is None:
            errors.append(f"agent {agent_id} has an unknown role: {role}")
        elif agent_id in agents:
            errors.append(f"agent {agent_id} is listed twice: {agents[agent_id].where} and {where}")
        else:
            agents[agent_id] = _Agent(agent_id, role, *parts, where)
    return bullets


def _agents_section(lines: list[str]) -> list[tuple[int, str]]:
    """The numbered lines from each `## Agents` heading to the next `## ` heading."""
    inside = False
    section = []
    for number, line in enumerate(lines, 1):
        if line.startswith("## "):
            inside = line.rstrip() == "## Agents"
        elif inside:
            section.append((number, line))
    return section


def _read_ledger(ledger: str, errors: list[str]) -> tuple[str, list[_Agent]]:
    """The plan's entry and its agents in print order, with the errors of the ledger added."""
    plan = os.path.join(ledger, "plan.md")
    roles = os.path.join(ledger, "agents", "agent-roles.md")
    agents: dict[str, _Agent] = {}
    entry = ""
    bullets = 0
    complete = True
    lines = _read_lines(plan, errors)
    if lines is None:
        complete = False
    else:
        match = _PLAN_LINE.fullmatch(lines[0].rstrip()) if lines else None
        if match is None:
            errors.append(f'{plan}:1: the first line is not "# Plan: <entry>"')
        else:
            entry = match.group(1)
        bullets += _read_bullets(plan, _agents_section(lines), agents, errors)
    if os.path.exists(roles):
        lines = _read_lines(roles, errors)
        if lines is None:
            complete = False
        else:
            bullets += _read_bullets(roles, list(enumerate(lines, 1)), agents, errors)
    if bullets == 0 and complete:
        errors.append("the ledger names no agent")
    ordered = sorted(
        agents.values(), key=lambda a: (a.kind, a.step, a.letter, a.round, a.agent_id)
    )
    return entry, ordered


def _find_transcripts(root: str) -> dict[str, list[str]]:
    """The paths of the files named agent-<agent id>.jsonl under the root, by agent id."""
    found: dict[str, list[str]] = {}

    for folder, names, files in os.walk(root):
        names.sort()
        for name in sorted(files):
            if name.startswith("agent-") and name.endswith(".jsonl"):
                found.setdefault(name[len("agent-") : -len(".jsonl")], []).append(
                    os.path.join(folder, name)
                )
    return found


def _count(container: dict[str, Any], key: str, name: str) -> int:
    """A count of a usage object: a whole number of 0 or more, or raise _Problem."""
    if key not in container:
        raise _Problem(f"{name} is missing")
    value = container[key]
    if type(value) is not int or value < 0:
        raise _Problem(f"{name} is not a whole number of 0 or more: {json.dumps(value)}")
    return value


def _not_priced(name: str, value: object) -> _Problem:
    return _Problem(f"{name} is {json.dumps(value)}, which the table does not price")


def _check_counts(usage: object) -> list[int]:
    """The input, 5-minute write, 1-hour write, cache read and output counts of a usage, or raise _Problem."""
    if not isinstance(usage, dict):
        raise _Problem("usage is not an object")
    input_tokens = _count(usage, "input_tokens", "usage.input_tokens")
    created = _count(usage, "cache_creation_input_tokens", "usage.cache_creation_input_tokens")
    read = _count(usage, "cache_read_input_tokens", "usage.cache_read_input_tokens")
    output = _count(usage, "output_tokens", "usage.output_tokens")
    writes = usage.get("cache_creation")
    if not isinstance(writes, dict):
        if created > 0:
            raise _Problem(
                f"usage.cache_creation_input_tokens is {created} and usage has no cache_creation"
            )
        write_5m = write_1h = 0
    else:
        prefix = "usage.cache_creation."
        write_5m = _count(writes, "ephemeral_5m_input_tokens", prefix + "ephemeral_5m_input_tokens")
        write_1h = _count(writes, "ephemeral_1h_input_tokens", prefix + "ephemeral_1h_input_tokens")
    if created != write_5m + write_1h:
        raise _Problem(
            f"usage.cache_creation_input_tokens is {created}, "
            f"but the two cache writes sum to {write_5m + write_1h}"
        )
    return [input_tokens, write_5m, write_1h, read, output]


def _check_priced(usage: dict[str, Any]) -> None:
    """Raise _Problem when a usage holds a speed, region, tier or tool the table does not price."""
    speed = usage.get("speed")
    if speed is not None and speed != "standard":
        raise _not_priced("usage.speed", speed)
    if usage.get("inference_geo") == "us":
        raise _not_priced("usage.inference_geo", "us")
    tier = usage.get("service_tier")
    if tier is not None and tier != "standard":
        raise _not_priced("usage.service_tier", tier)
    tool_use = usage.get("server_tool_use")
    if isinstance(tool_use, dict) and "web_search_requests" in tool_use:
        name = "usage.server_tool_use.web_search_requests"
        searches = _count(tool_use, "web_search_requests", name)
        if searches > 0:
            raise _not_priced(name, searches)


def _parse_response(
    entry: dict[str, Any], message: dict[str, Any]
) -> tuple[tuple[str, str], str, list[int]] | None:
    """The (message id, request id), model and five counts of a response; None for a zero entry."""
    usage = message["usage"]
    counts = _check_counts(usage)
    if not any(counts):
        return None
    request_id = entry.get("requestId")
    if not isinstance(request_id, str) or _REQUEST_ID.fullmatch(request_id) is None:
        raise _Problem(f"invalid requestId '{request_id}'")
    _check_priced(usage)
    return (message.get("id"), request_id), message.get("model"), counts


def _body_response(body: object, message_id: object) -> tuple[str, list[int]]:
    """The model and five counts of a response body, or raise _Problem."""
    if not isinstance(body, dict):
        raise _Problem("not a JSON object")
    usage = body.get("usage")
    counts = _check_counts(usage)
    if body.get("id") != message_id:
        raise _Problem(f"id {body.get('id')} is not the transcript's message.id {message_id}")
    _check_priced(usage)
    return body.get("model"), counts


def _read_body(path: str, message_id: object, errors: list[str]) -> tuple[str, list[int]] | None:
    """The model and counts of the response body at path, or None after adding its error."""
    try:
        with open(path, "rb") as handle:
            body = json.loads(handle.read().decode("utf-8"))
    except OSError as exc:
        errors.append(f"cannot read {path}: {exc.strerror or exc}")
        return None
    except (UnicodeDecodeError, ValueError):
        body = None
    try:
        return _body_response(body, message_id)
    except _Problem as problem:
        errors.append(f"{path}: {problem}")
        return None


def _read_transcript(path: str, bodies: str | None, errors: list[str]) -> list[_Response]:
    """Each response of a transcript, in the order first met, from its body in the body folder or its last entry."""
    responses: dict[tuple[str, str], tuple[str, list[int]]] = {}
    try:
        with open(path, "rb") as handle:
            for number, raw in enumerate(handle, 1):
                where = f"{path}:{number}"
                try:
                    entry = json.loads(raw.decode("utf-8"))
                except (UnicodeDecodeError, ValueError):
                    entry = None
                if not isinstance(entry, dict):
                    errors.append(f"{where}: not a JSON object")
                    continue
                message = entry.get("message")
                if entry.get("type") != "assistant" or not isinstance(message, dict):
                    continue
                if "usage" not in message:
                    continue
                try:
                    parsed = _parse_response(entry, message)
                except _Problem as problem:
                    errors.append(f"{where}: {problem}")
                    continue
                if parsed is not None:
                    responses[parsed[0]] = (parsed[1], parsed[2])
    except OSError as exc:
        errors.append(f"cannot read {path}: {exc.strerror or exc}")
    found = []
    for (message_id, request_id), (model, counts) in responses.items():
        body_path = os.path.join(bodies, request_id + ".response.json") if bodies else None
        if body_path is None or not os.path.lexists(body_path):
            found.append(_Response(model, counts, False))
            continue
        body = _read_body(body_path, message_id, errors)
        if body is not None:
            found.append(_Response(body[0], body[1], True))
    return found


def _price_agent(
    agent: _Agent,
    root: str,
    found: dict[str, list[str]],
    prices: dict[str, tuple[Decimal, ...]] | None,
    bodies: str | None,
    errors: list[str],
) -> _Result | None:
    """The counts and cost of one agent, or None after adding its errors."""
    paths = sorted(found.get(agent.agent_id, []))
    if not paths:
        errors.append(f"no transcript of agent {agent.agent_id} under {root}")
        return None
    if len(paths) > 1:
        errors.append(f"agent {agent.agent_id} has {len(paths)} transcripts: {', '.join(paths)}")
        return None
    responses = _read_transcript(paths[0], bodies, errors)
    models = list(dict.fromkeys(response.model for response in responses))
    if prices is None:
        return None
    missing = [model for model in models if model not in prices]
    for model in missing:
        errors.append(f"model {model} of agent {agent.agent_id} is not in {_TABLE}")
    if missing:
        return None
    counts = [0] * 5
    cost = Decimal(0)
    for response in responses:
        counts = [total + count for total, count in zip(counts, response.counts)]
        cost += sum(
            Decimal(count) * price for count, price in zip(response.counts, prices[response.model])
        ) / _MILLION
    without_body = sum(1 for response in responses if not response.from_body)
    return _Result(agent, models, counts, cost, without_body)


def _money(value: Decimal) -> str:
    return str(value.quantize(_CENT, rounding=decimal.ROUND_HALF_UP))


def _cost(value: Decimal, without_body: int) -> str:
    """A cost cell: the cost, with >= in front when a response of the row has no body."""
    return (">=" if without_body else "") + _money(value)


def _table(head: list[str], rows: list[list[str]], text_columns: set[int]) -> list[str]:
    """The rows under the head, each column padded to its widest cell, text left and numbers right."""
    widths = [max(len(row[column]) for row in [head] + rows) for column in range(len(head))]
    return [
        "  ".join(
            cell.ljust(width) if column in text_columns else cell.rjust(width)
            for column, (cell, width) in enumerate(zip(row, widths))
        )
        for row in [head] + rows
    ]


def _report(entry: str, description: str, bodies: str | None, results: list[_Result]) -> str:
    role_rows = []
    total_counts = [0] * 5
    total_cost = Decimal(0)
    total_without = 0
    for kind, name in enumerate(_KINDS):
        chosen = [result for result in results if result.agent.kind == kind]
        if not chosen:
            continue
        counts = [sum(result.counts[column] for result in chosen) for column in range(5)]
        cost = sum(result.cost for result in chosen)
        without = sum(result.without_body for result in chosen)
        role_rows.append(
            [name, str(len(chosen)), str(without)]
            + [str(count) for count in counts]
            + [_cost(cost, without)]
        )
        total_counts = [total + count for total, count in zip(total_counts, counts)]
        total_cost += cost
        total_without += without
    role_rows.append(
        ["Total", str(len(results)), str(total_without)]
        + [str(count) for count in total_counts]
        + [_cost(total_cost, total_without)]
    )
    agent_rows = [
        [result.agent.agent_id, result.agent.role, ", ".join(result.models) or "-", str(result.without_body)]
        + [str(count) for count in result.counts]
        + [_cost(result.cost, result.without_body)]
        for result in results
    ]
    lines = [
        f"Plan {entry}: priced usage of its agents",
        f"Prices from {_TABLE}:",
        description,
        f"Response bodies from {bodies}."
        if bodies is not None
        else "Response bodies: none, so every cost is a lower bound.",
        "",
    ]
    lines += _table(["Role", "Agents", "No body", *_COLUMNS, "Cost (USD)"], role_rows, {0})
    lines.append("")
    lines += _table(["Agent", "Role", "Model", "No body", *_COLUMNS, "Cost (USD)"], agent_rows, {0, 1, 2})
    return "\n".join(lines) + "\n"


def _settings_files() -> list[str]:
    """Claude Code's settings files, in the order the body folder is looked for in them."""
    files = []
    folder = os.getcwd()
    while True:
        if os.path.lexists(os.path.join(folder, ".git")):
            files += [
                os.path.join(folder, ".claude", "settings.local.json"),
                os.path.join(folder, ".claude", "settings.json"),
            ]
            break
        parent = os.path.dirname(folder)
        if parent == folder:
            break
        folder = parent
    return files + [os.path.join(os.path.expanduser("~"), ".claude", "settings.json")]


def _settings_value(errors: list[str]) -> str:
    """OTEL_LOG_RAW_API_BODIES from the first settings file that sets it, or "" after adding a file's error."""
    for path in _settings_files():
        if not os.path.lexists(path):
            continue
        try:
            with open(path, "rb") as handle:
                settings = json.loads(handle.read().decode("utf-8"))
        except OSError as exc:
            errors.append(f"cannot read {path}: {exc.strerror or exc}")
            return ""
        except (UnicodeDecodeError, ValueError):
            settings = None
        if not isinstance(settings, dict):
            errors.append(f"{path}: not a JSON object")
            return ""
        env = settings.get("env")
        if not isinstance(env, dict) or _BODIES not in env:
            continue
        if not isinstance(env[_BODIES], str):
            errors.append(f"{path}: env.{_BODIES} is not a string")
            return ""
        return env[_BODIES]
    return ""


def _body_folder(errors: list[str]) -> str | None:
    """The folder OTEL_LOG_RAW_API_BODIES names, or None after adding the error of a folder that is not one."""
    value = os.environ[_BODIES] if _BODIES in os.environ else _settings_value(errors)
    if not value.startswith("file:"):
        return None
    folder = value[len("file:") :]
    if not os.path.isdir(folder):
        errors.append(f"{_BODIES} names {folder}, which is not a folder")
        return None
    return folder


def _usage_error(text: str) -> int:
    print(f"error: {text}", file=sys.stderr)
    print(_USAGE, file=sys.stderr)
    return 2


def main(argv: list[str]) -> int:
    if len(argv) not in (1, 2):
        return _usage_error(_ARGUMENTS_ERROR)
    ledger = argv[0]
    root = argv[1] if len(argv) == 2 else os.path.join(os.path.expanduser("~"), ".claude", "projects")
    for folder in (ledger, root):
        if not os.path.isdir(folder):
            return _usage_error(f"not a folder: {folder}")
        if folder == ledger and not os.path.isfile(os.path.join(ledger, "plan.md")):
            return _usage_error(f"no plan.md in {ledger}")
    errors: list[str] = []
    prices, description = _read_table(errors)
    bodies = _body_folder(errors)
    entry, agents = _read_ledger(ledger, errors)
    found = _find_transcripts(root)
    with decimal.localcontext(_EXACT):
        results = [_price_agent(agent, root, found, prices, bodies, errors) for agent in agents]
        if errors:
            for error in errors:
                print(f"error: {error}", file=sys.stderr)
            return 1
        report = _report(entry, description, bodies, [result for result in results if result is not None])
    sys.stdout.write(report)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
