# Derived combinators and encoded logic

Partial application turns a bird equation into a reusable callable value. The
repository now uses that fact to cross two conceptual thresholds.

## Derivation from S and K

Identity is constructed as:

```text
I = S K K
```

Bluebird is constructed as:

```text
B = S (K S) K
```

`src/derived.mlpl` constructs both progressively. Tests compare the derived
values extensionally with the named `I` and `B` implementations over scalars,
arrays, and function references.

## Logic as selection

K chooses its first argument, so it encodes true. `K I` chooses its second
argument, so it encodes false. Applying those selectors is enough to define:

```text
not p   = p false true
and p q = p q false
or p q  = p true q
```

This is not proposed as a replacement for sw-MLPL's ordinary numeric
predicates. It is executable evidence that named functions plus application
can represent data and control decisions, which is the general-purpose
programming point of the aviary.

## Deliberate stopping point

An eager evaluator cannot use the ordinary untyped Y combinator as if it had
normal-order reduction: eager self-application diverges before the recursive
body can make progress. Recursion demonstrations should therefore wait for a
carefully specified applicative-order fixed-point construction or use normal
named recursion without claiming it is Y.

