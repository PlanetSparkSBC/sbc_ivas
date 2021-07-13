modetest -M xlnx -w 40:g_alpha_en:0

gst-launch-1.0 \
filesrc location="./videos/face_1080p.mp4" ! qtdemux ! h264parse ! omxh264dec internal-entropy-buffers=3 ! \
       tee name=t0 t0.src_0 ! \
       	queue ! ivas_xmultisrc kconfig="./json/kernel_xpp_pipeline.json" ! ivas_xfilter kernels-config="./json/kernel_ML_facedetect.json" ! \
       scalem0.sink_master ivas_xmetaaffixer name=scalem0 scalem0.src_master ! fakesink \
       t0.src_1 ! \
       	scalem0.sink_slave_0 scalem0.src_slave_0 ! queue ! \
	ivas_xfilter kernels-config="./json/kernel_swbbox_facedetect.json" ! \
	kmssink driver-name=xlnx \
filesrc location="./videos/face_1080p.mp4" ! qtdemux ! h264parse ! omxh264dec internal-entropy-buffers=3 ! \
       tee name=t1 t1.src_0 ! \
       	queue ! ivas_xmultisrc kconfig="./json/kernel_xpp_pipeline.json" ! ivas_xfilter kernels-config="./json/kernel_ML_facedetect.json" ! \
       scalem1.sink_master ivas_xmetaaffixer name=scalem1 scalem1.src_master ! fakesink \
       t1.src_1 ! \
       	scalem1.sink_slave_0 scalem1.src_slave_0 ! queue ! \
	ivas_xfilter kernels-config="./json/kernel_swbbox_facedetect.json" ! \
	fakesink \
filesrc location="./videos/face_1080p.mp4" ! qtdemux ! h264parse ! omxh264dec internal-entropy-buffers=3 ! \
       tee name=t2 t2.src_0 ! \
       	queue ! ivas_xmultisrc kconfig="./json/kernel_xpp_pipeline.json" ! ivas_xfilter kernels-config="./json/kernel_ML_facedetect.json" ! \
       scalem2.sink_master ivas_xmetaaffixer name=scalem2 scalem2.src_master ! fakesink \
       t2.src_1 ! \
       	scalem2.sink_slave_0 scalem2.src_slave_0 ! queue ! \
	ivas_xfilter kernels-config="./json/kernel_swbbox_facedetect.json" ! \
	fakesink \
filesrc location="./videos/face_1080p.mp4" ! qtdemux ! h264parse ! omxh264dec internal-entropy-buffers=3 ! \
       tee name=t3 t3.src_0 ! \
       	queue ! ivas_xmultisrc kconfig="./json/kernel_xpp_pipeline.json" ! ivas_xfilter kernels-config="./json/kernel_ML_facedetect.json" ! \
       scalem3.sink_master ivas_xmetaaffixer name=scalem3 scalem3.src_master ! fakesink \
       t3.src_1 ! \
       	scalem3.sink_slave_0 scalem3.src_slave_0 ! queue ! \
	ivas_xfilter kernels-config="./json/kernel_swbbox_facedetect.json" ! \
	fakesink \
filesrc location="./videos/face_1080p.mp4" ! qtdemux ! h264parse ! omxh264dec internal-entropy-buffers=3 ! \
       tee name=t4 t4.src_0 ! \
       	queue ! ivas_xmultisrc kconfig="./json/kernel_xpp_pipeline.json" ! ivas_xfilter kernels-config="./json/kernel_ML_facedetect.json" ! \
       scalem4.sink_master ivas_xmetaaffixer name=scalem4 scalem4.src_master ! fakesink \
       t4.src_1 ! \
       	scalem4.sink_slave_0 scalem4.src_slave_0 ! queue ! \
	ivas_xfilter kernels-config="./json/kernel_swbbox_facedetect.json" ! \
	fakesink \
filesrc location="./videos/face_1080p.mp4" ! qtdemux ! h264parse ! omxh264dec internal-entropy-buffers=3 ! \
       tee name=t5 t5.src_0 ! \
       	queue ! ivas_xmultisrc kconfig="./json/kernel_xpp_pipeline.json" ! ivas_xfilter kernels-config="./json/kernel_ML_facedetect.json" ! \
       scalem5.sink_master ivas_xmetaaffixer name=scalem5 scalem5.src_master ! fakesink \
       t5.src_1 ! \
       	scalem5.sink_slave_0 scalem5.src_slave_0 ! queue ! \
	ivas_xfilter kernels-config="./json/kernel_swbbox_facedetect.json" ! \
	fakesink \
filesrc location="./videos/face_1080p.mp4" ! qtdemux ! h264parse ! omxh264dec internal-entropy-buffers=3 ! \
       tee name=t6 t6.src_0 ! \
       	queue ! ivas_xmultisrc kconfig="./json/kernel_xpp_pipeline.json" ! ivas_xfilter kernels-config="./json/kernel_ML_facedetect.json" ! \
       scalem6.sink_master ivas_xmetaaffixer name=scalem6 scalem6.src_master ! fakesink \
       t6.src_1 ! \
       	scalem6.sink_slave_0 scalem6.src_slave_0 ! queue ! \
	ivas_xfilter kernels-config="./json/kernel_swbbox_facedetect.json" ! \
	fakesink \
filesrc location="./videos/face_1080p.mp4" ! qtdemux ! h264parse ! omxh264dec internal-entropy-buffers=3 ! \
       tee name=t7 t7.src_0 ! \
       	queue ! ivas_xmultisrc kconfig="./json/kernel_xpp_pipeline.json" ! ivas_xfilter kernels-config="./json/kernel_ML_facedetect.json" ! \
       scalem7.sink_master ivas_xmetaaffixer name=scalem7 scalem7.src_master ! fakesink \
       t7.src_1 ! \
       	scalem7.sink_slave_0 scalem7.src_slave_0 ! queue ! \
	ivas_xfilter kernels-config="./json/kernel_swbbox_facedetect.json" ! \
	fakesink 

modetest -M xlnx -w 40:g_alpha_en:1
