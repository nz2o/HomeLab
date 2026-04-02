# Config
:local url "https://www.ipdeny.com/ipblocks/data/countries/us.zone"
:local tmpList "US-TMP"
:local finalList "US-ALLOW"
:local ttl "7d"

:log info "Starting US geo update..."

# Cleanup temp list
/ip firewall address-list remove [find list=$tmpList]

# Download file
/tool fetch url=$url dst-path=us.zone mode=https
:delay 2

# Read entire file (safe size for this list)
:local content [/file get us.zone contents]

:local start 0
:local end 0

:while (true) do={
    :set end [:find $content "\n" $start]

    :if ($end = -1) do={
        :set end [:len $content]
    }

    :local line [:pick $content $start $end]

    # Basic sanity check (avoids blank lines)
    :if ([:len $line] > 6) do={
        /ip firewall address-list add list=$tmpList address=$line timeout=$ttl
    }

    :set start ($end + 1)

    :if ($start >= [:len $content]) do={
        :break
    }
}

:log info "Loaded US list into temp"

# Remove old list
/ip firewall address-list remove [find list=$finalList]

# Move entries to final list
:foreach i in=[/ip firewall address-list find list=$tmpList] do={
    /ip firewall address-list set $i list=$finalList
}

# Cleanup
/file remove us.zone

:log info "US geo update complete (RAM-only, 7d TTL)"
