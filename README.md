
# Autómatas finitos no determinísticos

[![Build Status](https://travis-ci.com/pdep-utn/eg-automatas-nondet-prolog.svg?branch=master)](https://travis-ci.com/pdep-utn/eg-automatas-nondet-prolog)

Queremos resolver mediante un AFN [este ejemplo](https://er.yuvayana.org/nfa-nondeterministic-finite-automata-definition-example-application/)

M = ({A, B, C, D}, {a, b}, δ, A, {B}), donde δ es definido como

- δ (A, a) = B,
- δ (A, a) = C,
- δ (A, a) = D,
- δ (C, b) = A,
- δ (C, b) = B,
- δ (D, b) = B.

![image](images/NFAs-state-diagram.jpg)

## Por qué resolver un AFN (_NFA_) es interesante en Prolog

Porque en un [autómata finito no-determinístico](https://es.wikipedia.org/wiki/Aut%C3%B3mata_finito_no_determinista)

- dado un estado podría haber múltiples transiciones posibles (y todas válidas)
- cada estado siguiente puede elegirse al azar y en paralelo
- y eso determina que la palabra puede parsear ok por más de un camino
