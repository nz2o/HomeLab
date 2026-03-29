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
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/proxmox-backup-server.sh)"
```
