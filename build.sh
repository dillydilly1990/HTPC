#!/bin/bash

set -ouex pipefail

# --- Copy Custom Files & Overides ---


# --- Install Emudeck ---
curl -L https://raw.githubusercontent.com/dragoonDorise/EmuDeck/main/install.sh | bash

# Change the autologin from gamescope-session
# cp  /etc/sddm.conf.d/steamos.conf

# --- Install Kodi flatpack
mkdir /tmp/build/kodi/
cd /tmp/build/kodi/
git clone https://github.com/flathub/tv.kodi.Kodi.git
flatpak-builder build-dir --user --ccache --force-clean --install tv.kodi.Kodi.yml

#flatpak install -y --noninteractive flathub tv.kodi.Kodi
# --- Install Fedora Fackages ---

rpm-ostree install rclone

# --- Enable System Unit Files ---

systemctl enable podman.socket
systemctl enable tailscaled
systemctl enable ublue-update.timer

