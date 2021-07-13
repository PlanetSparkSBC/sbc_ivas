modetest -M xlnx -w 40:g_alpha_en:0
gst-launch-1.0 filesrc location="./videos/face_4k.mp4" ! qtdemux ! h264parse ! omxh264dec internal-entropy-buffers=3 ! \
	kmssink driver-name=xlnx 
modetest -M xlnx -w 40:g_alpha_en:1
