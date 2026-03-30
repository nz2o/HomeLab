# Favorite Helper Scripts
These helper scripts are favorites for my primary node.

## Proxmox Datacenter Manager (PDM)
First time trying this.
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/proxmox-datacenter-manager.sh)"
```

Well, update repos are as janky as PVE is. PVE has a standup script for community users like me though. Let's see...
None exists to hide nag popups. At least one thing is certain, you need to disable the enterprise repo and refresh updates.

### Adding my first node (main server).
1. Have to go get the self signed PVE SSL certificate, and grab the fingerprint, drop it in the probe remote tab, along with IP address.
2. Remote ID? Never heard of her. I'm choosing R740.
3. User? aw heck no. Creating a separate user.
4. On the actual node.....Permissions? Created a role for PDM. Datastore.AllocateSpace, Sys.Audit, Sys.Modify, VM.Allocate, VM.Audit are the permissions.
5. Created a PDM group in case I want multiple logins/tokens.
6. Go back to Permissions. Added path / Group PDM / Role PDM.
7. Time to test... Yay! that worked. Do it for other nodes now.
8. Later....

## Proxmox Backup Server
Going to try this out. Will use outboard USB disks. Going to have to figure out mounts. Might have to reinstall it to do that.
Make sure you define a root password - you will need that to make it work.
Enable additional allowed FS mounts, and FUSE. Might need that later.
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/proxmox-backup-server.sh)"
```

Ok, straight off, nag popup. Nag, nag, nag...
Execute this within Proxmox Backup shell/console.
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/pve/post-pbs-install.sh)"
```
Well THAT didn't work. Had to do something to reboot the LXC. It wasn't super happy with me after this...but it works now.

### Adding my first node (main server).
See the previous. I want a separate user for this. pbs will be what I call it on the node.
It needs PVESDNUser role, and also a new role with Datastore.AllocateSpace, Datastore.Audit, VM.Audit, VM.Backup.

Needs an API key...manually
All done - need to set up datastores and backups later...

## Remote Access
Ok here's the deal. OpenVPN is commonly brute forced. Wireguard is a lil stronger, but a pain in the tail. Reverse proxy? Yah um, some services aren't super strong, and you need to consider overlay networking or oauth security.

For security reasons, I am NOT telling what I'm doing. However, look around, decide what security level is best for you.... and have a good backup strategy along with monitoring.

#### Self hosting includes some responsibility to stay secure. You have been WARNED.

## OS VM or LXC? (Experimenting)
Trying out an LXC for Debian.
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/debian.sh)"
```

## Docker! Need Debian

### GUI Needed for Remmina

```bash
#!/bin/bash
# Debian 13 XFCE4 + XRDP + SSH + Docker
# Persistent XFCE sessions, multi-IP, force reconnect
# No firewall modifications

set -e

echo "=== Updating system ==="
sudo apt update && sudo apt upgrade -y

echo "=== Installing XFCE4 desktop ==="
sudo apt install -y xfce4 xfce4-goodies

echo "=== Installing XRDP and Xorg backend ==="
sudo apt install -y xrdp xorgxrdp

echo "=== Enable XRDP service ==="
sudo systemctl enable xrdp
sudo systemctl restart xrdp

echo "=== Configure XRDP to use XFCE ==="
# Set XFCE session for all new users
sudo bash -c 'echo "startxfce4" > /etc/skel/.xsession'
sudo chmod +x /etc/skel/.xsession

# Apply XFCE session for existing users
for user in $(ls /home); do
    if [ -d "/home/$user" ]; then
        sudo -u $user bash -c 'echo "startxfce4" > ~/.xsession'
        sudo -u $user chmod +x ~/.xsession
    fi
done

echo "=== Installing SSH ==="
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

echo "=== Installing Docker + Docker Compose ==="
sudo apt install -y docker.io docker-compose
sudo systemctl enable docker

echo "=== Setup complete ==="
echo "XRDP is running on TCP 3389."
echo "Each user will have a persistent XFCE session (reattaches on reconnect)."
echo "SSH is ready for Docker CLI management."
echo "Docker installed; logout/login for group permissions."
```

Need to expand the disk too.
```bash
sudo apt install cloud-guest-utils -y
sudo resize2fs /dev/sda1
```

