#!/bin/sh

export SQUAD_DIR=.

mpirun -n 2 -H localhost:1,localhost:1 --allow-run-as-root  run_squad.sh 
