mkdir -p ./Documents/
cd ./Documents/

echo "Installing dependencies..."

sudo apt-get install git ninja-build pkg-config gcc g++ systemd python3
python3 -m pip install meson>=0.55

echo "Cloning mavlink-router (https://github.com/mavlink-router/mavlink-router)"

git clone https://github.com/mavlink-router/mavlink-router --recurse-submodules

cd mavlink-router

echo "Building mavlink-router..."

python3 -m meson setup build .

ninja -C build

echo "Installing mavlink-router..."

sudo ninja -C build install

echo "Installation complete. Run mavlink-router or see the git repo 
(https://github.com/mavlink-router/mavlink-router) for more info."
