# Dell R740 Setup Steps

## Networking
nic3 (port 4) is Proxmox management, static IP.

## Storage
### Install Process.
BOSS-S1 card is installed? Let that be in RAID 1.
Front storage array - set controller to HBA mode.

Install Proxmox to the SSDs on BOSS-S1.
Set up a ZFS Pool on the HBA array.

### Configure ZFS disks.
0. `Datacenter> servername`, click *Disks*.
1. Wipe them if they've been used before.
2. Initialize them with GPT (GUID Partition Table).
3. Now click *ZFS*, then *Create:ZFS*.
4. Choose the disks that you want in the ZFS Pool, give the pool a name. I'll just use `rpool`
5. Choose the RAID Level. I chose RAIDZ2, so I can lose 2 of 8 drives before things are kaput. Rebuilds are slower than dRAID. If I had a R740XD, this would be very interesting, use dRAID instead for faster rebuilds..
6. Hit Create. We aren't done yet - Proxmox can't use it yet. We need datasets!

#### Special ZFS Configuration
1. Open a shell on the host.
2. Set your dataset for the ZVOL for VM/Containers. Sparse/thin provision it!
```bash
zfs create -o compression=lz4 -o atime=off rpool/zfsgeneral
```
3. Set your size for a dataset. We KNOW we are allowing 6TB once again, and there's not 12TB worth of disk capacity here. It can overprovision and well, just don't use all the storage.
This WILL use some memory since dedup is on.
```bash
zfs create -o compression=lz4 \
           -o dedup=on \
           -o quota=6T \
           -o reservation=0 \
           rpool/storageds
```
4. Back in Proxmox WebUI... `Datacenter`, *Storage*, we are going to *Add> Directory* this time.
```
Set ID to storageds, directory /rpool/storageds, and select content to be everything except VM and Container.
Backup Retention - I used 7 days.
```
5. Now add a directory again...
```
Set ID to storageds, directory /rpool/zfsgeneral, and select content to be only VM and Container.
Backup Retention - I used 7 days.
```

## Configuration
### Time Zone
1. Under `Datacenter> servername`, expand *system* and click on *time*. Set the time zone here.

### Users
1. Under `Datacenter> Users` we need to create a new login account The root account will be used only as a break glass account.
2. Setup TFA.

### Mailserver or Gateway?
