#!/bin/bash

set -ouex pipefail

### Install packages
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1
rpm-ostree install rclone
rpm-ostree install vim

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable tailscaled

#### Remove the autologin to gamescope-session
# rm /etc/sddm.conf.d/steamos.conf
#### Undo some bazzite-deck specific services we do not need anymore
# systemctl disable bazzite-autologin.service && \
# systemctl enable ublue-update.timer
