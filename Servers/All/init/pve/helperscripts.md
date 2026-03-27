# Preferred Proxmox Helper Community Scripts
Important note: Don't blindly curl-bash. Review each first.

This is the list of helper scripts that I personally prefer on my systems to be executed. Your mileage may vary.
I have listed these in order.
Source: [community-scripts.org](https://community-scripts.org/)

## PVE Post Install
Toasts nag screens, sets repo up properly.
Yes, you need to reboot.
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/pve/post-pve-install.sh)"
```

## PVE Processor Microcode
Fixes. Run only once per node.
Yes, you need to reboot.
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/pve/microcode.sh)"
```

## PVE LXC Tag - IP Address Tag Auto-Add.
Sometimes you just get tired of looking for the IP.
```bash
apt-get install -y ipcalc net-tools
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/pve/add-iptag.sh)"
```

