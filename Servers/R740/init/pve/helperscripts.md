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





