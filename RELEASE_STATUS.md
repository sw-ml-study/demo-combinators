# Release status

## v0.1.0 baseline

The first release is feature-complete for its stated purpose: demonstrate
bird-named combinators as genuine progressively applicable values in sw-MLPL,
connect them to array programming, derive computation from a small basis, and
use them in ordinary problem-solving programs.

Verified locally on 2026-08-07:

| Component | Version / revision |
|---|---|
| sw-MLPL source checkout | `6eb9463c` |
| installed `mlpl-repl` | `0.20.0`, embedded build `3bc0bf37` |
| mlplunit source checkout | `71dd16f5` |
| installed mlplunit | `0.1.0` |
| Bird catalog | 32 canonical birds |
| Native suite | 40 tests passing |
| Teaching sequence | 17 lessons |
| Practical corpus | 5 cataloged applications |

The interpreter's embedded build identifier predates the final sw-MLPL source
commit because the final upstream commit also recorded project metadata. The
binary was explicitly verified against the two newly shipped behaviors:
partials in Result combinators and partial `bracket` use/teardown hooks.

## Supported callable surface

- named user-function and builtin references;
- user-function partial values with staged application;
- left-associative excess application;
- partial storage in variables and records, plus argument/return flow;
- `each`, `table`, `atop`, and `over`;
- `map_ok`, `and_then`, and `or_else`;
- partial `bracket` use and teardown hooks;
- structural partial equality and representation.

Bracket setup remains a raw zero-argument user reference by design. Builtin
references remain exact-arity because builtin arity is not universally fixed.

## Release gate

Run:

```sh
./scripts/check
```

This validates both catalogs, runs the complete mlplunit suite, and executes
all conceptual demos, practical applications, and lessons. GitHub Actions
recreates the sibling checkout layout, builds the release interpreter, and
runs the same gate.

Further corpus growth is tracked in `docs/planned-follow-ons.md`; it is not a
condition of v0.1.0 completeness.

