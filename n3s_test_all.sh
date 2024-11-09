#!/bin/bash

find experiments -name n3s_test | sort  | xargs -n 1 bash

for p in policies/*.n3s ; do
    echo "test $p > $p.n3s_test"
    ./bin/n3s_test.sh $p > $p.n3s_test
done