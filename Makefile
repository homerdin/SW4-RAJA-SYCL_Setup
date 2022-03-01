
# File to setup SW4 RAJA-SYCL port 

TOP_LEVEL_DIR=$(shell pwd)

sw4: raja
	./scripts/install_sw4.sh ${TOP_LEVEL_DIR}

proj: 
	./scripts/install_proj.sh

raja: 
	./scripts/install_raja.sh ${TOP_LEVEL_DIR}

clean:
	rm -rf RAJA
