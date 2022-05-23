
# File to setup SW4 RAJA-SYCL port 

TOP_LEVEL_DIR=$(shell pwd)

sw4: raja proj umpire
	./scripts/install_sw4.sh ${TOP_LEVEL_DIR}

proj: spack
	./scripts/install_proj.sh

raja: 
	./scripts/install_raja.sh ${TOP_LEVEL_DIR}

umpire: spack
	./scripts/install_umpire.sh

spack:
	git clone -c feature.manyFiles=true https://github.com/spack/spack.git
	. ./spack/share/spack/setup-env.sh

clean:
	rm -rf RAJA
