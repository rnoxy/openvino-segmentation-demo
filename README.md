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
- compiles of all OpenVino demos from deployment tools
- downloads the following models for segmentation demo:
-- `semantic-segmentation-adas-0001` (in OpenVino binary format)
-- `road-segmentation-adas-0001` (in OpenVino binary format)
-- `deeplabv3_mnv2_pascal_train_aug` (inf TF format)
- optimize the `deeplabv3_mnv2_pascal_train_aug` and saves it in OpenVino binary format

