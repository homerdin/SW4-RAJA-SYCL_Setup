
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
	#. ./spack/share/spack/setup-env.sh
	

# Reproducers
fom:
	mkdir fom
	cd ./sw4/examples/rfile
	../../optimize_sycl/sw4 ./berkeley-r.in > ../../../fom/berkeley.out

reduction:
	mkdir reduction

small_register:
	mkdir small_register

non_serialize:
	mkdir non_serialize

#function pointer

clean:
	rm -rf RAJA
	rm -rf spack
	rm -rf sw4
	rm -rf install
	rm sw4_build_job.out
	rm sw4_build_job.err
