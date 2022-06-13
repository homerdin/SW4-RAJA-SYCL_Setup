#!/bin/bash
#COBALT --jobname SW4_Build
#COBALT -o sw4_build_job.out
#COBALT -e sw4_build_job.err
#COBALT -n 1
#COBALT -q arcticus
#COBALT -t 180
cd /home/bhomerding/repo/SW4-RAJA-SYCL_Setup
source ./env/sw4
make
