#!/bin/bash

find experiments -name test | sort  | xargs -n 1 bash

for p in policies/*.n3s ; do
    echo "test $p > $p.n3"
    ./bin/test.sh $p > $p.n3
done