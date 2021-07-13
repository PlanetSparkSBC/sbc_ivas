modetest -M xlnx -w 40:g_alpha_en:0
gst-launch-1.0 filesrc location="./videos/face_4k.mp4" ! qtdemux ! h264parse ! omxh264dec internal-entropy-buffers=3 ! \
       tee name=t0 t0.src_0 ! \
       	queue ! ivas_xmultisrc kconfig="./json/kernel_xpp_pipeline.json" ! ivas_xfilter kernels-config="./json/kernel_ML_facedetect.json" ! \
       scalem0.sink_master ivas_xmetaaffixer name=scalem0 scalem0.src_master ! fakesink \
       t0.src_1 ! \
       	scalem0.sink_slave_0 scalem0.src_slave_0 ! queue ! \
	ivas_xfilter kernels-config="./json/kernel_swbbox_facedetect.json" ! \
	kmssink driver-name=xlnx \
filesrc location="./videos/face_4k.mp4" ! qtdemux ! h264parse ! omxh264dec internal-entropy-buffers=3 ! \
       tee name=t1 t1.src_0 ! \
       	queue ! ivas_xmultisrc kconfig="./json/kernel_xpp_pipeline.json" ! ivas_xfilter kernels-config="./json/kernel_ML_facedetect.json" ! \
       scalem1.sink_master ivas_xmetaaffixer name=scalem1 scalem1.src_master ! fakesink \
       t1.src_1 ! \
       	scalem1.sink_slave_0 scalem1.src_slave_0 ! queue ! \
	ivas_xfilter kernels-config="./json/kernel_swbbox_facedetect.json" ! \
	fakesink
modetest -M xlnx -w 40:g_alpha_en:1
