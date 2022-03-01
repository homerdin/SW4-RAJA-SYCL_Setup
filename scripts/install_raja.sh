#!/bin/bash

DATE=$(printf '%(%Y-%m-%d)T\n' -1)

if test -d ${1}/install/raja.${DATE} ; then
  echo "Already installed"
  exit 0
fi

git clone --recursive https://github.com/LLNL/RAJA.git 

cd RAJA

BUILD_SUFFIX=sycl
: ${BUILD_TYPE:=RelWithDebInfo}
#RAJA_HOSTCONFIG=../host-configs/alcf-builds/sycl.cmake

rm -rf build_${BUILD_SUFFIX}_${USER} >/dev/null
mkdir build_${BUILD_SUFFIX}_${USER} && cd build_${BUILD_SUFFIX}_${USER}


cmake \
  -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
  -DRAJA_COMPILER=RAJA_COMPILER_CLANG \
  -DCMAKE_CXX_COMPILER=dpcpp \
  -DCMAKE_CXX_FLAGS_RELEASE="-O3 -fsycl" \
  -DCMAKE_INSTALL_PREFIX=${1}/install/raja.${DATE} \
  -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-O3 -g -fsycl" \
  -DCMAKE_CXX_FLAGS_DEBUG="-O- -g -fsycl" \
  -DCMAKE_CXX_LINK_FLAGS="-fsycl" \
  -DRAJA_RANGE_ALIGN=4 \
  -DRAJA_RANGE_MIN_LENGTH=32 \
  -DRAJA_DATA_ALIGN=64 \
  -DENABLE_OPENMP=Off \
  -DENABLE_CUDA=Off \
  -DRAJA_ENABLE_TARGET_OPENMP=Off \
  -DENABLE_ALL_WARNINGS=Off \
  -DRAJA_ENABLE_SYCL=On \
  -DCMAKE_LINKER=clang++ \
  -DCMAKE_CXX_STANDARD=17 \
  -DENABLE_TESTS=On \
  -DENABLE_EXAMPLES=On \
  "$@" \
  ..

cd build_${BUILD_SUFFIX}_${USER}
make -j 18
make install
