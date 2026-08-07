# sw-MLPL Combinator Aviary

Bird-named combinators inspired by Raymond Smullyan's *To Mock a
Mockingbird*, implemented in [sw-MLPL](https://github.com/sw-ml-study/sw-mlpl).
The project uses the birds to show that sw-MLPL is a general-purpose,
higher-order programming language as well as an array-oriented ML language.

## What works now

sw-MLPL 0.20.0 has named user-function values (`:u:name`) and uniform
invocation with `call(f, args...)`. The executable aviary demonstrates:

| Bird | Equation | Idea |
|---|---|---|
| Idiot / I | `I x = x` | identity |
| Kestrel / K | `K x y = x` | constant |
| Thrush / T | `T x f = f x` | reverse application |
| Bluebird / B | `B f g x = f (g x)` | composition |
| Cardinal / C | `C f x y = f y x` | argument flip |
| Vireo / V | `V x y f = f x y` | pairing/application |
| Warbler / W | `W f x = f x x` | duplication |
| Starling / S | `S f g x = f x (g x)` | substitution |
| Mockingbird / M | `M f = f f` | self-application |

The extended current suite also includes Blackbird (`B1`), Bunting (`B2`),
Becard (`B3`), Dove (`D`), Eagle (`E`), Queer (`Q`), Psi (`Ψ`), Phoenix
(`Φ`), Lark (`L`), Owl (`O`), Kite (`KI`), Robin (`R`), Finch (`F`),
Goldfinch (`G`), Hummingbird (`H`), and Jay (`J`). These exercise
multi-argument composition, routing, permutation, cancellation, shared
mapping, forking, nested application, and self-application.

The Bluebird examples apply unchanged to scalars and arrays. That is the
distinctly sw-MLPL lesson: combinators organize computations, while pervasive
array operations organize data.

## The honest boundary

These definitions currently implement each equation as an ordinary named
function with its full arity. They are not yet genuinely curried birds.
`call(:u:kestrel, 5)` must eventually return a callable waiting for `y`, but
the current interpreter reports an arity error.

[acceptance/progressive_application.mlpl](acceptance/progressive_application.mlpl)
records the deliberately non-discovered acceptance case for:

1. under-application returning a callable partial value;
2. calling that partial later; and
3. excess arguments applying left-associatively to callable results.

That minimal runtime feature is preferable to requiring anonymous lambdas or
lexical closures: a partial only needs a named reference plus bound values.
Once it lands, the repo can demonstrate derivation, SK completeness, and
fixed-point birds faithfully.

The maintenance rule is simple: add and test every bird expressible with the
released interpreter now; keep only genuinely blocked semantics in
`acceptance/`; promote those fixtures into `tests/` as each sw-MLPL feature
ships. The current suite never pretends that a failing future contract works.

## Run it

Use sibling checkouts:

```text
sw-ml-study/
  sw-mlpl/
  demo-combinators/
softwarewrighter/
  mlplunit/
```

Build sw-MLPL, then run the demos and tests:

```sh
cd ../sw-mlpl
cargo build --manifest-path components/cli/Cargo.toml -p mlpl-repl --release
cd ../demo-combinators
./scripts/run-demos
./scripts/run-lessons
./scripts/run-tests
./scripts/check-acceptance-gates
./scripts/check
```

Override either tool path with `MLPL=/path/to/mlpl-repl` or
`MLPLUNIT=/path/to/mlplunit`. Tests use mlplunit native `@test` discovery and
the same shared `src/birds.mlpl` definitions as the demos.

## Layout

- `src/birds.mlpl` — reusable current bird definitions
- `demos/` — readable executable tours
- `lessons/` — numbered path from identity through an array/ML pipeline
- `tests/` — mlplunit conformance tests
- `acceptance/` — future language-feature contracts, excluded from discovery
- `docs/roadmap.md` — staged teaching and language roadmap
- `docs/capability-matrix.md` — executable current/blocked feature boundary
- `docs/notation.md` — canonical equations and argument-order policy
