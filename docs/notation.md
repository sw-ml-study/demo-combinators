# Bird notation and naming

The repository spells application with normal MLPL calls, but preserves each
bird's canonical argument order. For example:

```text
V x y f = f x y
R x f y = f y x
F x y f = f y x
G f g x y = f y (g x)
```

This sometimes differs from sw-MLPL's ergonomic function-first builtins such
as `each(f, x)` and `atop(f, g, x)`. The distinction is intentional: a bird
definition teaches a standard combinatory equation; a language API chooses an
argument order convenient for ordinary programs.

The working catalog is checked against:

- https://combinatorylogic.com/table.html
- https://blog.lahteenmaki.net/combinator-birds.html
- Raymond Smullyan, *To Mock a Mockingbird*

Names can vary across extended catalogs. When adding a bird, record its symbol
and full equation in the definition before adding derivations or aliases.

