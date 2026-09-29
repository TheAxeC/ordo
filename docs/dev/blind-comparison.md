# Blind comparison

A gate that compares a new skill with another skill on a real input cites this page. The comparison that gate names runs as the steps below say. The orchestrator of the plan whose gate needs the comparison runs it, from the two runs of the skills to the record.

1. **The input.** The orchestrator gives both sides, the new skill and the skill it is compared against, the same input: one real input, the one the gate names, unchanged. When the input is a tree or a repository that a side changes, each side gets its own identical copy, so both start from the same input. Each side runs in its own fresh session with only that input and its own skill. A side that stops without a whole output, because it fails or stops to ask a question, is judged on what it produced, and each part it does not give is a critical failure.
2. **Unlabelled.** The judge sees the two outputs unlabelled. Before judging, the orchestrator removes from each output every mark of which side made it: a skill's name, a file or folder name, a header or footer a skill writes. The orchestrator writes the key, which output is which, to a file the judges are not given.
3. **Random order.** The judge sees the two outputs in random order. A command whose result the orchestrator does not choose prints which output is A, and the other is B, for example `python3 -c 'import random; print(random.choice(["new is A", "old is A"]))'`. The orchestrator keeps the command and its output with the key.
4. **The judge's input.** The judge receives the two outputs with only the input, and nothing else: no skill name, no gate, no statement of which output is expected to win.
5. **Reading.** The judge reads each output whole, and for each lists its critical failures before stating a preference. A critical failure is one that makes the output unfit for the purpose the input sets. For example, a claim the input contradicts, a missing part the input asks for and a citation that does not resolve are critical failures. The judge quotes each critical failure with its place.
6. **The verdict.** The judge writes the verdict, A, B or a tie, with the reasons, each reason pointing at the failures or the passages it rests on.
7. **Twice, the order swapped.** The orchestrator has the comparison judged twice, the second time with the order swapped: the output that was A is given as B, and the output that was B as A. A fresh agent makes each judgment, so the second judge has no memory of the first. When the two verdicts, read through the key, differ, the disagreement is a tie; when they agree, the result is the verdict they share.
8. **The final call.** The user reads the input, both outputs and both verdicts, and makes the final call: the new skill wins, ties or loses. The user's call is the result the gate reads, and "wins or ties" in a gate means the call is a win or a tie.
9. **The record.** The orchestrator keeps the comparison in the ledger of the plan whose gate needs it, at `agents/reviews/<step>-blind-comparison.md`. The record holds:
   - the input, or its path;
   - the two outputs as judged;
   - the key;
   - the command that set the order, and its output;
   - both verdicts as the judges wrote them;
   - the user's call, with the reasons.
