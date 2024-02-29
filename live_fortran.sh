#!/bin/bash


ls $1 | entr /bin/bash -c "echo =========== COMPILING ==============  && gfortran -o run.exe $1 && ./run.exe"

