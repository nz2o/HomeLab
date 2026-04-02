# Config
:local url "https://www.ipdeny.com/ipblocks/data/countries/us.zone"
:local tmpList "US-TMP"
:local finalList "US-ALLOW"
:local ttl "7d"

# Remove old temp list
/ip firewall address-list remove [find list=$tmpList]

# Download file (temporary)
/tool fetch url=$url dst-path=us.zone mode=https
:delay 2

# File processing
:local fileName "us.zone"
:local fileSize [/file get $fileName size]
:local offset 0
:local chunkSize 4096

:while ($offset < $fileSize) do={
    :local chunk [/file read file=$fileName offset=$offset chunk-size=$chunkSize]
    :set offset ($offset + $chunkSize)

    :foreach line in=[:toarray $chunk] do={
        :if ([:len $line] > 6) do={
            /ip firewall address-list add list=$tmpList address=$line timeout=$ttl
        }
    }
}

:log info "Swapping US geo lists..."

# Remove old list (important: clears stale entries)
/ip firewall address-list remove [find list=$finalList]

# Move temp → final
:foreach i in=[/ip firewall address-list find list=$tmpList] do={
    /ip firewall address-list set $i list=$finalList
}

# Cleanup file
/file remove $fileName

:log info "US geo list update complete (RAM-only, 7d TTL)."
