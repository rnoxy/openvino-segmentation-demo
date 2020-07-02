build-cpu:
	docker build -t openvino-cpu - < Dockerfile.cpu

build-gpu:
	docker build -t openvino-gpu - < Dockerfile.gpu


