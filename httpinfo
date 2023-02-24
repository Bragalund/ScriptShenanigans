#!/bin/bash

#
# Example:
# 
# $ httpinfo "https://www.nrk.no"
#

# Shows time used for http-request/response
#
# Used for figuring out if i should consider a cache
# in my application.
#
# Needed dependencies:  
# 1. curl
#

curl -w @- -o /dev/null -s "$@" <<'EOF'
    time_namelookup:  %{time_namelookup}\n
       time_connect:  %{time_connect}\n
    time_appconnect:  %{time_appconnect}\n
   time_pretransfer:  %{time_pretransfer}\n
      time_redirect:  %{time_redirect}\n
 time_starttransfer:  %{time_starttransfer}\n
                    ----------\n
         time_total:  %{time_total}\n
EOF


# Prints size of payload in Byte  
# 
# Used for figuring out if i need a cache in my application.
#
# Needed dependencies:
# 1. curl
#

curl -so /dev/null $1 -w '%{size_download}'

