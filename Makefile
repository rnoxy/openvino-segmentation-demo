include config.sh

build-cpu:
	docker build -t openvino-cpu \
		--build-arg package_url=$(PACKAGE_URL) \
		- < Dockerfile.cpu

build-gpu:
	docker build -t openvino-gpu \
		--build-arg package_url=$(PACKAGE_URL) \
		- < Dockerfile.gpu

run-shell-cpu:
	docker run --rm \
		--volume=${PWD}/img:/home/openvino/img \
		--volume=${PWD}/scripts:/home/openvino/scripts \
		-it openvino-cpu

run-shell-gpu:
	docker run --rm \
		--volume=${PWD}/img:/home/openvino/img \
		--volume=${PWD}/scripts:/home/openvino/scripts \
		-it openvino-gpu
		
#/home/openvino/omz_demos_build/intel64/Release/segmentation_demo -i /home/openvino/img/image.jpg -m /home/openvino/models/intel/${MODEL}/${PREC}/${MODEL}.xml -no_show

