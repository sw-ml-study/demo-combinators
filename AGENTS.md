# Project instructions

## Command runner

- Use `just` and the root `justfile` for developer-facing task aliases.
- Do not introduce Make or a Makefile. `just` is the project's explicit
  preference over Make.
- Keep portable shell scripts under `scripts/` as the underlying
  implementation; `just` recipes should delegate to them instead of
  duplicating workflow logic.
- When adding a recurring workflow, add or update the shell script first when
  portability is useful, then expose it through a concise `just` recipe.

## Verification

Before committing changes, run `just check`. Focused recipes such as
`just test`, `just demos`, `just problems`, and `just lessons` are useful
during development but do not replace the complete gate.

