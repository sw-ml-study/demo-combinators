# Capability matrix

The executable boundary is based on semantics, not on the difficulty or name
of a bird.

| Capability | sw-MLPL 0.20.0 | Repository evidence |
|---|---:|---|
| Named user functions as values | yes | every `:u:` argument in `src/birds.mlpl` |
| Uniform higher-order invocation | yes | `call` throughout the current aviary |
| Functions passed and returned as named references | yes | Mockingbird reference test |
| Exact-arity composition | yes | B, B1, B2, B3, Q |
| Argument duplication and routing | yes | W, S, D, E, Psi, Phi |
| Pervasive array behavior | yes | B and Phi vector tests |
| Immediate composition | yes | `atop` comparison |
| Under-application returns callable | no | `acceptance/progressive_application.mlpl` |
| Callable partial accepted by `call` | no | `acceptance/progressive_application.mlpl` |
| Excess application continues left-associatively | no | progressive-application fixture |
| Derive I as the callable value `S K K` | no | `acceptance/sk_basis.mlpl` |

## Promotion rule

`tests/` must stay green on the released sibling sw-MLPL interpreter. A bird
or equation that only needs current exact-arity calls belongs there now. An
acceptance fixture moves into `tests/` only after its required language
semantics ship; at that point its demo should emphasize the newly observable
intermediate callable values.

