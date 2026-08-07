# Capability matrix

The executable boundary is based on semantics, not on the difficulty or name
of a bird.

| Capability | sw-MLPL 0.20.0 | Repository evidence |
|---|---:|---|
| Named user functions as values | yes | every `:u:` argument in `src/birds.mlpl` |
| Uniform higher-order invocation | yes | `call` throughout the current aviary |
| Functions passed as named references | yes | Mockingbird, Lark, and Owl tests |
| Exact-arity composition | yes | B, B1, B2, B3, Q |
| Argument duplication and routing | yes | W, S, D, E, Psi, Phi |
| Pervasive array behavior | yes | B and Phi vector tests |
| Immediate composition | yes | `atop` comparison |
| Under-application returns callable | yes | `tests/test_partials.mlpl` |
| Callable partial accepted by `call` | yes | staged bird tests |
| Excess application continues left-associatively | yes | excess-application test |
| Derive I as the callable value `S K K` | yes | SK-basis test and lesson 13 |

## Promotion rule

`tests/` must stay green on the released sibling sw-MLPL interpreter. A bird
or equation whose semantics have shipped belongs there now. Newly unblocked
features should emphasize observable intermediate callable values, not merely
their final fully saturated results.
