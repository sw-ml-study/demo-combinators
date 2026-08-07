# sw-MLPL Combinator Aviary

Bird-named combinators inspired by Raymond Smullyan's *To Mock a
Mockingbird*, implemented in [sw-MLPL](https://github.com/sw-ml-study/sw-mlpl).
The project uses the birds to show that sw-MLPL is a general-purpose,
higher-order programming language as well as an array-oriented ML language.

Status: v0.1.0 release baseline. See [RELEASE_STATUS.md](RELEASE_STATUS.md) for
the verified toolchain and gate, and
[planned follow-ons](docs/planned-follow-ons.md) for optional second-milestone
expansion.

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

Lesson 17 reaches the Sage bird. It constructs the classical `Y = B M L`
without forcing its eager divergence, then implements an applicative-order
Sage using named partials and runs factorial and Fibonacci bodies that never
refer to their own names.

## Practical problems

The conceptual aviary is paired with a demo-algorithms-style problem corpus.
Each practical example has shared source, a standalone application, native
tests, and catalog metadata. The first example computes regional order quotes:
Bluebird composes discount and service-fee stages, a partial binds the tax
rate, and Phoenix combines the two price branches for either one subtotal or a
whole batch. [PLAN.md](PLAN.md) defines the selection rule and next problems.

The corpus also includes configured sensor calibration/alarm scoring with Psi
and Blackbird, plus a worker/job compatibility matrix built by passing a bound
binary scoring policy directly to `table`.

The completed HOF surface additionally supports a configured validation and
recovery railway plus a managed processing session whose partial use and
teardown hooks run under `bracket` lifecycle guarantees.

The maintenance rule remains feature-driven: add and test every bird
expressible with the released interpreter, and promote a future contract as
soon as its sw-MLPL semantics ship.

Current HOF interoperability includes `each`, `table`, `atop`, `over`, the
Result combinators, and partial `bracket` use/teardown hooks. Bracket setup
deliberately stays a raw zero-argument user reference because zero-argument
partial semantics are not defined.

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
./scripts/run-problems
./scripts/run-tests
./scripts/check
```

Override either tool path with `MLPL=/path/to/mlpl-repl` or
`MLPLUNIT=/path/to/mlplunit`. Tests use mlplunit native `@test` discovery and
the same shared `src/birds.mlpl` definitions as the demos.

## Layout

- `src/birds.mlpl` — reusable current bird definitions
- `src/derived.mlpl` — SK derivations and combinatory Boolean values
- `src/fixed_points.mlpl` — classical Sage construction and eager-safe fixed points
- `src/problems/` — reusable practical problem implementations
- `demos/` — readable executable tours
- `demos/problems/` — standalone problem-solving applications
- `lessons/` — numbered path from identity through an array/ML pipeline
- `tests/` — mlplunit conformance tests
- `catalog/` — validated bird and practical-problem metadata
- `docs/roadmap.md` — staged teaching and language roadmap
- `docs/capability-matrix.md` — executable current/blocked feature boundary
- `docs/notation.md` — canonical equations and argument-order policy
- `docs/derived-combinators.md` — SK construction and encoded logic
- `docs/sage-fixed-points.md` — Y versus applicative Z and recursive examples
- `docs/planned-follow-ons.md` — post-v0.1.0 practical and conceptual expansion
- `docs/bird-audit.md` — canonical and staged review of the whole aviary
