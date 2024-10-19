#!/bin/bash

QTYPE=n3s/query.n3s

while getopts ":s" option; do
   case $option in
      s) QTYPE=n3s/show.n3s
        ;;
   esac
done

shift $((OPTIND-1))

eye --nope --no-bnode-relabeling --quiet n3s/compiler.n3s n3s/equivalence.n3s $QTYPE "$@"