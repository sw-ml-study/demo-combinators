# Aviary roadmap

## Stage 1: named higher-order functions (current)

Teach explicit function references, `call`, self-application, argument
permutation and duplication, full-arity bird equations, `atop`, and the
interaction between composition and pervasive array arithmetic.

The numbered `lessons/` sequence is the primary reading path. The broader
`demos/` scripts are standalone showcases, including a practical feature
pipeline composed with Bluebird and Becard.

New birds belong in this stage whenever their equations can be written and
tested using exact-arity named functions and current callable references. Do
not hold such birds behind the partial-application milestone.

## Stage 2: genuine combinators (current)

sw-MLPL now provides a callable partial value containing a named callable, its
arity, and bound arguments. `call` returns a partial on under-application,
executes at exact arity, and continues excess arguments left-associatively.
The promoted native suite covers progressive B and K, storage flows, HOF use,
excess application, Mockingbird with Identity, and the `S K K` derivation.

Lessons 12 and 13 teach progressive `K x`, `B f`, and `B f g` values,
equivalence between one-shot and staged application, and the `S` + `K` basis.

Lessons 14 and 15 construct Bluebird from S and K and encode Boolean selection
and logic through K/KI. Lesson 17 constructs classical `Y = B M L` as an
unforced value and demonstrates terminating recursion through a separate,
explicitly applicative-order Sage built from delayed named partials.

The first post-feature audit is complete in `docs/bird-audit.md` and
`tests/test_staged_audit.mlpl`. Repeat it after any future callable semantic
change rather than validating only newly added birds.

## Stage 3: an array-oriented functional toolkit

Compose data preparation and model-facing transformations from named stages.
Show the same bird pipelines across scalars, vectors, matrices, and tensors.
Integrate callable-aware array higher-order functions such as `each`, `table`,
`over`, and `atop` as they become available, keeping function registries in
records rather than forcing callable values into numeric arrays.

## Not prerequisites

Anonymous lambdas, lexical closures, heterogeneous function arrays, static
types, and special combinator punctuation are valuable separate language
choices, but none is necessary for the staged named-reference design above.
