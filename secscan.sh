#!/bin/bash  
#
# Used for simple analyzis of security of
# applications when running them locally while developing.
# Both self-made software and other software. 
#

if [ -z "$1" ]
    then
     portNumber='8080'    # Default port
    else
      portNumber=$1;      # Your own specified portnumber
fi

echo "Scanning application at port: $portNumber"

nmap --script exploit,vuln -p $portNumber 127.0.0.1
