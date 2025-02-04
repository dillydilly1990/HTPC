#!/bin/bash

set -ouex pipefail

# --- Copy Custom Files & Overides ---

# --- Install Emudeck ---
#curl -L https://raw.githubusercontent.com/dragoonDorise/EmuDeck/main/install.sh | bash

# --- Install skip-1s app
mkdir /tmp/
cd /tmp/
curl https://flirc.tv/products/skip1s-remote-universal-remote-control?variant=43489094729960#
flatpak install -y --noninteractive flirc.tv/products/skip1s-remote-universal-remote-control?variant=43489094729960#

# Change the autologin from gamescope-session
# cp  /etc/sddm.conf.d/steamos.conf

# --- Install Rclone ---
rpm-ostree install rclone

# --- Enable System Unit Files ---
systemctl enable podman.socket
systemctl enable tailscaled
systemctl enable ublue-update.timer

