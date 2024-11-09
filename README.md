# Birthday

A RDF Surfaces implementation trying to implement the birthday app with deontic rules.

## Minimal Deontic rules

Minimal deontic logic : "Sartor G (2006) Fundamental legal concepts: a formal and teleological characterisation. Artif Intell Law 14(1–2):101–142"

- [1] **Prohibition** action(X) = **Duty** NOT ( action(X) )
- [2] **Permission** action(X) = NOT (**Prohibition** action(X))
- [3] IF **Duty** action(X) THEN **Permission** action(X)
- [4] IF **Duty** action(X) AND **Duty** action(Y) THEN **Duty** action(X AND Y)

But, from [1] should follow:

[5] **Prohibition** NOT action(X) = **Duty** action(X) .

And, from [2] should follow:

[6] NOT (**Permission** action(X)) = **Prohibition** action(X)

And from [5] & [6] should follow:

[7] **Prohibition** action(X) = NOT (**Permission** action(X)) = **Duty** NOT( action(X) )

The challenge is here to model and implement [5], [6] and [7].

In this project we also assume :

[8] **Duty**( action(X) & NOT action(X)) is false

[9] **Prohibition**( action(X) & NOT action(X)) is false

But, do not include such a rule for Permissions. One could have a permission to call and not call your mother. But, not a duty to call and not call your mother.

## Standard Deontic Rules

We also have an attempt on a Notation3 implementation of deonitic rules using Standard Deontic Rules : https://plato.stanford.edu/entries/logic-deontic/

We implement a fragment of standard deontic logic using derived rules that don't contain any 
negations:

- [1] : p => Duty(p)
- [2] : Duty(p) => Prem(p)

and derived

- [3] : Perm(p) & Proh(p) => false 
- [4] : Duty(p) & Proh(p) => false 
- [5] : p & Proh(p) => false 
- [6] : Duty(p & q) => Duty(p) & Duty(q)
- [7] : Perm(p & q) => Perm(p) & Perm(q)
- [8] : Proh(p & q) => Proh(p) v Proh(q) (not implemented: standard Notation3 doesn't have disjunctions in the conclusion)

 
## Policy

A policy is on a target (a URL) and defined what actions are allowed on a target. E.g. the following policy says that in Room101 it is allowed to talk loudy.
 
```
@prefix : <http://example.org/ns#> .
@prefix log: <http://www.w3.org/2000/10/swap/log#> .

:Room101 
    a :PolicyTarget .

() log:onPermissionSurface {
    :Room101 :action :TalkLoudly 
} .
```

## Demo

- `./bin/test.sh all` - query all policies and display what is allowed
- `./bin/test.sh policies/policy1.n3s` - query just one policy 
- `./bin/test.sh policies/policy1.n3s show` - show all inferred deontic surfaces for one policy
- `./bin/combine.sh policy*` - combine policies to check for inconsistencies
- `./bin/combine.sh -s policy*` - combine policies to check for inconsistencies (show generated surfaces)