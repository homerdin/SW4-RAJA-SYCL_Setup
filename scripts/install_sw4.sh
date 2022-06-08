#!/bin/bash

git clone --single-branch --branch sycl_pr https://github.com/homerdin/sw4.git

DATE=$(printf '%(%Y-%m-%d)T\n' -1)

cd sw4
#. ${1}/spack/share/spack/setup-env.sh
UMPIRE_HM=$(${1}/spack/bin/spack find -p umpire | grep umpire | awk -F ' ' '{print $2}')
PROJ_HM=$(${1}/spack/bin/spack find -p proj | grep proj | awk -F ' ' '{print $2}')

echo $UMPIRE_HM
echo $PROJ_HM

source ./env/sw4

# On JLSE gets built with gcc (asan), but not available when using dpcpp.
# Configuration of Spack to use icx is not automatic
sed -i 's/#define UMPIRE_HAS_ASAN/\/\* #undef UMPIRE_HAS_ASAN \*\//g' ${UMPIRE_HM}/include/umpire/config.hpp

make -f Makefile.sycl RAJA_HOME=${1}/install/raja.${DATE} UMPIRE_HOME=${UMPIRE_HM} PROJ_HOME=${PROJ_HM}
#make -f Makefile.sycl RAJA_HOME=${1}/install/raja.${DATE}  PROJ_HOME=${PROJ_HM}
