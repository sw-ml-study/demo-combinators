# Practical combinator demonstrations

This repository should grow a problem-solving corpus alongside its conceptual
aviary, following the useful separation established by `demo-algorithms`:
reusable production definitions in `src/problems/`, readable applications in
`demos/problems/`, native conformance tests in `tests/problems/`, and catalog
metadata in `catalog/problems.tsv`.

## Selection rule

A practical demo belongs here only when a combinator makes the computation's
dataflow clearer or makes a configured function reusable. Do not translate
ordinary arithmetic into birds merely to increase bird counts. Each demo must:

1. state a concrete problem and meaningful output;
2. name the bird-shaped dataflow in plain language;
3. share production source between demo and test;
4. compare scalar and array behavior where pervasion is relevant;
5. identify where partial application binds policy/configuration; and
6. remain understandable without knowing combinatory-logic notation first.

## Delivery sequence

| Phase | Practical problem | Natural combinators | Teaching purpose | Status |
|---|---|---|---|---|
| 1 | Regional order quote | B, Phi, Partial | pipeline + fork + configured tax policy | runnable |
| 2 | Sensor calibration and alarm scoring | B3, Psi, Partial | reusable calibration and same transform on baseline/current | planned |
| 3 | Loan/application policy selection | K/KI, C, Partial | explicit policy selection without hidden closure state | planned |
| 4 | Feature-quality report | Phi, over, Partial | fork one dataset into quality metrics and combine | planned |
| 5 | Batch normalization pipeline | B/B3, each, Partial | configured transforms over rank-polymorphic data | planned |
| 6 | Validation and recovery workflow | Result HOFs, Partial | configured success/error handlers | gated: partial rejected |
| 7 | Managed resource workflow | bracket, Partial | configured use/teardown hooks | gated: partial rejected |
| 8 | Pairwise compatibility matrix | table, Partial | bind scoring weights then form an outer table | planned |
| 9 | Ensemble score fusion | Psi/Phi/Bald Eagle | parallel branches and explicit fusion | planned |
| 10 | Callable strategy registry | records, Partial, T/V | select and invoke named configured policies | planned |

## Feature-sensitive horizon

Applicative-order fixed points and recursion-without-named-recursion remain
research items, not promised demos. Add them only after a terminating eager
construction is executable and tested. Future callable changes trigger the
whole-aviary audit described in `docs/bird-audit.md` before practical examples
depend on them.

The sw-MLPL combinator design promises partial support across all
function-consuming HOFs, but the current interpreter still rejects partials in
Result combinators and `bracket`. Exact fixtures under `acceptance/` keep those
two roadmap items visible and automatically signal when they can be promoted.
