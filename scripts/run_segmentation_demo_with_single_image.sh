for MODEL in semantic-segmentation-adas-0001 road-segmentation-adas-0001
do
	for PREC in FP16-INT8 FP16 FP32
	do
		echo "*********************"
		echo Model $MODEL
		echo PREC $PREC
		/home/openvino/omz_demos_build/intel64/Release/segmentation_demo -i /home/openvino/img/image.jpg -m /home/openvino/models/intel/${MODEL}/${PREC}/${MODEL}.xml -no_show
	done
done

MODEL=deeplabv3-bin
for PREC in FP16 FP32
do
	echo "*********************"
	echo Model $MODEL
	echo PREC $PREC
	/home/openvino/omz_demos_build/intel64/Release/segmentation_demo -i /home/openvino/img/image.jpg -m /home/openvino/models/public/${MODEL}/${PREC}/frozen_inference_graph.xml  -no_show
done

