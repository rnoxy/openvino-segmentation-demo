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
		--runtime=nvidia \
		-it openvino-gpu

run-shell-with-camera-cpu:
	docker run --rm \
		--volume=${PWD}/img:/home/openvino/img \
		--volume=${PWD}/scripts:/home/openvino/scripts \
		--privileged -v /dev/video0:/dev/video0 \
		--network=host --env DISPLAY=${DISPLAY} \
		-it openvino-cpu		
		
run-shell-with-camera-gpu:
	docker run --rm \
		--volume=${PWD}/img:/home/openvino/img \
		--volume=${PWD}/scripts:/home/openvino/scripts \
		--runtime=nvidia \
		--privileged -v /dev/video0:/dev/video0 \
		--network=host --env DISPLAY=${DISPLAY} \
		--volume /home/rno/.Xauthority:/root/.Xauthority \
		-it openvino-gpu

