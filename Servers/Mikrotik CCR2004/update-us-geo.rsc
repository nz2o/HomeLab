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

# Read file contents
:local content [/file get us.zone contents]

# Load into temp list
:local count 0

:foreach line in=[:toarray $content] do={
    :if ([:len $line] > 6) do={
        /ip firewall address-list add list=$tmpList address=$line timeout=$ttl
        :set count ($count + 1)
    }
}

:log info ("Temp list loaded: " . $count . " entries")

# Safety check (prevents lockout)
:if ($count < 1000) do={
    :log error "Geo update FAILED — too few entries"
    /file remove us.zone
    :return
}

# Remove old list
/ip firewall address-list remove [find list=$finalList]

# Move temp → final
:foreach i in=[/ip firewall address-list find list=$tmpList] do={
    /ip firewall address-list set $i list=$finalList
}

# Cleanup
/file remove us.zone

:log info "US geo update complete (RAM-only)"
