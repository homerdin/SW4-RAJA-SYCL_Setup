# SW4-RAJA-SYCL\_Setup

Setup for the SW4 RAJA-SYCL port

On JLSE:
`source ./env/sw4`
`make`

1. Setup Environment
  - Needs
    - recent cmake
      - JLSE loaded by env/sw4 -> env/jlse
    - dpcpp
      - JLSE loaded by env/sw4 -> env/jlse
    - mpiifx 
      - JLSE loaded by env/sw4 -> env/jlse
    - mpicxx (targeted to dpcpp) 
      - JLSE loaded by env/sw4 -> env/jlse
    - installed proj (5.2.0 known good)
      - Currently hardcoded to JLSE path in env/sw4 and sw4 makefile config
    - umpire 
      - Currently hardcoded to JLSE in sw4 makefile
    - CPU side MKL
      - Currently hardcoded to JLSE in sw4 makefile
