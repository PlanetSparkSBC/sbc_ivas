gst-launch-1.0 filesrc location="./videos/face_1080p.mp4" ! qtdemux ! h264parse ! omxh264dec internal-entropy-buffers=3 ! \
	tee name=t0 t0.src_0 ! \
	queue ! ivas_xmultisrc kconfig="./json/kernel_xpp_pipeline.json" ! ivas_xfilter kernels-config="./json/kernel_ML_facedetect.json" ! \
	scalem0.sink_master ivas_xmetaaffixer name=scalem0 scalem0.src_master ! fakesink \
	t0.src_1 ! \
	scalem0.sink_slave_0 scalem0.src_slave_0 ! queue ! \
	ivas_xfilter kernels-config="./json/kernel_swbbox_facedetect.json" ! \
	ivas_xroigen roi-type=2 roi-qp-delta=-20 ! queue ! \
	omxh264enc qp-mode=1 ! \
	filesink location=./enc.h264