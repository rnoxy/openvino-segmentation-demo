# openvino-segmentation-demo
OpenVino docker image and **working** segmentation demo

# Installation
**CPU**
> `make build-cpu`

**GPU**
> `make build-gpu`

The installation process build the image of Ubuntu 18.04 with
- OpenCV
- OpenVino toolkit
- python3 with TF and PyToch

The building process also:
- compiles all OpenVino demos (in C++) from deployment tools
- downloads the following models for segmentation demo:
  - `semantic-segmentation-adas-0001` (in OpenVino binary format)
  - `road-segmentation-adas-0001` (in OpenVino binary format)
  - `deeplabv3_mnv2_pascal_train_aug` (inf TF format)
- optimize the `deeplabv3_mnv2_pascal_train_aug` and saves it in OpenVino binary format

# Run segmentation demo on single [image.jpg](img/image.jpg)
One can simply run the `segmentation_demo` (from OpenVino deployment tools) in few steps

**Step 1.** Create the docker container and run the shell
> `make run-shell-cpu`

**Step 2.** In the docker container, run the shell script [run_segmentation_demo_with_single_image.sh](scripts/run_segmentation_demo_with_single_image.sh)
> `bash scripts/run_segmentation_demo_with_single_image.sh`

## Results
```
*********************
Model semantic-segmentation-adas-0001
PREC FP16-INT8
[ INFO ] InferenceEngine: 0x7f4f9538c040
[ INFO ] Parsing input parameters
[ INFO ] Device info
	CPU
	MKLDNNPlugin version ......... 2.1
	Build ........... 2020.3.0-3467-15f2c61a-releases/2020/3
Mean pipeline latency: 213.5 ms

[ INFO ] Execution successful
*********************
Model semantic-segmentation-adas-0001
PREC FP16
[ INFO ] InferenceEngine: 0x7fa8d6263040
[ INFO ] Parsing input parameters
[ INFO ] Device info
	CPU
	MKLDNNPlugin version ......... 2.1
	Build ........... 2020.3.0-3467-15f2c61a-releases/2020/3
Mean pipeline latency: 277.8 ms

[ INFO ] Execution successful
*********************
Model semantic-segmentation-adas-0001
PREC FP32
[ INFO ] InferenceEngine: 0x7fbb1b786040
[ INFO ] Parsing input parameters
[ INFO ] Device info
	CPU
	MKLDNNPlugin version ......... 2.1
	Build ........... 2020.3.0-3467-15f2c61a-releases/2020/3
Mean pipeline latency: 275.1 ms

[ INFO ] Execution successful
*********************
Model road-segmentation-adas-0001
PREC FP16-INT8
[ INFO ] InferenceEngine: 0x7fe37d9cd040
[ INFO ] Parsing input parameters
[ INFO ] Device info
	CPU
	MKLDNNPlugin version ......... 2.1
	Build ........... 2020.3.0-3467-15f2c61a-releases/2020/3
Mean pipeline latency: 35.4 ms

[ INFO ] Execution successful
*********************
Model road-segmentation-adas-0001
PREC FP16
[ INFO ] InferenceEngine: 0x7f958615d040
[ INFO ] Parsing input parameters
[ INFO ] Device info
	CPU
	MKLDNNPlugin version ......... 2.1
	Build ........... 2020.3.0-3467-15f2c61a-releases/2020/3
Mean pipeline latency: 37.7 ms

[ INFO ] Execution successful
*********************
Model road-segmentation-adas-0001
PREC FP32
[ INFO ] InferenceEngine: 0x7f87d7d7e040
[ INFO ] Parsing input parameters
[ INFO ] Device info
	CPU
	MKLDNNPlugin version ......... 2.1
	Build ........... 2020.3.0-3467-15f2c61a-releases/2020/3
Mean pipeline latency: 37.9 ms

[ INFO ] Execution successful
*********************
Model deeplabv3-bin
PREC FP16
[ INFO ] InferenceEngine: 0x7f1d5c860040
[ INFO ] Parsing input parameters
[ INFO ] Device info
	CPU
	MKLDNNPlugin version ......... 2.1
	Build ........... 2020.3.0-3467-15f2c61a-releases/2020/3
Mean pipeline latency: 59.6 ms

[ INFO ] Execution successful
*********************
Model deeplabv3-bin
PREC FP32
[ INFO ] InferenceEngine: 0x7fbb7ed73040
[ INFO ] Parsing input parameters
[ INFO ] Device info
	CPU
	MKLDNNPlugin version ......... 2.1
	Build ........... 2020.3.0-3467-15f2c61a-releases/2020/3
Mean pipeline latency: 59.7 ms

[ INFO ] Execution successful
```
