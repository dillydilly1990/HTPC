#!/bin/bash

set -ouex pipefail

# --- Copy Custom Files & Overides ---

# --- Install Emudeck ---
#curl -L https://raw.githubusercontent.com/dragoonDorise/EmuDeck/main/install.sh | bash

# --- Install Kodi
rpm-ostree install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
rpm-ostree install kodi

# Change the autologin from gamescope-session
# cp  /etc/sddm.conf.d/steamos.conf

# --- Install Rclone ---
rpm-ostree install rclone

# --- Enable System Unit Files ---
systemctl enable podman.socket
systemctl enable tailscaled
systemctl enable ublue-update.timer

