#!/bin/bash
set -ouex pipefail

rpm-ostree install rclone
rpm-ostree install kodi

echo 'install build dependencys'
rpm-ostree install SDL2-devel SDL2_image-devel SDL2_ttf-devel inih-devel
echo 'clone master repo and create build dir'
git clone https://github.com/complexlogic/flex-launcher.git
cd flex-launcher
mkdir build && cd build
echo 'generate make file'
cmake .. -DCMAKE_INSTALL_PREFIX=/var/lib/alternatives
echo 'build and test'
make
./flex-launcher
echo 'install'
make -n install

# --- systemd ---
systemctl enable podman.socket
systemctl enable tailscaled
systemctl enable ublue-update.timer

