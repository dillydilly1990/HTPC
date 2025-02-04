#!/bin/bash

set -ouex pipefail

# --- Copy Custom Files & Overides ---

# --- Install Emudeck ---
#curl -L https://raw.githubusercontent.com/dragoonDorise/EmuDeck/main/install.sh | bash

# --- Install Kodi

# Change the autologin from gamescope-session
# cp  /etc/sddm.conf.d/steamos.conf

# --- Install Rclone ---
rpm-ostree install rclone

# --- Enable System Unit Files ---
systemctl enable podman.socket
systemctl enable tailscaled
systemctl enable ublue-update.timer

