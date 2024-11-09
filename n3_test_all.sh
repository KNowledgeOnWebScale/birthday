#!/bin/bash

find experiments -name n3_test | sort  | xargs -n 1 bash

for p in policies/*.n3s ; do
    echo "test $p > $p.n3_test"
    eye --nope --quiet --pass n3/compiler.n3 $p > $p.n3_test
done