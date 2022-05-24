#!/usr/bin/env python3

import argparse
import sys
import os

def run_commands(*commands):
    for command in commands:
        os.system(command)

if not sys.platform.startswith("linux"):
    print("This script is only compatible with linux devices (Raspberry PI).")
    sys.exit(1)

parser = argparse.ArgumentParser(description="Enable or disable the wifi access point.")

parser.add_argument(choices=["start", "stop", "restart"], nargs=1, dest="start", 
                    help="Whether to start, stop, or restart the wifi access point.")

args = parser.parse_args()

start: str = args.start

run_commands("sudo systemctl stop dnsmasq",
       	     "sudo systemctl stop dhcpcd",
       	     "sudo systemctl stop hostapd")
if start == "start":
    os.system("sudo sed - i 's/# denyinterfaces wlan0/denyinterfaces wlan0/' / etc/dhcpcd.conf")
elif start == "stop":
    os.system("sudo sed - i 's/denyinterfaces wlan0/# denyinterfaces wlan0/' / etc/dhcpcd.conf")
if start == "start" or start == "restart":
    run_commands("sudo systemctl start dnsmasq",
                 "sudo systemctl start hostapd")
os.system("sudo systemctl start dhcpcd")

