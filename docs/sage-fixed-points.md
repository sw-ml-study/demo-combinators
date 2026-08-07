# Sage birds and fixed points

A Sage is a fixed-point combinator. Applied to a function `f`, it produces a
value satisfying:

```text
Y f = f (Y f)
```

## Smullyan's construction

The classical Sage is a bird that composes Mockingbird with Lark:

```text
Y = B M L
Y f = M (L f) = (L f) (L f) = f ((L f) (L f)) = f (Y f)
```

`u:classical_sage()` constructs `B M L` as a first-class partial value. The
lesson deliberately does not apply it. sw-MLPL evaluates arguments eagerly,
so forcing the classical construction recursively expands self-application
before a recursive body can choose its base case.

## An applicative Sage

Strict languages use an applicative-order fixed-point construction, commonly
called Z. Its key move is delaying `x x value` behind a callable. sw-MLPL can
express that delay without anonymous lambdas:

```text
z_recur(step, value) = step step value
```

Under-applying `z_recur` to `step` creates a unary partial. The recursive call
is therefore not evaluated until the body supplies `value`. `z_step` gives
that delayed callable to a builder, and `applicative_sage` ties the knot.

The executable examples define factorial and Fibonacci bodies that receive
their recursive callable as an ordinary argument. Neither body refers to its
own name. This demonstrates recursion obtained through function application,
while remaining honest about the evaluation-order difference between
classical Y and applicative Z.

## Practical interpretation

Fixed-point combinators separate a recursive policy from the machinery that
makes it recursive. That is pedagogically useful for parsers, tree folds,
retry/state transitions, and dynamic programs. In ordinary sw-MLPL code,
direct named recursion will often be clearer and faster; the Sage lesson exists
to demonstrate expressive completeness, not to prescribe production style.

