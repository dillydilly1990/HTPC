#!/bin/bash

set -ouex pipefail

# --- Copy Custom Files & Overides ---

# Change the autologin from gamescope-session
# cp  /etc/sddm.conf.d/steamos.conf

# --- Install Flatpacks
flatpak install -y --noninteractive flathub tv.kodi.Kodi
# --- Install Fedora Fackages ---

rpm-ostree install rclone

# --- Enable System Unit Files ---

systemctl enable podman.socket
systemctl enable tailscaled
systemctl enable ublue-update.timer

