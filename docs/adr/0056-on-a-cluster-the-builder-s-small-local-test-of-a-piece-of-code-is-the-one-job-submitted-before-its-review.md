# 0056. On a cluster, the builder's small local test of a piece of code is the one job submitted before its review

Status: proposed

## Context

ADR 0053 decides that in `researcher`'s `research` mode each piece of code is built by a fresh agent from a brief and then read by a fresh reviewer, and that "Jobs are submitted only after it." The goal of roadmap entry 13 holds a project to the rule that nothing computes on a cluster's login node. The builder runs the brief's small local test, one command on a small input of at most 10 minutes, once its code is written (`skills/academic/researcher/agents/research_builder_agent.md` item 4). On a cluster that test cannot run on the login node, so it runs as the short job `code/hpc/test-<piece>.sh` (`skills/academic/researcher/references/slurm.md`, "A small local test"), and is submitted before the reviewer reads the code.

## Decision

- On a cluster, the builder's small local test of a piece of code runs as a short job and is the one job of the piece submitted before its reviewer reads the code. The test produces no result.
- Every other job of the piece, of the baseline and of the experiments, is submitted only after a reviewer's report with no finding that makes a result false.
- This supersedes the sentence "Jobs are submitted only after it." of ADR 0053; the rest of ADR 0053 stands.

## Alternatives rejected

- The test job moved after the review, the reviewer submitting it: the builder then hands over code it has never run, and a plain error reaches the reviewer and costs a review.
- The test run on the login node: it breaks the rule that nothing computes on a cluster's login node.

## Consequences

The builder checks that its code runs before handing it over, on a cluster as off one. A test job that waits in the queue holds the builder until the job runs or is cancelled after 60 minutes pending, as `references/slurm.md` says. The pages that state when jobs are submitted name the test job as the one job before review.
