#!/usr/bin/bash

echo "Starting gstreamer stream to ip $2 from camera on $1!" 

sudo gst-launch-1.0 -v v4l2src device=$1 ! video/x-h264, width=640, height=360 ! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=$2 port=5600 sync=false

