# Step 3, cases ruling

The orchestrator's ruling on two defects of the brief's own checks, found by the Opus build after its first run. It applies to both builds of step 3 (`3` and `3s`), and each reviewer judges the diff against it.

1. The reading case "No skill text names Ordo or a path of Ordo: `git grep -n -i -E 'ordo|pin\.sh|README' -- skills` hits only what it hit before the change" cannot hold, since items 4 to 6b name the effort agents `ordo-<...>`, which the pattern matches. Ruling: the case is judged with the effort agent names removed first: `git grep -h -i -E 'ordo|pin\.sh|README' -- skills | sed -E 's/ordo-(<worker_effort>|<reviewer_effort>|<level>|low|medium|high|xhigh|max)//g' | grep -i -E 'ordo|pin\.sh|README' | sort` equals `git grep -h -i -E 'ordo|pin\.sh|README' <base> -- skills | sed 's/^<base>://' | sort`.
2. Verify 4, `git grep -n -E 'general-purpose|links every skill from it|installed skills change only'`, hits the records under `.scratch/` that quote the old wording. Ruling: Verify 4 is run as the reading case gives it, with `-- ':!.scratch'`, and passes when it prints nothing.
