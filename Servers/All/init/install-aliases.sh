#!/usr/bin/env bash

set -e

ALIAS_FILE="/etc/profile.d/00-global-aliases.sh"

echo "[*] Installing global aliases (with ZFS) to $ALIAS_FILE"

# Backup existing file
if [ -f "$ALIAS_FILE" ]; then
    echo "[*] Backing up existing alias file..."
    cp "$ALIAS_FILE" "${ALIAS_FILE}.bak.$(date +%s)"
fi

cat << 'EOF' > "$ALIAS_FILE"
#!/usr/bin/env bash

########################################
# Load only in interactive shells
########################################
case $- in
    *i*) ;;
      *) return;;
esac

########################################
# Better defaults
########################################
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

#I do this, but I want the option to go non-human.
#alias df='df -h'
#alias du='du -h'
#alias free='free -h'

########################################
# Proxmox helpers
########################################
alias pve-status='systemctl status pveproxy pvedaemon pvestatd'
alias pve-logs='journalctl -u pveproxy -u pvedaemon -u pvestatd --no-pager'
alias pve-restart='systemctl restart pveproxy pvedaemon pvestatd'

########################################
# Networking
########################################
alias ipinfo='ip -br a'
alias ports='ss -tulnp'
alias myip='hostname -I'
alias routes='ip route'

########################################
# Disk / storage
########################################
alias mounts='lsblk -f'
alias disks='lsblk -o NAME,SIZE,TYPE,MOUNTPOINT'
alias space='df -hT'

########################################
# Process helpers
########################################
alias top10='ps aux --sort=-%mem | head'
alias cpu10='ps aux --sort=-%cpu | head'
alias psg='ps aux | grep -i'

########################################
# ZFS Aliases (SAFE + READ-FOCUSED)
########################################

# Pool status & health
alias zpool-status='zpool status -v'
alias zpool-list='zpool list'
alias zpool-iostat='zpool iostat -v 1'

# Dataset listing
alias zfs-list='zfs list'
alias zfs-list-all='zfs list -t all'

# Snapshots
alias zfs-snapshots='zfs list -t snapshot'
alias zfs-snapshots-size='zfs list -o name,used,refer -t snapshot'

# Space usage
alias zfs-space='zfs list -o name,used,avail,refer,mountpoint -t filesystem'

# Quick scrub control (manual on purpose)
alias zpool-scrub-start='zpool scrub'
alias zpool-scrub-stop='zpool scrub -s'

# ARC stats (if available)
alias arc='cat /proc/spl/kstat/zfs/arcstats | grep -E "^(size|c_max|c_min|hits|misses)"'

# ZFS events
alias zfs-events='zpool events -v'

########################################
# Convenience
########################################
alias reload='source /etc/profile'
alias aliases='nano /etc/profile.d/00-global-aliases.sh'

EOF

chmod 755 "$ALIAS_FILE"

echo "[*] Applying..."
source /etc/profile || true

echo "[*] Done!"
echo "[*] Open a new shell or run: source /etc/profile"
