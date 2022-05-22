# Raspberry-PI
Files for configuring the corvus raspberry pi.

## accesspoint.sh - used to enable and disable the pi's wifi access point

(Note: due to unfamiliarity with using bash scripting, this script is crude, but still functional)

### Installation:

In a terminal, run:

(will change the wget link once this repository becomes public)
```bash
wget https://gist.githubusercontent.com/brokenfloppydisk/78848b9ec7c67a9847ef8d5ac1dba15f/raw/bb135e9cc3b122227b4d1d3b1fbe86976859fc32/accesspoint.sh
sudo chmod +x accesspoint.sh
sudo mv ./accesspoint.sh /usr/local/bin/accesspoint
```

### Usage:

Run `accesspoint start` to start the access point (will cause the pi to be unable to connect to Wifi)

Run `accesspoint stop` to stop the access point (enables wifi again).

**Do not run stop while connected through ssh on the access point, as that connection will be terminated.**
