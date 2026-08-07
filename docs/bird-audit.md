# Post-partial bird audit

Callable partials changed the meaning of under-application, so every bird
introduced before that feature landed was revisited rather than assumed to be
complete.

## Audit criteria

For each named bird:

1. the docstring states its complete canonical equation;
2. argument order matches the established bird notation, even where MLPL's
   ordinary HOF APIs prefer function-first order;
3. a fully saturated equation test has a distinguishing result;
4. every multi-argument bird is under-applied and resumed in
   `tests/test_staged_audit.mlpl`; and
5. higher-order and array-relevant birds retain callable values and pervasive
   array behavior.

## Result

All 32 birds currently in `src/birds.mlpl` pass their saturated tests. Every
multi-argument bird also passes a staged regression test on the partial-enabled
interpreter. Identity and Mockingbird are unary and therefore have no
under-applied nonzero-argument stage; both retain direct/self-application
coverage elsewhere.

Vireo was corrected during the audit from an ergonomic function-first variant
to canonical `V x y f = f x y`. No other equation or argument-order mismatch
was found. The audit source references and ASCII symbol policy are recorded in
`docs/notation.md`.

## Repeat trigger

Repeat this audit whenever sw-MLPL changes callable representation,
application associativity, partial equality/rendering, or function-consuming
higher-order builtins. New birds must enter both a saturated family test and a
staged audit test in the same commit.

