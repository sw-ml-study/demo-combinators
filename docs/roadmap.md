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

## Stage 2: genuine combinators (sw-MLPL prerequisite)

Add a callable partial value containing a named callable, its arity, and bound
arguments. Define `call` so under-application returns a partial, exact
application executes, and excess arguments continue left-associatively over a
callable result. Promote `acceptance/progressive_application.mlpl` to a native
test when this ships.

Promotion is feature-driven: each newly passing acceptance case moves into
the discovered test suite with its reusable definition and teaching demo.
Still-failing cases remain explicit future contracts, never skipped tests in
the green suite.

Then teach progressive `K x`, `B f`, and `B f g` values; equivalence between
one-shot and staged application; derived birds; and the `S` + `K` basis.

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
