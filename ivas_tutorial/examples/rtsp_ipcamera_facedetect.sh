LATENCY=200
STREAM_SOURCE=rtsp://10.0.0.1:8554/face
## STREAM_SOURCE=rtsp://admin:password@192.168.1.2:554/ch34/main/av_stream
VCU_QUEUE_SETTINGS="max-size-buffers=30 leaky=2 min-threshold-buffers=10"

modetest -M xlnx -w 40:g_alpha_en:0
gst-launch-1.0 -v \
	rtspsrc latency=$LATENCY location=$STREAM_SOURCE ! \
		rtph264depay ! \
		h264parse ! \
		omxh264dec internal-entropy-buffers=3 ! \
		queue $VCU_QUEUE_SETTINGS name=vcu_buffer_0 ! \
		tee name=t0 t0.src_0 ! \
			queue ! \
			ivas_xmultisrc kconfig="./json/kernel_xpp_pipeline.json" ! ivas_xfilter kernels-config="./json/kernel_ML_facedetect.json" ! \
			scalem0.sink_master ivas_xmetaaffixer name=scalem0 scalem0.src_master ! fakesink \
		t0.src_1 ! \
			scalem0.sink_slave_0 scalem0.src_slave_0 ! \
			queue ! \
			ivas_xfilter kernels-config="./json/kernel_swbbox_facedetect.json" ! \
			kmssink driver-name=xlnx

modetest -M xlnx -w 40:g_alpha_en:1
