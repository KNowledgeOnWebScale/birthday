#!/bin/bash

WHAT=$1
QUERY=$2

if [ "${WHAT}" == "" ]; then
   echo "usage: $0 policy [show]"
   exit 1
fi

show() {
   echo "# eye --nope --no-bnode-relabeling --quiet n3s/compiler.n3s ${1} n3s/show.n3s"
   eye --nope --no-bnode-relabeling --quiet n3s/compiler.n3s ${1} n3s/show.n3s
}

query () {
   echo "# eye --nope --no-bnode-relabeling --quiet n3s/compiler.n3s ${1} n3s/query.n3s"
   eye --nope --no-bnode-relabeling --quiet n3s/compiler.n3s ${1} n3s/query.n3s
}

if [ "${WHAT}" == "all" ]; then
   for f in policies/policy*; do
      echo "[$f]"
      query $f
   done
elif [ "${QUERY}" == "show" ]; then
   show ${WHAT}
else
   query ${WHAT}
fi
