# Keys of step 5's blind comparisons

Given to no judge. "new" is the `paper` side, "old" the academic-paper side.

## Lit-review

- Order command: `python3 -c 'import random; print(random.choice(["new is A", "old is A"]))'`
- Output: `old is A`
- First judge (`judge-lit-review-1`): output-A is academic-paper, output-B is `paper`.
- Second judge (`judge-lit-review-2`), the order swapped: output-A is `paper`, output-B is academic-paper.

## Revision

- Order command: `python3 -c 'import random; print(random.choice(["new is A", "old is A"]))'`
- Output: `old is A`
- First judge (`judge-revision-1`): output-A is academic-paper (kept from step 3), output-B is `paper`.
- Second judge (`judge-revision-2`), the order swapped: output-A is `paper`, output-B is academic-paper.

## Full

- Order command: `python3 -c 'import random; print(random.choice(["new is A", "old is A"]))'`
- Output: `new is A`
- First judge (`judge-full-1`): output-A is `paper`, output-B is academic-paper.
- Second judge (`judge-full-2`), the order swapped: output-A is academic-paper, output-B is `paper`.
