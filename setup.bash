#!/bin/bash

function startswith {
    line="$1"
    if [[ "$line" == $2* ]]
      then
      return $(true)
    else
      return $(false)
    fi
}

function iscomment {
   return $(startswith "$line" \#)
}


if [ ! -e $1 ]; then
    echo "File not found: $1"
    exit -1
fi


while read line; do
  if $(iscomment "$line")
    then
    continue
  fi
  echo $line

  export PYSEP_TEMPLATE="$PWD/template.yaml"
  pysep_project $line

done <$1

