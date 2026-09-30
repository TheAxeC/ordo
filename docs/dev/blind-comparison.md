# Blind comparison

A gate that compares a new skill with another skill on a real input cites this page. The comparison that gate names runs as the steps below say. The orchestrator of the plan whose gate needs the comparison runs it, from the two runs of the skills to the record.

1. **The input.** The orchestrator gives both sides, the new skill and the skill it is compared against, the same input: one real input, the one the gate names, unchanged. When the input is a tree or a repository that a side changes, each side gets its own identical copy, so both start from the same input. Each side runs in its own fresh session with only that input and its own skill. A side that stops without a whole output, because it fails or stops to ask a question, is judged on what it produced, and each part it does not give is a critical failure.
2. **Unlabelled.** The judge sees the two outputs unlabelled. Before judging, the orchestrator removes from each output every mark of which side made it: a skill's name, a file or folder name, a header or footer a skill writes. The orchestrator writes the key, which output is which, to a file the judges are not given.
3. **Random order.** The judge sees the two outputs in random order. A command whose result the orchestrator does not choose prints which output is A, and the other is B, for example `python3 -c 'import random; print(random.choice(["new is A", "old is A"]))'`. The orchestrator keeps the command and its output with the key.
4. **The judge's input.** The judge receives the two outputs with only the input, and nothing else: no skill name, no gate, no statement of which output is expected to win.
   - The judge receives no file of either skill being compared.
   - A file of a skill is each file of its folder, and each other file that holds the skill's text whole or in most part, such as a diff that adds it or a copy under another name.
   - The orchestrator removes the files of both skills from the judge's copy of the input.
   - The orchestrator removes from the judge's copy the ledger of each plan that builds or changes either skill.
     - The orchestrator keeps, in a file of its own in that ledger's place, the bullets of its Rulings that name the input's entry.
   - The orchestrator removes from the judge's copy every other line that states the comparison's gate, names the comparison, or says which output is expected to win.
   - The orchestrator copies into the judge's copy each file or folder the input names as a source.
     - A repository is copied whole only when the input names the repository and no path inside it.
   - The orchestrator copies into the judge's copy each file an output cites that is outside the copy, except a file of either skill.
   - The orchestrator saves into the judge's copy the page of each URL an output cites, as its fetch returns it, except a file of either skill; for a URL that does not resolve it saves what the fetch printed.
   - The orchestrator removes the files of both skills from each copied source and cited file.
   - The judge runs as its own process, not as an agent the orchestrator's runner starts.
   - The judge's process starts in its copy of the input.
   - The judge's process lists and loads no skill.
   - The judge's process fetches nothing, and has no permission beyond reading its copy.
   - The judge's process runs on the model the configuration's `reviewer` names, such as `claude -p --disable-slash-commands --model opus --output-format stream-json --verbose`.
   - The judge's served model is the `model` of the process's `init` message.
   - The judge's process loads the user's global instructions, which are part of what the user needs.
     - The files it loaded are the `files` of the `instructions` attachment in the session transcript the process writes under `~/.claude/projects/` for its `session_id`.
   - The orchestrator tells the judge to judge each output by what the input and its user need.
   - The orchestrator tells the judge that no skill's text, wherever the input quotes it, is the standard.
   - Neither instruction names a skill or says which output is expected to win.
   - The judge checks each URL an output cites against its saved page, for whether it resolves and says what the output claims.
   - The judge opens no file outside its copy of the input.
5. **Reading.** The judge reads each output whole, and for each lists its critical failures before stating a preference. A critical failure is one that makes the output unfit for the purpose the input sets. For example, a claim the input contradicts, a missing part the input asks for and a citation that does not resolve are critical failures. The judge quotes each critical failure with its place.
6. **The verdict.** The judge writes the verdict, A, B or a tie, with the reasons, each reason pointing at the failures or the passages it rests on.
7. **Twice, the order swapped.** The orchestrator has the comparison judged twice, the second time with the order swapped: the output that was A is given as B, and the output that was B as A. A fresh judge process (item 4) makes each judgment, so the second judge has no memory of the first. When the two verdicts, read through the key, differ, the disagreement is a tie; when they agree, the result is the verdict they share.
8. **The final call.** The user reads the input, both outputs and both verdicts, and makes the final call: the new skill wins, ties or loses. The user's call is the result the gate reads, and "wins or ties" in a gate means the call is a win or a tie.
9. **The record.** The orchestrator keeps the comparison in the ledger of the plan whose gate needs it, at `agents/reviews/<step>-blind-comparison.md`. The record holds:
   - the input, or its path;
   - each path removed from the judge's copy, and each line removed from a file of it (item 4), or "none";
   - each file and folder copied into the judge's copy (item 4), or "none";
   - each judge's command, its served model, every key of its `modelUsage`, and the global instruction files it loaded (item 4);
   - the two outputs as judged;
   - the key;
   - the command that set the order, and its output;
   - both verdicts as the judges wrote them;
   - the user's call, with the reasons.
