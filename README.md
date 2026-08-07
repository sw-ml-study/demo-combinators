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

The higher-arity tier adds Violet Starling (`Σ`), Zebra Dove (`Δ`),
Dickcissel (`D1`), Dovekie (`D2`), Eastern and Western Nicator (`N`, `ν`),
and Bald Eagle (`Ê`). Their complete-arity forms work today and provide useful
stress coverage for nested calls spanning unary, binary, and ternary stages.

The Bluebird examples apply unchanged to scalars and arrays. That is the
distinctly sw-MLPL lesson: combinators organize computations, while pervasive
array operations organize data.

## Progressive application has landed

The sibling sw-MLPL build now supports callable partial values. Calling a user
function with too few arguments returns a value that remembers the named
reference and bound data; exact application executes it; excess arguments
continue left-associatively onto callable results.

The green suite now verifies:

1. under-application returning a callable partial value;
2. calling that partial later; and
3. excess arguments applying left-associatively;
4. partials flowing through variables, records, arguments, returns, and
   callable-aware array higher-order functions; and
5. the derived identity `S K K`.

The implementation remains deliberately smaller than closures: a partial only
needs a named reference plus bound values. Anonymous lambdas and captured
lexical environments are not prerequisites for these demonstrations.

The next lessons use those partials to construct `I = S K K` and
`B = S (K S) K` as callable values, then encode Boolean selection and
`not`/`and`/`or` using K and K I. This demonstrates representation and control
through functions, not just convenient composition syntax.

The maintenance rule remains feature-driven: add and test every bird
expressible with the released interpreter, and promote a future contract as
soon as its sw-MLPL semantics ship.

Because partial application changes how every multi-argument definition can
be observed, [the post-partial audit](docs/bird-audit.md) rechecks all 32
earlier birds in both saturated and staged forms. New callable features should
trigger the same whole-aviary review.

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
./scripts/check
```

Override either tool path with `MLPL=/path/to/mlpl-repl` or
`MLPLUNIT=/path/to/mlplunit`. Tests use mlplunit native `@test` discovery and
the same shared `src/birds.mlpl` definitions as the demos.

## Layout

- `src/birds.mlpl` — reusable current bird definitions
- `src/derived.mlpl` — SK derivations and combinatory Boolean values
- `demos/` — readable executable tours
- `lessons/` — numbered path from identity through an array/ML pipeline
- `tests/` — mlplunit conformance tests
- `docs/roadmap.md` — staged teaching and language roadmap
- `docs/capability-matrix.md` — executable current/blocked feature boundary
- `docs/notation.md` — canonical equations and argument-order policy
- `docs/derived-combinators.md` — SK construction and encoded logic
- `docs/bird-audit.md` — canonical and staged review of the whole aviary
