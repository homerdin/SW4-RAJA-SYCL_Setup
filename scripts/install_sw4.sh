#!/bin/bash

git clone --single-branch --branch sycl_pr https://github.com/homerdin/sw4.git

DATE=$(printf '%(%Y-%m-%d)T\n' -1)

cd sw4

make -f Makefile.sycl RAJA_HOME=${1}/install/raja.${DATE} 
