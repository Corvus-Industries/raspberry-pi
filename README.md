# Raspberry-PI

Files for configuring the corvus raspberry pi.

- `install-accesspoint.sh` - installs and sets up a wifi access point.
  - enable and disable with `accesspoint start` and `accesspoint stop`
- `install-mavlink-router.sh` - installs mavlink router (run with `mavlink-routerd`)
- `lscam` - shortcut for listing available cameras
- `gstreamerstart` - script for starting gstreamer connection

## Installation

### Install scripts

Applies to `install-accesspoint.sh` and `install-mavlink-router.sh`

1. Download the script (e.g.: using wget)
2. Give run permissions to the script (`chmod +x SCRIPT_NAME`)
3. Run the script (`./SCRIPT_NAME` or `bash ./SCRIPT_NAME`)

### Individual scripts

1. Download the script (e.g.: using wget)
2. Give run permissions to the script (`chmod +x SCRIPT_NAME`)
3. Move the script to `/usr/local/bin`

## `accesspoint.sh`

Usage instructions:

Run `accesspoint start` to start the access point (will cause the pi to be unable to connect to Wifi)

Run `accesspoint stop` to stop the access point (enables wifi again).

**Do not run stop while connected through ssh on the access point, as that connection will be terminated.**
