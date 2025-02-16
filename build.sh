#!/bin/bash
set -ouex pipefail

rpm-ostree install rclone
rpm-ostree install kodi

# --- systemd ---
systemctl enable podman.socket
systemctl enable tailscaled
systemctl enable ublue-update.timer

