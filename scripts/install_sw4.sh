#!/bin/bash

git clone --single-branch --branch sycl_pr https://github.com/homerdin/sw4.git

DATE=$(printf '%(%Y-%m-%d)T\n' -1)

cd sw4
. ${1}/spack/share/spack/setup-env.sh
UMPIRE_HM=$(spack find -p umpire | grep umpire | awk -F ' ' '{print $2}')
PROJ_HM=$(spack find -p proj | grep proj | awk -F ' ' '{print $2}')

echo $UMPIRE_HM
echo $PROJ_HM

make -f Makefile.sycl RAJA_HOME=${1}/install/raja.${DATE} UMPIRE_HOME=${UMPIRE_HM} PROJ_HOME=${PROJ_HM}
#make -f Makefile.sycl RAJA_HOME=${1}/install/raja.${DATE}  PROJ_HOME=${PROJ_HM}
