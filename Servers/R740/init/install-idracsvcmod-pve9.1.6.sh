#!/usr/bin/env bash
set -euo pipefail
echo "Dell iDRAC Service Module install for Proxmox 9 (Debian 13 / trixie)"
read -rp "Proceed? (yes/no) " yn
[[ "${yn}" == "yes" ]] || { echo "Exiting..."; exit 0; }

# 1) Add Dell GPG key
install -d -m 0755 /usr/share/keyrings
curl -fsSL https://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc \
  | gpg --dearmor | tee /usr/share/keyrings/dell-openmanage.gpg >/dev/null

# 2) Add Bullseye source for iSM 5.4
cat > /etc/apt/sources.list.d/dell-ism.sources <<'EOF'
Types: deb
URIs: http://linux.dell.com/repo/community/openmanage/iSM/5400/bullseye
Suites: bullseye
Components: main
Signed-By: /usr/share/keyrings/dell-openmanage.gpg
Architectures: amd64
Enabled: yes
EOF

# 3) Pin iSM packages to prevent conflicts
cat > /etc/apt/preferences.d/dell-ism <<'EOF'
Package: dcism dcism-osc
Pin: origin "linux.dell.com"
Pin-Priority: 700

Package: *
Pin: origin "linux.dell.com"
Pin-Priority: -1
EOF

# 4) Install packages
apt update
apt install -y dcism-osc dcism

wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb

# 5) Enable service
systemctl enable --now dcismeng
service dcismeng restart

# Check status
systemctl --no-pager status dcismeng || true
journalctl -u dcismeng -b
