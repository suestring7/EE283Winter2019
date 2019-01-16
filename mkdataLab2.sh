#!/bin/bash

if [ ! -d lab2data ]
then
    mkdir lab2data
fi

# Clean up

rm -rf lab2data/*

declare -a SUBDIRS=("data" "output")

for s in "${SUBDIRS[@]}"
do
    mkdir lab2data/$s
done

for i in $(seq 1 1 50)
do
    touch lab2data/data/datafile.$i.a.txt
    touch lab2data/data/datafile.$i.b.txt
done

for i in $(seq 1 3 50)
do
    touch lab2data/output/outfile.$i.a.out
done

for i in $(seq 1 7 50)
do
    touch lab2data/output/outfile.$i.b.out
done
