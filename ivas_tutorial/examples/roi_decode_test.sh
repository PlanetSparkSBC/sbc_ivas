modetest -M xlnx -w 40:g_alpha_en:0

gst-launch-1.0 filesrc location=./enc.h264 ! h264parse ! omxh264dec internal-entropy-buffers=3 ! \
	kmssink driver-name=xlnx

modetest -M xlnx -w 40:g_alpha_en:1