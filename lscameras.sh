#!/usr/bin/bash

echo "Available cameras:"

v4l2-ctl --list-devices
