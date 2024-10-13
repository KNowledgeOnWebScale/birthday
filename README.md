# Birthday

A RDF Surfaces implementation trying to implement deontic rules.

## Deontic rules

Minimal deontic logic : "Sartor G (2006) Fundamental legal concepts: a formal and teleological characterisation. Artif Intell Law 14(1–2):101–142"

- [1] **Prohibition** action(X) = **Duty** NOT ( action(X) )
- [2] **Permission** action(X) = NOT (**Prohibition** action(X))
- [3] IF **Duty** action(X) THEN **Permission** action(X)
- [4] IF **Duty** action(X) AND **Duty** action(Y) THEN **Duty** action(X AND Y)

But, from [1] should follow:

[5] **Prohibition NOT action(X) = **Duty** action(X) .

And, from [2] should follow:

[6] NOT (**Permission** action(X)) = **Prohibition** action(X)

And from [5] & [6] should follow:

[7] **Prohibition** action(X) = NOT (**Permission** action(X)) = **Duty** NOT( action(X) )

The challenge is here to model and implement [5], [6] and [7]

## Demo

**Warning** these are only preliminary results

Run all tests:

```
./test.sh all
```

Test if we can TalkLoudly for `policy1.ttl`:

```
./bin/test.sh policies/policy1.n3s

# produces

:You :have (:prohibition :TalkLoudly).
:You :have (:permission :NotTalkLoudly).
:You :have (:duty :NotTalkLoudly).
:You :havenot (:prohibition :NotTalkLoudly).
:You :havenot (:permission :TalkLoudly).
```

Show all inferences for `policy1.n3s`:

```
./bin/test.sh policies/policy1.ttl show
```