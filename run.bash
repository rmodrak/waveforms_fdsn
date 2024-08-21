#!/bin/bash

for dir in $(ls -d ????-??-??T??-??-??*/)
do
    echo $dir
    cd $dir
    for file in $(ls *.yaml)
    do
        echo $file
        pysep -c $file &> /dev/null
        tar -czf "${file%.*}.tgz" "${file%.*}"
    done
    cd ..
done
